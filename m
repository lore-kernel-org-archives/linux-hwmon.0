Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D5E3B2FD9;
	Thu,  2 Apr 2026 08:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775117694; cv=none; b=mqfPyOi6vGu/hxOtFYzHf6xeXbvRvz/JSvl0QUjVeoScaZqGeoYbxG0KP7GcqP6h2ZYqxIzjw/CGMyq8VOjE5z50aEc6pc3PmaccBy1UBBqu8LRf9KGdGmsfQ5rA9l7bvMvi1dl2DZiDPaMA9JbULB3rtWm5Hc2qZTCAhZlX8OU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775117694; c=relaxed/simple;
	bh=nMY6C9pMt7VeS4KgMH5mOiPqRP+qUHKboMu77924Xeo=;
	h=From:To:Cc:Subject:Date:Message-Id; b=UXqcWfoO4eCp4bO0XihKSMoGw+4gKL2nLsgNPZDe3YGvpKtTWWHjRjQDrybuiCjxOgR5X7svvb9GXXHs1abqRZ0deoy8UAmHoFNpSDa5aMatmjT5IBY5k2fs8Q99XzrbVFG+TjbBRCej3CR8TT47Q3skutI6IlpHP05MLgjrP/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=LN6a4tPy; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="LN6a4tPy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id; bh=sjepgizR3xZzZsc
	pwm+JF7uT0zoTKekz9Z6EodbvlT0=; b=LN6a4tPymskhc1EAuIGAOyuewxot/Ia
	qpFywgtc3KCRDyTmFcouCSIBBvRxX7LFMNkStUYPcdO1DKLCxnh7fXA1hTYcOV4V
	mzLvBQGQVM3KnzI4OJLwXA1nexWGvZUnwRpQOVzH+Hv+hPFzjjHrNAAg9s5c+TlS
	HUVzXS0ORU0w=
Received: from localhost.localdomain (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgCX5UBEJc5pC9uuUw--.170S2;
	Thu, 02 Apr 2026 16:14:00 +0800 (CST)
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
Subject: [PATCH v7 0/8] hwmon: (ina3221) Various improvement and add support for SQ52210
Date: Thu,  2 Apr 2026 04:13:42 -0400
Message-Id: <20260402081350.65559-1-wenliang202407@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID:QCgvCgCX5UBEJc5pC9uuUw--.170S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZF43AF4kWr1ftrW5JFW7XFb_yoW8Xw4xpa
	yIkw45Wry3Xr1xXa9Ikw47Cryjq3y3JF129r97J3y0vF4Yv3W7ZrZ2gws0yw1DKr9rKFy8
	XayxWFnxKasrArDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JUfrc-UUUUU=
X-CM-SenderInfo: xzhqzxhdqjjiisuqlqqrwthudrp/xtbC6AhpPWnOJUiupgAA32
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Changes in v7:
- Fixed unnecessary semicolon in ina3221_read_value()
  (reported by kernel test robot)

I will address any additional feedback in the next version.
Thank you for your time

---
v6: https://lore.kernel.org/linux-hwmon/20260225090324.112145-1-wenliang202407@163.com/
v5: https://lore.kernel.org/linux-hwmon/20260119121446.17469-1-wenliang202407@163.com/
v4: https://lore.kernel.org/linux-hwmon/20260114081741.111340-1-wenliang202407@163.com/
v3: https://lore.kernel.org/linux-hwmon/20251120081921.39412-1-wenliang202407@163.com/
v2: https://lore.kernel.org/linux-hwmon/20251118125148.95603-1-wenliang202407@163.com/
v1: https://lore.kernel.org/linux-hwmon/20251111080546.32421-1-wenliang202407@163.com/

Wenliang Yan (8):
  dt-bindings: hwmon: ti,ina3221: Add SQ52210
  hwmon: (ina3221) Add support for SQ52210
  hwmon: (ina3221) Pre-calculate current and power LSB
  hwmon: (ina3221) Support alert configuration
  hwmon: (ina3221) Introduce power attribute and alert characteristics
  hwmon: (ina3221) Modify the 'ina3221_read_value' function
  hwmon: (ina3221) Support alert_limit_write function and write/read
    functions for 'power' attribute
  hwmon: (ina3221) Modify write/read functions for 'in' and 'curr'
    attribute

 .../devicetree/bindings/hwmon/ti,ina3221.yaml |  15 +-
 Documentation/hwmon/ina3221.rst               |  24 +
 drivers/hwmon/ina3221.c                       | 548 +++++++++++++++++-
 3 files changed, 571 insertions(+), 16 deletions(-)

-- 
2.17.1

