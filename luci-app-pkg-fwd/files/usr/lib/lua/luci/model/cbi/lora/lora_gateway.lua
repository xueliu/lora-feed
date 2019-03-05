m=Map("lora-global",translate("LoRa Gateway"),translate("Here you can configure the LoRa gateway and pakcet forwarder"))

--
-- LoRa Gateway config for gateway_conf
--
gateway=m:section(TypedSection,"gateway","Gateway Parameters")
gateway.addremove=false
gateway.anonymous=true

gateway:tab("general",  translate("General Settings"))
gateway:tab("lbt",  translate("LBT Settings"))
gateway:tab("forward",  translate("Forward Rules"))
gateway:tab("gps", translate("GPS Settings"))
gateway:tab("beacon", translate("Beacon Settings"))

gateway:taboption("general", Value,"gateway_ID",translate("Gateway ID"))

local ttn_addr = gateway:taboption("general", Value,"server_address",translate("Server Address"))
ttn_addr:value("router.eu.thethings.network", "ttn-router-eu")
ttn_addr:value("router.us.thethings.network", "ttn-router-us-west")
ttn_addr:value("router.cn.thethings.network", "ttn-router-cn")
ttn_addr:value("router.as.thethings.network", "ttn-router-asia-se")
ttn_addr:value("router.as1.thethings.network", "ttn-router-asia-se-1")
ttn_addr:value("router.as2.thethings.network", "ttn-router-asia-se-2")
ttn_addr:value("router.kr.thethings.network", "ttn-router-kr")
ttn_addr:value("router.jp.thethings.network", "ttn-router-jp")
ttn_addr:value("thethings.meshed.com.au", "ttn-router-asia-se")
ttn_addr:value("as923.thethings.meshed.com.au", "meshed-router")
ttn_addr:value("ttn.opennetworkinfrastructure.org", "switch-router")

gateway:taboption("general", Value,"serv_port_up",translate("Server Port (Up)"))
gateway:taboption("general", Value,"serv_port_down",translate("Server Port (Down)"))
gateway:taboption("general", Value,"keepalive_interval",translate("Keep Alive Interval"))
gateway:taboption("general", Value,"push_timeout_ms",translate("Push Timeout"))

--
-- forward_crc_valid
--
forward_crc_valid = gateway:taboption("forward", ListValue,"forward_crc_valid",translate("Forward When CRC Valid"))
forward_crc_valid.optional = false
forward_crc_valid.rmempty = false
forward_crc_valid.default = true
forward_crc_valid.datatype = "bool"
forward_crc_valid:value(true, translate("True"))
forward_crc_valid:value(false, translate("False"))

--
-- forward_crc_error
--
forward_crc_error = gateway:taboption("forward", ListValue,"forward_crc_error",translate("Forward When CRC Error"));
forward_crc_error.optional = false;
forward_crc_error.rmempty = false;
forward_crc_error.default = false
forward_crc_error.datatype = "bool"
forward_crc_error:value(true, translate("True"))
forward_crc_error:value(false, translate("False"))

--
-- forward_crc_disabled
--
forward_crc_disabled = gateway:taboption("forward", ListValue,"forward_crc_disabled",translate("Forward When CRC Disabled"))
forward_crc_disabled.optional = false;
forward_crc_disabled.rmempty = false;
forward_crc_disabled.default = false
forward_crc_disabled.datatype = "bool"
forward_crc_disabled:value(true, translate("True"))
forward_crc_disabled:value(false, translate("False"))

--
-- LBT Enable
--
lbt_enable = gateway:taboption("lbt", ListValue,"lbt_enable",translate("LBT Enable"))
lbt_enable.optional = false;
lbt_enable.rmempty = false;
lbt_enable.default = false
lbt_enable.datatype = "bool"
lbt_enable:value(true, translate("True"))
lbt_enable:value(false, translate("False"))

