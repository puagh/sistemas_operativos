require 'gosu'

def media_path(file)
	File.join(File.dirname(File.dirname(__FILE__)), 'media', file)
end

class GameWindow < Gosu::Window
   BACKGROUND = media_path('fondo_r_r.png')
   def initialize(width=800, height=600, fullscreen=false)
    super
    self.caption = 'Simulador Round Robin v0.0.1'
    @background = Gosu::Image.new(self, BACKGROUND, false)
    @listos = Gosu::Image.from_text(self, 'Lista de procesos listos', Gosu.default_font_name, 20)
    @ejecucion = Gosu::Image.from_text(self, 'Ejecución', Gosu.default_font_name, 20)
		@bloqueados = Gosu::Image.from_text(self, 'Bloqueados', Gosu.default_font_name, 20)
    @terminados = Gosu::Image.from_text(self, 'Lista de terminados', Gosu.default_font_name, 20)
    #@arreglo_procesos = {"Proceso A" =>rand(15).next, "Proceso B" =>rand(15).next, "Proceso C" =>rand(15).next,
    #				"Proceso D" =>rand(15).next, "Proceso E" =>rand(15).next}
		#@arreglo_listos = @arreglo_procesos
		#@hash_a = {"Proceso A"=>rand(15).next}
		@hash_a = {"Proceso A"=>14}
		@key_a = Gosu::Image.from_text(self, @hash_a.keys, Gosu.default_font_name, 20)
		@value_a = Gosu::Image.from_text(self, 14, Gosu.default_font_name, 20)
		@hash_b = {"Proceso B"=>10}
		@key_b = Gosu::Image.from_text(self, @hash_b.keys, Gosu.default_font_name, 20)
		@hash_c = {"Proceso C"=>7}
		@key_c = Gosu::Image.from_text(self, @hash_c.keys, Gosu.default_font_name, 20)
		@hash_d = {"Proceso D"=>6}
		@key_d = Gosu::Image.from_text(self, @hash_d.keys, Gosu.default_font_name, 20)
		@hash_e = {"Proceso E"=>4}
		@key_e = Gosu::Image.from_text(self, @hash_e.keys, Gosu.default_font_name, 20)
    @segundos = 0
    #@procesos_values = @arreglo_procesos.values
    #@arreglo_listos= Gosu::Image.from_text(self, @arreglo_listos, Gosu.default_font_name, 20)   #ADDED
    #@procesos_keys = @arreglo_procesos.keys
		@hash_a = Gosu::Image.from_text(self, @hash_a, Gosu.default_font_name, 20)
		@hash_b = Gosu::Image.from_text(self, @hash_b, Gosu.default_font_name, 20)
		@hash_c = Gosu::Image.from_text(self, @hash_c, Gosu.default_font_name, 20)
		@hash_d = Gosu::Image.from_text(self, @hash_d, Gosu.default_font_name, 20)
		@hash_e = Gosu::Image.from_text(self, @hash_e, Gosu.default_font_name, 20)
    #@proceso_a = Gosu::Image.from_text(self, "Proceso A #{@quantum}", Gosu.default_font_name, 20)
    @proceso_b = Gosu::Image.from_text(self, 'Proceso B', Gosu.default_font_name, 20)
    @proceso_c = Gosu::Image.from_text(self, 'Proceso C', Gosu.default_font_name, 20)
    @proceso_d = Gosu::Image.from_text(self, 'Proceso D', Gosu.default_font_name, 20)
    @proceso_e = Gosu::Image.from_text(self, 'Proceso E', Gosu.default_font_name, 20)
    @cambios = 0

   end

   def update
   	tiempo
   	#sleep (@segundos)
   end

   def needs_cursor?
    true
   end

   def draw
    @background.draw(0, 0, 0)
    #@arreglo_listos.draw(0,0,0)
    @listos.draw(40, 40, 0)
    @ejecucion.draw(350, 40, 0)
		@bloqueados.draw(350, 320, 0)
    @terminados.draw(550, 40, 0)
    #@procesos_keys.draw(20,0,0)
    #@procesos_values.draw(35,0,0)
    #@proceso_b.draw(80, 140, 0)
    #@proceso_a.draw(80, 140, 0)
    #@proceso_b.draw(80, 170, 0)
    #@proceso_c.draw(80, 200, 0)
    #@proceso_d.draw(80, 230, 0)
    #@proceso_e.draw(80, 260, 0)

    if @cambios <=1 #Inicio
    	@hash_a.draw(49, 160, 0)

    	@hash_b.draw(49, 190, 0)
    	@hash_c.draw(49, 220, 0)
    	@hash_d.draw(49, 250, 0)
    	@hash_e.draw(49, 280, 0)


    elsif @cambios >1 and @cambios<=3 #Entra Proceso 'A' a EJECUCION
  		@hash_a.draw(319, 125, 0) #EJECUCION
    	@proceso_b.draw(50, 170, 0)
    	@proceso_c.draw(50, 200, 0)
    	@proceso_d.draw(50, 230, 0)
    	@proceso_e.draw(50, 260, 0)

    elsif @cambios >3 and @cambios<=5 #Entra proceso 'A' a TERMINADOS y 'B' a EJECUCION
      @key_a.draw(580, 140, 0)
    	@proceso_b.draw(350, 125, 0)
    	@proceso_c.draw(50, 200, 0)
    	@proceso_d.draw(50, 230, 0)
    	@proceso_e.draw(50, 260, 0)

    elsif @cambios >5 and @cambios<=8 #Entra proceso 'B' a TERMINADOS y 'C' a EJECUCION
      @key_a.draw(580, 140, 0)
    	@proceso_b.draw(580, 170, 0)
    	@proceso_c.draw(350, 125, 0)
    	@proceso_d.draw(50, 230, 0)
    	@proceso_e.draw(50, 260, 0)

    elsif @cambios >7 and @cambios<=9 #Entra proceso 'C' a TERMINADOs y 'D' a EJECUCION
      @key_a.draw(580, 140, 0)
    	@proceso_b.draw(580, 170, 0)
    	@proceso_c.draw(580, 200, 0)
    	@proceso_d.draw(350, 125, 0)
    	@proceso_e.draw(50, 260, 0)

    elsif @cambios >9 and @cambios<=11 #Entra proceso 'D' a TERMINADOs y 'E' a EJECUCION
      @key_a.draw(580, 140, 0)
    	@proceso_b.draw(580, 170, 0)
    	@proceso_c.draw(580, 200, 0)
    	@proceso_d.draw(580, 230, 0)
    	@proceso_e.draw(350, 125, 0)
    else				#Terminan todos los procesos y se ponen en la lista de terminados
      @key_a.draw(580, 140, 0)
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
   	@tiempo_restante = 0
		@quantum = 5
		@value_a = 14
		@quantum.downto(0) do
		sleep 1
		p @quantum -=1
		p @value_a -=1
	end
	@cambios +=1
	puts "Cambios = #{@cambios}"
	#Thread.new do
	#	x=1
	#	@cambios +=1
	#	puts "Cambios = #{@cambios}"
  	#	loop do
      	#	puts "#{x}"
      	#	sleep 1
      	#	x+=1
      	#	break if x==4
      	#end
  	#end
   end

   def ejecucion

   end
end

window = GameWindow.new
window.show
