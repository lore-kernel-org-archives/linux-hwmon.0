Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5E7510E4
	for <linux-hwmon@vger.kernel.org>; Thu,  7 Dec 2023 06:09:43 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rBF4P-0001aP-Vl; Thu, 07 Dec 2023 15:09:41 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rBF4P-00ECjA-IQ; Thu, 07 Dec 2023 15:09:41 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rBF4P-00FvTY-9P; Thu, 07 Dec 2023 15:09:41 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	kernel@pengutronix.de
Subject: [PATCH 4/4] hwmon: (smsc47m1) Rename global platform device variable
Date: Thu,  7 Dec 2023 15:09:32 +0100
Message-ID:  <68a959b56da7f9452557d08c72249182364b0dd0.1701957841.git.u.kleine-koenig@pengutronix.de>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2133; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=2hw4xctJ9dtpVr/uqyBD2QvFtjr8gWiF7+W40DtjipI=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlcdIcTtfcsci/kXRRVyrrCW05IWgrNZ+kuoKzh NzOwcPHHTGJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZXHSHAAKCRCPgPtYfRL+ TlwrB/0cVzsAGfE5PH80sdQRFIPy1rp977tbsANDDCtRppOc/rBlwuf/jn/0WC68wVdo2/nnXUI DnYsiu2RDtS7yjr8n6x/tNISOHlYvdsmxim4kpThfy1yUS4+PKiQOpfbz+GzfjiHIMgjLaMuPVp rfZZNi7c+w81pFO8Fwvc57StA4l/ERXcC/O6O46Wb/HUJGPN6Wb2x8ETf1d+HfahUesxPyP+j0M DiMHNh+FNBNeQ+aqjBAI6ov27IPLhrTsZdKJFy0Aov9wT/If/R23puuBl9Jvhiy0mvBez4AY6uW w3nz2JTBSncg4W75R1u71bJTMtnsIFoN2rHXYr8/KSzyMpEm
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-hwmon@vger.kernel.org

pdev is a bad name for a global variable. Still more as the driver has
functions where pdev is a local variable. Rename it to smsc47m1_pdev.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/hwmon/smsc47m1.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/hwmon/smsc47m1.c b/drivers/hwmon/smsc47m1.c
index 7e9c183b8e7f..ad52839e4f31 100644
--- a/drivers/hwmon/smsc47m1.c
+++ b/drivers/hwmon/smsc47m1.c
@@ -33,7 +33,7 @@ static unsigned short force_id;
 module_param(force_id, ushort, 0);
 MODULE_PARM_DESC(force_id, "Override the detected device ID");
 
-static struct platform_device *pdev;
+static struct platform_device *smsc47m1_pdev;
 
 #define DRVNAME "smsc47m1"
 enum chips { smsc47m1, smsc47m2 };
@@ -885,10 +885,10 @@ static int __init smsc47m1_device_add(unsigned short address,
 		return err;
 
 
-	pdev = platform_device_register_full(&pdevinfo);
-	if (IS_ERR(pdev)) {
+	smsc47m1_pdev = platform_device_register_full(&pdevinfo);
+	if (IS_ERR(smsc47m1_pdev)) {
 		pr_err("Device allocation failed\n");
-		return PTR_ERR(pdev);
+		return PTR_ERR(smsc47m1_pdev);
 	}
 
 	return 0;
@@ -905,7 +905,7 @@ static int __init sm_smsc47m1_init(void)
 		return err;
 	address = err;
 
-	/* Sets global pdev as a side effect */
+	/* Sets global smsc47m1_pdev as a side effect */
 	err = smsc47m1_device_add(address, &sio_data);
 	if (err)
 		return err;
@@ -917,7 +917,7 @@ static int __init sm_smsc47m1_init(void)
 	return 0;
 
 exit_device:
-	platform_device_unregister(pdev);
+	platform_device_unregister(smsc47m1_pdev);
 	smsc47m1_restore(&sio_data);
 	return err;
 }
@@ -925,8 +925,8 @@ static int __init sm_smsc47m1_init(void)
 static void __exit sm_smsc47m1_exit(void)
 {
 	platform_driver_unregister(&smsc47m1_driver);
-	smsc47m1_restore(dev_get_platdata(&pdev->dev));
-	platform_device_unregister(pdev);
+	smsc47m1_restore(dev_get_platdata(&smsc47m1_pdev->dev));
+	platform_device_unregister(smsc47m1_pdev);
 }
 
 MODULE_AUTHOR("Mark D. Studebaker <mdsxyz123@yahoo.com>");
-- 
2.42.0