--
-- GPS Enable
--
gps_enable = gateway:taboption("gps", ListValue,"gps_enable",translate("GPS Enable"))
gps_enable.optional = false;
gps_enable.rmempty = false;
gps_enable.default = false
gps_enable.datatype = "bool"
gps_enable:value(true, translate("True"))
gps_enable:value(false, translate("False"))

--
-- TTY path for GPS
--
gps_tty_path = gateway:taboption("gps", Value,"gps_tty_path",translate("TTY path for GPS"))
gps_tty_path.optional = true;
gps_tty_path.rmempty = true;
gps_tty_path.default = false
gps_tty_path.datatype = "string"
gps_tty_path:depends("gps_enable", "true")

--
-- GPS reference coordinates: latitude
--
gps_latitude = gateway:taboption("gps", Value,"ref_latitude",translate("GPS Reference Latitude"))
gps_latitude.optional = true;
gps_latitude.rmempty = true;
gps_latitude.default = '1.0'
gps_latitude.datatype = "float"
gps_latitude:depends("gps_enable", "true")

--
-- GPS reference coordinates: longitude
--
gps_longitude = gateway:taboption("gps", Value,"ref_longitude",translate("GPS Reference Longitude"))
gps_longitude.optional = true;
gps_longitude.rmempty = true;
gps_longitude.default = '1.0'
gps_longitude.datatype = "float"
gps_longitude:depends("gps_enable", "true")

--
-- GPS reference coordinates: altitude
--
gps_altitude = gateway:taboption("gps", Value,"ref_altitude",translate("GPS Reference Altitude"))
gps_altitude.optional = true;
gps_altitude.rmempty = true;
gps_altitude.default = '1.0'
gps_altitude.datatype = "float"
gps_altitude:depends("gps_enable", "true")

--
-- Beacon enable
--
beacon_enable = gateway:taboption("beacon", ListValue,"beacon_enable",translate("Beacon Enable"))
beacon_enable.optional = false;
beacon_enable.rmempty = false;
beacon_enable.default = false
beacon_enable.datatype = "bool"
beacon_enable:value(true, translate("True"))
beacon_enable:value(false, translate("False"))

--
-- Beacon period
--
beacon_period = gateway:taboption("beacon", Value,"beacon_period",translate("Beacon Period"), "in second")
beacon_period.optional = true;
beacon_period.rmempty = true;
beacon_period.default = '128'
beacon_period.datatype = "uinteger"
beacon_period:depends("beacon_enable", "true")

--
-- Beacon channel frequency
--
beacon_frequency = gateway:taboption("beacon", Value,"beacon_frequency",translate("Beacon Channel Frequency"), "in Hz")
beacon_frequency.optional = true;
beacon_frequency.rmempty = true;
beacon_frequency.default = '869525000'
beacon_frequency.datatype = "uinteger"
beacon_frequency:depends("beacon_enable", "true")

--
-- Beacon channel datarate
--
beacon_datarate = gateway:taboption("beacon", Value,"beacon_datarate",translate("Beacon Channel Datarate"))
beacon_datarate.optional = true;
beacon_datarate.rmempty = true;
beacon_datarate.default = '9'
beacon_datarate.datatype = "uinteger"
beacon_datarate:depends("beacon_enable", "true")

--
-- Beacon channel bandwidth
--
beacon_bandwidth = gateway:taboption("beacon", Value,"beacon_bandwidth",translate("Beacon Channel Bandwidth"), "in Hz")
beacon_bandwidth.optional = true;
beacon_bandwidth.rmempty = true;
beacon_bandwidth.default = '125000'
beacon_bandwidth.datatype = "uinteger"
beacon_bandwidth:depends("beacon_enable", "true")

--
-- Beacon signal strength
--
beacon_power = gateway:taboption("beacon", Value,"beacon_power",translate("Beacon Signal Strength"), "in dBm")
beacon_power.optional = true;
beacon_power.rmempty = true;
beacon_power.default = '14'
beacon_power.datatype = "uinteger"
beacon_power:depends("beacon_enable", "true")

