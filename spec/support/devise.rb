module ControllerHelpers
	extend ActiveSupport::Concern

	def login_user
		before(:each) do
			user = FactoryBot.create(:user)
			allow(request.env['warden']).to receive(:authenticate!).and_return(user)
			allow(controller).to receive(:current_user).and_return(user)
		end
	end

end