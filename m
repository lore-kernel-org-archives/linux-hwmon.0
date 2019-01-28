Return-Path: <SRS0=CT/L=QE=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9307CC282C8
	for <linux-hwmon@archiver.kernel.org>; Mon, 28 Jan 2019 21:06:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 639982148E
	for <linux-hwmon@archiver.kernel.org>; Mon, 28 Jan 2019 21:06:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=linaro.org header.i=@linaro.org header.b="AbiyOulb"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726984AbfA1VGy (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 28 Jan 2019 16:06:54 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:39553 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726862AbfA1VGy (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 28 Jan 2019 16:06:54 -0500
Received: by mail-lj1-f194.google.com with SMTP id t9-v6so15536763ljh.6
        for <linux-hwmon@vger.kernel.org>; Mon, 28 Jan 2019 13:06:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2s0QdAjCyelsZpr2rXLqe0hcE59BfEPoAUYu8ZDlATU=;
        b=AbiyOulbGtn9LFILGzixPibwLb5ApbAq11MvjkOvGjUhCL8oWWRyWTXf+9DjBpAVR3
         l+Cb+2MzLKutpqS/bCPk/PahAuPjKfyzMfbSEWti0Hzem/Ynyoqz1wOijXAEMLytFALN
         S3Xqc4zymb7QjGZWra+Bn5g9P2W0SZbV6sYB4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2s0QdAjCyelsZpr2rXLqe0hcE59BfEPoAUYu8ZDlATU=;
        b=ClVU/Dc5wzSlKzAAtRV5+Oa3BhDpnKfnucy2XLwixacNAMTDYsWatirWYVXu0KlzG/
         CB3i6z00oxnbjuVv2qCMSzatBVP1ltlRqzs3QSTK0PfCB9v8mP/hH4pW19zIQv2sDjLJ
         0Z7kFm9jo7MqdD+fLl8TxZeIh2ER+x8rBnplTo13b3YATjaqoSuaRoOSGwA4BJbdrugF
         m5FOthX8u12k9s4v6Bv+AkFBRvIy9YtginPSVCd0miswNYXxeAQco0CQv4EbxyaMZUwY
         cWZhZ0bzb+I2GGrT0w9l43PRiMvYPiin40i8YckEgPh3M+aId9fFgkb8ZLT8p7LQf9hD
         sQcw==
X-Gm-Message-State: AJcUukfygJdOh7XuU10WSgiD4fFHvIEl9WWe4RNeg/F6Q7atriRX8OAA
        ewn8oT5qR9HPgvSqbwE1I7J/Qg==
X-Google-Smtp-Source: ALg8bN5nUFNWERQTD3+hRF1+539yroJ9ydVLlJ41Pmrh5mvIEwKzbMMYvShq4QH+7JW4kVEbpIXDJw==
X-Received: by 2002:a2e:8596:: with SMTP id b22-v6mr18520620lji.122.1548709611837;
        Mon, 28 Jan 2019 13:06:51 -0800 (PST)
Received: from linux.local (c-ae7b71d5.014-348-6c756e10.bbcust.telenor.se. [213.113.123.174])
        by smtp.gmail.com with ESMTPSA id u15-v6sm3555755lja.63.2019.01.28.13.06.50
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Jan 2019 13:06:50 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 2/2] hwmon: (ad7418) Add device tree probing
Date:   Mon, 28 Jan 2019 22:06:37 +0100
Message-Id: <20190128210637.22323-2-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190128210637.22323-1-linus.walleij@linaro.org>
References: <20190128210637.22323-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

This adds device tree probing for the AD7418 hwmon sensor.
When device tree is not enabled, stub functions will kick
in.

Tested on the Gateway Cambria GW2358-4.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/hwmon/ad7418.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/ad7418.c b/drivers/hwmon/ad7418.c
index 76f0a5c01e8a..ec0f5d8f18c3 100644
--- a/drivers/hwmon/ad7418.c
+++ b/drivers/hwmon/ad7418.c
@@ -19,6 +19,7 @@
 #include <linux/hwmon-sysfs.h>
 #include <linux/err.h>
 #include <linux/mutex.h>
+#include <linux/of_device.h>
 #include <linux/delay.h>
 #include <linux/slab.h>
 
@@ -220,7 +221,10 @@ static int ad7418_probe(struct i2c_client *client,
 
 	mutex_init(&data->lock);
 	data->client = client;
-	data->type = id->driver_data;
+	if (dev->of_node)
+		data->type = (enum chips)of_device_get_match_data(dev);
+	else
+		data->type = id->driver_data;
 
 	switch (data->type) {
 	case ad7416:
@@ -258,9 +262,17 @@ static const struct i2c_device_id ad7418_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, ad7418_id);
 
+static const struct of_device_id ad7418_dt_ids[] = {
+	{ .compatible = "adi,ad7416", .data = (void *)ad7416, },
+	{ .compatible = "adi,ad7417", .data = (void *)ad7417, },
+	{ .compatible = "adi,ad7418", .data = (void *)ad7418, },
+};
+MODULE_DEVICE_TABLE(of, ad7418_dt_ids);
+
 static struct i2c_driver ad7418_driver = {
 	.driver = {
 		.name	= "ad7418",
+		.of_match_table = ad7418_dt_ids,
 	},
 	.probe		= ad7418_probe,
 	.id_table	= ad7418_id,
-- 
2.20.1

