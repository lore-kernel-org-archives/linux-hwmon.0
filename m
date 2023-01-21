Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83AA4C004D4
	for <linux-hwmon@archiver.kernel.org>; Sat, 21 Jan 2023 08:58:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229853AbjAUI61 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 21 Jan 2023 03:58:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229795AbjAUI6Z (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 21 Jan 2023 03:58:25 -0500
Received: from ipmail06.adl3.internode.on.net (ipmail06.adl3.internode.on.net [150.101.137.16])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id BEAAE23C61
        for <linux-hwmon@vger.kernel.org>; Sat, 21 Jan 2023 00:58:23 -0800 (PST)
IronPort-SDR: 1VCPy/TMjot316m585NYqNr8V6IgtYtT6BFkppbA94wbnmQWIzvIzYeb+uOI3LQtOpqvTQ/wkT
 SlTgztzXkBgCrmgpOXCZfdbIxP7RONPq0vXO5DRm0uF5CG3LG9SY3salsurU4+EOCBrFpYTVzJ
 /qykzeSuH9YD7FeyC5fqBXcFfCXR+Gce0mOgMHEP03yoQsQVHXqdtzW/UMrMlKUnqN9dcPErBX
 /iKJX2Bm6U7TDoT3D0zwhleX4q0j9qOOAhQOWjUyCDYtQn3mDLOQjoWg6yhpZ2ahm/vufM+09N
 QMWqwnsMrRp9v+QhTWYVwNTV
X-SMTP-MATCH: 0
X-IPAS-Result: =?us-ascii?q?A2ATAQDLp8tjjPQc8jxaHQEBAQEJARIBBQUBSYE0BgELA?=
 =?us-ascii?q?YIsgl+zLoF+DwEPAQFEBAEBhQYChSAmNgcOAQIEAQEBAQMCAwEBAQEBAQMBA?=
 =?us-ascii?q?QYBAQEBAQEGBBQBAQEBQBgBOQcLUgcLWAcHgUELgWETCwMxDYZXAgEDMgENA?=
 =?us-ascii?q?QE3AQ8ZOFcGARKCfoMjq1iBAYIIAQEGgmKaZ4FeCYFAAYtdgRKDN3pDP4FOh?=
 =?us-ascii?q?A9uiwObFAqBO3yBJw5MeoESAgkCEoEgAwkDBwVJQAMLGA0WMgoTLTULC0orG?=
 =?us-ascii?q?hsHgQgqKBUDBAQDAgYTAyACDSgxFAQpEw0nJmkJAgMiXwUDAwQoLQk/ByYmP?=
 =?us-ascii?q?AdWNwYCDx83BgMJAwIfUXEvEhIFAwsVKkcECDYFBhw2EgIIDxIPLEMOQjc0E?=
 =?us-ascii?q?wZcASkLDhEDUEcZbgSCDAoGKSifG4EOgTjEWoN6gVKefUyBRKdml0sgoxuEK?=
 =?us-ascii?q?wIKBxaBaQGCDU0fGYMiTwECAQEBDQECAQEDAQIBAQEJAQEBAY4dDA0JFYF1j?=
 =?us-ascii?q?DhhOwIHCwEBAwmMIwEB?=
IronPort-PHdr: A9a23:NqBAuBfuDMOTnFzCt6+laB0/lGM/hYqcDmcuAtIPgbNSaeKo5Z39M
 kvF6bNgiUKPXImd4u8Xw+PMuPXmXmoNqY2ErGhEapFJUAMIzMQOygIsDJTXVkTyIKzmM3NqT
 p0QBlRvpinpOkMNR67D
IronPort-Data: A9a23:SAmcuaLD7MRejFx9FE+R6JMlxSXFcZb7ZxGr2PjKsXjdYENS0jIBn
 DEcWD2GOvrfNjD9LYx1a4y/90MF7ZLRmIM1TAI4qi8yQisXp8OdC9qXdxuuZCrKdMSZRRw75
 ssTYNScJ+k5HyTWzvuPGuGx9SMmiclkZVZd5MrsYH0ZqdpMEX954f5bs7dlxNYu27BVOivV0
 T/Ii5S31GKNglaYDEpEs8pvlzs31BjCkGtwUosWOJinFHeH/5UkJMp3yZOZdhMUcaEIdgKOf
 Nsv+Znilo/vE7bBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XOdJEAXq7hQllkPhQ6
 fsOid+KcTsJff3uovkGXT12DyxxaPguFL/veRBTsOSZzlHdNXD2yupgC1s6e4Ad56B2DSdH6
 JT0KhhTNlbZ27jwmuL9ELUw7iggBJCD0Ic3tGtpyzLxBuwvXp7EWamM6NpFmjY8wMlTdRrbT
 5ZFMWQ1NUScOnWjPH8dVMolxOL5okLdWDJWlVXNlIUu4zfMmVkZPL/Fa4KOKobQFK25hH2wo
 mPA4nS8Ag4fM9q31zWI6DSvi/XJkCe9X5gdfJW89/h3kHWJwWEYC1gLTh29rOXRokyyVtZBI
 lYZ0jEztqV0/0uuJuQRRDXm+Dve4kRZAYoVSbFmrhqRw7bV6ECFHmcFCDVGbZovqafaWADGy
 Heovv2qOX9ViIG1CiK/zKqPoxecJSUaeDpqiTA/cSMJ5NzqoYcWhx3JT8p+HKPdsjETMW+oq
 9xthHZj74j/nfLnxI3+pguX3GvwznTdZldov1+PBjzNAhZRPtbNWmC+1bTMxd99RGpzZmKQs
 H4JiqByB8hUVcnV/MBhaMMAA/mS4OuZMHXjiFpiBPEcG9mFpSbmJ9wKpWsuYR01boAfZTb1Y
 USVpRte5dlYO37sZLIfj2ON5yYCkfSI+TfNDKu8gj9yjn5ZLlfvEMZGPxD44owVuBJw+ZzTw
 L/CGSpWMV4UCL580B29TPoH3Lkgy0gWnD2MGcqgnkj9juDDPBZ5rIvp1nPQN4jVC4va/W3oH
 yp3bZviJ+h3CrKkM3aHoeb/03hUdSVnW/gaVPC7hsbYelE2QjtwYxMg6a85dMRkmbhYjOHF4
 hmAtrxwljLCaYn8AVzSMBhLNumwNauTWFpnZUTAy370giZ/CWtuhY9DH6YKkU4Pr7Y7lq4lF
 qReEyhCa9wWIgn6F/0mRcGVhORfmN6D3Gpi5gKpP2oyeYBOXQvM9oO2dwfj7nBeXCGtvNQwp
 KeskA7eXNwCS0JrEZ+OOv6oylqwu1kbmf5zBhWXe4cCKRi0qoU6eTbsivIXIt0XLUuRzDWt1
 zGQXUUSq97S8t08/9T+jKyZq5ukTrllFU1AEmiFsbu7bHGI/meqzYJafvyPeDTRCDH99Km4P
 LUHxOv1L/MAhloMvo9hVbdni6sjvoO9q7hfxwViPXPKc1XyVOw5fCjXgJEVu/QUlLFDuAawV
 kaewfVgOO2EaJH/DVocBAs5deDdh/sarTnl66hnKkvN+34l9bWKZkxeIh2QhXEPN7ByKo4kn
 7sstcNKuQyyjh0mboSPgixOrT/eJH0cSOMsrJgFDojxhkwmz0wEYJCaAzKvuMODbNBFM08LJ
 D6IhfOc2O0ClxufKyA+RSrXwO5QpZUSoxQUnlUMEFS+nIaXjPEAw0wD+Ds6eQ1Z0xFb3r8hI
 WNsLUB0e/mD8ms6nsRFRGzwSQhNCAfCoB6vkx5TyDecFRntDDCRanYhMPqM9wYF621dODNc+
 feR1T+9Azrtecjw2Ao0WFJk8qK8FIIgp1Caws33Td6YG5QaYCb+hvP8b2Q/rUq1CMw8s0TLu
 O128bsicqb8LyMR/fE2BoTyOW78k/xYyLGumc1cwZ4=
IronPort-HdrOrdr: A9a23:llTqJKsZesz09ziIVGhiJM1q7skDrNV00zEX/kB9WHVpm6yj/f
 xGUs576faSskdpZJlD8ersBEDkex/hHPFOkOos1NuZMzUO/VHYSL2KjrGSpQEIZReOlNK1vJ
 0IG8ND4Z/LfD9HZK3BgDVQfexP/DEJnZrY/ds2t00dKD2Cc5sQkzuRFDzrb3GemzM2fqbQxf
 Knl7B6mwY=
X-IronPort-Anti-Spam-Filtered: true
Received: from 60-242-28-244.static.tpgi.com.au (HELO bits.crawford.emu.id.au) ([60.242.28.244])
  by ipmail06.adl3.internode.on.net with ESMTP; 21 Jan 2023 19:28:22 +1030
Received: from agc.crawford.emu.id.au (agc.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc07])
        (authenticated bits=0)
        by bits.crawford.emu.id.au (8.17.1/8.17.1) with ESMTPSA id 30L8vxu42985116
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
        Sat, 21 Jan 2023 19:58:18 +1100
