Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pl1-f194.google.com ([209.85.214.194]:43644 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726103AbeKMOdX (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 13 Nov 2018 09:33:23 -0500
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: jdelvare@suse.com, linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon (lm63) Do not overwrite data->kind
Date: Mon, 12 Nov 2018 20:36:56 -0800
Message-Id: <20181113043656.25765-1-nicoleotsuka@gmail.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

According to the code right before the removed line, data->kind
should be either from DT or from id pointer. So there shouldn't
be an additional overwriting after the if-else statement.

So this patch just removes the overwriting line.

Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
---
Guenter,
    I have not really tested this change but still sent it out
    since it looks obvious. Please feel free to drop it if you
    have concern at an untested change. Thanks.

 drivers/hwmon/lm63.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/hwmon/lm63.c b/drivers/hwmon/lm63.c
index 4c1770920d29..eac54b9cdeec 100644
--- a/drivers/hwmon/lm63.c
+++ b/drivers/hwmon/lm63.c
@@ -1120,7 +1120,6 @@ static int lm63_probe(struct i2c_client *client,
 		data->kind = (enum chips)of_device_get_match_data(&client->dev);
 	else
 		data->kind = id->driver_data;
-	data->kind = id->driver_data;
 	if (data->kind == lm64)
 		data->temp2_offset = 16000;
 
-- 
2.17.1
