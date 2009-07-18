require 'minitest/unit'
require 'neverblock'
require 'activerecord'
require '../lib/fibered_postgresql_connection'

class Book < ActiveRecord::Base

end


MiniTest::Unit.autorun


class ActiverecordTest < MiniTest::Unit::TestCase
  def setup
    super
    ActiveRecord::Base.configurations = {
      'test' => { 
        :adapter  => 'neverblock_postgresql', 
        :username => 'postgres', 
        :password => 'postgres', 
        :encoding => 'utf8', 
        :database => 'postgres',
        :pool => 8
      }
    }
    ActiveRecord::Base.establish_connection 'test'
  end

  def test_concurrency
    count = 17
    done = 0
    t = Time.now
    NB.reactor.run do
      (1..count).each do
       NB::Fiber.new do
          Book.find_by_sql("select sleep(1) as sleep")
          ActiveRecord::Base.connection_pool.release_connection
          done += 1
          puts done
          if done == count
            NB.reactor.stop
          end
        end.resume
      end
    end

    assert_in_delta Time.now - t, 3, 1
  end

end
