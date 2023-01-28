Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E4CAC61DB3
	for <linux-hwmon@archiver.kernel.org>; Sat, 28 Jan 2023 06:04:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230306AbjA1GEK (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 28 Jan 2023 01:04:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231496AbjA1GEJ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 28 Jan 2023 01:04:09 -0500
Received: from ipmail06.adl3.internode.on.net (ipmail06.adl3.internode.on.net [150.101.137.16])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 6F4107C70D
        for <linux-hwmon@vger.kernel.org>; Fri, 27 Jan 2023 22:04:08 -0800 (PST)
IronPort-SDR: meiESD1APBckwnL4LGBmVcJpS6ScejMTXFFjcTRhKWi18Mq7bGM809Dnl1UPSUZPxLQTXIgD44
 /RU62pZfA+/w9xQ80H4qf0T1WEqY1qQ9UkVP/RASSsYo3vUOpxcgL/kU+d3Kk4HKAagFATlL1q
 O/f/N9Nb0r0Ruk27R6KMScOa729XJoxJfyZK+E3zyEQYanU6gZ4lwTfWrnx9EKbu+yvW7N3oJS
 GO5PEvEUQhXSl7Ic6frY5/tMcoaCdRt4Mw35kne1/OUuo3mba26kA5Z4f/PXJrspf5XvjWlRwS
 LxxnWZlxVWJ8PmEMw65NwJx3
X-SMTP-MATCH: 0
Received: from 60-242-28-244.static.tpgi.com.au (HELO bits.crawford.emu.id.au) ([60.242.28.244])
  by ipmail06.adl3.internode.on.net with ESMTP; 28 Jan 2023 16:33:31 +1030
Received: from agc.crawford.emu.id.au (agc.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc07])
        (authenticated bits=0)
        by bits.crawford.emu.id.au (8.17.1/8.17.1) with ESMTPSA id 30S63Ch92973396
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
        Sat, 28 Jan 2023 17:03:27 +1100
Authentication-Results: bits.crawford.emu.id.au; arc=none smtp.remote-ip=fdd2:7aad:d478:1::cb10:cc07
DKIM-Filter: OpenDKIM Filter v2.11.0 bits.crawford.emu.id.au 30S63Ch92973396
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crawford.emu.id.au;
        s=s1; t=1674885807; bh=xjv0PrvDFugp3Xa6stTohRT1XaShoZVbSrBrTOCs7U8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=IPGPCWWIBDA4w3xBzXwuVZ0dLzB69Y/FJr4uf6h982bV2J8WPrfRm8YluDKcW95ss
         gaM2NSN/VpgnmulX0s0Nqsma+9+gZ0vKXOdxPY2BX2q27Knm0c5pV4a9un0WidfoAj
         whEg+XSdXj8ajOViNJuQiFbts5EYvzSBV4PaEDedS/txjDA1S8hjSkENisOWQzdIEA
         FGYB9VzJqmPneJkSBlDUXNSMSAsOzCGOXAhqzmFxQdqtv/tdCzRqWlNZEyas3qP+0/
         IdCsGzOSAZEoAsKMxOOzk0GO+nJ244vcVLO/MadZDT59ZdZmOxA6bkjZr9AEcrpGsP
         QtCS9oRR8ZW2w==
From:   Frank Crawford <frank@crawford.emu.id.au>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org,
        Frank Crawford <frank@crawford.emu.id.au>
Subject: [PATCH v3 1/7] hwmon: (it87) Allow disabling exiting of configuration mode
Date:   Sat, 28 Jan 2023 17:03:02 +1100
Message-Id: <20230128060308.1549707-2-frank@crawford.emu.id.au>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230128060308.1549707-1-frank@crawford.emu.id.au>
References: <20230128060308.1549707-1-frank@crawford.emu.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4 (bits.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc01]); Sat, 28 Jan 2023 17:03:27 +1100 (AEDT)
X-Virus-Scanned: clamav-milter 0.103.7 at bits.crawford.emu.id.au
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Disabling configuration mode on some chips can result in system
hang-ups and access failures to the Super-IO chip at the
second SIO address. Never exit configuration mode on these
chips to avoid the problem.

