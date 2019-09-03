Return-Path: <SRS0=jxcE=W6=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53EDCC3A5A2
	for <linux-hwmon@archiver.kernel.org>; Tue,  3 Sep 2019 14:03:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1C9562341F
	for <linux-hwmon@archiver.kernel.org>; Tue,  3 Sep 2019 14:03:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o5HOXBEE"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729053AbfICODM (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 3 Sep 2019 10:03:12 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:43977 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725782AbfICODM (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 3 Sep 2019 10:03:12 -0400
Received: by mail-pf1-f194.google.com with SMTP id d15so1332551pfo.10
        for <linux-hwmon@vger.kernel.org>; Tue, 03 Sep 2019 07:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=Kw8a8bqj3P9Hh0PHeKKY0r+G2TwLACh/CwOupCuF5IY=;
        b=o5HOXBEEzNX07vFS5UYTGTQEojOzrgEDgCIdSJTxgDZn3JyYM6mG9DlNUCcHt8Tgq8
         jXNRYuXeZrMBDuamL5cH2x6r84IQZDe1d/tsOA0To3O9/yk4kvpVPgZaD6vPyoVw1B08
         iA96iJt72BN0Ddfbc6cAy6J0qZO6vUFAU0tAObekZeR1RRiMCEeVm0Yf6InD6lMbT/3+
         /1yoC8IbJekxKLtxS9tOrWuFDSACi4/BWiVTuyMVJ9lyDVMs0hQesBTkVvWJ21EVc/GD
         2VtrF4lhv/9xnezNW3k5B6GmMG1mv9tggkWs0HJ+ULtspfVYWSkznEBm/bPXP7iRG+dd
         c1NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=Kw8a8bqj3P9Hh0PHeKKY0r+G2TwLACh/CwOupCuF5IY=;
        b=PZpkgHZj3NHas3WkXgbYtKePwg+GLJUr87gMK9DYTP1lPiLD3dx7jgXw8117QM+gle
         bdaTGfip3q4XdOP1jUylaSutaVdscuZ5ufK3pHyGi9OxuoEs7fJyQ+BdXuTj6sQMDswB
         nmiabLfAhXSkhYut9H0NFiqnWOII1eAj5lPJ+QRpQzr/qvtTBEzgYE3mKG5wkmabTOFz
         5smo69Ba5R7w9qiWNgBskzIz1WMuIvrRhvOICoO8avd38cCH1uQnw0+nF6bjPoXA3FMO
         4Y8ehyZMlxlLb5e6jwiokBdui0A+Cb+IVzXnhXYLZyiYBLjHddCagHDW8aj4ggcAiKFa
         h/vg==
X-Gm-Message-State: APjAAAWU6GzvY4jK9Cxk/vOBKpAn7YHLgHYrdT/gVllgnhGBll9fsV2u
        8ZsRvKZE8OteTb6vrnG2mgZCFvWt
X-Google-Smtp-Source: APXvYqxha8kZWzny3uGB5bmMXxcch4FEz4ENVoehKSm957Dzs03WIBxnDq5AjACRv9b+wCNdPPgDMg==
X-Received: by 2002:a17:90a:350:: with SMTP id 16mr177081pjf.110.1567519391292;
        Tue, 03 Sep 2019 07:03:11 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id n10sm17133829pgv.67.2019.09.03.07.03.10
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Sep 2019 07:03:10 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Iker Perez del Palomar <iker.perez@codethink.co.uk>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 1/4] hwmon: (lm75) Support configuring the sample time for various chips
Date:   Tue,  3 Sep 2019 07:03:06 -0700
Message-Id: <1567519389-16561-1-git-send-email-linux@roeck-us.net>
X-Mailer: git-send-email 2.7.4
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The conversion (sample) time is configurable for several chips supported
by the lm75 driver. With the necessary infrastructure in place, enable
this support for all chips using the configuration register for this
purpose.

DS1775:
	Conversion time:	187.5, 375, 750, 1500 ms
	Sensor resolution: 	9, 10, 11, 12 bit
DS75, STDS75:
	Conversion time:	150, 300, 600, 1200 ms
	Sensor resolution: 	9, 10, 11, 12 bit
DS7505:
	Conversion time:	25, 50, 100, 200 ms
	Sensor resolution: 	9, 10, 11, 12 bit
MCP980[0123]:
	Conversion time:	75, 150, 300, 600 ms
	Sensor resolution: 	9, 10, 11, 12 bit
TMP100, TMP101:
	Conversion time:	75, 150, 300, 600 ms
	Sensor resolution: 	9, 10, 11, 12 bit
