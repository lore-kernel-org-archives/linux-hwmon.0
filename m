Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06469C54E94
	for <linux-hwmon@archiver.kernel.org>; Thu, 26 Jan 2023 04:03:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229729AbjAZEDE (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 25 Jan 2023 23:03:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229537AbjAZEDD (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 25 Jan 2023 23:03:03 -0500
Received: from ipmail06.adl3.internode.on.net (ipmail06.adl3.internode.on.net [150.101.137.16])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id C0B8F12042
        for <linux-hwmon@vger.kernel.org>; Wed, 25 Jan 2023 20:03:01 -0800 (PST)
IronPort-SDR: 0wxu9zT8UyCLwHes9Hdoigz1kqQPKS+HFIwmq+VEbpdnNijNRLlStFLBAuYa1d8IPEE2TcuCtN
 mGAZX9IV+JUfxQYD2MZ1vRor/Ytl6evlqX1C4XAQ+4qXQHaEJG8vOwel5M4PP7/ysJlqggk3pw
 YjIwmN3SV4sfXwlWI9OXTHNo5zL8p5zO8+6TpQ5KYABMqX7buhn5lpPcmZmh5UuAjcM7nwqXuM
 xoRRtGQP5Ji7JpPR9wBvkoMy7D9gFf26JAHK6TECX0aQCxFxRFov17500nF9jEIJzM/KLg29YT
 wMIzu5O8/k04NfwpqQRzUXOM
X-SMTP-MATCH: 0
X-IPAS-Result: =?us-ascii?q?A2B8AQCK+tFjjPQc8jxaHQEBAQEJARIBBQUBSYE1BQELA?=
 =?us-ascii?q?YIsgmCzQYFqDwEPAQFEBAEBhQYChSMmNwYOAQIEAQEBAQMCAwEBAQEBAQMBA?=
 =?us-ascii?q?QYBAQEBAQEGBBQBAQEBQFIHC1IHC1gHB4FBC4FhEwsDBAglDYZWAgEDJwsBD?=
 =?us-ascii?q?QEBNwEPGThXBgESgn6DI6xjM4EBgggBAQaCYppngV4JgUABi2CBFIM3ekM/g?=
 =?us-ascii?q?U6CUYIsgQWDAgSGeI4IjTYKgTl4gSUOTHqBDwIJAhGBLAMJAwcFSUADCxgNF?=
 =?us-ascii?q?jIKEyw1CwtKEBsaGweBBiooFQMEBAMCBhMDIAINKDEUBCkTDScmaQkCAyFfB?=
 =?us-ascii?q?QMDBCgtCT8HJiQ8B1Y3BgIPHzcGAwkDAh9PcS8SEgUDCxUqRwQINgUGHDYSA?=
 =?us-ascii?q?ggPEg8sRA5CNzQTBlwBKQsOEQNQRxluBIIRBikmnhxrB4EOpDWhYoN8gVKef?=
 =?us-ascii?q?UyBRKdml00goxyEKwIKBxaBeIF/TR8ZgyJPAQIBAQENAQIBAQMBAgEBAQkBA?=
 =?us-ascii?q?QEBgTOMagwLAgmCCow4YTsCBwsBAQMJiUqCWQEB?=
IronPort-PHdr: A9a23:WzaKjBxHW4CFrPfXCzPpngc9DxPP853+PxIOrJE9gq1Adb6vuZnnI
 Qre6bNkkQyBVJ/QvvRDjeeeqKX8QSoa7JOGrH1HcYQZWRMJ05dJlgUsUsLZVh2pday4ZCZjR
 JZJXwc6l0w=
IronPort-Data: A9a23:HDoSnKuZPS43na0QsM+aj21Y2+fnVGJYMUV32f8akzHdYApBsoF/q
 tZmKTiBMvaKYTGheNElOo3j9koAu5bXy4I3S1dopHsxQnwaosSdWIqVIBqgY3LLIMaeEx5r4
 cwTM4jMJ849RyGEqEyEP+m6pxGQ94nRFuKmUrKs1gOd5ONAYH184f62s7dh2uaEufDgX0XV/
 4maT/T3YDdJ4RYtWo4pw/vrRC1H7KyaVAww5jTSVdgT1LMJvyR94Do3fMldHlOgKmVmNrfSq
 9XrkNlVyljkEyIFUbtJpFpannoiGdY+NSDW4pZftjPLbhJq/kTe2Y5jXBYQhNs+Zzihx7hMJ
 NtxWZOYZDoyb4rQveInDEcbFQclYp9l2biaPi3q2SCT5xWun3rEyfRyFwc9J4QH9OFtDSdD8
 OFeKTxLZw3ra+Cenur9ELU2wJ5zapO3YOvzuVk5pd3dJfg8SJbAa67Q7MBW2y08wM1LALDfa
 4wQdFKDaTycP0UfawtNU8JWcOGAtiPQWjJAiFuunoE+3U7awj1VzZLoL4+AEjCNbZ4NxRbC/
 DOuE37CKhUbMsGPjDqa93WqrvHAkDm9W48IErC8sPlwjzW7wm0VFQ0+T1y2qvr8l1X4Xd9DQ
 2QW9icqs6Eo+WSwU8LwGRa/pRa5UgU0BYIVSbFgrVvdj/CIv0CCGmEYTzUHdMQptYk9Qjls3
 0Lhc87V6SJHnYCOGFWB07Gu8m3xPw5Ocl0hRChZUl5QizX8m70bghXKR9dlNae6iNzpBD39q
 wxmSgBg3t3/auZVis2GEUD7byGE48OSHlFsum07Skr8s1ojPNb7D2C9wQKDhcusOrp1WXGog
 RDoceCl/ewIAIDleMelGr1VRNlFC96jPSKUullyA5lpyD2p9mXLQGy9yG8mYR01aINeKXqzP
 BOVoh9Y+J5YemeyYq4xaIW0Tc03pUQBKTgHfqyIBjatSsIqHONiwM2JTRTOt10BaGB2zckC1
 W6zKK5A90oyB6V91yaRTOwAy7ItzS1W7TqNGsylkE37i+XGNCX9pVI53L2mMLlRAESs/li9z
 jqjH5Hbo/mieLehOXCMqd57wa4icChlXMieRzNrmh6reVI9SDt7Wpc9MJs9Y4MtnqJJm/3O8
 23VZ6Or4ASXuJEzEi3TMioLVV8adconxZ7NFXB1YwrANrlKSdrH0ZrzgLNoIOl8qLwylaAco
 jtsU5zoP8mjgw/vo1w1BaQRZqQ7HPhyrQ7RbSejfhYleJtsG17A9tP+J1u9/zMHESSwr8d4r
 ri9kALXB5MeHlwwAMHTYfOp7lWwoXlExr0oBhKTfYkLdRW+6pVuJgzwkuQzfZMGJyLD8T3Gh
 QyYNghJ9+DCrrg8/MTNma3Z/ZyiFPFzHxQGEmSCteS2OCDW83CN24hFVOrULznRWHmtqPepf
 +xKwfbmPLsKmUsMsoY6GqsylfAy4N7mprl7yAV4HSyVMA7yU+g/ciGLhJAduLdMy7lVvRqNd
 niOotQKa6+UPM7FEUIKIFR3ZOq01cYSxmvY48MqcRfz6yJA9baaVVlfYkuXgytHIborbI4oz
 LtzuMMS7ADj2BMmPszc1XJe9niXaHcaWropsYsWRoLul0wqxhdLfMWEWCPx5ZiObfRKM1Ure
 2HL3vOb3OsMnkeSIWAuEXXt3PZGgcpcsh59zGgEewaDlO3a160+0xBm+DgqShhYk0dc2OVpN
 2k1a0B4efeU8zFziJQRVmygAVobVkPBvxatkR5TxCiDExXuTXDEMGw2f/qV80Ff+GVZODFGp
 enKxGHgWDfsXcfwwiprBxE/8qW4Eowp+12Qgt2jEuSEA4I+PWjvjJioNDgBpBbQCM8sgFHK+
 Ltx9+FqZKylaSMdrsXX0WVBOWj8lfxcGFF/fA==
IronPort-HdrOrdr: A9a23:9D4sFanxRDAY0MI7lORbdXjtvj7pDfL23DAbv31ZSRFFG/Fw9/
 rFoB3U737JYVEqKQgdcbLpAsS9qBbnmaKdjrNhXotKMDOIhILsFvAH0WKA+UyHJ8SBzJ8+6U
 4IScEXY+EYT2IK6voSizPZLz9P+re6GC/Ev5an854Ud3AOV0h51XYENu+EKDwKeOCYP+tDKH
 JMjvA33QadRQ==
X-IronPort-Anti-Spam-Filtered: true
Received: from 60-242-28-244.static.tpgi.com.au (HELO bits.crawford.emu.id.au) ([60.242.28.244])
  by ipmail06.adl3.internode.on.net with ESMTP; 26 Jan 2023 14:33:00 +1030
Received: from agc.crawford.emu.id.au (agc.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc07])
        (authenticated bits=0)
        by bits.crawford.emu.id.au (8.17.1/8.17.1) with ESMTPSA id 30Q42O5Z1960730
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
        Thu, 26 Jan 2023 15:02:56 +1100
Authentication-Results: bits.crawford.emu.id.au; arc=none smtp.remote-ip=fdd2:7aad:d478:1::cb10:cc07
DKIM-Filter: OpenDKIM Filter v2.11.0 bits.crawford.emu.id.au 30Q42O5Z1960730
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crawford.emu.id.au;
        s=s1; t=1674705776; bh=tdQZHnX3FSPggPw9g2HOssmXYd+rzqSj9YmgIAzCZzo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=TqVXUr7uO5GGuWOI6m29wZJtyJCrVWRojws8W29lIavmeb14wYWVqTMeiW4E9Y2SJ
         +S18zJCRBFG+wAlWhjEDKC3kYCvOw2NQpkpC0+4LmNchLRyP45G2rajgNBqOUlo9yM
         TKgXtD47yYJTys0YpCORUv6RiKi9ICrXqwU8j+twAHm/NdjkQ01F8M46UC1f5xkKmn
         +JYXeu4H05obRtrJmeKNI0MXH2kqA2c7cAxQ8K27m53cL8VayyK0W4NUeEI7r9gCEH
         zu3h2XzYeF7nuiutxWM9R2/rOKaM91r608v5N68+uyysfCfgPXd+9r78eszT9k+G/f
         yd+XDn2uXovqA==
From:   Frank Crawford <frank@crawford.emu.id.au>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org,
        Frank Crawford <frank@crawford.emu.id.au>
Subject: [PATCH v1 6/7] hwmon: (it87) Add new chipset IT87952E
Date:   Thu, 26 Jan 2023 15:02:22 +1100
Message-Id: <20230126040223.986189-7-frank@crawford.emu.id.au>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230126040223.986189-1-frank@crawford.emu.id.au>
References: <20230126040223.986189-1-frank@crawford.emu.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4 (bits.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc01]); Thu, 26 Jan 2023 15:02:56 +1100 (AEDT)
X-Virus-Scanned: clamav-milter 0.103.7 at bits.crawford.emu.id.au
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Add IT87952E, a new chip ID (DEV ID 0x8695), which appears to be an
updated version of the IT8792E and takes the same configuration.

