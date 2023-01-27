Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1C22C54EAA
	for <linux-hwmon@archiver.kernel.org>; Fri, 27 Jan 2023 04:41:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229529AbjA0El4 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 26 Jan 2023 23:41:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229496AbjA0Elz (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 26 Jan 2023 23:41:55 -0500
Received: from ipmail06.adl3.internode.on.net (ipmail06.adl3.internode.on.net [150.101.137.16])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id ED46F4FAE0
        for <linux-hwmon@vger.kernel.org>; Thu, 26 Jan 2023 20:41:53 -0800 (PST)
IronPort-SDR: N3hOJY8ovt40HMyze7RZHzp12bDiVi6YAj/Q7hrwKZJryUm6eZcVzBFNMtH3i3ChCsh2j80ZY9
 MztmEVpZtRtxI+GJroJ9Vb+8DoLZnIdXcsImj8i8k0UtTTq76SOnH9TsNbJXAhFNFfYGC7sYcn
 dggKajxMDlEE3qU3IqRb671D9uGzpJtX5nC4j5rb8NM19gk2H8g8hv94bSv/clGmap8iWXdTZz
 G2TEVDAXlnmARpctYMIgi2bdwxnjvsPGAdeuPDIggT+cONu/8/2NxZjzGkcEO310lJ747ngDOP
 MxY6Mjqn7Y/gWssjGO1XupQW
X-SMTP-MATCH: 0
X-IPAS-Result: =?us-ascii?q?A2D7AQCKVdNj//Qc8jxaHQEBAQEJARIBBQUBSYE1BQELA?=
 =?us-ascii?q?YIsgmCzQYFqDwEPAQFEBAEBhQcChSMmNwYOAQIEAQEBAQMCAwEBAQEBAQMBA?=
 =?us-ascii?q?QYBAQEBAQEGBIEqBwtSBwtYBweBQQuBYRMLAwQIJQ2GVgIBAycLAQ0BATcBD?=
 =?us-ascii?q?xk4VwYBEoJ+gyOraTOBAYIIAQEGgmKaZ4FeCYFAAYtggRSDN3pDP4FOglGCL?=
 =?us-ascii?q?IEFgwIEhniOIo08CoE5eIElDkx6gQ8CCQIRdFkDCQMHBUlAAwsYDRYyChMsN?=
 =?us-ascii?q?QsLShAbGhsHgQYqKBUDBAQDAgYTAyICDSgxFAQpEw0nJmkJAgMiYgMDBCgtC?=
 =?us-ascii?q?T8HJiQ8B1Y3BgIPHzcGAwkDAh9PcS8SEgUDCxUqRwQINgUGHDYSAggPEg8sR?=
 =?us-ascii?q?A5CNzQTBlwBKQsOEQNQRxluBIIRBikmnjlrB4EOpDWhYoN8gVKefUyBRKdml?=
 =?us-ascii?q?00goxyEKwIKBxaBeIF/TR8ZgyJPAQIBAQENAQIBAQMBAgEBAQkBAQEBgTOMa?=
 =?us-ascii?q?gwLC4IKkUthOwIHCwEBAwmJSoJZAQE?=
IronPort-PHdr: A9a23:G11Y4BfU+ZHUpUiFXofRbTu9lGM/hYqcDmcuAtIPgbNSaeKo5Z39M
 kvF6bNgiUKPXImd4u8Xw+PMuPXmXmoNqY2ErGhEapFJUAMIzMQOygIsDJTXVkTyIKzmM3NqT
 p0QBlRvpinpOkMNR67D
IronPort-Data: A9a23:FVZ3HKnZ3CYMLjCEg3NbBtbo5gylIERdPkR7XQ2eYbSJt1+Wr1Gzt
 xIdWm6PPf2INGCjctByYYy3pBsHsZaGyIU3T1c4/CA9RXlG8paUVI3DckmrbijPdsbNQBprs
 5sUMYfMcZ5kFnKCjxr8abKJQVtUjPHQHOCgYALn1oGdYSc+FU/NXDo6w7ZRbrZA2IT/W0XX0
 T/Li5W31GWNglaYD0pNg069gEM31BjNkGtwUmwWPZina3eD/5W9JMt3yZCZdxMUcKENdgKJb
 7qrIIWCw4/s10xF5uVJM1rMWhZirrb6ZWBig5fNMkSoqkAqSicais7XOBeAAKtao23hojx/9
 DlCncPtVTorb4CPo9sYcSlzNSR4F/N6yJaSdBBTseTLp6HHW3Ht3+4oB1s/IoMf4OoxDGRTs
 /0UbjkQBvyBr7zuhujnEK821oJ5cJWD0IA34xmMyRnXF/8gQrjIWazV69hC0HE9g90IHPqYb
 tdxhT9HMEiYMkASZQtJYH44tL/riFDGSx5Kk3KEmI49xXXU1ikp/Le4ZbI5ffTRHZ4FxBzJz
 o7cxEz9AxcHJJmf1j+C9FqyieLV2yD2QoQfEPu/7PECqFmSwHEDIAcRWFC45OSizEizR7p3K
 UAZ/jQnt6Ua71GwQ5/2WBjQnZKflkBEHoAMSahguETXlvaS+BqQGmkPCCJZZ91gv8gzAzU3v
 rOUoz/3LWMyrICXGF/ezYiRjwOZHy0TBzE+VQZRGGPp/OLfiI00ixvOSPNqH6i0ksD5FFnML
 9ai8XhWa1I705Nj6kmrwbzUq3f3/ciWF1JdChH/Bz/8tFshOuZJcqTysTDmAeB8wJGxZ2TpU
 JIsoNmS6u0fZX1mvHbVGL1l8F2BwfuaeAbbnEJvV6Yo8zm2k0NPkKgOuHQkeB0saJZBI2O1J
 lTPsB9Q79lPJHSrK6RwZsS4FqzGLJQM9/y5Cpg4jfIUOfCdkTNrGwk0OyatM5jFyhRErE3GE
 c7znAbFJS9y5V5b5DS3XfwB9rQg2zozw2jeLbiikUv7jufBNCXNEu9ZWLdrUgzfxP7UyOky2
 4gCX/ZmNz0FAYUSnwGNrtVKdghaRZTFLc2n8JYMHgJ8HuaWMDp5UK+Lm+JJl31Ng7xa3ubO4
 nynXEJEoGcTdlWZQThnqxlLNtvSYHqIhStjYHZzYgz1hSFLjETGxP53SqbbtIIPrIRLpcOYh
 dFfEylZKvgQGDnB5RoHapzx8N5reBix3FLcNDCsfzY4ZZImSgnUvN7oOALyrXFcAi2yvMo4g
 ruhygKCH8VZHVw4UZ+NZaL91U61sFgchPl2ARnCLO5TT0OwooJkHDOg3PY4LvYFJQjH2jbHh
 R2dBg0VpLeRroJsqIvJiKmIop2HCex7GkYGTWDX4azvZXvR5GO8z4haXKCFeC2bVW+y8bj7P
 bdZyPT1MfsmmldWstMiTOwxlfhjvoDi/uYIwB5lEXPHa0WQJolhenTWj9NSsqBtx6NCvVXkU
 Ey4+u5cZeeDNvT6QQwYKwcSZ+ie0e0Zx2vJ5vMvLUSkuCJ68ebVUUhWOBXQ2iVRIKEva9Evw
 Ps6/sUM4hOxjQAmdNuDk2ZV+yKFMyVYAakgs5gbBq7tixYqkw8dO8aEUHKvu5zfOc9RNkQKI
 yOPgPSQjbprxn3ELyg5G0/SjLhUipk5sRxXyEMPegaSkd3fi/5pgBBcrWYtQgJOwkkV2u5/I
 DMxZRMtYP/SpXIy1I0ZAzzqAB1IGBySvFDpxFpPn2rcCUC1DzSfIGo4MOeL3UYY72MFIGcBp
 unClT++XGa4Ztz10wszRVVh967pQ+t3p1/Ll82QFsiYG4U3PGj+iai0aGtW9xbqDKvdXqEcS
 TWGIQqoVZDGCA==
IronPort-HdrOrdr: A9a23:7YOq/anF2fXxzlbJ1WKuJ6jpFr3pDfL23DAbv31ZSRFFG/Fw9/
 rFoB3U737JYVEqKQgdcbLpAsS9qBbnmaKdjrNhXotKMDOIhILsFvAH0WKA+UyHJ8SBzJ8+6U
 4IScEXY+EYT2IK6voSizPZLz9P+re6GC/Ev5an854Ud3AOV0h51XYENu+EKDwKeOCYP+tDKH
 JMjvA33QadRQ==
X-IronPort-Anti-Spam-Filtered: true
Received: from 60-242-28-244.static.tpgi.com.au (HELO bits.crawford.emu.id.au) ([60.242.28.244])
  by ipmail06.adl3.internode.on.net with ESMTP; 27 Jan 2023 15:11:53 +1030
Received: from agc.crawford.emu.id.au (agc.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc07])
        (authenticated bits=0)
        by bits.crawford.emu.id.au (8.17.1/8.17.1) with ESMTPSA id 30R4fIgj2462776
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
        Fri, 27 Jan 2023 15:41:49 +1100
