local Floor, super = Class(Wave)

function Floor:onStart()
    self.time = 6
    
    self.timer:every(0.4, function()
        local arena = Game.battle.arena
        local soul = Game.battle.soul
        
        -- Incar posisi X pemain (Prediksi)
        local x = soul.x
        local y = arena.bottom + 40 -- Di bawah arena
        
        -- Tanda Bahaya (Opsional: Kasih warning box dulu)
        -- Tapi kita langsung gas aja spawn tombak
        
        local spear = self:spawnBullet("battle/bullets/tombak", x, y)
        if spear then
            spear.rotation = math.rad(-90) -- Nunjuk ke ATAS
            spear.physics.direction = math.rad(-90)
            spear.physics.speed = 7
            
            -- Biar dia muncul di BAWAH layer arena (efek keluar dari lantai)
            -- spear.layer = BATTLE_LAYERS["below_arena"] -- (Opsional)
            
            -- Hapus pas sampe atas
            spear.update = function(s)
                if s.y < arena.top - 50 then s:remove() end
            end
        end
    end)
end

function Floor:update() super.update(self) end
return Floor