chcp 65001

echo cerificate_install START %date% %time% >>%cd%\cert\cert_install.log
xcopy "\\10.10.1.1\crypto\crl\cert\*.cer" "%cd%\cert" /Y /I >>%cd%\cert\cert_install.log

cd cert

for %%f in (ucfk*.cer) do (
"C:\Program Files\Crypto Pro\CSP\certmgr.exe" -inst -store ca -file "%cd%\%%f" >>%cd%\cert_install.log
)

for %%f in (guc*.cer) do (
"C:\Program Files\Crypto Pro\CSP\certmgr.exe" -inst -store Root -file "%cd%\%%f" >>%cd%\cert_install.log
)

echo Ошибка выполнения: %ERRORLEVEL% >>%cd%\cert_install.log
echo cerificate_install END %date% %time% >>%cd%\cert_install.log