Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D19A71DED7F
	for <linux-hwmon@vger.kernel.org>; Thu, 17 Oct 2024 15:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729180753; cv=none; b=N5N9Vt/6Ly+R2r+5a/Q5uPhkIyXpbjK+CM/HiGpN9w2RqsEeSwtq5uYFNELi6CBHSZIv821jUk1cGTma6S9kGC+OCon6VEEqKFqFPgo2aQraeEXG5su8hyJwx9FRobBfraosN7qVOA6qxEo9LXNytTWml47cNk95S23U/cEzQnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729180753; c=relaxed/simple;
	bh=6G5okbQXglLORTF3Z7zHfB3gBgV7LKfj/e8wLjJ0PK4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=HelRNCwkZjW9TZOg9fdk1fLM898l3nFeEuwkP02F2/ogvOWAZBwne/EUFNNP9WyyDahMTfm1e7ZeLxt9PdECwgkk9vCWJdHeTKy3zhWjUVIlt67hvqQ1Q0yuxZIs2Pye2jOyEzSth/c7tGi7KhShcSUDO+s2LScI+QEWnuEMGsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Pp2o1Il0; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Pp2o1Il0"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-431548bd1b4so10118815e9.3
        for <linux-hwmon@vger.kernel.org>; Thu, 17 Oct 2024 08:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1729180746; x=1729785546; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kXH9EZ3/b7Asz6qUKX6OA6oy5Hde9kFGDtqiA4eyh4Q=;
        b=Pp2o1Il02RjWu+i4A0/nHar7pcaTwt/J9Rh1zH0gm4whSu2zm2y4In1NEQHyaGR2W4
         B1d9Aor/IE3ottyyEkWq9srVYcjG+uacACuSpcOGUcmmSu0d5GdpQa9hwf6jpqZbeQMr
         YmTFbtWGOaXiTxqlxvfsOUxOF8Y+vAgRrzH/RXNNFDZwYvlDbAkDRpVqNEu5lLRaSMkG
         NaxKyrmmRHN7Ck+ZhjPk1JY41n2RX9dLlrkMueMYPOnUIZuDiFDJ/UD0XhIDx1mgX3kO
         q9ePmiaJq4mV6qiAwDpyJsoaiF7jbJNuFNu2NkjbYXv336QNg/Pt5kAm4jUPMSbTXgpT
         N8vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729180746; x=1729785546;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kXH9EZ3/b7Asz6qUKX6OA6oy5Hde9kFGDtqiA4eyh4Q=;
        b=wB26hvF7nALnjssl6R2Q+M8b85pMZ6jEWO3G6S25AAsrpNVLqVQLNdgxtQ1BQ8GwFi
         sbnGruDA165AlzkgQYqqx/Q7/mWoFoL4ZepkX0X7qgu0uK/2Dbprrs3PVpfYW9O4Cu0/
         NdvZXd/Sm6jMzSQJsj56h6SL07PgzrzCcBkzQlxqq+Fh5u/7gxqiOPJxAWeSupoVxmjY
         +yG6dAxT0SPsWzrQjUCcoh16Cy0/F4qvh33vLBKyuZ/NpIHnkkzp03RCZUhl2enMLxK6
         P4XcXJx/ZLYzp3QLIlXRIfAwuXTOiFZ1CZmZiXOprK3RRBlmnl7lBih5gxGgua25Wbrj
         MoHA==
X-Gm-Message-State: AOJu0Yx3fttT0fLIcKWQsfV5kDTmwLjwCw42whRpR+fZQlxPSAM+iRuI
	zX6zpgprBP+607cQP6+Wesm/ZRt+cOsUZYrQmViEdoYphD//J8kE2nswLg+Tzww=
X-Google-Smtp-Source: AGHT+IFQi8yjsML4WlV6rRi/sCoOXXwlQJoS+7qHKyn3WAhUn92glvk4yTdfo1Bjx6+RnUWRqC8YpA==
X-Received: by 2002:a05:600c:35ce:b0:431:50cb:2398 with SMTP id 5b1f17b1804b1-43150cb2511mr49456815e9.2.1729180745865;
        Thu, 17 Oct 2024 08:59:05 -0700 (PDT)
