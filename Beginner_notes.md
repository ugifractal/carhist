# Beginner
## Cara Menampilkan Mobil dari User

```ruby
### Cara menampilkan semua User
User.all
### Cara menampilkan semua car dari user pertama
User.first.cars
### Cara menampilkan semua car dari user terakhir
User.last.cars
### ganti company dari user akhir
usr = User.last
usr.update({"company_id" => "2"})
ada = Company.new(name: "a")
### Cara menampilkan semua car sesuai jumlah yang kita mau
User.limit(2)
Car.limit(1)
### Cara menampilkan title yang ada huruf S
CarMaintenance.where("title ILIKE ?", "%s%")
```