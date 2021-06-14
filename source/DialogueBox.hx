package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.text.FlxTypeText;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxSpriteGroup;
import flixel.input.FlxKeyManager;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;

using StringTools;

class DialogueBox extends FlxSpriteGroup
{
	var box:FlxSprite;

	var curCharacter:String = '';

	var dialogue:Alphabet;
	var dialogueList:Array<String> = [];
	var kadeEngineWatermark:FlxText;

	// SECOND DIALOGUE FOR THE PIXEL SHIT INSTEAD???
	var swagDialogue:FlxTypeText;

	var dropText:FlxText;

	public var finishThing:Void->Void;

	var portraitLeft:FlxSprite;
	var portraitRight:FlxSprite;

	var handSelect:FlxSprite;
	var bgFade:FlxSprite;
	var extraPortraits:Array<FlxSprite> = [];
	var extraPortraits2:Array<FlxSprite> = [];
	var CharNames:Array<String> = [
		'both',
		'marie_A',
		'marie_A2',
		'marie_happy',
		'marie_heh',
		'tanner_concerned',
		'tanner_confused',
		'tanner_happ',
		'tanner_happ_closed',
		'tanner_suprised'
	];
	var CharNames2:Array<String> = [
		'bf_normal',
		'gf',
		'bf_scared',
	];

	public function new(talkingRight:Bool = true, ?dialogueList:Array<String>)
	{
		super();

		switch (PlayState.SONG.song.toLowerCase())
		{
			case 'senpai':
				FlxG.sound.playMusic(Paths.music('Lunchbox'), 0);
				FlxG.sound.music.fadeIn(1, 0, 0.8);
			case 'thorns':
				FlxG.sound.playMusic(Paths.music('LunchboxScary'), 0);
				FlxG.sound.music.fadeIn(1, 0, 0.8);
		}

		bgFade = new FlxSprite(-200, -200).makeGraphic(Std.int(FlxG.width * 1.3), Std.int(FlxG.height * 1.3), 0xFFB3DFd8);
		bgFade.scrollFactor.set();
		bgFade.alpha = 0;
		add(bgFade);

		new FlxTimer().start(0.83, function(tmr:FlxTimer)
		{
			bgFade.alpha += (1 / 5) * 0.7;
			if (bgFade.alpha > 0.7)
				bgFade.alpha = 0.7;
		}, 5);

		
		var hasDialog = false;

	
			box = new FlxSprite(40, 345);
				hasDialog = true;
				box.frames = Paths.getSparrowAtlas('speech_bubble_talking');
				box.animation.addByPrefix('normalOpen', 'Speech Bubble Normal Open', 24, false);
				box.animation.addByIndices('normal', 'speech bubble normal', [4], "", 24);
				box.setGraphicSize(Std.int(box.width * PlayState.daPixelZoom * -0.9));
				box.updateHitbox();

		this.dialogueList = dialogueList;
		
		if (!hasDialog)
			return;



	 if (PlayState.SONG.song.toLowerCase() == 'hat-tip')
		{
		box.animation.play('normalOpen');
		box.setGraphicSize(Std.int(box.width * PlayState.daPixelZoom * -0.95));
		box.updateHitbox();
		}
		add(box);

		kadeEngineWatermark = new FlxText(4,FlxG.height * 0.9 + 45,0, "Press space to skip dialogue.", 32);
		kadeEngineWatermark.setFormat(Paths.font("vcr.ttf"), 16, FlxColor.WHITE, RIGHT, FlxTextBorderStyle.OUTLINE,FlxColor.BLACK);
		kadeEngineWatermark.scrollFactor.set();
		add(kadeEngineWatermark);



		for (i in 0...CharNames.length)
		{
			var prefix:String = "ghostCharacters/TwinsOne/DialogueIcons/";
			//var shitList:Array<String> = [];
			var newSprite:FlxSprite = new FlxSprite(box.x, box.y + 100).loadGraphic(Paths.image(prefix + CharNames[i], 'ghosttwins'));
			newSprite.setGraphicSize(Std.int(newSprite.width * 0.5));
			newSprite.screenCenter(Y);
			newSprite.x += 100;
			newSprite.y += 68;
			newSprite.updateHitbox();
			newSprite.scrollFactor.set();
			newSprite.visible = false;
			extraPortraits.push(newSprite);
			add(extraPortraits[i]);
		}

		for (i in 0...CharNames2.length)
		{
			var prefix:String = "DialogueIcons/";
			//var shitList:Array<String> = [];
			var newSprite2:FlxSprite = new FlxSprite(box.x, box.y + 100).loadGraphic(Paths.image(prefix + CharNames2[i], 'ghosttwins'));
			newSprite2.setGraphicSize(Std.int(newSprite2.width * 0.5));
			newSprite2.screenCenter(Y);
			newSprite2.x += 600;
			if(CharNames2[i] == 'gf')
			{
				newSprite2.x -= 250;
			}
			newSprite2.y += 88;
			newSprite2.updateHitbox();
			newSprite2.scrollFactor.set();
			newSprite2.visible = false;
			extraPortraits2.push(newSprite2);
			add(extraPortraits2[i]);
		}



		if (!talkingRight)
		{
			// box.flipX = true;
		}
   if (PlayState.SONG.song.toLowerCase() == 'senpai' || PlayState.SONG.song.toLowerCase() == 'thorns' || PlayState.SONG.song.toLowerCase() == 'roses')
		{
		dropText = new FlxText(242, 502, Std.int(FlxG.width * 0.6), "", 32);
		dropText.font = 'Pixel Arial 11 Bold';
		dropText.color = 0xFFD89494;
		add(dropText);

		swagDialogue = new FlxTypeText(240, 500, Std.int(FlxG.width * 0.6), "", 32);
		swagDialogue.font = 'Pixel Arial 11 Bold';
		swagDialogue.color = 0xFF3F2021;
		swagDialogue.sounds = [FlxG.sound.load(Paths.sound('pixelText'), 0.6)];
		add(swagDialogue);
	    }

		   if (PlayState.SONG.song.toLowerCase() == 'hat-tip')
		{
        swagDialogue = new FlxTypeText(240, 460, Std.int(FlxG.width * 0.6), "", 32);
		swagDialogue.font = 'Lampshade';
		swagDialogue.color = FlxColor.BLACK;
		swagDialogue.sounds = [FlxG.sound.load(Paths.sound('pixelText'), 0.3)];
		add(swagDialogue);
		}

		dialogue = new Alphabet(0, 80, "", false, true);
		// dialogue.x = 90;
		// add(dialogue);
	}

