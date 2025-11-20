Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A59030BF60;
	Thu, 20 Nov 2025 08:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763626849; cv=none; b=pRqqkJbxUTLe6F2EAGLfUm/gdf0uv69fO1qBIvk9BHzXnAJqdaCy7vAR8HHpd4klzVwBqL0zCpylTSvggR8If8aCaFPBBQJOJSV3AWiIr43Cmf3IENN2ysmamBL5SVBpbm+xr7yZ0oHc8kCRzvNUhdmsyGMJlt0uPS45R03dXBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763626849; c=relaxed/simple;
	bh=ZW042sC9gIPOFnqhoxec9Hoqgz2PilHlyVzmoeoFWJs=;
	h=From:To:Cc:Subject:Date:Message-Id; b=cS3eJUjS6Ea48AZpPDxvRcyMYO3ScSUPZktOL2gN5p1lza9hngNfi9QyFX2C4WUdTCuz7WOe78ZQXGJ+6k+PIDaN5SmrfauvBDjex9T5BNhpS0Qhdk60e847eRB3mJpAJN3QbGg3NRZnIuMuH3+TtN44jo6vubD0I62yAD7nq6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=XgSq4ELR; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="XgSq4ELR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id; bh=GXrAeDrMarYstBo
	zZxJzPxQ6+Dj9RlIaBV2Ivegt5Nk=; b=XgSq4ELR6fkQfqTvwrNO5xj1RN3EgkF
	buANkSpeZYQANP7SJ+WQQtAts9CKVawGIMD6OH9otPz9zn68LtwVB9fSOnFXw1TY
	Fr4YQ5VFoED44iE4bY5JbYjBqSZXnUv+PW37jyFbETQjR4nomsFOtOzJZkvWImIr
	7m1TNzx/gTCU=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wA3BPAwzx5p45f2BA--.17S2;
	Thu, 20 Nov 2025 16:20:03 +0800 (CST)
From: Wenliang Yan <wenliang202407@163.com>
To: linux@roeck-us.net,
	Jean Delvare <jdelvare@suse.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Wenliang Yan <wenliang202407@163.com>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/8] hwmon: (ina3221) Various improvement and add support for SQ52210
Date: Thu, 20 Nov 2025 03:19:13 -0500
Message-Id: <20251120081921.39412-1-wenliang202407@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID:_____wA3BPAwzx5p45f2BA--.17S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7WFyrAF15ur1fuFyktFW3Awb_yoW8Jw45pa
	97C345Grn8Xr1xXanIkw48C34YqF4xJF1ayr9rJ3y0qF4UA3WSvr48K3Z8t3srtryxtry8
	ua4xursxKasrCrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JUf73kUUUUU=
X-CM-SenderInfo: xzhqzxhdqjjiisuqlqqrwthudrp/xtbCwBTitmkezzR2mQAA3j
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Revised based on feedback from the previous version:

1.Adjusted the description in dt-bindings: add description for sq52210,
express sq52210 in the bindings as compatible devices.

2.Modified the register read/write value conversion function, refined the
calculation logic for each register, and reduced unnecessary function
calls.

---
v2: https://lore.kernel.org/linux-hwmon/20251118125148.95603-1-wenliang202407@163.com/
v1: https://lore.kernel.org/linux-hwmon/20251111080546.32421-1-wenliang202407@163.com/

Wenliang Yan (8):
  dt-bindings: hwmon: ti,ina3221: Add SQ52210
  hwmon: (ina3221) Add support for SQ52210
  hwmon: (ina3221) Pre-calculate current and power LSB
  hwmon: (ina3221) Support alert configuration
  hwmon: (ina3221) Introduce power attribute and alert characteristics
  hwmon: (ina3221) Support for writing alert limit values and modify the
    'ina3221_read_value' function
  hwmon: (ina3221) Support write/read functions for 'power' attribute
  hwmon: (ina3221) Modify write/read functions for 'in' and 'curr'
    attribute

 .../devicetree/bindings/hwmon/ti,ina3221.yaml |  15 +-
 Documentation/hwmon/ina3221.rst               |  24 +
 drivers/hwmon/ina3221.c                       | 527 +++++++++++++++++-
 3 files changed, 552 insertions(+), 14 deletions(-)

-- 
2.17.1

