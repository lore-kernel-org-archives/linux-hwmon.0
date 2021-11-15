Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31152C433F5
	for <linux-hwmon@archiver.kernel.org>; Mon, 15 Nov 2021 16:08:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1A7E461163
	for <linux-hwmon@archiver.kernel.org>; Mon, 15 Nov 2021 16:08:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236705AbhKOQLp (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 15 Nov 2021 11:11:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236738AbhKOQLj (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 15 Nov 2021 11:11:39 -0500
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45C46C061200
        for <linux-hwmon@vger.kernel.org>; Mon, 15 Nov 2021 08:08:43 -0800 (PST)
Received: by mail-oi1-x230.google.com with SMTP id bf8so35836506oib.6
        for <linux-hwmon@vger.kernel.org>; Mon, 15 Nov 2021 08:08:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1+7Nu/Y7sXQ3mP3Tv8QxDfh1hu9G2HGXSSJGtnsDk2w=;
        b=iGNGjeZuBfCqawLlGP/74RYvQYQC2cwgoOeVy4+iMqRi9sNbYJHyeh13Qag9jljSBi
         72uozBq/IdPLZYLyh19YuIcWPqKnOeA9JH+r0KdHTSQwUjBhh98+qIucRgdHS1uB5i+z
         zA1m4P4J9YJT4BwBKWUuAe5NY+mr+SN8JdhjpFXfVJDz0XKO2C0vi8eOdSEfieZGG6BS
         gPqWJCf6GOQLzmpTY8Xw0dOcBm9/VUajcOkEOfczIs5Km1/oqLkG4AOJHKMTdgbGqajI
         +C0Nnb5o2F8QrEBsE5T9YiHEdkJAI4/RFSQm2SvjcBm0flaovAz95txku9GGEysvujJ1
         inWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=1+7Nu/Y7sXQ3mP3Tv8QxDfh1hu9G2HGXSSJGtnsDk2w=;
        b=ox40I0R+C9mDSHAJBrqkCcWbtMH37SRiRbYAD0KUGGPlputV3uf1jH8uqshF6pcgEV
         0LrH7/OAVPd8ts/hSzyNUOa3sR791McYzUI6QROyc1gTVIYm5iaWMe96CzG3v/1KGiRM
         mHZ/HHxi8BnQKpNT12pzaXLnoDFop6ZGv79sqqxX9x5Idnsh6/gk6zcw6uffqjeGEZnb
         PqzNn7vjF/sPOiI4tEzZLcC+rv8QS1BkKsrWc54r507kqKmpZzcO4eUXPoE4L+Euvmkg
         VpnwjGJdCf3ARHB+iZ5smBYnneBlDhGhBMfId4iSBD5hli2oxfnbqdcLNFKi7GOizFvJ
         fkKg==
X-Gm-Message-State: AOAM533XPKV0hn/KPiRjXYdNlDAl6NHf2Dabi8JxlzbVBMhmCBt+IdlT
        MIsV4YpoAOmluIlXc1O8HY59TADCDI4=
X-Google-Smtp-Source: ABdhPJwcUjCEQLTXIh4/QCY2AaRLgstRpcgFnb4AXGW6uKQ8dNad3XaNsiu4mzI+1LQaJHKxifipaA==
X-Received: by 2002:aca:eb02:: with SMTP id j2mr16139607oih.3.1636992522274;
        Mon, 15 Nov 2021 08:08:42 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id w2sm2560442ooa.26.2021.11.15.08.08.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Nov 2021 08:08:41 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] hwmon: (adm1021) Improve detection of LM84, MAX1617, and MAX1617A
Date:   Mon, 15 Nov 2021 08:08:38 -0800
Message-Id: <20211115160838.3556365-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The adm1021 driver is quite generous with its automatic chip detection
and easily misdetects several chips. Strengthen detection of MAX1617,
MAX1617A, and LM84 to make the driver less vulnerable to false matches.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/adm1021.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/adm1021.c b/drivers/hwmon/adm1021.c
index 38b447c6e8cd..91ecfee243bf 100644
--- a/drivers/hwmon/adm1021.c
+++ b/drivers/hwmon/adm1021.c
@@ -324,7 +324,7 @@ static int adm1021_detect(struct i2c_client *client,
 {
 	struct i2c_adapter *adapter = client->adapter;
 	const char *type_name;
-	int conv_rate, status, config, man_id, dev_id;
+	int reg, conv_rate, status, config, man_id, dev_id;
 
 	if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_BYTE_DATA)) {
 		pr_debug("detect failed, smbus byte data not supported!\n");
@@ -349,9 +349,19 @@ static int adm1021_detect(struct i2c_client *client,
 	if (man_id < 0 || dev_id < 0)
 		return -ENODEV;
 
-	if (man_id == 0x4d && dev_id == 0x01)
+	if (man_id == 0x4d && dev_id == 0x01) {
+		/*
+		 * dev_id 0x01 matches MAX6680, MAX6695, MAX6696, and possibly
+		 * others. Read register which is unsupported on MAX1617 but
+		 * exists on all those chips and compare with the dev_id
+		 * register. If it matches, it may be a MAX1617A.
+		 */
+		reg = i2c_smbus_read_byte_data(client,
+					       ADM1023_REG_REM_TEMP_PREC);
+		if (reg != dev_id)
+			return -ENODEV;
 		type_name = "max1617a";
-	else if (man_id == 0x41) {
+	} else if (man_id == 0x41) {
 		if ((dev_id & 0xF0) == 0x30)
 			type_name = "adm1023";
 		else if ((dev_id & 0xF0) == 0x00)
@@ -395,13 +405,18 @@ static int adm1021_detect(struct i2c_client *client,
 
 		/*
 		 * LM84 Mfr ID is in a different place,
-		 * and it has more unused bits.
+		 * and it has more unused bits. Registers at 0xfe and 0xff
+		 * are undefined and return the most recently read value,
+		 * here the value of the configuration register.
 		 */
 		if (conv_rate == 0x00
+		    && man_id == config && dev_id == config
 		    && (config & 0x7F) == 0x00
 		    && (status & 0xAB) == 0x00) {
 			type_name = "lm84";
 		} else {
+			if ((config & 0x3f) || (status & 0x03))
+				return -ENODEV;
 			/* fail if low limits are larger than high limits */
 			if ((s8)llo > lhi || (s8)rlo > rhi)
 				return -ENODEV;
-- 
2.33.0

