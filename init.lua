--
-- Mod Chat Admin
-- Por BrunoMine
--

-- Nick do Administrador
local NickAdmin = "BrunoMine"

minetest.register_privilege("chat_moderador", "Usar char como moderador")

local function verificar_chat(name, message)
	if name == NickAdmin then
		for _,player in ipairs(minetest.get_connected_players()) do
			if player:get_player_name() ~= name then
				minetest.chat_send_player(player:get_player_name(), "[ADMIN]" .. name .. ": " .. message)
			end
		end
		return true
	else
		if minetest.get_player_privs(name)["chat_moderador"] then
			for _,player in ipairs(minetest.get_connected_players()) do
				if player:get_player_name() ~= name then
					minetest.chat_send_player(player:get_player_name(), "[MODERADOR]" .. name .. ": " .. message)
				end
			end
			return true
		end
		return false
	end
end

minetest.register_on_chat_message(verificar_chat)