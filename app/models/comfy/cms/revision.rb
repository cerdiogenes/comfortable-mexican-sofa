class Comfy::Cms::Revision < ActiveRecord::Base

  self.table_name = "comfy_cms_revisions"
  acts_as_tenant(:edition)

  serialize :data

  # -- Relationships --------------------------------------------------------
  belongs_to :record, polymorphic: true

end
