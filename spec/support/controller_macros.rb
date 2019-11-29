# frozen_string_literal: true

module ControllerMacros
  def login_client
    before(:each) do
      @request.env['devise.mapping'] = Devise.mappings[:client]
      @client = FactoryBot.create(:client)
      sign_in @client
    end
  end
end
