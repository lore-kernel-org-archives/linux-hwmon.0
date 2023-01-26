Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BD31C61D97
	for <linux-hwmon@archiver.kernel.org>; Thu, 26 Jan 2023 04:02:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229475AbjAZECz (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 25 Jan 2023 23:02:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229536AbjAZECx (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 25 Jan 2023 23:02:53 -0500
Received: from ipmail06.adl3.internode.on.net (ipmail06.adl3.internode.on.net [150.101.137.16])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id EDDAE2D72
        for <linux-hwmon@vger.kernel.org>; Wed, 25 Jan 2023 20:02:46 -0800 (PST)
IronPort-SDR: ZLrEiAKOvoujCwa9n0eD60zQVbzu//um34Y27tLnrt0O0q3bRa7t+Ze/dJtApdOqe6An39yVGw
 6z85FN2Z+Uq88Z2k+4b3fDs3S8S5kN8qFj86Ch8PgIqjeCtzNNR6H5TCs+b8jDvGegBTEAvQwI
 4qlU7J24O+8u64mhhpQyUKW2+3BDvQcFX3si9yQqgywZeJuBQJBEhR4uVpxPhQxge0AnCPwfAN
 0vadoZZtqtZy02911P892uD03jF+SaKKAcnWAByhnG45yp/6XvxZcOkEIDKch4fF6jg8LIvbLq
 NZh7xCmLkLbzlKNimV+RQSKR
X-SMTP-MATCH: 0
X-IPAS-Result: =?us-ascii?q?A2AsBgCK+tFjjPQc8jxaHQEBAQEJARIBBQUBSYFGgi2CY?=
 =?us-ascii?q?JVtnz4PAQ8BAUQEAQGFBgKFIyY4EwECBAEBAQEDAgMBAQEBAQEDAQEGAQEBA?=
 =?us-ascii?q?QEBBgQUAQEBAUBSBwtSBwtYBweBQQuBYRMLAzENhlYCAQMnCwENAQE3AQ8ZO?=
 =?us-ascii?q?FcGARKCfoMjrGMzgQGCCAEBBoJimmeBXgmBQIthgRSDN3pDP4FOglGBPm6LA?=
 =?us-ascii?q?44IjTYKgTl4gSUOTHqBDwIJAhGBLAMJAwcFSUADCxgNFjIKEyw1CwtKKxobB?=
 =?us-ascii?q?4EGKigVAwQEAwIGEwMgAg0oMRQEKRMNJyZpCQIDIV8FAwMEKC0JPwcmJDwHV?=
 =?us-ascii?q?jcGAg8fNwYDCQMCH09xLxISBQMLFSpHBAg2BQYcNhICCA8SDyxEDkI3NBMGX?=
 =?us-ascii?q?AEpCw4RA1BHGW4EghEGKSaeHHKBDoFxkz8KjnuhYoN8gVKefUyBRII1k0eRa?=
 =?us-ascii?q?pdNIINmnh6BGIQrAgoHFoF5gX5NHxmDIk8BAgEBAQ0BAgEBAwECAQEBCQEBA?=
 =?us-ascii?q?QGOHQwNCYIKjDhhOwIHCwEBAwmMIwEB?=
IronPort-PHdr: A9a23:6bZoOh0ZJSFp8JEvsmDPn1BlVkEcU/3cNA8J8dwskbtRfKO589LvO
 VGZ5PkrhUKaFYzB4KdCjOzb+7vlRXRG+5uEt2wPNZ1UAhEJhZ9EwAUpDJyJVRKrfqe4PScwR
 ZwQX1Q9oBmG
IronPort-Data: A9a23:+gPjAag1m2m6DiPsErV1/PjSX161VBYKZh0ujC45NGQN5FlHY01je
 htvWmnTa/uMajf2LY0jYYy3o05UvZDdzoQxGwVrrSlnQipApceZXYTJIh36b33DcZySEBM/s
 ZlGMYGaJp9uR3PW/T6gY+PrxZVe/fjYHuCmVIYoGczQqStMEnpJZcdLwrZh6mJQqYHlRVvL4
 7semuWHULOf82cc3l88sspvljs/5JwehxtA1rAOTagjUIj2yhH5pLpGTU2AByOQrrt8R4ZWd
 M6fpF2NxV41yj92Yj+TfhcXRWVRKlLaFVDmZnO7wMFOiDAazsA5+v5T2Pbx9S67hh3R9+2dx
 umhurS0axg0OYvBwN8ZCTgDPiBVPLB80pvYdC3XXcy7lyUqclPmwul1SkosNJIW/fx7R2xL6
 LoZJHYEc3hvhcromPThFrMq3JRldpW3VG8ckigIITXxA+wvR5PrSL/D+tFfxjt2i8VTW/fSI
 cMEAdZqREicO00eZg1OWPrSms+EqFrlLhtmoW6SirQF/m/p9TVu1bziZY+9ltuiHp0OzhzC9
 woq5V/RBhAcKczaySWA9XSEmODCh2X4VZgUGbn+8eRl6HWXx2oOGDUMUlaworykkQi4Vs43A
 04Y9y4wpLI/3Fe2VdS7VBq9yENopTZCA58KT7d/slHIkPaIpR2FD3QFRXhdcNMn8sQxQHojy
 zdlgu8FGxRrkqKITlSQroyQ9xLpFCk+LHI4TwsbGF5tD8bYnKk/iRfGT9BGGaGzj8HoFTyY/
 9xshHZn71n0pZBWv5hX7WwrkBrp/cOZEVdpjunDdjv4t1khPNDNi5mAswCz0BpWEGqOZnC81
 JTus/OP4OYDHPlhfwTXGL1VdF1Fz9CIL3XnhkNzH9Ee/jCg4BaekW14vmk7fhszd5xUPGW1P
 AnIpQpN5ZQVIGOlbOl8ZIf3AtlCIUnc+TbNCqy8gjlmOMMZmOq7EMZGPxD44owVuBJw+ZzTw
 L/CGSpWMV4UCL580B29TPoH3Lkgy0gWnD2MGc6klkj9juLOPxZ5rIvp1nPQN4jVC4va/W3oH
 yp3bZriJ+h3CrKlO3KPoeb/03hXfSZiXfgaVPC7hsbYelE2QjtwYxMg6a85dMRkmbhYjOHF4
 hmAtrxwljLCaYn8AVzSMBhehEbHAc4XQYQTYXVyYT5FGhELPe6S0UvoX8RqLeJ7pL07k5aZj
 ZAtIq29PxiGcRyfkxx1UHU3hNYKmM2DiV3cMiy7TiI4epI8FQXF9sW9Llnk7iARAC2tuY0zp
 qDm1w+dSIdaH1ZuC8PfafSOyVKtvCFDx7grBhCXfIVeKBf27YxnCy3tlftpccsCHhX0wGfI3
 QihHkZKrObAlIY57d3ViP3WtIyuCeZ/QBZXEjCDv7a7PCXX5ES5xopEXLradDzRTjqkqq64b
 PpbyOvwdvACgRBLv8x1Du8zn6454tLuoZ5czxhlRSuUNQ3yUew+fnTfhJtBrKxAwLNdqDCaY
 EPX94kII6iNNePkDEUVelgvYNOD4vdIyDPc2utkckz16Rh+8KeDTUgPbQKHjzZQLeUpPY4on
 bUhtcoR51DtgxYmKIzd3CpV63/KJWYJTKsgrJ1cDYr2zAsnjFhfOMSOBijz6ZCJStNNLkhzf
 GDO3fOZ2OoAyxqQaWc3GFjMwfFZ28YEtidK+1ledV6HrcWU1PY40SpY/SkzUgkInA5M1Ph+O
 zY3OkApd7+C+Sxk2JpKU2y2QFsTWkXcoBCrjgFZ0TeFEw+zSmXRLWZ7Jf6C/QYS9GcadyUCp
 OOUz2PsUDDLesDt33JsBhQ88qe8E4B8pl/YhcSqP8WZBJ1mMzDrtan/N2MHpizuDd41mECa9
 /Jh+/x9aPOnOCMdy0Hh51J2CVjNpMi4GVF/
IronPort-HdrOrdr: A9a23:/u4soavFUJVdTxthpKv+DXUf7skDrNV00zEX/kB9WHVpm6yj/f
 xGUs576faSskdpZJlD8ersBEDkex/hHPFOkOos1NuZMzUO/VHYSL2KjrGSpQEIZReOlNK1vJ
 0IG8ND4Z/LfD9HZK3BgDVQfexP/DEJnZrY/ds2t00dKD2Cc5sQkzuRFDzrb3GemzM2fqbQxf
 Knl7B6mwY=
X-IronPort-Anti-Spam-Filtered: true
Received: from 60-242-28-244.static.tpgi.com.au (HELO bits.crawford.emu.id.au) ([60.242.28.244])
  by ipmail06.adl3.internode.on.net with ESMTP; 26 Jan 2023 14:32:43 +1030
Received: from agc.crawford.emu.id.au (agc.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc07])
        (authenticated bits=0)
        by bits.crawford.emu.id.au (8.17.1/8.17.1) with ESMTPSA id 30Q42O5U1960730
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
        Thu, 26 Jan 2023 15:02:38 +1100
Authentication-Results: bits.crawford.emu.id.au; arc=none smtp.remote-ip=fdd2:7aad:d478:1::cb10:cc07
DKIM-Filter: OpenDKIM Filter v2.11.0 bits.crawford.emu.id.au 30Q42O5U1960730
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crawford.emu.id.au;
        s=s1; t=1674705759; bh=ZEPjMNMpNNGoT3JyHGJY8+fZzD0RHKUVp9nUZ1q8/Qw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=DkFZWM4l3iEQL7BWqQGC5IrBhZY4+YAaojAqwqLtMS+M1EbL/+I/kozeIWjulp/Vl
         jQJMuyRvS1+yQyIotQa3sdsadOKGe/r4G/rZrL+divArYoyOD6HQK97fPV5H34FTY5
         CRj9JtpVjctxC5C78Cji1JzD0FuQ0XVroqLz4qJZZPgbbapE6XmEP3TmMMfueqCPjN
         MSbPnlT2GoMEFhFbPM78rzMWFcyEKxRmLqtQGVXqIKFaAujkzXIw4GGDmyd+nN/CdF
         Ejk+7J0sUGrdAovMyv21LvIliLVO29w3HqjtIup3AOs10+PNsXEzcmC9NW7sYg01BB
         p1FP2Qpy/SjVg==
From:   Frank Crawford <frank@crawford.emu.id.au>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org,
        Frank Crawford <frank@crawford.emu.id.au>
Subject: [PATCH v1 1/7] hwmon: (it87) Allow disabling exiting of configuration mode
Date:   Thu, 26 Jan 2023 15:02:17 +1100
Message-Id: <20230126040223.986189-2-frank@crawford.emu.id.au>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230126040223.986189-1-frank@crawford.emu.id.au>
References: <20230126040223.986189-1-frank@crawford.emu.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4 (bits.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc01]); Thu, 26 Jan 2023 15:02:39 +1100 (AEDT)
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
 drivers/hwmon/it87.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
