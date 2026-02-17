Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 697C91F181F;
	Tue, 17 Feb 2026 14:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771337262; cv=none; b=WD9EsmHZq5JvWCJuYFNFh0b03larc7oMkPu5ff8PCDkXMGd/bDnYrQWpVvVui6AJuOwtS2k3VYpS9IsdN8iqjHcX2ZKuPm8h0IkvvsCQpeSStw01XbuIi48kY198mwa6o9Ie/8yjSex8F+VhJmPho7OSL6kjo6NIq/JycL2qsHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771337262; c=relaxed/simple;
	bh=vHDE4SGFTEYzzmz4jNG93r0OIj72QqjEdl+t8q3Go98=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=bISffGSt5QGAoSSM/TSEE5WF7QtjUrkg/rYsk1pmn6QlMl9Z+KBYq9xJ3Dz294YjbrW7ceLa0ozzsTLqpP2+N72XjHJePToHO4bYOzwmLsmLq+DKX8zIDxsLjCVbsRl/GZ7sYLs/miLnE5DFe48GgXVS9LdwKvPewsXokzHrpKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=cP1XYVPk; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="cP1XYVPk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1771337260; x=1802873260;
  h=from:subject:date:message-id:mime-version:
   content-transfer-encoding:to:cc;
  bh=vHDE4SGFTEYzzmz4jNG93r0OIj72QqjEdl+t8q3Go98=;
  b=cP1XYVPkTl6NhdVx5Lm6IsiMpQJZ2c+GDfcQCkk2Gv3edlY27nTwSCJv
   SSTIfDZx1adHP6CT14E3pxlc5kQpJeNj0m45bUdqIdms4a9YvGan7APIi
   Sh1oezjORyL7qz1fMjY6bsWNz6kjpvFXLlTb0XYmP0V1eiTFYcXftrj7Y
   E/ESiwFMgomum6cqqE0elVE39m3KZNTM9mlfdJnhBGconnqt2dAAUWr3R
   YrYB4lMsT7aecslwXQkmUheWRTHtnS2UlLKFGjkcvtb5KpnkDwzBZbOKr
   JdbtLBuZbxPMiqLC0r2C6N/dlqVfr2tD3eNGq9hsXtaSgpviIO+d+ADjN
   Q==;
X-CSE-ConnectionGUID: NsNq/mm8SHKghX7/+9wqEA==
X-CSE-MsgGUID: PN9bR3BASOqNpFCLDITtOg==
X-IronPort-AV: E=Sophos;i="6.21,296,1763449200"; 
   d="scan'208";a="53912586"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 17 Feb 2026 07:07:34 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Tue, 17 Feb 2026 07:07:21 -0700
Received: from [127.0.1.1] (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Tue, 17 Feb 2026 07:07:19 -0700
From: Victor Duicu <victor.duicu@microchip.com>
Subject: [PATCH v10 0/2] add support in hwmon for MCP998X
Date: Tue, 17 Feb 2026 16:06:12 +0200
Message-ID: <20260217-add-mcp9982-hwmon-v10-0-5e0aaae6f289@microchip.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANR1lGkC/x2MQQqAIBAAvxJ7bkENTPtKdBDdcg9ZKFQQ/j3pO
 AMzLxTKTAWm7oVMFxc+UgMp+g58dGkj5NAEKKG0UMKiCwF3f1prFMZ7PxI6Kc2gRzNYr6F1Z6a
 Vn386L7V+Een/sGQAAAA=
X-Change-ID: 20260209-add-mcp9982-hwmon-a118367839c6
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
CC: <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<victor.duicu@microchip.com>, <marius.cristea@microchip.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771337236; l=13965;
 i=victor.duicu@microchip.com; s=20260213; h=from:subject:message-id;
 bh=vHDE4SGFTEYzzmz4jNG93r0OIj72QqjEdl+t8q3Go98=;
 b=5IMucORpk6fBp6mQ6U8lZ/vp8xNGBO4tAPfmgEZnPDyx4P2xNL+5L+TAg3AxibIV9HVeDCsuA
 Sh1KSwR5wd9AgB+4Hl1pj6P/t+m3q5Mlkq3uheIzHN4pCwfFehhbirK
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

 .../bindings/hwmon/microchip,mcp9982.yaml          | 223 +++++
 Documentation/hwmon/index.rst                      |   1 +
 Documentation/hwmon/mcp9982.rst                    | 111 +++
 MAINTAINERS                                        |   8 +
 drivers/hwmon/Kconfig                              |  11 +
 drivers/hwmon/Makefile                             |   1 +
 drivers/hwmon/mcp9982.c                            | 954 +++++++++++++++++++++
 7 files changed, 1309 insertions(+)
---
base-commit: 05f7e89ab9731565d8a62e3b5d1ec206485eeb0b
change-id: 20260209-add-mcp9982-hwmon-a118367839c6

Best regards,
-- 
Victor Duicu <victor.duicu@microchip.com>

