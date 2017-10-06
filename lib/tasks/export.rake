namespace :export do
  desc "Prints Relationship.all in a seeds.rb way."
  task :seeds_format => :environment do
    Relationship.order(:id).all.each do |relationship|
      puts "Relationship.create(#{relationship.serializable_hash.delete_if {|key, value| ['created_at','updated_at','id'].include?(key)}.to_s.gsub(/[{}]/,'')})"
    end
  end
end
