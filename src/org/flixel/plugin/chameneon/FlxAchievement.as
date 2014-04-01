package	org.flixel.plugin.chameneon
{
	import org.flixel.FlxSprite;
	
	/**
	 * Simple class that stores individual achievement info.
	 * @author Tal
	 */
	public class FlxAchievement 
	{
		public var name:String;
		public var description:String;
		public var icon:Class;
		public var unlocked:Boolean = false;
		
		/**
		 * Create a new achievement. 
		 * @param	name	The name of the achievement.
		 * @param	description	The desciprtion of the achievement.
		 * @param	icon	The icon of the achievement. (24x24 pixels)
		 */
		public function FlxAchievement(name:String = "Achievement", description:String = "Description", icon:Class = null)
		{
			this.name = name;
			this.description = description;
			this.icon = icon;
		}
		
	}

}