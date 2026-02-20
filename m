Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010038.outbound.protection.outlook.com [52.101.56.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 249F932D435;
	Fri, 20 Feb 2026 11:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771586434; cv=fail; b=D/sm+BnDJ89naw+fb9YmdPAQdd3fsmB8JBVkD4ZJpaWT6ExdoU06N4cj0nqtYaekJ5iTEBzDOEQjYfLpplZ+HafOsiMzhdCOTF35MyhF4k09KeHy9hBHwtoDvge7ptSaHMWRU1vjfBVdy2NkND10K6j9c8Xijy+SzJOPXE4az9g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771586434; c=relaxed/simple;
	bh=0v0RIhS9/4pTnM2DC3KheQpW/CMy2qN3TciD9S5kWVI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=PQUQFRbqk5bqilPZmzxbxNMzTNTnMThswfP+Ia8Vpb0qs4t2EV/+oSiMeNSFcV5wSoD+dbkRsJzZOxRcyB+4zlyt1GfX/pDHHsabaZ+qNMupxMProNEO3Rxtbc5LlDP27cOGbBMuy2RyxZGGMPqJb41R7YHfgLXEz8vvd8pD68E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com; spf=pass smtp.mailfrom=gehealthcare.com; dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b=eXESOUx+; arc=fail smtp.client-ip=52.101.56.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b="eXESOUx+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k7oSPQfkwJezCOK+ZFevx9sf5AZwwSd0TiiW5lDKceL2EpD+dCJe/XrI8lsUzTptO+oRxYpqWpxun5nmWjWJ7KBzC7frSzOlBr5PI08lYPYYAzDkMIvmhb1HkEYJvfYHpsRT/RXdT+4fc33yQNVS2aOET1+VAZ5d41zAFTEsdrNLVn/8aM1qPCqBCvaDuvWn0RVEeoN7/jBESpGzLRJ6s4Ns04/3Y4qGvCzxZWhEiuaCSnUTcvULS753i9pfzU0rTOm/8VHaQNfgChHVz2d/mKHiUjg6cwD01ZneCs6Vt6VvSuPPozbsvRHs7tb0HFVnfOJYd8c2RkxtGeAiVLL4tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x2HnPQ8zWkmcfhwsrjEuzFYYHQqQukTbUV9G/F4R/gA=;
 b=vkuqDoF4jgXJRFPsAQqHHqBKc8D3lC/8SzYZH2DM0AWaUsqtDh851Tx6aOKYLzAnScMzRovaViSbwfhW0vsVu6TpmgBkDon+P9z6Ebo2Mhxb6X9qCY3ofPwOxz7+wQKCoZ/p/mmE5hWufRZrWpAe6nW7Y7hV59vQgx8wAzREt9aD4BF/EfhwFSXZQsdwV6NqDUOF4mP46H1O4zbB2eZLyxlyh0ozCf3F9wVYMR/yF7sUq7Vk4bCwaGM1vdbrQD/p0KypZ7zG8P8L1fpcLiE4zF/lBzWN58DkkrNVdVJGAk77OvdKvVmi7D8ag1egp7GPiyrtoJs9yYqVUICxtaOTTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x2HnPQ8zWkmcfhwsrjEuzFYYHQqQukTbUV9G/F4R/gA=;
 b=eXESOUx+7njUNj/dhYlHvY+1eUXTOhj2s/5nrWBsM7QA8F04lTfb7XefKTYiJJUHjOlTw1kiD16XPiRRdyl1dQGme6Pj9sa45MembcylfDgzwUnX4MZv8BsctGWbhx0uzWScycQxqpkE+H+ogbax7Q8zTeiCJ9/egwth//rVxHT0E1Xsfo49EVC/MDkOVu/a3ho+HV6cdsUUjUE4uRjF6lqR7XlnpJ0MbB2GYROXEE40g2j/X9ujSfzdvau12XftLE0o3DKxHAs+fWOzeULhsApHMiL/r6RETi4p2jj7NXGXosu10ZpsS6dVUOOtpwyRu+dsRTTX3avQVEjStZyiAQ==
Received: from MN2PR05CA0032.namprd05.prod.outlook.com (2603:10b6:208:c0::45)
 by CYYPR22MB4201.namprd22.prod.outlook.com (2603:10b6:930:c1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Fri, 20 Feb
 2026 11:20:29 +0000
Received: from BN2PEPF00004FBF.namprd04.prod.outlook.com
 (2603:10b6:208:c0:cafe::a4) by MN2PR05CA0032.outlook.office365.com
 (2603:10b6:208:c0::45) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.17 via Frontend Transport; Fri,
 20 Feb 2026 11:20:26 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 165.85.157.49)
 smtp.mailfrom=gehealthcare.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=atlrelay1.compute.ge-healthcare.net;
Received: from atlrelay1.compute.ge-healthcare.net (165.85.157.49) by
 BN2PEPF00004FBF.mail.protection.outlook.com (10.167.243.185) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Fri, 20 Feb 2026 11:20:29 +0000
Received: from zeus.fihel.lab.ge-healthcare.net (zoo13.fihel.lab.ge-healthcare.net [10.168.174.111])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with ESMTP id 68D521A2CC;
	Fri, 20 Feb 2026 13:20:26 +0200 (EET)
From: Ian Ray <ian.ray@gehealthcare.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Ian Ray <ian.ray@gehealthcare.com>,
	=?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <bence98@sch.bme.hu>,
	=?UTF-8?q?Toma=C5=BE=20Zaman?= <tomaz@mono.si>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH V3 0/3] hwmon: INA234
