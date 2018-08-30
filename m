Return-Path: <eajames@linux.vnet.ibm.com>
Return-path: <eajames@linux.vnet.ibm.com>
From: Eddie James <eajames@linux.vnet.ibm.com>
To: linux-kernel@vger.kernel.org
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, jdelvare@suse.com,
        linux-doc@vger.kernel.org, openbmc@lists.ozlabs.org,
        robh+dt@kernel.org, gregkh@linuxfoundation.org, mark.rutland@arm.com,
        linux@roeck-us.net, joel@jms.id.au, benh@kernel.crashing.org,
        Eddie James <eajames@linux.vnet.ibm.com>
Subject: [PATCH v5 06/10] hwmon (occ): Add command transport method for P8 and P9
Date: Thu, 30 Aug 2018 16:32:37 -0500
In-Reply-To: <1535664761-86018-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1535664761-86018-1-git-send-email-eajames@linux.vnet.ibm.com>
Message-Id: <1535664761-86018-7-git-send-email-eajames@linux.vnet.ibm.com>
List-ID: <linux-hwmon@vger.kernel.org>

For the P8 OCC, add the procedure to send a command to the OCC over I2C
bus. This involves writing the OCC command registers with serial
communication operations (SCOMs) interpreted by the I2C slave. For the
P9 OCC, add a procedure to use the OCC in-kernel API to send a command
to the OCC through the SBE.

Signed-off-by: Eddie James <eajames@linux.vnet.ibm.com>
---
 drivers/hwmon/occ/p8_i2c.c | 185 ++++++++++++++++++++++++++++++++++++++++++++-
 drivers/hwmon/occ/p9_sbe.c |  38 +++++++++-
 2 files changed, 221 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/occ/p8_i2c.c b/drivers/hwmon/occ/p8_i2c.c
index 85e051d..3e34579 100644
--- a/drivers/hwmon/occ/p8_i2c.c
+++ b/drivers/hwmon/occ/p8_i2c.c
@@ -2,11 +2,29 @@
 
 #include <linux/device.h>
 #include <linux/errno.h>
+#include <linux/fsi-occ.h>
 #include <linux/i2c.h>
+#include <linux/jiffies.h>
 #include <linux/module.h>
+#include <linux/sched.h>
+#include <asm/unaligned.h>
 
 #include "common.h"
 
