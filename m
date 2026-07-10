Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3376426D18
	for <linux-hwmon@vger.kernel.org>; Fri, 10 Jul 2026 12:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783686769; cv=none; b=grRMlzd6jxtqzFB4EkP6nz5qqaHto7SopkLYngefBwYrjsA+fYSDt3oejzVo4VCvkNmRxYElSdxScUhFBcyk2Efx1ScbQKkCyx1r+kDsdmeNlMVlQsifkl17DN7rS3Q8GZUBjvFVj4Us9389AidCW1tA1Msy/+xXhje8Oowcw7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783686769; c=relaxed/simple;
	bh=yn/OWPMkK8tR6APkGlapqLRo2TERIGRqc8UVfF9+/Cc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FYl66gzkT8irxOdJ8HWkRzvrcdB5taKS5wldHKn2aH9I1x2WLt1QMmyq7VCwwYxIlt9EqCjGCA2uvVDSZ37JHtaSD1FaN2pIm+C39iBNN6Oyuaf7bQKkRG5ty8gCJc30QHzxfvy6MJZ1vfw7Mv6vyKXd4ORz1BgKmENb/610z1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-84864b41100so657691b3a.3
        for <linux-hwmon@vger.kernel.org>; Fri, 10 Jul 2026 05:32:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783686765; x=1784291565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HIq1CvwVZbx9/5QAPVeHeQOM9JIh/J6rwMjIo/6qFcQ=;
        b=rXi8DJw0tgBPLw2GXkdZ4igPbYf0C+axEsLQ5S71K4hTGyjwZd0KH3rlGvy3V7b1sT
         Q35yDf1HocASeuQomwctoP51FLtyFKvSa/Qr9YhdvD7WLxFL2Y7dd/mDJZ17PUeHJPBc
         M5fEbwzzqn8XC0P2bOuYdiPh30NuLqOkr/CBASTZXv3HqYZ81B1ywpmogHbDVn4Qp0Lo
         XPVeE+EAfVocMGh8xJg9rf4LN3QXW1iUCr86w0RxoHEsI+0XAvE/5LKNF0oFU8+Tn1Em
         AhdbdWj10BUYt/B/xCeT3G9xkxVdMHJyyLItDtulwD4p5lXSs/1OiCITREpYxTeyVUg2
         sKww==
X-Gm-Message-State: AOJu0YxCRxiGQ19TbFFL9ElJ/l2/5TSiW2c8YLFg+igoEvc6ACfryGd2
	+BMPCp9EmqaWFYC0p0spF4V81/FscDG7a82uoKOuUJSQU2w/ubvuXE4=
X-Gm-Gg: AfdE7cnGCSRG3Xa+hVhTfwONK4NppQUtPFjwLYXpBqe/c5jwH1DM3Rw7DnuLSxN3Qjo
	G4iqLKywcmCcPh/gGwbfhQKzlBd1iWmQMQotxkiPFWSijC5Lbq4xgIA29wfs5/bqQnYe7KNOQZk
	poQ7uMrt3Y659Jep6R/TAkweF02pQ5ObUqmjYUNGSPGY0nELXMLmWokAz1ePl5ItZwWilm5Wa3Q
	gpJK+fo+Az2qY3uib2x6JRv4D2bavxcgTKnB9uyOpRr00q89XfC9ZqHYIPBzQdgaQyIdF1ty2eL
	2DUOUs9DB8B2y29pwl0GpCIs14Tki/sBBIzivDWTek3ed+Obe0EVUz8m2N2Cw9H+JzqInCAwGV6
	aPbzIFWdX0jm1mF498R4OaFCmZ47nXxZwCCx2XOiAA3kyJDzDjsVOaumQ7HfNVW4sephfh3CU9f
	6rvW23PX/a73WfTWAw5CFrExCVvaZgqYNg4/OOpW2gAasAEyEy/Xkcz2ucK6ZqqIU2yqVDEoDed
	CQbFCUVcHLOte/YQTfSKoGJ4g==
X-Received: by 2002:a05:6a00:a889:b0:848:2f84:734 with SMTP id d2e1a72fcca58-848430404f3mr12130220b3a.71.1783686764638;
        Fri, 10 Jul 2026 05:32:44 -0700 (PDT)
Received: from penguin.tail0a1999.ts.net (61-228-54-80.dynamic-ip.hinet.net. [61.228.54.80])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-848686d6e86sm1929058b3a.19.2026.07.10.05.32.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 05:32:43 -0700 (PDT)
From: Shih-Yuan Lee <fourdollars@debian.org>
To: Henrik Rydberg <rydberg@bitmath.org>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shih-Yuan Lee <fourdollars@debian.org>
Subject: [PATCH 1/1] hwmon: (applesmc) Convert to hwmon_device_register_with_info
Date: Fri, 10 Jul 2026 20:32:36 +0800
Message-Id: <20260710123236.10508-2-fourdollars@debian.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260710123236.10508-1-fourdollars@debian.org>
References: <20260710123236.10508-1-fourdollars@debian.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The legacy hwmon_device_register() function is deprecated and triggers a
warning in dmesg during driver initialization:

[   24.706091] applesmc: key=620 fan=0 temp=37 index=36 acc=0 lux=2 kbd=0
[   24.706270] applesmc applesmc.768: hwmon_device_register() is deprecated. Please convert the driver to use hwmon_device_register_with_info().

To silence this warning, convert the driver to use the modern
hwmon_device_register_with_info() API.

Because the driver creates all its sysfs attributes dynamically on the platform
device, we define a minimal struct hwmon_chip_info with a single temperature
channel and implement a visibility callback that returns 0 (hidden) for it.
This satisfies the new API requirements while keeping all existing sysfs paths
and attributes completely unchanged, ensuring backwards compatibility.

Signed-off-by: Shih-Yuan Lee <fourdollars@debian.org>
---
 drivers/hwmon/applesmc.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/applesmc.c b/drivers/hwmon/applesmc.c
index 90a14a7f2c4c..2b10bef24d8d 100644
--- a/drivers/hwmon/applesmc.c
+++ b/drivers/hwmon/applesmc.c
@@ -1307,6 +1307,26 @@ static const struct dmi_system_id applesmc_whitelist[] __initconst = {
 };
 MODULE_DEVICE_TABLE(dmi, applesmc_whitelist);
 
+static umode_t applesmc_is_visible(const void *data, enum hwmon_sensor_types type,
+				   u32 attr, int channel)
+{
+	return 0;
+}
+
+static const struct hwmon_ops applesmc_hwmon_ops = {
+	.is_visible = applesmc_is_visible,
+};
+
+static const struct hwmon_channel_info * const applesmc_info[] = {
+	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT),
+	NULL
+};
+
+static const struct hwmon_chip_info applesmc_chip_info = {
+	.ops = &applesmc_hwmon_ops,
+	.info = applesmc_info,
+};
+
 static int __init applesmc_init(void)
 {
 	int ret;
@@ -1363,7 +1383,8 @@ static int __init applesmc_init(void)
 	if (ret)
 		goto out_light_sysfs;
 
-	hwmon_dev = hwmon_device_register(&pdev->dev);
+	hwmon_dev = hwmon_device_register_with_info(&pdev->dev, "applesmc", NULL,
+						    &applesmc_chip_info, NULL);
 	if (IS_ERR(hwmon_dev)) {
 		ret = PTR_ERR(hwmon_dev);
 		goto out_light_ledclass;
-- 
2.39.5

