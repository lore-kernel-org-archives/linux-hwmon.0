Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E2437F8BC;
	Fri,  3 Apr 2026 13:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775223276; cv=none; b=DUH3Eg8udOvjgEjZ7jQp23aX1UVrImHmV9M3f6F7EoAkBvthgJeHJuJmJ6j1UqvR4AkgouycuXZn4yXwzVVuLmGm04eHBmx8J9nRShzFjDKzQBQthmBaJ5gXAqOC6CWqBX//7DkodrH/55PaW5jgJe7Dyo+0DA8A1pxDN/bXMr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775223276; c=relaxed/simple;
	bh=Mr33kW5ieAqPSHZ9Oh8Z2Ids7xoXc/WOLMMyqPJVpGs=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=QmhWQ8MiCdWxUHHQMGdLlkP1ILzY3XvXmOcB2xyQ7wDHhtCpHpkZB0NuCWTpRyo646We9QZg+ujalYSFD5Mhg1nbXk56WasjDnqMZqjatDslTq4BDhMF9h+8yO3R2sqiMVznFPX6K7xQfFwOSvhrzXpBXj9HFfDVVIHXSu7uI3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=N65Gc6pY; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="N65Gc6pY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1775223273; x=1806759273;
  h=from:subject:date:message-id:mime-version:
   content-transfer-encoding:to:cc;
  bh=Mr33kW5ieAqPSHZ9Oh8Z2Ids7xoXc/WOLMMyqPJVpGs=;
  b=N65Gc6pYzJFy4DAaOitZ42jljd61UJH4/pF2K1Vtkxi6yXIctkjK4y7U
   eW0lgaWsPZBKjnGNSzsx1JLzJWG+JbKeU6Zn1/LN9YIma0Zjzu+3GDIi3
   AK5R+uiqf1QG1BW2Eq8jD7aKqXcmGz8y+RMDABCRdqDxaYANcz4zWNh0n
   AkHXrBgpX6j8UyNAUTbU7rZdU4PIrz+n6hVFkBv6G7Y4MLLzXO9AFJpma
   ozXoKCx6D4Jj9moFDbFgNcoveGXVkiUyjxEG/nnyLGbOCmhnLP6KT+CPg
   PTcjZD2jl50SE1STRVJGal44LtJ5CnLkKtw+DF9BF3OPS9df/82cj5YDj
   Q==;
X-CSE-ConnectionGUID: af5oL4wRScqpqlSOtoYDHA==
X-CSE-MsgGUID: 0JpcHlv3RwabeQDy4aMosQ==
X-IronPort-AV: E=Sophos;i="6.23,157,1770620400"; 
   d="scan'208";a="54881212"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2026 06:34:32 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.87.152) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.35; Fri, 3 Apr 2026 06:34:10 -0700
