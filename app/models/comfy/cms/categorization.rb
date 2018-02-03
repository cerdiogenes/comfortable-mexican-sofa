class Comfy::Cms::Categorization < ActiveRecord::Base

  self.table_name = "comfy_cms_categorizations"
  acts_as_tenant(:edition)

  # -- Relationships -----------------------------------------------------------
  belongs_to :category
  belongs_to :categorized,
    polymorphic: true

  # -- Validations -------------------------------------------------------------
  validates :category_id,
    uniqueness: { scope: %i[categorized_type categorized_id edition_id] }

end
