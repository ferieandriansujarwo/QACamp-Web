# QACamp-Web
Project for QA Camp Web lesson

## Group Study
Sangat dianjurkan bagi peserta untuk membentuk kelompok, dimana salah satu peserta dalam kelompok tersebut memiliki laptop dengan Operating System Mac/Ubuntu. Hal ini disebabkan projek dapat dijamin keberhasilannya apabila memakai 2 jenis operating system ini.

Jika dirasa yakin untuk memakai Windows, kami menyarankan untuk memakai Bash shell command line tool. Ikuti tutorial untuk menginstall pada tautan [berikut](https://www.windowscentral.com/how-install-bash-shell-command-line-windows-10) . Setelah berhasil, ikuti langkah instalasi untuk sistem operasi Ubuntu.

## Instalasi

### Mac
Jalankan command sesuai dengan urutan

Install Homebrew
```
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

Install RVM (Ruby Version Manager)
```
curl -L get.rvm.io | bash -s stable
source ~/.bash_profile
```

Install Ruby 2.5.1
```
rvm install 2.5.1
rvm use 2.5.1
```

Install Git
```
brew install git
```

Jika anda belum memiliki akun Github, daftarkan diri anda [disini](https://github.com/join)

Kemudian, konfigurasikan git anda
```
git config --global user.name "<NAMA_ANDA>"
git config --global user.email "<EMAIL_ANDA>"
```
Ganti <NAMA_ANDA> dengan nama anda dan <EMAIL_ANDA> dengan email yang anda gunakan untuk mendaftar akun Github.

Selanjutnya, anda perlu menginstall Chromedriver. Versi yang kita gunakan adalah versi 2.42
```
brew install unzip

curl http://chromedriver.storage.googleapis.com/2.42/chromedriver_mac64.zip -o chromedriver_mac64.zip
unzip chromedriver_mac64.zip -d
rm chromedriver_mac64.zip
sudo mv -f chromedriver /usr/local/bin/chromedriver
sudo chown root:root /usr/local/bin/chromedriver
sudo chmod 0755 /usr/local/bin/chromedriver
```

Kemudian download projek menggunakan clone
```
git clone https://github.com/luthfiswees/QACamp-Web.git
cd QACamp-Web
```

Sekarang anda sudah siap untuk belajar!

### Ubuntu

Install RVM (Ruby Version Manager)
```
curl -L get.rvm.io | bash -s stable
source ~/.bash_profile
```

Install Ruby 2.5.1
```
rvm install 2.5.1
rvm use 2.5.1
```

Install Git
```
sudo apt-get install git
```

Jika anda belum memiliki akun Github, daftarkan diri anda [disini](https://github.com/join)

Kemudian, konfigurasikan git anda
```
git config --global user.name "<NAMA_ANDA>"
git config --global user.email "<EMAIL_ANDA>"
```
Ganti <NAMA_ANDA> dengan nama anda dan <EMAIL_ANDA> dengan email yang anda gunakan untuk mendaftar akun Github.

Selanjutnya, anda perlu menginstall Chromedriver. Versi yang kita gunakan adalah versi 2.42
```
sudo apt-get install unzip

wget -N http://chromedriver.storage.googleapis.com/2.42/chromedriver_linux64.zip -P ~/
unzip chromedriver_linux64.zip -d ~/
rm ~/chromedriver_linux64.zip
sudo mv -f ~/chromedriver /usr/local/bin/chromedriver
sudo chown root:root /usr/local/bin/chromedriver
sudo chmod 0755 /usr/local/bin/chromedriver
```

Kemudian download projek menggunakan clone
```
git clone https://github.com/luthfiswees/QACamp-Web.git
cd QACamp-Web
```

Sekarang anda sudah siap untuk belajar!

## Cara menggunakan
Setiap folder berisi lesson yang nanti akan dijelaskan bersamaan dengan materi slide. Setiap lesson adalah sebuah projek Ruby yang dapat diinstall dan digunakan langsung sebagai contoh.

Sebagai contoh, misalkan saya ingin menggunakan Lesson 1. Maka berikut adalah hal yang perlu dilakukan:

Masuk ke direktori lesson1
```
cd lesson1
```

Install bundler
```
gem install bundler
```

Install dependensi projek
```
bundle install
```

Jalankan projek
```
bundle exec cucumber
```
