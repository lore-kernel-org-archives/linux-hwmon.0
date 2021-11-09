Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEE6DC433F5
	for <linux-hwmon@archiver.kernel.org>; Tue,  9 Nov 2021 23:48:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A3DE66103C
	for <linux-hwmon@archiver.kernel.org>; Tue,  9 Nov 2021 23:48:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230050AbhKIXvJ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 9 Nov 2021 18:51:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229573AbhKIXvI (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 9 Nov 2021 18:51:08 -0500
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FFA2C061764
        for <linux-hwmon@vger.kernel.org>; Tue,  9 Nov 2021 15:48:22 -0800 (PST)
Received: by mail-oi1-x233.google.com with SMTP id r26so1782992oiw.5
        for <linux-hwmon@vger.kernel.org>; Tue, 09 Nov 2021 15:48:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qPdEQm1r06K53Oy/7P9R+A6XvnVJ5Cch1su8NTt8RMw=;
        b=IaBACXnXDu0tmwX2I51d1uhi3O96UVEfmwexdOGjs5VAt2oAvbX0NkJaGmaotO2lvj
         iSGP3J6VRr/b788Jzd9RPYcOXqp+zjtTfyVzX7rGoRMMw9RAHiqzSjE64MbGOad1ypZ7
         ojhqIW4NZZxmO7eAJdXg/dBF4sc91kobWMSX24iWttnCMX+yyoHJOPRsmEIWrNxb3cDH
         GH7buGqRaX6I3X7oCPAYKTreKnHFgkOjbY78RqJYpDOv43Cv4rchzPuwOweiP5Bk4rPO
         wC26gqcgPf27Fy6yAqPZpBCIPu3UCRmoJBCaKIApfAtZTqDMN+QJCoPwue+jrLl6e6Zk
         TMsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=qPdEQm1r06K53Oy/7P9R+A6XvnVJ5Cch1su8NTt8RMw=;
        b=yVskBixFQRCVUOduvZ8i0lqdbDX5gNdSpfDYJ87/VNa5/gwWfOdrB70zO++2ia/SnZ
         05X3jGjkZDvBu6YuDMkSLrLnNQnkpJssnGVFi2KkxXIaouHhGBT1XN2uLeW7yK/6A0Hd
         JjZFBBRVgQzUavwvGkGARDYoyseDnVaBL2JeAZ4e0fk6k7eegCwXL4kJNYGhscS/tnLG
         kpOKyfGQTZzeC024EfazU/B1tnnQVTiwVsKonSbWj7wQsQ4MHC/MWG5Qpocfn50HD/yG
         ex1ZSsrlOfiOSAh9ISyUuudczGwf3s1ndEmoZfBjAe/z+ptdawxtkZnMjIrFWSaLT2Qu
         mnrQ==
X-Gm-Message-State: AOAM533clFgWop0rQBW923S+WhBNDjYy1g8p5OMY87f7Qlvk2yR0YiKj
        FFUwH0If5BvMkb6ktEoG/twdRI4c3Cc=
X-Google-Smtp-Source: ABdhPJxveWooD36nrwBoMzyJt9fy0AKIIl2dDxDMPVty2wVOqtvUEPHGW40QIBIPq2V0LsVE9OoZ9A==
X-Received: by 2002:a05:6808:1187:: with SMTP id j7mr9406834oil.135.1636501701181;
        Tue, 09 Nov 2021 15:48:21 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id m5sm955690oim.45.2021.11.09.15.48.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Nov 2021 15:48:20 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 1/4] hwmon: (tmp401) Simplify temperature register arrays
Date:   Tue,  9 Nov 2021 15:48:11 -0800
Message-Id: <20211109234814.3724798-2-linux@roeck-us.net>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211109234814.3724798-1-linux@roeck-us.net>
References: <20211109234814.3724798-1-linux@roeck-us.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The difference between TMP431 and other chips of this series is that the
TMP431 has an additional sensor. The register addresses for other sensors
are the same for all chips. It is therefore unnecessary to maintain two
different arrays for TMP431 and the other chips. Just use the same array
for all chips and add the TMP431 register addresses as third column.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/tmp401.c | 39 +++++++++++----------------------------
 1 file changed, 11 insertions(+), 28 deletions(-)

