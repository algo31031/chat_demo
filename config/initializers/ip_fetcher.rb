class IPFetcher

  require 'socket'

  def self.get_local_ip    
    orig, Socket.do_not_reverse_lookup = Socket.do_not_reverse_lookup, true    
  # turn off reverse DNS resolution temporarily    
     
    UDPSocket.open do |s|    
      s.connect '64.233.187.99', 1  #google的ip  
      s.addr.last    
    end    
  ensure    
    Socket.do_not_reverse_lookup = orig    
  end

end