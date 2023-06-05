# Social Proxemics ----  Port to AR
Virtual environments are digital spaces where users interact with one another and their surroundings, often using avatars or other digital representations. These environments can be found in various forms, such as games, virtual reality platforms, augmented reality, mobile devices, and virtual meetings. Human behavior in virtual environments can be both similar to and different from behavior in physical spaces, depending on various factors like the level of immersion and the nature of the interaction.

## Researcher Information ##
- **Role**: _Port to AR_
- **Name**: _Xuanzhen Lao_
- **Email**: _xzlao@ucdavis.edu_

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

## Build ##

### Version 1.0 (Quad Test)

Complete all the relevant settings for getting started with augmented reality development, and then build a cube in the air.


### Version 2.0 (Cat Model)

For this test, I downloaded the cat model from the Unity Store. And built a script that can detect planes, whether horizontal or vertical. When the user clicks on the plane, the cat model will appear. At the same time, the user can change the position of the cat by moving it.

### Version 3.0 (Import Woman Model and Cat model)

In the third test, I imported the female character given by the model group. When you tap the screen for the first time, the character will appear. A slider is provided at the bottom of the screen to adjust the rotation and scaling of the character. And you can freely adjust the position of characters on the screen.

## Testing ##
## Package ##
## Reference ##