diff --git a/drivers/hwmon/tmp401.c b/drivers/hwmon/tmp401.c
index b31f4964f852..29c857a76c9e 100644
--- a/drivers/hwmon/tmp401.c
+++ b/drivers/hwmon/tmp401.c
@@ -49,36 +49,22 @@ enum chips { tmp401, tmp411, tmp431, tmp432, tmp435 };
 #define TMP401_MANUFACTURER_ID_REG		0xFE
 #define TMP401_DEVICE_ID_REG			0xFF
 
-static const u8 TMP401_TEMP_MSB_READ[7][2] = {
-	{ 0x00, 0x01 },	/* temp */
-	{ 0x06, 0x08 },	/* low limit */
-	{ 0x05, 0x07 },	/* high limit */
-	{ 0x20, 0x19 },	/* therm (crit) limit */
-	{ 0x30, 0x34 },	/* lowest */
-	{ 0x32, 0x36 },	/* highest */
-};
-
-static const u8 TMP401_TEMP_MSB_WRITE[7][2] = {
-	{ 0, 0 },	/* temp (unused) */
-	{ 0x0C, 0x0E },	/* low limit */
-	{ 0x0B, 0x0D },	/* high limit */
-	{ 0x20, 0x19 },	/* therm (crit) limit */
-	{ 0x30, 0x34 },	/* lowest */
-	{ 0x32, 0x36 },	/* highest */
-};
-
-static const u8 TMP432_TEMP_MSB_READ[4][3] = {
+static const u8 TMP401_TEMP_MSB_READ[7][3] = {
 	{ 0x00, 0x01, 0x23 },	/* temp */
 	{ 0x06, 0x08, 0x16 },	/* low limit */
 	{ 0x05, 0x07, 0x15 },	/* high limit */
-	{ 0x20, 0x19, 0x1A },	/* therm (crit) limit */
+	{ 0x20, 0x19, 0x1a },	/* therm (crit) limit */
+	{ 0x30, 0x34, 0x00 },	/* lowest */
+	{ 0x32, 0x36, 0x00 },	/* highest */
 };
 
-static const u8 TMP432_TEMP_MSB_WRITE[4][3] = {
-	{ 0, 0, 0 },		/* temp  - unused */
+static const u8 TMP401_TEMP_MSB_WRITE[7][3] = {
+	{ 0x00, 0x00, 0x00 },	/* temp (unused) */
 	{ 0x0C, 0x0E, 0x16 },	/* low limit */
 	{ 0x0B, 0x0D, 0x15 },	/* high limit */
-	{ 0x20, 0x19, 0x1A },	/* therm (crit) limit */
+	{ 0x20, 0x19, 0x1a },	/* therm (crit) limit */
+	{ 0x30, 0x34, 0x00 },	/* lowest */
+	{ 0x32, 0x36, 0x00 },	/* highest */
 };
 
 /* [0] = fault, [1] = low, [2] = high, [3] = therm/crit */
@@ -182,9 +168,7 @@ static int tmp401_update_device_reg16(struct i2c_client *client,
 		for (j = 0; j < num_regs; j++) {	/* temp / low / ... */
 			u8 regaddr;
 
-			regaddr = data->kind == tmp432 ?
-						TMP432_TEMP_MSB_READ[j][i] :
-						TMP401_TEMP_MSB_READ[j][i];
+			regaddr = TMP401_TEMP_MSB_READ[j][i];
 			if (j == 3) { /* crit is msb only */
 				val = i2c_smbus_read_byte_data(client, regaddr);
 			} else {
@@ -336,8 +320,7 @@ static ssize_t temp_store(struct device *dev,
 
 	mutex_lock(&data->update_lock);
 
-	regaddr = data->kind == tmp432 ? TMP432_TEMP_MSB_WRITE[nr][index]
-				       : TMP401_TEMP_MSB_WRITE[nr][index];
+	regaddr = TMP401_TEMP_MSB_WRITE[nr][index];
 	if (nr == 3) { /* crit is msb only */
 		i2c_smbus_write_byte_data(client, regaddr, reg >> 8);
 	} else {
-- 
2.33.0

