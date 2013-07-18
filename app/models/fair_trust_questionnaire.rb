#
# Farinopoly - Fairnopoly is an open-source online marketplace.
# Copyright (C) 2013 Fairnopoly eG
#
# This file is part of Farinopoly.
#
# Farinopoly is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as
# published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.
#
# Farinopoly is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with Farinopoly.  If not, see <http://www.gnu.org/licenses/>.
#
class FairTrustQuestionnaire < ActiveRecord::Base

  attr_accessible :support, :support_explanation,
   :transparency, :transparency_explanation,
   :collaboration,:collaboration_explanation,
   :minimum_wage, :minimum_wage_explanation,
   :child_labor, :child_labor_explanation,
   :sexual_equality, :sexual_equality_explanation ,
   :labor_conditions, :labor_conditions_explanation,
   :producer_advancement,:producer_advancement_explanation,
   :awareness_raising, :awareness_raising_explanation,
   :environment_protection,:environment_protection_explanation

  belongs_to :article

  before_validation :has_needed_extra_details?

  validates_presence_of :support, :message => I18n.t('article.form.errors.FairTrustQuestionnaire.invalid')
  validates_presence_of :support_explanation
  validates_presence_of :transparency, :message => I18n.t('article.form.errors.FairTrustQuestionnaire.invalid')
  validates_presence_of :transparency_explanation

  validates_presence_of :minimum_wage, :message => I18n.t('article.form.errors.FairTrustQuestionnaire.invalid')
  validates_presence_of :minimum_wage_explanation
  validates_presence_of :child_labor, :message => I18n.t('article.form.errors.FairTrustQuestionnaire.invalid')
  validates_presence_of :child_labor_explanation

  validates_presence_of :sexual_equality, :message => I18n.t('article.form.errors.FairTrustQuestionnaire.invalid')
  validates_presence_of :sexual_equality_explanation

  # validate explanation of extra details
  validates_presence_of :collaboration_explanation, :if => :collaboration
  validates_presence_of :labor_conditions_explanation, :if => :labor_conditions
  validates_presence_of :producer_advancement_explanation, :if => :producer_advancement
  validates_presence_of :awareness_raising_explanation, :if => :awareness_raising
  validates_presence_of :environment_protection_explanation, :if => :environment_protection


  # :collaboration_explanation
  # :labor_conditions_explanation
  # :producer_advancement_explanation
  # :awareness_raising_explanation
  # :environment_protection_explanation

  def has_needed_extra_details?
    [ self.collaboration, self.labor_conditions,
      self.producer_advancement, self.awareness_raising, self.environment_protection ].count(true) >= 3
  end

end
