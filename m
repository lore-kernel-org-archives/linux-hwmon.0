Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 727C1C27C76
	for <linux-hwmon@archiver.kernel.org>; Sat, 28 Jan 2023 06:04:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231918AbjA1GEQ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 28 Jan 2023 01:04:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229562AbjA1GEO (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 28 Jan 2023 01:04:14 -0500
Received: from ipmail06.adl3.internode.on.net (ipmail06.adl3.internode.on.net [150.101.137.16])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 502E7834A5
        for <linux-hwmon@vger.kernel.org>; Fri, 27 Jan 2023 22:04:13 -0800 (PST)
IronPort-SDR: SUu1bswPxTaKfMf4SXUUqn2NIDWVdAabOdaLWj3YhB13EOchm5I8ZldHrvBg9P0PLukv6B9n0I
 2+wTKX1Wr7Nrnp+cKa7NX2ZLjfbGT1iVmG2gcTFxDjeMe8QCUkf0a/ZmSpJqGRNuz70dBo7/XD
 Y3SavCVmRWuc62DeK0V4FlaBioa+8bpYywaPNEBnPqIjRHXzOG/pv2UwWueVNVh5iqZcHbQqag
 b209ApT2g3A5jfUEYWpXh+BXj2Nxsrf94Yuzs8HSTXqLH1EmfgLbIZEoxU97H7mf3PFk5sBtwN
 30+Q5BFeRXy5aKlIR4knR2hq
X-SMTP-MATCH: 0
X-IPAS-Result: =?us-ascii?q?A2D7AQBJutRj//Qc8jxaHQEBAQEJARIBBQUBSYE1BQELA?=
 =?us-ascii?q?YIsgmCVbZ1UgWoPAQ8BAUQEAQGFBwKFJSY3Bg4BAgQBAQEBAwIDAQEBAQEBA?=
 =?us-ascii?q?wEBBgEBAQEBAQYEgSoHC1IHC1gHB4FBC4FhEwsDBAglDYZWAgEDJwsBDQEBN?=
 =?us-ascii?q?wEPGThXBgESgn6DI6puM4EBgggBAQaCYppngV4JgUABi2GBFIM2ekM/gU6CU?=
 =?us-ascii?q?YIsgQWDAgSGeI4xjUIKgTl3gSUOTHqBDwIJAhF0eQMJAwcFSUADCxgNFjIKE?=
 =?us-ascii?q?yw1CwtKEBsaGweBBiooFQMEBAMCBhMDIAINKDEUBCkTDScmaQkCAyJfBQMDB?=
 =?us-ascii?q?CgtCT8HJiQ8B1Y3BgIPHzcGAwkDAh9QcS8SEgUDCxUqRwQINgUGHDYSAggPE?=
 =?us-ascii?q?g8sQw5CNzQTBlwBKQsOEQNQRhluBIIMCgYpJp5OawYBgQ6kNqFjg36BUp5+T?=
 =?us-ascii?q?IFEp2uXTyCjHIQrAgoHFoF4gX9NHxmDIk8BAgEBAQ0BAgEBAwECAQEBCQEBA?=
 =?us-ascii?q?QGBM4xqDAsLggqRS2E7AgcLAQEDCYlKglkBAQ?=
IronPort-PHdr: A9a23:5Fz/+RULpmWk8H069r7iW9kz6mfV8K3KAWYlg6HPw5pEc7i4uZ/4N
 VPR4u9hylLMQMPa57RNlrmeurrrDGoH55vJq3UeaNpWWhoClchTnhR1DsKJUx+kJffmPSBmQ
 5QQDQ039HviaRpeE56hD2A=
IronPort-Data: A9a23:k3D576w1ElGyydQkE/16t+cawCrEfRIJ4+MujC+fZmUNrF6WrkUDz
 2YdUG/Sb/2NYGH1et8lPI2380MD7ZLXnYVjSwJq+3w9QSlAoJbLC93JIxmub37NJMaeEUk/t
 8kSO9CafJk4Z3KN/R3F3prJ9Ckkj/vULlbf5E8oHggrGGeInQ940UoLd9YR29Iu2Z7ja++0k
 YuaT/f3YTdJ5hYtWo4qw/LbwP9QlKyaVAMw5jTSstgW1LN2vyB94KM3fcldHVOhKmVnNrLSq
 9L48V2M1jixEyHBqz+Suu2TnkUiGtY+NOUV45Zcc/DKbhNq/kTe3kunXRYRQR8/ttmHozx+4
 MddkY2dQCQ4B5PdmcokVRp+AXtBDZQTrdcrIVDn2SCS50fHb2CqyO9nE08xJ4Fe9+NqR2BCs
 /UFQNwPRk7bwbjqmvThGq822phLwMrDZevzvllu1zjfDt4tW5ncTaLQ6ZlV2Sp2h8wIFOu2i
 88xNWY2NEyaOUQWUrsRILUygt6BgSn1SgddtVDOiYAJwVPW6hMkhdABN/KOIofaH58E9qqCn
 UrC/mLkElQaK9mYzxKb/X+2wOzChyX2XMQVDrLQ3vprhkCD7nYUBRYVEEag5/+0liaWWd5SL
 1Id4CcGtrUp+QqgSdyVYvGjiCDc+0RAAZ8KQ6hgtF3L0bbd/weSQHQcQT8HY9sj8sYrLdA36
 rOXt8H5IS1CuZ6EcEyM95mtqzCUK3IqHVZXMEfoUjA5y9XkpYgyiDfGQdBiDLO5g7XJ9dfYn
 WjiQM8W2eh7sCIb60mo1RWc2GLz/8Shohodv1iOBDr9sGuVcab/P+SVBU7nAeFoBbvxorOph
 2kIncWPhAzlJcvVzHTlrAklOry2r82CLSHcyWFmG5Q6nwlBFlb9JcUKvGs7fhcsaJpYPyT1a
 VPSskVN/JBSenCtaOl+fupd6vjGL4C8SbwJtdiONbKih6SdkifdpEmCgmbKgQjQfLAEy/1XB
 HtiWZ/E4LZzIf0PIMCKb+kcy6Q34Ss12HneQ5v2pzz+j+XCNCLJE+1bbQHeBgzc0E9iiFuNm
 zq4H5XXoyizrMWkM0E7DKZJcgtRdiVhbXwIg5EGLLbaSuaZJI3RI6SJmuN7Id0Nc1V9iv/Ht
 nC7RkJCzlfj7UAr2i3UAk2OqdrHA/5CkJ7MFXVyZgb4hyR/P9zHAWV2X8JfQITLPddLlZZcJ
 8Tpse3ZX5yjkxzLpGYQa4fTtotneEj5jA6CJXP1MjMldoFuQBbFvNLhY03u+G8HE3Pv58c5p
 rSh0CLdQIYCHlo9VpyHM6L0l17h72IAnO9SXlfTJocBckvb8L9sd377gMgocpMFJhj0zzeH0
 xqbXEUDru7Xro5rrNTE3PjWr4qgH+ZkMFBdGm3XseS/OSXApzrxypVJT+iPZzybWWbpvqSuI
 +xIlqmuPPoClVdMkox9D7cyk/1kvYq09+QCw109TnvRblmtBrdxGVW83JFC5v9X27tUmQqqQ
 UbRqNNUDrW+Pp+3GlAmO1t3Z+uO4vgYhz3O4KlnO079/iJ2ouaKXEgObRmBjCtRcOl8PI8/m
 7xzss8K8Eq0kBM1PNGcgmZZ8nnKL3BGWrh+7sMWB4riiwwKzFBeYMWCVXWsscrfMI1BYhswP
 zuZpKvenLAClEDMRHoEEySf1+RqmsVcsR9H+1YOOlCVl4eXnfQwxhBQr2g6Q1gH1BlByO4va
 GFnO1cuf/fQp3Iy2JIGBTDpQV0dQgaF81DwwB0VjGLYCUKvUyrEMTRla+qK+UkY9UNafyRap
 e/Hkjy0CmaxJMyhjDEvXUNFquD4SYAj/AP1npH1FsuIKJA2fD75j/L8fmEPsRbmX588iUCvS
 TOGJwqshXAX7RItnpA=
IronPort-HdrOrdr: A9a23:k+qo96turc6dU0D9ben1SJrL7skDrNV00zEX/kB9WHVpm6yj/f
 xGUs576faSskdpZJlD8ersBEDkex/hHPFOkOos1NuZMzUO/VHYSL2KjrGSpQEIZReOlNK1vJ
 0IG8ND4Z/LfD9HZK3BgDVQfexP/DEJnZrY/ds2t00dKD2Cc5sQkzuRFDzrb3GemzM2fqbQxf
 Knl7B6mwY=
X-IronPort-Anti-Spam-Filtered: true
Received: from 60-242-28-244.static.tpgi.com.au (HELO bits.crawford.emu.id.au) ([60.242.28.244])
  by ipmail06.adl3.internode.on.net with ESMTP; 28 Jan 2023 16:33:50 +1030
Received: from agc.crawford.emu.id.au (agc.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc07])
        (authenticated bits=0)
        by bits.crawford.emu.id.au (8.17.1/8.17.1) with ESMTPSA id 30S63ChE2973396
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
        Sat, 28 Jan 2023 17:03:46 +1100
