Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3A35C433EF
	for <linux-hwmon@archiver.kernel.org>; Thu, 17 Feb 2022 16:47:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243422AbiBQQr7 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 17 Feb 2022 11:47:59 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:39140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243206AbiBQQr5 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 17 Feb 2022 11:47:57 -0500
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DF3E17A8E;
        Thu, 17 Feb 2022 08:47:43 -0800 (PST)
Received: by mail-ed1-x52b.google.com with SMTP id c6so7995175edk.12;
        Thu, 17 Feb 2022 08:47:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JmVG8fN6JHcYD1P7T6Tnr/upLnEK3EIPAggfR7KcigQ=;
        b=cpfF66SbnLwMTF3ZqyDpuYti4NXZX9KAd/XvWhP+EMtz/8tEl+cevPqY66C+H0NWAv
         85xy+y73u7phUS9Hnr6lEO7aJcxi+ynMRP/MWzj9SIPn+xQz7Tc33Bk5gp6CPejprHc0
         EQ/Ho1OQDVVw4zDGT+kn+dTWJTchZws8BzbefsdWuQEqpDOHMuP5fnmBQlWJh4nlphx3
         BBxY25tAoG/qdIhmQfeTAKHS0z0eC5s5fInc68kX2sTTsT18g79idLRkvwf4qkSNMnfh
         wcCAb5SQIQBNkB9+IwlCqtDr+Ev933DTvGay5AU859AtUAf1OS6jY+f8EOup9RQgOSSS
         en0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JmVG8fN6JHcYD1P7T6Tnr/upLnEK3EIPAggfR7KcigQ=;
        b=OV0U+OQOZ5pKgRWlSe2no2tvD3EIpFCQG/BVr43DUJG0duyiqo2PXr//jkmgH4Bt2l
         qOMEf/h7rZUMZDMeATH7KmLrBSX9VqY93hu99463U7YPmyoiu7HFlZV4k5zzTIU+emYa
         rmSvdBFpQh2/hzpmWPT066QRWx8SC6xsKAxX7D6UDymsRWWgLD/quytCxtzpsyR/rUTa
         L7IG9UejiTKodvi4ztPs7uWTc52xTF3SEE8UFPeDYaRIiXbON1R0zI8CwF4xGFZkxGri
         7YmUgj33it53JN7YPmCbMLPuwOPyTIzqxpTfEGdVKjTl8ndMC9pt5Q3+9Zb6ag7Kp4Sd
         X8LA==
X-Gm-Message-State: AOAM533fE/BTW4NGWn4nFgZzTqpKOjQe+HnD7njKu0N1k7ybEUi9RpCU
        hUereJQp8oZEKGgxfwA2evuGG5NSTdk=
X-Google-Smtp-Source: ABdhPJxtsvR4lTia7mAxNFjkA1cB4jvmpRpZ8nko/mgaQlwNFSDBmp7sixrjehkjY64hb13aSn3Vag==
X-Received: by 2002:a05:6402:845:b0:412:ad14:863e with SMTP id b5-20020a056402084500b00412ad14863emr2306359edz.380.1645116461484;
        Thu, 17 Feb 2022 08:47:41 -0800 (PST)
Received: from debian64.daheim (pd9e29561.dip0.t-ipconnect.de. [217.226.149.97])
        by smtp.gmail.com with ESMTPSA id v12sm3536274edr.8.2022.02.17.08.47.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Feb 2022 08:47:41 -0800 (PST)
Received: from chuck by debian64.daheim with local (Exim 4.95)
        (envelope-from <chunkeey@gmail.com>)
        id 1nKjwS-001hyy-QW;
        Thu, 17 Feb 2022 17:47:40 +0100
From:   Christian Lamparter <chunkeey@gmail.com>
To:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v1 2/2] hwmon: (lm70) Add ti,tmp125 support
Date:   Thu, 17 Feb 2022 17:47:40 +0100
Message-Id: <2cf86380c491fd9972b1931498fcdb9d1a6a1937.1645116431.git.chunkeey@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <524e85e640a4fccdf68b0a1c18b516378a581d35.1645116431.git.chunkeey@gmail.com>
References: <524e85e640a4fccdf68b0a1c18b516378a581d35.1645116431.git.chunkeey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The TMP125 is a 2 degree Celsius accurate Digital
Temperature Sensor with a SPI interface.

