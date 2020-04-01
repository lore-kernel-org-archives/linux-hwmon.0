Return-Path: <SRS0=B4Vt=5R=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84153C43331
	for <linux-hwmon@archiver.kernel.org>; Wed,  1 Apr 2020 16:54:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0F1A7206E9
	for <linux-hwmon@archiver.kernel.org>; Wed,  1 Apr 2020 16:54:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rrJPEl/P"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732974AbgDAQyZ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 1 Apr 2020 12:54:25 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:35158 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387987AbgDAQyY (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 1 Apr 2020 12:54:24 -0400
Received: by mail-pf1-f196.google.com with SMTP id a13so228866pfa.2
        for <linux-hwmon@vger.kernel.org>; Wed, 01 Apr 2020 09:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=ZWA9XtWy72yOStFxF6i3KloqxD24/9884mUEPI5vYTk=;
        b=rrJPEl/Po71XSMvloSXR7THlFeXJ2Qcc2kohXz8hCqsGp5yyojNLgfxGqs0GguZ/Yj
         4cphWVvADDjBsmnLqUemT6opRdReMpJSxd/hJ2sKNpCFFZRM/KfdvFgsM0J+d+XDoTRb
         E632kH4WH7+BB7Y6EIyvZjU8exOYRr4uon1Ac/JF0762Q0/oXYaGarsMFEgp5aiYflcg
         syFoyu6EyhZLsfwCp0QO6VntIfQTUOzTQHoZK5YYz0syjc55nCeL/Tn5ge3z73VQrXJa
         DCJagQRdt2BGb1vNRX8FH+b4rLfor0uq2Q+N6Msg03+oSaJQ5D4JVTmeDq+ibHR1jlK5
         zgXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=ZWA9XtWy72yOStFxF6i3KloqxD24/9884mUEPI5vYTk=;
        b=I5zMpEhLZfqKN0NZHXpWBB0ybtMQrsFYXgV5+Haq5aP5lVmkqB1F4VTZypo504H1VI
         TyGzOGpc7TqCQJ5WBOcgeAojaLFIQ0OHQ8+DD7C+CNUbNtJtDStk3cUHi9ibnz64PcPo
         0eq9olT3P85zFyyTQcJKH6PdlzCTMiIe8KkyeJW3JsHJBmURujbTzTD45+qu1l1qn7Uj
         01t5GCxQFPnUVnxu5j5w7ZNrujuoRcg/M1cUstJZVEUCzrZSEmIuV6lyN7tU0IXq6+Wa
         rvM8U5USIK3HPCWFlN46J8RfIpNnddPEuGIbTct+gEtk8Soof5+oHF1h4D66I3BAtoHi
         TgAQ==
X-Gm-Message-State: ANhLgQ2ISYJ6APOT/HJz3lzf9IZgFiy0o3TuWeD88uVGDtw9SJPu1cdC
        ld+lrV9TAENAnt8iNc+ucqzEX28S
X-Google-Smtp-Source: ADFU+vsg1eEHf+3VrJphbaRUQqWK/IOFO9OrhmfyhxZGNjv9ftRk1scpHgAMPehp8M+l+mKj1QtmiA==
X-Received: by 2002:aa7:9af7:: with SMTP id y23mr25509240pfp.1.1585760062615;
        Wed, 01 Apr 2020 09:54:22 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id h71sm1739903pge.32.2020.04.01.09.54.21
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 Apr 2020 09:54:22 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Grant Peltier <grantpeltier93@gmail.com>
Subject: [PATCH] hwmon: (pmbus/isl68137) Fix up chip IDs
Date:   Wed,  1 Apr 2020 09:54:20 -0700
Message-Id: <20200401165420.4603-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.17.1
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

I2C chip IDs need to reflect chip names, not chip functionality.

Fixes: f621d61fd59f ("hwmon: (pmbus) add support for 2nd Gen Renesas digital multiphase")
Cc: Grant Peltier <grantpeltier93@gmail.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 Documentation/hwmon/isl68137.rst | 76 +++++++++++++-------------
 drivers/hwmon/pmbus/isl68137.c   | 92 +++++++++++++++++++++++++++++---
 2 files changed, 123 insertions(+), 45 deletions(-)

diff --git a/Documentation/hwmon/isl68137.rst b/Documentation/hwmon/isl68137.rst
index cc4b61447b63..0e71b22047f8 100644
--- a/Documentation/hwmon/isl68137.rst
+++ b/Documentation/hwmon/isl68137.rst
@@ -16,7 +16,7 @@ Supported chips:
 
   * Renesas ISL68220
 
