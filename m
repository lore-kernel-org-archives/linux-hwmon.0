Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67EFF1EF0B0;
	Tue, 27 Jan 2026 15:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769526350; cv=none; b=nYaT0kJnmt7m3VS84pWY9ikiYMBN69OcJIyFeA2CF9meXBP+GCVwPQ2u1MixsrijQYpSPxmwjV00uMoCOtV3ObKu+JgWe8QRcXo5jJzlWwaezpYi377pCVVVxbeiwsRXutpzcdAenHCHm6mdr3ub56XJFA5XANqXIWoxbkn9DAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769526350; c=relaxed/simple;
	bh=50juojVCOXpFQivcxyJdwms36HjenBrCxnhk/FwJvS0=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=Kct8nw8MbHpavjBr7IDniNvYoip3U9kP975O+AkATH008CTUfCdFnmzpZyNiwOXQKU6ZWutDTbaolCv1G695EhJVBxiSpCRn0JRCAWZl/MXI6OBmsMuZtbfxK16y3WkgsAA7xJFRUOK1zG3azgMUcTZPh5p9bxZX+nrPq1G3W9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=wYMRZjzQ; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="wYMRZjzQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1769526349; x=1801062349;
  h=from:subject:date:message-id:mime-version:
   content-transfer-encoding:to:cc;
  bh=50juojVCOXpFQivcxyJdwms36HjenBrCxnhk/FwJvS0=;
  b=wYMRZjzQ7Q+g075dQnqFNe8t2nabZ0mrp3/y0E/+s5MCq5QXkzGaOV5w
   s5dUI04Iwkwy4vYCxdvh4ExL/htaeChaa++pGl3+iTup5PgwEEu2F/zV7
   pUlIQlqmPN+BBrHobfmfGdHkoqG9M3e+9o1yCktqKp9FHvLLki6s2iHF7
   uySASsMtvHd4NwoK2vVR09gv4812eJsvfNoaqoqr+KIxtfQwT7lCi/HcL
   xhf8PsWl0A/mpCDs871uyqZVU+V4q9IJouaslK0kJ4ir4689RRdR3wIEu
   C18Q23LiKn5WHBYuwBfcv3jHDO9PsRdG7cWJqQKYbE2wvk9jHgdlmU/r8
   A==;
X-CSE-ConnectionGUID: uHcYOJ7UQAOjT/81Yu0oMA==
X-CSE-MsgGUID: 33YpRk15T3KHZzrgbezGow==
X-IronPort-AV: E=Sophos;i="6.21,257,1763449200"; 
   d="scan'208";a="283876202"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 08:05:43 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.29; Tue, 27 Jan 2026 08:05:31 -0700
Received: from marius-VM.mshome.net (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Tue, 27 Jan 2026 08:05:29 -0700
From: Marius Cristea <marius.cristea@microchip.com>
Subject: [PATCH v4 0/2] Add support for Microchip EMC1812
Date: Tue, 27 Jan 2026 17:05:23 +0200
Message-ID: <20260127-hw_mon-emc1812-v4-0-6bf636b54847@microchip.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADPUeGkC/23M0QqCMBTG8VeJXbc456htddV7RMQ2t9yFTmZYI
 b57UwJBu/x/8P0G1tnobcfOu4FF2/vOhyZFvt8xU6nmYbkvUzMCKhCAePW616HhtjYokbhDLeG
 YS1EisHRqo3X+PYPXW+rKd88QP7Pf47T+KDqtqR45cG1zV0rlAI/qUnsTg6l8ezChZhPX00Ig4
 YagRBSaQICTWgj5j8gWglBuiCwRCilTpRJaFqc1MY7jFy8gPr82AQAA
X-Change-ID: 20251002-hw_mon-emc1812-f1b806487d10
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
CC: <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>, Marius Cristea
	<marius.cristea@microchip.com>, Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2262;
 i=marius.cristea@microchip.com; h=from:subject:message-id;
 bh=50juojVCOXpFQivcxyJdwms36HjenBrCxnhk/FwJvS0=;
 b=owGbwMvMwCW2tbSTZa7u0x2Mp9WSGDIrrlh4/VV2t11ixRHS8G2v5KK05QEbjJlnrz+417bbb
 srVNZ/3dZSyMIhxMciKKbKseOunVrX2w2UlsUwdmDmsTCBDGLg4BWAikzoY/hmul1xskcq9QmC6
 RGyI5ddL/bZHjPsy9j98v3+itI9bijnD/+RPe87p2/XOje7ZMq065Ffsk7AT+oaTj90XYFcoYvn
 oxggA
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
 drivers/hwmon/emc1812.c                            | 963 +++++++++++++++++++++
 7 files changed, 1234 insertions(+)
---
base-commit: d2b2fea3503e5e12b2e28784152937e48bcca6ff
change-id: 20251002-hw_mon-emc1812-f1b806487d10

Best regards,
-- 
Marius Cristea <marius.cristea@microchip.com>

