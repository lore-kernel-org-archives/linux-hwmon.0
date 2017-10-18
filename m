Return-Path: <colin.king@canonical.com>
Return-path: <colin.king@canonical.com>
From: Colin King <colin.king@canonical.com>
To: George Joseph <george.joseph@fairview5.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: (asc7621): remove redundant assignment to newval
Date: Wed, 18 Oct 2017 13:10:38 +0100
Message-Id: <20171018121038.29409-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-ID: <linux-hwmon@vger.kernel.org>

From: Colin Ian King <colin.king@canonical.com>

The setting of newval to zero is redundant as the following if/else
stanzas will always update newval to a new value. Remove the
redundant setting, cleans up clang build warning:

drivers/hwmon/asc7621.c:582:2: warning: Value stored to 'newval' is
never read

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/hwmon/asc7621.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/hwmon/asc7621.c b/drivers/hwmon/asc7621.c
index 4875e99b59c9..6d34c05a4f83 100644
--- a/drivers/hwmon/asc7621.c
+++ b/drivers/hwmon/asc7621.c
@@ -579,7 +579,6 @@ static ssize_t show_pwm_enable(struct device *dev,
 	mutex_unlock(&data->update_lock);
 
 	val = config | (altbit << 3);
-	newval = 0;
 
 	if (val == 3 || val >= 10)
 		newval = 255;
-- 
2.14.1
