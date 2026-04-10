Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011019.outbound.protection.outlook.com [52.101.62.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04FAE883F;
	Fri, 10 Apr 2026 04:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775796346; cv=fail; b=jdNQA2mcHovpZleEos6bQFPuio7hhbCaTFwW7wbyHDqiSVIIDsBVZKDfG5OfRKBQRVy4AKmAquwI2L+eKdcWg4ojS0RNI7sQp/2NdskLjQLZf9wyPQ9VYu2s3g0DBrUhVR+zoLcoL2rUZstaTCTVilquQ3hAtqGl3Kt0qJbBxtI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775796346; c=relaxed/simple;
	bh=a9VDwf2Wio9jsY1ePViZPs5cFBc1S55WpZu3nnDSicI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dgnF6ezdn9ahmhhU4MOgwwK3Vwkc4gIS5ZFCmQju3AOJhfYaJlcmM7Kgel5OFaymxwh0qWFcryxUiClEMSSyR3y0ghAWnqHDSmkfYb4smUB2McrR9RgGkdNXwYnLpP2xY3JIAHcH/26nsREqr646Y5RlRiWYCFARvoaMBDpXMx4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=X9wzc/kc; arc=fail smtp.client-ip=52.101.62.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="X9wzc/kc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fvq73L30OKZMZhtrT40cjgkR5c/sFUcRMzbwNrraa0JpjwT9FGv9jyxN3QZrKOlfkl49vwYmZJ4PBzF97r8aTFO03BLUNWZml14WtlSqi7zKkwSNWCv4s7Fr/qBsLswJif7ljeZ5R7Rz7RkKFYIOC0QDWXNH9SyCP6pMnhFq2qeLNtWe1GtOUpFb4cq/QWZxL621WzdV2cBBEDDcG2TKCAfh9vS0ndaqODHXxV3sS84lT50FY/PFV6vHnJ4bphRmZgDJ0W1Omh5ZhJ08k5jmCdG9OkHEpFrpBzzefb7TpMKd9hqCBTmwnT5cPQ0PCQjHwymYy5Slw9X32UzVWr8VtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vuA3bJ2itvJCLxbu52uuJhg7JB4a9uTpGwqBP1mhrmQ=;
 b=OwTHPY3g19YD+UrmtoDIfwq1SOvJwrizrCe1RlF8Zm+SWOGgjfhIW+cziUaG8LGurCwDslHgP4bD2RrnwvQIH0qeBSwGXp2DtoPmsCHUlM1EMiSk1NOzp6TvNb+nE9ZPWsCvkvCGFwF6RVkAEiYefuZUFeulfWAehGEOPr5VVRgnfs8pkNPsKSFlLZMLlEe+UWuSmTbIbQt0zu7lOcmT6Fw14HTW+RKHiiZp4ZqoR8uGe6s8xInSN5MPCTl0P9UvEJrzO+/XuX1CZD/Iw9vGiLQFCsxk3cNUFpzOWILeg+g36xkTdygqAqUvbi9usmvSsh3UZWKIesLXKQGlsChx7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=nxp.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vuA3bJ2itvJCLxbu52uuJhg7JB4a9uTpGwqBP1mhrmQ=;
 b=X9wzc/kcdrHR+JM5ukA5EqszWhajNps7JaIgSHOHRs+c2w5wkZYV3uZjBLjskorgUKqfYntcxcRVSMmaODwOrckEJzl4ferOCML5gUeHAYtYpUgZbIGQMvUKd3QaYHws6xb5uE0Pru0xeOqhsTmb1JaX1vsEh3j3l/l+eFZNyJqTJJ91jsncq30W1AWpzOx/6AO0vpQ2hQaQFcGrgskH8JclKmY76dnBQcyfQeIxVy+Vg37zs2CCi0/Pu2haWcMAhLknux3QolC0ANryE2CRZmX1iM7vSDl0HxNU3X7gO42QPEpbReSgFmJqDhNJSEhf2iHE2RvMhHrGkYYRia1cbg==
Received: from BN9PR03CA0598.namprd03.prod.outlook.com (2603:10b6:408:10d::33)
 by SA5PPF8BD1FB094.namprd12.prod.outlook.com (2603:10b6:80f:fc04::8d3) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Fri, 10 Apr
 2026 04:45:39 +0000
Received: from BN3PEPF0000B073.namprd04.prod.outlook.com
 (2603:10b6:408:10d:cafe::93) by BN9PR03CA0598.outlook.office365.com
 (2603:10b6:408:10d::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.42 via Frontend Transport; Fri,
 10 Apr 2026 04:45:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN3PEPF0000B073.mail.protection.outlook.com (10.167.243.118) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Fri, 10 Apr 2026 04:45:39 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 9 Apr
 2026 21:45:22 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 9 Apr
 2026 21:45:22 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Thu, 9 Apr 2026 21:45:16 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: <frank.li@nxp.com>
CC: <acpica-devel@lists.linux.dev>, <akhilrajeev@nvidia.com>,
	<alexandre.belloni@bootlin.com>, <conor+dt@kernel.org>,
	<devicetree@vger.kernel.org>, <ebiggers@kernel.org>, <krzk+dt@kernel.org>,
	<lenb@kernel.org>, <linux-acpi@vger.kernel.org>,
	<linux-hwmon@vger.kernel.org>, <linux-i3c@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux@roeck-us.net>,
	<miquel.raynal@bootlin.com>, <p.zabel@pengutronix.de>, <rafael@kernel.org>,
	<robh@kernel.org>, <sakari.ailus@linux.intel.com>,
	<wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH v2 02/13] ACPICA: Read LVR from the I2C resource descriptor
Date: Fri, 10 Apr 2026 10:15:15 +0530
Message-ID: <20260410044515.23667-1-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <adhalQxfbMsL3V0T@lizhi-Precision-Tower-5810>
References: <adhalQxfbMsL3V0T@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B073:EE_|SA5PPF8BD1FB094:EE_
X-MS-Office365-Filtering-Correlation-Id: 169202a6-54eb-4ab2-35ac-08de96bc03e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|36860700016|1800799024|13003099007|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	QxmbO7zsMpoYQkBWoqGxSsZDlpHcso0+UleConsDZm7fwfeplwpX/NwHNUV912BSsew4DWj0A8XENaWq9tkqlpAykEFe6MvDOPqVRpVlSRDrOt2ijPEP4a9b95eIQbvvWFucv5hfPRvGyBr538f+hR/g/gWo9vTtJtu4pgJ3sck/wQvVfoIHhnW7+DIpKqTfvd4Zq2L2CFZ4QB6tqrU/ZEHacr9Qm3P48MUqVck9ETN7TP1cv0x6fXXrgrT8SmFcL2e79gp0qwE1tTCrULa/Qb+AnWmeCmlHQtuwOfCqlXh2OxMHXt28s6dXBOYKxMfJTdSSb27lBNBIwDW9CDeaprsiMLwV4RTVvjKZvPeI9CaWUC4T2QBOwj0ynQ4ctRM8nQbvJwmLJxHZctNAi2yO5YbMaHELlilviUm6HB0bzXXwGk+0cdIdwgEGd/M2KvKPoNrGFvLCZxUMn4J3ApHeGr4GdZZzDltfyjVDVJFXf0WaxoOyvaRKkGEd0GljNZRHwBS9VGqbrCGY/adr8QZkItNM3Bfdf68u6x7GGBVTLeKf+3woydkZTPyFwEp66oP6ijWFiF8bqFU8BeHvx1A2hS7GQCSbKTFXnWphHeH/HjzKSi3nPyQshMkGYuMFDMzYxx+SCHFWyZejHq5Yx7Z5qLoShsz8FZbkuIgQyKA82UiMMW0UsAtu+Ku3hp4uwKHESETNzEIbBLMjwDjBcROjYb+OIrcZSyr+cen4qv84E+SMgwoCk7JJx8qWur5XMv7L4/b138yyJe25sBnBO4Hcnw==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(36860700016)(1800799024)(13003099007)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Rg0hbIQxvfyaynGNzqayxBthacw3ISY6qlKnCsUPEYHerhUfC4/HrWG1hckf0RoTfT9VlE1H7fgxSkDMw0SMcpMkWp24wpgQKaOISlGjQfLAJMGwTz3pxnbImGmuldOj5NpI/izbn/wuQQKcfNOY8zGaqhkTMM8SUK7zEaaUXtmsFdSXcJIhIqEmgTe07PKLoM6lS7W/hamoz0Os5AKStFYPLSuxDnoWdK6zrOGRmD8x1Mo7xaklvX9W9Td4gA29paZV+VNHheHtjMSP2gC+23nRL1FtBFR1bExWdfO9cDKc7FRAen5zon1jrb1cJyMpOGvSC6KaF9b4+OeC3qwCa9ekq6yFutZWvZBStyV51CvP/f/JjXa5WQV4bQ1zTERfPNdfaxX5uVwUGjA6oXy2TaiuIui3jEx0oRHBkf1XVv4i0xOcBxrzeFRD1VPHFZ63
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2026 04:45:39.4701
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 169202a6-54eb-4ab2-35ac-08de96bc03e6
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B073.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPF8BD1FB094

On Thu, 9 Apr 2026 22:04:05 -0400, Frank Li wrote:
> On Thu, Apr 09, 2026 at 04:27:32PM +0530, Akhil R wrote:
>> ACPI 6.3 specifies byte 8 of I2C Serial Bus Connection descriptor to be
>> used for Legacy Virtual Register (LVR) data as specified in the MIPI
>> I3C Specification for an I2C device connected to an I3C Host Controller.
>> LVR will be read by I3C host controller drivers and it provides details
>> about the specific speed and 50ns spike filter capabilities of I2C
>> devices.
>>
>> Update the rsconvert_info to include this field. For I2C devices on an
>> I2C bus, this field is Reserved and unused.
>>
>> This commit is the result of squashing the following:
>> ACPICA commit 70082dc8fc847673ac7f4bbb1541776730f0b63e
>> ACPICA commit e62e74baf7e08cf059ec82049aeccd565b24d661
>> ACPICA commit c404118235108012cad396c834b5aabe2dd1b51a
>> ACPICA commit 7650d4a889ea7907060bfce89f4f780ce83e7b28
>> ACPICA commit 014fa9f2dbcc6b1bd42a4a4a6f6705d9cf7d460b
> 
> These commit number is not existed at linus official tree. Please remove it.

These are commits from ACPI-CA github. The files in the acpica folder is
a mirror of that repo. I suppose the commits in this folder are expected
to be structured like this. The process is also described here -
https://docs.kernel.org/driver-api/acpi/linuxized-acpica.html

Best Regards,
Akhil
