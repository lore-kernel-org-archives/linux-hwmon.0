Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F584EB64DA
	for <linux-hwmon@archiver.kernel.org>; Fri,  7 Jul 2023 12:30:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232151AbjGGMav (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 7 Jul 2023 08:30:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229800AbjGGMau (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 7 Jul 2023 08:30:50 -0400
Received: from ipmail06.adl3.internode.on.net (ipmail06.adl3.internode.on.net [150.101.137.16])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 5FBDE19BD
        for <linux-hwmon@vger.kernel.org>; Fri,  7 Jul 2023 05:30:49 -0700 (PDT)
IronPort-SDR: 64a80568_xpBb06rxlStmKCUdsntSLoj8Lz1cEsV/kM7PO8vIrAvnz98
 tJM3aAChdtYQbkFw54/8WSl6tVsm7SCJK+ibT5w==
X-SMTP-MATCH: 0
X-IPAS-Result: =?us-ascii?q?A2AKAwASBahkjPQc8jxaHQEBAQEJARIBBQUBSYFGgjOCU?=
 =?us-ascii?q?bYfDwEPAQFEBAEBhQYChhUmOBMBAgQBAQEBAwIDAQEBAQEBAwEBBgEBAQEBA?=
 =?us-ascii?q?QYEFAEBAQFARYVoDYYFAgEDJwsBDQEBNwEPGThXBgESgn6CXaljM4EBggkBA?=
 =?us-ascii?q?QaCZa4xgV8JgUKMIIEZgzt6Qj+BToEVgTyBPm+LBo4ghV0HMo0UgSdvgR43Z?=
 =?us-ascii?q?3oCCQIRZ4EICF+Bbj4CDVQLC2OBHIJOAgIROg8FU18ZHQMHA4EFEC8HBDImB?=
 =?us-ascii?q?gkYLyUGUQcXFiQJExVBBINYCoELPxUOEYJXIgI9PBtNgmoJF0NTgQEQMQQUH?=
 =?us-ascii?q?kADCQMHBUlAAwsYDUsRLDUUG0mBBxdjgW4KJCSlfwdaNII/KsRkhBWBXZ8kT?=
 =?us-ascii?q?YFKqA+YJSCjRoQvAgoHFoF6gX5NHxmDIk8DGQ+OIBmCFZFRYzsCBwsBAQMJi?=
 =?us-ascii?q?0gBAQ?=
IronPort-PHdr: A9a23:tWng1BLSHawldlG0w9mcuVEyDhhOgF28FgQU9oFhgKhHbaqk5ZikM
 UnCo/RhylbUDs3S8fkRje3Qvuj7XHAYp4yMtXcefdlNT0oLhclMzVMpCcLXBRGkfKyzPX4xF
 p0aBlRupy7TDA==
IronPort-Data: A9a23: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
 QvyIZEsFkPZLklVeNsu
IronPort-HdrOrdr: A9a23:AAeKwaoASX2oY6DgiJOVZbIaV5rxeYIsimQD101hICG9Evbzqy
 lhppUmPHjP+U8ssBNJo7290cy7LU80mqQFgrX5UY3MYOCighrNEGgA1/qF/9SDIVydygc178
 4JGJSWSueAamSS5vyb3ODXKbgdKFbrytHRuQ6n9QYJcehzUdAd0+5mMHfnLqSofng8OXLpfK
 DsnPZ6mw==
X-Talos-CUID: 9a23:SizjH23eR5//5b1oEQpz5rxfA8Y5XFeNlivsJl6mJ1xsTJm4WQKp0fYx
X-Talos-MUID: 9a23:1EQHNQt9V9arPus8zM2numh9D5kx5aKXU11TjoghsuebHGtQNGLI
X-IronPort-Anti-Spam-Filtered: true
Received: from 60-242-28-244.static.tpgi.com.au (HELO bits.crawford.emu.id.au) ([60.242.28.244])
  by ipmail06.adl3.internode.on.net with ESMTP; 07 Jul 2023 22:00:32 +0930
Received: from agc.crawford.emu.id.au (agc.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc07])
        (authenticated bits=0)
        by bits.crawford.emu.id.au (8.17.1/8.17.1) with ESMTPSA id 367CU7bM2026771
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
        Fri, 7 Jul 2023 22:30:28 +1000
Authentication-Results: bits.crawford.emu.id.au; arc=none smtp.remote-ip=fdd2:7aad:d478:1::cb10:cc07
DKIM-Filter: OpenDKIM Filter v2.11.0 bits.crawford.emu.id.au 367CU7bM2026771
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crawford.emu.id.au;
        s=s1; t=1688733028; bh=mKCGVZ5x8xE6L93ndv2Q/Q1AZxKevto8TXRk8sy6cyM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=I0l9H3yXf6LZWGo8h6RCx5mG4+AhH6L6xsFBlK//Ps8dkJlS7fT5aWtydzJO02Wp9
         PjOJY1SYnrgH/9+4Ei0fhWzDKIOtGE24HtWnGoyP1AUiVehgobSkXkdhwDL27oV/gY
         bP42wDnXnzoWjZpAo2RLDdX4XfFGsssN+CP3xMJpT+rvyLKV0OZMus/YxIdPL+xH0Y
         RUd7xOVa/33V7PF73CHLYAzERFEmqxWfVapMz8SbP4ppBW21+ix5dv27efVEjbUTzN
         cwmp4w2FV7Qkagu0EtmcNb2CCBez4n7GnGM7o0IEGKxcPsmrlL4JPyhhxxtwrYvNOB
         Bo/O1w89qIYoA==
From:   Frank Crawford <frank@crawford.emu.id.au>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org,
        Frank Crawford <frank@crawford.emu.id.au>
Subject: [PATCH v2 3/3] hwmon: (it87) Add support to detect sensor type AMDTSI
Date:   Fri,  7 Jul 2023 22:29:52 +1000
Message-ID: <20230707123005.956415-4-frank@crawford.emu.id.au>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230707123005.956415-1-frank@crawford.emu.id.au>
References: <20230707123005.956415-1-frank@crawford.emu.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4 (bits.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc01]); Fri, 07 Jul 2023 22:30:28 +1000 (AEST)
X-Virus-Scanned: clamav-milter 1.0.1 at bits.crawford.emu.id.au
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Add test for sensor type AMDTSI which is available on certain recent
chipsets.

