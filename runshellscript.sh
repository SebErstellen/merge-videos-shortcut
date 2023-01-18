#! /bin/zsh

cd $(dirname $1)

touch list.txt

for arg in "$@"; do
  echo "file '$(basename "$arg")'" >> list.txt
done

file_name_without_extension=$(echo "$1" | cut -f 1 -d '.')
merged_file_name="$file_name_without_extension"_merged.$(echo "$1" | cut -f 2 -d '.')

/opt/homebrew/bin/ffmpeg -f concat -safe 0 -i list.txt -c copy $merged_file_name

rm list.txt

# for file in "$@"
# do
# rm "$file"
# echo "File $file deleted successfully."
# done
