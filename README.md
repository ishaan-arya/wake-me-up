## Inspiration

Oftentimes, we used to have late nights. While we'd set an alarm for the next morning, we'd never be able to wake up as we wanted to sleep more. This had dire consequences; it made us miss a few classes at school, and disrupted our sleep schedules. Waking up late also made some of us more groggy, and grumpy throughout the day! Considering our experience with waking up late and sleep schedules, we asked other students and they had the same problems. They, as well as our team wanted a solution that could get our lazy selves out of bed.

## What it does

"Wake me up" is an alarm application that utilizes QR Code technology to get lazy people, like us, out of bed every morning. The process  is simple yet revolutionary: the user downloads the application, creates his/her profile, and creates his/her alarm. Furthermore, the user will have to print the QR Code given by the application and stick it to the wall in their bathroom. Now here’s the catch! Once you set your alarm, and it rings, it won’t stop ringing, until you scan the QR code in the bathroom, forcing you to get out of bed. 


## How we built it

"Wake me Up" was built using Flutter, Dart, and QR Code technology. We structured our app into the folders of screens, widgets, utils, and models. The screens contained individual folders which contained all of our code for individual screens, the widgets contained repeated or lengthy elements, which we could easily call from our screens. The utils contained the utilities, which in our case, was just our constants file, and finally, the model contained our custom classes for certain functionalities. This unique design pattern offered a lot of flexibility and organized our code to make it less like spaghetti, allowing us to collaborate effectively. We also used various packages in order to add additional functionality to our app. We used the local notifications, QR scanner, and shared preferences packages, which made our coding process easy and added a layer of abstraction.


## Challenges we ran into
We encounter numerous difficulties while creating the application. Flutter is known to have minimal support when running background tasks, and since our app was that of an alarm, this was highly important. However, we were soon able to figure out how to work around that but encountered another problem. We had issues with playing the audio in the alarm application, and we had to test out various different packages and libraries.

We also encountered various issues with flutter null safety. In the middle of our coding process, we had to migrate our entire codebase to null safety to make certain packages available and avoid bugs. However, the analog clock package we used, along with all the other alarm clock packages available, was not null safe. Due to this, we had to construct the analog clock manually using canvas painting and mathematical formulae, which was a challenging task.


## Accomplishments that we're proud of

- Hasnain: Learning background programming with dart and Partially utilising it within the application. Building the notification and QR code system which I can utilize elsewhere as well.

- Ishaan: I am proud of being able to create the UI of our app with close similarity to the design we created, in a short amount of time. I could also work effectively with GitHub, creating the repository and managing all the branches, which I am proud of. I am also glad that I could work with null safety in Dart, which I was completely new to.

- Abhay: Considering that I was a beginner in Flutter and Dart, I'm proud that I was able to code the UI of some pages and understand the functioning of others. I now am much better at using different widgets to create an aesthetically appealing screen. I also am proud of learning Figma, as well as GitHub, branches, and cloning.


## What we learned
We also expanded our knowledge on a lot of the background tasks and processes that are required to run an application, and how they are carried out across various languages, especially dart and flutter. In dart, background tasks are carried out through isolates and they can do anything that dart can do, but they cannot play sound, however, we learnt that the hard way...

We also learnt a whole lot about android programming using flutter and dart. We not only used them in our project but also learnt new concepts such as the recently migrated null-safety version of dart. Having to convert our entire project into being null-safe, we faced multiple challenges, however, we also learnt throughout the process and now are more comfortable with the migration.

We learned a variety of things from developing this application and participating in the hackathon. We learned how to use Figma and design our application on the software to end up with the effective UI we have now. Two of the team members, Hasnain and Abhay, were completely new to github and faced a few challenges trying to understand, use and collaborate with the application. With the help of the third team member Ishaan, we all were able to understand and collaborate through the application, making it much easier for us and without which this project wouldn't have been possible.


## What's next for Wake Me Up
We believe that "Wake Me Up" is a unique, and revolutionary application. Hence, we want to continue to develop the application and hopefully release it into app stores for users to download. In doing so, we hope the will make the world a happier and more productive place.

## Images of Application


<table>
  <tr>
    <td>Main Alarms Screen</td>
     <td>QR Code Screen</td>
    <td>Profile Screen</td>
  </tr>
  <tr>
    <td><img src="https://user-images.githubusercontent.com/66945981/127812542-da59d1a7-9957-4371-8593-3acdf2693a10.jpeg" width=270 height=590></td>
    <td><img src="https://user-images.githubusercontent.com/66945981/127812630-d404cdb0-178e-4b0f-b994-126de8eea106.jpeg" width=270 height=590></td>
    <td><img src="https://user-images.githubusercontent.com/66945981/127812678-0c481c33-c36e-4bed-af67-ccc9856988a7.jpeg" width=270 height=590></td>
  </tr>

 </table>

<table>
  <tr>
    <td>Setting a day alarm</td>
     <td>Setting a night alarm</td>
    <td>After the QR code is scanned</td>
  </tr>
  <tr>
    <td><img src="https://user-images.githubusercontent.com/66540789/127780714-182789a2-cf08-4b89-b731-99fb49292613.png" width=270 height=590></td>
    <td><img src="https://user-images.githubusercontent.com/66540789/127780720-5d354874-a4c3-4174-be33-0103ad989784.png" width=270 height=590></td>
    <td><img src="https://user-images.githubusercontent.com/66945981/127812008-21181411-a06a-4f6c-b8c6-6a0732cd8278.png" width=270 height=590></td>
  </tr>
 </table>







