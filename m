Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:39367 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751400AbdEFP2j (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 6 May 2017 11:28:39 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id v46FSa1J045577
        for <linux-hwmon@vger.kernel.org>; Sat, 6 May 2017 11:28:38 -0400
Received: from e23smtp03.au.ibm.com (e23smtp03.au.ibm.com [202.81.31.145])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2a9fsbjrbv-1
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
        for <linux-hwmon@vger.kernel.org>; Sat, 06 May 2017 11:28:38 -0400
Received: from localhost
        by e23smtp03.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-hwmon@vger.kernel.org> from <shilpa.bhat@linux.vnet.ibm.com>;
        Sun, 7 May 2017 01:28:34 +1000
From: Shilpasri G Bhat <shilpa.bhat@linux.vnet.ibm.com>
To: jdelvare@suse.com, linux@roeck-us.net, paulus@samba.org,
        mpe@ellerman.id.au
Cc: linux-hwmon@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, svaidy@linux.vnet.ibm.com,
        ego@linux.vnet.ibm.com, akshay.adiga@linux.vnet.ibm.com,
        andrew@aj.id.au, clg@kaod.org,
        Shilpasri G Bhat <shilpa.bhat@linux.vnet.ibm.com>
Subject: [PATCH V4] hwmon: (ibmpowernv) Add highest/lowest attributes to sensors
Date: Sat,  6 May 2017 20:57:16 +0530
Message-Id: <1494084436-32445-1-git-send-email-shilpa.bhat@linux.vnet.ibm.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

OCC provides historical minimum and maximum value for the sensor
readings. This patch exports them as highest and lowest attributes
for the inband sensors copied by OCC to main memory.

Signed-off-by: Shilpasri G Bhat <shilpa.bhat@linux.vnet.ibm.com>
---
Changes from V3:
- Removed extra variable 'hwmon_index'
- Retain the initialization of sensor_data for *_input attribute in
  create_device_attrs(), otherwise all the sensors from different
  classes will numbered continuously.

 drivers/hwmon/ibmpowernv.c | 69 +++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 62 insertions(+), 7 deletions(-)

diff --git a/drivers/hwmon/ibmpowernv.c b/drivers/hwmon/ibmpowernv.c
index 6d2e660..862b832 100644
--- a/drivers/hwmon/ibmpowernv.c
+++ b/drivers/hwmon/ibmpowernv.c
@@ -287,6 +287,7 @@ static int populate_attr_groups(struct platform_device *pdev)
 	opal = of_find_node_by_path("/ibm,opal/sensors");
 	for_each_child_of_node(opal, np) {
 		const char *label;
+		int len;
 
 		if (np->name == NULL)
 			continue;
@@ -298,10 +299,14 @@ static int populate_attr_groups(struct platform_device *pdev)
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
@@ -337,6 +342,41 @@ static void create_hwmon_attr(struct sensor_data *sdata, const char *attr_name,
 	sdata->dev_attr.show = show;
 }
 
+static void populate_sensor(struct sensor_data *sdata, int od, int hd, int sid,
+			    const char *attr_name, enum sensors type,
+			    const struct attribute_group *pgroup,
+			    ssize_t (*show)(struct device *dev,
+					    struct device_attribute *attr,
+					    char *buf))
+{
+	sdata->id = sid;
+	sdata->type = type;
+	sdata->opal_index = od;
+	sdata->hwmon_index = hd;
+	create_hwmon_attr(sdata, attr_name, show);
+	pgroup->attrs[sensor_groups[type].attr_count++] = &sdata->dev_attr.attr;
+}
+
+static char *get_max_attr(enum sensors type)
+{
+	switch (type) {
+	case POWER_INPUT:
+		return "input_highest";
+	default:
+		return "highest";
+	}
+}
+
+static char *get_min_attr(enum sensors type)
+{
+	switch (type) {
+	case POWER_INPUT:
+		return "input_lowest";
+	default:
+		return "lowest";
+	}
+}
+
 /*
  * Iterate through the device tree for each child of 'sensors' node, create
  * a sysfs attribute file, the file is named by translating the DT node name
@@ -417,16 +457,31 @@ static int create_device_attrs(struct platform_device *pdev)
 			 * attribute. They are related to the same
 			 * sensor.
 			 */
-			sdata[count].type = type;
-			sdata[count].opal_index = sdata[count - 1].opal_index;
-			sdata[count].hwmon_index = sdata[count - 1].hwmon_index;
 
 			make_sensor_label(np, &sdata[count], label);
+			populate_sensor(&sdata[count], opal_index,
+					sdata[count - 1].hwmon_index,
+					sensor_id, "label", type, pgroups[type],
+					show_label);
+			count++;
+		}
 
-			create_hwmon_attr(&sdata[count], "label", show_label);
+		if (!of_property_read_u32(np, "sensor-data-max", &sensor_id)) {
+			attr_name = get_max_attr(type);
+			populate_sensor(&sdata[count], opal_index,
+					sdata[count - 1].hwmon_index,
+					sensor_id, attr_name, type,
+					pgroups[type], show_sensor);
+			count++;
+		}
 
-			pgroups[type]->attrs[sensor_groups[type].attr_count++] =
-				&sdata[count++].dev_attr.attr;
+		if (!of_property_read_u32(np, "sensor-data-min", &sensor_id)) {
+			attr_name = get_min_attr(type);
+			populate_sensor(&sdata[count], opal_index,
+					sdata[count - 1].hwmon_index,
+					sensor_id, attr_name, type,
+					pgroups[type], show_sensor);
+			count++;
 		}
 	}
 
-- 
1.8.3.1

