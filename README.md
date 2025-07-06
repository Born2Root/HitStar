# HitStar

HitStar, the OpenSource Hitster clone leveraging your own songs!

Build your own version of the game [Hitster][https://hitstergame.com/].
Full offline- & online availability
Completely independent from online plattforms (Spotify, YouTube, Deezer, etc.)
Leveraging your own playlists & music-collection


Hitster is a music quiz card game developed and released by [Jumbo][https://hitstergame.com/].
Its very easy and fun to play in bigger groups AND it is even cooler if you can use your own playlists!

The original game is dependent on Spotify and to enjoy the full gameplay experience you need a Spotify-Premium account.
As Spotify makes new deals with the big labels there is a high possibility that some Hitster cards won't work in the future, due to the music rights dependency.

With HitStar you can build your own version of the game.
This means that you can make a lot of variations for different kind of audiences.
Want to play with your K-Pop loving friends? Simply generate a card game with a K-Pop playlist!
Want to keep it at the more general hits? Use the open playlists as inspiration.

In the [description] you learn howto:
- Prepare and gather your music files
- Design and genrate your own cards
- Print out and prepare the game material
- Install and adjust the App for your mobile device
- Play & have a lot of fun!

**Key Points of the whole gameplay are:**

- The Game-Cards
	- The cards contain a QR code that points either to an offline audio file or a webserver. No Spotify, YouTube or other plattforms are needed to play. 
	- The toolchain generates a pdf with ready to print cards like this:
	    * The design is fully fexible and you can adjust it to your needs.
    	    * To have it cheap, print it black/white.
    	    * To make it look more professional make it colourfull

- The mobile App
	- The App to scan the cards and play the songs is at the moment available for Android
	- The source is completely OpenSource and written with MITAppInventor



## How-To build your own game

## Prerequisite

**Software:**
* A collection of music files
* An Android mobile device
* For the offline version, the music files are stored on your mobile device
* For the online version, you need a webserver that can serve static files

**Hardware:  **
* Sheets of A4 paper, preferably 180 g/m².
* A print-shop nearby or a own printer
* Preferably a paper cutter, alternatively scissors
* Tokens from the original Hitster game, or a suitable replacement e.g. poker chips, coins, etc.


## Step 1: Music Preparation

Since HitStar is completely independent of commercial music streaming services, you need own music files.

### Gathering the music

Option 1: You don't have a curated mp3-collection with all the needed songs
	- The playlists of the original Hitster game are completely public https://open.spotify.com/user/ta8hnikdhdctwuvkj2nl9itix/playlists
	- Use the power of websearch to find your trusted webpage to download Spotify playlists (there are several sites out there)
	- As an alternative organize yourself some Best Of samplers with music from different decades

Option 2: You have your own music collection with the desired songs
	- Most probably you have a playlist in your music player and the songs themselve are distributed over different folders of your computer
	- We need the music files all in one directory
		- Use your music player application to export a playlist to one folder
		- As an alternative you can youse tools like [Amok Playlist Copy][https://amok.am/en/freeware/amok_playlist_copy/] to copy all music files from a playlist to one folder

### Step 2: Harmonizing the music

#### 2.1 - The file format
	- Now you should have a bunch of music files in an folder
	- It is highly possible that they have different file formats
	- We will need all music files in the same format (.mp3, .flac, .ogg etc.)
	    * You can use different freeware tools to convert you audio files so you end up with a collection of files in the same format

#### 2.2 - Loudness
	- Usually the music files have different loudness levels. That means one song is a bit more quiet, others are louder.
	- For a good game experience it is best when all songs have the same loudness level
	- You can use freeware tools like [Mp3 Gain][https://mp3gain.sourceforge.net/download.php] to harmonize the loudness

#### 2.3 - The correct tagging
    - Your songs need at least the correct tagging for `TITLE`, `ARTIST` and `DATE`. 
    	To tag your songs accordingly you can use free software tools like [mp3 Tag][https://www.mp3tag.de/en/] or others.

    - With the `DATE` it is exremetly important to set the correct date of the first release. If you have music files from Best-Of albums or samplers the date is very often relating to the release date of that sampler. But for the quiz we need the date of the original first release.
    - There is a free tool called [MusicBrainz Picard][https://picard.musicbrainz.org/]. That tool can safe you a ton of work, as it is possible to gather Tags and also the initial release automatically from different online databases.
    To let the tool search for the oldest date you can use a custom Tagging-Script.
    Variants:
    1. Import the scriptfile from the tools folder of the repo https://github.com/Born2Root/HitStar/blob/main/Tools/MusicBrainz-GetOldestDate.ptsp
    2. Make a new Tagging script yourself: `$set(date,$if2(%_recording_firstreleasedate%,%originaldate%,%date%))`
![image](https://github.com/user-attachments/assets/7e26af14-b39e-4084-8abe-896516012b54)


### Step 3: Preparing the cards

#### 3.1 - Exporting your music information for creating the cards
To start creating the game cards we now need a .csv/ or Excel file that contains the information of your music.
You can use tools like [mp3 Tag][https://www.mp3tag.de/en/]. Go to File -> Export -> .csv

### 3.3 - Preparing the Excel-Table for Card Generation



### 3.2 - Gnerating the QR-Codes for the Cards
We need the QR-Codes to be printed on the cards.
For that task we can use the freeware SimpleCodeGenerator and a simple Powershell script.
You can find the script and the tool in the repo.


#### 3.3 - Creating the cards

To create the game-cards we use the freeware tool [nanDECK](https://nandeck.com/)
The tool allows us to script every detail of our cards, import a csv or Excel file and automatically generate the print-ready cards.
To do this you have to:
 - provide the already created Excel-file containing the whole dataset for the cards
 - open the [script](https://github.com/Born2Root/HitStar/blob/main/Tools/nandDECK/main_Hitstar-Deck.txt) from the repo in nanDECK
 - adjust the path to your local Excel file in the script
 - click the "Validate deck" button to check if everything is correct
 - click the "Build deck" button to generate the cards
 - save the result by clicking the "PDF" or "Print deck" button

### 3.4 - Printing the cards

We have now everything ready. Print the PDFs and cut the cards out.
Now we are ready to play!
- Install the Android .apk on your phone.
- Download the music on your phone or server
- confire in the path to the music in the Apps settings
- Start playing!  

## How to play

Refer [the original game rules][howplay] for how to play the game itself. You
do not need to connect Spotify. Scanning a QR code will open the track in your
browser. Most browsers will auto-play the track.

Here is a short rundown of how to play:
* Everyone receives a hit card at the beginning of a game. A hit contains information about a song, containing its title, the artist and year when it was released.
* A short snippet of a hit is played to you. You'll have to guess if it was released either before or after the hit that you already have in your collection.
* If you guessed correctly, you'll earn the hit card and add it to your collection. The game will continue to the next player.
* Next time it's your turn, you'll be played a hit again, but this time, you'll have to guess if it was released either before your earliest hit's release year, between your two hits, or after the latest hit release. Guess correctly to earn yourself another hit card, grow your collection, but also make it harder to guess your next hit correctly.

There is more to it, like tokens you can earn by also guessing title and artist of a hit, and paying them to intercept your opponents by correcting their guesses to earn their hit for your own.
Also a much more interactive BINGO-Version



### FAQ

#### Changing or enhancing the Android mobile app
 - The app was created with the free [MIT App Inventor](https://appinventor.mit.edu/)
 - You can find the [.aia project file](https://github.com/Born2Root/HitStar/blob/main/Tools/3-MobileApp/HitStar.aia) in the repo
 - Import it into your MIT App Inventor account and change the app as you like