	var dialogueOpened:Bool = false;
	var dialogueStarted:Bool = false;

	override function update(elapsed:Float)
	{
		// HARD CODING CUZ IM STUPDI
		if (box.animation.curAnim != null)
		{
			if (box.animation.curAnim.name == 'normalOpen' && box.animation.curAnim.finished)
			{
				box.animation.play('normal');
				dialogueOpened = true;
			}
		}

		if (dialogueOpened && !dialogueStarted)
		{
			startDialogue();
			dialogueStarted = true;
		}

		if (FlxG.keys.justPressed.ANY  && dialogueStarted == true)
		{
			remove(dialogue);
				
			FlxG.sound.play(Paths.sound('clickText'), 0.8);

			if (FlxG.keys.justPressed.SPACE)
			{
				if (!isEnding)
				{
					isEnding = true;

					if (PlayState.SONG.song.toLowerCase() == 'senpai' || PlayState.SONG.song.toLowerCase() == 'thorns')
						FlxG.sound.music.fadeOut(2.2, 0);

					new FlxTimer().start(0.2, function(tmr:FlxTimer)
					{
						box.alpha -= 1 / 5;
						bgFade.alpha -= 1 / 5 * 0.7;
						hidePortraits();
						swagDialogue.alpha -= 1 / 5;
						if (PlayState.SONG.song.toLowerCase() == 'senpai' || PlayState.SONG.song.toLowerCase() == 'thorns' || PlayState.SONG.song.toLowerCase() == 'roses') 
						dropText.alpha = swagDialogue.alpha;
					}, 5);

					new FlxTimer().start(1.2, function(tmr:FlxTimer)
					{
						finishThing();
						kill();
					});
				}
			}

			if (dialogueList[1] == null && dialogueList[0] != null)
			{
				if (!isEnding)
				{
					isEnding = true;

					if (PlayState.SONG.song.toLowerCase() == 'senpai' || PlayState.SONG.song.toLowerCase() == 'thorns')
						FlxG.sound.music.fadeOut(2.2, 0);

					new FlxTimer().start(0.2, function(tmr:FlxTimer)
					{
						box.alpha -= 1 / 5;
						bgFade.alpha -= 1 / 5 * 0.7;
						kadeEngineWatermark.alpha -= 1 / 5 * 0.7;
						hidePortraits();
						swagDialogue.alpha -= 1 / 5;
						if (PlayState.SONG.song.toLowerCase() == 'senpai' || PlayState.SONG.song.toLowerCase() == 'thorns' || PlayState.SONG.song.toLowerCase() == 'roses') 
						dropText.alpha = swagDialogue.alpha;
					}, 5);

					new FlxTimer().start(1.2, function(tmr:FlxTimer)
					{
						finishThing();
						kill();
					});
				}
			}
			else
			{
				if (!isEnding)
				{
				dialogueList.remove(dialogueList[0]);
				startDialogue();
				}
			}
		}
		
		super.update(elapsed);
	}

	var isEnding:Bool = false;

		
	function hidePortraits():Void
	{
		for (shit in extraPortraits)
		{
			shit.visible = false;
		}
		for (shit2 in extraPortraits2)
		{
			shit2.visible = false;
		}
	}

	function startDialogue():Void
	{
		cleanDialog();
		// var theDialog:Alphabet = new Alphabet(0, 70, dialogueList[0], false, true);
		// dialogue = theDialog;
		// add(theDialog);

		// swagDialogue.text = ;
		swagDialogue.resetText(dialogueList[0]);
		swagDialogue.start(0.04, true);

		switch (curCharacter)
		{
			case 'noone':
				hidePortraits();
		}
		if (CharNames.contains(curCharacter))
		{
			hidePortraits();
			extraPortraits[CharNames.indexOf(curCharacter)].visible = true;
		}
		if (CharNames2.contains(curCharacter))
		{
			hidePortraits();
			extraPortraits2[CharNames2.indexOf(curCharacter)].visible = true;
		}
	}

	function cleanDialog():Void
	{
		var splitName:Array<String> = dialogueList[0].split(":");
		curCharacter = splitName[1];
		dialogueList[0] = dialogueList[0].substr(splitName[1].length + 2).trim();
	}
}
