require 'rails_helper'

RSpec.describe Subscription, type: :model do
  it { should validate_presence_of(:title) }
  it { should validate_numericality_of(:price).is_greater_than(0) }
  it { should validate_presence_of(:status) }
  it { should validate_presence_of(:frequency) }

  it { should belong_to(:customer) }
  it { should belong_to(:tea) }
end