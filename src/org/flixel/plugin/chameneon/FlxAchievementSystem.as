package	org.flixel.plugin.chameneon
{
	import org.flixel.*;
	
	/**
	 * Class to handle achievements globally.
	 * Add new achievements by passing them (new FlxAchievement()) in the constructor and unlock them using unlock().
	 * @author Tal
	 */
	public class FlxAchievementSystem extends FlxBasic
	{
		/**
		 * The visual overlay for when you unlock an achievement.
		 */
		private var notifier:FlxAchievementNotifier;
		
		/**
		 * The save file for the achievements.
		 */
		private var achieved:FlxSave;		
		
		/**
		 * The achievements list. All achievements will be stored in this variable.
		 */
		private var achievements:Array = new Array();
		
		/**
		 * Whether the FlxAchievementSystem is in debug mode
		 */
		private var debug:Boolean;
		
		/**
		 * Callback for when you unlock achievements.
		 */
		public var onUnlock:Function = new Function();
		
		/**
		 * Create a new FlxAchievementSystem.
		 * @param	saveName	The name of the save.
		 * @param	achievements	An array of achievements. All of your games achievements should be passed here as you shouldn´t add them afterwards (causes issues with the save system).
		 * @param	debug	Whether achievement progress should be loaded.
		 */
		public function FlxAchievementSystem(saveName:String, achievements:Array, debug:Boolean = false)
		{
			notifier = new FlxAchievementNotifier();
			achieved = new FlxSave();
			achieved.bind(saveName);
			create(achievements);
			if (!debug)
			{
				loadAchievements();
			}
			this.debug = debug;
		}
		
		/**
		 * Read the current state of all achievements.
		 */
		public function get achievementList():Array
		{
			return achievements;
		}
		
		/**
		 * Fill up the achievements array with achievements!
		 * @param achievements	The achievements array which you want to add.
		 */
		private function create(achievements:Array):void
		{
			for each(var achievement:FlxAchievement in achievements)
			{
				add(achievement);
			}
		}
		
		/**
		 * Loads the saved achievements into the current session and checks for differences between the saved achievements and the local ones.
		 */
		private function loadAchievements():void
		{
			if (achieved.data.achievements == null)
			{
				achieved.data.achievements = achievements;
			}
			
			//Check if the saved and the local achievement list have the same layout.
			var wrong:Boolean = false;
			
			//They cant have the same layout when they have different amounts of achievements.
			if (!(achievements.length == achieved.data.achievements.length))
			{
				wrong = true;
			}
			
			//They cant have the same layout when the corresponding achievements have different names.
			else
			{
				for (var j:int; j < achievements.length; j++)
				{
					if (!(achievements[j].name == achieved.data.achievements[j].name))
					{
						wrong = true;
					}
				}
			}
			
			if (wrong)
			{
				achieved.data.achievements = achievements;
			}
			
			//Copy the saved progress over.
			for (var k:int; k < achievements.length; k++)
			{
				achievements[k].unlocked = achieved.data.achievements[k].unlocked;
			}
			
		}
		
		/**
		 * Adds a new achievement to the achievements list. It will only get added when there is no other achievement with the same name in there yet.
		 * @param	achievement	The achievement you want to add.
		 */
		private function add(achievement:FlxAchievement):void
		{
			var duplicate:Boolean = false;
			
			for (var j:int; j < achievements.length; j++)
			{
				if (achievements[j].name == achievement.name)
				{
					duplicate = true;
				}
			}
			
			if (!duplicate)
			{
				achievements.push(achievement);
			}
		}
		
		/**
		 * Unlock an achievement.
		 * NOTE: You have to add it to the achievements array of the FlxAchievementsSystem first.
		 * @param	name	The name of the achievement which you want to unlock.
		 */
		public function unlock(name:String):void
		{
			for (var j:int; j < achievements.length; j++)
			{
				if (achievements[j].name == name && !achievements[j].unlocked)
				{
					achievements[j].unlocked = true;
					if (!debug)
					{
						achieved.data.achievements[j].unlocked = true;
					}
					FlxG.log("unlocked achievement '" + achievements[j].name + "'");
					notifier.start(achievements[j]);
					onUnlock(achievements[j]);
				}
			}
		}
		
		/**
		 * Erase local save.
		 */
		public function erase():void
		{
			achieved.erase();
		}
		
		/**
		 * Update the notifier.
		 */
		override public function update():void
		{
			if (notifier.exists)
			{
				notifier.update();
			}
		}
		
		/**
		 * Draw the notifier.
		 */
		override public function draw():void
		{
			if (notifier.exists)
			{
				notifier.draw();
			}
		}
		
		/**
		 * Clean up memory.
		 */
		override public function destroy():void
		{
			super.destroy();
			notifier.destroy();
			achieved.destroy();
			notifier = null;
			achieved = null;
			achievements = null;
		}
		
	}

}