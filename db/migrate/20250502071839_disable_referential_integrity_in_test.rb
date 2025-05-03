class DisableReferentialIntegrityInTest < ActiveRecord::Migration[8.0]
  def up
    if Rails.env.test?
      execute "PRAGMA foreign_keys = OFF;"
    end
  end

  def down
    if Rails.env.test?
      execute "PRAGMA foreign_keys = ON;"
    end
  end
end
