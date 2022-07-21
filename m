Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94CB3C43334
	for <linux-hwmon@archiver.kernel.org>; Thu, 21 Jul 2022 03:23:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229441AbiGUDXB (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 20 Jul 2022 23:23:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229507AbiGUDXB (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 20 Jul 2022 23:23:01 -0400
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com [IPv6:2607:f8b0:4864:20::f30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49E264A81F
        for <linux-hwmon@vger.kernel.org>; Wed, 20 Jul 2022 20:23:00 -0700 (PDT)
Received: by mail-qv1-xf30.google.com with SMTP id mh14so295246qvb.1
        for <linux-hwmon@vger.kernel.org>; Wed, 20 Jul 2022 20:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ax/v8cme1O4DafV0vwTxEPOIyKReGvDbMUJ9Fhd4M2I=;
        b=Y5S/ol1G+gpyWAId3iUokKm+6cHP9QrEuvLQKfsX6cZfFF+LFlp5/o+KBHjoblhbBo
         9nn6uvl1kMHRH5HqWBraKJRkBOY5ex6RpTFYCWJVSh7fgE7C6jbOshI002B0dvV4ykM9
         caKeUIyq+l+Hne1kkhoJNMT83vUDUQ/ST3xF78RpGFW2V1l8Ifhe0cXwzQ4fM6zc5wgb
         Q+W/s3ItInBUZ6yFpnPt3dPbwsCEYrAhlw7djGLQXZ8943unSq1loHOwqMUF651PIgJY
         b29oG6UAgTiVXF9vnLJyWRZZgcomi364sS7Tv7Knku/41zuYZNzLFoIdpwn/3rX8ImXs
         dCyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ax/v8cme1O4DafV0vwTxEPOIyKReGvDbMUJ9Fhd4M2I=;
        b=eyQ3FoSevXgOB/4eco8fg2HCFD5euj6BiDarP8coDRbcm8cgZO1yY1zNG1CN26f8UB
         xIldkk6ohyfPlX5iQTUuvm95QtyFfYDVfp0P4ye4RUBaSKE75bMfAu4L+taOuMjiEXLM
         60VIMhvGk74Mqn86luAwXqq1d6l3MCPAfEjQCLuXBmVzcM6mbKvPD8T7Dy/Eci4APuI6
         quKkDXpM+dU66OhSsXi0YPergpDom7+vqI7HnDO7sfX2RMzQ5jUUBPYW+3xPeVJYj54N
         dx7liqkGVJRUNKIB82yWwX7ZyYW5ZlkqsXO0NZnFbdQkCwIKKFtjPJDQosTjGN7uLxA0
         N/GA==
X-Gm-Message-State: AJIora8+yiLHNmdlfmSvRT83n+nJG1AaEIYvLKwT+RnF/AkEHe7A5BHn
        ESaU8HVZt/Vl7qzW0N2BQeQ=
X-Google-Smtp-Source: AGRyM1tzy9Eblv9TTpusllfxGkSF3nD/7/YBN5MzRBYVGGIks0YHfnckhBe+sD5KwdizZmWSWzwb0w==
X-Received: by 2002:a0c:9101:0:b0:473:9b:d92a with SMTP id q1-20020a0c9101000000b00473009bd92amr32178105qvq.17.1658373779377;
        Wed, 20 Jul 2022 20:22:59 -0700 (PDT)
Received: from nuclearis3.lan (c-98-197-59-62.hsd1.tx.comcast.net. [98.197.59.62])
        by smtp.gmail.com with ESMTPSA id f8-20020a05620a280800b006a6ce613c7csm715448qkp.89.2022.07.20.20.22.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 20:22:59 -0700 (PDT)
From:   Alexandru Gagniuc <mr.nuke.me@gmail.com>
To:     robert.marko@sartura.hr, linux-hwmon@vger.kernel.org
Cc:     luka.perkov@sartura.hr, jdelvare@suse.com, linux@roeck-us.net,
        Alexandru Gagniuc <mr.nuke.me@gmail.com>
Subject: [PATCH] hwmon: (tps23861) fix byte order in current and voltage registers
Date:   Wed, 20 Jul 2022 22:22:55 -0500
Message-Id: <20220721032255.2850647-1-mr.nuke.me@gmail.com>
X-Mailer: git-send-email 2.34.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Trying to use this driver on a big-endian machine results in garbage
values for voltage and current. The tps23861 registers are little-
endian, and regmap_read_bulk() does not do byte order conversion. Thus
on BE machines, the most significant bytes got modified, and were
trimmed by the VOLTAGE_CURRENT_MASK.

To resolve this use uint16_t values, and convert them to host byte
order using le16_to_cpu(). This results in correct readings on MIPS.

Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
---
 drivers/hwmon/tps23861.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/tps23861.c b/drivers/hwmon/tps23861.c
index 8bd6435c13e8..e07f6b8a1898 100644
--- a/drivers/hwmon/tps23861.c
+++ b/drivers/hwmon/tps23861.c
@@ -140,7 +140,8 @@ static int tps23861_read_temp(struct tps23861_data *data, long *val)
 static int tps23861_read_voltage(struct tps23861_data *data, int channel,
 				 long *val)
 {
-	unsigned int regval;
+	uint16_t regval;
+	long raw_val;
 	int err;
 
 	if (channel < TPS23861_NUM_PORTS) {
@@ -155,7 +156,8 @@ static int tps23861_read_voltage(struct tps23861_data *data, int channel,
 	if (err < 0)
 		return err;
 
-	*val = (FIELD_GET(VOLTAGE_CURRENT_MASK, regval) * VOLTAGE_LSB) / 1000;
+	raw_val = le16_to_cpu(regval);
+	*val = (FIELD_GET(VOLTAGE_CURRENT_MASK, raw_val) * VOLTAGE_LSB) / 1000;
 
 	return 0;
 }
@@ -163,8 +165,9 @@ static int tps23861_read_voltage(struct tps23861_data *data, int channel,
 static int tps23861_read_current(struct tps23861_data *data, int channel,
 				 long *val)
 {
-	unsigned int current_lsb;
-	unsigned int regval;
+	long raw_val, current_lsb;
+	uint16_t regval;
+
 	int err;
 
 	if (data->shunt_resistor == SHUNT_RESISTOR_DEFAULT)
@@ -178,7 +181,8 @@ static int tps23861_read_current(struct tps23861_data *data, int channel,
 	if (err < 0)
 		return err;
 
-	*val = (FIELD_GET(VOLTAGE_CURRENT_MASK, regval) * current_lsb) / 1000000;
+	raw_val = le16_to_cpu(regval);
+	*val = (FIELD_GET(VOLTAGE_CURRENT_MASK, raw_val) * current_lsb) / 1000000;
 
 	return 0;
 }
-- 
2.34.3

