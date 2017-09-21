class EntriesTag < ApplicationRecord
   belongs_to :tag, null: false
   belongs_to :entry, null: false
end
