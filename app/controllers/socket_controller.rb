class SocketController < ApplicationController
	def index
		require 'socket'
		s = UDPSocket.new
		s.bind(nil, 3003)
		while 1=1 do
			data, addr = s.recvfrom(1024)
			puts data
			data=data.to_s
		  if data[3:6]=="REV"
		  	lat = data[18:21]
		  	
		  end
		end
	end	
end
