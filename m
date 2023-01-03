Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A62BBC54EBC
	for <linux-hwmon@archiver.kernel.org>; Tue,  3 Jan 2023 06:51:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236776AbjACGv6 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 3 Jan 2023 01:51:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236805AbjACGv5 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 3 Jan 2023 01:51:57 -0500
Received: from ipmail06.adl3.internode.on.net (ipmail06.adl3.internode.on.net [150.101.137.16])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E3C3FD2E2
        for <linux-hwmon@vger.kernel.org>; Mon,  2 Jan 2023 22:51:55 -0800 (PST)
IronPort-SDR: SZJS8wveH6/EiECU606pWMMwh0kC5S/P6WU1n6vJZmQQlqDBbfQlKy/Gmmh26zJYk4vPmgGS9F
 u+KqsORsjOcp0Tv9g0tCco5GIi14J0JqOkLLgjUI3OM4uAkDC/e4tngUlTspXyN1hW7+tTKpy4
 f7EECMigR+aiX6NPb8CyGHCcBqz7VmolswX5Q++XmRe1dcs16/C+zNSoSYN0Msg5hpke8OxiLG
 +lcxmxaLDrveTsOK+PD/o3fAqZABMGFE5Qz6FqfAdOO1/rGofSaAOJkTMcwHY4OKPxh40n5RXM
 DjAjd85SMo20hIF/lQMnzaop
X-SMTP-MATCH: 0
X-IPAS-Result: =?us-ascii?q?A2ArBgAozrNjjPQc8jxaHQEBAQEJARIBBQUBSYFGgi2CX?=
 =?us-ascii?q?5VtnzoPAQ8BAUQEAQGFBQKFESY4EwECBAEBAQEDAgMBAQEBAQEDAQEGAQEBA?=
 =?us-ascii?q?QEBBgQUAQEBAUBSBwtSBwtYBweBQQuBYRMLAzENhlcCAQMyAQ0BATcBDxk4V?=
 =?us-ascii?q?wYBEoJ+gyOzVIEBgggBAQaCYppmgV4JgUCLYIESgzd6Qz+BToEVg2iDfIcGm?=
 =?us-ascii?q?RoKgT19gScOTFcDCQMHBUlAAwsYDRYyChMtNQsMSysaGweBCiooFQMEBAMCB?=
 =?us-ascii?q?hMDIAINKDEUBCkTDScmawkCAyJhBQMDBCgtCUAHJiY8B1Y3BQMCDx83BgMJA?=
 =?us-ascii?q?wIfEj9xLxISBQMLFSpHBAg2BQYcNhICCA8SDyxDDkI3NhMGXAEqCw4TA1BHG?=
 =?us-ascii?q?W8EggwKBikonAaBCB9vgXGBA6E2oViDeIFQnnZMgUSCNaUrLZcZIIIrn0qBG?=
 =?us-ascii?q?IQoAgoHFoF5gX5NHxmDIk8BAgEBAQ0BAgEBAwECAQEBCQEBAQGOHRmCE4w4Y?=
 =?us-ascii?q?TsCBwsBAQMJiVuCSAEB?=
IronPort-PHdr: A9a23:yW6d/RHf0y98ssXb3+6r751GfhYY04WdBeZdwpAml6kIeb6q4JrlJ
 kCZ6PBwyl7FG4zGuLpNkeGDtafmVCQb5IqZ9moPdZtQWloEkZAYkwB6UpGMAEGpIKK1P35jT
 pZJXgY9rXqwaRc9JQ==
