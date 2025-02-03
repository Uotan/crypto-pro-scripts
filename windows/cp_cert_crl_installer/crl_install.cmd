chcp 65001

echo crl_install START %date% %time% >>%cd%\crl\crl_install.log
xcopy "\\10.10.1.1\crypto\crl\*.crl" "%cd%\crl" /Y /I >>%cd%\crl\crl_install.log

cd crl

for %%f in (ucfk*.crl) do (
"C:\Program Files\Crypto Pro\CSP\certmgr.exe" -inst -store ca -crl -file "%cd%\%%f" >>%cd%\crl_install.log
)

for %%f in (guc*.crl) do (
"C:\Program Files\Crypto Pro\CSP\certmgr.exe" -inst -store Root -crl -file "%cd%\%%f" >>%cd%\crl_install.log
)

echo Ошибка выполнения: %ERRORLEVEL% >>%cd%\crl_install.log
echo crl_install END %date% %time% >>%cd%\crl_install.log