Authentication-Results: bits.crawford.emu.id.au; arc=none smtp.remote-ip=fdd2:7aad:d478:1::cb10:cc07
DKIM-Filter: OpenDKIM Filter v2.11.0 bits.crawford.emu.id.au 30L8vxu42985116
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crawford.emu.id.au;
        s=s1; t=1674291498; bh=SLLe+KdFoEyxxQ6Kyfu2pO+6m56C9dZgMWvHBnJAPVA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=EKGv5EerWRmhvRDcNvdQhD1uHaCKcReT5+XbkQMJyTcRY8wm+clS4Yk3Kk6DsLpic
         nId72myM1ek2Na+vp5zsmlMCxX+dtMUGnl3SDhCPlljBJ8/4iLb6bU5xeGBquxYO2b
         xp9WrPLJtRQ1qH0ezmUYn7DODvoL11gjynjd/b/LrdkhLCY8VOJvfSgd23jgCszWW1
         GvfQlmSqpsoLwA/7DjFTXMhL9CxoGCYuzJaNjLCdDa2M7FY/wSoghcYnnMSf06w105
         uYfK6cMmM92z74p2ajsalyj9D/L8KRh2MsG5YxKNnbkWTr33XO0Gfe0x50DYKjiHgs
         1Wl6bUVMo0eNQ==