Date: Fri, 20 Feb 2026 13:20:19 +0200
Message-ID: <20260220112024.97446-1-ian.ray@gehealthcare.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBF:EE_|CYYPR22MB4201:EE_
X-MS-Office365-Filtering-Correlation-Id: 12aa8f23-ce2d-49d3-fd1c-08de70720e08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Rjd1OEQ4dVA3elBMbTI1NE5JOXYrNnVXZDlub1MwYTF2L0NsQ1E3aFhmMnhF?=
 =?utf-8?B?NlIrTVVMNUhCSWNweUtzdCtMTlJSV1h1U2dNcmtoZDQ0K3ppU2Exb2lMQU9y?=
 =?utf-8?B?dVd4T05aWDk3WSszTTlXQWdVWmZNT1NjdjdXYnNqUmhmcDVpbmVCcEJtWjJY?=
 =?utf-8?B?Mmt2Z2dmUEEzcEdrUXF3dW9PQU0wWUswRXpHLytJRWRqL0FhWFpib1F3YWFO?=
 =?utf-8?B?Zm5FV29lZUNKVkxtYUhUcGdEVzY5WGdGS1hVckM0SGp1eGd5TWZudUJPajdz?=
 =?utf-8?B?YmpTamhhTUFWL2hUOVJKdlU2SlpOWmtFK21uUnVBemlPVHFWMjB5dVBNVDdi?=
 =?utf-8?B?MFJwQytTaytVdk1yUUN6S1k2T2ZQYzUzWVJyU000SnNTeVJUdWdPWktoaFFu?=
 =?utf-8?B?T1ZoOHg0UmhtLzRSYXlXQ29lK0hqWFVlM09zSkNmSER3TVA4K0V0Zks0VEh6?=
 =?utf-8?B?WnVTdlhxNXRBU084aEZub0dXd21wOUR2ZWFyM3d3L25ZY0N2a094TjVOVnB3?=
 =?utf-8?B?WVBzdmNtNHoyTDA3NXFISEZXYS9wTWM5NjBVV1pVaThmcFRac2lPbk05UXFB?=
 =?utf-8?B?dUF4R2lDbWoyS2VrbWp6QldwY29rY0FoME1lUzNDanhSMVVaeGVXN3orZXRZ?=
 =?utf-8?B?RkhHRTlhK2VxRDZwOXVqSmZoeElOV1BYMDMzdmhscmFaMElLR1VwS2tsK0ND?=
 =?utf-8?B?TFAzVmhpQ3dzYmp4WHh2L1ZmbUxnVEdaUFJRQkVuL0VTVFQxNkhHMThxN25F?=
 =?utf-8?B?T3QzY0R0VjR6V0wwbjlLY2FBL1RQRE9yaDBKQnlJR1FYRTdEZ2s1aytPMzBr?=
 =?utf-8?B?NmI2MDE2eFBFVnBaVHhMeVVyMUZXSjZhZ2hpanZsV2lYcVAzZE1VVVY0ZjV0?=
 =?utf-8?B?MllCbU9BQ3RQcUVSbC8xSDVkeEdjY09lMG5ybTlxVG4yZnB6N216V25CT285?=
 =?utf-8?B?V0sraDZxS2RiNm1WOW95d0J1ZUtHV1hoTWtwNUdSZkp1enhxUk1kNlM2d3hB?=
 =?utf-8?B?NGR6QWlXa0VzQm9FcitITytNUjhKQzZ6ODNvek9Fc0k2WXZVQmlGcUFDWlJ2?=
 =?utf-8?B?OGU1TnluSzRqbElWZUdKcy9oVlB0eFdsWjVkeG11b2hxS0pSdDJselZHM1Y3?=
 =?utf-8?B?MnNZclVlY0Y2ektqYVJDVU1iUFBzV2xjRCt3VkRJdGxyb0NBSEM3VzI0bmc0?=
 =?utf-8?B?TmdXVjFJL2tNY05FUnlreDQ1djZrZlg4UzJCZzJWSXlBRFlyOUptUTQ5ODNM?=
 =?utf-8?B?QllvRTUrSEZCbkxFVjZ4SjlqS3d1bmd2ZHJkMFFaYXZvMVRKNDdZQzRUZktK?=
 =?utf-8?B?anFFNlZEZU5FaFMwUXJvVDFwbTZ5RmYrbXd1d1BUS3JmaThVN3lsdkdXd3ow?=
 =?utf-8?B?V0QrbTFkakd4K20rLzdnUnJ4ZU1DMnZrTllCMHJqNGdTRmZXQmRsMmpLdnJ2?=
 =?utf-8?B?NndwOVd4Y0pZVndhVDJveUl4ZUptMlI1bnZzak9hUXZlQmNRT2xUT3FHRXkz?=
 =?utf-8?B?VmF6cnB0UFVpM2Q3MlcvZFZ0bW9lbEVMVHFJak02aXZ4OXFwcVBvdndOWmFo?=
 =?utf-8?B?SkM3M1lzcjRTbjNkTWlSVzNXMzVpSldrWENoSzNXQ2NlRkU3cmwrb0swcmZI?=
 =?utf-8?B?VHNNK2RIMGI0S0kwZEVzRkJsaVZVcWZyMHZYNHJZY1Z0OE9FVEsveWJDL1NN?=
 =?utf-8?B?K0hwTDhGNW12emFzTUVBaXhUNUNiNm9QNVFlWnBPWGJmbTBYazZSYkRWVnQ3?=
 =?utf-8?B?SytxVkNqVVJ1VXhGYjQxVlNLMFA1WHVsT2Z3VzNzSUpHY0ZVcU9FTXFzeEdY?=
 =?utf-8?B?YlgvRlpldWRTWXZHRXo0MlNiWTdPOGxxTU1kSzA0WTdRZEdkZ1duZ003dTUy?=
 =?utf-8?B?dGFvU09VdzdYR1RPdUxicHNoeFR4b2IyM3FLY3NqSnE1eFh5WnNsVnZYcjhM?=
 =?utf-8?B?SURDV0M1a2w5T0FTazRUUGRpTGNna3BMVTFvbmVZYVprSjNJWGZHUXlVSkNV?=
 =?utf-8?B?cEVnOFdXNmVtKzFiZVhFRHQ3NXI1ZnNrMVRLNm0rSlRBVlVLNXd4UDkzMmVo?=
 =?utf-8?B?VTQvN0txOURFNm90QlF5Y1BTeDFZSFd4Y2hLRXdQRmYvNFkwME8yOFNoRnNi?=
 =?utf-8?B?V3JGMWtaNjhvWHpJbVFaWVZ3N3pLNXAyK09CVVE1ODFtVXBtQ0tSR29HWGE3?=
 =?utf-8?B?RjIvQ3pqVldvMWdNMHdYdyt6UmRNbW04bVlTVzNFd3Y2SS8xcDl2RXo3bnNG?=
 =?utf-8?B?Y3BzK3FzYXN1eTB6OTRtbUdUYWZ3PT0=?=
