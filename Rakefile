task :default => "cookbook:validate"

task :setup do
  sh "sudo chef-solo -c ./config/solo.rb -j ./nodes/local.json"
end

namespace :cookbook do
  desc "Validate cookbooks: rake cookbook:validate"
  task :validate do
    sh "foodcritic site-cookbooks"
  end

  desc "Create a cookbook: rake cookbook:create name=test"
  task :create do
    name = ENV["name"]
    sh "knife cookbook create #{name} -o site-cookbooks"
  end
  desc "fetch vendor cookbooks with librarian-chef"
  task :fetch_vendor_cookbooks do
    name = ENV["name"]
    sh "librarian-chef install"
  end
end
