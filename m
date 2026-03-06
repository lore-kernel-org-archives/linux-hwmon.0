Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazhn15012044.outbound.protection.outlook.com [52.102.140.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD672413220;
	Fri,  6 Mar 2026 17:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.102.140.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772817429; cv=fail; b=nH5miPm+jB7vNtlgrdODf56EDqQL1T0VlEdutAEAw+sMZk4yIQ9u3f3+t972oHs1znN7yLtZ52pDq0jq/npyEdR4Pip9wgsGw+2ZBuxpSBrzCFq4L5MxILMZPfA2pda5KFgS37i+QdekJtobek8reVTfwE8JgejHIzOVJvR6JvQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772817429; c=relaxed/simple;
	bh=4oYpv9ZOIODk6wwCtN8moVpKfpeeFCog/vARDAPwUDE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QMIZr2QMXzP5Bcqu218is178S4iS4AQiYTvqVFaKpBceZ3KJAevKsm/nF9LQOjPzN+DVFt7SImx0FPuXF8lmIrEo5j8A/yTRhLLFFvGOR8Y4uOfCnPnNypXgVHrLg5BdBI+NG4un/pv8lPhQgyoluFIlIflMOUObgIgbEzlbwVk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=TBgLQVVD; arc=fail smtp.client-ip=52.102.140.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="TBgLQVVD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KPP+3FdS44390yBRweudA+1OpAkCWGlxS6tlrz5phMDUcCXwB+w9u6ywGD4udYV8B7s9MGbRBfSjbl/STOK+DfP1+GMd6bHLWdlrEO20lqX/DGKKHmclNZMoEl12Wsz0sWfY60vaTDRVOO+FPt2qP2CZbLJyFwxY10RZsISpKr4x+EFPsP1dOysHeixCvQ2pSDmD4lv9gIML6PDmBjwox+WrbS1iOvR0Cz/0pZcZFri9dEkZ1INgVtTi701T9Y9WJMi/D9qMUnGpQ/lv8Ig5XbSJSe1p8bpRaNBIiZDkDziApcGPW6tNvWXEef1IpFthqHIoQCIankAuALcEv9SwJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5rX/0LE6EGw60Ich9FPycqanCiQTU6SoGizLLC6aXSY=;
 b=wVay2kGfNVvmMdHaQHWprxoU/p5YoelxTj0Fsn/8Li5FgssDa2/UgdLxxSyz2cyqz5Y+3Ent++P09sfyc03aFI+LbuYqJs6ZwJsZytklkh7oGHZ7V7vFXVyNXSFUrO7D18y9kNgAlDc5x9NdI0lWkfdRdUHgHefwrzMBlO5oAHz/qHQuaA/YkTq7CuLqcr8MFLRCLJ8H1ZgCLy3A2vvp2tZckGF0B9JRzbN4NV5kE1rcoBuOkwUS33qLs4axT7D5+ycZsFShxlJtrF3Ze3OMuNmROPxYwdp8+rvQ81Mqr3N6JFNFVijfEq4YF9p3URBt9XWW2XkNMp+6gyHmaYluCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5rX/0LE6EGw60Ich9FPycqanCiQTU6SoGizLLC6aXSY=;
 b=TBgLQVVDsUGwD3fFz9XdB9gINQt8ASxWok7v5Z+mjIbrWvoXogtaZizTZqtdx+cAtZ97P4+JQxejvjgcLPdcyiNeXkDFc9ChsSH0Wq6DvX2gB6tPE5aYA5NRTq/HMRaXWYYu1W7MTZf0XWl7aiAi+Oz6VnIazL92Vs7kcDO5B+I=
Received: from SA0PR11CA0166.namprd11.prod.outlook.com (2603:10b6:806:1bb::21)
 by DM4PR10MB7402.namprd10.prod.outlook.com (2603:10b6:8:182::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.19; Fri, 6 Mar
 2026 17:16:58 +0000
Received: from SA2PEPF00003AE5.namprd02.prod.outlook.com
 (2603:10b6:806:1bb:cafe::72) by SA0PR11CA0166.outlook.office365.com
 (2603:10b6:806:1bb::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.18 via Frontend Transport; Fri,
 6 Mar 2026 17:16:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SA2PEPF00003AE5.mail.protection.outlook.com (10.167.248.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Fri, 6 Mar 2026 17:16:58 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 6 Mar
 2026 11:16:57 -0600
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 6 Mar
 2026 11:16:57 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 6 Mar 2026 11:16:57 -0600
Received: from fllvem-mr08.itg.ti.com ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 626HGs3j491523;
	Fri, 6 Mar 2026 11:16:57 -0600
From: Andrew Davis <afd@ti.com>
To: Guenter Roeck <linux@roeck-us.net>, Chiang Brian
	<chiang.brian@inventec.com>, Erick Karanja <karanja99erick@gmail.com>, "Grant
 Peltier" <grantpeltier93@gmail.com>, Jeff Lin <jefflin994697@gmail.com>,
	Cherrence Sarip <cherrence.sarip@analog.com>, Kim Seer Paller
	<kimseer.paller@analog.com>, Alexis Czezar Torreno
	<alexisczezar.torreno@analog.com>
CC: <linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Andrew
 Davis" <afd@ti.com>
Subject: [PATCH v2 06/11] hwmon: (pmbus) Remove use of i2c_match_id()
Date: Fri, 6 Mar 2026 11:16:47 -0600
Message-ID: <20260306171652.951274-7-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20260306171652.951274-1-afd@ti.com>
References: <20260306171652.951274-1-afd@ti.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE5:EE_|DM4PR10MB7402:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e6fc673-e39c-4430-e552-08de7ba42c46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|34020700016|36860700016|7416014|376014|1800799024|12100799066;
X-Microsoft-Antispam-Message-Info:
	P/KkemM+DWkCFeMD7bMwEQ0c7mbz24rdmShMMzft0Xn/Frgto+zNg+PFcQ9Pu3wH0zpD2bWVIdCK8YYJMI4WT+5cy4g+ZWXhscj8U9Apwjq4S+ohFJlNoL4HJ3ut//f6VJ720Vdxhcicr3rF5Y6TOGNCqj9dvrLfj8yxYp3z4FUPRONWF6XaOwXKixzTlQSXmNA7AdurVh7N7NdnxuPINcWPK+HVTYMX0jhpdYoSrxy4rqIc6HUw1oY1QpDpaYTQsMSg4rJEHd9wYOKkKYiyCvdY7TG+ytQzQrXF5WhV6vJJXcQaHmV5xMZVij4vo730Nw+DmgyRG3J6m2HALKGzlvliCaNBOHXP1DRgZ/pukEvUX/I0YipZc2JmdgPogK9J7Y+MjGeLCsPXf4J6g1xO/80+1eLPSfO/+RsLO47hPNagNcfmdPSzbx8wMaoarQh0Dp/MMxm5K7jMH6mP2XviGCe6y04rCRaxh7dwfKJX/T+WVmnXdXWzk9ES6I9VX2OxZezbv9BfgvtJlnNdFW4uwyE8fv+ldG5ilYlF6sAoU5X/ppxyEysrD/TMwqljNhd/kDH/s3RlUQlp8MGEaPWFPO4mcaF9WLv5UUw/Z6tficIFYLS1T1kBFHzhNo5DgmdQq39l6hNmu54axVewMXV7dmzDEX0uMwq7zFjNQ1wQT/07uagVAnKGNfg4+3Bx69vKrnqBUHTxfJ4rCgqMEagAajw42b/C28G+g4+6wBof2skmw5uWWHrNaoJNyRE0MefuKw6JYyE7M0wzYZ1cAgWm/g==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(34020700016)(36860700016)(7416014)(376014)(1800799024)(12100799066);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	xS6aWbuRa8lSAH9MjuvTn8nVgRQA/OC6CAsjhe6oxk/yzhCu6lxpU/Z0hUHfSjtyrNlajbZFA6KmwqmpYLSiu8T3Mvn0od0mvtZtbLnNPkEhWjvzRdCpzh/6ckM1XkamPhubtbs0RW2anJylpps30vGX/ZJAI0NzZau5ceBIYNNARfEMbiqPx0LxG8qwLm+IT+lKmcTkmMO6Pg0klItdzZ99ACwJrPt6fo3oHxa6nqmwSDpx9DaLWlOdftIxIXY98tD3glh3Pyjnq5sFmdLsV6XRSeP2US6LiAjGQ7N/cQ5ULGLy7Sc+erYT8kSxxWba1+2XK3o1eyYnRn9ordczymws1QShXdTVi49i8mXeZFYxRENkbD636aw1rXIiO6VeiJVuDo9FrPwKuysWS3m960aatmkj5N3YIPc3cRnYf/6kd7jYN2KCqSb98U7fKeQd
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 17:16:58.0195
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e6fc673-e39c-4430-e552-08de7ba42c46
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003AE5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB7402

The function i2c_match_id() is used to fetch the matching ID from
the i2c_device_id table. This is often used to then retrieve the
matching driver_data. This can be done in one step with the helper
i2c_get_match_data().

This helper has another benefit:
 * It doesn't need the i2c_device_id passed in so we do not need
   to have that forward declared, allowing us to remove that.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 drivers/hwmon/pmbus/pmbus.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/hwmon/pmbus/pmbus.c b/drivers/hwmon/pmbus/pmbus.c
index 920cd5408141a..d1844c7a51eef 100644
--- a/drivers/hwmon/pmbus/pmbus.c
+++ b/drivers/hwmon/pmbus/pmbus.c
@@ -20,8 +20,6 @@ struct pmbus_device_info {
 	u32 flags;
 };
 
-static const struct i2c_device_id pmbus_id[];
-
 /*
  * Find sensor groups and status registers on each page.
  */
@@ -174,7 +172,7 @@ static int pmbus_probe(struct i2c_client *client)
 	if (!info)
 		return -ENOMEM;
 
-	device_info = (struct pmbus_device_info *)i2c_match_id(pmbus_id, client)->driver_data;
+	device_info = (struct pmbus_device_info *)i2c_get_match_data(client);
 	if (device_info->flags) {
 		pdata = devm_kzalloc(dev, sizeof(struct pmbus_platform_data),
 				     GFP_KERNEL);
-- 
2.39.2

