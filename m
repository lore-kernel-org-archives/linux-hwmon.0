Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49C32C77B60
	for <linux-hwmon@archiver.kernel.org>; Sun, 30 Apr 2023 04:50:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230254AbjD3Eu5 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 30 Apr 2023 00:50:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229452AbjD3Eu4 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 30 Apr 2023 00:50:56 -0400
Received: from ipmail03.adl6.internode.on.net (ipmail03.adl6.internode.on.net [150.101.137.143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id C909E1BC2
        for <linux-hwmon@vger.kernel.org>; Sat, 29 Apr 2023 21:50:52 -0700 (PDT)
IronPort-SDR: 644df3a9_/HCrqVMiQaxatgI1eTyRWSXa+Wl/TCrBVtLdAfuSuKtLiJo
 xzoj7qjYJ3RnduoNH70/PC2Gfv/dUI/dpUADMjg==
X-SMTP-MATCH: 0
X-IPAS-Result: =?us-ascii?q?A2AFAwDc8k1kjPQc8jxaHQEBAQEJARIBBQUBSYFGgi6CT?=
 =?us-ascii?q?7VlDwEPAQFEBAEBhQaFQiY4EwECBAEBAQEDAgMBAQEBAQEDAQEGAQEBAQEBB?=
 =?us-ascii?q?gQUAQEBAUBFhWgNhgYrCwENAQE3ASiBFQESgn6CXa90M4EBgggBAQaCZJpqg?=
 =?us-ascii?q?V4JgUGMDoEWgzeBPD+BToQPb4sGlzSBM3SBJz9vgQQCCQIRa4EQCGiBc0ACD?=
 =?us-ascii?q?WQLC22BRIMUBAIUQgwUXQJrGwYIFQEYAwcHAgFpAwkDBwVJQAMLGA0WOhEsN?=
 =?us-ascii?q?RQfS4ELGGMEggIHJSSYOXMBgQ3GdYQIgVmfE02BRqd9l3sgoyyELQIKBxaBe?=
 =?us-ascii?q?oF+TR8ZgyJPAxkPjiAZghORUWM9AgcLAQEDCYtFAQE?=
IronPort-PHdr: A9a23:UaKCiRwAGHOTJknXCzPpngc9DxPP853+PxIOrJE9gq1Adb6vuZnnI
 Qre6bNkkQyBVJ/QvvRDjeeeqKX8QSoa7JOGrH1HcYQZWRMJ05dJlgUsUsLZVh2pday4ZCZjR
 JZJXwc6l0w=
IronPort-Data: A9a23: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
 8QrkpEq0sNdHrkyLQrL2sGGvA==
IronPort-HdrOrdr: A9a23:m4ZYyKFB+JjgRbRopLqExseALOsnbusQ8zAXPiBKIyC9vPb4qy
 nIpoV96feX4Ax9ZJhEo7y90ca7MBDhHPJOjrX5Xo3SODUOxlHYTr2KhLGKq1bd8kbFltK1u5
 0PT0DwZeeAa2SS9fyKhTVQC+xQuuVv7prY/ts2EE0dND2Duslbnn9ENjo=
X-Talos-CUID: 9a23:kDlBdWBsZEP9klX6EyBjs3MzCvEvS3PAkTT6Hl2BEWs5d7LAHA==
X-Talos-MUID: 9a23:V0JQrwukhZ9mb7Zfkc2nvBJ4Geg3/PyXLVFdtcU6uPiYEwAgJGLI
X-IronPort-Anti-Spam-Filtered: true
Received: from 60-242-28-244.static.tpgi.com.au (HELO bits.crawford.emu.id.au) ([60.242.28.244])
  by ipmail03.adl6.internode.on.net with ESMTP; 30 Apr 2023 14:20:51 +0930
Received: from agc.crawford.emu.id.au (agc.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc07])
        (authenticated bits=0)
        by bits.crawford.emu.id.au (8.17.1/8.17.1) with ESMTPSA id 33U4oc6d3543223
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
        Sun, 30 Apr 2023 14:50:45 +1000
Authentication-Results: bits.crawford.emu.id.au; arc=none smtp.remote-ip=fdd2:7aad:d478:1::cb10:cc07
DKIM-Filter: OpenDKIM Filter v2.11.0 bits.crawford.emu.id.au 33U4oc6d3543223
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crawford.emu.id.au;
        s=s1; t=1682830246; bh=y4HPvFNGrpCOjmPToPmFB6j+nfhbtXFh1LYkPijgSS8=;
        h=From:To:Cc:Subject:Date:From;
        b=iCaaQF3CvjKMN3q9KDoKHzfEJIKGxSA4q3hfUCkmWwdhel9OB4baiXQJ5Q8VcDWfd
         8eIcC70PinAJl+D+7BLDzmIOWA/MQ1ZvKtZjabd/312Ez9VAoxndAUZUf2XFVTwuDT
         Y+3mJ4X8Ss99RKhKqAZ/KhBeXTH7E/MNDsxZCdwTxEKxiu0MMbIfOOfwOk/32nC8GO
         lGidr/JEZ5ZZbOJqY0o65+jE3taEggxVXW67gEJrUn0HhTuglkem8lWS2lfR2uALOA
         0S7OWJP2ToNSN39dDWfk2eA+Mj3DVpk1wtoB6Mxihp7QE8SBIyyizovRESbuzpeEBL
         n/hBAojJhnqZw==
From:   Frank Crawford <frank@crawford.emu.id.au>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org,
        Frank Crawford <frank@crawford.emu.id.au>
Subject: [PATCH v1] hwmon: (it87) Allow for chips with only 4 temp sensors
Date:   Sun, 30 Apr 2023 14:50:32 +1000
Message-Id: <20230430045032.1723288-1-frank@crawford.emu.id.au>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4 (bits.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc01]); Sun, 30 Apr 2023 14:50:46 +1000 (AEST)
X-Virus-Scanned: clamav-milter 0.103.8 at bits.crawford.emu.id.au
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Some chips are known to only have 4 temperature sensors and there is no
requirement to test for more.  Currently only the IT8622E fits this
category.

