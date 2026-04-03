Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D476389114;
	Fri,  3 Apr 2026 12:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775220012; cv=none; b=T0osp5QqnlzptU6ZBcDim0ov4RNAbKqZJpnzT2fOsDRiSnDnpBnaTEqntLdziXA7FutHDbfSa+zY8VtVQTtEixhT/BB2hnTsdRo/CKIXGFMLS6nkbvVU/4L6KuW97kVe86c9jQFZRLW2A+Ia215Uey6PWhh5k1VXh6XxoTCFqpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775220012; c=relaxed/simple;
	bh=PnRnd7lQtN3WxG2Z0pPYrXqxZbFA1u+MSlM8AIZnedU=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=u3+CwCOmosACcLo2ptBGAWulD+/Jw83v/z0JiPJfYOT/6/6F9N158WXUm5yaHyjWpc2iV9/8ZIb2DB+0Bza5VjmZiXbLP8iCbISmNxcVgkQawkg9ezplc5OJrNEaT8YnA8RFsPotRWYhBLEddS/gWzGmxJ+cWQ+fb/tbIuPs2dI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=Ww0emgJ5; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="Ww0emgJ5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1775220010; x=1806756010;
  h=from:subject:date:message-id:mime-version:
   content-transfer-encoding:to:cc;
  bh=PnRnd7lQtN3WxG2Z0pPYrXqxZbFA1u+MSlM8AIZnedU=;
  b=Ww0emgJ5QmVuaqcMlQ2RPwWqHV6+bZdvF0L0PAyQJcY/4mIEHeWlEH6A
   d8CZhRpTFq3wx+t65k0XokojH+2wp9HgePlGZdkPEliDKQTmWtua4ZZlJ
   QIylmhVnnjPCsKz1uuTMgzdnxSt15H8hf0zs8R5PA44uem5qIzj0eZIdw
   d92+GXFgG44x959+iGP92oOLSoCksFsZwEPvgXYm3jt5iJPhtNfoz99Yu
   T+ERY82J6IIw+vGo96fAy5LCR/ah6qyUdMdpY1oDVhqVxBTKGktQysvRY
   fRv+T5mD06113FEaiiv7qwqTHA6HxlSlEmarH5e++BVSl15q1ihCSQ8vQ
   g==;
X-CSE-ConnectionGUID: CBerw6eeRJyL4pEnwf9CKw==
X-CSE-MsgGUID: nDCPFf43T2WVOnvKPdKAhA==
X-IronPort-AV: E=Sophos;i="6.23,157,1770620400"; 
   d="scan'208";a="54879033"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2026 05:40:09 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.87.152) by
 chn-vm-ex2.mchp-main.com (10.10.87.31) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.35; Fri, 3 Apr 2026 05:39:49 -0700
Received: from marius-VM.mshome.net (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Fri, 3 Apr 2026 05:39:46 -0700
From: Marius Cristea <marius.cristea@microchip.com>
Subject: [PATCH v9 0/2] Add support for Microchip EMC1812
Date: Fri, 3 Apr 2026 15:39:36 +0300
Message-ID: <20260403-hw_mon-emc1812-v9-0-1a798f31cf2e@microchip.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAi1z2kC/23RTU7DQAwF4KtUsybI9vw5XXEPhFAm8ZBZpKkSF
 EBV786kAqXqZPks+Vu8d1GzTElmdTxc1CRLmtN4yqF+Oqi2b04fUqUuZ0VAFgGo6r/eh/FUydA
 iI1URA4Mz7DsElZ/Ok8T0fQNf33Lu0/w5Tj83f8H1+kdR/UgtWEEVxMSOmwjompchtdPY9un83
 I6DWrmFNgIJC4IyYQOBh8jBe94j9EYQckHoTDRIuukaH9jWe4T5Jxwg+YIwmXAhOu2CNWz8HmE
 3gsAWhM0EaWJtG4nCcY9wdwQWyywuE6K91EFzx/VuF/6OIF0Qfq0ThZx30QjBHsEboREKgtdRW
 7TWkxfo6JG4Xq+/JIjxnoUCAAA=
X-Change-ID: 20251002-hw_mon-emc1812-f1b806487d10
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
CC: <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>, Marius Cristea
	<marius.cristea@microchip.com>, Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4456;
 i=marius.cristea@microchip.com; h=from:subject:message-id;
 bh=PnRnd7lQtN3WxG2Z0pPYrXqxZbFA1u+MSlM8AIZnedU=;
 b=owGbwMvMwCW2tbSTZa7u0x2Mp9WSGDLPbxUQ5GnjMYqcmOeyJ7mn6l0TS36NzZovswUDVqruf
 vpmwm+2jlIWBjEuBlkxRZYVb/3UqtZ+uKwklqkDM4eVCWQIAxenAEykWImR4Y2n/lOtmhmL7ty/
 wynFOTs9PPtMR54vE0fOKU6HtULpqgz/7Dg9p/21Njlklz0hoeZDys0Ilw0xMpGH3nBHsWmfdL/
 OBAA=
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

 .../bindings/hwmon/microchip,emc1812.yaml          | 184 ++++
 Documentation/hwmon/emc1812.rst                    |  67 ++
 Documentation/hwmon/index.rst                      |   1 +
 MAINTAINERS                                        |   8 +
 drivers/hwmon/Kconfig                              |  11 +
 drivers/hwmon/Makefile                             |   1 +
 drivers/hwmon/emc1812.c                            | 965 +++++++++++++++++++++
 7 files changed, 1237 insertions(+)
---
base-commit: d2b2fea3503e5e12b2e28784152937e48bcca6ff
change-id: 20251002-hw_mon-emc1812-f1b806487d10

Best regards,
-- 
Marius Cristea <marius.cristea@microchip.com>

