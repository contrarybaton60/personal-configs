#!/bin/bash

# Personal install script for Linux Mint Debian Edition 6 "Faye".

# IMPORTANT create timeshift snapshot
sudo timeshift --create

# Remove installed Programs
sudo apt remove drawing hypnotix hexchat redshift breeze-icon-theme papirus-icon-theme numix-icon-theme breeze-cursor-theme libreoffice-base libreoffice-math thunderbird

# Update System
sudo apt update && sudo apt upgrade

# Install Programs from apt
sudo apt install nala virt-manager tlp tlp-rdw git mint-meta-codecs wbritish tor zsync

# bash alias stuff
echo 'apt() { 
  command nala "$@"
}
sudo() {
  if [ "$1" = "apt" ]; then
    shift
    command sudo nala "$@"
  else
    command sudo "$@"
  fi
}' >> .bashrc
echo 'alias topgrade="sudo apt upgrade && flatpak update && am update"' >> .bashrc
source .bashrc

# Download "mint-themes-vanessa" (https://codeberg.org/PeacefulWilliam/mint-themes-vanessa)
wget https://codeberg.org/PeacefulWilliam/mint-themes-vanessa/archive/main.zip
unzip main.zip
rm main.zip

# Install "AM" (https://github.com/ivan-hc/AM)
wget https://raw.githubusercontent.com/ivan-hc/AM/main/INSTALL
chmod a+x ./INSTALL
sudo ./INSTALL
am update
am install gimp-git prismlauncher vscodium lutris wine
am nolibfuse vscodium prismlauncher
rm INSTALL


# Backports Mint-Y icons to Mint-L, credit to Harry W. Haines III aka "Acheron"

#
# When this script has completed successfully there will be 2285 items in the
#  Mint-L/apps/XX folders and 2288 in the Mint-Y/apps/XX folders.  The
#  difference being three broken links in Mint-Y:
# 
# de.wolfvollprecht.UberWriter.png -> uberwriter.png :Dangling sysmlink
# org.gnome.Tetravex.png -> tetravex.png :Dangling sysmlink
# Uberwriter.png -> uberwriter.png :Dangling sysmlink
#
# Copy missing apps icons from Mint-Y to Mint-L icons.
#
#
# Get user's password for sudo.
sudo test
#
# Copy the missing files.
for APP in anydesk.png anydesk_beta.png citrix-workspace.png com.heroicgameslauncher.hgl.png dev.vencord.Vesktop.png f3d.png ferdium.png floorp.png gog.png helix.png io.gitlab.zehkira.Monophony.png jetbrains-goland.png jetbrains-phpstorm.png librewolf-beta.png librewolf.png neovim.png net.blockbench.Blockbench.png obsidian.png onlyoffice.png openspades.png parsec.png prusaslicer-gcodeviewer.png prusaslicer.png rambox-legacy.png revolt.png signal.png simplenote.png sublime_merge.png tunnelbear.png ulauncher.png us.zoom.Zoom.png vscodium-insiders.png vscodium.png web-deezer.png web-draw-io.png web-google-meet.png web-itch.png web-mastodon.png web-matrix.png web-mega.png web-penpot.png web-pixelfed.png web-pixiv.png web-proton-calendar.png web-proton-drive.png web-proton-mail.png web-proton.png web-rumble.png web-tidal.png web-twitch.png web-x.png
do 
  for SIZE in 16 16@2x 22 22@2x 24 24@2x 32 32@2x 48 48@2x 64 64@2x 96 96@2x 256 256@2x
    do 
      sudo cp -v /usr/share/icons/Mint-Y/apps/$SIZE/$APP /usr/share/icons/Mint-L/apps/$SIZE
    done
