//
//  HomeView.swift
//  Soap
//
//  Created by Trevin Wisaksana on 25/03/20.
//  Copyright © 2020 Trevin Wisaksana. All rights reserved.
//

import UIKit

final class HomeView: XibView {
    
    // MARK: -
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: -
    
    private let headerHeight: CGFloat = 60.0
    
    // MARK: - 
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setup()
    }
    
    private func setup() {
        let headerNib = UINib(nibName: "HeaderTableViewCell", bundle: .main)
        tableView.register(headerNib, forCellReuseIdentifier: "HeaderTableViewCell")
        
        let counterNib = UINib(nibName: "CounterTableViewCell", bundle: .main)
        tableView.register(counterNib, forCellReuseIdentifier: "CounterTableViewCell")
    }
    
}

// MARK: - UITableViewDataSource

extension HomeView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderTableViewCell", for: indexPath)
            return cell
            
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "CounterTableViewCell", for: indexPath)
            return cell
            
        default:
            return UITableViewCell()
        }
    }
}

// MARK: - UITableViewDelegate

extension HomeView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return headerHeight
            
        case 1:
            return frame.height - headerHeight
            
        default:
            return .zero
        }
    }
}
