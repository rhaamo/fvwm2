#!/bin/sh
export startdir="../fvwm+"

if [ "$1" = "install" ]; then
    cd fvwm-2.6.5
    make DESTDIR=/ install
    install -d "/usr/share/doc/fvwm"
    install -D -m644 sample.fvwmrc/{decor_examples,DecorMwm,DecorWin95,new-features,system.*} "/usr/share/doc/fvwm"
    install -D -m644 $startdir/fvwm+.desktop "/usr/share/xsessions/fvwm+.desktop"
    install -D -m644 COPYING "/usr/share/licenses/fvwm/COPYING"
    exit
fi

wget --quiet -c ftp://ftp.fvwm.org/pub/fvwm/version-2/fvwm-2.6.5.tar.gz
wget --quiet -c https://aur.archlinux.org/packages/fv/fvwm+/fvwm+.tar.gz

rm -rf fvwm+ fvwm-2.6.5

tar xf fvwm-2.6.5.tar.gz
tar xf fvwm+.tar.gz

cd fvwm-2.6.5

#Patch configure.ac and makefile.am files
echo "** Patch configure.ac file and makefile.am files **"
patch -p0 < $startdir/configure.ac-makefile.am.patch || return 1

# Enables real transparency on menus
echo "** Applying Translucent menus patch **"
patch -p0 < $startdir/01-TranslucentMenus.patch || return 1

# Enables different colours on window's borders
echo "** Applying ColourBorders patch **"
patch -p0 < $startdir/02-ColourBorders.patch || return 1

# Enables a single piwel rectangle when resizing
echo "** Applying Resize Outline Thin patch **"
patch -p0 < $startdir/03-ResizeOutlineThin.patch || return 1

# Enables other conditions for windows :)
echo "** Applying Conditional patch **"
patch -p0 < $startdir/04-Conditionals.patch || return 1

# Enables the use of Flat Separators (single pixel separator)
echo "** Applying flat separators patch **"
patch -p0 < $startdir/05-FlatSeparators.patch || return 1

# Adds a border under the titlebar
echo "** Applying border under titlebar patch **"
patch -p0 < $startdir/06-BorderUnderTitle.patch || return 1

# Ena1bles the use of a different font for Inactive windows
echo "** Applying inactive fonts patch **"
patch -p0 < $startdir/07-InactiveFont.patch || return 1

# A mix of FluxboxHandles and RoundedCorners
# you can't activate both on the same window
# Add corners in fluxbox style
# or add rounded corners
echo "** Applying FluxRounded Corners patch **"
patch -p0 < $startdir/08-FluxRoundedCorners.patch || return 1

# Sets the top border to a single pixel
echo "** Applying Top Border patch **"
patch -p0 < $startdir/09-TopBorder.patch || return 1

# Sets the width of the title buttons
echo "** Applying Button Width patch **"
patch -p0 < $startdir/10-ButtonWidth.patch || return 1

# Enables the use of 8 pixmaps for each borders
echo "** Applying Multiborder patch **"
patch -p0 < $startdir/11-MultiBorder.patch || return 1

# Enables the uses of tips on FvwmButtons
echo "** Applying FvwmButtonTips patch **"
patch -p0 < $startdir/12-FvwmButtonsTips.patch || return 1

# Enables rounded corners on FvwmIconMan
echo "** Applying FvwmIconMan patch **"
patch -p0 < $startdir/13-FvwmIconMan.patch || return 1

# Allows you to specify button pixmaps that will be shown when you move the mouse over the buttons
echo "** Applying Hover patch **"
patch -p0 < $startdir/14-Hover.patch || return 1

# Menus with titles are opened so that the first item is under the pointer without warping
echo "** Applying First Item Under Pointer patch **"
patch -p0 < $startdir/15-FirstItemUnderPointer.patch || return 1

# The geometry window and proxy windows have a single pixel border
echo "** Applying ThinGeometry patch **"
patch -p0 < $startdir/16-ThinGeometryProxy.patch || return 1

./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib \
	--with-stroke-library  \
	--enable-perllib \
	--enable-xinerama \
	--enable-bidi \
	--enable-nls --enable-iconv \
	--enable-xft

make

echo "** You can now do \`sudo sh $0 install\`"

