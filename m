Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from bran.ispras.ru ([83.149.199.196]:13533 "EHLO smtp.ispras.ru"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1752168AbdHJPXq (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 10 Aug 2017 11:23:46 -0400
From: Anton Vasilyev <vasilyev@ispras.ru>
To: Jean Delvare <jdelvare@suse.com>
Cc: Anton Vasilyev <vasilyev@ispras.ru>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        ldv-project@linuxtesting.org
Subject: [PATCH] hwmon:(stts751) buffer overread on wrong chip configuration
Date: Thu, 10 Aug 2017 18:23:34 +0300
Message-Id: <1502378614-13011-1-git-send-email-vasilyev@ispras.ru>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

If stts751 hw by some reason reports conversion rate bigger then 9:
	ret = i2c_smbus_read_byte_data(priv->client, STTS751_REG_RATE);
then dereference stts751_intervals[priv->interval] leads to buffer
overread.

The path adds sanity check for value read from chip.

Found by Linux Driver Verification project (linuxtesting.org).

Signed-off-by: Anton Vasilyev <vasilyev@ispras.ru>
---
 drivers/hwmon/stts751.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/hwmon/stts751.c b/drivers/hwmon/stts751.c
index d56251d..f6eddbd 100644
--- a/drivers/hwmon/stts751.c
+++ b/drivers/hwmon/stts751.c
@@ -718,6 +718,10 @@ static int stts751_read_chip_config(struct stts751_priv *priv)
 	ret = i2c_smbus_read_byte_data(priv->client, STTS751_REG_RATE);
 	if (ret < 0)
 		return ret;
+	if (ret > ARRAY_SIZE(stts751_intervals)) {
+		dev_err(priv->dev, "Unrecognized conversion rate 0x%x\n", ret);
+		return -ENODEV;
+	}
 	priv->interval = ret;
 
 	ret = stts751_read_reg16(priv, &priv->event_max,
-- 
2.7.4

