Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88DDBC433F5
	for <linux-hwmon@archiver.kernel.org>; Mon,  6 Dec 2021 00:02:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241156AbhLFAF3 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 5 Dec 2021 19:05:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229567AbhLFAF3 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 5 Dec 2021 19:05:29 -0500
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74DDDC061751
        for <linux-hwmon@vger.kernel.org>; Sun,  5 Dec 2021 16:02:01 -0800 (PST)
Received: by mail-lj1-x236.google.com with SMTP id 207so17621291ljf.10
        for <linux-hwmon@vger.kernel.org>; Sun, 05 Dec 2021 16:02:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OjoUMudfcTdB7sU0Mur7xaxZwOZAE1cho5LNq1WnRZQ=;
        b=aliR30jGSGJsBUKcYixK8SSW1qy4X5kowewLPh1Eze25MQR+ZeMXAsH3/Vku/Rrr6W
         p4ZLyixKEQfaa75Br7jBWwVEadYuv+Q3J6BAj05dNsRIma4YnuNRq9z7nTp9/1vKUtxn
         /GH8/LVF6BJVRoh8DjEifZdTeT7qx32rQeEhRcwEcXzztFstKgYz/MyQ3KOVxLPO0hX4
         yJgxJtal2YV7zYuJ03OqDVdGWNYTLbLkMxsqqCpdSQK3p0eis7+kpdvvIOeMaUr118Nt
         96eg/YaEO+7JywbV2eD5NF5AbgcdewiW8mXFadzrphIPPvL3UVzCOBQn6w3/jBDI9SVp
         h04g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OjoUMudfcTdB7sU0Mur7xaxZwOZAE1cho5LNq1WnRZQ=;
        b=Dm51EcVn7m+B4SgcI5FD0HWVcsOWgpYPvfzf7UzY//i/GThSa10BxtdGEaANPsuhnn
         1LTn/xG0Aj3Nyc+qNqId723YmsghBi/9pF0J4UCrq8if8e7AUtqJb7eG07FJjFd4m5SD
         xGnPiA4B0+Uq6idTHKhpnjhzOrP4V8ps2KpewfxqgriBVd+s3jAoiuo5IVpdKgzUJQ7K
         Qhi7u40gxsxfTBuVW3uDDsv5XceZ8wxunQB+FL3qLp4w8+RsiJJU9PhWRJ4nqTaaRCPK
         8vtX6GPtbSGgpH82XQ7FpRP+mnu5ME8OEpEIUUmleoJSAT6Ki99uQGnsVEIsIFCHUW3D
         SzFQ==
X-Gm-Message-State: AOAM531nhyLStSavkYTnADLlG2jNXHWcxWkapLlQP2TrH+kXB657EP4x
        fdI2j8+0XNRhOiyQii2wVT9ZGQ==
X-Google-Smtp-Source: ABdhPJwASwj47+PMJJPJMoEfr/bgWHgdjYspY+2gvED+rWJMXUfWeasOahHIvRbn1bOwkFhWidY96Q==
X-Received: by 2002:a2e:81da:: with SMTP id s26mr33374976ljg.63.1638748919741;
        Sun, 05 Dec 2021 16:01:59 -0800 (PST)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id m27sm1189021lfp.268.2021.12.05.16.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Dec 2021 16:01:58 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Peter Rosin <peda@axentia.se>,
        Chris Lesiak <chris.lesiak@licor.com>
Subject: [PATCH 2/3] hwmon: (ntc_thermistor): Switch to generic firmware props
Date:   Mon,  6 Dec 2021 00:59:47 +0100
Message-Id: <20211205235948.4167075-2-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211205235948.4167075-1-linus.walleij@linaro.org>
References: <20211205235948.4167075-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

This switches to retrieveing the configuration of the NTC
from generic firmware properties so that we get neutral from
device tree: now ACPI or, more importantly, software nodes
can be used to spawn NTC devices provided they have the
required properties.

This was inspired by the similar changes made to the IIO
drivers.

This was tested on the Ux500 HREF with the NTC devices
probing from device tree just as fine after this as before.

Cc: Peter Rosin <peda@axentia.se>
Cc: Chris Lesiak <chris.lesiak@licor.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/hwmon/ntc_thermistor.c | 31 ++++++++++++++++---------------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/drivers/hwmon/ntc_thermistor.c b/drivers/hwmon/ntc_thermistor.c
index 44abcb8a2393..246e109db462 100644
--- a/drivers/hwmon/ntc_thermistor.c
+++ b/drivers/hwmon/ntc_thermistor.c
@@ -9,10 +9,10 @@
 #include <linux/slab.h>
 #include <linux/module.h>
 #include <linux/math64.h>
+#include <linux/mod_devicetable.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/err.h>
-#include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/fixp-arith.h>
 #include <linux/iio/consumer.h>
 #include <linux/hwmon.h>
@@ -598,9 +598,6 @@ static const struct hwmon_chip_info ntc_chip_info = {
 static int ntc_thermistor_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct device_node *np = dev->of_node;
-	const struct of_device_id *of_id =
-			of_match_device(of_match_ptr(ntc_match), dev);
 	const struct platform_device_id *pdev_id;
 	struct device *hwmon_dev;
 	struct ntc_data *data;
@@ -622,14 +619,19 @@ static int ntc_thermistor_probe(struct platform_device *pdev)
 	if (type != IIO_VOLTAGE)
 		return -EINVAL;
 
-	if (of_property_read_u32(np, "pullup-uv", &data->pullup_uv))
-		return -ENODEV;
-	if (of_property_read_u32(np, "pullup-ohm", &data->pullup_ohm))
-		return -ENODEV;
-	if (of_property_read_u32(np, "pulldown-ohm", &data->pulldown_ohm))
-		return -ENODEV;
+	ret = device_property_read_u32(dev, "pullup-uv", &data->pullup_uv);
+	if (ret)
+		return dev_err_probe(dev,  ret, "pullup-uv not specified\n");
 
-	if (of_find_property(np, "connected-positive", NULL))
+	ret = device_property_read_u32(dev, "pullup-ohm", &data->pullup_ohm);
+	if (ret)
+		return dev_err_probe(dev,  ret, "pullup-ohm not specified\n");
+
+	ret = device_property_read_u32(dev, "pulldown-ohm", &data->pulldown_ohm);
+	if (ret)
+		return dev_err_probe(dev,  ret, "pulldown-ohm not specified\n");
+
+	if (device_property_read_bool(dev, "connected-positive"))
 		data->connect = NTC_CONNECTED_POSITIVE;
 	else /* status change should be possible if not always on. */
 		data->connect = NTC_CONNECTED_GROUND;
@@ -645,8 +647,7 @@ static int ntc_thermistor_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	pdev_id = of_id ? of_id->data : platform_get_device_id(pdev);
-
+	pdev_id = device_get_match_data(dev);
 	if (pdev_id->driver_data >= ARRAY_SIZE(ntc_type)) {
 		dev_err(dev, "Unknown device type: %lu(%s)\n",
 				pdev_id->driver_data, pdev_id->name);
@@ -673,7 +674,7 @@ static int ntc_thermistor_probe(struct platform_device *pdev)
 static struct platform_driver ntc_thermistor_driver = {
 	.driver = {
 		.name = "ntc-thermistor",
-		.of_match_table = of_match_ptr(ntc_match),
+		.of_match_table = ntc_match,
 	},
 	.probe = ntc_thermistor_probe,
 	.id_table = ntc_thermistor_id,
-- 
2.31.1

