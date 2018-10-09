Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:54078 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726393AbeJIT2n (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 9 Oct 2018 15:28:43 -0400
From: Colin King <colin.king@canonical.com>
To: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: (tmp421) make const array 'names' static
Date: Tue,  9 Oct 2018 13:11:57 +0100
Message-Id: <20181009121157.21656-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The const array 'names' can be made static, saves populating it on
the stack and will make it read-only.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/hwmon/tmp421.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/tmp421.c b/drivers/hwmon/tmp421.c
index e36399213324..8844c9565d2a 100644
--- a/drivers/hwmon/tmp421.c
+++ b/drivers/hwmon/tmp421.c
@@ -226,8 +226,10 @@ static int tmp421_detect(struct i2c_client *client,
 {
 	enum chips kind;
 	struct i2c_adapter *adapter = client->adapter;
-	const char * const names[] = { "TMP421", "TMP422", "TMP423",
-				       "TMP441", "TMP442" };
+	static const char * const names[] = {
+		"TMP421", "TMP422", "TMP423",
+		"TMP441", "TMP442"
+	};
 	int addr = client->addr;
 	u8 reg;
 
-- 
2.17.1
