Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:34916 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727698AbeKIGnC (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 9 Nov 2018 01:43:02 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id wA8L0C9E049479
        for <linux-hwmon@vger.kernel.org>; Thu, 8 Nov 2018 16:05:46 -0500
Received: from e11.ny.us.ibm.com (e11.ny.us.ibm.com [129.33.205.201])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2nmtrqw5r1-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-hwmon@vger.kernel.org>; Thu, 08 Nov 2018 16:05:46 -0500
Received: from localhost
        by e11.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-hwmon@vger.kernel.org> from <eajames@linux.ibm.com>;
        Thu, 8 Nov 2018 21:05:45 -0000
From: Eddie James <eajames@linux.ibm.com>
To: linux-kernel@vger.kernel.org
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        jdelvare@suse.com, linux-doc@vger.kernel.org,
        gregkh@linuxfoundation.org, robh+dt@kernel.org,
        mark.rutland@arm.com, linux@roeck-us.net, rdunlap@infradead.org,
        benh@kernel.crashing.org, Eddie James <eajames@linux.vnet.ibm.com>,
        Eddie James <eajames@linux.ibm.com>
Subject: [PATCH v6 07/10] hwmon (occ): Parse OCC poll response
Date: Thu,  8 Nov 2018 15:05:26 -0600
In-Reply-To: <1541711129-26631-1-git-send-email-eajames@linux.ibm.com>
References: <1541711129-26631-1-git-send-email-eajames@linux.ibm.com>
Message-Id: <1541711129-26631-8-git-send-email-eajames@linux.ibm.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

From: Eddie James <eajames@linux.vnet.ibm.com>

Add method to parse the response from the OCC poll command. This only
needs to be done during probe(), since the OCC shouldn't change the
number or format of sensors while it's running. The parsed response
allows quick access to sensor data, as well as information on the
number and version of sensors, which we need to instantiate hwmon
attributes.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/hwmon/occ/common.c | 61 ++++++++++++++++++++++++++++++++++++++++++++++
 drivers/hwmon/occ/common.h | 55 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 116 insertions(+)

diff --git a/drivers/hwmon/occ/common.c b/drivers/hwmon/occ/common.c
index 81acd4b..a066509 100644
--- a/drivers/hwmon/occ/common.c
+++ b/drivers/hwmon/occ/common.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 
 #include <linux/device.h>
+#include <linux/kernel.h>
 
 #include "common.h"
 
@@ -22,6 +23,64 @@ static int occ_poll(struct occ *occ)
 	return occ->send_cmd(occ, cmd);
 }
 
+/* only need to do this once at startup, as OCC won't change sensors on us */
+static void occ_parse_poll_response(struct occ *occ)
+{
+	unsigned int i, old_offset, offset = 0, size = 0;
+	struct occ_sensor *sensor;
+	struct occ_sensors *sensors = &occ->sensors;
+	struct occ_response *resp = &occ->resp;
+	struct occ_poll_response *poll =
+		(struct occ_poll_response *)&resp->data[0];
+	struct occ_poll_response_header *header = &poll->header;
+	struct occ_sensor_data_block *block = &poll->block;
+
+	dev_info(occ->bus_dev, "OCC found, code level: %.16s\n",
+		 header->occ_code_level);
+
+	for (i = 0; i < header->num_sensor_data_blocks; ++i) {
+		block = (struct occ_sensor_data_block *)((u8 *)block + offset);
+		old_offset = offset;
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
+		dev_dbg(occ->bus_dev, " %04x..%04x: %.4s (%d sensors)\n",
+			old_offset, offset - 1, block->header.eye_catcher,
+			block->header.num_sensors);
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
+
+	dev_dbg(occ->bus_dev, "Max resp size: %u+%zd=%zd\n", size,
+		sizeof(*header), size + sizeof(*header));
+}
+
 int occ_setup(struct occ *occ, const char *name)
 {
 	int rc;
@@ -36,5 +95,7 @@ int occ_setup(struct occ *occ, const char *name)
 		return rc;
 	}
 
+	occ_parse_poll_response(occ);
+
 	return 0;
 }
diff --git a/drivers/hwmon/occ/common.h b/drivers/hwmon/occ/common.h
index b44fee2..0a7a107 100644
--- a/drivers/hwmon/occ/common.h
+++ b/drivers/hwmon/occ/common.h
@@ -20,10 +20,65 @@ struct occ_response {
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
+/*
+ * OCC only provides one sensor data block of each type, but any number of
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
