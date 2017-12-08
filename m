Return-Path: <eajames@linux.vnet.ibm.com>
Return-path: <eajames@linux.vnet.ibm.com>
From: Eddie James <eajames@linux.vnet.ibm.com>
To: linux-hwmon@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux@roeck-us.net, jdelvare@suse.com,
        eajames@linux.vnet.ibm.com, joel@jms.id.au,
        "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH v2 2/2] hwmon (pmbus): cffps: Add debugfs entries
Date: Fri,  8 Dec 2017 11:42:49 -0600
In-Reply-To: <1512754969-6556-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1512754969-6556-1-git-send-email-eajames@linux.vnet.ibm.com>
Message-Id: <1512754969-6556-3-git-send-email-eajames@linux.vnet.ibm.com>
List-ID: <linux-hwmon@vger.kernel.org>

From: "Edward A. James" <eajames@us.ibm.com>

Add debugfs entries for additional power supply data, including part
number, serial number, FRU number, firmware revision, ccin, and the
input history of the power supply. The input history is 10 minutes of
input power data in the form of twenty 30-second packets. Each packet
contains average and maximum power for that 30 second period.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/hwmon/pmbus/ibm-cffps.c | 202 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 201 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/ibm-cffps.c b/drivers/hwmon/pmbus/ibm-cffps.c
index cb56da6..456f2a9 100644
--- a/drivers/hwmon/pmbus/ibm-cffps.c
+++ b/drivers/hwmon/pmbus/ibm-cffps.c
@@ -8,12 +8,26 @@
  */
 
 #include <linux/bitops.h>
+#include <linux/debugfs.h>
 #include <linux/device.h>
+#include <linux/fs.h>
 #include <linux/i2c.h>
+#include <linux/jiffies.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 
 #include "pmbus.h"
 
+#define CFFPS_FRU_CMD				0x9A
+#define CFFPS_PN_CMD				0x9B
+#define CFFPS_SN_CMD				0x9E
+#define CFFPS_CCIN_CMD				0xBD
+#define CFFPS_FW_CMD_START			0xFA
+#define CFFPS_FW_NUM_BYTES			4
+
+#define CFFPS_INPUT_HISTORY_CMD			0xD6
+#define CFFPS_INPUT_HISTORY_SIZE		100
+
 /* STATUS_MFR_SPECIFIC bits */
 #define CFFPS_MFR_FAN_FAULT			BIT(0)
 #define CFFPS_MFR_THERMAL_FAULT			BIT(1)
@@ -24,6 +38,144 @@
 #define CFFPS_MFR_VAUX_FAULT			BIT(6)
 #define CFFPS_MFR_CURRENT_SHARE_WARNING		BIT(7)
 
