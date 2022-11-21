Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D37FEC433FE
	for <linux-hwmon@archiver.kernel.org>; Mon, 21 Nov 2022 02:57:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229586AbiKUC5t (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 20 Nov 2022 21:57:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbiKUC5r (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 20 Nov 2022 21:57:47 -0500
Received: from ipmail03.adl2.internode.on.net (ipmail03.adl2.internode.on.net [150.101.137.141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 8FCF663EE
        for <linux-hwmon@vger.kernel.org>; Sun, 20 Nov 2022 18:57:43 -0800 (PST)
IronPort-SDR: +x3mTIENq+DlAGUJwdJ3K/2p1Q76M9YEeXr36awBXUcB8pVYXfyFrUPmBU3xVrU7MS/8/CLlO/
 S8Kwnvn+qDTXJYSnGlbwAZmPLCj8eWU24wUKrLPuqsPMNyXxk4tGPzNEXfYGQiDtL4LPMqG0+m
 Se2rHNdISFg+VCNhKvl5Sr/46MylcdGDtOKOzwYSrBtUIMogLienj/zDFsZ2dE1oX/en1Ivioq
 jjGBH2Mrj2JVKykJSEnXOJCnfe+NSjB2GJzN8Lv5kGnJWMbkqVtfQ7voRFJu4RjvQ8OwlfJflz
 oavbXNryZ10daiPUP7jI0v7A
X-SMTP-MATCH: 0
X-IPAS-Result: =?us-ascii?q?A2DLCQC353pjjPQc8jxagRKBRoItglyVaJ8yDwEPAQFEB?=
 =?us-ascii?q?AEBhQWFBCY3Bg4BAgQBAQEBAwIDAQEBAQEBAwEBBgEBAQEBAQYEFAEBAQE/G?=
 =?us-ascii?q?AE5BwtSBwtYBweBQQuBYRMLAzENhlYrCwENAQE3ASiBFQESgn2DI7R6M4EBg?=
 =?us-ascii?q?ggBAQaCYJpmgV4JgUGLTYESgzaBPT+BToEVgQqBcBhWhAuGd5g0AwkDBwVJQ?=
 =?us-ascii?q?AMLGA0WMgoTNxtYDgkfHCUNBQYSAyBsBQc6DygvZyscGweBDCooFQMEBAMCB?=
 =?us-ascii?q?hMDIgINKTEUBCkTDSsnbwkCAyFqAwMEKCwDCUAHJyY8B1Y6BQMCDyA4BgMJA?=
 =?us-ascii?q?wIiVXQvEhQFAwsVJQgFSwQIOQUGUxICChEDEg8sRQ5IPjkWBidCATEODhQDX?=
 =?us-ascii?q?ksdgQEEgiYKmxprBy1XCjAcW5QjQ44OoUCDcoFNnm1MgUSmSIEKlzQgoweEK?=
 =?us-ascii?q?AIKBxaBeIF/TR8ZgyJPAQIBAQENAQIBAQMBAgEBAQkBAQEBjjaCE4w4YTsCB?=
 =?us-ascii?q?wsBAQMJiAmCWQEB?=
IronPort-PHdr: A9a23:i6a6XRw3q3AvYtHXCzPpngc9DxPP853+PxIOrJE9gq1Adb6vuZnnI
 Qre6bNkkQyBVJ/QvvRDjeeeqKX8QSoa7JOGrH1HcYQZWRMJ05dJlgUsUsLZVh2pday4ZCZjR
 JZJXwc6l0w=
IronPort-Data: A9a23:4LmU76jP5FTBTD/fhT7cQlXpX161UhYKZh0ujC45NGQN5FlHY01je
 htvWG2AOPaPYWqhKdtwPd/g8EgCvcPWzdE2QVBv+X0wQ3kW8ZGfWIuUcxf9ZnPKdZTNHUhut
 s5OO4WdIp9oRXWM9z6gY+PrxZVe/fjYHuCmVIYoGczQqStMEnpJZcdLwrZh6mJQqYHlRVvL4
 7semuWHULOf82cc3l88sspvljs/5JwehxtA1rAOTagjUIj2yhH5pLpGTU2AByOQrrt8R4ZWd
 M6fpF2NxV41yj92Yj+TfhcXRWVRKlLaFVDmZnO7wMFOiDAazsA5+v5T2Pbx9S67hh3R9+2dx
 umhurSCeDw7FaHnud4neBNJMH54F4NboYb+dC3XXcy7lyUqclPmwul1SkosNJIW/fx7R2xL6
 LoZJHYEc3hvhcromPThFrMq3JRldpW3VG8ckigIITXxA+wvR5PrSL/D+tFfxjt2i8VTW/fSI
 cMEAdZqRE6QOEMUYwlLVfrSms+HgnjPeQZ0s2m5ho5r82rL7BBc3+jUZY+9ltuiHp0OzhzC9
 woq5V/RBhAcKczaySWA9XSEmODCh2X4VZgUGbn+8eRl6HWXx2oOGDUMUlaworykkQi4Vs43A
 04Y9y4wpLI/3Fe2VdS7VBq9yENopTZCA58KT7d/slHIkPaIpR2FD3QFRXhdcNMn8sQxQHojy
 zdlgu8FGxRdgYaHYn62142uhjmjGncTB0EfPBY9GF5tD8bYnKk/iRfGT9BGGaGzj8HoFTyY/
 9xshHZg71n0pZBWv5hX7WwrkBrp/cOZEVdpjunDdjv4t1khPNDNi5mAsACz0BpWEGqOZnC81
 JTus/OP4OYDHPlhfwTXGL1VdF1Fz9CIL3XnhkNzH9Ee/jCg4BaekW14vmk7fhszd5xUPGW1P
 AnIpQpN5ZQVIGOlbOl8ZIf3AtlCIUnc+TbNCqu8gjlmOMMZmOq7EMZGPB744owVuBJw+ZzTw
 L/CGSpWMV4UCL580B29TPoH3Lkgy0gWnD2NFcGlnkz9jOLBPBZ5rIvp1nPQMIjVC4va/W3oH
 yp3bZHiJ+h3CrOvPXmNqeb/03hUdidgXvgaVPC7hsbYelE2QjtwYxMg6a85dMRkmbhYjOHF4
 hmAtrxwljLCaYn8AVzSMBhLNumwNauTWFpnZUTAy370giZ/CWtuhY9DH6YKkU4PrrQ8kqYvF
 qRVK61twJ1nE1z6xtjUVrGlxKQKSfhhrVvm0/ONbGdtcph+aRbO/9O4LALj+DNXXni8r8Ihr
 bq62kXWRIdFRggkBduPMKCjyFa4vH48nuNuXhKWfIcPIBqwrtFne37rk/s6A8AQMhGdlDGU4
 AahB0tKr+f6vN5n+dbEsqmIsoO1HrYsBUFdBWTas+q7OHCCrGquyINNSsiSejXZWD+m8amuf
 7wFnfrmOeIJm0xG9Yd5DvBqweQ3+oK39bNdyw1lGlTNbkiqU+0+fCXegpUR76AUn+1Xowq7X
 E6L6+J2A7TRNZO3CkMVKSokcv+Hi6MelA7S2vJpck/00zAmrrOIXHJbMwSIlCEAfqB+N5kow
 Ll9tcMbt16/hx4tPorUhyxY7T7XfHYBT75hvYsTH4HskAZtx1RfJ53QTCbrucndZ9JJO0gsA
 zmVmKub2eoCmhKdLyRqGCifx/dZiLQPpAtOkg0IKWOJrdyZ1PU56wIAoz04QzNcwghDz+8ua
 HNgMFd4JPvS8jo01tJPWXugR1NICBGDoRajlQNMzjGDChP4EzaRcCsmJe+R/Utf73pTf35Q+
 7TewXu8CWTme8T43y0TX095qqW9E4ItrlKexpmqT5afAp03QTv5mavyN2AGnB22U8o+iXrOq
 fRu4OstO7bwMjQdovNnBoSXvVjKpMto+ICfrSldwZ40
IronPort-HdrOrdr: A9a23:PAXGz6sIc00zm07idRka90+U7skDUtV00zEX/kB9WHVpm6yj/f
 xGUs576faSskd3ZJlD8ersBEDkex/hHPFOkOos1NuZMzUO21HYSL2Kk7GSoQEIcheWnoVgPM
 xbE5SWZuefMbD04PyKhjVQa+xQpeVv6JrY+Ns21U0dNz2CdZsQlDuR1Tzra3GflWF9dOIEKK
 Y=
X-IronPort-Anti-Spam-Filtered: true
Received: from 60-242-28-244.static.tpgi.com.au (HELO bits.crawford.emu.id.au) ([60.242.28.244])
  by ipmail03.adl2.internode.on.net with ESMTP; 21 Nov 2022 13:27:42 +1030
Received: from agc.crawford.emu.id.au (agc.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc07])
        (authenticated bits=0)
        by bits.crawford.emu.id.au (8.17.1/8.17.1) with ESMTPSA id 2AL2vLVK346057
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
        Mon, 21 Nov 2022 13:57:28 +1100
Authentication-Results: bits.crawford.emu.id.au; arc=none smtp.remote-ip=fdd2:7aad:d478:1::cb10:cc07
DKIM-Filter: OpenDKIM Filter v2.11.0 bits.crawford.emu.id.au 2AL2vLVK346057
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crawford.emu.id.au;
        s=s1; t=1668999448; bh=yyAlDoyIYygGdCPX3d/ijqLPeX1ZuJr9+8zWaCuDSB4=;
        h=From:To:Cc:Subject:Date:From;
        b=PNUH2+gI18s+2J+BrfFPSdGhYhgqzYHjH5IPbFcataw6pTmMa9OHoo9MNyrAYlwrc
         VwqnTdOWVv+5Q9hFfDBtiVEpIRwF3HDTNWF3L2HMQfp9a7r0TLTzTgOl8AxngqMwb5
         eBHeJKJFDYVdmpgJ4SgpZwJx9JqJjxKOHGlgAiZd69z95dVUyIJMRhV+hu7PiN1oSB
         ZMcroEn0VVnERWWKg7FV9g7BuuSuu68wcenBVWoTPoTCPLTZOkzKRBklI7hpWZ5khF
         iPDvtOFM4KsEIbr+WckXzJWMOF4Q03dbODT9xRJf5vjVIt3k5C5a5BV2jQqC5qw6oF
         h5xelEyifEgxA==
From:   Frank Crawford <frank@crawford.emu.id.au>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org,
        Frank Crawford <frank@crawford.emu.id.au>
Subject: [PATCH 1/1] hwmon: (it87) Automatic handling of ACPI resource failure
Date:   Mon, 21 Nov 2022 13:57:18 +1100
Message-Id: <20221121025718.160667-1-frank@crawford.emu.id.au>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4 (bits.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc01]); Mon, 21 Nov 2022 13:57:28 +1100 (AEDT)
X-Virus-Scanned: clamav-milter 0.103.7 at bits.crawford.emu.id.au
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On some Gigabyte boards sensors are marked as ACPI regions but not
really handled by ACPI calls, as they return no data.
Most commonly this is seen on boards with multiple ITE chips.
In this case we just ignore the failure and continue on.

This is effectively the same as the use of either
    acpi_enforce_resources=lax (kernel)
or
    ignore_resource_conflict=1 (it87)
but set programatically.

Signed-off-by: Frank Crawford <frank@crawford.emu.id.au>
---

Changes in this patch set:

* Add a flag, set in the DMI table, for ignoring ACPI resource conflict.

* Print an message if a conflict occurs, but otherwise ignore the issue.

* Add known, tested boards to the DMI table.

 drivers/hwmon/it87.c | 62 +++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 61 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
index 9997f76b1f4a..991f1ab5f82c 100644
--- a/drivers/hwmon/it87.c
+++ b/drivers/hwmon/it87.c
@@ -570,6 +570,7 @@ struct it87_data {
 /* Board specific settings from DMI matching */
 struct it87_dmi_data {
 	u8 skip_pwm;		/* pwm channels to skip for this board  */
+	bool skip_acpi_res;	/* ignore acpi failures on this board */
 };
 
 /* Global for results from DMI matching, if needed */
@@ -3264,7 +3265,9 @@ static int __init it87_device_add(int index, unsigned short address,
 
 	err = acpi_check_resource_conflict(&res);
 	if (err) {
-		if (!ignore_resource_conflict)
+		if (dmi_data && dmi_data->skip_acpi_res)
+			pr_info("Ignoring expected ACPI resource conflict\n");
+		else if (!ignore_resource_conflict)
 			return err;
 	}
 
@@ -3322,6 +3325,21 @@ static struct it87_dmi_data nvidia_fn68pt = {
 	.skip_pwm = BIT(1),
 };
 
+/*
+ * On some Gigabyte boards sensors are marked as ACPI regions but not
+ * really handled by ACPI calls, as they return no data.
+ * Most commonly this is seen on boards with multiple ITE chips.
+ * In this case we just ignore the failure and continue on.
+ * This is effectively the same as the use of either
+ *     acpi_enforce_resources=lax (kernel)
+ * or
+ *     ignore_resource_conflict=1 (it87)
+ * but set programatically.
+ */
+static struct it87_dmi_data gigabyte_acpi_ignore = {
+	.skip_acpi_res = true,
+};
+
 #define IT87_DMI_MATCH_VND(vendor, name, cb, data) \
 	{ \
 		.callback = cb, \
@@ -3332,7 +3350,49 @@ static struct it87_dmi_data nvidia_fn68pt = {
 		.driver_data = data, \
 	}
 
+#define IT87_DMI_MATCH_GBT(name, cb, data) \
+	IT87_DMI_MATCH_VND("Gigabyte Technology Co., Ltd.", name, cb, data)
+
 static const struct dmi_system_id it87_dmi_table[] __initconst = {
+	IT87_DMI_MATCH_GBT("TRX40 AORUS XTREME", it87_dmi_cb,
+			   &gigabyte_acpi_ignore),
+		/* IT8688E + IT8792E/IT8795E */
+	IT87_DMI_MATCH_GBT("Z390 AORUS ULTRA-CF", it87_dmi_cb,
+			   &gigabyte_acpi_ignore),
+		/* IT8688E + IT8792E/IT8795E */
+	IT87_DMI_MATCH_GBT("Z490 AORUS ELITE AC", it87_dmi_cb,
+			   &gigabyte_acpi_ignore),
+		/* IT8688E */
+	IT87_DMI_MATCH_GBT("B550 AORUS PRO AC", it87_dmi_cb,
+			   &gigabyte_acpi_ignore),
+		/* IT8688E + IT8792E/IT8795E */
+	IT87_DMI_MATCH_GBT("B560I AORUS PRO AX", it87_dmi_cb,
+			   &gigabyte_acpi_ignore),
+		/* IT8689E */
+	IT87_DMI_MATCH_GBT("X570 AORUS ELITE WIFI", it87_dmi_cb,
+			   &gigabyte_acpi_ignore),
+		/* IT8688E */
+	IT87_DMI_MATCH_GBT("X570 AORUS MASTER", it87_dmi_cb,
+			   &gigabyte_acpi_ignore),
+		/* IT8688E + IT8792E/IT8795E */
+	IT87_DMI_MATCH_GBT("X570 AORUS PRO WIFI", it87_dmi_cb,
+			   &gigabyte_acpi_ignore),
+		/* IT8688E + IT8792E/IT8795E */
+	IT87_DMI_MATCH_GBT("X570 I AORUS PRO WIFI", it87_dmi_cb,
+			   &gigabyte_acpi_ignore),
+		/* IT8688E */
+	IT87_DMI_MATCH_GBT("X570S AERO G", it87_dmi_cb,
+			   &gigabyte_acpi_ignore),
+		/* IT8689E + IT87952E */
+	IT87_DMI_MATCH_GBT("X670E AORUS MASTER", it87_dmi_cb,
+			   &gigabyte_acpi_ignore),
+		/* IT8689E - Note there may also be a second chip */
+	IT87_DMI_MATCH_GBT("Z690 AORUS PRO DDR4", it87_dmi_cb,
+			   &gigabyte_acpi_ignore),
+		/* IT8689E + IT87952E */
+	IT87_DMI_MATCH_GBT("Z690 AORUS PRO", it87_dmi_cb,
+			   &gigabyte_acpi_ignore),
+		/* IT8689E + IT87952E */
 	IT87_DMI_MATCH_VND("nVIDIA", "FN68PT", it87_dmi_cb, &nvidia_fn68pt),
 	{ }
 
-- 
2.38.1

