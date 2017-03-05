class AddColumnToAnswer < ActiveRecord::Migration
  def change
    remove_column :answers, :point, :integer

    add_reference :answers, :question, index: true, foreign_key: true
  end
end
