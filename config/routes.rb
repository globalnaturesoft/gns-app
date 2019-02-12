Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount Gns::Core::Engine => "/", as: 'gns'

  Dir.glob(Rails.root.join('engines').to_s + "/*") do |d|
    eg = d.split(/[\/\\]/).last
		if eg != "core" and Erp::Core.available?(eg)
			mount "Gns::#{eg.camelize}::Engine".constantize => "/", as: 'gns_' + eg
		end
  end
end
