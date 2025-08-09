# Beginner
## Cara Menampilkan Mobil dari User

---

## User

```ruby
# Menampilkan semua User
User.all
```

```ruby
# Menampilkan semua Car dari user pertama
User.first.cars
```

```ruby
# Menampilkan semua Car dari user terakhir
User.last.cars
```

---

## Company

```ruby
# Ambil user terakhir
car = User.last
```

```ruby
# Buat company baru
model = Company.new(name: "a")
```

```ruby
# Simpan company ke database
model.save
```

```ruby
# Update user dengan company_id
car.update(company_id: model.id)
```

---

## Limit Data

```ruby
# Menampilkan 2 user pertama
User.limit(2)
```

```ruby
# Menampilkan 1 mobil pertama
Car.limit(1)
```

---

## Filter Data Berdasarkan Huruf

```ruby
# Menampilkan CarMaintenance yang title-nya mengandung huruf 's' (case insensitive)
CarMaintenance.where("title ILIKE ?", "%s%")
```

## Cara menambahkan debugger

```ruby
require "byebug";debugger
```

## Cara Extend Class

```ruby
class A < B # inheritance
end
```

## Cara Ubah Layout

```ruby
render layout: "new_layout"
```

## Cara Menampilkan Semua Car Shop dari User pertama
```ruby
User.first.car_shops
```

## Cara Menampilkan semua Email
```ruby
User.all.map { |x| x.email }
# x adalah enumerator
# {...} adalah blok bisa diganti dengan do dan end jika multiline
# hasil: array
```

## Cara Rebase
```ruby
git pull origin name --rebase
git add
git rebase --continue
git push
```

## Cara Mencari sebuah Car berdasarkan id
```ruby
Car.find(id)
```

## Cara Meghapus sebuah Car berdasarkan id
```ruby
Car.find(id).destroy
```