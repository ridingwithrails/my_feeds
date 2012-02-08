class Stuff
  def add_to_q
    Resque.enqueue(DoJob)  
  end
end