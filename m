Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:49998 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751883AbdKTXyA (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 20 Nov 2017 18:54:00 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id vAKNojRS116144
        for <linux-hwmon@vger.kernel.org>; Mon, 20 Nov 2017 18:54:00 -0500
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.152])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2ec8qyrua9-1
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
        for <linux-hwmon@vger.kernel.org>; Mon, 20 Nov 2017 18:53:59 -0500
Received: from localhost
        by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-hwmon@vger.kernel.org> from <eajames@linux.vnet.ibm.com>;
        Mon, 20 Nov 2017 16:53:59 -0700
From: Eddie James <eajames@linux.vnet.ibm.com>
To: linux-kernel@vger.kernel.org
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, linux@roeck-us.net, jdelvare@suse.com,
        corbet@lwn.net, mark.rutland@arm.com, robh+dt@kernel.org,
        joel@jms.id.au, eajames@linux.vnet.ibm.com,
        "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH v3 06/12] hwmon (occ): Add command transport method for P8 and P9
Date: Mon, 20 Nov 2017 17:53:35 -0600
In-Reply-To: <1511222021-562-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1511222021-562-1-git-send-email-eajames@linux.vnet.ibm.com>
Message-Id: <1511222021-562-7-git-send-email-eajames@linux.vnet.ibm.com>
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
 drivers/hwmon/occ/p8_i2c.c | 185 ++++++++++++++++++++++++++++++++++++++++++++-
 drivers/hwmon/occ/p9_sbe.c |  95 ++++++++++++++++++++++-
 2 files changed, 278 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/occ/p8_i2c.c b/drivers/hwmon/occ/p8_i2c.c
index 025471f..8032c0b 100644
--- a/drivers/hwmon/occ/p8_i2c.c
+++ b/drivers/hwmon/occ/p8_i2c.c
@@ -9,11 +9,29 @@
 
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
@@ -21,9 +39,174 @@ struct p8_i2c_occ {
 
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
+	const long int wait_time = msecs_to_jiffies(OCC_CMD_IN_PRG_WAIT_MS);
+	struct p8_i2c_occ *p8_i2c_occ = to_p8_i2c_occ(occ);
+	struct i2c_client *client = p8_i2c_occ->client;
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
index 58c3bb2..be3a469 100644
--- a/drivers/hwmon/occ/p9_sbe.c
+++ b/drivers/hwmon/occ/p9_sbe.c
@@ -9,21 +9,102 @@
 
 #include <linux/device.h>
 #include <linux/errno.h>
+#include <linux/fsi-occ.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/spinlock.h>
 
 #include "common.h"
 
 struct p9_sbe_occ {
 	struct occ occ;
 	struct device *sbe;
+
+	/*
+	 * Pointer to occ device client. We store this so that we can cancel
+	 * the client operations in remove() if necessary. We only need one
+	 * pointer since we do one OCC operation (open, write, read, close) at
+	 * a time (access to p9_sbe_occ_send_cmd is locked in the common code
+	 * with occ.lock).
+	 */
+	struct occ_client *client;
+
+	/*
+	 * This lock controls access to the client pointer and ensures atomic
+	 * open, close and NULL assignment. This prevents simultaneous opening
+	 * and closing of the client, or closing multiple times.
+	 */
+	spinlock_t lock;
 };
 
 #define to_p9_sbe_occ(x)	container_of((x), struct p9_sbe_occ, occ)
 
+static void p9_sbe_occ_close_client(struct p9_sbe_occ *occ)
+{
+	unsigned long flags;
+	struct occ_client *tmp_client;
+
+	spin_lock_irqsave(&occ->lock, flags);
+	tmp_client = occ->client;
+	occ->client = NULL;
+	occ_drv_release(tmp_client);
+	spin_unlock_irqrestore(&occ->lock, flags);
+}
+
 static int p9_sbe_occ_send_cmd(struct occ *occ, u8 *cmd)
 {
-	return -EOPNOTSUPP;
+	int rc;
+	unsigned long flags;
+	struct occ_response *resp = &occ->resp;
+	struct p9_sbe_occ *p9_sbe_occ = to_p9_sbe_occ(occ);
+
+	spin_lock_irqsave(&p9_sbe_occ->lock, flags);
+	if (p9_sbe_occ->sbe)
+		p9_sbe_occ->client = occ_drv_open(p9_sbe_occ->sbe, 0);
+	spin_unlock_irqrestore(&p9_sbe_occ->lock, flags);
+
+	if (!p9_sbe_occ->client)
+		return -ENODEV;
+
+	/* skip first byte (sequence number), OCC driver handles it */
+	rc = occ_drv_write(p9_sbe_occ->client, (const char *)&cmd[1], 7);
+	if (rc < 0)
+		goto err;
+
+	rc = occ_drv_read(p9_sbe_occ->client, (char *)resp, sizeof(*resp));
+	if (rc < 0)
+		goto err;
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
+err:
+	p9_sbe_occ_close_client(p9_sbe_occ);
+	return rc;
 }
 
 static int p9_sbe_occ_probe(struct platform_device *pdev)
@@ -46,6 +127,17 @@ static int p9_sbe_occ_probe(struct platform_device *pdev)
 	return occ_setup(occ, "p9_occ");
 }
 
+static int p9_sbe_occ_remove(struct platform_device *pdev)
+{
+	struct occ *occ = platform_get_drvdata(pdev);
+	struct p9_sbe_occ *p9_sbe_occ = to_p9_sbe_occ(occ);
+
+	p9_sbe_occ->sbe = NULL;
+	p9_sbe_occ_close_client(p9_sbe_occ);
+
+	return 0;
+}
+
 static const struct of_device_id p9_sbe_occ_of_match[] = {
 	{ .compatible = "ibm,p9-occ-hwmon" },
 	{ },
@@ -57,6 +149,7 @@ static int p9_sbe_occ_probe(struct platform_device *pdev)
 		.of_match_table	= p9_sbe_occ_of_match,
 	},
 	.probe	= p9_sbe_occ_probe,
+	.remove = p9_sbe_occ_remove,
 };
 
 module_platform_driver(p9_sbe_occ_driver);
-- 
1.8.3.1

