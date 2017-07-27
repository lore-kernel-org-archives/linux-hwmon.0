Return-Path: <eajames@linux.vnet.ibm.com>
Return-path: <eajames@linux.vnet.ibm.com>
From: Eddie James <eajames@linux.vnet.ibm.com>
To: linux-kernel@vger.kernel.org
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, linux@roeck-us.net, jdelvare@suse.com,
        corbet@lwn.net, mark.rutland@arm.com, robh+dt@kernel.org,
        cbostic@linux.vnet.ibm.com, jk@ozlabs.org, joel@jms.id.au,
        andrew@aj.id.au, eajames@linux.vnet.ibm.com,
        "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH v2 05/10] drivers/hwmon/occ: Add sensor attributes and register hwmon device
Date: Thu, 27 Jul 2017 09:30:24 -0500
In-Reply-To: <1501165829-12395-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1501165829-12395-1-git-send-email-eajames@linux.vnet.ibm.com>
Message-Id: <1501165829-12395-6-git-send-email-eajames@linux.vnet.ibm.com>
List-ID: <linux-hwmon@vger.kernel.org>

From: "Edward A. James" <eajames@us.ibm.com>

Setup the sensor attributes for every OCC sensor found by the first poll
response. Register the attributes with hwmon. Add hwmon documentation
for the driver.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/hwmon/occ/common.c | 432 +++++++++++++++++++++++++++++++++++++++++++++
 drivers/hwmon/occ/common.h |  15 ++
 2 files changed, 447 insertions(+)

diff --git a/drivers/hwmon/occ/common.c b/drivers/hwmon/occ/common.c
index 5243e54..bad7f4b 100644
--- a/drivers/hwmon/occ/common.c
+++ b/drivers/hwmon/occ/common.c
@@ -8,9 +8,11 @@
  */
 
 #include <linux/device.h>
+#include <linux/hwmon.h>
 #include <linux/hwmon-sysfs.h>
 #include <linux/kernel.h>
 #include <linux/mutex.h>
+#include <linux/sysfs.h>
 #include <asm/unaligned.h>
 
 #include "common.h"
@@ -629,6 +631,419 @@ static ssize_t occ_show_extended(struct device *dev,
 	return rc;
 }
 
