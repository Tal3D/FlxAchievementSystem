![FlxAchievementSystem](https://raw.githubusercontent.com/Tal3D/FlxAchievementSystem/master/res/flxachievementsystem.png)

The FlxAchievementSystem is a class built on Flixel that handles global achievements for individual games.
It utilizes flash's shared object (or FlxSave) to save achievement progress.


##Quick Start

The FlxAchievementSystem is built out of 3 classes:
- FlxAchievementSystem: The core class with all the important functions.
- FlxAchievement: A simple class that stores individual achievement info like name, description, icon and state of progress (locked/unlocked).
- FlxAchievementNotifier: A visual overlay that pops-up everytime you unlock an achievement.

```actionscript
import org.flixel.plugin.chameneon.*;
```

Everything you need to be good to go is a static instance of FlxAchievementSystem (it should be static so you can unlock achievements from anywhere in your project).

###Set-Up

#####1. Declare a static instance of FlxAchievementSystem (do this in your FlxGame class):
```actionscript
public static var achievementSystem:FlxAchievementSystem;
```

#####2. Declare an array of achievements (all your achievements should go in here as adding them later would cause the savefile to corrupt):
```actionscript
private var achievements:Array =
[	
    new FlxAchievement("My first achievement", "Description"),
    new FlxAchievement("My second achievement", "Description")
]
```

#####3. In the constructor of your FlxGame class instantiate the FlxAchievementSystem:
```actionscript
achievementSystem = new FlxAchievementSystem("name of save", achievements);
```

#####4. Last add the FlxAchievementSystem to the Flixel plugins (also in the FlxGame's constructor):
```actionscript
FlxG.addPlugin(achievementSystem);
```

###Unlocking Achievements

To unlock achievements simply call the unlock() function.

###Erasing Progress

To erase the progress on the savefile call erase().

##Contributing
I highly encourage you to contribute to this project as I would love to improve it.
