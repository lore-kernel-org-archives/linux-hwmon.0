Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AF53C38142
	for <linux-hwmon@archiver.kernel.org>; Fri, 27 Jan 2023 04:41:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229727AbjA0Elw (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 26 Jan 2023 23:41:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229496AbjA0Elv (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 26 Jan 2023 23:41:51 -0500
Received: from ipmail06.adl3.internode.on.net (ipmail06.adl3.internode.on.net [150.101.137.16])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 74CEC3B0C9
        for <linux-hwmon@vger.kernel.org>; Thu, 26 Jan 2023 20:41:50 -0800 (PST)
IronPort-SDR: +M9xOtF+rJYlSG6yMX5ImpTcrUo3mQsSI45ZBCd1fmZb/zCjf4P2zF4e/HElE2JdM6Yvzx/5/n
 mBAfYBAbrj0GfgscyH/K+HQF0BXqesdA/g9g0rTJ3BL7++wAbstfudzL16jYA+k4KHhC9A0EJN
 vg0DokG4nV6kefGPXItUEGgZQAgyJoti1mBcZHrD1XhlqXtIczkUl5aeGFMocDpsHvddUWIb3u
 vf65fiEHOVF2M1KVkcdWMWMDoqtXdF3jAM3dSVtKLT8ojrfpFwctbhVDZy1Z1ycZR3KAqsukVY
 x3s1z5Q9Tn0IRn4xuHtlE3KY
X-SMTP-MATCH: 0
X-IPAS-Result: =?us-ascii?q?A2ApCACKVdNj//Qc8jxaHQEBAQEJARIBBQUBSYFGgi2CY?=
 =?us-ascii?q?JVtnz4PAQ8BAUQEAQGFBwKFIyY4EwECBAEBAQEDAgMBAQEBAQEDAQEGAQEBA?=
 =?us-ascii?q?QEBBgSBKgcLUgcLWAcHgUELgWETCwMxDYZWAgEDMgENAQE3AQ8ZOFcGARKCf?=
 =?us-ascii?q?oMjrByBAYIIAQEGgmKaZ4FeCYFAi2GBFIM3ekM/gU6BFYE8giyLA44ijTwKg?=
 =?us-ascii?q?Tl4gSUOTHqBDwIJAhF0WQMJAwcFSUADCxgNFjIKEyw1CwtKEBsaGweBBiooF?=
 =?us-ascii?q?QMEBAMCBhMDIgINKDEUBCkTDScmaQkCAyJiAwMEKC0JPwcmJDwHVjcGAg8fN?=
 =?us-ascii?q?wYDCQMCH09xLxISBQMLFSpHBAg2BQYcNhICCA8SDyxEDkI3NBMGXAEpCw4RA?=
 =?us-ascii?q?1BHGW4EghEGKSaeOWsGAS0mOzB3xHCDfIFSnn1MgUSmXIEKLZcgIKMchCsCC?=
 =?us-ascii?q?gcWgXmBfk0fGYMiTwECAQEBDQECAQEDAQIBAQEJAQEBAY4dDBaCCpFLYTsCB?=
 =?us-ascii?q?wsBAQMJjCMBAQ?=
IronPort-PHdr: A9a23:PSChzB0KG9ttIqCvsmDPn1BlVkEcU/3cNA8J8dwskbtRfKO589LvO
 VGZ5PkrhUKaFYzB4KdCjOzb+7vlRXRG+5uEt2wPNZ1UAhEJhZ9EwAUpDJyJVRKrfqe4PScwR
 ZwQX1Q9oBmG
IronPort-Data: A9a23:H1dSharXzkLQjLwvtoS4tzXYTXFeBmI8YxIvgKrLsJaIsI4StFCzt
 garIBnUP66MNGKkeI0kbIi+9RwO6sSGm4NqGVdkrC8xFXtE8cSVC92Xcx/+bn2ZJ5GeQk5ut
 pkUMdXNIJBoEySBqhzwG7Ww9nMUOYOgH+qkUrSYUsxSqa6IbA971HqPTsZg2tYAbeCRWl/L4
 ZWoyyHmEAfNNwRcawr41orawP9RlKSq0N8nlgRWicBj5DcyQFFIZH63DfjZw0rQGuG4LMbjL
 wrw5O3RElfiwvsYIojNfoAX06E9auW60QCm0hK6UkU56/RIjnRaPq0TbJLwZarL4tmEt4gZ9
 TlDiXC/YSg5brf2tbUdaD4bSCxyLad6x5vAIEHq5KR/z2WeG5ft6/9vEFpwNpcR5ehwG20I+
 PkFbjEBKBme7w606OzjDLMw3IJ5fI+xYN93VnJIlFk1Cd4oW5nFQI3B/9ZH0jAqioZDGOuYZ
 sZfYCcHgBHoP0EXawpKV85l9AuuriT0NGNbtHK7nqsq+WPX4FYyibe2C/OAL7RmQu0Oxh3I/
 DiXl4jjOTkeNdqC2X+F7XergMfRki7hHoEfDru18rhtmlL77mgSDgAGfUG8rPK6z1OlHdRSN
 yQ8+CYjqbY77kGDVcTmUluzp3vsg/IHc4QIVrdmskTXmu+Ov1rfHXQNUj9KLsA+u85wTjsvk
 FaU9z/0OdBxmJKFGWin2+aUlhTxYiUZPWU+WgsDTDJQtrEPv7oPph7IS99iFou8gdv0BSz8z
 li2QM4W2uV7YSkjifjTwLzXv96/jt2SFV5qv1m/snaNt14gPtb9OeRE/HCBtZ59wJClok6pl
 UVsdyK21/ECC5yc/MBmaL9VROnBCxqtFjDDyWVoAoUhvwuk/3O4Fb28DRkgfAIzbpxBI2+sO
 hOP/xhN7YNSNz22daB2JYm2DoIj0MAM9OgJtNiIMrKigbArL2drGR2CgmbKgQjQfLAEy/1XB
 HtiWZ/E4LZzIf0PIMCKb+kcy6Q34Ss12HneQ5v2pzz+j+XCOyPKGexdawPSBgzc0E9iiFiFm
 zq4H5XXoyizrMWkM0E7DKZJcgtTdiBrbXwIg5EGLbTYSuaZJI3RI6SJmuN7Id0Nc1V9iv/Ht
 nC7RkJCzlfj7UAr2i3UAk2OqdrHA/5CkJ7MFXV0YAz3hCJ+P9/HAWV2X8JfQITLPddLlZZcJ
 8Tpse3ZahiWYjiYqTkbc7fnq4luKEaiiQ6UZnr3ayI2YJBnXQCP99r5OArjsiATV3Llucw7q
 rym9wXaXZtaGVs4Vp6MNar+wgPjp2UZlcJzQ1DMfItZdnLsx442eSb/ueBmccgDJCLKyiaey
 wvLUwwTovPAotFp/dSQ3fKEoo6lHvFQBE1fG2WHv7+6OTODrjio24ZfXuGScXbQUX6y+ankb
 PgMl6PwN/gOnVBrtYtgEu81kvhkv4Gy/+5Xl102Em/KYlKnDqJbDkOHhcQf5LdQwrJ5uBetX
 hzd8NdtOYKPZJHvHmkOdVgsYem03P0JniXfsKYuK0Lg6S4poLeKXBkAPxSIjyABfrJ5PJl/m
 rUrudINrQelgwUkNcyKyC1R6iKNIjoJTvx/5J0dBYbqjCsty01DOMKDUHWuuszXOtgcYFM3J
 jK0hbbZg+oOzET1c001SSrH091C1MYHtx19xVMfI0iEx4jejfgt0RwPrTk6ElZPwhNc374hM
 2RnLRYvd/vWum003o0ZDyX2R10HHwGQ5k36jUcRm2yfRE6tEGXQdTVvNeGI9UEf0mRdYjkCo
 u7Ckj6/DG67cZGjxDY2VG5kt+fnEY57+DrEyZKuEMmyFpUnZSbo3/21bm0Sphq5Xc48iSUrf
 wWxEDqctEEjCRMtng==
IronPort-HdrOrdr: A9a23:ErHXAqqExL7Hs0iZbtMz/+gaV5rxeYIsimQD101hICG9Evbzqy
 lhppUmPHjP+U8ssBNJo7290cy7LU80mqQFgrX5UY3MYOCighrNEGgA1/qF/9SfIVydygc178
 4JGJSWSueAamSS5vyb3ODXKbgdKFbrytHRuQ6n9QYJcehzUdAd0+5mMHfnLqSofng8OXLpfK
 DsnPZ6mw==
X-IronPort-Anti-Spam-Filtered: true
Received: from 60-242-28-244.static.tpgi.com.au (HELO bits.crawford.emu.id.au) ([60.242.28.244])
  by ipmail06.adl3.internode.on.net with ESMTP; 27 Jan 2023 15:11:49 +1030
Received: from agc.crawford.emu.id.au (agc.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc07])
        (authenticated bits=0)
        by bits.crawford.emu.id.au (8.17.1/8.17.1) with ESMTPSA id 30R4fIgi2462776
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
        Fri, 27 Jan 2023 15:41:45 +1100
Authentication-Results: bits.crawford.emu.id.au; arc=none smtp.remote-ip=fdd2:7aad:d478:1::cb10:cc07
DKIM-Filter: OpenDKIM Filter v2.11.0 bits.crawford.emu.id.au 30R4fIgi2462776
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crawford.emu.id.au;
        s=s1; t=1674794506; bh=hcotMYrz3/juQ80iYm5gcIUjBnolTH1T+VhLUa/Dlug=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=oGMTIQpo61cuchpClulwU9W/g59Aa3wG+r9I8I61yOQ/UIw/wqC4CJCp98M3A61A2
         0FtiAA2wozWZPQXwrDVg5TCFPUY2smncFIL55i/gzgGZWpVu5V2b1Mnqo4Zg8hx7Sn
         XSbV3t1+/OFzC1TqEAT/5J7aZmgrgMdesoJCtu7XF3j0COEAxMNYx8OYu3DlWn3BkL
         1HbjT+W+P5zHzpaylm/eefAy5+oYYRKti4G3z9NZhiKUUjRhbf7aA3QVeU1ESwy2lt
         pimrvxInZLIVcU9dEDMtiHFqBfHUFDhTJQLQNen00MNhbwF2ULEM7MNzP5qgIMF/r1
         pc/lG5E46RwKg==
From:   Frank Crawford <frank@crawford.emu.id.au>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org,
        Frank Crawford <frank@crawford.emu.id.au>
Subject: [PATCH v2 5/7] hwmon: (it87) Allow multiple chip IDs for force_id
Date:   Fri, 27 Jan 2023 15:41:14 +1100
Message-Id: <20230127044116.1257799-6-frank@crawford.emu.id.au>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230127044116.1257799-1-frank@crawford.emu.id.au>
References: <20230127044116.1257799-1-frank@crawford.emu.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4 (bits.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc01]); Fri, 27 Jan 2023 15:41:46 +1100 (AEDT)
X-Virus-Scanned: clamav-milter 0.103.7 at bits.crawford.emu.id.au
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Extend the force_id module parameter to allow specifying one or both
chip IDs separately.  If only a single parameter is given it defaults
to using that value for all chips, similar to previous usage.

