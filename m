Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:34247 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1753991AbdFVWsu (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 22 Jun 2017 18:48:50 -0400
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id v5MMhm0s067596
        for <linux-hwmon@vger.kernel.org>; Thu, 22 Jun 2017 18:48:50 -0400
Received: from e35.co.us.ibm.com (e35.co.us.ibm.com [32.97.110.153])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2b8mcb5wa9-1
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
        for <linux-hwmon@vger.kernel.org>; Thu, 22 Jun 2017 18:48:49 -0400
Received: from localhost
        by e35.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-hwmon@vger.kernel.org> from <eajames@linux.vnet.ibm.com>;
        Thu, 22 Jun 2017 16:48:48 -0600
From: Eddie James <eajames@linux.vnet.ibm.com>
To: linux-kernel@vger.kernel.org
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux@roeck-us.net, jdelvare@suse.com, mark.rutland@arm.com,
        robh+dt@kernel.org, gregkh@linuxfoundation.org,
        cbostic@linux.vnet.ibm.com, jk@ozlabs.org, joel@jms.id.au,
        andrew@aj.id.au, eajames@linux.vnet.ibm.com,
        "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH 2/7] drivers/hwmon/occ: Add command transport method for P8 and P9
Date: Thu, 22 Jun 2017 17:48:31 -0500
In-Reply-To: <1498171716-26620-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1498171716-26620-1-git-send-email-eajames@linux.vnet.ibm.com>
Message-Id: <1498171716-26620-3-git-send-email-eajames@linux.vnet.ibm.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

From: "Edward A. James" <eajames@us.ibm.com>

For the P8 OCC, add the procedure to send a command to the OCC over I2C
bus. This involves writing the OCC command registers with serial
communication operations (SCOMs) interpreted by the I2C slave. For the
P9 OCC, add a procedure to use the OCC in-kernel API to send a command
to the OCC through the SBE engine.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/hwmon/occ/common.h |  13 ++++
 drivers/hwmon/occ/p8_i2c.c | 166 ++++++++++++++++++++++++++++++++++++++++++++-
 drivers/hwmon/occ/p9_sbe.c |  66 +++++++++++++++++-
 3 files changed, 243 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/occ/common.h b/drivers/hwmon/occ/common.h
index dca642a..0c3f26f 100644
--- a/drivers/hwmon/occ/common.h
+++ b/drivers/hwmon/occ/common.h
@@ -15,6 +15,19 @@
 
 #define OCC_RESP_DATA_BYTES		4089
 
+#define OCC_TIMEOUT_MS			5000
+#define OCC_CMD_IN_PRG_MS		100
+
+/* OCC return codes */
+#define RESP_RETURN_CMD_IN_PRG		0xFF
+#define RESP_RETURN_SUCCESS		0
+#define RESP_RETURN_CMD_INVAL		0x11
+#define RESP_RETURN_CMD_LEN		0x12
+#define RESP_RETURN_DATA_INVAL		0x13
+#define RESP_RETURN_CHKSUM		0x14
+#define RESP_RETURN_OCC_ERR		0x15
+#define RESP_RETURN_STATE		0x16
+
 /* Same response format for all OCC versions.
  * Allocate the largest possible response.
  */
diff --git a/drivers/hwmon/occ/p8_i2c.c b/drivers/hwmon/occ/p8_i2c.c
index 5075146..d6d70ce 100644
--- a/drivers/hwmon/occ/p8_i2c.c
+++ b/drivers/hwmon/occ/p8_i2c.c
@@ -7,6 +7,7 @@
  * (at your option) any later version.
  */
 
+#include <asm/unaligned.h>
 #include "common.h"
 #include <linux/i2c.h>
 #include <linux/init.h>
@@ -19,9 +20,172 @@ struct p8_i2c_occ {
 
 #define to_p8_i2c_occ(x)	container_of((x), struct p8_i2c_occ, occ)
 
+static int p8_i2c_occ_getscom(struct i2c_client *client, u32 address, u8 *data)
+{
+	ssize_t rc;
+	__be64 buf_be;
+	u64 buf;
+	struct i2c_msg msgs[2];
+
+	/* p8 i2c slave requires shift */
+	address <<= 1;
+
+	msgs[0].addr = client->addr;
+	msgs[0].flags = client->flags & I2C_M_TEN;
+	msgs[0].len = sizeof(u32);
+	msgs[0].buf = (char *)&address;
+
+
+	msgs[1].addr = client->addr;
+	msgs[1].flags = (client->flags & I2C_M_TEN) | I2C_M_RD;
+	msgs[1].len = sizeof(u64);
+	msgs[1].buf = (char *)&buf_be;
+
+	rc = i2c_transfer(client->adapter, msgs, 2);
+	if (rc < 0)
+		return rc;
+
+	buf = be64_to_cpu(buf_be);
+	memcpy(data, &buf, sizeof(u64));
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
+	struct p8_i2c_occ *p8_i2c_occ = to_p8_i2c_occ(occ);
+	struct i2c_client *client = p8_i2c_occ->client;
+	struct occ_response *resp = &occ->resp;
+
+	start = jiffies;
+
+	/* set sram address for command */
+	rc = p8_i2c_occ_putscom_u32(client, 0x6B070, 0xFFFF6000, 0);
+	if (rc)
+		goto err;
+
+	/* write command (must already be BE), i2c expects cpu-endian */
+	rc = p8_i2c_occ_putscom_be(client, 0x6B075, cmd);
+	if (rc)
+		goto err;
+
+	/* trigger OCC attention */
+	rc = p8_i2c_occ_putscom_u32(client, 0x6B035, 0x20010000, 0);
+	if (rc)
+		goto err;
+
+retry:
+	/* set sram address for response */
+	rc = p8_i2c_occ_putscom_u32(client, 0x6B070, 0xFFFF7000, 0);
+	if (rc)
+		goto err;
+
+	/* read response */
+	rc = p8_i2c_occ_getscom(client, 0x6B075, (u8 *)resp);
+	if (rc)
+		goto err;
+
+	/* check the OCC response */
+	switch (resp->return_status) {
+	case RESP_RETURN_CMD_IN_PRG:
+		if (time_after(jiffies,
+			       start + msecs_to_jiffies(OCC_TIMEOUT_MS)))
+			rc = -EALREADY;
+		else {
+			set_current_state(TASK_INTERRUPTIBLE);
+			schedule_timeout(msecs_to_jiffies(OCC_CMD_IN_PRG_MS));
+
+			goto retry;
+		}
+		break;
+	case RESP_RETURN_SUCCESS:
+		rc = 0;
+		break;
+	case RESP_RETURN_CMD_INVAL:
+	case RESP_RETURN_CMD_LEN:
+	case RESP_RETURN_DATA_INVAL:
+	case RESP_RETURN_CHKSUM:
+		rc = -EINVAL;
+		break;
+	case RESP_RETURN_OCC_ERR:
+		rc = -EREMOTE;
+		break;
+	default:
+		rc = -EFAULT;
+	}
+
+	if (rc < 0) {
+		dev_warn(&client->dev, "occ bad response: %d\n",
+			 resp->return_status);
+		return rc;
+	}
+
+	data_length = get_unaligned_be16(&resp->data_length_be);
+	if (data_length > OCC_RESP_DATA_BYTES) {
+		dev_warn(&client->dev, "occ bad data length: %d\n",
+			 data_length);
+		return -EDOM;
+	}
+
+	/* read remaining response */
+	for (i = 8; i < data_length + 7; i += 8) {
+		rc = p8_i2c_occ_getscom(client, 0x6B075, ((u8 *)resp) + i);
+		if (rc)
+			goto err;
+	}
+
+	return data_length + 7;
+
+err:
+	dev_err(&client->dev, "i2c scom op failed rc: %d\n", rc);
+	return rc;
 }
 
 static int p8_i2c_occ_probe(struct i2c_client *client,
diff --git a/drivers/hwmon/occ/p9_sbe.c b/drivers/hwmon/occ/p9_sbe.c
index 0cef428..981c53f 100644
--- a/drivers/hwmon/occ/p9_sbe.c
+++ b/drivers/hwmon/occ/p9_sbe.c
@@ -22,7 +22,71 @@ struct p9_sbe_occ {
 
 static int p9_sbe_occ_send_cmd(struct occ *occ, u8 *cmd)
 {
-	return -EOPNOTSUPP;
+	int rc;
+	unsigned long start;
+	struct occ_client *client;
+	struct occ_response *resp = &occ->resp;
+	struct p9_sbe_occ *p9_sbe_occ = to_p9_sbe_occ(occ);
+
+	start = jiffies;
+
+retry:
+	client = occ_drv_open(p9_sbe_occ->sbe, 0);
+	if (!client)
+		return -ENODEV;
+
+	/* skip first byte (sequence number), OCC driver handles it */
+	rc = occ_drv_write(client, (const char *)&cmd[1], 7);
+	if (rc < 0)
+		goto err;
+
+	rc = occ_drv_read(client, (char *)resp, sizeof(*resp));
+	if (rc < 0)
+		goto err;
+
+	occ_drv_release(client);
+
+	/* check the OCC response */
+	switch (resp->return_status) {
+	case RESP_RETURN_CMD_IN_PRG:
+		if (time_after(jiffies,
+			       start + msecs_to_jiffies(OCC_TIMEOUT_MS)))
+			rc = -EALREADY;
+		else {
+			set_current_state(TASK_INTERRUPTIBLE);
+			schedule_timeout(msecs_to_jiffies(OCC_CMD_IN_PRG_MS));
+
+			goto retry;
+		}
+		break;
+	case RESP_RETURN_SUCCESS:
+		rc = 0;
+		break;
+	case RESP_RETURN_CMD_INVAL:
+	case RESP_RETURN_CMD_LEN:
+	case RESP_RETURN_DATA_INVAL:
+	case RESP_RETURN_CHKSUM:
+		rc = -EINVAL;
+		break;
+	case RESP_RETURN_OCC_ERR:
+		rc = -EREMOTE;
+		break;
+	default:
+		rc = -EFAULT;
+	}
+
+	if (rc < 0) {
+		dev_warn(occ->bus_dev, "occ bad response: %d\n",
+			 resp->return_status);
+		return rc;
+	}
+
+	return 0;
+
+err:
+	occ_drv_release(client);
+	dev_err(occ->bus_dev, "occ bus op failed rc: %d\n", rc);
+	return rc;
 }
 
 static int p9_sbe_occ_probe(struct platform_device *pdev)
-- 
1.8.3.1

