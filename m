Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mailcluster2.itpays.net ([193.107.29.212]:35665 "EHLO
        mailcluster2.itpays.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934582AbcKWLmd (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 23 Nov 2016 06:42:33 -0500
Received: from [10.10.48.149] (unknown [195.159.183.42])
        by mailcluster2.itpays.net (Postfix) with ESMTPA id 22FF03199579
        for <linux-hwmon@vger.kernel.org>; Wed, 23 Nov 2016 12:34:58 +0100 (CET)
To: linux-hwmon@vger.kernel.org
From: Martin Etnestad <martin.etnestad@appeartv.com>
Subject: hwmon: (adt7470) fix checking of num_temp_sensors
Message-ID: <b4aaa8a9-6a8b-6d5f-1aac-718e46fbcc7d@appeartv.com>
Date: Wed, 23 Nov 2016 12:34:57 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

The ADT7470 driver uses num_temp_sensors to check whether or not it
actually needs to read the temperature registers. However, the check
currently has a broken comparison: "num_temp_sensors >= 0" instead of
"num_temp_sensors == 0".

This causes the driver to only read the temperature registers _once_
because num_temp_sensors gets set to a non-negative number after the
check, in the same function.

Additionally, the check is currently done _after_ the measurement
sequence has been completed. The check should be done before the
measurement sequence is initiated, as it can be skipped altogether if
num_temp_sensors is 0.

This patch fixes the comparison and moves the check.

Signed-off-by: Martin Etnestad <martin.etnestad@appeartv.com>
---
  drivers/hwmon/adt7470.c | 8 ++++----
  1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/adt7470.c b/drivers/hwmon/adt7470.c
index f5da39a..d1f9a54 100644
--- a/drivers/hwmon/adt7470.c
+++ b/drivers/hwmon/adt7470.c
@@ -201,6 +201,10 @@ static int adt7470_read_temperatures(struct 
i2c_client *client,
      int i;
      u8 cfg, pwm[4], pwm_cfg[2];

+    /* only read sensors if we have to */
+    if (data->num_temp_sensors == 0)
+        return 0;
+
      /* save pwm[1-4] config register */
      pwm_cfg[0] = i2c_smbus_read_byte_data(client, ADT7470_REG_PWM_CFG(0));
      pwm_cfg[1] = i2c_smbus_read_byte_data(client, ADT7470_REG_PWM_CFG(2));
@@ -243,10 +247,6 @@ static int adt7470_read_temperatures(struct 
i2c_client *client,
          return -EAGAIN;
      }

-    /* Only count fans if we have to */
-    if (data->num_temp_sensors >= 0)
-        return 0;
-
      for (i = 0; i < ADT7470_TEMP_COUNT; i++) {
          data->temp[i] = i2c_smbus_read_byte_data(client,
                          ADT7470_TEMP_REG(i));
-- 
2.7.4

