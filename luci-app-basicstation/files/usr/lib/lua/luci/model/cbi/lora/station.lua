local fs = require "nixio.fs"
m=Map("station",translate("Basicstation"),translate("Here you can configure the Semtech basicstation"))

function string.tohex(str)
    return (str:gsub('.', function (c)
        return string.format('0x%02X ', string.byte(c))
    end))
end

--
-- CUPS Bootstrap Configuration
-- 
local cups_bootstrap = m:section(NamedSection, "cups_bootstrap", "server", translate("CUPS Bootstrap"))

--
-- CUPS Bootstrap URI
-- 
local cups_bootstrap_uri = cups_bootstrap:option(Value, "uri", translate("URI"))
cups_bootstrap_uri.optional = true;
cups_bootstrap_uri.rmempty = true;

--
-- CUPS Bootstrap Port
-- 
local cups_bootstrap_port = cups_bootstrap:option(Value, "port", translate("Port"))
cups_bootstrap_port.optional = true;
cups_bootstrap_port.rmempty = true;

--
-- CUPS Bootstrap Authentication Mode
-- 
local cups_bootstrap_auth_mode = cups_bootstrap:option(ListValue, "auth_mode", translate("Authentication Mode"))
cups_bootstrap_auth_mode:value("none", "No Authentication")
cups_bootstrap_auth_mode:value("tls-server","TLS Server Authentication")
cups_bootstrap_auth_mode:value("tls-server-client", "TLS Server and Client Authentication")
cups_bootstrap_auth_mode:value("tls-server-token","TLS Server Authentication and Client Token")

--
-- CUPS Bootstrap Server CA certificate
-- 
local cups_bootstrap_trust = cups_bootstrap:option(TextValue, "_trust", translate("Server’s CA certificate"))
cups_bootstrap_trust.wrap = "off"
cups_bootstrap_trust.rows = 4
cups_bootstrap_trust:depends("auth_mode","tls-server")
cups_bootstrap_trust:depends("auth_mode","tls-server-client")
cups_bootstrap_trust:depends("auth_mode","tls-server-token")

function cups_bootstrap_trust.cfgvalue()
	return fs.readfile("/etc/station/cups-boot.trust") or ""
end

function cups_bootstrap_trust.write(self, section, value)
	if value then
		fs.writefile("/etc/station/cups-boot.trust", value:gsub("\r\n", "\n"))
		m:set(section, "trust", "/etc/station/cups-boot.trust")
	end
end

function cups_bootstrap_trust.remove(self, section)
	fs.remove("/etc/station/cups-boot.trust")
	m:del(section, "trust")
end

--
-- CUPS Bootstrap Station Certificate
-- 
local cups_bootstrap_crt = cups_bootstrap:option(TextValue, "_crt", translate("Station’s Own Certificate"))
cups_bootstrap_crt.wrap = "off"
cups_bootstrap_crt.rows = 4
cups_bootstrap_crt:depends("auth_mode","tls-server-client")

function cups_bootstrap_crt.cfgvalue()
	return fs.readfile("/etc/station/cups-boot.crt") or ""
end

function cups_bootstrap_crt.write(self, section, value)
	if value then
		fs.writefile("/etc/station/cups-boot.crt", value:gsub("\r\n", "\n"))
		m:set(section, "crt", "/etc/station/cups-boot.crt")
	end
end

function cups_bootstrap_crt.remove(self, section)
	fs.remove("/etc/station/cups-boot.crt")
	m:del(section, "crt")
end

--
-- CUPS Bootstrap Station Private Key
-- 
local cups_bootstrap_key = cups_bootstrap:option(TextValue, "_key", translate("Station’s Private Key"))
cups_bootstrap_key.wrap = "off"
cups_bootstrap_key.rows = 4
cups_bootstrap_key:depends("auth_mode","tls-server-client")

function cups_bootstrap_key.cfgvalue()
	return fs.readfile("/etc/station/cups-boot.key") or ""
end

function cups_bootstrap_key.write(self, section, value)
	if value then
		fs.writefile("/etc/station/cups-boot.key", value:gsub("\r\n", "\n"))
		m:set(section, "key", "/etc/station/cups-boot.key")	
	end
end

function cups_bootstrap_key.remove(self, section)
	fs.remove("/etc/station/cups-boot.key")
	m:del(section, "key")
end

--
-- CUPS Bootstrap Station Token
--
local cups_bootstrap_token = cups_bootstrap:option(Value, "token", translate("Station’s Token"))
cups_bootstrap_token:depends("auth_mode","tls-server-token")


--
-- CUPS Server Configuration
-- 
local cups = m:section(NamedSection, "cups", "server", translate("CUPS Server"))

--
-- CUPS Server URI
--
local cups_uri=cups:option(Value, "uri", translate("URI"))
cups_uri.optional = true;
cups_uri.rmempty = true;

--
-- CUPS Server Port
--
local cups_port=cups:option(Value, "port", translate("Port"))
cups_port.optional = true;
cups_port.rmempty = true;

