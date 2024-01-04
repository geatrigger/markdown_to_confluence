#!/bin/bash
# file input
filename="$1"

# change bullet point
## print file
## \n\n- -> \n*
## \n\n* -> \n*
## \n\n``` -> \n```
## h4, h3, h2, h1
## (  *) -> ** (max ****)
cat $filename |
sed -e ':a' -e 'N' -e '$!ba' -E -e 's/\n+( *)-/\n\1\*/g' |
sed -e ':a' -e 'N' -e '$!ba' -E -e 's/\n+( *)\*/\n\1\*/g' |
sed -e ':a' -e 'N' -e '$!ba' -E -e 's/\n+( *)```/\n\1```/g' |
sed -E -e 's/^#### /h4. /g' |
sed -E -e 's/^### /h3. /g' |
sed -E -e 's/^## /h2. /g' |
sed -E -e 's/^# /h1. /g' |
sed -E -e 's/```$/\{code\}/g' |
sed -E -e 's/```([a-z]*)/\{code:\1\}/g' |
sed -E -e 's/^  \*/\*\*/g' |
sed -E -e 's/^  \*/\*\*/g' |
sed -E -e 's/^  \*/\*\*/g' |
sed -E -e 's/^  \*/\*\*/g' 

# 