-    Prefix: 'raa_dmpvr2_2rail'
+    Prefix: 'isl68220'
 
     Addresses scanned: -
 
@@ -26,7 +26,7 @@ Supported chips:
 
   * Renesas ISL68221
 
-    Prefix: 'raa_dmpvr2_3rail'
+    Prefix: 'isl68221'
 
     Addresses scanned: -
 
@@ -36,7 +36,7 @@ Supported chips:
 
   * Renesas ISL68222
 
-    Prefix: 'raa_dmpvr2_2rail'
+    Prefix: 'isl68222'
 
     Addresses scanned: -
 
@@ -46,7 +46,7 @@ Supported chips:
 
   * Renesas ISL68223
 
-    Prefix: 'raa_dmpvr2_2rail'
+    Prefix: 'isl68223'
 
     Addresses scanned: -
 
@@ -56,7 +56,7 @@ Supported chips:
 
   * Renesas ISL68224
 
-    Prefix: 'raa_dmpvr2_3rail'
+    Prefix: 'isl68224'
 
     Addresses scanned: -
 
@@ -66,7 +66,7 @@ Supported chips:
 
   * Renesas ISL68225
 
-    Prefix: 'raa_dmpvr2_2rail'
+    Prefix: 'isl68225'
 
     Addresses scanned: -
 
@@ -76,7 +76,7 @@ Supported chips:
 
   * Renesas ISL68226
 
-    Prefix: 'raa_dmpvr2_3rail'
+    Prefix: 'isl68226'
 
     Addresses scanned: -
 
@@ -86,7 +86,7 @@ Supported chips:
 
   * Renesas ISL68227
 
-    Prefix: 'raa_dmpvr2_1rail'
+    Prefix: 'isl68227'
 
     Addresses scanned: -
 
@@ -96,7 +96,7 @@ Supported chips:
 
   * Renesas ISL68229
 
-    Prefix: 'raa_dmpvr2_3rail'
+    Prefix: 'isl68229'
 
     Addresses scanned: -
 
@@ -106,7 +106,7 @@ Supported chips:
 
   * Renesas ISL68233
 
-    Prefix: 'raa_dmpvr2_2rail'
+    Prefix: 'isl68233'
 
     Addresses scanned: -
 
@@ -116,7 +116,7 @@ Supported chips:
 
   * Renesas ISL68239
 
-    Prefix: 'raa_dmpvr2_3rail'
+    Prefix: 'isl68239'
 
     Addresses scanned: -
 
@@ -126,7 +126,7 @@ Supported chips:
 
   * Renesas ISL69222
 
-    Prefix: 'raa_dmpvr2_2rail'
+    Prefix: 'isl69222'
 
     Addresses scanned: -
 
@@ -136,7 +136,7 @@ Supported chips:
 
   * Renesas ISL69223
 
-    Prefix: 'raa_dmpvr2_3rail'
+    Prefix: 'isl69223'
 
     Addresses scanned: -
 
@@ -146,7 +146,7 @@ Supported chips:
 
   * Renesas ISL69224
 
-    Prefix: 'raa_dmpvr2_2rail'
+    Prefix: 'isl69224'
 
     Addresses scanned: -
 
@@ -156,7 +156,7 @@ Supported chips:
 
   * Renesas ISL69225
 
-    Prefix: 'raa_dmpvr2_2rail'
+    Prefix: 'isl69225'
 
     Addresses scanned: -
 
@@ -166,7 +166,7 @@ Supported chips:
 
   * Renesas ISL69227
 
-    Prefix: 'raa_dmpvr2_3rail'
+    Prefix: 'isl69227'
 
     Addresses scanned: -
 
@@ -176,7 +176,7 @@ Supported chips:
 
   * Renesas ISL69228
 
-    Prefix: 'raa_dmpvr2_3rail'
+    Prefix: 'isl69228'
 
     Addresses scanned: -
 
@@ -186,7 +186,7 @@ Supported chips:
 
   * Renesas ISL69234
 
-    Prefix: 'raa_dmpvr2_2rail'
+    Prefix: 'isl69234'
 
     Addresses scanned: -
 
@@ -196,7 +196,7 @@ Supported chips:
 
   * Renesas ISL69236
 
-    Prefix: 'raa_dmpvr2_2rail'
+    Prefix: 'isl69236'
 
     Addresses scanned: -
 
@@ -206,7 +206,7 @@ Supported chips:
 
   * Renesas ISL69239
 
-    Prefix: 'raa_dmpvr2_3rail'
+    Prefix: 'isl69239'
 
     Addresses scanned: -
 