X-Forefront-Antispam-Report:
	CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:atlrelay1.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	vjMBwuqmN8RKw16Z4AZdUdzEQuF1VxYUHsgnUq/VjXo6LDR9xI4XPt9p99+0Skj2ofDiUEqYzsthyDx/DBVYs1nLkHzukGy5aqBdokLMi4hMGmU0ZcQlASC1RYfU2GgdF2GCt9/JHa+W8AnH/RQBjOVQtl1Rkb7+YExajBtw5AikJrUHGqwmWYSVuAnq0nt0gCIBpr0nl3vV+0tEWG/NvWCL8M9GTNeU2GYLSB7mLee/ozdsQRdVJjxge2bYwAFDrW62BHA/v7KtYCNRMU64b4SwbwYpErJ9NkNRMN6rTENVHWBY73ZbDpsuZLjb59u456bt7gZBbMd+/SVw2Hf1Uqy4gfXKWC4odDqGlArgZBO/Kc0yBD3oVfwJyNnSib2/K04oNUCuN6yzXC7NwLyW7uG+wgNKS7tow2Vl2/ISXYsDdH2pZpOXaEUpx9KK0oxz
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 11:20:29.4053
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 12aa8f23-ce2d-49d3-fd1c-08de70720e08
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[atlrelay1.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN2PEPF00004FBF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR22MB4201

Add support for INA234.

Changes since v2:
 - Patch 1/3: No changes, kept Reviewed-by from v1
 - Patch 2/3: Drop hunk agreed in review, kept Reviewed-by from v2
 - Patch 3/3: No changes, kept Reviewed-by from v2

Signed-off-by: Ian Ray <ian.ray@gehealthcare.com>
---
Ian Ray (3):
  dt-bindings: hwmon: ti,ina2xx: Add INA234 device
  hwmon: (ina2xx) Make it easier to add more devices
  hwmon: (ina2xx) Add support for INA234

 .../devicetree/bindings/hwmon/ti,ina2xx.yaml  |  3 ++
 Documentation/hwmon/ina2xx.rst                | 25 +++++++++++--
 drivers/hwmon/Kconfig                         |  2 +-
 drivers/hwmon/ina2xx.c                        | 36 ++++++++++++++++---
 4 files changed, 58 insertions(+), 8 deletions(-)

-- 
2.49.0