The temperature register is a 16-bit, read-only register.
The MSB (Bit 15) is a leading zero and never set. Bits 14
to 5 are the 1+9 temperature data bits in a signed two's
complement format. Bits 4 to 0 are mirrors of Bit 5 and
therefore ignored.

This was tested on a Aerohive HiveAP-350.

Bonus: lm70 supports TMP122/TMP124 as well. So, I
added them to the Kconfig module description as well.

Signed-off-by: Christian Lamparter <chunkeey@gmail.com>
---

Datasheet: (Link)
<https://www.ti.com/lit/ds/symlink/tmp125.pdf>

I'm not sure if it's "Ok" to add the TMP125 to this lm70.
It seems like it, especially since the TMP124 and friends
are supported by this driver.
---
 drivers/hwmon/Kconfig |  4 ++--
 drivers/hwmon/lm70.c  | 15 +++++++++++++++
 2 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 8df25f1079ba..5cdf38004fae 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1208,8 +1208,8 @@ config SENSORS_LM70
 	depends on SPI_MASTER
 	help
 	  If you say yes here you get support for the National Semiconductor
-	  LM70, LM71, LM74 and Texas Instruments TMP121/TMP123 digital tempera-
-	  ture sensor chips.
+	  LM70, LM71, LM74 and Texas Instruments TMP121/TMP123, TMP122/TMP124
+	  and TMP125 digital temperature sensor chips.
 
 	  This driver can also be built as a module. If so, the module
 	  will be called lm70.
diff --git a/drivers/hwmon/lm70.c b/drivers/hwmon/lm70.c
index d2a60de5b8de..4202e4e03584 100644
--- a/drivers/hwmon/lm70.c
+++ b/drivers/hwmon/lm70.c
@@ -34,6 +34,7 @@
 #define LM70_CHIP_LM71		2	/* NS LM71 */
 #define LM70_CHIP_LM74		3	/* NS LM74 */
 #define LM70_CHIP_TMP122	4	/* TI TMP122/TMP124 */
+#define LM70_CHIP_TMP125	5	/* TI TMP125 */
 
 struct lm70 {
 	struct spi_device *spi;
@@ -87,6 +88,11 @@ static ssize_t temp1_input_show(struct device *dev,
 	 * LM71:
 	 * 14 bits of 2's complement data, discard LSB 2 bits,
 	 * resolution 0.0312 degrees celsius.
+	 *
+	 * TMP125:
+	 * MSB/D15 is a leading zero. D14 is the sign-bit followed by
+	 * 9 temperature bits (D13..D5) of 2's complement data,
+	 * discard LSB 5 bits (same as D5), resolution 0.25 degress celsius.
 	 */
 	switch (p_lm70->chip) {
 	case LM70_CHIP_LM70:
@@ -102,6 +108,10 @@ static ssize_t temp1_input_show(struct device *dev,
 	case LM70_CHIP_LM71:
 		val = ((int)raw / 4) * 3125 / 100;
 		break;
+
+	case LM70_CHIP_TMP125:
+		val = sign_extend32(raw, 14) / 32 * 250;
+		break;
 	}
 
 	status = sprintf(buf, "%d\n", val); /* millidegrees Celsius */
@@ -135,6 +145,10 @@ static const struct of_device_id lm70_of_ids[] = {
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
@@ -184,6 +198,7 @@ static const struct spi_device_id lm70_ids[] = {
 	{ "lm70",   LM70_CHIP_LM70 },
 	{ "tmp121", LM70_CHIP_TMP121 },
 	{ "tmp122", LM70_CHIP_TMP122 },
+	{ "tmp125", LM70_CHIP_TMP125 },
 	{ "lm71",   LM70_CHIP_LM71 },
 	{ "lm74",   LM70_CHIP_LM74 },
 	{ },
-- 
2.35.1

