class CreateGameEngineCore < ActiveRecord::Migration[8.1]
  def change
    # 1. Rooms Table (The Core Context Nodes)
    create_table :rooms do |t|
      t.string :slug, null: false
      t.string :title, null: false
      t.text :description_md, null: false
      t.jsonb :metadata_json, default: {}, null: false

      t.timestamps
    end
    add_index :rooms, :slug, unique: true

    # 2. Players Table (State management tracker)
    create_table :players do |t|
      t.string :name, null: false
      t.integer :user_id
      t.references :room, foreign_key: true
      t.jsonb :reputation_json, default: {}, null: false
      t.jsonb :inventory_json, default: [], null: false

      t.timestamps
    end
    add_index :players, :user_id

    # 3. Choices Table (Branching choices available out of Rooms)
    create_table :choices do |t|
      t.references :room, null: false, foreign_key: true
      t.string :choice_identifier, null: false
      t.string :text, null: false
      t.string :target_room_slug, null: false
      t.string :risk_level, default: "low", null: false
      t.string :roll_type
      t.string :success_slug
      t.string :failure_slug
      t.jsonb :conditions_json, default: {}, null: false
      t.jsonb :effects_json, default: {}, null: false

      t.timestamps
    end
    add_index :choices, [:room_id, :choice_identifier], unique: true

    # 4. Rolls Table (Server-Authoritative RNG Audit Logging)
    create_table :rolls do |t|
      t.references :player, null: false, foreign_key: true
      t.string :roll_type, null: false
      t.string :seed, null: false
      t.integer :result, null: false
      t.string :signature_token, null: false
      t.boolean :verified, default: false, null: false

      t.timestamps
    end

    # 5. Facts Table (Historical Sourcing & Citation Database)
    create_table :facts do |t|
      t.text :text, null: false
      t.string :source, null: false
      t.string :reviewer_id, null: false
      t.datetime :verified_at

      t.timestamps
    end
  end
end
