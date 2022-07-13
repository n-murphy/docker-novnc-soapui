mkdir -p /config/.config/autostart && \
cp /config/SoapUI-5.7.0.desktop /config/.config/autostart/ && \
chown abc:abc /config/.config/autostart/SoapUI-5.7.0.desktop

mkdir -p /config/Desktop && \
cp /config/SoapUI-5.7.0.desktop /config/Desktop/ && \
chown abc:abc /config/Desktop/SoapUI-5.7.0.desktop && \ 
chmod +x /config/Desktop/SoapUI-5.7.0.desktop
