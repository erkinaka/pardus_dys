echo "**** Bu script ERKİN AKA tarafından oluşturulmuştur. etebesir.com ****"
echo
echo "	DYS Ayarları Yapılıyor..."
echo "1. Java deployment.properties güncelleniyor."
kulad="$(whoami)"
/usr/lib/jvm/jdk-8-oracle-x64/bin/jcontrol
filename="/home/$kulad/.java/deployment/deployment.properties"
if test -e  $filename
then
	echo "deployment.security.use.user.home.java.policy=true" >>  "$filename"
    	mv "/home/$kulad/.java/deployment/deployment.properties" "/home/$kulad/.java/deployment/deployment.properties.tmp"
	touch "$filename"
	echo "deployment.security.use.user.home.java.policy=true" >> "$filename"
	cat "/home/$kulad/.java/deployment/deployment.properties.tmp" >> "$filename"
	
fi
echo "2. Java güvenlik ayarları (exception sites) güncelleniyor."
filename="/home/$kulad/.java/deployment/security/exception.sites"
if test -e  $filename
then
	echo "http://*.meb.gov.tr" >>  "$filename"
	echo "http://dys.meb.gov.tr" >>  "$filename"
	echo "http://dysegitim.meb.gov.tr" >>  "$filename"
	echo "http://dysdownload.meb.gov.tr" >>  "$filename"
	echo "https://dysdownload.meb.gov.tr" >>  "$filename"
	echo "https://dysegitim.meb.gov.tr" >>  "$filename"
	echo "https://dys.meb.gov.tr" >>  "$filename"
	echo "http://kamusm.gov.tr" >>  "$filename"
	echo "http://kbs.gov.tr" >>  "$filename"
	echo "http://reporteokul.meb.gov.tr" >>  "$filename"
	echo "https://aioraporlar.meb.gov.tr" >>  "$filename"
	echo "https://dys.meb.gov.tr" >>  "$filename"
	echo "https://dysdownload.meb.gov.tr" >>  "$filename"
	echo "https://dysegitim.meb.gov.tr" >>  "$filename"
	echo "https://giris.turkiye.gov.tr/Giris/" >>  "$filename"
	echo "https://javadl-esd-secure.oracle.com:443" >>  "$filename"
	echo "https://kesenek.sgk.gov.tr/KesenekWeb/" >>  "$filename"
	echo "https://nesbireysel.kamusm.gov.tr" >>  "$filename"
	echo "https://nesbireysel.kamusm.gov.tr/kart/sifre/Degistirme.go?AkisID=140" >>  "$filename"
	echo "https://nesbireysel.kamusm.gov.tr/nbimzali.go" >>  "$filename"
	echo "https://nesbireysel.kamusm.gov.tr:8080" >>  "$filename"
	echo "https://portal.kamusm.gov.tr/bp/eimzaligonder.go" >>  "$filename"
	echo "https://kesenek.sgk.gov.tr:443" >>  "$filename"
    	
else
	touch "$filename"
	echo "http://*.meb.gov.tr" >>  "$filename"
	echo "http://dys.meb.gov.tr" >>  "$filename"
	echo "http://dysegitim.meb.gov.tr" >>  "$filename"
	echo "http://dysdownload.meb.gov.tr" >>  "$filename"
	echo "https://dysdownload.meb.gov.tr" >>  "$filename"
	echo "https://dysegitim.meb.gov.tr" >>  "$filename"
	echo "https://dys.meb.gov.tr" >>  "$filename"  	
fi

echo "3. Host ayarları güncelleniyor."
sudo -ks << EOF
mv /etc/hosts /etc/hosts.tmp
touch /etc/hosts
echo '95.0.196.81    dys.meb.gov.tr' >> /etc/hosts
echo '95.0.196.79    dysdownload.meb.gov.tr' >> /etc/hosts
echo '95.0.196.80    dysegitim.meb.gov.tr' >> /etc/hosts
cat /etc/hosts.tmp >> /etc/hosts

echo "4. Uyap Editör kuruluyor."
dpkg -i "/home/$kulad/Downloads/Uyap Editor (Ubuntu)/uyap-editor.deb"
echo
echo "**** İşlemler bitmiştir. DYS yi sorunsuzca kullanabilirsiniz. Erkin AKA ****"
EOF



