Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:34214 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1753611AbdFVWsx (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 22 Jun 2017 18:48:53 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id v5MMhw0L025133
        for <linux-hwmon@vger.kernel.org>; Thu, 22 Jun 2017 18:48:53 -0400
Received: from e37.co.us.ibm.com (e37.co.us.ibm.com [32.97.110.158])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2b8pkcrr1c-1
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
        for <linux-hwmon@vger.kernel.org>; Thu, 22 Jun 2017 18:48:52 -0400
Received: from localhost
        by e37.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-hwmon@vger.kernel.org> from <eajames@linux.vnet.ibm.com>;
        Thu, 22 Jun 2017 16:48:51 -0600
From: Eddie James <eajames@linux.vnet.ibm.com>
To: linux-kernel@vger.kernel.org
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux@roeck-us.net, jdelvare@suse.com, mark.rutland@arm.com,
        robh+dt@kernel.org, gregkh@linuxfoundation.org,
        cbostic@linux.vnet.ibm.com, jk@ozlabs.org, joel@jms.id.au,
        andrew@aj.id.au, eajames@linux.vnet.ibm.com,
        "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH 3/7] drivers/hwmon/occ: Parse OCC poll response
Date: Thu, 22 Jun 2017 17:48:32 -0500
In-Reply-To: <1498171716-26620-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1498171716-26620-1-git-send-email-eajames@linux.vnet.ibm.com>
Message-Id: <1498171716-26620-4-git-send-email-eajames@linux.vnet.ibm.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

From: "Edward A. James" <eajames@us.ibm.com>

Add method to parse the response from the OCC poll command. This only
needs to be done during probe(), since the OCC shouldn't change the
number or format of sensors while it's running. The parsed response
allows quick access to sensor data, as well as information on the
number and version of sensors, which we need to instantiate hwmon
attributes.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/hwmon/occ/common.c | 49 +++++++++++++++++++++++++++++++++++++++++
 drivers/hwmon/occ/common.h | 54 ++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 103 insertions(+)

diff --git a/drivers/hwmon/occ/common.c b/drivers/hwmon/occ/common.c
index 60c808c..d032ef0 100644
--- a/drivers/hwmon/occ/common.c
+++ b/drivers/hwmon/occ/common.c
@@ -28,6 +28,53 @@ static int occ_poll(struct occ *occ)
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
@@ -39,5 +86,7 @@ int occ_setup(struct occ *occ, const char *name)
 		return rc;
 	}
 
+	occ_parse_poll_response(occ);
+
 	return 0;
 }
diff --git a/drivers/hwmon/occ/common.h b/drivers/hwmon/occ/common.h
index 0c3f26f..b5b7f02 100644
--- a/drivers/hwmon/occ/common.h
+++ b/drivers/hwmon/occ/common.h
@@ -40,10 +40,64 @@ struct occ_response {
 	u16 checksum_be;
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
+	u32 error_log_start_address_be;
+	u16 error_log_length_be;
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

