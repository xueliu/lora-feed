
module("luci.controller.lora.lora",package.seeall)

function index()
    entry({"admin","network","lora"}, cbi("lora/lora_gateway"),_("LoRa Gateway"),99).index=true
end