@@ -216,7 +216,7 @@ Supported chips:
 
   * Renesas ISL69242
 
-    Prefix: 'raa_dmpvr2_2rail'
+    Prefix: 'isl69242'
 
     Addresses scanned: -
 
@@ -226,7 +226,7 @@ Supported chips:
 
   * Renesas ISL69243
 
-    Prefix: 'raa_dmpvr2_1rail'
+    Prefix: 'isl69243'
 
     Addresses scanned: -
 
@@ -236,7 +236,7 @@ Supported chips:
 
   * Renesas ISL69247
 
-    Prefix: 'raa_dmpvr2_2rail'
+    Prefix: 'isl69247'
 
     Addresses scanned: -
 
@@ -246,7 +246,7 @@ Supported chips:
 
   * Renesas ISL69248
 
-    Prefix: 'raa_dmpvr2_2rail'
+    Prefix: 'isl69248'
 
     Addresses scanned: -
 
@@ -256,7 +256,7 @@ Supported chips:
 
   * Renesas ISL69254
 
-    Prefix: 'raa_dmpvr2_2rail'
+    Prefix: 'isl69254'
 
     Addresses scanned: -
 
@@ -266,7 +266,7 @@ Supported chips:
 
   * Renesas ISL69255
 
-    Prefix: 'raa_dmpvr2_2rail'
+    Prefix: 'isl69255'
 
     Addresses scanned: -
 
@@ -276,7 +276,7 @@ Supported chips:
 
   * Renesas ISL69256
 
-    Prefix: 'raa_dmpvr2_2rail'
+    Prefix: 'isl69256'
 
     Addresses scanned: -
 
@@ -286,7 +286,7 @@ Supported chips:
 
   * Renesas ISL69259
 
-    Prefix: 'raa_dmpvr2_2rail'
+    Prefix: 'isl69259'
 
     Addresses scanned: -
 
@@ -296,7 +296,7 @@ Supported chips:
 
   * Renesas ISL69260
 
-    Prefix: 'raa_dmpvr2_2rail'
+    Prefix: 'isl69260'
 
     Addresses scanned: -
 
@@ -306,7 +306,7 @@ Supported chips:
 
   * Renesas ISL69268
 
-    Prefix: 'raa_dmpvr2_2rail'
+    Prefix: 'isl69268'
 
     Addresses scanned: -
 
@@ -316,7 +316,7 @@ Supported chips:
 
   * Renesas ISL69269
 
-    Prefix: 'raa_dmpvr2_3rail'
+    Prefix: 'isl69269'
 
     Addresses scanned: -
 
@@ -326,7 +326,7 @@ Supported chips:
 
   * Renesas ISL69298
 
-    Prefix: 'raa_dmpvr2_2rail'
+    Prefix: 'isl69298'
 
     Addresses scanned: -
 
@@ -336,7 +336,7 @@ Supported chips:
 
   * Renesas RAA228000
 
-    Prefix: 'raa_dmpvr2_hv'
+    Prefix: 'raa228000'
 
     Addresses scanned: -
 
@@ -346,7 +346,7 @@ Supported chips:
 
   * Renesas RAA228004
 
-    Prefix: 'raa_dmpvr2_hv'
+    Prefix: 'raa228004'
 
     Addresses scanned: -
 
@@ -356,7 +356,7 @@ Supported chips:
 
   * Renesas RAA228006
 
-    Prefix: 'raa_dmpvr2_hv'
+    Prefix: 'raa228006'
 
     Addresses scanned: -
 
@@ -366,7 +366,7 @@ Supported chips:
 
   * Renesas RAA228228
 
-    Prefix: 'raa_dmpvr2_2rail'
+    Prefix: 'raa228228'
 
     Addresses scanned: -
 
@@ -376,7 +376,7 @@ Supported chips:
 
   * Renesas RAA229001
 
-    Prefix: 'raa_dmpvr2_2rail'
+    Prefix: 'raa229001'
 
     Addresses scanned: -
 
@@ -386,7 +386,7 @@ Supported chips:
 
   * Renesas RAA229004
 
-    Prefix: 'raa_dmpvr2_2rail'
+    Prefix: 'raa229004'
 
     Addresses scanned: -
 
diff --git a/drivers/hwmon/pmbus/isl68137.c b/drivers/hwmon/pmbus/isl68137.c
index 4d2315208bb5..0c622711ef7e 100644
--- a/drivers/hwmon/pmbus/isl68137.c
+++ b/drivers/hwmon/pmbus/isl68137.c
@@ -21,8 +21,50 @@
 #define ISL68137_VOUT_AVS	0x30
 #define RAA_DMPVR2_READ_VMON	0xc8
 
