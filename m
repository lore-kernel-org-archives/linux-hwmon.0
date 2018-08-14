Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from aserp2130.oracle.com ([141.146.126.79]:52638 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731429AbeHNMyp (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 14 Aug 2018 08:54:45 -0400
Date: Tue, 14 Aug 2018 13:07:47 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Jean Delvare <jdelvare@suse.com>,
        IKEGAMI Tokunori <ikegami@allied-telesis.co.jp>
Cc: Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH 2/2 v2] hwmon: (adt7475) Make adt7475_read_word() return
 errors
Message-ID: <20180814100747.oovzd66gxmm755nr@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TYAPR01MB2175C5AA4B777C61CB0AE04DDC380@TYAPR01MB2175.jpnprd01.prod.outlook.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

The adt7475_read_word() function was meant to return negative error
codes on failure.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: In my first patch I just removed the error handling in the callers

diff --git a/drivers/hwmon/adt7475.c b/drivers/hwmon/adt7475.c
index 90837f7c7d0f..ec03359536aa 100644
--- a/drivers/hwmon/adt7475.c
+++ b/drivers/hwmon/adt7475.c
@@ -302,14 +302,18 @@ static inline u16 volt2reg(int channel, long volt, u8 bypass_attn)
 	return clamp_val(reg, 0, 1023) & (0xff << 2);
 }
 
-static u16 adt7475_read_word(struct i2c_client *client, int reg)
+static int adt7475_read_word(struct i2c_client *client, int reg)
 {
-	u16 val;
+	int val1, val2;
 
-	val = i2c_smbus_read_byte_data(client, reg);
-	val |= (i2c_smbus_read_byte_data(client, reg + 1) << 8);
+	val1 = i2c_smbus_read_byte_data(client, reg);
+	if (val1 < 0)
+		return val1;
+	val2 = i2c_smbus_read_byte_data(client, reg + 1);
+	if (val2 < 0)
+		return val2;
 
-	return val;
+	return val1 | (val2 << 8);
 }
 
 static void adt7475_write_word(struct i2c_client *client, int reg, u16 val)
