class AddMoreThingsToCats < ActiveRecord::Migration[5.1]
  def change
    add_column :cats, :spayneuter, :boolean
    add_column :cats, :currentlyatcolony, :string
    add_column :cats, :approximateage, :boolean
    add_column :cats, :notes, :text
    add_column :cats, :vaxdate, :time
    add_column :cats, :fleatx, :time
    add_column :cats, :firstdateseen, :time
  end
end
