Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail1.bemta23.messagelabs.com ([67.219.246.211]:52483 "EHLO
        mail1.bemta23.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2387724AbeGLBMg (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 11 Jul 2018 21:12:36 -0400
From: Tokunori Ikegami <ikegami@allied-telesis.co.jp>
To: Jean Delvare <jdelvare@suse.com>
Cc: Tokunori Ikegami <ikegami@allied-telesis.co.jp>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        linux-hwmon@vger.kernel.org
Subject: [PATCH 2/5] hwmon: adt7475: Change read and write functions to return error
Date: Thu, 12 Jul 2018 10:04:47 +0900
Message-Id: <20180712010450.10586-3-ikegami@allied-telesis.co.jp>
In-Reply-To: <20180712010450.10586-1-ikegami@allied-telesis.co.jp>
References: <20180712010450.10586-1-ikegami@allied-telesis.co.jp>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Currently adt7475_read_word and adt7475_write_word do not return error.
So change both functions to return error codes correctly.

Signed-off-by: Tokunori Ikegami <ikegami@allied-telesis.co.jp>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: linux-hwmon@vger.kernel.org
---
 drivers/hwmon/adt7475.c | 30 ++++++++++++++++++++++--------
 1 file changed, 22 insertions(+), 8 deletions(-)

diff --git a/drivers/hwmon/adt7475.c b/drivers/hwmon/adt7475.c
index 234f725213f9..a40eb62ee6b1 100644
--- a/drivers/hwmon/adt7475.c
+++ b/drivers/hwmon/adt7475.c
@@ -303,20 +303,34 @@ static inline u16 volt2reg(int channel, long volt, u8 bypass_attn)
 	return clamp_val(reg, 0, 1023) & (0xff << 2);
 }
 
-static u16 adt7475_read_word(struct i2c_client *client, int reg)
+static int adt7475_read_word(struct i2c_client *client, int reg)
 {
-	u16 val;
+	int val, val2;
 
-	val = i2c_smbus_read_byte_data(client, reg);
-	val |= (i2c_smbus_read_byte_data(client, reg + 1) << 8);
+	val = adt7475_read(reg);
+	if (val < 0)
+		return val;
 
-	return val;
+	val2 = adt7475_read(reg + 1);
+	if (val2 < 0)
+		return val2;
+
+	return val | (val2 << 8);
 }
 
-static void adt7475_write_word(struct i2c_client *client, int reg, u16 val)
+static int adt7475_write_word(struct i2c_client *client, int reg, u16 val)
 {
-	i2c_smbus_write_byte_data(client, reg + 1, val >> 8);
-	i2c_smbus_write_byte_data(client, reg, val & 0xFF);
+	int ret;
+
+	ret = i2c_smbus_write_byte_data(client, reg + 1, val >> 8);
+	if (ret < 0)
+		return ret;
+
+	ret = i2c_smbus_write_byte_data(client, reg, val & 0xFF);
+	if (ret < 0)
+		return ret;
+
+	return 0;
 }
 
 static ssize_t show_voltage(struct device *dev, struct device_attribute *attr,
-- 
2.16.1

