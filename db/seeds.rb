puts "=== Purging Old Content Nodes & Player Progress ==="

# 1. Clear out player tracking data to release internal room pointers safely
if defined?(Player)
  Player.destroy_all
  puts "🧹 Cleared player game profiles and inventory states."
end

# 2. Now it is completely safe to wipe the structural narrative blocks
Room.destroy_all
puts "💥 Purged all narrative room nodes."

puts "=== Importing Mythic Content Map ==="
content_directory = Rails.root.join("lib", "content", "*.md")

# Sorting alphabetically ensures the file read order is perfectly deterministic across systems
Dir.glob(content_directory).sort.each do |file_path|
  filename = File.basename(file_path)
  begin
    room = ContentImporter.import_file(file_path)
    puts "✅ Successfully synchronized room node: [#{room.slug}] from #{filename}"
  rescue => e
    puts "❌ Failed to import #{filename}: #{e.message}"
  end
end

# Safety Verification Check
unless Room.exists?(slug: "daura-prologue-001")
  puts "⚠️ WARNING: 'daura-prologue-001.md' was not found during auto-import."
  puts "   Players will crash on initialization unless this baseline slug is present!"
end

puts "=== Narrative Map Sync Complete: #{Room.count} Rooms Loaded ==="
