package  
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Tal
	 */
	public class Example extends FlxState
	{
		
		public function Example() 
		{
			
		}
		
		override public function create():void
		{
			FlxG.bgColor = 0xff333333;
		}
		
		override public function update():void
		{
			super.update();
			
			//Unlock an achievement
			Main.achievementSystem.unlock("Achievement");
			
			if (FlxG.keys.SPACE)
			{
				Main.achievementSystem.unlock("Spaaace");
			}
		}
		
	}

}