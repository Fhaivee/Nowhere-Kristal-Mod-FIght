local PeluruMerah, super = Class(Bullet)

function PeluruMerah:init(x, y)
    super.init(self, x, y, nil)
    
    self.width = 20
    self.height = 20
    self:setHitbox(0, 0, 20, 20)

    -- INI KUNCI BARU: Set Layer ke paling atas biar gak ketutupan
    self.layer = BATTLE_LAYERS["above_arena"] 
end

function PeluruMerah:draw()
    -- Gambar kotak merah terang
    love.graphics.setColor(1, 0, 0)
    love.graphics.rectangle("fill", 0, 0, 20, 20)
    love.graphics.setColor(1, 1, 1)
end

return PeluruMerah