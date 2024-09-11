# Copyright (c) 2023 by Battelle Energy Alliance

# The specific version of HART-IP used to create this parser
# First byte: 0x02 according to spec, 0x01 according to our test data
# Second byte: 0x00 - 0x02, 0x0F
# Third byte: 0x00 - 0x05
# Fourth byte: 0x00, 0x02, 0x05, 0x06, 0x08, 0x09, 0x0e, 0x0f, 0x10, 0x1e

signature dpd_hart_ip {
    #payload /^[\x01\x02][\x00-\x02\x0f][\x00-\x05][\x00\x02\x05\x06\x08\x09\x0e\x0f\x10\x1e]/
    payload/^[\x01\x02][\x00-\x02\x0f](\x00[\x00\x05\x06\x08\x09\x0e\x0f\x10\x1e][\x00-\xff]{2}\x00\x0d[\x00-\xff]{5})|(\x01[\x00\x06][\x00-\xff]{2}\x00\x08)|(\x02[\x00\x06][\x00-\xff]{2}\x00\x08)|(\x03[\x00\x06\x10][\x00-\xff]{6}([\x00-\xff]{4})?[\x00-\xff]{3,})|(\x04[\x00\x06\x10][\x00-\xff]{6}([\x00-\xff]{3,})+)|(\x05[\x00\x06\x08][\x00-\xff]{6}([\x00-\xff]{17}[\x00-\x07][\x00-\xff]{2}([\x00-\xff]{40}[\x00-\x1f][\x00-\xff]{16})+)?)/
}

signature dpd_hart_ip_tcp {
  ip-proto == tcp
  requires-signature dpd_hart_ip
  enable "spicy_HART_IP_TCP"
}

signature dpd_hart_ip_udp {
  ip-proto == udp
  requires-signature dpd_hart_ip
  enable "spicy_HART_IP_UDP"
}
