module("luci.controller.lora.station",package.seeall)

function index()
    entry({"admin","network","station"}, cbi("lora/station"),_("LoRaWAN Basicstion"),99).index=true
    entry({"admin","status","station"}, call("action_stationlog"),_("Basicstion Log"), 99).index=true
end

function action_stationlog()
    local stationlog = luci.sys.exec("cat /tmp/stationlog")
    luci.template.render("admin_status/stationlog", {stationlog=stationlog})
end
