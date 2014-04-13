package	org.flixel.plugin.chameneon
{	
	/**
	 * Simple class that stores individual achievement info.
	 * @author Tal
	 */
	public class FlxAchievement 
	{
		public var name:String;
		public var description:String;
		public var icon:Class;
		public var secret:Boolean;
		public var unlocked:Boolean = false;
		
		/**
		 * Create a new achievement. 
		 * @param	name	The name of the achievement.
		 * @param	description	The desciprtion of the achievement.
		 * @param	icon	The icon of the achievement.
		 * @param	secret	Whether the achievement is a secret achievement or not (useful for when you want to hide info).
		 */
		public function FlxAchievement(name:String = "Achievement", description:String = "Description", icon:Class = null, secret:Boolean = false)
		{
			this.name = name;
			this.description = description;
			this.icon = icon;
			this.secret = secret;
		}
		
		/**
		 * Override this to create your own update behaviour.
		 */
		public function update():void
		{
			
		}
		
	}

}