platform :tvos, '9.0'
use_frameworks!

def testing_pods
 pod 'OHHTTPStubs', '~> 4.5’
 pod 'Quick', '~> 0.8.0'
 pod 'Nimble', '3.0.0'
end

def services_pods
 pod 'Alamofire', '~> 3.0'
 pod 'SwiftyJSON', '~> 2.3'
end

target 'RemoteCollectionAppleTV' do
 services_pods
 pod 'SDWebImage', :git => 'https://github.com/rs/SDWebImage.git'
end

target 'RemoteServices' do
 services_pods
end

target 'RemoteServicesTests' do
 testing_pods
end
