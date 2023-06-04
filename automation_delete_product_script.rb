require 'net/http'
require 'uri'
require 'json'

# URL endpoint untuk permintaan DELETE
url = URI.parse('https://api.jubelio.com/inventory/items/')

# ID item yang akan dihapus
item_id = '2'

# Membuat objek HTTP
http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true if url.scheme == 'https'

# Membuat request DELETE
request = Net::HTTP::Delete.new("#{url.path}/#{item_id}")

# Mengirim permintaan HTTP DELETE
response = http.request(request)

# Memeriksa respons HTTP
if response.code.to_i == 204
  # Item berhasil dihapus
  puts 'Item berhasil dihapus!'
else
  # Gagal menghapus item, lakukan penanganan kesalahan
  puts 'Gagal menghapus item!'
  puts "Kode status: #{response.code}"
  puts "Pesan error: #{response.body}"
end
