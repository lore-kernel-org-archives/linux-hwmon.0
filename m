Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011040.outbound.protection.outlook.com [52.101.57.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE3903FD129;
	Mon, 27 Jul 2026 14:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785163379; cv=fail; b=GVakszF/b4BUmbyJHGiRMOOZSoDHUSfOGxGdSpiJiD3SVJxesl21fxJ3/1EHCluVOSngSdU7C0O9Dt3hriwHHq4c4rf185oqmjI8j+moXJnbKrpt5ZL2lj9okNDONc7e02YixGp2mr8qXHh75xMqutnSxQg4zMMKOcuz/4R5KP4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785163379; c=relaxed/simple;
	bh=gpwYWHYPf/6OWGaJ381BdXdgPSyw54x7rTqFRKprDCY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=O17g12rqev+3X/aDwv2Q4mNMiYujepx4RnerBks188DawM8eDJpnTFL07Ubtq5RVGsPryEeNO8XFeMJskkf1BSyTjYN+X/rMd4snJIuRVQCrnq2LhDXduR40HN3cZlEiJByO3MMLLqD5wDcodhinu3EuJ3ctX+pGzXXGPuaPtYQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=avdovCvi; arc=fail smtp.client-ip=52.101.57.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="avdovCvi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aZqvkZCuO8bo3bK5C3N85ID2xxsCnZ9GeXaJUP1LfcdamowOm9VXaLRAILmSvqZD6lNTvBdvFAh8OYCB8EhKLajeaG+lW4WHKYSzDkkc3H0fcOEvAhZ0cmYs5v+AZAuWooINZshs+Cfz0dvYc6l4qPZvvj/Xu0iSAyylcg81NRtvpmlG6msEk4CFLWFl+CYOlfiOO6GjMS5shyksGG8s3AwmWR/Oru7nCOz8ug+G+cmidHfGIjib8JIOEwidLQLTqzQ7++VIm4Nte+fYLPcy9yEwCaRKcwFYEoFyvvL8jCE3bRmN6/x+sgwjwG1oKDKW/YuS+vWJszmnYqQ52YiwTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GT/42Jla8tWncep2y4VhajVDXQx4+LobZ1oKoyoYGqM=;
 b=mE7Yg/EEmr77ETOn3W/i9ttms9vAETg4arkmW4x0R2hanGumTuewdz24OVH1S7AwldcX1xmaLnrfBwcGhrLnG3d25pgDUbBFp7Xm0Hybpwdo1knVpXU7BbfYxbExFYgOUZdrlujKcJRIM3pMcY1BdroPeHCz6/UxyAjW8DTDNXhHo1k6bsdmM0NYVwvXbjSYZK72i/KpBnGpR8rCk2XIpBoqqIEDVhxSo5J/Jag4nrwchjzD0WC6+6guytCJP/OF2lxfkLm3G9K9OVl1+FlEWJotLugCp4CL4MvBh/DsDMTOAbS7R0nSGvjYoijv9NglWHwUactxnbFMTcblVrb+sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GT/42Jla8tWncep2y4VhajVDXQx4+LobZ1oKoyoYGqM=;
 b=avdovCviMdz2wKisNZW6/NWQlyIqIFVQaPZS91WCQBqSprKG+55Oai1g8BPuX+ezqbAZMZlBAMTz21N/P4Jn3t16nOZZsEBP2Z+xAlpV1HKWtDOWv5+DGnTZ0N1BbEOXH4L1I7+6bCSGeinKOUT6dosMeDwPYQpPYF8hxCThIIaV80h/2LcSysAbV1uakRO2kT6YcQYfjb0FZHFVKJts6WwhupClRAjIJD+FpaL4AQJxCzH+3YBGMPm/U7iUF6hWBo6V6hiSIQSz27Kb6akIuDVCx+avt+R3MJ5RXKKC4i07HPlmsib02m10Vr4RrmEKWZkbMKcPiDpmddEquOSw2w==
Received: from SJ0PR03CA0051.namprd03.prod.outlook.com (2603:10b6:a03:33e::26)
 by MW4PR12MB6921.namprd12.prod.outlook.com (2603:10b6:303:208::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 14:42:46 +0000
Received: from CO1PEPF00012E81.namprd03.prod.outlook.com
 (2603:10b6:a03:33e:cafe::73) by SJ0PR03CA0051.outlook.office365.com
 (2603:10b6:a03:33e::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.13 via Frontend Transport; Mon,
 27 Jul 2026 14:42:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1PEPF00012E81.mail.protection.outlook.com (10.167.249.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Mon, 27 Jul 2026 14:42:46 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 27 Jul
 2026 07:42:24 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 27 Jul
 2026 07:42:23 -0700
Received: from build-akhilrajeev-noble-20260602.internal (10.127.8.11) by
 mail.nvidia.com (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Mon, 27 Jul 2026 07:42:20 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: <sashiko-bot@kernel.org>
CC: <Frank.Li@kernel.org>, <akhilrajeev@nvidia.com>,
	<alexandre.belloni@bootlin.com>, <conor+dt@kernel.org>,
	<devicetree@vger.kernel.org>, <linux-hwmon@vger.kernel.org>,
	<linux-i3c@lists.infradead.org>, <robh@kernel.org>,
	<sashiko-reviews@lists.linux.dev>
Subject: Re: [PATCH v6 09/12] i3c: dw-i3c-master: Add ACPI ID for Tegra410
Date: Mon, 27 Jul 2026 14:42:19 +0000
Message-ID: <20260727144219.177646-1-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721042259.80FA81F000E9@smtp.kernel.org>
References: <20260721042259.80FA81F000E9@smtp.kernel.org>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E81:EE_|MW4PR12MB6921:EE_
X-MS-Office365-Filtering-Correlation-Id: 811c90a5-65d3-4213-ce53-08deebed52bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|36860700016|82310400026|10067099003|11063799006|56012099006|5023799004|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	TmdCboCmw5kxWKqD0NEbLaD9IAKs2TxB5lfH2oxLhlh6GKrw+Php6hoP/Sv9v0PMpnFheKE6nD5wu0sZW8qJarSJStX1OjPMvmm9CGnS5OUdMSZhZxtNsRYAA2PlvffvyMrtIVC44ZmE/Nf3QzuARNKX3Pc4qiaZqjFK1kPfBpFCIkf71f+US2z9e7WpWR0VOiiwC4HI8ZXHpJzNAOvg5PZWaoKupPaFhXV6cgmlu4POQE3bY5Ax8tVCkri3IkrGB8gmyixVAuBMiL8UwbNtUicvnlBwgqSAQojoNr76T2O9RapeIId6zcLMcV+4nnEedhk08VgDCxdd9u/kONjokhDcrPeHyHDTenVReN5hudElbx37yC0UI6dJkt3nMEFS9J72ma1ExWhRmUWmyL1Hdw0H/JwOzIgg0mQBwywhLuqmfzx9zq+aPv5zciOJ31G7qVaa0tj/xhoWRuAv/hqzLHFx2jI1o+zqwlaJIEx4OwLRmr/WBjo6jD74yS/pSArsYY6W9Swzv27qqPxBPzZ9CR1ct4av4UeFHdqTWnV3v3lJ1D/HN9Y9abFSwlnDLmO1sOxdB1hKvwLJbSC/ymCxcVYoIG/RWw5RcpTSbqVEaIZxPexsJ74Yvf+kUM3TPc0S6jz6LMxvMBmLvTmoxPSf7IaeoMqYXH4efnKElcoVafd2pnD7kjtU43GPdCsJXfZX8S9kPzy0JRje0nxZICCyJA==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(36860700016)(82310400026)(10067099003)(11063799006)(56012099006)(5023799004)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	X1aHNLSQT/+hPnBlb8GfF+UZqkEQy+KwQkAlvkV7lBSzNhCna5uU+S71X8NmRKXycoowNMvEXIG3LwFnw/GyVyPtUXkapTIjO8215pRu7x7Cfg201EdJ9GKiaX6sdKz54IHOFhMGxwmyfwSOCgDR0mWo1Pmy3n8c8ygwa1Mcp3GCDypqqLP24Eny8mOKka18IjKbl6EPqrKXx8Rn6L4Gmu7qGh6OjQoqmcFKb3TJy+xPRv3bSApNuIE0LTwTVg6DR9i/LkOcMccpMtQUk6rfkIQ1pS1lq3R+a4+RdaBNYMpPtz/W8NvtGIbgqotYeQZ+IIDNX6yQ+bhO8i7ESk8Cyndh+O2WvdqwiJn9193nctoZqSvhDjS1e3UhOiPCnHXlDLvok6Ybc7XR6tFrOPLkT9BWw4mQyHjIK+L0fEv6UhVQzGbSKFWTXhzxr5+GtDqk
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 14:42:46.0233
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 811c90a5-65d3-4213-ce53-08deebed52bd
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00012E81.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6921

On Tue, 21 Jul 2026 04:22:59 +0000, Sashiko AI review <sashiko-bot@kernel.org> wrote:
> commit bf82e9c156c66763c855e5549bd1a91bafc5fdf3
> Author: Akhil R <akhilrajeev@nvidia.com>
>
> i3c: dw-i3c-master: Add ACPI ID for Tegra410
>
> Update variable names to generic names and add Tegra410 ACPI ID to
> support the I3C controller in Tegra410, which is a DesignWare I3C host
> controller.
>
> > diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
> > index 3ec3ab1c13b4c..efe37f5224c71 100644
> > --- a/drivers/i3c/master/dw-i3c-master.c
> > +++ b/drivers/i3c/master/dw-i3c-master.c
> > @@ -1860,11 +1860,12 @@ static const struct of_device_id dw_i3c_master_of_match[] = {
> >  };
> >  MODULE_DEVICE_TABLE(of, dw_i3c_master_of_match);
> >  
> > -static const struct acpi_device_id amd_i3c_device_match[] = {
> > +static const struct acpi_device_id dw_i3c_master_acpi_match[] = {
> >  	{ "AMDI0015", AMD_I3C_OD_PP_TIMING },
> > +	{ "NVDA2018", DW_I3C_ACPI_SKIP_CLK_RST },
>
> [Severity: High]
> This isn't a bug introduced by this patch, but adding a new ACPI ID brings
> attention to a pre-existing issue when handling ACPI bindings.
>
> Does this driver safely handle ACPI PRP0001 bindings?
>
> In dw_i3c_common_probe(), if an ACPI companion is present, the match data is
> cast to an integer bitmask:
>
> 	if (has_acpi_companion(&pdev->dev)) {
> 		quirks = (unsigned long)device_get_match_data(&pdev->dev);
> 	} else if (pdev->dev.of_node) {
>
> When an ACPI device binds using the PRP0001 mechanism, it utilizes the OF
> compatible strings and the OF match table. In this scenario,
> device_get_match_data() returns the .data pointer from the of_device_id
> table (e.g. &altr_agilex5_drvdata), rather than an integer quirk bitmask
> from the acpi_device_id table.
>
> Because of the unconditional cast, won't this store a kernel memory address
> into master->quirks instead of a valid bitmask, thereby activating random
> driver quirks?
>
> [Severity: High]
> This is also a pre-existing issue, but does dw_i3c_common_remove() correctly
> handle devres clock cleanup when the device is in runtime suspend?
>
> The probe function acquires and enables the core and pclk clocks using
> devm_clk_get_optional_enabled(). These clocks are explicitly disabled in
> dw_i3c_master_runtime_suspend().
>
> If dw_i3c_common_remove() is invoked while the device is in runtime suspend,
> the clocks are already disabled. Since dw_i3c_common_remove() does not wake
> the device (e.g., via pm_runtime_get_sync()), won't the devres cleanup
> routine run clk_disable_unprepare() again on already disabled clocks,
> leading to a negative clock enable count?

Both are pre-existing behaviours not introduced by adding the Tegra410
ACPI ID; they are better handled separately.

> >  	{ }
> >  };
> > -MODULE_DEVICE_TABLE(acpi, amd_i3c_device_match);
> > +MODULE_DEVICE_TABLE(acpi, dw_i3c_master_acpi_match);

Best Regards,
Akhil
