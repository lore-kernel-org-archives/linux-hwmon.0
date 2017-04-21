Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:54980 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751204AbdDUEeu (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 21 Apr 2017 00:34:50 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id v3L4YVaE132822
        for <linux-hwmon@vger.kernel.org>; Fri, 21 Apr 2017 00:34:49 -0400
Received: from e23smtp05.au.ibm.com (e23smtp05.au.ibm.com [202.81.31.147])
        by mx0a-001b2d01.pphosted.com with ESMTP id 29xwqh9fhe-1
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
        for <linux-hwmon@vger.kernel.org>; Fri, 21 Apr 2017 00:34:45 -0400
Received: from localhost
        by e23smtp05.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-hwmon@vger.kernel.org> from <shilpa.bhat@linux.vnet.ibm.com>;
        Fri, 21 Apr 2017 14:33:10 +1000
From: Shilpasri G Bhat <shilpa.bhat@linux.vnet.ibm.com>
To: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>
Cc: linux-hwmon@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, svaidy@linux.vnet.ibm.com,
        ego@linux.vnet.ibm.com, akshay.adiga@linux.vnet.ibm.com,
        andrew@aj.id.au, clg@kaod.org,
        Shilpasri G Bhat <shilpa.bhat@linux.vnet.ibm.com>
Subject: [PATCH] hwmon: (ibmpowernv) Add min/max attributes and current sensors
Date: Fri, 21 Apr 2017 10:01:52 +0530
Message-Id: <1492749112-32465-1-git-send-email-shilpa.bhat@linux.vnet.ibm.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Add support for adding min/max values for the inband sensors copied by
OCC to main memory. And also add current(mA) sensors to the list.

Signed-off-by: Shilpasri G Bhat <shilpa.bhat@linux.vnet.ibm.com>
---
 drivers/hwmon/ibmpowernv.c | 55 ++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 53 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/ibmpowernv.c b/drivers/hwmon/ibmpowernv.c
index 6d2e660..1f329fa8 100644
--- a/drivers/hwmon/ibmpowernv.c
+++ b/drivers/hwmon/ibmpowernv.c
@@ -50,6 +50,7 @@ enum sensors {
 	TEMP,
 	POWER_SUPPLY,
 	POWER_INPUT,
+	CURRENT,
 	MAX_SENSOR_TYPE,
 };
 
@@ -65,7 +66,8 @@ enum sensors {
 	{"fan", "ibm,opal-sensor-cooling-fan"},
 	{"temp", "ibm,opal-sensor-amb-temp"},
 	{"in", "ibm,opal-sensor-power-supply"},
-	{"power", "ibm,opal-sensor-power"}
+	{"power", "ibm,opal-sensor-power"},
+	{"curr"}, /* Follows newer device tree compatible ibm,opal-sensor */
 };
 
 struct sensor_data {
@@ -287,6 +289,7 @@ static int populate_attr_groups(struct platform_device *pdev)
 	opal = of_find_node_by_path("/ibm,opal/sensors");
 	for_each_child_of_node(opal, np) {
 		const char *label;
+		int len;
 
 		if (np->name == NULL)
 			continue;
@@ -298,10 +301,14 @@ static int populate_attr_groups(struct platform_device *pdev)
 		sensor_groups[type].attr_count++;
 
 		/*
-		 * add a new attribute for labels
+		 * add attributes for labels, min and max
 		 */
 		if (!of_property_read_string(np, "label", &label))
 			sensor_groups[type].attr_count++;
+		if (of_find_property(np, "sensor-data-min", &len))
+			sensor_groups[type].attr_count++;
+		if (of_find_property(np, "sensor-data-max", &len))
+			sensor_groups[type].attr_count++;
 	}
 
 	of_node_put(opal);
@@ -428,6 +435,50 @@ static int create_device_attrs(struct platform_device *pdev)
 			pgroups[type]->attrs[sensor_groups[type].attr_count++] =
 				&sdata[count++].dev_attr.attr;
 		}
+
+		if (!of_property_read_u32(np, "sensor-data-max", &sensor_id)) {
+			switch (type) {
+			case POWER_INPUT:
+				attr_name = "input_highest";
+				break;
+			case TEMP:
+				attr_name = "max";
+				break;
+			default:
+				attr_name = "highest";
+				break;
+			}
+
+			sdata[count].id = sensor_id;
+			sdata[count].type = type;
+			sdata[count].hwmon_index = sdata[count - 1].hwmon_index;
+			create_hwmon_attr(&sdata[count], attr_name,
+					  show_sensor);
+			pgroups[type]->attrs[sensor_groups[type].attr_count++] =
+				&sdata[count++].dev_attr.attr;
+		}
+
+		if (!of_property_read_u32(np, "sensor-data-min", &sensor_id)) {
+			switch (type) {
+			case POWER_INPUT:
+				attr_name = "input_lowest";
+				break;
+			case TEMP:
+				attr_name = "min";
+				break;
+			default:
+				attr_name = "lowest";
+				break;
+			}
+
+			sdata[count].id = sensor_id;
+			sdata[count].type = type;
+			sdata[count].hwmon_index = sdata[count - 1].hwmon_index;
+			create_hwmon_attr(&sdata[count], attr_name,
+					  show_sensor);
+			pgroups[type]->attrs[sensor_groups[type].attr_count++] =
+				&sdata[count++].dev_attr.attr;
+		}
 	}
 
 exit_put_node:
-- 
1.8.3.1

