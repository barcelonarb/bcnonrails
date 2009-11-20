class CreateJobs < ActiveRecord::Migration
  def self.up
    create_table :jobs do |t|
      t.references    :user
      t.references    :company
      t.string        :title
      t.text          :description
      t.text          :howto
      t.string        :email
      t.string        :telefon
      t.string        :area

      t.timestamps
    end
  end

  def self.down
    drop_table :jobs
  end
end
