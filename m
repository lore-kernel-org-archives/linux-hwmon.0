Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from userp1050.oracle.com ([156.151.31.82]:21203 "EHLO
        userp1050.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754482AbcJLH50 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 12 Oct 2016 03:57:26 -0400
Date: Wed, 12 Oct 2016 09:24:52 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [patch] hwmon: (max31790) potential ERR_PTR dereference
Message-ID: <20161012062452.GX12841@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

We should only dereference "data" after we check if it is an error
pointer.

Fixes: 54187ff9d766 ('hwmon: (max31790) Convert to use new hwmon registration API')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/hwmon/max31790.c b/drivers/hwmon/max31790.c
index bef84e0..c1b9275 100644
--- a/drivers/hwmon/max31790.c
+++ b/drivers/hwmon/max31790.c
@@ -268,11 +268,13 @@ static int max31790_read_pwm(struct device *dev, u32 attr, int channel,
 			     long *val)
 {
 	struct max31790_data *data = max31790_update_device(dev);
-	u8 fan_config = data->fan_config[channel];
+	u8 fan_config;
 
 	if (IS_ERR(data))
 		return PTR_ERR(data);
 
+	fan_config = data->fan_config[channel];
+
 	switch (attr) {
 	case hwmon_pwm_input:
 		*val = data->pwm[channel] >> 8;
