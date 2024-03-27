# Bashtastic by dieselbaby
Bashtastic is a useful collection of different shell scripts that I have personally created, for automating various processes or to just make things easier for how my brain works.  Hopefully someone else will find these helpful, that's why I'm putting them up on here!

## clipit.sh (clipit)

**clipit** is a bash script designed to make it easy to modify and create audio and video clips (from audio and video files) using the command line and ffmpeg.  No longer will you have to worry about remembering annoying ffmpeg command syntax, when all you wanna do is make some quick audio-only clips of a certain stretch of dialog in a video file you grabbed from youtube using `yt-dlp`, with `clipit` you'll be able to do this very easily, it's particularly great for generating "sounders" for use with a stream deck device.  

*Future updates will be adding more features - like the ability to generate numerous clips in a single command by including a list of separate timestamp ranges.  By default it is working with .mp4 files for video, going to add more formats to this later on as well, though it should recognize any video format that `ffmpeg` does.*

### Usage of clipit/options

- `-s source_file`: Specify the path to the source video or audio file.
- `-d destination_directory`: Specify the destination directory where the output file will be saved (optional).  If the destination directory is not specified, it exports by default into the same directory as the source directory *changed from formerly being defaulted to the current working directory.*
- `-t start_timestamp end_timestamp`: Specify the start and end timestamps for the clip in the format `hh:mm:ss`.  For example: `-t 00:01:23 00:03:45` would create a clip that runs from 1 minute and 23 secconds to 3 minutes and 45 seconds in the file's runtime.
- `--audio`: Extract audio from the source file (optional).
- `--mp3`: Set the output format to MP3 (optional).
- `--wav`: Set the output format to WAV (optional).
- `--audio-only`: Create an audio-only clip (optional).

### Examples

**Create a video clip:**

`./clipit.sh -s source.mp4 -d /path/to/destination -t 00:01:23 00:02:34 --mp3`

**Create an mp3 audio clip from an existing video file:**

`./clipit.sh -s video.mp4 -d /path/to/destination -t 00:01:23 00:02:34 --audio-only --mp3`

**RECOMMENDED that you add this script to your `/usr/bin` folder or wherever you normally put such scripts, and `chmod +x` it to make it executable, so youo can just run commands as `clipit ...` instead of `./clipit.sh ...` as the former looks way cooler than the latter, lol.**

### MORE UPDATES AND MORE SCRIPTS TO BE ADDED WHEN I GET AROUND TO IT
