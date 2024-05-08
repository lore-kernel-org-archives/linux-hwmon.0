Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D121926291
	for <linux-hwmon@vger.kernel.org>; Wed,  8 May 2024 07:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715152862; cv=none; b=qbNckHS/ymo+lKUI5Kf+nPGC32LLuM4ZZ6Bpx6luXRmYTUEaKDp8B8g7+FDYMkxUfl7r3BN837RkWMlDCwFdid3xkq4CQeH5WF6+ftFnFKyidMF7MZdDa5DoAFPD6TYprTTEg/fXyD+lwyKIRC7HoV2O6YX5WqIbR/m9xgcyKmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715152862; c=relaxed/simple;
	bh=ysZI8IcnYTs+BaOEtrlWi/v/Y7X056ObLGvZYcRtLzw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=oIfqoWl+xR8xv5OzWg+8RCmOz/DY750SJcEJTEjUm6yca7znEmW7z8sGm97DxuiDBDM6xjCGNN8bFhpsty+Xu7v3oIjPxBThJsQSpr/L5PyuWh7x8RSdDIJ5VoWRisdkyTz7akoy86Hjs/F0FbcdjWD1LOAlsLavaTGSI6ajjyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1s4bbP-0001fR-G7; Wed, 08 May 2024 09:20:35 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1s4bbO-000EWb-6T; Wed, 08 May 2024 09:20:34 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1s4bbO-000JAo-0N;
	Wed, 08 May 2024 09:20:34 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Daniel Nilsson <daniel.nilsson@flex.com>
Cc: linux-hwmon@vger.kernel.org,
	kernel@pengutronix.de
Subject: [PATCH] hwmon: Drop explicit initialization of struct i2c_device_id::driver_data to 0 (part 2)
Date: Wed,  8 May 2024 09:20:26 +0200
Message-ID: <20240508072027.2119857-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2596; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=ysZI8IcnYTs+BaOEtrlWi/v/Y7X056ObLGvZYcRtLzw=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBmOye70llt5ZLeKzNGHm9gt9PJCGwTdDeWdfkbc IEksbgAvjyJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZjsnuwAKCRCPgPtYfRL+ TvLsB/wI1oJ6pQRjuBfIpYJHK23EJOengd7lP+w/qKXQZi0+hHAGNCBtZ8hRiOyWABqN9aWUt6h CnQ6GUkb/4wUoaYACeckYhxYvQYS/uCaM7Jt7bTXZk5hmQoXsewq4ohC7Ui060ZpHgtdlH2jry8 GaFSWZuiB1qbAkQJibn+XYPK92omNH5i4S3LViUDVY5u0KrvVnb3wZDdKR67wqDjgtv0Dpn0qTd 4cYMW27VoP+rne4CcrCJcfpgd2bduB/6GNV5B7cu4YOU7RuHYfMMMUnBEY4AC2TbfOTsYiX18/q s2kl48jy7kdrQJEV8tNC4Uieml86yjCsCo7J4Lywbwa/h0b2
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-hwmon@vger.kernel.org

These drivers don't use the driver_data member of struct i2c_device_id,
so don't explicitly initialize this member.

This prepares putting driver_data in an anonymous union which requires
either no initialization or named designators. But it's also a nice
cleanup on its own.

This is a follow up to commit d8a66f3621c2 ("hwmon: Drop explicit
initialization of struct i2c_device_id::driver_data to 0") which I
created before identifying a few corner cases in my conversion script.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
Hello,

feel free to squash this change into d8a66f3621c2 if you prefer.

Best regards
Uwe

 drivers/hwmon/lm87.c           | 2 +-
 drivers/hwmon/lm95241.c        | 2 +-
 drivers/hwmon/max6621.c        | 2 +-
 drivers/hwmon/pmbus/max15301.c | 4 ++--
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/lm87.c b/drivers/hwmon/lm87.c
index 03964127a12a..d2d970e73c61 100644
--- a/drivers/hwmon/lm87.c
+++ b/drivers/hwmon/lm87.c
@@ -976,7 +976,7 @@ static int lm87_probe(struct i2c_client *client)
 
 static const struct i2c_device_id lm87_id[] = {
 	{ "lm87" },
-	{ "adm1024", 0 },
+	{ "adm1024" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, lm87_id);
diff --git a/drivers/hwmon/lm95241.c b/drivers/hwmon/lm95241.c
index 4ad69a2de105..cad0a0ff8416 100644
--- a/drivers/hwmon/lm95241.c
+++ b/drivers/hwmon/lm95241.c
@@ -458,7 +458,7 @@ static int lm95241_probe(struct i2c_client *client)
 /* Driver data (common to all clients) */
 static const struct i2c_device_id lm95241_id[] = {
 	{ "lm95231" },
-	{ "lm95241", 0 },
+	{ "lm95241" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, lm95241_id);
diff --git a/drivers/hwmon/max6621.c b/drivers/hwmon/max6621.c
index 05426cde0e36..a7066f3a0bb4 100644
--- a/drivers/hwmon/max6621.c
+++ b/drivers/hwmon/max6621.c
@@ -537,7 +537,7 @@ static int max6621_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id max6621_id[] = {
-	{ MAX6621_DRV_NAME, 0 },
+	{ MAX6621_DRV_NAME },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, max6621_id);
diff --git a/drivers/hwmon/pmbus/max15301.c b/drivers/hwmon/pmbus/max15301.c
index c79cdf10bbec..986404fe6a31 100644
--- a/drivers/hwmon/pmbus/max15301.c
+++ b/drivers/hwmon/pmbus/max15301.c
@@ -23,8 +23,8 @@
 #include "pmbus.h"
 
 static const struct i2c_device_id max15301_id[] = {
-	{"bmr461"},
-	{"max15301", 0},
+	{ "bmr461" },
+	{ "max15301" },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, max15301_id);

base-commit: 93a39e4766083050ca0ecd6a3548093a3b9eb60c
-- 
2.43.0

