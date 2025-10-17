Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B1C331A4D
	for <linux-hwmon@vger.kernel.org>; Fri, 17 Oct 2025 13:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760706192; cv=none; b=JazVqyHOd/sQPifZnOv0bvQEE/cNHPVjzpJBfBxUvkBaAUrUwg1ihp2Me44FoGiT8G3+0rz7HHhnKFAAd35GDXmcmddpxW12dvLLRkW6fwX861uSEqhOocf67Tye1cADL7N/BxWL+o4OSVL7qFMLhDhgRUGQ28qHdkOAWIApv08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760706192; c=relaxed/simple;
	bh=n5kgOtYdXUgbFBvg45+Be+oWKzlkUbH9L6ecWCeGKWQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E2ybMqquyC3kxLTxSroP3ZwxZ1NQzBwdPnZ+cuZDCtq2SCVmaqc+MQnl2k1zXUU99BQ28NLWydMazXNLkejmCYDesF/3uqNzlLLzWSW19yx3Pxb4tdYIjJHplfqvq1iI7XHKUqysSWmiRty/91wfXwWHa6Pp8cz02cZVyAN6W4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gk5seXR2; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gk5seXR2"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-290ac2ef203so18079715ad.1
        for <linux-hwmon@vger.kernel.org>; Fri, 17 Oct 2025 06:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760706190; x=1761310990; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z4UWqhkM2Zwsg2d2qVI3yHgFYPaaMzFhz4INCASnGj0=;
        b=Gk5seXR25to/Qd/yQLL7APzVwiV0fFvtGaSrRG45WyQ3bKM3UArEbleN4ydn5OSV40
         EtFZe6FbyUoqEMU9HCkd2zynWYoml9QmY5rVBbyEhPgtgOHHGFqBrT3qjcNfzCTc7VlD
         klTEMwVtyzkc65fIH2cXSVMgXMBZTTbEqBi0m8HYIyS2LaQI8lw1OrpvocR01KwPYH8Y
         3g+O0Qpx2dCsNgsnsjuYqpYErXqIrVNqg4wz1ELRUw4lq7hMdJhi982N98VoLKfpH/px
         46MFTYir91d8/zpITdS54NEpGlxpmQrXOmSZ/ktokL1bSbqgxVXSSIxZBth0PIXsMNrm
         Tkyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760706190; x=1761310990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=z4UWqhkM2Zwsg2d2qVI3yHgFYPaaMzFhz4INCASnGj0=;
        b=cLubo5Lfb5E2oRPX3FBxL7mL3M8Lc93bUQtibN3YAjG6QwjvbNqqkikGrMED5aQwdu
         yVTHudw9ygFaGyVgh+DwfmYF4h3txLPsESfxIZcGtUHyJ8EwnV+Sb2mCXUbw/36XiOTb
         FKYbu/gCrAP2t2PyS8symJp7+qWijaOj53AAkFgSEK0RmPBq4Qux7SUuu5sca0jIDtjn
         BIDyUx0qYXw61ZRVs1M98Nkvt/ETKq/AHNh3QW147pn9s2309dlitwZnyWHlKaKbVFh0
         3onXzeyv1gU5wRyuGq6JisMlRaoTtnFRwRZSHRyH48XOO43GBlxeDuDforklb3tLNB36
         h+hg==
X-Gm-Message-State: AOJu0YxNoXwBxGZLVOLs9i2XR2BuwZoOzFZV07323VEq573qTasSJlxn
	ly6dBAbb4r0VdNVIoGMhq/6Ilg2EGIt9gQlO7GZTF5IE0d+BG9NkOBX6KzEdvA==