--
-- Beacon info description
--
beacon_infodesc = gateway:taboption("beacon", Value,"beacon_infodesc",translate("Beacon Info Description"))
beacon_infodesc.optional = true;
beacon_infodesc.rmempty = true;
beacon_infodesc.default = '0'
beacon_infodesc.datatype = "uinteger"
beacon_infodesc:depends("beacon_enable", "true")

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
clkscr:value(1, translate("From radio_1"))
clkscr:value(0, translate("From radio_0"))

antenna_gain = sx1301:option(Value,"antenna_gain",translate("Antenne Gain"), "Antenna Gain, in dBi")
antenna_gain.optional = false;
antenna_gain.rmempty = false;

enable_reset_pin = sx1301:option(Flag,"enable_reset_pin",translate("Enable Reset Pin ?"), "Some SX1301 boards like iC880A require to reset every time after restart")
enable_reset_pin.optional = false;
enable_reset_pin.rmempty = false;
enable_reset_pin.disabled = 0
enable_reset_pin.enable = 1

reset_pin = sx1301:option(Value,"reset_pin",translate("Reset Pin"), "Reset SX1301 board")
reset_pin.optional = false;
reset_pin.rmempty = true;
reset_pin.default = 21
reset_pin:depends("enable_reset_pin", "1")

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
freq.optional = false;
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

tx_notch_freq= radio:option(Value,"tx_notch_freq",translate("Tx Notch Frequency"), "[126..250] KHz")
tx_notch_freq.optional = false;
tx_notch_freq.rmempty = true;
tx_notch_freq:depends("tx_enable", "true")

tx_freq_min= radio:option(Value,"tx_freq_min",translate("Minimum Tx Frequency"), "Hz")
tx_freq_min.optional = false;
tx_freq_min.rmempty = true;
tx_freq_min:depends("tx_enable", "true")

tx_freq_max= radio:option(Value,"tx_freq_max",translate("Maximum Tx Frequency"), "Hz")
tx_freq_max.optional = false;
tx_freq_max.rmempty = true;
tx_freq_max:depends("tx_enable", "true")

--
-- chann
--
chan=m:section(TypedSection,"chan","Channel Parameters")
chan.addremove=true
chan.anonymous=false

description = chan:option(Value ,"desc",translate("Description"))
enable.optional = false;
enable.rmempty = false;

enable = chan:option(ListValue,"enable",translate("Enable"))
enable.optional = false;
enable.rmempty = false;
enable.default = true
enable.datatype = "bool"
enable:value(true, translate("True"))
enable:value(false, translate("False"))

radio = chan:option(Value,"radio",translate("Radio"))
radio.optional = false;
radio.rmempty = false;

interface = chan:option(Value,"if",translate("IF"), "Hz")
interface.optional = false;
interface.rmempty = false;

bandwidth = chan:option(Value,"bandwidth",translate("Bandwidth"))
bandwidth.optional = true;
bandwidth.rmempty = false;

spread_factor = chan:option(Value,"spread_factor",translate("Spread Factor"))
spread_factor.optional = true;
spread_factor.rmempty =false;
datarate = chan:option(Value,"datarate",translate("Datarate"))
datarate.optional = true;
datarate.rmempty = false;

--m=Map("lora-global",translate("LoRa Gateway"),translate("Here you can configure the LoRa gateway and pakcet forwarder"))

--
-- LoRa Gateway config for gateway_conf
--
gateway=m:section(TypedSection,"gateway","Gateway Parameters")
gateway.addremove=false
gateway.anonymous=true

gateway:tab("general",  translate("General Settings"))
gateway:tab("lbt",  translate("LBT Settings"))
gateway:tab("forward",  translate("Forward Rules"))
gateway:tab("gps", translate("GPS Settings"))
gateway:tab("beacon", translate("Beacon Settings"))

gateway:taboption("general", Value,"gateway_ID",translate("Gateway ID"))

