Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg0-f68.google.com ([74.125.83.68]:35522 "EHLO
        mail-pg0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751267AbdHST0n (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 19 Aug 2017 15:26:43 -0400
From: Arvind Yadav <arvind.yadav.cs@gmail.com>
To: jdelvare@suse.com, linux@roeck-us.net
Cc: linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
Subject: [PATCH] hwmon: ftsteutates: constify i2c_device_id
Date: Sun, 20 Aug 2017 00:56:34 +0530
Message-Id: <f172aa5ff3cae05e9744bcd3b184a732df17bfeb.1503170724.git.arvind.yadav.cs@gmail.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

i2c_device_id are not supposed to change at runtime. All functions
working with i2c_device_id provided by <linux/i2c.h> work with
const i2c_device_id. So mark the non-const structs as const.

Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>
---
 drivers/hwmon/ftsteutates.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/ftsteutates.c b/drivers/hwmon/ftsteutates.c
index 0f0277e..317e45f 100644
--- a/drivers/hwmon/ftsteutates.c
+++ b/drivers/hwmon/ftsteutates.c
@@ -60,7 +60,7 @@
 
 static const unsigned short normal_i2c[] = { 0x73, I2C_CLIENT_END };
 
-static struct i2c_device_id fts_id[] = {
+static const struct i2c_device_id fts_id[] = {
 	{ "ftsteutates", 0 },
 	{ }
 };
-- 
2.7.4