Authentication-Results: bits.crawford.emu.id.au; arc=none smtp.remote-ip=fdd2:7aad:d478:1::cb10:cc07
DKIM-Filter: OpenDKIM Filter v2.11.0 bits.crawford.emu.id.au 30S63ChE2973396
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crawford.emu.id.au;
        s=s1; t=1674885826; bh=19grbD9CHxWwx1gqWLdWJwdaLqN//6Gte74Urgo9rwc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=sWUZd1TxAA5SOgAUEpO9hq9b10vcPynD6nbwKbMjKgOzS1OPBNdjdTUShhcRk5/yA
         lkgYu8+Hn7/NpkHoPpGjYDxPjmnDbGK5nhAhrIQsVZRipXaMEBOLpTajZo0irr1Rtu
         jYpAfeUPagFysxu8Kuj6jzxkhMnaNNFysIxWwNj3qG8AMPZ4O6hjLcNzW3anARW9HC
         L73edngsj8S7bcDZrq5GacI+WKc2cyEIEC5ncouevrLD6WLCyouMQfOTp72+pbtnR8
         QRsBYzFBWcdBNO47FEU9eKCChLSzEW/B0e53J3xa/4ex0vaErl796qPiWLHX6Ejv7A
         dytfzRjoAgguA==
From:   Frank Crawford <frank@crawford.emu.id.au>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org,
        Frank Crawford <frank@crawford.emu.id.au>
