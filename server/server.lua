local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","ls-radio")


RegisterServerEvent('ls-radio:connectCop')
AddEventHandler('ls-radio:connectCop', function(user)
	local user_id = vRP.getUserId({source})
	if vRP.hasPermission({user_id,"police.menu"}) or vRP.hasPermission({user_id,"emergency.revive"}) then
		print("User is Cop")
		TriggerClientEvent("ls-radio:copConnect", vRP.getUserSource({user_id}))
    else
        print("User is not Cop")
        TriggerClientEvent("ls-radio:notAllowedCop", vRP.getUserSource({user_id}))
    end
end)