+/* Some helper macros to make it easier to define an occ_attribute. Since these
+ * are dynamically allocated, we shouldn't use the existing kernel macros which
+ * stringify the name argument.
+ */
+#define ATTR_OCC(_name, _mode, _show, _store) {				\
+	.attr	= {							\
+		.name = _name,						\
+		.mode = VERIFY_OCTAL_PERMISSIONS(_mode),		\
+	},								\
+	.show	= _show,						\
+	.store	= _store,						\
+}
+
+#define SENSOR_ATTR_OCC(_name, _mode, _show, _store, _nr, _index) {	\
+	.dev_attr	= ATTR_OCC(_name, _mode, _show, _store),	\
+	.index		= _index,					\
+	.nr		= _nr,						\
+}
+
+#define OCC_INIT_ATTR(_name, _mode, _show, _store, _nr, _index)		\
+	((struct sensor_device_attribute_2)				\
+		SENSOR_ATTR_OCC(_name, _mode, _show, _store, _nr, _index))
+
+/* Allocate and instatiate sensor_device_attribute_2s. It's most efficient to
+ * use our own instead of the built-in hwmon attribute types.
+ */
+static int occ_setup_sensor_attrs(struct occ *occ)
+{
+	unsigned int i, s, num_attrs = 0;
+	struct device *dev = occ->bus_dev;
+	struct occ_sensors *sensors = &occ->sensors;
+	struct occ_attribute *attr;
+	ssize_t (*show_temp)(struct device *, struct device_attribute *,
+			     char *) = occ_show_temp_1;
+	ssize_t (*show_freq)(struct device *, struct device_attribute *,
+			     char *) = occ_show_freq_1;
+	ssize_t (*show_power)(struct device *, struct device_attribute *,
+			      char *) = occ_show_power_1;
+	ssize_t (*show_caps)(struct device *, struct device_attribute *,
+			     char *) = occ_show_caps_1;
+
+	switch (sensors->temp.version) {
+	case 1:
+		num_attrs += (sensors->temp.num_sensors * 2);
+		break;
+	case 2:
+		num_attrs += (sensors->temp.num_sensors * 3);
+		show_temp = occ_show_temp_2;
+		break;
+	default:
+		sensors->temp.num_sensors = 0;
+	}
+
+	switch (sensors->freq.version) {
+	case 2:
+		show_freq = occ_show_freq_2;
+		/* fall through */
+	case 1:
+		num_attrs += (sensors->freq.num_sensors * 2);
+		break;
+	default:
+		sensors->freq.num_sensors = 0;
+	}
+
+	switch (sensors->power.version) {
+	case 1:
+		num_attrs += (sensors->power.num_sensors * 4);
+		break;
+	case 2:
+		num_attrs += (sensors->power.num_sensors * 6);
+		show_power = occ_show_power_2;
+		break;
+	case 0xA0:
+		num_attrs += (sensors->power.num_sensors * 19);
+		show_power = occ_show_power_a0;
+		break;
+	default:
+		sensors->power.num_sensors = 0;
+	}
+
+	switch (sensors->caps.version) {
+	case 1:
+		num_attrs += (sensors->caps.num_sensors * 6);
+		break;
+	case 2:
+		num_attrs += (sensors->caps.num_sensors * 7);
+		show_caps = occ_show_caps_2;
+		break;
+	case 3:
+		num_attrs += (sensors->caps.num_sensors * 8);
+		show_caps = occ_show_caps_3;
+		break;
+	default:
+		sensors->caps.num_sensors = 0;
+	}
+
+	switch (sensors->extended.version) {
+	case 1:
+		num_attrs += sensors->extended.num_sensors;
+		break;
+	default:
+		sensors->extended.num_sensors = 0;
+	}
+
+	occ->attrs = devm_kzalloc(dev, sizeof(*occ->attrs) * num_attrs,
+				  GFP_KERNEL);
+	if (!occ->attrs)
+		return -ENOMEM;
+
+	/* null-terminated list */
+	occ->group.attrs = devm_kzalloc(dev, sizeof(*occ->group.attrs) *
+					num_attrs + 1, GFP_KERNEL);
+	if (!occ->group.attrs)
+		return -ENOMEM;
+
+	attr = occ->attrs;
+
+	for (i = 0; i < sensors->temp.num_sensors; ++i) {
+		s = i + 1;
+
+		snprintf(attr->name, sizeof(attr->name), "temp%d_label", s);
+		attr->sensor = OCC_INIT_ATTR(attr->name, 0444, show_temp, NULL,
+					     0, i);
+		attr++;
+
+		snprintf(attr->name, sizeof(attr->name), "temp%d_input", s);
+		attr->sensor = OCC_INIT_ATTR(attr->name, 0444, show_temp, NULL,
+					     1, i);
+		attr++;
+
+		if (sensors->temp.version > 1) {
+			snprintf(attr->name, sizeof(attr->name),
+				 "temp%d_fru_type", s);
+			attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
+						     show_temp, NULL, 2, i);
+			attr++;
+		}
+	}
+
+	for (i = 0; i < sensors->freq.num_sensors; ++i) {
+		s = i + 1;
+
+		snprintf(attr->name, sizeof(attr->name), "freq%d_label", s);
+		attr->sensor = OCC_INIT_ATTR(attr->name, 0444, show_freq, NULL,
+					     0, i);
+		attr++;
+
+		snprintf(attr->name, sizeof(attr->name), "freq%d_input", s);
+		attr->sensor = OCC_INIT_ATTR(attr->name, 0444, show_freq, NULL,
+					     1, i);
+		attr++;
+	}
+
+	if (sensors->power.version == 0xA0) {
+		/* Special case for many-attribute power sensor. Split it into
+		 * a sensor number per power type, emulating several sensors.
+		 */
+		for (i = 0; i < sensors->power.num_sensors; ) {
+			s = (i * 4) + 1;
+
+			snprintf(attr->name, sizeof(attr->name),
+				 "power%d_id", s);
+			attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
+						     show_power, NULL, 0, i);
+			attr++;
+
+			/* system power attributes */
+			snprintf(attr->name, sizeof(attr->name),
+				 "power%d_label", s);
+			attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
+						     show_power, NULL, 1, i);
+			attr++;
+
+			snprintf(attr->name, sizeof(attr->name),
+				 "power%d_update_time", s);
+			attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
+						     show_power, NULL, 2, i);
+			attr++;
+
+			snprintf(attr->name, sizeof(attr->name),
+				 "power%d_input", s);
+			attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
+						     show_power, NULL, 3, i);
+			attr++;
+
+			snprintf(attr->name, sizeof(attr->name),
+				 "power%d_update_tag", s);
+			attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
+						     show_power, NULL, 4, i);
+			attr++;
+
+			snprintf(attr->name, sizeof(attr->name),
+				 "power%d_accumulator", s);
+			attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
+						     show_power, NULL, 5, i);
+			attr++;
+
+			s++;
+
+			/* processor power attributes */
+			snprintf(attr->name, sizeof(attr->name),
+				 "power%d_label", s);
+			attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
+						     show_power, NULL, 6, i);
+			attr++;
+
+			snprintf(attr->name, sizeof(attr->name),
+				 "power%d_update_time", s);
+			attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
+						     show_power, NULL, 7, i);
+			attr++;
+
+			snprintf(attr->name, sizeof(attr->name),
+				 "power%d_input", s);
+			attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
+						     show_power, NULL, 8, i);
+			attr++;
+
+			snprintf(attr->name, sizeof(attr->name),
+				 "power%d_update_tag", s);
+			attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
+						     show_power, NULL, 9, i);
+			attr++;
+
+			snprintf(attr->name, sizeof(attr->name),
+				 "power%d_accumulator", s);
+			attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
+						     show_power, NULL, 10, i);
+			attr++;
+
+			s++;
+
+			/* vdd power attributes */
+			snprintf(attr->name, sizeof(attr->name),
+				 "power%d_label", s);
+			attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
+						     show_power, NULL, 11, i);
+			attr++;
+
+			snprintf(attr->name, sizeof(attr->name),
+				 "power%d_input", s);
+			attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
+						     show_power, NULL, 12, i);
+			attr++;
+
+			snprintf(attr->name, sizeof(attr->name),
+				 "power%d_update_tag", s);
+			attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
+						     show_power, NULL, 13, i);
+			attr++;
+
+			snprintf(attr->name, sizeof(attr->name),
+				 "power%d_accumulator", s);
+			attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
+						     show_power, NULL, 14, i);
+			attr++;
+
+			s++;
+
+			/* vdn power attributes */
+			snprintf(attr->name, sizeof(attr->name),
+				 "power%d_label", s);
+			attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
+						     show_power, NULL, 15, i);
+			attr++;
+
+			snprintf(attr->name, sizeof(attr->name),
+				 "power%d_input", s);
+			attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
+						     show_power, NULL, 16, i);
+			attr++;
+
+			snprintf(attr->name, sizeof(attr->name),
+				 "power%d_update_tag", s);
+			attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
+						     show_power, NULL, 17, i);
+			attr++;
+
+			snprintf(attr->name, sizeof(attr->name),
+				 "power%d_accumulator", s);
+			attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
+						     show_power, NULL, 18, i);
+			attr++;
+		}
+	} else {
+		for (i = 0; i < sensors->power.num_sensors; ++i) {
+			s = i + 1;
+
+			snprintf(attr->name, sizeof(attr->name),
+				 "power%d_label", s);
+			attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
+						     show_power, NULL, 0, i);
+			attr++;
+
+			snprintf(attr->name, sizeof(attr->name),
+				 "power%d_update_tag", s);
+			attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
+						     show_power, NULL, 1, i);
+			attr++;
+
+			snprintf(attr->name, sizeof(attr->name),
+				 "power%d_accumulator", s);
+			attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
+						     show_power, NULL, 2, i);
+			attr++;
+
+			snprintf(attr->name, sizeof(attr->name),
+				 "power%d_input", s);
+			attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
+						     show_power, NULL, 3, i);
+			attr++;
+
+			if (sensors->power.version > 1) {
+				snprintf(attr->name, sizeof(attr->name),
+					 "power%d_function_id", s);
+				attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
+							     show_power, NULL,
+							     4, i);
+				attr++;
+
+				snprintf(attr->name, sizeof(attr->name),
+					 "power%d_apss_channel", s);
+				attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
+							     show_power, NULL,
+							     5, i);
+				attr++;
+			}
+		}
+	}
+
+	for (i = 0; i < sensors->caps.num_sensors; ++i) {
+		s = i + 1;
+
+		snprintf(attr->name, sizeof(attr->name), "caps%d_current", s);
+		attr->sensor = OCC_INIT_ATTR(attr->name, 0444, show_caps, NULL,
+					     0, i);
+		attr++;
+
+		snprintf(attr->name, sizeof(attr->name), "caps%d_reading", s);
+		attr->sensor = OCC_INIT_ATTR(attr->name, 0444, show_caps, NULL,
+					     1, i);
+		attr++;
+
+		snprintf(attr->name, sizeof(attr->name), "caps%d_norm", s);
+		attr->sensor = OCC_INIT_ATTR(attr->name, 0444, show_caps, NULL,
+					     2, i);
+		attr++;
+
+		snprintf(attr->name, sizeof(attr->name), "caps%d_max", s);
+		attr->sensor = OCC_INIT_ATTR(attr->name, 0444, show_caps, NULL,
+					     3, i);
+		attr++;
+
+		if (sensors->caps.version > 2) {
+			snprintf(attr->name, sizeof(attr->name),
+				 "caps%d_min_hard", s);
+			attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
+						     show_caps, NULL, 4, i);
+			attr++;
+
+			snprintf(attr->name, sizeof(attr->name),
+				 "caps%d_min_soft", s);
+			attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
+						     show_caps, NULL, 7, i);
+			attr++;
+		} else {
+			snprintf(attr->name, sizeof(attr->name), "caps%d_min",
+				 s);
+			attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
+						     show_caps, NULL, 4, i);
+			attr++;
+		}
+
+		snprintf(attr->name, sizeof(attr->name), "caps%d_user", s);
+		attr->sensor = OCC_INIT_ATTR(attr->name, 0644, show_caps,
+					     occ_store_caps_user, 5, i);
+		attr++;
+
+		if (sensors->caps.version > 1) {
+			snprintf(attr->name, sizeof(attr->name),
+				 "caps%d_user_source", s);
+			attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
+						     show_caps, NULL, 6, i);
+			attr++;
+		}
+	}
+
+	for (i = 0; i < sensors->extended.num_sensors; ++i) {
+		s = i + 1;
+
+		snprintf(attr->name, sizeof(attr->name), "extn%d_label", s);
+		attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
+					     occ_show_extended, NULL, 0, i);
+		attr++;
+
+		snprintf(attr->name, sizeof(attr->name), "extn%d_flags", s);
+		attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
+					     occ_show_extended, NULL, 1, i);
+		attr++;
+
+		snprintf(attr->name, sizeof(attr->name), "extn%d_input", s);
+		attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
+					     occ_show_extended, NULL, 2, i);
+		attr++;
+	}
+
+	/* put the sensors in the group */
+	for (i = 0; i < num_attrs; ++i)
+		occ->group.attrs[i] = &occ->attrs[i].sensor.dev_attr.attr;
+
+	return 0;
+}
+
 /* only need to do this once at startup, as OCC won't change sensors on us */
 static void occ_parse_poll_response(struct occ *occ)
 {
@@ -681,6 +1096,7 @@ int occ_setup(struct occ *occ, const char *name)
 	int rc;
 
 	mutex_init(&occ->lock);
+	occ->groups[0] = &occ->group;
 
 	/* no need to lock */
 	rc = occ_poll(occ);
@@ -692,5 +1108,21 @@ int occ_setup(struct occ *occ, const char *name)
 
 	occ_parse_poll_response(occ);
 
+	rc = occ_setup_sensor_attrs(occ);
+	if (rc) {
+		dev_err(occ->bus_dev, "failed to setup sensor attrs: %d\n",
+			rc);
+		return rc;
+	}
+
+	occ->hwmon = devm_hwmon_device_register_with_groups(occ->bus_dev, name,
+							    occ, occ->groups);
+	if (IS_ERR(occ->hwmon)) {
+		rc = PTR_ERR(occ->hwmon);
+		dev_err(occ->bus_dev, "failed to register hwmon device: %d\n",
+			rc);
+		return rc;
+	}
+
 	return 0;
 }
diff --git a/drivers/hwmon/occ/common.h b/drivers/hwmon/occ/common.h
index 3e4ca4d..049c3b4 100644
--- a/drivers/hwmon/occ/common.h
+++ b/drivers/hwmon/occ/common.h
@@ -10,7 +10,9 @@
 #ifndef OCC_COMMON_H
 #define OCC_COMMON_H
 
+#include <linux/hwmon-sysfs.h>
 #include <linux/mutex.h>
+#include <linux/sysfs.h>
 
 struct device;
 
@@ -81,6 +83,14 @@ struct occ_sensors {
 	struct occ_sensor extended;
 };
 
+/* Use our own attribute struct so we can dynamically allocate space for the
+ * name.
+ */
+struct occ_attribute {
+	char name[32];
+	struct sensor_device_attribute_2 sensor;
+};
+
 struct occ {
 	struct device *bus_dev;
 
@@ -92,6 +102,11 @@ struct occ {
 
 	unsigned long last_update;
 	struct mutex lock;		/* lock OCC access */
+
+	struct device *hwmon;
+	struct occ_attribute *attrs;
+	struct attribute_group group;
+	const struct attribute_group *groups[2];
 };
 
 int occ_setup(struct occ *occ, const char *name);
-- 
1.8.3.1