Subject: [PATCH v3 6/7] hwmon: (it87) Add new chipset IT87952E
Date:   Sat, 28 Jan 2023 17:03:07 +1100
Message-Id: <20230128060308.1549707-7-frank@crawford.emu.id.au>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230128060308.1549707-1-frank@crawford.emu.id.au>
References: <20230128060308.1549707-1-frank@crawford.emu.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4 (bits.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc01]); Sat, 28 Jan 2023 17:03:46 +1100 (AEDT)
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

v3:
 * No change.

v2:
 * Make use of feature flag for definition.

---
 drivers/hwmon/it87.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
index 83de34119d74..6b2b2776d8c2 100644
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
 
@@ -160,6 +161,7 @@ static inline void superio_exit(int ioreg, bool noexit)
 #define IT8622E_DEVID 0x8622
 #define IT8623E_DEVID 0x8623
 #define IT8628E_DEVID 0x8628
+#define IT87952E_DEVID 0x8695
 #define IT87_ACT_REG  0x30
 #define IT87_BASE_REG 0x60
 
@@ -477,6 +479,15 @@ static const struct it87_devices it87_devices[] = {
 		  | FEAT_SIX_TEMP | FEAT_VIN3_5V,
 		.peci_mask = 0x07,
 	},
+	[it87952] = {
+		.name = "it87952",
+		.model = "IT87952E",
+		.features = FEAT_NEWER_AUTOPWM | FEAT_16BIT_FANS
+		  | FEAT_TEMP_OFFSET | FEAT_TEMP_OLD_PECI | FEAT_TEMP_PECI
+		  | FEAT_10_9MV_ADC | FEAT_IN7_INTERNAL | FEAT_CONF_NOEXIT,
+		.peci_mask = 0x07,
+		.old_peci_mask = 0x02,	/* Actually reports PCH */
+	},
 };
 
 #define has_16bit_fans(data)	((data)->features & FEAT_16BIT_FANS)
@@ -2497,6 +2508,9 @@ static int __init it87_find(int sioaddr, unsigned short *address,
 	case IT8628E_DEVID:
 		sio_data->type = it8628;
 		break;
+	case IT87952E_DEVID:
+		sio_data->type = it87952;
+		break;
 	case 0xffff:	/* No device at all */
 		goto exit;
 	default:
-- 
2.39.1

