class Projectile
	attr_reader :alive
	def initialize(x = 0, y = 0, vx = 0, vy = 0)
		@x, @y, @vx, @vy = x, y, vx, vy
	end

	def update
		@x += @vx
		@y += @vy
		@alive = (@x > 0 and @x < $window.width and @y > 0 and @y < $window.height)
	end

	def draw
		size = 12
		color = Gosu::Color::RED
		Gosu::draw_rect(@x - size/2, @y - size/2, size, size, color)
	end
end