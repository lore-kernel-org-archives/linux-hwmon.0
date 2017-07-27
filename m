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
Subject: [PATCH v2 07/10] drivers/hwmon/occ: Add error handling
Date: Thu, 27 Jul 2017 09:30:26 -0500
In-Reply-To: <1501165829-12395-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1501165829-12395-1-git-send-email-eajames@linux.vnet.ibm.com>
Message-Id: <1501165829-12395-8-git-send-email-eajames@linux.vnet.ibm.com>
List-ID: <linux-hwmon@vger.kernel.org>

From: "Edward A. James" <eajames@us.ibm.com>

Add logic to detect a number of error scenarios on the OCC. Export any
errors through an additional non-hwmon device attribute. The error
counting and state verification are required by the OCC hardware
specification.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/hwmon/occ/common.c | 82 ++++++++++++++++++++++++++++++++++++++++++++--
 drivers/hwmon/occ/common.h |  4 +++
 2 files changed, 84 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/occ/common.c b/drivers/hwmon/occ/common.c
index 2459e12..970b31f 100644
--- a/drivers/hwmon/occ/common.c
+++ b/drivers/hwmon/occ/common.c
@@ -17,6 +17,11 @@
 
 #include "common.h"
 
+#define OCC_ERROR_COUNT_THRESHOLD	2	/* OCC HW defined */
+
+#define OCC_STATE_SAFE			4
+#define OCC_SAFE_TIMEOUT		msecs_to_jiffies(60000) /* 1 min */
+
 #define OCC_UPDATE_FREQUENCY		msecs_to_jiffies(1000)
 
 /* OCC status bits */
@@ -126,10 +131,33 @@ struct extended_sensor {
 	u8 data[6];
 } __packed;
 
+static atomic_t occs_present = ATOMIC_INIT(0);
+
+static ssize_t occ_show_error(struct device *dev,
+			      struct device_attribute *attr, char *buf)
+{
+	struct occ *occ = dev_get_drvdata(dev);
+
+	return snprintf(buf, PAGE_SIZE - 1, "%d\n", occ->error);
+}
+
+static DEVICE_ATTR(occ_error, 0444, occ_show_error, NULL);
+
+/* Notify user if we have an error and a change in error state. */
+static void occ_notify_error(struct occ *occ, int old_error)
+{
+	/* check hwmon pointer to verify error attribute has been added */
+	if (occ->error != old_error && occ->error && occ->hwmon)
+		sysfs_notify(&occ->bus_dev->kobj, NULL,
+			     dev_attr_occ_error.attr.name);
+}
+
 static int occ_poll(struct occ *occ)
 {
+	struct occ_poll_response_header *header;
 	u16 checksum = occ->poll_cmd_data + 1;
 	u8 cmd[8];
+	int rc, old_error = occ->error;
 
 	/* big endian */
 	cmd[0] = 0;			/* sequence number */
@@ -142,12 +170,47 @@ static int occ_poll(struct occ *occ)
 	cmd[7] = 0;
 
 	/* mutex should already be locked if necessary */
-	return occ->send_cmd(occ, cmd);
+	rc = occ->send_cmd(occ, cmd);
+	if (rc) {
+		if (occ->error_count++ > OCC_ERROR_COUNT_THRESHOLD)
+			occ->error = rc;
+
+		goto done;
+	}
+
+	/* clear error since communication was successful */
+	occ->error_count = 0;
+	occ->error = 0;
+
+	header = (struct occ_poll_response_header *)occ->resp.data;
+	/* check for safe state */
+	if (header->occ_state == OCC_STATE_SAFE) {
+		if (occ->last_safe) {
+			if (time_after(jiffies,
+				       occ->last_safe + OCC_SAFE_TIMEOUT))
+				occ->error = -EHOSTDOWN;
+		} else {
+			occ->last_safe = jiffies;
+		}
+	} else {
+		occ->last_safe = 0;
+	}
+
+	if (header->status & OCC_STAT_MASTER) {
+		/* check if we're missing any OCCs */
+		if (hweight8(header->occs_present) !=
+		    atomic_read(&occs_present))
+			occ->error = -ENXIO;
+	}
+
+done:
+	occ_notify_error(occ, old_error);
+	return rc;
 }
 
 static int occ_set_user_power_cap(struct occ *occ, u16 user_power_cap)
 {
-	int rc;
+	int rc, old_error = occ->error;
 	u8 cmd[8];
 	u16 checksum = 0x24;
 	__be16 user_power_cap_be = cpu_to_be16(user_power_cap);
@@ -171,6 +234,16 @@ static int occ_set_user_power_cap(struct occ *occ, u16 user_power_cap)
 
 	mutex_unlock(&occ->lock);
 
+	if (rc) {
+		if (occ->error_count++ > OCC_ERROR_COUNT_THRESHOLD)
+			occ->error = rc;
+	} else {
+		/* successful communication so clear the error */
+		occ->error_count = 0;
+		occ->error = 0;
+	}
+
+	occ_notify_error(occ, old_error);
 	return rc;
 }
 
@@ -1110,6 +1183,7 @@ static ssize_t occ_show_status(struct device *dev,
 	&sensor_dev_attr_occ_mem_throttle.dev_attr.attr,
 	&sensor_dev_attr_occ_quick_drop.dev_attr.attr,
 	&sensor_dev_attr_occ_status.dev_attr.attr,
+	&dev_attr_occ_error.attr,
 	NULL
 };
 
@@ -1197,6 +1271,8 @@ int occ_setup(struct occ *occ, const char *name)
 		return rc;
 	}
 
+	atomic_inc(&occs_present);
+
 	rc = sysfs_create_group(&occ->bus_dev->kobj, &occ_attr_group);
 	if (rc)
 		dev_warn(occ->bus_dev, "failed to create status attrs: %d\n",
@@ -1208,4 +1284,6 @@ int occ_setup(struct occ *occ, const char *name)
 void occ_shutdown(struct occ *occ)
 {
 	sysfs_remove_group(&occ->bus_dev->kobj, &occ_attr_group);
+
+	atomic_dec(&occs_present);
 }
diff --git a/drivers/hwmon/occ/common.h b/drivers/hwmon/occ/common.h
index dc9e06d..cef2174 100644
--- a/drivers/hwmon/occ/common.h
+++ b/drivers/hwmon/occ/common.h
@@ -107,6 +107,10 @@ struct occ {
 	struct occ_attribute *attrs;
 	struct attribute_group group;
 	const struct attribute_group *groups[2];
+
+	int error;
+	unsigned int error_count;	/* number of errors observed */
+	unsigned long last_safe;	/* time OCC entered safe state */
 };
 
 int occ_setup(struct occ *occ, const char *name);
-- 
1.8.3.1
