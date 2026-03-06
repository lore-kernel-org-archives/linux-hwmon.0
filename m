Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazhn15010018.outbound.protection.outlook.com [52.102.139.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB0B84218BE;
	Fri,  6 Mar 2026 17:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.102.139.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772817460; cv=fail; b=fuwMTvu4G7spdQMC8NQcFi88mRnjNyyaowM1PyJrPRQege6Nfy14rUzHlWAPKab8MNHCErqaJxkOzTnfP0lSZX79NWZg7j8D+ByR4fNMXMUbLodJpurL2mhn5b2nF9yFlCXVtTQd9h/m7Yl/2F1KT2CQW1BG3yRpWL18ENQeCos=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772817460; c=relaxed/simple;
	bh=KJPe742Rf7w0WBiCGTYKADAjIIzGd/0ZRVrv1X5CNEM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JsK6wevnjuo/yyj3BwGnH6DwvMcqAc0NmEWXfV35cJ6xCQhvZ4Qqbest8eINbBeCrV86AMetCy6ymy5rQGYoKmZONP6qjCAKAKwyjOB3l8HEcc0mQ/l/RAcPErwBi9XDjnA7m9ixVecqbCkCKE/1II4N300JCglMUNlShobwE4I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=DpA9k5JZ; arc=fail smtp.client-ip=52.102.139.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="DpA9k5JZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OVdbibJzkpZpS6W37VE3l0h8InCfGZVJky1X2cNDdwfMr1lO8jEifNfRs3Y4pmGc+sDiS7alr1Gh0Rw+0iugG15RAStyJOQX5V3uZEzSg/zeTUagHSUkIin0bPKQfnk2V9/NsVZBrdCF28HI4YMaRlZfqjYwmnTCRU1YO1X3Dt6gMIfyx2YAX1m9j0KkR8Yq3U0BF1dlKgzPayHz7y19OvYe7gck4LhzE0L0fLq2vGGYCGrn0JYFBbI9+grWDOk2OuMDitC9Jhs3GiEtFrf+N7a/braTmgD/q24EVjgqhhhRKFjlNwL7HEucy9o++FkrI/jnS/PpngIABhgvbIJ7jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nc9LYfvIx9KRIkjedFaraUkN8I/RjxvHrNN0AKVYd3g=;
 b=DpQiA2uoCNQRgevESxRM+qoAurELfs3fQoy4qKJUfy8g6M8cxYdxF7x1TwVx1MnmayOBv3v3Oont2jmHqJ4eVqUCGONy7JMaGUG0mg9tUlPyfj26fN5TP3FGQ4SZYvsAJMaXpQOwAKtTLr3KAr6ohX6lDdbJY4OoDyYAc1giBztGkpHLhT6OQx/O7dwEYNRucxSm6+MAixUeWOl2NDQp3hKUGW+msjzaYXQKURYNolBA6myq6NQa6a4RwY9HQShQxewaJOARX/uZPpBJxtWlq3RltD97zX/CWhbEHViZlX1Fk4UiRSBefsURDaJIM1irKAhWV1UMIOFms82IgybHbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nc9LYfvIx9KRIkjedFaraUkN8I/RjxvHrNN0AKVYd3g=;
 b=DpA9k5JZPvQapkC66/m5cblBDQHKm0gh2GngS/buBkk9AQh7QM3BtJ3mA4k1Nasb9/Vqld85M769qnuS0ZBoRjdLJVAlDJfQTBJ2l+hMVTo+BLheoRhA2Ys8jZthzdRW+33JaafxpOOb1c1kOwPBn/Ur97tnr5nSfpmfQ/AeCJ4=
Received: from SJ0PR03CA0287.namprd03.prod.outlook.com (2603:10b6:a03:39e::22)
 by SJ0PR10MB4560.namprd10.prod.outlook.com (2603:10b6:a03:2d3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.20; Fri, 6 Mar
 2026 17:17:36 +0000
Received: from MW1PEPF0001615F.namprd21.prod.outlook.com
 (2603:10b6:a03:39e:cafe::4) by SJ0PR03CA0287.outlook.office365.com
 (2603:10b6:a03:39e::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.22 via Frontend Transport; Fri,
 6 Mar 2026 17:17:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 MW1PEPF0001615F.mail.protection.outlook.com (10.167.249.90) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.0 via Frontend Transport; Fri, 6 Mar 2026 17:17:34 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 6 Mar
 2026 11:16:59 -0600
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 6 Mar
 2026 11:16:59 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 6 Mar 2026 11:16:59 -0600
Received: from fllvem-mr08.itg.ti.com ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 626HGs3n491523;
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
Subject: [PATCH v2 10/11] hwmon: (pmbus/ltc2978) Remove use of i2c_match_id()
Date: Fri, 6 Mar 2026 11:16:51 -0600
Message-ID: <20260306171652.951274-11-afd@ti.com>
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
X-MS-TrafficTypeDiagnostic: MW1PEPF0001615F:EE_|SJ0PR10MB4560:EE_
X-MS-Office365-Filtering-Correlation-Id: 042d2ef7-2c8c-489e-87c9-08de7ba4422c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|7416014|376014|1800799024|82310400026|34020700016|12100799066;
X-Microsoft-Antispam-Message-Info:
	M6zNctAF7wd9GuuBEjw/gO0vtGxELLzscA9xp1mVVUTzjKsdTFOyurr9MH1upooeCeW3S0hUN6ThQN3S1hhcHKHsK+cyEcQ0na2SSnu0/Yy7UmQhBhJPtR9RUHlxl/jJH2ZfwSx629NAIWvBrIb64cQsY9qv3G2wZS98P7PUXUq1OvIZqTekZp2gfyWxD1Vd8ZOa+KcNTEnDpe+kJVEG579phKfdeSSLGR9lD2HMJgIOJ5K7Cpy6i5VAF1L2X/2o6N9ZluIvKgW61r5F3vVuhaTSpd9Q5I9c4O9slzpL0L9hm47O+FZH8w7KNGMeO46R3HgnVomptuz+ZD4hlrG6wDmdt70Ao8gByCYj13iNQ6aq4uc8MuiIaTQcRPihTforJ7W5bdezODpu4wdbEzp9H4fYDFfF4ixkFCimgoshlw0FPdGi3gX1fhBq+i/Q2v5C1zQ+h3BCvAxRGQKK/Vz4MykkfZEvRgaiYP4a+cfECj3G/+Q2/JfWTi/9yLIEqh+OC3pC+5CHDwyCi+XPzUSyp29Cg8WTXV2W+TtT0ieoQJQXpuYoYAB82cvXSA+W7q+9OnCKJfgT7RLDZMSSbvafkV5SK75h2ORBhU7HgfRSMWi4iLsxLpy6X/zY/zhbU4xiYkH/XF+1i0eo+4YacZnvyeRuu6NRZ9QYPteGae43JX8kGj+tFfcuBwbHwsXC2e8FGQu5R1j4N0fp2ei0g/8Qg3vQ8areTBZnMg613985ROEgIr8J7Rd9GF3iWFg0mzVeIdC+5nrHBWzDHLPF2ikWag==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(7416014)(376014)(1800799024)(82310400026)(34020700016)(12100799066);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Qz41B5B/lbQWojvID9Mgh7uEwG/n7KWnAXmx+C9GR7cXHArd2NIoZQy5CBguf5tl41ki4QKCUT6yEfnn77oUR8aFTO6XnxPP8yPrGbdYdfwksUFf9woxgcNr0KVI2jcL+HhPEfMajLPVJAmacil0nDskspb7VrV2syTznL8qevpwIbSzH6VFQcwN5pZmOJ95lb9ApeWTwqkgVRC8aH+GgGFj9S++vKm4QYyC53FeAfU/hZ3GR4YaO5TnSJaCTDbpusvZgufZquyY+znz4QU/Ao2W2HbFe0kjwm5oEOpGAZaPX7I9TBBOYtMi+pPyr2NH68l8UKyfVQaOyQ3eu81alV8bhHHPdELsqaHQ4dFW0I17QYCQz+RviGae6RHlSsGVh9/Yd3HtQvIWyJXqfEgysOcrpikbSLMazNwMpF6KhvOkkYKsXgU/1wfinKopyS/n
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 17:17:34.6872
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 042d2ef7-2c8c-489e-87c9-08de7ba4422c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MW1PEPF0001615F.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4560

The function i2c_match_id() is used to fetch the matching ID from
the i2c_device_id table. This can instead be done with
i2c_client_get_device_id(). For this driver functionality should
not change. Switch over to remove the last couple users of the
i2c_match_id() function from kernel.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 drivers/hwmon/pmbus/ltc2978.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/ltc2978.c b/drivers/hwmon/pmbus/ltc2978.c
index 8f5be520a15db..d69a5e675e80e 100644
--- a/drivers/hwmon/pmbus/ltc2978.c
+++ b/drivers/hwmon/pmbus/ltc2978.c
@@ -733,7 +733,7 @@ static int ltc2978_probe(struct i2c_client *client)
 		return chip_id;
 
 	data->id = chip_id;
-	id = i2c_match_id(ltc2978_id, client);
+	id = i2c_client_get_device_id(client);
 	if (data->id != id->driver_data)
 		dev_warn(&client->dev,
 			 "Device mismatch: Configured %s (%d), detected %d\n",
-- 
2.39.2

