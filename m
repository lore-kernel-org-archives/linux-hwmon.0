Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E81833C188;
	Fri, 21 Nov 2025 08:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763714962; cv=none; b=h91Ts+Yn53Qt4Tsd7A2AfNebtbal5Rw5TbYB3KgoqsalEpJVJGA4McvdUsF6YsVRnZkqPIHsEiQBcGEXyJeBGhRWVsZ81sDokxdt0/xN9VV6Uuodnz1uD+9CkWRjSindyskaatJ7OuTCTLwBL72lfcB7+Cq8vjybgDN5ptnNLwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763714962; c=relaxed/simple;
	bh=2a6B8T00wgK1+t9Ha00mHgSKtskeKDoJ0hM4NhfDVgU=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=hO0HkaIpDfR/I1MkhzdOq0o3C4Wi362mpsSFu0461kRHJok7haCZGNtetF3rG9OWWal1KgkMGyDq5on35oy99YCJmVb++WZ7aCGh9kKCR0/z2WveuQDxS2tE2VWI6Dc5yoOKS5WxUWuqVoh2HnqpEtd0SOcr2kRTYb+liffIvC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=M9SJGaXC; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="M9SJGaXC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1763714958; x=1795250958;
  h=from:subject:date:message-id:mime-version:
   content-transfer-encoding:to:cc;
  bh=2a6B8T00wgK1+t9Ha00mHgSKtskeKDoJ0hM4NhfDVgU=;
  b=M9SJGaXC5ObZ42KRKDpR3UcHMPWTGjaPG0zTTsOoagBqsHRok7H8JLG/
   JpdtbGLPeqSyDkNXg3WoepmNM2AfE9bGHRMfbh1h2Zn3rmUPQ9etg5s8+
   N8eRDjyCgnfGansnVgErt2IZJusUkAG+1dhHw4I2Wt/hdC+a4axCj19Yz
   m/qOitUkEK6iHLj+OkhKldOi1vqqL9YpwLyoyz+6TBIyQiMvuCugw4ud/
   G2FRK9AYGRHC7msG6Eqb7X86aE9/PdzSAWRco/5sXNvpmgjBfk9Byntnw
   CAyqQVrXRx4PMvUYPYjVGbmrDU/uOVx6RMHdJtWgAG8DYr8zhh0jKiEzh
   w==;
X-CSE-ConnectionGUID: wKnKnyE+RMO2awr1IOEsIA==
X-CSE-MsgGUID: B0QPjaGKRf+49NXkrhn70g==
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; 
   d="scan'208";a="56041597"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 21 Nov 2025 01:49:15 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Fri, 21 Nov 2025 01:49:02 -0700
Received: from marius-VM.mshome.net (10.10.85.11) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Fri, 21 Nov 2025 01:48:59 -0700
From: Marius Cristea <marius.cristea@microchip.com>
Subject: [PATCH v2 0/2] Add support for Microchip EMC1812
Date: Fri, 21 Nov 2025 10:48:53 +0200
Message-ID: <20251121-hw_mon-emc1812-v2-0-5b2070f8b778@microchip.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHUnIGkC/13MQQ6CMBCF4auQWVsz0yBWV97DEANlamdRSlqDG
 sLdrcSVy/8l71sgcxLOcK4WSDxLljiW0LsKrO/GOysZSoNGfSBErfzzFuKoOFgypJWj3mBTm+N
 ACOU0JXby2sBrW9pLfsT03vyZvuuP0qd/aiaFqufaDaZzSE13CWJTtF6mvY0B2nVdP6wxk5CwA
 AAA
X-Change-ID: 20251002-hw_mon-emc1812-f1b806487d10
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
CC: <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>, Marius Cristea
	<marius.cristea@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1705;
 i=marius.cristea@microchip.com; h=from:subject:message-id;
 bh=2a6B8T00wgK1+t9Ha00mHgSKtskeKDoJ0hM4NhfDVgU=;
 b=owGbwMvMwCW2tbSTZa7u0x2Mp9WSGDIV1Ktsn4rN38O/r+L0scevFt5vvxLLcyC7jMNy0rzNz
 64/CvSO6ihlYRDjYpAVU2RZ8dZPrWrth8tKYpk6MHNYmUCGMHBxCsBEFpczMqzobXUICrWXuns4
 VkDgTnD//3rNN5FOP72VNA7br8tYYcnwz+boQb77Z3fErX7wKYxTRcG9Zdf9O+8ieBimutyqYBe
 T5wEA
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
 drivers/hwmon/emc1812.c                            | 968 +++++++++++++++++++++
 7 files changed, 1239 insertions(+)
---
base-commit: d2b2fea3503e5e12b2e28784152937e48bcca6ff
change-id: 20251002-hw_mon-emc1812-f1b806487d10

Best regards,
-- 
Marius Cristea <marius.cristea@microchip.com>

