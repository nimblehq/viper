platform :ios, '12.4'

target 'DemoViper' do

  use_frameworks!

  def testing_pods
    pod 'Sourcery'
  end

  target 'DemoViperTests' do
    inherit! :search_paths
    testing_pods
  end

  target 'DemoViperUITests' do
    inherit! :search_paths
    testing_pods
  end

end
