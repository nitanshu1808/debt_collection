if Rails.env.development?
  desc 'Generate Entity Relationship Diagram'
  task :generate_erd do
    system "erd --inheritance=true --filetype=png --direct --orientation=vertical --splines=spline --notation=simple --attributes=foreign_keys,content,primary_keys,timestamps"
  end
end
