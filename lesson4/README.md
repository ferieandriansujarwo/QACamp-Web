# Lesson 4 - Page Object

## Lesson Goals

Berikut adalah tujuan dari lesson ini
- _Mengerti apa itu Page Object Pattern_
- _Mengerti cara menggunakan Page Object Pattern_

## Struktur Proyek
Berikut adalah struktur proyek untuk Lesson 4
```bash
├── Gemfile
├── Gemfile.lock
└── features
    ├── scenario
    │   └── web.feature
    └── step_definitions
        ├── env.rb
        ├── page_object
        │   └── home_page.rb
        └── web_steps.rb
```

## Apa itu Page Object Pattern?
_Page Object Pattern_ adalah sebuah cara menyusun kode yang mengelompokkan objek sesuai dengan halaman tempat dia berada. Sebagai contoh, tombol daftar dan tombol login berada pada homepage. Maka objek _selector_ yang merepresentasikan objek terkait akan dikumpulkan bersama dengan objek homepage lain dalam satu file. Hal ini dilakukan agar _behaviour_ dari kode mirip dengan halaman web pada dunia nyata.

Untuk mengakomodir kebutuhan ini. Kita akan memakai library [_SitePrism_](https://github.com/bukalapak/site_prism) yang mengubah syntax pada _step_ agar dapat menggunakan fungsi-fungsi _Page Object_.

## Implementasi Proyek
Disini saya menambahkan satu direktori baru, `page_object`, pada direktori `step_defintions`. Didalamnya terdapat file `home_page.rb` yang merepresentasikan homepage. Berikut isi dari file.

##### home_page.rb
```rb
class Homepage < SitePrism::Page
    set_url '/'
  
    element :login_button, '#login_link'
    element :pencarian_populer, :xpath, '//*[text()="Pencarian Populer"]'
end
```
Pada file ini, setiap elemen pada page akan didaftarkan _selector_ nya. Misalkan untuk tombol login, elemen didaftarkan dengan nama `login_button` dan menggunakan _selector_ CSS `#login_link`. Kemudian section Pencarian Populer didaftarkan dengan nama `pencarian_populer` dan menggunakan _selector_ _XPath_ `//*[text()="Pencarian Populer"]`.

Kemudian, page itu sendiri akan mendeklarasikan URL untuk page miliknya. Dimana untuk homepage, URL dideklarasikan dengan statement `set_url '/'`.

Kemudian, pada `web_steps.rb`. Implementasi diubah agar menggunakan syntax milik _SitePrism_. Berikut adalah implementasi dari masing-masing _step_.

```rb
When("I want to visit Bukalapak Homepage") do
    @home = Homepage.new
    @home.load
end
```
Disini akan di-inisialisasi objek Homepage menggunakan `Homepage.new` dan disimpan pada variabel `@home`. Kemudian page akan divisit oleh browser dengan menjalankan fungsi `@home.load`.

```rb
Then("I will see button Login") do
    expect(@home).to have_login_button
end
```
Kemudian disini kita ingin memastikan apakah login button ada pada halaman homepage. Anda cukup melakukan ini.

```rb
Then("I will see Pencarian Populer section") do
    @home.wait_for_pencarian_populer(10)
    expect(@home).to have_pencarian_populer
end
```
Sama halnya dengan Login Button, disini kita ingin memastikan apakah section Pencarian Populer ada pada halaman homepage. Anda cukup melakukan ini. Disini, fungsi `wait_for` digunakan untuk menggantikan `sleep`. Fungsi ini lebih elegan karena akan menunggu elemen terkait untuk di load oleh browser maksimal selama 10 detik. Jika elemen sudah dapat di load dibawah 10 detik, maka kode akan terus dilanjutkan tanpa perlu menunggu sampai 10 detik. Solusi yang cukup efisien dan lumayan elegan (menurut saya).

Secara general, syntax milik _SitePrism_ lebih intuitif dan lebih singkat jika dibandingkan dengan syntax _Capybara_ biasa. Hal ini cukup mudah apabila kita sering menggunakan suatu elemen berulang-ulang. Kode juga lebih mantainable dengan cara ini karena apabila terdapat perubahan, kita cukup mengganti value dari _selector_ pada file page. Keren bukan?

## Tugas Lesson 4
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
    Then I will see button Login             # features/step_definitions/web_steps.rb:6
    And I will see Pencarian Populer section # features/step_definitions/web_steps.rb:10

1 scenario (1 passed)
3 steps (3 passed)
0m7.170s
```

Log telah berubah yang menandakan bahwa skenario yang dijalankan sudah terimplementasi dan hasil tes sesuai dengan yang diharapkan.

Kamu bisa juga melihat bagaimana script ini bekerja dari halaman browser yang muncul. Jika terdapat gangguan teknis yang terjadi, jangan segan untuk menghubungi instruktor.



#### Selamat, anda dapat melanjutkan ke lesson selanjutnya