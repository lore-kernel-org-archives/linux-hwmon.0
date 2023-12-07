Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49E0010E9
	for <linux-hwmon@vger.kernel.org>; Thu,  7 Dec 2023 06:09:49 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rBF4P-0001a1-Nc; Thu, 07 Dec 2023 15:09:41 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rBF4P-00ECj7-Az; Thu, 07 Dec 2023 15:09:41 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rBF4P-00FvTU-1n; Thu, 07 Dec 2023 15:09:41 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	kernel@pengutronix.de
Subject: [PATCH 3/4] hwmon: (smsc47m1) Simplify device registration
Date: Thu,  7 Dec 2023 15:09:31 +0100
Message-ID:  <ab326fb9b1ad2191583b4cb3a8bd624dfedb908e.1701957841.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <cover.1701957840.git.u.kleine-koenig@pengutronix.de>
References: <cover.1701957840.git.u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2064; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=1UHithayHvrvd7Y8YvIbl2aB8yeC7z+o8wjKg1bl26I=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlcdIbmdgDTdzl6Qje5Ezo0bxdCv39v47In1/Je h8bbQAu3gOJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZXHSGwAKCRCPgPtYfRL+ TtAjCACNvrwdClOdLlDi1KF9X5d6XvERExUbjyIX6/UTOV0YzK1bR9+vIEkY0I3kN43AyTf3tsf 7mak/Esz5NNG1IFUc9qlrZQmsAQARv7BXHomsxHZ12Fy1xEedK7k/PwpDyvgQTsM92e1GYcIjZF AO0ejZ6C1UdmGQ/oEh1f03kFIqZlxsu2ziBVSAj7Jbb95Dy0mEXKowW0fglMvlOIJWRszZdvbNf PE9TuNFg8voXmeh502pLsSNBpg1qkF85k2VgCRtQ64H/E//eh6hQg7bkKmfi4cFSAWQ2iydGf1c Y73XlhvUeBxbc/V4IFm7iTo01KjsYhCe0d/VBG6rcau1TO5z
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-hwmon@vger.kernel.org

Use platform_device_register_full() instead of open coding this
function.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/hwmon/smsc47m1.c | 44 +++++++++++++---------------------------
 1 file changed, 14 insertions(+), 30 deletions(-)

diff --git a/drivers/hwmon/smsc47m1.c b/drivers/hwmon/smsc47m1.c
index bda39a5a5d4c..7e9c183b8e7f 100644
--- a/drivers/hwmon/smsc47m1.c
+++ b/drivers/hwmon/smsc47m1.c
@@ -864,50 +864,34 @@ static struct platform_driver smsc47m1_driver __refdata = {
 static int __init smsc47m1_device_add(unsigned short address,
 				      const struct smsc47m1_sio_data *sio_data)
 {
-	struct resource res = {
+	const struct resource res = {
 		.start	= address,
 		.end	= address + SMSC_EXTENT - 1,
 		.name	= DRVNAME,
 		.flags	= IORESOURCE_IO,
 	};
+	const struct platform_device_info pdevinfo = {
+		.name = DRVNAME,
+		.id = address,
+		.res = &res,
+		.num_res = 1,
+		.data = sio_data,
+		.size_data = sizeof(struct smsc47m1_sio_data),
+	};
 	int err;
 
 	err = smsc47m1_handle_resources(address, sio_data->type, CHECK, NULL);
 	if (err)
-		goto exit;
+		return err;
 
-	pdev = platform_device_alloc(DRVNAME, address);
-	if (!pdev) {
-		err = -ENOMEM;
+
+	pdev = platform_device_register_full(&pdevinfo);
+	if (IS_ERR(pdev)) {
 		pr_err("Device allocation failed\n");
-		goto exit;
-	}
-
-	err = platform_device_add_resources(pdev, &res, 1);
-	if (err) {
-		pr_err("Device resource addition failed (%d)\n", err);
-		goto exit_device_put;
-	}
-
-	err = platform_device_add_data(pdev, sio_data,
-				       sizeof(struct smsc47m1_sio_data));
-	if (err) {
-		pr_err("Platform data allocation failed\n");
-		goto exit_device_put;
-	}
-
-	err = platform_device_add(pdev);
-	if (err) {
-		pr_err("Device addition failed (%d)\n", err);
-		goto exit_device_put;
+		return PTR_ERR(pdev);
 	}
 
 	return 0;
-
-exit_device_put:
-	platform_device_put(pdev);
-exit:
-	return err;
 }
 
 static int __init sm_smsc47m1_init(void)
-- 
2.42.0

