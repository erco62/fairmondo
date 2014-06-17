#
#
# == License:
# Fairnopoly - Fairnopoly is an open-source online marketplace.
# Copyright (C) 2013 Fairnopoly eG
#
# This file is part of Fairnopoly.
#
# Fairnopoly is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as
# published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.
#
# Fairnopoly is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with Fairnopoly.  If not, see <http://www.gnu.org/licenses/>.
#
require "test_helper"

describe ArticlesHelper do
  describe "options_format_for (type, method)" do
    before do
      helper.stubs(:resource).returns FactoryGirl.create :article, :transport_type2 => true, :transport_type2_price => 3, :transport_type2_provider => "test"
    end

    it "should return 'kostenfrei'" do
      helper.options_format_for("transport","pickup").must_match(/(kostenfrei)/)
    end

    it "should return 'zzgl.'" do
      helper.options_format_for("transport","type2").must_match(/zzgl. /)
    end
  end

  describe 'default_organisation_from' do
    it 'should rescue from error and return nil' do
      assert_nil(helper.default_organisation_from([]))
    end
  end
end
