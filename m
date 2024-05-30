Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2085.outbound.protection.outlook.com [40.107.92.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03EF4172BB6
	for <linux-hwmon@vger.kernel.org>; Thu, 30 May 2024 11:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717068218; cv=fail; b=Ytxec0cTSJvxx7gN8oy5oBseiE+8KkWbmpN6aeoxJ/y92f1vPU5U9sI0YKmsdb2H+0c/0vUEzzji9KCRfZStcWgYbR5u0N8gV9XIkLSQkdQgMAf37TU4g3puzqS4tBUKqQ6jrvCPGJVkx8y7rQGwqtnfUv/owewKgTKKPXOIGsA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717068218; c=relaxed/simple;
	bh=YpMnCcz6+6J4+dwcgAGF4/fC3Hxanu3BumLZR6eTSLQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RSDl+Olq52XlBD/GleZg3a5WgXoljDpGvnTjhPT+G7L11I92wG9RDLPRFAdVBhopwNbq5zUqkQjjjA4TJIIObRmgmp6iBiQE9o6mEy6eCG9vJ8VJMOae5yq35EocZZjD84S8cyuTENW5yDP4uCVjbQVJzF992TbCAPJcMZQ4u1s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=hAn6EWfc; arc=fail smtp.client-ip=40.107.92.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="hAn6EWfc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T1AIhBS2b9PobIVUhpD94GGtkmJ6nm3cvjbbCKuSDZWNPITm4XxuOIMc2Y+46wSKlwlUs2uuYteJT0QVAmkoBHvZmPnmfwhN5q74ZstGKPUE60zkQvYrnreTg00ufE9Aj2ojKcX4EDW3l4rR8vRXQu2D0cSiaf4qFB/gebRvyxLSn46du45AUAtJZgaIh/EOYawHUaCJx67gPRAcXbfN8zOS5J4SLOw580yBM9b7SNDkrTNpa40vdAJ6U8ECmEQkQByocLINNkjuFiw1iLdnl6lK8rWakA8E3MdOq30QjaW6pQ1WdKaPEpelL87/B1aoUEAropQH2im0Ov0/jV05yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DnzIYo4FoOolVYVpaH6VSx4ur0ijZvULLeIw/KV+wDE=;
 b=AMtVHrenb9bMkfKbw1/o6XWfuF/mmupFBbCjrp2pCZM1lvf3n0xXFzggKIlVcEnGRFbt+YjVyGnTSZ69ZoHCPy3a/v7Q/PbdV+TVTkZ5XXjtjZmBvTtm9VgoBfSotb8W4fLWVxzqr1/5GmKz2BLt1CgYM8THHwtQ0e2b39tozEJk3v+O07hIpC/+6PwyxpidwSiqmMOEfBcyYE+Wzn+w5vaC+9PkZvcgu1WlbYw2Ed6u0BJRBuagm3IQTw0nB2wTSZbM+PmOTDMCHc+NxOBv6ViO9/MDiROpqie5iVnVA3vig/2D/EZgocPNzlO97Duxv6iLBKPc7j3zSabEOy6amw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DnzIYo4FoOolVYVpaH6VSx4ur0ijZvULLeIw/KV+wDE=;
 b=hAn6EWfczy2ecnqclSu7DDKZQ4uTgGL2YJMbiNdBDzGFwQJKZ+iQio7n5YeQ+mAqOFRhAoQTK9phxMnq3TQF/VKWM4OoD4jUeeB0nUTjTi0ZSHnJN4LPzI9JHyvWk5NFZYka4EIwax6zlSU0qjowLighqGUOznl5YD/ewKS1Zsw=
Received: from MN2PR17CA0026.namprd17.prod.outlook.com (2603:10b6:208:15e::39)
 by PH8PR12MB6986.namprd12.prod.outlook.com (2603:10b6:510:1bd::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.27; Thu, 30 May
 2024 11:23:34 +0000
Received: from BL6PEPF0001AB74.namprd02.prod.outlook.com
 (2603:10b6:208:15e:cafe::25) by MN2PR17CA0026.outlook.office365.com
 (2603:10b6:208:15e::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30 via Frontend
 Transport; Thu, 30 May 2024 11:23:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB74.mail.protection.outlook.com (10.167.242.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7633.15 via Frontend Transport; Thu, 30 May 2024 11:23:33 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 30 May
 2024 06:23:30 -0500
From: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
To: <linux-hwmon@vger.kernel.org>, <inux-kernel@vger.kernel.org>
CC: <linux@roeck-us.net>, <lee@kernel.org>, <gregkh@linuxfoundation.org>,
	<arnd@arndb.de>, Akshay Gupta <akshay.gupta@amd.com>, Akshay Gupta
	<Akshay.Gupta@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [PATCH 2/5] mfd: sbrmi: Add mfd cell in the probe
Date: Thu, 30 May 2024 11:23:04 +0000
Message-ID: <20240530112307.3089696-3-naveenkrishna.chatradhi@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB74:EE_|PH8PR12MB6986:EE_
X-MS-Office365-Filtering-Correlation-Id: 22e225c4-1817-40a5-2518-08dc809af124
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|36860700004|82310400017|1800799015|376005;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?USAmwgU0aiSyuwdsYLwKLFnPVBdYWAIOYVAwIxyuMvSTeqKyH0lQsAzn+CMT?=
 =?us-ascii?Q?ar4xm8wnKpMjgToNxKfwdIwLSdXJt8QBPkiAia+0OPI0iQVT5BgQwyOiFxR7?=
 =?us-ascii?Q?KTdJfS0DAb54BICzBb2jx7N7qE+gbfX+R7PvPp+MqOGEMaZdd75yrNQnyIQX?=
 =?us-ascii?Q?EGI30OeJaVOhkQFxI2kAxxJDcyfVkNL1AFLkw6f2wkieimMaiKXDuTeOM3sh?=
 =?us-ascii?Q?qV0emy/bCQLYjsfBG74yaJMvfelKEUCm40ygtIYRYuJpQzHGk+T4351IMWYL?=
 =?us-ascii?Q?o1oliIcE+2bVjR5I0Q2vJcBy/Lr28ffLkQcIDSQBWkBCJqEK/4iA4AS4jgGd?=
 =?us-ascii?Q?Q9XI2+CTXtxw9yTY5zcupvBS+qUUabdexYAnX039rrNM8/XQCnRE7trjtLZC?=
 =?us-ascii?Q?qwz6zkzWK8fEYqcDx1WqHGPIvwSz7NsoA8XEtaZ9rWuQPpbV+Tr+YIgZgQDL?=
 =?us-ascii?Q?DVXjcNEMJMbAIkIdO8mVtE63+EC8TyCtkhd6EWJ06GkyLcNCne2iYuYassg7?=
 =?us-ascii?Q?xLezTXDtCS1WTu3asYkr/nv29L38KucTk64Rjqp7azBNIdwOSCzg0CUojAr9?=
 =?us-ascii?Q?BjpXeY8KagBF68sIhrJr3O0iHwB9+jYM6NRnaozDi8MBwyLaH5hJgsBJgDyV?=
 =?us-ascii?Q?ANNWBqGFC+EOapjTE6g1zX94FNR2H6X0oXfwP1Dgv/6qup0wSF/7LN2IAUFO?=
 =?us-ascii?Q?L1XOoRN4hgkjH8ir+iW5Nob7oZf+v14W/I20GdEyyHZ5ZCfqJ4sUJRiGjLuK?=
 =?us-ascii?Q?hLQvwJEHaWqRVEwYTU7/jOXOMIZiiDb9JvNtVTB5PvSMkd9pIr38azCa7b0S?=
 =?us-ascii?Q?08vpMDaJfC98gcvQFnrjDcnsiKj6yrbx+acCnazgk4x+M9Gn0x7L89J/BW7z?=
 =?us-ascii?Q?DJ8vTnIgHdudLrpUIvbqRGgOQK+0vg5uc6g6R735+aaVfYE4Rk4DBhkc2Y98?=
 =?us-ascii?Q?jsusIBhDZRWWL8B4do3rbweG38dR65efx59FeyFkxDuiMN8wLzkUbK8WnrA1?=
 =?us-ascii?Q?zKhX3pF6wLS0S+eJRfqJNjoP3kN2lIPmALg6x0ZHtT2kMR1hYDLo9GwasEoo?=
 =?us-ascii?Q?7JPAbk4xT/eKLX02F0tGdASJqAcuHA2x0s+nYuoCuqVF6QkrZ81NdGjuaFkR?=
 =?us-ascii?Q?8htbK8zYXKjCLVUQ/n/EGBmaXYKglL1IUOwAqbotfQXMDJ9svnd8fv3sSmpb?=
 =?us-ascii?Q?PrfPyMzdUP76u8KK1Pt1ON0tqrtcESlvsMLwlmbw5YCKuIxXc45FAqMRbtO6?=
 =?us-ascii?Q?m850jjudy+bObjMZmAJzQbyNvSOd7ueBxVHikO2LvzOM+smGNGpClIdyhsSq?=
 =?us-ascii?Q?Tc12y/e1o/3h2zepzU2x3ysQ0duV3p3Z0OyJLQLvWUw6PZrRwGRZ/uOSpdhe?=
 =?us-ascii?Q?LduEjtYY0JdCO/17ztuNoyPZf7n2?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(82310400017)(1800799015)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2024 11:23:33.8295
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 22e225c4-1817-40a5-2518-08dc809af124
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB74.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6986

From: Akshay Gupta <akshay.gupta@amd.com>

- AMD provides socket power information from out of band
  which can be read by sensors.
- mfd cell will probe the drivers/hwmon/sbrmi as a platform device
  and share the sbrmi device data.

Signed-off-by: Akshay Gupta <Akshay.Gupta@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
---
 drivers/mfd/sbrmi-i2c.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/sbrmi-i2c.c b/drivers/mfd/sbrmi-i2c.c
index 96215e986740..c19f0b3eb0cd 100644
--- a/drivers/mfd/sbrmi-i2c.c
+++ b/drivers/mfd/sbrmi-i2c.c
@@ -10,6 +10,7 @@
 #include <linux/err.h>
 #include <linux/i2c.h>
 #include <linux/init.h>
+#include <linux/mfd/core.h>
 #include <linux/mfd/amd-sb.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
@@ -17,6 +18,10 @@
 
 #define SBRMI_CTRL	0x1
 
+static struct mfd_cell apml_sbrmi[] = {
+	{ .name = "sbrmi-hwmon" },
+};
+
 static int sbrmi_enable_alert(struct i2c_client *client)
 {
 	int ctrl;
@@ -72,7 +77,17 @@ static int sbrmi_i2c_probe(struct i2c_client *client)
 		return ret;
 
 	/* Cache maximum power limit */
-	return sbrmi_get_max_pwr_limit(data);
+	ret = sbrmi_get_max_pwr_limit(data);
+	if (ret < 0)
+		return ret;
+
+	dev_set_drvdata(dev, (void *)data);
+
+	ret = devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO, apml_sbrmi,
+				   ARRAY_SIZE(apml_sbrmi), NULL, 0, NULL);
+	if (ret)
+		dev_err(dev, "Failed to register for sub-devices: %d\n", ret);
+	return ret;
 }
 
 static const struct i2c_device_id sbrmi_id[] = {
-- 
2.25.1

