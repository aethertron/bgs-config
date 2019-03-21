argparse d/dryrun p/platform= q/quiet -- $argv
if not set -q _flag_platform
   set _flag_platform common
end
set platform $_flag_platform
echo $platform
if set -q _flag_quiet
    echo "Quiet option"
else
    echo "Verbose"
    set verbose '-v'
end
if set -q _flag_dryrun
    set dryrun True
    echo "Dryrun option"
end
# argparse done
if not contains $platform common manjaro-i3 centos7
    echo "Platform $platform not supported, exiting"
    exit
end
# destination
set dest dotfiles
if not test -d common
    echo "Common directory doesn't exist, exiting!"
    exit
end
# Run
echo "Generating dotfiles for platform $platform and placing in $dest"
# first find common files
set files (find common -type f | cut -d / -f2-)
for ff in (find $platform -type f | cut -d / -f2-)
    if not contains $ff $files
        set -a files $ff
    end
end
echo "Common files:"
printf " - %40s\t- %40s\n" $files
# create fresh destination files
echo "Writing to $dest"
# write directories
if not set -q dryrun
   echo "Create directories and files"
   rm -rf $dest
   mkdir -p $verbose (echo $dest/.$files | xargs dirname | sort -u)
   touch $dest/.$files
else
   echo "Not creating directories and files"
end
for ff in $files
    echo $ff:
    if test -f common/$ff
       printf "cat common/$ff  >> $dest/.$ff"
       if not set -q dryrun
           cat common/$ff >> $dest/.$ff
       end
    end
    if test $platform != common
       if test -f $platform/$ff
          printf "\tcat $platform/$ff >> $dest/.$ff"
          if not set -q dryrun
              cat  $platform/$ff >> $dest/.$ff
          end
       end
    end
    printf "\n"
end
