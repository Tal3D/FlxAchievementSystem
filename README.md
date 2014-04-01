FlxAchievementSystem
====================

The FlxAchievementSystem is a class built on Flixel that handles global achievements for individual games.
It utilizes flashs shared object (or FlxSave) to save achievement progress.


##Quick start

The FlxAchievementSystem is built out of 3 classes:
- FlxAchievementSystem: The core class with all the important functions.
- FlxAchievement: A simple class that stores individual achievement info like name, description, icon and state of progress (locked/unlocked).
- FlxAchievementNotifier: A visual overlay that pops-up everytime you unlock an achievement.

Everything you need to be good to go is a static instance of FlxAchievementSystem (it should be static so you can unlock achievements from anywhere in your project).

Declare a static instance of FlxAchievementSystem (do this in your FlxGame class):

```actionscript
public static var achievementSystem:FlxAchievementSystem;
```

Declare an array of achievements (all your achievements should go in here as adding them later would cause the savefile to corrupt):

```actionscript
private var achievements:Array =
[	
    new FlxAchievement("My first achievement", "Description"),
    new FlxAchievement("My second achievement", "Description")
]
```


In the constructor of your FlxGame class instantiate the FlxAchievementSystem:

```actionscript
achievementSystem = new FlxAchievementSystem("name of save", achievements);
```

Last add the FlxAchievementSystem to the Flixel plugins (also in the FlxGames' constructor):

```actionscript
FlxG.addPlugin(achievementSystem);
```

##Unlocking achievements

To unlock achievements simply call the unlock() function.


##Erasing progress

To erase the progress on the savefile call erase().


###Contributing
I highly encourage you to contribute to this project as I would love to improve it.


-----------------------------------------------------------------------------------
Copyright Chameneon.com

by Tal