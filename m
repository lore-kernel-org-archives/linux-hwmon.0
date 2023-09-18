Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0430CD13DA
	for <linux-hwmon@archiver.kernel.org>; Mon, 18 Sep 2023 09:03:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241029AbjIRJA6 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 18 Sep 2023 05:00:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240893AbjIRJAQ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 18 Sep 2023 05:00:16 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DA70135
        for <linux-hwmon@vger.kernel.org>; Mon, 18 Sep 2023 02:00:03 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiA6r-0008UI-6u; Mon, 18 Sep 2023 11:00:01 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiA6q-007B6s-Bp; Mon, 18 Sep 2023 11:00:00 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiA6q-002Z9t-2k; Mon, 18 Sep 2023 11:00:00 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 19/24] hwmon: (via686a) Convert to platform remove callback returning void
Date:   Mon, 18 Sep 2023 10:59:46 +0200
Message-Id: <20230918085951.1234172-20-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230918085951.1234172-1-u.kleine-koenig@pengutronix.de>
References: <20230918085951.1234172-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1728; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=UbYkt5+nCLXQGedS8E+XLGCNJfqo10L1sWvUfNUcjeU=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlCBA/tIBd1TJTYbuSDx2EqVoG9yi6zYtl8M3i+ ITgyIhSaeiJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZQgQPwAKCRCPgPtYfRL+ TmnwCACvfeiokLBb1sT5/1Il/OAENpQCsyq1cuR18sj0q923kyJVmlRJXX3jahWAcJrXwoxzs7N 4L3j6pOZgOtU6BUDXkrIap2qWu0KDp5iOmm5KBS6fPBHWM+Gzyd5L/kzYt7IzDx5XNY/jliHifH V6NJCjWF1cnAqohF8RDtp0oyaJET/FEPn7dLfZLLgxxh0dt3DyLnhJDvYt8/6YRFOlz7/qf9par KEOspfy8RqexXT3HA9Kdp4wcE3UkUSxcHpZa9JuEWWD+3hMzzWgHPVufGnE16mV2fIZLQX3fmbV /rmES8BcKhJRNJWVNpubq0BywiVpwNfxQL4Vz/Tsh/imoQzr
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-hwmon@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

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
 drivers/hwmon/via686a.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/via686a.c b/drivers/hwmon/via686a.c
index 407933d6e425..3a002ad3c005 100644
--- a/drivers/hwmon/via686a.c
+++ b/drivers/hwmon/via686a.c
@@ -786,14 +786,12 @@ static int via686a_probe(struct platform_device *pdev)
 	return err;
 }
 
-static int via686a_remove(struct platform_device *pdev)
+static void via686a_remove(struct platform_device *pdev)
 {
 	struct via686a_data *data = platform_get_drvdata(pdev);
 
 	hwmon_device_unregister(data->hwmon_dev);
 	sysfs_remove_group(&pdev->dev.kobj, &via686a_group);
-
-	return 0;
 }
 
 static struct platform_driver via686a_driver = {
@@ -801,7 +799,7 @@ static struct platform_driver via686a_driver = {
 		.name	= DRIVER_NAME,
 	},
 	.probe		= via686a_probe,
-	.remove		= via686a_remove,
+	.remove_new	= via686a_remove,
 };
 
 static const struct pci_device_id via686a_pci_ids[] = {
-- 
2.40.1

