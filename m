Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FCF52DB7BA;
	Mon, 19 Jan 2026 12:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768824964; cv=none; b=VNUFmzrN0OlBwvyzBG9FQ/bH4x8/WnsRO9bEtBH0nuSX0tJZpgEH1ffuawV2TxjGrh4YW5k5viT4ywHv0bfV19ohsAFVgHJBz+xz92rx+m7zW+PzdXk5nrsjX1QPxnij1mdsNprBe6DwOnTKtwTgH08C9kw/uy758vIa4RT5Wbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768824964; c=relaxed/simple;
	bh=krPwPQ2jWPDCO3IoDZIF0uFZ08G4aXcoMwGFnbwRwls=;
	h=From:To:Cc:Subject:Date:Message-Id; b=gtdho2IBkx5PXS7/VOxZQfMxWgSLmPdkjD+IhPoraEdQyg2JQU2mmU5yteZN4Rt+OfN+oVZKtsBI4L/bBJ0ltSn9915zKc6jpn0EEuxSrVa6GSSBCbQMSUZKnL+3hoAFQeHy7eljs2s+K6Nyh5x7uszZgt63tZPIiBBiFhAs+ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=W+l/xcpa; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="W+l/xcpa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id; bh=h94LT3YrkKdD2Yi
	8iniPVebKzAclNRhFsUwUw/uZ+k8=; b=W+l/xcpaz7WADGKNPtemJl0rbIffblz
	3+IC82wtjrN6t4BbKkMU5+XcYqCnzJq5ctWXNGW0xVf6DJXSx/UGdBAJqDp/G6cr
	OlYSYZY1nMfid/l8DW9Tqcn9H9mBrhf++0f8cB2ZsYE7edFGcxv00at0pBQkC+ug
	Qis+SXE3Thcs=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wBHtZdDIG5pljmWGw--.3726S2;
	Mon, 19 Jan 2026 20:15:02 +0800 (CST)
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
Subject: [PATCH v5 0/8] hwmon: (ina3221) Various improvement and add support for SQ52210
Date: Mon, 19 Jan 2026 07:14:38 -0500
Message-Id: <20260119121446.17469-1-wenliang202407@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID:_____wBHtZdDIG5pljmWGw--.3726S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Kw43KFyrtrykWFWfKr45Wrg_yoW8Zr18pa
	yxKw15Gwn8Zr1xXanIka17uryFqr13CF4a9r97G3y0vF4Y93WSvFyvgFZ8t3srJr9FkFy8
	ta4xWF1qg3srCrDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JU-4SOUUUUU=
X-CM-SenderInfo: xzhqzxhdqjjiisuqlqqrwthudrp/xtbC5wYP4mluIEaspwAA3m
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Make modifications according to the guidance provided in the reply.

1.Modify the description for power[123]_input(PATCH 5).

2.Re-annotate the significance of the limit value calculation
and the use of register masks in the sq52210_alert_limit_write.
Modify the calculation process to resolve arithmetic overflow issues.
The limit values SOL, BOL, and BUL are all stored using the upper
13 bits of the register, so shifting is required. In contrast,
the POL value is configured by setting the lower three bits
to 0 directly(PATCH 6).

3.Resolve arithmetic overflow issues in the ina3221_read_power(PATCH 7).

4.Resolve arithmetic overflow issues in the ina3221_read_curr,
and validate channel indices in ina3221_write_in(PATCH 8).


---
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
  hwmon: (ina3221) Support for writing alert limit values and modify the
    'ina3221_read_value' function
  hwmon: (ina3221) Support write/read functions for 'power' attribute
  hwmon: (ina3221) Modify write/read functions for 'in' and 'curr'
    attribute

 .../devicetree/bindings/hwmon/ti,ina3221.yaml |  15 +-
 Documentation/hwmon/ina3221.rst               |  24 +
 drivers/hwmon/ina3221.c                       | 545 +++++++++++++++++-
 3 files changed, 570 insertions(+), 14 deletions(-)

-- 
2.17.1

