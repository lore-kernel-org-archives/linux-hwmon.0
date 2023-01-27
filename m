Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46107C54EAA
	for <linux-hwmon@archiver.kernel.org>; Fri, 27 Jan 2023 04:41:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229446AbjA0Elp (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 26 Jan 2023 23:41:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbjA0Elm (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 26 Jan 2023 23:41:42 -0500
Received: from ipmail06.adl3.internode.on.net (ipmail06.adl3.internode.on.net [150.101.137.16])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id AEAD539CD1
        for <linux-hwmon@vger.kernel.org>; Thu, 26 Jan 2023 20:41:40 -0800 (PST)
IronPort-SDR: UO0ChA7U11i2w6ZegW9bcS1ERnUTwXXil1EGnemWBYVyrjBUHlIoDR17ZITR7zXLncIEhrxn0j
 heytIq8qBGMn5oTGFmpn1OI7FKJpbAeSfpx8dGR+Y/Lj9CYWWhe9+mhiICaibDKmkfKHYx1EEO
 WolaWMIu6Hvz07Cv4jdmZvddHryrMgA0auyywKAPsSb6oNADpWVdtyHugTqEG4DHahxVXDVvkD
 oRd4dhAvKb7ipsVdd0uRJA7XUaNyv3/esCVG/1XmZbisJylTmI7WNc2hJB+YHSSss3/sTFgvlH
 AMlmcsTMa9Xpzop6xN4MZMNU
X-SMTP-MATCH: 0
X-IPAS-Result: =?us-ascii?q?A2D7AQCKVdNj//Qc8jxaHQEBAQEJARIBBQUBSYE1BQELA?=
 =?us-ascii?q?YIsgmCVbZ8+DwEPAQFEBAEBhQcChSMmNwYOAQIEAQEBAQMCAwEBAQEBAQMBA?=
 =?us-ascii?q?QYBAQEBAQEGBIEqBwtSBwtYBweBQQuBYRMLAzENhlYCAQMnCwENAQE3AQ8ZO?=
 =?us-ascii?q?FcGARKCfoMjq2kzgQGCCAEBBoJimmeBXgmBQAGLYIEUgzd6Qz+BToJRgT5ui?=
 =?us-ascii?q?wOOIo08CoE5eIElDkx6gQ8CCQIRdFkDCQMHBUlAAwsYDRYyChMsNQsLSisaG?=
 =?us-ascii?q?weBBiooFQMEBAMCBhMDIgINKDEUBCkTDScmaQkCAyJiAwMEKC0JPwcmJDwHV?=
 =?us-ascii?q?jcGAg8fNwYDCQMCH09xLxISBQMLFSpHBAg2BQYcNhICCA8SDyxEDkI3NBMGX?=
 =?us-ascii?q?AEpCw4RA1BHGW4EghEGKSaeMQhygQ6BcU6ScQqwXYN8gVKefUyBRKdml00gg?=
 =?us-ascii?q?2aeHoEYhCsCCgcWgXiBf00fGYMiTwECAQEBDQECAQEDAQIBAQEJAQEBAY4dD?=
 =?us-ascii?q?BaCCpFLYTsCBwsBAQMJjCMBAQ?=
IronPort-PHdr: A9a23:10geBR+ofg7GFv9uWBXoyV9kXcBvk7/1IhVT4YAulLxJaKjl8pH/e
 k3To/xw3xfAR46O7fVChqLNtrz4H3YN5JGdvTUDaMlCWxNf25oflgByDJLaWR+ifqzhZXViT
 s9JDAANwg==
IronPort-Data: A9a23:K0+28q4dutz7/Zqi2poBkAxRtBzBchMFZxGqfqrLsTDasY5as4F+v
 jAYDTyDMv2DamXwL9x0bo6zpkkEuZSHx4BiTVc/qipkFSgRpJOaWIjEf0ytZXqed5OaHBxqv
 p9GY4PKJZ5oFnX1q0b2ONANj1ElhfnSHOaU5M0om8xVbVU5IMv0oUs7w4bVuqYx3Z7hRVnlV
 era+6UzAnf8s9JJGjt8B5yr+EsHUMva4Fv0jnRmDRyclAK2e9E9VfrzFInpR5fKatA88t2SG
 44v+IqEElbxpH/BPD8EfoHTKSXmSpaKVeSHZ+E/t6KK2nCurQRquko32WZ1hUp/0120c95NJ
 NplmKSLdQsLB7L1n+lDXjBXCwU5EIBaweqSSZS/mZT7I0zueXrw2LNlFkgpM4oC9qB6BHwI9
 PBeIS1lghKr2brwmu7hDLM8wJ5/cKEHP6tG0p1k5T/DBPAlaZvZSrrE4sVUmjo1m4ZPEbDXe
 qL1bBIzMEyRPkAQYAt/5JQWnduMviLVYydjp1/LhPcR423z9Qg26e24WDbSUofSHpUPxBfwS
 nj912D4BAwKcdyAzD2D2myji/WJni7hXo8WUrqi+ZZChFyV23w7EhobXlj+vOL/jEOiM/pdJ
 0EQ5CM0oIAp6VemCNL6WnWFTGWs4EZZAYYKVrdqrVvRluzP/w+FB2NCUiZOaZots8pwTCFCO
 kK1c83BKARUjLG3cG2k8brKoBq9IQxSAEIeXHpRJeca2OXLrIY2hxPJa99sFq+pk9H4cQ0cJ
 RjX/EDSYJ1N0KY2O7WHEUPvxmn39seQEmbZ8i2OAzv/tlsnDGKwT9bwgWU3+8qsO66wczFtV
 lA/isSY4fFm4XqlznTVGI3h8JmP6unNCzrBnV4nIJAl+i/FxpJOVd4IpWsifgIzYoNeJWOve
 1PapQJaooNLM3rsZqhyJYusYyjL8UQCPYi5Phw3RoAVCnSUSONg1HswDXN8J0i3zCARfVgXY
 P92sa+EVB7285hPwjusXPs62rQ23C04zm67bcmlkEj4jOXOPybOEett3L6yggYRsfPsTOL9r
 Ys3Cid2408OOAEDSnOIqtdIdQBiwYYTWMGt8Zc/mhG/zvpOQzl6W6WLkNvNiqR5h6sdl+HU8
 2u7V1Mw9bYMrSOvFOhLA1g9AI7SsWFX9CpmZ3NzZwv2ghDOo++Htc8iSnf+RpF/nMQL8BK+Z
 6JtlxyoDqsdRzLZ1S4aaJWh/oVueA7y1VCFJSO6bj8lc9htQhGP+9Oidxa2rHsCCS++tM0fp
 by811qFHsBZH14+XZvbOKC10le8nXkBg+YsDUHGFdlkfhm++oZdNH2jh/A6FMgANBHfy2bIz
 A2RGxoZ+7XArtZtotnEjKyJtamzFO56EhYIFmXX9+/mZyLA93WtxpVMFuuNYHbcWCX95fz6N
 +lSyvj9NtwBnUpL6tQjSewzl/5vuta2/u1U1AVpGnnPfm+HMLI4LynUx9RLu41M2qRd51m8V
 HWPzd8Ga7+HD9y0QlceKT0sYvmHyfxJyCLZ6u44IRum6SJ6oOiHXEFVM0XegSBRNuEuYokk3
 fxns9Qf9AK4kBZsP9ObyCFYsW2RdyRSX6Iiv5AcIYnqlgtylA4YO8SGVn6r7cHdcchIP2krP
 iSQ2vjIiYNc8UyeIXA9Imecj+NSiKMHtA1O0FJfdU+CncDIh6Fr0RANoy47SB9ZkkdO3+5pY
 TI5aRUwf/nUum04wZIfAya3BwhdBRbf5lT+yh0Ck2ifRlTxDj7BK2g0OOCs+kEF8jsCIWIBp
 OvEmTvoAWTwYcX8/iouQko5+fbtetogpATNlfeuE9mBA5RnMyHuhbWjZDRUphbqaS/raJYre
 QW3ED5MVJDG
IronPort-HdrOrdr: A9a23:SGwLZahkchRv+YMZu8NQld7JcnBQXgAji2hC6mlwRA09TyX5ra
 qTdTogtCMc7wxhIU3J+7i7VZVoJEmxyXcb2/hzAV7PZmbbUS6TXeVfBOjZslvd8lPFh4xgPM
 5bGsAUNDSzNykcsS+Q2mmF+rgbruVuf82T9J/jJg9WPGRXgrlbnntE4xigYzBLrdZ9dOEE/E
 v13Ls8mwad
X-IronPort-Anti-Spam-Filtered: true
Received: from 60-242-28-244.static.tpgi.com.au (HELO bits.crawford.emu.id.au) ([60.242.28.244])
  by ipmail06.adl3.internode.on.net with ESMTP; 27 Jan 2023 15:11:35 +1030
Received: from agc.crawford.emu.id.au (agc.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc07])
        (authenticated bits=0)
        by bits.crawford.emu.id.au (8.17.1/8.17.1) with ESMTPSA id 30R4fIge2462776
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
        Fri, 27 Jan 2023 15:41:31 +1100
Authentication-Results: bits.crawford.emu.id.au; arc=none smtp.remote-ip=fdd2:7aad:d478:1::cb10:cc07
DKIM-Filter: OpenDKIM Filter v2.11.0 bits.crawford.emu.id.au 30R4fIge2462776
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crawford.emu.id.au;
        s=s1; t=1674794492; bh=uoZah0rQxLm7wOzrN2eniIO7ElG39WnTDXpl8eAJTDY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=KYDUJsqFEsnpvoE4pqPDqJ0LBgo1GRSiB/Dzdyyc3GAykLfzGfg6d0/12u78LONXc
         7nJmp173tCpK2uAuPXgQe5QXIesTNQ1vYqgmVCfMK2KatEeTSN4/57r9zlR8SgTRyE
         zYrY/HSXCnbrk8SGIYCSh41+Sznrx27UZEUHSREB2vk2+tM5fuDwjceSe7vJzffST5
         7Us9MTL6hMGdPeaH9JCmWLhoKrof7u1Zvz5kNOesPz2BRg07mRNf9IkfAK2M+I//Kh
         7ls7CavFqDPkzZNwzSY0OfU4duD6AI8qXGPGuW47C4MuMlfLp5fKpBFawaE7jITm/o
         UzJgVt5AH6czA==
From:   Frank Crawford <frank@crawford.emu.id.au>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org,
        Frank Crawford <frank@crawford.emu.id.au>
Subject: [PATCH v2 1/7] hwmon: (it87) Allow disabling exiting of configuration mode
Date:   Fri, 27 Jan 2023 15:41:10 +1100
Message-Id: <20230127044116.1257799-2-frank@crawford.emu.id.au>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230127044116.1257799-1-frank@crawford.emu.id.au>
References: <20230127044116.1257799-1-frank@crawford.emu.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4 (bits.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc01]); Fri, 27 Jan 2023 15:41:32 +1100 (AEDT)
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

v2:
 * Convert to use feature flag and related macros rather than a separate
   field, as suggested in review.
 * Reverse sense of flag in superio_exit to simplify feature macro.

---
 drivers/hwmon/it87.c | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
index a8a6a0ffee82..9d44d1d6f3e9 100644
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
+	superio_exit(sioaddr, has_conf_noexit(config));
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

