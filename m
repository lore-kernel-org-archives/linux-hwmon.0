Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C1F4C433F5
	for <linux-hwmon@archiver.kernel.org>; Sat, 16 Oct 2021 00:43:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3F5BA61073
	for <linux-hwmon@archiver.kernel.org>; Sat, 16 Oct 2021 00:43:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236407AbhJPApJ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 15 Oct 2021 20:45:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234607AbhJPApI (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 15 Oct 2021 20:45:08 -0400
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF571C061570
        for <linux-hwmon@vger.kernel.org>; Fri, 15 Oct 2021 17:43:01 -0700 (PDT)
Received: by mail-ot1-x336.google.com with SMTP id s18-20020a0568301e1200b0054e77a16651so71382otr.7
        for <linux-hwmon@vger.kernel.org>; Fri, 15 Oct 2021 17:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rHNES6fWbJBY5nH4FaJB2oa82NtPKQuXsNvPvX+QKOc=;
        b=akkiq/VKfzRP7f+mabVxjN8M0nH9XSOY4IBs8VD9GpjYCUAQbRdW0qdAJsSra5EvoW
         zO4MwNVmOletlv5QYhWMC1pedhRVQONf3TxPq49PyTdlF6rjAYiyB1x8L3g+nFuAnZWX
         cA6Y+Km6kqGgnqS6CBt3SAle4erFAV3OZM92qzXsLENLR72oOWYiitrU0Ggh815BtlBs
         y8NBpempmrOcRCdrdfWFzVARMW3vkgwdpcKUR2mqlcDfTPdhKP2HjJUnDrlaC2+J6h/H
         o6+BTFyCNOOlBMJpY00DwONerORxP9WdP71DLvK1Smr+V6CFIYeRzFKS1U0kFIX+8Do1
         2iww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=rHNES6fWbJBY5nH4FaJB2oa82NtPKQuXsNvPvX+QKOc=;
        b=opJsFrph3NQT126+0n0RhlxWJ/hkwyWplM2yjkA26NJSn2tFpxNuwO8n26vUvPrflz
         PoIuYl9IgRX0laCHEiS8Mu60FYYeAdTVytG1uIjFS1GdA4f2RWA0GJHDqjxcGaFal8py
         zsgb3wGGRvxcWlaQyLEhX1AYR2yPkjTVx69bdNKuyJi2yI/38U8ShjbOkvb5kMCbVZDm
         ORCTyVGsK+5IuWVakAQUBFDIY/lirE1y1uB4NDiK9QV48p6TNzYI5RZ+VZdX4s/s+gxi
         MPp+HA2TxbOmFgLpHVPbPA15I/obodFAlvXLP9W3BATEUEb7WlGp/nBr3rtVDBYoAoaY
         N6Mw==
X-Gm-Message-State: AOAM532cvQapBhsb+6tEWC7EudTxd2UbUI3NrcENmAHnLrkOwJG95lS4
        IpoA2xclcs/8V04KPT6d2S3WjbJ/MIE=
X-Google-Smtp-Source: ABdhPJzmx3t72tDyRO5BVLDiZ38YggJY6e/CZvgqF4miCl3Z9WUTv5gUjJmZF6VEMl9Jwl2ratc0mQ==
X-Received: by 2002:a9d:bab:: with SMTP id 40mr10647167oth.274.1634344980983;
        Fri, 15 Oct 2021 17:43:00 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id l1sm29041oic.30.2021.10.15.17.42.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 17:43:00 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        "David T . Wilson" <david.wilson@nasa.gov>
Subject: [RFT PATCH] hwmon: (tmp401) Fix temperature register accesses for TMP461
Date:   Fri, 15 Oct 2021 17:42:57 -0700
Message-Id: <20211016004257.1494094-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

TMP461 does not support 16-bit registers. Use two 8-bit accesses to read
and write temperature values and limits for this chip.

Fixes: 24333ac26d01 ("hwmon: (tmp401) use smb word operations instead of 2 smb byte operations")
Reported-by: David T. Wilson <david.wilson@nasa.gov>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/tmp401.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/hwmon/tmp401.c b/drivers/hwmon/tmp401.c
index 9dc210b55e69..78d50a9d26d7 100644
--- a/drivers/hwmon/tmp401.c
+++ b/drivers/hwmon/tmp401.c
@@ -69,6 +69,14 @@ static const u8 TMP401_TEMP_MSB_WRITE[7][2] = {
 	{ 0, 0x11 },	/* offset */
 };
 
+static const u8 TMP461_TEMP_LSB[5][2] = {
+	{ 0x15, 0x10 },	/* temp */
+	{ 0, 0x14 },	/* low limit (local n/a) */
+	{ 0, 0x13 },	/* high limit (local n/a) */
+	{ 0, 0 },	/* therm (crit) limit (n/a) */
+	{ 0, 0x12 },    /* offset (local n/a) */
+};
+
 static const u8 TMP432_TEMP_MSB_READ[4][3] = {
 	{ 0x00, 0x01, 0x23 },	/* temp */
 	{ 0x06, 0x08, 0x16 },	/* low limit */
@@ -190,6 +198,19 @@ static int tmp401_update_device_reg16(struct i2c_client *client,
 						TMP401_TEMP_MSB_READ[j][i];
 			if (j == 3) { /* crit is msb only */
 				val = i2c_smbus_read_byte_data(client, regaddr);
+			} else if (data->kind == tmp461) {
+				/* TMP461 does not support 16-bit registers */
+				val = i2c_smbus_read_byte_data(client, regaddr);
+				if (val < 0)
+					return val;
+				data->temp[j][i] = val << 8;
+				regaddr = TMP461_TEMP_LSB[j][i];
+				if (regaddr) {
+					val = i2c_smbus_read_byte_data(client, regaddr);
+					if (val < 0)
+						return val;
+					data->temp[j][i] |= val;
+				}
 			} else {
 				val = i2c_smbus_read_word_swapped(client,
 								  regaddr);
@@ -343,6 +364,12 @@ static ssize_t temp_store(struct device *dev,
 				       : TMP401_TEMP_MSB_WRITE[nr][index];
 	if (nr == 3) { /* crit is msb only */
 		i2c_smbus_write_byte_data(client, regaddr, reg >> 8);
+	} else if (data->kind == tmp461) {
+		/* TMP461 does not support 16-bit registers */
+		i2c_smbus_write_byte_data(client, regaddr, reg >> 8);
+		regaddr = TMP461_TEMP_LSB[nr][index];
+		if (regaddr)
+			i2c_smbus_write_byte_data(client, regaddr, reg & 0xFF);
 	} else {
 		/* Hardware expects big endian data --> use _swapped */
 		i2c_smbus_write_word_swapped(client, regaddr, reg);
-- 
2.33.0