-enum versions {
+enum chips {
 	isl68137,
+	isl68220,
+	isl68221,
+	isl68222,
+	isl68223,
+	isl68224,
+	isl68225,
+	isl68226,
+	isl68227,
+	isl68229,
+	isl68233,
+	isl68239,
+	isl69222,
+	isl69223,
+	isl69224,
+	isl69225,
+	isl69227,
+	isl69228,
+	isl69234,
+	isl69236,
+	isl69239,
+	isl69242,
+	isl69243,
+	isl69247,
+	isl69248,
+	isl69254,
+	isl69255,
+	isl69256,
+	isl69259,
+	isl69260,
+	isl69268,
+	isl69269,
+	isl69298,
+	raa228000,
+	raa228004,
+	raa228006,
+	raa228228,
+	raa229001,
+	raa229004,
+};
+
+enum variants {
+	raa_dmpvr1_2rail,
 	raa_dmpvr2_1rail,
 	raa_dmpvr2_2rail,
 	raa_dmpvr2_3rail,
@@ -186,7 +228,7 @@ static int isl68137_probe(struct i2c_client *client,
 	memcpy(info, &raa_dmpvr_info, sizeof(*info));
 
 	switch (id->driver_data) {
-	case isl68137:
+	case raa_dmpvr1_2rail:
 		info->pages = 2;
 		info->R[PSC_VOLTAGE_IN] = 3;
 		info->func[0] &= ~PMBUS_HAVE_VMON;
@@ -224,11 +266,47 @@ static int isl68137_probe(struct i2c_client *client,
 }
 
 static const struct i2c_device_id raa_dmpvr_id[] = {
-	{"isl68137", isl68137},
-	{"raa_dmpvr2_1rail", raa_dmpvr2_1rail},
-	{"raa_dmpvr2_2rail", raa_dmpvr2_2rail},
-	{"raa_dmpvr2_3rail", raa_dmpvr2_3rail},
-	{"raa_dmpvr2_hv", raa_dmpvr2_hv},
+	{"isl68137", raa_dmpvr1_2rail},
+	{"isl68220", raa_dmpvr2_2rail},
+	{"isl68221", raa_dmpvr2_3rail},
+	{"isl68222", raa_dmpvr2_2rail},
+	{"isl68223", raa_dmpvr2_2rail},
+	{"isl68224", raa_dmpvr2_3rail},
+	{"isl68225", raa_dmpvr2_2rail},
+	{"isl68226", raa_dmpvr2_3rail},
+	{"isl68227", raa_dmpvr2_1rail},
+	{"isl68229", raa_dmpvr2_3rail},
+	{"isl68233", raa_dmpvr2_2rail},
+	{"isl68239", raa_dmpvr2_3rail},
+
+	{"isl69222", raa_dmpvr2_2rail},
+	{"isl69223", raa_dmpvr2_3rail},
+	{"isl69224", raa_dmpvr2_2rail},
+	{"isl69225", raa_dmpvr2_2rail},
+	{"isl69227", raa_dmpvr2_3rail},
+	{"isl69228", raa_dmpvr2_3rail},
+	{"isl69234", raa_dmpvr2_2rail},
+	{"isl69236", raa_dmpvr2_2rail},
+	{"isl69239", raa_dmpvr2_3rail},
+	{"isl69242", raa_dmpvr2_2rail},
+	{"isl69243", raa_dmpvr2_1rail},
+	{"isl69247", raa_dmpvr2_2rail},
+	{"isl69248", raa_dmpvr2_2rail},
+	{"isl69254", raa_dmpvr2_2rail},
+	{"isl69255", raa_dmpvr2_2rail},
+	{"isl69256", raa_dmpvr2_2rail},
+	{"isl69259", raa_dmpvr2_2rail},
+	{"isl69260", raa_dmpvr2_2rail},
+	{"isl69268", raa_dmpvr2_2rail},
+	{"isl69269", raa_dmpvr2_3rail},
+	{"isl69298", raa_dmpvr2_2rail},
+
+	{"raa228000", raa_dmpvr2_hv},
+	{"raa228004", raa_dmpvr2_hv},
+	{"raa228006", raa_dmpvr2_hv},
+	{"raa228228", raa_dmpvr2_2rail},
+	{"raa229001", raa_dmpvr2_2rail},
+	{"raa229004", raa_dmpvr2_2rail},
 	{}
 };
 
-- 
2.17.1

