Return-Path: <SRS0=nEaE=3G=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 330B3C33CB1
	for <linux-hwmon@archiver.kernel.org>; Fri, 17 Jan 2020 15:56:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F3E6421582
	for <linux-hwmon@archiver.kernel.org>; Fri, 17 Jan 2020 15:56:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fI4qsdYV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729019AbgAQP4c (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 17 Jan 2020 10:56:32 -0500
Received: from mail-yw1-f65.google.com ([209.85.161.65]:42947 "EHLO
        mail-yw1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728739AbgAQP4c (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 17 Jan 2020 10:56:32 -0500
Received: by mail-yw1-f65.google.com with SMTP id l14so14541251ywj.9
        for <linux-hwmon@vger.kernel.org>; Fri, 17 Jan 2020 07:56:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=OpWfR+kDUKQZu7yUwy5szmehKR2t6wKor0HzZ4WFqwc=;
        b=fI4qsdYVmgsy5mZMT4F8xd4m62NTeDKL1JNkC2Yeh9ynQDETKU20CdXYSgg0hARVRk
         6maKSKra2bF5ysfOCVxfNk3o2m42QumSyhtQZqysnYc7hpxQHw3Q20QDdgU0IcWcJcz2
         Hhjvr3J7ki/FO7wKTv544NWaTBAuDa/1Al5dWPchxiDwl/t84VJMpOepVSpGA5H4j2LQ
         WmHiebM/KN26YZe2hUFAQf4DJ2exbwa+R6SQbe1ho9GkODZDK7nly+D7ogzqCnbFAB5H
         3jeJwhLKxrfhOdb4TTuwRlyeGeXU0yx5xazSmavdfDr4geCS0zB+qOgwRuz8AfHhOCW+
         vEGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=OpWfR+kDUKQZu7yUwy5szmehKR2t6wKor0HzZ4WFqwc=;
        b=U4kiBldj5DEIQ381IVHr9lWMSGo1cq1EMMaTU1saAKPvL376g4S7GAd7NMDZ+OWsDv
         /4DilqDX/7zb9X1omb+dEQipfBOsmZH6fBXU4nTcl44siRPvAeBug83dqtrk/gc24wVG
         xAZxheCKQYZ4SZYO7daXQJV90QIfNc44K6JlMwQn3atGVV5MrchFylcatx7sLNpS62XH
         34gOvZV1jhUOVWTDF6VukLUJNkmGvbdNlBilnwVyoKhfzQgUxvKQAndMLBOzpMzK5bV1
         Ls/L9c3SGrLq5afln8HghTvQHE7YGFA2ujIqyrHUGGpMC/sCAhTjwOS9x67VpPIOAxjh
         gT/g==
X-Gm-Message-State: APjAAAUjfqtFCWaZkaOTGsLfc/SYb+NkbUGXyhbQ74TW1iivsks656mk
        C0jNk/tdUrRQ9blrIFme16l4+/sv
X-Google-Smtp-Source: APXvYqyehE4lFb5tCZJdoCTRQw93dCDGnS9s/xxzdXVEcwTbFot717yvnm/tjAk6WK9cBqOfjT8Kzw==
X-Received: by 2002:a81:b654:: with SMTP id h20mr29076766ywk.272.1579276591013;
        Fri, 17 Jan 2020 07:56:31 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d143sm11905263ywb.51.2020.01.17.07.56.29
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 17 Jan 2020 07:56:29 -0800 (PST)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     "Martin K . Petersen" <martin.petersen@oracle.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] hwmon: (core) Do not use device managed functions for memory allocations
Date:   Fri, 17 Jan 2020 07:56:24 -0800
Message-Id: <20200117155624.24490-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.17.1
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The hwmon core uses device managed functions, tied to the hwmon parent
device, for various internal memory allocations. This is problematic
since hwmon device lifetime does not necessarily match its parent's
device lifetime. If there is a mismatch, memory leaks will accumulate
until the parent device is released.

Fix the problem by managing all memory allocations internally. The only
exception is memory allocation for thermal device registration, which
can be tied to the hwmon device, along with thermal device registration
itself.

Fixes: d560168b5d0f ("hwmon: (core) New hwmon registration API")
Cc: stable@vger.kernel.org # v4.14.x: 47c332deb8e8: hwmon: Deal with errors from the thermal subsystem
Cc: stable@vger.kernel.org # v4.14.x: 74e3512731bd: hwmon: (core) Fix double-free in __hwmon_device_register()
Cc: stable@vger.kernel.org # v4.9.x: 3a412d5e4a1c: hwmon: (core) Simplify sysfs attribute name allocation
Cc: stable@vger.kernel.org # v4.9.x: 47c332deb8e8: hwmon: Deal with errors from the thermal subsystem
Cc: stable@vger.kernel.org # v4.9.x: 74e3512731bd: hwmon: (core) Fix double-free in __hwmon_device_register()
Cc: stable@vger.kernel.org # v4.9+
Cc: Martin K. Petersen <martin.petersen@oracle.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/hwmon.c | 68 ++++++++++++++++++++++++++-----------------
 1 file changed, 41 insertions(+), 27 deletions(-)

diff --git a/drivers/hwmon/hwmon.c b/drivers/hwmon/hwmon.c
index 1f3b30b085b9..d018b20089ec 100644
--- a/drivers/hwmon/hwmon.c
+++ b/drivers/hwmon/hwmon.c
@@ -51,6 +51,7 @@ struct hwmon_device_attribute {
 
 #define to_hwmon_attr(d) \
 	container_of(d, struct hwmon_device_attribute, dev_attr)
+#define to_dev_attr(a) container_of(a, struct device_attribute, attr)
 
 /*
  * Thermal zone information
@@ -58,7 +59,7 @@ struct hwmon_device_attribute {
  * also provides the sensor index.
  */
 struct hwmon_thermal_data {
-	struct hwmon_device *hwdev;	/* Reference to hwmon device */
+	struct device *dev;		/* Reference to hwmon device */
 	int index;			/* sensor index */
 };
 
@@ -95,9 +96,27 @@ static const struct attribute_group *hwmon_dev_attr_groups[] = {
 	NULL
 };
 
+static void hwmon_free_attrs(struct attribute **attrs)
+{
+	int i;
+
+	for (i = 0; attrs[i]; i++) {
+		struct device_attribute *dattr = to_dev_attr(attrs[i]);
+		struct hwmon_device_attribute *hattr = to_hwmon_attr(dattr);
+
+		kfree(hattr);
+	}
+	kfree(attrs);
+}
+
 static void hwmon_dev_release(struct device *dev)
 {
-	kfree(to_hwmon_device(dev));
+	struct hwmon_device *hwdev = to_hwmon_device(dev);
+
+	if (hwdev->group.attrs)
+		hwmon_free_attrs(hwdev->group.attrs);
+	kfree(hwdev->groups);
+	kfree(hwdev);
 }
 
 static struct class hwmon_class = {
@@ -119,11 +138,11 @@ static DEFINE_IDA(hwmon_ida);
 static int hwmon_thermal_get_temp(void *data, int *temp)
 {
 	struct hwmon_thermal_data *tdata = data;
-	struct hwmon_device *hwdev = tdata->hwdev;
+	struct hwmon_device *hwdev = to_hwmon_device(tdata->dev);
 	int ret;
 	long t;
 
-	ret = hwdev->chip->ops->read(&hwdev->dev, hwmon_temp, hwmon_temp_input,
+	ret = hwdev->chip->ops->read(tdata->dev, hwmon_temp, hwmon_temp_input,
 				     tdata->index, &t);
 	if (ret < 0)
 		return ret;
@@ -137,8 +156,7 @@ static const struct thermal_zone_of_device_ops hwmon_thermal_ops = {
 	.get_temp = hwmon_thermal_get_temp,
 };
 
-static int hwmon_thermal_add_sensor(struct device *dev,
-				    struct hwmon_device *hwdev, int index)
+static int hwmon_thermal_add_sensor(struct device *dev, int index)
 {
 	struct hwmon_thermal_data *tdata;
 	struct thermal_zone_device *tzd;
@@ -147,10 +165,10 @@ static int hwmon_thermal_add_sensor(struct device *dev,
 	if (!tdata)
 		return -ENOMEM;
 
-	tdata->hwdev = hwdev;
+	tdata->dev = dev;
 	tdata->index = index;
 
-	tzd = devm_thermal_zone_of_sensor_register(&hwdev->dev, index, tdata,
+	tzd = devm_thermal_zone_of_sensor_register(dev, index, tdata,
 						   &hwmon_thermal_ops);
 	/*
 	 * If CONFIG_THERMAL_OF is disabled, this returns -ENODEV,
@@ -162,8 +180,7 @@ static int hwmon_thermal_add_sensor(struct device *dev,
 	return 0;
 }
 #else
-static int hwmon_thermal_add_sensor(struct device *dev,
-				    struct hwmon_device *hwdev, int index)
+static int hwmon_thermal_add_sensor(struct device *dev, int index)
 {
 	return 0;
 }
@@ -250,8 +267,7 @@ static bool is_string_attr(enum hwmon_sensor_types type, u32 attr)
 	       (type == hwmon_fan && attr == hwmon_fan_label);
 }
 
-static struct attribute *hwmon_genattr(struct device *dev,
-				       const void *drvdata,
+static struct attribute *hwmon_genattr(const void *drvdata,
 				       enum hwmon_sensor_types type,
 				       u32 attr,
 				       int index,
@@ -279,7 +295,7 @@ static struct attribute *hwmon_genattr(struct device *dev,
 	if ((mode & 0222) && !ops->write)
 		return ERR_PTR(-EINVAL);
 
-	hattr = devm_kzalloc(dev, sizeof(*hattr), GFP_KERNEL);
+	hattr = kzalloc(sizeof(*hattr), GFP_KERNEL);
 	if (!hattr)
 		return ERR_PTR(-ENOMEM);
 
@@ -492,8 +508,7 @@ static int hwmon_num_channel_attrs(const struct hwmon_channel_info *info)
 	return n;
 }
 
-static int hwmon_genattrs(struct device *dev,
-			  const void *drvdata,
+static int hwmon_genattrs(const void *drvdata,
 			  struct attribute **attrs,
 			  const struct hwmon_ops *ops,
 			  const struct hwmon_channel_info *info)
@@ -519,7 +534,7 @@ static int hwmon_genattrs(struct device *dev,
 			attr_mask &= ~BIT(attr);
 			if (attr >= template_size)
 				return -EINVAL;
-			a = hwmon_genattr(dev, drvdata, info->type, attr, i,
+			a = hwmon_genattr(drvdata, info->type, attr, i,
 					  templates[attr], ops);
 			if (IS_ERR(a)) {
 				if (PTR_ERR(a) != -ENOENT)
@@ -533,8 +548,7 @@ static int hwmon_genattrs(struct device *dev,
 }
 
 static struct attribute **
-__hwmon_create_attrs(struct device *dev, const void *drvdata,
-		     const struct hwmon_chip_info *chip)
+__hwmon_create_attrs(const void *drvdata, const struct hwmon_chip_info *chip)
 {
 	int ret, i, aindex = 0, nattrs = 0;
 	struct attribute **attrs;
@@ -545,15 +559,17 @@ __hwmon_create_attrs(struct device *dev, const void *drvdata,
 	if (nattrs == 0)
 		return ERR_PTR(-EINVAL);
 
-	attrs = devm_kcalloc(dev, nattrs + 1, sizeof(*attrs), GFP_KERNEL);
+	attrs = kcalloc(nattrs + 1, sizeof(*attrs), GFP_KERNEL);
 	if (!attrs)
 		return ERR_PTR(-ENOMEM);
 
 	for (i = 0; chip->info[i]; i++) {
-		ret = hwmon_genattrs(dev, drvdata, &attrs[aindex], chip->ops,
+		ret = hwmon_genattrs(drvdata, &attrs[aindex], chip->ops,
 				     chip->info[i]);
-		if (ret < 0)
+		if (ret < 0) {
+			hwmon_free_attrs(attrs);
 			return ERR_PTR(ret);
+		}
 		aindex += ret;
 	}
 
@@ -595,14 +611,13 @@ __hwmon_device_register(struct device *dev, const char *name, void *drvdata,
 			for (i = 0; groups[i]; i++)
 				ngroups++;
 
-		hwdev->groups = devm_kcalloc(dev, ngroups, sizeof(*groups),
-					     GFP_KERNEL);
+		hwdev->groups = kcalloc(ngroups, sizeof(*groups), GFP_KERNEL);
 		if (!hwdev->groups) {
 			err = -ENOMEM;
 			goto free_hwmon;
 		}
 
-		attrs = __hwmon_create_attrs(dev, drvdata, chip);
+		attrs = __hwmon_create_attrs(drvdata, chip);
 		if (IS_ERR(attrs)) {
 			err = PTR_ERR(attrs);
 			goto free_hwmon;
@@ -647,8 +662,7 @@ __hwmon_device_register(struct device *dev, const char *name, void *drvdata,
 							   hwmon_temp_input, j))
 					continue;
 				if (info[i]->config[j] & HWMON_T_INPUT) {
-					err = hwmon_thermal_add_sensor(dev,
-								hwdev, j);
+					err = hwmon_thermal_add_sensor(hdev, j);
 					if (err) {
 						device_unregister(hdev);
 						/*
@@ -667,7 +681,7 @@ __hwmon_device_register(struct device *dev, const char *name, void *drvdata,
 	return hdev;
 
 free_hwmon:
-	kfree(hwdev);
+	hwmon_dev_release(hdev);
 ida_remove:
 	ida_simple_remove(&hwmon_ida, id);
 	return ERR_PTR(err);
-- 
2.17.1

