Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02F50C433F5
	for <linux-hwmon@archiver.kernel.org>; Thu, 25 Nov 2021 02:52:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234986AbhKYCzj (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 24 Nov 2021 21:55:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235436AbhKYCxi (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 24 Nov 2021 21:53:38 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7000C0698D4
        for <linux-hwmon@vger.kernel.org>; Wed, 24 Nov 2021 18:10:54 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id l22so12205712lfg.7
        for <linux-hwmon@vger.kernel.org>; Wed, 24 Nov 2021 18:10:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=12C3fQGGzI1eMdxkB4i98B03WTNPWwmJzoAMnHB2J+A=;
        b=wFn+jyCBkB6unHasWMTRD419h+1W4HcFbsJNjGlJ2n0PiuQUkz7CwAWzEV/0Y7pZ39
         cfsZHGj9tU+85t4s0LkzU0rHU8s6aIVRkijf6+xy+WGNu+Rum0XZh8iMfzXxa0dHWrVC
         b1HuaAYBe8OWNgIx2P+foBGVgC8pmhvICEvL9FwGer80Q8gmDGtCLZ6IV2ERO72fjSX6
         e4UNKTo2+Na35A5BmZGA6Z32yTpXfUM4mQ/bT3yERrX07h6rTaT+78o+1D4Xq1yX3H/k
         JUm1p6sbsMHKm8YWyKhR9J9VP5U/eXA0rxFGTa+Yk4paUFg2GCVuHQ0ANVmZCQl/Beyu
         pHPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=12C3fQGGzI1eMdxkB4i98B03WTNPWwmJzoAMnHB2J+A=;
        b=OCv0mQSIsDjLU9ezJjHK4gMPNi1jpbZeCoe21qk2IvX1kQQPMSB2FlBYE+O/pgM/oE
         hlMqDuRIXhpmr0Kp28hE7G2KhgAPHb1Q0RMZ4OqGV9EE8UhY1On5P9GpqId2SO//PEoT
         C368XTA7Vnqk6CjA4VgHsBh0ttMDUcvZpUVAT9lon9Vby2Q1nKEh7rjXKyZBGSkbmmvx
         E2QYL5zSwk1p6yXw0BxqcO0GKblDo/MsBqrTS+ezPAqsUcwYoiSYdIFMtTTUhmC5Efvj
         Q76JzITo6/44m9ANMwIZZFXv05NEb1DIwgdp3SfjoPTCK4jgRYxtNAHOetW70uNUPq2i
         KTaw==
X-Gm-Message-State: AOAM5332oDbrRx2e85Km1CQ1ti1KFAFWBgGbS2YKJMwgYztb65Tn5bdd
        ExSnf8KBHDonaiwBdV/xcluQmmjH/AZ8sA==
X-Google-Smtp-Source: ABdhPJz+JEx+lDtB/2EQ7pKZ5xIk6V1jNFTIS9QhZVU7oewlUOIbbcltLI8aE+iHBsveWEQo0hVt6w==
X-Received: by 2002:a05:6512:33c9:: with SMTP id d9mr19641633lfg.615.1637806253193;
        Wed, 24 Nov 2021 18:10:53 -0800 (PST)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id m3sm132507lji.112.2021.11.24.18.10.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 18:10:52 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Peter Rosin <peda@axentia.se>,
        Chris Lesiak <chris.lesiak@licor.com>
Subject: [PATCH 1/4] hwmon: (ntc_thermistor) Merge platform data into driver
Date:   Thu, 25 Nov 2021 03:08:38 +0100
Message-Id: <20211125020841.3616359-2-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211125020841.3616359-1-linus.walleij@linaro.org>
References: <20211125020841.3616359-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Platform data is supposed to be used with "board files",
device descriptions in C. Since the introduction of the
NTC driver in 2011, no such platforms have been submitted
to the Linux kernel, and their use is strongly discouraged
in favor of Device Tree, ACPI or as last resort software
firmware nodes.

Drop the external header and copy the platform data into
the driver file.

Cc: Peter Rosin <peda@axentia.se>
Cc: Chris Lesiak <chris.lesiak@licor.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/hwmon/ntc_thermistor.c               | 41 ++++++++++++++--
 include/linux/platform_data/ntc_thermistor.h | 50 --------------------
 2 files changed, 36 insertions(+), 55 deletions(-)
 delete mode 100644 include/linux/platform_data/ntc_thermistor.h

diff --git a/drivers/hwmon/ntc_thermistor.c b/drivers/hwmon/ntc_thermistor.c
index cf26c44f2b88..034ef55d0706 100644
--- a/drivers/hwmon/ntc_thermistor.c
+++ b/drivers/hwmon/ntc_thermistor.c
@@ -14,12 +14,45 @@
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/fixp-arith.h>
+#include <linux/iio/consumer.h>
+#include <linux/hwmon.h>
 
-#include <linux/platform_data/ntc_thermistor.h>
+enum ntc_thermistor_type {
+	TYPE_B57330V2103,
+	TYPE_B57891S0103,
+	TYPE_NCPXXWB473,
+	TYPE_NCPXXWF104,
+	TYPE_NCPXXWL333,
+	TYPE_NCPXXXH103,
+};
 
-#include <linux/iio/consumer.h>
+struct ntc_thermistor_platform_data {
+	/*
+	 * One (not both) of read_uV and read_ohm should be provided and only
+	 * one of the two should be provided.
+	 * Both functions should return negative value for an error case.
+	 *
+	 * pullup_uV, pullup_ohm, pulldown_ohm, and connect are required to use
+	 * read_uV()
+	 *
+	 * How to setup pullup_ohm, pulldown_ohm, and connect is
+	 * described at Documentation/hwmon/ntc_thermistor.rst
+	 *
+	 * pullup/down_ohm: 0 for infinite / not-connected
+	 *
+	 * chan: iio_channel pointer to communicate with the ADC which the
+	 * thermistor is using for conversion of the analog values.
+	 */
+	int (*read_uv)(struct ntc_thermistor_platform_data *);
+	unsigned int pullup_uv;
 
-#include <linux/hwmon.h>
+	unsigned int pullup_ohm;
+	unsigned int pulldown_ohm;
+	enum { NTC_CONNECTED_POSITIVE, NTC_CONNECTED_GROUND } connect;
+	struct iio_channel *chan;
+
+	int (*read_ohm)(void);
+};
 
 struct ntc_compensation {
 	int		temp_c;
@@ -651,8 +684,6 @@ static int ntc_thermistor_probe(struct platform_device *pdev)
 	pdata = ntc_thermistor_parse_dt(dev);
 	if (IS_ERR(pdata))
 		return PTR_ERR(pdata);
-	else if (pdata == NULL)
-		pdata = dev_get_platdata(dev);
 
 	if (!pdata) {
 		dev_err(dev, "No platform init data supplied.\n");
diff --git a/include/linux/platform_data/ntc_thermistor.h b/include/linux/platform_data/ntc_thermistor.h
deleted file mode 100644
index b324d03e580c..000000000000
--- a/include/linux/platform_data/ntc_thermistor.h
+++ /dev/null
@@ -1,50 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-/*
- * ntc_thermistor.h - NTC Thermistors
- *
- *  Copyright (C) 2010 Samsung Electronics
- *  MyungJoo Ham <myungjoo.ham@samsung.com>
- */
-#ifndef _LINUX_NTC_H
-#define _LINUX_NTC_H
-
-struct iio_channel;
-
-enum ntc_thermistor_type {
-	TYPE_B57330V2103,
-	TYPE_B57891S0103,
-	TYPE_NCPXXWB473,
-	TYPE_NCPXXWF104,
-	TYPE_NCPXXWL333,
-	TYPE_NCPXXXH103,
-};
-
-struct ntc_thermistor_platform_data {
-	/*
-	 * One (not both) of read_uV and read_ohm should be provided and only
-	 * one of the two should be provided.
-	 * Both functions should return negative value for an error case.
-	 *
-	 * pullup_uV, pullup_ohm, pulldown_ohm, and connect are required to use
-	 * read_uV()
-	 *
-	 * How to setup pullup_ohm, pulldown_ohm, and connect is
-	 * described at Documentation/hwmon/ntc_thermistor.rst
-	 *
-	 * pullup/down_ohm: 0 for infinite / not-connected
-	 *
-	 * chan: iio_channel pointer to communicate with the ADC which the
-	 * thermistor is using for conversion of the analog values.
-	 */
-	int (*read_uv)(struct ntc_thermistor_platform_data *);
-	unsigned int pullup_uv;
-
-	unsigned int pullup_ohm;
-	unsigned int pulldown_ohm;
-	enum { NTC_CONNECTED_POSITIVE, NTC_CONNECTED_GROUND } connect;
-	struct iio_channel *chan;
-
-	int (*read_ohm)(void);
-};
-
-#endif /* _LINUX_NTC_H */
-- 
2.31.1

