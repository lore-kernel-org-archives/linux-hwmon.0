Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AAD8374E64
	for <linux-hwmon@vger.kernel.org>; Fri, 16 Oct 2026 03:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792120074; cv=none; b=kbmSeKjOE3P03cDAKqfl0j2czkGkf6jfe0w2tPq62vA3y9S1I4q8ES2zRnsX6TQIQjV97Y0dj8PET6sVArvODcOHtaFBDNnaWvLPZgdfQEO8J6TK7+BNguKF2bfZYiZaRh4prbeV5BscjlSiAtKnFEFhfxY3iK4R0Lp1IFDpl68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792120074; c=relaxed/simple;
	bh=TVzdjqsY0vYeIS7HHhx+RFa6m9nNumgd6ofEvkUhlDI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FS2bsBHPLjvldXcVF5LhaVlKVgHJYtDcaWKpiEac7a+hEP1oDZOYunDozsDMsabN3bHAHzXcx+OS7wAV9VKVMpygUs8k4Mvqpw3GiiZjck/O+nZPrcIIvwsYUX2YMQGZ0q5mKqmJE8CMTdUW/qsnBP1S8MsnoOkVssbSMYXl7WY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H/jjt2gm; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H/jjt2gm"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-533797e72e8so13497391cf.2
        for <linux-hwmon@vger.kernel.org>; Thu, 15 Oct 2026 20:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792120072; x=1792724872; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Si+t2hYlvfYPsnMUPj99el8itGnuSc/9LUEQeaAR/Ks=;
        b=H/jjt2gmNb0HQITb6aV6mm0nBWpYV+GEZ7+OFFodieaARjzg+4JeFWDxSR6MQgtTFY
         UAN63Fs/E8kSenHl1CXn4S36bZS4PwjoB/shwjOqLuvM4ozRucrYM3LjF6SMzWh1iAgF
         UP1zwCOEJM4JOaMVIPFA/jUClv6U0QMc4+k8+XW2h5LWaOUZB8lGATobujTB6LNiQ0DQ
         cWSYQpQeioKemiNLK1BNfDmfws87zDlmOIRHHseeIjuarJCCP6iWKQ2/TXgGvDizIATf
         hhAYx3uk0hGRAheB7ujC7mBWiOOkzzvs0lQvUc9H3OCtLwqQ0ZhrK6iEcrwTbeAEjCrt
         +TNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792120072; x=1792724872;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Si+t2hYlvfYPsnMUPj99el8itGnuSc/9LUEQeaAR/Ks=;
        b=LJsFSFB6YqZ1vUDyhxGZIGcXdigxhORL3zDLty6dwwUPqpqdbvEAtClriCh066dHLw
         HsAWPBbD9OIObicz73SBPvn09WvbqYoWtdMWnEMBPAPwRdrKioDemZEnYeTdK+eeqOEd
         azmrExTFQjTqtAqDyaWXtjL8QDP3gr/nR7lbjm+6XI/GIN4JxfEObIUnJMOSRbV90Rqs
         aNSC+ZCCMR65QIFvcO0W1zzMO+dON+ONTOthH4vq5NCDYVElI62HBT9yeCoQKlCLLKUm
         G8+rGV1FLMD/55/YyGDm/9olvNqSVd51dErdMIYFxHzrbWh5GJLCCHiOXHip7h76lg12
         0mQA==
X-Gm-Message-State: AFq9FYKd14gqXrvuna0FNarGEHZNHPlZwu7oTyUqeJj8/Z2EHgrdjZL7
	ThgTddVpKErLWOkyq7WjklE++ocblciLZXgrSl31hGK1AmCrE2W7eNY=
X-Gm-Gg: AYBFou2ZUNS/T0siC6SGWh229vVT3rVzKtslwpTNk1aDsJD0i0nBt/yoHRwtJkSCClE
	CGaVAl3mDVQZCiomWQ5W5YJGHVcXY4STfyc4EGKanrYOxfP88YQfmZ9YGrlXGTwQgLldVLlvqeA
	Yii9Mo0qpIewOJYMbdTM8XJX8S1GWV3T9B7wVpnjfg40L+41gMVXqXntBJhWgEsMbo5Dhwm9eT8
	D5k66c27LfSwX79S9scKy74degV4fFslj+Q7TJV+VFo9VGFRXybFYOaHz4Yx61ZEE+rfi7OvSNs
	/V38Ne9kUD3fOxT5UeFnn1wp+ebuo92ZasYvzPab4/bf7t9BcoHLb8h7VbEikOwN5Hqc7dgFEEy
	AwCVGhOutzDhkgjEUrWXdUiosU9hOzOe8yueElUKtUyVRC8v837q0NnrG4GZxdB9nZVFnFkeID1
	R2XdjjGx1Ldqdc0DsMO7krprqNpkUjDe35wbSjkeg5GqKsDryipPZoDXMovGGRzsEibG1G+hwrW
	5N9OUs2DLE/o3zPCTy+/7bn3CH/JWC6wVadoilj6NZ8UMuS4jFmLFBg3z1LzjB0K87oy6ZI+n6v
	qP+ddCXvb0j41K3r9B06dDOrWsPcDI4JweNaGwM=