Signed-off-by: Frank Crawford <frank@crawford.emu.id.au>
---

v2:
 * No change.

---
 drivers/hwmon/it87.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
index 61a1a2c643ed..f41da0896097 100644
--- a/drivers/hwmon/it87.c
+++ b/drivers/hwmon/it87.c
@@ -175,8 +175,9 @@ static inline void superio_exit(int ioreg, bool noexit)
 #define IT87_SIO_VID_REG	0xfc	/* VID value */
 #define IT87_SIO_BEEP_PIN_REG	0xf6	/* Beep pin mapping */
 
-/* Force chip ID to specified value. Should only be used for testing */
-static unsigned short force_id;
+/* Force chip IDs to specified values. Should only be used for testing */
+static unsigned short force_id[2];
+static unsigned int force_id_cnt;
 
 /* ACPI resource conflicts are ignored if this parameter is set to 1 */
 static bool ignore_resource_conflict;
@@ -2410,7 +2411,7 @@ static const struct attribute_group it87_group_auto_pwm = {
 
 /* SuperIO detection - will change isa_address if a chip is found */
 static int __init it87_find(int sioaddr, unsigned short *address,
-			    struct it87_sio_data *sio_data)
+			    struct it87_sio_data *sio_data, int chip_cnt)
 {
 	int err;
 	u16 chip_type;
@@ -2426,8 +2427,12 @@ static int __init it87_find(int sioaddr, unsigned short *address,
 	if (chip_type == 0xffff)
 		goto exit;
 
-	if (force_id)
-		chip_type = force_id;
+	if (force_id_cnt == 1) {
+		/* If only one value given use for all chips */
+		if (force_id[0])
+			chip_type = force_id[0];
+	} else if (force_id[chip_cnt])
+		chip_type = force_id[chip_cnt];
 
 	switch (chip_type) {
 	case IT8705F_DEVID:
@@ -3419,7 +3424,7 @@ static int __init sm_it87_init(void)
 	for (i = 0; i < ARRAY_SIZE(sioaddr); i++) {
 		memset(&sio_data, 0, sizeof(struct it87_sio_data));
 		isa_address[i] = 0;
-		err = it87_find(sioaddr[i], &isa_address[i], &sio_data);
+		err = it87_find(sioaddr[i], &isa_address[i], &sio_data, i);
 		if (err || isa_address[i] == 0)
 			continue;
 		/*
@@ -3468,8 +3473,8 @@ static void __exit sm_it87_exit(void)
 MODULE_AUTHOR("Chris Gauthron, Jean Delvare <jdelvare@suse.de>");
 MODULE_DESCRIPTION("IT8705F/IT871xF/IT872xF hardware monitoring driver");
 
-module_param(force_id, ushort, 0);
-MODULE_PARM_DESC(force_id, "Override the detected device ID");
+module_param_array(force_id, ushort, &force_id_cnt, 0);
+MODULE_PARM_DESC(force_id, "Override one or more detected device ID(s)");
 
 module_param(ignore_resource_conflict, bool, 0);
 MODULE_PARM_DESC(ignore_resource_conflict, "Ignore ACPI resource conflict");
-- 
2.39.1

