Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azhn15010016.outbound.protection.outlook.com [52.102.138.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 662A036CE09;
	Fri,  6 Mar 2026 17:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.102.138.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772817454; cv=fail; b=jwqjqLDhTwr/n+f392aY4JxqW7x9M/ZrNE+NQABwmTGVmHVi/Zn8uesBPMDkALrqXAuiPiSsxNKOPpv+YOFeRpSnricigCMgQXezzSDXfnaQobYvpzuTty7b47yy7PgaudJajGeecX5Mt/Uggj0yL5SyyxXmsZ1pRw0y00nhVXs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772817454; c=relaxed/simple;
	bh=ks9uF8i2D/5YZqqiPq83X3WfS3WwkCMoZG/Y6MI7rfo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jxSmDJIos5qWiIorEBKu2b4ZA2vu4z+eS1Iel4yZ+BXybbtSCJZAK/hydTJ8PNIDm3EwNCzDXBNmPIpGlyAoMAvQ07loJQfi6fP0Mbf8iSlkGmjEF0NZV6RXEFm5cqMkERDIikd7D8jlq+gOhxXhPJdHioOGVeqCy3rcZLIzCFY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=IgrgCW3r; arc=fail smtp.client-ip=52.102.138.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="IgrgCW3r"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DJ1ECj9GR0MVfMHsw03h6oN1j9ADdM7+0494M0ShjAiEbth5v0tAt4AxEvMJMlsL7KDAl1IXQavcdiUXZjU6aVbtC6BqkVcLArh6RaeduNUjNwtAmvaO6udGhuP5vFBmQFw0SuH+CshZSz0HL4JygyBT5co8uxotnlWYcDCdUXKNFvajpUoRJoRBJGZqCce4vu2pQnY6eDaIXMBuEqxm9c0lraxojALf3vXwfs+KuBWXk81+qDZImKp2NApxCJVTuTF4taqzl44xIrhGXrecJqToaVdmzncQoTGTzfxE3wHZIX4mE99EzHVRt5t4ibtPz23j7Ohjyv+dJ5nIIunTtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7YKmaBkms3LxoVrwtPgD2bCiHvEE9HlrL1gmA29Tkhw=;
 b=CXffk5nAkHNKL1lG8kfGYuKGH7wmTjKZ4FDymRruPDkgLkQBMUMym7bhWGqyS3tAOALhTCL9j1zPmDpeBxMNvH5DLG8Dko6VJBbipFdqZHfQPSitYqoICxCgDsvHwRwmFrDg731rCSWIpqBIN7RsiRJXjCgWWuJrp1TM84ur7sH/TtzMv4zpaGi1EvPZfW0vkdgXO0JyADFhSVOKDZYBIHfk604mSLrIbXFiv51sKWU7nv8IGvNKtzRjnenTQuxHlWbL/1VBQ7A3ZuJYk/tsDQHkrycM2YVg1Ltv6Z1KMpa6ZmFq54Qt2Vb7ka1RmvHHJfYCnnJmHTc7e2nZKdNK8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7YKmaBkms3LxoVrwtPgD2bCiHvEE9HlrL1gmA29Tkhw=;
 b=IgrgCW3rRuYfi8JqfKjE/GzpJM6nyxUkoeZda6f/2BJAxQYbViQwgvwCQelzd0OzzyZfcKLgGmcb/ZBWrFswk/0VXJGl/v9aeCsz0YPnJfhQJbcbwfNLZi5g4Nt4TcAACU81c0gDcXGX+F8J+92JX7lAAcHcD9Ddn6091PfdDvo=
Received: from SJ0PR03CA0289.namprd03.prod.outlook.com (2603:10b6:a03:39e::24)
 by IA3PR10MB8019.namprd10.prod.outlook.com (2603:10b6:208:513::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Fri, 6 Mar
 2026 17:17:31 +0000
Received: from MW1PEPF0001615F.namprd21.prod.outlook.com
 (2603:10b6:a03:39e:cafe::ff) by SJ0PR03CA0289.outlook.office365.com
 (2603:10b6:a03:39e::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.22 via Frontend Transport; Fri,
 6 Mar 2026 17:17:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 MW1PEPF0001615F.mail.protection.outlook.com (10.167.249.90) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.0 via Frontend Transport; Fri, 6 Mar 2026 17:17:29 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 6 Mar
 2026 11:16:56 -0600
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 6 Mar
 2026 11:16:56 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 6 Mar 2026 11:16:56 -0600
Received: from fllvem-mr08.itg.ti.com ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 626HGs3g491523;
	Fri, 6 Mar 2026 11:16:55 -0600
From: Andrew Davis <afd@ti.com>
To: Guenter Roeck <linux@roeck-us.net>, Chiang Brian
	<chiang.brian@inventec.com>, Erick Karanja <karanja99erick@gmail.com>, "Grant
 Peltier" <grantpeltier93@gmail.com>, Jeff Lin <jefflin994697@gmail.com>,
	Cherrence Sarip <cherrence.sarip@analog.com>, Kim Seer Paller
	<kimseer.paller@analog.com>, Alexis Czezar Torreno
	<alexisczezar.torreno@analog.com>
CC: <linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Andrew
 Davis" <afd@ti.com>
Subject: [PATCH v2 03/11] hwmon: (pmbus/isl68137) Remove use of i2c_match_id()
Date: Fri, 6 Mar 2026 11:16:44 -0600
Message-ID: <20260306171652.951274-4-afd@ti.com>
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
X-MS-TrafficTypeDiagnostic: MW1PEPF0001615F:EE_|IA3PR10MB8019:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c4eeb3b-db86-4907-61f6-08de7ba43ee0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|34020700016|82310400026|36860700016|1800799024|376014|7416014|12100799066;
X-Microsoft-Antispam-Message-Info:
	oH15nJjKEJZzPyWZyL/DEEzJZGKq5KH2XPTUq5HQVM5bM0geLz94TQBpPhjKCTw8kq01r7eBhByeedQnJrBBYOEhu7Hn7TJvgJTqtPqFp9xngDgNnShkULpae6UjzayQ/Wzf1uXnVHtzA52oBcA7CQZYKjA4BwGZetrLxOA5sDc+CrFKX8IuIYEuiZKNJJrumHH2+Jg/qbp3X3Pm1CyXy4MOrBnvRJ9rB45AHBWaBMF+xGEC2Mc4InajKIQKBNFHNPoRkfmdppmjhQaMzcmN8M9PV5wIedgoelFU7dM1nH4eaf8Mg9lpBph+51LhGCvj4iz+6zyDbYjOQW5CoQw+Hsu2Y3TPVUx+mrTKtdilLhQsDVPHkSaIz4trMt6g/TMB20CmNBfb9Q5rrEdSqKxlirKK3oj5pWNw6Z7Bggq60tFin4IX+ymNNQ3StnG1n9cACkoq0TFvVuzokUIvkdYnHwRGJdn7IRSBk61Qrg5XFa/CzcqhlR2R0rSXALVgflxqcMpMpxQKG9/MvDjN6UJtuWBB19Hp5fBh4jUXgVxC0ZqhZ84kYuB1x6g5juDJ20MeZ4XEsGq6DsSp3S2M9TeLeUl/Fsix2za5Uvx30r8FNQWlH8xnGSHYqad9Jqr3JmESQ7gdevXmrm3+PVF+p5H2G0Eqf7XE7HqxU5pB2eXKv0hPIo8njXK3zYMOkxpve+kWPkMM6xl/AmPKkpdclyMqPWDr1wcmnfjGDCjkc4BVmJvpHIrvlj0vV7/7h91KNr/gK3kBrpJfgpMH4ChOIcu5JA==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(34020700016)(82310400026)(36860700016)(1800799024)(376014)(7416014)(12100799066);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	gpmBcPWx/yvY3gjeDdExSNaEbaxStrdtIGtHs4gRctitl7/v9KLqCip1eIalteBciMYgdE1NdQj1LoLZ/iDtk+m6gqtqnt/G8MFe2DfMVLox945cDqHO7x9loYY+fzoRXSGfervdpr2AwKhTfubMjtj4N5uaupVIJvMv5RrBPV7KGXgN9E7fXZXr8VHUwY4weuQmt86hAPT+ymJ9ss9AIoLGIg0wbXHSVPXbctb1SvcaQ/0yd9BnYNv1G87tA/AqJUL3qo+akQIJg8DBB4v+Kv4AES7PrpLpPliVHE6q4OiFNIJrpMknz9sqdiWI5u5x+bnWDU/P+XAvL0LRWitbDMnzvBaU/IVBHDpiN29qSQHi5O8La8nsyAVZ0RRm2V2IfmC1kH6L/efzYlqpFMJhYZGnJn0d8rzCQTLAIBXLjWroWn/FRlnnn89jMMCJNblK
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 17:17:29.1649
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c4eeb3b-db86-4907-61f6-08de7ba43ee0
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MW1PEPF0001615F.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8019

The function i2c_match_id() is used to fetch the matching ID from
the i2c_device_id table. This is often used to then retrieve the
matching driver_data. This can be done in one step with the helper
i2c_get_match_data().

This helper has a couple other benefits:
 * It doesn't need the i2c_device_id passed in so we do not need
   to have that forward declared, allowing us to remove that.
 * It also checks for device match data, which allows for OF and
   ACPI based probing.

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

