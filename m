Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C49D27E1D7;
	Wed, 29 Apr 2026 12:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777467494; cv=none; b=KRnGQ9LdRLNu9hIHbQYwqIw7oLgI3hwSm9wtfSxlSpjAFNW+xjm/Aw1925ooy5bie0RDSG+htoIMcs4Tgzv/8tkDd+StsDeVvt/W2/uxeupQTMUdqQIVl0KSqDgbxVxUPDzv0Ld9C1b6wuc4D5ba2T97Q5afFr0X3ZCLffZdBEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777467494; c=relaxed/simple;
	bh=MIaOqc3Sw3N/I+3s6dRjJ1THgyRNml5MePNI4A9oQGM=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=P+hlAPMhSKMUhN9eNdvw4eIlUdRv9lSBR9KGcIXP0smelRaPD0ZaL9Znvsl+S7tOFgKzETg3UzUw2LyHE+Gnpiqz5Bghb3kGs/pxMH/LFaN0VMNhc8bMlgvXrGDbacokO59AkXK94tVuh7L1G2tVJ3wNY9GODNbJBGtIn23dreE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=Vvytqtf7; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="Vvytqtf7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1777467492; x=1809003492;
  h=from:subject:date:message-id:mime-version:
   content-transfer-encoding:to:cc;
  bh=MIaOqc3Sw3N/I+3s6dRjJ1THgyRNml5MePNI4A9oQGM=;
  b=Vvytqtf7nidR4ig8N/71CYC/ZSmUPPjZ+LAvPySb8XnVG3RYte/yw1JO
   nPEvwllNIo4NmezY1H9MkNylA+TGf9SzRC+SQQEkvjQkEKHmDB65VpiJj
   gd8wSwD5E1GjXUF83Y0b1c2e1yKhi92SsR5z/hqp3rrZR1//Oacz5/qs8
   Kal2VdOy3sT6kGXymu0nTn3vDDWgHeX+SUnQJlp9p4mBJZJy/JdxMu9hr
   8rXjItMFJ61h4LZK/w29no31O0jRff1q7WPYLjurNO9UN652aMYP7K35n
   Kt1wW7w+LM396F9UiQZQeYrNvoOX52ANQWciaff/sGtst37T1jQW9Fv3A
   w==;
