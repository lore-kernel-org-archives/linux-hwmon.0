Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010007.outbound.protection.outlook.com [40.93.198.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B2A6412C05;
	Mon, 27 Jul 2026 14:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785163311; cv=fail; b=GdIIHqyATFnlYWUJnHBQj0Kf/YuCN/BLt8/cmbT5As8IAl5j9lWUUns1RXBuDDpzi/AZ0LTt+PHPs/OxNvNfRQc1uuvlWjVRd6kMaolVBuj6RQQ9BgG+5Zo+u2++WTLANd8RIYqzj/VDURb9EnBp9mtaL5rypr4An+7rS6yvKak=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785163311; c=relaxed/simple;
	bh=zHhGU/XYlUYozCNfXptvnBdZ+ihxGxSwz1W2hmd0F1Q=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pdcezvRmm/PHckJnREyx98Brnfc1Hoaz6mqQosF4S/fMMupRP8TcVbRM/vF5JnBdBI1i6CppVGoTD4k0pvGO92B2/JLu1pihmqOf7VmPsjXH75jTIed3lKqajJd0Hj09SiQF3bDpEoYNdpjC9Iir53+HEaeza17YUPkWgq046Ag=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=WKZASIFx; arc=fail smtp.client-ip=40.93.198.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="WKZASIFx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X6kRh+afXNuDGiGwbLMgspLBYm8GrodY4kIsOIiJZwMkYi1f2U1by7GNNiBIDWykxCUGfTm6/6LWuIyxxJ7/Pca4iSxq7gOCgG718MI/A+T3uizg4bFIAXfi/zKJcsYJjDUBIQfWsgM2F63mFBO7KHXiiYAGenD5QWAaRo5KTrsH0SHQh4GTdOrJ01vju2p8yk08Ct3gi1Gg1PIsugCwfD8U5lTaN4EPq+UcAkim7Xn4Lsq+P/dFKBk1qkR67hn09qAZPXPm9hb6yWl+Ro4yuiPrEyTo5qW0fuNvNhOD7wDpTisoyFHnjUS4PLv7P4U4IemoCeYLuJgmGhnXSAarVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5F2vRrvZm/D0zX8pni3O7I/DEeJA1ipvbGF0lGByCG4=;
 b=CRDz+wBKw0L0Q1P41ouuUZ2iVQYcEVxZ4LDYybkGAoqZVZkniWp/iShPTBXVnq3abWHCVagweb2ih32V56Q6oVoQWpvGxV7xRTy7OzsM1s35VYchtRoporT7mkdTAep9jd/XwS5FVGjuicDGPujVUWn8j9knwlQM4usVEKOx06GPxgHMqaGlsDSwphK5627RhX6VCyvliz26ceb6TcEPnAiTyRwUPxVonXtKp5fWogU78PNvVHltDTqRNMMuhXtzDxSeXKTfU2mD21+y8brqCYWXzG/JyEhHGwhzdoHBwKGi0hSs1woQD5GGuearTOrOimC/La7VbUD6tdfvjLLBnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5F2vRrvZm/D0zX8pni3O7I/DEeJA1ipvbGF0lGByCG4=;
 b=WKZASIFxzSqkv34ZLsi9Zp2MQP2S8HUWNLzZuDIplYuANI9lx7xt+2zSIBaAolZmgVeY6RZnccRXtcT7deh+R8zhM97WmwVQF5HLH9eHwlDiSqA0YpUSlODuNBQ0SrW8N8ARX6bp24oeAthjB/7T+mnSp/OA0YT4s3bys8lvKtJahBQ/TkSi03/JaU/6De30x7Pt8Ngd1k8uTwgOQp3X8khdWZhNDkD9JU3rIDJlFspt/+MzJ7B+5R8nynjK95i/iqF280B8HkXtxywpK/lV5ukflOnWWcr/ok9GNJnAbHeuwdlwFVYF6yTOzgWua9OJXxsLHPqhYKplJSmRtcVgFg==
Received: from DS7PR06CA0006.namprd06.prod.outlook.com (2603:10b6:8:2a::7) by
 DS7PR12MB5837.namprd12.prod.outlook.com (2603:10b6:8:78::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.13; Mon, 27 Jul 2026 14:41:41 +0000
Received: from DS2PEPF000061C1.namprd02.prod.outlook.com
 (2603:10b6:8:2a:cafe::73) by DS7PR06CA0006.outlook.office365.com
 (2603:10b6:8:2a::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.13 via Frontend Transport; Mon,
 27 Jul 2026 14:41:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF000061C1.mail.protection.outlook.com (10.167.23.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Mon, 27 Jul 2026 14:41:40 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 27 Jul
 2026 07:41:17 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 27 Jul
 2026 07:41:16 -0700
Received: from build-akhilrajeev-noble-20260602.internal (10.127.8.11) by
 mail.nvidia.com (10.129.68.10) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Mon, 27 Jul 2026 07:41:13 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: <sashiko-bot@kernel.org>
CC: <Frank.Li@kernel.org>, <akhilrajeev@nvidia.com>,
	<alexandre.belloni@bootlin.com>, <conor+dt@kernel.org>,
	<devicetree@vger.kernel.org>, <linux-hwmon@vger.kernel.org>,
	<linux-i3c@lists.infradead.org>, <robh@kernel.org>,
	<sashiko-reviews@lists.linux.dev>
Subject: Re: [PATCH v6 08/12] i3c: dw-i3c-master: Add ACPI core clock frequency quirk
Date: Mon, 27 Jul 2026 14:41:12 +0000
Message-ID: <20260727144112.177391-1-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721042615.E38721F000E9@smtp.kernel.org>
References: <20260721042615.E38721F000E9@smtp.kernel.org>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF000061C1:EE_|DS7PR12MB5837:EE_
X-MS-Office365-Filtering-Correlation-Id: efb03446-76a4-4367-6845-08deebed2ba2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|30052699003|36860700016|23010399003|6133799003|11063799006|56012099006|10067099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	gN6WoJd7iewpDZA+CFiji2UqgFku8CS0rddmrvIaQSdWRzpdLeQyvibRgu3Q1bfvqVCqTQfcJ7/UostsrQe3V+xYkCsTjMRNmIP9IcAITgTe982HvNXsS3pvoCIB7AqvtjK6T4ZRXJzcbu9RwW/jBzcXvJJJDlbNdEFjaks9pybmkYtHJVlKJxReZjMNK1JyDqiAz4RQu2kxaLZJZQKbvva1JznplhNqNF+EguAr72tnOwPh9e5PCMemsyVKEVCA1ashYSu/C/vkX0F5uXBBG90BEA7nTtRprHGzUIKt6ah72+R3XyqD4v7yflVpnH9FCwZUSPqzTeZPc/PSuLYDs2uaKdtxp7H42FjMLMnLlh9wEHETLgDLY4VGy3SSexX7FuDuT/nix2FthaL4tfTJ5n0jJCczOUdLOwBcJcDVEjiSBTfGkhoBtFRRKAC9zQJKwORryDNaygR9HKNihWYQx95rHmLsg+Po+KfsO1IJsKOaIpCGiGnG9PyGbX50GZ6fM3dxykdV0thiRcIEHhlSRd6CqTtshwjLfd83LmScEQvI1HC26RwFFnJc63b0hK2Ev2+q4U1lEcPNGLkl6R+iiFfff0tslW1QRcRNlHPGxQoMdmarVufDTZhJQoeHlbI0XTjQhPw4lbIjGCYwPjdaLzNyaUHFYw+2XSlZP4STVKiNlUQclQ6T0k1jxXrwgZcqsMbs4EaY/8+0LhMFNR4FnQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(30052699003)(36860700016)(23010399003)(6133799003)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	AUtwfdqjh8rmkTLwWzqrjLjSXKXmCrU2TCnM2EZPBR7T6NJVH1VtfbVVDkGnn+istTwbo3ydGLiLhS1pIydX9OYvIiqGg1qKdOn2Ucxt8plQeR39U3IOLOdEVfXppi2v979K92/3It0ujYuzTbszOeAcvtnCAUow0tq0ljo5W1fOYIDIKt3wAiYTklvI+o2x8eOVDs+zNGD+k4Hc+Nub1UB1fv9Vr03IbHJzPl7YTGwycm/NsaNW96vwwiqNP9Zh2jjgPEMQFYCd7puXHRS2NKxajic09nRNC5kucCjV1Ha1fv5PbpsMTgJPeRVfsr7s28NU39/7xhFNv4k8W3gw1kIg2qKVP1jbhvWgDHEp9UUFdnk3/XRnAkJZ/ll4Kws35wsaljx+y2g/dCYw/CWdrmBHN2/mzbwdaKIc4HkxXvU7jeCF39KeQQTunsbppxQT
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 14:41:40.3292
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: efb03446-76a4-4367-6845-08deebed2ba2
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF000061C1.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5837

On Tue, 21 Jul 2026 04:26:15 +0000, Sashiko AI review <sashiko-bot@kernel.org> wrote:
> commit f3333de342eb1c266eb94909516ea27afe8378d5
> Author: Akhil R <akhilrajeev@nvidia.com>
>
> i3c: dw-i3c-master: Add ACPI core clock frequency quirk
>
> Some ACPI-enumerated devices like Tegra410 do not expose the controller
> core clock through the clk framework. Unlike device tree, ACPI on Arm does
> not model clock providers. The hardware is expected to have its clocks
> enabled by firmware before the OS takes over.
>
> > diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
> > index 29030fd9594aa..3ec3ab1c13b4c 100644
> > --- a/drivers/i3c/master/dw-i3c-master.c
> > +++ b/drivers/i3c/master/dw-i3c-master.c
>
> [ ... ]
>
> > @@ -556,13 +557,33 @@ static void dw_i3c_master_set_intr_regs(struct dw_i3c_master *master)
> > +static unsigned long dw_i3c_master_get_core_rate(struct dw_i3c_master *master)
> > +{
> > +	unsigned int core_rate_prop;
> > +
> > +	if (master->core_clk)
> > +		return clk_get_rate(master->core_clk);
> > +
> > +	if (!(master->quirks & DW_I3C_ACPI_SKIP_CLK_RST)) {
> > +		dev_err(master->dev, "missing core clock\n");
> > +		return 0;
> > +	}
>
> [Severity: Low]
> Is this check reachable?
>
> During initialization in dw_i3c_common_probe(), if the core clock is missing
> and DW_I3C_ACPI_SKIP_CLK_RST is not set, probe immediately aborts with -EINVAL.
>
> By the time dw_i3c_master_get_core_rate() is executed, it seems guaranteed
> that if core_clk is missing, the DW_I3C_ACPI_SKIP_CLK_RST quirk is already
> set, making this fallback check dead code.

The check is defensive and is harmless. I believe it adds to readability,
but can be cleaned up if preferred.

> > +
> > +	if (device_property_read_u32(master->dev, "clock-frequency", &core_rate_prop)) {
> > +		dev_err(master->dev, "missing clock-frequency property\n");
> > +		return 0;
> > +	}
> > +
> > +	return core_rate_prop;
> > +}
>
> [ ... ]
>
> > @@ -1573,14 +1594,28 @@ int dw_i3c_common_probe(struct dw_i3c_master *master,
> > +	if (has_acpi_companion(&pdev->dev)) {
> > +		quirks = (unsigned long)device_get_match_data(&pdev->dev);
> > +	} else if (pdev->dev.of_node) {
>
> [Severity: High]
> This isn't a bug introduced by this patch, but since this block was
> relocated, I noticed a potential issue for devices using ACPI PRP0001.
>
> If the device is instantiated via ACPI using the PRP0001 HID,
> device_get_match_data() correctly falls back to the OF match table and
> returns a pointer to struct dw_i3c_drvdata.
>
> Does casting this pointer to an unsigned long and assigning it to
> master->quirks cause random kernel pointers to be used as a quirk bitmask?
> Depending on the kernel layout, this might cause erratic driver behavior such
> as missing PM operations.

> > +		drvdata = device_get_match_data(&pdev->dev);
> > +		if (drvdata)
> > +			quirks = drvdata->flags;
> > +	}
> > +	master->quirks = quirks;
>
> [ ... ]
>
> > @@ -1636,15 +1671,6 @@ int dw_i3c_common_probe(struct dw_i3c_master *master,
> > -	if (has_acpi_companion(&pdev->dev)) {
> > -		quirks = (unsigned long)device_get_match_data(&pdev->dev);
> > -	} else if (pdev->dev.of_node) {
> > -		drvdata = device_get_match_data(&pdev->dev);
> > -		if (drvdata)
> > -			quirks = drvdata->flags;
> > -	}
> > -	master->quirks = quirks;
> > -
>
> [Severity: High]
> This is a pre-existing issue, but I noticed a potential problem in the device
> removal path regarding runtime PM state.
>
> When the driver is unbound, dw_i3c_common_remove() calls
> i3c_master_unregister(), which internally calls dw_i3c_master_bus_cleanup().
> The dw_i3c_master_bus_cleanup() function accesses the DEVICE_CTRL MMIO
> register. Because the driver does not wake the device via
> pm_runtime_get_sync() before unregistration, the device may be in a
> runtime-suspended state with its core clocks disabled.
>
> Could this cause a fatal bus fault on platforms like ARM due to unclocked MMIO
> accesses? Additionally, if the device remains suspended, will the subsequent
> devres cleanup attempt to disable the already-disabled clocks, causing a clock
> enable counter underflow warning?

These are existing issues in the driver. It would be better to address them
separately.

Best Regards,
Akhil
