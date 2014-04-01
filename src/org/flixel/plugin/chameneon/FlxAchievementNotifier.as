package org.flixel.plugin.chameneon  
{
	import org.flixel.*;
	
	/**
	 * Handles the visible part of the FlxAchievementSystem.
	 * @author Tal
	 */
	public class FlxAchievementNotifier
	{
		private var
		box:FlxSprite,
		title:FlxText,
		description:FlxText,
		icon:FlxSprite,
		animate:Boolean,
		animateTimer:int,
		speed:Number;
		
		/**
		 * Whether update() and draw() are called automatically.
		 */
		public var exists:Boolean;
		
		/**
		 * Create a new notifier.
		 */
		public function FlxAchievementNotifier() 
		{
			box = new FlxSprite().makeGraphic(200, 32, 0xAA000000);
			title = new FlxText(0, 0, 170);
			title.setFormat(null, 16);
			description = new FlxText(0, 0, 170);
			description.setFormat(null, 8, 0xAAffffff);
			icon = new FlxSprite();
			exists = false;
			animate = false;
			animateTimer = 0;
			speed = 0;
		}
		
		/**
		 * Starts the animation.
		 * @param	achievement	The achievement whose information will be displayed.
		 */
		public function start(achievement:FlxAchievement):void
		{
			title.text = achievement.name;
			description.text = achievement.description;
			icon.makeGraphic(24, 24);
			exists = true;
			animate = false;
			animateTimer = 0;
			speed = 0;
			box.alpha = 1;
			title.alpha = box.alpha;
			description.alpha = box.alpha;
			icon.alpha = box.alpha;
			box.x = FlxG.width / 2 - 100;
			box.y = 40;
			title.x = box.x + 30;
			title.y = box.y;
			description.x = box.x + 30;
			description.y = box.y + 18;
			icon.x = box.x + 4;
			icon.y = box.y + 4;
		}
		
		/**
		 * Updates the animation.
		 */
		public function update():void
		{
			if (animateTimer >= FlxG.framerate)
			{
				animate = true;
			}
			else
			{
				animateTimer++
			}
			if (animate)
			{
				box.alpha -= 0.03;
				if (box.alpha == 0)
				{
					exists = false;
				}
				box.y += speed;
				speed += 0.05;
			}
			title.alpha = box.alpha;
			description.alpha = box.alpha;
			icon.alpha = box.alpha;
			title.x = box.x + 30;
			title.y = box.y;
			description.x = box.x + 30;
			description.y = box.y + 18;
			icon.x = box.x + 4;
			icon.y = box.y + 4;
		}
		
		/**
		 * Draws the components onto the screen.
		 */
		public function draw():void
		{
			box.draw();
			description.draw();
			icon.draw();
			title.draw();
		}
		
		/**
		 * Clean up memory.
		 */
		public function destroy():void
		{
			box.destroy();
			title.destroy();
			description.destroy();
			icon.destroy();
			box = null;
			title = null;
			description = null;
			icon = null;
		}
		
	}

}