From:   Frank Crawford <frank@crawford.emu.id.au>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org,
        Frank Crawford <frank@crawford.emu.id.au>
Subject: [PATCH v1 2/2] hwmon: (it87) Added driver version to distinguish from dev version
Date:   Sat, 21 Jan 2023 19:57:54 +1100
Message-Id: <20230121085754.1693336-3-frank@crawford.emu.id.au>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230121085754.1693336-1-frank@crawford.emu.id.au>
References: <20230121085754.1693336-1-frank@crawford.emu.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4 (bits.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc01]); Sat, 21 Jan 2023 19:58:18 +1100 (AEDT)
X-Virus-Scanned: clamav-milter 0.103.7 at bits.crawford.emu.id.au
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Add a driver version and log it on load, to make it easier to
distinguish between the in-tree version and any development version from
an external source.

Signed-off-by: Frank Crawford <frank@crawford.emu.id.au>
---
 drivers/hwmon/it87.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
index a8a6a0ffee82..632ab3d50bc6 100644
--- a/drivers/hwmon/it87.c
+++ b/drivers/hwmon/it87.c
@@ -59,6 +59,8 @@
 #include <linux/acpi.h>
 #include <linux/io.h>
 
+#define IT87_DRIVER_VERSION "v1.0-official"
+
 #define DRVNAME "it87"
 
 enum chips { it87, it8712, it8716, it8718, it8720, it8721, it8728, it8732,
@@ -3398,6 +3400,8 @@ static int __init sm_it87_init(void)
 	bool found = false;
 	int i, err;
 
+	pr_info("it87 driver version %s\n", IT87_DRIVER_VERSION);
+
 	err = platform_driver_register(&it87_driver);
 	if (err)
 		return err;
@@ -3470,6 +3474,7 @@ MODULE_PARM_DESC(fix_pwm_polarity,
 		 "Force PWM polarity to active high (DANGEROUS)");
 
 MODULE_LICENSE("GPL");
+MODULE_VERSION(IT87_DRIVER_VERSION);
 
 module_init(sm_it87_init);
 module_exit(sm_it87_exit);
-- 
2.39.0