IronPort-Data: A9a23:lMji7avtiOHdJzKi0d5gDl9/2+fnVGFYMUV32f8akzHdYApBsoF/q
 tZmKWiEaKzfNDChfNh3Poq0phhV7cKBx9JkHgs/rS5kRiIb9pWcC4uVdBb5Yi7Cc5bIQEg7s
 s5AO9fOcZBoFnSEq0uEP+m6pxGQ94nRFuKmUrKs1gOd5ONAYH184f62s7dh2uaEufDgX0XV/
 4maT/T3YDdJ4RYtWo4pw/vrRC1H7KyaVAww5jTSVdgT1LMJvyR94Do3fMldHlOgKmVmNrfSq
 9XrkNlVyljkEyIFUbtJpFpannoiGdY+NSDW4pZftjPLbhJq/kTe2Y5jXBYQhNs+Zzihx7hMJ
 NtxWZOYUl8qDq70k/YhfwB/OCBnArYZ1uD9Li3q2SCT5xWun3rEyfRyFwc9J4QH9OFtDSdD8
 OFeKTxLZw3ra+Cenur9ELU2wJ5zapO3YOvzuVk5pd3dJfg8SJbAa67Q7MBW2y08wM1LALDfa
 4wQdFKDaTycOEwRZA1NVc5WcOGAmGTzXjNosA+su4Uv73bNjwwo6eXtGY+AEjCNbZ4NxRbC/
 DOuE37CKhUbMsGPjDqa93WqrvHAkDm9W48IErC8sPlwjzW7wm0VFQ0+T1y2qvr8l1X4Xd9DQ
 2QW9icqs6Eo+WSwU8LwGRa/pRa5UgU0BYIVSbFgrVvdj/CIv0CCGmEYTzUHdMQptYk9Qjls3
 0Lhc87V6SJHq+WWeXGl/aWogSqVEikMEnRdS3A+Ql5QizX8m70bghXKR9dlNae6iNzpBD39q
 wxmSgBg2d3/auZVjM2GEUD7byGE48OSHlFsum07Skr8s1ojPNb7D2C9wQWDhcusOrp1WXGog
 RDoceCl/ewIAIDleMelGr1VRNlFC96jPSKUullyA5lpyD2p9mXLQGy9yG8mYR01aINeKXqzP
 BOVoh9Y+J5YemeyYq4xaIW0Tc03pUQBKTgHfqyIBjatSsIqHONiwM2JTRTOt10BaGB2zckC1
 W6zKK5A90oyB6V91yaRTOwAy7ItzS1W7TqNGsqln0j9i+fBPyL9pVI53L2mML5RAESs/l69z
 jqjH5DTo/mieLehOXKModZ7wa4icSRrXsCeRzNrmh6reVI9SDt7Wpc9MJs9Y4MtnqJJm/3O8
 23VZ6Or4ASXuJEzEi3TMioLVV8adconxZ7NFXB1YwrANrlKSdrH0ZrzgLNtJeZ+pLIynK4lJ
 xTHEu3Zaslypv3802x1RfHAQEZKLXxHXCqCYHioZiYRZZllS1Cb89PoZFK/piIUBzW5stEy5
 bCly0XaTdwKWl06XsrRbfuuyXK3vGQcwbwtBxKTfIUKIUi8opJ3LyHRj+MsJ59eIxv0xgyci
 1ScDyAH9LvErIIC+dXUgbyJ8tWyGOxkE0sEQ2TWtO7kNSTT8me575VHVeKEIWLUWG/uofXwb
 v9c0P/7KvFBkVNX9YtwVb92lPps69zqrr5c7wJlAHSSMQvzU+g+fiDf0JAW5KNXx7JftQ+nY
 W61+4FXaeeTJcfoMF8NPw57PO6N4vEjnGWA5/oCPxSo7SB6y7OLTEFOMkTekydaNrZ0bt8oz
 Op96s4b7wuz1kgjPtqc1HsG/WWQNToLSaw4uJYADMnmjxdty10EaIGFUn3655SGatNtNEg2I
 2bK2/Kb3OoAnxPPIygpCHzA/etBnpBQ6hpE+181IQjbkNTyma5l1RJcxj07UwBJw0gVyOl0I
 GVqaRF4KPnc5Ttun8QfDWmgFxsaXk/HogmrlwFMzj2cFRX0EHfRJXE8MqCR5E8YtWlbe35S4
 ejAmmriVD/reuD33zczABA686W4E4AorwCSytq6G8mlHoUhZWa3iKGZYztaohTqNso9mUnbq
 LQ45+13c6D6a3IdrqBT51N2DljMpM1o/FB/fMw=
