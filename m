Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:33366 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751834AbdHHD0A (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 7 Aug 2017 23:26:00 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id v783PB91036377
        for <linux-hwmon@vger.kernel.org>; Mon, 7 Aug 2017 23:26:00 -0400
Received: from e16.ny.us.ibm.com (e16.ny.us.ibm.com [129.33.205.206])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2c6weear4v-1
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
        for <linux-hwmon@vger.kernel.org>; Mon, 07 Aug 2017 23:26:00 -0400
Received: from localhost
        by e16.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-hwmon@vger.kernel.org> from <eajames@linux.vnet.ibm.com>;
        Mon, 7 Aug 2017 23:25:59 -0400
From: Eddie James <eajames@linux.vnet.ibm.com>
To: linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org, joel@jms.id.au, andrew@aj.id.au,
        jk@ozlabs.org, cbostic@linux.vnet.ibm.com,
        eajames@linux.vnet.ibm.com, "Edward A. James" <eajames@us.ibm.com>
Subject: [RFC 2/3] drivers/hmwon/pmbus: store STATUS_WORD in status registers
Date: Mon,  7 Aug 2017 22:25:47 -0500
In-Reply-To: <1502162748-16372-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1502162748-16372-1-git-send-email-eajames@linux.vnet.ibm.com>
Message-Id: <1502162748-16372-3-git-send-email-eajames@linux.vnet.ibm.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

From: "Edward A. James" <eajames@us.ibm.com>

Higher byte of the status register wasn't available for boolean alarms.
Store the STATUS_WORD register if it's available, and read it out when
queried by boolean attributes.

The method of storing and retrieving the status reg is a bit hacky but
I couldn't work out another way without doubling the storage requirement
of every pmbus device or tearing up more of the pmbus core code.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/hwmon/pmbus/pmbus_core.c | 37 +++++++++++++++++++++++++++----------
 1 file changed, 27 insertions(+), 10 deletions(-)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 8511aba..3b53fa7 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -43,7 +43,7 @@
  * Index into status register array, per status register group
  */
 #define PB_STATUS_BASE		0
-#define PB_STATUS_VOUT_BASE	(PB_STATUS_BASE + PMBUS_PAGES)
+#define PB_STATUS_VOUT_BASE	(PB_STATUS_BASE + (PMBUS_PAGES * 2))
 #define PB_STATUS_IOUT_BASE	(PB_STATUS_VOUT_BASE + PMBUS_PAGES)
 #define PB_STATUS_FAN_BASE	(PB_STATUS_IOUT_BASE + PMBUS_PAGES)
 #define PB_STATUS_FAN34_BASE	(PB_STATUS_FAN_BASE + PMBUS_PAGES)
@@ -421,11 +421,14 @@ static struct pmbus_data *pmbus_update_device(struct device *dev)
 
 	mutex_lock(&data->update_lock);
 	if (time_after(jiffies, data->last_updated + HZ) || !data->valid) {
-		int i, j;
+		int i, j, status;
 
 		for (i = 0; i < info->pages; i++) {
-			data->status[PB_STATUS_BASE + i] =
-				data->read_status(client, i);
+			status = data->read_status(client, i);
+			data->status[PB_STATUS_BASE + (i * 2)] = status;
+			data->status[PB_STATUS_BASE + (i * 2) + 1] =
+				status >> 8;
+
 			for (j = 0; j < ARRAY_SIZE(pmbus_status); j++) {
 				struct _pmbus_status *s = &pmbus_status[j];
 
@@ -718,6 +721,18 @@ static u16 pmbus_data2reg(struct pmbus_data *data,
 	return regval;
 }
 
+static int pmbus_get_status(struct pmbus_data *data, int reg)
+{
+	int ret;
+
+	if (reg < PB_STATUS_BASE + PMBUS_PAGES)
+		ret = data->status[reg * 2] | (data->status[(reg * 2) + 1] << 8);
+	else
+		ret = data->status[reg];
+
+	return ret;
+}
+
 /*
  * Return boolean calculated from converted data.
  * <index> defines a status register index and mask.
@@ -746,12 +761,12 @@ static int pmbus_get_boolean(struct pmbus_data *data, struct pmbus_boolean *b,
 {
 	struct pmbus_sensor *s1 = b->s1;
 	struct pmbus_sensor *s2 = b->s2;
-	u16 reg = (index >> 8) & 0xffff;
-	u8 mask = index & 0xff;
+	u16 reg = index >> 16;
+	u16 mask = index & 0xffff;
 	int ret, status;
 	u8 regval;
 
-	status = data->status[reg];
+	status = pmbus_get_status(data, reg);
 	if (status < 0)
 		return status;
 
@@ -890,7 +905,7 @@ static int pmbus_add_boolean(struct pmbus_data *data,
 			     const char *name, const char *type, int seq,
 			     struct pmbus_sensor *s1,
 			     struct pmbus_sensor *s2,
-			     u16 reg, u8 mask)
+			     u16 reg, u16 mask)
 {
 	struct pmbus_boolean *boolean;
 	struct sensor_device_attribute *a;
@@ -906,7 +921,7 @@ static int pmbus_add_boolean(struct pmbus_data *data,
 	boolean->s1 = s1;
 	boolean->s2 = s2;
 	pmbus_attr_init(a, boolean->name, S_IRUGO, pmbus_show_boolean, NULL,
-			(reg << 8) | mask);
+			(reg << 16) | mask);
 
 	return pmbus_add_attribute(data, &a->dev_attr.attr);
 }
@@ -992,7 +1007,7 @@ struct pmbus_limit_attr {
  */
 struct pmbus_sensor_attr {
 	u16 reg;			/* sensor register */
-	u8 gbit;			/* generic status bit */
+	u16 gbit;			/* generic status bit */
 	u8 nlimit;			/* # of limit registers */
 	enum pmbus_sensor_classes class;/* sensor class */
 	const char *label;		/* sensor label */
@@ -1337,6 +1352,7 @@ static int pmbus_add_sensor_attrs(struct i2c_client *client,
 		.func = PMBUS_HAVE_IIN,
 		.sfunc = PMBUS_HAVE_STATUS_INPUT,
 		.sbase = PB_STATUS_INPUT_BASE,
+		.gbit = PB_STATUS_INPUT,
 		.limit = iin_limit_attrs,
 		.nlimit = ARRAY_SIZE(iin_limit_attrs),
 	}, {
@@ -1421,6 +1437,7 @@ static int pmbus_add_sensor_attrs(struct i2c_client *client,
 		.func = PMBUS_HAVE_PIN,
 		.sfunc = PMBUS_HAVE_STATUS_INPUT,
 		.sbase = PB_STATUS_INPUT_BASE,
+		.gbit = PB_STATUS_INPUT,
 		.limit = pin_limit_attrs,
 		.nlimit = ARRAY_SIZE(pin_limit_attrs),
 	}, {
-- 
1.8.3.1

