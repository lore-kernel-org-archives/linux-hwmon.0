Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B45C306B3D;
	Mon, 23 Feb 2026 16:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771862825; cv=none; b=hl/Td0sK3CUvlF9C2ZIofM1CsQjUYsmyyNq4V4QpQkVzmbU/2I7MfGVbH0A5k/R0zzFb2stmlrHPS9V0utqKCwv6XLyWQ7uH6zHMSWCTVr71HYp5SZg+9edfw4ycd4Q4AarpOqhNzaR7CmCccws9h/nCkYdQlSL0nH07DlqIPxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771862825; c=relaxed/simple;
	bh=kuK2ZhKKtex3gkOzDkO9kUJiEsdkf3J+dbaw3UdErDE=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=k4f+9N7Hx0lORnMqONSlm1pjT/ZrTRyj+HXzG8g7HXasR4iw5pMJhQ5pvQ9HEcit2FlKxcQCpLrXdK8uYIY/CReT+QCDns4PCAOTyGy2QiMWmr3xGrc9XZDSDiD9u5GFmriDJ2zBNoUfYBcfuV3VWvzm7EO8yUhaIid9vhQNSpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=G14cTthf; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="G14cTthf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1771862824; x=1803398824;
  h=from:subject:date:message-id:mime-version:
   content-transfer-encoding:to:cc;
  bh=kuK2ZhKKtex3gkOzDkO9kUJiEsdkf3J+dbaw3UdErDE=;
  b=G14cTthfAwKRyVprw5nGLULK9hii4PaAKJDr5ggZ9airvl+mOYelJz1X
   GGy+p6CCKrSAhlM5UW7f3yPLICzc1bBkwcIKZ80pJ/PqxtzS4BKHPU+6Z
   oQTqDV9ZViJim08CRQxX09h9D6o0XvCDdgXqGnwbCybBuw16SWlSkn44K
   HBwoVxcBq3INDcy0F9Mx/5pkZQYnDEIbpRYvjTEkgQqLFtg7YYD6VrwHJ
   eCxx4kIcnhvb1Zl1d9X+NE8sBN2RWXAKbCuKGE1IknjgRBbPoAYlJCwsD
   hlDGErsAaLQJVbUxSWLDvfebeJ3M61AmyglrYw8vDPcgL1AlKRRYPukiz
   w==;
X-CSE-ConnectionGUID: s8ofPVWJRFmgTNkPXyJsMQ==
X-CSE-MsgGUID: mT6SgjMHTjGGdl3Yfsrjbg==
X-IronPort-AV: E=Sophos;i="6.21,307,1763449200"; 
   d="scan'208";a="221008260"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 09:07:03 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.35; Mon, 23 Feb 2026 09:06:27 -0700
Received: from marius-VM.mshome.net (10.10.85.11) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Mon, 23 Feb 2026 09:06:25 -0700
From: Marius Cristea <marius.cristea@microchip.com>
Subject: [PATCH v7 0/2] Add support for Microchip EMC1812
Date: Mon, 23 Feb 2026 18:06:08 +0200
Message-ID: <20260223-hw_mon-emc1812-v7-0-51e2676f4e20@microchip.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPB6nGkC/23RS07EMAyA4auMsiYodl7urLgHQihpHZpF21GLC
 mjUu5MZgYpIl78lfwv7KhaeMy/ifLqKmde85Gks4R9Oou3D+MYyd6UFKrSgFMr+43WYRslDCwQ
 oE0RSzpDvQImydJk55c87+PxSus/L+zR/3f0VbtMfCpv/1ApSycgmdRSSAheehtzOU9vny2M7D
 eLGrbgTgFARWAgbUXmVKHpPR4TeCQSqCF2IAKhDF3wk2xwR5pdwCtBXhCmEi8lpF60h448IuxO
 obEXYQqBG0jZwYkpHhPtDQPWZ1RWCtecmauqoqW6xbds30B3RO/8BAAA=
X-Change-ID: 20251002-hw_mon-emc1812-f1b806487d10
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
CC: <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>, Marius Cristea
	<marius.cristea@microchip.com>, Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3678;
 i=marius.cristea@microchip.com; h=from:subject:message-id;
 bh=kuK2ZhKKtex3gkOzDkO9kUJiEsdkf3J+dbaw3UdErDE=;
 b=owGbwMvMwCW2tbSTZa7u0x2Mp9WSGDLnVH2eHRMS3NFiEl9wpXLx1JOPSpfxP2ZJu3q2//e99
 dtzuNVedZSyMIhxMciKKbKseOunVrX2w2UlsUwdmDmsTCBDGLg4BWAiMosZ/rvPVxYutNl09OJN
 vxcNz9luHUgtM7usLrvso+rzjG02Wz0Z/spdzHOb0BLkW7KERX3jA49He/K3lt2adtjmWoz4rlv
 J0ewA
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
 Documentation/hwmon/emc1812.rst                    |  68 ++
 Documentation/hwmon/index.rst                      |   1 +
 MAINTAINERS                                        |   8 +
 drivers/hwmon/Kconfig                              |  11 +
 drivers/hwmon/Makefile                             |   1 +
 drivers/hwmon/emc1812.c                            | 940 +++++++++++++++++++++
 7 files changed, 1213 insertions(+)
---
base-commit: d2b2fea3503e5e12b2e28784152937e48bcca6ff
change-id: 20251002-hw_mon-emc1812-f1b806487d10

Best regards,
-- 
Marius Cristea <marius.cristea@microchip.com>