+#define OCC_TIMEOUT_MS			1000
+#define OCC_CMD_IN_PRG_WAIT_MS		50
+
+/* OCB (on-chip control bridge - interface to OCC) registers */
+#define OCB_DATA1			0x6B035
+#define OCB_ADDR			0x6B070
+#define OCB_DATA3			0x6B075
+
+/* OCC SRAM address space */
+#define OCC_SRAM_ADDR_CMD		0xFFFF6000
+#define OCC_SRAM_ADDR_RESP		0xFFFF7000
+
+#define OCC_DATA_ATTN			0x20010000
+
 struct p8_i2c_occ {
 	struct occ occ;
 	struct i2c_client *client;
@@ -14,9 +32,174 @@ struct p8_i2c_occ {
 
 #define to_p8_i2c_occ(x)	container_of((x), struct p8_i2c_occ, occ)
 
+static int p8_i2c_occ_getscom(struct i2c_client *client, u32 address, u8 *data)
+{
+	ssize_t rc;
+	__be64 buf;
+	struct i2c_msg msgs[2];
+
+	/* p8 i2c slave requires shift */
+	address <<= 1;
+
+	msgs[0].addr = client->addr;
+	msgs[0].flags = client->flags & I2C_M_TEN;
+	msgs[0].len = sizeof(u32);
+	/* address is a scom address; bus-endian */
+	msgs[0].buf = (char *)&address;
+
+	/* data from OCC is big-endian */
+	msgs[1].addr = client->addr;
+	msgs[1].flags = (client->flags & I2C_M_TEN) | I2C_M_RD;
+	msgs[1].len = sizeof(u64);
+	msgs[1].buf = (char *)&buf;
+
+	rc = i2c_transfer(client->adapter, msgs, 2);
+	if (rc < 0)
+		return rc;
+
+	*(u64 *)data = be64_to_cpu(buf);
+
+	return 0;
+}
+
+static int p8_i2c_occ_putscom(struct i2c_client *client, u32 address, u8 *data)
+{
+	u32 buf[3];
+	ssize_t rc;
+
+	/* p8 i2c slave requires shift */
+	address <<= 1;
+
+	/* address is bus-endian; data passed through from user as-is */
+	buf[0] = address;
+	memcpy(&buf[1], &data[4], sizeof(u32));
+	memcpy(&buf[2], data, sizeof(u32));
+
+	rc = i2c_master_send(client, (const char *)buf, sizeof(buf));
+	if (rc < 0)
+		return rc;
+	else if (rc != sizeof(buf))
+		return -EIO;
+
+	return 0;
+}
+
+static int p8_i2c_occ_putscom_u32(struct i2c_client *client, u32 address,
+				  u32 data0, u32 data1)
+{
+	u8 buf[8];
+
+	memcpy(buf, &data0, 4);
+	memcpy(buf + 4, &data1, 4);
+
+	return p8_i2c_occ_putscom(client, address, buf);
+}
+
+static int p8_i2c_occ_putscom_be(struct i2c_client *client, u32 address,
+				 u8 *data)
+{
+	__be32 data0, data1;
+
+	memcpy(&data0, data, 4);
+	memcpy(&data1, data + 4, 4);
+
+	return p8_i2c_occ_putscom_u32(client, address, be32_to_cpu(data0),
+				      be32_to_cpu(data1));
+}
+
 static int p8_i2c_occ_send_cmd(struct occ *occ, u8 *cmd)
 {
-	return -EOPNOTSUPP;
+	int i, rc;
+	unsigned long start;
+	u16 data_length;
+	const unsigned long timeout = msecs_to_jiffies(OCC_TIMEOUT_MS);
+	const long wait_time = msecs_to_jiffies(OCC_CMD_IN_PRG_WAIT_MS);
+	struct p8_i2c_occ *ctx = to_p8_i2c_occ(occ);
+	struct i2c_client *client = ctx->client;
+	struct occ_response *resp = &occ->resp;
+
+	start = jiffies;
+
+	/* set sram address for command */
+	rc = p8_i2c_occ_putscom_u32(client, OCB_ADDR, OCC_SRAM_ADDR_CMD, 0);
+	if (rc)
+		return rc;
+
+	/* write command (expected to already be BE), we need bus-endian... */
+	rc = p8_i2c_occ_putscom_be(client, OCB_DATA3, cmd);
+	if (rc)
+		return rc;
+
+	/* trigger OCC attention */
+	rc = p8_i2c_occ_putscom_u32(client, OCB_DATA1, OCC_DATA_ATTN, 0);
+	if (rc)
+		return rc;
+
+	do {
+		/* set sram address for response */
+		rc = p8_i2c_occ_putscom_u32(client, OCB_ADDR,
+					    OCC_SRAM_ADDR_RESP, 0);
+		if (rc)
+			return rc;
+
+		rc = p8_i2c_occ_getscom(client, OCB_DATA3, (u8 *)resp);
+		if (rc)
+			return rc;
+
+		/* wait for OCC */
+		if (resp->return_status == OCC_RESP_CMD_IN_PRG) {
+			rc = -EALREADY;
+
+			if (time_after(jiffies, start + timeout))
+				break;
+
+			set_current_state(TASK_INTERRUPTIBLE);
+			schedule_timeout(wait_time);
+		}
+	} while (rc);
+
+	/* check the OCC response */
+	switch (resp->return_status) {
+	case OCC_RESP_CMD_IN_PRG:
+		rc = -ETIMEDOUT;
+		break;
+	case OCC_RESP_SUCCESS:
+		rc = 0;
+		break;
+	case OCC_RESP_CMD_INVAL:
+	case OCC_RESP_CMD_LEN_INVAL:
+	case OCC_RESP_DATA_INVAL:
+	case OCC_RESP_CHKSUM_ERR:
+		rc = -EINVAL;
+		break;
+	case OCC_RESP_INT_ERR:
+	case OCC_RESP_BAD_STATE:
+	case OCC_RESP_CRIT_EXCEPT:
+	case OCC_RESP_CRIT_INIT:
+	case OCC_RESP_CRIT_WATCHDOG:
+	case OCC_RESP_CRIT_OCB:
+	case OCC_RESP_CRIT_HW:
+		rc = -EREMOTEIO;
+		break;
+	default:
+		rc = -EPROTO;
+	}
+
+	if (rc < 0)
+		return rc;
+
+	data_length = get_unaligned_be16(&resp->data_length);
+	if (data_length > OCC_RESP_DATA_BYTES)
+		return -EMSGSIZE;
+
+	/* fetch the rest of the response data */
+	for (i = 8; i < data_length + 7; i += 8) {
+		rc = p8_i2c_occ_getscom(client, OCB_DATA3, ((u8 *)resp) + i);
+		if (rc)
+			return rc;
+	}
+
+	return 0;
 }
 
 static int p8_i2c_occ_probe(struct i2c_client *client,
diff --git a/drivers/hwmon/occ/p9_sbe.c b/drivers/hwmon/occ/p9_sbe.c
index b965e74..377c806 100644
--- a/drivers/hwmon/occ/p9_sbe.c
+++ b/drivers/hwmon/occ/p9_sbe.c
@@ -2,6 +2,7 @@
 
 #include <linux/device.h>
 #include <linux/errno.h>
+#include <linux/fsi-occ.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 
@@ -16,7 +17,42 @@ struct p9_sbe_occ {
 
 static int p9_sbe_occ_send_cmd(struct occ *occ, u8 *cmd)
 {
-	return -EOPNOTSUPP;
+	struct occ_response *resp = &occ->resp;
+	struct p9_sbe_occ *ctx = to_p9_sbe_occ(occ);
+	size_t resp_len = sizeof(*resp);
+	int rc;
+
+	rc = fsi_occ_submit(ctx->sbe, cmd, 8, resp, &resp_len);
+	if (rc < 0)
+		return rc;
+
+	switch (resp->return_status) {
+	case OCC_RESP_CMD_IN_PRG:
+		rc = -ETIMEDOUT;
+		break;
+	case OCC_RESP_SUCCESS:
+		rc = 0;
+		break;
+	case OCC_RESP_CMD_INVAL:
+	case OCC_RESP_CMD_LEN_INVAL:
+	case OCC_RESP_DATA_INVAL:
+	case OCC_RESP_CHKSUM_ERR:
+		rc = -EINVAL;
+		break;
+	case OCC_RESP_INT_ERR:
+	case OCC_RESP_BAD_STATE:
+	case OCC_RESP_CRIT_EXCEPT:
+	case OCC_RESP_CRIT_INIT:
+	case OCC_RESP_CRIT_WATCHDOG:
+	case OCC_RESP_CRIT_OCB:
+	case OCC_RESP_CRIT_HW:
+		rc = -EREMOTEIO;
+		break;
+	default:
+		rc = -EPROTO;
+	}
+
+	return rc;
 }
 
 static int p9_sbe_occ_probe(struct platform_device *pdev)
-- 
1.8.3.1