The model name comes from the model name printed on the chip.

There is no datasheet publicly available.

Signed-off-by: Frank Crawford <frank@crawford.emu.id.au>
---
 drivers/hwmon/it87.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
index e8eeedd23bee..85ecc61dbf9e 100644
--- a/drivers/hwmon/it87.c
+++ b/drivers/hwmon/it87.c
@@ -34,6 +34,7 @@
  *            IT8786E  Super I/O chip w/LPC interface
  *            IT8790E  Super I/O chip w/LPC interface
  *            IT8792E  Super I/O chip w/LPC interface
+ *            IT87952E  Super I/O chip w/LPC interface
  *            Sis950   A clone of the IT8705F
  *
  *  Copyright (C) 2001 Chris Gauthron
@@ -63,7 +64,7 @@
 
 enum chips { it87, it8712, it8716, it8718, it8720, it8721, it8728, it8732,
 	     it8771, it8772, it8781, it8782, it8783, it8786, it8790,
-	     it8792, it8603, it8620, it8622, it8628 };
+	     it8792, it8603, it8620, it8622, it8628, it87952 };
 
 static struct platform_device *it87_pdev[2];
 
@@ -160,6 +161,7 @@ static inline void superio_exit(int ioreg, bool doexit)
 #define IT8622E_DEVID 0x8622
 #define IT8623E_DEVID 0x8623
 #define IT8628E_DEVID 0x8628
