Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:60611 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751834AbdHHDZ5 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 7 Aug 2017 23:25:57 -0400
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id v783NlN3038174
        for <linux-hwmon@vger.kernel.org>; Mon, 7 Aug 2017 23:25:56 -0400
Received: from e15.ny.us.ibm.com (e15.ny.us.ibm.com [129.33.205.205])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2c71m6qe5u-1
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
        for <linux-hwmon@vger.kernel.org>; Mon, 07 Aug 2017 23:25:56 -0400
Received: from localhost
        by e15.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-hwmon@vger.kernel.org> from <eajames@linux.vnet.ibm.com>;
        Mon, 7 Aug 2017 23:25:56 -0400
From: Eddie James <eajames@linux.vnet.ibm.com>
To: linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org, joel@jms.id.au, andrew@aj.id.au,
        jk@ozlabs.org, cbostic@linux.vnet.ibm.com,
        eajames@linux.vnet.ibm.com, "Edward A. James" <eajames@us.ibm.com>
Subject: [RFC 1/3] drivers/hwmon/pmbus: Access word data for STATUS_WORD and use it by default
Date: Mon,  7 Aug 2017 22:25:46 -0500
In-Reply-To: <1502162748-16372-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1502162748-16372-1-git-send-email-eajames@linux.vnet.ibm.com>
Message-Id: <1502162748-16372-2-git-send-email-eajames@linux.vnet.ibm.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

From: "Edward A. James" <eajames@us.ibm.com>

Pmbus core always reads byte data from the status register, even if
configured to use STATUS_WORD. Use a function pointer so we always do
either byte or word access depending on which register we're trying to
access. Also switch to use STATUS_WORD by default.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/hwmon/pmbus/pmbus_core.c | 69 +++++++++++++++++++++++++++++++---------
 1 file changed, 54 insertions(+), 15 deletions(-)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index f1eff6b..8511aba 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -113,7 +113,8 @@ struct pmbus_data {
 	 * so we keep them all together.
 	 */
 	u8 status[PB_NUM_STATUS_REG];
-	u8 status_register;
+
+	int (*read_status)(struct i2c_client *client, int page);
 
 	u8 currpage;
 };
@@ -324,7 +325,7 @@ static int pmbus_check_status_cml(struct i2c_client *client)
 	struct pmbus_data *data = i2c_get_clientdata(client);
 	int status, status2;
 
-	status = _pmbus_read_byte_data(client, -1, data->status_register);
+	status = data->read_status(client, -1);
 	if (status < 0 || (status & PB_STATUS_CML)) {
 		status2 = _pmbus_read_byte_data(client, -1, PMBUS_STATUS_CML);
 		if (status2 < 0 || (status2 & PB_CML_FAULT_INVALID_COMMAND))
@@ -348,6 +349,36 @@ static bool pmbus_check_register(struct i2c_client *client,
 	return rv >= 0;
 }
 
+/* Check specified page status register accessibility. Need a separate
+ * function rather than the two above so we can use the correct status
+ * register, and we can optimize out the second status register read.
+ */
+static bool pmbus_check_status_register(struct i2c_client *client, int page)
+{
+	int status, rc = 0;
+	struct pmbus_data *data = i2c_get_clientdata(client);
+
+	status = data->read_status(client, page);
+	if (status < 0)
+		goto out;
+
+	if (!(data->flags & PMBUS_SKIP_STATUS_CHECK)) {
+		if (status & PB_STATUS_CML) {
+			status = _pmbus_read_byte_data(client, -1,
+						       PMBUS_STATUS_CML);
+			if (status < 0 ||
+			    (status & PB_CML_FAULT_INVALID_COMMAND))
+				goto out;
+		}
+	}
+
+	rc = 1;
+
+out:
+	pmbus_clear_fault_page(client, -1);
+	return rc;
+}
+
 bool pmbus_check_byte_register(struct i2c_client *client, int page, int reg)
 {
 	return pmbus_check_register(client, _pmbus_read_byte_data, page, reg);
@@ -393,9 +424,8 @@ static struct pmbus_data *pmbus_update_device(struct device *dev)
 		int i, j;
 
 		for (i = 0; i < info->pages; i++) {
-			data->status[PB_STATUS_BASE + i]
-			    = _pmbus_read_byte_data(client, i,
-						    data->status_register);
+			data->status[PB_STATUS_BASE + i] =
+				data->read_status(client, i);
 			for (j = 0; j < ARRAY_SIZE(pmbus_status); j++) {
 				struct _pmbus_status *s = &pmbus_status[j];
 
@@ -1051,8 +1081,7 @@ static int pmbus_add_sensor_attrs_one(struct i2c_client *client,
 		 * the generic status register for this page is accessible.
 		 */
 		if (!ret && attr->gbit &&
-		    pmbus_check_byte_register(client, page,
-					      data->status_register)) {
+		    pmbus_check_status_register(client, page)) {
 			ret = pmbus_add_boolean(data, name, "alarm", index,
 						NULL, NULL,
 						PB_STATUS_BASE + page,
@@ -1729,6 +1758,16 @@ static int pmbus_identify_common(struct i2c_client *client,
 	return 0;
 }
 
+static int pmbus_read_status_word(struct i2c_client *client, int page)
+{
+	return _pmbus_read_word_data(client, page, PMBUS_STATUS_WORD);
+}
+
+static int pmbus_read_status_byte(struct i2c_client *client, int page)
+{
+	return _pmbus_read_byte_data(client, page, PMBUS_STATUS_BYTE);
+}
+
 static int pmbus_init_common(struct i2c_client *client, struct pmbus_data *data,
 			     struct pmbus_driver_info *info)
 {
@@ -1736,16 +1775,16 @@ static int pmbus_init_common(struct i2c_client *client, struct pmbus_data *data,
 	int page, ret;
 
 	/*
-	 * Some PMBus chips don't support PMBUS_STATUS_BYTE, so try
-	 * to use PMBUS_STATUS_WORD instead if that is the case.
+	 * Some PMBus chips don't support PMBUS_STATUS_WORD, so try
+	 * to use PMBUS_STATUS_BYTE instead if that is the case.
 	 * Bail out if both registers are not supported.
 	 */
-	data->status_register = PMBUS_STATUS_BYTE;
-	ret = i2c_smbus_read_byte_data(client, PMBUS_STATUS_BYTE);
-	if (ret < 0 || ret == 0xff) {
-		data->status_register = PMBUS_STATUS_WORD;
-		ret = i2c_smbus_read_word_data(client, PMBUS_STATUS_WORD);
-		if (ret < 0 || ret == 0xffff) {
+	data->read_status = pmbus_read_status_word;
+	ret = i2c_smbus_read_word_data(client, PMBUS_STATUS_WORD);
+	if (ret < 0 || ret == 0xffff) {
+		data->read_status = pmbus_read_status_byte;
+		ret = i2c_smbus_read_byte_data(client, PMBUS_STATUS_BYTE);
+		if (ret < 0 || ret == 0xff) {
 			dev_err(dev, "PMBus status register not found\n");
 			return -ENODEV;
 		}
-- 
1.8.3.1

