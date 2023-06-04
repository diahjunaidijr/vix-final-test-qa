require 'net/http'
require 'uri'
require 'json'

# URL endpoint untuk permintaan POST
url = URI.parse('https://api.jubelio.com/inventory/upload-image')

# Path file gambar yang akan di-upload
image_path = 'C:/Users/diahj/Downloads/2241100031-9506-2_2048x.jpg'

# Membuat objek HTTP
http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true if url.scheme == 'https'

# Membaca isi file gambar
image_data = File.read(image_path)

# Membuat request POST
request = Net::HTTP::Post.new(url.path)
request['Content-Type'] = 'multipart/form-data'
request.body = image_data

# Mengirim permintaan HTTP POST
response = http.request(request)

# Memeriksa respons HTTP
if response.code.to_i == 200
  # Berhasil mengupload gambar
  response_body = JSON.parse(response.body)
  # Lakukan tindakan sesuai kebutuhan dengan data yang diterima
  puts 'Upload gambar berhasil!'
  puts "URL gambar: #{response_body['image_url']}"
else
  # Gagal mengupload gambar, lakukan penanganan kesalahan
  puts 'Upload gambar gagal!'
  puts "Kode status: #{response.code}"
  puts "Pesan error: #{response.body}"
end
