/*
 Copyright (C) 2016 Apple Inc. All Rights Reserved.
 See LICENSE.txt for this sample’s licensing information
 
 Abstract:
 This class manages the CoreMotion interactions and
 provides a delegate to indicate changes in data.
 
 Update:
 This code has been modified to detect the motion of
 hand washing and notify the user upon having done so.
 */

import Foundation
import CoreMotion
import WatchKit
import CoreML
import os.log
import UserNotifications

/**
 `MotionManagerDelegate` exists to inform delegates of motion changes.
 These contexts can be used to enable application specific behavior.
 */
protocol MotionManagerDelegate: class {
    func didUpdateCounter(_ manager: MotionManager)
}

final class MotionManager {
    
    // MARK: Properties
    
    private let motionManager = CMMotionManager()
    private let queue = OperationQueue()
    
    // MARK: Application Specific Constants
    
    /// The app is using 50hz data and the buffer is going to hold 1s worth of data.
    private let sampleInterval = 1.0 / 50
    
    weak var delegate: MotionManagerDelegate?
    
    /// Keeps track of the hand washing state
    private var isWashingHands = false
    
    /// Timer is used a debouncer since the accuracy of the machine learning model is only 90%
    private var countdownTimer = 3
    private var timer: Timer?
    
    // MARK: Initialization
    
    init() {
        // Serial queue for sample handling and calculations.
        queue.maxConcurrentOperationCount = 1
        queue.qualityOfService = .userInteractive
        queue.name = "MotionManagerQueue"
    }
    
    // MARK: Motion Manager
    
    func startUpdates() {
        if !motionManager.isDeviceMotionAvailable {
            print("Device Motion is not available.")
            return
        }
        
        motionManager.deviceMotionUpdateInterval = sampleInterval
        motionManager.startDeviceMotionUpdates(to: queue) { (deviceMotion: CMDeviceMotion?, error: Error?) in
            if error != nil {
                print("Encountered error: \(error!)")
            }
            
            if let deviceMotion = deviceMotion {
                self.processDeviceMotion(deviceMotion)
            }
        }
    }
    
    func stopUpdates() {
        if motionManager.isDeviceMotionAvailable {
            motionManager.stopDeviceMotionUpdates()
        }
    }
    
    // MARK: Motion Processing
    
    private func processDeviceMotion(_ deviceMotion: CMDeviceMotion) {
        
        let accelerationX = deviceMotion.userAcceleration.x
        let accelerationY = deviceMotion.userAcceleration.y
        let accelerationZ = deviceMotion.userAcceleration.z
        
        let gyroX = deviceMotion.rotationRate.x
        let gyroY = deviceMotion.rotationRate.y
        let gyroZ = deviceMotion.rotationRate.z
        
        let currentWristPosition = WKInterfaceDevice.current().wristLocation
        let wristLocationValue: Double
        
        switch currentWristPosition {
        case .left:
            wristLocationValue = 0
        case .right:
            wristLocationValue = 1
        default:
            wristLocationValue = 0
        }
        
        let configuration = MLModelConfiguration()
        let model = try? HandWashing(configuration: configuration)
        
        let input = HandWashingInput(wrist: wristLocationValue,
                                     acceleration_x: accelerationX,
                                     acceleration_y: accelerationY,
                                     acceleration_z: accelerationZ,
                                     gyro_x: gyroX,
                                     gyro_y: gyroY,
                                     gyro_z: gyroZ)
        
        if let ouput = try? model?.prediction(input: input).activity, let isWashingHands = Bool(exactly: NSNumber(value: ouput)) {
            
            /// Update the state of washing hands
            self.isWashingHands = isWashingHands
            
            DispatchQueue.main.async {
                if self.timer == nil {
                    self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.notifyUser(_:)), userInfo: nil, repeats: true)
                }
            }
        }
    }
    
    @objc
    private func notifyUser(_ sender: Timer) {
        /// When the user initiates a hand washing motion,
        if countdownTimer > 0 && isWashingHands == true {
            /// Decrement the countdown timer to simulate a 5 second count down
            countdownTimer -= 1
        } else {
            /// When the user is detected to not be washing hands, reset the countdown timer
            countdownTimer = 5
        }
        
        /// Notify the user that the watch recognizes this person has wash their hands
        if countdownTimer == .zero {
            NotificationManager.shared.pushNotification()
            
            updateHandWashingCounter()
        }
    }
    
    // MARK: Data and Delegate Management
    
    private func updateHandWashingCounter() {
        delegate?.didUpdateCounter(self)
    }
}
