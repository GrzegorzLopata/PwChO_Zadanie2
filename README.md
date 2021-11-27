# PwChO_Zadanie2

2. Zdudować obraz i nazwać go lab4docker

docker build -t lab4docker .

3. Utworzyć volumen o nazwie RemoteVol wykorzystujący odpowiedni sterownik (plugin), by miejsce przechowywania danych znajdowało się na systemie macierzystym:
b. dla studentów, których macierzystym systemem jest Windows – katalog udostępniany poprzez CIFS/SMB.

Tworzenie wolumenu - sterownik CIFS

docker volume create --driver local --opt type=cifs --opt device=//192.168.0.200/Users/Medion/remoteVol --opt o=username=username,password=password,file_mode=0777,dir_mode=0777 --name RemoteVol 

4. Uruchomić kontener o nazwie alpine4 na bazie zbudowanego obrazu lab4docker w taki sposób, by:
a. podłączyć do niego utworzony wolumen RemoteVol w miejsce katalogu /logi w systemie plików kontenera.
b. korzystając z informacji w podpunkcie E, dla tego kontenera ograniczyć ilość wykorzystywanej pamięci RAM do 512MB

docker run -d --mount source=RemoteVol,target=/logi --memory=512m --name alpine4 lab4docker

5. Za pomocą poznanych narzędzi docker plugin ….., docker inspect ..., docker stats … itd. należy potwierdzić, że:
a. skrypt pluto.sh generuje wymagane dane i umieszcza je w pliku info.log na wolumenie, który znajduje się w systemie plików na maszynie macierzystej.
b. kontener alpine4 ma ograniczoną ilość pamięci RAM zgodnie z treścią zadania

docker inspect RemoteVol
