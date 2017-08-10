Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:53372 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1752890AbdHJV57 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 10 Aug 2017 17:57:59 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id v7ALtDCo133811
        for <linux-hwmon@vger.kernel.org>; Thu, 10 Aug 2017 17:57:58 -0400
Received: from e13.ny.us.ibm.com (e13.ny.us.ibm.com [129.33.205.203])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2c8u195d7p-1
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
        for <linux-hwmon@vger.kernel.org>; Thu, 10 Aug 2017 17:57:58 -0400
Received: from localhost
        by e13.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-hwmon@vger.kernel.org> from <eajames@linux.vnet.ibm.com>;
        Thu, 10 Aug 2017 17:57:58 -0400
From: Eddie James <eajames@linux.vnet.ibm.com>
To: linux@roeck-us.net
Cc: jdelvare@suse.com, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org, joel@jms.id.au, jk@ozlabs.org,
        andrew@aj.id.au, cbostic@linux.vnet.ibm.com,
        eajames@linux.vnet.ibm.com, "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH v2 1/4] hwmon: (pmbus): Switch status registers to 16 bit
Date: Thu, 10 Aug 2017 16:57:47 -0500
In-Reply-To: <1502402270-15328-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1502402270-15328-1-git-send-email-eajames@linux.vnet.ibm.com>
Message-Id: <1502402270-15328-2-git-send-email-eajames@linux.vnet.ibm.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

From: "Edward A. James" <eajames@us.ibm.com>

Switch the storage of status registers to 16 bit values. This allows us
to store all the bits of STATUS_WORD.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/hwmon/pmbus/pmbus_core.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index f1eff6b..4ec7586 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -112,7 +112,7 @@ struct pmbus_data {
 	 * A single status register covers multiple attributes,
 	 * so we keep them all together.
 	 */
-	u8 status[PB_NUM_STATUS_REG];
+	u16 status[PB_NUM_STATUS_REG];
 	u8 status_register;
 
 	u8 currpage;
@@ -716,10 +716,10 @@ static int pmbus_get_boolean(struct pmbus_data *data, struct pmbus_boolean *b,
 {
 	struct pmbus_sensor *s1 = b->s1;
 	struct pmbus_sensor *s2 = b->s2;
-	u16 reg = (index >> 8) & 0xffff;
-	u8 mask = index & 0xff;
+	u16 reg = (index >> 16) & 0xffff;
+	u16 mask = index & 0xffff;
 	int ret, status;
-	u8 regval;
+	u16 regval;
 
 	status = data->status[reg];
 	if (status < 0)
@@ -860,7 +860,7 @@ static int pmbus_add_boolean(struct pmbus_data *data,
 			     const char *name, const char *type, int seq,
 			     struct pmbus_sensor *s1,
 			     struct pmbus_sensor *s2,
-			     u16 reg, u8 mask)
+			     u16 reg, u16 mask)
 {
 	struct pmbus_boolean *boolean;
 	struct sensor_device_attribute *a;
@@ -876,7 +876,7 @@ static int pmbus_add_boolean(struct pmbus_data *data,
 	boolean->s1 = s1;
 	boolean->s2 = s2;
 	pmbus_attr_init(a, boolean->name, S_IRUGO, pmbus_show_boolean, NULL,
-			(reg << 8) | mask);
+			(reg << 16) | mask);
 
 	return pmbus_add_attribute(data, &a->dev_attr.attr);
 }
@@ -962,7 +962,7 @@ struct pmbus_limit_attr {
  */
 struct pmbus_sensor_attr {
 	u16 reg;			/* sensor register */
-	u8 gbit;			/* generic status bit */
+	u16 gbit;			/* generic status bit */
 	u8 nlimit;			/* # of limit registers */
 	enum pmbus_sensor_classes class;/* sensor class */
 	const char *label;		/* sensor label */
-- 
1.8.3.1

