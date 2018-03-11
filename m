Return-Path: <groeck7@gmail.com>
Return-path: <groeck7@gmail.com>
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 1/3] hwmon: (pmbus/max8688) Accept negative page register values
Date: Sat, 10 Mar 2018 18:59:02 -0800
Message-Id: <1520737144-7955-1-git-send-email-linux@roeck-us.net>
List-ID: <linux-hwmon@vger.kernel.org>

A negative page register value means that no page needs to be
selected. This is used by status register evaluations and needs
to be accepted.

Fixes: da8e48ab483e1 ("hwmon: (pmbus) Always call _pmbus_read_byte in core driver")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/pmbus/max8688.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/max8688.c b/drivers/hwmon/pmbus/max8688.c
index dd4883a19045..e951f9b87abb 100644
--- a/drivers/hwmon/pmbus/max8688.c
+++ b/drivers/hwmon/pmbus/max8688.c
@@ -45,7 +45,7 @@ static int max8688_read_word_data(struct i2c_client *client, int page, int reg)
 {
 	int ret;
 
-	if (page)
+	if (page > 0)
 		return -ENXIO;
 
 	switch (reg) {
-- 
2.7.4
