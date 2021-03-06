#   Copyright (c) 2012-2016, Fairmondo eG.  This file is
#   licensed under the GNU Affero General Public License version 3 or later.
#   See the COPYRIGHT file for details.

FactoryGirl.define do
  factory :mass_upload do
    file { fixture_file_upload('test/fixtures/mass_upload_correct.csv', 'text/csv') }
    association :user, factory: :legal_entity

    factory :mass_upload_to_finish do
      state :processing
      row_count 0
    end
  end
end
