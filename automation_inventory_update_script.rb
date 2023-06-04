require 'selenium-webdriver'

# Inisialisasi WebDriver
driver = Selenium::WebDriver.for :chrome

# Membuka halaman login
driver.get('https://app.jubelio.com/login')

# Masukkan informasi login
username_field = driver.find_element(:id, 'username')
password_field = driver.find_element(:id, 'password')
username_field.send_keys('qa.rakamin.jubelion@gmai.com')
password_field.send_keys('Jubelio123!')

# Klik tombol login
login_button = driver.find_element(:id, 'login-button')
login_button.click

# Tunggu hingga halaman dashboard muncul
wait = Selenium::WebDriver::Wait.new(timeout: 10)
wait.until { driver.find_element(:class, 'dashboard') }

# Navigasi ke halaman persediaan
inventory_link = driver.find_element(:xpath, "//a[contains(text(), 'Inventory')]")
inventory_link.click

# Tunggu hingga halaman persediaan muncul
wait.until { driver.find_element(:class, 'inventory-page') }

# Cari input stok
stock_input = driver.find_element(:xpath, "//input[@placeholder='Enter stock']")
stock_input.clear
stock_input.send_keys('100')

# Klik tombol simpan
save_button = driver.find_element(:xpath, "//button[contains(text(), 'Save')]")
save_button.click

# Tunggu hingga perubahan disimpan
wait.until { driver.find_element(:class, 'success-message') }

# Menutup browser
driver.quit
