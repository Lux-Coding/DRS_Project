# README

Das Yocto-Image basiert auf dem DE1-SoC-Yocto von SSL.
Es wurde allerdings auf die etwas neuere Yocto-Version 3.1 (dunfell) angepasst.
Ausgelegt und getestet für die Verwendung unter Ubuntu 20.04 LTS (funktioniert mit WSL2).

## Features

- Kernel 4.14 (rel_socfpga-4.14.126-ltsi-rt_19.08.02_pr) mit angwewandtem PREEMPT_RT-Patch (grundsätzlich von SSL, aber etwas neuere Kernelversion). Das ist die letzte fertig verfügbare Version von linux-socfpga mit angewandtem RT-Patch. Bei neueren Versionen müsste der RT-Patch händisch angewandt werden.
- gcc 9.5.0
- Python 3.8.18
- Webinterface und Service zum Konfigurieren und Debuggen von FPGAs (von SSL)
- linuxptp (ältere Version 2.0.1 da fertiges Yocto-Recipe, 4.0 ist aktuell) mit Anwendungen ptp4l, phc2sys, pmc, ... für Hardware- und Software-PTP
- apt Paketmanager (von SSL) - nicht in Verwendung

## Dateien im Verzeichnis

### buildDE1-SoC.sh

- Skript zur Automatisierung des Image-Builds für das DE1-SoC.
- Ausgelegt für Ubuntu 20.04 LTS.

1. Installieren der Pakete in Ubuntu, die für den Yocto-Build notwendig sind.
2. Clonen von Poky für dunfell.
3. Clonen des meta-altera-Layers für dunfell.
4. Clonen des meta-openembedded-Layers für dunfell.
5. Clonen des meta-mingw-Layers für dunfell.
6. Sourcen des build-environments
7. Ersetzen der Konfigurationsdateien bblayers.conf und local.conf in ./build/conf/ durch die beiden Dateien aus diesem Verzeichnis.
8. Erstellen des /work-Ordners und Setzen der notwendigen Berechtigungen.
9. Erstellen von Image und/oder SDK.

- Argumente:

1. "image", um nur das Image zu erstellen, oder "sdk", um nur das SDK zu erstellen.

### local.conf

- Konfigurationsdatei für den Yocto-Build
- Diese Datei bearbeiten, nicht die Version in ./build/conf/!
- Die Datei wird vom buildDE1-SoC.sh vor dem Build in den Ordner ./build/conf/ verschoben und überschreibt die Version dort.

### bblayers.conf

- Die verwendeten Layer sind (anders als in der Datei üblich) über relative Pfade angegeben. Somit funktioniert der Build unabhängig vom Ordner, in dem das repo geclont wurde.
- Diese Datei bearbeiten, nicht die Version in ./build/conf/!
- Die Datei wird vom buildDE1-SoC.sh vor dem Build in den Ordner ./build/conf/ verschoben und überschreibt die Version dort.

### layer/meta-application/

- Enthält die vom SSL-DE1-SoC-Yocto übernommenen und teilweise angepassten Rezepte und neue Rezepte für DRS.

### environmentinit

- Zum sourcen des Build-Environments, wenn das buildDE1-SoC.sh-Skript nicht verwendet wird. Achtung: Vor/Nach dem sourcen keine weiteren Operationen, weitere Schritte aus dem buildDE1-SoC.sh-Skript müssen falls notwendig händisch gemacht werden.

## Ergebnis:

### Image

Interessant ist die erstellte Image-Datei core-image-drs-cyclone5-{Zeit+Datum}.rootfs.wic unter /work/tmp/deploy/images/cyclone5.
Das Image kann mit zum Beispiel Win32DiskImager (Windows) auf eine SD-Karte für das DE1-SoC geschrieben werden.