Signed-off-by: Frank Crawford <frank@crawford.emu.id.au>
---
 drivers/hwmon/it87.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
index 96c17660ff0f..4c3641d28a6a 100644
--- a/drivers/hwmon/it87.c
+++ b/drivers/hwmon/it87.c
@@ -319,6 +319,7 @@ struct it87_devices {
 #define FEAT_CONF_NOEXIT	BIT(19)	/* Chip should not exit conf mode */
 #define FEAT_FOUR_FANS		BIT(20)	/* Supports four fans */
 #define FEAT_FOUR_PWM		BIT(21)	/* Supports four fan controls */
+#define FEAT_FOUR_TEMP		BIT(22)
 
 static const struct it87_devices it87_devices[] = {
 	[it87] = {
@@ -475,7 +476,7 @@ static const struct it87_devices it87_devices[] = {
 		.features = FEAT_NEWER_AUTOPWM | FEAT_12MV_ADC | FEAT_16BIT_FANS
 		  | FEAT_TEMP_OFFSET | FEAT_TEMP_PECI | FEAT_FIVE_FANS
 		  | FEAT_FIVE_PWM | FEAT_IN7_INTERNAL | FEAT_PWM_FREQ2
-		  | FEAT_AVCC3 | FEAT_VIN3_5V,
+		  | FEAT_AVCC3 | FEAT_VIN3_5V | FEAT_FOUR_TEMP,
 		.peci_mask = 0x07,
 		.smbus_bitmap = BIT(1) | BIT(2),
 	},
@@ -527,6 +528,7 @@ static const struct it87_devices it87_devices[] = {
 						     FEAT_SIX_PWM))
 #define has_six_pwm(data)	((data)->features & FEAT_SIX_PWM)
 #define has_pwm_freq2(data)	((data)->features & FEAT_PWM_FREQ2)
+#define has_four_temp(data)	((data)->features & FEAT_FOUR_TEMP)
 #define has_six_temp(data)	((data)->features & FEAT_SIX_TEMP)
 #define has_vin3_5v(data)	((data)->features & FEAT_VIN3_5V)
 #define has_conf_noexit(data)	((data)->features & FEAT_CONF_NOEXIT)
@@ -3393,7 +3395,9 @@ static int it87_probe(struct platform_device *pdev)
 	data->need_in7_reroute = sio_data->need_in7_reroute;
 	data->has_in = 0x3ff & ~sio_data->skip_in;
 
-	if (has_six_temp(data)) {
+	if (has_four_temp(data)) {
+		data->has_temp |= BIT(3);
+	} else if (has_six_temp(data)) {
 		u8 reg = it87_read_value(data, IT87_REG_TEMP456_ENABLE);
 
 		/* Check for additional temperature sensors */
-- 
2.40.0

