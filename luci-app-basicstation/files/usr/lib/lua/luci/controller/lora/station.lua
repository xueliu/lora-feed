module("luci.controller.lora.station",package.seeall)

function index()
    entry({"admin","network","station"}, cbi("lora/station"),_("LoRaWAN Basicstion"),99).index=true
end

