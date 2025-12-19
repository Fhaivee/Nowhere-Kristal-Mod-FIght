local Sniper, super = Class(Wave)

function Sniper:onStart()
    self.counter = 0
    -- Balikin jadi merah (bebas gerak)
    if Game.battle.soul.setMode then
        Game.battle.soul:setMode("red")
    end
end

function Sniper:update()
    self.counter = self.counter + 1

    -- Tiap 25 frame
    if self.counter % 25 == 0 then
        -- Pilih posisi acak di atas arena
        local x = Utils.random(Game.battle.arena.left, Game.battle.arena.right)
        local y = Game.battle.arena.top - 30 -- Di atas atap arena
        
        -- Spawn peluru
        local bullet = self:spawnBullet("smallbullet", x, y)
        
        -- RUMUS MATEMATIKA NGEKER (Aiming)
        -- Hitung sudut dari Peluru ke Jantung Pemain
        local angle = Utils.angle(x, y, Game.battle.soul.x, Game.battle.soul.y)
        
        -- Terapkan arahnya
        bullet.physics.direction = angle
        bullet.physics.speed = 7 -- Kecepatan peluru
        
        -- (Opsional) Putar gambarnya biar madep ke pemain
        bullet.rotation = angle
    end

    super.update(self)
end

return Sniper