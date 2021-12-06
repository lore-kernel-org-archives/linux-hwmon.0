Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C4ACC433F5
	for <linux-hwmon@archiver.kernel.org>; Mon,  6 Dec 2021 02:06:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232126AbhLFCKM (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 5 Dec 2021 21:10:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231177AbhLFCKM (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 5 Dec 2021 21:10:12 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F325C061751
        for <linux-hwmon@vger.kernel.org>; Sun,  5 Dec 2021 18:06:44 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id k37so21625322lfv.3
        for <linux-hwmon@vger.kernel.org>; Sun, 05 Dec 2021 18:06:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zdLX6B7TuNFtDV9H/ypWbFLEkQU5InXBFriSKP/v27w=;
        b=ZV9CP10/bEmPZl4Ebih7JEjoiuEHa3ECw7vtCF6kuxN5HgjcbdH5RRqK5ssUg5wBNm
         W5gzDshQa+86/fVJAY+VUsBbWxKrWRsofY7060DGtFgzc49uoJtVLmCe/RE8W+a74EGc
         QPlWwd3kN0KB1TJTD7b46Z374t2gKCatxmM14sEnJefiKzKQfMwkmHZRKqIzr9/e43BQ
         hjs7ThSN6XZ7Jk72MI5KCz2Y3XnaoTDA1XFFgIPCe4qP2GPJlUoErpG5ttkYzpVof3CK
         rARrZRmsg1FD0qQDKIzjomUwOrjEM7tEsHEKr1RIzQdmmfQZUY9XGWtsJYHYz0DrcNlS
         dayQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zdLX6B7TuNFtDV9H/ypWbFLEkQU5InXBFriSKP/v27w=;
        b=OPU5IcqVrEFXMUR80tc/G1EwQdSN0Q58pmCMkiTlW2Mulw5aQs0qqBate0hlUB015g
         r5OS6AdtGq6kcyiQ6lEKf/eTBP7zF/j2HVvXjK/NXB0oVzGXv5CucOsqk+QI+wnh1J9A
         RIk9p50iHad5J4FT3kDLidFm5C9RfbBMgeHMs9+x+y8hEOIL2yaRHfVyrWhwWUtd7yII
         aFVYrKgVWCmmGFhGTp2SIKHy9Iht/iXoWDVLEDOYMC2GmFD3DJK5Ka0B6fHNdHURuIF5
         2XsoGUnSbAPeRlDGfKCLVtEp5psxaeBWcoEwic+BASdLlCy/uwiEYc71TV3pvLa2Z4AB
         l9yQ==
X-Gm-Message-State: AOAM532ftEYKGPFM36wS+6VDTEMBdKB7Ek2x6A2WT7oQ7azIJQGn0HPl
        sgFWN9MOa+AJz7kxdfLd+YhGNsHGHeizPQ==
X-Google-Smtp-Source: ABdhPJzRRfFvwe2mRUcPN4JfLx1zokUkjFdyWDQUGfoeKzs3raSv3nma7TdlXWDpH98EAStQlbylkQ==
X-Received: by 2002:a05:6512:33a8:: with SMTP id i8mr32501239lfg.497.1638756402101;
        Sun, 05 Dec 2021 18:06:42 -0800 (PST)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id k8sm1215672lfv.179.2021.12.05.18.06.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Dec 2021 18:06:41 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Peter Rosin <peda@axentia.se>,
        Chris Lesiak <chris.lesiak@licor.com>
Subject: [PATCH 2/3 v2] hwmon: (ntc_thermistor): Switch to generic firmware props
Date:   Mon,  6 Dec 2021 03:04:22 +0100
Message-Id: <20211206020423.62402-2-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211206020423.62402-1-linus.walleij@linaro.org>
References: <20211206020423.62402-1-linus.walleij@linaro.org>
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
ChangeLog v1->v2:
- Rebase on the changes keeping the props parsing code in
  a separate function.
---
 drivers/hwmon/ntc_thermistor.c | 36 ++++++++++++++++++----------------
 1 file changed, 19 insertions(+), 17 deletions(-)

diff --git a/drivers/hwmon/ntc_thermistor.c b/drivers/hwmon/ntc_thermistor.c
index 12435ef66530..0c8b3dbcb38b 100644
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
@@ -595,12 +595,11 @@ static const struct hwmon_chip_info ntc_chip_info = {
 	.info = ntc_info,
 };
 
-static int ntc_thermistor_parse_dt(struct device *dev,
-				   struct ntc_data *data)
+static int ntc_thermistor_parse_props(struct device *dev,
+				      struct ntc_data *data)
 {
 	struct iio_channel *chan;
 	enum iio_chan_type type;
-	struct device_node *np = dev->of_node;
 	int ret;
 
 	chan = devm_iio_channel_get(dev, NULL);
@@ -614,14 +613,19 @@ static int ntc_thermistor_parse_dt(struct device *dev,
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
+
+	ret = device_property_read_u32(dev, "pullup-ohm", &data->pullup_ohm);
+	if (ret)
+		return dev_err_probe(dev,  ret, "pullup-ohm not specified\n");
+
+	ret = device_property_read_u32(dev, "pulldown-ohm", &data->pulldown_ohm);
+	if (ret)
+		return dev_err_probe(dev,  ret, "pulldown-ohm not specified\n");
 
-	if (of_find_property(np, "connected-positive", NULL))
+	if (device_property_read_bool(dev, "connected-positive"))
 		data->connect = NTC_CONNECTED_POSITIVE;
 	else /* status change should be possible if not always on. */
 		data->connect = NTC_CONNECTED_GROUND;
@@ -634,8 +638,6 @@ static int ntc_thermistor_parse_dt(struct device *dev,
 static int ntc_thermistor_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	const struct of_device_id *of_id =
-			of_match_device(of_match_ptr(ntc_match), dev);
 	const struct platform_device_id *pdev_id;
 	struct device *hwmon_dev;
 	struct ntc_data *data;
@@ -645,7 +647,7 @@ static int ntc_thermistor_probe(struct platform_device *pdev)
 	if (!data)
 		return -ENOMEM;
 
-	ret = ntc_thermistor_parse_dt(dev, data);
+	ret = ntc_thermistor_parse_props(dev, data);
 	if (ret)
 		return ret;
 
@@ -660,7 +662,7 @@ static int ntc_thermistor_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	pdev_id = of_id ? of_id->data : platform_get_device_id(pdev);
+	pdev_id = device_get_match_data(dev);
 
 	if (pdev_id->driver_data >= ARRAY_SIZE(ntc_type)) {
 		dev_err(dev, "Unknown device type: %lu(%s)\n",
@@ -688,7 +690,7 @@ static int ntc_thermistor_probe(struct platform_device *pdev)
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

