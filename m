Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B12DC433B4
	for <linux-hwmon@archiver.kernel.org>; Thu,  1 Apr 2021 21:45:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D109F610CE
	for <linux-hwmon@archiver.kernel.org>; Thu,  1 Apr 2021 21:45:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235635AbhDAVp5 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 1 Apr 2021 17:45:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234724AbhDAVp4 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 1 Apr 2021 17:45:56 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F8E6C0613E6;
        Thu,  1 Apr 2021 14:45:56 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id w28so4928698lfn.2;
        Thu, 01 Apr 2021 14:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=P5Ia//itWDC9V/vcJ3c9AEqi1Bj3R5y64czNxp6zEcw=;
        b=C8BLmv9EQ3prOkB4r0BJRFvU/UkWUr0hdGvFgYdlAQv7xK0D/uqGYnfxMNfATpsjSw
         ztJdX08okda7kYW/quR0tG6m+sD7WW07zQKeDdplFEi1f5idts6g0FcEqsYfjBV4G5xt
         GyP6yOieuqst7K0lcsJ8UZ66DV/SwA2Q07rjk7+U/QNGQw7bmN/RzqI81vh59rr4/Ar5
         wgZf0xLs34hOiBuHlrrMEOxgIMqqoaoIBCD2/tuL19+/BLgQzT0Wjsn1id+zu/uBmLZ2
         tzbJ+xlsfHP1B44sCiZEZe7DRMsCLPulEr/yE68t3J+8hCmmAhZ9uyjZFx/gYI+eqKnr
         Dfzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=P5Ia//itWDC9V/vcJ3c9AEqi1Bj3R5y64czNxp6zEcw=;
        b=obBd2pTHUyLt3PtNbNoRHglQsGHp2shs58OlmQLi3ZYErNd3q3Q6HvmvTxC7rtPC3t
         sMD4Lsa9R3jH18Q5ro+cvVkDhqxYdpN+CFCjEfV5XGPBEeZarhMrBVCjKj6yDVDHB+uS
         GbDpl3YlHyGB+oQykDv2Tz/coTANtW8JRhxseohRxUNHq4Lr8RctAmB9yLJA8dD3N8mt
         HfmQYJ3F0SYJHHqaraBuffyT9Y+0xjqxaeYSizSGo8+h+mnsX6mc0LSeiLSf+zGSehSx
         hogHU3URj0UkJrzytbyt74nfGj5Sd7h83o7DeoAl0vLZk6cxENrVbWTprhCvFJTN4Odf
         fqEA==
X-Gm-Message-State: AOAM531RI0v2VWYEpEB3ACe+k3gqzLR4dPnE2As+2zVq7SSEbuIXu033
        qNuwIyGzQ5DCGgqwxQRrbqI=
X-Google-Smtp-Source: ABdhPJzWsvw5Ygx/cSlqZqDz6LTyQo25ET8arYh335Qd7wFLbqYt1X9un11PTzTq8MgMtVUaOdE8mg==
X-Received: by 2002:ac2:43d4:: with SMTP id u20mr6535270lfl.210.1617313554959;
        Thu, 01 Apr 2021 14:45:54 -0700 (PDT)
Received: from DESKTOP-GSFPEC9.localdomain (broadband-46-242-10-29.ip.moscow.rt.ru. [46.242.10.29])
        by smtp.gmail.com with ESMTPSA id a18sm704508ljj.106.2021.04.01.14.45.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 14:45:54 -0700 (PDT)
From:   Konstantin Aladyshev <aladyshev22@gmail.com>
Cc:     kunyi@google.com, aladyshev22@gmail.com,
        Konstantin Aladyshev <aladyshev@nicevt.ru>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: (sbtsi) Don't read sensor more than once if it doesn't respond
Date:   Fri,  2 Apr 2021 00:45:42 +0300
Message-Id: <20210401214543.4073-1-aladyshev22@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Konstantin Aladyshev <aladyshev@nicevt.ru>

SBTSI sensors don't work when the CPU is off.
In this case every 'i2c_smbus_read_byte_data' function would fail
by a timeout.
Currently temp1_max/temp1_min file reads can cause two such timeouts
for every read.
Restructure code so there will be no more than one timeout for every
read opeartion.

Signed-off-by: Konstantin Aladyshev <aladyshev@nicevt.ru>
---
 drivers/hwmon/sbtsi_temp.c | 59 +++++++++++++++++++-------------------
 1 file changed, 29 insertions(+), 30 deletions(-)

