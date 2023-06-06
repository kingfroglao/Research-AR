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

## Build and Description ##

### Version 1.0 (Quad Test)

Proceed by configuring all necessary settings for initiating the development of augmented reality. Once set up, proceed to construct a virtual cube suspended in space. Following this, engage with the interface to manipulate and position the cube according to the desired specifications. This initial model serves as a fundamental step in understanding the dynamics of creating and manipulating objects in an augmented reality environment.

Here is the screen shot of the version 1.0:

<img width="128" height="276" src="image and screen recording/quad.jpeg"/>

GIF display:

<img width="128" height="276" src="https://github.com/kingfroglao/Research-AR/assets/97926748/8dc8f7d8-9c7d-4edd-8118-90f656c9015b"/>




### Version 2.0 (Cat Model)

For the purpose of this experiment, I downloaded a cat model from the Unity Store. Subsequently, I developed a script capable of detecting planes with white prefabs and red edges, irrespective of their orientation - horizontal or vertical. Upon the user's interaction with the plane via a click, the cat model is prompted to appear. Simultaneously, the script allows users to modify the cat's position by enabling its movement.

Screen Shot Display：

<img width="128" height="276" src="https://github.com/kingfroglao/Research-AR/assets/97926748/b9ab3229-0bef-481f-a09c-c4b8f4cbe1cd"/>

GIF Display：

<img width="128" height="276" src="https://github.com/kingfroglao/Research-AR/assets/97926748/58054002-9b5e-4783-babb-74a4e9e87337"/>

### Version 3.0 (Import Woman Model and Cat model)

In the third test, the female character provided by the model group was imported. Upon tapping the screen for the first time, the character materializes. A slider is conveniently located at the bottom of the screen, allowing adjustment of the character's rotation and scale. Furthermore, the character's position on the screen can be seamlessly adjusted to suit the user's preference.

First, a target will show up. User can use the target to identify the plane and tap the screen to place the model：

<img width="128" height="276" src="https://github.com/kingfroglao/Research-AR/assets/97926748/1b3889e9-dc87-46ad-b9d3-dc0006245c16"/>


User can use first slider to rotate the character:

<img width="128" height="276" src="https://github.com/kingfroglao/Research-AR/assets/97926748/78a78d32-8133-4544-884e-b09bbf2703ec"/>


User can use second slider to change the scale of the character:

<img width="128" height="276" src="https://github.com/kingfroglao/Research-AR/assets/97926748/5443815e-bea6-4325-a028-f5da8b51ac9e"/>


User can freely move the character: 

<img width="128" height="276" src="https://github.com/kingfroglao/Research-AR/assets/97926748/615510b9-9eab-4008-a8c1-a47cd5f1a463"/>


Wave animation was added:

<img width="128" height="276" src="https://github.com/kingfroglao/Research-AR/assets/97926748/89a3e4cc-1efb-464a-9bc9-fb280702874f"/>


## Package
Because the file is too large, it cannot be uploaded to github (I didn't understand GitHub LFS) and is again available as a Google Doc share.

Version 2.0: [ARTestCat](https://drive.google.com/drive/folders/1q4oQAH8CHcq67hdLs_2eFwmYbzRI20vf?usp=drive_link)

Version 3.0: [Woman and Cat](https://drive.google.com/drive/folders/1foAl5ttUMju5RamSq1TbMVEYXtEvV_My?usp=sharing)

## Testing ##




## Reference ##

[AR Foundation & Unity 02: Setup for iOS](https://youtu.be/eu_eG0eTFlA)

[Beginners guide to UNITY AR Foundation (ARKit & ARCore) - Build your first AR app from scratch!](https://youtu.be/KqzlGApWPEA)

[Unity AR Foundation Tutorial - Plane Detection](https://youtu.be/uWWiYfPTUtU)

[Unity AR Foundation Tutorial - Tap to Place Objects in AR](https://youtu.be/xguiSueY1Lw)

[Use touch to scale, rotate and drag AR objects | UNITY AR Foundation (ARKit & ARCore) | LeanTween](https://youtu.be/jgQVUttENTI)
