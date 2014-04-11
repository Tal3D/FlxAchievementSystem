package 
{
	import org.flixel.*;
	import org.flixel.plugin.chameneon.*;
	
	/**
	 * ...
	 * @author Tal
	 */
	public class Main extends FlxGame
	{
		//Static instance of FlxAchievementSystem.
		public static var achievementSystem:FlxAchievementSystem;
		
		//Array of achievements.
		private var achievements:Array = [
			new FlxAchievement("Achievement", "My first achievement!"),
			new FlxAchievement("Another Achievement", "Just another achievement"),
			new FlxAchievement("Spaaace", "Press the space bar.")
		]
		
		public function Main()
		{
			super(400, 300, Example, 2, 60, 60, true);
			forceDebugger = true;
			//Set up the FlxAchievementSystem. Setting debug to true will disable the save/load behaviour.
			achievementSystem = new FlxAchievementSystem("my_achievements", achievements, true);
			//Add it to the plugins -> update() and draw() will be called.
			FlxG.addPlugin(achievementSystem);
		}
		
	}
	
}