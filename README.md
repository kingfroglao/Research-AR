# Social Proxemics ---  Port to AR
Virtual environments are digital spaces where users interact with one another and their surroundings, often using avatars or other digital representations. These environments can be found in various forms, such as games, virtual reality platforms, augmented reality, mobile devices, and virtual meetings. Human behavior in virtual environments can be similar to and different from behavior in physical spaces, depending on various factors like the level of immersion and the nature of the interaction.

## Researcher Information ##
**Role**: _Port to AR_

**Name**: _Xuanzhen Lao_

**Email**: _xzlao@ucdavis.edu_

## Begin ##

### AR Foundation & Unity set up for iOS: 
#### Unity Version: 2022.2.19
#### Mobile OS: iOS
#### Unity set up:

Go to `Windows >> Package Manager` to download and Import the packages first.
- XR Plugin Mangement
- AR Foundation
- Apple ARKit XR Plugin 
- Google ARCore XR Plugin

#### Build Setting:

Go to `File >> Build Settings...` and set up Scene in Build and Platform.
- Scene in Build: Click `Add Open Scene` and check `Scenes/ScaleController.` This scene is the final test scene.
- Choose the iOS platform.

### Model Prepare:
Cat Model: Download from Unity Store.

Woman Model: Provided by the model team.


## Build Description ##
Testing Environment: The living room of my apartment.

### Version 1.0 (Quad Test)
#### Completion Date: 5/15
#### Goal: 
- Grasp the fundamentals of augmented reality (AR)-related operations within Unity.
- Acquire knowledge on utilizing Xcode to interface with an iPhone in developer mode.
- Learn the techniques to modify prefabs within Unity.

Begin by configuring all necessary settings in Unity to initiate augmented reality development. This involves steps such as importing the necessary packages and setting up the build configurations. Once the initial setup is complete, proceed to create an `AR Camera` along with the relevant scripts. After completing the basic setup, you can proceed to construct a virtual cube in the virtual space. Utilize the interface to manipulate and position the cube as per the desired specifications. This introductory model marks a fundamental step towards understanding the dynamics of creating and manipulating objects within augmented reality environments.

Here is the screenshot of version 1.0:

<img width="128" height="276" src="image and screen recording/quad.jpeg"/>

GIF display:

<img width="128" height="276" src="image and screen recording/quad.GIF"/>




### Version 2.0 (Cat Model)

#### Completion Date: 5/22
#### Goal: 
- Learn how to import and implement 3D models from the Unity Store into your projects.
- Develop and understand scripts that can detect planes with specific characteristics
- Create a user interaction system where the model appears when the user interacts with the detected plane.
- Enables users to modify the position of models in virtual space, further enhancing user interactivity in AR environments.

A cat model downloaded from the Unity Store was used for this build. We learned to develop a script that is able to detect planes with white prefabs and red edges no matter their orientation is horizontal or vertical. When the user interacts with the screen by tapping, the cat model is prompted to appear. At the same time, the script allows the user to modify the cat's position by enabling movement.

Screen Shot Display：

<img width="128" height="276" src="image and screen recording/cat.PNG"/>

GIF Display：

<img width="128" height="276" src="image and screen recording/cat.GIF"/>

### Version 3.0 (Import Woman Model and Cat model)
#### Completion Date: 6/3
#### Goal: 
- Examine how users interact with the app, especially how they animate characters and use sliders to adjust their rotation and scale.
- Evaluate how easily the user can manipulate the on-screen position of the character to their liking.
- Learn about the overall user experience, including the convenience and intuitiveness of controls, and how to enhance these factors.
- Determines how the app responds when the screen is tapped.

In the third test, the female character provided by the model group was imported. Upon tapping the screen for the first time, the character materializes. A slider is conveniently located at the bottom of the screen, allowing adjustment of the character's rotation and scale. Furthermore, the character's position on the screen can be seamlessly adjusted to suit the user's preference.

First, a target will show up. Users can use the target to identify the plane and tap the screen to place the model：

<img width="128" height="276" src="image and screen recording/target.PNG"/>


Users can use the first slider to rotate the character:

<img width="128" height="276" src="image and screen recording/rotation.GIF"/>


Users can use a second slider to change the scale of the character:

<img width="128" height="276" src="image and screen recording/scale.GIF"/>


Users can freely move the character: 

<img width="128" height="276" src="image and screen recording/move.GIF"/>


Wave animation was added:

<img width="128" height="276" src="image and screen recording/wave.GIF"/>

## Testing by Xcode ##
We will build and run the application on a real device to test it. First, connect the iPhone and Mac using a cable. For final testing, follow the steps below：
- Download Xcode on Mac.
- Enable Developer Mode on iPhone.
- Run the project.

### Download Xcode ###
In this project, we use Xcode to help us test the AR simulator. Xcode is essential for developing apps for Apple's platforms.

Download Xcode from: [Link](https://developer.apple.com/xcode/resources/)


### Set up for Developer Mode in iPhone ###
 Enabling developer mode on iPhone allows developers to access additional settings and features that are not typically accessible to average users. Once the mode is enabled, the developer can release the Unity project on the iPhone and test the result.

How to enable the developer mode: [Link](https://developer.apple.com/documentation/xcode/enabling-developer-mode-on-a-device)


### Run the Project ###


Find the file `Build >> Unity-iPhone.xcodeproj` and open it with Xcode. Click the Run button in the toolbar or choose `Product >> Run` to build and run the app on the selected simulated or real device. View the status of the build in the activity area of the toolbar.

More Information on how to run the project: [Link](https://developer.apple.com/documentation/xcode/running-your-app-in-simulator-or-on-a-device)

Then, waiting for the Mac to launch iPhone. 

Otherwise, follow this [video](https://youtu.be/eu_eG0eTFlA) to learn the entire process (from unity setting up to testing on iPhone).


## Following Work ##

For future research and enhancement, we require a broader range of models to generate diverse research findings and data for the project. We plan to incorporate several new functionalities in our subsequent work.

- Switch to different character models: Switching to different character models is essential for game development, animation, or any kind of simulation work. Different character models can provide a variety of appearances and abilities, making a game or simulation more engaging and realistic.

    Here is a reference [video](https://youtu.be/0SuzwJfqgBY).

- Controller for the model: We suppose to control model's movement by using joystick. In this way, user can keep track model's state and also it will be much convenience to change the position of the model. Under this implement, we will import `Walking` animation of the model.  Here is a reference [video](https://youtu.be/ETpVYQBWL38).
(This part is what I did, but I haven't been successful yet.)

The charactor model resource will provide by _Virtual-Model-Team_.   

## Reference ##

[AR Foundation & Unity 02: Setup for iOS](https://youtu.be/eu_eG0eTFlA)

[Beginners guide to UNITY AR Foundation (ARKit & ARCore) - Build your first AR app from scratch!](https://youtu.be/KqzlGApWPEA)

[Unity AR Foundation Tutorial - Plane Detection](https://youtu.be/uWWiYfPTUtU)

[Unity AR Foundation Tutorial - Tap to Place Objects in AR](https://youtu.be/xguiSueY1Lw)

[Use touch to scale, rotate and drag AR objects | UNITY AR Foundation (ARKit & ARCore) | LeanTween](https://youtu.be/jgQVUttENTI)