IronPort-HdrOrdr: A9a23:SmgGK6OZrd2jjcBcThujsMiBIKoaSvp037BK7SpMoNJuE/Bw8P
 re5cjyt3fP5Qr5PUtNpTnuAtjifZqxz/FICMwqTNOftWrdyQ2Vxf9ZnOnfKlTbckWUygce79
 YGT0EUMr3N5DZB4/oTb2SDYq4dKaG8gcWVbP/lvgtQpB9RGtxdBthCe32m+pwffng9OaYE
X-IronPort-Anti-Spam-Filtered: true
Received: from 60-242-28-244.static.tpgi.com.au (HELO bits.crawford.emu.id.au) ([60.242.28.244])
  by ipmail06.adl3.internode.on.net with ESMTP; 03 Jan 2023 17:16:51 +1030
Received: from agc.com.au (agc.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc07])
        (authenticated bits=0)
        by bits.crawford.emu.id.au (8.17.1/8.17.1) with ESMTPSA id 3036kRlN2641329
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
        Tue, 3 Jan 2023 17:46:47 +1100
Authentication-Results: bits.crawford.emu.id.au; arc=none smtp.remote-ip=fdd2:7aad:d478:1::cb10:cc07
DKIM-Filter: OpenDKIM Filter v2.11.0 bits.crawford.emu.id.au 3036kRlN2641329
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crawford.emu.id.au;
        s=s1; t=1672728407; bh=iTvONrBDoBWEZbW7cFmRUhkmGPwZtaCj5pXblnMvgGI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=P88wRTj38zhQsX3DEliENOY7xtYKLvTEdFfqqH5JM8Xaspjc3tM9x844EmOzdQAxk
         fyXLHgTAVQY7SmzyspUGqn8Qzh01GXOGn87EG0O8KWjuzaat5IsqgEc1toH22Y/qJd
         9HwvYUhMjI9AEIkpKMhJgPu8O2S8O9L9N5mTmOpWVkacwpDv3ErFzhOsYBnMNMmU6x
         MBrS+r/YnhEgbBkjCi5YxIyA2aAs8qKJM3QueLJHf7oQmiK6nmrUoEq0ioZ9pSRf5H
         yzJo6aZk67jEgT+69yFZVgtZwPE3kf+haqy3aycKZhCy+C4Wv+1mQUoMjR6ush3/Ta
         JLXZBmGfOzLRw==
From:   Frank Crawford <frank@crawford.emu.id.au>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org,
        Frank Crawford <frank@crawford.emu.id.au>
Subject: [PATCH v1 2/2] hwmon: (it87) Add entries to dmi_table
Date:   Tue,  3 Jan 2023 17:46:12 +1100
Message-Id: <20230103064612.404401-3-frank@crawford.emu.id.au>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230103064612.404401-1-frank@crawford.emu.id.au>
References: <20230103064612.404401-1-frank@crawford.emu.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4 (bits.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc01]); Tue, 03 Jan 2023 17:46:47 +1100 (AEDT)
X-Virus-Scanned: clamav-milter 0.103.7 at bits.crawford.emu.id.au
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Call initialisation of second chipset.

Update the dmi_table with mother boards that have been tested.

Signed-off-by: Frank Crawford <frank@crawford.emu.id.au>
---
 drivers/hwmon/it87.c | 58 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
index 4ebce2c661d7..2ecfa2c901f6 100644
--- a/drivers/hwmon/it87.c
+++ b/drivers/hwmon/it87.c
@@ -3315,6 +3315,27 @@ static int it87_dmi_cb(const struct dmi_system_id *dmi_entry)
 	return 1;
 }
 