local ttn_addr = gateway:taboption("general", Value,"server_address",translate("Server Address"))
ttn_addr:value("router.eu.thethings.network", "ttn-router-eu")
ttn_addr:value("router.us.thethings.network", "ttn-router-us-west")
ttn_addr:value("router.cn.thethings.network", "ttn-router-cn")
ttn_addr:value("router.as.thethings.network", "ttn-router-asia-se")
ttn_addr:value("router.as1.thethings.network", "ttn-router-asia-se-1")
ttn_addr:value("router.as2.thethings.network", "ttn-router-asia-se-2")
ttn_addr:value("router.kr.thethings.network", "ttn-router-kr")
ttn_addr:value("router.jp.thethings.network", "ttn-router-jp")
ttn_addr:value("thethings.meshed.com.au", "ttn-router-asia-se")
ttn_addr:value("as923.thethings.meshed.com.au", "meshed-router")
ttn_addr:value("ttn.opennetworkinfrastructure.org", "switch-router")

gateway:taboption("general", Value,"serv_port_up",translate("Server Port (Up)"))
gateway:taboption("general", Value,"serv_port_down",translate("Server Port (Down)"))
gateway:taboption("general", Value,"keepalive_interval",translate("Keep Alive Interval"))
gateway:taboption("general", Value,"push_timeout_ms",translate("Push Timeout"))

--
-- forward_crc_valid
--
forward_crc_valid = gateway:taboption("forward", ListValue,"forward_crc_valid",translate("Forward When CRC Valid"))
forward_crc_valid.optional = false
forward_crc_valid.rmempty = false
forward_crc_valid.default = true
forward_crc_valid.datatype = "bool"
forward_crc_valid:value(true, translate("True"))
forward_crc_valid:value(false, translate("False"))

--
-- forward_crc_error
--
forward_crc_error = gateway:taboption("forward", ListValue,"forward_crc_error",translate("Forward When CRC Error"));
forward_crc_error.optional = false;
forward_crc_error.rmempty = false;
forward_crc_error.default = false
forward_crc_error.datatype = "bool"
forward_crc_error:value(true, translate("True"))
forward_crc_error:value(false, translate("False"))

--
-- forward_crc_disabled
--
forward_crc_disabled = gateway:taboption("forward", ListValue,"forward_crc_disabled",translate("Forward When CRC Disabled"))
forward_crc_disabled.optional = false;
forward_crc_disabled.rmempty = false;
forward_crc_disabled.default = false
forward_crc_disabled.datatype = "bool"
forward_crc_disabled:value(true, translate("True"))
forward_crc_disabled:value(false, translate("False"))

--
-- LBT Enable
--
lbt_enable = gateway:taboption("lbt", ListValue,"lbt_enable",translate("LBT Enable"))
lbt_enable.optional = false;
lbt_enable.rmempty = false;
lbt_enable.default = false
lbt_enable.datatype = "bool"
lbt_enable:value(true, translate("True"))
lbt_enable:value(false, translate("False"))

--
-- RSSI Target
--
lbt_rssi_target = gateway:taboption("lbt", Value,"rssi_target",translate("RSSI Target Value"))
lbt_rssi_target.optional = true;
lbt_rssi_target.rmempty = true;
lbt_rssi_target.default = '-80'
lbt_rssi_target.datatype = "float"
lbt_rssi_target:depends("lbt_enable", "true")

--
-- sx127x RSSI Offset
--
rssi_offset = gateway:taboption("lbt", Value,"sx127x_rssi_offset",translate("SX127x RSSI Offset"))
rssi_offset.optional = true;
rssi_offset.rmempty = true;
rssi_offset.default = '-4'
rssi_offset.datatype = "float"
rssi_offset:depends("lbt_enable", "true")

--
-- GPS Enable
--
gps_enable = gateway:taboption("gps", ListValue,"gps_enable",translate("GPS Enable"))
gps_enable.optional = false;
gps_enable.rmempty = false;
gps_enable.default = false
gps_enable.datatype = "bool"
gps_enable:value(true, translate("True"))
gps_enable:value(false, translate("False"))

