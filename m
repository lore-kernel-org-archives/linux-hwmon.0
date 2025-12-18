Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F15852E62B5;
	Thu, 18 Dec 2025 13:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766065778; cv=none; b=UZQiHeSzwXPAldBfqPwAhkUbTJLLKVxq6n2yIDXQZRGAGjujtz7gvghG8TG+iG//1dG91KDAQB+lu0P43z0riPs3VJ/NVyZoq3Klsh5qRVXq2uQLS755ilTOQ2U1Kq2FQoHlqWEQtlOrmWrO2LMaodSQlUM2GEorvb6qSl3ECFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766065778; c=relaxed/simple;
	bh=ZUlPv0gRf5wEWdZ/1bKPPdZCXjBwOJRFepMCOSGG1aI=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=pffcuw4tCrN6GDRM6IEDNuZAZYXPWrjEGOPmRdmDjLbiUWLEBtWNZhGVIef+3+YwtfGPYEpXitPYh12H7ltZxQ3YhCHjMXIGjbxOkBx+KkH4yJfee1FgMux8oBkzeObi6yD3ZuxrM7wk5pv/aTGZ6kk27uCh4nKZvRaOMiLU80w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=r04HQ0Jm; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="r04HQ0Jm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1766065777; x=1797601777;
  h=from:subject:date:message-id:mime-version:
   content-transfer-encoding:to:cc;
  bh=ZUlPv0gRf5wEWdZ/1bKPPdZCXjBwOJRFepMCOSGG1aI=;
  b=r04HQ0JmsVNx/KcSwbiL12yxD7yQaNMAGPf2SBLWICI7h4K5SxjkCgge
   1V47sqEzKE7AYDtB1wzZliOEhJO4PXR8dlorA7J5dv7TDks1zzrpzkKRQ
   OwCyUKqyPKho3SYvzbwBrh6EPAdJ7EGwZacLGLwlEn3GIJUUDU1/oY10z
   2aacc/beGRbPcmXTWVfg7ukP+eL+d3eo7mOFo/nxWr7oT79MaXrVW7mWu
   yieO19VlWGjPjkyCNK8ZlU3uUSZR5xYdwgFKGXc4VYO7VAELuBCI6RZ7B
   W3wySPs0qZ1TE+5RRccp6Ab+KBSRbijy7DIW86wYYpFRiL5utQgUJ9qUa
   A==;
X-CSE-ConnectionGUID: uStnpH7tSuOu/D8Br4ZMQw==
X-CSE-MsgGUID: hmoE4KUpRJmE127I28b9hA==
X-IronPort-AV: E=Sophos;i="6.21,158,1763449200"; 
   d="scan'208";a="57520190"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 06:49:36 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex4.mchp-main.com (10.10.87.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.29; Thu, 18 Dec 2025 06:49:05 -0700
Received: from marius-VM.mshome.net (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Thu, 18 Dec 2025 06:49:03 -0700
From: Marius Cristea <marius.cristea@microchip.com>
Subject: [PATCH v3 0/2] Add support for Microchip EMC1812
Date: Thu, 18 Dec 2025 15:48:56 +0200
Message-ID: <20251218-hw_mon-emc1812-v3-0-a123ada7b859@microchip.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEgGRGkC/2XM0QqCMBTG8VeRXbc456RuddV7RISbW9vFnMywQ
 nz3pgSBXf4/+H4TG0zyZmCnYmLJjH7wsctx2BVMu6a7G+7b3IyAKgQg7p63EDtugkaJxC0qCXU
 pRYvA8qlPxvrXCl6uuZ0fHjG9V3/EZf1SdNxSI3LgypS2lY0FrJtz8DpF7Xy/1zGwhRvpRyDhH
 0GZqBSBACuVEHJLzPP8Ac+jDbjzAAAA
X-Change-ID: 20251002-hw_mon-emc1812-f1b806487d10
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
CC: <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>, Marius Cristea
	<marius.cristea@microchip.com>, Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1987;
 i=marius.cristea@microchip.com; h=from:subject:message-id;
 bh=ZUlPv0gRf5wEWdZ/1bKPPdZCXjBwOJRFepMCOSGG1aI=;
 b=owGbwMvMwCW2tbSTZa7u0x2Mp9WSGDJd2PwKex5xG9w1un1TdJ7tnN8Xrj6ImDBDoHBn1+cZl
 XUzbtQ2dZSyMIhxMciKKbKseOunVrX2w2UlsUwdmDmsTCBDGLg4BWAiv80Z/kqHPjTf/u6scPGm
 dtO1M7qmHOnYV7tbwfNNn5vp3Nfz0mUZGQ4u0zx29r7Ny4WfMovzPbz4dfveXUy/x1pXup9Z9JQ
 6GycA
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
 drivers/hwmon/emc1812.c                            | 966 +++++++++++++++++++++
 7 files changed, 1237 insertions(+)
---
base-commit: d2b2fea3503e5e12b2e28784152937e48bcca6ff
change-id: 20251002-hw_mon-emc1812-f1b806487d10

Best regards,
-- 
Marius Cristea <marius.cristea@microchip.com>

