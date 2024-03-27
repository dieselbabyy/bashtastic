# clipit by dieselbaby - part of my bashtastic suite
# github.com/dieselbabyy/bashtastic
# see the above url for some documentation on how to use this script
# but basically its a way to do some simple video and audio clipping from the command line working with ffmpeg in a more friendly way

#!/bin/bash

while [[ $# -gt 0 ]]; do
  case "$1" in
    -s)
      source_file="$2"
      shift 2
      ;;
    -d)
      destination_directory="$2"
      shift 2
      ;;
    -t)
      start_timestamp="$2"
      end_timestamp="$3"
      shift 3
      ;;
    --audio)
      is_audio=true
      shift
      ;;
    --mp3)
      output_format="mp3"
      shift
      ;;
    --wav)
      output_format="wav"
      shift
      ;;
    --audio-only)
      is_audio_only=true
      shift
      ;;
    *)
      echo "Invalid option: $1"
      exit 1
      ;;
  esac
done

# Set default source directory to current working directory if not provided
if [ -z "$source_file" ]; then
  echo "Usage: clipit source_file -t start_timestamp end_timestamp [--audio] [--mp3|--wav] [--audio-only]"
  exit 1
fi

# Set default destination directory to source file directory if not provided
if [ -z "$destination_directory" ]; then
  destination_directory="$(dirname "$source_file")"
fi

# Get the base name of the source file
base_name=$(basename "$source_file")

# Extract the filename and extension
filename="${base_name%.*}"
extension="${base_name##*.}"

# Create the destination file name for audio-only clip
if [ "$is_audio_only" = true ]; then
  if [ -z "$output_format" ]; then
    destination_file="${destination_directory}/${filename}-clipped-audio-${start_timestamp}-${end_timestamp}.${extension}"
  else
    destination_file="${destination_directory}/${filename}-clipped-audio-${start_timestamp}-${end_timestamp}.${output_format}"
  fi
else
  destination_file="${destination_directory}/${filename}-clipped-${start_timestamp}-${end_timestamp}.${extension}"
fi

# Run ffmpeg command to create the clip
if [ "$is_audio_only" = true ]; then
  ffmpeg -i "$source_file" -ss "$start_timestamp" -to "$end_timestamp" -vn -c:a copy "$destination_file"
else
  ffmpeg -i "$source_file" -ss "$start_timestamp" -to "$end_timestamp" -c copy "$destination_file"
fi
