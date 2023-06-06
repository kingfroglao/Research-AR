# Social Proxemics ---  Port to AR
Virtual environments are digital spaces where users interact with one another and their surroundings, often using avatars or other digital representations. These environments can be found in various forms, such as games, virtual reality platforms, augmented reality, mobile devices, and virtual meetings. Human behavior in virtual environments can be both similar to and different from behavior in physical spaces, depending on various factors like the level of immersion and the nature of the interaction.

## Researcher Information ##
**Role**: _Port to AR_

**Name**: _Xuanzhen Lao_

**Email**: _xzlao@ucdavis.edu_

## Begin ##
### AR Foundation & Unity set up for iOS: 

#### Unity set up:

Go to `Windows >> Package Manager` download and Import the packages first.
- XR Plugin Mangement
- AR Foundation
- Apple ARKit XR Plugin 
- Google ARCore XR Plugin

#### Build Setting:

Go to `File >> Build Settings...` set up Scene in build and platfrom.
- Scene in Build: Click `Add Open Scene` and check `Scenes/ScaleController`. This scene is the final test scene.
- Choose iOS platform.

### Model Prepare:
Cat Model: Download from Unity Store.

Woman Model: Provided by model team.

## Build Description and Testing##

### Version 1.0 (Quad Test)

Proceed by configuring all necessary settings for initiating the development of augmented reality. Once set up, proceed to construct a virtual cube suspended in space. Following this, engage with the interface to manipulate and position the cube according to the desired specifications. This initial model serves as a fundamental step in understanding the dynamics of creating and manipulating objects in an augmented reality environment.

Here is the screen shot of the version 1.0:

<img width="128" height="276" src="image and screen recording/quad.jpeg"/>

GIF display:

<img width="128" height="276" src="image and screen recording/quad.GIF"/>




### Version 2.0 (Cat Model)

For the purpose of this experiment, I downloaded a cat model from the Unity Store. Subsequently, I developed a script capable of detecting planes with white prefabs and red edges, irrespective of their orientation - horizontal or vertical. Upon the user's interaction with the plane via a click, the cat model is prompted to appear. Simultaneously, the script allows users to modify the cat's position by enabling its movement.

Screen Shot Display：

<img width="128" height="276" src="image and screen recording/cat.PNG"/>

GIF Display：

<img width="128" height="276" src="image and screen recording/cat.GIF"/>

### Version 3.0 (Import Woman Model and Cat model)

In the third test, the female character provided by the model group was imported. Upon tapping the screen for the first time, the character materializes. A slider is conveniently located at the bottom of the screen, allowing adjustment of the character's rotation and scale. Furthermore, the character's position on the screen can be seamlessly adjusted to suit the user's preference.

First, a target will show up. User can use the target to identify the plane and tap the screen to place the model：

<img width="128" height="276" src="image and screen recording/target.PNG"/>


User can use first slider to rotate the character:

<img width="128" height="276" src="image and screen recording/rotation.GIF"/>


User can use second slider to change the scale of the character:

<img width="128" height="276" src="image and screen recording/scale.GIF"/>


User can freely move the character: 

<img width="128" height="276" src="image and screen recording/move.GIF"/>


Wave animation was added:

<img width="128" height="276" src="image and screen recording/wave.GIF"/>

## Reference ##

[AR Foundation & Unity 02: Setup for iOS](https://youtu.be/eu_eG0eTFlA)

[Beginners guide to UNITY AR Foundation (ARKit & ARCore) - Build your first AR app from scratch!](https://youtu.be/KqzlGApWPEA)

[Unity AR Foundation Tutorial - Plane Detection](https://youtu.be/uWWiYfPTUtU)

[Unity AR Foundation Tutorial - Tap to Place Objects in AR](https://youtu.be/xguiSueY1Lw)

[Use touch to scale, rotate and drag AR objects | UNITY AR Foundation (ARKit & ARCore) | LeanTween](https://youtu.be/jgQVUttENTI)
