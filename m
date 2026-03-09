Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A02B0F9C0;
	Mon,  9 Mar 2026 02:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773023621; cv=none; b=pUvrlKlKbg/FIoNNVUeOMXqzOXERlmWgW2d5Y+Fh3SPNRN8lmup5fdPt4brocJ9ciMfrIoy7DMAFyl9S060F+HL4Y//DHJy8aX9mJTTfZhczrOrS3HysHQQjdFz2pwu3DYznHB6dCLaNm54MS4A4YLILss1yrDILy2tBbhG4PQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773023621; c=relaxed/simple;
	bh=ywRswqAB8D2YY+rXs//gmPTNZ8Sm18BNmrehwVM8z98=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=LR4RNnqIe/L2nB3G6/lio4She3KPouLY07ZGvgWs6xDrU8Q0KqEYSIrKzZgBAt+aNuC+mlu+HSJREk3wNxcdBLTLeUvBRnESnUENl4jExE6nS8DE/qmbIITtqfdgiZVw8aGl3Re4b2mT38QYokUt404j54tIvJHDCC6QyBcND5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; arc=none smtp.client-ip=211.20.114.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Mon, 9 Mar
 2026 10:33:32 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Mon, 9 Mar 2026 10:33:32 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
Date: Mon, 9 Mar 2026 10:33:24 +0800
Subject: [PATCH v2] hwmon: (aspeed-g6-pwm-tach): remove redundant driver
 remove callback
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260309-pwm_fixes-v2-1-ca9768e70470@aspeedtech.com>
X-B4-Tracking: v=1; b=H4sIAHMxrmkC/22MQQ7CIBQFr9L8tRiKFbAr72Eag/ARFi0EGtQ03
 F3s2uW8N5kNMiaPGcZug4TFZx+WBuzQgXZqeSLxpjEwyjg9UU7ia75b/8ZMxEUyZc6DtFRA82P
 C/Wj6bWrsfF5D+uzp0v/Wf5XSk56gRIPcPpQdxFXliGhW1O6owwxTrfUL8+YoPqcAAAA=
X-Change-ID: 20260306-pwm_fixes-7982ad548f07
To: Guenter Roeck <linux@roeck-us.net>, Joel Stanley <joel@jms.id.au>, "Andrew
 Jeffery" <andrew@codeconstruct.com.au>, Philipp Zabel
	<p.zabel@pengutronix.de>
CC: <linux-hwmon@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>, Billy Tsai
	<billy_tsai@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773023612; l=1632;
 i=billy_tsai@aspeedtech.com; s=20251118; h=from:subject:message-id;
 bh=ywRswqAB8D2YY+rXs//gmPTNZ8Sm18BNmrehwVM8z98=;
 b=AjSLGbGkPUi0r9yURsISZag5dOKqICck0v+Pkigi8eYhfINb7b4EQUNTQcuYvJHDMcHMJf0zU
 oIRm2AqrarzBw0452ZnJee0amYrENPrG33y23d/XHSVsFYsUIHvCPSh
X-Developer-Key: i=billy_tsai@aspeedtech.com; a=ed25519;
 pk=/A8qvgZ6CPfnwKgT6/+k+nvXOkN477MshEGJvVdzeeQ=

Drops the remove callback as it only asserts reset and the probe already
registers a devres action (devm_add_action_or_reset()) to call
aspeed_pwm_tach_reset_assert().

Fixes: 7e1449cd15d1 ("hwmon: (aspeed-g6-pwm-tacho): Support for ASPEED g6 PWM/Fan tach")
Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
Changes in v2:
- Drops the remove callback.
- Link to v1: https://lore.kernel.org/r/20260306-pwm_fixes-v1-1-e8ede6fbaf47@aspeedtech.com
---
 drivers/hwmon/aspeed-g6-pwm-tach.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/hwmon/aspeed-g6-pwm-tach.c b/drivers/hwmon/aspeed-g6-pwm-tach.c
index 44e1ecba205d..4f6e6d440dd4 100644
--- a/drivers/hwmon/aspeed-g6-pwm-tach.c
+++ b/drivers/hwmon/aspeed-g6-pwm-tach.c
@@ -517,13 +517,6 @@ static int aspeed_pwm_tach_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static void aspeed_pwm_tach_remove(struct platform_device *pdev)
-{
-	struct aspeed_pwm_tach_data *priv = platform_get_drvdata(pdev);
-
-	reset_control_assert(priv->reset);
-}
-
 static const struct of_device_id aspeed_pwm_tach_match[] = {
 	{
 		.compatible = "aspeed,ast2600-pwm-tach",
@@ -537,7 +530,6 @@ MODULE_DEVICE_TABLE(of, aspeed_pwm_tach_match);
 
 static struct platform_driver aspeed_pwm_tach_driver = {
 	.probe = aspeed_pwm_tach_probe,
-	.remove = aspeed_pwm_tach_remove,
 	.driver	= {
 		.name = "aspeed-g6-pwm-tach",
 		.of_match_table = aspeed_pwm_tach_match,

---
base-commit: af4e9ef3d78420feb8fe58cd9a1ab80c501b3c08
change-id: 20260306-pwm_fixes-7982ad548f07

Best regards,
-- 
Billy Tsai <billy_tsai@aspeedtech.com>

