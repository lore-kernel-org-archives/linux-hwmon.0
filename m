Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E7F1EA90
	for <linux-hwmon@vger.kernel.org>; Tue,  9 Apr 2024 08:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712652989; cv=none; b=cInxoI5WIebFAO3VTMLHPftTFeOkMXxDPhp61xYqTLbBXhQEewFI/h64eVAFI7X1TEoK066ShjXdRUqIewiyYod5Wvucz/9/jeTM2ls1oWilIyrRZ2UwQ2Fm8xaVn7f5KEdlIblUqe8AG/xEfSBy43B0StuafhkusIfBDpuTxHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712652989; c=relaxed/simple;
	bh=aHzCEVenPD6LDlpB4fQUhAUL68h+LfvzUA8jXran0Ng=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=pSoVC7JR2BQciyXqLGa7tsmfVyz+yZGodbFtp/OOz7p6RK5/bcsnqN1XlVAcRgt810+wXjAcbUSDNfZzKAdo+lS+Lxye06qks1e0ow8YQHr4MTmBWzyOIznDZyykPvPVMHThuOiLqLDr83JSc7aVDzR8jBlUKhjaFdgO4mA0GEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1ru7H0-0008Kq-EC; Tue, 09 Apr 2024 10:56:10 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1ru7Gw-00BGxQ-Ah; Tue, 09 Apr 2024 10:56:06 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1ru7Gw-00Gq4L-0l;
	Tue, 09 Apr 2024 10:56:06 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	linux-hwmon@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org,
	kernel@pengutronix.de,
	Billy Tsai <billy_tsai@aspeedtech.com>
Subject: [PATCH] hwmon: (aspeed-g6-pwm-tach) Convert to platform remove callback returning void
Date: Tue,  9 Apr 2024 10:55:53 +0200
Message-ID: <20240409085552.19868-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2265; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=aHzCEVenPD6LDlpB4fQUhAUL68h+LfvzUA8jXran0Ng=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBmFQKZL2uQsG6ftU5XCongRswdbltwSL2K/H8TR O8eBTSbgYGJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZhUCmQAKCRCPgPtYfRL+ TtyNB/sEa9UAGiJ9lPOa5Gh9NXqQgSDOd7XFXQHoz+ByOCG5V5JvBnpUjW4/f9DwsRLMcHGrVEK vRACS86djo3hz0d6upH18Lds6VMGERxLGCikhj/49bEBvnzRE1+LCGPSqL+1lyqggsEcjAnbIlo VvnHaH7VqzU3V4zh4oFutW8scsTdnsr9lFUH5z6nROdbu7qgq3PObayu28sIe0fAX7V3QNv/3Io kM2IDgOSBI0QZt0jfKKkB0jgnOBTYQUdbQWXZmtjItFldXzq1Q85Y+ErvjngNJNl8No36tjw36Q UJZNJUNIFj0eMuOZpfMMPFbZsvNysxZNoO/yA26Kroj0e3aA
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-hwmon@vger.kernel.org

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is ignored (apart
from emitting a warning) and this typically results in resource leaks.
To improve here there is a quest to make the remove callback return
void. In the first step of this quest all drivers are converted to
.remove_new() which already returns void. Eventually after all drivers
are converted, .remove_new() is renamed to .remove().

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
Hello,

most of drivers/hwmon was already converted to struct
platform_driver::remove_new during the v6.7 development cycle. This
driver was added for v6.9-rc1 still using the old prototype.

There are still more drivers to be converted, so there is from my side
no need to get this into v6.9, but the next merge window would be nice.

Best regards
Uwe

 drivers/hwmon/aspeed-g6-pwm-tach.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/aspeed-g6-pwm-tach.c b/drivers/hwmon/aspeed-g6-pwm-tach.c
index 597b3b019d49..262d46fed3aa 100644
--- a/drivers/hwmon/aspeed-g6-pwm-tach.c
+++ b/drivers/hwmon/aspeed-g6-pwm-tach.c
@@ -516,13 +516,11 @@ static int aspeed_pwm_tach_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int aspeed_pwm_tach_remove(struct platform_device *pdev)
+static void aspeed_pwm_tach_remove(struct platform_device *pdev)
 {
 	struct aspeed_pwm_tach_data *priv = platform_get_drvdata(pdev);
 
 	reset_control_assert(priv->reset);
-
-	return 0;
 }
 
 static const struct of_device_id aspeed_pwm_tach_match[] = {
@@ -535,7 +533,7 @@ MODULE_DEVICE_TABLE(of, aspeed_pwm_tach_match);
 
 static struct platform_driver aspeed_pwm_tach_driver = {
 	.probe = aspeed_pwm_tach_probe,
-	.remove = aspeed_pwm_tach_remove,
+	.remove_new = aspeed_pwm_tach_remove,
 	.driver	= {
 		.name = "aspeed-g6-pwm-tach",
 		.of_match_table = aspeed_pwm_tach_match,

base-commit: 4cece764965020c22cff7665b18a012006359095
-- 
2.43.0

