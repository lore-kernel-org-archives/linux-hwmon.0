Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7717E3043B9;
	Tue, 18 Nov 2025 09:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763457124; cv=none; b=XjJdjHPwrs4JBtPBiyET5543OayPQpBgRr4UbJJvuY74knE6chCeKMYmrbYNJJZPUS/YEjmrCODDBReACekDad8Rieq901FzhRH+7BAQYsxi8rK59AkJGyHb59/IrydOztPOjWnyr7jmExadoRm6Ylo11hc3lvAbkn0ttTwI4jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763457124; c=relaxed/simple;
	bh=eInYEJN6YIiUk3jMYad5Xh4rxav6UXQDFOgidbnXMpI=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=SUVa/HCQAcbJAjXV589rDCJljmmaJtxV3HT/OQmqn/Lvk9x61BImCEDzUiE9JAye789nAAc76WPhjYxeGR2C3zUoxYH6XOB0VPJzcwpc1IgTLm+BAQfJVf38J+wWvP+l+jDH8XYx60ukHW88P+Nq+W0h1nSjBdzHCTOVg/MJwVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; arc=none smtp.client-ip=211.20.114.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 18 Nov
 2025 17:11:54 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 18 Nov 2025 17:11:54 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
Subject: [PATCH v2 0/2] Add "aspeed,ast2700-pwm-tach" compatible string
Date: Tue, 18 Nov 2025 17:11:52 +0800
Message-ID: <20251118-upstream_pwm_tach-v2-0-4d9bc13d34f9@aspeedtech.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFg4HGkC/02MSw6DIBQAr2LeuhggWrQr79E0BvFZXiJCgP5iv
 HtJV11NZjGzQ8JImOBS7RDxSYn8VkSeKjBWb3dkNBcHyWUrhOjYI6QcUbsxvNyYtbGsVcukleo
 Ndg2ULkRc6P17Xm/Fl+gdy7ZEfyfe8LZA1vKset4pJthE6/oZc9I06BQQ54zG1sY7OI4v6PorT
 qgAAAA=
X-Change-ID: 20251118-upstream_pwm_tach-57fba779ce84
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
	Billy Tsai <billy_tsai@aspeedtech.com>
CC: <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, <BMC-SW@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763457114; l=987;
 i=billy_tsai@aspeedtech.com; s=20251118; h=from:subject:message-id;
 bh=eInYEJN6YIiUk3jMYad5Xh4rxav6UXQDFOgidbnXMpI=;
 b=unNyKr7Id/LId888XbVFwSETVvp0CHpyaGf11gFBnuhsLV/Q0QHUqz6GoeUsvEEO9sLUSUCAF
 54Y9pN4dJW1DmLI9d/DlWFji1uprzAypbZPxsUzRChf8DIkD2godHo2
X-Developer-Key: i=billy_tsai@aspeedtech.com; a=ed25519;
 pk=/A8qvgZ6CPfnwKgT6/+k+nvXOkN477MshEGJvVdzeeQ=

Adds the "aspeed,ast2700-pwm-tach" compatible string, which provides
fallback support for the previous version of the hardware design, to
the PWM/TACH dt-binding and driver.

---
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

 .../devicetree/bindings/hwmon/aspeed,g6-pwm-tach.yaml          | 10 +++++++---
 drivers/hwmon/aspeed-g6-pwm-tach.c                             |  3 +++
 2 files changed, 10 insertions(+), 3 deletions(-)
---
base-commit: e7c375b181600caf135cfd03eadbc45eb530f2cb
change-id: 20251118-upstream_pwm_tach-57fba779ce84

Best regards,
-- 
Billy Tsai <billy_tsai@aspeedtech.com>