Authentication-Results: bits.crawford.emu.id.au; arc=none smtp.remote-ip=fdd2:7aad:d478:1::cb10:cc07
DKIM-Filter: OpenDKIM Filter v2.11.0 bits.crawford.emu.id.au 30R4fIgj2462776
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crawford.emu.id.au;
        s=s1; t=1674794509; bh=biKFHKUv+mXskoknmYPVejp/Q75GPmy61AfbzxwGfRY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=TvjNVdTZG/JMbeZrZPr4M1ORFC9SY/HMKqpgr7enynSeEVQbViaOBKr/1+xye30lq
         Q2aU4tbTco6puQmLK+rdZMw8jaCp3FNq1F6NpFTsHwtHEcwJBvSBcrld7CqtXQMsuc
         SqA1tR2ZXa7QEem7hkTNljfMUFbs3HeaH9cTfvKrE74w09XeiRthV7WkqM7f2cl7IV
         XVRA0Pr3CiHK60MZPu6mSKufy2xwCzaoamwNFDW/Q0rVHi8jOp+uQ5VwHAe1lFcIaC
         7L0rWlW7pkPmGtBHADckGO85verjAh2Aq4HHBIUQWkYezvb/pA+z0nKNRKdJ9XarS0
         +6tY8kdvdKgow==
From:   Frank Crawford <frank@crawford.emu.id.au>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org,
        Frank Crawford <frank@crawford.emu.id.au>
Subject: [PATCH v2 6/7] hwmon: (it87) Add new chipset IT87952E
Date:   Fri, 27 Jan 2023 15:41:15 +1100
Message-Id: <20230127044116.1257799-7-frank@crawford.emu.id.au>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230127044116.1257799-1-frank@crawford.emu.id.au>
References: <20230127044116.1257799-1-frank@crawford.emu.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4 (bits.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc01]); Fri, 27 Jan 2023 15:41:49 +1100 (AEDT)
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

v2:
 * Make use of feature flag for definition.

---
 drivers/hwmon/it87.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
index f41da0896097..fdba5873434a 100644
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

