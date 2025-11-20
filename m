Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB5422FDC4F;
	Thu, 20 Nov 2025 11:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763637159; cv=none; b=ri8HL9nnerIbUVQPLuJQNba+ws3Y0N65MJHFkIMWkBQUO0TKn0pB/SGQeBg4iSGnKw0XZgROI/fkdDC1LJ/I9qyMZVVpPQ7ekFNR7Skw89jk0jo5igKCTD+tSHIcHacut82tl6YCqNDbhq6oahT737l2c2oGaHZEwFlZGzkwyhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763637159; c=relaxed/simple;
	bh=7YzUe3MK3YytK0uTkt7q+giwkUEjWEmLwPZCbjl4/JI=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=YHeOYQBTn1Hw3kp1EvJuQAwFDMeFr4NR6EBGliOSh1g/vOpeLo4rPLOpCwqaKKFYJP7WihZ4CBP2uykcLUJTzZX+B6t2owbYWPkqrDe68LXk/38Ph2N3gIaYjh5Ygvdqs/x5ml78mbknhQpFgmvb0ckyVJ19B9N1OjGiJx2e0/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; arc=none smtp.client-ip=211.20.114.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 20 Nov
 2025 19:12:34 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 20 Nov 2025 19:12:34 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
Subject: [PATCH v3 0/2] Add "aspeed,ast2700-pwm-tach" compatible string
Date: Thu, 20 Nov 2025 19:12:30 +0800
Message-ID: <20251120-upstream_pwm_tach-v3-0-eaa2f9b300a2@aspeedtech.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJ73HmkC/02MSw6DIBQAr2LeuhigWrSr3qNpDOKzvESEAP3Fe
 PeSrrqazGJmg4SRMMG52iDikxL5tcjxUIGxer0jo6k4SC5bIUTHHiHliNoN4eWGrI1lrZpHrVR
 vsGugdCHiTO/f83orPkfvWLYl+jvxhrcFspYn1fNOMcFGWpbPkJOmi04BccpobG28g33/AtX2n
 GioAAAA
X-Change-ID: 20251118-upstream_pwm_tach-57fba779ce84
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
	Billy Tsai <billy_tsai@aspeedtech.com>
CC: <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, <BMC-SW@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763637154; l=1125;
 i=billy_tsai@aspeedtech.com; s=20251118; h=from:subject:message-id;
 bh=7YzUe3MK3YytK0uTkt7q+giwkUEjWEmLwPZCbjl4/JI=;
 b=Ry5JJo5yb1rgp/9y2Gm2lB+FTnU50rMEHcFxnSx6NUIjuhSdtP3/KQCXVtUgQ4XlFp6bbjYdd
 K2HZHLO2OsGBLd0Juo3O4Up1/SkTBXOLJicdrC3q/W5x03+b5ouKuTV
X-Developer-Key: i=billy_tsai@aspeedtech.com; a=ed25519;
 pk=/A8qvgZ6CPfnwKgT6/+k+nvXOkN477MshEGJvVdzeeQ=

Adds the "aspeed,ast2700-pwm-tach" compatible string, which provides
fallback support for the previous version of the hardware design, to
the PWM/TACH dt-binding and driver.

---
Changes in v3:
- Drop the comments
- Link to v2: https://lore.kernel.org/r/20251118-upstream_pwm_tach-v2-0-4d9bc13d34f9@aspeedtech.com

Changes in v2:
- Reworked the binding to use a two-level compatible list with
  "aspeed,ast2600-pwm-tach" as the fallback.
- Link to v1: https://lore.kernel.org/r/20251104055112.2679087-1-billy_tsai@aspeedtech.com

---

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>

---
Billy Tsai (2):
      dt-bindings: hwmon: Add AST2700 compatible
      hwmon: (aspeed-g6-pwm-tach): Add AST2700 compatible string

 Documentation/devicetree/bindings/hwmon/aspeed,g6-pwm-tach.yaml | 7 +++++--
 drivers/hwmon/aspeed-g6-pwm-tach.c                              | 3 +++
 2 files changed, 8 insertions(+), 2 deletions(-)
---
base-commit: e7c375b181600caf135cfd03eadbc45eb530f2cb
change-id: 20251118-upstream_pwm_tach-57fba779ce84

Best regards,
-- 
Billy Tsai <billy_tsai@aspeedtech.com>

