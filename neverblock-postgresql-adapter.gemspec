Gem::Specification.new do |s|
  s.name     = "neverblock-postgresql-adapter"
  s.version  = "0.1"
  s.date     = "2009-07-19"
  s.summary  = "PostgreSQL Asyncronous AR connection adapter"
  s.email    = "oldmoe@gmail.com"
  s.homepage = "http://github.com/michaelyta/neverblock-postgresql-adapter"
  s.description = "A new postgresql asyncronous connection adapter for active_record using neverblock"
  s.has_rdoc = false
  s.authors  = ["Muhammad A. Ali", "Michael Youssef"]
  s.files    = [ 
		"neverblock-postgresql-adapter.gemspec", 
		"README",
                "lib/active_record/connection_adapters/neverblock_postgresql_adapter.rb",
		"lib/fibered_postgresql_connection.rb",
		"test/active_record_postgresql_test.rb"
  ]
#  s.rdoc_options = ["--main", "README"]
#  s.extra_rdoc_files = ["README"]
  s.add_dependency('neverblock', '>= 1.0')
  s.add_dependency('pg', '>= 0.8.0')
end


