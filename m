Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BD9F2FE060;
	Tue, 10 Mar 2026 14:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773154306; cv=none; b=Wnv9W15YtWkeDTXhcERvXKtEkEAmCT+sczmaO6982lBPd1BEuk7+oC8lkgtfSSt/udKZBmeobP4aQfMvfcYnyus2tvuS1mgF1SLCFOBl32nnpKq8tZDJhGQ1omspl/kk9ZfH224mIC79WLaD07s0pGUTc7Fm/U609cHLSuIwjZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773154306; c=relaxed/simple;
	bh=mH/Qoa7GVb1O49kvK4UDRxV3d16BUt2d4d7GVBRUERI=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=YvvgMgleumDDWUT8TriMrmTriCqiJB6vwdo+yj+fhjf8EXEpOdWj2uV5x9Y8zgwZkrnfMiVzUiPq6Mz0cT9HB6PBmy/O0I3/pZlFFl1ghfJpsGulqXV6NCfTm7VqkCwksWD89Lq5eb4ATDTYnNjM42rahh4NGRD4ySuDGMAK0lQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=nTuFNRI8; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="nTuFNRI8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1773154305; x=1804690305;
  h=from:subject:date:message-id:mime-version:
   content-transfer-encoding:to:cc;
  bh=mH/Qoa7GVb1O49kvK4UDRxV3d16BUt2d4d7GVBRUERI=;
  b=nTuFNRI8umtP5AlhYclzfHo589FxxD7RhkTH4GV11r1p83nVRaudAtNI
   jk71kZLcn5N/Xy0ERTkyOBa+7WlRfo5SQAx6X+vj4jBiHtBmb4L54pvP0
   DfNCHqgqiEYUn+MxS6iwE5Fe3Opjq4zBGOzUPltvNl01nTQl7Zu0nRReP
   XppYHqufcMISQTCXOePtaAjN4781zyLXacIFO8/j4Q4NiU84W+YrqebOM
   HT/0++pB9PQxtLt43CsfP6vZRRig+ASdz/XXNCED5MznisUXe2TTXtZM2
   Ciz0sbYvEOg/baJ5ZC0frKa81ZjnlyjQWeqrijBiCeXw0IcN7ZeGQBgCB
   w==;
X-CSE-ConnectionGUID: vZr/l/gNRLe/rXqx4X3KSw==
X-CSE-MsgGUID: 4L4oumN/Qdql6IOYVk4C5g==
X-IronPort-AV: E=Sophos;i="6.23,112,1770620400"; 
   d="scan'208";a="54889616"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 10 Mar 2026 07:51:39 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Tue, 10 Mar 2026 07:51:13 -0700
Received: from marius-VM.mshome.net (10.10.85.11) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Tue, 10 Mar 2026 07:51:10 -0700
From: Marius Cristea <marius.cristea@microchip.com>
Subject: [PATCH v8 0/2] Add support for Microchip EMC1812
Date: Tue, 10 Mar 2026 16:50:44 +0200
Message-ID: <20260310-hw_mon-emc1812-v8-0-bc155727e0d2@microchip.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMQvsGkC/23RTW6DMBAF4KtEXteVZ/w3ZNV7VFVlw7h4AURQ0
 VYRd6+JWhEFlu9J8y3eXMXEY+ZJnE9XMfKcpzz0JdDTSdRt6D9Y5qZkgQotKIWy/Xrvhl5yVwM
 BygSRlDPkG1CiHF1GTvn7Br6+ldzm6XMYf27+DGv7R2H1SM0glYxsUkMhKXDhpcv1ONRtvjzXQ
 ydWbsaNAIQdgYWwEZVXiaL3dETojUCgHaELEQB1aIKPZKsjwvwTTgH6HWEK4WJy2kVryPgjwm4
 EKrsjbCFQI2kbODGlI8LdEbD7zOwKwdpzFTU1VB1u4e8I1DvCr3MCo/MuGUb1SCzL8gta57ecQ
 gIAAA==
X-Change-ID: 20251002-hw_mon-emc1812-f1b806487d10
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
CC: <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>, Marius Cristea
	<marius.cristea@microchip.com>, Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4098;
 i=marius.cristea@microchip.com; h=from:subject:message-id;
 bh=mH/Qoa7GVb1O49kvK4UDRxV3d16BUt2d4d7GVBRUERI=;
 b=owGbwMvMwCW2tbSTZa7u0x2Mp9WSGDI36J9Mus47leUUW1r2lGvvXwX8PSswvVDCbZLcI6Ygl
 mXBGwyKOkpZGMS4GGTFFFlWvPVTq1r74bKSWKYOzBxWJpAhDFycAjCRKxWMDGdeNWsF1p33jdNe
 Nyeeb3OT7ey5k9dP5ZyZ8+LqnZb4MGVGhg+OVkK7b53k+BJ9MbMx1eVdDNe16SY7slPUbq35Huq
 txg4A
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

 .../bindings/hwmon/microchip,emc1812.yaml          | 184 ++++
 Documentation/hwmon/emc1812.rst                    |  66 ++
 Documentation/hwmon/index.rst                      |   1 +
 MAINTAINERS                                        |   8 +
 drivers/hwmon/Kconfig                              |  11 +
 drivers/hwmon/Makefile                             |   1 +
 drivers/hwmon/emc1812.c                            | 953 +++++++++++++++++++++
 7 files changed, 1224 insertions(+)
---
base-commit: d2b2fea3503e5e12b2e28784152937e48bcca6ff
change-id: 20251002-hw_mon-emc1812-f1b806487d10

Best regards,
-- 
Marius Cristea <marius.cristea@microchip.com>

