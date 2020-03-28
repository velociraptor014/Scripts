#!/bin/sh

# Registering variables
VARIABLE0001=1
VARIABLE0002=2
VARIABLE0003=3
VARIABLE0004=4
VARIABLE0005=5
OUTOFRANGE=`echo "Out Of Range !"`
# ---------------------

# We will use variables for creating computing :

echo "$VARIABLE0001 + $VARIABLE0001 = $VARIABLE0002"
echo "$VARIABLE0002 + $VARIABLE0002 = $VARIABLE0004"
echo "$VARIABLE0004 + $VARIABLE0004 = $OUTOFRANGE"
echo "$VARIABLE0005 = $VARIABLE0005 after that, is $OUTOFRANGE"

# End
