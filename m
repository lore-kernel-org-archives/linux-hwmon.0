Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FFE6EB64DC
	for <linux-hwmon@archiver.kernel.org>; Fri, 14 Jul 2023 13:51:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235883AbjGNNvs (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 14 Jul 2023 09:51:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235866AbjGNNvo (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 14 Jul 2023 09:51:44 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B97735A0
        for <linux-hwmon@vger.kernel.org>; Fri, 14 Jul 2023 06:51:35 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-992ca792065so258856666b.2
        for <linux-hwmon@vger.kernel.org>; Fri, 14 Jul 2023 06:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1689342693; x=1691934693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hHsTvrtvB0wpJ5anwtL0i/1V0CIzWke0nwnI3nLvsbc=;
        b=OarhMORPdTqodyKTz+n9Bmwx/YU5UO+bixsCXkwLRx6/X09260oSz5vM5r5kYUHojj
         gnlZCodUReICh2FtUvCnlzIY/MkT2401wyrAUOMuJ55pEdzrXpdMH2j9mo4K+GqTyhC8
         4K6mtRQGgavu0L7YxK+Ik19TquIi3MBSDzvitj9oaOzZZznoptRIdWveZVC+CiCEfNtO
         gVQESzTlv7ULoa0X4g14KHW4cjsWQYRJ7nN4JwOEOhO/CWMj7zEWBptvnEADtiCzZmgs
         zV553i8BvzjZ0lgUfr7Rn+VYBUajr8H24zjlyCYscAYtX5A4YbGMvO4jCXXE51Wk4Tsl
         3rYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689342693; x=1691934693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hHsTvrtvB0wpJ5anwtL0i/1V0CIzWke0nwnI3nLvsbc=;
        b=ZwvWLAvaBAUQOi5gUXfYOXaHxswID3xdCF1FFV9upM8OIlCkgaVwy903KXCO+s56MO
         0XdziO1Phg8gBaQORm9XNF+uLvKgi0mZe19a3gb9DT4BpjsTX+aBWyrXNpnoix0/xUTu
         68jiM9K5aEosXynBC/wDmaT+i/ynIeJrd/LXiJS7U9wPeq2eyT6EU4DUC6JeHSLZN3zG
         AtFjskFsvqDupTGwEmDNybNhWAQy9zTngu9BDtyJ7jB7vX1wLVbmNBFCIbowdOr3wKAv
         uMnwIvoxu1doOrgNnYdyoFUKX5vEmUfUpzl9JSk1fm53vu1GZzz3ONHYkOmHZWwcxIj4
         4Mvg==
X-Gm-Message-State: ABy/qLZ2S417TuDYo+jgBc/PGjFEfXK8T+JJjoUSs4wjw5gaj+ZWfvgk
        0hhLNBGxBHRn2hf2A4AOBHJoog==
X-Google-Smtp-Source: APBJJlHo4VBqo5Rpq2M+oWinQDm/nj7cC3EwMWbeei+MEmrFDvKeXdOuWQhrZjRgpYvdLonJal6ETA==
X-Received: by 2002:a17:906:748c:b0:993:ed3c:dee2 with SMTP id e12-20020a170906748c00b00993ed3cdee2mr4417056ejl.5.1689342693513;
        Fri, 14 Jul 2023 06:51:33 -0700 (PDT)
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id h21-20020a170906261500b0099236e3f270sm5405991ejc.58.2023.07.14.06.51.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jul 2023 06:51:33 -0700 (PDT)
From:   Naresh Solanki <naresh.solanki@9elements.com>
X-Google-Original-From: Naresh Solanki <Naresh.Solanki@9elements.com>
To:     devicetree@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        Naresh Solanki <Naresh.Solanki@9elements.com>
Subject: [PATCH v2 4/8] hwmon: (pmbus/mp2975) Simplify VOUT code
Date:   Fri, 14 Jul 2023 15:51:12 +0200
Message-ID: <20230714135124.2645339-4-Naresh.Solanki@9elements.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230714135124.2645339-1-Naresh.Solanki@9elements.com>
References: <20230714135124.2645339-1-Naresh.Solanki@9elements.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Patrick Rudolph <patrick.rudolph@9elements.com>

In order to upstream MP2973/MP2971 simplify the code by removing support
for various VOUT formats. The MP2973 and MP2971 supports all PMBUS
supported formats for VOUT, while the MP2975 only support DIRECT and
VID for VOUT.

In DIRECT mode all chips report the voltage in 1mV/LSB.

Configure the chip to use DIRECT format for VOUT and drop the code
conversion code for other formats. The to be added chips MP2973/MP2971
will be configured to also report VOUT in DIRECT format.

The maximum voltage that can be reported in DIRECT format is 32768mV.
This is sufficient as the maximum output voltage for VR12/VR13 is
3040 mV.

Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
Signed-off-by: Naresh Solanki <Naresh.Solanki@9elements.com>
---
Changes in V2:
- Do i2c write back only if needed.
- Update comment to align with change.
---
 drivers/hwmon/pmbus/mp2975.c | 60 ++++++------------------------------
 1 file changed, 10 insertions(+), 50 deletions(-)

diff --git a/drivers/hwmon/pmbus/mp2975.c b/drivers/hwmon/pmbus/mp2975.c
index 04778f2dcbdb..0dca4c24fe5a 100644
--- a/drivers/hwmon/pmbus/mp2975.c
+++ b/drivers/hwmon/pmbus/mp2975.c
@@ -70,7 +70,6 @@ struct mp2975_data {
 	int vref_off[MP2975_PAGE_NUM];
 	int vout_max[MP2975_PAGE_NUM];
 	int vout_ov_fixed[MP2975_PAGE_NUM];
-	int vout_format[MP2975_PAGE_NUM];
 	int curr_sense_gain[MP2975_PAGE_NUM];
 };
 
@@ -83,22 +82,6 @@ MODULE_DEVICE_TABLE(i2c, mp2975_id);
 
 #define to_mp2975_data(x)  container_of(x, struct mp2975_data, info)
 
-static int mp2975_read_byte_data(struct i2c_client *client, int page, int reg)
-{
-	switch (reg) {
-	case PMBUS_VOUT_MODE:
-		/*
-		 * Enforce VOUT direct format, since device allows to set the
-		 * different formats for the different rails. Conversion from
-		 * VID to direct provided by driver internally, in case it is
-		 * necessary.
-		 */
-		return PB_VOUT_MODE_DIRECT;
-	default:
-		return -ENODATA;
-	}
-}
-
 static int
 mp2975_read_word_helper(struct i2c_client *client, int page, int phase, u8 reg,
 			u16 mask)
@@ -273,24 +256,6 @@ static int mp2975_read_word_data(struct i2c_client *client, int page,
 		ret = DIV_ROUND_CLOSEST(data->vref[page] * 10 - 50 *
 					(ret + 1) * data->vout_scale, 10);
 		break;
-	case PMBUS_READ_VOUT:
-		ret = mp2975_read_word_helper(client, page, phase, reg,
-					      GENMASK(11, 0));
-		if (ret < 0)
-			return ret;
-
-		/*
-		 * READ_VOUT can be provided in VID or direct format. The
-		 * format type is specified by bit 15 of the register
-		 * MP2975_MFR_DC_LOOP_CTRL. The driver enforces VOUT direct
-		 * format, since device allows to set the different formats for
-		 * the different rails and also all VOUT limits registers are
-		 * provided in a direct format. In case format is VID - convert
-		 * to direct.
-		 */
-		if (data->vout_format[page] == vid)
-			ret = mp2975_vid2direct(info->vrm_version[page], ret);
-		break;
 	case PMBUS_VIRT_READ_POUT_MAX:
 		ret = mp2975_read_word_helper(client, page, phase,
 					      MP2975_MFR_READ_POUT_PK,
@@ -578,20 +543,20 @@ mp2975_vout_max_get(struct i2c_client *client, struct mp2975_data *data,
 }
 
 static int
-mp2975_identify_vout_format(struct i2c_client *client,
-			    struct mp2975_data *data, int page)
+mp2975_set_vout_format(struct i2c_client *client,
+		       struct mp2975_data *data, int page)
 {
 	int ret;
 
 	ret = i2c_smbus_read_word_data(client, MP2975_MFR_DC_LOOP_CTRL);
 	if (ret < 0)
 		return ret;
-
-	if (ret & MP2975_VOUT_FORMAT)
-		data->vout_format[page] = vid;
-	else
-		data->vout_format[page] = direct;
-	return 0;
+	/* Enable DIRECT VOUT format 1mV/LSB */
+	if (ret & MP2975_VOUT_FORMAT) {
+		ret &= ~MP2975_VOUT_FORMAT;
+		ret = i2c_smbus_write_word_data(client, MP2975_MFR_DC_LOOP_CTRL, ret);
+	}
+	return ret;
 }
 
 static int
@@ -649,12 +614,8 @@ mp2975_vout_per_rail_config_get(struct i2c_client *client,
 		if (ret < 0)
 			return ret;
 
-		/*
-		 * Get VOUT format for READ_VOUT command : VID or direct.
-		 * Pages on same device can be configured with different
-		 * formats.
-		 */
-		ret = mp2975_identify_vout_format(client, data, i);
+		/* Set VOUT format for READ_VOUT command : direct. */
+		ret = mp2975_set_vout_format(client, data, i);
 		if (ret < 0)
 			return ret;
 
@@ -689,7 +650,6 @@ static struct pmbus_driver_info mp2975_info = {
 		PMBUS_HAVE_IIN | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
 		PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP | PMBUS_HAVE_POUT |
 		PMBUS_HAVE_PIN | PMBUS_HAVE_STATUS_INPUT | PMBUS_PHASE_VIRTUAL,
-	.read_byte_data = mp2975_read_byte_data,
 	.read_word_data = mp2975_read_word_data,
 };
 
-- 
2.41.0

