Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:34855 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1752401AbdHIWUA (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 9 Aug 2017 18:20:00 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id v79MJwYl166940
        for <linux-hwmon@vger.kernel.org>; Wed, 9 Aug 2017 18:20:00 -0400
Received: from e37.co.us.ibm.com (e37.co.us.ibm.com [32.97.110.158])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2c83dmgrr0-1
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
        for <linux-hwmon@vger.kernel.org>; Wed, 09 Aug 2017 18:19:59 -0400
Received: from localhost
        by e37.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-hwmon@vger.kernel.org> from <eajames@linux.vnet.ibm.com>;
        Wed, 9 Aug 2017 16:19:36 -0600
From: Eddie James <eajames@linux.vnet.ibm.com>
To: linux@roeck-us.net
Cc: jdelvare@suse.com, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org, joel@jms.id.au, jk@ozlabs.org,
        andrew@aj.id.au, cbostic@linux.vnet.ibm.com,
        eajames@linux.vnet.ibm.com, "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH 3/4] drivers/hwmon/pmbus: Add generic alarm bit for iin and pin
Date: Wed,  9 Aug 2017 17:19:16 -0500
In-Reply-To: <1502317157-12648-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1502317157-12648-1-git-send-email-eajames@linux.vnet.ibm.com>
Message-Id: <1502317157-12648-4-git-send-email-eajames@linux.vnet.ibm.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

From: "Edward A. James" <eajames@us.ibm.com>

Add PB_STATUS_INPUT as the generic alarm bit for iin and pin. We also
need to redo the status register checking before setting up the boolean
attribute, since it won't necessarily check STATUS_WORD if the device
doesn't support it, which we need for this bit.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/hwmon/pmbus/pmbus_core.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 277d170..1a51f8f 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -1045,6 +1045,7 @@ static int pmbus_add_sensor_attrs_one(struct i2c_client *client,
 				      const struct pmbus_sensor_attr *attr)
 {
 	struct pmbus_sensor *base;
+	bool upper = !!(attr->gbit & 0xff00);	/* need to check STATUS_WORD */
 	int ret;
 
 	if (attr->label) {
@@ -1065,10 +1066,13 @@ static int pmbus_add_sensor_attrs_one(struct i2c_client *client,
 		/*
 		 * Add generic alarm attribute only if there are no individual
 		 * alarm attributes, if there is a global alarm bit, and if
-		 * the generic status register for this page is accessible.
+		 * the generic status register (word or byte, depending on
+		 * which global bit is set) for this page is accessible.
 		 */
 		if (!ret && attr->gbit &&
-		    pmbus_check_status_register(client, page)) {
+		    ((upper && pmbus_check_word_register(client, page,
+							 PMBUS_STATUS_WORD)) ||
+		     (!upper && pmbus_check_status_register(client, page)))) {
 			ret = pmbus_add_boolean(data, name, "alarm", index,
 						NULL, NULL,
 						PB_STATUS_BASE + page,
@@ -1324,6 +1328,7 @@ static int pmbus_add_sensor_attrs(struct i2c_client *client,
 		.func = PMBUS_HAVE_IIN,
 		.sfunc = PMBUS_HAVE_STATUS_INPUT,
 		.sbase = PB_STATUS_INPUT_BASE,
+		.gbit = PB_STATUS_INPUT,
 		.limit = iin_limit_attrs,
 		.nlimit = ARRAY_SIZE(iin_limit_attrs),
 	}, {
@@ -1408,6 +1413,7 @@ static int pmbus_add_sensor_attrs(struct i2c_client *client,
 		.func = PMBUS_HAVE_PIN,
 		.sfunc = PMBUS_HAVE_STATUS_INPUT,
 		.sbase = PB_STATUS_INPUT_BASE,
+		.gbit = PB_STATUS_INPUT,
 		.limit = pin_limit_attrs,
 		.nlimit = ARRAY_SIZE(pin_limit_attrs),
 	}, {
-- 
1.8.3.1

