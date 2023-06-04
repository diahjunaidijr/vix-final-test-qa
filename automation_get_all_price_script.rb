require 'net/http'
require 'uri'
require 'json'

# URL endpoint untuk permintaan GET
url = URI.parse('https://api.jubelio.com/inventory/internal-price-list/')

# Membuat objek HTTP
http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true if url.scheme == 'https'

# Membuat request GET
request = Net::HTTP::Get.new(url.path)
request['Content-Type'] = 'application/json'

# Mengirim permintaan HTTP GET
response = http.request(request)

# Memeriksa respons HTTP
if response.code.to_i == 200
  # Berhasil mendapatkan data, lakukan pemrosesan
  response_body = JSON.parse(response.body)
  # Lakukan tindakan sesuai kebutuhan dengan data yang diterima
  puts 'Permintaan GET berhasil!'
  puts "Data: #{response_body}"
else
  # Gagal mendapatkan data, lakukan penanganan kesalahan
  puts 'Permintaan GET gagal!'
  puts "Kode status: #{response.code}"
  puts "Pesan error: #{response.body}"
end
