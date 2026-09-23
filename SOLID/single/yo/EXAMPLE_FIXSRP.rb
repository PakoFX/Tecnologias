class Jugador
  attr_accessor :nombre, :puntos, :vidas, :estado

  def initialize(nombre)
    @nombre = nombre
    @puntos = 0
    @vidas = 3
    @estado = :pequeno
  end
end

class Moneda
  def valor_puntos; 100; end
end

class Goomba
  def dano_ataque; 1; end
end

class Hongo
  def poder; :crecer; end
end

class Bowser
  def dano_ataque; 2; end
end

class SistemaDeAudio
  def reproducir(evento)
    sonidos = {
      moneda: "'ding.mp3'",
      dano: "'ouch.mp3'",
      game_over: "'Game_over.mp3'", # Agregué coma
      poder: "'Power_up.mp3'",      # Agregué coma
      pierde_poder: "'pipe_down.mp3'", # Agregué coma
      bowser: "'bowser_roar.mp3'"
    }
    puts sonidos[evento]
  end
end

class SistemaDePuntuacion
  def sumar_puntos(jugador,cantidad)
    jugador.puntos += cantidad
    puts "[+#{cantidad}pts] Marcador: #{jugador.puntos}"
  end
end

class SistemaDePoderes
  def consumir_hongo(jugador)
    jugador.estado = :grande
    puts "!mario comio un hongo y ahora es GRANDE!"
  end
end

class SistemaDeSalud
  def recibir_dano(jugador, cantidad)
    return if cantidad <= 0

    if jugador.estado == :grande
      jugador.estado = :pequeno
      cantidad -= 1
      puts "El golpe le quito el poder a mario. Vuelve a ser pequeño"
    end

    if cantidad > 0
      jugador.vidas -= cantidad
      jugador.vidas = 0 if jugador.vidas < 0
      puts "[SALUD] Daño recibido: #{cantidad}. Vidas restantes #{jugador.vidas}"
    end
  end
end

mario = Jugador.new("Mario")
audio = SistemaDeAudio.new
marcador = SistemaDePuntuacion.new
salud = SistemaDeSalud.new
poderes = SistemaDePoderes.new
moneda = Moneda.new
goomba = Goomba.new
hongo = Hongo.new
bowser = Bowser.new

# ==========================================
# ENSAMBLAJE Y SIMULACIÓN EN VIVO INTERACTIVA
# ==========================================

puts "--- INICIANDO NIVEL 1-1 ---"
puts "Mario tiene #{mario.vidas} vidas y estado: #{mario.estado}."

# --- INTERACCIÓN 1: LOS GOOMBAS ---
puts "\n--- ESCENARIO 1: EL HONGO Y LA EMBOSCADA ---"
poderes.consumir_hongo(mario)
audio.reproducir(:poder)

print "¿Cuántos Goombas emboscan a Mario de golpe?: "
cantidad_goombas = gets.chomp.to_i
cantidad_goombas = 0 if cantidad_goombas < 0 # Anti-hackers

if cantidad_goombas > 0
  dano_goombas = goomba.dano_ataque * cantidad_goombas
  puts "¡#{cantidad_goombas} Goombas atacan! (Daño total: #{dano_goombas})"
  audio.reproducir(:dano)
  salud.recibir_dano(mario, dano_goombas)
end

# --- INTERACCIÓN 2: EL JEFE FINAL ---
puts "\n--- ESCENARIO 2: LA LLEGADA DE BOWSER ---"

if mario.vidas > 0 
  puts "Mario encuentra otro hongo antes del jefe final..."
  poderes.consumir_hongo(mario)
  audio.reproducir(:poder)
  
  print "¿cuántas veces logra golpear Bowser a Mario?: "
  cantidad_bowser = gets.chomp.to_i
  cantidad_bowser = 0 if cantidad_bowser < 0

  if cantidad_bowser > 0
    dano_bowser = bowser.dano_ataque * cantidad_bowser
    puts "¡Bowser conecta #{cantidad_bowser} golpes! (Daño total: #{dano_bowser})"
    audio.reproducir(:bowser)
    salud.recibir_dano(mario, dano_bowser)
  end
end

puts "\n--- RESULTADO FINAL ---"
if mario.vidas <= 0
  audio.reproducir(:game_over)
  puts "GG. GAME OVER. Mario fue aplastado."
else
  puts "Mario sobrevivió y rescató a la princesa con #{mario.vidas} vidas."
end