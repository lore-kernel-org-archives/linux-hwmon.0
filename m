Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50362C56202
	for <linux-hwmon@archiver.kernel.org>; Thu, 26 Nov 2020 17:44:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ED7E2207BC
	for <linux-hwmon@archiver.kernel.org>; Thu, 26 Nov 2020 17:44:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="pXf4asl/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391698AbgKZRoS (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 26 Nov 2020 12:44:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391549AbgKZRoS (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 26 Nov 2020 12:44:18 -0500
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C88A2C0613D4
        for <linux-hwmon@vger.kernel.org>; Thu, 26 Nov 2020 09:44:16 -0800 (PST)
Received: by mail-wr1-x442.google.com with SMTP id s8so2983793wrw.10
        for <linux-hwmon@vger.kernel.org>; Thu, 26 Nov 2020 09:44:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jrDVTbCaw5Bpp/qi9jo13xXVa0AEIEJM7cN5y0BEXA0=;
        b=pXf4asl/sImUkDRE6Dw+2+L0r33yuVY+hoE6aczkpNi0d+FaORK77uqp1hYHGcK6kZ
         2fjUpcVvZ3BAb2vi6iz+jHFjZ5U9THSCjo7Q7imdqudo3jC2sWJx0Oof3RXTexIQn0NA
         cGwOGN7jw/xVsevO/Y7StsMxv/B8UH0HvAkgA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jrDVTbCaw5Bpp/qi9jo13xXVa0AEIEJM7cN5y0BEXA0=;
        b=elu/VHZV4HHuIYcdnDQ/TMikfQDPLG7ZnlAAWVY6rZnDoatbmenmZx9MkifSoHmKMM
         g8o9myNuGBsyyuceoFFY1kVwEnJ4OXCneLOUe+p62PUxMv7tAsoFfw7b13ou96UiNEp6
         g5QG3JGd3BedVga5yZLZq0wqZ6PHBIlID3K1GWNu38WJMTCB/NWYHbZY0SXyqUQA0lMq
         mVZ5K8pa/6jC+64LE5ghqXzs2t8PxYI1Nr4N/do8WFy27NGuDd66mvT0HRIRN8bzoU/O
         S57497HHeCvhPtBsUPg7LzXtUwuaDI6Eg89ownp3KvwNlIa/Dx3zK+h5Wdg7FvmQW5CO
         9D/g==
X-Gm-Message-State: AOAM531lBTPSn6EGSh9F4pDYtbEtv47cTGgX0pP+/sBAS4ZYvVkeK/zo
        I1V/DB9D4QM9ihGGDBoZrDhzxQ==
X-Google-Smtp-Source: ABdhPJyErYM+y8ro3tEZPT9Qr5tuSVwI+ZN0CrXS4j9oniyfTmCRgQK+aOff2CFoPZxMtMD0yODMiA==
X-Received: by 2002:adf:8028:: with SMTP id 37mr5320454wrk.111.1606412655506;
        Thu, 26 Nov 2020 09:44:15 -0800 (PST)
Received: from alpha.home.b5net.uk (cpc76148-clif11-2-0-cust524.12-4.cable.virginm.net. [82.1.54.13])
        by smtp.gmail.com with ESMTPSA id h98sm11578582wrh.69.2020.11.26.09.44.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2020 09:44:15 -0800 (PST)
From:   Paul Barker <pbarker@konsulko.com>
To:     Kamil Debski <kamil@wypas.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Paul Barker <pbarker@konsulko.com>, linux-hwmon@vger.kernel.org
Subject: [PATCH 2/2] hwmon: pwm-fan: Convert to hwmon_device_register_with_info API
Date:   Thu, 26 Nov 2020 17:44:08 +0000
Message-Id: <20201126174408.755-3-pbarker@konsulko.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201126174408.755-1-pbarker@konsulko.com>
References: <20201126174408.755-1-pbarker@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The pwm-fan driver is updated to use the recommended API.

Signed-off-by: Paul Barker <pbarker@konsulko.com>
---
 drivers/hwmon/pwm-fan.c | 112 +++++++++++++++++++++++++---------------
 1 file changed, 71 insertions(+), 41 deletions(-)

diff --git a/drivers/hwmon/pwm-fan.c b/drivers/hwmon/pwm-fan.c
index efe2764f42d3..c8a1d41d6f06 100644
--- a/drivers/hwmon/pwm-fan.c
+++ b/drivers/hwmon/pwm-fan.c
@@ -8,7 +8,6 @@
  */
 
 #include <linux/hwmon.h>
-#include <linux/hwmon-sysfs.h>
 #include <linux/interrupt.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
@@ -39,6 +38,28 @@ struct pwm_fan_ctx {
 	unsigned int pwm_fan_max_state;
 	unsigned int *pwm_fan_cooling_levels;
 	struct thermal_cooling_device *cdev;
+
+	struct hwmon_chip_info info;
+};
+
+static const u32 pwm_fan_channel_config_pwm[] = {
+	HWMON_PWM_INPUT,
+	0
+};
+
+static const struct hwmon_channel_info pwm_fan_channel_pwm = {
+	.type = hwmon_pwm,
+	.config = pwm_fan_channel_config_pwm,
+};
+
+static const u32 pwm_fan_channel_config_fan[] = {
+	HWMON_F_INPUT,
+	0
+};
+
+static const struct hwmon_channel_info pwm_fan_channel_fan = {
+	.type = hwmon_fan,
+	.config = pwm_fan_channel_config_fan,
 };
 
 /* This handler assumes self resetting edge triggered interrupt. */
