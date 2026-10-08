# app/models/item_manifest.rb
class ItemManifest
  DATA = {
    "sacred-charm" => {
      icon: "🧿",
      name: "Sacred Charm",
      description: "A protective ornament vibrating with ancient lineage energy. Required to access critical ritual choices at the well."
    },
    "iron-spear" => {
      icon: "🗡️",
      name: "Iron Spear",
      description: "A balanced weapon forged by royal bladesmiths. Increases martial options when facing high-risk threats."
    },
    "tempered-northern-blade" => {
      icon: "⚔️",
      name: "Tempered Northern Blade",
      description: "A masterful foreign blade forged across the sand dunes. Capable of piercing dense scales."
    }
  }.freeze

  def self.lookup(slug)
    # Fallback structure for missing or dynamic items
    DATA[slug.to_s] || {
      icon: "🎒",
      name: slug.to_s.titleize,
      description: "An enigmatic artifact discovered during your traversal across the boundaries of Daura."
    }
  end
end
