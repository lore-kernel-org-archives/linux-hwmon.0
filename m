Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from relay1.mentorg.com ([192.94.38.131]:53364 "EHLO
        relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753099AbeDPRI2 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 16 Apr 2018 13:08:28 -0400
Subject: [PATCH 1/1] hwmon: (ina2xx) initialize mutex before locking
CC: <linux@roeck-us.net>, <jdelvare@suse.com>,
        <linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        chombour <Cedric_Hombourger@mentor.com>,
        ahsann <Noor_Ahsan@mentor.com>, <m.purski@samsung.com>
From: Ahsan Hussain <ahsan_hussain@mentor.com>
Message-ID: <f286b0f4-948f-74a7-6dc1-90ca88f3dcdc@mentor.com>
Date: Mon, 16 Apr 2018 22:08:19 +0500
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: unlisted-recipients:; (no To-header on input)
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org


Upstream commit

8d008c0c ("hwmon: (ina2xx) Make calibration register value fixed")

makes ina2xx_set_shunt() call mutex_lock on an un-initialized mutex.
Initialize it prior so we don't get a NULL pointer dereference error

Signed-off-by: Ahsan Hussain <ahsan_hussain@mentor.com>
---
 drivers/hwmon/ina2xx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/ina2xx.c b/drivers/hwmon/ina2xx.c
index a629f7c..1304f01 100644
--- a/drivers/hwmon/ina2xx.c
+++ b/drivers/hwmon/ina2xx.c
@@ -457,6 +457,8 @@ static int ina2xx_probe(struct i2c_client *client,
 			val = INA2XX_RSHUNT_DEFAULT;
 	}
 +	mutex_init(&data->config_lock);
+
 	ina2xx_set_shunt(data, val);
  	ina2xx_regmap_config.max_register = data->config->registers;
@@ -473,8 +475,6 @@ static int ina2xx_probe(struct i2c_client *client,
 		return -ENODEV;
 	}
 -	mutex_init(&data->config_lock);
-
 	data->groups[group++] = &ina2xx_group;
 	if (id->driver_data == ina226)
 		data->groups[group++] = &ina226_group;
-- 
2.7.4

