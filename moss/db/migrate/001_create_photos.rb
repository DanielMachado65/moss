migration 1, :create_photos do
  up do
    create_table :photos do
      column :id, Integer, :serial => true
      column :title, DataMapper::Property::String, :length => 255
      column :image_data, DataMapper::Property::Text
    end
  end

  down do
    drop_table :photos
  end
end