--
-- TTY path for GPS
--
gps_tty_path = gateway:taboption("gps", Value,"gps_tty_path",translate("TTY path for GPS"))
gps_tty_path.optional = true;
gps_tty_path.rmempty = true;
gps_tty_path.default = false
gps_tty_path.datatype = "string"
gps_tty_path:depends("gps_enable", "true")

--
-- GPS reference coordinates: latitude
--
gps_latitude = gateway:taboption("gps", Value,"ref_latitude",translate("GPS Reference Latitude"))
gps_latitude.optional = true;
gps_latitude.rmempty = true;
gps_latitude.default = '1.0'
gps_latitude.datatype = "float"
gps_latitude:depends("gps_enable", "true")

--
-- GPS reference coordinates: longitude
--
gps_longitude = gateway:taboption("gps", Value,"ref_longitude",translate("GPS Reference Longitude"))
gps_longitude.optional = true;
gps_longitude.rmempty = true;
gps_longitude.default = '1.0'
gps_longitude.datatype = "float"
gps_longitude:depends("gps_enable", "true")

--
-- GPS reference coordinates: altitude
--
gps_altitude = gateway:taboption("gps", Value,"ref_altitude",translate("GPS Reference Altitude"))
gps_altitude.optional = true;
gps_altitude.rmempty = true;
gps_altitude.default = '1.0'
gps_altitude.datatype = "float"
gps_altitude:depends("gps_enable", "true")

--
-- Beacon enable
--
beacon_enable = gateway:taboption("beacon", ListValue,"beacon_enable",translate("Beacon Enable"))
beacon_enable.optional = false;
beacon_enable.rmempty = false;
beacon_enable.default = false
beacon_enable.datatype = "bool"
beacon_enable:value(true, translate("True"))
beacon_enable:value(false, translate("False"))

--
-- Beacon period
--
beacon_period = gateway:taboption("beacon", Value,"beacon_period",translate("Beacon Period"), "in second")
beacon_period.optional = true;
beacon_period.rmempty = true;
beacon_period.default = '128'
beacon_period.datatype = "uinteger"
beacon_period:depends("beacon_enable", "true")

--
-- Beacon channel frequency
--
beacon_frequency = gateway:taboption("beacon", Value,"beacon_frequency",translate("Beacon Channel Frequency"), "in Hz")
beacon_frequency.optional = true;
beacon_frequency.rmempty = true;
beacon_frequency.default = '869525000'
beacon_frequency.datatype = "uinteger"
beacon_frequency:depends("beacon_enable", "true")

--
-- Beacon channel datarate
--
beacon_datarate = gateway:taboption("beacon", Value,"beacon_datarate",translate("Beacon Channel Datarate"))
beacon_datarate.optional = true;
beacon_datarate.rmempty = true;
beacon_datarate.default = '9'
beacon_datarate.datatype = "uinteger"
beacon_datarate:depends("beacon_enable", "true")

--
-- Beacon channel bandwidth
--
beacon_bandwidth = gateway:taboption("beacon", Value,"beacon_bandwidth",translate("Beacon Channel Bandwidth"), "in Hz")
beacon_bandwidth.optional = true;
beacon_bandwidth.rmempty = true;
beacon_bandwidth.default = '125000'
beacon_bandwidth.datatype = "uinteger"
beacon_bandwidth:depends("beacon_enable", "true")

--
-- Beacon signal strength
--
beacon_power = gateway:taboption("beacon", Value,"beacon_power",translate("Beacon Signal Strength"), "in dBm")
beacon_power.optional = true;
beacon_power.rmempty = true;
beacon_power.default = '14'
beacon_power.datatype = "uinteger"
beacon_power:depends("beacon_enable", "true")

