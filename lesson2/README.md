# Lesson 2 - Capybara

## Lesson Goals

Berikut adalah tujuan dari lesson ini
- _Mengerti guna dari Capybara_
- _Mengerti cara menggunakan Capybara_

## Struktur Proyek
Berikut adalah struktur proyek untuk Lesson 2
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

## Apa itu Capybara?
_Capybara_ adalah sebuah library _acceptance testing_ yang digunakan untuk mengotomasi aplikasi web. Keuntungan menggunakan Capybara terletak pada syntaxnya yang lebih mirip dengan aksi seorang user sehingga lebih mudah dipahami. Capybara sendiri memiliki dependensi terhadap _Selenium Webdriver_ untuk mengimplementasikan fungsi-fungsinya.

## Cara Kerja Capybara
Untuk lesson kali ini kita akan menggunakan Gherkin yang sama dengan lesson 1. Perbedaan dari projek ini terletak pada file `env.rb` dan `web_steps.rb`.

##### env.rb
```rb
require 'capybara/cucumber'

Before do
    Capybara.default_driver = :selenium_chrome
    Capybara.app_host = 'https://www.bukalapak.com'

    page.driver.browser.manage.window.resize_to(1366, 780)
end
```
Di file `env.rb`, perlu ditambahkan dependensi `capybara/cucumber` agar library dapat diload oleh proyek. Kemudian sebelum digunakan, Kita perlu men-set beberapa variabel milik Capybara. Variabel tersebut adalah ...
- `Capybara.default_driver` : Variabel yang menentukan jenis browser yang akan digunakan. Dalam proyek ini kita menggunakan browser Chrome (`:selenium_chrome`). Value yang ada secara default adalah `:selenium` (menggunakan firefox) dan `:selenium_chrome`. Kamu juga bisa menambahkan driver custom milik kamu sendiri. Kamu bisa membaca lebih lanjut [disini](https://github.com/teamcapybara/capybara#configuring-and-adding-drivers).
- `Capybara.app_host` : Variabel yang mendeklarasikan value url dari situs yang ingin kamu tes. Url yang kamu masukkan disini adalah base url, yang berarti homepage dari situs terkait.

##### web_steps.rb
```rb
When("I want to visit Bukalapak Homepage") do
    visit '/'
end

Then("I will see button Login") do
    login_text = find('#login_link').text
    expect(login_text).to eq "Login"
end
```
Di file `web_steps.rb`, saya mengganti syntax _Selenium_ dengan syntax milik _Capybara_. Jika dibandingkan dengan syntax dasar _Selenium_ pada lesson 1. Syntax milik _Capybara_ lebih merepresentasikan aksi dari user.

Contohnya seperti fungsi `visit`, secara intuitif memiliki makna untuk mengunjungi website terkait pada url `https://www.bukalapak.com/`. Atau fungsi `find` yang lebih merepresentasikan bahwa user mencari elemen dengan `id` bernilai `login_link`.

`Notes`: `#login_link` adalah identifier milik `css` yang menunjukan elemen web dengan `id` bernilai `login_link`. Kamu bisa membaca lebih lanjut mengenai `css` [disini](https://www.w3schools.com/Css/).

## Tugas Lesson 2
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
    Then I will see button Login            # features/step_definitions/web_steps.rb:5

1 scenario (1 passed)
2 steps (2 passed)
0m12.460s
```

Log telah berubah yang menandakan bahwa skenario yang dijalankan sudah terimplementasi dan hasil tes sesuai dengan yang diharapkan.

Kamu bisa juga melihat bagaimana script ini bekerja dari halaman browser yang muncul. Jika terdapat gangguan teknis yang terjadi, jangan segan untuk menghubungi instruktor.



#### Selamat, anda dapat melanjutkan ke lesson selanjutnya