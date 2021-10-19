Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F22D8C433F5
	for <linux-hwmon@archiver.kernel.org>; Tue, 19 Oct 2021 14:12:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D5E99611EF
	for <linux-hwmon@archiver.kernel.org>; Tue, 19 Oct 2021 14:12:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229734AbhJSOO5 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 19 Oct 2021 10:14:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229584AbhJSOO5 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 19 Oct 2021 10:14:57 -0400
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94321C06161C
        for <linux-hwmon@vger.kernel.org>; Tue, 19 Oct 2021 07:12:44 -0700 (PDT)
Received: by mail-oi1-x236.google.com with SMTP id r64so5098889oih.8
        for <linux-hwmon@vger.kernel.org>; Tue, 19 Oct 2021 07:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/vY1x2yPBy7QD1ieMGkteAMweAg3HoazC/oqTvnqZWI=;
        b=TSY9BVde1RSOFP3w0DlqZSXZKVENU5rnc6TrpXzwWxc+FgffFeOIqlqCFHUXgc5wvb
         5JKfLiFUPrf1WOFk4FTKn5c0yMCLaY8C/Uq5Ro55YQ1eQnuZvawkJts8N1hHkcEoZ7aC
         kymKyMQ+qNLrfXG37GSQbcAmRvujrtV5UlQFUfV60e7I6CarmlUoF0BQgkIT5qorw1rV
         Xl9jh/ah9h0dXAOac9QOYkbKDfieqLq8N9apwobzAdrl7mrWF6PNBANflQHi7Qt70BWQ
         8pY76UwYD7lsXFJKfJrtumUtFkRXXRvhF01PY4+DiQ9xC2HjeHF7pxdfAaXgR0PKyGt9
         KNNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=/vY1x2yPBy7QD1ieMGkteAMweAg3HoazC/oqTvnqZWI=;
        b=1Myboo4IhGunKaY5JWjwFXon/PaJ2ODjvZtSMSymDBFrmv3mkxKECKdQ/N4acQliG5
         Yk7wgsv11QpnsWy4+qnKJtgu6me1kQY0vBUOV7JudAHNOjr67+Zdg98VkjIWLwsBLJgr
         GQPaO4vPZfSfb0sOKJYYyExyvdtqYBfaQMfABwPbMXVv3haI+dlcMMjZHHX+HQOJEB4M
         w/Df/g7ajayfHmWR5N/SqY3D0CsaSqHpdPBBGa0weK4bVRZTnY9hL0r2CD+jJOeBJTdk
         QLso7lwaAIVJEJXgd1pwhx4a0QkTtKO5XSh5GyuG/t1Ksw8LYM1f0OstBjBJGmPQIoXx
         ErUQ==
X-Gm-Message-State: AOAM531b0xt0b9e8QPnwaszWrl+9Yq1OZ4o2qtX/bWrrPcMiVi/Qk8EJ
        RrRgx8Y7vBKrwmtWN48VZlWVnVb3EIs=
X-Google-Smtp-Source: ABdhPJzBTw4YAhW+zN/CREI97C3DIdnDIjlulEWo7wo5nJ9RXNSc/RDEHqGB6xYI1uSqDK38bC4diA==
X-Received: by 2002:a05:6808:221e:: with SMTP id bd30mr4656318oib.174.1634652763140;
        Tue, 19 Oct 2021 07:12:43 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q9sm1971535otv.48.2021.10.19.07.12.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 07:12:42 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        "David T . Wilson" <david.wilson@nasa.gov>,
        "Andrew F . Davis" <afd@ti.com>
Subject: [PATCH 2/2] hwmon: (tmp401) Drop support for TMP461
Date:   Tue, 19 Oct 2021 07:12:37 -0700
Message-Id: <20211019141237.1144281-2-linux@roeck-us.net>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211019141237.1144281-1-linux@roeck-us.net>
References: <20211019141237.1144281-1-linux@roeck-us.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

TMP461 is almost identical to TMP451, which is already supported by the
LM90 driver. At the same time, unlike other sensors from the TMP401
compatible series, it only supports 8-bit temperature read operations.
Supporting this chip in the tmp401 driver adds unnecessary complexity.
Remove its support from this driver and support the chip with the lm90
driver instead.

Fixes: 24333ac26d01 ("hwmon: (tmp401) use smb word operations instead of 2 smb byte operations")
Reported-by: David T. Wilson <david.wilson@nasa.gov>
Cc: David T. Wilson <david.wilson@nasa.gov>
Cc: Andrew F. Davis <afd@ti.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 Documentation/hwmon/tmp401.rst | 15 +--------------
 drivers/hwmon/Kconfig          |  2 +-
 drivers/hwmon/tmp401.c         | 25 ++-----------------------
 3 files changed, 4 insertions(+), 38 deletions(-)

diff --git a/Documentation/hwmon/tmp401.rst b/Documentation/hwmon/tmp401.rst
index 14bf1fbf4493..3aacf3d3bdf3 100644
--- a/Documentation/hwmon/tmp401.rst
+++ b/Documentation/hwmon/tmp401.rst
@@ -43,12 +43,6 @@ Supported chips:
 
     Datasheet: http://focus.ti.com/docs/prod/folders/print/tmp435.html
 
