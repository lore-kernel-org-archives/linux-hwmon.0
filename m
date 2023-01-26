Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28FE0C54E94
	for <linux-hwmon@archiver.kernel.org>; Thu, 26 Jan 2023 04:02:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229630AbjAZEC4 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 25 Jan 2023 23:02:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229537AbjAZECy (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 25 Jan 2023 23:02:54 -0500
Received: from ipmail06.adl3.internode.on.net (ipmail06.adl3.internode.on.net [150.101.137.16])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 4F99493EA
        for <linux-hwmon@vger.kernel.org>; Wed, 25 Jan 2023 20:02:52 -0800 (PST)
IronPort-SDR: +ZBDV/WWHdNET8LtLiA+qXJL43EZseSRQlgygQvjo+MHv2fQZi+LhOrvZMxX2PT/9tL3cKzZrl
 BXTOo6fYSYwQUHyE4oewd7LYswUcGCyNgxIKVCDAvm//EOtVOi8jFUSgO1or73906tJd5JtpAW
 JKHMSVvjZ89bFLsi0cjV2l+RCVvGL6xcxJC+he37kbOnBl5GV94SbH7OEK0xjgcNE7km3pVWIa
 hnsBhDnRbYx4VBMuplI4xI8i96PUHvmfU6xe8+csuFh5PQtVSetcZ8FkZiDrZFTIRm1djUHtTg
 M8hhszgle2YZ6B2seybILm9F
X-SMTP-MATCH: 0
X-IPAS-Result: =?us-ascii?q?A2B8AQCK+tFjjPQc8jxaHQEBAQEJARIBBQUBSYE1BQELA?=
 =?us-ascii?q?YIsgmC1Kw8BDwEBRAQBAYUGAoUjJjcGDgECBAEBAQEDAgMBAQEBAQEDAQEGA?=
 =?us-ascii?q?QEBAQEBBgQUAQEBAUBSBwtSBwtYBweBQQuBYRMLAzENhlYCAQMnCwENAQE3A?=
 =?us-ascii?q?Q8ZOFcGARKCfoMjrGMzgQGCCAEBBoJimmeBXgmBQAGLYIEUgzd6Qz+BToR9i?=
 =?us-ascii?q?wObPgqBOXiBJQ5MeoEPAgkCEYEsAwkDBwVJQAMLGA0WMgoTLDULC0oQGxobB?=
 =?us-ascii?q?4EGKigVAwQEAwIGEwMgAg0oMRQEKRMNJyZpCQIDIV8FAwMEKC0JPwcmJDwHV?=
 =?us-ascii?q?jcGAg8fNwYDCQMCH09xLxISBQMLFSpHBAg2BQYcNhICCA8SDyxEDkI3NBMGX?=
 =?us-ascii?q?AEpCw4RA1BHGW4EghEGKSaeHHKBDpVejlehYoN8gVKefUyBRKdml00goxyEK?=
 =?us-ascii?q?wIKBxaBeIF/TR8ZO4JnTwECAQEBDQECAQEDAQIBAQEJAQEBAY4dGYITjDhhO?=
 =?us-ascii?q?wIHCwEBAwmMIwEB?=
IronPort-PHdr: A9a23:8YyZgBRr7MPjUFnwxSPDCIXqJNpso4vLVj580XJvo7hPbr/l9I7rI
 0LY//krgVrUG4TXrftZ2KLfqau1X2sG7N6atWwaNoZBUhgZhIAXh1kuDMLfWxLyJfK4Y3BlT
 JYbBg1u9SjjY0NeQJmWWg==
IronPort-Data: A9a23:Mc78faxe93F62Qf7GN16t+cDwCrEfRIJ4+MujC+fZmUNrF6WrkUFm
 GUaXz3VbP/bYmbzfdt2ao3k9B5UvZXQn9JiSgI6pCAxQ3kV+ZudDN2XcBz6ZXPJJJyaHBM25
 ZpGZ4nJIM5vZ3KN/R3F3prJ9Ckkj/vULlbf5E8oHggrGGeInQ940UoLd9YR29Iu2Z7ja++0k
 YuaT/f3YTdJ5hYtWo4qw/LbwP9QlKyaVAMw5jTSstgW1LN2vyB94KM3fcldHVOhKmVnNrLSq
 9L48V2M1jixEyHBqz+Suu2TnkUiGtY+NOUV45Zcc/DKbhNq/kTe3kunXRYRQR8/ttmHozx+4
 Ptk7pi3bRo0Aqnviu0YThlHIwhAAYQTrdcrIVDn2SCS50fHb2CqyO9nE08xJ4Fe9+NqR2BCs
 /UFQNwPRk7bwbjqmvThGq822phLwMrDZevzvllu1zjfDt4tW5ncTaLQ6ZlV2Sp2h8wIFOu2i
 88xNWY3PEWcOUcSUrsRIMsnwuWUhVPBSiB361W5qqNn5EPonTUkhdABN/KOIofaH58E9qqCn
 UrC/mLkElQaK9mYzxKb/X+2wOzChyX2XMQVDrLQ3vprhkCD7nYUBRYVEEag5/+0liaWWd5SL
 1Id4CcGtrUp+QqgSdyVYvGjiCDc+0RAAZ8KQ6hgtF3L0bbd/weSQHQcQT8HY9sj8sYrLdA36
 rOXt/3AXjholKCIdXa+5L6RsDOtCQErEUZXMEfoUjA5y9XkpYgyiDfGQdBiDLO5g7XJ9dfYn
 WniQM8W2eh7sCIb60mo1RWc2GLz/8Shohodv1iOBDr9sGuVcab/P+SVBU7nAeFoBbvxorOph
 2kIncWPhAzlJcvVzHTlrAklOry2r82CLSHcyWFmG5Q6nwlBFlb9JcUKvGs7fhcsaJpYPyT1a
 VPSskVN/JBSenCtaOl+fupd6vjGL4C8SbwJtdiONbKih6SdkyfdoklTiba4hTyFraTVufhX1
 W2nWcitF20GLq9s0SC7QewQuZdymH9imzyKGcqkl0T8uVZ7WJJzYelcWLdpRr5khJ5oXC2Po
 r6zyuPQlE4GC7WuCsUp2dNDcwlSRZTEOXwGg5cPLb7ZeFsO9JAJF+feibInZ4F/malJ/tokD
 VnjMnK0PGHX3CWdQThmn1g/MNsDq74j9CxnVcHtVH70s0UejXGHs/pPLMdnLOF5nAGhpNYtJ
 8Q4lwy7KqwnYlz6F/41NPERdaRuK0amgxygJS2gbGRtdpJsXVWZqNT+dxTh8zMCSCeyqI0/r
 /upy1qDE5YEQg1jCufQae6ulg3u5yFEw70sDkaYcMNOfEjM8ZRxL3KjhPEAI/YKdUfJyAyFh
 lSfDhovrOXQp5M4rYvSjqeeoob3T+ZzRxIIH2TS4busGzPd+26vnd1JXOqSJGCPX3n956ulf
 +kTwvThdvwL2l9X6tIuH7FuxKM4xt3uu74DkFs+RSyQMAr6B+o5cHec3MRJuqlc/ZNjuFO7C
 hCV591XGbSVI8e7QlQfEwoSaLjR3/8jhWiA5Ps4F0z2+Str8efVSk5VJRSN1nBQIbYpYoMox
 eAt5Jwf5wCl0EF4ONealWZf7W2TIHsaX+Mqs4xcAYOtgxdykgNOZpnVCynX5pCTaowSbRNze
 2TL2vvP1+ZG207PU3svDnyTj+BTspQ5vkwYxlE1OAXbk9XIsfY7wRlN/GllVQ9S1BhGjb5+N
 zQ5LUFzPqnSrT5kiNIYBTLyQ0QbWEfcoBy0kQdV0nbFRlWpXSrRNGI8f+2K+QYQ7jsELDRc+
 biZzkfjUCrrJZ+uhHJrAhE7+vGzH8Zs8gDimdy8G5jXFZcNZ2u3i6CjUmMEth/7DJ5jn0bAv
 +Rrorp9ZKCT2fT8eEHn51R2DYgtdS0=
IronPort-HdrOrdr: A9a23:PIrpzan2llt4ddL2JStt2jzxAZ/pDfL23DAbv31ZSRFFG/Fw9/
 rFoB3U737JYVEqKQgdcbLpAsS9qBbnmaKdjrNhXotKMDOIhILsFvAH0WKA+UyHJ8SBzJ8+6U
 4IScEXY+EYT2IK6voSizPZLz9P+re6GC/Ev5an854Ud3AOV0h51XYENu+EKDwKeOCYP+tDKH
 JMjvA33QadRQ==
X-IronPort-Anti-Spam-Filtered: true
Received: from 60-242-28-244.static.tpgi.com.au (HELO bits.crawford.emu.id.au) ([60.242.28.244])
  by ipmail06.adl3.internode.on.net with ESMTP; 26 Jan 2023 14:32:49 +1030
Received: from agc.crawford.emu.id.au (agc.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc07])
        (authenticated bits=0)
        by bits.crawford.emu.id.au (8.17.1/8.17.1) with ESMTPSA id 30Q42O5W1960730
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
        Thu, 26 Jan 2023 15:02:45 +1100
