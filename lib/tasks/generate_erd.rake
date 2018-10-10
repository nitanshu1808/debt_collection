if Rails.env.development?
  desc 'Generate Entity Relationship Diagram'
  task :generate_erd do
    system "erd --inheritance=true --filetype=png --direct --orientation=vertical --attributes=foreign_keys,content"
  end
end
