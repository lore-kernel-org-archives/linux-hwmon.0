Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazhn15013060.outbound.protection.outlook.com [52.102.133.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F7B36C9E8;
	Fri,  6 Mar 2026 17:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.102.133.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772817424; cv=fail; b=bY6rcd2wn/WcXxfQK52PkV6X3xHdXpM89EYG7G6j0UEw7r5hX/N8VtcnUhwAE8sIubmTheTXtTXFSoU0YHlZo2t63CwNnAzYHKiNXlUuPSEMWNcARPoXN85Mtejh7/CaQhxkMlSt6C7QpDXEetcjE/Rvrot2E+94dQMXnFbQw5c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772817424; c=relaxed/simple;
	bh=b/CKb74/fESY6vUqdvNtINdhi8NV5y4zJNKhu+2uqko=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=G+c7JqIyyXJDU2QVHZgpxAuOIC2TAzSfvU3fErtrcTzdR83hiqOZsJcu573iX7NCCcd//nac9rH+ZGQVdpdYTQlNn+uAEJVwJjymepA8abb3QNIrkRKVCflMkkALLIaITXdzILDdyZCQvQb0RG06QIHEmRNkzOwOGbQ443DhlE8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Gb6ODb1P; arc=fail smtp.client-ip=52.102.133.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Gb6ODb1P"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=niVZ5lec+lD2VASTHTHNFJh0WhQ3IIgX2bskcGGS4MHaZl4wE2ntD6zr9tCcc4eRvmOnjd70wHT1lMOPo+hyYVtopeLfVIZ+GG1eOP2h7I3erzGJQ+hEjMlLS+d6g3VY05Jw4/YVigFY6ND7QrGvY0JS6Xfr/pVdKMeWmdS0ZaawziGSESagOpYbuaaZsa4d0n+EWm0kJmIPuGPFBJ3NKSf+i9Zmea3sGq+Xc8jDsKrFn+92gr6nfoAdIvZAlgVg4gMURmsRjOjyjqbfGjLzAl70CWou14Wz9HX9YfEGfJyeag9WfG+hAKiDS7Ztq1Ec3Qf5PKRofYQk2KL1K+Iatg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UFFQsovjIsWEbrRCa2Bq11vK3j6wJJ7hUqFprgThE88=;
 b=mDt0Bj77Opry/ZRzmKbb3FJftMFeOmdPWBZZeBOMK+Eex7kuwA86n6zz/KOXfiBzpa2JupgVSaNA6ZOkZ2Ubh8IwFVPLGze9Bxz87wbWrRNbAEy3nzvPP4JzPu4dkdbawESrc1QxY94rvKYypHDe/uGsCEOvFRqjADUmLiJoRcx//6Cf3k5naJgZg4gJy1igtBvxjfu1zp0d+E44WNoDInFTeaO/NRIqHe/wB2rZEToFlOAaI8n5E9vhq58SmsHl6xiRyWfgQ6PFwv6KpDPJFV7aQD7X7RZAfkY0a3/0YMfADQeD2feqhUdwp2mlM6fE7cYJTCu+5R5JUG/5JAhhNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UFFQsovjIsWEbrRCa2Bq11vK3j6wJJ7hUqFprgThE88=;
 b=Gb6ODb1P0DZv1xrOW18f12riqiSji9snyEZJFfIP0t615d+z2cBS+MZPidZORuXFA+LT3Qiv30GT2QWli/6ErOJUdIBMO02L1SRMUAK4WgAnfMhaHZ6EpATXl5Va4TrKIrqWfJv1rPhY0de0WynpdEGnnvmYVtQrTLhess4+my4=
Received: from SA0PR11CA0158.namprd11.prod.outlook.com (2603:10b6:806:1bb::13)
 by DS7PR10MB7226.namprd10.prod.outlook.com (2603:10b6:8:ed::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18; Fri, 6 Mar 2026 17:16:59 +0000
Received: from SA2PEPF00003AE5.namprd02.prod.outlook.com
 (2603:10b6:806:1bb:cafe::3f) by SA0PR11CA0158.outlook.office365.com
 (2603:10b6:806:1bb::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.23 via Frontend Transport; Fri,
 6 Mar 2026 17:16:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SA2PEPF00003AE5.mail.protection.outlook.com (10.167.248.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Fri, 6 Mar 2026 17:16:59 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 6 Mar
 2026 11:16:59 -0600
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 6 Mar
 2026 11:16:58 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 6 Mar 2026 11:16:58 -0600
Received: from fllvem-mr08.itg.ti.com ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 626HGs3m491523;
	Fri, 6 Mar 2026 11:16:58 -0600
From: Andrew Davis <afd@ti.com>
To: Guenter Roeck <linux@roeck-us.net>, Chiang Brian
	<chiang.brian@inventec.com>, Erick Karanja <karanja99erick@gmail.com>, "Grant
 Peltier" <grantpeltier93@gmail.com>, Jeff Lin <jefflin994697@gmail.com>,
	Cherrence Sarip <cherrence.sarip@analog.com>, Kim Seer Paller
	<kimseer.paller@analog.com>, Alexis Czezar Torreno
	<alexisczezar.torreno@analog.com>
CC: <linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Andrew
 Davis" <afd@ti.com>
Subject: [PATCH v2 09/11] hwmon: (pmbus/fsp-3y) Remove use of i2c_match_id()
Date: Fri, 6 Mar 2026 11:16:50 -0600
Message-ID: <20260306171652.951274-10-afd@ti.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE5:EE_|DS7PR10MB7226:EE_
X-MS-Office365-Filtering-Correlation-Id: 7add2613-3354-450e-431f-08de7ba42d17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|36860700016|376014|82310400026|34020700016|1800799024|12100799066;
X-Microsoft-Antispam-Message-Info:
	ZhXWFDduvbc5+hBNZovIJJcfcYbHEf1uWz1IhK2w+db/d4NrI1Yf+5Ko/hMQClTdgHEYHkG6pzoeDICmisn2eJ+DIU3DzxgrEny0H5tHHRamhJTZ6aaHodArvhj2K9IZFYp3QHSO33OTtTRWaoZZIdeulO3fabXaYasILTtCforI5grRtKg0uTgnrsfE2uN5lzb1hYAIxZvG/OnbhaHsrgsJa0VPBPpHMctB/S6iOqecMdBNSBSjcpywqu4TEqHUl9pylAfjqZ1SqLLIy2P+ERm2N4/sEQ0RXh71a0D1PQpS52HdeOSHtbL1BWYBXBM5W95GHa2diosXDSiqt+YDbnfeoyHdnwhsTjIgNHsSUTldpfyhlM7H2MRVoy1VooycfGePhaVhX5qtL6uhTQyC8j4hiTsxWm5FLZ/WSyiQpRbFC1XTQT9JU0fvAvI9DiIN2ZGgMT7ox3814rsEm+reebJDcUUxJKwIBdOKfHJ86a+NyjT7TGbWVl6qNXtXgFcG1ceqKLhrx/N2pRxRAGpNzE2CYen+g8PoPHvSolXUrmZe8hBz1n9U9YQKdahmrezSfQPDVgHnzoTqbwFeZEuTfaMJEL4DO0wggTGbrVirm6Kvh1ZywB3XtBz2mlvX8b8LNcqk+UO0JU3ahbYDBXFLfZ5FQdKxMQs2eR3iXHcfxVLEQ6lTUGszlBUUL1udwnaCLbQq3+an+k3tTBVzFaoNgguv1pu2alRGzA1Eo9K8XOZGRayBGXl9ChCqIHWX3X31E/llROVkQJen24lF1/Am0w==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(36860700016)(376014)(82310400026)(34020700016)(1800799024)(12100799066);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	F5XCFMNrrXl2YvInAVbdz8z+ycI5G7XnCB5NJVC0JKFeOxjFimE+4uRDumgvGEfG8/BXXtkfDAPWjt401/PPfkJhWUdduc5S7j7RXyzJ6ZUyJ42LLthq7kKl2QJe34exgz77S2VH+h71nZpsksNq55wrCV5B9ps8BMrNNGBJJDNFGgyoEZwY6smrc4veq1L9kxicIohvNQojZPLIV5khF8Xltkp5HPwSNYVZtiCLXQnx1ZaW9+BgUaTJCKltTyACe3wShUP75exq9X9tucqiVegsUXsgX7SddQT5V3SiohneA+zrYlDH6vqwWNwLlc/o+lWpmuuHurgmEwm7/o2w7WlthPZqJD7RJoNxsGFiVcGchwPwwrXsX4PB/GRKKyx3xS8FboPEA02iAT+9As5QUjYinzEnefpzT56Zb+/s6RGe0yYHn0u0HKf+yMFYuKTn
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 17:16:59.3789
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7add2613-3354-450e-431f-08de7ba42d17
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003AE5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB7226

The function i2c_match_id() is used to fetch the matching ID from
the i2c_device_id table. This can be done instead with
i2c_client_get_device_id() which doesn't need the i2c_device_id
passed in so we do not need to have that forward declared, allowing
us to move the i2c_device_id table down to its more natural spot
with the other module info.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 drivers/hwmon/pmbus/fsp-3y.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/hwmon/pmbus/fsp-3y.c b/drivers/hwmon/pmbus/fsp-3y.c
index a4dc09e2ef75a..cad4d23300036 100644
--- a/drivers/hwmon/pmbus/fsp-3y.c
+++ b/drivers/hwmon/pmbus/fsp-3y.c
@@ -222,12 +222,6 @@ static int fsp3y_detect(struct i2c_client *client)
 	return -ENODEV;
 }
 
-static const struct i2c_device_id fsp3y_id[] = {
-	{"ym2151e", ym2151e},
-	{"yh5151e", yh5151e},
-	{ }
-};
-
 static int fsp3y_probe(struct i2c_client *client)
 {
 	struct fsp3y_data *data;
@@ -242,7 +236,7 @@ static int fsp3y_probe(struct i2c_client *client)
 	if (data->chip < 0)
 		return data->chip;
 
-	id = i2c_match_id(fsp3y_id, client);
+	id = i2c_client_get_device_id(client);
 	if (data->chip != id->driver_data)
 		dev_warn(&client->dev, "Device mismatch: Configured %s (%d), detected %d\n",
 			 id->name, (int)id->driver_data, data->chip);
@@ -276,6 +270,11 @@ static int fsp3y_probe(struct i2c_client *client)
 	return pmbus_do_probe(client, &data->info);
 }
 
+static const struct i2c_device_id fsp3y_id[] = {
+	{"ym2151e", ym2151e},
+	{"yh5151e", yh5151e},
+	{ }
+};
 MODULE_DEVICE_TABLE(i2c, fsp3y_id);
 
 static struct i2c_driver fsp3y_driver = {
-- 
2.39.2

