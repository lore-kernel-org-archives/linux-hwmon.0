Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:51741 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752317AbdIVOgj (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 22 Sep 2017 10:36:39 -0400
From: Colin King <colin.king@canonical.com>
To: Rudolf Marek <r.marek@assembler.cz>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: (w83793): make const array watchdog_minors static, reduces object code size
Date: Fri, 22 Sep 2017 15:36:20 +0100
Message-Id: <20170922143620.13780-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Don't populate const array watchdog_minors on the stack, instead make it
static. Makes the object code smaller by over 350 bytes:

Before:
   text	   data	    bss	    dec	    hex	filename
  48019	  38144	    256	  86419	  15193	drivers/hwmon/w83793.o

After:
   text	   data	    bss	    dec	    hex	filename
  47574	  38232	    256	  86062	  1502e	drivers/hwmon/w83793.o

(gcc 6.3.0, x86-64)

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/hwmon/w83793.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/w83793.c b/drivers/hwmon/w83793.c
index dab5c515d5a3..5ba9d9f1daa1 100644
--- a/drivers/hwmon/w83793.c
+++ b/drivers/hwmon/w83793.c
@@ -1676,7 +1676,9 @@ static int w83793_probe(struct i2c_client *client,
 			const struct i2c_device_id *id)
 {
 	struct device *dev = &client->dev;
-	const int watchdog_minors[] = { WATCHDOG_MINOR, 212, 213, 214, 215 };
+	static const int watchdog_minors[] = {
+		WATCHDOG_MINOR, 212, 213, 214, 215
+	};
 	struct w83793_data *data;
 	int i, tmp, val, err;
 	int files_fan = ARRAY_SIZE(w83793_left_fan) / 7;
-- 
2.14.1

