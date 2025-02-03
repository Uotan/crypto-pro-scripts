echo Добавление сертификата в котейнер закрытого ключа
echo Введите имя файла сертификата в текущем каталоге
read CertFileName
VAR1="/"
/opt/cprocsp/bin/amd64/certmgr -install -file "$PWD$VAR1$CertFileName" -ask-container -to-container
