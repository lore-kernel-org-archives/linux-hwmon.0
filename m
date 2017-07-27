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
Subject: [PATCH v2 03/10] drivers/hwmon/occ: Parse OCC poll response
Date: Thu, 27 Jul 2017 09:30:22 -0500
In-Reply-To: <1501165829-12395-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1501165829-12395-1-git-send-email-eajames@linux.vnet.ibm.com>
Message-Id: <1501165829-12395-4-git-send-email-eajames@linux.vnet.ibm.com>
List-ID: <linux-hwmon@vger.kernel.org>

From: "Edward A. James" <eajames@us.ibm.com>

Add method to parse the response from the OCC poll command. This only
needs to be done during probe(), since the OCC shouldn't change the
number or format of sensors while it's running. The parsed response
allows quick access to sensor data, as well as information on the
number and version of sensors, which we need to instantiate hwmon
attributes.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/hwmon/occ/common.c | 50 ++++++++++++++++++++++++++++++++++++++++++
 drivers/hwmon/occ/common.h | 54 ++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 104 insertions(+)

diff --git a/drivers/hwmon/occ/common.c b/drivers/hwmon/occ/common.c
index 92f06ae..c55aec0 100644
--- a/drivers/hwmon/occ/common.c
+++ b/drivers/hwmon/occ/common.c
@@ -8,6 +8,7 @@
  */
 
 #include <linux/device.h>
+#include <linux/kernel.h>
 
 #include "common.h"
 
@@ -29,6 +30,53 @@ static int occ_poll(struct occ *occ)
 	return occ->send_cmd(occ, cmd);
 }
 
+/* only need to do this once at startup, as OCC won't change sensors on us */
+static void occ_parse_poll_response(struct occ *occ)
+{
+	unsigned int i, offset = 0, size = 0;
+	struct occ_sensor *sensor;
+	struct occ_sensors *sensors = &occ->sensors;
+	struct occ_response *resp = &occ->resp;
+	struct occ_poll_response *poll =
+		(struct occ_poll_response *)&resp->data[0];
+	struct occ_poll_response_header *header = &poll->header;
+	struct occ_sensor_data_block *block = &poll->block;
+
+	for (i = 0; i < header->num_sensor_data_blocks; ++i) {
+		block = (struct occ_sensor_data_block *)((u8 *)block + offset);
+		offset = (block->header.num_sensors *
+			  block->header.sensor_length) + sizeof(block->header);
+		size += offset;
+
+		/* validate all the length/size fields */
+		if ((size + sizeof(*header)) >= OCC_RESP_DATA_BYTES) {
+			dev_warn(occ->bus_dev, "exceeded response buffer\n");
+			return;
+		}
+
+		/* match sensor block type */
+		if (strncmp(block->header.eye_catcher, "TEMP", 4) == 0)
+			sensor = &sensors->temp;
+		else if (strncmp(block->header.eye_catcher, "FREQ", 4) == 0)
+			sensor = &sensors->freq;
+		else if (strncmp(block->header.eye_catcher, "POWR", 4) == 0)
+			sensor = &sensors->power;
+		else if (strncmp(block->header.eye_catcher, "CAPS", 4) == 0)
+			sensor = &sensors->caps;
+		else if (strncmp(block->header.eye_catcher, "EXTN", 4) == 0)
+			sensor = &sensors->extended;
+		else {
+			dev_warn(occ->bus_dev, "sensor not supported %.4s\n",
+				 block->header.eye_catcher);
+			continue;
+		}
+
+		sensor->num_sensors = block->header.num_sensors;
+		sensor->version = block->header.sensor_format;
+		sensor->data = &block->data;
+	}
+}
+
 int occ_setup(struct occ *occ, const char *name)
 {
 	int rc;
@@ -40,5 +88,7 @@ int occ_setup(struct occ *occ, const char *name)
 		return rc;
 	}
 
+	occ_parse_poll_response(occ);
+
 	return 0;
 }
diff --git a/drivers/hwmon/occ/common.h b/drivers/hwmon/occ/common.h
index 705dfe3..f52d45a 100644
--- a/drivers/hwmon/occ/common.h
+++ b/drivers/hwmon/occ/common.h
@@ -26,10 +26,64 @@ struct occ_response {
 	__be16 checksum;
 } __packed;
 
+struct occ_sensor_data_block_header {
+	u8 eye_catcher[4];
+	u8 reserved;
+	u8 sensor_format;
+	u8 sensor_length;
+	u8 num_sensors;
+} __packed;
+
+struct occ_sensor_data_block {
+	struct occ_sensor_data_block_header header;
+	u32 data;
+} __packed;
+
+struct occ_poll_response_header {
+	u8 status;
+	u8 ext_status;
+	u8 occs_present;
+	u8 config_data;
+	u8 occ_state;
+	u8 mode;
+	u8 ips_status;
+	u8 error_log_id;
+	__be32 error_log_start_address;
+	__be16 error_log_length;
+	u16 reserved;
+	u8 occ_code_level[16];
+	u8 eye_catcher[6];
+	u8 num_sensor_data_blocks;
+	u8 sensor_data_block_header_version;
+} __packed;
+
+struct occ_poll_response {
+	struct occ_poll_response_header header;
+	struct occ_sensor_data_block block;
+} __packed;
+
+struct occ_sensor {
+	u8 num_sensors;
+	u8 version;
+	void *data;	/* pointer to sensor data start within response */
+};
+
+/* OCC only provides one sensor data block of each type, but any number of
+ * sensors within that block.
+ */
+struct occ_sensors {
+	struct occ_sensor temp;
+	struct occ_sensor freq;
+	struct occ_sensor power;
+	struct occ_sensor caps;
+	struct occ_sensor extended;
+};
+
 struct occ {
 	struct device *bus_dev;
 
 	struct occ_response resp;
+	struct occ_sensors sensors;
 
 	u8 poll_cmd_data;		/* to perform OCC poll command */
 	int (*send_cmd)(struct occ *occ, u8 *cmd);
-- 
1.8.3.1
