class FixColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :plants, :type, :kind
  end
end
