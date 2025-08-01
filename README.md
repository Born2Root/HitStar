<img width="360" height="108" alt="hitstar_logo" src="https://github.com/user-attachments/assets/b099b68f-6d06-4a41-8faa-b28e250d7502" />

**HitStar, the OpenSource Hitster clone leveraging your own songs!**

Build your own version of the game [Hitster](https://hitstergame.com/).
Full offline- & online availability.
Completely independent from online plattforms (Spotify, YouTube, Deezer, etc.).
Leveraging your own playlists & music-collection.

## ⚡ What it's about?!
Hitster is a music quiz card game developed and released by [Jumbo](https://hitstergame.com/).
It's very easy and fun to play in bigger groups AND it is even cooler if you can use your own playlists!

The original game is dependent on Spotify and to enjoy the full gameplay experience you need a Spotify-Premium account.
As Spotify makes new deals with the big labels there is a high possibility that some Hitster cards won't work in the future, due to the music rights dependency.

With HitStar you can build your own version of the game.
This means that you can make a lot of variations for different kind of audiences.
Want to play with your K-Pop loving friends? Simply generate a card game with a K-Pop playlist!
Want to keep it at the more general hits? Use the open playlists as inspiration.

In the [description](https://github.com/Born2Root/HitStar/#how-to-build-your-own-game) you learn howto:
- Prepare and gather your music files
- Design and generate your own cards
- Print out and prepare the game material
- Install and adjust the App for your mobile device
- Play & have a lot of fun!

**Key Points of the whole gameplay:**

Most important are the printed game cards with a QR-Code on one side and the "solution", artist, song name and release-year on the other side.
With the mobile app the QR-Code is scanned and the app starts playing the corresponding audio file.
The QR-Code points either to an offline audio file or a webserver. No Spotify, YouTube or other plattforms are needed to play.
Afterwards one tries to guess the song. By turning the game card the solution is shown.


Main tasks to build your own HitStar game is to generate the game cards.
The toolchain descibed below will generates a pdf with ready to print cards like this:

The design is fully fexible and you can adjust it to your needs.
* To have it cheap, print it black/ white
* To make it look more professional make it colourfull

<img width="570" height="323" alt="card-example" src="https://github.com/user-attachments/assets/9ee37332-8429-41ba-9739-2cd3e73c68ff" />

The mobile App can be downloaded from the repo (at the moment available for Android).
The App is completely OpenSource and written with MITAppInventor.
   
<img width="245" height="340" alt="mobile app" src="https://github.com/user-attachments/assets/41dc5fd6-cfca-4870-9d6b-e1f0c2973f34" />


## 📖 How-To build your own game

## Prerequisite

**Software:**
* A collection of music files
* An Android mobile device
* For the offline version, the music files are stored on your mobile device
* For the online version, you need a webserver that can serve static files

**Hardware:**
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
		- As an alternative you can youse tools like [Amok Playlist Copy](https://amok.am/en/freeware/amok_playlist_copy/) to copy all music files from a playlist to one folder

### Step 2: Harmonizing the music

#### 2.1 - The file format
- Now you should have a bunch of music files in an folder
- It is highly possible that they have different file formats
- We will need all music files in the same format (.mp3, .flac, .ogg etc.)
    * You can use different freeware tools to convert you audio files so you end up with a collection of files in the same format

#### 2.2 - Loudness
- Usually the music files have different loudness levels. That means one song is a bit more quiet, others are louder.
- For a good game experience it is best when all songs have the same loudness level
- You can use freeware tools like [Mp3 Gain](https://mp3gain.sourceforge.net/download.php) to harmonize the loudness

#### 2.3 - The correct tagging
- Your songs need at least the correct tagging for `TITLE`, `ARTIST` and `DATE`. 
To tag your songs accordingly you can use free software tools like [mp3 Tag](https://www.mp3tag.de/en/) or others.

- With the `DATE` it is very important to set the correct date of the first release. If you have music files from Best-Of albums or samplers the date is very often relating to the release date of that sampler. But for the quiz we need the date of the original first release.
- There is a free tool called [MusicBrainz Picard](https://picard.musicbrainz.org/). That tool can safe you a ton of work, as it is possible to gather Tags and also the initial release automatically from different online databases.
To let the tool search for the oldest date you can use a custom Tagging-Script.
Variants:
1. Import the [scriptfile from the tools folder of the repo](https://github.com/Born2Root/HitStar/blob/main/Tools/MusicBrainz-GetOldestDate.ptsp)
2. Make a new Tagging script yourself: `$set(date,$if2(%_recording_firstreleasedate%,%originaldate%,%date%))`
![image](https://github.com/user-attachments/assets/7e26af14-b39e-4084-8abe-896516012b54)


### Step 3: Preparing the cards

#### 3.1 - Exporting your music information for creating the cards
To start creating the game cards we now need a .csv/ or Excel file that contains the information of your music.
You can use tools like [mp3 Tag](https://www.mp3tag.de/en/) or others that support to export all information of music files in a folder to a database.

With mp3 Tag you can open the folder where the music is saved.
Afterwards go to File -> Export -> .csv

#### 3.2 - Preparing the Excel-Table for Card Generation

The exported .csv contains all information of the music files, like
- path
- music file tagging information ('TITLE', 'ARTIST', 'DATE')
- etc.

In order to generate the game cards, we need some basic information.
You can find an example Excel file in the repo [Hitstar_data_Example.xlsx](https://github.com/Born2Root/HitStar/blob/main/Hitstar_data_Example.xlsx)
The columns with green headers are the ones with data directly from the .csv export.
The columns with the blue headers are constructed in Excel and are necessary for the game card creation.

Here is a short list of the information that wee need for the cards:

- Name of the song: Artist + Song name
- Year of release
	- often the mp3-Tags contain a full blown date with month and day.
	  For the game we just need the year. You can use Excel functions like "LEFT" to extract the year from the date string
	  =LINKS([@[Full Date]];4)
- Path to the music file
	- We need the base path of the folder where your music files will later also be stored.
	    * It makes sense to split the songs into the different categories of the game (like, Summer Hits, Rock, etc.)
- Path to icons on the cards
	- If you want icons on the cards, you need to specify the path to the local stored picture
- Path to the QR-Code
	- In the next step we will generate QR-Codes. Here you can already specify the path where the individual QR codes will be saved.
	- Just use the base Excel funtions to ease this task: ="C:\QR_Output\" &[@Pfad] & [@Name] &".png"

Save the Excel file.

#### 3.3 - Generating the QR-Codes for the Cards
We need the QR-Codes to be printed on the cards.
For that task we can use the freeware SimpleCodeGenerator and a simple Powershell script.
You can find the script and the tool in the repo.

To generate the QR-Codes you have to:
- copy the content of the column "QR-Content" from the Excel manually over to a plain .txt file
- You can find an example in the repo [input.txt](https://github.com/Born2Root/HitStar/blob/main/Tools/1-QRGenerator/input.txt)
- Start the Power-Shell script [Hitstar-QR-Generator.ps1](https://github.com/Born2Root/HitStar/blob/main/Tools/1-QRGenerator/Hitstar-QR-Generator.ps1)
	- The script wil go through every line of the .txt file and generates an QR-Code using the SimpleCodeGenerator.exe in the same directory
- After the script is finished you will have a QR-Code for every song saved into one directory

#### 3.4 - Creating the cards

To create the game-cards we use the freeware tool [nanDECK](https://nandeck.com/).
The tool allows us to script every detail of our cards, import a csv or Excel file and automatically generate the print-ready cards.
To do this you have to:
 - provide the already created Excel-file containing the whole dataset for the cards
 - open the [script](https://github.com/Born2Root/HitStar/blob/main/Tools/2-nandDECK/main_Hitstar-Deck.txt) from the repo in nanDECK
 - adjust the path to your local Excel file in the script
 - click the "Validate deck" button to check if everything is correct
 - click the "Build deck" button to generate the cards
 - save the result by clicking the "PDF" or "Print deck" button

### Step 4: Printing the cards

We have now everything ready. 
Print the PDFs and cut the cards out.
Now we are ready to play!
- Install the Android .apk on your phone.
- Download the music on your phone or server
- configurate the path to the music in the Apps settings
- Start playing by scanning the first card

## How to play

Refer [the original game rules](https://hitstergame.com/en-us/how-to-play/) for how to play the game itself. You
do not need to connect Spotify. Scanning a QR-Code from one of the cards with the mobiel app will automatically play the song.
To do this install the .apk from this repo on you Android phone.
After launching the app, press the big scan button in the middle.
The app will switch to camera mode so you are able to scan a game card QR-Code and play the according music-file.

To configure the path where the music is stored, click on the setting button, and adjust the path to your phones local storage or add the link to you static webserver.


Here is a short rundown of the game itself:
* Everyone receives a hit card at the beginning of a game. A hit contains information about a song, containing its title, the artist and year when it was released.
* A short snippet of a hit is played to you. You'll have to guess if it was released either before or after the hit that you already have in your collection.
* If you guessed correctly, you'll earn the hit card and add it to your collection. The game will continue to the next player.
* Next time it's your turn, you'll be played a hit again, but this time, you'll have to guess if it was released either before your earliest hit's release year, between your two hits, or after the latest hit release. Guess correctly to earn yourself another hit card, grow your collection, but also make it harder to guess your next hit correctly.

There is more to it, like tokens you can earn by also guessing title and artist of a hit, and paying them to intercept your opponents by correcting their guesses to earn their hit for your own.
I can also recommend the much more interactive BINGO-Version. In the repo you can find a [ready to print PDF](https://github.com/Born2Root/HitStar/blob/main/Print%20-%20HitStar%20-%20Bingo.pdf) version of the BINGO-material (Spin Board and Cards).


### 💬 FAQ

#### Changing or enhancing the Android mobile app
 - The app was created with the free [MIT App Inventor](https://appinventor.mit.edu/)
 - You can find the [.aia project file](https://github.com/Born2Root/HitStar/blob/main/Tools/3-MobileApp/HitStar.aia) in the repo
 - Import it into your MIT App Inventor account and change or extend the app as you like.



# ❤️ Support:

All the projects of me and my developer-friends are provided free of charge.
If you like what we do, we would really appreciate your support! 🤝

[!["Buy Me A Coffee"](https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png)](https://www.buymeacoffee.com/born2root)


