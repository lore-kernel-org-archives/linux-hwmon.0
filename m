Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87F0EC61DA7
	for <linux-hwmon@archiver.kernel.org>; Fri, 27 Jan 2023 04:41:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229448AbjA0Elq (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 26 Jan 2023 23:41:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229496AbjA0Eln (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 26 Jan 2023 23:41:43 -0500
Received: from ipmail06.adl3.internode.on.net (ipmail06.adl3.internode.on.net [150.101.137.16])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 246643A5BF
        for <linux-hwmon@vger.kernel.org>; Thu, 26 Jan 2023 20:41:41 -0800 (PST)
IronPort-SDR: u21Y9zmB1QtVuigVNZynP8tMQaF0vl7SpfvtNHrx2swsOAKXXJAOnlJwNbciYe4IOatch2DMh7
 23qt05qNMGz6I0LBiawB87ztS1vCHZuUGUKfIh6I2Ph8dKbJH+Q4mpZWjD1CKu8q9g6i5yu+ly
 cMajRYGydIpXxWqjCI5Lqnh7HHdKe8RCaSZ/ccYHPfezSDMWnveZTnECgPfR0CwOksxmMNsByd
 Eg5+9sGT73i5FZBoQ+fJ4HMXVpRaNZPhXPASoZCrM25ctGPiiysdUILpmVN/n3qKDIYjMZbxeT
 umQD3YTXHRatcglm4Vm59L5j
X-SMTP-MATCH: 0
X-IPAS-Result: =?us-ascii?q?A2D2AACKVdNj//Qc8jxaHQEBAQEJARIBBQUBSYE0BgELA?=
 =?us-ascii?q?YIsgmCzLYF+DwEPAQFEBAEBhQcChSMmNgcOAQIEAQEBAQMCAwEBAQEBAQMBA?=
 =?us-ascii?q?QYBAQEBAQEGBIEqBwtSBwtYBweBQQuBYRMLAzENhlYCAQMyAQ0BATcBDxk4V?=
 =?us-ascii?q?wYBEoJ+gyOsHIEBgggBAQaCYppngV4JgUABi2CBFIM3ekM/gU6ED26LA5teC?=
 =?us-ascii?q?oE5eIElDkx6gQ8CCQIRdFkDCQMHBUlAAwsYDRYyChMsNQsLShAbGhsHgQYqK?=
 =?us-ascii?q?BUDBAQDAgYTAyICDSgxFAQpEw0nJmkJAgMiYgMDBCgtCT8HJiQ8B1Y3BgIPH?=
 =?us-ascii?q?zcGAwkDAh9PcS8SEgUDCxUqRwQINgUGHDYSAggPEg8sRA5CNzQTBlwBKQsOE?=
 =?us-ascii?q?QNQRxluBIIRBikmnytZNU7FSYN8gVKefUyBRKdml00goxyEKwIKBxaBaQeCB?=
 =?us-ascii?q?00fGYMiTwECAQEBDQECAQEDAQIBAQEJAQEBAY4dgiyRS2E7AgcLAQEDCYwjA?=
 =?us-ascii?q?QE?=
IronPort-PHdr: A9a23:4yEIKRT81z5coemDSoh8cIyqVdpso4vLVj580XJvo7hPbr/l9I7rI
 0LY//krgVrUG4TXrftZ2KLfqau1X2sG7N6atWwaNoZBUhgZhIAXh1kuDMLfWxLyJfK4Y3BlT
 JYbBg1u9SjjY0NeQJmWWg==
IronPort-Data: A9a23:w7D5G6hg7XOKqR9n4YRa9tzEX161RBYKZh0ujC45NGQN5FlHY01je
 htvXDqOOauDMGr1KN9+ad+xoEkC6JTUmNFmS1dl+yo1EH8T9pKYCdrGdxmuM3LMcJ2ZQBM/s
 ZgQZIiadJhtFyXX/T6gY+PrxZVe/fjYHuCmVIYoGczQqStMEnpJZcdLwrZh6mJQqYHlRVvL4
 7semuWHULOf82cc3l88sspvljs/5JwehxtA1rAOTagjUIj2yhH5pLpGTU2AByOQrrt8R4ZWd
 M6fpF2NxV41yj92Yj+TfhcXRWVRKlLaFVDmZnO7wMFOiDAazsA5+v5T2Pbx9S67hh3R9+2dx
 umhurTtd1cQLJ2Pnt8nUhpqHwJuMKlP+ZDIdC3XXcy7lyUqclPmwul1SkosNJIW/fx7R2xL6
 LoZJHYEc3hvhcromPThFrMq3JRldpW3VG8ckigIITXxA+wvR5PrSL/D+tFfxjt2i8VTW/fSI
 cMEAdZqREicO0wSZwhMUPrSms/vvEHaQmdojG7Mnoto4TmK3SB+6YDEZY+9ltuiHp0OzhzC9
 woq5V/RBhAcKczaySWA9XSEmODCh2X4VZgUGbn+8eRl6HWXx2oOGDUMUlaworykkQi4Vs43A
 04Y9y4wpLI/3Fe2VdS7VBq9yENopTZCA58KT7d/slHIkPaIpR2FD3QFRXhdcNMn8sQxQHojy
 zdlgu8FGxQyju2sW0Le8IyurDCANQsFIGsLZAALGF5tD8bYnKk/iRfGT9BGGaGzj8HoFTyY/
 9xshHVu71n0pZBWv5hX7WwrkBrp/cOZEVdpjunDdjv4t1khPNDNi5mAswCz0BpWEGqOZnC81
 JTus/OP4OYDHPlhfwTXGL1VdF1Fz9CIL3XnhkNzH9Ee/jCg4BaekW14vmk7fhszd5xUPGW1P
 AnIpQpN5ZQVIGOlbOl8ZIf3AtlCIUnc+TbNCqy8gjlmOMMZmOq7EMZGPxD44owVuBJw+ZzTw
 L/CGStsZF5DYUid8BK4Rv0GzZggzT0kyGXYSPjTlkr4jeXDOy7OEexdbDNii9zVCovZ8G05F
 P4BaqO3J+l3CryWjtT/q9FIdAtSfRDX+7ir+pcNLYZv3TaK6El6U6SBm+lwE2CUt7hNma/J+
 G2wQElV1DLCaY7vd223h7EKQO2HYKuTWlpiZXF2YgnyhiZ6CWtthY9GH6YKkXAc3LQL5ZZJo
 zMtIq1s29xDFWbK/Sozd574oNAwfRinn1vebSG/aScxeIRsAQHM55nlck3m6XBWXCawsMI/p
 Zym1x/aGMRcHV46VpqHOf//nUmsuXU9mf5pWxWaKNdkeHLqrNpgJRvu360+LMw7IBnewieXi
 lSNChACqOiT/4I4qYGbha2No4qzPfF5G05WQzvS4bqsbHmI9XCq3oFHSurOcDXAEmL4vqy/P
 L0Hw/b5OfwBvVBLr4slTekxl/pku4q+quYDnAp+HXjNY1C6MZ9aIyGLjZtVq6lA5r5Fog/oC
 EiBzdltP+nbMs3SDw9DLQUoWe2PyPUIl2SA9v8yOkj7unN68bfbA0VfOx6A1H5UILdvath3y
 +Y9o4gd8QWghB0wPpCLiz0S9mjKJ2FZC/crsZQTAYnKjAs3ywgcPsaGUnWqscCCO4dWL00nA
 j6In66c1b5S8Ur1dSZhH3b6wrsPjJsDjxlG0VseKgnbgdHCnPI2gkFc/GhlVAhT1Rkbget/N
 nIwbR8rfeDUo20t3pgGBTzwXRpdDQGY8Qrt01QI0mbeSg+hSzWVfmE6PO+M+mEf8n5dJ2YEp
 uvAkjq0ADu6Ltvs2iYSWFJ+r6CxR9JG8FyQkc+qKM2JAp0mbGe3maSpf2cJ9UfqDM5ZaJcrf
 gW2EDucsZHGCBM=
IronPort-HdrOrdr: A9a23:/Hk3eaiPUlhB7KDXeQ15bB/e73BQXgAji2hC6mlwRA09TyX5ra
 qTdTogtCMc7wxhIU3J+7i7VZVoJEmxyXcb2/hzAV7PZmbbUS6TXeVfBOjZslvd8lPFh4xgPM
 5bGsAUNDSzNykcsS+Q2mmF+rgbruVuf82T9J/jJg9WPGRXgrlbnntE4xigYzBLrdZ9dOEE/E
 v13Ls8mwad
X-IronPort-Anti-Spam-Filtered: true
Received: from 60-242-28-244.static.tpgi.com.au (HELO bits.crawford.emu.id.au) ([60.242.28.244])
  by ipmail06.adl3.internode.on.net with ESMTP; 27 Jan 2023 15:11:39 +1030
Received: from agc.crawford.emu.id.au (agc.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc07])
        (authenticated bits=0)
        by bits.crawford.emu.id.au (8.17.1/8.17.1) with ESMTPSA id 30R4fIgf2462776
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
        Fri, 27 Jan 2023 15:41:35 +1100
Authentication-Results: bits.crawford.emu.id.au; arc=none smtp.remote-ip=fdd2:7aad:d478:1::cb10:cc07
DKIM-Filter: OpenDKIM Filter v2.11.0 bits.crawford.emu.id.au 30R4fIgf2462776
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crawford.emu.id.au;
        s=s1; t=1674794495; bh=oORJC5y+9mo7ZhPt1yhalMdHuNwGqVTPdIg1LuUAw6Y=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=mcMSxIkx9Bc3EJ6mbqYm1kPhSjVIyhez8/4aECb1wAUSZJ6yT+cDRAG8gXS/gago+
         gczB6CkK2Mf4VnaqCReWu9sdqpyssEcZG6Q5ofvDy4hsutNlBq6/2PRBsIozPze20o
         wWxtpRQ8CyeiiK/G6Q58U3B5Ktt6S8zfphSsQV5bdkv/LLfqPSmJhp2LG5JGpsPB52
         ugX1lrQIlBOg+dfc4AJKbt3QVvYvUwCWJrnq2gaGig4a1sVH/FblKx5eOgj7IU4U+L
         HNuSF2LY7NDL2q4PI5hwTe1hUHLEpv9Jti7wUQy5uYlJcU6rJfML9vxb6wH8QfNR3Z
         V6gPePlIqlKuQ==
From:   Frank Crawford <frank@crawford.emu.id.au>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org,
        Frank Crawford <frank@crawford.emu.id.au>
Subject: [PATCH v2 2/7] hwmon: (it87) Disable configuration exit for certain chips
Date:   Fri, 27 Jan 2023 15:41:11 +1100
Message-Id: <20230127044116.1257799-3-frank@crawford.emu.id.au>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230127044116.1257799-1-frank@crawford.emu.id.au>
References: <20230127044116.1257799-1-frank@crawford.emu.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4 (bits.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc01]); Fri, 27 Jan 2023 15:41:35 +1100 (AEDT)
X-Virus-Scanned: clamav-milter 0.103.7 at bits.crawford.emu.id.au
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