+#define IT87952E_DEVID 0x8695
 #define IT87_ACT_REG  0x30
 #define IT87_BASE_REG 0x60
 
@@ -470,6 +472,15 @@ static const struct it87_devices it87_devices[] = {
 		  | FEAT_SIX_TEMP | FEAT_VIN3_5V,
 		.peci_mask = 0x07,
 	},
+	[it87952] = {
+		.name = "it87952",
+		.model = "IT87952E",
+		.features = FEAT_NEWER_AUTOPWM | FEAT_16BIT_FANS
+		  | FEAT_TEMP_OFFSET | FEAT_TEMP_OLD_PECI | FEAT_TEMP_PECI
+		  | FEAT_10_9MV_ADC | FEAT_IN7_INTERNAL,
+		.peci_mask = 0x07,
+		.old_peci_mask = 0x02,	/* Actually reports PCH */
+	},
 };
 
 #define has_16bit_fans(data)	((data)->features & FEAT_16BIT_FANS)
@@ -2501,6 +2512,10 @@ static int __init it87_find(int sioaddr, unsigned short *address,
 	case IT8628E_DEVID:
 		sio_data->type = it8628;
 		break;
+	case IT87952E_DEVID:
+		sio_data->type = it87952;
+		doexit = false;	/* See IT8792E comment above */
+		break;
 	case 0xffff:	/* No device at all */
 		goto exit;
 	default:
-- 
2.39.1