--
-- CUPS Authentication Mode
--
local cups_auth_mode = cups:option(ListValue, "auth_mode", translate("Authentication Mode"))
cups_auth_mode:value("none", "No Authentication")
cups_auth_mode:value("tls-server","TLS Server Authentication")
cups_auth_mode:value("tls-server-client", "TLS Server and Client Authentication")
cups_auth_mode:value("tls-server-token","TLS Server Authentication and Client Token")

--
-- CUPS Server Certificate
--
local cups_trust = cups:option(TextValue, "_trust", translate("Server’s CA certificate"))
cups_trust.wrap = "off"
cups_trust.rows = 4
cups_trust:depends("auth_mode","tls-server")
cups_trust:depends("auth_mode","tls-server-client")
cups_trust:depends("auth_mode","tls-server-token")

function cups_trust.cfgvalue()
	return fs.readfile("/etc/station/cups.trust") or ""
end

function cups_trust.write(self, section, value)
	if value then
		fs.writefile("/etc/station/cups.trust", value:gsub("\r\n", "\n"))
		m:set(section, "trust", "/etc/station/cups.trust")
	end
end

function cups_trust.remove(self, section)
	fs.remove("/etc/station/cups.trust")
	m:del(section, "trust")
end

--
-- CUPS Station Certificate
--
local cups_crt = cups:option(TextValue, "_crt", translate("Station’s Own Certificate"))
cups_crt.wrap = "off"
cups_crt.rows = 10
cups_crt:depends("auth_mode","tls-server-client")

function cups_crt.cfgvalue()
	return fs.readfile("/etc/station/cups.crt") or ""
end

function cups_crt.write(self, section, value)
	if value then
		fs.writefile("/etc/station/cups.crt", value:gsub("\r\n", "\n"))
		m:set(section, "crt", "/etc/station/cups.crt")	
	end
end

function cups_crt.remove(self, section)
	fs.remove("/etc/station/cups.crt")
	m:del(section, "crt")
end

--
-- CUPS Station Private Key
--
local cups_key = cups:option(TextValue, "_key", translate("Station’s Private Key"))
cups_key.wrap = "off"
cups_key.rows = 10
cups_key:depends("auth_mode","tls-server-client")

function cups_key.cfgvalue()
	return fs.readfile("/etc/station/cups.key") or ""
end

function cups_key.write(self, section, value)
	if value then
		fs.writefile("/etc/station/cups.key", value:gsub("\r\n", "\n"))
		m:set(section, "key", "/etc/station/cups.key")
	end
end

function cups_key.remove(self, section)
	fs.remove("/etc/station/cups.key")
	m:del(section, "key")
end

--
-- CUPS Station Token
--
local cups_token = cups:option(Value, "token", translate("Station's Token"))
cups_token:depends("auth_mode","tls-server-token")


--
-- LNS Server Configuration
--
local lns = m:section(NamedSection, "tc", "server", translate("LNS Server"))

--
-- LNS Server URI
--
local lns_uri = lns:option(Value, "uri", translate("URI"))
lns_uri.optional = true;
lns_uri.rmempty = true;

--
-- LNS Server Port
--
local lns_port = lns:option(Value, "port", translate("Port"))
lns_port.optional = true;
lns_port.rmempty = true;

--
-- LNS Authentication Mode
--
local lns_auth_mode = lns:option(ListValue, "auth_mode", translate("Authentication Mode"))
lns_auth_mode:value("none", "No Authentication")
lns_auth_mode:value("tls-server", "TLS Server Authentication")
lns_auth_mode:value("tls-server-client", "TLS Server and Client Authentication")
lns_auth_mode:value("tls-server-token", "TLS Server Authentication and Client Token")


--
-- LNS Server CA Certificate
--
local lns_trust = lns:option(TextValue, "_trust", translate("Server’s CA certificate"))
lns_trust.wrap = "off"
lns_trust.rows = 4
lns_trust:depends("auth_mode", "tls-server")
lns_trust:depends("auth_mode", "tls-server-client")
lns_trust:depends("auth_mode", "tls-server-token")

function lns_trust.cfgvalue()
	return fs.readfile("/etc/station/tc.trust") or ""
end

function lns_trust.write(self, section, value)
	if value then
		fs.writefile("/etc/station/tc.trust", value:gsub("\r\n", "\n"))
		m:set(section, "trust", "/etc/station/tc.trust")
	end
end

function lns_trust.remove(self, section)
	fs.remove("/etc/station/tc.trust")
	m:del(section, "trust")
end

--
-- LNS Station Certificate
--
local lns_crt = lns:option(TextValue, "_crt", translate("Station’s Own Certificate"))
lns_crt.wrap = "off"
lns_crt.rows = 4
lns_crt:depends("auth_mode","tls-server-client")

function lns_crt.cfgvalue()
	return fs.readfile("/etc/station/tc.crt") or ""
end

function lns_crt.write(self, section, value)
	if value then
		fs.writefile("/etc/station/tc.crt", value:gsub("\r\n", "\n"))
		m:set(section, "crt", "/etc/station/tc.crt")
	end
end

function lns_crt.remove(self, section)
	fs.remove("/etc/station/tc.crt")
	m:del(section, "crt")
