echo "WARNING: hard coded to size of lattice!"

# Sensible Linux
if [[ `uname` == 'Linux' ]]; then
    INKSCAPE="inkscape"
else
# MAC OS X
    INKSCAPE="/Applications/Inkscape.app/Contents/Resources/script"
fi

PWD=` pwd `

#LATTICE=25

LATTICE=$(grep "#define X" starrynight.c | awk '{print $3}') #Madness or genius? I can't tell.
echo "Lattice: ${LATTICE}"

PIXELS=1000

for i 
do
 ${INKSCAPE} --export-area=0:0:${LATTICE}:${LATTICE}    \
 --export-png=${PWD}/${i%.*}.png  \
 --export-width=${PIXELS}                \
 --export-height=${PIXELS} ${PWD}/${i} 
done
