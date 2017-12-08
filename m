Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:52670 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1752508AbdLHRnB (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 8 Dec 2017 12:43:01 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id vB8HeFDC025135
        for <linux-hwmon@vger.kernel.org>; Fri, 8 Dec 2017 12:43:01 -0500
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.152])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2eqxt4b2mc-1
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
        for <linux-hwmon@vger.kernel.org>; Fri, 08 Dec 2017 12:43:00 -0500
Received: from localhost
        by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-hwmon@vger.kernel.org> from <eajames@linux.vnet.ibm.com>;
        Fri, 8 Dec 2017 10:43:00 -0700
From: Eddie James <eajames@linux.vnet.ibm.com>
To: linux-hwmon@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux@roeck-us.net,
        jdelvare@suse.com, eajames@linux.vnet.ibm.com, joel@jms.id.au,
        "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH v2 1/2] hwmon: (pmbus): Export pmbus device debugfs directory entry
Date: Fri,  8 Dec 2017 11:42:48 -0600
In-Reply-To: <1512754969-6556-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1512754969-6556-1-git-send-email-eajames@linux.vnet.ibm.com>
Message-Id: <1512754969-6556-2-git-send-email-eajames@linux.vnet.ibm.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

From: "Edward A. James" <eajames@us.ibm.com>

Pmbus client drivers, if they want to use debugfs, should use the same
root directory as the pmbus debugfs entries are using. Therefore, export
the device dentry for the pmbus client.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/hwmon/pmbus/pmbus.h      | 2 ++
 drivers/hwmon/pmbus/pmbus_core.c | 8 ++++++++
 2 files changed, 10 insertions(+)

diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
index d39d506..1d24397 100644
--- a/drivers/hwmon/pmbus/pmbus.h
+++ b/drivers/hwmon/pmbus/pmbus.h
@@ -461,4 +461,6 @@ int pmbus_get_fan_rate_cached(struct i2c_client *client, int page, int id,
 			      enum pmbus_fan_mode mode);
 int pmbus_update_fan(struct i2c_client *client, int page, int id,
 		     u8 config, u8 mask, u16 command);
+struct dentry *pmbus_get_debugfs_dir(struct i2c_client *client);
+
 #endif /* PMBUS_H */
diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 99ab39f..f7c47d7 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -2381,6 +2381,14 @@ int pmbus_do_remove(struct i2c_client *client)
 }
 EXPORT_SYMBOL_GPL(pmbus_do_remove);
 
+struct dentry *pmbus_get_debugfs_dir(struct i2c_client *client)
+{
+	struct pmbus_data *data = i2c_get_clientdata(client);
+
+	return data->debugfs;
+}
+EXPORT_SYMBOL_GPL(pmbus_get_debugfs_dir);
+
 static int __init pmbus_core_init(void)
 {
 	pmbus_debugfs_dir = debugfs_create_dir("pmbus", NULL);
-- 
1.8.3.1