diff --git a/drivers/hwmon/sbtsi_temp.c b/drivers/hwmon/sbtsi_temp.c
index e35357c48b8e..e09a8cf6de45 100644
--- a/drivers/hwmon/sbtsi_temp.c
+++ b/drivers/hwmon/sbtsi_temp.c
@@ -74,53 +74,52 @@ static int sbtsi_read(struct device *dev, enum hwmon_sensor_types type,
 		      u32 attr, int channel, long *val)
 {
 	struct sbtsi_data *data = dev_get_drvdata(dev);
+	u8 temp_int_reg, temp_dec_reg;
 	s32 temp_int, temp_dec;
 	int err;
 
 	switch (attr) {
 	case hwmon_temp_input:
-		/*
-		 * ReadOrder bit specifies the reading order of integer and
-		 * decimal part of CPU temp for atomic reads. If bit == 0,
-		 * reading integer part triggers latching of the decimal part,
-		 * so integer part should be read first. If bit == 1, read
-		 * order should be reversed.
-		 */
-		err = i2c_smbus_read_byte_data(data->client, SBTSI_REG_CONFIG);
-		if (err < 0)
-			return err;
-
-		mutex_lock(&data->lock);
-		if (err & BIT(SBTSI_CONFIG_READ_ORDER_SHIFT)) {
-			temp_dec = i2c_smbus_read_byte_data(data->client, SBTSI_REG_TEMP_DEC);
-			temp_int = i2c_smbus_read_byte_data(data->client, SBTSI_REG_TEMP_INT);
-		} else {
-			temp_int = i2c_smbus_read_byte_data(data->client, SBTSI_REG_TEMP_INT);
-			temp_dec = i2c_smbus_read_byte_data(data->client, SBTSI_REG_TEMP_DEC);
-		}
-		mutex_unlock(&data->lock);
+		temp_int_reg = SBTSI_REG_TEMP_INT;
+		temp_dec_reg = SBTSI_REG_TEMP_DEC;
 		break;
 	case hwmon_temp_max:
-		mutex_lock(&data->lock);
-		temp_int = i2c_smbus_read_byte_data(data->client, SBTSI_REG_TEMP_HIGH_INT);
-		temp_dec = i2c_smbus_read_byte_data(data->client, SBTSI_REG_TEMP_HIGH_DEC);
-		mutex_unlock(&data->lock);
+		temp_int_reg = SBTSI_REG_TEMP_HIGH_INT;
+		temp_dec_reg = SBTSI_REG_TEMP_HIGH_DEC;
 		break;
 	case hwmon_temp_min:
-		mutex_lock(&data->lock);
-		temp_int = i2c_smbus_read_byte_data(data->client, SBTSI_REG_TEMP_LOW_INT);
-		temp_dec = i2c_smbus_read_byte_data(data->client, SBTSI_REG_TEMP_LOW_DEC);
-		mutex_unlock(&data->lock);
+		temp_int_reg = SBTSI_REG_TEMP_LOW_INT;
+		temp_dec_reg = SBTSI_REG_TEMP_LOW_DEC;
 		break;
 	default:
 		return -EINVAL;
 	}
 
+	/*
+	 * ReadOrder bit specifies the reading order of integer and
+	 * decimal part of CPU temp for atomic reads. If bit == 0,
+	 * reading integer part triggers latching of the decimal part,
+	 * so integer part should be read first. If bit == 1, read
+	 * order should be reversed.
+	 */
+	err = i2c_smbus_read_byte_data(data->client, SBTSI_REG_CONFIG);
+	if (err < 0)
+		return err;
+
+	mutex_lock(&data->lock);
+	if (err & BIT(SBTSI_CONFIG_READ_ORDER_SHIFT)) {
+		temp_dec = i2c_smbus_read_byte_data(data->client, temp_dec_reg);
+		temp_int = i2c_smbus_read_byte_data(data->client, temp_int_reg);
+	} else {
+		temp_int = i2c_smbus_read_byte_data(data->client, temp_int_reg);
+		temp_dec = i2c_smbus_read_byte_data(data->client, temp_dec_reg);
+	}
+	mutex_unlock(&data->lock);
 
-	if (temp_int < 0)
-		return temp_int;
 	if (temp_dec < 0)
 		return temp_dec;
+	if (temp_int < 0)
+		return temp_int;
 
 	*val = sbtsi_reg_to_mc(temp_int, temp_dec);
 
-- 
2.17.1

