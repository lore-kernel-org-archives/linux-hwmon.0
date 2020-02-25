Return-Path: <SRS0=jMON=4N=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A7B7C4BA01
	for <linux-hwmon@archiver.kernel.org>; Tue, 25 Feb 2020 22:29:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1E18C21927
	for <linux-hwmon@archiver.kernel.org>; Tue, 25 Feb 2020 22:29:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728806AbgBYW3Y (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 25 Feb 2020 17:29:24 -0500
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:39056 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727227AbgBYW3Y (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 25 Feb 2020 17:29:24 -0500
Received: from Internal Mail-Server by MTLPINE1 (envelope-from vadimp@mellanox.com)
        with ESMTPS (AES256-SHA encrypted); 26 Feb 2020 00:29:20 +0200
Received: from r-build-lowlevel.mtr.labs.mlnx. (r-build-lowlevel.mtr.labs.mlnx [10.209.0.190])
        by labmailer.mlnx (8.13.8/8.13.8) with ESMTP id 01PMTKJh011668;
        Wed, 26 Feb 2020 00:29:20 +0200
From:   Vadim Pasternak <vadimp@mellanox.com>
To:     linux@roeck-us.net
Cc:     linux-hwmon@vger.kernel.org, Vadim Pasternak <vadimp@mellanox.com>
Subject: [hwmon-next v3] hwmon: (pmbus/tps53679) Add support for historical registers for TPS53688
Date:   Wed, 26 Feb 2020 00:29:11 +0200
Message-Id: <20200225222911.30274-1-vadimp@mellanox.com>
X-Mailer: git-send-email 2.11.0
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

TPS53688 supports historical registers. Patch allows exposing the next
attributes for the historical registers in 'sysfs':
- curr{x}_reset_history;
- in{x}_reset_history;
- power{x}_reset_history;
- temp{x}_reset_history;
- curr{x}_highest;
- in{x}_highest;
- power{x}_input_highest;
- temp{x}_highest;
- curr{x}_lowest;
- in{x}_lowest;
- power{x}_input_lowest;
- temp{x}_lowest.

This patch is required patch:
"hwmon: (pmbus/core) Add callback for register to data conversion".

Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
v2->v3:
 Fix added by Vadim:
 - Fix offsets for read buffer.
v1->v2:
 Comments pointed out by Guenter:
 - Drop tps53688_reg2data();
 - Replace i2c_smbus_read_i2c_block_data() and
   i2c_smbus_write_i2c_block_data() with i2c_smbus_read_block_data()
   and i2c_smbus_write_block_data();
 - Drop 'unused' parameter in tps53688_get_history();
 - Fix host byte order in tps53688_get_history();
 - Rename tps53688_reset_history_all() to
   tps53688_start_logging_all();
---
 drivers/hwmon/pmbus/tps53679.c | 242 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 241 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/tps53679.c b/drivers/hwmon/pmbus/tps53679.c
index 157c99ffb52b..dc2a32307f2a 100644
--- a/drivers/hwmon/pmbus/tps53679.c
+++ b/drivers/hwmon/pmbus/tps53679.c
@@ -34,6 +34,226 @@ enum chips {
 
 #define TPS53681_MFR_SPECIFIC_20	0xe4	/* Number of phases, per page */
 
+/* Registers for highest and lowest historical values records */
+#define TPS53688_VOUT_PEAK		0xd1
+#define TPS53688_IOUT_PEAK		0xd2
+#define TPS53688_TEMP_PEAK		0xd3
+#define TPS53688_VIN_PEAK		0xd5
+#define TPS53688_IIN_PEAK		0xd6
+#define TPS53688_PIN_PEAK		0xd7
+#define TPS53688_POUT_PEAK		0xd8
+#define TPS53688_HISTORY_REG_MIN_OFFSET	2
+#define TPS53688_HISTORY_REG_MAX_OFFSET	0
+
+const static u8 tps53688_reset_logging[] = { 0x00, 0x01, 0x00, 0x00 };
+const static u8 tps53688_resume_logging[] = { 0x20, 0x00, 0x00, 0x00 };
+
+static int
+tps53688_get_history(struct i2c_client *client, int reg, int page, int offset)
+{
+	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
+	u8 buf[I2C_SMBUS_BLOCK_MAX];
+	s16 exponent;
+	s32 mantissa;
+	long val;
+	int ret;
+
+	ret = pmbus_set_page(client, page, 0);
+	if (ret < 0)
+		return ret;
+
+	ret = i2c_smbus_read_block_data(client, reg, buf);
+	if (ret < 0)
+		return ret;
+
+	ret =  le16_to_cpu(*(u16 *)(buf + offset));
+	if (reg == TPS53688_VOUT_PEAK) {
+		/* Convert register value to LINEAR11 data. */
+		exponent = ((s16)ret) >> 11;
+		mantissa = ((s16)((ret & GENMASK(10, 0)) << 5)) >> 5;
+		val = mantissa * 1000L;
+		if (exponent >= 0)
+			val <<= exponent;
+		else
+			val >>= -exponent;
+
+		/* Convert data to VID register. */
+		switch (info->vrm_version[page]) {
+		case vr13:
+			if (val >= 500)
+				return 1 + DIV_ROUND_CLOSEST(val - 500, 10);
+			return 0;
+		case vr12:
+			if (val >= 250)
+				return 1 + DIV_ROUND_CLOSEST(val - 250, 5);
+			return 0;
+		default:
+			return -EINVAL;
+		}
+	}
+
+	return ret;
+}
+
+static int
+tps53688_reset_history(struct i2c_client *client, int reg)
+{
+	int ret;
+
+	ret = i2c_smbus_write_block_data(client, reg,
+					 ARRAY_SIZE(tps53688_reset_logging),
+					 tps53688_reset_logging);
+	if (ret < 0)
+		return ret;
+
+	ret = i2c_smbus_write_block_data(client, reg,
+					 ARRAY_SIZE(tps53688_resume_logging),
+					 tps53688_resume_logging);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+static int tps53688_start_logging_all(struct i2c_client *client, int page)
+{
+	int ret;
+
+	ret = pmbus_set_page(client, page, 0);
+	if (ret < 0)
+		return ret;
+
+	ret = tps53688_reset_history(client, TPS53688_TEMP_PEAK);
+	ret = !ret ? tps53688_reset_history(client, TPS53688_VIN_PEAK) : ret;
+	ret = !ret ? tps53688_reset_history(client, TPS53688_IIN_PEAK) : ret;
+	ret = !ret ? tps53688_reset_history(client, TPS53688_PIN_PEAK) : ret;
+	ret = !ret ? tps53688_reset_history(client, TPS53688_POUT_PEAK) : ret;
+	ret = !ret ? tps53688_reset_history(client, TPS53688_VOUT_PEAK) : ret;
+	ret = !ret ? tps53688_reset_history(client, TPS53688_IOUT_PEAK) : ret;
+
+	return ret;
+}
+
+static int tps53688_read_word_data(struct i2c_client *client, int page,
+				   int unused, int reg)
+{
+	int histreg, offset;
+
+	switch (reg) {
+	case PMBUS_VIRT_READ_TEMP_MIN:
+		histreg = TPS53688_TEMP_PEAK;
+		offset = TPS53688_HISTORY_REG_MIN_OFFSET;
+		break;
+	case PMBUS_VIRT_READ_TEMP_MAX:
+		histreg = TPS53688_TEMP_PEAK;
+		offset = TPS53688_HISTORY_REG_MAX_OFFSET;
+		break;
+	case PMBUS_VIRT_READ_VIN_MIN:
+		histreg = TPS53688_VIN_PEAK;
+		offset = TPS53688_HISTORY_REG_MIN_OFFSET;
+		break;
+	case PMBUS_VIRT_READ_VIN_MAX:
+		histreg = TPS53688_VIN_PEAK;
+		offset = TPS53688_HISTORY_REG_MAX_OFFSET;
+		break;
+	case PMBUS_VIRT_READ_IIN_MIN:
+		histreg = TPS53688_IIN_PEAK;
+		offset = TPS53688_HISTORY_REG_MIN_OFFSET;
+		break;
+	case PMBUS_VIRT_READ_IIN_MAX:
+		histreg = TPS53688_IIN_PEAK;
+		offset = TPS53688_HISTORY_REG_MAX_OFFSET;
+		break;
+	case PMBUS_VIRT_READ_PIN_MIN:
+		histreg = TPS53688_PIN_PEAK;
+		offset = TPS53688_HISTORY_REG_MIN_OFFSET;
+		break;
+	case PMBUS_VIRT_READ_PIN_MAX:
+		histreg = TPS53688_PIN_PEAK;
+		offset = TPS53688_HISTORY_REG_MAX_OFFSET;
+		break;
+	case PMBUS_VIRT_READ_POUT_MIN:
+		histreg = TPS53688_POUT_PEAK;
+		offset = TPS53688_HISTORY_REG_MIN_OFFSET;
+		break;
+	case PMBUS_VIRT_READ_POUT_MAX:
+		histreg = TPS53688_POUT_PEAK;
+		offset = TPS53688_HISTORY_REG_MAX_OFFSET;
+		break;
+	case PMBUS_VIRT_READ_VOUT_MIN:
+		histreg = TPS53688_VOUT_PEAK;
+		offset = TPS53688_HISTORY_REG_MIN_OFFSET;
+		break;
+	case PMBUS_VIRT_READ_VOUT_MAX:
+		histreg = TPS53688_VOUT_PEAK;
+		offset = TPS53688_HISTORY_REG_MAX_OFFSET;
+		break;
+	case PMBUS_VIRT_READ_IOUT_MIN:
+		histreg = TPS53688_IOUT_PEAK;
+		offset = TPS53688_HISTORY_REG_MIN_OFFSET;
+		break;
+	case PMBUS_VIRT_READ_IOUT_MAX:
+		histreg = TPS53688_IOUT_PEAK;
+		offset = TPS53688_HISTORY_REG_MAX_OFFSET;
+		break;
+	case PMBUS_VIRT_READ_TEMP2_MIN:
+		histreg = TPS53688_TEMP_PEAK;
+		offset = TPS53688_HISTORY_REG_MIN_OFFSET;
+		break;
+	case PMBUS_VIRT_READ_TEMP2_MAX:
+		histreg = TPS53688_TEMP_PEAK;
+		offset = TPS53688_HISTORY_REG_MAX_OFFSET;
+		break;
+	case PMBUS_VIRT_RESET_TEMP_HISTORY:
+	case PMBUS_VIRT_RESET_TEMP2_HISTORY:
+	case PMBUS_VIRT_RESET_VIN_HISTORY:
+	case PMBUS_VIRT_RESET_IIN_HISTORY:
+	case PMBUS_VIRT_RESET_PIN_HISTORY:
+	case PMBUS_VIRT_RESET_POUT_HISTORY:
+	case PMBUS_VIRT_RESET_VOUT_HISTORY:
+	case PMBUS_VIRT_RESET_IOUT_HISTORY:
+		return 0;
+	default:
+		return -ENODATA;
+	}
+
+	return tps53688_get_history(client, histreg, page, offset);
+}
+
+static int tps53688_write_word_data(struct i2c_client *client, int unused1,
+				    int reg, u16 unused2)
+{
+	int ret;
+
+	switch (reg) {
+	case PMBUS_VIRT_RESET_TEMP_HISTORY:
+	case PMBUS_VIRT_RESET_TEMP2_HISTORY:
+		ret = tps53688_reset_history(client, TPS53688_TEMP_PEAK);
+		break;
+	case PMBUS_VIRT_RESET_VIN_HISTORY:
+		ret = tps53688_reset_history(client, TPS53688_VIN_PEAK);
+		break;
+	case PMBUS_VIRT_RESET_IIN_HISTORY:
+		ret = tps53688_reset_history(client, TPS53688_IIN_PEAK);
+		break;
+	case PMBUS_VIRT_RESET_PIN_HISTORY:
+		ret = tps53688_reset_history(client, TPS53688_PIN_PEAK);
+		break;
+	case PMBUS_VIRT_RESET_POUT_HISTORY:
+		ret = tps53688_reset_history(client, TPS53688_POUT_PEAK);
+		break;
+	case PMBUS_VIRT_RESET_VOUT_HISTORY:
+		ret = tps53688_reset_history(client, TPS53688_VOUT_PEAK);
+		break;
+	case PMBUS_VIRT_RESET_IOUT_HISTORY:
+		ret = tps53688_reset_history(client, TPS53688_IOUT_PEAK);
+		break;
+	default:
+		return -ENODATA;
+	}
+	return ret;
+}
+
 static int tps53679_identify_mode(struct i2c_client *client,
 				  struct pmbus_driver_info *info)
 {
@@ -188,7 +408,9 @@ static int tps53679_probe(struct i2c_client *client,
 {
 	struct device *dev = &client->dev;
 	struct pmbus_driver_info *info;
+	bool reset_history = false;
 	enum chips chip_id;
+	int i, ret;
 
 	if (dev->of_node)
 		chip_id = (enum chips)of_device_get_match_data(dev);
@@ -206,9 +428,15 @@ static int tps53679_probe(struct i2c_client *client,
 		info->identify = tps53679_identify;
 		break;
 	case tps53679:
+		info->pages = TPS53679_PAGE_NUM;
+		info->identify = tps53679_identify;
+		break;
 	case tps53688:
 		info->pages = TPS53679_PAGE_NUM;
 		info->identify = tps53679_identify;
+		info->read_word_data = tps53688_read_word_data;
+		info->write_word_data = tps53688_write_word_data;
+		reset_history = true;
 		break;
 	case tps53681:
 		info->pages = TPS53679_PAGE_NUM;
@@ -220,7 +448,19 @@ static int tps53679_probe(struct i2c_client *client,
 		return -ENODEV;
 	}
 
-	return pmbus_do_probe(client, id, info);
+	ret = pmbus_do_probe(client, id, info);
+	if (ret)
+		return ret;
+
+	if (reset_history) {
+		for (i = 0; i < info->pages; i++) {
+			ret = tps53688_start_logging_all(client, i);
+			if (ret)
+				return ret;
+		}
+	}
+
+	return ret;
 }
 
 static const struct i2c_device_id tps53679_id[] = {
-- 
2.11.0

