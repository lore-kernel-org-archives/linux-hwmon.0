Return-Path: <SRS0=3WuK=S4=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67111C43218
	for <linux-hwmon@archiver.kernel.org>; Fri, 26 Apr 2019 07:42:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 456E520684
	for <linux-hwmon@archiver.kernel.org>; Fri, 26 Apr 2019 07:42:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726224AbfDZHml (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 26 Apr 2019 03:42:41 -0400
Received: from imap1.codethink.co.uk ([176.9.8.82]:45248 "EHLO
        imap1.codethink.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725923AbfDZHml (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 26 Apr 2019 03:42:41 -0400
Received: from 82-132-229-172.dab.02.net ([82.132.229.172] helo=[192.168.43.217])
        by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
        id 1hJvVF-0002hR-Sa; Fri, 26 Apr 2019 08:42:38 +0100
Subject: [PATCH] hwmon: (lm75) Add support for TMP75B
References: <7082731b-ccd8-d16c-8f10-6f4e550ecd18@codethink.co.uk>
To:     linux-hwmon@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>
From:   Iker Perez del Palomar <iker.perez@codethink.co.uk>
X-Forwarded-Message-Id: <7082731b-ccd8-d16c-8f10-6f4e550ecd18@codethink.co.uk>
Message-ID: <ded895e5-974e-b1e1-937c-f228bc157dbe@codethink.co.uk>
Date:   Fri, 26 Apr 2019 08:42:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <7082731b-ccd8-d16c-8f10-6f4e550ecd18@codethink.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The TMP75B has a different control register, supports 12-bit
resolution and the default conversion rate is 37 Hz.

dt-bindings: hwmon: Add tmp75b to lm75.txt

Signed-off-by: Iker Perez del Palomar Sustatxa <iker.perez@codethink.co.uk>
---
 Documentation/devicetree/bindings/hwmon/lm75.txt |  1 +
 Documentation/hwmon/lm75                         |  5 +++--
 drivers/hwmon/lm75.c                             | 11 +++++++++++
 3 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/hwmon/lm75.txt
b/Documentation/devicetree/bindings/hwmon/lm75.txt
index 12d8cf7cf592..586b5ed70be7 100644
--- a/Documentation/devicetree/bindings/hwmon/lm75.txt
+++ b/Documentation/devicetree/bindings/hwmon/lm75.txt
@@ -25,6 +25,7 @@ Required properties:
 		"ti,tmp175",
 		"ti,tmp275",
 		"ti,tmp75",
+		"ti,tmp75b",
 		"ti,tmp75c",

 - reg: I2C bus address of the device
diff --git a/Documentation/hwmon/lm75 b/Documentation/hwmon/lm75
index 010583608f12..baf052935761 100644
--- a/Documentation/hwmon/lm75
+++ b/Documentation/hwmon/lm75
@@ -47,8 +47,8 @@ Supported chips:
     Addresses scanned: none
     Datasheet: Publicly available at the ST website
 	       https://www.st.com/resource/en/datasheet/stlm75.pdf
-  * Texas Instruments TMP100, TMP101, TMP105, TMP112, TMP75, TMP75C,
TMP175, TMP275
-    Prefixes: 'tmp100', 'tmp101', 'tmp105', 'tmp112', 'tmp175',
'tmp75', 'tmp75c', 'tmp275'
+  * Texas Instruments TMP100, TMP101, TMP105, TMP112, TMP75, TMP75B,
TMP75C, TMP175, TMP275
+    Prefixes: 'tmp100', 'tmp101', 'tmp105', 'tmp112', 'tmp175',
'tmp75', 'tmp75b', 'tmp75c', 'tmp275'
     Addresses scanned: none
     Datasheet: Publicly available at the Texas Instruments website
                http://www.ti.com/product/tmp100
@@ -56,6 +56,7 @@ Supported chips:
                http://www.ti.com/product/tmp105
                http://www.ti.com/product/tmp112
                http://www.ti.com/product/tmp75
+               http://www.ti.com/product/tmp75b
                http://www.ti.com/product/tmp75c
                http://www.ti.com/product/tmp175
                http://www.ti.com/product/tmp275
diff --git a/drivers/hwmon/lm75.c b/drivers/hwmon/lm75.c
index 447af07450f1..5e730788bf5f 100644
--- a/drivers/hwmon/lm75.c
+++ b/drivers/hwmon/lm75.c
@@ -59,6 +59,7 @@ enum lm75_type {		/* keep sorted in alphabetical order */
 	tmp175,
 	tmp275,
 	tmp75,
+	tmp75b,
 	tmp75c,
 };

@@ -378,6 +379,11 @@ lm75_probe(struct i2c_client *client, const struct
i2c_device_id *id)
 		data->resolution = 12;
 		data->sample_time = MSEC_PER_SEC / 2;
 		break;
+	case tmp75b:
+		clr_mask |= 1 << 15;    /* not one-shot mode */
+		data->resolution = 12;
+		data->sample_time = MSEC_PER_SEC / 4;
+		break;
 	case tmp75c:
 		clr_mask |= 1 << 5;		/* not one-shot mode */
 		data->resolution = 12;
@@ -438,6 +444,7 @@ static const struct i2c_device_id lm75_ids[] = {
 	{ "tmp175", tmp175, },
 	{ "tmp275", tmp275, },
 	{ "tmp75", tmp75, },
+	{ "tmp75b", tmp75b, },
 	{ "tmp75c", tmp75c, },
 	{ /* LIST END */ }
 };
@@ -537,6 +544,10 @@ static const struct of_device_id lm75_of_match[] = {
 		.data = (void *)tmp75
 	},
 	{
+		.compatible = "ti,tmp75b",
+		.data=(void *)tmp75b
+	},
+	{
 		.compatible = "ti,tmp75c",
 		.data = (void *)tmp75c
 	},
-- 
2.11.0

-- 
Iker Perez del Palomar, Software Engineer
Codethink Ltd                             35 Dale St, Manchester M1 2HF
http://www.codethink.co.uk/          Manchester, M1 2JW, United Kingdom
We respect your privacy.   See https://www.codethink.co.uk/privacy.html

_______________________________________________
Ts005-internal mailing list
Ts005-internal@lists.codethink.co.uk
https://lists.codethink.co.uk/cgi-bin/mailman/listinfo/ts005-internal
