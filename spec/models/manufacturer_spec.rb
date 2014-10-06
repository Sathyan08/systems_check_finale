require 'rails_helper'

describe Manufacturer do

  it { should have_many(:cars) }

end
