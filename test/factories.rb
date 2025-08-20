[
  Dir[Rails.root.join("test/factories/*.rb")],
].flatten.sort.each { |f| require f }
