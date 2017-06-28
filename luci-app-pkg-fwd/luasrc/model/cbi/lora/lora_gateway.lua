m=Map("lora-global",translate("LoRa Gateway"),translate("LoRa Gateway Configuration"))

gateway=m:section(TypedSection,"gateway","Gateway Parameters")
gateway.addremove=false
gateway.anonymous=true

gateway:option(Value,"gateway_ID",translate("Gateway ID"))
gateway:option(Value,"server_address",translate("Server Address"))
gateway:option(Value,"serv_port_up",translate("Server Port (Up)"))
gateway:option(Value,"serv_port_down",translate("Server Port (Down)"))
gateway:option(Value,"keepalive_interval",translate("Keep Alive Interval"))
gateway:option(Value,"push_timeout_ms",translate("Push Timeout"))

fcv = gateway:option(ListValue,"forward_crc_valid",translate("Forward When CRC Valid"))
fcv.optional = false
fcv.rmempty = false
fcv.default = true
fcv.datatype = "bool"
fcv:value(true, translate("True"))
fcv:value(false, translate("False"))

fce = gateway:option(ListValue,"forward_crc_error",translate("Forward When CRC Error"));
fce.optional = false;
fce.rmempty = false;
fce.default = false
fce.datatype = "bool"
fce:value(true, translate("True"))
fce:value(false, translate("False"))


fcd = gateway:option(ListValue,"forward_crc_disabled",translate("Forward When CRC Disabled"))
fcd.optional = false;
fcd.rmempty = false;
fcd.default = false
fcd.datatype = "bool"
fcd:value(true, translate("True"))
fcd:value(false, translate("False"))

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

clkscr = sx1301:option(Value,"clksrc",translate("Clock Source"))
clkscr.optional = false;
clkscr.rmempty = false;

antenna_gain = sx1301:option(Value,"antenna_gain",translate("Antenne Gain"))
antenna_gain.optional = false;
antenna_gain.rmempty = false;

radio=m:section(TypedSection,"radio","Radio Parameters")
radio.addremove=false
radio.anonymous=false

enable = radio:option(ListValue,"enable",translate("Enable"))
enable .optional = false;
enable .rmempty = false;
enable .default = false
enable .datatype = "bool"
enable :value(true, translate("True"))
enable :value(false, translate("False"))

type = radio:option(Value,"type",translate("Type"))
type.optional = false;
type.rmempty = false;

freq = radio:option(Value,"freq",translate("Frequency"))
freq.optional = false;
freq.rmempty = false;

rssi_offset = radio:option(Value,"rssi_offset",translate("RSSI Offset"))
rssi_offset.optional = false;
rssi_offset.rmempty = false;

tx_enable = radio:option(ListValue,"tx_enable",translate("Tx Enable"))
tx_enable.optional = false;
tx_enable.rmempty = false;
tx_enable.default = false
tx_enable.datatype = "bool"
tx_enable:value(true, translate("True"))
tx_enable:value(false, translate("False"))

tx_freq_min= radio:option(Value,"tx_freq_min",translate("Minimum Tx Frequency"))
tx_freq_min.optional = false;
tx_freq_min.rmempty = false;
tx_freq_min:depends("tx_enable", "true")

tx_freq_max= radio:option(Value,"tx_freq_max",translate("Maximum Tx Frequency"))
tx_freq_max.optional = false;
tx_freq_max.rmempty = false;
tx_freq_max:depends("tx_enable", "true")

chan=m:section(TypedSection,"chan","Channel Parameters")
chan.addremove=false
chan.anonymous=false

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

interface = chan:option(Value,"if",translate("IF"))
interface.optional = false;
interface.rmempty = false;

lut=m:section(TypedSection,"lut","Tx LUT Parameters")
lut.addremove=false
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

return m


