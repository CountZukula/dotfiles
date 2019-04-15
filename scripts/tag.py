#!/bin/python
# need to this for command line parameters
import argparse
import sys
from pathlib import Path
import os.path

# defaults
HOME = str(Path.home())
TAG_PARENT_FOLDER = os.path.join(HOME, '.tag.py')

# check if the tag folder exists
if not os.path.isdir(TAG_PARENT_FOLDER):
    sys.exit("""Please make the ~/.tag.py/ folder to use this script.
    > mkdir ~/.tag.py""")

# caveat: tags are case insensitive
# possible usage for the tool:
# tag.py file1 tag1 tag2 tag3
# - this will create three links to file1 in the folders TAG_FOLDER/tag[1-3].
#       if the folders do not exist yet, they are created
# tag.py file1 tag1/tag2
# - this creates a tag FOLDER/tag1/tag2 for file1 -> hierarchy of tags is possible


# set up the arguments possible for the tagger
parser = argparse.ArgumentParser(description='''Add tags to the given files. 
Use hierarchical tags for added structure (tag1/tag2). All tags are saved in your HOME, default "~/.tag.py/"''')
# parser.add_argument('integers', metavar='N', type=int, nargs='+',
#                     help='an integer for the accumulator')
parser.add_argument('file', type=str, nargs='+')
parser.add_argument('-t', '--tag', dest='tag', help='tag(s) to be added to the given file(s)', nargs='+')
# parser.add_argument('--sum', dest='accumulate', action='store_const',
#                     const=sum, default=max,
#                     help='sum the integers (default: find the max)')

args = parser.parse_args()

# check if we have tags
if args.tag is None or not len(args.tag) > 0:
    sys.exit("At least one tag is expected, provide one with '-t sometag'")

# lower case all tags
args.tag = [item.lower() for item in args.tag]

# now go over the files and check that they're real and/or a directory
to_tag = []
for file in args.file:
    # print('file: ' + file)
    # it needs to exist...
    if not os.path.exists(file):
        sys.exit("file '" + file + "' does not exist.")
    # if it's a file, use it as such (it will be tagged)
    if os.path.isfile(file) or os.path.isdir(file):
        # if the file is absolute, just add it as is
        if os.path.isabs(file):
            to_tag.append(file)
        # if the file is relative, make sure we use the current working directory
        else:
            to_tag.append(os.path.join(os.getcwd(), file))
    # use this if the 'recursive flag' is set
    # TODO implement a recursive flag
    # # if it's a directory, use the contents of the directory
    # if os.path.isdir(file):
    #     for f in os.listdir(file):
    #         to_tag.append(f)
    # if it's a symlink, just produce a warning and do not process it
    if os.path.islink(file):
        print('Ignoring links for now ("' + file + '" is a link).')

# loop over the tags...
tag_count = 0
for tag in args.tag:
    # print('processing tag ' + tag)
    # assert the tag exists
    TAG_FOLDER = TAG_PARENT_FOLDER + "/" + tag
    # recursively make the folder if needed
    os.makedirs(TAG_FOLDER, exist_ok=True)
    # now create a link to the files in this new tag folder
    for file in to_tag:
        dest = os.path.join(TAG_FOLDER, os.path.basename(file))
        src = file
        if os.path.exists(dest):
            print('Not making link "' + dest + '", already exists.')
        else:
            os.symlink(src, dest, os.path.isdir(src))
            tag_count = tag_count + 1

# Finish it
print(str(tag_count) + ' files tagged.')
