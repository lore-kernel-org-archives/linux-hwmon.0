Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54CC626ED33
	for <linux-hwmon@vger.kernel.org>; Mon, 15 Jun 2026 15:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781539171; cv=none; b=VTI/PzxlXyLwux5meRlKi7E+DQYigyfkfJmXidi3WPNkT3UnC6LZEqOXNa6Ci9Z3fjJ5lYoH3xQx03B9CiCrd63cQX1iksNbXmyWSJPbXbD49PsS48rEZQ6XRXqrfc86vgrlPGmMDgIgU4mOGLg5hmLyamSLqQVU5TA+WK59hng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781539171; c=relaxed/simple;
	bh=S5JnTOCOeRsVPA0vITgq4CaVireCY/lk5xHKIr7CkAE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=oUlXFSxrFu+4gQSRdgPwvRa0ny4DnaGdFIQxPRQIQAuI9KLNyUyh5sKPSY6rohQzmJIxXqFj7YvdXrxEmtIZqWhJh1JwbrUlB2o7QRA2XhPqdtNQ/7BzhjDNL4S9Kt/uK/P2uiEIBoulJ39851ZAyoHDNTEhd22G3rfmRUbpWtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=StiOc4PF; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="StiOc4PF"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2c168baac83so16132065ad.2
        for <linux-hwmon@vger.kernel.org>; Mon, 15 Jun 2026 08:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781539169; x=1782143969; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=sjJ2/saI4nnt1YJNXKyMCnqdc9ly87zM2WavjXLgxWY=;
        b=StiOc4PF+oniqmS6m7k3IkbuNX9b+71apnPweg2I0Dxek1uy74zJtHOvhuR6MvsWLU
         KN86oPNlRdN/po9vxbtF0zuQrs8NhpAFtPMJtvNBofKtmQTTLMomjZ02YYPZ1Thkjr1V
         FU2tP/rvSAQBsgRmO5bxws7c/qZ9Zz8+0/VngFiI5JtlDXhsXDI5vOG87s5S2hqrqyyZ
         Jns6lH+CWLJc8rv6El+bCQodjxK+BgspDjN4bjJFeQ+ezATuVlX3jQpBqGlHXl0LaInY
         ZtfMphUOrYut40gA8O8JnOyaIhlEfsGNqJyooOvI7nP0xnV2Df5tbH0EoMxEgO3fp6iK
         Oicw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781539169; x=1782143969;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sjJ2/saI4nnt1YJNXKyMCnqdc9ly87zM2WavjXLgxWY=;
        b=RiL4Hn+ZErcNa2ZQT4sFfF4xDkoKzD2rBuWO8YqEAGOxgZAGvLRoRjcoypj6vIqWVg
         GF/mov+uejhiyIGtpU6ClPFwHgTty++SdqpybMDNRSfedB5FQ2OeIl0FD+ImlfCRBtC0
         Sj080MlDxkrQ6I0VanDjFtLpmZFF68MwVKvYzMD8Zpx/1SW+n3wIIKabWdgYEnaIBGhE
         gF4OzNSaZ5PdCQeCTKJMzLVrudbsTzvCZ3k5aTGKjLIMm7o5begGx6RNwXDIZ5U8piAs
         9KxmWOILPLi0jx1Ne2yaZUMvGK1KD7K6iOLwdpyx5WoeIE3a0lRXFMCONhLoPsYYzblI
         jWlg==
X-Gm-Message-State: AOJu0Yymudis9hZVW98KhUMFddk1sA5Dj9goG/2bO5gUf5m+3YgFYYsN
	2ODItr04ecH6lnt6rxNGc8sdZlBmUiE5vih9tj7CKe8eSwYUjBxq16LBWvnq5C0f
X-Gm-Gg: Acq92OE4dwsqUdgkKfCN8j3TDPLsKW5CmMQocYkrAjgrFtW+uVaX5cokEtoSM7M/ySX
	wTs6KiPrJMBa9lp01zY+Ba+Y3uj2RVesXvSvom/9cjZG45FBjcp8t4awMdIJoIJ8vAsE4mWQ6f1
	Ia/x8kTDIOv2PJNYV8NOxKAjlUAS3+fs2ftIWXk9jZ2IqmtngQ522R0LMcEcY9LmaItLRxBhT2Y
	acwZ/AyDh115wrocoCozVnSDZid0D0yFEnl1rJ/ytYBBlfVw20585v5HvCz2ldjY6jbodV2sbL8
	/j7yQEwbHG3uP5tfsK2XNg6N/jN37nfP+P6zQJFuSQL+ooic46bHz8Q9W4SaEhtUDbJ9PaymnW2
	VlUx4G0gzUkSeD+HEQjKTHDI2THXLkO8V7r42By4d7lh43Tms0Thxpy49lXrLtFNAUz+BBotLcV
	WCgJ6J6B5kv/vUsKSCRy/11GLequLj49RYSKWI
