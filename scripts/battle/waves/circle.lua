local Circle, super = Class(Wave)

function Circle:onStart()
    self.time = 8
    
    -- Spawn lingkaran setiap 1.5 detik
    self.timer:every(1.5, function()
        local soul = Game.battle.soul
        local radius = 180 
        local jumlah_tombak = 8 
        
        for i = 0, jumlah_tombak - 1 do
            -- Hitung posisi melingkar
            local angle = (math.pi * 2 / jumlah_tombak) * i
            local x = soul.x + math.cos(angle) * radius
            local y = soul.y + math.sin(angle) * radius
            
            -- Pake alamat lengkap
            local spear = self:spawnBullet("battle/bullets/tombak", x, y)
            
            if spear then
                -- === 1. SETTING UKURAN (SCALE) ===
                spear.scale_x = 0.5  -- Kecilin lebarnya (0.5 = Setengah)
                spear.scale_y = 0.5  -- Kecilin panjangnya
                spear.graphics.filter = "nearest" -- WAJIB: Biar gambar tajem gak burem
                
                -- Rotasi tombak ngadep ke pemain
                local aim_angle = angle + math.pi 
                spear.rotation = aim_angle
                
                -- Efek muncul pelan-pelan
                spear.alpha = 0 
                self.timer:tween(0.5, spear, {alpha = 1}) 
                
                -- Diem dulu (speed 0) pas baru muncul
                spear.physics.speed = 0
                
                -- Setelah 0.5 detik, BARU TUSUK!
                self.timer:after(0.5, function()
                    if spear then 
                        spear.physics.direction = aim_angle
                        
                        -- === 2. SETTING KECEPATAN ===
                        spear.physics.speed = 7 -- Gua kurangin (Tadi 12, sekarang 7)
                    end
                end)
            end
        end
    end)
end

function Circle:update() super.update(self) end
return Circle