Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E585C61DA3
	for <linux-hwmon@archiver.kernel.org>; Fri, 27 Jan 2023 04:41:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229721AbjA0Elq (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 26 Jan 2023 23:41:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229688AbjA0Elp (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 26 Jan 2023 23:41:45 -0500
Received: from ipmail06.adl3.internode.on.net (ipmail06.adl3.internode.on.net [150.101.137.16])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 92CFB39B9E
        for <linux-hwmon@vger.kernel.org>; Thu, 26 Jan 2023 20:41:43 -0800 (PST)
IronPort-SDR: 1T1HxQ9DybaB1wSFN1ZwzgXuNhgzEs3Tdlh+Vi+/o1wtVnUmB2X190EtsI9O6p2x5Bm1VSvA4u
 CfZpus+xEenQ3pZv/hhRZbl06xAsGxoAYsng8vsZydBNxjQj/FU4d5aj9gB9ghbq+KXVfGCIsT
 hA+RgTfOxAvJ9RgIoT8P8ssOqumn3iZ+dT/jPKV9rI1GX+G+2rSLlYaAMnWtYcu4gexC7hNSsv
 9U2QVyLngic4yzwKC4MiBYkpmqDEchLr0spXhWsnw1cd7HhPbEFJQowcmhGDbPysD4k715u0wK
 NxYEtwJdEngj+bXGtGAxPg86
X-SMTP-MATCH: 0
X-IPAS-Result: =?us-ascii?q?A2BcAQCKVdNj//Qc8jxaHAEBAQEBAQcBARIBAQQEAQFJg?=
 =?us-ascii?q?TUEAQELAYIsgmC1Kw8BDwEBRAQBAYUHAoUjJjcGDgECBAEBAQEDAgMBAQEBA?=
 =?us-ascii?q?QEDAQEGAQEBAQEBBgSBKgcLUgcLWAcHgUELgWETCwMxDYZWAgEDJwsBDQEBN?=
 =?us-ascii?q?wEPGThXBgESgn6DI6tpM4EBgggBAQaCYppngV4JgUABi2CBFIM3ekM/gU6Ef?=
 =?us-ascii?q?YsDm14KgTl4gSUOTHqBDwIJAhF0WQMJAwcFSUADCxgNFjIKEyw1CwtKEBsaG?=
 =?us-ascii?q?weBBiooFQMEBAMCBhMDIgINKDEUBCkTDScmaQkCAyJiAwMEKC0JPwcmJDwHV?=
 =?us-ascii?q?jcGAg8fNwYDCQMCH09xLxISBQMLFSpHBAg2BQYcNhICCA8SDyxEDkI3NBMGX?=
 =?us-ascii?q?AEpCw4RA1BHGW4EghEGKSaeOXEBgQ6VXo5XoWKDfIFSnn1MgUSnZpdNIKMch?=
 =?us-ascii?q?CsCCgcWgXiBf00fGTuCZ08BAgEBAQ0BAgEBAwECAQEBCQEBAQGOHYIskUthO?=
 =?us-ascii?q?wIHCwEBAwmMIwEB?=
IronPort-PHdr: A9a23:pRdZyx0t2N23hF5lsmDPn1BlVkEcU/3cNA8J8dwskbtRfKO589LvO
 VGZ5PkrhUKaFYzB4KdCjOzb+7vlRXRG+5uEt2wPNZ1UAhEJhZ9EwAUpDJyJVRKrfqe4PScwR
 ZwQX1Q9oBmG
IronPort-Data: A9a23:MbZEF6xdJvnWFV5k/Nd6t+cTwCrEfRIJ4+MujC+fZmUNrF6WrkVVz
 GccCG/TaP+IYGKmKohyO43k80gC7ZTdnINiTgRp/y80QitBo5LOD9+VcB2uMSiZd52YEkhtt
 p0UM4OffJ84Z3KN/R3F3prJ9Ckkj/vULlbf5E8oHggrGGeInQ940UoLd9YR29Iu2Z7ja++0k
 YuaT/f3YTdJ5hYtWo4qw/LbwP9QlKyaVAMw5jTSstgW1LN2vyB94KM3fcldHVOhKmVnNrLSq
 9L48V2M1jixEyHBqz+Suu2TnkUiGtY+NOUV45Zcc/DKbhNq/kTe3kunXRYRQR8/ttmHozx+4
 PcUsZ2pThkGBIzjo+UtSSQBDxhzLJQTrdcrIVDn2SCS50fHb2CqyO9nE08xJ4Fe9+NqR2BCs
 /UFQNwPRk7bwbjqmvThGq822phLwMrDZevzvllu1zjfDt4tW5ncTaLQ6ZlV2Sp2h8wIFOu2i
 88xNWY3PUmdPEYRUrsRIIhugvX5gFymSCJBiHS5hrAp6nDIwTUkhdABN/KOIofaH58E9qqCn
 UrC/mLkElQaK9mYzxKb/X+2wOzChyX2XMQVDrLQ3vprhkCD7nYUBRYVEEag5/+0liaWWd5SL
 1Id4CcGtrUp+QqgSdyVYvGjiCDc+0RAAZ8KQ6hgtF3L0bbd/weSQHQcQT8HY9sj8sYrLdA36
 rOXt/GwAT12t6O6c1Oyzbaktw7rJREYPFZXMEfoUjA5y9XkpYgyiDfGQdBiDLO5g7XJ9dfYn
 mDiQM8W2eh7sCIb60mo1RWc2GLz/8Shohodv1iOBDr9sGuVcab/P+SVBU7nAeFoBbvxorOph
 2kIncWPhAzlJcvVzHTlrAklOry2r82CLSHcyWFmG5Q6nwlBFlb9JcUKvGs7fhcsaJpYPyT1a
 VPSskVN/JBSenCtaOl+fupd6vjGL4C8SbwJtdiONbKih6SdkyfdoklTiba4hTyFraTVufhX1
 FfyWZ/E4YwmIapm1iGqYOwWzKUmwCszrUuKG8+nkEn4geHGPybJIVvgDLdoRr1phE9jiFuIm
 +uzy+PQmn2zrcWkPXKOqtZDRbz0BSVqXsqtwyCoSgJzClE+QzF7Ua65LUIJZ5Rq16VTiurS+
 HyhMnK0O3Kh7UAq6GyiNBheVV8Ydc8n8ChkYnZxYw/ANrpKSd/H0ZrzvqAfJdEPnNGPB9YtJ
 xXcU8nfUPlJVBrd/DERMcv0oIB4LUT5jhiHICSiejR5cpt9AQ3FvNb5J1O9+C4LByuxlM0/v
 7z5iFyBG8JZGlw4AZaEcu+rwnOwoWMZxrB4UXzIFd8PKk/ix5c7eSX+g8g+L9wINRielCCR0
 BybAElEqOSU+901/dDFiLqqtYCsF+ciTENWE3OCveS9LyDF8G25zclNVfvOfDybXX6toPeuY
 uBczvfdNvwbnQ8U7NAmS+w2lfgzvoK9qaVbwwJoGGTwQ26qUr4wcGOb2cRvt7FWwuELswWBW
 nWJpotQN4KWaZHsH1MmLQY4aviOiKMPkT7I4PVrfEj36XMl/LeDVkkObRCAhDYHd+l/MZ8+h
 +w7sdEY7BazzBcvL5CHgmZd6j3UfHAHVqwmsLAcAZPq01R0kAsaO8GEUCKmsouSb9hsM1UxJ
 mHGjqT1h4NamhjIfU0sRCrE0udqjJgTvAxHkQ0ZLFOTl9ub2vI6gE9L/TIsQlgHxxlLybkpa
 DYzchcpf+DUr3Iy2JQFRHylBwBKQgGB9U23wFwM0mTEFhH6WmvIJWw7GOCM4EFArT0GJGABo
 enCxTa3SyvuceHwwjA2BRxvpcvlHI54+QD1kcy6G9iIQsshaj3/j67wOWcFpnML2y/qaJEre
 AWywNtNVA==
IronPort-HdrOrdr: A9a23:M1Pi/ajaAySdwdZDNe0RVFdT5HBQXgAji2hC6mlwRA09TyX5ra
 qTdTogtCMc7wxhIU3J+7i7VZVoJEmxyXcb2/hzAV7PZmbbUS6TXeVfBOjZslvd8lPFh4xgPM
 5bGsAUNDSzNykcsS+Q2mmF+rgbruVuf82T9J/jJg9WPGRXgrlbnntE4xigYzBLrdZ9dOEE/E
 v13Ls8mwad
X-IronPort-Anti-Spam-Filtered: true
Received: from 60-242-28-244.static.tpgi.com.au (HELO bits.crawford.emu.id.au) ([60.242.28.244])
  by ipmail06.adl3.internode.on.net with ESMTP; 27 Jan 2023 15:11:42 +1030
Received: from agc.crawford.emu.id.au (agc.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc07])
        (authenticated bits=0)
        by bits.crawford.emu.id.au (8.17.1/8.17.1) with ESMTPSA id 30R4fIgg2462776
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
        Fri, 27 Jan 2023 15:41:38 +1100
Authentication-Results: bits.crawford.emu.id.au; arc=none smtp.remote-ip=fdd2:7aad:d478:1::cb10:cc07
DKIM-Filter: OpenDKIM Filter v2.11.0 bits.crawford.emu.id.au 30R4fIgg2462776
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crawford.emu.id.au;
        s=s1; t=1674794498; bh=ypDoyNVtANPP5ZfydD/arJDMgjyuguW9TJZlRqiwgmo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=CUt08NZa+6ZVrt5hGEucKrTjZxL4X6sh26Kyvnqb2GV4hliervSUZTXziTag4ttRq
         R0b8VOVb9vzKUv8gzDJPQ5huHZFiuZk96vajvIMD9mCJRWpyWIRroYmuypWyTvIsoK
         LzcEFZjqlQ9TPgWZTGUnASP9Or6MeCZFZIVnK4Jx0a5YnUiWjPrMI9/lMzr3zH9aM/
         7aOn3KUZtj1rVXIOiMaDKcY9g1aJ4yQ7beCWy/2Vh3jecZK++ndsRiyILIL58yYpYb
         S2INcTwgcAsspo9DwhOZGLfoKpSz+AnKgtCQ4azN8w1fKEpMC7eYzXas4nANyTqx8j
         8OFV5klgCIGhQ==
From:   Frank Crawford <frank@crawford.emu.id.au>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org,
        Frank Crawford <frank@crawford.emu.id.au>
Subject: [PATCH v2 3/7] hwmon: (it87) List full chip model name
Date:   Fri, 27 Jan 2023 15:41:12 +1100
Message-Id: <20230127044116.1257799-4-frank@crawford.emu.id.au>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230127044116.1257799-1-frank@crawford.emu.id.au>
References: <20230127044116.1257799-1-frank@crawford.emu.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4 (bits.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc01]); Fri, 27 Jan 2023 15:41:38 +1100 (AEDT)
X-Virus-Scanned: clamav-milter 0.103.7 at bits.crawford.emu.id.au
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

