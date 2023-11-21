class Bot < ApplicationRecord
  belongs_to :user, optional: true # pour tester La DB a supprimer ensuite le "optional: true"
end
