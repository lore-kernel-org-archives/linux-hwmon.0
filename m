Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A671C77B75
	for <linux-hwmon@archiver.kernel.org>; Sun,  7 May 2023 10:41:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231245AbjEGKlf (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 7 May 2023 06:41:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230225AbjEGKle (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 7 May 2023 06:41:34 -0400
Received: from ipmail03.adl6.internode.on.net (ipmail03.adl6.internode.on.net [150.101.137.143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id AFDB512EA3
        for <linux-hwmon@vger.kernel.org>; Sun,  7 May 2023 03:41:32 -0700 (PDT)
IronPort-SDR: 64578059_XCcq7ru8V+NFWDFOgVVPZg8Ofb3YvmUDVoKGh4Lca0NUG1r
 zo1QGKmIZIstlP+8eXnITDIAWgMqDAoSQgFlsDg==
X-SMTP-MATCH: 0
X-IPAS-Result: =?us-ascii?q?A2CwAABgf1dkjPQc8jxaGwEBAQEBAQEBBQEBARIBAQEDA?=
 =?us-ascii?q?wEBAUmBRoIugk+1Zw8BDwEBRAQBAYUGAoVGJjgTAQIEAQEBAQMCAwEBAQEBA?=
 =?us-ascii?q?QMBAQYBAQEBAQEGBBQBAQEBQEWFaA2GBQIBAzIBDQEBNwEPGThXBgESgn6CX?=
 =?us-ascii?q?axEgQGCCAEBBoJkmmqBXgmBQYwOgRaDN3pCP4FOgRWDaYsGmRiBMHSBJz9tg?=
 =?us-ascii?q?QQCCQIRaYEQCGiBdEACDWQLC2yBQIMLBAIRQgwUXQJrGggSARMDBwcCAYEYE?=
 =?us-ascii?q?DoHBD4yBwkfaAMJAwcFSUADCxgNFjcRLDUUHy0ggQkYYwSCBQYBJSSbCYEOg?=
 =?us-ascii?q?mmSeY54oi+ECYFanxdNgUaoAy6XVCCjNIQtAgoHFoF6gX5NHxmDIk8DGQ+OI?=
 =?us-ascii?q?BmCE5FRYz0CBwsBAQMJi0UBAQ?=
IronPort-PHdr: A9a23:oGfNJhK0ZSgXcuLFHtmcuVEyDhhOgF28FgQU9oFhgKhHbaqk5ZikM
 UnCo/RhylbUDs3S8fkRje3Qvuj7XHAYp4yMtXcefdlNT0oLhclMzVMpCcLXBRGkfKyzPX4xF
 p0aBlRupy7TDA==
IronPort-Data: A9a23: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
 z3FFqHYZXBdGq1UeNs=
IronPort-HdrOrdr: A9a23:kRK72qtK+xdQo77JJjOtiACm7skDrNV00zEX/kB9WHVpm6yj/f
 xGUs576faSskdpZJlD8ersBEDkex/hHPFOkOos1NuZMzUO/VHYSL2KjrGSpQEIZReOlNK1vJ
 0IG8ND4Z/LfD9HZK3BgDVQfexP/DEJnZrY/ds2t00dKD2Cc5sQkzuRFDzrb3GemzM2fqbQxf
 Knl7B6mwY=
X-Talos-CUID: 9a23:LmRp3250OGD2JUy/6tssz1MuC8NiLnjknHqPCBLhNDYxGLzIcArF
X-Talos-MUID: 9a23:2cBh+AT5BhRmBIabRXThnAhtJM5W5J2cBW4Mg4cKqZmlPwNZbmI=
X-IronPort-Anti-Spam-Filtered: true
Received: from 60-242-28-244.static.tpgi.com.au (HELO bits.crawford.emu.id.au) ([60.242.28.244])
  by ipmail03.adl6.internode.on.net with ESMTP; 07 May 2023 20:11:30 +0930
Received: from agc.crawford.emu.id.au (agc.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc07])
        (authenticated bits=0)
        by bits.crawford.emu.id.au (8.17.1/8.17.1) with ESMTPSA id 347Af9h53600390
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
        Sun, 7 May 2023 20:41:26 +1000
Authentication-Results: bits.crawford.emu.id.au; arc=none smtp.remote-ip=fdd2:7aad:d478:1::cb10:cc07
DKIM-Filter: OpenDKIM Filter v2.11.0 bits.crawford.emu.id.au 347Af9h53600390
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crawford.emu.id.au;
        s=s1; t=1683456086; bh=FZd3Ch93lyUVtg1G37UG4/Yy86LE7+0sT0+wdjhYab8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=VvNc+YbRjKPK9/7Ht7d/Ze+NaaQ67PM+Ub8po84xHuiGlr8Z0VuAo2i6Rp7i0FM3K
         plgTrIaMLCp5M7Szfp/yyxndvo2FAAr3dc/wFgL6kg18fogavBoli2AAmZtPdsZ/Q4
         GpijcVuYODOrwHhuATtMePxGV1VVHvLnivnt0PISgySLdQnyrI2aAYD25OyOe+uULH
         0LI8tKiV75ip3RW9KPdYA/cBa9d3KudICvR/loJ221AXiBDOFqa6FHbl9cSslwjrkc
         u6vKsG5qiGYnyTB/Xgl/4Ez87uMhGBIPM+KCXrcHqJtiM2rS8ZjjSrxSdr6keFlKZS
         sOoGkB/z6CeXw==
From:   Frank Crawford <frank@crawford.emu.id.au>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org,
        Frank Crawford <frank@crawford.emu.id.au>
Subject: [PATCH v1 2/2] hwmon: (it87) Add FAN_CTL feature for relevant chipsets
Date:   Sun,  7 May 2023 20:41:06 +1000
Message-Id: <20230507104106.1808726-3-frank@crawford.emu.id.au>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230507104106.1808726-1-frank@crawford.emu.id.au>
References: <20230507104106.1808726-1-frank@crawford.emu.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4 (bits.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc01]); Sun, 07 May 2023 20:41:26 +1000 (AEST)
X-Virus-Scanned: clamav-milter 0.103.8 at bits.crawford.emu.id.au
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Assign FEAT_FANCTL_ONOFF for all chips that support the configuration.

Signed-off-by: Frank Crawford <frank@crawford.emu.id.au>
---
 drivers/hwmon/it87.c | 48 ++++++++++++++++++++++++++------------------
 1 file changed, 28 insertions(+), 20 deletions(-)

diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
index 6fa9e928177e..5deff5e5f693 100644
--- a/drivers/hwmon/it87.c
+++ b/drivers/hwmon/it87.c
@@ -326,26 +326,28 @@ static const struct it87_devices it87_devices[] = {
 	[it87] = {
 		.name = "it87",
 		.model = "IT87F",
-		.features = FEAT_OLD_AUTOPWM,	/* may need to overwrite */
+		.features = FEAT_OLD_AUTOPWM | FEAT_FANCTL_ONOFF,
+		/* may need to overwrite */
 	},
 	[it8712] = {
 		.name = "it8712",
 		.model = "IT8712F",
-		.features = FEAT_OLD_AUTOPWM | FEAT_VID,
-						/* may need to overwrite */
+		.features = FEAT_OLD_AUTOPWM | FEAT_VID | FEAT_FANCTL_ONOFF,
+		/* may need to overwrite */
 	},
 	[it8716] = {
 		.name = "it8716",
 		.model = "IT8716F",
 		.features = FEAT_16BIT_FANS | FEAT_TEMP_OFFSET | FEAT_VID
-		  | FEAT_FAN16_CONFIG | FEAT_FIVE_FANS | FEAT_PWM_FREQ2,
+		  | FEAT_FAN16_CONFIG | FEAT_FIVE_FANS | FEAT_PWM_FREQ2
+		  | FEAT_FANCTL_ONOFF,
 	},
 	[it8718] = {
 		.name = "it8718",
 		.model = "IT8718F",
 		.features = FEAT_16BIT_FANS | FEAT_TEMP_OFFSET | FEAT_VID
 		  | FEAT_TEMP_OLD_PECI | FEAT_FAN16_CONFIG | FEAT_FIVE_FANS
-		  | FEAT_PWM_FREQ2,
+		  | FEAT_PWM_FREQ2 | FEAT_FANCTL_ONOFF,
 		.old_peci_mask = 0x4,
 	},
 	[it8720] = {
@@ -353,7 +355,7 @@ static const struct it87_devices it87_devices[] = {
 		.model = "IT8720F",
 		.features = FEAT_16BIT_FANS | FEAT_TEMP_OFFSET | FEAT_VID
 		  | FEAT_TEMP_OLD_PECI | FEAT_FAN16_CONFIG | FEAT_FIVE_FANS
-		  | FEAT_PWM_FREQ2,
+		  | FEAT_PWM_FREQ2 | FEAT_FANCTL_ONOFF,
 		.old_peci_mask = 0x4,
 	},
 	[it8721] = {
@@ -362,7 +364,7 @@ static const struct it87_devices it87_devices[] = {
 		.features = FEAT_NEWER_AUTOPWM | FEAT_12MV_ADC | FEAT_16BIT_FANS
 		  | FEAT_TEMP_OFFSET | FEAT_TEMP_OLD_PECI | FEAT_TEMP_PECI
 		  | FEAT_FAN16_CONFIG | FEAT_FIVE_FANS | FEAT_IN7_INTERNAL
-		  | FEAT_PWM_FREQ2,
+		  | FEAT_PWM_FREQ2 | FEAT_FANCTL_ONOFF,
 		.peci_mask = 0x05,
 		.old_peci_mask = 0x02,	/* Actually reports PCH */
 	},
@@ -371,7 +373,8 @@ static const struct it87_devices it87_devices[] = {
 		.model = "IT8728F",
 		.features = FEAT_NEWER_AUTOPWM | FEAT_12MV_ADC | FEAT_16BIT_FANS
 		  | FEAT_TEMP_OFFSET | FEAT_TEMP_PECI | FEAT_FIVE_FANS
-		  | FEAT_IN7_INTERNAL | FEAT_PWM_FREQ2,
+		  | FEAT_IN7_INTERNAL | FEAT_PWM_FREQ2
+		  | FEAT_FANCTL_ONOFF,
 		.peci_mask = 0x07,
 	},
 	[it8732] = {
@@ -380,7 +383,7 @@ static const struct it87_devices it87_devices[] = {
 		.features = FEAT_NEWER_AUTOPWM | FEAT_16BIT_FANS
 		  | FEAT_TEMP_OFFSET | FEAT_TEMP_OLD_PECI | FEAT_TEMP_PECI
 		  | FEAT_10_9MV_ADC | FEAT_IN7_INTERNAL | FEAT_FOUR_FANS
-		  | FEAT_FOUR_PWM,
+		  | FEAT_FOUR_PWM | FEAT_FANCTL_ONOFF,
 		.peci_mask = 0x07,
 		.old_peci_mask = 0x02,	/* Actually reports PCH */
 	},
@@ -389,7 +392,7 @@ static const struct it87_devices it87_devices[] = {
 		.model = "IT8771E",
 		.features = FEAT_NEWER_AUTOPWM | FEAT_12MV_ADC | FEAT_16BIT_FANS
 		  | FEAT_TEMP_OFFSET | FEAT_TEMP_PECI | FEAT_IN7_INTERNAL
-		  | FEAT_PWM_FREQ2,
+		  | FEAT_PWM_FREQ2 | FEAT_FANCTL_ONOFF,
 				/* PECI: guesswork */
 				/* 12mV ADC (OHM) */
 				/* 16 bit fans (OHM) */
@@ -401,7 +404,7 @@ static const struct it87_devices it87_devices[] = {
 		.model = "IT8772E",
 		.features = FEAT_NEWER_AUTOPWM | FEAT_12MV_ADC | FEAT_16BIT_FANS
 		  | FEAT_TEMP_OFFSET | FEAT_TEMP_PECI | FEAT_IN7_INTERNAL
-		  | FEAT_PWM_FREQ2,
+		  | FEAT_PWM_FREQ2 | FEAT_FANCTL_ONOFF,
 				/* PECI (coreboot) */
 				/* 12mV ADC (HWSensors4, OHM) */
 				/* 16 bit fans (HWSensors4, OHM) */
@@ -412,21 +415,24 @@ static const struct it87_devices it87_devices[] = {
 		.name = "it8781",
 		.model = "IT8781F",
 		.features = FEAT_16BIT_FANS | FEAT_TEMP_OFFSET
-		  | FEAT_TEMP_OLD_PECI | FEAT_FAN16_CONFIG | FEAT_PWM_FREQ2,
+		  | FEAT_TEMP_OLD_PECI | FEAT_FAN16_CONFIG | FEAT_PWM_FREQ2
+		  | FEAT_FANCTL_ONOFF,
 		.old_peci_mask = 0x4,
 	},
 	[it8782] = {
 		.name = "it8782",
 		.model = "IT8782F",
 		.features = FEAT_16BIT_FANS | FEAT_TEMP_OFFSET
-		  | FEAT_TEMP_OLD_PECI | FEAT_FAN16_CONFIG | FEAT_PWM_FREQ2,
+		  | FEAT_TEMP_OLD_PECI | FEAT_FAN16_CONFIG | FEAT_PWM_FREQ2
+		  | FEAT_FANCTL_ONOFF,
 		.old_peci_mask = 0x4,
 	},
 	[it8783] = {
 		.name = "it8783",
 		.model = "IT8783E/F",
 		.features = FEAT_16BIT_FANS | FEAT_TEMP_OFFSET
-		  | FEAT_TEMP_OLD_PECI | FEAT_FAN16_CONFIG | FEAT_PWM_FREQ2,
+		  | FEAT_TEMP_OLD_PECI | FEAT_FAN16_CONFIG | FEAT_PWM_FREQ2
+		  | FEAT_FANCTL_ONOFF,
 		.old_peci_mask = 0x4,
 	},
 	[it8786] = {
@@ -434,7 +440,7 @@ static const struct it87_devices it87_devices[] = {
 		.model = "IT8786E",
 		.features = FEAT_NEWER_AUTOPWM | FEAT_12MV_ADC | FEAT_16BIT_FANS
 		  | FEAT_TEMP_OFFSET | FEAT_TEMP_PECI | FEAT_IN7_INTERNAL
-		  | FEAT_PWM_FREQ2,
+		  | FEAT_PWM_FREQ2 | FEAT_FANCTL_ONOFF,
 		.peci_mask = 0x07,
 	},
 	[it8790] = {
@@ -442,7 +448,7 @@ static const struct it87_devices it87_devices[] = {
 		.model = "IT8790E",
 		.features = FEAT_NEWER_AUTOPWM | FEAT_12MV_ADC | FEAT_16BIT_FANS
 		  | FEAT_TEMP_OFFSET | FEAT_TEMP_PECI | FEAT_IN7_INTERNAL
-		  | FEAT_PWM_FREQ2 | FEAT_CONF_NOEXIT,
+		  | FEAT_PWM_FREQ2 | FEAT_FANCTL_ONOFF | FEAT_CONF_NOEXIT,
 		.peci_mask = 0x07,
 	},
 	[it8792] = {
@@ -450,7 +456,8 @@ static const struct it87_devices it87_devices[] = {
 		.model = "IT8792E/IT8795E",
 		.features = FEAT_NEWER_AUTOPWM | FEAT_16BIT_FANS
 		  | FEAT_TEMP_OFFSET | FEAT_TEMP_OLD_PECI | FEAT_TEMP_PECI
-		  | FEAT_10_9MV_ADC | FEAT_IN7_INTERNAL | FEAT_CONF_NOEXIT,
+		  | FEAT_10_9MV_ADC | FEAT_IN7_INTERNAL | FEAT_FANCTL_ONOFF
+		  | FEAT_CONF_NOEXIT,
 		.peci_mask = 0x07,
 		.old_peci_mask = 0x02,	/* Actually reports PCH */
 	},
@@ -468,7 +475,7 @@ static const struct it87_devices it87_devices[] = {
 		.features = FEAT_NEWER_AUTOPWM | FEAT_12MV_ADC | FEAT_16BIT_FANS
 		  | FEAT_TEMP_OFFSET | FEAT_TEMP_PECI | FEAT_SIX_FANS
 		  | FEAT_IN7_INTERNAL | FEAT_SIX_PWM | FEAT_PWM_FREQ2
-		  | FEAT_SIX_TEMP | FEAT_VIN3_5V,
+		  | FEAT_SIX_TEMP | FEAT_VIN3_5V | FEAT_FANCTL_ONOFF,
 		.peci_mask = 0x07,
 	},
 	[it8622] = {
@@ -487,7 +494,7 @@ static const struct it87_devices it87_devices[] = {
 		.features = FEAT_NEWER_AUTOPWM | FEAT_12MV_ADC | FEAT_16BIT_FANS
 		  | FEAT_TEMP_OFFSET | FEAT_TEMP_PECI | FEAT_SIX_FANS
 		  | FEAT_IN7_INTERNAL | FEAT_SIX_PWM | FEAT_PWM_FREQ2
-		  | FEAT_SIX_TEMP | FEAT_VIN3_5V,
+		  | FEAT_SIX_TEMP | FEAT_VIN3_5V | FEAT_FANCTL_ONOFF,
 		.peci_mask = 0x07,
 	},
 	[it87952] = {
@@ -495,7 +502,8 @@ static const struct it87_devices it87_devices[] = {
 		.model = "IT87952E",
 		.features = FEAT_NEWER_AUTOPWM | FEAT_16BIT_FANS
 		  | FEAT_TEMP_OFFSET | FEAT_TEMP_OLD_PECI | FEAT_TEMP_PECI
-		  | FEAT_10_9MV_ADC | FEAT_IN7_INTERNAL | FEAT_CONF_NOEXIT,
+		  | FEAT_10_9MV_ADC | FEAT_IN7_INTERNAL | FEAT_FANCTL_ONOFF
+		  | FEAT_CONF_NOEXIT,
 		.peci_mask = 0x07,
 		.old_peci_mask = 0x02,	/* Actually reports PCH */
 	},
-- 
2.40.0

