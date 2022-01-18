Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0091AC433EF
	for <linux-hwmon@archiver.kernel.org>; Tue, 18 Jan 2022 07:56:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343742AbiARH4m (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 18 Jan 2022 02:56:42 -0500
Received: from mail-bn8nam11on2046.outbound.protection.outlook.com ([40.107.236.46]:9421
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230082AbiARH4m (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 18 Jan 2022 02:56:42 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nqqV6FVc+UyRMUQYodn3yJkDphYxoSX91boOZW1i6QpoYSjLr78E1jm/ySe8hjDLajaViZePN3szV+1/sMAmudpyGQe2QQZydQ23k0MvHapcAQeHY+4EPXO3pPe3XXgdpT4+3IiJTsPFA8BWtOYENbn34CShjjthktSM9m4FgDkrIWUuvhmteU+xDXmTMwgiBqXHbBcALBK2ESYdUUaq8j00QzarwxWg26GiU4n0ZfxeC13w90lAWSbcLnX6iLWh9exuBUMLWXoRi6g1AHsrgVpbZI/QrzfemUJlKOmhYSlAvgEAxnAHJcyhC4JQgpOI+V2PEU8o93srJ6CPOGzqEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bobR/PerDw3vYh4VHhv1dhYGdyjCroYDSHeqRK4RPUM=;
 b=HNtCGjqjBwSYIWvzU1Hz2Kjuklwn5M+hIvjgYnR/PP8pkRtJ+J8CrEB+UxV1M2Y1yypBRw5ffLKR8lSlBeiX4FtgGMri4ODp1PedtJpeuADCxnB8yaELAZp4+VGPGetgs7tQP+UOKqDmisSwtHDSDDQxYkvktfjS632hc73eFwdLo1mHzcS0cCHkft8zvzalTW3zATFtd6A8gzAnXZGHI/oQXZBCEir7GYNHSU1mo0HWceWB8eef8+mzbIZM+UX3PY2a3mN6ASVTTYgAimlh6nKmEI/7E6I206YOWS88wW4xXHmSSQ20pp4uhfiIMe0Mn7QPEuVTLaygJyJ1RjmRNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.238) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bobR/PerDw3vYh4VHhv1dhYGdyjCroYDSHeqRK4RPUM=;
 b=jjtlmxDTW2Lqv+GNyCnnUsiNXyyYifrIxxIGAO+euUHgcKFK+KIxZKs9Dxb7NIPSzTaDfTbY5WUBjYR0eJPaiq4Lhqjr/MIzdJSocfY0CQa5HuYzrAGwthMQUq0Bxu/z9UAAvExS54rjLEQYVkg932yy3tWuThUzp0HQbqHh0w4BxIfrDw2ou4dACDsx+TVuI2fP1TE7GvN2FSCId5l9mDH2iSMkWTvZhTujctEzRlW/ESW0nEPOQ04dhwsJkwznjjczJl4hIKIaKo+UwCkTwOaooIAq+hnw9cFtLu2g3mGlH8Z+Jl9y8gbpBPeZO6DT8o8RoSBWz4FJGK37UUQF/A==
Received: from DS7PR03CA0199.namprd03.prod.outlook.com (2603:10b6:5:3b6::24)
 by DM6PR12MB4058.namprd12.prod.outlook.com (2603:10b6:5:21d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7; Tue, 18 Jan
 2022 07:56:40 +0000
Received: from DM6NAM11FT061.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b6:cafe::38) by DS7PR03CA0199.outlook.office365.com
 (2603:10b6:5:3b6::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11 via Frontend
 Transport; Tue, 18 Jan 2022 07:56:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.238)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.238 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.238; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.238) by
 DM6NAM11FT061.mail.protection.outlook.com (10.13.173.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4888.9 via Frontend Transport; Tue, 18 Jan 2022 07:56:40 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by DRHQMAIL105.nvidia.com
 (10.27.9.14) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Tue, 18 Jan
 2022 07:56:39 +0000
Received: from r-build-bsp-02.mtr.labs.mlnx (10.127.8.9) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.986.9;
 Mon, 17 Jan 2022 23:56:37 -0800
From:   <michaelsh@nvidia.com>
To:     <linux@roeck-us.net>, <linux-hwmon@vger.kernel.org>,
        <vadimp@nvidia.com>
CC:     Michael Shych <michaelsh@nvidia.com>
Subject: [PATCH v3 3/3] hwmon: powr1220: Add support for Lattice's POWR1014 power manager IC
Date:   Tue, 18 Jan 2022 09:56:11 +0200
Message-ID: <20220118075611.10665-4-michaelsh@nvidia.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20220118075611.10665-1-michaelsh@nvidia.com>
References: <20220118075611.10665-1-michaelsh@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.127.8.9]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 07b71d00-3a96-4863-d3f2-08d9da580f8d
X-MS-TrafficTypeDiagnostic: DM6PR12MB4058:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB405852BDCFBEA4A55FD3BE55D4589@DM6PR12MB4058.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:517;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aqRnwGjljz+5AsKBcjnYK+2ZX2+5rAPUBhfqz2bNVxXVUIJ5+CNHHJ7usHcUnFCBCc5SRNssCUb3zBD2k0n7BgWSd14A3e38XcH4JNoyxAONI5xQbwEOOH+bvLkEPqh4XwavjIi2KwgsL+Nb3B2L/dJSu3qaJHF8ryGli7atlhUkQzCxrbXm/7W3l9lvlydQ4u1v95Fa7wQvqpC1F7KQdWgo5hjE01WBoblNnm32jJMcrgKQ+4SrIuxdqnanoKXfjZMyFJSE0x96PQBCYN74bkWcEqtyabwFFZXkhWarq6O5nJj0p7kIysXnoX0HBjLbCOmXLIHdC/g+koiY87Ny/ph8xwg6FwbcFk8dAkKmmCXJ6KJBvU3Lh2tP2G9X8Drj3RVS30t4iIKqhu7NB8ZBztWoYsyqMhOmLE/7ms7SB0rnMDKzhoZKHJnaIHDZRwLRLLWfhiPm6LYC3fK4FKXkmdk1TOMGYhiR6Ia5+dJN/IUttVU04B12DE72TntcRIwsZbaa6Izh0YvSWyOHUNQCSXi6L9jsPbN7tIA9z5mEuqNpXIM8eetLFO98gKYQFpZPqJwVtnG7cy/cTRQOXkL+EqKJFIhI3cVI7MAolooDYIfv2zzb4xiSkNbpWThbVWkLlCWt7bMaid1qsPJaY54Fhw6UZcAGK4AUc2uurPXX3e437z1+8BsH8V753CDqtqJ64yHBplLPsxYfFfXN84fZlgHaUUMFwdJmCsWHRjEIcjSAVmNsxVvmVjNSfBWntlYsu5ze6BlqGlpbkgi0iEMF68/6K+GUjW7kC19rjuSv81jXeEVUSYR6ZY3QOANVN4Ni
X-Forefront-Antispam-Report: CIP:12.22.5.238;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(4636009)(40470700002)(46966006)(36840700001)(36756003)(8936002)(2876002)(47076005)(1076003)(70206006)(70586007)(8676002)(82310400004)(40460700001)(6666004)(26005)(336012)(316002)(186003)(356005)(86362001)(107886003)(16526019)(83380400001)(4326008)(110136005)(508600001)(36860700001)(2616005)(2906002)(5660300002)(81166007)(6636002)(426003)(2101003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2022 07:56:40.1316
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 07b71d00-3a96-4863-d3f2-08d9da580f8d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.238];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT061.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4058
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Michael Shych <michaelsh@nvidia.com>

This patch adds support for Lattice's POWR1014 power manager IC.
Read access to all the ADCs on the chip are supported through
the "hwmon" "sysfs" files.

The main differences of POWR1014 compared to POWR1220 are
amount of VMON input lines: 10 on POWR1014 and 12 lines on POWR1220 and
number of output control signals: 14 on POWR1014 and 20 on POWR1220.

Signed-off-by: Michael Shych <michaelsh@nvidia.com>
Reviewed-by: Vadim Pasternak <vadimp@nvidia.com>
---
v2->v3
Fixes according to Guenter Roeck notes
1. Correct commit notes.
2. Don't use usleep_range
3. Change devicenames in alphanumeric order.
4. Chanhge if statement
v1->v2
Fix added by Michael: Fix incorrect device id.
---
 drivers/hwmon/powr1220.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/powr1220.c b/drivers/hwmon/powr1220.c
index 1d4e005977b6..2a5e168a52a9 100644
--- a/drivers/hwmon/powr1220.c
+++ b/drivers/hwmon/powr1220.c
@@ -22,6 +22,8 @@
 #define ADC_STEP_MV			2
 #define ADC_MAX_LOW_MEASUREMENT_MV	2000
 
+enum powr1xxx_chips { powr1014, powr1220 };
+
 enum powr1220_regs {
 	VMON_STATUS0,
 	VMON_STATUS1,
@@ -74,6 +76,7 @@ enum powr1220_adc_values {
 struct powr1220_data {
 	struct i2c_client *client;
 	struct mutex update_lock;
+	u8 max_channels;
 	bool adc_valid[MAX_POWR1220_ADC_VALUES];
 	 /* the next value is in jiffies */
 	unsigned long adc_last_updated[MAX_POWR1220_ADC_VALUES];
@@ -171,6 +174,11 @@ static umode_t
 powr1220_is_visible(const void *data, enum hwmon_sensor_types type, u32
 		    attr, int channel)
 {
+	struct powr1220_data *chip_data = (struct powr1220_data *)data;
+
+	if (channel >= chip_data->max_channels)
+		return 0;
+
 	switch (type) {
 	case hwmon_in:
 		switch (attr) {
@@ -271,6 +279,8 @@ static const struct hwmon_chip_info powr1220_chip_info = {
 	.info = powr1220_info,
 };
 
+static const struct i2c_device_id powr1220_ids[];
+
 static int powr1220_probe(struct i2c_client *client)
 {
 	struct powr1220_data *data;
@@ -283,6 +293,15 @@ static int powr1220_probe(struct i2c_client *client)
 	if (!data)
 		return -ENOMEM;
 
+	switch (i2c_match_id(powr1220_ids, client)->driver_data) {
+	case powr1014:
+		data->max_channels = 10;
+		break;
+	default:
+		data->max_channels = 12;
+		break;
+	}
+
 	mutex_init(&data->update_lock);
 	data->client = client;
 
@@ -296,7 +315,8 @@ static int powr1220_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id powr1220_ids[] = {
-	{ "powr1220", 0, },
+	{ "powr1014", powr1014, },
+	{ "powr1220", powr1220, },
 	{ }
 };
 
-- 
2.14.1