@@ -103,14 +124,14 @@ static void pwm_fan_update_state(struct pwm_fan_ctx *ctx, unsigned long pwm)
 	ctx->pwm_fan_state = i;
 }
 
-static ssize_t pwm_store(struct device *dev, struct device_attribute *attr,
-			 const char *buf, size_t count)
+static int pwm_fan_write(struct device *dev, enum hwmon_sensor_types type,
+			 u32 attr, int channel, long val)
 {
 	struct pwm_fan_ctx *ctx = dev_get_drvdata(dev);
-	unsigned long pwm;
+	unsigned long pwm = val;
 	int ret;
 
-	if (kstrtoul(buf, 10, &pwm) || pwm > MAX_PWM)
+	if (pwm > MAX_PWM)
 		return -EINVAL;
 
 	ret = __set_pwm(ctx, pwm);
@@ -118,55 +139,50 @@ static ssize_t pwm_store(struct device *dev, struct device_attribute *attr,
 		return ret;
 
 	pwm_fan_update_state(ctx, pwm);
-	return count;
+	return 0;
 }
 
-static ssize_t pwm_show(struct device *dev, struct device_attribute *attr,
-			char *buf)
+static int pwm_fan_read(struct device *dev, enum hwmon_sensor_types type,
+			u32 attr, int channel, long *val)
 {
 	struct pwm_fan_ctx *ctx = dev_get_drvdata(dev);
 
-	return sprintf(buf, "%u\n", ctx->pwm_value);
-}
+	switch (type) {
+	case hwmon_pwm:
+		*val = ctx->pwm_value;
+		return 0;
 
-static ssize_t rpm_show(struct device *dev,
-			struct device_attribute *attr, char *buf)
-{
-	struct pwm_fan_ctx *ctx = dev_get_drvdata(dev);
+	case hwmon_fan:
+		*val = ctx->rpm;
+		return 0;
 
-	return sprintf(buf, "%u\n", ctx->rpm);
+	default:
+		return -EINVAL;
+	}
 }
 
-static SENSOR_DEVICE_ATTR_RW(pwm1, pwm, 0);
-static SENSOR_DEVICE_ATTR_RO(fan1_input, rpm, 0);
+static umode_t pwm_fan_is_visible(const void *data,
+				  enum hwmon_sensor_types type,
+				  u32 attr, int channel)
+{
+	struct pwm_fan_ctx *ctx = (struct pwm_fan_ctx *)data;
 
-static struct attribute *pwm_fan_attrs[] = {
-	&sensor_dev_attr_pwm1.dev_attr.attr,
-	&sensor_dev_attr_fan1_input.dev_attr.attr,
-	NULL,
-};
+	switch (type) {
+	case hwmon_pwm:
+		return 0644;
 
-static umode_t pwm_fan_attrs_visible(struct kobject *kobj, struct attribute *a,
-				     int n)
-{
-	struct device *dev = container_of(kobj, struct device, kobj);
-	struct pwm_fan_ctx *ctx = dev_get_drvdata(dev);
+	case hwmon_fan:
+		return 0444;
 
-	/* Hide fan_input in case no interrupt is available  */
-	if (n == 1 && ctx->irq <= 0)
+	default:
 		return 0;
-
-	return a->mode;
+	}
 }
 
-static const struct attribute_group pwm_fan_group = {
-	.attrs = pwm_fan_attrs,
-	.is_visible = pwm_fan_attrs_visible,
-};
-
-static const struct attribute_group *pwm_fan_groups[] = {
-	&pwm_fan_group,
-	NULL,
+static const struct hwmon_ops pwm_fan_hwmon_ops = {
+	.is_visible = pwm_fan_is_visible,
+	.read = pwm_fan_read,
+	.write = pwm_fan_write,
 };
 
 /* thermal cooling device callbacks */
@@ -287,6 +303,8 @@ static int pwm_fan_probe(struct platform_device *pdev)
 	int ret;
 	struct pwm_state state = { };
 	int tach_count;
+	size_t sz;
+	const struct hwmon_channel_info **channels;
 
 	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
 	if (!ctx)
@@ -340,6 +358,13 @@ static int pwm_fan_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, tach_count,
 				     "Could not get number of fan tachometer inputs\n");
 
+	sz = (2 + tach_count) * sizeof(struct hwmon_channel_info *);
+	channels = devm_kzalloc(dev, sz, GFP_KERNEL);
+	if (!channels)
+		return -ENOMEM;
+
+	channels[0] = &pwm_fan_channel_pwm;
+
 	if (tach_count > 0) {
 		u32 ppr = 2;
 
@@ -371,10 +396,15 @@ static int pwm_fan_probe(struct platform_device *pdev)
 
 		ctx->sample_start = ktime_get();
 		mod_timer(&ctx->rpm_timer, jiffies + HZ);
+
+		channels[1] = &pwm_fan_channel_fan;
 	}
 
-	hwmon = devm_hwmon_device_register_with_groups(dev, "pwmfan",
-						       ctx, pwm_fan_groups);
+	ctx->info.ops = &pwm_fan_hwmon_ops;
+	ctx->info.info = channels;
+
+	hwmon = devm_hwmon_device_register_with_info(dev, "pwmfan",
+						     ctx, &ctx->info, NULL);
 	if (IS_ERR(hwmon)) {
 		dev_err(dev, "Failed to register hwmon device\n");
 		return PTR_ERR(hwmon);
-- 
2.26.2

