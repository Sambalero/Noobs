Dir.glob(File.dirname(__FILE__) + '/*.rb').each do |controller|
 require(controller)
end