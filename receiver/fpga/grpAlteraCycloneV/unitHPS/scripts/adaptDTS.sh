#!/bin/bash

# update autogenerated chosen
# sopc2dts does not support stdoutpath
sed -i -E "s/(bootargs.+)\".*\"(.+)/\1\"$BOOTARGS\"\2/" ${OUTPUT_DTS}
sed -i -E "/(\}\; \/\/end chosen)/i \	\	stdout-path = \"$STDOUTPATH\";" ${OUTPUT_DTS}

# copy template
cp ./input/overlaytemplate.dtso ${OUTPUT_DTSO}

chmod 777 ${OUTPUT_DTSO}

# get peripherals inside bridge
PERIPHERALS="$(perl -0777 -ne 'print $1 if /(?:hps_0_bridges:)(?:.+?ranges.+?;)(.*?)(?:}; \/\/end bridge)/sp' "${OUTPUT_DTS}")"
echo "$PERIPHERALS" > ".tmp"

# fill template with peripherals
perl -i -p -e '$text=`cat .tmp`; s/INSERTIONMARK/$text/g' ${OUTPUT_DTSO}

# strip bridge peripherals
sed -i -E "/hps_0_bridges/,/\(hps_0_bridges\)/d" ${OUTPUT_DTS}

#https://lore.kernel.org/patchwork/patch/863149/
exec sed -E -i -e "s/@0x([0-9a-fA-F\.]+)\s?\{/@\L\1 \{/g" -e "s/@0+([0-9a-fA-F\.]+)\s?\{/@\L\1 \{/g" ${OUTPUT_DTSO}