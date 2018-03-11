Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-oi0-f65.google.com ([209.85.218.65]:38209 "EHLO
        mail-oi0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751223AbeCKC7K (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 10 Mar 2018 21:59:10 -0500
Received: by mail-oi0-f65.google.com with SMTP id h23so9815156oib.5
        for <linux-hwmon@vger.kernel.org>; Sat, 10 Mar 2018 18:59:10 -0800 (PST)
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 2/3] hwmon: (pmbus/adm1275) Accept negative page register values
Date: Sat, 10 Mar 2018 18:59:03 -0800
Message-Id: <1520737144-7955-2-git-send-email-linux@roeck-us.net>
In-Reply-To: <1520737144-7955-1-git-send-email-linux@roeck-us.net>
References: <1520737144-7955-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

A negative page register value means that no page needs to be
selected. This is used by status register read operations and needs
to be accepted. The failure to do so so results in missed status
and limit registers.

Fixes: da8e48ab483e1 ("hwmon: (pmbus) Always call _pmbus_read_byte in core driver")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/pmbus/adm1275.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/pmbus/adm1275.c b/drivers/hwmon/pmbus/adm1275.c
index 00d6995af4c2..8a44e94d5679 100644
--- a/drivers/hwmon/pmbus/adm1275.c
+++ b/drivers/hwmon/pmbus/adm1275.c
@@ -154,7 +154,7 @@ static int adm1275_read_word_data(struct i2c_client *client, int page, int reg)
 	const struct adm1275_data *data = to_adm1275_data(info);
 	int ret = 0;
 
-	if (page)
+	if (page > 0)
 		return -ENXIO;
 
 	switch (reg) {
@@ -240,7 +240,7 @@ static int adm1275_write_word_data(struct i2c_client *client, int page, int reg,
 	const struct adm1275_data *data = to_adm1275_data(info);
 	int ret;
 
-	if (page)
+	if (page > 0)
 		return -ENXIO;
 
 	switch (reg) {
-- 
2.7.4

