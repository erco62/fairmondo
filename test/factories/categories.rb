#   Copyright (c) 2012-2016, Fairmondo eG.  This file is
#   licensed under the GNU Affero General Public License version 3 or later.
#   See the COPYRIGHT file for details.

FactoryGirl.define do
  factory :category do
    name 'English literature'

    factory :child_category do
      association :parent, factory: :category, name: 'Literature'
    end
  end
end
