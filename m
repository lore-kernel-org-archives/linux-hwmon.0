Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99B176F2F2;
	Thu, 12 Feb 2026 09:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770890106; cv=none; b=VSJ4DoabCuAwEYqZ2UOEsayjj7qIdys9+/Phwjc67xNMe1hF/AMNd47mZYVjjQjNwBTWp08EQj+HWx48iZEyutTDSrVZ5tfAxWGe6TAqtAQsKCAbvtimnVp6AEpiE8+WY8C1Cm5bQMt2dplbfcjK8RM6s5duZOdlOx+wZPq8kSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770890106; c=relaxed/simple;
	bh=9w4yEfMbLtubTo9E++hNpKog19hYJQ1sNsia2gQoyb8=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=a+mouudvEmv3QQ5iUG+EaKNkntmqhbfSg2JZZoNtCUgiUT05fj2WK4Ar3kTFZQ/f+9VPJM38QByZKw1qSo5oR5qFBAdV2CEZ4QzIMXLW3e1wKK1u1yKGeCyd8aPlsFgMRAkLzjbvjBblFvAjz6sV+l/YDp3i2U7N6jf+JkDwJyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=I4ajjpoi; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="I4ajjpoi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1770890102; x=1802426102;
  h=from:subject:date:message-id:mime-version:
   content-transfer-encoding:to:cc;
  bh=9w4yEfMbLtubTo9E++hNpKog19hYJQ1sNsia2gQoyb8=;
  b=I4ajjpoi6apzUCwCZqWts+v74YoRxyYTZ5mR90yAnihKKSU2wnb6RcRb
   dHcYqbGRZKVUsPIkC8/NH+jRSzsW/I7uL27C8l5gFSS3zq/cbQJQCEzsB
   0NfYNzo+HNpEDLsd8qT7Vir2eej/G3P8JDxgSpKXh22jMuQ8mW64fd9oW
   fu80K95G57r26VhfQ9ido3zpDaCHLF+6RlNzIDJ24H3HmKpqrJ61UwecC
   7Sxz62xkGicO5mrQhbX1Tj8cOhCz6TOMKDkCXPmwgda0jXkMKinbiY7FC
   TgDyCAGVi9xZWcU9u5YzTP1jQgv2w9pJZR0rIUoomIQq/6XMLFUdHR2eX
   A==;
X-CSE-ConnectionGUID: a5dp8WccRqa78Yr/7BTeGw==
X-CSE-MsgGUID: qiVMT0pzRGWPJL4tSCLmFw==
X-IronPort-AV: E=Sophos;i="6.21,286,1763449200"; 
   d="scan'208";a="220595684"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 12 Feb 2026 02:55:01 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Thu, 12 Feb 2026 02:54:23 -0700
Received: from marius-VM.mshome.net (10.10.85.11) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Thu, 12 Feb 2026 02:54:20 -0700
From: Marius Cristea <marius.cristea@microchip.com>
Subject: [PATCH v6 0/2] Add support for Microchip EMC1812
Date: Thu, 12 Feb 2026 11:54:06 +0200
Message-ID: <20260212-hw_mon-emc1812-v6-0-e37e9b38d898@microchip.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAD6jjWkC/23My2rDMBCF4VcJWldlZnSbZNX3CKVItlRrYSvYx
 WkJfvcqocUQe/kfON9NTHHMcRKnw02Mcc5TLkMN+3IQTeeHzyhzW1sQkEEAkt31oy+DjH2DjCQ
 TBgar2bUIop4uY0z5+wGe32t3efoq48/Dn/G+/lF0fKZmlCBD1KllnwCtf+tzM5amy5fXpvTiz
 s20Eki4IagSJhA4SByc4z1CrQQhbwhVCY+kfOtdYHPcI/Q/YQHJbQhdCRuSVTYYzdrtEWYlCMy
 GMJUgRayMjylyeiaWZfkFvdLCsbwBAAA=
X-Change-ID: 20251002-hw_mon-emc1812-f1b806487d10
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
CC: <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>, Marius Cristea
	<marius.cristea@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3382;
 i=marius.cristea@microchip.com; h=from:subject:message-id;
 bh=9w4yEfMbLtubTo9E++hNpKog19hYJQ1sNsia2gQoyb8=;
 b=owGbwMvMwCW2tbSTZa7u0x2Mp9WSGDJ7F7ts1BI8Jqb1PTvJ0GvPSz6/D4cO7zr26j//r6pN5
 5s4LcJOd5SyMIhxMciKKbKseOunVrX2w2UlsUwdmDmsTCBDGLg4BWAiU48wMryUUFrB9qCn7UPf
 jX8BNUYTM1a/+3yLzWbjP+7nlwOn72Bl+J/L+NFqykWVbqeVvUpin//mfE7NqFXSCfg0cbHoszO
 6k7gA
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

 .../bindings/hwmon/microchip,emc1812.yaml          | 196 +++++
 Documentation/hwmon/emc1812.rst                    |  68 ++
 Documentation/hwmon/index.rst                      |   1 +
 MAINTAINERS                                        |   8 +
 drivers/hwmon/Kconfig                              |  11 +
 drivers/hwmon/Makefile                             |   1 +
 drivers/hwmon/emc1812.c                            | 942 +++++++++++++++++++++
 7 files changed, 1227 insertions(+)
---
base-commit: d2b2fea3503e5e12b2e28784152937e48bcca6ff
change-id: 20251002-hw_mon-emc1812-f1b806487d10

Best regards,
-- 
Marius Cristea <marius.cristea@microchip.com>

