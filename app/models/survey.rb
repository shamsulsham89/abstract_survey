class Survey < ActiveRecord::Base
  attr_accessible :outlet_type_id, :promoter_of_braun, :promoter_of_philips, :rate_the_communication_skill_of_the_braun, :rate_the_communication_skill_of_the_philips, :rate_the_presentability_of_braun, :rate_the_presentability_of_the_philips, :stock_availability_of_philips, :stock_availability_of_the_braun, :time_spent_at_the_braun, :time_spent_at_the_philips, :user_id, :visibility_of_philips, :visibility_of_the_braun


  belongs_to :user
  belongs_to :outlet_type
  belongs_to :product
  belongs_to :rate_the_communication_skill_type
  belongs_to :rate_the_presentability_type
  belongs_to :stock_availability_type
  belongs_to :visibility_type


  validates :outlet_type_id, :presence => {:message => "Name of the outlet must not be left blank"}

  validates :time_spent_at_the_philips, :numericality => {:message => "Time spent at the Philips promotion in the outlet must be in minutes", :only_integer => true}
  validates :visibility_of_philips, :presence => {:message => "Visibility of Philips Promotion in the outlet must not be left blank"}
  validates :stock_availability_of_philips, :presence => {:message => "Stock availability of Philips in the promotion is must not be left blank"}
  validates :promoter_of_philips, :presence => {:message => "Promoter of Philips is available at the promotion stand must not be left blank"}
  validates :rate_the_presentability_of_the_philips, :presence => {:message => "Rate the presentability of the Philips promoter in the promotion must not be left blank"}
  validates :rate_the_communication_skill_of_the_philips, :presence => {:message => "Rate the communication skill of the Philips promoter in the promotion must not be left blank"}



  validates :time_spent_at_the_braun, :numericality => {:message => "Time spent at the Braun promotion stand must be in minutes", :only_integer => true}
  validates :visibility_of_the_braun, :presence => {:message => "Visibility of the Braun Promotion in the outlet must not be left blank"}
  validates :stock_availability_of_the_braun, :presence => {:message => "Stock availability of the Braun in the promotion must not be left blank"}
  validates :promoter_of_braun, :presence => {:message => "Promoter of Braun is available at the promotion must not be left blank"}
  validates :rate_the_presentability_of_braun, :presence => {:message => "Rate the presentability of Braun promoter in the promotion must not be left blank"}
  validates :rate_the_communication_skill_of_the_braun, :presence => {:message => "Rate the communication skill of the Braun promoter in the promotion must not be left blank"}



  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |survey|
        csv << survey.attributes.values_at(*column_names)
      end
    end
  end


  def check_promoter
    if self.promoter_of_philips == '1' or self.promoter_of_braun
      return "Yes"
    else
      return "No"
    end
  end

  
  scope :created_date, lambda {
    self.created_at.strftime('%d-%m-%Y')  
  }
  

end