Received: from [127.0.1.1] (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Fri, 3 Apr 2026 06:34:07 -0700
From: Victor Duicu <victor.duicu@microchip.com>
Subject: [PATCH v12 0/2] add support in hwmon for MCP998X
Date: Fri, 3 Apr 2026 16:32:15 +0300
Message-ID: <20260403-add-mcp9982-hwmon-v12-0-b3bfb26ff136@microchip.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF/Bz2kC/32NSw7CMAxEr4K8xiifEmFW3AN1EdxAvEhTJaiAq
 t6d0AOwnKeZNwvUUCRUOO8WKGGWKnlsQZv9Djj68RFQhgbAKOOUVUf0w4CJJ6KTwfhKeUTyTK5
 jbzVpaLuphLu8N+m1bzlKfeby2T5mrX/4n65VUKELpLubd9ZYuiThkjnKdOCcoF/X9QtsgFpgu
 QAAAA==
X-Change-ID: 20260305-add-mcp9982-hwmon-9ac964ca3191
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
CC: <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<marius.cristea@microchip.com>, <victor.duicu@microchip.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775223246; l=15564;
 i=victor.duicu@microchip.com; s=20260213; h=from:subject:message-id;
 bh=Mr33kW5ieAqPSHZ9Oh8Z2Ids7xoXc/WOLMMyqPJVpGs=;
 b=+r3VIT+fPDbJl7atwZT/H+j9K4tInKzS3rSZ9u5rCqRhOxLclkSdtz4xcs/oOBS0F7EM48pMx
 o37zpt7y3HtA8TEjctGnwUCCVuOvhcJ4q7nrkXhdVMy+CXHCRDIyaxm
X-Developer-Key: i=victor.duicu@microchip.com; a=ed25519;
 pk=/o+aE26HN3Piv9T5t+efqb0aeJw9ErwMPeSC8lYXQsA=

Add support in hwmon for Microchip MCP998X/33 and MCP998XD/33D
Multichannel Automotive Temperature Monitor Family.

The chips in the family have different numbers of external channels,
ranging from 1(MCP9982) to 4 channels (MCP9985).
Reading diodes in anti-parallel connection is supported by MCP9984/85/33
and MCP9984D/85D/33D.
Dedicated hardware shutdown circuitry is present only in MCP998XD
and MCP9933D.

The driver supports reading the temperature channels, the temperature
limits, the limit hysteresis and their corresponding alarms. The user can
set the limits, the update interval and the hysteresis value through
the critical limit hysteresis.

Differences related to previous patch:
v12:
- in devicetree list items in enum.
- make microchip,parasitic-res-on-channel3-4
  required only for the "D" chips that are
  affected by it.
- in mcp9982.rst rephrase to "device starts
  with a 10 degree hysteresis".
- in driver check recd34 is enabled only for
  the "D" chips that are affected by it.
- in mcp9982_read() initiate a conversion cycle
  only when reading temperature values and alarms.
  Use poll function to check the BUSY bit.
- define hyst as unsigned int.
- add comment to clarify that in Standby mode,
  after writing in OneShot register 125ms need
  to pass before the conversion cycle begins.
- add comment to clarify the behavior of the chip
  regarding block read.
- rework the way temperature limits and hysteresis
  are written in order to round the result instead
  of truncating.
- return regmap_write() directly where applicable.
- in mcp9982_write() use clamp_val().
- in mcp9982_init(), if update interval value is 
  outside mcp9982_update_interval[] set default
  value of 1 second.
- use device_for_each_named_child_node_scoped().
- rephrase some comments.
- link to v11: https://lore.kernel.org/r/20260305-add-mcp9982-hwmon-v11-0-6e914ba63239@microchip.com

v11:
- in devicetree set minItems to interrupts.
- in interrupt-names define both items and remove maxItems.
- in conditionals list the items that must be present.
- in driver in mcp9982_write_limit() calculate regh and regl
  at the start of the function.
- link to v10: https://lore.kernel.org/all/20260217-add-mcp9982-hwmon-v10-0-5e0aaae6f289@microchip.com/

v10:
- in devicetree rework interrupt-names.
- rework conditionals to disable the channels that are not used.
- in patternProperties remove minItems from reg and change maxItems to 1.
- in mcp9982.rst fix indentation errors and clarify sysfs entries
  regarding limit hysteresis.
- add power state in the list of devicetree parameters.
- in driver change default high and critical temperature limit
  value to 85000.
- rework driver to not force wait until the next conversion is done.
  Only in Standby state wait the wake up time.
- fix typo in comment about mcp9982_priv.
- remove bitwise operations with mask FF.
- remove clamp_val() from limit hysteresis calculation.
- edit comments regarding block read and write.
- in mcp9982_write_limit() replace bulk write with two writes.
- in mcp9982_write() remove pointless assignment to ret.
- in mcp9982_init() do not override update interval.
- define mcp998x_chip_info as static const struct.
- link to v9: https://lore.kernel.org/all/20260127151823.9728-1-victor.duicu@microchip.com/

v9:
- update copyright year.
- add tempX_max_hyst and tempX_crit_hyst attributes and document
  them in mcp9982.rst.
- in include list add byteorder/generic.h and remove unaligned.h.
- remove definitions for temperature memory block
  and status memory block.
- remove individual definitions for register addresses 1Dh->21h.
- add constants MCP9982_WAKE_UP_TIME_MAX_US and
  MCP9982_TIMER_BUFFER_US.
- add checks to ensure that values read from registers are on 8 bits.
- in mcp9982_read_limit() simplify calculation, replace bulk read
  with individual operations and add comment.
- in mcp9982_read_limit() add explicit case branches for limits
  that are on 16 bits.
- in mcp9982_read() replace mdelay() with usleep_range().
- in mcp9982_read() replace block reading for temperature values with
  individual operations, add comment and remove unnecessary
  mask variable.
- in regmap_read_poll_timeout() add final timeout.
- in mcp9982_read_label() remove label check.
- in mcp9982_write_limit() replace put_unaligned_be16() with cpu_to_be16().
- in mcp9982_write_limit() add explicit case branches for limits
  that are on 16 bits.
- in mcp9982_init() write default value for diode alert mask register.
- in mcp9982_parse_fw_config() replace E2BIG with EINVAL.
- link to v8: https://lore.kernel.org/all/20251120071248.3767-1-victor.duicu@microchip.com/

v8:
- in Kconfig add select REGMAP_I2C.
- in yaml add power state attribute. For chips with "D" in the name
  check that Run mode is set in yaml and driver.
- in the include list: remove cleanup.h, add math.h, minmax.h and
  util_macros.h.
- add min, max and crit limits for all channels. These attributes can
  be read and written. In mcp9982_init() set default values for limits.
- add alarms for limits.
- edit regmap ranges to add the limit registers.
- when writing update interval, don't force the user to set exact value.
  Search for closest valid value.
- in mcp9982_parse_fw_config() check value from fwnode_property_read_u32().
- edit coding style and comments.
- remove constant MCP9982_SCALE.
- rename variable sampl_idx from mcp9982_priv to interval_idx.
- in mcp9982_write() rename variable use_previous_freq
  to use_previous_interval.
- link to v7: https://lore.kernel.org/all/20251031155831.42763-1-victor.duicu@microchip.com/

v7:
- send driver to hwmon subsystem.
- include index.rst and mcp9982.rst.
- in microchip,mcp9982.yaml set microchip,parasitic-res-on-channel1-2
  and 3-4 to required.
- in mcp9982.c rework read raw, read label and write raw functions.
- remove avail parameters.
- rework sampling frequency to update interval.
- lock running average filter to off.
- rework definition of channels.
- add cache type Maple to mcp9982_regmap_config().
- define constants for the numerical values used.
- in include list add: bitops.h, cleanup.h, device.h, hwmon.h,
  time64.h, unaligned.h. Remove iio.h, math64.h, string.h, units.h.
- add explicit definitions for beta and ideality registers.
- add definitions for status memory block registers.
- add mcp9982_is_visible() and set visible only the channels
  that are enabled.
- in mcp9982_parse_fw_config() add branch with default values for
  systems that do not have devicetree or firmware nodes.
- remove mutex.
- link to v6: https://lore.kernel.org/all/20250930133131.13797-1-victor.duicu@microchip.com/

Differences related to the IIO patch:

v6:
- in yaml first condition list part numbers instead
  of regular expression. Add ^ to regular expression.
- edit coding style and comments.
- use hex values in defines.
- remove MCP9982_TEMP_MEM_BLOCK_LOW and
  MCP9982_TEMP_MEM_BLOCK_HIGH.
- in MCP9982_CHAN() place macro parameters in ().
- move all variable definitions at the start of functions.
- in mcp9982_parse_fw_config() initialise iio_idx to 0.
- remove bit flags.
- in MCP9982_CHAN remove outer ().
- remove variable start in mcp9982_write_raw().
- replace constant in .max_register.
- use get_unaligned_be16 in mcp9982_read_raw().
- link to v5: https://lore.kernel.org/all/20250918111937.5150-1-victor.duicu@microchip.com/

v5:
- in yaml edit description of interrupts.
- add min and maxItems to reg.
- remove ideality parameter.
- use pattern recognition in conditionals.
- group conditions based on the chip.
- correct microchip,parasitic-res-on-channel3-4 to true.
- in driver include bitops.h.
- change name of some variables.
- rename mcp9982_parse_of_config() to mcp9982_parse_fw_config().
- implement bulk reading of temp registers.
- lock ideality parameter to default value.
- implement bit flags.
- add compound literal to MCP9982_CHAN.
- remove hysteresis parameter.
- edit comments.
- change values from int to bool in mcp9982_features.
- remove mcp9982_calc_all_3db_values() and hardcode values.
  When filter is OFF the 3db value is equal to frequency.
- add .max_register to regmap_config.
- remove devm_kcalloc().
- in mcp9982_read_avail() add an else branch to hw_thermal_shutdown
  check.
- in mcp9982_read_raw use USEC_PER_MSEC and set regmap_read_poll_timeout
  to never timeout.
  Replace switch with bitmap_weight.
- in mcp9982_read_label() remove unnecessary if.
- in mcp9982_write_raw() remove duplicated code.
- in mcp9982_init add error messages when APDD and RECD are incorrectly
  set.
- in mcp9982_parse_fw_config() add default for reg_nr.
- link to v4: https://lore.kernel.org/all/20250829143447.18893-1-victor.duicu@microchip.com/

v4:
- lock beta parameters to default value of beta-autodetect.
  Remove beta parameters and checks from devicetree.
- lock temperature range to extended.
  This change avoids the issue of the average filter using raw values
  with different scales when changing the range.
- change driver to wait an amount of time before reading a raw value
  to ensure it is valid.
- change driver to stop calculating the physical temp when reading
  in_tempx_raw. Reading from in_tempx_raw will return the raw value.
  The physical temp will be calculated with in_tempx_raw, scale and
  offset parameters.
- add scale parameter to channel definition.
- initialise chips with "D" to work in Run state and those without
  in Standby state.
- when activating the low pass filter for chips without "D",
  set the power state to RUN to ensure fresh values for the average.
- add minimum and maximum to microchip,beta1 and microchip,beta2 in yaml.
- rename microchip,resistance-comp-ch1-2-enable and
  microchip,resistance-comp-ch3-4-enable to
  microchip,parasitic-res-on-channel1-2
  and microchip,parasitic-res-on-channel3-4
  and edit description in yaml.
- add conditional logic to check if the chip supports APDD
  and force default values where necessary in yaml.
- edit comments and coding style.
- replace asm/div64.h with linux/math64.h.
- add delay.h to includes.
- redefine mcp9982_sampl_fr with new structure division.
- in mcp9982_priv remove dev_name,extended_temp_range and beta_values.
  Add run_state, wait_before_read, time_limit and pointer to chip
  structure to remove all instances of matching strings.
  Reorder parameters for memory optimization.
- in mcp9982_features add flags to know if the chip has thermal shutdown
  circuitry and supports APDD.
- in mcp9982_read_avail() rework verification of chip type in sampling
  frequency case.
- in mcp9982_read_raw() rework switch in low pass filter case.
- in mcp9982_parse_of_config() replace generic -EINVAL code
  with -E2BIG and -EOVERFLOW.
- link to v3: https://lore.kernel.org/all/20250613130207.8560-1-victor.duicu@microchip.com/

v3:
- move beta parameters to devicetree.
- change the name of the interrupts and add
  check to match them to the device in yaml.
- remove label for device and remove "0x" from
  channel registers in example in yaml.
- edit comments in yaml and driver.
- add minItems to interrupts in yaml.
- rename microchip,recd12 and microchip,recd34 to
  microchip,resistance-comp-ch1-2-enable
  and microchip,resistance-comp-ch3-4-enable.
- rename microchip,apdd-state to microchip,enable-anti-parallel.
- add static to mcp9982_3db_values_map_tbl to fix
  kernel test robot warning.
- in mcp9982_init() add check to ensure that hardware
  shutdown feature can't be overridden.
- replace div_u64_rem with do_div and add
  asm/div64.h to includes.
- remove unused includes.
- add iio_chan_spec in the macro definition of MCP9982_CHAN.
- remove MCP9982_EXT_BETA_ENBL.
- in mcp9982_init() replace regmap_assign_bits
  with regmap_write when setting beta compensation.
- remove custom attribute enable_extended_temp_range and
  map it to IIO_CHAN_INFO_OFFSET.
- add unsigned to int variables that allow it.
- reorder parameters in mcp9982_priv, change some
  from int to bool, add const to labels and add dev_name.
- add check for chips with "D" in the name to not
  allow sampling frequencies lower than 1 to
  prevent overriding of hardware shutdown.
- remove mcp9982_attributes.
- move mcp9982_calc_all_3db_values() to before
  mcp9982_init().
- use MICRO instead of number constant.
- in mcp9982_write_raw replace ">=" with "==".
- rename index2 to idx in mcp9982_read_raw().
- remove i2c_set_clientdata() in mcp9982_probe().
- since there are no more custom ABI attributes
  the testing file was removed.
- link to v2: https://lore.kernel.org/all/20250529093628.15042-1-victor.duicu@microchip.com/

v2:
- move hysteresis, extended temperature range and beta parameters
  from devicetree into user space.
- edit comments in yaml and driver.
- remove "|" in descpriptions, remove "+" from PatternProperties in yaml.
- add default to microchip,ideality-factor, delete blank lines and wrap to
  80 chars in yaml.
- remove variables with upper case.
- add check for microchip,apdd-state and microchip,recd34 in yaml.
- improve coding style in driver code.
- add includes for all functions used.
- rename MCP9982_INT_HIGH_BYTE_ADDR to MCP9982_INT_VALUE_ADDR and
  MCP9982_INT_LOW_BYTE_ADDR to MCP9982_FRAC_VALUE_ADDR.
- remove custom attribute running_average_window and
  running_average_window_available and map them to a low pass filter.
- update sysfs-bus-iio-temperature-mcp9982 to reflect current
  driver attributes and point to next kernel version (6.17).
- use compound literal to define driver channels.
- replace device_property_read_string() with i2c_get_match_data() to read
  chip name from devicetree.
- remove MCP9982_DEV_ATTR and mcp9982_prep_custom_attributes().
- remove client, chip_name, iio_info from mcp9982_priv.
- replace sprintf() with sysfs_emit().
- remove error messages which are triggered by keyboard input.
- replace devm_kzalloc() with devm_kcalloc(), array mcp9982_chip_config[]
  with individual structures, device_property_present() with
  device_property_read_bool().
- reordered parameters in mcp9982_features and mcp9982_priv to optimize
  memory allocation.
- remove .endianness from channel properties.
- change name of some parameters in mcp9982_priv.
- add check for reg value 0 from devicetree (channel 0 is for internal
  temperature and can't be disabled).
- link to v1: https://lore.kernel.org/all/20250415132623.14913-1-victor.duicu@microchip.com/

v1:
- initial version.

Signed-off-by: Victor Duicu <victor.duicu@microchip.com>
---
Victor Duicu (2):
      dt-bindings: hwmon: add support for MCP998X
      hwmon: add support for MCP998X

 .../bindings/hwmon/microchip,mcp9982.yaml          | 237 +++++
 Documentation/hwmon/index.rst                      |   1 +
 Documentation/hwmon/mcp9982.rst                    | 111 +++
 MAINTAINERS                                        |   8 +
 drivers/hwmon/Kconfig                              |  11 +
 drivers/hwmon/Makefile                             |   1 +
 drivers/hwmon/mcp9982.c                            | 997 +++++++++++++++++++++
 7 files changed, 1366 insertions(+)
---
base-commit: 05f7e89ab9731565d8a62e3b5d1ec206485eeb0b
change-id: 20260305-add-mcp9982-hwmon-9ac964ca3191

Best regards,
-- 
Victor Duicu <victor.duicu@microchip.com>

