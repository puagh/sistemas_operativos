require 'gosu'

def media_path(file) 
	File.join(File.dirname(File.dirname(__FILE__)), 'media', file)
end

class GameWindow < Gosu::Window
   BACKGROUND = media_path('fondo2.png')
   def initialize(width=800, height=600, fullscreen=false)
    super
    self.caption = 'Simulador FIFO 0.0.1'
    @background = Gosu::Image.new(self, BACKGROUND, false)
    @listos = Gosu::Image.from_text(self, 'Lista de procesos listos', Gosu.default_font_name, 20)
    @ejecucion = Gosu::Image.from_text(self, 'Ejecución', Gosu.default_font_name, 20)
    @terminados = Gosu::Image.from_text(self, 'Lista de terminados', Gosu.default_font_name, 20)
    #@procesos = {"Proceso A" =>rand(15), "Proceso B" =>rand(15), "Proceso C" =>rand(15),
    				#"Proceso D" =>rand(15), "Proceso E" =>rand(15)}
    #@proceso_a = @procesos.keys
    #@proceso_b= Gosu::Image.from_text(self, @procesos, Gosu.default_font_name, 20) 
    @proceso_a = Gosu::Image.from_text(self, "Proceso A #{@tiempo_restante}", Gosu.default_font_name, 20)
    @proceso_b = Gosu::Image.from_text(self, 'Proceso B', Gosu.default_font_name, 20)
    @proceso_c = Gosu::Image.from_text(self, 'Proceso C', Gosu.default_font_name, 20)
    @proceso_d = Gosu::Image.from_text(self, 'Proceso D', Gosu.default_font_name, 20)
    @proceso_e = Gosu::Image.from_text(self, 'Proceso E', Gosu.default_font_name, 20)
    @cambios = 0
 
   end

   def update
   	tiempo
   	sleep 5
   end

   def needs_cursor?
    false
   end

   def draw
   	@background.draw(0, 0, 0)
    @listos.draw(40, 40, 0)
    @ejecucion.draw(350, 40, 0)
    @terminados.draw(550, 40, 0)
    #@proceso_b.draw(80, 140, 0)
    #@proceso_a.draw(80, 140, 0)
    #@proceso_b.draw(80, 170, 0)
    #@proceso_c.draw(80, 200, 0)
    #@proceso_d.draw(80, 230, 0)
    #@proceso_e.draw(80, 260, 0)

      if @cambios <=1 #Inicio
    	@proceso_a.draw(80, 140, 0)
    	@proceso_b.draw(80, 170, 0)
    	@proceso_c.draw(80, 200, 0)
    	@proceso_d.draw(80, 230, 0)
    	@proceso_e.draw(80, 260, 0)
      

  	  elsif @cambios >1 and @cambios<=3 #Entra Proceso 'A' a EJECUCION
  	  	@proceso_a.draw(350, 125, 0) #EJECUCION
    	@proceso_b.draw(80, 170, 0)
    	@proceso_c.draw(80, 200, 0)
    	@proceso_d.draw(80, 230, 0)
    	@proceso_e.draw(80, 260, 0)

      elsif @cambios >3 and @cambios<=5 #Entra proceso 'A' a TERMINADOS y 'B' a EJECUCION
        @proceso_a.draw(580, 140, 0)
    	@proceso_b.draw(350, 125, 0)
    	@proceso_c.draw(80, 200, 0)
    	@proceso_d.draw(80, 230, 0)
    	@proceso_e.draw(80, 260, 0)

      elsif @cambios >5 and @cambios<=8 #Entra proceso 'B' a TERMINADOS y 'C' a EJECUCION
      	@proceso_a.draw(580, 140, 0)
    	@proceso_b.draw(580, 170, 0)
    	@proceso_c.draw(350, 125, 0)
    	@proceso_d.draw(80, 230, 0)
    	@proceso_e.draw(80, 260, 0)

      elsif @cambios >7 and @cambios<=9 #Entra proceso 'C' a TERMINADOs y 'D' a EJECUCION
      	@proceso_a.draw(580, 140, 0)
    	@proceso_b.draw(580, 170, 0)
    	@proceso_c.draw(580, 200, 0)
    	@proceso_d.draw(350, 125, 0)
    	@proceso_e.draw(80, 260, 0)

      elsif @cambios >9 and @cambios<=11 #Entra proceso 'D' a TERMINADOs y 'E' a EJECUCION
      	@proceso_a.draw(580, 140, 0)
    	@proceso_b.draw(580, 170, 0)
    	@proceso_c.draw(580, 200, 0)
    	@proceso_d.draw(580, 230, 0)
    	@proceso_e.draw(350, 125, 0)
      	
      else 								#Terminan todos los procesos y se ponen en la lista de terminados
      	@proceso_a.draw(580, 140, 0)
    	@proceso_b.draw(580, 170, 0)
    	@proceso_c.draw(580, 200, 0)
    	@proceso_d.draw(580, 230, 0)
    	@proceso_e.draw(580, 260, 0)
      	
      end
  	
   end

   def button_down id
   	close if id == Gosu::KbEscape
   end

   def tiempo
   	#@tiempo_restante = 10
	#	10.downto(0) do 
	#	sleep 1
	#	@tiempo_restante -=1
	#end
	Thread.new do
		x=1
		@cambios +=1
		puts "Cambios = #{@cambios}"
  		loop do
      		puts "#{x}"
      		sleep 1
      		x+=1
      		break if x==5
      	end
  	end
   end

   def ejecucion
   	
   end
end

window = GameWindow.new
window.show