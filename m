Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazhn15013046.outbound.protection.outlook.com [52.102.146.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3C083EDACA;
	Thu,  5 Mar 2026 19:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.102.146.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772740620; cv=fail; b=j//h3+eJpAAiYSL0N/fHfdCZKgwmxJzDjpnxaFs7kuRzS0T7h9CqFLqzPJD0u5FURbinB+HgQEIyfj5Bo//L95N1qwcmPE2JQ0+U/SqKNEUm9bMJKZ9PzVgs9sAQ8tl/gEmznR1RhGP9AIlc/myATqZYv8fcOTr5KPXZB1/me20=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772740620; c=relaxed/simple;
	bh=oqPmkAXo+M5UVHttrCubd/9tiMbN04ET4Xxv47IjZ+A=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RFmGDrgLWZhtPAuOvhxc7qA3fBO4Id25PDuQKyoj19wvqs9xC/4bH3xkycb2LrtoCgu1bT3bhuBlvbrAZtB5o0Ntb+31jgpSamcnjYhx+35yw72edMI7J5W7l6JWpEkfC1jZRM9ksO0y0vrth9Hy+sGQ4weTeCZo4XjAqzvtk74=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Gu0GZEXZ; arc=fail smtp.client-ip=52.102.146.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Gu0GZEXZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dUp8nKXteJpDM8NuJNb2z5299Nxh08vXwEUuGp33ma22ii8NSoRSoO6jzD37uyvC8FPUMf+e74GCqm6+CZYB25StEtM0FCjvjSl+JKTrrmf1j6bd5/N/Xr5+jsBCiWo8vbyS81ZbYTY+MewvZirRRx8yUZfPsBD517lxpMKYUds3gBy15cfOS1z/p0O+04SXwaA6/x4l5j+pN36ZmYQQbX1V/N29GpHIDqaOVFQfwG2JuFggKxPVvz9EaKYXZ4bj4aepKhAY8BwaMGqWhFFcqhyPF/Ideg8+9o1Rm6je0f/jnm/74qqDefxcW9kpF0bONFX5r7KYcOKrxvRkN3N6eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GEQclGimqpjd0t2JuEPa+4Wm/5diwHq/DAzZ6OK26WM=;
 b=k5Tnrgj3pXSmfs8vGB1kk2m3/Zm06l4ySpXNPj4Ho4o4jTq5d4e78r6L8g3Ave/Oqhh3Hbe/HbxZcUDXF3qmOr4JBw6obR+G3gA1VjQC2qJjRxDSe9uqsyhnBGt8wKE9u6ZFPV8k1k4lmRqKwGozouo7fyZq7zx4IQYWU9fzfrxnnrVS12m9nCQbBgF4NNy8alhi7gAu4XDOx+CXDwD8HJiCSTGWXceNh7nrd06frsBC2t2pfu3knUh5ZNDYPXtmnj9ERL4s1TGmAiCdo9TGGdxdOFL1pnTQYq/iVIne4t3I1qOKXBtmw93dM/oAiZQwWikYrZ8sX+F50N/B9/L9WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GEQclGimqpjd0t2JuEPa+4Wm/5diwHq/DAzZ6OK26WM=;
 b=Gu0GZEXZZ7Qa6FQaVsj0p0+1rBSt6qyv4GEtidPVVh5gUOMgppxbEcoqJC+HeKsds2f8uJMjTUqZYCLhuhEquZ6Kk4DkIVX6uCYqER4Ealpb63ySZ+zSrYKXh2bra7chKKa5bFUgZ3dbL5y/OGUbXGMG77BUtum1bkqEk/2xqGg=
Received: from BY5PR04CA0023.namprd04.prod.outlook.com (2603:10b6:a03:1d0::33)
 by IA3PR10MB8684.namprd10.prod.outlook.com (2603:10b6:208:576::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Thu, 5 Mar
 2026 19:56:56 +0000
Received: from SJ5PEPF000001D4.namprd05.prod.outlook.com
 (2603:10b6:a03:1d0:cafe::cb) by BY5PR04CA0023.outlook.office365.com
 (2603:10b6:a03:1d0::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.26 via Frontend Transport; Thu,
 5 Mar 2026 19:56:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ5PEPF000001D4.mail.protection.outlook.com (10.167.242.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 5 Mar 2026 19:56:54 +0000
Received: from DFLE209.ent.ti.com (10.64.6.67) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 13:56:46 -0600
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 13:56:45 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 5 Mar 2026 13:56:45 -0600
Received: from lelvem-mr06.itg.ti.com ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 625Juigj2456638;
	Thu, 5 Mar 2026 13:56:45 -0600
From: Andrew Davis <afd@ti.com>
To: Guenter Roeck <linux@roeck-us.net>, Chiang Brian
	<chiang.brian@inventec.com>, Erick Karanja <karanja99erick@gmail.com>, "Grant
 Peltier" <grantpeltier93@gmail.com>, Jeff Lin <jefflin994697@gmail.com>,
	Cherrence Sarip <cherrence.sarip@analog.com>, Kim Seer Paller
	<kimseer.paller@analog.com>, Alexis Czezar Torreno
	<alexisczezar.torreno@analog.com>
CC: <linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Andrew
 Davis" <afd@ti.com>
Subject: [PATCH 03/11] hwmon: (pmbus/isl68137) Remove use of i2c_match_id()
Date: Thu, 5 Mar 2026 13:56:34 -0600
Message-ID: <20260305195642.830695-4-afd@ti.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D4:EE_|IA3PR10MB8684:EE_
X-MS-Office365-Filtering-Correlation-Id: 104e43df-13b5-4ddd-51d2-08de7af1598e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|34020700016|82310400026|7416014|376014|1800799024|12100799066;
X-Microsoft-Antispam-Message-Info:
	1lfiDs7E/4ZKal9W/dCSBCKp4AnPCt3i6uUzbtCSZOXTUFdEZ4PrHACSmBOi63iueqVcsLCfwAwUqDyl6FiSutGOxS01gtyxxfsOLehulOKRxgelu5eNd2XuFRccaqyZx+BjY8Cgd3OUSyEx4l/f3O8Tmt5p/EXBxXZANxT2R/0aluUJjfzrPZVudaXr6oKvGPjt0sd+cVZabyIXHyoVfVzAX+rXg16Jw+iJB7WPkhE18RUoAaCJFpKYenWLxGYjkW8Q9oBDKiL40STD4Iudhf6OKRUbYpM1gbXZQd/ufSgCsoGhFlfivQJv+euoNN97O0e43ElqqoBwPg1Bkq2vHFnPJ03qMyCpRWemQ3+dkMMf0yjTJGYBpvlEW/c7SPH6OVcfG2gBhDJNJHJzgIxFuvBL/6HD/8Z35xuEtfuQ1jCiycG2tsYPUE4GyvVWPyWhEk/VhI1WOe46164EIRN4hCh5S+L/DMITTdD39xmqnUV8YrRBfOqXAfIrlzncjRtuI7pnfudnOCGh56cFmqq1SxXOOWgW5ILeGLNHye/RSNmYCRX4qNeN+54UB6Xrj3u9BqsztlLKqtBc6LeILd52NAlpQsxte+ptC4srm0WlSUejGfQhOxbH6eNbuqn8Pit7o5yyv7kyCCqC28F50xkF1GZpy3KEJ/SnXoSSbE0bGbDHXaLLB/BtSDy1HDGbNEAxlPovLczU5wxBnWkgV/dMxAq9JzSnjADwatyvqFnS/rpos226YP5oQ/IltZNqvZarC742xLjvfGMhF4DTAcjDOg==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(34020700016)(82310400026)(7416014)(376014)(1800799024)(12100799066);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	feIgILHSsw18CIkWMmBcytsI/el8Ms7ijw47iaj+4swoOBnnMRg+LToHaPYn14M7tx+phefsW0e01dQA/6gJJLQ60Hkr/0DC5/BgIUZTxnViGeEamt1kH5xMVyH/HOFJ4bEPm08oh+/1FK8rkxPTHaro9sTEIMHirF9kpq5klkBU1j1y3A9gtJZ1DX95XvxuW0+Eo3jw+zZRnegEgNu7NuBCuvijq8EoOoTWj9w6fmG3wSTq8KrW3Owxp74afqrAYxQIz0r9mdf69/C91jhETJKjLKuOWMzfyX/o2vq1aUJctPrAydPZkEq5nt3AJAjAYkVuSNG1N51R5BgN99gAvnGqy50OI01+aFdrJx2/e6cyE5ZmxnGflkg4C2JAm0dJ/l5YfCvU1rH77l/tyWyLyHzbCltC9VJdL+U/1/xX3zGzEQCmr7YKdgu8Ls+DK3+3
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 19:56:54.0080
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 104e43df-13b5-4ddd-51d2-08de7af1598e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001D4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8684

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
 drivers/hwmon/pmbus/isl68137.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/hwmon/pmbus/isl68137.c b/drivers/hwmon/pmbus/isl68137.c
index 97b61836f53a4..78cff97128541 100644
--- a/drivers/hwmon/pmbus/isl68137.c
+++ b/drivers/hwmon/pmbus/isl68137.c
@@ -90,8 +90,6 @@ struct isl68137_data {
 
 #define to_isl68137_data(x)	container_of(x, struct isl68137_data, info)
 
-static const struct i2c_device_id raa_dmpvr_id[];
-
 static ssize_t isl68137_avs_enable_show_page(struct i2c_client *client,
 					     int page,
 					     char *buf)
@@ -375,7 +373,7 @@ static int isl68137_probe(struct i2c_client *client)
 	memcpy(&data->info, &raa_dmpvr_info, sizeof(data->info));
 	info = &data->info;
 
-	switch (i2c_match_id(raa_dmpvr_id, client)->driver_data) {
+	switch ((uintptr_t)i2c_get_match_data(client)) {
 	case raa_dmpvr1_2rail:
 		info->pages = 2;
 		info->R[PSC_VOLTAGE_IN] = 3;
-- 
2.39.2

