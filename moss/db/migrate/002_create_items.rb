migration 2, :create_items do
  up do
    create_table :items do
      column :id, Integer, :serial => true
      column :name, DataMapper::Property::String, :length => 255
      column :description, DataMapper::Property::String, :length => 255
    end
  end

  down do
    drop_table :items
  end
end
