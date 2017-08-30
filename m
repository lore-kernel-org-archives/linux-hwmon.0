Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:50767 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751555AbdH3S4E (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 30 Aug 2017 14:56:04 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id v7UItH6r031130
        for <linux-hwmon@vger.kernel.org>; Wed, 30 Aug 2017 14:56:03 -0400
Received: from e19.ny.us.ibm.com (e19.ny.us.ibm.com [129.33.205.209])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2cnxtfgcm2-1
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
        for <linux-hwmon@vger.kernel.org>; Wed, 30 Aug 2017 14:56:03 -0400
Received: from localhost
        by e19.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-hwmon@vger.kernel.org> from <cbostic@linux.vnet.ibm.com>;
        Wed, 30 Aug 2017 14:56:03 -0400
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
To: jdelvare@suse.com, linux@roeck-us.net, corbet@lwn.net,
        linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>,
        openbmc@lists.ozlabs.org
Subject: [PATCH 2/2] hwmon: (ucd9000) Add sysfs attribute to clear logged faults
Date: Wed, 30 Aug 2017 13:55:36 -0500
In-Reply-To: <20170830185536.71307-1-cbostic@linux.vnet.ibm.com>
References: <20170830185536.71307-1-cbostic@linux.vnet.ibm.com>
Message-Id: <20170830185536.71307-3-cbostic@linux.vnet.ibm.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Add ability to clear logged faults via sysfs.

Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
---
 drivers/hwmon/pmbus/ucd9000.c | 45 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 44 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/ucd9000.c b/drivers/hwmon/pmbus/ucd9000.c
index b74dbec..8bd8cb1 100644
--- a/drivers/hwmon/pmbus/ucd9000.c
+++ b/drivers/hwmon/pmbus/ucd9000.c
@@ -27,6 +27,8 @@
 #include <linux/slab.h>
 #include <linux/i2c.h>
 #include <linux/pmbus.h>
+#include <linux/sysfs.h>
+#include <linux/hwmon-sysfs.h>
 #include "pmbus.h"
 
 enum chips { ucd9000, ucd90120, ucd90124, ucd90160, ucd9090, ucd90910 };
@@ -35,6 +37,7 @@
 #define UCD9000_NUM_PAGES		0xd6
 #define UCD9000_FAN_CONFIG_INDEX	0xe7
 #define UCD9000_FAN_CONFIG		0xe8
+#define UCD9000_LOGGED_FAULTS		0xea
 #define UCD9000_DEVICE_ID		0xfd
 
 #define UCD9000_MON_TYPE(x)	(((x) >> 5) & 0x07)
@@ -109,6 +112,36 @@ static int ucd9000_read_byte_data(struct i2c_client *client, int page, int reg)
 	return ret;
 }
 
+static ssize_t ucd9000_clear_logged_faults(struct device *dev,
+			struct device_attribute *attr, const char *buf,
+			size_t count)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	int ret;
+
+	/* No page set required */
+	ret = i2c_smbus_write_byte_data(client, UCD9000_LOGGED_FAULTS, 0);
+	if (ret) {
+		dev_err(&client->dev, "Failed to clear logged faults: %d\n",
+			ret);
+		return ret;
+	}
+
+	return count;
+}
+
+static DEVICE_ATTR(clear_logged_faults, 0200, NULL,
+			ucd9000_clear_logged_faults);
+
+static struct attribute *ucd9000_attributes[] = {
+	&dev_attr_clear_logged_faults.attr,
+	NULL
+};
+
+static const struct attribute_group ucd9000_attr_group = {
+	.attrs = ucd9000_attributes,
+};
+
 static const struct i2c_device_id ucd9000_id[] = {
 	{"ucd9000", ucd9000},
 	{"ucd90120", ucd90120},
@@ -263,9 +296,19 @@ static int ucd9000_probe(struct i2c_client *client,
 		  | PMBUS_HAVE_FAN34 | PMBUS_HAVE_STATUS_FAN34;
 	}
 
+	ret = sysfs_create_group(&client->dev.kobj, &ucd9000_attr_group);
+	if (ret < 0)
+		return ret;
+
 	return pmbus_do_probe(client, mid, info);
 }
 
+static int ucd9000_remove(struct i2c_client *client)
+{
+	sysfs_remove_group(&client->dev.kobj, &ucd9000_attr_group);
+	return pmbus_do_remove(client);
+}
+
 /* This is the driver that will be inserted */
 static struct i2c_driver ucd9000_driver = {
 	.driver = {
@@ -273,7 +316,7 @@ static int ucd9000_probe(struct i2c_client *client,
 		.of_match_table = of_match_ptr(ucd9000_of_match),
 	},
 	.probe = ucd9000_probe,
-	.remove = pmbus_do_remove,
+	.remove = ucd9000_remove,
 	.id_table = ucd9000_id,
 };
 
-- 
1.8.2.2

