require 'net/http'
require 'uri'
require 'json'

# URL endpoint untuk login
url = URI.parse('https://app.jubelio.com/login')

# Membuat objek HTTP
http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true if url.scheme == 'https'

# Membuat request POST
request = Net::HTTP::Post.new(url.path)
request['Content-Type'] = 'application/json'

# Menyiapkan data login
login_data = {
  username: 'qa.rakamin.jubelio@gmail.com',
  password: 'Jubelio123!'
}

# Mengirim data sebagai payload JSON
request.body = login_data.to_json

# Mengirim permintaan HTTP POST
response = http.request(request)

# Memeriksa respons HTTP
if response.code.to_i == 200
  # Berhasil login, lakukan tindakan sesuai kebutuhan
  puts 'Login berhasil!'
  # Contoh: Mengambil token akses atau navigasi ke halaman berikutnya
else
  # Gagal login, lakukan penanganan kesalahan
  puts 'Login gagal!'
  puts "Kode status: #{response.code}"
  puts "Pesan error: #{response.body}"
end
