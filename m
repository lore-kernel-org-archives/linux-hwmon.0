Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:56823 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1753840AbdFVWtB (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 22 Jun 2017 18:49:01 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id v5MMhnwM007299
        for <linux-hwmon@vger.kernel.org>; Thu, 22 Jun 2017 18:48:55 -0400
Received: from e33.co.us.ibm.com (e33.co.us.ibm.com [32.97.110.151])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2b8k2y11ct-1
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
        for <linux-hwmon@vger.kernel.org>; Thu, 22 Jun 2017 18:48:55 -0400
Received: from localhost
        by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-hwmon@vger.kernel.org> from <eajames@linux.vnet.ibm.com>;
        Thu, 22 Jun 2017 16:48:54 -0600
From: Eddie James <eajames@linux.vnet.ibm.com>
To: linux-kernel@vger.kernel.org
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux@roeck-us.net, jdelvare@suse.com, mark.rutland@arm.com,
        robh+dt@kernel.org, gregkh@linuxfoundation.org,
        cbostic@linux.vnet.ibm.com, jk@ozlabs.org, joel@jms.id.au,
        andrew@aj.id.au, eajames@linux.vnet.ibm.com,
        "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH 4/7] drivers/hwmon/occ: Add sensor types and versions
Date: Thu, 22 Jun 2017 17:48:33 -0500
In-Reply-To: <1498171716-26620-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1498171716-26620-1-git-send-email-eajames@linux.vnet.ibm.com>
Message-Id: <1498171716-26620-5-git-send-email-eajames@linux.vnet.ibm.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

From: "Edward A. James" <eajames@us.ibm.com>

Add structures to define all sensor types and versions. Add sysfs show
and store functions for each sensor type. Add a method to construct the
"set user power cap" command and send it to the OCC. Add rate limit to
polling the OCC (in case user-space reads our hwmon entries rapidly).

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/hwmon/occ/common.c | 590 +++++++++++++++++++++++++++++++++++++++++++++
 drivers/hwmon/occ/common.h |   4 +
 2 files changed, 594 insertions(+)

diff --git a/drivers/hwmon/occ/common.c b/drivers/hwmon/occ/common.c
index d032ef0..b55813a3 100644
--- a/drivers/hwmon/occ/common.c
+++ b/drivers/hwmon/occ/common.c
@@ -7,9 +7,109 @@
  * (at your option) any later version.
  */
 
+#include <asm/unaligned.h>
 #include "common.h"
 #include <linux/hwmon.h>
 
+/* OCC sensor type and version definitions */
+
+struct temp_sensor_1 {
+	u16 sensor_id;
+	u16 value;
+} __packed;
+
+struct temp_sensor_2 {
+	u32 sensor_id;
+	u8 fru_type;
+	u8 value;
+} __packed;
+
+struct freq_sensor_1 {
+	u16 sensor_id;
+	u16 value;
+} __packed;
+
+struct freq_sensor_2 {
+	u32 sensor_id;
+	u16 value;
+} __packed;
+
+struct power_sensor_1 {
+	u16 sensor_id;
+	u32 update_tag;
+	u32 accumulator;
+	u16 value;
+} __packed;
+
+struct power_sensor_2 {
+	u32 sensor_id;
+	u8 function_id;
+	u8 apss_channel;
+	u16 reserved;
+	u32 update_tag;
+	u64 accumulator;
+	u16 value;
+} __packed;
+
+struct power_sensor_data {
+	u16 value;
+	u32 update_tag;
+	u64 accumulator;
+} __packed;
+
+struct power_sensor_data_and_time {
+	u16 update_time;
+	u16 value;
+	u32 update_tag;
+	u64 accumulator;
+} __packed;
+
+struct power_sensor_a0 {
+	u32 sensor_id;
+	struct power_sensor_data_and_time system;
+	u32 reserved;
+	struct power_sensor_data_and_time proc;
+	struct power_sensor_data vdd;
+	struct power_sensor_data vdn;
+} __packed;
+
+struct caps_sensor_1 {
+	u16 curr_powercap;
+	u16 curr_powerreading;
+	u16 norm_powercap;
+	u16 max_powercap;
+	u16 min_powercap;
+	u16 user_powerlimit;
+} __packed;
+
+struct caps_sensor_2 {
+	u16 curr_powercap;
+	u16 curr_powerreading;
+	u16 norm_powercap;
+	u16 max_powercap;
+	u16 min_powercap;
+	u16 user_powerlimit;
+	u8 user_powerlimit_source;
+} __packed;
+
+struct caps_sensor_3 {
+	u16 curr_powercap;
+	u16 curr_powerreading;
+	u16 norm_powercap;
+	u16 max_powercap;
+	u16 hard_min_powercap;
+	u16 soft_min_powercap;
+	u16 user_powerlimit;
+	u8 user_powerlimit_source;
+} __packed;
+
+struct extended_sensor {
+	u8 name[4];
+	u8 flags;
+	u8 reserved;
+	u8 data[6];
+} __packed;
+
 static int occ_poll(struct occ *occ)
 {
 	u16 checksum = occ->poll_cmd_data + 1;
@@ -25,9 +125,496 @@ static int occ_poll(struct occ *occ)
 	cmd[6] = checksum & 0xFF;	/* checksum lsb */
 	cmd[7] = 0;
 
+	/* mutex should already be locked if necessary */
 	return occ->send_cmd(occ, cmd);
 }
 
+static int occ_set_user_power_cap(struct occ *occ, u16 user_power_cap)
+{
+	int rc;
+	u8 cmd[8];
+	u16 checksum = 0x24;
+	__be16 user_power_cap_be = cpu_to_be16(user_power_cap);
+
+	cmd[0] = 0;
+	cmd[1] = 0x22;
+	cmd[2] = 0;
+	cmd[3] = 2;
+
+	memcpy(&cmd[4], &user_power_cap_be, 2);
+
+	checksum += cmd[4] + cmd[5];
+	cmd[6] = checksum >> 8;
+	cmd[7] = checksum & 0xFF;
+
+	rc = mutex_lock_interruptible(&occ->lock);
+	if (rc)
+		return rc;
+
+	rc = occ->send_cmd(occ, cmd);
+	mutex_unlock(&occ->lock);
+
+	return rc;
+}
+
+static int occ_update_response(struct occ *occ)
+{
+	int rc = mutex_lock_interruptible(&occ->lock);
+
+	if (rc)
+		return rc;
+
+	/* limit the maximum rate of polling the OCC */
+	if (time_after(jiffies, occ->last_update + OCC_UPDATE_FREQUENCY)) {
+		rc = occ_poll(occ);
+		occ->last_update = jiffies;
+	}
+
+	mutex_unlock(&occ->lock);
+	return rc;
+}
+
+static ssize_t occ_show_temp_1(struct device *dev,
+			       struct device_attribute *attr, char *buf)
+{
+	int rc;
+	u16 val = 0;
+	struct temp_sensor_1 *temp;
+	struct occ *occ = dev_get_drvdata(dev);
+	struct occ_sensors *sensors = &occ->sensors;
+	struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
+
+	rc = occ_update_response(occ);
+	if (rc)
+		return rc;
+
+	temp = ((struct temp_sensor_1 *)sensors->temp.data) + sattr->index;
+
+	switch (sattr->nr) {
+	case 0:
+		val = get_unaligned_be16(&temp->sensor_id);
+		break;
+	case 1:
+		/* millidegrees */
+		val = get_unaligned_be16(&temp->value) * 1000;
+		break;
+	}
+
+	return snprintf(buf, PAGE_SIZE - 1, "%u\n", val);
+}
+
+static ssize_t occ_show_temp_2(struct device *dev,
+			       struct device_attribute *attr, char *buf)
+{
+	int rc;
+	u32 val = 0;
+	struct temp_sensor_2 *temp;
+	struct occ *occ = dev_get_drvdata(dev);
+	struct occ_sensors *sensors = &occ->sensors;
+	struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
+
+	rc = occ_update_response(occ);
+	if (rc)
+		return rc;
+
+	temp = ((struct temp_sensor_2 *)sensors->temp.data) + sattr->index;
+
+	switch (sattr->nr) {
+	case 0:
+		val = get_unaligned_be32(&temp->sensor_id);
+		break;
+	case 1:
+		val = temp->value * 1000;	/* millidegrees */
+		break;
+	case 2:
+		val = temp->fru_type;
+		break;
+	}
+
+	return snprintf(buf, PAGE_SIZE - 1, "%u\n", val);
+}
+
+static ssize_t occ_show_freq_1(struct device *dev,
+			       struct device_attribute *attr, char *buf)
+{
+	int rc;
+	u16 val = 0;
+	struct freq_sensor_1 *freq;
+	struct occ *occ = dev_get_drvdata(dev);
+	struct occ_sensors *sensors = &occ->sensors;
+	struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
+
+	rc = occ_update_response(occ);
+	if (rc)
+		return rc;
+
+	freq = ((struct freq_sensor_1 *)sensors->freq.data) + sattr->index;
+
+	switch (sattr->nr) {
+	case 0:
+		val = get_unaligned_be16(&freq->sensor_id);
+		break;
+	case 1:
+		val = get_unaligned_be16(&freq->value);
+		break;
+	}
+
+	return snprintf(buf, PAGE_SIZE - 1, "%u\n", val);
+}
+
+static ssize_t occ_show_freq_2(struct device *dev,
+			       struct device_attribute *attr, char *buf)
+{
+	int rc;
+	u32 val = 0;
+	struct freq_sensor_2 *freq;
+	struct occ *occ = dev_get_drvdata(dev);
+	struct occ_sensors *sensors = &occ->sensors;
+	struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
+
+	rc = occ_update_response(occ);
+	if (rc)
+		return rc;
+
+	freq = ((struct freq_sensor_2 *)sensors->freq.data) + sattr->index;
+
+	switch (sattr->nr) {
+	case 0:
+		val = get_unaligned_be32(&freq->sensor_id);
+		break;
+	case 1:
+		val = get_unaligned_be16(&freq->value);
+		break;
+	}
+
+	return snprintf(buf, PAGE_SIZE - 1, "%u\n", val);
+}
+
+static ssize_t occ_show_power_1(struct device *dev,
+				struct device_attribute *attr, char *buf)
+{
+	int rc;
+	u32 val = 0;
+	struct power_sensor_1 *power;
+	struct occ *occ = dev_get_drvdata(dev);
+	struct occ_sensors *sensors = &occ->sensors;
+	struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
+
+	rc = occ_update_response(occ);
+	if (rc)
+		return rc;
+
+	power = ((struct power_sensor_1 *)sensors->power.data) + sattr->index;
+
+	switch (sattr->nr) {
+	case 0:
+		val = get_unaligned_be16(&power->sensor_id);
+		break;
+	case 1:
+		val = get_unaligned_be32(&power->update_tag);
+		break;
+	case 2:
+		val = get_unaligned_be32(&power->accumulator);
+		break;
+	case 3:
+		val = get_unaligned_be16(&power->value);
+		break;
+	}
+
+	return snprintf(buf, PAGE_SIZE - 1, "%u\n", val);
+}
+
+static ssize_t occ_show_power_2(struct device *dev,
+				struct device_attribute *attr, char *buf)
+{
+	int rc;
+	u64 val = 0;
+	struct power_sensor_2 *power;
+	struct occ *occ = dev_get_drvdata(dev);
+	struct occ_sensors *sensors = &occ->sensors;
+	struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
+
+	rc = occ_update_response(occ);
+	if (rc)
+		return rc;
+
+	power = ((struct power_sensor_2 *)sensors->power.data) + sattr->index;
+
+	switch (sattr->nr) {
+	case 0:
+		val = get_unaligned_be32(&power->sensor_id);
+		break;
+	case 1:
+		val = get_unaligned_be32(&power->update_tag);
+		break;
+	case 2:
+		val = get_unaligned_be64(&power->accumulator);
+		break;
+	case 3:
+		val = get_unaligned_be16(&power->value);
+		break;
+	case 4:
+		val = power->function_id;
+		break;
+	case 5:
+		val = power->apss_channel;
+		break;
+	}
+
+	return snprintf(buf, PAGE_SIZE - 1, "%llu\n", val);
+}
+
+static ssize_t occ_show_power_a0(struct device *dev,
+				 struct device_attribute *attr, char *buf)
+{
+	int rc;
+	u64 val = 0;
+	struct power_sensor_a0 *power;
+	struct occ *occ = dev_get_drvdata(dev);
+	struct occ_sensors *sensors = &occ->sensors;
+	struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
+
+	rc = occ_update_response(occ);
+	if (rc)
+		return rc;
+
+	power = ((struct power_sensor_a0 *)sensors->power.data) + sattr->index;
+
+	switch (sattr->nr) {
+	case 0:
+		val = get_unaligned_be32(&power->sensor_id);
+		break;
+	case 1:
+		val = get_unaligned_be16(&power->system.update_time);
+		break;
+	case 2:
+		val = get_unaligned_be16(&power->system.value);
+		break;
+	case 3:
+		val = get_unaligned_be32(&power->system.update_tag);
+		break;
+	case 4:
+		val = get_unaligned_be64(&power->system.accumulator);
+		break;
+	case 5:
+		val = get_unaligned_be16(&power->proc.update_time);
+		break;
+	case 6:
+		val = get_unaligned_be16(&power->proc.value);
+		break;
+	case 7:
+		val = get_unaligned_be32(&power->proc.update_tag);
+		break;
+	case 8:
+		val = get_unaligned_be64(&power->proc.accumulator);
+		break;
+	case 9:
+		val = get_unaligned_be16(&power->vdd.value);
+		break;
+	case 10:
+		val = get_unaligned_be32(&power->vdd.update_tag);
+		break;
+	case 11:
+		val = get_unaligned_be64(&power->vdd.accumulator);
+		break;
+	case 12:
+		val = get_unaligned_be16(&power->vdn.value);
+		break;
+	case 13:
+		val = get_unaligned_be32(&power->vdn.update_tag);
+		break;
+	case 14:
+		val = get_unaligned_be64(&power->vdn.accumulator);
+		break;
+	}
+
+	return snprintf(buf, PAGE_SIZE - 1, "%llu\n", val);
+}
+
+
+static ssize_t occ_show_caps_1(struct device *dev,
+			       struct device_attribute *attr, char *buf)
+{
+	int rc;
+	u16 val = 0;
+	struct caps_sensor_1 *caps;
+	struct occ *occ = dev_get_drvdata(dev);
+	struct occ_sensors *sensors = &occ->sensors;
+	struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
+
+	rc = occ_update_response(occ);
+	if (rc)
+		return rc;
+
+	caps = ((struct caps_sensor_1 *)sensors->caps.data) + sattr->index;
+
+	switch (sattr->nr) {
+	case 0:
+		val = get_unaligned_be16(&caps->curr_powercap);
+		break;
+	case 1:
+		val = get_unaligned_be16(&caps->curr_powerreading);
+		break;
+	case 2:
+		val = get_unaligned_be16(&caps->norm_powercap);
+		break;
+	case 3:
+		val = get_unaligned_be16(&caps->max_powercap);
+		break;
+	case 4:
+		val = get_unaligned_be16(&caps->min_powercap);
+		break;
+	case 5:
+		val = get_unaligned_be16(&caps->user_powerlimit);
+		break;
+	}
+
+	return snprintf(buf, PAGE_SIZE - 1, "%u\n", val);
+}
+
+static ssize_t occ_show_caps_2(struct device *dev,
+			       struct device_attribute *attr, char *buf)
+{
+	int rc;
+	u16 val = 0;
+	struct caps_sensor_2 *caps;
+	struct occ *occ = dev_get_drvdata(dev);
+	struct occ_sensors *sensors = &occ->sensors;
+	struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
+
+	rc = occ_update_response(occ);
+	if (rc)
+		return rc;
+
+	caps = ((struct caps_sensor_2 *)sensors->caps.data) + sattr->index;
+
+	switch (sattr->nr) {
+	case 0:
+		val = get_unaligned_be16(&caps->curr_powercap);
+		break;
+	case 1:
+		val = get_unaligned_be16(&caps->curr_powerreading);
+		break;
+	case 2:
+		val = get_unaligned_be16(&caps->norm_powercap);
+		break;
+	case 3:
+		val = get_unaligned_be16(&caps->max_powercap);
+		break;
+	case 4:
+		val = get_unaligned_be16(&caps->min_powercap);
+		break;
+	case 5:
+		val = get_unaligned_be16(&caps->user_powerlimit);
+		break;
+	case 6:
+		val = caps->user_powerlimit_source;
+		break;
+	}
+
+	return snprintf(buf, PAGE_SIZE - 1, "%u\n", val);
+}
+
+static ssize_t occ_show_caps_3(struct device *dev,
+			       struct device_attribute *attr, char *buf)
+{
+	int rc;
+	u16 val = 0;
+	struct caps_sensor_3 *caps;
+	struct occ *occ = dev_get_drvdata(dev);
+	struct occ_sensors *sensors = &occ->sensors;
+	struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
+
+	rc = occ_update_response(occ);
+	if (rc)
+		return rc;
+
+	caps = ((struct caps_sensor_3 *)sensors->caps.data) + sattr->index;
+
+	switch (sattr->nr) {
+	case 0:
+		val = get_unaligned_be16(&caps->curr_powercap);
+		break;
+	case 1:
+		val = get_unaligned_be16(&caps->curr_powerreading);
+		break;
+	case 2:
+		val = get_unaligned_be16(&caps->norm_powercap);
+		break;
+	case 3:
+		val = get_unaligned_be16(&caps->max_powercap);
+		break;
+	case 4:
+		val = get_unaligned_be16(&caps->hard_min_powercap);
+		break;
+	case 5:
+		val = get_unaligned_be16(&caps->user_powerlimit);
+		break;
+	case 6:
+		val = caps->user_powerlimit_source;
+		break;
+	case 7:
+		val = get_unaligned_be16(&caps->soft_min_powercap);
+		break;
+	}
+
+	return snprintf(buf, PAGE_SIZE - 1, "%u\n", val);
+}
+
+static ssize_t occ_store_caps_user(struct device *dev,
+				   struct device_attribute *attr,
+				   const char *buf, size_t count)
+{
+	int rc;
+	u16 user_power_cap;
+	struct occ *occ = dev_get_drvdata(dev);
+
+	rc = kstrtou16(buf, 0, &user_power_cap);
+	if (rc)
+		return rc;
+
+	rc = occ_set_user_power_cap(occ, user_power_cap);
+	if (rc)
+		return rc;
+
+	return count;
+}
+
+static ssize_t occ_show_extended(struct device *dev,
+				 struct device_attribute *attr, char *buf)
+{
+	int rc;
+	struct extended_sensor *extn;
+	struct occ *occ = dev_get_drvdata(dev);
+	struct occ_sensors *sensors = &occ->sensors;
+	struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
+
+	rc = occ_update_response(occ);
+	if (rc)
+		return rc;
+
+	extn = ((struct extended_sensor *)sensors->extended.data) +
+		sattr->index;
+
+	switch (sattr->nr) {
+	case 0:
+		rc = snprintf(buf, PAGE_SIZE - 1, "%02x%02x%02x%02x\n",
+			      extn->name[0], extn->name[1], extn->name[2],
+			      extn->name[3]);
+		break;
+	case 1:
+		rc = snprintf(buf, PAGE_SIZE - 1, "%02x\n", extn->flags);
+		break;
+	case 2:
+		rc = snprintf(buf, PAGE_SIZE - 1, "%02x%02x%02x%02x%02x%02x\n",
+			      extn->data[0], extn->data[1], extn->data[2],
+			      extn->data[3], extn->data[4], extn->data[5]);
+		break;
+	}
+
+	return rc;
+}
+
 /* only need to do this once at startup, as OCC won't change sensors on us */
 static void occ_parse_poll_response(struct occ *occ)
 {
@@ -79,6 +666,9 @@ int occ_setup(struct occ *occ, const char *name)
 {
 	int rc;
 
+	mutex_init(&occ->lock);
+
+	/* no need to lock */
 	rc = occ_poll(occ);
 	if (rc < 0) {
 		dev_err(occ->bus_dev, "failed to get OCC poll response: %d\n",
diff --git a/drivers/hwmon/occ/common.h b/drivers/hwmon/occ/common.h
index b5b7f02..f4e1df0 100644
--- a/drivers/hwmon/occ/common.h
+++ b/drivers/hwmon/occ/common.h
@@ -15,6 +15,7 @@
 
 #define OCC_RESP_DATA_BYTES		4089
 
+#define OCC_UPDATE_FREQUENCY		msecs_to_jiffies(1000)
 #define OCC_TIMEOUT_MS			5000
 #define OCC_CMD_IN_PRG_MS		100
 
@@ -101,6 +102,9 @@ struct occ {
 
 	u8 poll_cmd_data;		/* to perform OCC poll command */
 	int (*send_cmd)(struct occ *occ, u8 *cmd);
+
+	unsigned long last_update;
+	struct mutex lock;
 };
 
 int occ_setup(struct occ *occ, const char *name);
-- 
1.8.3.1

