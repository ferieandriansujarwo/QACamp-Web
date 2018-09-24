# Lesson 1 - Selenium Webdriver

## Lesson Goals

Berikut adalah tujuan dari lesson ini
- _Mengerti guna dari Selenium Webdriver_
- _Mengerti cara menggunakan Selenium Webdriver_

## Struktur Proyek
Berikut adalah struktur proyek untuk Lesson 1
```bash
├── Gemfile
├── Gemfile.lock
└── features
    ├── scenario
    │   └── web.feature
    └── step_definitions
        ├── env.rb
        └── web_steps.rb
```

## Apa itu Selenium Webdriver?
_Selenium Webdriver_ adalah library yang digunakan untuk mengotomasi testing pada aplikasi web. Selenium men-support banyak browser seperti Firefox, Chrome, IE, dan Safari. Script automation testing untuk Selenium sendiri juga bisa ditulis dalam berbagai bahasa pemrograman seperti C#, Java, Javascript, Perl, PHP dan Ruby. Pada lesson ini, kita akan menggunakan script Selenium berbahasa Ruby.

## Cara Kerja Selenium Webdriver
Pada lesson ini kita sudah memiliki file Gherkin dengan nama `web.feature` dan file _step definition_ dengan nama `web_steps.rb`. Kemudian juga terdapat file konfigurasi `env.rb` untuk me-load dependensi Selenium dan library yang dibutuhkan. Berikut akan dijelaskan fungsi dari file-file tersebut.

##### env.rb
```rb
require 'selenium-webdriver'
```
Di file `env.rb` ini, akan di load fungsi-fungsi dari _Selenium Webdriver_ sehingga dapat digunakan oleh proyek. Load file akan berjalan dengan meng-include library `selenium-webdriver` pada file ini.

##### web.feature
```feature
Feature: Bukalapak

    Scenario: Homepage
        When I want to visit Bukalapak Homepage
        Then I will see button Login
```
Ini adalah test case Gherkin yang akan kita jalankan. Test case ini akan mengunjungi homepage Bukalapak dan mengecek apakah terdapat tombol Login pada homepage.

##### web_steps.rb
```rb
When("I want to visit Bukalapak Homepage") do
    @driver = Selenium::WebDriver.for :chrome
    @driver.navigate.to "https://www.bukalapak.com"
end

Then("I will see button Login") do
    element = @driver.find_element(id: 'login_link')
    expect(element.text).to eq "Login"
end
```
Ini adalah implementasi dari step Gherkin dalam bentuk script Ruby. Berikut penjelasannya.
- Pada step `I want to visit Bukalapak Homepage`, dideklarasikan browser yang ingin dipakai (dalam hal ini Chrome). Kemudian menyimpan objek tersebut pada variabel `@driver`.
- Kemudian, command diberikan kepada browser dengan menjalankan script `@driver.navigate.to "https://www.bukalapak.com"`
- Pada step `I will see button Login`, kita akan mencari element pada halaman homepage. Disini kita menggunakan selector `id` pada HTML. Driver akan mencari elemen pada browser yang memiliki `id` dengan value `login_link`
- Kemudian kita akan melakukan assertion apakah benar elemen tersebut memiliki teks bertuliskan Login dengan memakai fungsi `expect`. Teks dari elemen dapat diekstrak menggunakan atribut `.text`.

## Tugas Lesson 1
Install dahulu dependensi menggunakan command berikut
```bash
bundle install
```

Kemudian coba jalankan scenario dengan menjalankan command cucumber
```bash
bundle exec cucumber
```

Maka kamu akan mendapatkan hasil berupa log sebagai berikut ...

```sh
Feature: Bukalapak

  Scenario: Homepage                        # features/scenario/web.feature:3
    When I want to visit Bukalapak Homepage # features/step_definitions/web_steps.rb:1
    Then I will see button Login            # features/step_definitions/web_steps.rb:6

1 scenario (1 passed)
2 steps (2 passed)
0m20.568s
```

Log telah berubah yang menandakan bahwa skenario yang dijalankan sudah terimplementasi dan hasil tes sesuai dengan yang diharapkan.

Kamu bisa juga melihat bagaimana script ini bekerja dari halaman browser yang muncul. Jika terdapat gangguan teknis yang terjadi, jangan segan untuk menghubungi instruktor.



#### Selamat, anda dapat melanjutkan ke lesson selanjutnya