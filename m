Return-Path: <SRS0=BLaD=4M=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88FD2C35671
	for <linux-hwmon@archiver.kernel.org>; Mon, 24 Feb 2020 13:13:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 58A2620828
	for <linux-hwmon@archiver.kernel.org>; Mon, 24 Feb 2020 13:13:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727348AbgBXNNW (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 24 Feb 2020 08:13:22 -0500
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:49676 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727329AbgBXNNW (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 24 Feb 2020 08:13:22 -0500
Received: from Internal Mail-Server by MTLPINE1 (envelope-from vadimp@mellanox.com)
        with ESMTPS (AES256-SHA encrypted); 24 Feb 2020 15:13:18 +0200
Received: from r-build-lowlevel.mtr.labs.mlnx. (r-build-lowlevel.mtr.labs.mlnx [10.209.0.190])
        by labmailer.mlnx (8.13.8/8.13.8) with ESMTP id 01ODDIo7012749;
        Mon, 24 Feb 2020 15:13:18 +0200
From:   Vadim Pasternak <vadimp@mellanox.com>
To:     linux@roeck-us.net
Cc:     linux-hwmon@vger.kernel.org, Vadim Pasternak <vadimp@mellanox.com>
Subject: [hwmon-next v1] hwmon: (pmbus/tps53679) Add support for historical registers for TPS53688
Date:   Mon, 24 Feb 2020 13:13:16 +0000
Message-Id: <20200224131316.28238-1-vadimp@mellanox.com>
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
---
 drivers/hwmon/pmbus/tps53679.c | 244 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 243 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/tps53679.c b/drivers/hwmon/pmbus/tps53679.c
index 157c99ffb52b..ae5ce144e5fe 100644
--- a/drivers/hwmon/pmbus/tps53679.c
+++ b/drivers/hwmon/pmbus/tps53679.c
@@ -34,6 +34,227 @@ enum chips {
 
 #define TPS53681_MFR_SPECIFIC_20	0xe4	/* Number of phases, per page */
 
+/* Registers for highest and lowest historical values records */
+#define TPS53688_VOUT_PEAK		0xd1
+#define TPS53688_IOUT_PEAK		0xd2
+#define TPS53688_TEMP_PEAK		0xd3
+#define TPS53688_VIN_PEAK		0xd5
+#define TPS53688_IIN_PEAK		0xd6
+#define TPS53688_PIN_PEAK		0xd7
+#define TPS53688_POUT_PEAK		0xd8
+#define TPS53688_HISTORY_REG_BUF_LEN	5
+#define TPS53688_HISTORY_REG_MIN_OFFSET	3
+#define TPS53688_HISTORY_REG_MAX_OFFSET	1
+
+const static u8 tps53688_reset_logging[] = { 0x04, 0x00, 0x01, 0x00, 0x00 };
+const static u8 tps53688_resume_logging[] = { 0x04, 0x20, 0x00, 0x00, 0x00 };
+
+static int tps53688_reg2data(u16 reg, int data, long *val)
+{
+	s16 exponent;
+	s32 mantissa;
+
+	if (data == 0)
+		return data;
+
+	switch (reg) {
+	case PMBUS_VIRT_READ_VOUT_MIN:
+	case PMBUS_VIRT_READ_VOUT_MAX:
+		/* Convert to LINEAR11. */
+		exponent = ((s16)data) >> 11;
+		mantissa = ((s16)((data & GENMASK(10, 0)) << 5)) >> 5;
+		*val = mantissa * 1000L;
+		if (exponent >= 0)
+			*val <<= exponent;
+		else
+			*val >>= -exponent;
+		return 0;
+	default:
+		return -ENODATA;
+	}
+}
+
+static int
+tps53688_get_history(struct i2c_client *client, int reg, int page, int unused,
+		     int offset)
+{
+	u8 buf[TPS53688_HISTORY_REG_BUF_LEN];
+	int ret;
+
+	ret = pmbus_set_page(client, page, 0);
+	if (ret < 0)
+		return ret;
+
+	ret = i2c_smbus_read_i2c_block_data(client, reg,
+					    TPS53688_HISTORY_REG_BUF_LEN,
+					    buf);
+	if (ret < 0)
+		return ret;
+	else if (ret != TPS53688_HISTORY_REG_BUF_LEN)
+		return -EIO;
+
+	return *(u16 *)(buf + offset);
+}
+
+static int
+tps53688_reset_history(struct i2c_client *client, int reg)
+{
+	int ret;
+
+	ret = i2c_smbus_write_i2c_block_data(client, reg,
+					     TPS53688_HISTORY_REG_BUF_LEN,
+					     tps53688_reset_logging);
+	if (ret < 0)
+		return ret;
+
+	ret = i2c_smbus_write_i2c_block_data(client, reg,
+					     TPS53688_HISTORY_REG_BUF_LEN,
+					     tps53688_resume_logging);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+static int tps53688_reset_history_all(struct i2c_client *client, int page)
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
+	return tps53688_get_history(client, histreg, page, unused, offset);
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
@@ -188,7 +409,9 @@ static int tps53679_probe(struct i2c_client *client,
 {
 	struct device *dev = &client->dev;
 	struct pmbus_driver_info *info;
+	bool reset_history = false;
 	enum chips chip_id;
+	int i, ret;
 
 	if (dev->of_node)
 		chip_id = (enum chips)of_device_get_match_data(dev);
@@ -206,9 +429,16 @@ static int tps53679_probe(struct i2c_client *client,
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
+		info->reg2data = tps53688_reg2data;
+		reset_history = true;
 		break;
 	case tps53681:
 		info->pages = TPS53679_PAGE_NUM;
@@ -220,7 +450,19 @@ static int tps53679_probe(struct i2c_client *client,
 		return -ENODEV;
 	}
 
-	return pmbus_do_probe(client, id, info);
+	ret = pmbus_do_probe(client, id, info);
+	if (ret)
+		return ret;
+
+	if (reset_history) {
+		for (i = 0; i < info->pages; i++) {
+			ret = tps53688_reset_history_all(client, i);
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