TMP75, TMP105, TMP175, TMP275:
	Conversion time:	38, 75, 150, 300 ms
	Sensor resolution: 	9, 10, 11, 12 bit

While doing this, it became obvious that the masks and values to set
the converion (sample) time is similar for all those chips, and that
other chips with configurable sample times will need separate code anyway.
For that reason, replace the sample_set_masks and sample_clr_mask
configuration parameters with a single array and with a constant.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/lm75.c | 83 +++++++++++++++++++++++++++++++++++-----------------
 1 file changed, 56 insertions(+), 27 deletions(-)

diff --git a/drivers/hwmon/lm75.c b/drivers/hwmon/lm75.c
index f68ef9d451ab..6474b8f21981 100644
--- a/drivers/hwmon/lm75.c
+++ b/drivers/hwmon/lm75.c
@@ -73,10 +73,6 @@ enum lm75_type {		/* keep sorted in alphabetical order */
  * @sample_times:	All the possible sample times to be set. Mandatory if
  *			num_sample_times is larger than 1. If set, number of
  *			entries must match num_sample_times.
- * @sample_set_masks:	All the set_masks for the possible sample times.
- *			Mandatory if num_sample_times is larger than 1.
- *			If set, number of entries must match num_sample_times.
- * @sample_clr_mask:	Clear mask used to set the sample time.
  */
 
 struct lm75_params {
@@ -88,8 +84,6 @@ struct lm75_params {
 	unsigned int		default_sample_time;
 	u8			num_sample_times;
 	const unsigned int	*sample_times;
-	const u8		*sample_set_masks;
-	u8			sample_clr_mask;
 };
 
 /* Addresses scanned */
@@ -115,6 +109,11 @@ struct lm75_data {
 };
 
 /*-----------------------------------------------------------------------*/
+
+static const u8 lm75_sample_set_masks[] = { 0 << 5, 1 << 5, 2 << 5, 3 << 5 };
+
+#define LM75_SAMPLE_CLEAR_MASK	(3 << 5)
+
 /* The structure below stores the configuration values of the supported devices.
  * In case of being supported multiple configurations, the default one must
  * always be the first element of the array
@@ -129,19 +128,28 @@ static const struct lm75_params device_params[] = {
 		.clr_mask = 3 << 5,
 		.set_mask = 2 << 5,	/* 11-bit mode */
 		.default_resolution = 11,
-		.default_sample_time = MSEC_PER_SEC,
+		.default_sample_time = 750,
+		.num_sample_times = 4,
+		.sample_times = (unsigned int []){ 188, 375, 750, 1500 },
+		.resolutions = (u8 []) {9, 10, 11, 12 },
 	},
 	[ds75] = {
 		.clr_mask = 3 << 5,
 		.set_mask = 2 << 5,	/* 11-bit mode */
 		.default_resolution = 11,
-		.default_sample_time = MSEC_PER_SEC,
+		.default_sample_time = 600,
+		.num_sample_times = 4,
+		.sample_times = (unsigned int []){ 150, 300, 600, 1200 },
+		.resolutions = (u8 []) {9, 10, 11, 12 },
 	},
 	[stds75] = {
 		.clr_mask = 3 << 5,
 		.set_mask = 2 << 5,	/* 11-bit mode */
 		.default_resolution = 11,
-		.default_sample_time = MSEC_PER_SEC,
+		.default_sample_time = 600,
+		.num_sample_times = 4,
+		.sample_times = (unsigned int []){ 150, 300, 600, 1200 },
+		.resolutions = (u8 []) {9, 10, 11, 12 },
 	},
 	[stlm75] = {
 		.default_resolution = 9,
@@ -150,7 +158,10 @@ static const struct lm75_params device_params[] = {
 	[ds7505] = {
 		.set_mask = 3 << 5,	/* 12-bit mode*/
 		.default_resolution = 12,
-		.default_sample_time = MSEC_PER_SEC / 4,
+		.default_sample_time = 200,
+		.num_sample_times = 4,
+		.sample_times = (unsigned int []){ 25, 50, 100, 200 },
+		.resolutions = (u8 []) {9, 10, 11, 12 },
 	},
 	[g751] = {
 		.default_resolution = 9,
@@ -194,56 +205,74 @@ static const struct lm75_params device_params[] = {
 		.clr_mask = 1 << 7,	/* not one-shot mode */
 		.default_resolution = 12,
 		.resolution_limits = 9,
-		.default_sample_time = MSEC_PER_SEC,
+		.default_sample_time = 240,
+		.num_sample_times = 4,
+		.sample_times = (unsigned int []){ 75, 150, 300, 600 },
+		.resolutions = (u8 []) {9, 10, 11, 12 },
 	},
 	[tmp100] = {
 		.set_mask = 3 << 5,	/* 12-bit mode */
 		.clr_mask = 1 << 7,	/* not one-shot mode */
 		.default_resolution = 12,
-		.default_sample_time = MSEC_PER_SEC,
+		.default_sample_time = 320,
+		.num_sample_times = 4,
+		.sample_times = (unsigned int []){ 75, 150, 300, 600 },
+		.resolutions = (u8 []) {9, 10, 11, 12 },
 	},
 	[tmp101] = {
 		.set_mask = 3 << 5,	/* 12-bit mode */
 		.clr_mask = 1 << 7,	/* not one-shot mode */
 		.default_resolution = 12,
-		.default_sample_time = MSEC_PER_SEC,
+		.default_sample_time = 320,
+		.num_sample_times = 4,
+		.sample_times = (unsigned int []){ 75, 150, 300, 600 },
+		.resolutions = (u8 []) {9, 10, 11, 12 },
 	},
-	[tmp112] = {
+	[tmp105] = {
 		.set_mask = 3 << 5,	/* 12-bit mode */
-		.clr_mask = 1 << 7,	/* no one-shot mode*/
+		.clr_mask = 1 << 7,	/* not one-shot mode*/
 		.default_resolution = 12,
-		.default_sample_time = MSEC_PER_SEC / 4,
+		.default_sample_time = 220,
+		.num_sample_times = 4,
+		.sample_times = (unsigned int []){ 38, 75, 150, 300 },
+		.resolutions = (u8 []) {9, 10, 11, 12 },
 	},
-	[tmp105] = {
+	[tmp112] = {
 		.set_mask = 3 << 5,	/* 12-bit mode */
-		.clr_mask = 1 << 7,	/* not one-shot mode*/
+		.clr_mask = 1 << 7,	/* no one-shot mode*/
 		.default_resolution = 12,
-		.default_sample_time = MSEC_PER_SEC / 2,
+		.default_sample_time = MSEC_PER_SEC / 4,
 	},
 	[tmp175] = {
 		.set_mask = 3 << 5,	/* 12-bit mode */
 		.clr_mask = 1 << 7,	/* not one-shot mode*/
 		.default_resolution = 12,
-		.default_sample_time = MSEC_PER_SEC / 2,
+		.default_sample_time = 220,
+		.num_sample_times = 4,
+		.sample_times = (unsigned int []){ 38, 75, 150, 300 },
+		.resolutions = (u8 []) {9, 10, 11, 12 },
 	},
 	[tmp275] = {
 		.set_mask = 3 << 5,	/* 12-bit mode */
 		.clr_mask = 1 << 7,	/* not one-shot mode*/
 		.default_resolution = 12,
-		.default_sample_time = MSEC_PER_SEC / 2,
+		.default_sample_time = 220,
+		.num_sample_times = 4,
+		.sample_times = (unsigned int []){ 38, 75, 150, 300 },
+		.resolutions = (u8 []) {9, 10, 11, 12 },
 	},
 	[tmp75] = {
 		.set_mask = 3 << 5,	/* 12-bit mode */
 		.clr_mask = 1 << 7,	/* not one-shot mode*/
 		.default_resolution = 12,
-		.default_sample_time = MSEC_PER_SEC / 2,
+		.default_sample_time = 220,
+		.num_sample_times = 4,
+		.sample_times = (unsigned int []){ 38, 75, 150, 300 },
+		.resolutions = (u8 []) {9, 10, 11, 12 },
 	},
 	[tmp75b] = { /* not one-shot mode, Conversion rate 37Hz */
 		.clr_mask = 1 << 7 | 3 << 5,
 		.default_resolution = 12,
-		.sample_set_masks = (u8 []){ 0 << 5, 1 << 5, 2 << 5,
-			3 << 5 },
-		.sample_clr_mask = 3 << 5,
 		.default_sample_time = MSEC_PER_SEC / 37,
 		.sample_times = (unsigned int []){ MSEC_PER_SEC / 37,
 			MSEC_PER_SEC / 18,
@@ -371,8 +400,8 @@ static int lm75_write_chip(struct device *dev, u32 attr, long val)
 				     (int)data->params->num_sample_times);
 
 		err = lm75_write_config(data,
-					data->params->sample_set_masks[index],
-					data->params->sample_clr_mask);
+					lm75_sample_set_masks[index],
+					LM75_SAMPLE_CLEAR_MASK);
 		if (err)
 			return err;
 		data->sample_time = data->params->sample_times[index];
-- 
2.7.4