Signed-off-by: Frank Crawford <frank@crawford.emu.id.au>
---

v2:
 * Split single patch into multi-patch set following review.

---
 drivers/hwmon/it87.c | 35 +++++++++++++++++++++++++++++++----
 1 file changed, 31 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
index fb62f2a7017a..ba75f33301ce 100644
--- a/drivers/hwmon/it87.c
+++ b/drivers/hwmon/it87.c
@@ -221,6 +221,10 @@ static bool fix_pwm_polarity;
  * Super-I/O configuration space.
  */
 #define IT87_REG_VID           0x0a
+
+/* Interface Selection register on other chips */
+#define IT87_REG_IFSEL         0x0a
+
 /*
  * The IT8705F and IT8712F earlier than revision 0x08 use register 0x0b
  * for fan divisors. Later IT8712F revisions must use 16-bit tachometer
@@ -1170,14 +1174,37 @@ static int get_temp_type(struct it87_data *data, int index)
 	 * 0 = disabled
 	 */
 	u8 reg, extra;
-	int type = 0;
+	int ttype, type = 0;
+
+	/* Detect PECI vs. AMDTSI */
+	ttype = 6;
+	if ((has_temp_peci(data, index)) || data->type == it8721 ||
+	    data->type == it8720) {
+		extra = it87_read_value(data, IT87_REG_IFSEL);
+		if ((extra & 0x70) == 0x40)
+			ttype = 5;
+	}
 
-	reg = data->sensor;	/* In case value is updated while used */
-	extra = data->extra;
+	reg = it87_read_value(data, IT87_REG_TEMP_ENABLE);
+
+	/* Per chip special detection */
+	switch (data->type) {
+	case it8622:
+		if (!(reg & 0xc0) && index == 3)
+			type = ttype;
+		break;
+	default:
+		break;
+	}
+
+	if (type || index >= 3)
+		return type;
+
+	extra = it87_read_value(data, IT87_REG_TEMP_EXTRA);
 
 	if ((has_temp_peci(data, index) && (reg >> 6 == index + 1)) ||
 	    (has_temp_old_peci(data, index) && (extra & 0x80)))
-		type = 6;	/* Intel PECI */
+		type = ttype;	/* Intel PECI or AMDTSI */
 	else if (reg & BIT(index))
 		type = 3;	/* thermal diode */
 	else if (reg & BIT(index + 3))
-- 
2.41.0