+/*
+ * On various Gigabyte AM4 boards (AB350, AX370), the second Super-IO chip
+ * (IT8792E) needs to be in configuration mode before accessing the first
+ * due to a bug in IT8792E which otherwise results in LPC bus access errors.
+ * This needs to be done before accessing the first Super-IO chip since
+ * the second chip may have been accessed prior to loading this driver.
+ *
+ * The problem is also reported to affect IT8795E, which is used on X299 boards
+ * and has the same chip ID as IT8792E (0x8733). It also appears to affect
+ * systems with IT8790E, which is used on some Z97X-Gaming boards as well as
+ * Z87X-OC.
+ * DMI entries for those systems will be added as they become available and
+ * as the problem is confirmed to affect those boards.
+ */
+static int gigabyte_sio2_force(const struct dmi_system_id *dmi_entry)
+{
+	__superio_enter(REG_4E);
+
+	return it87_dmi_cb(dmi_entry);
+};
+
 /*
  * On the Shuttle SN68PT, FAN_CTL2 is apparently not
  * connected to a fan, but to something else. One user
@@ -3337,7 +3358,44 @@ static struct it87_dmi_data nvidia_fn68pt = {
 		.driver_data = data, \
 	}
 
+#define IT87_DMI_MATCH_GBT(name, cb, data) \
+	IT87_DMI_MATCH_VND("Gigabyte Technology Co., Ltd.", name, cb, data)
+
 static const struct dmi_system_id it87_dmi_table[] __initconst = {
+	IT87_DMI_MATCH_GBT("AB350", gigabyte_sio2_force, NULL),
+		/* ? + IT8792E/IT8795E */
+	IT87_DMI_MATCH_GBT("AX370", gigabyte_sio2_force, NULL),
+		/* ? + IT8792E/IT8795E */
+	IT87_DMI_MATCH_GBT("Z97X-Gaming G1", gigabyte_sio2_force, NULL),
+		/* ? + IT8790E */
+	IT87_DMI_MATCH_GBT("TRX40 AORUS XTREME", gigabyte_sio2_force, NULL),
+		/* IT8688E + IT8792E/IT8795E */
+	IT87_DMI_MATCH_GBT("Z390 AORUS ULTRA-CF", gigabyte_sio2_force, NULL),
+		/* IT8688E + IT8792E/IT8795E */
+	IT87_DMI_MATCH_GBT("Z490 AORUS ELITE AC", it87_dmi_cb, NULL),
+		/* IT8688E */
+	IT87_DMI_MATCH_GBT("B550 AORUS PRO AC", gigabyte_sio2_force, NULL),
+		/* IT8688E + IT8792E/IT8795E */
+	IT87_DMI_MATCH_GBT("B560I AORUS PRO AX", it87_dmi_cb, NULL),
+		/* IT8689E */
+	IT87_DMI_MATCH_GBT("X570 AORUS ELITE WIFI", it87_dmi_cb, NULL),
+		/* IT8688E */
+	IT87_DMI_MATCH_GBT("X570 AORUS MASTER", gigabyte_sio2_force, NULL),
+		/* IT8688E + IT8792E/IT8795E */
+	IT87_DMI_MATCH_GBT("X570 AORUS PRO", gigabyte_sio2_force, NULL),
+		/* IT8688E + IT8792E/IT8795E */
+	IT87_DMI_MATCH_GBT("X570 AORUS PRO WIFI", gigabyte_sio2_force, NULL),
+		/* IT8688E + IT8792E/IT8795E */
+	IT87_DMI_MATCH_GBT("X570 I AORUS PRO WIFI", it87_dmi_cb, NULL),
+		/* IT8688E */
+	IT87_DMI_MATCH_GBT("X570S AERO G", gigabyte_sio2_force, NULL),
+		/* IT8689E + IT87952E */
+	IT87_DMI_MATCH_GBT("X670E AORUS MASTER", it87_dmi_cb, NULL),
+		/* IT8689E - Note there may also be a second chip */
+	IT87_DMI_MATCH_GBT("Z690 AORUS PRO DDR4", gigabyte_sio2_force, NULL),
+		/* IT8689E + IT87952E */
+	IT87_DMI_MATCH_GBT("Z690 AORUS PRO", gigabyte_sio2_force, NULL),
+		/* IT8689E + IT87952E */
 	IT87_DMI_MATCH_VND("nVIDIA", "FN68PT", it87_dmi_cb, &nvidia_fn68pt),
 	{ }
 
-- 
2.38.1