This patch should be applied in conjunction with a previous one to
initialise the second chip for certain mother boards.

Signed-off-by: Frank Crawford <frank@crawford.emu.id.au>
---

v3:
 * Correct possible uninitialised pointer issue.

v2:
 * Convert to use feature flag and related macros rather than a separate
   field, as suggested in review.
 * Reverse sense of flag in superio_exit to simplify feature macro.

---
 drivers/hwmon/it87.c | 26 ++++++++++++++++++--------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
index a8a6a0ffee82..923a9563be92 100644
--- a/drivers/hwmon/it87.c
+++ b/drivers/hwmon/it87.c
@@ -128,10 +128,12 @@ static inline int superio_enter(int ioreg)
 	return 0;
 }
 
-static inline void superio_exit(int ioreg)
+static inline void superio_exit(int ioreg, bool noexit)
 {
-	outb(0x02, ioreg);
-	outb(0x02, ioreg + 1);
+	if (!noexit) {
+		outb(0x02, ioreg);
+		outb(0x02, ioreg + 1);
+	}
 	release_region(ioreg, 2);
 }
 
@@ -300,6 +302,13 @@ struct it87_devices {
 #define FEAT_PWM_FREQ2		BIT(16)	/* Separate pwm freq 2 */
 #define FEAT_SIX_TEMP		BIT(17)	/* Up to 6 temp sensors */
 #define FEAT_VIN3_5V		BIT(18)	/* VIN3 connected to +5V */
+/*
+ * Disabling configuration mode on some chips can result in system
+ * hang-ups and access failures to the Super-IO chip at the
+ * second SIO address. Never exit configuration mode on these
+ * chips to avoid the problem.
+ */
+#define FEAT_CONF_NOEXIT	BIT(28)	/* Chip should not exit conf mode */
 
 static const struct it87_devices it87_devices[] = {
 	[it87] = {
@@ -493,6 +502,7 @@ static const struct it87_devices it87_devices[] = {
 #define has_pwm_freq2(data)	((data)->features & FEAT_PWM_FREQ2)
 #define has_six_temp(data)	((data)->features & FEAT_SIX_TEMP)
 #define has_vin3_5v(data)	((data)->features & FEAT_VIN3_5V)
+#define has_conf_noexit(data)	((data)->features & FEAT_CONF_NOEXIT)
 
 struct it87_sio_data {
 	int sioaddr;
@@ -2404,7 +2414,7 @@ static int __init it87_find(int sioaddr, unsigned short *address,
 {
 	int err;
 	u16 chip_type;
-	const struct it87_devices *config;
+	const struct it87_devices *config = NULL;
 
 	err = superio_enter(sioaddr);
 	if (err)
@@ -2489,6 +2499,8 @@ static int __init it87_find(int sioaddr, unsigned short *address,
 		goto exit;
 	}
 
+	config = &it87_devices[sio_data->type];
+
 	superio_select(sioaddr, PME);
 	if (!(superio_inb(sioaddr, IT87_ACT_REG) & 0x01)) {
 		pr_info("Device not activated, skipping\n");
@@ -2508,8 +2520,6 @@ static int __init it87_find(int sioaddr, unsigned short *address,
 		it87_devices[sio_data->type].suffix,
 		*address, sio_data->revision);
 
-	config = &it87_devices[sio_data->type];
-
 	/* in7 (VSB or VCCH5V) is always internal on some chips */
 	if (has_in7_internal(config))
 		sio_data->internal |= BIT(1);
@@ -2827,7 +2837,7 @@ static int __init it87_find(int sioaddr, unsigned short *address,
 		sio_data->skip_pwm |= dmi_data->skip_pwm;
 
 exit:
-	superio_exit(sioaddr);
+	superio_exit(sioaddr, config ? has_conf_noexit(config) : false);
 	return err;
 }
 
@@ -3213,7 +3223,7 @@ static void it87_resume_sio(struct platform_device *pdev)
 			     reg2c);
 	}
 
-	superio_exit(data->sioaddr);
+	superio_exit(data->sioaddr, has_conf_noexit(data));
 }
 
 static int it87_resume(struct device *dev)
-- 
2.39.1

