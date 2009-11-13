class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.string        :title
      t.string        :location
      t.text          :description
      t.datetime      :date
      t.float         :lat
      t.float         :lng
      
      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
