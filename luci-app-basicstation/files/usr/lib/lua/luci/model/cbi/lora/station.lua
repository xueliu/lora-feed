m=Map("station",translate("Basicstation"),translate("Here you can configure the Semtech basicstation"))

--
-- SX1301 configuration for SX1301_conf
--
sx1301=m:section(TypedSection,"sx1301","SX1301 Parameters")
sx1301.addremove=false
sx1301.anonymous=true

lorawan_pb = sx1301:option(ListValue,"lorawan_public",translate("LoRaWAN is public"))
lorawan_pb.optional = false;
lorawan_pb.rmempty = false;
lorawan_pb.default = false
lorawan_pb.datatype = "bool"
lorawan_pb:value(true, translate("True"))
lorawan_pb:value(false, translate("False"))

clkscr = sx1301:option(ListValue,"clksrc",translate("Clock Source"), "radio_1 provides clock to concentrator for most devices except MultiTech. For MultiTech set to 0.")
clkscr.optional = false;
clkscr.rmempty = false;
clkscr.datatype = "integer"
clkscr:value(1, translate("from radio_1"))
clkscr:value(0, translate("from radio_0"))

--
-- Radio Parameters
--
radio=m:section(TypedSection,"radio","Radio Parameters")
radio.addremove=false
radio.anonymous=false

--
-- Radio enable
--
enable = radio:option(ListValue,"enable",translate("Enable"))
enable.optional = false;
enable.rmempty = false;
enable.default = false
enable.datatype = "bool"
enable:value(true, translate("True"))
enable:value(false, translate("False"))

--
-- Radio RF frontend
--
type = radio:option(ListValue,"type",translate("Type"))
type.optional = false;
type.rmempty = false;
type.datatype = "string"
type:value("SX1257", translate("SX1257"))
type:value("SX1255", translate("SX1255"))

--
-- Radio Frequency
--
freq = radio:option(Value,"freq",translate("Frequency"), "Hz")
freq.optional = true;
freq.rmempty = false;

--
-- RSSI offset
-- 
rssi_offset = radio:option(Value,"rssi_offset",translate("RSSI Offset"), "dB")
rssi_offset.optional = false;
rssi_offset.rmempty = false;

--
-- Tx Enable
--
tx_enable = radio:option(ListValue,"tx_enable",translate("Tx Enable"))
tx_enable.optional = false;
tx_enable.rmempty = false;
tx_enable.default = false
tx_enable.datatype = "bool"
tx_enable:value(true, translate("True"))
tx_enable:value(false, translate("False"))

--
-- Station Parameters
--
station=m:section(TypedSection,"station","Station Parameters")
station.addremove=false
station.anonymous=false

--
-- Log File
--
log_file = station:option(Value,"log_file",translate("Log file location"))
log_file.optional = false;
log_file.rmempty = false;

--
-- Log Level
--
log_level = station:option(Value,"log_level",translate("Log Level"))
log_level.optional = false;
log_level.rmempty = false;
log_level:value("DEBUG", "Debug")
log_level:value("XDEBUG", "XDebug")
log_level:value("VERBOSE", "Verbose")
log_level:value("INFO", "Info")
log_level:value("NOTICE", "Notice")
log_level:value("WARNING", "Warning")
log_level:value("ERROR", "Error")
log_level:value("CRITICAL", "Critical")

--
-- Log Size
--
log_size = station:option(Value,"log_size",translate("Log Size"), "Byte")
log_size.optional = false;
log_size.rmempty = false;

--
-- Log Roteate
--
log_rotate = station:option(Value,"log_rotate",translate("Log Rotate"))
log_rotate.optional = false;
log_rotate.rmempty = false;

m.on_after_commit = function(self)

--	io.popen("/etc/init.d/station restart")
end

return m