-  * Texas Instruments TMP461
-
-    Prefix: 'tmp461'
-
-    Datasheet: https://www.ti.com/product/tmp461
-
 
 
 Authors:
@@ -60,7 +54,7 @@ Description
 -----------
 
 This driver implements support for Texas Instruments TMP401, TMP411,
-TMP431, TMP432, TMP435, and TMP461 chips. These chips implement one or two
+TMP431, TMP432, and TMP435 chips. These chips implement one or two
 remote and one local temperature sensors. Temperature is measured in degrees
 Celsius. Resolution of the remote sensor is 0.0625 degree. Local
 sensor resolution can be set to 0.5, 0.25, 0.125 or 0.0625 degree (not
@@ -84,10 +78,3 @@ some additional features.
 
 TMP432 is compatible with TMP401 and TMP431. It supports two external
 temperature sensors.
-
-TMP461 is compatible with TMP401. It supports offset correction
-that is applied to the remote sensor.
-
-* Sensor offset values are temperature values
-
-  Exported via sysfs attribute tempX_offset
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index ccdaeafed0bb..feff41444f05 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1930,7 +1930,7 @@ config SENSORS_TMP401
 	depends on I2C
 	help
 	  If you say yes here you get support for Texas Instruments TMP401,
-	  TMP411, TMP431, TMP432, TMP435, and TMP461 temperature sensor chips.
+	  TMP411, TMP431, TMP432, and TMP435 temperature sensor chips.
 
 	  This driver can also be built as a module. If so, the module
 	  will be called tmp401.
diff --git a/drivers/hwmon/tmp401.c b/drivers/hwmon/tmp401.c
index 9dc210b55e69..cd72755ec8f7 100644
--- a/drivers/hwmon/tmp401.c
+++ b/drivers/hwmon/tmp401.c
@@ -34,7 +34,7 @@
 static const unsigned short normal_i2c[] = { 0x48, 0x49, 0x4a, 0x4c, 0x4d,
 	0x4e, 0x4f, I2C_CLIENT_END };
 
-enum chips { tmp401, tmp411, tmp431, tmp432, tmp435, tmp461 };
+enum chips { tmp401, tmp411, tmp431, tmp432, tmp435 };
 
 /*
  * The TMP401 registers, note some registers have different addresses for
@@ -56,7 +56,6 @@ static const u8 TMP401_TEMP_MSB_READ[7][2] = {
 	{ 0x20, 0x19 },	/* therm (crit) limit */
 	{ 0x30, 0x34 },	/* lowest */
 	{ 0x32, 0x36 },	/* highest */
-	{ 0, 0x11 },	/* offset */
 };
 
 static const u8 TMP401_TEMP_MSB_WRITE[7][2] = {
@@ -66,7 +65,6 @@ static const u8 TMP401_TEMP_MSB_WRITE[7][2] = {
 	{ 0x20, 0x19 },	/* therm (crit) limit */
 	{ 0x30, 0x34 },	/* lowest */
 	{ 0x32, 0x36 },	/* highest */
-	{ 0, 0x11 },	/* offset */
 };
 
 static const u8 TMP432_TEMP_MSB_READ[4][3] = {
@@ -123,7 +121,6 @@ static const struct i2c_device_id tmp401_id[] = {
 	{ "tmp431", tmp431 },
 	{ "tmp432", tmp432 },
 	{ "tmp435", tmp435 },
-	{ "tmp461", tmp461 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, tmp401_id);
@@ -570,21 +567,6 @@ static const struct attribute_group tmp432_group = {
 	.attrs = tmp432_attributes,
 };
 
-/*
- * Additional features of the TMP461 chip.
- * The TMP461 temperature offset for the remote channel.
- */
-static SENSOR_DEVICE_ATTR_2_RW(temp2_offset, temp, 6, 1);
-
-static struct attribute *tmp461_attributes[] = {
-	&sensor_dev_attr_temp2_offset.dev_attr.attr,
-	NULL
-};
-
-static const struct attribute_group tmp461_group = {
-	.attrs = tmp461_attributes,
-};
-
 /*
  * Begin non sysfs callback code (aka Real code)
  */
@@ -686,7 +668,7 @@ static int tmp401_detect(struct i2c_client *client,
 static int tmp401_probe(struct i2c_client *client)
 {
 	static const char * const names[] = {
-		"TMP401", "TMP411", "TMP431", "TMP432", "TMP435", "TMP461"
+		"TMP401", "TMP411", "TMP431", "TMP432", "TMP435"
 	};
 	struct device *dev = &client->dev;
 	struct device *hwmon_dev;
@@ -717,9 +699,6 @@ static int tmp401_probe(struct i2c_client *client)
 	if (data->kind == tmp432)
 		data->groups[groups++] = &tmp432_group;
 
-	if (data->kind == tmp461)
-		data->groups[groups++] = &tmp461_group;
-
 	hwmon_dev = devm_hwmon_device_register_with_groups(dev, client->name,
 							   data, data->groups);
 	if (IS_ERR(hwmon_dev))
-- 
2.33.0

