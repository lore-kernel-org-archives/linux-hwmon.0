Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F7820C461;
	Fri,  6 Mar 2026 06:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772779493; cv=none; b=uKINz6BteseGj0g4HjppHdBGz12kJftdAhAfI8gpzr+bXYrw8GFvmkLLP982YLOEnPBCZ4tj8T6drEdL1Pg1rzOW1+VcuKC4vOpTN/NYQs4fOQDGz/Nnc/VoZKzMF5I3zTYA1O+BQqeq3Xmm7IKVgEEuPbkSiCfF9dO6A8lypXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772779493; c=relaxed/simple;
	bh=Hp31w4Jdd8sbOX4FBY/G7j05d+Zg3ydoO83w3jExP4Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=Y9WAI7aYLTvIkhbKNPHu1DTAxPuRKZzr7HzvSguuWE+DWJvMphT9rCJ3lch2txsHfZWhCSvKFOcPH/fRNBoan2/6k+fmkyjUvy6c9P+hBsjAZ82rwNkrvxwF5dP1ACW9bV7JvTIfNCJM89z2D3d0JekRctxcSTCsaPKlavaaXN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; arc=none smtp.client-ip=211.20.114.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 6 Mar
 2026 14:44:43 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 6 Mar 2026 14:44:43 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
Date: Fri, 6 Mar 2026 14:44:31 +0800
Subject: [PATCH] hwmon: (aspeed-g6-pwm-tach): fix driver data handling in
 probe/remove
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260306-pwm_fixes-v1-1-e8ede6fbaf47@aspeedtech.com>
X-B4-Tracking: v=1; b=H4sIAM53qmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDYwMz3YLy3Pi0zIrUYl1zSwujxBRTE4s0A3MloPqColSwBFB5dGxtLQA
 7d/zWWwAAAA==
X-Change-ID: 20260306-pwm_fixes-7982ad548f07
To: Guenter Roeck <linux@roeck-us.net>, Joel Stanley <joel@jms.id.au>, "Andrew
 Jeffery" <andrew@codeconstruct.com.au>
CC: <linux-hwmon@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>, Billy Tsai
	<billy_tsai@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772779483; l=1393;
 i=billy_tsai@aspeedtech.com; s=20251118; h=from:subject:message-id;
 bh=Hp31w4Jdd8sbOX4FBY/G7j05d+Zg3ydoO83w3jExP4Y=;
 b=09OrdeecveOCl4q7/xzNvFn8RPwEs0VhaZWGUH3DjxtVv/MYLVRvpS5M+R/B7fmZ9Wu/kcLtQ
 7t0gVAB7TCBBGFnoYzwXx3sDDYB8WQH3a8GZW4Y54TPRZDxzAppIi5m
X-Developer-Key: i=billy_tsai@aspeedtech.com; a=ed25519;
 pk=/A8qvgZ6CPfnwKgT6/+k+nvXOkN477MshEGJvVdzeeQ=

Ensure proper association of driver data by setting and retrieving
the platform device's driver data during probe and remove.

Fixes: 7e1449cd15d1 ("hwmon: (aspeed-g6-pwm-tacho): Support for ASPEED g6 PWM/Fan tach")
Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
 drivers/hwmon/aspeed-g6-pwm-tach.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/aspeed-g6-pwm-tach.c b/drivers/hwmon/aspeed-g6-pwm-tach.c
index 44e1ecba205d..0c03d272279a 100644
--- a/drivers/hwmon/aspeed-g6-pwm-tach.c
+++ b/drivers/hwmon/aspeed-g6-pwm-tach.c
@@ -490,6 +490,7 @@ static int aspeed_pwm_tach_probe(struct platform_device *pdev)
 	if (IS_ERR(chip))
 		return PTR_ERR(chip);
 
+	platform_set_drvdata(pdev, chip);
 	pwmchip_set_drvdata(chip, priv);
 	chip->ops = &aspeed_pwm_ops;
 
@@ -519,7 +520,8 @@ static int aspeed_pwm_tach_probe(struct platform_device *pdev)
 
 static void aspeed_pwm_tach_remove(struct platform_device *pdev)
 {
-	struct aspeed_pwm_tach_data *priv = platform_get_drvdata(pdev);
+	struct pwm_chip *chip = platform_get_drvdata(pdev);
+	struct aspeed_pwm_tach_data *priv = aspeed_pwm_chip_to_data(chip);
 
 	reset_control_assert(priv->reset);
 }

---
base-commit: af4e9ef3d78420feb8fe58cd9a1ab80c501b3c08
change-id: 20260306-pwm_fixes-7982ad548f07

Best regards,
-- 
Billy Tsai <billy_tsai@aspeedtech.com>