IT8790E and IT8792E/IT8795E have been identified as chips that can have
issues when disabling configuration mode.

Set to never exit configuration mode.

Signed-off-by: Frank Crawford <frank@crawford.emu.id.au>
---

v2:
 * Make use of new feature flag rather than separate field.

---
 drivers/hwmon/it87.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
index 9d44d1d6f3e9..16130d469180 100644
--- a/drivers/hwmon/it87.c
+++ b/drivers/hwmon/it87.c
@@ -429,7 +429,7 @@ static const struct it87_devices it87_devices[] = {
 		.suffix = "E",
 		.features = FEAT_NEWER_AUTOPWM | FEAT_12MV_ADC | FEAT_16BIT_FANS
 		  | FEAT_TEMP_OFFSET | FEAT_TEMP_PECI | FEAT_IN7_INTERNAL
-		  | FEAT_PWM_FREQ2,
+		  | FEAT_PWM_FREQ2 | FEAT_CONF_NOEXIT,
 		.peci_mask = 0x07,
 	},
 	[it8792] = {
@@ -437,7 +437,7 @@ static const struct it87_devices it87_devices[] = {
 		.suffix = "E",
 		.features = FEAT_NEWER_AUTOPWM | FEAT_16BIT_FANS
 		  | FEAT_TEMP_OFFSET | FEAT_TEMP_OLD_PECI | FEAT_TEMP_PECI
-		  | FEAT_10_9MV_ADC | FEAT_IN7_INTERNAL,
+		  | FEAT_10_9MV_ADC | FEAT_IN7_INTERNAL | FEAT_CONF_NOEXIT,
 		.peci_mask = 0x07,
 		.old_peci_mask = 0x02,	/* Actually reports PCH */
 	},
-- 
2.39.1

