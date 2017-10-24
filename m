Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from userp1040.oracle.com ([156.151.31.81]:38805 "EHLO
        userp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752219AbdJXJsj (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 24 Oct 2017 05:48:39 -0400
Date: Tue, 24 Oct 2017 12:47:42 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Jean Delvare <jdelvare@suse.com>,
        Vadim Pasternak <vadimp@mellanox.com>
Cc: Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] hwmon: (max6621) Inverted if condition in max6621_read()
Message-ID: <20171024094742.qpltjxlvzr25muje@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

We intended to test for failure here but accidentally tested for
success.  It means that we don't set "*val" to true and it means that
if i2c_smbus_write_byte() does fail then we return success.

Fixes: e7895864b0d7 ("hwmon: (max6621) Add support for Maxim MAX6621 temperature sensor")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/hwmon/max6621.c b/drivers/hwmon/max6621.c
index 22079ec29660..35555f0eefb9 100644
--- a/drivers/hwmon/max6621.c
+++ b/drivers/hwmon/max6621.c
@@ -296,7 +296,7 @@ max6621_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
 			if (regval) {
 				ret = i2c_smbus_write_byte(data->client,
 						MAX6621_CLEAR_ALERT_REG);
-				if (!ret)
+				if (ret)
 					return ret;
 			}
 