Authentication-Results: bits.crawford.emu.id.au; arc=none smtp.remote-ip=fdd2:7aad:d478:1::cb10:cc07
DKIM-Filter: OpenDKIM Filter v2.11.0 bits.crawford.emu.id.au 30Q42O5W1960730
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crawford.emu.id.au;
        s=s1; t=1674705765; bh=72KEhg2VuK+8YcxrcFPd3+rUbQfNLdkE87+BGsoGkoI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=oULfo4EP7b0X10hcwtVrBuWxCW9XFVG1Lla7Gvp9GCFQKYGPXDnTH53vDQZODtsgg
         SM9zh733sEsSDJ1B1+h1IaZBOXKEAkLjYSi0ffTHlskAtPSLudVIhPOBhwA1k1VTGq
         5sRbR6QywNixLbM9VUYZrUVS3hwVnVePIbz07wZsKLMyJNmIDaKqVN+WXKCPdEh34I
         20M9MfNppWOYu2t9XzBfsOLsHl2vyVy+dj4HJ1RCRJDRIOvxZmM/Jy1m5wSe8bWGln
         2miOykjlg1X7t+oFD2ZL3ExKbyofQRtPEDU4mWtXjvp+0saDLTiJfHdohUVDiDzCL1
         l+hs/aINANrfg==