X-Gm-Gg: ASbGnctnR9vjnUPt/HLE9E8Y/xPs06rCTAel1GL/2QebFW+DDRYlF7jJpLL4MOoNC8U
	aj5BEoleYdbUvVx9KsqxikScOhTJsF5TmaCD91/6ImgSYCInjOjhur1Nsbc8PM5CAvdqPtKWMxu
	JG4eHTLzr99VTDlGhL7UYwG2iax+ttckaYIhzM+iT+3kiI1/Iorkc7vm96ggnjhdIuKWEykJNKm
	U8iklsHLg+iwtDRy/LLhxFMKPxnTMVRFkrNvIi4KtvsbdvN+X2WxEe26JGfnIj5zdxtUvunH2rs
	118SbbajZ1OATAcCiZpe3hFtKHlKa/SuXHCdg/qKYnpzDNElDcIsQ4SbVQ+gv5be3CCmSmfkqhE
	qxE5fNGUfKpCWyZqpzzFxTIrev6nghtv/e9fyCt6D/A6f0bqh8xVvvQo/Bho8BOZi9SuTexyf+H
	VIGW/c8jWYTPih
X-Google-Smtp-Source: AGHT+IEVQ83q5rlblxUQrV/gegz+rSpRu+Pn715/x9SzKUkdjrNVLBSsPW6g9nb6H/Y4O7UfT+o9ew==
X-Received: by 2002:a17:902:da84:b0:28e:681c:a7ed with SMTP id d9443c01a7336-290ca30e47cmr49880055ad.36.1760706189530;
        Fri, 17 Oct 2025 06:03:09 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2909930a92bsm64182075ad.10.2025.10.17.06.03.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 06:03:08 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 21/29] hwmon: (lochnagar-hwmon) Rely on subsystem locking
Date: Fri, 17 Oct 2025 06:02:13 -0700
Message-ID: <20251017130221.1823453-22-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251017130221.1823453-1-linux@roeck-us.net>
References: <20251017130221.1823453-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Attribute access is now serialized in the hardware monitoring core,
so locking in the driver code is no longer necessary. Drop it.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/lochnagar-hwmon.c | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)

diff --git a/drivers/hwmon/lochnagar-hwmon.c b/drivers/hwmon/lochnagar-hwmon.c
index 5202dddfd61e..c1ba72f6132e 100644
--- a/drivers/hwmon/lochnagar-hwmon.c
+++ b/drivers/hwmon/lochnagar-hwmon.c
@@ -10,7 +10,6 @@
 
 #include <linux/delay.h>
 #include <linux/hwmon.h>
-#include <linux/hwmon-sysfs.h>
 #include <linux/math64.h>
 #include <linux/mfd/lochnagar.h>
 #include <linux/mfd/lochnagar2_regs.h>
@@ -42,9 +41,6 @@ struct lochnagar_hwmon {
 	struct regmap *regmap;
 
 	long power_nsamples[ARRAY_SIZE(lochnagar_chan_names)];
-
-	/* Lock to ensure only a single sensor is read at a time */
-	struct mutex sensor_lock;
 };
 
 enum lochnagar_measure_mode {
@@ -178,26 +174,20 @@ static int read_sensor(struct device *dev, int chan,
 	u32 data;
 	int ret;
 
-	mutex_lock(&priv->sensor_lock);
-
 	ret = do_measurement(regmap, chan, mode, nsamples);
 	if (ret < 0) {
 		dev_err(dev, "Failed to perform measurement: %d\n", ret);
-		goto error;
+		return ret;
 	}
 
 	ret = request_data(regmap, chan, &data);
 	if (ret < 0) {
 		dev_err(dev, "Failed to read measurement: %d\n", ret);
-		goto error;
+		return ret;
 	}
 
 	*val = float_to_long(data, precision);
-
-error:
-	mutex_unlock(&priv->sensor_lock);
-
-	return ret;
+	return 0;
 }
 
 static int read_power(struct device *dev, int chan, long *val)
@@ -378,8 +368,6 @@ static int lochnagar_hwmon_probe(struct platform_device *pdev)
 	if (!priv)
 		return -ENOMEM;
 
-	mutex_init(&priv->sensor_lock);
-
 	priv->regmap = dev_get_regmap(dev->parent, NULL);
 	if (!priv->regmap) {
 		dev_err(dev, "No register map found\n");
-- 
2.45.2

