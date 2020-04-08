<br/>

<p align="left">
  <img src="https://github.com/trevinwisaksana/Soap/blob/master/Assets/title.jpg" width="200">
</p>

<p align="center">
  <img src="https://github.com/trevinwisaksana/Soap/blob/master/Assets/banner.jpg">
</p>

<h3 align="center">
  Get smart reminders to wash your hands.
</h3>

<p align="center">
  In the light of the current pandemic, washing your hands could be a matter of life and death. Soap helps remind you to do this. Using machine learning it can keep track of when you have washed your hands and give you smart reminders.
<p/>

<br/>

<h3 align="center">
  Here's a demo of it in action.
</h3>

<div align="center">
  <a href="https://youtu.be/WJU9lbqQhGQg"><img src="https://github.com/trevinwisaksana/Soap/blob/master/Assets/thumbnail.jpg" width="500" alt="Demo"></a>
</div>

<br/>

## Background

#### Why did you pick this particular organization, institution or individual?

Although the Soap app can be used by anyone with an Apple Watch, I am dedicating this app to help my parents because they seem to underestimate this pandemic. The goal is to get my parents to create a habit of washing their hands frequently. But from a design thinking point of view, I chose them because I can contact them frequently to validate/invalidate my assumptions. Under social distancing conditions today, it is impossible to go around town to do user interviews.

#### How did you identify the problem to solve and why did you pick this problem over others?

I identified this problem by observing my parent's denial over the lethality of COVID-19. I noticed that as the Indonesian government initially stated that there were zero number of people that were infected; my parents began to make false assumptions that they were safe because the hot weather would have killed the virus. That is why I chose to urgently find a way to mitigate the possibility of being infected over solving others because of its relevance and importance in the ongoing pandemic.

#### Describe your approach. How did you come up with it? Is it the best possible solution? Why?

Before I began ideating, I made three requirements that my solution should have. Firstly, since my parents are not tech savvy, the solution should be easy to use. Secondly, to be worthy of being used it should effective towards solving its problem. Lastly, it must attainable within three weeks. With these parameters I started brainstorming.

After doing some research I found that according to the World Health Organization (WHO), one of the simplest and most effective ways to reduce the chance of getting infected is to frequently wash our hands. However, my parents and I currently do not have a habit of doing it. So I began focusing on how to make this become one. 

My initial idea was to simply create an app that helps remind my parents to wash their hands. But this would not differentiate itself from a reminders app. Moreover, its notification might get buried by other notifications. But then I noticed that both my parents own an Apple Watch. So I looked at the possiblity of using it to make a smart way to notify them to wash their hands. This was when I came up with the idea to detect a hand washing motion using the Apple Watch. The goal is to remind someone who has not washed their hands for sometime and if they have done it, make them feel rewarded. This solution can be used seamlessly day-to-day as it requires no manual user interaction and it's on the right track to be influential towards creating a habit of getting people to wash their hands.

As a concept, Soap is one of the most user-friendly ways for smartwatch users to create a habit of washing their hands. Other alternatives available today require you to use your phone camera while you wash your hands which is unnatural. Soap simply requires your to wear your watch. But on the technical side, the app's accuracy to detect a hand washing gesture still needs to be improved. Making it run efficiently without draining the battery is also a challenge. Certainly, its current iteration's reliance on the Apple Watch also limits the people who can use it. But when its machine learning model is improved and its codebase is applied to other smartwatches, it remains to be one of the most natural ways for people to create a habit of washing their hands.


#### Describe your previous skillset. Did you learn anything new in the past three weeks? 

I have been an iOS Developer for over two years but I have never made an app for the Apple Watch nor trained a machine learning model. But in the past three weeks I did just that; I was able to get an Apple Watch to recognize when I am washing my hands. To do this, I had to learn how to properly collect sensor data from the Apple Watch, process it to train a machine learning model and implement it on the watch. Although my machine learning model is not very accurate, I am very satisfied to know that I am capable of making this proof-of-concept.

<br/>

<em> Note: Soap is currently still under development. It is still unstable under a production environment. I recommend that this version of the app should be run using a debugger to remove any limitations set by the WatchOS such as throttling background tasks. <em/>
