Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazhn15011021.outbound.protection.outlook.com [52.102.140.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C3A11E2858;
	Fri,  6 Mar 2026 17:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.102.140.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772817421; cv=fail; b=LGhvy6qJ0AEAghtqhHmKw4C7a5qe6pSPYKsSZSliEg9XSOscOoahUXr10Tt3wfUD5nDQ52kfJafBCuywO1HeOuLocJUcQzCZPtM4m1UgsuSpi30kEmQtdbXinjNt6qs43V7g1W4Lsy1XTdGbOnRE6Qch6XM31RySBr+gk3+5Hwk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772817421; c=relaxed/simple;
	bh=WHDNOPI364Bjp+BjmKg+/mvXkvGZ/yRCNVmpBEzeZjI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fDwJvi8h5+cLG9d8mEwnbd2P9Q9kbImudiBjyCYRddC4Q2LfUV6MWV9gorVynIwtyW27z9reAUd0NeMaRSQiX804rHi5BenuAXiTwtOCdEYH5dZcXsmoToYxlzuMg2/FDyikjDzleIEbgJpROCZce+RkjU80AGQJldp5LuVWLjM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=gzjpp1+t; arc=fail smtp.client-ip=52.102.140.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="gzjpp1+t"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DDOPCXWP+Pr/H+eLKqlbLaBIDJDY2/CnYRMYp6owQWLFONy/4ODEGavvCY8z+5y3F+7KfiQqD/VIt/7SJsM2YjWq6nYrtzmb2QHGYzc5PzMQ1GAGPCYRxN2jV7ik4rRTGMr6N3voCn8ly4/h8CrX8es8Iz1ab/YAJe1B4fCqb6kTLsqHPigqamqDiPI4GI42xpcUDN7QXhk+kecwgolq+VwRKrAVY0CYi6ZBrWPjUVX53KLiRHq7rBRVKXNBB6RgKPw6buRBsuE+AQjj3Ygp3yTLZKKeZfBUIcpd6fGoXGKJwxMoGJyzkjaEeOqeXBvLkCuWspYsH/qxzYFavwDq2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DWJKRoW0Ejhw1uOeMybgOa6sNOECgxcRTYV/ikFk+is=;
 b=tp/T8nQh7Plu0Rwcbk0c8TGv3EXus77R+V8opWh6pv2TGayCu/A6R9iLG3oUM3z0joa1urDOol+Efs4zc/gj7/iuzgsq3eDKsKG5eFkx7xaaOYks8P4oozMhVOryicOpR7BGJ0DQLV007DRdZ7JtFTYX6IZMlYzAJJIdPupU3WcW7LZsToIRMlbEmy4vQMTEyp77ZuveczujWu79FazuaS3Qg4mRA4tnlj2xggYE8FEUBEdAsYSUZt1IMZI1ZM4Jqsp0bTRu5ENSQPhykCXFZTK3IQfjg4kkXJF/JItB3T5tb0oGpLvWUlTHHwUdpedMT6MI+fhYiTYxCpT586kPSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DWJKRoW0Ejhw1uOeMybgOa6sNOECgxcRTYV/ikFk+is=;
 b=gzjpp1+tG6s0Uy0AnINBJxIW8tJljVN8ybcnsASXTWLfV9/+ugm+C+gI/mw0jg7exncaHNRNydsDLoQoAhYcopxj5TJedPe9CoXVNHbNoiYoTHX4De2GLX7v1iINp/agBWh/KNZJG0Hspn965M4nTs1KNPg+VM5kui9LfqCuPOE=
Received: from MN2PR11CA0020.namprd11.prod.outlook.com (2603:10b6:208:23b::25)
 by CH3PR10MB7908.namprd10.prod.outlook.com (2603:10b6:610:1d1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.20; Fri, 6 Mar
 2026 17:16:57 +0000
Received: from BL6PEPF00022574.namprd02.prod.outlook.com
 (2603:10b6:208:23b:cafe::6) by MN2PR11CA0020.outlook.office365.com
 (2603:10b6:208:23b::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.19 via Frontend Transport; Fri,
 6 Mar 2026 17:16:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BL6PEPF00022574.mail.protection.outlook.com (10.167.249.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Fri, 6 Mar 2026 17:16:57 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 6 Mar
 2026 11:16:57 -0600
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 6 Mar
 2026 11:16:56 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 6 Mar 2026 11:16:56 -0600
Received: from fllvem-mr08.itg.ti.com ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 626HGs3i491523;
	Fri, 6 Mar 2026 11:16:56 -0600
From: Andrew Davis <afd@ti.com>
To: Guenter Roeck <linux@roeck-us.net>, Chiang Brian
	<chiang.brian@inventec.com>, Erick Karanja <karanja99erick@gmail.com>, "Grant
 Peltier" <grantpeltier93@gmail.com>, Jeff Lin <jefflin994697@gmail.com>,
	Cherrence Sarip <cherrence.sarip@analog.com>, Kim Seer Paller
	<kimseer.paller@analog.com>, Alexis Czezar Torreno
	<alexisczezar.torreno@analog.com>
CC: <linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Andrew
 Davis" <afd@ti.com>
Subject: [PATCH v2 05/11] hwmon: (pmbus/max34440) Remove use of i2c_match_id()
Date: Fri, 6 Mar 2026 11:16:46 -0600
Message-ID: <20260306171652.951274-6-afd@ti.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF00022574:EE_|CH3PR10MB7908:EE_
X-MS-Office365-Filtering-Correlation-Id: cc0b55c7-9bdd-4140-27aa-08de7ba42c18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|34020700016|7416014|376014|82310400026|12100799066;
X-Microsoft-Antispam-Message-Info:
	DNPLF31v3KlL7qUugLF9sl3nU1y2Y2NiWyz4gMzZpXTus6N8b14BFJ+JJ3OeYQ7RwvJWKWtZYcT4qHhzOrLEi9qOaFP9PlzteS/Om5/y0Cx/r3Cy+FWjEuWyEFKM90Cb9Wa6WAexWktNZBMSd5cKxJa6H/HtMW3rvznUBBYcdCWqsVtkji0QXcIwSRW+Q3k24yyUn1GlcsdIfNKeLZ5YX//HzxLfDnp+qlnOLp1ZCqe0UkLJmXZrStO6p2SS0w0kjne5JfpvGM46r65uT0GCko8LgoxD5tl/qGAnRWIFTbRG0CaieH6u4+xwf3BwtuPT89a1lrB/8ownxDoLkWD0J5nP96rdc0x6lo8qVib3Ovkqd18uAV8zXKJhXo4Ij5LdGj0oxwrwm8KyMHzG380QTlNCBWC6US+TDjsbNCvEskhaV/74Pvsq0Bh50PzEPFqaRFzGSo4nFODRmmwgaq9g1CsOUeOHmIBMERfTpvk4AHGPIXXZD1SVNG9UA0UZBH1+3FrGjDhYgofB0E3D83QuOEg6hPcoDvlDqf3w+SLk5GUYqRU/sGMGQ4w7yfezD9czI1SDSgCJvTDYqRFymzSSPIDjNnoPbQMx13zYIsrG/5j1F3jOy5eGfClMEYQot1/zjPk8FRqW3c4eQIQDN2mnFtkFelHZhKJOlg+HgAkf7ZHP8+OQL7RwcsQDrOrO1lcNWA8fvvwrMB8Rsf6ZCglwBhD6ZV9ebak+VF6eWDFogUNjyHQu+sFb7dI0oN0Pt/gniodeqRbAz6Bo5SEzf1RaYA==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(34020700016)(7416014)(376014)(82310400026)(12100799066);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	VoHqBDcjueMBUtlT3AnfX+1Dtmobw8V9KKuhAxaz2/cCVCsfKH/zDpliJZQ5RMY2NC5kC6XqMUHYu8X1UGcdGTv1gBa0pw6r8MemoY/hSWAThYkCqziOE5R3wP0joLTd0ZY9vBtOB/Cp+NZ1YZaZ3ACCluRACkRCENjCxAr0+rmhXttHNKN5Rs+B/hxvXNPp/4vxnpDfosHGFsa7LjcQXm08fVuxarB7HKgDn7vq9hxjer48B+WoLadB/IFKZXbeuGpmo6ocX5NxPB8mh/godFNQeIlijL0qGVkGGSiOXCq4RCmS0SVWCiiI+XalhI8PSv7iumbBNP1nH4ek3zE0MWtK4WjNysR41zGvMmgeKSUGPM3bRuXjTDMKiQAHBauMHntpaPj/Ict5SdEFbS+kBA7+So9nivtpAHvn4dAw8bQ2g6QHXreTH9OkcZQ045c8
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 17:16:57.6710
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cc0b55c7-9bdd-4140-27aa-08de7ba42c18
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00022574.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7908

The function i2c_match_id() is used to fetch the matching ID from
the i2c_device_id table. This is often used to then retrieve the
matching driver_data. This can be done in one step with the helper
i2c_get_match_data().

This helper has another benefit:
 * It doesn't need the i2c_device_id passed in so we do not need
   to have that forward declared, allowing us to remove that.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 drivers/hwmon/pmbus/max34440.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/hwmon/pmbus/max34440.c b/drivers/hwmon/pmbus/max34440.c
index 8ea4e68d4e9de..cc96bb22f8f5a 100644
--- a/drivers/hwmon/pmbus/max34440.c
+++ b/drivers/hwmon/pmbus/max34440.c
@@ -71,8 +71,6 @@ struct max34440_data {
 
 #define to_max34440_data(x)  container_of(x, struct max34440_data, info)
 
-static const struct i2c_device_id max34440_id[];
-
 static int max34440_read_word_data(struct i2c_client *client, int page,
 				   int phase, int reg)
 {
@@ -628,7 +626,7 @@ static int max34440_probe(struct i2c_client *client)
 			    GFP_KERNEL);
 	if (!data)
 		return -ENOMEM;
-	data->id = i2c_match_id(max34440_id, client)->driver_data;
+	data->id = (uintptr_t)i2c_get_match_data(client);
 	data->info = max34440_info[data->id];
 	data->iout_oc_fault_limit = MAX34440_IOUT_OC_FAULT_LIMIT;
 	data->iout_oc_warn_limit = MAX34440_IOUT_OC_WARN_LIMIT;
-- 
2.39.2