X-Received: by 2002:a05:622a:2445:b0:535:6a51:1f71 with SMTP id d75a77b69052e-5359fb86868mr339236021cf.54.1792120072257;
        Thu, 15 Oct 2026 20:07:52 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91bcbb1af26sm11435556d6.33.2026.10.15.20.07.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 20:07:51 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Myeonghun Pak <mhun512@gmail.com>,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] hwmon: (sht15) Stop deferred work before releasing its resources
Date: Thu, 15 Oct 2026 23:07:49 -0400
Message-ID: <20261016030749.3689266-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A measurement can return while read_work still accesses GPIOs or
re-enables the IRQ. Regulator notifications can likewise leave
update_supply_work using the regulator after it is released.

On removal and the applicable probe error paths, disable and drain
read_work before freeing the IRQ. Unregister the regulator notifier
before canceling update_supply_work.

This issue was identified as part of our ongoing research while
reviewing kernel code.

Fixes: 251eb40f5ccd ("hwmon: sht15 humidity sensor driver")
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Compile-tested with GCC, W=1 (x86_64). No runtime testing.

 drivers/hwmon/sht15.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/sht15.c b/drivers/hwmon/sht15.c
index 7bb2105..6c5b2a1 100644
--- a/drivers/hwmon/sht15.c
+++ b/drivers/hwmon/sht15.c
@@ -31,6 +31,7 @@
 #include <linux/bitrev.h>
 #include <linux/gpio/consumer.h>
 #include <linux/of.h>
+#include <linux/workqueue.h>
 
 /* Commands */
 #define SHT15_MEASURE_TEMP		0x03
@@ -986,15 +987,15 @@ static int sht15_probe(struct platform_device *pdev)
 	disable_irq_nosync(gpiod_to_irq(data->data));
 	ret = sht15_connection_reset(data);
 	if (ret)
-		goto err_release_reg;
+		goto err_release_irq;
 	ret = sht15_soft_reset(data);
 	if (ret)
-		goto err_release_reg;
+		goto err_release_irq;
 
 	ret = sysfs_create_group(&pdev->dev.kobj, &sht15_attr_group);
 	if (ret) {
 		dev_err(&pdev->dev, "sysfs create failed\n");
-		goto err_release_reg;
+		goto err_release_irq;
 	}
 
 	data->hwmon_dev = hwmon_device_register(data->dev);
@@ -1007,9 +1008,13 @@ static int sht15_probe(struct platform_device *pdev)
 
 err_release_sysfs_group:
 	sysfs_remove_group(&pdev->dev.kobj, &sht15_attr_group);
+err_release_irq:
+	disable_work_sync(&data->read_work);
+	devm_free_irq(&pdev->dev, gpiod_to_irq(data->data), data);
 err_release_reg:
 	if (!IS_ERR(data->reg)) {
 		regulator_unregister_notifier(data->reg, &data->nb);
+		cancel_work_sync(&data->update_supply_work);
 		regulator_disable(data->reg);
 	}
 	return ret;
@@ -1023,12 +1028,17 @@ static void sht15_remove(struct platform_device *pdev)
 	hwmon_device_unregister(data->hwmon_dev);
 	sysfs_remove_group(&pdev->dev.kobj, &sht15_attr_group);
 
+	/* The read work can re-enable the IRQ, so stop it before freeing IRQ. */
+	disable_work_sync(&data->read_work);
+	devm_free_irq(&pdev->dev, gpiod_to_irq(data->data), data);
+
 	ret = sht15_soft_reset(data);
 	if (ret)
 		dev_err(&pdev->dev, "Failed to reset device (%pe)\n", ERR_PTR(ret));
 
 	if (!IS_ERR(data->reg)) {
 		regulator_unregister_notifier(data->reg, &data->nb);
+		cancel_work_sync(&data->update_supply_work);
 		regulator_disable(data->reg);
 	}
 }
