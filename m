Return-Path: <SRS0=9cdn=4D=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BB06C4741C
	for <linux-hwmon@archiver.kernel.org>; Sat, 15 Feb 2020 12:26:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 007722082F
	for <linux-hwmon@archiver.kernel.org>; Sat, 15 Feb 2020 12:26:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tmMyf2WC"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725974AbgBOM0L (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 15 Feb 2020 07:26:11 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:35972 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725971AbgBOM0L (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 15 Feb 2020 07:26:11 -0500
Received: by mail-pf1-f193.google.com with SMTP id 185so6430416pfv.3
        for <linux-hwmon@vger.kernel.org>; Sat, 15 Feb 2020 04:26:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=JkAfwVZbNWHGdpldwRHrZyonVhihXq8lzmcEbXl+TRM=;
        b=tmMyf2WCT8VRZFSetrPsMl49WPojEGlJ7IuZtQ0m3MAMHck5ES/XXkySUFxH8W846S
         FFQW0Ms+WWuF6AvU0mb602nZTu2GeJZ6oekMVC5cEM0XpAn26OMUuD4UwXfy5gOeMq1v
         DTHnb+Tdicc0fWhEf8f7U7DxKNSc0BJsw/tPE4Kx/X6C432HuOnu28CLK+Ba0f31TJwJ
         TPxOgGEblAEJHKzOi3PaY9Owq20I4wtmc0OZ9o10HH+FmIvAyblmheBUH56nmStRNKEs
         vefeSiELXw8RXl0+OMv+bBoh1crgWi6dhZv66uq79oqPtFjcGjhfdBCIUVMpJl6m0VL1
         4LHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=JkAfwVZbNWHGdpldwRHrZyonVhihXq8lzmcEbXl+TRM=;
        b=ujJAT/PfR+M9I8EskdnUqJ8LdsVxyWWU0AOVNqZrBKnJY+vJ21w8RmpYOSixXvPTTs
         VU6/6uBiaJi8z/2btwsImiaTgncLWVlubqiCFHXwty+QtwBGsp/0gqBkxq+hHjcpWCdb
         E0qM8nEIhubBoRyGejNv5xAfaX2gis9XEOihgrKamvntdwbEHspvdfOKfMjUIdyHoW2E
         RHS8lst0um57PiF9pGy1ptj/TW7kN1dNg9s/RN64nDrTXnEiYH/sLlNAzLLWdozXh5Iz
         BeRdVk4qaxBl/vSgcMPYBbjZY4U9DpFkUiDTHor+aYeesvGfC67ZuRLRyk9kU359fWQe
         GDLw==
X-Gm-Message-State: APjAAAUoChnKufJETZnkKReKewIJxYzafjC6CVpyFyTMSNC11TofCPEu
        bGaUeGHeWaI13vABAPygt558Q7Lc
X-Google-Smtp-Source: APXvYqyHm+RQiT8jlUbCe/p2hvXlwSAi6ES08XVVcmyuyHdRdvWOpL3OtBVfSCVnF/sf9BGkB8z6kA==
X-Received: by 2002:aa7:8181:: with SMTP id g1mr8191448pfi.215.1581769570659;
        Sat, 15 Feb 2020 04:26:10 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id x143sm11140881pgx.54.2020.02.15.04.26.08
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 15 Feb 2020 04:26:09 -0800 (PST)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Vadim Pasternak <vadimp@mellanox.com>
Subject: [PATCH 4/8] hwmon: (pmbus/tps53679) Add support for multiple chips IDs
Date:   Sat, 15 Feb 2020 04:25:58 -0800
Message-Id: <20200215122602.14245-4-linux@roeck-us.net>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200215122602.14245-1-linux@roeck-us.net>
References: <20200215122602.14245-1-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Chip specific support will be needed in the driver to be able to
support additional chips of the same series. Add support for it
to the driver.

To simplify adding support for more chips, call identification code
from the probe function. This lets us use a single structure for common
elements of struct pmbus_driver_info, thus reducing code size as support
for more chips is added.

Cc: Vadim Pasternak <vadimp@mellanox.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/pmbus/tps53679.c | 41 +++++++++++++++++++++++++---------
 1 file changed, 31 insertions(+), 10 deletions(-)

diff --git a/drivers/hwmon/pmbus/tps53679.c b/drivers/hwmon/pmbus/tps53679.c
index 9c22e9013dd7..77b2fb06c0d2 100644
--- a/drivers/hwmon/pmbus/tps53679.c
+++ b/drivers/hwmon/pmbus/tps53679.c
@@ -11,8 +11,13 @@
 #include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/of_device.h>
 #include "pmbus.h"
 
+enum chips {
+	tps53679, tps53688,
+};
+
 #define TPS53679_PROT_VR12_5MV		0x01 /* VR12.0 mode, 5-mV DAC */
 #define TPS53679_PROT_VR12_5_10MV	0x02 /* VR12.5 mode, 10-mV DAC */
 #define TPS53679_PROT_VR13_10MV		0x04 /* VR13.0 mode, 10-mV DAC */
@@ -53,47 +58,63 @@ static int tps53679_identify(struct i2c_client *client,
 }
 
 static struct pmbus_driver_info tps53679_info = {
-	.pages = TPS53679_PAGE_NUM,
 	.format[PSC_VOLTAGE_IN] = linear,
 	.format[PSC_VOLTAGE_OUT] = vid,
 	.format[PSC_TEMPERATURE] = linear,
 	.format[PSC_CURRENT_OUT] = linear,
 	.format[PSC_POWER] = linear,
-	.func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
+	.func[0] = PMBUS_HAVE_VIN |
+		PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
 		PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
 		PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP |
 		PMBUS_HAVE_POUT,
-	.func[1] = PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
+	.func[1] = PMBUS_HAVE_VIN |
+		PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
 		PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
 		PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP |
 		PMBUS_HAVE_POUT,
-	.identify = tps53679_identify,
 };
 
 static int tps53679_probe(struct i2c_client *client,
 			  const struct i2c_device_id *id)
 {
+	struct device *dev = &client->dev;
 	struct pmbus_driver_info *info;
+	enum chips chip_id;
+
+	if (dev->of_node)
+		chip_id = (enum chips)of_device_get_match_data(dev);
+	else
+		chip_id = id->driver_data;
 
-	info = devm_kmemdup(&client->dev, &tps53679_info, sizeof(*info),
-			    GFP_KERNEL);
+	info = devm_kmemdup(dev, &tps53679_info, sizeof(*info), GFP_KERNEL);
 	if (!info)
 		return -ENOMEM;
 
+	switch (chip_id) {
+	case tps53679:
+	case tps53688:
+		info->pages = TPS53679_PAGE_NUM;
+		info->identify = tps53679_identify;
+		break;
+	default:
+		return -ENODEV;
+	}
+
 	return pmbus_do_probe(client, id, info);
 }
 
 static const struct i2c_device_id tps53679_id[] = {
-	{"tps53679", 0},
-	{"tps53688", 0},
+	{"tps53679", tps53679},
+	{"tps53688", tps53688},
 	{}
 };
 
 MODULE_DEVICE_TABLE(i2c, tps53679_id);
 
 static const struct of_device_id __maybe_unused tps53679_of_match[] = {
-	{.compatible = "ti,tps53679"},
-	{.compatible = "ti,tps53688"},
+	{.compatible = "ti,tps53679", .data = (void *)tps53679},
+	{.compatible = "ti,tps53688", .data = (void *)tps53688},
 	{}
 };
 MODULE_DEVICE_TABLE(of, tps53679_of_match);
-- 
2.17.1

