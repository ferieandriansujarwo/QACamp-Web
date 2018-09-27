# Lesson 3 - XPath

## Lesson Goals

Berikut adalah tujuan dari lesson ini
- _Mengerti guna dari XPath_
- _Mengerti cara menggunakan XPath_

## Struktur Proyek
Berikut adalah struktur proyek untuk Lesson 3
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

## Apa itu XPath?
_XPath_ adalah sebuah notasi (_selector_) yang digunakan untuk menemukan elemen tertentu pada halaman web. Untuk bisa menggunakan _XPath_ akan lebih baik jika anda mengenal HTML terlebih dahulu. Kamu bisa lihat [disini](https://www.w3schools.com/html/). Anda dapat menggunakan _XPath_ pada _Capybara_ untuk membantu anda menemukan elemen pada web.

## Cara Menggunakan XPath
Misalkan saya punya halaman web dengan format HTML seperti ini ...
```html
<div class="parent">
    <h2>Ayam</h2>
    <p>Ayam adalah salah satu unggas yang bisa dimakan</p>
    <div class="child">
        <h3>Gambar Ayam</h3>
        <img id="ayam_image" src="ayam.jpg" alt="Smiley face" height="42" width="42">
        <p>Ini adalah gambar ayam</p>
    </div>
</div>
```

Anda bisa menggunakan _selector_ CSS untuk mengambil elemen image dengan cara seperti ini.
```rb
find('#ayam_image')
```
Atau menggunakan XPath dengan cara berikut
```rb
find(:xpath, '//img')
```
Atau
```rb
find(:xpath, '//*[@id="ayam_image"]')
```
Atau full map seperti ini
```rb
find(:xpath, '//div/div/img[@id="ayam_image"]')
```
Dan sebagainya ...

Intinya, _XPath_ menawarkan banyak metode alternatif untuk mencari suatu elemen pada halaman web. _XPath_ lebih umum digunakan untuk mencari elemen yang sulit ditemukan oleh _selector_ CSS.

## Implementasi Proyek
Sekarang saya ingin memastikan apakah section Pencarian Populer ada pada halaman homepage Bukalapak. Kemudian saya menambahkan sebuah _step_ pada file Gherkin saya.

##### web.feature
```feature
Feature: Bukalapak

    Scenario: Homepage
        When I want to visit Bukalapak Homepage
        Then I will see button Login
        And I will see Pencarian Populer section
```

Kemudian pada file `web_steps.rb` saya menambahkan implementasi menggunakan fungsi `expect`. Disini saya menggunakan _XPath_ untuk mencari section Pencarian Populer.

##### web_steps.rb
```rb
Then("I will see Pencarian Populer section") do
    expect(page).to have_xpath("//*[text()='Pencarian Populer']")
end
```

## Tugas Lesson 3
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

  Scenario: Homepage                         # features/scenario/web.feature:3
    When I want to visit Bukalapak Homepage  # features/step_definitions/web_steps.rb:1
    Then I will see button Login             # features/step_definitions/web_steps.rb:5
    And I will see Pencarian Populer section # features/step_definitions/web_steps.rb:10

1 scenario (1 passed)
3 steps (3 passed)
0m7.304s
```

Log telah berubah yang menandakan bahwa skenario yang dijalankan sudah terimplementasi dan hasil tes sesuai dengan yang diharapkan.

Kamu bisa juga melihat bagaimana script ini bekerja dari halaman browser yang muncul. Jika terdapat gangguan teknis yang terjadi, jangan segan untuk menghubungi instruktor.



#### Selamat, anda dapat melanjutkan ke lesson selanjutnya