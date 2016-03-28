class SocketController < ApplicationController
	def index
		require 'socket'
		require 'date'

		s = UDPSocket.new
		s.bind(nil, 3003)
		while 1=1 do
			data, addr = s.recvfrom(1024)
			puts data
			data=data.to_s
		  if data[3:5]=="REV"
		  	lat = "#{data[18:20]}" + "." + "#{data[21:25]}"	#se leen los elementos 18:21 (y 21:26) del vector data y se pasan a string con "";
		  	long = "#{data[26:29]}" + "." + "#{data[30:34]}" # #{} se llama evaluación

		  	sem = data[8:11].to_f
		  	dia = data[12:12].to_f
		  	seg = data[13:17].to_f

		  	semaseg = (sem)*7*24*60*60
		  	diaaseg = (dia)*24*60*60
		  	totseg = semaseg + diaaseg + seg
		  	tiempo = Time.gm(1980, 1, 6)- Time.gm(1970, 1, 1) #Resta de tiempos con resultado en segundos
		 	
		 	TS = totseg + tiempo - (5*60*60)
		 	TSF = (time.strftime("%Y-%m-%d",time.gmtime(TS))).to_s
		 	TSMF = (time.strftime("%H:%M:%S",time.gmtime(TS))).to_s
		  	puts lat
		  	puts long
		  	puts TSF
		  	puts TSMF
		  	
		  	#Insertar datos en la db
		  	a = coordenada.new 
		  	a.Idtracker = DCT_Syrus
		  	a.save
		  	a.Latitud = lat
		  	a.save
		  	a.Longitud = long
		  	a.save
		  	a.Datetime = TSF
		  	a.save

			end
		end
	end	

	def create
		@Coordenada = Coordenada.new(params[:])
		@Coordenada.save
		redirect_to :action => :show, :id => @coordenasa.id
	end
end