Received: from localhost (p200300f65f19e3002f38cf427133ca7b.dip0.t-ipconnect.de. [2003:f6:5f19:e300:2f38:cf42:7133:ca7b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43158c35b2dsm30050465e9.4.2024.10.17.08.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 08:59:05 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [PATCH] hwmon: Switch back to struct platform_driver::remove()
Date: Thu, 17 Oct 2024 17:59:01 +0200
Message-ID: <20241017155900.137357-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=13776; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=6G5okbQXglLORTF3Z7zHfB3gBgV7LKfj/e8wLjJ0PK4=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBnETRE+zmBKahYeF/RKkSymUF35+ApqHlZ6RyJX Q2E27qkLJyJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZxE0RAAKCRCPgPtYfRL+ TiI0B/9n3ZDo3ER//Lpz9KLvNqkkiqmwSJH7JVSicGSe1Kgnl9wg1LzrQ7+e6EBjpnAb5i9ZjgF 0s/sWJJgezI0tCSuW+56DRhJWsOhTNVU04Buy0MCGhCI/2TuADPA8yUk6TrfuxbsYRmIj/rbdcy 8/IzI/6TxBYzfW/ILQQ1JREdu3vdsh61d/YxsxBlylqPHkDZK7TY7owBK0OzGV0/UQs2XCCO3Sm VR8A5ly4YU+DB8b2ErchIlJs1sSUhJTrl07wlxKxVQjvsfEdfWJRlViL/A8S+ota5Kt3FOgr1kU qDSy/EEDXO6TqjLu/fMqJ+vVplWqzmfnOE/KraGiwbNTsct5
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
return void") .remove() is (again) the right callback to implement for
platform drivers.

Convert all platform drivers below drivers/hwmonto use .remove(), with
the eventual goal to drop struct platform_driver::remove_new(). As
.remove() and .remove_new() have the same prototypes, conversion is done
by just changing the structure member name in the driver initializer.

While touching these files, make indention of the struct initializer
consistent in several files.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
Hello,

given the simplicity of the individual changes I do this all in a single
patch. I you don't agree, please tell and I will happily split it.

It's based on yesterday's next. Feel free to drop changes that result in
a conflict when you come around to apply this. I'll care for the fallout
at a later time then. (Having said that, if you use b4 am -3 and git am
-3, there should be hardly any conflict.)

Note I didn't Cc: all the individual driver maintainers to not trigger
sending limits and spam filters.

Best regards
Uwe

 drivers/hwmon/abituguru.c          | 2 +-
 drivers/hwmon/abituguru3.c         | 4 ++--
 drivers/hwmon/aspeed-g6-pwm-tach.c | 2 +-
 drivers/hwmon/da9052-hwmon.c       | 2 +-
 drivers/hwmon/dme1737.c            | 2 +-
 drivers/hwmon/f71805f.c            | 2 +-
 drivers/hwmon/f71882fg.c           | 2 +-
 drivers/hwmon/i5k_amb.c            | 2 +-
 drivers/hwmon/max197.c             | 2 +-
 drivers/hwmon/mc13783-adc.c        | 2 +-
 drivers/hwmon/occ/p9_sbe.c         | 4 ++--
 drivers/hwmon/pc87360.c            | 2 +-
 drivers/hwmon/pc87427.c            | 2 +-
 drivers/hwmon/sch5636.c            | 2 +-
 drivers/hwmon/sht15.c              | 2 +-
 drivers/hwmon/sis5595.c            | 2 +-
 drivers/hwmon/smsc47m1.c           | 2 +-
 drivers/hwmon/ultra45_env.c        | 2 +-
 drivers/hwmon/via-cputemp.c        | 2 +-
 drivers/hwmon/via686a.c            | 2 +-
 drivers/hwmon/vt1211.c             | 2 +-
 drivers/hwmon/vt8231.c             | 4 ++--
 drivers/hwmon/w83627hf.c           | 2 +-
 drivers/hwmon/w83781d.c            | 2 +-
 drivers/hwmon/xgene-hwmon.c        | 2 +-
 25 files changed, 28 insertions(+), 28 deletions(-)

diff --git a/drivers/hwmon/abituguru.c b/drivers/hwmon/abituguru.c
index 93653ea05430..ba8c68ae4595 100644
--- a/drivers/hwmon/abituguru.c
+++ b/drivers/hwmon/abituguru.c
@@ -1531,7 +1531,7 @@ static struct platform_driver abituguru_driver = {
 		.pm	= pm_sleep_ptr(&abituguru_pm),
 	},
 	.probe		= abituguru_probe,
-	.remove_new	= abituguru_remove,
+	.remove		= abituguru_remove,
 };
 
 static int __init abituguru_detect(void)
diff --git a/drivers/hwmon/abituguru3.c b/drivers/hwmon/abituguru3.c
index 4501f0e49efb..b70330dc2198 100644
--- a/drivers/hwmon/abituguru3.c
+++ b/drivers/hwmon/abituguru3.c
@@ -1147,12 +1147,12 @@ static int abituguru3_resume(struct device *dev)
 static DEFINE_SIMPLE_DEV_PM_OPS(abituguru3_pm, abituguru3_suspend, abituguru3_resume);
 
 static struct platform_driver abituguru3_driver = {
-	.driver = {
+	.driver	= {
 		.name	= ABIT_UGURU3_NAME,
 		.pm	= pm_sleep_ptr(&abituguru3_pm),
 	},
 	.probe	= abituguru3_probe,
-	.remove_new = abituguru3_remove,
+	.remove	= abituguru3_remove,
 };
 
 static int __init abituguru3_dmi_detect(void)
diff --git a/drivers/hwmon/aspeed-g6-pwm-tach.c b/drivers/hwmon/aspeed-g6-pwm-tach.c
index 75eadda738ab..4174b129d1fc 100644
--- a/drivers/hwmon/aspeed-g6-pwm-tach.c
+++ b/drivers/hwmon/aspeed-g6-pwm-tach.c
@@ -534,7 +534,7 @@ MODULE_DEVICE_TABLE(of, aspeed_pwm_tach_match);
 
 static struct platform_driver aspeed_pwm_tach_driver = {
 	.probe = aspeed_pwm_tach_probe,
-	.remove_new = aspeed_pwm_tach_remove,
+	.remove = aspeed_pwm_tach_remove,
 	.driver	= {
 		.name = "aspeed-g6-pwm-tach",
 		.of_match_table = aspeed_pwm_tach_match,
diff --git a/drivers/hwmon/da9052-hwmon.c b/drivers/hwmon/da9052-hwmon.c
index 7fb0c57dfef5..588e96790850 100644
--- a/drivers/hwmon/da9052-hwmon.c
+++ b/drivers/hwmon/da9052-hwmon.c
@@ -473,7 +473,7 @@ static void da9052_hwmon_remove(struct platform_device *pdev)
 
 static struct platform_driver da9052_hwmon_driver = {
 	.probe = da9052_hwmon_probe,
-	.remove_new = da9052_hwmon_remove,
+	.remove = da9052_hwmon_remove,
 	.driver = {
 		.name = "da9052-hwmon",
 	},
diff --git a/drivers/hwmon/dme1737.c b/drivers/hwmon/dme1737.c
index 1a9b28dc91e6..3d4057309950 100644
--- a/drivers/hwmon/dme1737.c
+++ b/drivers/hwmon/dme1737.c
@@ -2721,7 +2721,7 @@ static struct platform_driver dme1737_isa_driver = {
 		.name = "dme1737",
 	},
 	.probe = dme1737_isa_probe,
-	.remove_new = dme1737_isa_remove,
+	.remove = dme1737_isa_remove,
 };
 
 /* ---------------------------------------------------------------------
diff --git a/drivers/hwmon/f71805f.c b/drivers/hwmon/f71805f.c
index 243c570dee4c..820f894d9ffd 100644
--- a/drivers/hwmon/f71805f.c
+++ b/drivers/hwmon/f71805f.c
@@ -1497,7 +1497,7 @@ static struct platform_driver f71805f_driver = {
 		.name	= DRVNAME,
 	},
 	.probe		= f71805f_probe,
-	.remove_new	= f71805f_remove,
+	.remove		= f71805f_remove,
 };
 
 static int __init f71805f_device_add(unsigned short address,
diff --git a/drivers/hwmon/f71882fg.c b/drivers/hwmon/f71882fg.c
index 7c941d320a18..df83f9866fbc 100644
--- a/drivers/hwmon/f71882fg.c
+++ b/drivers/hwmon/f71882fg.c
@@ -2658,7 +2658,7 @@ static struct platform_driver f71882fg_driver = {
 		.name	= DRVNAME,
 	},
 	.probe		= f71882fg_probe,
-	.remove_new	= f71882fg_remove,
+	.remove		= f71882fg_remove,
 };
 
 static int __init f71882fg_init(void)
diff --git a/drivers/hwmon/i5k_amb.c b/drivers/hwmon/i5k_amb.c
index 02f5d35dd319..b22e0423e324 100644
--- a/drivers/hwmon/i5k_amb.c
+++ b/drivers/hwmon/i5k_amb.c
@@ -568,7 +568,7 @@ static struct platform_driver i5k_amb_driver = {
 		.name = DRVNAME,
 	},
 	.probe = i5k_amb_probe,
-	.remove_new = i5k_amb_remove,
+	.remove = i5k_amb_remove,
 };
 
 static int __init i5k_amb_init(void)
diff --git a/drivers/hwmon/max197.c b/drivers/hwmon/max197.c
index bb30403f81ca..f0048ff37607 100644
--- a/drivers/hwmon/max197.c
+++ b/drivers/hwmon/max197.c
@@ -332,7 +332,7 @@ static struct platform_driver max197_driver = {
 		.name = "max197",
 	},
 	.probe = max197_probe,
-	.remove_new = max197_remove,
+	.remove = max197_remove,
 	.id_table = max197_device_ids,
 };
 module_platform_driver(max197_driver);
diff --git a/drivers/hwmon/mc13783-adc.c b/drivers/hwmon/mc13783-adc.c
index 67471c9cd4d4..66304d48d33a 100644
--- a/drivers/hwmon/mc13783-adc.c
+++ b/drivers/hwmon/mc13783-adc.c
@@ -315,7 +315,7 @@ static const struct platform_device_id mc13783_adc_idtable[] = {
 MODULE_DEVICE_TABLE(platform, mc13783_adc_idtable);
 
 static struct platform_driver mc13783_adc_driver = {
-	.remove_new	= mc13783_adc_remove,
+	.remove		= mc13783_adc_remove,
 	.driver		= {
 		.name	= DRIVER_NAME,
 	},
diff --git a/drivers/hwmon/occ/p9_sbe.c b/drivers/hwmon/occ/p9_sbe.c
index b5993c79c09e..89761a9c8892 100644
--- a/drivers/hwmon/occ/p9_sbe.c
+++ b/drivers/hwmon/occ/p9_sbe.c
@@ -192,8 +192,8 @@ static struct platform_driver p9_sbe_occ_driver = {
 		.name = "occ-hwmon",
 		.of_match_table = p9_sbe_occ_of_match,
 	},
-	.probe	= p9_sbe_occ_probe,
-	.remove_new = p9_sbe_occ_remove,
+	.probe = p9_sbe_occ_probe,
+	.remove = p9_sbe_occ_remove,
 };
 
 module_platform_driver(p9_sbe_occ_driver);
diff --git a/drivers/hwmon/pc87360.c b/drivers/hwmon/pc87360.c
index 788b5d58f77e..0f8aa6b42164 100644
--- a/drivers/hwmon/pc87360.c
+++ b/drivers/hwmon/pc87360.c
@@ -1606,7 +1606,7 @@ static struct platform_driver pc87360_driver = {
 		.name	= DRIVER_NAME,
 	},
 	.probe		= pc87360_probe,
-	.remove_new	= pc87360_remove,
+	.remove		= pc87360_remove,
 };
 
 /*
diff --git a/drivers/hwmon/pc87427.c b/drivers/hwmon/pc87427.c
index 7bca04eb4ee4..571402a89368 100644
--- a/drivers/hwmon/pc87427.c
+++ b/drivers/hwmon/pc87427.c
@@ -1129,7 +1129,7 @@ static struct platform_driver pc87427_driver = {
 		.name	= DRVNAME,
 	},
 	.probe		= pc87427_probe,
-	.remove_new	= pc87427_remove,
+	.remove		= pc87427_remove,
 };
 
 static int __init pc87427_device_add(const struct pc87427_sio_data *sio_data)
diff --git a/drivers/hwmon/sch5636.c b/drivers/hwmon/sch5636.c
index a4b05ebb0546..d00bd5cc6b15 100644
--- a/drivers/hwmon/sch5636.c
+++ b/drivers/hwmon/sch5636.c
@@ -512,7 +512,7 @@ static struct platform_driver sch5636_driver = {
 		.name	= DRVNAME,
 	},
 	.probe		= sch5636_probe,
-	.remove_new	= sch5636_remove,
+	.remove		= sch5636_remove,
 	.id_table	= sch5636_device_id,
 };
 
diff --git a/drivers/hwmon/sht15.c b/drivers/hwmon/sht15.c
index 494f9655f44f..3d55047e9baf 100644
--- a/drivers/hwmon/sht15.c
+++ b/drivers/hwmon/sht15.c
@@ -1051,7 +1051,7 @@ static struct platform_driver sht15_driver = {
 		.of_match_table = of_match_ptr(sht15_dt_match),
 	},
 	.probe = sht15_probe,
-	.remove_new = sht15_remove,
+	.remove = sht15_remove,
 	.id_table = sht15_device_ids,
 };
 module_platform_driver(sht15_driver);
diff --git a/drivers/hwmon/sis5595.c b/drivers/hwmon/sis5595.c
index e73b1522f3ce..b7a7bcd6d3af 100644
--- a/drivers/hwmon/sis5595.c
+++ b/drivers/hwmon/sis5595.c
@@ -784,7 +784,7 @@ static struct platform_driver sis5595_driver = {
 		.name	= DRIVER_NAME,
 	},
 	.probe		= sis5595_probe,
-	.remove_new	= sis5595_remove,
+	.remove		= sis5595_remove,
 };
 
 static int sis5595_pci_probe(struct pci_dev *dev,
diff --git a/drivers/hwmon/smsc47m1.c b/drivers/hwmon/smsc47m1.c
index 0d46edbcb144..595bceb78d76 100644
--- a/drivers/hwmon/smsc47m1.c
+++ b/drivers/hwmon/smsc47m1.c
@@ -858,7 +858,7 @@ static struct platform_driver smsc47m1_driver __refdata = {
 	.driver = {
 		.name	= DRVNAME,
 	},
-	.remove_new	= __exit_p(smsc47m1_remove),
+	.remove		= __exit_p(smsc47m1_remove),
 };
 
 static int __init smsc47m1_device_add(unsigned short address,
diff --git a/drivers/hwmon/ultra45_env.c b/drivers/hwmon/ultra45_env.c
index 2765d5f1b7f0..e4f1bb538628 100644
--- a/drivers/hwmon/ultra45_env.c
+++ b/drivers/hwmon/ultra45_env.c
@@ -317,7 +317,7 @@ static struct platform_driver env_driver = {
 		.of_match_table = env_match,
 	},
 	.probe		= env_probe,
-	.remove_new	= env_remove,
+	.remove		= env_remove,
 };
 
 module_platform_driver(env_driver);
diff --git a/drivers/hwmon/via-cputemp.c b/drivers/hwmon/via-cputemp.c
index 5abe95b683c0..823bff2871e1 100644
--- a/drivers/hwmon/via-cputemp.c
+++ b/drivers/hwmon/via-cputemp.c
@@ -197,7 +197,7 @@ static struct platform_driver via_cputemp_driver = {
 		.name = DRVNAME,
 	},
 	.probe = via_cputemp_probe,
-	.remove_new = via_cputemp_remove,
+	.remove = via_cputemp_remove,
 };
 
 struct pdev_entry {
diff --git a/drivers/hwmon/via686a.c b/drivers/hwmon/via686a.c
index 3a002ad3c005..bbaeb808cc15 100644
--- a/drivers/hwmon/via686a.c
+++ b/drivers/hwmon/via686a.c
@@ -799,7 +799,7 @@ static struct platform_driver via686a_driver = {
 		.name	= DRIVER_NAME,
 	},
 	.probe		= via686a_probe,
-	.remove_new	= via686a_remove,
+	.remove		= via686a_remove,
 };
 
 static const struct pci_device_id via686a_pci_ids[] = {
diff --git a/drivers/hwmon/vt1211.c b/drivers/hwmon/vt1211.c
index 2f3890463e18..386edea6b69e 100644
--- a/drivers/hwmon/vt1211.c
+++ b/drivers/hwmon/vt1211.c
@@ -1221,7 +1221,7 @@ static struct platform_driver vt1211_driver = {
 		.name  = DRVNAME,
 	},
 	.probe  = vt1211_probe,
-	.remove_new = vt1211_remove,
+	.remove = vt1211_remove,
 };
 
 static int __init vt1211_device_add(unsigned short address)
diff --git a/drivers/hwmon/vt8231.c b/drivers/hwmon/vt8231.c
index dcdd14ccd115..3bf27c21845b 100644
--- a/drivers/hwmon/vt8231.c
+++ b/drivers/hwmon/vt8231.c
@@ -910,11 +910,11 @@ static void vt8231_remove(struct platform_device *pdev)
 
 
 static struct platform_driver vt8231_driver = {
-	.driver = {
+	.driver	= {
 		.name	= DRIVER_NAME,
 	},
 	.probe	= vt8231_probe,
-	.remove_new = vt8231_remove,
+	.remove	= vt8231_remove,
 };
 
 static const struct pci_device_id vt8231_pci_ids[] = {
diff --git a/drivers/hwmon/w83627hf.c b/drivers/hwmon/w83627hf.c
index 2fc9b718e2ab..95115d7b863e 100644
--- a/drivers/hwmon/w83627hf.c
+++ b/drivers/hwmon/w83627hf.c
@@ -1844,7 +1844,7 @@ static struct platform_driver w83627hf_driver = {
 		.pm	= W83627HF_DEV_PM_OPS,
 	},
 	.probe		= w83627hf_probe,
-	.remove_new	= w83627hf_remove,
+	.remove		= w83627hf_remove,
 };
 
 static int __init w83627hf_find(int sioaddr, unsigned short *addr,
diff --git a/drivers/hwmon/w83781d.c b/drivers/hwmon/w83781d.c
index b7957c84d235..076200ed2ec9 100644
--- a/drivers/hwmon/w83781d.c
+++ b/drivers/hwmon/w83781d.c
@@ -1828,7 +1828,7 @@ static struct platform_driver w83781d_isa_driver = {
 		.name = "w83781d",
 	},
 	.probe = w83781d_isa_probe,
-	.remove_new = w83781d_isa_remove,
+	.remove = w83781d_isa_remove,
 };
 
 /* return 1 if a supported chip is found, 0 otherwise */
diff --git a/drivers/hwmon/xgene-hwmon.c b/drivers/hwmon/xgene-hwmon.c
index 5e0759a70f6d..1e3bd129a922 100644
--- a/drivers/hwmon/xgene-hwmon.c
+++ b/drivers/hwmon/xgene-hwmon.c
@@ -772,7 +772,7 @@ MODULE_DEVICE_TABLE(of, xgene_hwmon_of_match);
 
 static struct platform_driver xgene_hwmon_driver = {
 	.probe = xgene_hwmon_probe,
-	.remove_new = xgene_hwmon_remove,
+	.remove = xgene_hwmon_remove,
 	.driver = {
 		.name = "xgene-slimpro-hwmon",
 		.of_match_table = xgene_hwmon_of_match,

base-commit: 15e7d45e786a62a211dd0098fee7c57f84f8c681
-- 
2.45.2