ITE model names do not always match the chip ID.

Convert from just adding a suffix to specifying the full model name.

Signed-off-by: Frank Crawford <frank@crawford.emu.id.au>
---

v2:
 * No change.

---
 drivers/hwmon/it87.c | 46 ++++++++++++++++++++++----------------------
 1 file changed, 23 insertions(+), 23 deletions(-)

diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
index 16130d469180..9295391e4c55 100644
--- a/drivers/hwmon/it87.c
+++ b/drivers/hwmon/it87.c
@@ -277,7 +277,7 @@ static const u8 IT87_REG_AUTO_BASE[] = { 0x60, 0x68, 0x70, 0x78, 0xa0, 0xa8 };
 
 struct it87_devices {
 	const char *name;
-	const char * const suffix;
+	const char * const model;
 	u32 features;
 	u8 peci_mask;
 	u8 old_peci_mask;
@@ -313,24 +313,24 @@ struct it87_devices {
 static const struct it87_devices it87_devices[] = {
 	[it87] = {
 		.name = "it87",
-		.suffix = "F",
+		.model = "IT87F",
 		.features = FEAT_OLD_AUTOPWM,	/* may need to overwrite */
 	},
 	[it8712] = {
 		.name = "it8712",
-		.suffix = "F",
+		.model = "IT8712F",
 		.features = FEAT_OLD_AUTOPWM | FEAT_VID,
 						/* may need to overwrite */
 	},
 	[it8716] = {
 		.name = "it8716",
-		.suffix = "F",
+		.model = "IT8716F",
 		.features = FEAT_16BIT_FANS | FEAT_TEMP_OFFSET | FEAT_VID
 		  | FEAT_FAN16_CONFIG | FEAT_FIVE_FANS | FEAT_PWM_FREQ2,
 	},
 	[it8718] = {
 		.name = "it8718",
-		.suffix = "F",
+		.model = "IT8718F",
 		.features = FEAT_16BIT_FANS | FEAT_TEMP_OFFSET | FEAT_VID
 		  | FEAT_TEMP_OLD_PECI | FEAT_FAN16_CONFIG | FEAT_FIVE_FANS
 		  | FEAT_PWM_FREQ2,
@@ -338,7 +338,7 @@ static const struct it87_devices it87_devices[] = {
 	},
 	[it8720] = {
 		.name = "it8720",
-		.suffix = "F",
+		.model = "IT8720F",
 		.features = FEAT_16BIT_FANS | FEAT_TEMP_OFFSET | FEAT_VID
 		  | FEAT_TEMP_OLD_PECI | FEAT_FAN16_CONFIG | FEAT_FIVE_FANS
 		  | FEAT_PWM_FREQ2,
@@ -346,7 +346,7 @@ static const struct it87_devices it87_devices[] = {
 	},
 	[it8721] = {
 		.name = "it8721",
-		.suffix = "F",
+		.model = "IT8721F",
 		.features = FEAT_NEWER_AUTOPWM | FEAT_12MV_ADC | FEAT_16BIT_FANS
 		  | FEAT_TEMP_OFFSET | FEAT_TEMP_OLD_PECI | FEAT_TEMP_PECI
 		  | FEAT_FAN16_CONFIG | FEAT_FIVE_FANS | FEAT_IN7_INTERNAL
@@ -356,7 +356,7 @@ static const struct it87_devices it87_devices[] = {
 	},
 	[it8728] = {
 		.name = "it8728",
-		.suffix = "F",
+		.model = "IT8728F",
 		.features = FEAT_NEWER_AUTOPWM | FEAT_12MV_ADC | FEAT_16BIT_FANS
 		  | FEAT_TEMP_OFFSET | FEAT_TEMP_PECI | FEAT_FIVE_FANS
 		  | FEAT_IN7_INTERNAL | FEAT_PWM_FREQ2,
@@ -364,7 +364,7 @@ static const struct it87_devices it87_devices[] = {
 	},
 	[it8732] = {
 		.name = "it8732",
-		.suffix = "F",
+		.model = "IT8732F",
 		.features = FEAT_NEWER_AUTOPWM | FEAT_16BIT_FANS
 		  | FEAT_TEMP_OFFSET | FEAT_TEMP_OLD_PECI | FEAT_TEMP_PECI
 		  | FEAT_10_9MV_ADC | FEAT_IN7_INTERNAL,
@@ -373,7 +373,7 @@ static const struct it87_devices it87_devices[] = {
 	},
 	[it8771] = {
 		.name = "it8771",
-		.suffix = "E",
+		.model = "IT8771E",
 		.features = FEAT_NEWER_AUTOPWM | FEAT_12MV_ADC | FEAT_16BIT_FANS
 		  | FEAT_TEMP_OFFSET | FEAT_TEMP_PECI | FEAT_IN7_INTERNAL
 		  | FEAT_PWM_FREQ2,
@@ -385,7 +385,7 @@ static const struct it87_devices it87_devices[] = {
 	},
 	[it8772] = {
 		.name = "it8772",
-		.suffix = "E",
+		.model = "IT8772E",
 		.features = FEAT_NEWER_AUTOPWM | FEAT_12MV_ADC | FEAT_16BIT_FANS
 		  | FEAT_TEMP_OFFSET | FEAT_TEMP_PECI | FEAT_IN7_INTERNAL
 		  | FEAT_PWM_FREQ2,
@@ -397,28 +397,28 @@ static const struct it87_devices it87_devices[] = {
 	},
 	[it8781] = {
 		.name = "it8781",
-		.suffix = "F",
+		.model = "IT8781F",
 		.features = FEAT_16BIT_FANS | FEAT_TEMP_OFFSET
 		  | FEAT_TEMP_OLD_PECI | FEAT_FAN16_CONFIG | FEAT_PWM_FREQ2,
 		.old_peci_mask = 0x4,
 	},
 	[it8782] = {
 		.name = "it8782",
-		.suffix = "F",
+		.model = "IT8782F",
 		.features = FEAT_16BIT_FANS | FEAT_TEMP_OFFSET
 		  | FEAT_TEMP_OLD_PECI | FEAT_FAN16_CONFIG | FEAT_PWM_FREQ2,
 		.old_peci_mask = 0x4,
 	},
 	[it8783] = {
 		.name = "it8783",
-		.suffix = "E/F",
+		.model = "IT8783E/F",
 		.features = FEAT_16BIT_FANS | FEAT_TEMP_OFFSET
 		  | FEAT_TEMP_OLD_PECI | FEAT_FAN16_CONFIG | FEAT_PWM_FREQ2,
 		.old_peci_mask = 0x4,
 	},
 	[it8786] = {
 		.name = "it8786",
-		.suffix = "E",
+		.model = "IT8786E",
 		.features = FEAT_NEWER_AUTOPWM | FEAT_12MV_ADC | FEAT_16BIT_FANS
 		  | FEAT_TEMP_OFFSET | FEAT_TEMP_PECI | FEAT_IN7_INTERNAL
 		  | FEAT_PWM_FREQ2,
@@ -426,7 +426,7 @@ static const struct it87_devices it87_devices[] = {
 	},
 	[it8790] = {
 		.name = "it8790",
-		.suffix = "E",
+		.model = "IT8790E",
 		.features = FEAT_NEWER_AUTOPWM | FEAT_12MV_ADC | FEAT_16BIT_FANS
 		  | FEAT_TEMP_OFFSET | FEAT_TEMP_PECI | FEAT_IN7_INTERNAL
 		  | FEAT_PWM_FREQ2 | FEAT_CONF_NOEXIT,
@@ -434,7 +434,7 @@ static const struct it87_devices it87_devices[] = {
 	},
 	[it8792] = {
 		.name = "it8792",
-		.suffix = "E",
+		.model = "IT8792E/IT8795E",
 		.features = FEAT_NEWER_AUTOPWM | FEAT_16BIT_FANS
 		  | FEAT_TEMP_OFFSET | FEAT_TEMP_OLD_PECI | FEAT_TEMP_PECI
 		  | FEAT_10_9MV_ADC | FEAT_IN7_INTERNAL | FEAT_CONF_NOEXIT,
@@ -443,7 +443,7 @@ static const struct it87_devices it87_devices[] = {
 	},
 	[it8603] = {
 		.name = "it8603",
-		.suffix = "E",
+		.model = "IT8603E",
 		.features = FEAT_NEWER_AUTOPWM | FEAT_12MV_ADC | FEAT_16BIT_FANS
 		  | FEAT_TEMP_OFFSET | FEAT_TEMP_PECI | FEAT_IN7_INTERNAL
 		  | FEAT_AVCC3 | FEAT_PWM_FREQ2,
@@ -451,7 +451,7 @@ static const struct it87_devices it87_devices[] = {
 	},
 	[it8620] = {
 		.name = "it8620",
-		.suffix = "E",
+		.model = "IT8620E",
 		.features = FEAT_NEWER_AUTOPWM | FEAT_12MV_ADC | FEAT_16BIT_FANS
 		  | FEAT_TEMP_OFFSET | FEAT_TEMP_PECI | FEAT_SIX_FANS
 		  | FEAT_IN7_INTERNAL | FEAT_SIX_PWM | FEAT_PWM_FREQ2
@@ -460,7 +460,7 @@ static const struct it87_devices it87_devices[] = {
 	},
 	[it8622] = {
 		.name = "it8622",
-		.suffix = "E",
+		.model = "IT8622E",
 		.features = FEAT_NEWER_AUTOPWM | FEAT_12MV_ADC | FEAT_16BIT_FANS
 		  | FEAT_TEMP_OFFSET | FEAT_TEMP_PECI | FEAT_FIVE_FANS
 		  | FEAT_FIVE_PWM | FEAT_IN7_INTERNAL | FEAT_PWM_FREQ2
@@ -469,7 +469,7 @@ static const struct it87_devices it87_devices[] = {
 	},
 	[it8628] = {
 		.name = "it8628",
-		.suffix = "E",
+		.model = "IT8628E",
 		.features = FEAT_NEWER_AUTOPWM | FEAT_12MV_ADC | FEAT_16BIT_FANS
 		  | FEAT_TEMP_OFFSET | FEAT_TEMP_PECI | FEAT_SIX_FANS
 		  | FEAT_IN7_INTERNAL | FEAT_SIX_PWM | FEAT_PWM_FREQ2
@@ -2516,8 +2516,8 @@ static int __init it87_find(int sioaddr, unsigned short *address,
 	err = 0;
 	sio_data->sioaddr = sioaddr;
 	sio_data->revision = superio_inb(sioaddr, DEVREV) & 0x0f;
-	pr_info("Found IT%04x%s chip at 0x%x, revision %d\n", chip_type,
-		it87_devices[sio_data->type].suffix,
+	pr_info("Found %s chip at 0x%x, revision %d\n",
+		it87_devices[sio_data->type].model,
 		*address, sio_data->revision);
 
 	/* in7 (VSB or VCCH5V) is always internal on some chips */
-- 
2.39.1

