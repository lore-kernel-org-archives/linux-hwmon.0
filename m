Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazhn15010016.outbound.protection.outlook.com [52.102.146.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C9563EB816;
	Thu,  5 Mar 2026 19:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.102.146.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772740615; cv=fail; b=iXXEw+OE4AcNWCu8sw+vEuMu0DLGOA25ChDicjkfLHgVdO8NWCAYVPE2ifswiVhshZrGe83sXjRMXfiip/+YeIuyPehH8aMJgyxfJl/6PD6R2GQZEYNB9xuVAI2+Vqc9O3c4LbPhwhQs8rs5jgctfvuw9dT8LZoC0IFDNq6R7Q0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772740615; c=relaxed/simple;
	bh=fm05xMFtNUT3MV/4PMGavQ51hDf/l7zBGqLG1gaRoao=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P85TzsgFnZkZmCFjm/gsvdCyI5mnRsb+ses9+fj/smpad+aB0cU3psPDcFUOZ//gjCdaHakEFFR246/68dYEBihUaWBJKsc1vgQxC0GIN/XnKHl+i3YEQkrXMiSq7fkt21QTRZVBYokTQp6PcF4ewR/OTJQvB9lnb5ma5337RyU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=uAj1w77y; arc=fail smtp.client-ip=52.102.146.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="uAj1w77y"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gLnBr6fvZITmyUz2E4n7COMH0pubXc9Jx+c3r5S0Onzl1T5mx1XRQ5kCIPo4IzQoniRObUNHqK4C5bdIh4Pp9lvRDY5oISOUSUmGk01gSq7YMEEcYycy03jUbqOeMZuy+UYJoCkyoJKQIW1DxoGUd6MDaOIZj4VHz5gvvVwTWPYqRFxb2Mb9QgZ6lu+DclP+HYEz3UJ/dO8xuw+X2PGb6yviSZq2SesFxq74jPPp5kyZLy7D5QSYrPHCqPV5ik7c7nh879bcauCTRlnoYO81PGVCI90h6/GJeItJMYubv/6EwRAS1Ap0qyNhRs/V8XCFdQBXH17PRii+iKO9rpBCKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nymF7bs7sbttBJ4KpHtJf1zWmee57yaCucB9V+coZq8=;
 b=rU4CL2azv2i84lRvxZBe+RRF+j529JvpoDBYBiyNriqOn4i9FZhuSFPrNgaGIJR+OmvKhpQnVbYjhJvyIOHoUuZ/aVbJtBiI/6FkeWfg0fVViNHTP8nHYbrwc1y7artdTnxFVmDl6+6VHwkRsBkWKrMGq21oBPEf7FltH0KL2MT1O4F6hNZk9sLXYfaG8cWvVaTUGJgXvoOwk2RPzGFJfBkCSHEFagNkeASG8rSeR1ZNYxat3VQPQ+ys9nV9zmucn+7sQH1mu+GfU5vQLPpaTCpeNPeLSpjR4tWdNTWqMCnj++q5yZVnWzEdgt9yMpUhATP8pMlcUBrHJOHgZFXo1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nymF7bs7sbttBJ4KpHtJf1zWmee57yaCucB9V+coZq8=;
 b=uAj1w77yQzutfDlZVpQBGJMJl22QyRtIfR5CsI5xd6sCvgg8thhalEgcP2Nr1reeVIcdtLfhtSZLV8zuj5icD1f0GjtqeCM0fiGQ5iPx4WjdmrHpokV+xdIKj0g2yh1q9wbLMkIx3bu35rZLs2sPreFb4pLEqmwEKsylc/ulfS0=
Received: from PH7PR02CA0007.namprd02.prod.outlook.com (2603:10b6:510:33d::13)
 by DS0PR10MB6973.namprd10.prod.outlook.com (2603:10b6:8:14d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Thu, 5 Mar
 2026 19:56:50 +0000
Received: from CY4PEPF0000E9D6.namprd05.prod.outlook.com
 (2603:10b6:510:33d:cafe::9c) by PH7PR02CA0007.outlook.office365.com
 (2603:10b6:510:33d::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.22 via Frontend Transport; Thu,
 5 Mar 2026 19:56:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CY4PEPF0000E9D6.mail.protection.outlook.com (10.167.241.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 5 Mar 2026 19:56:50 +0000
Received: from DLEE208.ent.ti.com (157.170.170.97) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 13:56:45 -0600
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 13:56:45 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 5 Mar 2026 13:56:45 -0600
Received: from lelvem-mr06.itg.ti.com ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 625Juigh2456638;
	Thu, 5 Mar 2026 13:56:44 -0600
From: Andrew Davis <afd@ti.com>
To: Guenter Roeck <linux@roeck-us.net>, Chiang Brian
	<chiang.brian@inventec.com>, Erick Karanja <karanja99erick@gmail.com>, "Grant
 Peltier" <grantpeltier93@gmail.com>, Jeff Lin <jefflin994697@gmail.com>,
	Cherrence Sarip <cherrence.sarip@analog.com>, Kim Seer Paller
	<kimseer.paller@analog.com>, Alexis Czezar Torreno
	<alexisczezar.torreno@analog.com>
CC: <linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Andrew
 Davis" <afd@ti.com>
Subject: [PATCH 01/11] hwmon: (pmbus/bel-pfe) Remove use of i2c_match_id()
Date: Thu, 5 Mar 2026 13:56:32 -0600
Message-ID: <20260305195642.830695-2-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20260305195642.830695-1-afd@ti.com>
References: <20260305195642.830695-1-afd@ti.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D6:EE_|DS0PR10MB6973:EE_
X-MS-Office365-Filtering-Correlation-Id: bc819316-928a-43a7-ee87-08de7af15724
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|34020700016|1800799024|36860700016|376014|7416014|82310400026|12100799066;
X-Microsoft-Antispam-Message-Info:
	rsEZq/N0i2bkmX2Jw09ePvq1ShNo/g7Q5e6FoxBz/6dtYv/SvP+wrRMVLsMS3Z/cXtCrbuCrYF6KCHfwM6Zp2qEL6zXcjqPvoVSFZPFso65Ab3uF4GvqSmqCfilwsgdYq7+w0+1z5LnzB4rqCN3VGO3GWDX7xiX+W4iCDWIYJF6JGxPosbB8Ca2abDjI62jmxQA+VzrvuWUHfyqYqQwd6KTAuPvMYSqo6HeYhf4uv0itUWjoYV6x8NxUnFeBNNW2+dNfhWatO5YmWbJTswOv3H8vyp+sbDwEBWMJPUwydm64DrHTrmJ4j7fDx6VP7Bli08WiBU0dlz+fO0whWWFtbMxQawvkl3WOBtSBc6ltYfpsp1a9SR9Ue31m4oqBVRFdD0LUTCS98/nY1z42at7mZp9sL6oYbMZ66yJFDUZRW9nBX4xpaPjDuT4Vp+bYuMIsEwLW9ww+UjNKPVJ4FX05QdoF8TAWX+fvBgskibPUhupcKMGx1Ittw2C1rQzF906kdnTXITFwtxKT7A0wvNnEkO+YzTGfb9GAIrN3CASv0fwEqYP41fQb0CbHotlShd+gDNt9+bn/DpXZw6xNCRSrN5WaDMIP6JazcVLAHmW3+kHFZUAWf80Dz3OpjsDr/FdJoiyW7Gmr58WSa9u0xT7UBert8dVcIsotdRwTW4L4oQ603imQvuHbbX8fdCAglDJVwlmXevReoUvDRzgaV+L9v4n1FQXA3WnhSzf/UhIkqdueBagYJh/JhAsJMghyeBFI0lcYTHw54xTQlVIddFRipw==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(34020700016)(1800799024)(36860700016)(376014)(7416014)(82310400026)(12100799066);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	UdQtb/t7FfGs0bD+lfCSoijKHKwuSgp6UFM/EmRntHd+CsKIqpHKLVqeDIxSjho1FFpDgA/klaAZB2dnhbs5zhp2LS95enUxYqIf9wFMqa6pqBSGE5YKJOu8zuymSix97E+LPrlYRNjSUXKWt0MntSXxURZfU9Ls9dJs6+Ol6Af00S3sDMGTGt/LdLyZm5wk0SLB62vk6YZHfXoreHXbiYW01J/cYYGluH5D5RJ1in22zEr33nGiM1PbB4O/7qEfAk6/unBFlHii3oEE6Lf4lLXR7FOtLRQAo89ft3DbhxuXss01nKgI+itXUGb/NKSiqqsdE+ezJTkZmYfs3NRaNib38ExyalZ4TL1jgRXM4RjdQj/pd/3Tk+GIAgiMVi56vP68Pq4h++U483hW0byV3Y4JDjvwF7rNFdiYp/ujTwgZr4TW4mp1WjacMD/0P95v
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 19:56:50.0076
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bc819316-928a-43a7-ee87-08de7af15724
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6973

The function i2c_match_id() is used to fetch the matching ID from
the i2c_device_id table. This is often used to then retrieve the
matching driver_data. This can be done in one step with the helper
i2c_get_match_data().

This helper has a couple other benefits:
 * It doesn't need the i2c_device_id passed in so we do not need
   to have that forward declared, allowing us to remove those or
   move the i2c_device_id table down to its more natural spot
   with the other module info.
 * It also checks for device match data, which allows for OF and
   ACPI based probing. That means we do not have to manually check
   those first and can remove those checks.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 drivers/hwmon/pmbus/bel-pfe.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/hwmon/pmbus/bel-pfe.c b/drivers/hwmon/pmbus/bel-pfe.c
index ddf9d9a2958c4..6499556f735b4 100644
--- a/drivers/hwmon/pmbus/bel-pfe.c
+++ b/drivers/hwmon/pmbus/bel-pfe.c
@@ -88,13 +88,10 @@ static struct pmbus_driver_info pfe_driver_info[] = {
 	},
 };
 
-static const struct i2c_device_id pfe_device_id[];
-
 static int pfe_pmbus_probe(struct i2c_client *client)
 {
-	int model;
+	int model = (uintptr_t)i2c_get_match_data(client);
 
-	model = (int)i2c_match_id(pfe_device_id, client)->driver_data;
 	client->dev.platform_data = &pfe_plat_data;
 
 	/*
-- 
2.39.2

