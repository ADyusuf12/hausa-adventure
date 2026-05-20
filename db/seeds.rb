# db/seeds.rb
puts "Loading Hausa Adventure Core Assets..."

# Ensure file directory target exists
file_path = Rails.root.join("lib", "content", "daura_prologue_001.md")

if File.exist?(file_path)
  room = ContentImporter.import_file(file_path)
  puts "Successfully parsed dynamic room node: #{room.slug} (#{room.title})"
else
  puts "Warning: Pre-flight content skeleton target missing at lib/content/daura_prologue_001.md"
end