done
#
# Create the missing links.
#
echo " "
echo "System is busy creating symlinks.  If there is no output,"
echo "there are no errors being generated."
echo " "
#
for SIZE in 16 16@2x 22 22@2x 24 24@2x 32 32@2x 48 48@2x 64 64@2x 96 96@2x 256 256@2x
  do 
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/element.png /usr/share/icons/Mint-L/apps/$SIZE/Element-app.element.io.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/element.png /usr/share/icons/Mint-L/apps/$SIZE/Element-element.io.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/web-google-meet.png /usr/share/icons/Mint-L/apps/$SIZE/GoogleMeet-meet.google.com.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/parsec.png /usr/share/icons/Mint-L/apps/$SIZE/Parsec-parsec.app.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/parsec.png /usr/share/icons/Mint-L/apps/$SIZE/Parsec-web.parsec.app.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/web-pixiv.png /usr/share/icons/Mint-L/apps/$SIZE/Pixiv-pixiv.net.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/web-pixiv.png /usr/share/icons/Mint-L/apps/$SIZE/Pixiv-www.pixiv.net.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/web-proton.png /usr/share/icons/Mint-L/apps/$SIZE/Proton-proton.me.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/web-proton-calendar.png /usr/share/icons/Mint-L/apps/$SIZE/ProtonCalendar-calendar.proton.me.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/web-proton-drive.png /usr/share/icons/Mint-L/apps/$SIZE/ProtonDrive-drive.proton.me.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/web-proton-mail.png /usr/share/icons/Mint-L/apps/$SIZE/ProtonMail-mail.proton.me.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/revolt.png /usr/share/icons/Mint-L/apps/$SIZE/Revolt-app.revolt.chat.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/revolt.png /usr/share/icons/Mint-L/apps/$SIZE/Revolt-revolt.chat.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/revolt.png /usr/share/icons/Mint-L/apps/$SIZE/Revolt.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/web-twitch.png /usr/share/icons/Mint-L/apps/$SIZE/Twitch-twitch.tv.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/web-twitch.png /usr/share/icons/Mint-L/apps/$SIZE/Twitch.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/web-x.png /usr/share/icons/Mint-L/apps/$SIZE/X-x.com.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/gummi.png /usr/share/icons/Mint-L/apps/$SIZE/app.gummi.gummi.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/utilities-terminal.png /usr/share/icons/Mint-L/apps/$SIZE/br.app.pw3270.terminal.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/revolt.png /usr/share/icons/Mint-L/apps/$SIZE/chat.revolt.RevoltDesktop.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/abiword.png /usr/share/icons/Mint-L/apps/$SIZE/com.abisource.AbiWord.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/acroread.png /usr/share/icons/Mint-L/apps/$SIZE/com.adobe.Reader.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/anydesk.png /usr/share/icons/Mint-L/apps/$SIZE/com.anydesk.Anydesk.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/authy.png /usr/share/icons/Mint-L/apps/$SIZE/com.authy.Authy.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/gitkraken.png /usr/share/icons/Mint-L/apps/$SIZE/com.axosoft.GitKraken.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/calibre.png /usr/share/icons/Mint-L/apps/$SIZE/com.calibre_ebook.calibre.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/gnome-photos.png /usr/share/icons/Mint-L/apps/$SIZE/com.endlessm.photos.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/accessories-calculator.png /usr/share/icons/Mint-L/apps/$SIZE/com.expidusos.calculator.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/wine.png /usr/share/icons/Mint-L/apps/$SIZE/com.fightcade.Fightcade.Wine.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/notes.png /usr/share/icons/Mint-L/apps/$SIZE/com.github.alexkdeveloper.notepad.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/gnome-sound-recorder.png /usr/share/icons/Mint-L/apps/$SIZE/com.github.alexkdeveloper.recorder.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/sudoku.png /usr/share/icons/Mint-L/apps/$SIZE/com.github.alexkdeveloper.sudoku.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/gnome-weather.png /usr/share/icons/Mint-L/apps/$SIZE/com.github.bitseater.weather.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/web-whatsapp.png /usr/share/icons/Mint-L/apps/$SIZE/com.github.eneshecan.WhatsAppForLinux.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/gnome-books.png /usr/share/icons/Mint-L/apps/$SIZE/com.github.johnfactotum.Foliate.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/gnome-break-timer.png /usr/share/icons/Mint-L/apps/$SIZE/com.github.vikdevelop.timer.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/haguichi.png /usr/share/icons/Mint-L/apps/$SIZE/com.github.ztefn.haguichi.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/cutecom.png /usr/share/icons/Mint-L/apps/$SIZE/com.gitlab.cutecom.cutecom.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/clamav.png /usr/share/icons/Mint-L/apps/$SIZE/com.gitlab.davem.ClamTk.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/google-chrome.png /usr/share/icons/Mint-L/apps/$SIZE/com.google.Chrome.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/helix.png /usr/share/icons/Mint-L/apps/$SIZE/com.helix_editor.Helix.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/jetbrains-goland.png /usr/share/icons/Mint-L/apps/$SIZE/com.jetbrains.GoLand.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/jetbrains-phpstorm.png /usr/share/icons/Mint-L/apps/$SIZE/com.jetbrains.PhpStorm.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/jetbrains-rubymine.png /usr/share/icons/Mint-L/apps/$SIZE/com.jetbrains.RubyMine.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/jetbrains-webstorm.png /usr/share/icons/Mint-L/apps/$SIZE/com.jetbrains.WebStorm.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/web-draw-io.png /usr/share/icons/Mint-L/apps/$SIZE/com.jgraph.drawio.desktop.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/flash.png /usr/share/icons/Mint-L/apps/$SIZE/com.jpexs.decompiler.flash.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/f3d.png /usr/share/icons/Mint-L/apps/$SIZE/com.kitware.F3D.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/web-whatsapp.png /usr/share/icons/Mint-L/apps/$SIZE/com.ktechpit.whatsie.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/franz.png /usr/share/icons/Mint-L/apps/$SIZE/com.meetfranz.Franz.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/minecraft.png /usr/share/icons/Mint-L/apps/$SIZE/com.mojang.Minecraft.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/notepadqq.png /usr/share/icons/Mint-L/apps/$SIZE/com.notepadqq.Notepadqq.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/opera.png /usr/share/icons/Mint-L/apps/$SIZE/com.opera.Opera.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/prusaslicer-gcodeviewer.png /usr/share/icons/Mint-L/apps/$SIZE/com.prusa3d.PrusaSlicer.GCodeViewer.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/prusaslicer.png /usr/share/icons/Mint-L/apps/$SIZE/com.prusa3d.PrusaSlicer.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/rawtherapee.png /usr/share/icons/Mint-L/apps/$SIZE/com.rawtherapee.RawTherapee.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/sigil.png /usr/share/icons/Mint-L/apps/$SIZE/com.sigil_ebook.Sigil.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/simplenote.png /usr/share/icons/Mint-L/apps/$SIZE/com.simplenote.Simplenote.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/smartgit.png /usr/share/icons/Mint-L/apps/$SIZE/com.syntevo.SmartGit.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/teamspeak.png /usr/share/icons/Mint-L/apps/$SIZE/com.teamspeak.TeamSpeak.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/uget.png /usr/share/icons/Mint-L/apps/$SIZE/com.ugetdm.uGet.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/visual-studio-code.png /usr/share/icons/Mint-L/apps/$SIZE/com.visualstudio.code.insiders.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/vivaldi.png /usr/share/icons/Mint-L/apps/$SIZE/com.vivaldi.Vivaldi.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/vscodium.png /usr/share/icons/Mint-L/apps/$SIZE/com.vscodium.codium.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/jetbrains-goland.png /usr/share/icons/Mint-L/apps/$SIZE/goland.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/pidgin.png /usr/share/icons/Mint-L/apps/$SIZE/im.pidgin.Pidgin.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/element.png /usr/share/icons/Mint-L/apps/$SIZE/im.riot.Riot.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/mumble.png /usr/share/icons/Mint-L/apps/$SIZE/info.mumble.Mumble.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/brackets.png /usr/share/icons/Mint-L/apps/$SIZE/io.brackets.Brackets.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/franz.png /usr/share/icons/Mint-L/apps/$SIZE/io.defn.Franz.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/fontforge.png /usr/share/icons/Mint-L/apps/$SIZE/io.github.Fontforge.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/mpv.png /usr/share/icons/Mint-L/apps/$SIZE/io.github.GnomeMpv.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/accessories-calculator.png /usr/share/icons/Mint-L/apps/$SIZE/io.github.alexkdeveloper.calculator.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/gnome-weather.png /usr/share/icons/Mint-L/apps/$SIZE/io.github.amit9838.weather.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/f3d.png /usr/share/icons/Mint-L/apps/$SIZE/io.github.f3d_app.f3d.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/gtkwave.png /usr/share/icons/Mint-L/apps/$SIZE/io.github.gtkwave.GTKWave.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/lightzone.png /usr/share/icons/Mint-L/apps/$SIZE/io.github.ktgw03$SIZE.LightZone.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/whatsapp.png /usr/share/icons/Mint-L/apps/$SIZE/io.github.mimbrero.WhatsAppDesktop.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/notes.png /usr/share/icons/Mint-L/apps/$SIZE/io.github.nuttyartist.notes.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/pragha.png /usr/share/icons/Mint-L/apps/$SIZE/io.github.pragha_music_player.pragha.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/solaar.png /usr/share/icons/Mint-L/apps/$SIZE/io.github.pwr_solaar.solaar.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/exfalso.png /usr/share/icons/Mint-L/apps/$SIZE/io.github.quodlibet.ExFalso.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/quodlibet.png /usr/share/icons/Mint-L/apps/$SIZE/io.github.quodlibet.QuodLibet.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/muon.png /usr/share/icons/Mint-L/apps/$SIZE/io.github.subhra74.Muon.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/utilities-terminal.png /usr/share/icons/Mint-L/apps/$SIZE/io.github.tofudd.lanchat.terminal.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/zsnes.png /usr/share/icons/Mint-L/apps/$SIZE/io.github.xyproto.zsnes.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/librewolf.png /usr/share/icons/Mint-L/apps/$SIZE/io.gitlab.librewolf-community.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/ms-word.png /usr/share/icons/Mint-L/apps/$SIZE/io.gitlab.o20.word.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/web-itch.png /usr/share/icons/Mint-L/apps/$SIZE/io.itch.itch.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/accessories-calculator.png /usr/share/icons/Mint-L/apps/$SIZE/io.liri.Calculator.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/gaupol.png /usr/share/icons/Mint-L/apps/$SIZE/io.otsaloma.gaupol.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/designer.png /usr/share/icons/Mint-L/apps/$SIZE/io.qt.Designer.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/linguist.png /usr/share/icons/Mint-L/apps/$SIZE/io.qt.Linguist.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/QtProject-qtcreator.png /usr/share/icons/Mint-L/apps/$SIZE/io.qt.QtCreator.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/openspades.png /usr/share/icons/Mint-L/apps/$SIZE/jp.yvt.OpenSpades.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/remote-desktop.png /usr/share/icons/Mint-L/apps/$SIZE/krdc.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/obsidian.png /usr/share/icons/Mint-L/apps/$SIZE/md.obsidian.Obsidian.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/retext.png /usr/share/icons/Mint-L/apps/$SIZE/me.mitya57.ReText.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/anki.png /usr/share/icons/Mint-L/apps/$SIZE/net.ankiweb.Anki.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/filebot.png /usr/share/icons/Mint-L/apps/$SIZE/net.filebot.FileBot.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/cherrytree.png /usr/share/icons/Mint-L/apps/$SIZE/net.giuspen.cherrytree.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/amd.png /usr/share/icons/Mint-L/apps/$SIZE/net.mkiol.SpeechNote.Addon.amd.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/puddletag.png /usr/share/icons/Mint-L/apps/$SIZE/net.puddletag.puddletag.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/redeclipse.png /usr/share/icons/Mint-L/apps/$SIZE/net.redeclipse.RedEclipse.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/scribus.png /usr/share/icons/Mint-L/apps/$SIZE/net.scribus.Scribus.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/hugin.png /usr/share/icons/Mint-L/apps/$SIZE/net.sourceforge.Hugin.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/xournal.png /usr/share/icons/Mint-L/apps/$SIZE/net.sourceforge.xournal.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/warsow.png /usr/share/icons/Mint-L/apps/$SIZE/net.warsow.Warsow.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/texmaker.png /usr/share/icons/Mint-L/apps/$SIZE/net.xm1math.Texmaker.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/xmind.png /usr/share/icons/Mint-L/apps/$SIZE/net.xmind.XMind.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/mega.png /usr/share/icons/Mint-L/apps/$SIZE/nz.mega.MEGAsync.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/floorp.png /usr/share/icons/Mint-L/apps/$SIZE/one.ablaze.floorp.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/netbeans.png /usr/share/icons/Mint-L/apps/$SIZE/org.apache.netbeans.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/audacious.png /usr/share/icons/Mint-L/apps/$SIZE/org.atheme.audacious.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/bleachbit.png /usr/share/icons/Mint-L/apps/$SIZE/org.bleachbit.BleachBit.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/chromium.png /usr/share/icons/Mint-L/apps/$SIZE/org.chromium.Chromium.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/clementine.png /usr/share/icons/Mint-L/apps/$SIZE/org.clementine_player.Clementine.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/codeblocks.png /usr/share/icons/Mint-L/apps/$SIZE/org.codeblocks.codeblocks.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/deluge.png /usr/share/icons/Mint-L/apps/$SIZE/org.deluge_torrent.deluge.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/exaile.png /usr/share/icons/Mint-L/apps/$SIZE/org.exaile.Exaile.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/ferdium.png /usr/share/icons/Mint-L/apps/$SIZE/org.ferdium.Ferdium.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/fontforge.png /usr/share/icons/Mint-L/apps/$SIZE/org.fontforge.FontForge.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/gajim.png /usr/share/icons/Mint-L/apps/$SIZE/org.gajim.Gajim.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/gmusicbrowser.png /usr/share/icons/Mint-L/apps/$SIZE/org.gmusicbrowser.gmusicbrowser.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/boxes.png /usr/share/icons/Mint-L/apps/$SIZE/org.gnome.Boxes.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/brasero.png /usr/share/icons/Mint-L/apps/$SIZE/org.gnome.Brasero.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/chess.png /usr/share/icons/Mint-L/apps/$SIZE/org.gnome.Chess.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/easytag.png /usr/share/icons/Mint-L/apps/$SIZE/org.gnome.EasyTAG.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/extensions.png /usr/share/icons/Mint-L/apps/$SIZE/org.gnome.Extensions.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/ghex.png /usr/share/icons/Mint-L/apps/$SIZE/org.gnome.GHex.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/gtg.png /usr/share/icons/Mint-L/apps/$SIZE/org.gnome.GTG.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/hamster.png /usr/share/icons/Mint-L/apps/$SIZE/org.gnome.Hamster.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/lightsoff.png /usr/share/icons/Mint-L/apps/$SIZE/org.gnome.LightsOff.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/mahjongg.png /usr/share/icons/Mint-L/apps/$SIZE/org.gnome.Mahjongg.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/gnome-nibbles.png /usr/share/icons/Mint-L/apps/$SIZE/org.gnome.Nibbles.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/notes.png /usr/share/icons/Mint-L/apps/$SIZE/org.gnome.Notes.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/gnome-quadrapassel.png /usr/share/icons/Mint-L/apps/$SIZE/org.gnome.Quadrapassel.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/gnome-robots.png /usr/share/icons/Mint-L/apps/$SIZE/org.gnome.Robots.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/shotwell.png /usr/share/icons/Mint-L/apps/$SIZE/org.gnome.Shotwell.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/sudoku.png /usr/share/icons/Mint-L/apps/$SIZE/org.gnome.Sudoku.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/gnome-tali.png /usr/share/icons/Mint-L/apps/$SIZE/org.gnome.Tali.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/gthumb.png /usr/share/icons/Mint-L/apps/$SIZE/org.gnome.gThumb.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/gnome-tweak-tool.png /usr/share/icons/Mint-L/apps/$SIZE/org.gnome.tweaks.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/emacs.png /usr/share/icons/Mint-L/apps/$SIZE/org.gnu.emacs.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/gnumeric.png /usr/share/icons/Mint-L/apps/$SIZE/org.gnumeric.Gnumeric.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/gpodder.png /usr/share/icons/Mint-L/apps/$SIZE/org.gpodder.gpodder.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/gramps.png /usr/share/icons/Mint-L/apps/$SIZE/org.gramps_project.Gramps.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/gtkhash.png /usr/share/icons/Mint-L/apps/$SIZE/org.gtkhash.gtkhash.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/hydrogen.png /usr/share/icons/Mint-L/apps/$SIZE/org.hydrogenmusic.Hydrogen.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/jabref.png /usr/share/icons/Mint-L/apps/$SIZE/org.jabref.jabref.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/amarok.png /usr/share/icons/Mint-L/apps/$SIZE/org.kde.amarok.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/kile.png /usr/share/icons/Mint-L/apps/$SIZE/org.kde.kile.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/kmymoney.png /usr/share/icons/Mint-L/apps/$SIZE/org.kde.kmymoney.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/konversation.png /usr/share/icons/Mint-L/apps/$SIZE/org.kde.konversation.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/kopete.png /usr/share/icons/Mint-L/apps/$SIZE/org.kde.kopete.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/kpat.png /usr/share/icons/Mint-L/apps/$SIZE/org.kde.kpat.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/remote-desktop.png /usr/share/icons/Mint-L/apps/$SIZE/org.kde.krdc.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/ktorrent.png /usr/share/icons/Mint-L/apps/$SIZE/org.kde.ktorrent.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/okteta.png /usr/share/icons/Mint-L/apps/$SIZE/org.kde.okteta.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/okular.png /usr/share/icons/Mint-L/apps/$SIZE/org.kde.okular.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/pix.png /usr/share/icons/Mint-L/apps/$SIZE/org.kde.pix.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/yakuake.png /usr/share/icons/Mint-L/apps/$SIZE/org.kde.yakuake.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/leocad.png /usr/share/icons/Mint-L/apps/$SIZE/org.leocad.LeoCAD.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/librecad.png /usr/share/icons/Mint-L/apps/$SIZE/org.librecad.librecad.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/lyx.png /usr/share/icons/Mint-L/apps/$SIZE/org.lyx.LyX.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/manaplus.png /usr/share/icons/Mint-L/apps/$SIZE/org.manaplus.ManaPlus.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/midori.png /usr/share/icons/Mint-L/apps/$SIZE/org.midori_browser.Midori.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/mixxx.png /usr/share/icons/Mint-L/apps/$SIZE/org.mixxx.Mixxx.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/nicotine.png /usr/share/icons/Mint-L/apps/$SIZE/org.nicotine_plus.Nicotine.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/zenmap.png /usr/share/icons/Mint-L/apps/$SIZE/org.nmap.Zenmap.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/onlyoffice.png /usr/share/icons/Mint-L/apps/$SIZE/org.onlyoffice.desktopeditors.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/openshot.png /usr/share/icons/Mint-L/apps/$SIZE/org.openshot.OpenShot.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/openttd.png /usr/share/icons/Mint-L/apps/$SIZE/org.openttd.OpenTTD.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/playonlinux.png /usr/share/icons/Mint-L/apps/$SIZE/org.phoenicis.playonlinux.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/drracket.png /usr/share/icons/Mint-L/apps/$SIZE/org.racket_lang.DrRacket.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/qsynth.png /usr/share/icons/Mint-L/apps/$SIZE/org.rncbc.qsynth.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/scilab.png /usr/share/icons/Mint-L/apps/$SIZE/org.scilab.Scilab.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/sqlitebrowser.png /usr/share/icons/Mint-L/apps/$SIZE/org.sqlitebrowser.sqlitebrowser.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/stellarium.png /usr/share/icons/Mint-L/apps/$SIZE/org.stellarium.Stellarium.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/chess.png /usr/share/icons/Mint-L/apps/$SIZE/org.sugarlabs.Chess.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/texstudio.png /usr/share/icons/Mint-L/apps/$SIZE/org.texstudio.TeXstudio.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/texworks.png /usr/share/icons/Mint-L/apps/$SIZE/org.tug.texworks.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/wesnoth.png /usr/share/icons/Mint-L/apps/$SIZE/org.wesnoth.Wesnoth.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/wine.png /usr/share/icons/Mint-L/apps/$SIZE/org.winehq.Wine.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/wireshark.png /usr/share/icons/Mint-L/apps/$SIZE/org.wireshark.Wireshark.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/wxHexEditor.png /usr/share/icons/Mint-L/apps/$SIZE/org.wxhexeditor.wxHexEditor.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/warpinator.png /usr/share/icons/Mint-L/apps/$SIZE/org.x.Warpinator.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/xiphos.png /usr/share/icons/Mint-L/apps/$SIZE/org.xiphos.Xiphos.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/xonotic.png /usr/share/icons/Mint-L/apps/$SIZE/org.xonotic.Xonotic.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/zim.png /usr/share/icons/Mint-L/apps/$SIZE/org.zim_wiki.Zim.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/parsec.png /usr/share/icons/Mint-L/apps/$SIZE/parsecd.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/prusaslicer.png /usr/share/icons/Mint-L/apps/$SIZE/prusa-slicer.png 
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/utilities-system-monitor.png  /usr/share/icons/Mint-L/apps/$SIZE/ro.fxdata.taskmonitor.viewer.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/web-duolingo.png /usr/share/icons/Mint-L/apps/$SIZE/ro.go.hmlendea.DL-Desktop.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/signal.png /usr/share/icons/Mint-L/apps/$SIZE/signal-desktop.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/sublime_merge.png /usr/share/icons/Mint-L/apps/$SIZE/sublime-merge.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/web-telegram.png /usr/share/icons/Mint-L/apps/$SIZE/telegram-desktop.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/putty.png /usr/share/icons/Mint-L/apps/$SIZE/uk.org.greenend.chiark.sgtatham.putty.png
    sudo ln -s /usr/share/icons/Mint-L/apps/$SIZE/web-x.png /usr/share/icons/Mint-L/apps/$SIZE/x.png
done
#
sudo gtk-update-icon-cache /usr/share/icons/Mint-L
echo " "
echo "Script has completed"