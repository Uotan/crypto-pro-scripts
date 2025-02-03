echo "НАЧАТА установка сертификатор и списков отзыва" >> cprocsp_install_certs_linux.txt
date >> cprocsp_install_certs_linux.txt

# \\10.10.1.1\crypto - SMB каталог, crl и cert - каталоги в \\10.10.1.1\crypto
# 'prompt off; mget *.crl' - копирование всех файлов с расширением .crl
smbclient '\\10.10.1.1\crypto' --directory 'crl' --command 'prompt off; mget *.crl'
# 'prompt off; mget *.cer' - копирование всех файлов с расширением .cer
smbclient '\\10.10.1.1\crypto' --directory 'cert' --command 'prompt off; mget *.cer'

SEARCH_PATTERN="guc*.crl"
for file in $SEARCH_PATTERN; do
    if [[ -f "$file" ]]; then
    /opt/cprocsp/bin/amd64/certmgr -install -crl -store uroot -file $file >> cprocsp_install_certs_linux.txt
    fi
done

SEARCH_PATTERN="ucfk*.crl"
for file in $SEARCH_PATTERN; do
    if [[ -f "$file" ]]; then
    /opt/cprocsp/bin/amd64/certmgr -install -crl -store uca -file $file >> cprocsp_install_certs_linux.txt
    fi
done

SEARCH_PATTERN="guc*.cer"
for file in $SEARCH_PATTERN; do
    if [[ -f "$file" ]]; then
    /opt/cprocsp/bin/amd64/certmgr -install -store uroot -file $file >> cprocsp_install_certs_linux.txt
    fi
done

SEARCH_PATTERN="ucfk*.cer"
for file in $SEARCH_PATTERN; do
    if [[ -f "$file" ]]; then
    /opt/cprocsp/bin/amd64/certmgr -install -store uca -file $file >> cprocsp_install_certs_linux.txt
    fi
done

echo "ЗАВЕРШЕНА установка сертификатор и списков отзыва" >> cprocsp_install_certs_linux.txt
date >> cprocsp_install_certs_linux.txt