+enum {
+	CFFPS_DEBUGFS_INPUT_HISTORY = 0,
+	CFFPS_DEBUGFS_FRU,
+	CFFPS_DEBUGFS_PN,
+	CFFPS_DEBUGFS_SN,
+	CFFPS_DEBUGFS_CCIN,
+	CFFPS_DEBUGFS_FW,
+	CFFPS_DEBUGFS_NUM_ENTRIES
+};
+
+struct ibm_cffps_input_history {
+	struct mutex update_lock;
+	unsigned long last_update;
+
+	u8 byte_count;
+	u8 data[CFFPS_INPUT_HISTORY_SIZE];
+};
+
+struct ibm_cffps {
+	struct i2c_client *client;
+
+	struct ibm_cffps_input_history input_history;
+
+	int debugfs_entries[CFFPS_DEBUGFS_NUM_ENTRIES];
+};
+
+#define to_psu(x, y) container_of((x), struct ibm_cffps, debugfs_entries[(y)])
+
+static ssize_t ibm_cffps_read_input_history(struct ibm_cffps *psu,
+					    char __user *buf, size_t count,
+					    loff_t *ppos)
+{
+	int rc;
+	u8 msgbuf0[1] = { CFFPS_INPUT_HISTORY_CMD };
+	u8 msgbuf1[CFFPS_INPUT_HISTORY_SIZE + 1] = { 0 };
+	struct i2c_msg msg[2] = {
+		{
+			.addr = psu->client->addr,
+			.flags = psu->client->flags,
+			.len = 1,
+			.buf = msgbuf0,
+		}, {
+			.addr = psu->client->addr,
+			.flags = psu->client->flags | I2C_M_RD,
+			.len = CFFPS_INPUT_HISTORY_SIZE + 1,
+			.buf = msgbuf1,
+		},
+	};
+
+	if (!*ppos) {
+		mutex_lock(&psu->input_history.update_lock);
+		if (time_after(jiffies, psu->input_history.last_update + HZ)) {
+			/*
+			 * Use a raw i2c transfer, since we need more bytes
+			 * than Linux I2C supports through smbus xfr (only 32).
+			 */
+			rc = i2c_transfer(psu->client->adapter, msg, 2);
+			if (rc < 0) {
+				mutex_unlock(&psu->input_history.update_lock);
+				return rc;
+			}
+
+			psu->input_history.byte_count = msgbuf1[0];
+			memcpy(psu->input_history.data, &msgbuf1[1],
+			       CFFPS_INPUT_HISTORY_SIZE);
+			psu->input_history.last_update = jiffies;
+		}
+
+		mutex_unlock(&psu->input_history.update_lock);
+	}
+
+	return simple_read_from_buffer(buf, count, ppos,
+				       psu->input_history.data,
+				       psu->input_history.byte_count);
+}
+
+static ssize_t ibm_cffps_debugfs_op(struct file *file, char __user *buf,
+				    size_t count, loff_t *ppos)
+{
+	u8 cmd;
+	int i, rc;
+	int *idxp = file->private_data;
+	int idx = *idxp;
+	struct ibm_cffps *psu = to_psu(idxp, idx);
+	char data[I2C_SMBUS_BLOCK_MAX] = { 0 };
+
+	switch (idx) {
+	case CFFPS_DEBUGFS_INPUT_HISTORY:
+		return ibm_cffps_read_input_history(psu, buf, count, ppos);
+	case CFFPS_DEBUGFS_FRU:
+		cmd = CFFPS_FRU_CMD;
+		break;
+	case CFFPS_DEBUGFS_PN:
+		cmd = CFFPS_PN_CMD;
+		break;
+	case CFFPS_DEBUGFS_SN:
+		cmd = CFFPS_SN_CMD;
+		break;
+	case CFFPS_DEBUGFS_CCIN:
+		rc = i2c_smbus_read_word_data(psu->client, CFFPS_CCIN_CMD);
+		if (rc < 0)
+			return rc;
+
+		rc = snprintf(data, 5, "%04X", rc);
+		goto done;
+	case CFFPS_DEBUGFS_FW:
+		for (i = 0; i < CFFPS_FW_NUM_BYTES; ++i) {
+			rc = i2c_smbus_read_byte_data(psu->client,
+						      CFFPS_FW_CMD_START + i);
+			if (rc < 0)
+				return rc;
+
+			snprintf(&data[i * 2], 3, "%02X", rc);
+		}
+
+		rc = i * 2;
+		goto done;
+	default:
+		return -EINVAL;
+	}
+
+	rc = i2c_smbus_read_block_data(psu->client, cmd, data);
+	if (rc < 0)
+		return rc;
+
+done:
+	data[rc] = '\n';
+	rc += 2;
+
+	return simple_read_from_buffer(buf, count, ppos, data, rc);
+}
+
+static const struct file_operations ibm_cffps_fops = {
+	.llseek = noop_llseek,
+	.read = ibm_cffps_debugfs_op,
+	.open = simple_open,
+};
+
 static int ibm_cffps_read_byte_data(struct i2c_client *client, int page,
 				    int reg)
 {
@@ -119,7 +271,55 @@ static int ibm_cffps_read_word_data(struct i2c_client *client, int page,
 static int ibm_cffps_probe(struct i2c_client *client,
 			   const struct i2c_device_id *id)
 {
-	return pmbus_do_probe(client, id, &ibm_cffps_info);
+	int i, rc;
+	struct dentry *debugfs;
+	struct dentry *ibm_cffps_dir;
+	struct ibm_cffps *psu;
+
+	rc = pmbus_do_probe(client, id, &ibm_cffps_info);
+	if (rc)
+		return rc;
+
+	/* Don't fail the probe if we can't create debugfs */
+	debugfs = pmbus_get_debugfs_dir(client);
+	if (!debugfs)
+		return 0;
+
+	ibm_cffps_dir = debugfs_create_dir(client->name, debugfs);
+	if (!ibm_cffps_dir)
+		return 0;
+
+	psu = devm_kzalloc(&client->dev, sizeof(*psu), GFP_KERNEL);
+	if (!psu)
+		return 0;
+
+	psu->client = client;
+	mutex_init(&psu->input_history.update_lock);
+	psu->input_history.last_update = jiffies - HZ;
+
+	for (i = 0; i < CFFPS_DEBUGFS_NUM_ENTRIES; ++i)
+		psu->debugfs_entries[i] = i;
+
+	debugfs_create_file("input_history", 0444, ibm_cffps_dir,
+			    &psu->debugfs_entries[CFFPS_DEBUGFS_INPUT_HISTORY],
+			    &ibm_cffps_fops);
+	debugfs_create_file("fru", 0444, ibm_cffps_dir,
+			    &psu->debugfs_entries[CFFPS_DEBUGFS_FRU],
+			    &ibm_cffps_fops);
+	debugfs_create_file("part_number", 0444, ibm_cffps_dir,
+			    &psu->debugfs_entries[CFFPS_DEBUGFS_PN],
+			    &ibm_cffps_fops);
+	debugfs_create_file("serial_number", 0444, ibm_cffps_dir,
+			    &psu->debugfs_entries[CFFPS_DEBUGFS_SN],
+			    &ibm_cffps_fops);
+	debugfs_create_file("ccin", 0444, ibm_cffps_dir,
+			    &psu->debugfs_entries[CFFPS_DEBUGFS_CCIN],
+			    &ibm_cffps_fops);
+	debugfs_create_file("fw_version", 0444, ibm_cffps_dir,
+			    &psu->debugfs_entries[CFFPS_DEBUGFS_FW],
+			    &ibm_cffps_fops);
+
+	return 0;
 }
 
 static const struct i2c_device_id ibm_cffps_id[] = {
-- 
1.8.3.1
