Return-path: <dan.carpenter@oracle.com>
Date: Mon, 10 Apr 2017 16:46:21 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Joel Stanley <joel@jms.id.au>,
        Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH 1/2] hwmon: (tacho) Fix a condition in
 aspeed_get_fan_tach_ch_rpm()
Message-ID: <20170410134621.GA1918@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-ID: <linux-hwmon@vger.kernel.org>

What we want is for regmap_read() to return zero meaning success and
for RESULT_STATUS_MASK which is BIT(31) to be set set.

The current code is buggy in two ways.  It requires both failure
conditions should be met before it fails.  And if it times out then it
returns zero instead of -EIO.

Fixes: cc96f6f6d766 ("hwmon: Support for ASPEED PWM/Fan tach")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Static analysis.  Not tested.

diff --git a/drivers/hwmon/aspeed-pwm-tacho.c b/drivers/hwmon/aspeed-pwm-tacho.c
index 29010ad94208..2f22add5c73b 100644
--- a/drivers/hwmon/aspeed-pwm-tacho.c
+++ b/drivers/hwmon/aspeed-pwm-tacho.c
@@ -512,11 +512,11 @@ static u32 aspeed_get_fan_tach_ch_rpm(struct aspeed_pwm_tacho_data *priv,
 
 	msleep(sec);
 
-	while (!(regmap_read(priv->regmap, ASPEED_PTCR_RESULT, &val))
-			& !(val & RESULT_STATUS_MASK)) {
+	while (regmap_read(priv->regmap, ASPEED_PTCR_RESULT, &val) ||
+	       !(val & RESULT_STATUS_MASK)) {
 		timeout++;
 		if (timeout > 1)
-			return 0;
+			return -EIO;
 		msleep(sec);
 	}
 
