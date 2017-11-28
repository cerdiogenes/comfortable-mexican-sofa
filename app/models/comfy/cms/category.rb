class Comfy::Cms::Category < ActiveRecord::Base
  self.table_name = 'comfy_cms_categories'
  acts_as_tenant(:edition)
  
  # -- Relationships --------------------------------------------------------
  belongs_to :site, :optional => true
  has_many :categorizations,
    :dependent => :destroy
    
  # -- Validations ----------------------------------------------------------
  validates :site_id, 
    :presence   => true
  validates :label,
    :presence   => true,
    :uniqueness => { :scope => [:categorized_type, :site_id, :edition_id] }
  validates :categorized_type,
    :presence   => true
    
  # -- Scopes ---------------------------------------------------------------
  default_scope{ order(:label) }
  
  scope :of_type, lambda { |type|
    where(:categorized_type => type)
  }
  
end
