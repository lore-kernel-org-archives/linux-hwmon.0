Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010015.outbound.protection.outlook.com [52.101.193.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD89A374A04;
	Fri, 24 Jul 2026 05:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784870779; cv=fail; b=qVMcTEVtaAqgikEpONIBaFpWOzejYKv10NpGeD5nmpT1S94jOaF1MWLbTV1Ko7xPNjUpUmfc7HoHfE7I32zP6Y3qtL4aG7y3LuagJErT+AOU9Sa1CkcI2eXIbYdH9f4LMs44z1RksxXyznBnD4MchPoIyNdjLgI50gmXRRh93Bc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784870779; c=relaxed/simple;
	bh=MLdNexd2O7CBWc1uzz78+DQ9rEpftWRlFaeX56xJOsE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Fg61oF6K81ZPz140UshXJOHnl9kvAq4OQhc9d/WRsmZtRO8BuxHvv3VNoM37avvutvJsjMNcTJiBeLwU5svlY+LlWKQI3S0PM6fODFvYQQDdUEbvW+LwAKkg0uo3Nmxekah0J/m7IbP3+0ZIQN2PFWClgR1LTUAs5wY2yDsUhKs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Z2oFaAi6; arc=fail smtp.client-ip=52.101.193.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Z2oFaAi6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FDN7YwGiqP9b5tP4Dro7yYyPvf2ioeG2C+/8wzP/MKBwy/dX8W3M4YcSC/H8n9YAikSiGZCQyF8rtMOgfGsnPNj+wlion7176bUKqgvJ2EoOAyFSAH5EsS5CuL8d+0H7DvHegtnlnlE4sTAOBSp2QYqyB+vUd7PxlndARYlmINIHzg0gIX7Be+nH1xG9OV8wxIKz2hoWz01zg0Yf+tzyrwm54ynhTU6emecgY2RUa8n58CjcAH8D/1n2AZJZkYNVVA8c0+MV7S1htDBYUeZkyBwQVZ/9lGm86xfnQEusPfPmOYPmLaqDzjj1y9cMhE4aUzsjxj6SIHfWU0d7MnTocg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5pIbcRm83hrVHmnsMZr1TDEAUHLlqkPrFtuT3e7uaq8=;
 b=vJidyJgVYuXqEqjT2xyrxtp/utlQcix/FNE9ify1UVp+LxEkuRnqhSfbaMglUDSpbJhBn9d6ATsvIDIEni9y7gzUSnFowCIfBMiI+xpk6xKJwC65xXV793GqzWM8vJlEanmaJVgkO9QngNU0RY1Vpwr75fknd7B3Ixk29BS408uQ7Opc44+VWJhLzMP6pFzyQ1gUhqAt5/BgVMa9GyvLh8mRB/1bPlbTWMrkNHeZHE7AW6s0GLcoe+vnPrOeIS7+2mg/2HDiDk1s100kzpvEgpN26A3l3mnsfz1Sw0b9vTe7gF95wtNvqKuOsF5qKdGEOVCPmgdCa+1o/rNBIf3eqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5pIbcRm83hrVHmnsMZr1TDEAUHLlqkPrFtuT3e7uaq8=;
 b=Z2oFaAi6jLzgtDpGPV4mcHcJU8G80amHZNjTfSRa4tSn937CtcZGiucdWCUdExMVAz8yi2KO18xwnNdIeGaR3UlsL+DeGf80rPFdrmoW/6dBVA3ti/5j+KYsGRggb7CBTuxZIl4iC++FVS7Z+X/ZCfKFplIaaDVuRBnZacB9dqI=
Received: from IA1P220CA0012.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:461::16)
 by PH0PR12MB8173.namprd12.prod.outlook.com (2603:10b6:510:296::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Fri, 24 Jul
 2026 05:26:12 +0000
Received: from BL6PEPF0001AB56.namprd02.prod.outlook.com
 (2603:10b6:208:461:cafe::1f) by IA1P220CA0012.outlook.office365.com
 (2603:10b6:208:461::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.12 via Frontend Transport; Fri,
 24 Jul 2026 05:26:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0001AB56.mail.protection.outlook.com (10.167.241.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Fri, 24 Jul 2026 05:26:12 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 24 Jul
 2026 00:26:11 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 24 Jul
 2026 00:26:11 -0500
Received: from localhost.localdomain (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Fri, 24 Jul 2026 00:26:09 -0500
From: Andy Chung <Andy.Chung@amd.com>
To: Guenter Roeck <linux@roeck-us.net>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, "Shuah
 Khan" <skhan@linuxfoundation.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-hwmon@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, Andy Chung <Andy.Chung@amd.com>
Subject: Re: [PATCH v3 3/4] hwmon: (kb9002) Add driver for Kandou KB9002 retimer
Date: Fri, 24 Jul 2026 13:25:30 +0800
Message-ID: <20260724052530.2808587-1-Andy.Chung@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <3c287fdd-a32d-448b-af04-4d03f895e618@roeck-us.net>
References: <3c287fdd-a32d-448b-af04-4d03f895e618@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB56:EE_|PH0PR12MB8173:EE_
X-MS-Office365-Filtering-Correlation-Id: 200b2c24-d039-480c-c782-08dee944133f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|7416014|376014|36860700016|23010399003|22082099003|18002099003|11063799006|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	szEIycev7uki4EmuuI7EcDhq4+Sx7kvB6Jomxl5X3taLg6aLl5s89OODtjZM4GS9KwByoD+ir05kUGqItG6/NLkgEakGAVTUbnSAXqbdsFD0PxC4toB+d+wsVHaIpMbC3CjOphsa2V0w87KLXASCg4Yo+/+NPg7tJowLa0Bfwk/v+OCMMOeYSXT/uWfFfWdz6ZR1qN/Q3MSziVYrRA6yy6hLtfCWAvsyLNKbxz0CBRV0Fik76ET+nABrofAt2YR5w174zp170zipkdr+cqa16+fcim/wcEWto6H+2SDUw2nPWF56YVKWxM4AXt1c+mXUERhjmhvMYEfB/xZ1Eydip2Fy9sNu7j1gDRIOwBFuVvjeIOQ8qbsz1YL63DlaJt4npWKh+gQMKKvBotwQEy04EP+o2xAKbyVdK+TOvQV4RcZ7AGdz26nEpcdwV63RzpKFqM4BnImarJBXylWE25DD4C0uABsbqOpMUGlIXX47Z1Vze+dOdCwK9cqGotKxyBL9QbdjQUfBj1wJsOFR43WxDAV/CBGbYU3/ryUipCr27DO97JqM6MklV1R/0R/rhhKCo5ALbi2ZOieesLp/bkzRzRz2S8cYXCkRBztT4tcCAKL95P9h+0XhEXhillJp68pWxiOZY/EvczeCkziNSdrY5DIYhkDXbd5eNBij20TcRvIIXv9xC7UEHSQEJO+zFtqvJnZWELui79aRkKlTCZfrTQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(7416014)(376014)(36860700016)(23010399003)(22082099003)(18002099003)(11063799006)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	YiwYeP8tBMnkh9pL59HozUhjIKn64jtM2gJyrPNO5J1wlMM501I/7p0Qh2b1TzfJfMf9L4gsFcr3WHTxkdS4LGnYdssDs5RElkc4cizTVA476PRdxYzcONnGPnPWg3bF3xCKdAh7HVRlQnFn19EIsATVI79h5jk8RVKpZVvp2EnqBUdntpHYmx4hlp+wo+JxKE2NKnGoFqDKLfn5zg2LJx888h11HIzKIFfMqaezdpCkN+5g+44Cbm0o54MAgQeZg8O4nPwrYt4Dqp1t8+eDU+W/hQm5zM508wpBKYYQgjQHLSl1o0oK1hCf55t+pnguR9+1ICNnCyBZzUMx+XJi1EgLKzr3XsTGxvcGeq7aLVin5jaeVneFFtXU/uCy6J3bWpvGgtfSe6ZFG6wC5rSGEmUUSgImIUZekecmY87TyndOrrs5vGFHowCFMBWtM33O
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 05:26:12.2731
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 200b2c24-d039-480c-c782-08dee944133f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB56.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8173

On Tue, 21 Jul 2026 07:43:11 -0700, Guenter Roeck wrote:
> Doesn't this depend on controller PEC support (I2C_FUNC_SMBUS_PEC) ?
> Also, the driver depends on I2C_FUNC_SMBUS_BLOCK_DATA support,
> which is not always available. I would suggest to check for both.

probe() already requires both before setting I2C_CLIENT_PEC:

	if (!i2c_check_functionality(client->adapter,
				     I2C_FUNC_SMBUS_BLOCK_DATA |
				     I2C_FUNC_SMBUS_PEC))
		return -ENODEV;

so the flag is only set on adapters that support PEC. The endianness,
is_visible and temp1_label comments are addressed in v5.

Thanks,
Andy
