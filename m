Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF98F35B63B;
	Thu,  5 Feb 2026 07:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770275394; cv=none; b=oIic+4Ti5D9eTpic7alSk7G+EMEoSAFfYchLPvej4FOmI+Uih+2dxdhc/s+FrFjo2bAHbI1AshTR1YqTlb+RtWD+Z2TC+2qsjLFAS1Sz+J6S2NG/xaMcIKuEX7lPer0/e4DODo/wIPHvaKbLmK8UeSpsgWAubD/h0D9CAnlAMXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770275394; c=relaxed/simple;
	bh=PHl0pdws+AFijhkZGaul3d6HAUBMSEar3LO1wTBxAjk=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=BTDK9zx/BN5oAgg4uFMT7nB79XyJg1nAtL911lGdYWhNQYZX5Ge3KK2QjBH7CNx75OrgevF35pHaYu2xM+4TPLI/tSEqM1gXMy0ts3eJmKY3L4UL78VmUJw3iF1SO3VY+v21fhyACT+ptzA+F0NW7Ldgl3UREZjGAHpVOjl9Mjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=X7TSMYs/; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="X7TSMYs/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1770275394; x=1801811394;
  h=from:subject:date:message-id:mime-version:
   content-transfer-encoding:to:cc;
  bh=PHl0pdws+AFijhkZGaul3d6HAUBMSEar3LO1wTBxAjk=;
  b=X7TSMYs/+NBfyAJfKGsY+38S74I5IIM+aHrtqRngu+FTXKlrlZ7sKPAg
   dllKbIWekLW4i4sLqU7DFzvP7lVg0vdZVYU3IIj7JCVOqv9QFkX61YCVE
   bzgnGnq+sPvihKAPFmIcax+PibAYTFomhTcr65UAbfL4H9NLagFqv8gfD
   +F6X7asDFqwL0zVPwEraIPJR8hDCNhakzSFdKrGc6rzEBVAbdsfwrxQRp
   dmKnoSAyp/+UNpGmSY6qwvVyV/4yHErr61wdip9W+W9W02G9uyo4XwaUD
   M33kIIPpw5/1Je7bJIIgbGbw8DNYlHjgQ9YL5zMAcuLa7Ema0cZTaeBOo
   Q==;
X-CSE-ConnectionGUID: z58WiLDAQlOlatl5K73KFQ==
X-CSE-MsgGUID: 9XL/ltLGQlmo2IlelJSwEw==
X-IronPort-AV: E=Sophos;i="6.21,274,1763449200"; 
   d="scan'208";a="284342757"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 05 Feb 2026 00:09:47 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Thu, 5 Feb 2026 00:09:08 -0700
Received: from marius-VM.mshome.net (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Thu, 5 Feb 2026 00:09:04 -0700
From: Marius Cristea <marius.cristea@microchip.com>
Subject: [PATCH v5 0/2] Add support for Microchip EMC1812
Date: Thu, 5 Feb 2026 09:09:02 +0200
Message-ID: <20260205-hw_mon-emc1812-v5-0-232835aefe8f@microchip.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA5ChGkC/23My2rDMBCF4VcJWldlZqzLJKu+RyhFkqVaC1tBL
 k5L8LtXCS2BOMv/wPkuYo41x1kcdhdR45LnXKYW+mUnwuCmzyhz31oQkEYAksP5YyyTjGNARpI
 JPYNRbHsE0U6nGlP+voHH99ZDnr9K/bn5C17XP4r2j9SCEqSPKvXsEqBxb2MOtYQhn15DGcWVW
 +hOIOGGoEZoT2AhsbeWnxHdnSDkDdE1wiF1rnfWs94/I9Q/YQDJbgjVCOOT6YzXipV9JNZ1/QV
 pAJezeQEAAA==
X-Change-ID: 20251002-hw_mon-emc1812-f1b806487d10
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
CC: <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>, Marius Cristea
	<marius.cristea@microchip.com>, Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2769;
 i=marius.cristea@microchip.com; h=from:subject:message-id;
 bh=PHl0pdws+AFijhkZGaul3d6HAUBMSEar3LO1wTBxAjk=;
 b=owGbwMvMwCW2tbSTZa7u0x2Mp9WSGDJbnARkWaRvJbBzFi0R+7wv5ty7wry4fTIiBtur/Kc+L
 3riPn1mRykLgxgXg6yYIsuKt35qVWs/XFYSy9SBmcPKBDKEgYtTACYSO5uRYW+oa2aR5k5z0V3T
 D+xfb5owM752x6RFU72EAlex53xz/czI8G+H3wWGZ/9cAiVyV7w7cevJe4+blrpPp0uz7sm10Fl
 owgMA
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

 .../bindings/hwmon/microchip,emc1812.yaml          | 182 ++++
 Documentation/hwmon/emc1812.rst                    |  68 ++
 Documentation/hwmon/index.rst                      |   1 +
 MAINTAINERS                                        |   8 +
 drivers/hwmon/Kconfig                              |  11 +
 drivers/hwmon/Makefile                             |   1 +
 drivers/hwmon/emc1812.c                            | 945 +++++++++++++++++++++
 7 files changed, 1216 insertions(+)
---
base-commit: d2b2fea3503e5e12b2e28784152937e48bcca6ff
change-id: 20251002-hw_mon-emc1812-f1b806487d10

Best regards,
-- 
Marius Cristea <marius.cristea@microchip.com>

