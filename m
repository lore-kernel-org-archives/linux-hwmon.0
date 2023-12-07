Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20D9010FD
	for <linux-hwmon@vger.kernel.org>; Thu,  7 Dec 2023 06:09:44 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rBF4P-0001a0-Nc; Thu, 07 Dec 2023 15:09:41 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rBF4P-00ECj4-4y; Thu, 07 Dec 2023 15:09:41 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rBF4O-00FvTQ-SE; Thu, 07 Dec 2023 15:09:40 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	kernel@pengutronix.de
Subject: [PATCH 2/4] hwmon: (smsc47m1) Convert to platform remove callback returning void
Date: Thu,  7 Dec 2023 15:09:30 +0100
Message-ID:  <a732270539ef63094a32d0ff582f78e640caf3e4.1701957841.git.u.kleine-koenig@pengutronix.de>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1724; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=djNuGlZBa8KuhXd2nwqiTYqdNvlNsHrtELvh/lWrW2I=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlcdIa2wv9O1GGlupOEIuyQ2W0XJHlhu86XgRES 4OF8sovhaKJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZXHSGgAKCRCPgPtYfRL+ TqgRB/9KmTd6erOBDe2QNskPpIyCoh3aAir3MDcq7Jl7DLaxuKL5DuuLqu10Lj1sur2izz6BuXa DUuy9Rq5yN3ITYQss+G9FW2S+hnD+/4X8zH093L8DHWoT28ocEy0mMbir1s2IPYOKzqLy/K8K5u j+oQBmRcWMl5azGFXsicdIgOSG//TtcyjhSqdBWBZkUbW6wfA82bt+p4tXADoYd9gNnInjmPfu7 2hnsIZAou6L+qK2L0PeG2Fw6HrQNQEk3gExA3HMv76uI+3Agaxco3f56JdTDq3ITHs4ACbOtJ9L rtS/o+ammOYCLD4Vr7hFL7QkZISGoU3OaTf2d1Dkud7oGK1J
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
.remove_new(), which already returns void. Eventually after all drivers
are converted, .remove_new() will be renamed to .remove().

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/hwmon/smsc47m1.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/smsc47m1.c b/drivers/hwmon/smsc47m1.c
index 29ea8fb4f353..bda39a5a5d4c 100644
--- a/drivers/hwmon/smsc47m1.c
+++ b/drivers/hwmon/smsc47m1.c
@@ -840,14 +840,12 @@ static int __init smsc47m1_probe(struct platform_device *pdev)
 	return err;
 }
 
-static int __exit smsc47m1_remove(struct platform_device *pdev)
+static void __exit smsc47m1_remove(struct platform_device *pdev)
 {
 	struct smsc47m1_data *data = platform_get_drvdata(pdev);
 
 	hwmon_device_unregister(data->hwmon_dev);
 	smsc47m1_remove_files(&pdev->dev);
-
-	return 0;
 }
 
 /*
@@ -860,7 +858,7 @@ static struct platform_driver smsc47m1_driver __refdata = {
 	.driver = {
 		.name	= DRVNAME,
 	},
-	.remove		= __exit_p(smsc47m1_remove),
+	.remove_new	= __exit_p(smsc47m1_remove),
 };
 
 static int __init smsc47m1_device_add(unsigned short address,
-- 
2.42.0

