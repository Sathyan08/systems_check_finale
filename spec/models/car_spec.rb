require 'rails_helper'

describe Car do

  it { should belong_to(:manufacturer) }

end