X-Received: by 2002:a05:6a20:3282:b0:3aa:f9cb:d438 with SMTP id adf61e73a8af0-3b783f1f75bmr16827573637.21.1781539168486;
        Mon, 15 Jun 2026 08:59:28 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c86651adc16sm8828242a12.31.2026.06.15.08.59.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 08:59:27 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] hwmon updates for v7.2
Date: Mon, 15 Jun 2026 08:59:25 -0700
Message-ID: <20260615155926.1959207-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Linus,

Please pull hwmon updates for Linux v7.2 from signed tag:

    git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v7.2

Thanks,
Guenter
------

The following changes since commit e7ae89a0c97ce2b68b0983cd01eda67cf373517d:

  Linux 7.1-rc5 (2026-05-24 13:48:06 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git tags/hwmon-for-v7.2

for you to fetch changes up to 9955c92abe72564a49c293b1c15cd3b4f02ea6a0:

  hwmon: tmp401: Read "ti,n-factor" as signed (2026-06-13 05:53:18 -0700)

----------------------------------------------------------------
hwmon updates for v7.2

* New drivers for the following chips

- Analog Devices LTC4283 Swap Controller

- Analog Devices MAX20830

- Analog Devices MAX20860A

- ARCTIC Fan Controller

- Delta E50SN12051

- Luxshare LX1308

- Microchip EMC1812/13/14/15/33

- Monolithic MP2985

- Murata D1U74T PSU

* New chip support added to existing drivers

- asus-ec-sensors: Support for ROG MAXIMUS Z790 EXTREME, ROG STRIX B850-E
  GAMING WIFI, and ROG STRIX B650E-E GAMING WIFI

- dell-smm: Add Dell Latitude 7530 to fan control whitelist

- nct6683: Support for ASRock Z890 Pro-A

- pmbus: Support for Flex BMR316, BMR321, BMR350 and BMR351

- pmbus/max34440: Support for ADPM12250

- pmbus/xdp720: Support for Infineon xdp730, and fix driver issues
  reported by Sashiko

* New functionality

- Add support for update_interval_us chip attribute, and support it
  in ina238 driver

- Add support for guard() and scoped_guard() for subsystem locks,
  and use it in adt7411, ina2xx, and lm90 drivers

- emc2305: Support configurable fan PWM at shutdown

- lm63: Expose PWM frequency and LUT hysteresis as writable

- lm75: Support active-high alert polarity

- nct7802: Add time step attributes for tweaking responsiveness

- pmbus/adm1266: Add rtc debugfs entries for rtc, powerup_counter,
  clear_blackbox, and firmware_revision

- raspberrypi: Fix delayed-work teardown race, add voltage input support
  as well as voltage domain IDs

mcp9982: Add support for reporting external diode faults

* Miscellaneous bug fixes, changes and improvements

- Use named initializers for platform_device_id arrays and
  i2c_device_data, and remove unused driver data

- Various drivers: Move MODULE_DEVICE_TABLE next to the table itself

- ads7871: Convert to hwmon_device_register_with_info(), and use
  DMA-safe buffer for SPI writes

- adt7411: document supported sysfs attributes

- adt7462: Add of_match_table to support devicetree

- adt7475: Add explicit header include

- coretemp; Fix outdated documentation, coding style issues, and
  replace hardcoded core count with dynamic value

- cros_ec: Drop unused assignment of platform_device_id driver data

- emc2305: Fix fan channel index handling

- gpd-fan: Reject EC PWM value 0 as invalid, fix race condition between
  device removal and sysfs access, upgrade log level from warn to err for
  platform device creation failure, initialize EC before registering hwmon
  device, drop global driver data and use per-device allocation

- htu31: document debugfs serial_number

- ina238: Add support for samples and update_interval

- it87: Clamp negative values to zero in set_fan()

- lm75: Add explicit header include, Add explicit default cases in
  lm75_is_visible(), and add section for sysfs interface to documentation

- pmbus/lm25066: Fix PMBus coefficients for LM5064/5066/5066i

- tmp102: Use device_property_read_string API

- tmp401: Read "ti,n-factor" as signed

- Convert zyxel,nsa320-mcu to DT schema

----------------------------------------------------------------
Abdurrahman Hussain (6):
      hwmon: (pmbus/adm1266) add firmware_revision debugfs entry
      dt-bindings: trivial-devices: Add Murata D1U74T PSU
      hwmon: (pmbus/d1u74t) Add Murata D1U74T PSU driver
      hwmon: (pmbus/adm1266) add clear_blackbox debugfs entry
      hwmon: (pmbus/adm1266) add powerup_counter debugfs entry
      hwmon: (pmbus/adm1266) add rtc debugfs entry

Alexis Czezar Torreno (3):
      dt-bindings: hwmon: pmbus: add max20830
      hwmon: (pmbus/max20830) add driver for max20830
      hwmon: (pmbus/max34440): add support adpm12250

Armin Wolf (1):
      hwmon: (dell-smm) Add Dell Latitude 7530 to fan control whitelist

Ashish Yadav (3):
      dt-bindings: hwmon/pmbus: Add Infineon xdp730
      hwmon: (pmbus/xdp720) Add support for efuse xdp730
      hwmon: (pmbus/xdp720) Fix driver issues xdp720/730

Aureo Serrano de Souza (1):
      hwmon: add driver for ARCTIC Fan Controller

Brian Chiang (2):
      dt-bindings: trivial: Add LX1308 support
      hwmon: (pmbus/lx1308) Add support for LX1308

Brian Downey (1):
      hwmon: (asus-ec-sensors) add ROG MAXIMUS Z790 EXTREME

Chen-Shi-Hong (2):
      Documentation: hwmon: adt7411: document supported sysfs attributes
      docs: hwmon: htu31: document debugfs serial_number

Colin Huang (3):
      dt-bindings: trivial-devices: Add Delta E50SN12051
      Documentation/hwmon: add Delta E50SN12051 documentation
      hwmon: (pmbus) add support for Delta E50SN12051

Daniel Nilsson (1):
      hwmon: (pmbus) Add support for Flex BMR316, BMR321, BMR350 and BMR351

Eugene Shalygin (1):
      hwmon: (asus-ec-sensors) add ROG STRIX B850-E GAMING WIFI

Ferdinand Schwenk (3):
      hwmon: (ina238) Add support for samples and update_interval
      hwmon: Add update_interval_us chip attribute
      hwmon: (ina238) Add update_interval_us attribute

Flaviu Nistor (5):
      docs: hwmon: (lm75) Add section for sysfs interface
      hwmon: (lm75) Add explicit default cases in lm75_is_visible()
      hwmon: (tmp102) Use device_property_read_string API
      hwmon: (lm75) Add explicit header include
      hwmon: (adt7475) Add explicit header include

Florin Leotescu (3):
      hwmon: (emc2305) Fix fan channel index handling
      dt-bindings: hwmon: emc2305: Add fan-shutdown-percent property
      hwmon: emc2305: Support configurable fan PWM at shutdown

Guenter Roeck (4):
      hwmon: Support guard() and scoped_guard for subsystem locks
      hwmon: (lm90) Use guard() and scoped_guard() to acquire subsystem lock
      hwmon: (ina2xx) Use scoped_guard() to acquire the subsystem lock
      hwmon: (adt7411) Use scoped_guard() to acquire the subsystem lock

Hassan Maazu (1):
      Documentation: hwmon: fix typo in heading for max31730

Jan-Henrik Bruhn (1):
      hwmon: (lm63) expose PWM frequency and LUT hysteresis as writable

Kory Maincent (1):
      hwmon: (adt7462) Add of_match_table to support devicetree

Krzysztof Kozlowski (1):
      hwmon: Move MODULE_DEVICE_TABLE next to the table itself

Manish Baing (1):
      dt-bindings: hwmon: zyxel,nsa320-mcu: convert to DT schema

Marius Cristea (2):
      dt-bindings: hwmon: temperature: add support for EMC1812
      hwmon: temperature: add support for EMC1812

Markus Stockhausen (2):
      dt-bindings: hwmon: lm75: Add ti,alert-polarity-active-high property
      hwmon: (lm75) Support active-high alert polarity

Nikita Zhandarovich (1):
      hwmon: (it87) Clamp negative values to zero in set_fan()

Nuno Sá (3):
      dt-bindings: hwmon: Document the LTC4283 Swap Controller
      hwmon: ltc4283: Add support for the LTC4283 Swap Controller
      gpio: gpio-ltc4283: Add support for the LTC4283 Swap Controller

Pei Xiao (5):
      hwmon: (gpd-fan): drop global driver data and use per-device allocation
      hwmon: (gpd-fan): Initialize EC before registering hwmon device
      hwmon: (gpd-fan): upgrade log level from warn to err for platform device creation failure
      hwmon: (gpd-fan): fix race condition between device removal and sysfs access
      hwmon: (gpd-fan) Reject EC PWM value 0 as invalid

Potin Lai (1):
      hwmon: (pmbus/lm25066) Fix PMBus coefficients for LM5064/5066/5066i

Reiner Pröls (1):
      hwmon: (nct6683) Add support for ASRock Z890 Pro-A

Rob Herring (Arm) (1):
      hwmon: tmp401: Read "ti,n-factor" as signed

Roman Bakshansky (3):
      hwmon: (coretemp) replace hardcoded core count with dynamic value
      hwmon: (coretemp) fix coding style issues
      docs: hwmon: (coretemp) fix outdated documentation

Ronan Dalton (1):
      hwmon: (nct7802) Add time step attributes for tweaking responsiveness

Sanman Pradhan (1):
      dt-bindings: hwmon: pmbus: Add Analog Devices MAX20860A

Shubham Chakraborty (3):
      soc: bcm2835: raspberrypi-firmware: Add voltage domain IDs
      hwmon: (raspberrypi) Add voltage input support
      hwmon: (raspberrypi) Fix delayed-work teardown race

Syed Arif (1):
      hwmon: (pmbus/max20860a) Add driver for Analog Devices MAX20860A

Tabrez Ahmed (2):
      hwmon: (ads7871) Convert to hwmon_device_register_with_info
      hwmon: (ads7871) Use DMA-safe buffer for SPI writes

Uwe Kleine-König (The Capable Hub) (6):
      hwmon: (pmbus/mp2869) Remove unused driver data
      hwmon: (pmbus/mp2869) Drop unjustified __maybe_unused
      hwmon: Drop unused i2c driver_data
      hwmon: Use named initializers for arrays of i2c_device_data
      hwmon: (cros_ec) Drop unused assignment of platform_device_id driver data
      hwmon: Use named initializers for platform_device_id arrays

Veronika Kossmann (1):
      hwmon: (asus-ec-sensors) add ROG STRIX B650E-E GAMING WIFI

Victor Duicu (1):
      hwmon: (mcp9982) Add external diode fault read

Wensheng Wang (2):
      dt-bindings: hwmon: Add MPS mp2985
      hwmon: add MP2985 driver

 Documentation/ABI/testing/sysfs-class-hwmon        |   14 +
 .../devicetree/bindings/hwmon/adi,ltc4283.yaml     |  272 +++
 Documentation/devicetree/bindings/hwmon/lm75.yaml  |    7 +
 .../bindings/hwmon/microchip,emc1812.yaml          |  193 +++
 .../bindings/hwmon/microchip,emc2305.yaml          |    8 +
 .../devicetree/bindings/hwmon/nsa320-mcu.txt       |   20 -
 .../bindings/hwmon/pmbus/adi,max20830.yaml         |   66 +
 .../bindings/hwmon/pmbus/adi,max20860a.yaml        |   45 +
 .../bindings/hwmon/pmbus/infineon,xdp720.yaml      |   28 +-
 .../bindings/hwmon/zyxel,nsa320-mcu.yaml           |   54 +
 .../devicetree/bindings/trivial-devices.yaml       |    8 +
 .../devicetree/bindings/vendor-prefixes.yaml       |    2 +
 Documentation/hwmon/adt7411.rst                    |   37 +-
 Documentation/hwmon/arctic_fan_controller.rst      |   56 +
 Documentation/hwmon/asus_ec_sensors.rst            |    3 +
 Documentation/hwmon/coretemp.rst                   |    8 +-
 Documentation/hwmon/d1u74t.rst                     |   81 +
 Documentation/hwmon/e50sn12051.rst                 |   81 +
 Documentation/hwmon/emc1812.rst                    |   67 +
 Documentation/hwmon/htu31.rst                      |    7 +
 Documentation/hwmon/hwmon-kernel-api.rst           |    7 +-
 Documentation/hwmon/ina238.rst                     |    4 +
 Documentation/hwmon/index.rst                      |    9 +
 Documentation/hwmon/lm75.rst                       |   16 +
 Documentation/hwmon/ltc4283.rst                    |  267 +++
 Documentation/hwmon/lx1308.rst                     |   90 +
 Documentation/hwmon/max20830.rst                   |   49 +
 Documentation/hwmon/max20860a.rst                  |   57 +
 Documentation/hwmon/max31730.rst                   |    2 +-
 Documentation/hwmon/max34440.rst                   |   27 +-
 Documentation/hwmon/mp2985.rst                     |  147 ++
 Documentation/hwmon/nct7802.rst                    |   16 +
 Documentation/hwmon/pmbus.rst                      |    9 +-
 Documentation/hwmon/raspberrypi-hwmon.rst          |   15 +-
 Documentation/hwmon/sysfs-interface.rst            |    4 +
 MAINTAINERS                                        |   55 +
 drivers/gpio/Kconfig                               |   15 +
 drivers/gpio/Makefile                              |    1 +
 drivers/gpio/gpio-ltc4283.c                        |  218 +++
 drivers/hwmon/Kconfig                              |   35 +
 drivers/hwmon/Makefile                             |    3 +
 drivers/hwmon/ad7414.c                             |    4 +-
 drivers/hwmon/ad7418.c                             |    6 +-
 drivers/hwmon/adc128d818.c                         |    2 +-
 drivers/hwmon/adm1025.c                            |    4 +-
 drivers/hwmon/adm1026.c                            |    2 +-
 drivers/hwmon/adm1029.c                            |    2 +-
 drivers/hwmon/adm1031.c                            |    4 +-
 drivers/hwmon/adm1177.c                            |    4 +-
 drivers/hwmon/adm9240.c                            |    6 +-
 drivers/hwmon/ads7828.c                            |    4 +-
 drivers/hwmon/ads7871.c                            |  108 +-
 drivers/hwmon/adt7410.c                            |    8 +-
 drivers/hwmon/adt7411.c                            |   12 +-
 drivers/hwmon/adt7462.c                            |   10 +-
 drivers/hwmon/adt7470.c                            |    2 +-
 drivers/hwmon/adt7475.c                            |   14 +-
 drivers/hwmon/aht10.c                              |    8 +-
 drivers/hwmon/amc6821.c                            |    2 +-
 drivers/hwmon/applesmc.c                           |    2 +-
 drivers/hwmon/arctic_fan_controller.c              |  374 ++++
 drivers/hwmon/asb100.c                             |    2 +-
 drivers/hwmon/asc7621.c                            |    6 +-
 drivers/hwmon/asus-ec-sensors.c                    |   37 +-
 drivers/hwmon/atxp1.c                              |    2 +-
 drivers/hwmon/chipcap2.c                           |   16 +-
 drivers/hwmon/coretemp.c                           |   42 +-
 drivers/hwmon/cros_ec_hwmon.c                      |    6 +-
 drivers/hwmon/dell-smm-hwmon.c                     |    8 +
 drivers/hwmon/dme1737.c                            |    4 +-
 drivers/hwmon/ds1621.c                             |   10 +-
 drivers/hwmon/ds620.c                              |    4 +-
 drivers/hwmon/emc1403.c                            |   24 +-
 drivers/hwmon/emc1812.c                            |  965 +++++++++++
 drivers/hwmon/emc2103.c                            |    2 +-
 drivers/hwmon/emc2305.c                            |   62 +-
 drivers/hwmon/emc6w201.c                           |    2 +-
 drivers/hwmon/f75375s.c                            |    6 +-
 drivers/hwmon/fschmd.c                             |   14 +-
 drivers/hwmon/ftsteutates.c                        |    2 +-
 drivers/hwmon/g760a.c                              |    2 +-
 drivers/hwmon/g762.c                               |    6 +-
 drivers/hwmon/gl518sm.c                            |    2 +-
 drivers/hwmon/gl520sm.c                            |    2 +-
 drivers/hwmon/gpd-fan.c                            |  230 +--
 drivers/hwmon/hih6130.c                            |    2 +-
 drivers/hwmon/hs3001.c                             |    4 +-
 drivers/hwmon/htu31.c                              |    2 +-
 drivers/hwmon/hwmon.c                              |    1 +
 drivers/hwmon/ina209.c                             |    2 +-
 drivers/hwmon/ina238.c                             |  172 +-
 drivers/hwmon/ina2xx.c                             |   26 +-
 drivers/hwmon/ina3221.c                            |    2 +-
 drivers/hwmon/intel-m10-bmc-hwmon.c                |    2 +-
 drivers/hwmon/isl28022.c                           |    2 +-
 drivers/hwmon/it87.c                               |    3 +
 drivers/hwmon/jc42.c                               |    2 +-
 drivers/hwmon/lineage-pem.c                        |    4 +-
 drivers/hwmon/lm63.c                               |  139 +-
 drivers/hwmon/lm73.c                               |    2 +-
 drivers/hwmon/lm75.c                               |   92 +-
 drivers/hwmon/lm77.c                               |    2 +-
 drivers/hwmon/lm78.c                               |    4 +-
 drivers/hwmon/lm80.c                               |    4 +-
 drivers/hwmon/lm83.c                               |    4 +-
 drivers/hwmon/lm85.c                               |   24 +-
 drivers/hwmon/lm87.c                               |    4 +-
 drivers/hwmon/lm90.c                               |  129 +-
 drivers/hwmon/lm92.c                               |    6 +-
 drivers/hwmon/lm93.c                               |    4 +-
 drivers/hwmon/lm95234.c                            |    4 +-
 drivers/hwmon/lm95241.c                            |    4 +-
 drivers/hwmon/lm95245.c                            |    4 +-
 drivers/hwmon/ltc2945.c                            |    2 +-
 drivers/hwmon/ltc2947-i2c.c                        |    4 +-
 drivers/hwmon/ltc2990.c                            |    4 +-
 drivers/hwmon/ltc2991.c                            |    4 +-
 drivers/hwmon/ltc2992.c                            |    4 +-
 drivers/hwmon/ltc4151.c                            |    2 +-
 drivers/hwmon/ltc4215.c                            |    2 +-
 drivers/hwmon/ltc4222.c                            |    2 +-
 drivers/hwmon/ltc4245.c                            |    2 +-
 drivers/hwmon/ltc4260.c                            |    2 +-
 drivers/hwmon/ltc4261.c                            |    4 +-
 drivers/hwmon/ltc4283.c                            | 1795 ++++++++++++++++++++
 drivers/hwmon/max127.c                             |    2 +-
 drivers/hwmon/max16065.c                           |   12 +-
 drivers/hwmon/max1619.c                            |    2 +-
 drivers/hwmon/max1668.c                            |    6 +-
 drivers/hwmon/max197.c                             |    4 +-
 drivers/hwmon/max31730.c                           |    2 +-
 drivers/hwmon/max31760.c                           |    2 +-
 drivers/hwmon/max31790.c                           |    2 +-
 drivers/hwmon/max31827.c                           |    6 +-
 drivers/hwmon/max6620.c                            |    2 +-
 drivers/hwmon/max6621.c                            |    2 +-
 drivers/hwmon/max6639.c                            |    2 +-
 drivers/hwmon/max6650.c                            |    4 +-
 drivers/hwmon/max6697.c                            |   20 +-
 drivers/hwmon/mc34vr500.c                          |    4 +-
 drivers/hwmon/mcp3021.c                            |    4 +-
 drivers/hwmon/mcp9982.c                            |   25 +-
 drivers/hwmon/nct6683.c                            |    5 +-
 drivers/hwmon/nct6775-i2c.c                        |   26 +-
 drivers/hwmon/nct7802.c                            |   93 +-
 drivers/hwmon/nct7904.c                            |    4 +-
 drivers/hwmon/nsa320-hwmon.c                       |    2 +-
 drivers/hwmon/ntc_thermistor.c                     |   24 +-
 drivers/hwmon/pcf8591.c                            |    2 +-
 drivers/hwmon/pmbus/Kconfig                        |   67 +-
 drivers/hwmon/pmbus/Makefile                       |    6 +
 drivers/hwmon/pmbus/acbel-fsg032.c                 |    4 +-
 drivers/hwmon/pmbus/adm1266.c                      |  185 +-
 drivers/hwmon/pmbus/adm1275.c                      |   20 +-
 drivers/hwmon/pmbus/aps-379.c                      |    4 +-
 drivers/hwmon/pmbus/bel-pfe.c                      |    6 +-
 drivers/hwmon/pmbus/bpa-rs600.c                    |    6 +-
 drivers/hwmon/pmbus/crps.c                         |    4 +-
 drivers/hwmon/pmbus/d1u74t.c                       |   88 +
 drivers/hwmon/pmbus/delta-ahe50dc-fan.c            |    2 +-
 drivers/hwmon/pmbus/dps920ab.c                     |    4 +-
 drivers/hwmon/pmbus/e50sn12051.c                   |   52 +
 drivers/hwmon/pmbus/fsp-3y.c                       |    4 +-
 drivers/hwmon/pmbus/hac300s.c                      |    4 +-
 drivers/hwmon/pmbus/ibm-cffps.c                    |    8 +-
 drivers/hwmon/pmbus/ina233.c                       |    4 +-
 drivers/hwmon/pmbus/inspur-ipsps.c                 |    4 +-
 drivers/hwmon/pmbus/ir35221.c                      |    4 +-
 drivers/hwmon/pmbus/ir36021.c                      |    4 +-
 drivers/hwmon/pmbus/ir38064.c                      |   10 +-
 drivers/hwmon/pmbus/irps5401.c                     |    4 +-
 drivers/hwmon/pmbus/isl68137.c                     |   92 +-
 drivers/hwmon/pmbus/lm25066.c                      |   70 +-
 drivers/hwmon/pmbus/lt3074.c                       |    4 +-
 drivers/hwmon/pmbus/lt7182s.c                      |    4 +-
 drivers/hwmon/pmbus/ltc2978.c                      |   60 +-
 drivers/hwmon/pmbus/ltc3815.c                      |    2 +-
 drivers/hwmon/pmbus/lx1308.c                       |  204 +++
 drivers/hwmon/pmbus/max15301.c                     |    8 +-
 drivers/hwmon/pmbus/max16064.c                     |    4 +-
 drivers/hwmon/pmbus/max16601.c                     |   10 +-
 drivers/hwmon/pmbus/max17616.c                     |    2 +-
 drivers/hwmon/pmbus/max20730.c                     |   10 +-
 drivers/hwmon/pmbus/max20751.c                     |    4 +-
 drivers/hwmon/pmbus/max20830.c                     |  110 ++
 drivers/hwmon/pmbus/max20860a.c                    |   68 +
 drivers/hwmon/pmbus/max31785.c                     |    8 +-
 drivers/hwmon/pmbus/max34440.c                     |   63 +-
 drivers/hwmon/pmbus/max8688.c                      |    2 +-
 drivers/hwmon/pmbus/mp2856.c                       |    6 +-
 drivers/hwmon/pmbus/mp2869.c                       |   22 +-
 drivers/hwmon/pmbus/mp2888.c                       |    4 +-
 drivers/hwmon/pmbus/mp2891.c                       |    2 +-
 drivers/hwmon/pmbus/mp2925.c                       |    6 +-
 drivers/hwmon/pmbus/mp29502.c                      |    4 +-
 drivers/hwmon/pmbus/mp2975.c                       |    8 +-
 drivers/hwmon/pmbus/mp2985.c                       |  402 +++++
 drivers/hwmon/pmbus/mp2993.c                       |    2 +-
 drivers/hwmon/pmbus/mp5920.c                       |    2 +-
 drivers/hwmon/pmbus/mp5926.c                       |    4 +-
 drivers/hwmon/pmbus/mp5990.c                       |    4 +-
 drivers/hwmon/pmbus/mp9941.c                       |    2 +-
 drivers/hwmon/pmbus/mp9945.c                       |    4 +-
 drivers/hwmon/pmbus/mpq7932.c                      |    6 +-
 drivers/hwmon/pmbus/mpq8785.c                      |   10 +-
 drivers/hwmon/pmbus/pim4328.c                      |   18 +-
 drivers/hwmon/pmbus/pli1209bc.c                    |    4 +-
 drivers/hwmon/pmbus/pm6764tr.c                     |    4 +-
 drivers/hwmon/pmbus/pmbus.c                        |   64 +-
 drivers/hwmon/pmbus/pxe1610.c                      |    8 +-
 drivers/hwmon/pmbus/q54sj108a2.c                   |    8 +-
 drivers/hwmon/pmbus/stef48h28.c                    |    4 +-
 drivers/hwmon/pmbus/stpddc60.c                     |    6 +-
 drivers/hwmon/pmbus/tda38640.c                     |    4 +-
 drivers/hwmon/pmbus/tps25990.c                     |    4 +-
 drivers/hwmon/pmbus/tps40422.c                     |    4 +-
 drivers/hwmon/pmbus/tps53679.c                     |   18 +-
 drivers/hwmon/pmbus/tps546d24.c                    |    4 +-
 drivers/hwmon/pmbus/ucd9000.c                      |   16 +-
 drivers/hwmon/pmbus/ucd9200.c                      |   18 +-
 drivers/hwmon/pmbus/xdp710.c                       |    2 +-
 drivers/hwmon/pmbus/xdp720.c                       |   82 +-
 drivers/hwmon/pmbus/xdpe12284.c                    |    8 +-
 drivers/hwmon/pmbus/xdpe152c4.c                    |    6 +-
 drivers/hwmon/pmbus/xdpe1a2g7b.c                   |    6 +-
 drivers/hwmon/pmbus/zl6100.c                       |   44 +-
 drivers/hwmon/powr1220.c                           |    4 +-
 drivers/hwmon/pt5161l.c                            |    4 +-
 drivers/hwmon/raspberrypi-hwmon.c                  |  140 +-
 drivers/hwmon/sbtsi_temp.c                         |    4 +-
 drivers/hwmon/sg2042-mcu.c                         |    2 +-
 drivers/hwmon/sht15.c                              |   10 +-
 drivers/hwmon/sht21.c                              |    6 +-
 drivers/hwmon/sht3x.c                              |    8 +-
 drivers/hwmon/sht4x.c                              |    4 +-
 drivers/hwmon/shtc1.c                              |    6 +-
 drivers/hwmon/smsc47m192.c                         |    2 +-
 drivers/hwmon/spd5118.c                            |    2 +-
 drivers/hwmon/stts751.c                            |    2 +-
 drivers/hwmon/tc654.c                              |    6 +-
 drivers/hwmon/tc74.c                               |    4 +-
 drivers/hwmon/thmc50.c                             |    4 +-
 drivers/hwmon/tmp102.c                             |   11 +-
 drivers/hwmon/tmp103.c                             |    2 +-
 drivers/hwmon/tmp108.c                             |    8 +-
 drivers/hwmon/tmp401.c                             |   12 +-
 drivers/hwmon/tmp421.c                             |   10 +-
 drivers/hwmon/tmp464.c                             |    4 +-
 drivers/hwmon/tmp513.c                             |    4 +-
 drivers/hwmon/tsc1641.c                            |    2 +-
 drivers/hwmon/w83773g.c                            |    2 +-
 drivers/hwmon/w83781d.c                            |    8 +-
 drivers/hwmon/w83791d.c                            |    2 +-
 drivers/hwmon/w83792d.c                            |    2 +-
 drivers/hwmon/w83793.c                             |    2 +-
 drivers/hwmon/w83795.c                             |    4 +-
 drivers/hwmon/w83l785ts.c                          |    2 +-
 drivers/hwmon/w83l786ng.c                          |    2 +-
 include/linux/hwmon.h                              |    5 +
 include/soc/bcm2835/raspberrypi-firmware.h         |   25 +
 260 files changed, 8132 insertions(+), 1093 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/hwmon/adi,ltc4283.yaml
 create mode 100644 Documentation/devicetree/bindings/hwmon/microchip,emc1812.yaml
 delete mode 100644 Documentation/devicetree/bindings/hwmon/nsa320-mcu.txt
 create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/adi,max20830.yaml
 create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/adi,max20860a.yaml
 create mode 100644 Documentation/devicetree/bindings/hwmon/zyxel,nsa320-mcu.yaml
 create mode 100644 Documentation/hwmon/arctic_fan_controller.rst
 create mode 100644 Documentation/hwmon/d1u74t.rst
 create mode 100644 Documentation/hwmon/e50sn12051.rst
 create mode 100644 Documentation/hwmon/emc1812.rst
 create mode 100644 Documentation/hwmon/ltc4283.rst
 create mode 100644 Documentation/hwmon/lx1308.rst
 create mode 100644 Documentation/hwmon/max20830.rst
 create mode 100644 Documentation/hwmon/max20860a.rst
 create mode 100644 Documentation/hwmon/mp2985.rst
 create mode 100644 drivers/gpio/gpio-ltc4283.c
 create mode 100644 drivers/hwmon/arctic_fan_controller.c
 create mode 100644 drivers/hwmon/emc1812.c
 create mode 100644 drivers/hwmon/ltc4283.c
 create mode 100644 drivers/hwmon/pmbus/d1u74t.c
 create mode 100644 drivers/hwmon/pmbus/e50sn12051.c
 create mode 100644 drivers/hwmon/pmbus/lx1308.c
 create mode 100644 drivers/hwmon/pmbus/max20830.c
 create mode 100644 drivers/hwmon/pmbus/max20860a.c
 create mode 100644 drivers/hwmon/pmbus/mp2985.c
