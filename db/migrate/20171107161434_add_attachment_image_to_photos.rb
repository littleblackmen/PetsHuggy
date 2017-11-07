#39 ※[5.1]のように現在のバージョンに合わせて記入を要する　→　rake db:migrate
class AddAttachmentImageToPhotos < ActiveRecord::Migration[5.1]
  def self.up
    change_table :photos do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :photos, :image
  end
end
