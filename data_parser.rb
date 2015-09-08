require 'csv'
require 'erb'

# Let's get the .csv to something we can work with
# We do this by turning it into an array of hashes

shipments = []
CSV.foreach("./planet_express_logs.csv", headers: true) {|row| shipments << row.to_hash }

# Now we want to open up our template and feed it our data

b = binding
template = File.read("./report.erb")
output = ERB.new(template).result(b)

# Finally we want to throw the output into an HTML File

File.open("./report.html", "wb") {|content| content << output}
