Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2071.outbound.protection.outlook.com [40.107.101.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8767518BBA5
	for <linux-hwmon@vger.kernel.org>; Thu, 12 Sep 2024 07:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.101.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726124929; cv=fail; b=bJaJ+O0Yvw6569U5Y9rE1PVhOjbNzK6E7tJJLH8mP1kllcvsrD9bvyujn01wbvtTQJuWrWMiNOBNbqMNQo6mbIJhDcz1BOIV6r4RpahEQkHcDd+ifbO/IsJQ606b3WSiODIumNGJMFK+GnqiiIIzlhQJykopc0f6phqlrx4rJuw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726124929; c=relaxed/simple;
	bh=CEyEFsA4JutyYbMXXGWQcRKbX3J21uKQVD4d1GuuADo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kiMip+dwK9B9y1sZcYCFCUCobuFjDqD/dxZUsCgC1g9y1t1fHfuUun3pOqjGnv9hlcx1fI7c/TiQAAa74uTHpU9nJ8LS8wgZ3RFbICeNoERmlh6GI8umRnTxQwlrsFscDS0+OK8dbka2MGB5ZFuDW1ZyJbgy8dBCQP7eX0FnEjk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=kSd+MpXy; arc=fail smtp.client-ip=40.107.101.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="kSd+MpXy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h4l2wrAFTgjVgTfLtPw6Po+rxF3samhiIRJO7BAYfOj5qxoElk+L6k5e/GINzSwABG6jYt67yzCr7Dzi1A4vS4PfYjXmETa6Qk2Dtq37AiZP/dbqNRaeSb1zCTOIZFIsBr0KaWxdKU5lfEoBLPGXm+TYTki7rb4pOnD31oipd3UiVXLP7/cV/KIt5e1IMK+rr8Nj34brWeYh87u9ZAUp/fdTJqlXB/KQZ2Zf4goaj5pp8WlwPvlbLVMSpEFl0cMK9LxLlbrx2SJNX1oBRqmgLKfUN9yN8ZGi05+zwQ0vCPMLiPYAafbrTwm2MLHQsLBQoh36K+J5wvluoibhd2VUvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MuxGRWRjn2x2sYDIJ2UNvnPQFSUjLf6HPQ/i4x12klc=;
 b=H8J1jbk/WWBrQad9j5QKEfcczjidYvT2O24AI8QqmgFrnPzcrq7tzmzRNwwDgtgJvTOcDTl4Xey8N+ovYLp5jTyXwG0NfL9ezw9PB1CCoLfSGe/3vACUNHvMxdCXXN2byH2YfoxIT+Zd82vzvZYVTHv3OUEK102fwkKmhO4PMxoTkHTiioZ0tzHnbOlj1vHvZxtjAi+CiHTnvMKMw3HDEzC51oHZOi61UxIOZHOT/il5W9crx6pGmeZcVQyx2F/eKIJ8BsXvp9CvIvEzggvZNVTcv0jCNrM99IqRJnN6k/fyuwAHwp7ecUqmXcdyPF4/sGwY+FVU+l4aBq+lW6SNLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MuxGRWRjn2x2sYDIJ2UNvnPQFSUjLf6HPQ/i4x12klc=;
 b=kSd+MpXy++7LQnEHBG+vepgED8xujfy/GOAEIjiLoRRfzA38ijRFriE1B18ByHO3M8H/D/mL/KEo3Yr8MIFHIoOwHpbzsqkfmzQhiIk7GILc6SwYNINilSpdhYe5fH0fB+9gHuzjjhxeqeKdbvm/v+plCp/CTtB+Xv+QuRXXMD4=
Received: from CH5PR04CA0024.namprd04.prod.outlook.com (2603:10b6:610:1f4::9)
 by DS0PR12MB6487.namprd12.prod.outlook.com (2603:10b6:8:c4::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Thu, 12 Sep
 2024 07:08:42 +0000
Received: from CH1PEPF0000AD7F.namprd04.prod.outlook.com
 (2603:10b6:610:1f4:cafe::98) by CH5PR04CA0024.outlook.office365.com
 (2603:10b6:610:1f4::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.25 via Frontend
 Transport; Thu, 12 Sep 2024 07:08:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD7F.mail.protection.outlook.com (10.167.244.88) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Thu, 12 Sep 2024 07:08:42 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 12 Sep
 2024 02:08:39 -0500
From: Akshay Gupta <akshay.gupta@amd.com>
To: <linux-hwmon@vger.kernel.org>, <inux-kernel@vger.kernel.org>
CC: <linux@roeck-us.net>, <gregkh@linuxfoundation.org>, <arnd@arndb.de>,
	<naveenkrishna.chatradhi@amd.com>, Akshay Gupta <akshay.gupta@amd.com>
Subject: [PATCH v4 3/9] misc: amd-sbi: Optimize the wait condition for mailbox command completion
Date: Thu, 12 Sep 2024 07:08:04 +0000
Message-ID: <20240912070810.1644621-4-akshay.gupta@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240912070810.1644621-1-akshay.gupta@amd.com>
References: <20240912070810.1644621-1-akshay.gupta@amd.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7F:EE_|DS0PR12MB6487:EE_
X-MS-Office365-Filtering-Correlation-Id: 20fbc12a-edc2-46d7-6d2d-08dcd2f9bc39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JHUInqc2Yn7pZsjfngvtFrM2TAsyXFJPA3es4PAR29Z5ZiJncajq+GxuJgSL?=
 =?us-ascii?Q?aw4CKu8NKn41ch220ddylYtZzu6cgp6LmCv04HxL9+Nh5aLNx1XT+lOgKD2T?=
 =?us-ascii?Q?fmpTJoSml2eKp2frm47CAIQtO+rE5hFwDOYGGr+RqXtbeygtfnnnLkOBcYIY?=
 =?us-ascii?Q?XJAAkpUA4spdypEY6ifYIJ4lq0/1GIbt++ZvDL8s525BhBS0wgYALIVWYAYa?=
 =?us-ascii?Q?eHPHZh6dbA7pKc3F6R/ydKqY4YpID+gpWBtq0GJqS5yvpwihmhvk5tEAKW3L?=
 =?us-ascii?Q?epuRxaNLVDKJMO2zzPumA5I6qdPhZcgQcYVKX9MgEiYFIhoKAWTqiDAEqgCq?=
 =?us-ascii?Q?cnCMJE07ptAXiPA1BAqXN7jBOa3DjY5tdFmobtOHfXY+DDoNmoYyoVwZsPfz?=
 =?us-ascii?Q?HW/KY2Zk7HFR6pvhl/u6rDKYMgotnNjbbsghugdCn40l6unvKtWtzOY37fK6?=
 =?us-ascii?Q?HJ+8fU6FOYDs/UTzgY+GUGU+tWxU+tgKRkVFO2fq88L6Izk8O4teY2iT/wlF?=
 =?us-ascii?Q?CNjNQQabpaDELbBj4XkQmWl4OBFiNlnPFrLVaOcph6PPU0hApxvKuo/SHWG2?=
 =?us-ascii?Q?grebaHrt6ALavSpot3H58ZUsjuk8YdWn7XatiKxmforYX/28CEvQDBL5u7Eb?=
 =?us-ascii?Q?9RPoLFEs625xKK0SVFqFiNw5u7TKoX3YooP+eaxtUnXtuFz67PDLatdOFPwF?=
 =?us-ascii?Q?r6gRvWbPC8fCFXWDXpP0ArUjpusaMjDVinDWkv/O+KyuoczeBe5qx6iREJGG?=
 =?us-ascii?Q?9JaAKmXa/kUb8nyWFSqZNyXjhHp6OHPGYJQy36DJeeUHM3A6EoMTpWDkryQx?=
 =?us-ascii?Q?G3XUxqhIm1Dozx3Ise5IANoiUoE4ifQUEMWSc24vhU05+3wY/nigf0tgoPYs?=
 =?us-ascii?Q?ClibM6XCPiJ3rNzRJ6etGZmxs0yhZ251eWT5FbzRMn3O/mRiL+l5uG6O93ni?=
 =?us-ascii?Q?yfnWBcYQBKpHYOzdzHDEmDjVYeslmAApQJ7NiNM4doa41SDCQ+wem1HLUG6f?=
 =?us-ascii?Q?7ELG9BRuXLLU5gpQdOI/U7URv8VIzy9R2Nr+Mur6CXIDYEIR+LBSYeCEP2KT?=
 =?us-ascii?Q?o7pyiaXYUpTR0TKFuoUJwhuwjKE9FdvRYw7KEA44D3Z5zSYHaO37nU9nPhOt?=
 =?us-ascii?Q?8kJDrTG7vDJ6s2020LqhcTFjkdARPuLOK5weMZ17iGFAIwALkIwJ1QGB1PsL?=
 =?us-ascii?Q?lmu+vPtUn54kc4JYWXda5bhOCDIvpshU3ATOEedN+2sMQzQOG3RJ+3DxIlA2?=
 =?us-ascii?Q?Q53KcNBLMJqX/om/edmo8Hy4RbT1ng/IW74NOThMse5JtVgqZapsHB/pHlNG?=
 =?us-ascii?Q?8+MdbwEEQY553I5dfJuFmCm+b/0EbGcoDE6JzmeblTcZcYoPNQgeetBaV9Ha?=
 =?us-ascii?Q?i2qwCDDERcgwHZ2ckAewltg2RcMARkJ/zqQ3exRgWsvYij64bCagj/2F2ZeK?=
 =?us-ascii?Q?EtDqeaF2LLP1TrOnraFP0b+mDfXioMW/?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2024 07:08:42.5400
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 20fbc12a-edc2-46d7-6d2d-08dcd2f9bc39
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6487

- optimize the wait condition to indicate command completion
  by replacing the do while loop with regmap subsystem API
  regmap_read_poll_timeout()

Signed-off-by: Akshay Gupta <akshay.gupta@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
---
Changes since v3:
- New patch as per suggestion from Arnd

 drivers/misc/amd-sbi/rmi-core.c | 19 ++++---------------
 1 file changed, 4 insertions(+), 15 deletions(-)

diff --git a/drivers/misc/amd-sbi/rmi-core.c b/drivers/misc/amd-sbi/rmi-core.c
index 5a0b7912cc4e..57f2915ac8d5 100644
--- a/drivers/misc/amd-sbi/rmi-core.c
+++ b/drivers/misc/amd-sbi/rmi-core.c
@@ -25,7 +25,7 @@ int rmi_mailbox_xfer(struct sbrmi_data *data,
 		     struct sbrmi_mailbox_msg *msg)
 {
 	unsigned int bytes;
-	int i, ret, retry = 10;
+	int i, ret;
 	int sw_status;
 	u8 byte;
 
@@ -66,21 +66,10 @@ int rmi_mailbox_xfer(struct sbrmi_data *data,
 	 * an ALERT (if enabled) to initiator (BMC) to indicate completion
 	 * of the requested command
 	 */
-	do {
-		ret = regmap_read(data->regmap, SBRMI_STATUS, &sw_status);
-		if (sw_status < 0) {
-			ret = sw_status;
-			goto exit_unlock;
-		}
-		if (sw_status & SW_ALERT_MASK)
-			break;
-		usleep_range(50, 100);
-	} while (retry--);
-
-	if (retry < 0) {
-		ret = -EIO;
+	ret = regmap_read_poll_timeout(data->regmap, SBRMI_STATUS, sw_status,
+				       sw_status & SW_ALERT_MASK, 500, 2000000);
+	if (ret)
 		goto exit_unlock;
-	}
 
 	/*
 	 * For a read operation, the initiator (BMC) reads the firmware
-- 
2.25.1

