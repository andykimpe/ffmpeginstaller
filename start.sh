#!/bin/bash
#FFMPEG installation script

#  Copyright (C) 2007-2014 Sherin.co.in. All rights reserved.
#
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
RED='\033[01;31m'
RESET='\033[0m'
INSTALL_SDIR='/usr/src/ffmpegscript'
SOURCE_URL='http://mirror.ffmpeginstaller.com/source'
INSTALL_DDIR='/usr/local/cpffmpeg'
export cpu=`cat "/proc/cpuinfo" | grep "processor"|wc -l`
export TMPDIR=$HOME/tmp
export LD_LIBRARY_PATH=/usr/local/cpffmpeg/lib:/usr/local/lib:/usr/lib:$LD_LIBRARY_PATH
export LIBRARY_PATH=/usr/local/cpffmpeg/lib:/usr/lib:/usr/local/lib:$LIBRARY_PATH
export CPATH=/usr/local/cpffmpeg/include:/usr/include/:usr/local/include:$CPATH
#presetup
sh presetup.sh

if [ -e "/etc/yum.conf" ];then
        echo "Ensuring required RPM ........"
        yum install gcc gcc-c++ libgcc gd gd-devel gettext freetype \
        	freetype-devel ImageMagick ImageMagick-devel libjpeg* libjpeg-devel* \
        	libpng* libpng-devel* libstdc++* libstdc++-devel* libtiff* \
        	libtiff-devel* libtool*  libxml* libxml2* \
        	libxml2-devel* zlib* zlib-devel* automake* autoconf* samba-common* \
		ncurses-devel ncurses patch make apr-util giflib-devel giflib neon expat expat-devel alsa-lib -y
	rpm -e alsa-lib --nodeps
	export ARCH=$(arch)
fi

if [ -e "/etc/csf/csf.conf" ];then
	csf -x
fi


if [ -e "/etc/debian_version" ];then
	echo "Ensuring Debian packages ....."
	apt-get install gcc libgd-dev gettext libfreetype6 libfreetype6-dev libpng-dev libstdc++-dev \
		libtiff-dev libtool libxml2 libxml2-dev automake autoconf libncurses-dev ncurses-dev patch \
		make git subversion -y
fi

if [ "$(uname -o)" == "Cygwin" ]
then
echo "beta os windows cygwin no root required"
if [ -f /usr/bin/wget.exe ]
then
echo "install apt-cyg"
lynx -source rawgit.com/transcode-open/apt-cyg/master/apt-cyg > apt-cyg
install apt-cyg /bin
rm -rf apt-cyg
echo "install required package"
apt-cyg update
apt-cyg install make
apt-cyg install automake
apt-cyg install autoconf
apt-cyg install gcc-core
apt-cyg install gcc-g++
apt-cyg install libfreetype-devel
apt-cyg install libtool
apt-cyg install pkg-config
apt-cyg install texinfo
apt-cyg install zlib-devel
apt-cyg install cmake
apt-cyg install mercurial
apt-cyg install nasm
apt-cyg install git
apt-cyg install gcc-mingw
apt-cyg install mingw64-$(uname -m)-gcc-core
apt-cyg install mingw64-$(uname -m)-gcc-g++
apt-cyg install gdb
apt-cyg install gettext
apt-cyg install gettext-devel
apt-cyg install libgcrypt-devel
apt-cyg install libiconv
apt-cyg install mingw64-$(uname -m)-runtime
apt-cyg install patchutils
apt-cyg install expat
apt-cyg install libgd-devel
apt-cyg install mingw64-$(uname -m)-libgd
apt-cyg install cygwin-devel
apt-cyg install libpng-devel
apt-cyg install mingw64-$(uname -m)-libpng
apt-cyg install libstdc++6
apt-cyg install libtiff-devel
apt-cyg install libxml2-devel
apt-cyg install mingw64-$(uname -m)-libxml2
apt-cyg install libncurses-devel
apt-cyg install mingw64-$(uname -m)-ncurses
apt-cyg install subversion
else
echo "wget required please start cygwin installers install wget and restart ffmpeginstaller"
fi
fi

#Git client
sh git.sh

if [ -e "/usr/bin/git" ]; then
        echo " "
else
        echo " "
        echo " "
        echo -e $RED"   Git client  installation Failed. Git is required for ffmpeg and mplayer . Please install it and run this script"$RESET
        echo " "
        echo " "
        exit
fi 

#Subversion client
mkdir -pv /usr/local/cpffmpeg/bin/
sh subversion.sh

if [ -e "/usr/local/cpffmpeg/bin/svn" ]; then
        echo " "
else
        echo " "
        echo " "
        echo -e $RED"   Svn  client  installation Failed.Svn  is required for mplayer . Please install it and run this script"$RESET
        echo " "
        echo " "
        exit
fi 



#free type
sh freetype.sh
#libwmf
sh libwmf.sh
#ruby
sh ruby.sh
#flvtool
sh flvtool.sh
#lame
sh lame.sh
#codecs
sh codecs.sh
#libogg
sh libogg.sh
#libvorbis
sh libvorbis.sh
#vorbistools
sh vorbistools.sh
#libtheora
sh libtheora.sh
#fdk-aac
sh fdkaac.sh
# voaacenc
sh voaacenc.sh
# voamrwbenc
sh voamrwbenc.sh
# libspeex
sh libspeex.sh
# libflac
sh libflac.sh
# libao
sh libao.sh
# uriparser
sh uriparser.sh
# libxspf
#sh libxspf.sh
# liboggz
sh liboggz.sh
# libfishsound
#sh libfishsound.sh
# yamdi
sh yamdi.sh
#amrnb
sh amrnb.sh
#amrwb
sh amrwb.sh
#openamr
sh libopencoreamr.sh
#liba52
sh liba52.sh
#facc
sh facc.sh
#faad2
sh faad2.sh
#yasm
sh yasm.sh
#nasm
sh nasm.sh
#xvid
sh xvid.sh
#x264
sh x264.sh
#re2c
sh re2c.sh
#Mplayer
sh mplayer.sh
if [ -e "/usr/local/cpffmpeg/bin/mplayer" ]; then
        echo " "
else
        echo " "
        echo " "
        echo -e $RED"   Mplayer installation Failed :( ,  please contact  professional support sales@syslint.com"$RESET
        echo " "
        echo " "
        exit
fi

#ffmpeg
sh ffmpeg.sh
if [ -e "/usr/local/cpffmpeg/bin/ffmpeg" ]; then
        echo " "
else
        echo " "
        echo " "
        echo -e $RED"   FFMPEG installation Failed :( ,  please contact  professional support sales@syslint.com"$RESET
        echo " "
        echo " "
        exit
fi

# preset 
sh preset.sh
#Rebuilding Mplayer
sh mplayer.sh
if [ -e "/usr/local/cpffmpeg/bin/mplayer" ]; then
        echo " "
else
        echo " "
        echo " "
        echo -e $RED"   Mplayer installation Failed :( , please contact  professional support sales@syslint.com"$RESET
        echo " "
        echo " "
        exit
fi
#Mp4Boxh
sh mp4box.sh
#post
sh post.sh

