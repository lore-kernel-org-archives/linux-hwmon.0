Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBE53C07E95
	for <linux-hwmon@archiver.kernel.org>; Wed,  7 Jul 2021 15:59:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CFB2961C33
	for <linux-hwmon@archiver.kernel.org>; Wed,  7 Jul 2021 15:59:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231933AbhGGQCV (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 7 Jul 2021 12:02:21 -0400
Received: from mail-dm6nam11on2051.outbound.protection.outlook.com ([40.107.223.51]:31808
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231931AbhGGQCV (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 7 Jul 2021 12:02:21 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZdEsh3VTNLDi9auOS8cwV3I3E6ooYsZmOFcvleQqK71pumcm3tqDo7SQR2YxXMFzQKH0ktptcQ25ki39Yifc+sC+plJ72E9LsnrI59asUWjNfbcu3Abv3eL8AOFz4Fcl0hnMPK1+JAZaCVb5yEoHSucv+uRZJx47t58jG2zGdA4+uT0bpdaluoEXo1FZPHsETRfZOFj6b3cIVw4Ew+lSALBBBFrVIeOBktOzwrqjLBTgLm3HlTlOQumtMXfx5fo+vx+nnj7K/3ctWSWBaEjmePex5yLIObLLrLn/v+eXTQitWAH1RSdVgYZtMdA8X6ugCo+trdegO2RHl+TFitrIsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xm6vC9TnwTvK68OlEeFtve1HsrgP9qaokSs0o9MO3XI=;
 b=d4rIOhWqKvhWD7bLkqbH7d3VY3/MdLv3Z91SAjPL0Tx0cRmlfsDKyiUrcLQanajgQo8x2qDTVpsUq1rsMrnmrMxR5htZkoSt1q+FJMAREg0hZmJdQOl0G56t0u8K/BsG55KOK//9n8TTokAQLcHRR07hZBryVK9OH8tLkbnbYYJPDZDSc2XTp6AF3QYaHCsUis2SA3YjFW5T7VcJKRqtKGJZrCPy45ZrDwqeecVz5rB5YbMdzIOQ7rIxc1MhG2ZN134cb4H8zuUzvzAq5G5cqmyKTU9g+vlGdpoV4exzOsXi1qylUsjmdw0+a7fw+t18S4nb6acuOtQ1DOHmY2ZmHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xm6vC9TnwTvK68OlEeFtve1HsrgP9qaokSs0o9MO3XI=;
 b=hQgv8V44mH7K3wLWm++yr+WfLDy9zwkzuIVHl4/VXG6x8PJATi5jRdEhUMIv1t0XnrtwVtlrILGIsMuDFbXIs5UrAFQ+VqlzyYjnW8D+5Q7Nlp7FUBwj0UVhk8U7DPyfHDud/Mz/hgwBHzE+EaoMPH2NSgNkcqUkQASxiEfcIrM=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5286.namprd12.prod.outlook.com (2603:10b6:208:31d::6)
 by BL1PR12MB5270.namprd12.prod.outlook.com (2603:10b6:208:31e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.21; Wed, 7 Jul
 2021 15:59:39 +0000
Received: from BL1PR12MB5286.namprd12.prod.outlook.com
 ([fe80::8ce:4339:7e20:7022]) by BL1PR12MB5286.namprd12.prod.outlook.com
 ([fe80::8ce:4339:7e20:7022%7]) with mapi id 15.20.4308.020; Wed, 7 Jul 2021
 15:59:39 +0000
From:   Naveen Krishna Chatradhi <nchatrad@amd.com>
To:     linux-hwmon@vger.kernel.org
Cc:     linux@roeck-us.net, Akshay Gupta <Akshay.Gupta@amd.com>,
        Naveen Krishna Chatradhi <nchatrad@amd.com>
Subject: [PATCH v2 1/3] hwmon: sbrmi: Add support for sbrmi power module
Date:   Wed,  7 Jul 2021 21:28:57 +0530
Message-Id: <20210707155859.86240-1-nchatrad@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210625132544.18094-1-nchatrad@amd.com>
References: <20210625132544.18094-1-nchatrad@amd.com>
Content-Type: text/plain
X-ClientProxiedBy: MA1PR01CA0139.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:35::33) To BL1PR12MB5286.namprd12.prod.outlook.com
 (2603:10b6:208:31d::6)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from milan-ETHANOL-X.amd.com (165.204.156.251) by MA1PR01CA0139.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:35::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.21 via Frontend Transport; Wed, 7 Jul 2021 15:59:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: abde3098-871c-4e89-6685-08d94160397c
X-MS-TrafficTypeDiagnostic: BL1PR12MB5270:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB5270C4A2D80F5140709105D4E81A9@BL1PR12MB5270.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qgclKQt6+iA3EpBIFuvmg+dhNT7S9ovg9kctDRouZZc7dIlP31n6z3GR6Dq5aGXVANEAE/bAtytepP3zeyq6HmbXrtFeiD3NY/mHxyvzlnADh2bmZ2G8aKOBS7ISsN3GXZSGzb9U28G0LvUfuXSjZuimZeNudxOymrvus+j7uO9NiQFaP04btH36K0OZ1sXGPl4NIXDmPAAahwibCVQftfteB3nDV5JZBja9VmcMyGcgIXYNRKcYc+4TXb7vSm88E2QMnhAO5gL/FrVFaa3qYjibLyLheBX+AJpKtrHsbhGcCnmbCrlNP0E74DCjUE6oatoBiZ1U0IBxHzV9kTFPWz+abwxGtpY8BY9sf7z42dt3ORyvKZ7jaKOZhhF4S+4QyUMwY/4I+1JN95bC6vwJ6POfMbSwfIMm7XilH2wtqvmYklq7ZZ1HvillcN5sRMs5GOe1sYdIfXYUYD/xM91a6sPsXEYTk5v2CeXrnqmLdG5B/Zn5B4a3bSVlqZHiW8ywcghgKehpdRR8ylZpAmGIuWAnRnhUeyF/0wOcXPUmPp87/B6m1os98S8b9hEr6BxPgZCuSG5kxZ4vQqqvxhpMXMa9eLDHGWWVsv4UEmRR3q4UX1mMS6eGVDbWRNxgv3YP9O87f03nlxHyiWK/uLpiQje/Ban/McxmkKLGbTu2q/LRd3fxIFgolan7sLhaM76rb4ZYlPaSSLq+hYUpBDMmFQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5286.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39860400002)(376002)(396003)(366004)(136003)(6486002)(4326008)(38350700002)(66946007)(2616005)(30864003)(66476007)(54906003)(956004)(66556008)(478600001)(38100700002)(8676002)(8936002)(52116002)(7696005)(316002)(6666004)(36756003)(26005)(6916009)(186003)(5660300002)(83380400001)(2906002)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MU5jMKxannmLNOwjWm892Z8RXlQXIVIoLq0SSr1zWKKNjoQ0XRB/J5diIebH?=
 =?us-ascii?Q?lr2Gnvkdk6Yljz8Qv9LkIn4QQE2Fy+K82FjfCBq+nsZeFhcjsnRD/hSgp2ai?=
 =?us-ascii?Q?/UD36T3qG0BGMirHuIz4ETa2aqt22DVF4m+zxIn873fEWoBjxu9I8qjo86bj?=
 =?us-ascii?Q?+nXtEnd1itWVyEe2L5P0ofBdE+KZ0iKJh76KWfhta/52pPT4tq1FETXABMMn?=
 =?us-ascii?Q?RoS2LSQEVyt7H9OTfMLwZUH9O2AakOwjyAnSok7MchhHxo7VRoidM6Hjpi3z?=
 =?us-ascii?Q?nhVMqmtUKPAT5P1zR7Vq19X1TXI02loiY+Y4VeL/4WZatSMYj0iMWtj12KSn?=
 =?us-ascii?Q?aHRCroaGmC0bXX+JXGK9PUdQheF8G2VNijOui42IUJscanhfYeofrE+doJ2N?=
 =?us-ascii?Q?hD/ygLdKemYzMVrYH+NrVVqtasPYX2oC4wzDitKdwq2XxGTyUUtpsycViCJD?=
 =?us-ascii?Q?36ZOecgJ2ozVVBsipHrafY2M6b38389Ftwy1JdZLLB02twQO1Y/iQxMp2gKS?=
 =?us-ascii?Q?zQtCWyKHF0BqBDt6ifSZAXVj4W3xAwShz45hV+sqMqLt0d4rHdrKPFR7H7KU?=
 =?us-ascii?Q?ZwBySeIm0AY7ecPfyWUhBs4N2OxOyLa3CfuB2fD4+gYHXxfqwo6SGnVbkRYG?=
 =?us-ascii?Q?Li6eJbJMdTcCnviR0dUyQR68rQeN0rahJBtrz0tNn9+hKaoXydjVY5g4FP/o?=
 =?us-ascii?Q?21zabqmkK2BVTDel4G1o7hSZqc5dQANI+4UX78QtUugpYAxbfYEoQU67EhGF?=
 =?us-ascii?Q?kE113/CWt6TpHjnNf1WtQufeCZ3/D334INRhhDUJAvubK9oCoYtNgAoN4T4O?=
 =?us-ascii?Q?MU42OY8M1P7fF/JpTEKeDSqOa3vUYheR1Rl6JPZz9jFaGrx+lCKZY8IkBJGU?=
 =?us-ascii?Q?VLj573xmHW+rVARs2kyRgvgthR6svFTS2dyNk4MsC2T9hhBS2xXvI+2Gp9dJ?=
 =?us-ascii?Q?PLUnhF8RCQZpFVCp5om23sHW9dem5ayJ5YFpKc+eMYHUR5cVlJZN/k5lX9Yx?=
 =?us-ascii?Q?R/DhDeUdrq1VwkaSpfUr4pM1fQ4sDQEoj2FO2LX0hwWKRWYrxe5GYridD1E9?=
 =?us-ascii?Q?2qK4gTxcIi3OELVvrek59RBOJNn/iVCOsbDXmS7Dr1LYMnfBZ5BI0Rff3T8A?=
 =?us-ascii?Q?dRncM6f39hcKw8keP6Dja787TwWviuWxaWmOMqqyMKlgazf5FvohrazK2oVI?=
 =?us-ascii?Q?ePpWIRQ5xOvIMMmF/tsoG3+6aJmsoqRoe17TaWcHApQGzQLg3Tih3YqcWpWA?=
 =?us-ascii?Q?F0648jD5VQgWgU9Th3iLmFrlHoDtLbtSKSdiyXQzb50K7PCpyJlSh6B59Hvq?=
 =?us-ascii?Q?EBUJuJ1qUMva3diBXbZyYvj4?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abde3098-871c-4e89-6685-08d94160397c
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5286.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2021 15:59:38.9015
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 08+1TEx4Y9LbLJoP+G4HcFSlisRcyDfsNCQxlxpm8kFR9YvwG4QuSFSQJE/n31lYlg9407ycmIAMwzLdVzPizw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5270
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Akshay Gupta <Akshay.Gupta@amd.com>

On AMD platforms the Out-of-band access is provided by
Advanced Platform Management Link (APML), APML is a
SMBus v2.0 compatible 2-wire processor client interface.
APML is also referred as the sideband interface (SBI).

APML is used to communicate with the
Side-Band Remote Management Interface (SB-RMI) which provides
Soft Mailbox messages to manage power consumption and
power limits of the CPU socket.

- This module add support to read power consumption,
  power limit & max power limit and write power limit.
- To instantiate this driver on a Board Management Controller (BMC)
  connected to an AMD CPU with SB-RMI support, the i2c bus number
  would be the bus connected from the BMC to the CPU.

Signed-off-by: Akshay Gupta <Akshay.Gupta@amd.com>
Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
---

Changes since v1:
1. remove header file and move in alphabetical order
2. make all comments multiline
3. remove the pr_err, needed for debugging only
4. fix #define tab issue
5. uninitailize err,
  - correct spelling & remove extra ()
  - remove extra i2c functionality check
6. reduce call to data->client
7. remove usage of union

 drivers/hwmon/Kconfig  |  10 ++
 drivers/hwmon/Makefile |   1 +
 drivers/hwmon/sbrmi.c  | 341 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 352 insertions(+)
 create mode 100644 drivers/hwmon/sbrmi.c

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 87624902ea80..f489972a6309 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1551,6 +1551,16 @@ config SENSORS_SBTSI
 	  This driver can also be built as a module. If so, the module will
 	  be called sbtsi_temp.
 
+config SENSORS_SBRMI
+	tristate "Emulated SB-RMI sensor"
+	depends on I2C
+	help
+	  If you say yes here you get support for emulated RMI
+	  sensors on AMD SoCs with APML interface connected to a BMC device.
+
+	  This driver can also be built as a module. If so, the module will
+	  be called sbrmi.
+
 config SENSORS_SHT15
 	tristate "Sensiron humidity and temperature sensors. SHT15 and compat."
 	depends on GPIOLIB || COMPILE_TEST
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index 59e78bc212cf..8031acf58936 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -164,6 +164,7 @@ obj-$(CONFIG_SENSORS_PWM_FAN)	+= pwm-fan.o
 obj-$(CONFIG_SENSORS_RASPBERRYPI_HWMON)	+= raspberrypi-hwmon.o
 obj-$(CONFIG_SENSORS_S3C)	+= s3c-hwmon.o
 obj-$(CONFIG_SENSORS_SBTSI)	+= sbtsi_temp.o
+obj-$(CONFIG_SENSORS_SBRMI)	+= sbrmi.o
 obj-$(CONFIG_SENSORS_SCH56XX_COMMON)+= sch56xx-common.o
 obj-$(CONFIG_SENSORS_SCH5627)	+= sch5627.o
 obj-$(CONFIG_SENSORS_SCH5636)	+= sch5636.o
diff --git a/drivers/hwmon/sbrmi.c b/drivers/hwmon/sbrmi.c
new file mode 100644
index 000000000000..10622b1f23f2
--- /dev/null
+++ b/drivers/hwmon/sbrmi.c
@@ -0,0 +1,341 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * sbrmi.c - hwmon driver for a SB-RMI mailbox
+ *           compliant AMD SoC device.
+ *
+ * Copyright (C) 2020-2021 Advanced Micro Devices, Inc.
+ */
+
+#include <linux/delay.h>
+#include <linux/err.h>
+#include <linux/hwmon.h>
+#include <linux/i2c.h>
+#include <linux/init.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/of.h>
+
+/* Do not allow setting negative power limit */
+#define SBRMI_PWR_MIN	0
+/* Mask for Status Register bit[1] */
+#define SW_ALERT_MASK	0x2
+
+/* Software Interrupt for triggering */
+#define START_CMD	0x80
+#define TRIGGER_MAILBOX	0x01
+
+/*
+ * SB-RMI supports soft mailbox service request to MP1 (power management
+ * firmware) through SBRMI inbound/outbound message registers.
+ * SB-RMI message IDs
+ */
+enum sbrmi_msg_id {
+	SBRMI_READ_PKG_PWR_CONSUMPTION = 0x1,
+	SBRMI_WRITE_PKG_PWR_LIMIT,
+	SBRMI_READ_PKG_PWR_LIMIT,
+	SBRMI_READ_PKG_MAX_PWR_LIMIT,
+};
+
+/* SB-RMI registers */
+enum sbrmi_reg {
+	SBRMI_CTRL		= 0x01,
+	SBRMI_STATUS,
+	SBRMI_OUTBNDMSG0	= 0x30,
+	SBRMI_OUTBNDMSG1,
+	SBRMI_OUTBNDMSG2,
+	SBRMI_OUTBNDMSG3,
+	SBRMI_OUTBNDMSG4,
+	SBRMI_OUTBNDMSG5,
+	SBRMI_OUTBNDMSG6,
+	SBRMI_OUTBNDMSG7,
+	SBRMI_INBNDMSG0,
+	SBRMI_INBNDMSG1,
+	SBRMI_INBNDMSG2,
+	SBRMI_INBNDMSG3,
+	SBRMI_INBNDMSG4,
+	SBRMI_INBNDMSG5,
+	SBRMI_INBNDMSG6,
+	SBRMI_INBNDMSG7,
+	SBRMI_SW_INTERRUPT,
+};
+
+/* Each client has this additional data */
+struct sbrmi_data {
+	struct i2c_client *client;
+	struct mutex lock;
+};
+
+struct sbrmi_mailbox_msg {
+	u8 cmd;
+	bool read;
+	u32 data_in;
+	u32 data_out;
+};
+
+static int sbrmi_enable_alert(struct i2c_client *client)
+{
+	int ctrl;
+
+	/*
+	 * Enable the SB-RMI Software alert status
+	 * by writing 0 to bit 4 of Control register(0x1)
+	 */
+	ctrl = i2c_smbus_read_byte_data(client, SBRMI_CTRL);
+	if (ctrl < 0)
+		return ctrl;
+
+	if (ctrl & 0x10) {
+		ctrl &= ~0x10;
+		return i2c_smbus_write_byte_data(client,
+						 SBRMI_CTRL, ctrl);
+	}
+
+	return 0;
+}
+
+static int rmi_mailbox_xfer(struct sbrmi_data *data,
+			    struct sbrmi_mailbox_msg *msg)
+{
+	int i, ret, retry = 10;
+	int sw_status;
+	u8 byte;
+
+	mutex_lock(&data->lock);
+
+	ret = sbrmi_enable_alert(data->client);
+	if (ret < 0)
+		goto exit_unlock;
+
+	/* Indicate firmware a command is to be serviced */
+	ret = i2c_smbus_write_byte_data(data->client,
+					SBRMI_INBNDMSG7, START_CMD);
+	if (ret < 0)
+		goto exit_unlock;
+
+	/* Write the command to SBRMI::InBndMsg_inst0 */
+	ret = i2c_smbus_write_byte_data(data->client,
+					SBRMI_INBNDMSG0, msg->cmd);
+	if (ret < 0)
+		goto exit_unlock;
+
+	/*
+	 * For both read and write the initiator (BMC) writes
+	 * Command Data In[31:0] to SBRMI::InBndMsg_inst[4:1]
+	 * SBRMI_x3C(MSB):SBRMI_x39(LSB)
+	 */
+	for (i = 0; i < 4; i++) {
+		byte = (msg->data_in >> i * 8) & 0xff;
+		ret = i2c_smbus_write_byte_data(data->client,
+						SBRMI_INBNDMSG1 + i, byte);
+		if (ret < 0)
+			goto exit_unlock;
+	}
+
+	/*
+	 * Write 0x01 to SBRMI::SoftwareInterrupt to notify firmware to
+	 * perform the requested read or write command
+	 */
+	ret = i2c_smbus_write_byte_data(data->client,
+					SBRMI_SW_INTERRUPT, TRIGGER_MAILBOX);
+	if (ret < 0)
+		goto exit_unlock;
+
+	/*
+	 * Firmware will write SBRMI::Status[SwAlertSts]=1 to generate
+	 * an ALERT (if enabled) to initiator (BMC) to indicate completion
+	 * of the requested command
+	 */
+	do {
+		sw_status = i2c_smbus_read_byte_data(data->client,
+						     SBRMI_STATUS);
+		if (sw_status < 0) {
+			ret = sw_status;
+			goto exit_unlock;
+		}
+		if (sw_status & SW_ALERT_MASK)
+			break;
+		usleep_range(50, 100);
+	} while (retry--);
+
+	if (retry < 0) {
+		pr_err("Firmware fail to indicate command completion\n");
+		ret = -1;
+		goto exit_unlock;
+	}
+
+	/*
+	 * For a read operation, the initiator (BMC) reads the firmware
+	 * response Command Data Out[31:0] from SBRMI::OutBndMsg_inst[4:1]
+	 * {SBRMI_x34(MSB):SBRMI_x31(LSB)}.
+	 */
+	if (msg->read) {
+		for (i = 0; i < 4; i++) {
+			ret = i2c_smbus_read_byte_data(data->client,
+						       SBRMI_OUTBNDMSG1 + i);
+			if (ret < 0)
+				goto exit_unlock;
+			msg->data_out |= (ret & 0xff) << i * 8;
+		}
+	}
+
+	/*
+	 * BMC must write 1'b1 to SBRMI::Status[SwAlertSts] to clear the
+	 * ALERT to initiator
+	 */
+	ret = i2c_smbus_write_byte_data(data->client, SBRMI_STATUS,
+					sw_status | SW_ALERT_MASK);
+
+exit_unlock:
+	if (ret < 0)
+		pr_err("SMBUS translation failed\n");
+
+	mutex_unlock(&data->lock);
+	return ret;
+}
+
+static int sbrmi_read(struct device *dev, enum hwmon_sensor_types type,
+		      u32 attr, int channel, long *val)
+{
+	struct sbrmi_data *data = dev_get_drvdata(dev);
+	struct sbrmi_mailbox_msg msg = { 0 };
+	int ret;
+
+	if (type != hwmon_power)
+		return -EINVAL;
+
+	msg.read = true;
+	switch (attr) {
+	case hwmon_power_input:
+		msg.cmd = SBRMI_READ_PKG_PWR_CONSUMPTION;
+		ret = rmi_mailbox_xfer(data, &msg);
+		break;
+	case hwmon_power_cap:
+		msg.cmd = SBRMI_READ_PKG_PWR_LIMIT;
+		ret = rmi_mailbox_xfer(data, &msg);
+		break;
+	case hwmon_power_cap_max:
+		msg.cmd = SBRMI_READ_PKG_MAX_PWR_LIMIT;
+		ret = rmi_mailbox_xfer(data, &msg);
+		break;
+	default:
+		return -EINVAL;
+	}
+	/* hwmon power attributes are in microWatt */
+	*val = (long)msg.data_out * 1000;
+	return ret;
+}
+
+static int sbrmi_write(struct device *dev, enum hwmon_sensor_types type,
+		       u32 attr, int channel, long val)
+{
+	struct sbrmi_data *data = dev_get_drvdata(dev);
+	struct sbrmi_mailbox_msg msg = { 0 };
+
+	if (type != hwmon_power && attr != hwmon_power_cap)
+		return -EINVAL;
+	/*
+	 * hwmon power attributes are in microWatt
+	 * mailbox read/write is in mWatt
+	 */
+	val /= 1000;
+
+	msg.cmd = SBRMI_READ_PKG_MAX_PWR_LIMIT;
+	msg.data_in = 0;
+	msg.read = true;
+	rmi_mailbox_xfer(data, &msg);
+
+	val = clamp_val(val, SBRMI_PWR_MIN, msg.data_out);
+
+	msg.cmd = SBRMI_WRITE_PKG_PWR_LIMIT;
+	msg.data_in = val;
+	msg.read = false;
+
+	return rmi_mailbox_xfer(data, &msg);
+}
+
+static umode_t sbrmi_is_visible(const void *data,
+				enum hwmon_sensor_types type,
+				u32 attr, int channel)
+{
+	switch (type) {
+	case hwmon_power:
+		switch (attr) {
+		case hwmon_power_input:
+		case hwmon_power_cap_max:
+			return 0444;
+		case hwmon_power_cap:
+			return 0644;
+		}
+		break;
+	default:
+		break;
+	}
+	return 0;
+}
+
+static const struct hwmon_channel_info *sbrmi_info[] = {
+	HWMON_CHANNEL_INFO(power,
+			   HWMON_P_INPUT | HWMON_P_CAP | HWMON_P_CAP_MAX),
+	NULL
+};
+
+static const struct hwmon_ops sbrmi_hwmon_ops = {
+	.is_visible = sbrmi_is_visible,
+	.read = sbrmi_read,
+	.write = sbrmi_write,
+};
+
+static const struct hwmon_chip_info sbrmi_chip_info = {
+	.ops = &sbrmi_hwmon_ops,
+	.info = sbrmi_info,
+};
+
+static int sbrmi_probe(struct i2c_client *client,
+		       const struct i2c_device_id *id)
+{
+	struct device *dev = &client->dev;
+	struct device *hwmon_dev;
+	struct sbrmi_data *data;
+
+	data = devm_kzalloc(dev, sizeof(struct sbrmi_data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->client = client;
+	mutex_init(&data->lock);
+
+	hwmon_dev = devm_hwmon_device_register_with_info(dev, client->name, data,
+							 &sbrmi_chip_info, NULL);
+
+	return PTR_ERR_OR_ZERO(hwmon_dev);
+}
+
+static const struct i2c_device_id sbrmi_id[] = {
+	{"sbrmi", 0},
+	{}
+};
+MODULE_DEVICE_TABLE(i2c, sbrmi_id);
+
+static const struct of_device_id __maybe_unused sbrmi_of_match[] = {
+	{
+		.compatible = "amd,sbrmi",
+	},
+	{ },
+};
+MODULE_DEVICE_TABLE(of, sbrmi_of_match);
+
+static struct i2c_driver sbrmi_driver = {
+	.class = I2C_CLASS_HWMON,
+	.driver = {
+		.name = "sbrmi",
+		.of_match_table = of_match_ptr(sbrmi_of_match),
+	},
+	.probe = sbrmi_probe,
+	.id_table = sbrmi_id,
+};
+
+module_i2c_driver(sbrmi_driver);
+
+MODULE_AUTHOR("Akshay Gupta <akshay.gupta@amd.com>");
+MODULE_DESCRIPTION("Hwmon driver for AMD SB-RMI emulated sensor");
+MODULE_LICENSE("GPL");
-- 
2.17.1