X-CSE-ConnectionGUID: ikVasmBiRaGK3yt3K6FbPQ==
X-CSE-MsgGUID: HmHTmpTESe+5vKkiBAHn/Q==
X-IronPort-AV: E=Sophos;i="6.23,206,1770620400"; 
   d="scan'208";a="56007566"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 05:58:11 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex4.mchp-main.com (10.10.87.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.37; Wed, 29 Apr 2026 05:58:12 -0700
Received: from marius-VM.mshome.net (10.10.85.11) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Wed, 29 Apr 2026 05:58:09 -0700
From: Marius Cristea <marius.cristea@microchip.com>
Subject: [PATCH v10 0/2] Add support for Microchip EMC1812
Date: Wed, 29 Apr 2026 15:58:06 +0300
Message-ID: <20260429-hw_mon-emc1812-v10-0-a8ca1d779502@microchip.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF4A8mkC/23RzWrDMAwH8FcpOS9Dkr+UnvYeYww7kRcf0pRkZ
 Bul7z6nbKTUOUqgn4T+l2qWKclcHQ+XapIlzWk85QLh6VC1vT99SJ263KgIyCAA1f3X+zCeahl
 aZKQ6YmCwml2HUOWh8yQxfd/E17dc92n+HKef24IF1+4fRc0jtWANdRAdO/YR0PqXIbXT2Pbp/
 NyOQ7VyC20EEhYEZcIEAgeRg3O8R6iNIOSCUJnwSMp33gU2zR6h/wkLSK4gdCZsiFbZYDRrt0e
 YjSAwBWEyQYpYGS9ROO4R9o7AIpnFZkKUkyYo7rjZ/YW7I0gVhFvfiULW2aiFYI/gjVAIBcFrq
 C0a48gJdLRHNBuhobyiyQR613BU2EaSR+J6vf4CFD5dp8kCAAA=
X-Change-ID: 20251002-hw_mon-emc1812-f1b806487d10
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
CC: <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>, Marius Cristea
	<marius.cristea@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5015;
 i=marius.cristea@microchip.com; h=from:subject:message-id;
 bh=MIaOqc3Sw3N/I+3s6dRjJ1THgyRNml5MePNI4A9oQGM=;
 b=owGbwMvMwCW2tbSTZa7u0x2Mp9WSGDI/MSS0/p4XqaTsfkDBp/+i1QwVFVW/8nKHR1u6yp4c4
 xI/EK/ZUcrCIMbFICumyLLirZ9a1doPl5XEMnVg5rAygQxh4OIUgInMvcXI8FL0ubbp9Kt2NzQ/
 rv3qxLD+mvwTe9MNs/UdzU6ZF31UVGP4nxLz6fWbvS8vHr/kPEW5nDXM9Qr/kYMbSt/YHpo8q3P
 3HQ4A
X-Developer-Key: i=marius.cristea@microchip.com; a=openpgp;
 fpr=E32F8D4396E72E463E8CCD91446DE0ABD9140C3E

This is the hwmon driver for EMC1812/13/14/15/33 multichannel Low-Voltage
Remote Diode Sensor Family. The chips in the family have one internal
and different numbers of external channels, ranging from 1 (EMC1812) to
4 channels (EMC1815).
Reading diodes in anti-parallel connection is supported by EMC1814, EMC1815
and EMC1833.

Signed-off-by: Marius Cristea <marius.cristea@microchip.com>
---
Changes in v10:
- made comments more clear into the devicetree binding
- allow channel 0 (internal channel) into devicetree binding
- allow the default name for Channel 0 to be overridden by the Device Tree property
- translate temperature limits to support the hardware's extended temperature range
- update channel count validation to properly account for the internal channel
- return -EOPNOTSUPP if channel is greater than or equal to phys_channels
- Link to v9: https://lore.kernel.org/r/20260403-hw_mon-emc1812-v9-0-1a798f31cf2e@microchip.com

Changes in v9:
- improve the wording in the Documentation/hwmon/emc1812.rst file
- add const to variables in the driver
- initialize the EXT2_BETA_CONFIG only for the pats that support it
- update the writeble regmap table to exclude read-only registers
- Link to v8: https://lore.kernel.org/r/20260310-hw_mon-emc1812-v8-0-bc155727e0d2@microchip.com

Changes in v8:
- remove "address scan" from emc1812.rst documentation
- change the second dimension of emc1812_limit_regs_low[][] to 2
- clamp input value before doing math on it to avoid overflow
- use rounding instead of truncation for 8 bits limit registers
- fix misleading comment when HW ID is not recognized
- Link to v7: https://lore.kernel.org/r/20260223-hw_mon-emc1812-v7-0-51e2676f4e20@microchip.com

Changes in v7:
- driver
  - fix an overflow emc1812_set_hyst
  - remove unused parameter in emc1812_set_temp
- devicetree binding:
  - remove unneeded restrictions not to bloating the binding
- Link to v6: https://lore.kernel.org/r/20260212-hw_mon-emc1812-v6-0-e37e9b38d898@microchip.com

Changes in v6:
- driver
  - fix an overflow when writing more then 191875 to limits stored on 8
    bits register
  - remove "i2c_set_clientdata" from probe
  - fix discrepancy where writing 16ms and reading it back returns 15ms
    at update interval
  - skip setting the ideality factor for channels that are not available
    on the device
- devicetree binding:
  - change the way interrupts are described/used
  - add "microchip,enable-anti-parallel"
  - rewrite "allOf" section to be more clear
- Link to v5: https://lore.kernel.org/r/20260205-hw_mon-emc1812-v5-0-232835aefe8f@microchip.com

Changes in v5:
- fix calculation in emc1812_get_limit_temp 
- use i2c_get_match_data cover the case when the driver is instantiated
  via I2C ID table.
- replace dev_info with dev_warn
- remove some unnecessary truncation on 8 bits
- remove clamping when reading the temerature with hyst
- not change the conversion rate at probe time
- use a generic define to remove duplicate channel_info entries
- Link to v4: https://lore.kernel.org/r/20260127-hw_mon-emc1812-v4-0-6bf636b54847@microchip.com

Changes in v4:
- fix file permissions for read only properties
- fix calculation when the limits are written
- remove the temp_min_hyst because the part doesn't support it
- Link to v3: https://lore.kernel.org/r/20251218-hw_mon-emc1812-v3-0-a123ada7b859@microchip.com

Changes in v3:
- remove mesages that are not helpfull
- fix an issue related to NULL labels
- fix sign/unsign calculation
- replace E2BIG with EINVAL
- use BIT() to create mask
- Link to v2: https://lore.kernel.org/r/20251121-hw_mon-emc1812-v2-0-5b2070f8b778@microchip.com

Changes in v2:
- update the interrupt section from yaml file
- update index.rst
- remove fault condition from internal sensor
- remove unused members from structures
- update the driver to work on systems without device tree or
  firmware nodes
- add missing include files
- make NULL labels to be not visible
- corect sign/unsign calculations
- corect possible underflow for limits
- Link to v1: https://lore.kernel.org/r/20251029-hw_mon-emc1812-v1-0-be4fd8af016a@microchip.com

---
Marius Cristea (2):
      dt-bindings: hwmon: temperature: add support for EMC1812
      hwmon: temperature: add support for EMC1812

 .../bindings/hwmon/microchip,emc1812.yaml          | 193 ++++
 Documentation/hwmon/emc1812.rst                    |  67 ++
 Documentation/hwmon/index.rst                      |   1 +
 MAINTAINERS                                        |   8 +
 drivers/hwmon/Kconfig                              |  11 +
 drivers/hwmon/Makefile                             |   1 +
 drivers/hwmon/emc1812.c                            | 980 +++++++++++++++++++++
 7 files changed, 1261 insertions(+)
---
base-commit: d2b2fea3503e5e12b2e28784152937e48bcca6ff
change-id: 20251002-hw_mon-emc1812-f1b806487d10

Best regards,
-- 
Marius Cristea <marius.cristea@microchip.com>

