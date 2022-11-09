//
//  JsonChars.swift
//  Kingdom Mystery App
//
//  Created by Kate McCarthy on 10/13/22.
//

import Foundation
let json = """
[{
"name": "Inn Keeper",
"img": "beaver",
"img2": "",
"crown":[],
"intro": ["Well howdy there traveller! What can I help you with?"],
"initial": ["A Traveller? Around these parts? That's a rare sight!","Welcome. I'm afraid you don't come at a good time, after the theft of the Diamond of Lochan..."],
"diamond":["The Diamond of Lochan is a family heirloom passed through the generations. It lived in the royal vault for centuries",
    "That is, until it was stolen.",
    "The stealing led to the kingdoms splitting up as they are now.",
    "You’ve been tasked with finding out who stole it? Good luck on that! That’s no easy task!",
    "However I don’t think that it was an organized effort by another monarch. There was no bad blood that would lead to that.",
    "Listen, if you ever are stuck on a clue, come ask me! I’ve seen it all!"],
"vaultNote": ["This note was in the vault? Dam…",
    "Who would be so careless as to hand write a piece of evidence like this?"],
"redBerries": ["Berries from Lochan, huh? I think the artist in Sliavh might be able to use these!"],
"greenBerries":["Berries from Foroise, huh? I think the artist in Sliavh might be able to use these!"],
"disguising":["You need to make a disguise? No questions asked here!","There’s no tailors in our kingdom, but maybe there’s somebody artistically inclined who could help you out?"],
"priest":["The Priest of Foroise? Oh, poor fellow has been meditating since before the shattering of the kingdoms.","We all knew him before he became a pious man. He used to be good friends with the baker back in the day!"],
"invoice":["An invoice, huh? Looks like it’s someone requesting something from the blacksmith. I wonder who wrote this."],
"potion":[],
"recipe":["Oooo this looks like a recipe for caramel cake crisps! This must be the bakers.","Back in the day, he used to make these for everyone in town. They say that the divine smell could wake the dead."],
"caves":["The caves, huh? Are those the ones with the rainbow stones out front?", "I knew the pattern once, but I’m not good with colors. Maybe someone in town is?"],
"statueMissing":["The statue of the mountains is missing? Oh no! In the chaos of the shattering of the towns, it would’ve made a valuable steal.","With the priest asleep, I don’t know if anyone would’ve noticed it gone."],
"statueSold":["The thief sold the statue? Figures. That’s just like him.","I don’t know who he sold it to, but I can tell you to look for a statue of a cat holding an orb."],
"statue":["You got the statue? Nice!", "It used to go up on a platform in the mountains. If you don’t need it anymore, might as well place it there."],
"chest":["There was a chest under the statue? Oh wow. Looks like it’s locked. I wonder if anyone in town has the key. Hm….", "Or even better, could someone MAKE a new key?"],
"letters":["Oh my, these feel personal. Love letters perhaps? They’re signed by the alchemist, they must be hers. It doesn’t say who she was writing to, though."]

},

{
"name": "Hero",
"img": "tiger",
"img2": "",
"intro": ["Good day, Traveller. May I help you?"],
"initial":["A Traveller in Lochan? My are you a sight for sore eyes.", "Hello. My name is Tigros. I was once a loyal knight of King Aleold, but in the past few years there hasn't been much of a need for an army.", "Feel free to stop by at any time. It's been ages since anyone here has had visitors."],
"crown":["My stars, that’s a crown of Lochan! Where did you find this, Traveler?","It contains the red gems of the royal family. One must’ve lost it!"],
"diamond":["What do I know about the Diamond of Lochan? Ah, a mystery for the ages. All of the sects of the kingdom were peaceful, I do not know why another monarch would steal the gem. It was precious, yes, but it would obviously anger King Aleod.","I was here, that fateful night, taking care of the Elder. I never knew that I would wake up the next morn to be split off from the other two-thirds of the kingdom.","The walls went up quickly after. Now we are but a small kingdom."],
"vaultNote": ["This was in the vault? Where the Diamond once stood? Excellent find, Traveler! This will surely help you identify which kingdom stole the gem!"],
"redBerries":[],
"greenBerries":[],
"disguising":["Traveller, why are you asking about disguises? Are you planning to sneak someone into somewhere they shouldn’t be?"],
"priest":["The Priest in Foroise? Oh poor lad, is he still meditating? I think he’s probably been out of it since the Shattering. I wonder if he even knows it happened.","Had he been awake, he likely would’ve been taken under Lochan’s wing. He grew up here.","But no one dared move him while he was meditating, so in Foroise he remains."],
"invoice":["Oh, this is a request I wrote up for an order from the blacksmith. That is, back when we had a blacksmith. I don’t know where you found this, I believe it was tossed in my trash years ago.","The blacksmith was a friend of mine. He was a staple of our town, and I was at his store almost daily. However, in the Shattering he was forced to return to Sliavh.","Say, Traveler, since you can move between the kingdoms freely, could you tell him that Tigros says hello?"],
"potion":[],
"recipe":["Is this a recipe? I can’t say I’ve seen this before."],
"caves":["Caves in Foroise? It’s been ages since I’ve been, I’m afraid I’m no help."],
"statueMissing":["The Statue of the Mountains was stolen?! By whom?? This is an outrage. I will keep my eyes peeled, Traveler. I can’t say I’ve seen it, but I have no sympathy for those who would steal something with religious significance like that."],
"statueSold":["The thief stole and sold the monument? I am disappointed, but not surprised. It’s in his nature. I have yet to see it, but will alert you the second I do. Good luck, Traveler."],
"statue":["You found the statue? Huzzah! Excellent work!","It was with the Alchemist of Foroise?","...I see. She’s a friend of mine. A girl with a massive heart, if a bit naive. I doubt she recognized it when she bought it from the thief."],
"chest":["There was a chest under the statue? That’s odd. I knew the statue used to live in the mountains, but I didn’t realize it held a vault."],
"letters":["These letters. How did you open the chest?","I mean-","There was something else in the chest, wasn’t there.","Please, I am begging you, do not implicate her in this. She did not do this.","As a favor, I ask for your discretion. And I will be taking these letters."]

},

{
"name": "Alchemist",
"img": "elephant",
"img2": "",
"intro": ["Well hi there! How's it going?"],
"initial":["Oh my, who are you? Are you a customer, after all these years??","YAY!!! Hi hi hi. I'm the resident Alchemist of Foroise, Leeda!", "Here, have this. I've been dying to give it to someone.","Sorry if I'm coming across a bit strong. It's just been ages since I've seen someone new."],
"crown":[],
"diamond":["The Diamond of Lochan? I wish I knew more. All I can tell you is that those fools from Sliavh keep saying that WE did it! Why would our great King steal? It wasn’t us!","You’re trying to find it? Good!","You can finally clear our name!","Where was I? I was on a date that night! I never saw the guy again, he ended up behind a different wall. I miss him, but I know that this is for the best."],
"vaultNote": ["There was a note in the vault with the diamond? Wow. Look at that","I don’t know who did this, but I hope you find out soon!"] ,
"redBerries":[],
"greenBerries":[],
"disguising":["You’re trying to make a disguise? Ooo, sneaky!", "I can’t say that I have experience with making disguises, but good luck, Mr. Sneakster!"],
"priest":["You’re asking about Mr. Father Priest Man? He’s been asleep for a long time! Or someone said he’s not actually asleep. I don’t really know what he’s doing.", "But he used to be really nice! I hope he wakes up soon!"],
"invoice": ["Sorry, this doesn’t look familiar to me!"],
"potion": ["That’s a special potion I made! Give it to someone you want to be your friend! You’ll see what happens!"],
"recipe": ["Ooo is this for caramel cake crisp? I used to love this!", "Mr. Baker used to make this for everyone once a year! We all loved it! Me and Mr. Father Priest Man used to try to convince him to give us seconds. It worked a few times!", "That was before Mr. Father Priest Man fell asleep."],
"caves":["The Caves? I’ve been out a few times to see the stones, but don’t know much about them."],
"statueMissing": ["A stolen statue? Sorry, I don’t know much about that."],
"statueSold": ["“A statue that Mr. Raccoon sold? Oh, he sold that to me! I didn’t know it was stolen, I’m so sorry! Here, take this!"],
"statue": ["I’m sorry, I didn’t know it was stolen! I was just using it as decoration, feel free to take it elsewhere!"],
"chest": ["The statue unlocked a vault that had a chest? My stars, I didn’t realize that I was holding onto a key!", "I don’t know about opening it though, sorry."],
"letters": ["HEY! Where’d you get those?! Those are personal! Give them back!"]

},

{
"name": "Thief",
"img": "raccoon",
"img2": "",
"intro": ["Yeah? Do you need something?"],
"initial":["Oh ho ho, new guy huh?", "Pleasure to meet you. I don't give my name freely to strangers, though", "We may have a king, but don't get it twisted. I run the streets around here.", "Stay in your lane and you should be fine."],
"crown":[],
"diamond":["Listen. I know the reputation I get around here, but it wasn’t me. I wouldn’t be so stupid as to steal something so high profile.","I mean, I would never steal anyth-", "Oh who am I kidding. You’re not a cop. Gotta make a living somehow, right?"],
"vaultNote": ["A note? What kinda amateur leaves a note. Too much evidence. Clearly they weren’t very bright."],
"redBerries":[],
"greenBerries":["Did…did I grab those for you? What the hell happened. I can’t remember. I had those and then blacked out and…", "Keep them. I don’t really need them. Just whatever you did to me, don’t do it again please."],
"disguising":["A disguise, eh? NOW you’re speaking my language.", "Unfortunately, can’t say I’m very artistically inclined. I’d help if I could, my friend."],
"priest":["The Priest? Ah, poor man’s gonna wake up to a real shock. He’s been out of it since before all of this went down.", "Nice guy, though.”"],
"invoice": ["“Wait a second, WHERE’D YOU GET THIS?", "You got INTO MY VAULT? That’s personal!", "There’s nothing valuable in there right now, just some old trash. Fine. You can keep it. It’s just junk anyways."],
"potion": ["A gift? For me? Shucks, you shouldn’t have.","...","...what in the world is in thi-","...","...hello, friend. I will do anything for you, friend. I am your humble servant, friend.", "Let me grab you something, friend."],
"recipe": ["““Wait a second, WHERE’D YOU GET THIS?", "You got INTO MY VAULT? That’s personal!", "There’s nothing valuable in there right now, just some old trash. Fine. You can keep it. It’s just junk anyways.”"],
"caves": ["Those caves outside? Yeah I know ‘em. What’s it to you?"],
"statueMissing": ["A missing statue?! I’ve never even heard of the Statue of Sliavh! I would never see its beauty and…and…", "…and take it.","Man. Fine.","I took it, OK? It was an easy target. The priest was asleep! And it was so pretty!", "I don’t have it anymore. I sold it."],
"statueSold": ["I don’t know where I sold it, I already told you. I’m sorry!"],
"statue": ["Ohhhh it was with the Alchemist? Figures. Sorry about that, I don’t pride myself in my memory."],
"chest": ["It hid a chest? Man I would’ve never sold the statue if I’d known there was a hidden treasure underneath!", "It’s locked? That’s a shame. Haven’t seen a key around, wonder if you could get a makeshift one…"],
"letters": ["Hm, odd letters. Looks like they’re signed by the Alchemist. Where’d you find these?"]

},

{
"name": "Blacksmith",
"img": "eagle",
"img2": "eagle-disguised",
"intro": ["Hello! How may I help you?"],
"initial": ["A Traveller? My stars, it's been ages. Greetings. I'm a blacksmith by trade, although I can't say I have much to show for it right now.","I'm always happy to lend an ear or provide what help I can. Welcome to Sliavh."],
"crown":[],
"diamond":["Ahhh the Diamond of Lochan. It’s a shame, it was a work of beauty. And those pesky Foroisans have the audacity to push the blame onto us. Our lovely Queen would never tolerate such a thing. Besides, who would agree to steal that?", "Where was I? Well funnily enough, I was living in Lochan at the time. I used to work there. I was pulling a long night, but was so invested in my work that I didn’t notice anything outside.","I live in Sliavh though, and when the walls went up I had to stay back here. Not much of a blacksmith anymore without my tools."],
"vaultNote": ["This was in the vault? Odd. I’ve never seen this before. I wonder why I haven’t heard of this."],
"redBerries":[],
"greenBerries":[],
"disguising":["If you can get me a disguise, maybe I can sneak back into Lochan. I know it’s a big ask, but if my work is needed then I must return!"],
"priest":["The Forosian Priest? I’ve met him, but never was close with him. I’ve heard he’s been meditating for years."],
"invoice": ["Oh I recognize this. This is from Tigros, in Lochan. He used to be one of my finest customers. He was always around, and I would’ve counted him among friends.", "Where did you get this though?"],
"potion":[],
"recipe":["Sorry, I don’t believe I recognize this."],
"caves": ["I’ve heard of the Caves in Foroise, but I can’t say I know much about them. Sorry."],
"statueMissing": ["Ah the statue. The pride of Sliavh. For safekeeping, years before the Shattering, it was moved to the Church of Foroise.", "You…you say it was stolen?", "THE STATUE OF THE MOUNTAINS WAS STOLEN??", "Sorry, I must control myself.", "Find it please. It would do us all a great service"],
"statueSold": ["The statue was SOLD?? AS IN SOLD FOR MONEY?!","I mean, *ehem*, thank you for this information. Please find the statue. The entire city is counting on you."],
"statue": ["You found the statue! Praise the stars! You’re a god send to us all.", "I’d suggest putting it on the pedestal out in the mountains, its rightful home."],
"chest": ["The statue revealed a chest? How curious. I’d never noticed a vault.","Do you have a key?","No? Hm…","That statue is of great significance to Sliavh, I feel obligated to help you open it.","Hold here just a moment. It’s an older style key, but I believe I’ll be able to fashion something...","...","..!","THE DIAMOND?!","Wow. It really is."," Inform the king of Lochan, I’m sure he will want to know.", "Although this doesn’t look good for the people of Sliavh…", "I wouldn’t suggest showing the diamond to anyone else in town. If you let the thief know you found it, they may run away.”"],
"letters": ["The letters in the chest. It looks like they were written by the alchemist girl."]

},

{
"name": "Priest",
"img": "dog-asleep",
"img2": "dog-awake",
"intro": ["Hey brother! What's up?"],
"initial": ["...hgnh is...is that...","CARAMEL CAKE CRISP!!!", "Can I have it please please pl-", "Oh-hi! I don't believe we've met. I'm D- Oh.","Right. I'm a priest now. I'm supposed to have people call me Father. It feels so...formal though", "How about you call me Brother instead! Feels less formal.", "Say, where is everyone?", "...", "Three Kingdoms? Walls? How long was I out for?", "FIVE YEARS?? HOW??", "God da- WAIT", "I can't swear. That's alright I can just ask forgiveness from the Statue of Our Lady of the Mou-", "...", "WHERE'S THE STATUE???", "Behind me! There's supposed to be a statue! It's gone!!", "Noooo nonononono this is bad. Can you help me find it, brother?","You can? Thank you thank you thank you!!"],
"crown":[],
"diamond":[],
"vaultNote":[],
"redBerries":[],
"greenBerries":[],
"disguising":[],
"priest":[],
"invoice":[],
"potion":[],
"recipe":[],
"caves":[],
"statueMissing": ["Please find the statue!! Ohhhh man that Blacksmith is going to be furious…He already didn’t trust me...I can’t believe I slept through it…"],
"statueSold": ["It was sold to someone?? Ohhhhh this is bad. This is very bad. Please find it, quick!"],
"statue": ["Oh thank stars! You found it!!","I’m not going to lie brother, I don’t know that I should be left in control of it anymore.","I think it’s better if you find a different home for it."],
"chest": ["The statue revealed a chest?? What?? That’s crazy. Do you know how to open it?","No? That’s OK!","Good luck brother, I believe in you!”"],
"letters": ["Wow, those are some letters huh! They look personal, where’d you get these?","The chest? Oh nice, so you got it open?", "Nice work, brother!"]
},

{
"name": "Artist",
"img": "penguin",
"img2": "",
"intro": ["Blessed day to you, Traveller. How might I assist thee in thy journeys?"],
"initial":["Avast! What doth my eyes see but a new face!", "Hark! It hath been ages! I am the great artist Pinguino, first of my name. Welcome to Sliavh!", "I'm sure you've heard the tale of woe of the shattering of the kingdoms. A tragedy for sure.", "I'm sure you're wondering why I am in such a blue world. I used to get my other colors of paint from other parts of the kingdom. But now they hath been severed", "A pity really. Regardless, I am always here to lend an ear to you, good lad."],
"crown":[],
"diamond":["The Diamond? The Diamond! O woe is the tale of the Diamond! The scallywags of Foroise turned the blame to us! Vile, I tell you. Vile!","That night, I was in my own studio. I was hit by inspiration for my great masterpiece! A pity I couldn’t finish it before the walls went up.","I need Foroisian and Lochan berries for paint. Without it, I am left in a hell painted blue. A beautiful color, but not when I’ve been cooped like a flightless bird in a sea!"],
"vaultNote": ["This script…it’s the script of the criminal! God forbid! Vile!","I can’t say I recognize it, my lad. My apologies.","Please swiftly bring this criminal to justice!"],
"redBerries": ["My god…doth mine eyes deceive me?! Are those...Lochan berries??","You’re a savior! A god send! Huzzah! Thank you, lad. Now I can add red to this array of color."],
"greenBerries": ["My god…doth mine eyes deceive me?! Are those…Foroisian berries??","You’re a savior! A god send! Huzzah! Thank you, lad. Now I can add green to this array of color."],
"disguising": ["A Lochan disguise you say? Hm… I’ve never been much of a tailor…","But I am, Pinguino the Artist, first of his name, and I have NEVER backed down from a challenge! Wait here my lad!","...","Here we are! A masterpiece! A fine piece of work if I do say so myself!"],
"priest": ["Ah the Forosian priest you say? A poor lad, knowing naught about the situation we will awaken into."],
"invoice": ["What is this? Appears to be an invoice for the blacksmith. A fellow master of his trade!","How much is he getting paid? 300 GOLD?? For a SWORD??","Blasphemy. I can’t imagine getting paid that much for your craft."],
"potion":[],
"recipe": ["A recipe? I can’t say I know much about cooking, lad."],
"caves": ["The Caves of Foroise? Ah, the great Pyrostones! Their colors dancing in the wind! A true work of natural beauty! They hide a secret within their wonder. When sealing the cave, I tried to make a useful mnemonic - The secret to the pyrostones lies in their colors, in the PYRO."],
"statueMissing":["Ah the beauty of the statue on the mountains. I remember making pilgrimage before it was moved to the Forosian church for safe keeping.","It’s missing??","A pity. It truly is a sight to behold. I hope you find it, my good lad."],
"statueSold": ["The statue was sold?? Can you put a price point on such a masterpiece?? For shame! For shame! Find it please!"],
"statue": ["You found it! Oh glorious day! It used to reside on the mountains, might I suggest returning it to its rightful pedestal?"],
"chest": ["A chest in the mountains? Oh wonderful, a mystery","I’m afraid I’m not much help in opening it, but I’m intrigued now!"],
"letters": ["Ohhhh young love! What beauty, what grace! There is no greater inspiration! Brava to whoever composed these!"]

},
{
"name": "Baker",
"img": "bear",
"img2": "",
"intro": ["...?"],
"initial":["...hi."],
"crown":["..."],
"diamond":["..."],
"vaultNote":["..."] ,
"redBerries":[],
"greenBerries":[],
"disguising":["..."],
"priest": ["“…hm? Ah, Priest.", "A friend of mine.","Has he woken up?", "No? Hm."],
"invoice":["..."],
"potion":[],
"recipe":["“...oh?","There it is. I’ve been looking for this.","...","Take this to Priest.", "Thank you."],
"caves":["..."],
"statueMissing":["..."],
"statueSold":["..."],
"statue":["..."],
"chest":["..."],
"letters":["..."]

},
{
"name": "Princess",
"img": "lioness",
"img2": "lioness-crowned",
"intro": ["What do you want?"],
"initial": ["Someone new? Huh. That's a rare sight.","Who am I? You're not getting that info out of me.", "Can't you see I'm in a bad mood? Go away."],
"crown":["I thought I told you to-HEY!", "There it is! Where did you find this??","Sorry for everything earlier. This is mine.","I’d lost it. I was too scared to go back and tell Dad that I’d lost it.","My name is Lenore. I’m Princess around here. I can’t thank you enough. I don’t know why you’re here, but I could get you an invitation to see my dad if you would like!","Stop by the castle and he will grant you audience any time you wish."],
"diamond":[],
"vaultNote": [],
"redBerries":[],
"greenBerries":[],
"disguising":[],
"priest":[],
"invoice":[],
"potion":[],
"recipe":[],
"caves":[],
"statueMissing":[],
"statueSold":[],
"statue":[],
"chest":[],
"letters":[]

}
]
""".data(using: .utf8)!