end

--
-- LNS Station Private Key
--
local lns_key = lns:option(TextValue, "_key", translate("Station’s Private Key"))
lns_key.wrap = "off"
lns_key.rows = 4
lns_key:depends("auth_mode","tls-server-client")

function lns_key.cfgvalue()
	return fs.readfile("/etc/station/tc.crt") or ""
end

function lns_key.write(self, section, value)
	if value then
		fs.writefile("/etc/station/tc.key", value:gsub("\r\n", "\n"))
		m:set(section, "key", "/etc/station/tc.key")		
	end
end

function lns_key.remove(self, section)
	fs.remove("/etc/station/tc.key")
	m:del(section, "key")
end

--
-- LNS Station Token
--
local lns_token = lns:option(Value, "token", translate("Station's Token"))
lns_token:depends("auth_mode","tls-server-token")


--
-- SX1301 configuration for SX1301_conf
--
local sx1301=m:section(TypedSection,"sx1301","SX1301 Parameters")
sx1301.addremove=false
sx1301.anonymous=true

local lorawan_pb = sx1301:option(ListValue,"lorawan_public",translate("LoRaWAN is public"))
lorawan_pb.optional = false;
lorawan_pb.rmempty = false;
lorawan_pb.default = false
lorawan_pb.datatype = "bool"
lorawan_pb:value(true, translate("True"))
lorawan_pb:value(false, translate("False"))

local clkscr = sx1301:option(ListValue,"clksrc",translate("Clock Source"), "radio_1 provides clock to concentrator for most devices except MultiTech. For MultiTech set to 0.")
clkscr.optional = false;
clkscr.rmempty = false;
clkscr.datatype = "integer"
clkscr:value(1, translate("from radio_1"))
clkscr:value(0, translate("from radio_0"))

--
-- Radio Parameters
--
local radio=m:section(TypedSection,"radio","Radio Parameters")
radio.addremove=false
radio.anonymous=false

--
-- Radio enable
--
local enable = radio:option(ListValue,"enable",translate("Enable"))
enable.optional = false;
enable.rmempty = false;
enable.default = false
enable.datatype = "bool"
enable:value(true, translate("True"))
enable:value(false, translate("False"))

--
-- Radio RF frontend
--
local type = radio:option(ListValue,"type",translate("Type"))
type.optional = false;
type.rmempty = false;
type.datatype = "string"
type:value("SX1257", translate("SX1257"))
type:value("SX1255", translate("SX1255"))

--
-- Radio Frequency
--
local freq = radio:option(Value,"freq",translate("Frequency"), "Hz")
freq.optional = true;
freq.rmempty = false;

--
-- RSSI offset
-- 
local rssi_offset = radio:option(Value,"rssi_offset",translate("RSSI Offset"), "dB")
rssi_offset.optional = false;
rssi_offset.rmempty = false;

--
-- Tx Enable
--
local tx_enable = radio:option(ListValue,"tx_enable",translate("Tx Enable"))
tx_enable.optional = false;
tx_enable.rmempty = false;
tx_enable.default = false
tx_enable.datatype = "bool"
tx_enable:value(true, translate("True"))
tx_enable:value(false, translate("False"))

--
-- Station Parameters
--
local station=m:section(TypedSection,"station","Station Parameters")
station.addremove=false
station.anonymous=false

--
-- Device
--
local device = station:option(Value,"device",translate("SPI Device"))
device.optional = true;
device.rmempty = false;
device:value("spidev0.0", "spidev0.0")
device:value("spidev0.1", "spidev0.1")
device:value("spidev?.0", "spidev?.0")

--
-- Radio Init
--

local radio_init = station:option(Value,"radio_init",translate("Radio Initlization File"))
radio_init.optional = true;
radio_init.rmempty = false;

--
-- GPS
--
local log_level = station:option(ListValue,"gps",translate("GPS"))
log_level.optional = true;
log_level.rmempty = true;
log_level.addremove = true;
log_level:value("DEVICEFILE", "DEVICEFILE")
log_level:value("FIFO", "FIFO")

--
-- PPS
--
local log_level = station:option(ListValue,"pps",translate("PPS"), "")
log_level.optional = true;
log_level.rmempty = false;
log_level:value("GPS", "gps")
log_level:value("Fuzzy", "fuzzy")

--
-- Log File
--
local log_file = station:option(Value,"log_file",translate("Log file location"))
log_file.optional = false;
log_file.rmempty = false;
log_file:value("stderr", "stderr")
log_file:value("/tmp/stationlog", "/tmp/stationlog")

--
-- Log Level
--
local log_level = station:option(ListValue,"log_level",translate("Log Level"))
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
local log_size = station:option(Value,"log_size",translate("Log Size"), "Byte")
log_size.optional = false;
log_size.rmempty = false;

--
-- Log Roteate
--
local log_rotate = station:option(Value,"log_rotate",translate("Log Rotate"))
log_rotate.optional = false;
log_rotate.rmempty = false;

m.on_after_commit = function(self)

--	io.popen("/etc/init.d/station restart")
end

return m