From:   Frank Crawford <frank@crawford.emu.id.au>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org,
        Frank Crawford <frank@crawford.emu.id.au>
Subject: [PATCH v1 3/7] hwmon: (it87) List full chip model name
Date:   Thu, 26 Jan 2023 15:02:19 +1100
Message-Id: <20230126040223.986189-4-frank@crawford.emu.id.au>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230126040223.986189-1-frank@crawford.emu.id.au>
References: <20230126040223.986189-1-frank@crawford.emu.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4 (bits.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc01]); Thu, 26 Jan 2023 15:02:45 +1100 (AEDT)
X-Virus-Scanned: clamav-milter 0.103.7 at bits.crawford.emu.id.au
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

ITE model names do not always match the chip ID.

Convert from just adding a suffix to specifying the full model name.

Signed-off-by: Frank Crawford <frank@crawford.emu.id.au>
---
 drivers/hwmon/it87.c | 46 ++++++++++++++++++++++----------------------
 1 file changed, 23 insertions(+), 23 deletions(-)

diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
index c5e46b94f0b8..16394b38dce3 100644
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
@@ -306,24 +306,24 @@ struct it87_devices {
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
@@ -331,7 +331,7 @@ static const struct it87_devices it87_devices[] = {
 	},
 	[it8720] = {
 		.name = "it8720",
-		.suffix = "F",
+		.model = "IT8720F",
 		.features = FEAT_16BIT_FANS | FEAT_TEMP_OFFSET | FEAT_VID
 		  | FEAT_TEMP_OLD_PECI | FEAT_FAN16_CONFIG | FEAT_FIVE_FANS
 		  | FEAT_PWM_FREQ2,
@@ -339,7 +339,7 @@ static const struct it87_devices it87_devices[] = {
 	},
 	[it8721] = {
 		.name = "it8721",
-		.suffix = "F",
+		.model = "IT8721F",
 		.features = FEAT_NEWER_AUTOPWM | FEAT_12MV_ADC | FEAT_16BIT_FANS
 		  | FEAT_TEMP_OFFSET | FEAT_TEMP_OLD_PECI | FEAT_TEMP_PECI
 		  | FEAT_FAN16_CONFIG | FEAT_FIVE_FANS | FEAT_IN7_INTERNAL
@@ -349,7 +349,7 @@ static const struct it87_devices it87_devices[] = {
 	},
 	[it8728] = {
 		.name = "it8728",
-		.suffix = "F",
+		.model = "IT8728F",
 		.features = FEAT_NEWER_AUTOPWM | FEAT_12MV_ADC | FEAT_16BIT_FANS
 		  | FEAT_TEMP_OFFSET | FEAT_TEMP_PECI | FEAT_FIVE_FANS
 		  | FEAT_IN7_INTERNAL | FEAT_PWM_FREQ2,
@@ -357,7 +357,7 @@ static const struct it87_devices it87_devices[] = {
 	},
 	[it8732] = {
 		.name = "it8732",
-		.suffix = "F",
+		.model = "IT8732F",
 		.features = FEAT_NEWER_AUTOPWM | FEAT_16BIT_FANS
 		  | FEAT_TEMP_OFFSET | FEAT_TEMP_OLD_PECI | FEAT_TEMP_PECI
 		  | FEAT_10_9MV_ADC | FEAT_IN7_INTERNAL,
@@ -366,7 +366,7 @@ static const struct it87_devices it87_devices[] = {
 	},
 	[it8771] = {
 		.name = "it8771",
-		.suffix = "E",
+		.model = "IT8771E",
 		.features = FEAT_NEWER_AUTOPWM | FEAT_12MV_ADC | FEAT_16BIT_FANS
 		  | FEAT_TEMP_OFFSET | FEAT_TEMP_PECI | FEAT_IN7_INTERNAL
 		  | FEAT_PWM_FREQ2,
@@ -378,7 +378,7 @@ static const struct it87_devices it87_devices[] = {
 	},
 	[it8772] = {
 		.name = "it8772",
-		.suffix = "E",
+		.model = "IT8772E",
 		.features = FEAT_NEWER_AUTOPWM | FEAT_12MV_ADC | FEAT_16BIT_FANS
 		  | FEAT_TEMP_OFFSET | FEAT_TEMP_PECI | FEAT_IN7_INTERNAL
 		  | FEAT_PWM_FREQ2,
@@ -390,28 +390,28 @@ static const struct it87_devices it87_devices[] = {
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
@@ -419,7 +419,7 @@ static const struct it87_devices it87_devices[] = {
 	},
 	[it8790] = {
 		.name = "it8790",
-		.suffix = "E",
+		.model = "IT8790E",
 		.features = FEAT_NEWER_AUTOPWM | FEAT_12MV_ADC | FEAT_16BIT_FANS
 		  | FEAT_TEMP_OFFSET | FEAT_TEMP_PECI | FEAT_IN7_INTERNAL
 		  | FEAT_PWM_FREQ2,
@@ -427,7 +427,7 @@ static const struct it87_devices it87_devices[] = {
 	},
 	[it8792] = {
 		.name = "it8792",
-		.suffix = "E",
+		.model = "IT8792E/IT8795E",
 		.features = FEAT_NEWER_AUTOPWM | FEAT_16BIT_FANS
 		  | FEAT_TEMP_OFFSET | FEAT_TEMP_OLD_PECI | FEAT_TEMP_PECI
 		  | FEAT_10_9MV_ADC | FEAT_IN7_INTERNAL,
@@ -436,7 +436,7 @@ static const struct it87_devices it87_devices[] = {
 	},
 	[it8603] = {
 		.name = "it8603",
-		.suffix = "E",
+		.model = "IT8603E",
 		.features = FEAT_NEWER_AUTOPWM | FEAT_12MV_ADC | FEAT_16BIT_FANS
 		  | FEAT_TEMP_OFFSET | FEAT_TEMP_PECI | FEAT_IN7_INTERNAL
 		  | FEAT_AVCC3 | FEAT_PWM_FREQ2,
@@ -444,7 +444,7 @@ static const struct it87_devices it87_devices[] = {
 	},
 	[it8620] = {
 		.name = "it8620",
-		.suffix = "E",
+		.model = "IT8620E",
 		.features = FEAT_NEWER_AUTOPWM | FEAT_12MV_ADC | FEAT_16BIT_FANS
 		  | FEAT_TEMP_OFFSET | FEAT_TEMP_PECI | FEAT_SIX_FANS
 		  | FEAT_IN7_INTERNAL | FEAT_SIX_PWM | FEAT_PWM_FREQ2
@@ -453,7 +453,7 @@ static const struct it87_devices it87_devices[] = {
 	},
 	[it8622] = {
 		.name = "it8622",
-		.suffix = "E",
+		.model = "IT8622E",
 		.features = FEAT_NEWER_AUTOPWM | FEAT_12MV_ADC | FEAT_16BIT_FANS
 		  | FEAT_TEMP_OFFSET | FEAT_TEMP_PECI | FEAT_FIVE_FANS
 		  | FEAT_FIVE_PWM | FEAT_IN7_INTERNAL | FEAT_PWM_FREQ2
@@ -462,7 +462,7 @@ static const struct it87_devices it87_devices[] = {
 	},
 	[it8628] = {
 		.name = "it8628",
-		.suffix = "E",
+		.model = "IT8628E",
 		.features = FEAT_NEWER_AUTOPWM | FEAT_12MV_ADC | FEAT_16BIT_FANS
 		  | FEAT_TEMP_OFFSET | FEAT_TEMP_PECI | FEAT_SIX_FANS
 		  | FEAT_IN7_INTERNAL | FEAT_SIX_PWM | FEAT_PWM_FREQ2
@@ -2520,8 +2520,8 @@ static int __init it87_find(int sioaddr, unsigned short *address,
 	err = 0;
 	sio_data->sioaddr = sioaddr;
 	sio_data->revision = superio_inb(sioaddr, DEVREV) & 0x0f;
-	pr_info("Found IT%04x%s chip at 0x%x, revision %d\n", chip_type,
-		it87_devices[sio_data->type].suffix,
+	pr_info("Found %s chip at 0x%x, revision %d\n",
+		it87_devices[sio_data->type].model,
 		*address, sio_data->revision);
 
 	config = &it87_devices[sio_data->type];
-- 
2.39.1

