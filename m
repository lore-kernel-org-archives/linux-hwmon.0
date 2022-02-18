Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2102EC433EF
	for <linux-hwmon@archiver.kernel.org>; Fri, 18 Feb 2022 09:06:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232297AbiBRJHE (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 18 Feb 2022 04:07:04 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:48842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230301AbiBRJHD (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 18 Feb 2022 04:07:03 -0500
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 019195C674;
        Fri, 18 Feb 2022 01:06:45 -0800 (PST)
Received: by mail-ej1-x631.google.com with SMTP id a23so13466439eju.3;
        Fri, 18 Feb 2022 01:06:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JXfkjLKc2/jzha3K+51cfOAN1nyWSR/pkf5HEd1BF/M=;
        b=DzI6WD/b7UuXeXmiGC6zc56VDhJs8YyiRdoLAk/8l7hsiF+7I65oYjwjdi0Q3kOhkJ
         JT7da+t/FGTEeXtrNUCuREmeF1vyibKqK1cknDuCkzlsXc8BDLl7z424BQVATXY9oh+D
         b5kvDxQ5vicVrrex3l8Gs5BsyL0yF9IkLZV1ZzgF9jjSvk5IyDaU0axf8LE6bV9NrUpb
         FGLWqLVJwUd22jrs8vqnSYCgcWvy0OoJRXJ4EwDcUNEHs5ZVPNJLSUy5gtuH9Iu36rJ9
         h2q2/RWkZt2k0lZ7H/o3NnAWHpVC4fhhlxoYYI0JgCWRBFZ3/iLtCnnnUjLIjRtzmbAB
         QAmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JXfkjLKc2/jzha3K+51cfOAN1nyWSR/pkf5HEd1BF/M=;
        b=73GQrzaGDOIur7kLgZ+t0l9yUAS9RWGGuey8UCZpOPEM1FfyPhRKv3o5cyQyi4LPBM
         ZPkUTXg6c9s+Whyyw7w/0PEjD+HUI+lYIyb/r5r5E8VdHw5W4ccsipNaAjK6EYRMTsIK
         18RO4/A/5fWy60oraeULcpId0zYPUAJJiqddlVR6fsSGF/8TQN4bfDnHjo5yB9i0EiHH
         Gn79CvgKs0llXzMMNs7mvaOD8vlye6X1kk1pdyJTZQQ58l7biaTNN1GNXWrJ0ZXmUnmI
         pgQP8oykZOJ8REpP5SiS/tn1NSNkApe4Zp2HtoocQ00f2TibDj2sJFARlNKro9ZYFXiF
         TInw==
X-Gm-Message-State: AOAM531vE9bNOD1XfLBownLxC7vyyh4uMz/l7f8a3Lt1PwH5vqs3slZh
        ihLOJKLfNO3L9APZD7MFHAxaKlsiCXI=
X-Google-Smtp-Source: ABdhPJzxpkSB01VgMzTtx/2/BMOk81lAJ7YigafV+DQAvEbx9Pu7z5/8gfANLhqYbFMAJIhUPR8YkQ==
X-Received: by 2002:a17:906:3283:b0:6ce:78f9:fafd with SMTP id 3-20020a170906328300b006ce78f9fafdmr5581393ejw.534.1645175204363;
        Fri, 18 Feb 2022 01:06:44 -0800 (PST)
Received: from debian64.daheim (p5b0d7a77.dip0.t-ipconnect.de. [91.13.122.119])
        by smtp.gmail.com with ESMTPSA id p24sm2075594edi.78.2022.02.18.01.06.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Feb 2022 01:06:43 -0800 (PST)
Received: from chuck by debian64.daheim with local (Exim 4.95)
        (envelope-from <chunkeey@gmail.com>)
        id 1nKzDv-0004LN-Bj;
        Fri, 18 Feb 2022 10:06:43 +0100
From:   Christian Lamparter <chunkeey@gmail.com>
To:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 2/2] hwmon: (lm70) Add ti,tmp125 support
Date:   Fri, 18 Feb 2022 10:06:43 +0100
Message-Id: <43b19cbd4e7f51e9509e561b02b5d8d0e7079fac.1645175187.git.chunkeey@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <d3538ba9beededfe3a9ad5dab4903a6a01834822.1645175187.git.chunkeey@gmail.com>
References: <d3538ba9beededfe3a9ad5dab4903a6a01834822.1645175187.git.chunkeey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The TMP125 is a 2 degree Celsius accurate Digital
Temperature Sensor with a SPI interface.

The temperature register is a 16-bit, read-only register.
The MSB (Bit 15) is a leading zero and never set. Bits 14
to 5 are the 1+9 temperature data bits in a two's
complement format. Bits 4 to 0 are useless copies of
Bit 5 value and therefore ignored.

This was tested on a Aerohive HiveAP-350.

Bonus: lm70 supports TMP122/TMP124 as well.
I added them to the Kconfig module description.

Signed-off-by: Christian Lamparter <chunkeey@gmail.com>
---
v1 -> v2: - spelling fixes + nicer (IMHO) texts (Roeck)
	  - added entry to Documentation/hwmon/lm70.rst (Roeck)
---
 Documentation/hwmon/lm70.rst |  7 +++++++
 drivers/hwmon/Kconfig        |  4 ++--
 drivers/hwmon/lm70.c         | 16 ++++++++++++++++
 3 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/Documentation/hwmon/lm70.rst b/Documentation/hwmon/lm70.rst
index 6ddc5b67ccb5..11303a7e16a8 100644
--- a/Documentation/hwmon/lm70.rst
+++ b/Documentation/hwmon/lm70.rst
@@ -15,6 +15,10 @@ Supported chips:
 
     Information: https://www.ti.com/product/tmp122
 
+  * Texas Instruments TMP125
+
+    Information: https://www.ti.com/product/tmp125
+
   * National Semiconductor LM71
 
     Datasheet: https://www.ti.com/product/LM71
@@ -53,6 +57,9 @@ The LM74 and TMP121/TMP122/TMP123/TMP124 are very similar; main difference is
 
 The TMP122/TMP124 also feature configurable temperature thresholds.
 
+The TMP125 is less accurate and provides 10-bit temperature data
+with 0.25 degrees Celsius resolution.
+
 The LM71 is also very similar; main difference is 14-bit temperature
 data (0.03125 degrees celsius resolution).
 
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 8df25f1079ba..94a47e70533f 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1208,8 +1208,8 @@ config SENSORS_LM70
 	depends on SPI_MASTER
 	help
 	  If you say yes here you get support for the National Semiconductor
-	  LM70, LM71, LM74 and Texas Instruments TMP121/TMP123 digital tempera-
-	  ture sensor chips.
+	  LM70, LM71, LM74 and Texas Instruments TMP121/TMP123, TMP122/TMP124,
+	  TMP125 digital temperature sensor chips.
 
 	  This driver can also be built as a module. If so, the module
 	  will be called lm70.
diff --git a/drivers/hwmon/lm70.c b/drivers/hwmon/lm70.c
index d2a60de5b8de..c20a749fc7f2 100644
--- a/drivers/hwmon/lm70.c
+++ b/drivers/hwmon/lm70.c
@@ -34,6 +34,7 @@
 #define LM70_CHIP_LM71		2	/* NS LM71 */
 #define LM70_CHIP_LM74		3	/* NS LM74 */
 #define LM70_CHIP_TMP122	4	/* TI TMP122/TMP124 */
+#define LM70_CHIP_TMP125	5	/* TI TMP125 */
 
 struct lm70 {
 	struct spi_device *spi;
@@ -87,6 +88,12 @@ static ssize_t temp1_input_show(struct device *dev,
 	 * LM71:
 	 * 14 bits of 2's complement data, discard LSB 2 bits,
 	 * resolution 0.0312 degrees celsius.
+	 *
+	 * TMP125:
+	 * MSB/D15 is a leading zero. D14 is the sign-bit. This is
+	 * followed by 9 temperature bits (D13..D5) in 2's complement
+	 * data format with a resolution of 0.25 degrees celsius per unit.
+	 * LSB 5 bits (D4..D0) share the same value as D5 and get discarded.
 	 */
 	switch (p_lm70->chip) {
 	case LM70_CHIP_LM70:
@@ -102,6 +109,10 @@ static ssize_t temp1_input_show(struct device *dev,
 	case LM70_CHIP_LM71:
 		val = ((int)raw / 4) * 3125 / 100;
 		break;
+
+	case LM70_CHIP_TMP125:
+		val = (sign_extend32(raw, 14) / 32) * 250;
+		break;
 	}
 
 	status = sprintf(buf, "%d\n", val); /* millidegrees Celsius */
@@ -135,6 +146,10 @@ static const struct of_device_id lm70_of_ids[] = {
 		.compatible = "ti,tmp122",
 		.data = (void *) LM70_CHIP_TMP122,
 	},
+	{
+		.compatible = "ti,tmp125",
+		.data = (void *) LM70_CHIP_TMP125,
+	},
 	{
 		.compatible = "ti,lm71",
 		.data = (void *) LM70_CHIP_LM71,
@@ -184,6 +199,7 @@ static const struct spi_device_id lm70_ids[] = {
 	{ "lm70",   LM70_CHIP_LM70 },
 	{ "tmp121", LM70_CHIP_TMP121 },
 	{ "tmp122", LM70_CHIP_TMP122 },
+	{ "tmp125", LM70_CHIP_TMP125 },
 	{ "lm71",   LM70_CHIP_LM71 },
 	{ "lm74",   LM70_CHIP_LM74 },
 	{ },
-- 
2.35.1

