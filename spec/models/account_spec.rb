require 'rails_helper'

RSpec.describe Account, type: :model do
  describe "attributes relevant to Account" do
    it {is_expected.to respond_to :username}
    it {is_expected.to respond_to :password}
  end

end
