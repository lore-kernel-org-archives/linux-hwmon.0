Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A463C001B0
	for <linux-hwmon@archiver.kernel.org>; Wed, 14 Jun 2023 16:36:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235144AbjFNQg3 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 14 Jun 2023 12:36:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234807AbjFNQgO (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 14 Jun 2023 12:36:14 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 068D5211F
        for <linux-hwmon@vger.kernel.org>; Wed, 14 Jun 2023 09:36:12 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1b3be39e666so30193555ad.0
        for <linux-hwmon@vger.kernel.org>; Wed, 14 Jun 2023 09:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686760572; x=1689352572;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j7upm71Mfdwx6Tf4aDWDzB7ClLiD/VZcy8GFLsE3Xpw=;
        b=GhqzUDk+dGghsNxq5TiCUIVQO15PbkGYNmA5zvJAnuJl+nemK02cV7cilQe0BP72Yp
         7PltHl2NSEutVK7Hl18VqXkWF5HWfy6C2fV7Z1OBVt45O3S4WfstRhPsrw72TNB2UlgA
         qWY6ofGj02t+WnFGHV5YkaAarg/6cdwPjEy75rwgL8MolMPqtyH3wdZinO5BBKQyijkw
         Hfc08UYB0EuWbb1lEs4AYczVlt17Ak9ioi0CJwbaj1NNU1eEg1PCbbUNc5UJ91Z6Qzxb
         7UZguTMM1eWRTOtVne5qnGWy3Oz+Rl1nzrVKo66G7Vaaee0sidX5qUa0ZFnWy0HREh2f
         ramQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686760572; x=1689352572;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=j7upm71Mfdwx6Tf4aDWDzB7ClLiD/VZcy8GFLsE3Xpw=;
        b=gzmuYvyhDd/prvkgKyMv36LUX+fEUUIqACeePodxiu+MupPYRdiA2eweVeEd7q4jkl
         Zbm1mhcnJLMayo3sSAp0Ri7uwwAS9xN6A09a6MBjIrmPtalRe4QPd4IbMp1+LIuuJjxX
         qUVGAXWjepy3z+HHiW3nGEU5DxActH7CWFGbVFq+qtl+UVmvPKOIhVsOtexwUEe7HE1P
         KJ4Fx5azBmcKsUDZfPKGoSyIQXHiHpMQ1Sv94lxInXf+R5tpfmpqrUaah/bllkhK6DSB
         sjuXaz6AnJGnz8TKoRwnLdH7sRx/PjXsqiYzQ0gZbi2xnIEL83fnYbAPgC9sbaTsmuhr
         ul9g==
X-Gm-Message-State: AC+VfDwnHFdLHr47rJjCKvf4e5Fq4q/0yw0lHC8hJh8UFZHDFluTnf2F
        nlWKPeAKtfAVgx+eAHU2BJFP2mXaJOs=
X-Google-Smtp-Source: ACHHUZ6V0HO7uOkAH+jta77uRxoNqe8xaI5wHd6RFBEHg6aZeov5m/QDeSZQIbMk/xHb80w9p22uwg==
X-Received: by 2002:a17:902:ec85:b0:1b0:f31:a386 with SMTP id x5-20020a170902ec8500b001b00f31a386mr3272443plg.26.1686760571979;
        Wed, 14 Jun 2023 09:36:11 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q16-20020a170902dad000b001ae2b94701fsm12358148plx.21.2023.06.14.09.36.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 09:36:11 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
To:     linux-hwmon@vger.kernel.org
Cc:     Arthur Korn <akorn@google.com>, Guenter Roeck <linux@roeck-us.net>
Subject: [RFT PATCH 2/2] hwmon: (pmbus/adm1275) Disable ADC while updating PMON_CONFIG
Date:   Wed, 14 Jun 2023 09:36:05 -0700
Message-Id: <20230614163605.3688964-3-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230614163605.3688964-1-linux@roeck-us.net>
References: <20230614163605.3688964-1-linux@roeck-us.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

According to ADI, changing PMON_CONFIG while the ADC is running can have
unexpected results. ADI recommends halting the ADC with PMON_CONTROL
before setting PMON_CONFIG and then resume after. Follow ADI
recommendation and disable ADC while PMON_CONFIG is updated.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/pmbus/adm1275.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/adm1275.c b/drivers/hwmon/pmbus/adm1275.c
index eaa691b98c14..501646cbef10 100644
--- a/drivers/hwmon/pmbus/adm1275.c
+++ b/drivers/hwmon/pmbus/adm1275.c
@@ -27,8 +27,11 @@ enum chips { adm1075, adm1272, adm1275, adm1276, adm1278, adm1293, adm1294 };
 #define ADM1275_PEAK_IOUT		0xd0
 #define ADM1275_PEAK_VIN		0xd1
 #define ADM1275_PEAK_VOUT		0xd2
+#define ADM1275_PMON_CONTROL		0xd3
 #define ADM1275_PMON_CONFIG		0xd4
 
+#define ADM1275_CONVERT_EN		BIT(0)
+
 #define ADM1275_VIN_VOUT_SELECT		BIT(6)
 #define ADM1275_VRANGE			BIT(5)
 #define ADM1075_IRANGE_50		BIT(4)
@@ -202,7 +205,11 @@ static int adm1275_read_samples(const struct adm1275_data *data,
 static int adm1275_write_pmon_config(const struct adm1275_data *data,
 				     struct i2c_client *client, u16 word)
 {
-	int ret;
+	int ret, ret2;
+
+	ret = i2c_smbus_write_byte_data(client, ADM1275_PMON_CONTROL, 0);
+	if (ret)
+		return ret;
 
 	if (data->have_power_sampling)
 		ret = i2c_smbus_write_word_data(client, ADM1275_PMON_CONFIG,
@@ -211,6 +218,15 @@ static int adm1275_write_pmon_config(const struct adm1275_data *data,
 		ret = i2c_smbus_write_byte_data(client, ADM1275_PMON_CONFIG,
 						word);
 
+	/*
+	 * We still want to re-enable conversions if writing into
+	 * ADM1275_PMON_CONFIG failed.
+	 */
+	ret2 = i2c_smbus_write_byte_data(client, ADM1275_PMON_CONTROL,
+					 ADM1275_CONVERT_EN);
+	if (!ret)
+		ret = ret2;
+
 	return ret;
 }
 
-- 
2.39.2

