Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2076.outbound.protection.outlook.com [40.107.102.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 725761779BB
	for <linux-hwmon@vger.kernel.org>; Thu, 30 May 2024 11:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717068228; cv=fail; b=bT4KTpdDS0gSV/EMC7bjfWJps0/K5U0ERuJd0EE3Ykelv5U0ZWQRLeWNN1DEVMjJCrdTDzYLYYhSKUZDoPAKhG+HJb4KijDbOO7BGbzWVanhje0kPE18Dn490/vzYaXzhXJ40FoJGvmE0F7h3utI9e/H6cYq6qXw+NuB9kAdfUk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717068228; c=relaxed/simple;
	bh=IooU7YoL5cxijcSe2md9Zzt9oHmKjtBJyfcCr5GjoVk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lmWAdZLYpc9R0yEAeaRcp6ahMBxWHYaaV48bKH2d93eJUFXD308QMp0s34sxqxtuqzpTsKOI+9M+S2YSdBhL8nlVCBeuxC4P6qJnwhermt1qSGHBujBmG2yesQm1kysHJ1j2jMMmCf6c1aEnMEFRaMcZwpxNEZibIkl3rBYqeDI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=mhMqQimi; arc=fail smtp.client-ip=40.107.102.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="mhMqQimi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ACQ929V3irYsF5Je8LQo0EuFjN49kjFpVsKzfyYIU1/fv9PPBDfy326pg7XXrB26X+pu/NOmeWDDD+pHSDPTA/gC4S0wtGq0o84CFSTtUSn8FE6nmTmItVkTwVbNdJi0K6vcT9JnKW0HCv3pEeeSOWB2+sp32Abp6bngzEeKe3EUFhX6UE5YSZCD+QGSxmXNfYD/Si8S2+2JI40P2PzbbijZUqdp0UAMCnTrk103rKRr5cNpN5ORZUXRJP8CKY4/Vx5Pv8R7sUrlm8n2ZXz7RiKnNEizudZZdL74EvXvrJqgBpLVZy4XuNJQ8S1BC/yFi5qdhX9ruTdmfi/GXPLqRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0KvS8Bsr2ExYANgm33fkcQdR7hTBBMKnk0fOhUBj7+0=;
 b=BMI2BXMySOQoV9mcJNmh1Us+LlELRnZZcNJqU/G8ZCRtBkTGpdXUKhdsEg3mDbIQAatWLScL4i+tV5R1QZXeFqJey2DUg3NJgGG/OzP8n1wa7SLBWX/3oJW4aDgZ/UAV59lSLxhYprRAh9I9OLf4k5skRroRNmON4v8nNHF/iQKfcU+IBTlBlLmlu6mHT1+2FXuPHgKtxgwj5zM+t3fYpBSWp5xzAZvTmCfR6BNIQs8AvTH9tUAO2l9K0UNho3XtoAKp0kr4HpyxJntYTt1kT/QuQ8kqOP8N4gF3jJmIJXqK/Vn4C0BcezKoxwEv+ftrDRRlxOfIrCP1VGrSdWd9Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0KvS8Bsr2ExYANgm33fkcQdR7hTBBMKnk0fOhUBj7+0=;
 b=mhMqQimigGju5VXKYhGtcJBGG7+o615w69CZFHb877cOTL+kn2Xd1SmK7N8U3PPioo7yWm/L0X8gL7VKYf1zXDpt2U/9xAcJGAqOtYhOjm8OJlNqbvorw8fpDiGblxU0VeX9FdrTbsceB5HMZIAOrzZ/sVBhqM8XtVrYCJwsfoM=
Received: from BN9P222CA0001.NAMP222.PROD.OUTLOOK.COM (2603:10b6:408:10c::6)
 by BY5PR12MB4257.namprd12.prod.outlook.com (2603:10b6:a03:20f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.21; Thu, 30 May
 2024 11:23:43 +0000
Received: from BL6PEPF0001AB76.namprd02.prod.outlook.com
 (2603:10b6:408:10c:cafe::3a) by BN9P222CA0001.outlook.office365.com
 (2603:10b6:408:10c::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.21 via Frontend
 Transport; Thu, 30 May 2024 11:23:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB76.mail.protection.outlook.com (10.167.242.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7633.15 via Frontend Transport; Thu, 30 May 2024 11:23:42 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 30 May
 2024 06:23:39 -0500
From: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
To: <linux-hwmon@vger.kernel.org>, <inux-kernel@vger.kernel.org>
CC: <linux@roeck-us.net>, <lee@kernel.org>, <gregkh@linuxfoundation.org>,
	<arnd@arndb.de>, Akshay Gupta <akshay.gupta@amd.com>, Akshay Gupta
	<Akshay.Gupta@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [PATCH 4/5] mfd: sbrmi: Clear sbrmi status register bit SwAlertSts
Date: Thu, 30 May 2024 11:23:06 +0000
Message-ID: <20240530112307.3089696-5-naveenkrishna.chatradhi@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240530112307.3089696-1-naveenkrishna.chatradhi@amd.com>
References: <20240530112307.3089696-1-naveenkrishna.chatradhi@amd.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB76:EE_|BY5PR12MB4257:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a7d236b-1912-47ab-6024-08dc809af65e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|82310400017|36860700004|376005|1800799015;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CKNIrbtQUttyhJibDOwQ2m7sVqCBW+yPXVxthEwT5mJ+H/tH/FEpxqO76ROB?=
 =?us-ascii?Q?U4i9wTCH4V+RQXLAmWJJwrNa8RuH9dg4DGXhew+WP/iNUYyu8SLVqPaBkaIl?=
 =?us-ascii?Q?MDanSapCWj/LMviT2KbA+kfUf8RvUJhzznzra1dNc628Rkz1ivn2OKYTke+4?=
 =?us-ascii?Q?FLJx+TJfzcxK4Y7N/jQUeye8+S9IiaJV9ro3Ie3g1iQnJeO6HxQjJ5QSzB/a?=
 =?us-ascii?Q?hYND+f4PEAz0FfVabmbgyb013+BeyZ57Ory49qr1qDwZ/oMxvUMBXcaUcAjh?=
 =?us-ascii?Q?rGWiJCHyfZX+uxD/kJwiNQx7cN1uDcZcCaSk2gcltabrDuWzULJ4XGltzl3z?=
 =?us-ascii?Q?k3st9gSTjeW0kC3/hhcgmBxJbr61llNeR4NwQm9zyrW74XqKIQKI9fHWk+hM?=
 =?us-ascii?Q?5Dm2WKubX09QmmQjo6H24gSGkaCIxBU/+5AasF83+N/Sum+106Wobe2ASohB?=
 =?us-ascii?Q?zPNtqRAfalG6LIzmgTq8kXbn5MFGZ3ZQWMMEo2pXntl3TG6r0H6VvjdW5NIi?=
 =?us-ascii?Q?Znywql33wO8+MyPHPPTBoNsr0EbJjUsA1GRtzPFeiQJ4lGtXxDIQYJqVDwou?=
 =?us-ascii?Q?Ws9RjM6V4udU4UKWO4C4umDFGPndH2ZhzuBRgAk8OEIggTs9hsSkNlwwnshD?=
 =?us-ascii?Q?rPxCFoAd29+wZs2O+3NlzwlHDlRBV8ZsrqIHm7jnxFdul9sKYj7yS+267U0N?=
 =?us-ascii?Q?M6S8czUHzWSyJVF/v8/8llMbt9BoNBkTZfTnhzCr+sEHZmQwmznWaxXpk/r1?=
 =?us-ascii?Q?I7+H4S0pZ4IP2VpQv7hWS1vvVo5jSYLsKJScrt5lNPsEfpl6RQoyfRK+C7sw?=
 =?us-ascii?Q?tlsOZRuv9m3pkxOPJPAezRe1QYJWPXwYfJEaBIFoiBtU2XopXb4eBEYpp9M2?=
 =?us-ascii?Q?URrR0MaN7ZqQqRdJ+O05xaRcX3LSxl16dR204bXai4Mq5F0BfSoO+mdZt2NG?=
 =?us-ascii?Q?zXjy0p5lOcbc4H0o/Tp1bpcPOux6dYgvxlpe1P58HUO19Po3SZg2pMSTGuUY?=
 =?us-ascii?Q?h5sN/+qQ3m/v07P7vgvvZSEcj+fEl/6JUU+VUzdSDHoBKndG3ot3mLn9FSbG?=
 =?us-ascii?Q?wm23Q5jhHVTGeEaoP8V81llQVBCHzTYj2qvCU0gSLUWe/dQGRD7fKNBMpRn6?=
 =?us-ascii?Q?Fpxnvxq9rXWRWd5z1n5J8aW+yMNhpvaV8WieH8D9jlGPuDzqy8BHZ0SF0kjc?=
 =?us-ascii?Q?Q0ouKBjCHpvB/MXw9v1PSTGwfYS9WKzhLwo3S8II98W3Pqeye76PYiRl1mFz?=
 =?us-ascii?Q?rDs1YbM7xYK7R5Lzbh3deGT7/yYMCwGTUuxFtC2lL1rbRS/fW0fHJW9tdohR?=
 =?us-ascii?Q?4tALxcGGFwzpyQVShd269/0sA/SR1Z43xdN9XXQhzKkK7VSh1mvQE4A+UWeE?=
 =?us-ascii?Q?BS5vWn0=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400017)(36860700004)(376005)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2024 11:23:42.5998
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a7d236b-1912-47ab-6024-08dc809af65e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB76.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4257

From: Akshay Gupta <akshay.gupta@amd.com>

- SBRMI register status b1' SwAlertSts sets in below conditions
  - Completion of Mailbox command
  - syncflood event
If the bit is set for syncfllod event, it may be interpretted as
mailbox command compleition. This patch clears the bit before
start of mailbox protocol.

Signed-off-by: Akshay Gupta <Akshay.Gupta@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
---
 drivers/mfd/sbrmi-core.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/mfd/sbrmi-core.c b/drivers/mfd/sbrmi-core.c
index 5617b91787ba..d5fbe5676cab 100644
--- a/drivers/mfd/sbrmi-core.c
+++ b/drivers/mfd/sbrmi-core.c
@@ -41,6 +41,22 @@ enum sbrmi_reg {
 	SBRMI_SW_INTERRUPT,
 };
 
+static int sbrmi_clear_status_alert(struct sbrmi_data *data)
+{
+	int sw_status, ret;
+
+	ret = regmap_read(data->regmap, SBRMI_STATUS,
+			  &sw_status);
+	if (ret < 0)
+		return ret;
+
+	if (!(sw_status & SW_ALERT_MASK))
+		return 0;
+
+	return regmap_write(data->regmap, SBRMI_STATUS,
+			    SW_ALERT_MASK);
+}
+
 int rmi_mailbox_xfer(struct sbrmi_data *data,
 		     struct sbrmi_mailbox_msg *msg)
 {
@@ -51,6 +67,10 @@ int rmi_mailbox_xfer(struct sbrmi_data *data,
 
 	mutex_lock(&data->lock);
 
+	ret = sbrmi_clear_status_alert(data);
+	if (ret < 0)
+		goto exit_unlock;
+
 	/* Indicate firmware a command is to be serviced */
 	ret = regmap_write(data->regmap, SBRMI_INBNDMSG7, START_CMD);
 	if (ret < 0)
-- 
2.25.1

