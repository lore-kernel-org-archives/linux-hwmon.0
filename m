Return-Path: <SRS0=/E4C=TD=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ED02C43219
	for <linux-hwmon@archiver.kernel.org>; Fri,  3 May 2019 16:15:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0786C20651
	for <linux-hwmon@archiver.kernel.org>; Fri,  3 May 2019 16:15:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726789AbfECQPH (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 3 May 2019 12:15:07 -0400
Received: from imap1.codethink.co.uk ([176.9.8.82]:34379 "EHLO
        imap1.codethink.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726495AbfECQPH (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 3 May 2019 12:15:07 -0400
Received: from [167.98.27.226] (helo=ct-lt-765.unassigned)
        by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
        id 1hMaq0-0003gY-OZ; Fri, 03 May 2019 17:15:04 +0100
Received: from ikerpalomar by ct-lt-765.unassigned with local (Exim 4.89)
        (envelope-from <ikerpalomar@ct-lt-765.unassigned>)
        id 1hMaq0-0007kZ-Br; Fri, 03 May 2019 17:15:04 +0100
From:   Iker Perez <iker.perez@codethink.co.uk>
To:     linux-hwmon@vger.kernel.org
Cc:     linux@roeck-us.net, devicetree@vger.kernel.org,
        Iker Perez del Palomar Sustatxa 
        <iker.perez@codethink.co.uk>
Subject: [PATCH v4 1/2] hwmon: (lm75) Add support for TMP75B
Date:   Fri,  3 May 2019 17:15:00 +0100
Message-Id: <20190503161501.29489-2-iker.perez@codethink.co.uk>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190503161501.29489-1-iker.perez@codethink.co.uk>
References: <20190503161501.29489-1-iker.perez@codethink.co.uk>
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Iker Perez del Palomar Sustatxa <iker.perez@codethink.co.uk>

The TMP75B has a different control register, supports 12-bit
resolution and the default conversion rate is 37 Hz.

Signed-off-by: Iker Perez del Palomar Sustatxa <iker.perez@codethink.co.uk>
---
 Documentation/hwmon/lm75 |  7 +++++--
 drivers/hwmon/lm75.c     | 11 +++++++++++
 2 files changed, 16 insertions(+), 2 deletions(-)

Version log:                                                                     
                                                                                 
- v4:                                                                            
  - Correct the sample time to 37 ms.                                            
- v3:                                                                            
  - Bad assignment, missing spaces before and after "=".                          
  - Divide in two lines longer than 80 characters.                               
  - Separate dt-bindings and driver-documentation into different                 
    commits.                                                                     
- V2:                                                                            
  - Delete empty lines.                                                          
  - Restore replaced tabs by spaces

diff --git a/Documentation/hwmon/lm75 b/Documentation/hwmon/lm75
index 010583608f12..0cff924cdbba 100644
--- a/Documentation/hwmon/lm75
+++ b/Documentation/hwmon/lm75
@@ -47,8 +47,10 @@ Supported chips:
     Addresses scanned: none
     Datasheet: Publicly available at the ST website
 	       https://www.st.com/resource/en/datasheet/stlm75.pdf
-  * Texas Instruments TMP100, TMP101, TMP105, TMP112, TMP75, TMP75C, TMP175, TMP275
-    Prefixes: 'tmp100', 'tmp101', 'tmp105', 'tmp112', 'tmp175', 'tmp75', 'tmp75c', 'tmp275'
+  * Texas Instruments TMP100, TMP101, TMP105, TMP112, TMP75, TMP75B, TMP75C,
+                      TMP175, TMP275
+    Prefixes: 'tmp100', 'tmp101', 'tmp105', 'tmp112', 'tmp175', 'tmp75',
+              'tmp75b', 'tmp75c', 'tmp275'
     Addresses scanned: none
     Datasheet: Publicly available at the Texas Instruments website
                http://www.ti.com/product/tmp100
@@ -56,6 +58,7 @@ Supported chips:
                http://www.ti.com/product/tmp105
                http://www.ti.com/product/tmp112
                http://www.ti.com/product/tmp75
+               http://www.ti.com/product/tmp75b
                http://www.ti.com/product/tmp75c
                http://www.ti.com/product/tmp175
                http://www.ti.com/product/tmp275
diff --git a/drivers/hwmon/lm75.c b/drivers/hwmon/lm75.c
index 447af07450f1..5673fa541f16 100644
--- a/drivers/hwmon/lm75.c
+++ b/drivers/hwmon/lm75.c
@@ -59,6 +59,7 @@ enum lm75_type {		/* keep sorted in alphabetical order */
 	tmp175,
 	tmp275,
 	tmp75,
+	tmp75b,
 	tmp75c,
 };
 
@@ -378,6 +379,11 @@ lm75_probe(struct i2c_client *client, const struct i2c_device_id *id)
 		data->resolution = 12;
 		data->sample_time = MSEC_PER_SEC / 2;
 		break;
+	case tmp75b:  /* not one-shot mode, Conversion rate 37Hz */
+		clr_mask |= 1 << 15 | 0x3 << 13;
+		data->resolution = 12;
+		data->sample_time = MSEC_PER_SEC / 37;
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
+		.data = (void *)tmp75b
+	},
+	{
 		.compatible = "ti,tmp75c",
 		.data = (void *)tmp75c
 	},
-- 
2.11.0