--
-- Beacon info description
--
beacon_infodesc = gateway:taboption("beacon", Value,"beacon_infodesc",translate("Beacon Info Description"))
beacon_infodesc.optional = true;
beacon_infodesc.rmempty = true;
beacon_infodesc.default = '0'
beacon_infodesc.datatype = "uinteger"
beacon_infodesc:depends("beacon_enable", "true")

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
clkscr:value(1, translate("From radio_1"))
clkscr:value(0, translate("From radio_0"))

antenna_gain = sx1301:option(Value,"antenna_gain",translate("Antenne Gain"), "Antenna Gain, in dBi")
antenna_gain.optional = false;
antenna_gain.rmempty = false;

enable_reset_pin = sx1301:option(Flag,"enable_reset_pin",translate("Enable Reset Pin ?"), "Some SX1301 boards like iC880A require to reset every time after restart")
enable_reset_pin.optional = false;
enable_reset_pin.rmempty = false;
enable_reset_pin.disabled = 0
enable_reset_pin.enable = 1

reset_pin = sx1301:option(Value,"reset_pin",translate("Reset Pin"), "Reset SX1301 board")
reset_pin.optional = false;
reset_pin.rmempty = true;
reset_pin.default = 21
reset_pin:depends("enable_reset_pin", "1")

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
freq.optional = false;
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

tx_notch_freq= radio:option(Value,"tx_notch_freq",translate("Tx Notch Frequency"), "[126..250] KHz")
tx_notch_freq.optional = false;
tx_notch_freq.rmempty = true;
tx_notch_freq:depends("tx_enable", "true")

tx_freq_min= radio:option(Value,"tx_freq_min",translate("Minimum Tx Frequency"), "Hz")
tx_freq_min.optional = false;
tx_freq_min.rmempty = true;
tx_freq_min:depends("tx_enable", "true")

tx_freq_max= radio:option(Value,"tx_freq_max",translate("Maximum Tx Frequency"), "Hz")
tx_freq_max.optional = false;
tx_freq_max.rmempty = true;
tx_freq_max:depends("tx_enable", "true")

--
-- chann
--
chan=m:section(TypedSection,"chan","Channel Parameters")
chan.addremove=true
chan.anonymous=false

description = chan:option(Value ,"desc",translate("Description"))
enable.optional = false;
enable.rmempty = false;

enable = chan:option(ListValue,"enable",translate("Enable"))
enable.optional = false;
enable.rmempty = false;
enable.default = true
enable.datatype = "bool"
enable:value(true, translate("True"))
enable:value(false, translate("False"))

radio = chan:option(Value,"radio",translate("Radio"))
radio.optional = false;
radio.rmempty = false;

interface = chan:option(Value,"if",translate("IF"), "Hz")
interface.optional = false;
interface.rmempty = false;

bandwidth = chan:option(Value,"bandwidth",translate("Bandwidth"))
bandwidth.optional = true;
bandwidth.rmempty = false;

spread_factor = chan:option(Value,"spread_factor",translate("Spread Factor"))
spread_factor.optional = true;
spread_factor.rmempty =false;

datarate = chan:option(Value,"datarate",translate("Datarate"))
datarate.optional = true;
datarate.rmempty = false;

--
-- TX gain tables
--
lut=m:section(TypedSection,"lut","Tx LUT Parameters")
lut.addremove=true
lut.anonymous=false

pa_gain = lut:option(Value,"pa_gain",translate("PA Gain"))
pa_gain.optional = false;
pa_gain.rmempty = false;

mix_gain = lut:option(Value,"mix_gain",translate("Minimum Gain"))
mix_gain.optional = false;
mix_gain.rmempty = false;

rf_power = lut:option(Value,"rf_power",translate("RF Power"))
rf_power.optional = false;
rf_power.rmempty = false;

dig_gain = lut:option(Value,"dig_gain",translate("Dig Gain"))
dig_gain.optional = false;
dig_gain.rmempty = false;

m.on_after_commit = function(self)

	io.popen("/etc/init.d/lora_pkt_fwd restart")
end

return m

