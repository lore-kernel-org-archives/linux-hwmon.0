Return-Path: <dan.carpenter@oracle.com>
Return-path: <dan.carpenter@oracle.com>
Date: Wed, 5 Sep 2018 10:46:27 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH 1/2] hwmon: (nct6775) Set weight source to zero correctly
Message-ID: <20180905074627.putclq3777lmxvoe@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <df45855d-e21c-9b29-d661-7284453241fe@roeck-us.net>
List-ID: <linux-hwmon@vger.kernel.org>

This is dead code because j can never be 1 at this point.  We had
intended to just test if the bit was clear.

Fixes: bbd8decd4123 ("hwmon: (nct6775) Add support for weighted fan control")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/hwmon/nct6775.c b/drivers/hwmon/nct6775.c
index 944f5b63aecd..139781ae830b 100644
--- a/drivers/hwmon/nct6775.c
+++ b/drivers/hwmon/nct6775.c
@@ -1558,7 +1558,7 @@ static void nct6775_update_pwm(struct device *dev)
 		reg = nct6775_read_value(data, data->REG_WEIGHT_TEMP_SEL[i]);
 		data->pwm_weight_temp_sel[i] = reg & 0x1f;
 		/* If weight is disabled, report weight source as 0 */
-		if (j == 1 && !(reg & 0x80))
+		if (!(reg & 0x80))
 			data->pwm_weight_temp_sel[i] = 0;
 
 		/* Weight temp data */
