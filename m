Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazhn15010017.outbound.protection.outlook.com [52.102.139.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39B7135294F;
	Fri,  6 Mar 2026 17:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.102.139.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772817423; cv=fail; b=vGdUgwZrT9aDZSez8j51mXBzqJEwTZTn80Ty3bbnMcCBat9UcUCYfhX/2Yzh8xcKBDr5sYuLa0KFyHrKPWVi0RMEiYb2CyjylpOUNoMh0p3eArpd+WDNxsUQnN4nwuag4+OxqKsfWjlxaAEjbErsIONp/IePIMgWdF7gAFoFqU8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772817423; c=relaxed/simple;
	bh=mRlCReD99SdAjNyScn0QUhP9WJjZUd9LwkUEN2vSXLo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=j1bmv9LAMfhLm9I/Ab42GkJzdmQ5LL1Axh5yJVRa7SI5kd9xsNn/rOpBmA+SiuK2R3LiXAd0pzpjqBMqnrNRYIgITiLfMoFH1mp2qi2oU2xqppChTtuB0n9SfbhK7RXpVp4Ne9NlHX9OH6NR6d0IY7aqNB8m0g1+LPTFp2tfH1k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=dptaeOAh; arc=fail smtp.client-ip=52.102.139.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="dptaeOAh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wjAPRm5IvarO1zTpmWakIyIvm8bJjZ5EgxcZ/b+4aH3GaMXknlAqo5jf2yxY/E/ZL/dwW0w/S8t/5D9rzaGhemdz1KqcxUIwqkE4EVgO7RSnKXZeZfmjYAYNIzNwGXtQQ9689/ijyqUmQBX5atKNTFYYFeDAT+OWY0aLCgO6/mTLxzOpc/VtvPU8++yGaNHYFvXmkYStItc+jAS3+akMycbxTJpy+vI8Zjd23+Oi1JAyzXCYOvV5HlO4ydoNPYuLzgC1Y1lBJNxT48paImqOHrlYeBESRFH3vc7TpMRgwUpfULm4aYyIerIfhyMOSQ2svIf1LB4BxYZAXY0NfTPBdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TsVQbkTRt2GUMo4WogkKPYNZQ1T6LfCnJkiyzUtF9XA=;
 b=w8gdBRNs/gN5ZCK0Dc2bUfksOlXsvfkJFhz6WG55B/jQVIjZ4dAuNJdjiAZolEMkoFRkzkG51rel87YvFTtAtHB8bbV4fT/MlTpcHH/deP8IHoimMQ98dnEWxL63hK+IQBa//xWmitJj+kKQWHuGAw6GpbzaJChg4aceGWw0Nu53qXDAaTvVVTJQBOlKMO6OTZzfeJY4WNAqT1masKY/ZHFJRuMSz8TqNK+ppJ6ahPkZNHK9NAe6165KDbcgBJohnNraY9GQjAwq5SMEZLi5JR9JnHPOo0YykJraabLZpVDWgDBnfL4SlA3oFCxG1Nu8ACF5vJZpa15pVvxgTBz4qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TsVQbkTRt2GUMo4WogkKPYNZQ1T6LfCnJkiyzUtF9XA=;
 b=dptaeOAhT4yAN/pUZRVtez8T+GgwEstfgxdtcQjU3W/TuFQQc9AqFSkVzv/MrzFvKS15ubaabcHIlxKaY66JtKs5zqbADob2RbTzmpLuxKar4rzOy+F4ojw6WNh3LQXHE+gU0Tb4//s81PCohm4s7K8R/3fCHlwj0sKGKc+TraI=
Received: from BN9PR03CA0500.namprd03.prod.outlook.com (2603:10b6:408:130::25)
 by DS0PR10MB997555.namprd10.prod.outlook.com (2603:10b6:8:30e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.20; Fri, 6 Mar
 2026 17:17:00 +0000
Received: from BL6PEPF00022571.namprd02.prod.outlook.com
 (2603:10b6:408:130:cafe::65) by BN9PR03CA0500.outlook.office365.com
 (2603:10b6:408:130::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.20 via Frontend Transport; Fri,
 6 Mar 2026 17:17:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BL6PEPF00022571.mail.protection.outlook.com (10.167.249.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Fri, 6 Mar 2026 17:17:00 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 6 Mar
 2026 11:16:59 -0600
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 6 Mar
 2026 11:16:59 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 6 Mar 2026 11:16:59 -0600
Received: from fllvem-mr08.itg.ti.com ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 626HGs3o491523;
	Fri, 6 Mar 2026 11:16:59 -0600
From: Andrew Davis <afd@ti.com>
To: Guenter Roeck <linux@roeck-us.net>, Chiang Brian
	<chiang.brian@inventec.com>, Erick Karanja <karanja99erick@gmail.com>, "Grant
 Peltier" <grantpeltier93@gmail.com>, Jeff Lin <jefflin994697@gmail.com>,
	Cherrence Sarip <cherrence.sarip@analog.com>, Kim Seer Paller
	<kimseer.paller@analog.com>, Alexis Czezar Torreno
	<alexisczezar.torreno@analog.com>
CC: <linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Andrew
 Davis" <afd@ti.com>
Subject: [PATCH v2 11/11] hwmon: (pmbus/max16601) Remove use of i2c_match_id()
Date: Fri, 6 Mar 2026 11:16:52 -0600
Message-ID: <20260306171652.951274-12-afd@ti.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF00022571:EE_|DS0PR10MB997555:EE_
X-MS-Office365-Filtering-Correlation-Id: 62e2489a-f5d2-430a-681d-08de7ba42db6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|36860700016|1800799024|34020700016|12100799066;
X-Microsoft-Antispam-Message-Info:
	6q/igSuF4bNKn+P/v5JZE9DTfBBHzfsfZoamPcgWj5FDZfd1L+wUqQKgj0JgcLw2xN+cEXOuvyDNQzIvEeP2c1u3bMFEQECZ2qLN6aQNbKGwrIik5xq/85iLAAzutY2NPeUTFilMG4p0et/0kHZa2ZHBoyqkm41EqyuPj7oP8FvZr6IjuYNgrDY3+DqAD5Cw9dWC0reUn0RECleY09r9lH1cbB4bSBzq51mEcdL2v8VLtOyfbNaqzckDgzFzcFCrqrQySl06t/FbS3NUKEL0savLWLM7NP+Eb4UwcPNuYbHrmeowfCgjkbJzz0L2dFuezgE8WnJtLrYnZmoAqUz1ihxaKWMaKzToTLBD3hXOjA6KFYwE4Jxh/VabGz0qxlQcQtUBcRZDIkpAPVxRS0cqBlaTdm9+7bgrRk0Tc9eheW09d3/f+KX/x71tQjMuThBAItpJxQv4wDD0zUyIYJ0Dww04rcpcxAz8QaZa8KsiUqgxTAWsQF74tl8MqsqxQ0cOGDDfEyEYdmIWn7BCHwI5odn1yCd4m9JitcSV5eM2E+tKAyU360Y/TTuskuOuaCxoEIYobdiCWw9j/uJAMngN2i1rQ+z1u0H027HhTkxDqQy/iFvWS3pWITV3lCVjPF8DG+eoWKXo/AMitNDFiIiart6n5r9V+27hYi0lXTDsne+/29IEkoaqBVUL0hWMQ5ax04pATnnCVvK2w3qb3Yes6Q6Ig58/f0J4tW9UPzpcKWItXy0831zPg7fU5FJGFKYOqKIqhkjv4l5qVTQIfGIo5g==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(36860700016)(1800799024)(34020700016)(12100799066);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	+LrnWxRXOfsTY8+eeIlaxGOv6WrSzhLNC/7n5fJK32ktHC1iCKvVGzHAXaraa2U41sIUYJv0hIE/cTzuIo4h33gUEIPGpMacWXaxupneaz0ajHp+Bh6TlpQKttVX+a1YKAO6cRC2ftAfNIog1zzpBA5C5bzF6a64y5GWbw5XTMFCsYJ5VU8+uaM8xoz71mKzYW2/V3r0xCRfnwK8PamoIvC6aas7+c6yGt30ajRu8FW46hHoHcqyAn45UuLMVSFCx/GwK1MMQ1dZbncL3/7M03QsCcXNT2yGz64/CAbV6kVk+TWaBy8kPyU/E/nMqBkbx0/HnNedXJybQyDBuJSe+lkpMKcnID4X0FtMR+hH/0ogDheYwEZHt+RMNzHI4ZHgzuyKaxr5855Q0lBG+3gF+3z3mZ7LrKyJn0GYyWAjRVQOnmt6yn1Q5J30y48lchqS
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 17:17:00.3854
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 62e2489a-f5d2-430a-681d-08de7ba42db6
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00022571.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB997555

The function i2c_match_id() is used to fetch the matching ID from
the i2c_device_id table. This can instead be done with
i2c_client_get_device_id(). For this driver functionality should
not change. Switch over to remove the last couple users of the
i2c_match_id() function from kernel.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 drivers/hwmon/pmbus/max16601.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/max16601.c b/drivers/hwmon/pmbus/max16601.c
index d696e506aafba..36dc13424d929 100644
--- a/drivers/hwmon/pmbus/max16601.c
+++ b/drivers/hwmon/pmbus/max16601.c
@@ -318,7 +318,7 @@ static int max16601_probe(struct i2c_client *client)
 	if (chip_id < 0)
 		return chip_id;
 
-	id = i2c_match_id(max16601_id, client);
+	id = i2c_client_get_device_id(client);
 	if (chip_id != id->driver_data)
 		dev_warn(&client->dev,
 			 "Device mismatch: Configured %s (%d), detected %d\n",
-- 
2.39.2

