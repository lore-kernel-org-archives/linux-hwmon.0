Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:44783 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751403AbdGRDhQ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 17 Jul 2017 23:37:16 -0400
From: Andrew Jeffery <andrew@aj.id.au>
To: linux@roeck-us.net, linux-hwmon@vger.kernel.org
Cc: Andrew Jeffery <andrew@aj.id.au>, jdelvare@suse.com,
        linux-kernel@vger.kernel.org, joel@jms.id.au,
        openbmc@lists.ozlabs.org, msbarth@linux.vnet.ibm.com,
        mspinler@linux.vnet.ibm.com
Subject: [RFC PATCH v2 2/3] pmbus: Add and expose pmbus_get_info()
Date: Tue, 18 Jul 2017 13:06:52 +0930
Message-Id: <20170718033653.10298-3-andrew@aj.id.au>
In-Reply-To: <20170718033653.10298-1-andrew@aj.id.au>
References: <20170718033653.10298-1-andrew@aj.id.au>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

This allows the caller to hoist themselves out to a containing
structure in e.g. the read/write callbacks without exposing struct
pmbus_data.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
New since v1.

 drivers/hwmon/pmbus/pmbus.h      | 1 +
 drivers/hwmon/pmbus/pmbus_core.c | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
index 226a37bd525f..8b3a0d43d94d 100644
--- a/drivers/hwmon/pmbus/pmbus.h
+++ b/drivers/hwmon/pmbus/pmbus.h
@@ -420,6 +420,7 @@ extern const struct regulator_ops pmbus_regulator_ops;
 
 /* Function declarations */
 
+const struct pmbus_driver_info *pmbus_get_info(struct i2c_client *client);
 void pmbus_clear_cache(struct i2c_client *client);
 int pmbus_set_page(struct i2c_client *client, u8 page);
 int pmbus_read_word_data(struct i2c_client *client, u8 page, u8 reg);
diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 712a8b6c4bd6..87ad612e4924 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -140,6 +140,12 @@ static const int pmbus_fan_command_registers[] = {
 	PMBUS_FAN_COMMAND_4,
 };
 
+const struct pmbus_driver_info *pmbus_get_info(struct i2c_client *client)
+{
+	return ((struct pmbus_data *)i2c_get_clientdata(client))->info;
+}
+EXPORT_SYMBOL_GPL(pmbus_get_info);
+
 void pmbus_clear_cache(struct i2c_client *client)
 {
 	struct pmbus_data *data = i2c_get_clientdata(client);
-- 
2.11.0

