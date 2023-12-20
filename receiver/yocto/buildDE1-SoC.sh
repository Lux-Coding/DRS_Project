#!/usr/bin/env bash

ARGUMENT_IMAGE_ONLY="image"
ARGUMENT_SDK_ONLY="sdk"

RED='\033[0;31m'
YELLOW='\033[0;33m'
WHITE='\033[0;37m'
# TODO: Remove doubles
RequiredPackages=(gawk wget git diffstat unzip texinfo gcc build-essential chrpath socat cpio python python3 python3-pip python3-pexpect xz-utils debianutils iputils-ping python3-git python3-jinja2 libegl1-mesa libsdl1.2-dev pylint3 xterm python3-subunit mesa-common-dev gawk wget git-core diffstat unzip texinfo gcc-multilib build-essential chrpath socat cpio python3 python3-pip python3-pexpect xz-utils debianutils iputils-ping python3-git python3-jinja2 libegl1-mesa libsdl1.2-dev pylint3 xterm python3-subunit mesa-common-dev)

# Store location of this script
SCRIPTPATH="$( cd "$( dirname "$0" )" && pwd )"

IMAGENAME=core-image-drs

POKYDIR=$SCRIPTPATH/poky
LAYERDIR=$SCRIPTPATH/layer
METAALTERADIR=$LAYERDIR/meta-altera
METAOPENEMBEDDEDDIR=$LAYERDIR/meta-openembedded
METAMINGWDIR=$LAYERDIR/meta-mingw
BUILDDIR=$SCRIPTPATH/build
CONFDIR=$BUILDDIR/conf
WORKDIR=/work

# Print variables
echo "SCRIPTPATH ${SCRIPTPATH}"
echo "LAYERDIR ${LAYERDIR}"
echo "METAALTERADIR ${METAALTERADIR}"
echo "METAOPENEMBEDDEDDIR ${METAOPENEMBEDDEDDIR}"
echo "METAMINGWDIR ${METAMINGWDIR}"
echo "BUILDDIR ${BUILDDIR}"
echo "CONFDIR ${CONFDIR}"
echo "WORKDIR ${WORKDIR}"
echo "IMAGENAME ${IMAGENAME}"

# install required packages for building with yocto
echo -e "${WHITE}Install required packages for building with yocto..."

for i in ${RequiredPackages[@]}; do 
  sudo apt install $i
  if [[ $? > 0 ]]; then
    echo -e "${RED}Installation of $i failed"
    exit
  fi
done 

currentver="$(gcc -dumpversion)"
requiredver="10.3.0"
if [ "$(printf '%s\n' "${requiredver}" "${currentver}" | sort -V | head -n1)" != "${requiredver}" ]; then 
  echo ""
else
  echo -e "${YELLOW}WARNING: Using untested version of gcc with this yocto configuration. Could lead to failing builds!"
fi

# Clone Yocto Base and Meta Layers

if [ -d ${POKYDIR} ]; then 
  echo -e "${WHITE}Poky already cloned."
else
  echo -e "${WHITE}Cloning Poky into ${POKYDIR}."
  git clone git://git.yoctoproject.org/poky.git ${POKYDIR}
  cd ${POKYDIR}
  git checkout dbe19706ec01c1eaa1d377a792e7d825054050b0
fi

if [ -d ${METAALTERADIR} ]; then
  echo -e "${WHITE}meta-altera already cloned."
else
  echo -e "${WHITE}Cloning meta-altera into ${METAALTERADIR}."
  git clone https://github.com/kraj/meta-altera.git ${METAALTERADIR}
  cd ${METAALTERADIR}
  git checkout 237cd5ecd28491dbcff16d8d64662d3b56ac30df
fi

if [ -d ${METAOPENEMBEDDEDDIR} ]; then
  echo -e "${WHITE}meta-openembedded already cloned."
else 
  echo -e "${WHITE}Cloning meta-openembedded into ${METAOPENEMBEDDEDDIR}."
  git clone https://github.com/openembedded/meta-openembedded.git ${METAOPENEMBEDDEDDIR}
  cd ${METAOPENEMBEDDEDDIR}
  git checkout 9135c7ea7350d5d241f4afc3b28087122ebe2d19
fi

if [ -d ${METAMINGWDIR} ]; then
  echo -e "${WHITE}meta-mingw already cloned."
else 
  echo -e "${WHITE}Cloning meta-mingw into ${METAMINGWDIR}."
  git clone git://git.yoctoproject.org/meta-mingw.git ${METAMINGWDIR}
  cd ${METAMINGWDIR}
  git checkout 7bdc58e6c5d1054b1b6ad5c4e480a95e995ccbae
fi

# Source environment
echo -e "${WHITE}Init environment"
source ${POKYDIR}/oe-init-build-env ${BUILDDIR}

echo -e "${WHITE}Replace configuration files"
cd ${CONFDIR}
rm local.conf
cp ${SCRIPTPATH}/local.conf .

rm bblayers.conf
cp ${SCRIPTPATH}/bblayers.conf .

cd ${BUILDDIR}

# create /work folder and change permission for all users
sudo mkdir -p ${WORKDIR}
sudo chmod 777 ${WORKDIR}

echo -e "${WHITE}Build bootloader and rootfs"
bitbake virtual/bootloader

echo -e "${WHITE}Build kernel"
bitbake virtual/kernel

if ! [ "$1" = "$ARGUMENT_SDK_ONLY" ]; then
  echo -e "${WHITE}Start bitbaking image"
  bitbake ${IMAGENAME}
fi
                                   
if ! [ "$1" = "$ARGUMENT_IMAGE_ONLY" ]; then
  echo -e "${WHITE}Start building SDK"
  bitbake ${IMAGENAME} -c populate_sdk
fi