index a8a6a0ffee82..7049e81f5af1 100644
--- a/drivers/hwmon/it87.c
+++ b/drivers/hwmon/it87.c
@@ -128,10 +128,12 @@ static inline int superio_enter(int ioreg)
 	return 0;
 }
 
-static inline void superio_exit(int ioreg)
+static inline void superio_exit(int ioreg, bool doexit)
 {
-	outb(0x02, ioreg);
-	outb(0x02, ioreg + 1);
+	if (doexit) {
+		outb(0x02, ioreg);
+		outb(0x02, ioreg + 1);
+	}
 	release_region(ioreg, 2);
 }
 
@@ -497,6 +499,7 @@ static const struct it87_devices it87_devices[] = {
 struct it87_sio_data {
 	int sioaddr;
 	enum chips type;
+	u8 doexit;
 	/* Values read from Super-I/O config space */
 	u8 revision;
 	u8 vid_value;
@@ -523,6 +526,8 @@ struct it87_data {
 	u8 peci_mask;
 	u8 old_peci_mask;
 
+	bool doexit;		/* true if exit from sio config is ok */
+
 	unsigned short addr;
 	const char *name;
 	struct mutex update_lock;
@@ -2405,6 +2410,7 @@ static int __init it87_find(int sioaddr, unsigned short *address,
 	int err;
 	u16 chip_type;
 	const struct it87_devices *config;
+	bool doexit = true;
 
 	err = superio_enter(sioaddr);
 	if (err)
@@ -2501,6 +2507,8 @@ static int __init it87_find(int sioaddr, unsigned short *address,
 		goto exit;
 	}
 
+	sio_data->doexit = doexit;
+
 	err = 0;
 	sio_data->sioaddr = sioaddr;
 	sio_data->revision = superio_inb(sioaddr, DEVREV) & 0x0f;
@@ -2827,7 +2835,7 @@ static int __init it87_find(int sioaddr, unsigned short *address,
 		sio_data->skip_pwm |= dmi_data->skip_pwm;
 
 exit:
-	superio_exit(sioaddr);
+	superio_exit(sioaddr, doexit);
 	return err;
 }
 
@@ -3061,6 +3069,7 @@ static int it87_probe(struct platform_device *pdev)
 	data->addr = res->start;
 	data->sioaddr = sio_data->sioaddr;
 	data->type = sio_data->type;
+	data->doexit = sio_data->doexit;
 	data->features = it87_devices[sio_data->type].features;
 	data->peci_mask = it87_devices[sio_data->type].peci_mask;
 	data->old_peci_mask = it87_devices[sio_data->type].old_peci_mask;
@@ -3213,7 +3222,7 @@ static void it87_resume_sio(struct platform_device *pdev)
 			     reg2c);
 	}
 
-	superio_exit(data->sioaddr);
+	superio_exit(data->sioaddr, data->doexit);
 }
 
 static int it87_resume(struct device *dev)
-- 
2.39.1

