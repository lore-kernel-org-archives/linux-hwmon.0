Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011027.outbound.protection.outlook.com [52.101.65.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 466EF2B2D7;
	Fri, 10 Apr 2026 02:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775789257; cv=fail; b=d1SSrWPQ6uedI7GgazB/o7q6k9vWXP8QIM/eYzs64GI9Y0L621VjVYTvDaXIFGrkAzEnDPhk5Ghnk7anMlaJY6fHGReqKNAW2taZ9jM4M0WN0kiQt4CgrWaO9hHJK7lN3WgHeDFRwuaWWMQ8mS19sDJOtQGd/2Eqk3guYUHZiAA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775789257; c=relaxed/simple;
	bh=6yJGohuPyYkA5Lhk33g1CBUIS9d9bQlE9+kDfwfO4DY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=KIDZs1MFrWfXPjMk+dVEQy8blZOjtMe+kavaseQC4oD/GVqpsBj45LUwQH9l7QcnjYGlgeEgO3caFR/Tm3YQ0TuRrUMlEu97eK0q6jNZbrrjfMUl3znX6Khtox2zQ7KGHdw3/FWaBJ8APYvf363BFwXgoGNnvcHh4cwTtj24mEI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=JY512Xms; arc=fail smtp.client-ip=52.101.65.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="JY512Xms"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=txu9SrgVeSHkqLk73P96bIvONdWBOmkLYO7K+mug07ZCeS3UoSNZxKOhdSyDRqc49q12Hu748Fu2budgBMqfwbBju/hwSfGI7GFlk5Il/kDjtSMgqoZ4ZcXqPTiVm2s9CCJAGYXolvVB8Om5lcVc7CeD3VvbU4S4LcMpQDIpb+GfTfRSKl0HqNh9qDUroi/pLX05RfADvD262uhhQcUVB1YTHvTtlXtGRA694cW11TGG25MjsC8HZa5ntHDWFVf/tJzUprUl53s7LgRMYZZrfHXFmqhQDZDz8mIfh7WKqMLmcPEDXVvds7uNPsU320H6rYTxeiud3BPhfAhughrywg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MdY+uvlW3ADcZdox8Z6CLV2AxEUD5ae782t0mZP+URw=;
 b=JrCbsGBocVaeEO4AHtWs2o660aWEOB19QKJwwHkz/+k6QhW8h/d/kq18nOfhuxCmLGdUzpAUOdA5zHZEiPGbMRHU9TU8g6aVmPI8Bxm0PQRNSQtkqLlrPhQQGc5+PaVwDVJV8VUcE1c2bbh4JYN9PLTOyfQu/0Ar3Xd/5lfuE/ALWuQasiw0hD1iZAV/OSJzJd08eC1UgrITCmL890zow9VSYiwpgvSLVN8wdCRnt6ObY/bRflNHWfM8nXZX8XclyZL5HPYdYjte7m7FMKyg4gh9UGryLpSf31IdE82rpHw+DsUaO3pL5b9tk8kB67GR+6RFsb9C1rwKqtcGzxQZww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MdY+uvlW3ADcZdox8Z6CLV2AxEUD5ae782t0mZP+URw=;
 b=JY512XmsMLuUAIyTUrP9gH7s4T6U0ndRamMEjaIbU6TCNWx0Nk2JxTR65xbfuMtiVxy5ZzduzuuIt0lcu34gtKiXF7CEYh9wqjowj4puN+s4ct/g+wHZEVDvL+yLZ6seKq3Jy+Kv2uMFhKBpSUkDD4CNzNsDqKspWbeTiiAezSvvHRLPiOqXe+DkbMmB1cBixVuB0t+S8mWjTxQU4HxHHTkq+6Z21zG40/dtA3LBy/oRKZmcr0Sw7gTREAnh8TNM/37HbZW8tdHgYuJTfIUiwYiA4QB1PILzNlwSY8jX9vp/qO8yRZPt/7+iRzL3kwrB5odhZgfNBx9+4ww7Qi6evQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AS8PR04MB7990.eurprd04.prod.outlook.com (2603:10a6:20b:2a5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.42; Fri, 10 Apr
 2026 02:47:32 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9769.018; Fri, 10 Apr 2026
 02:47:32 +0000
Date: Thu, 9 Apr 2026 22:47:24 -0400
From: Frank Li <Frank.li@nxp.com>
To: Akhil R <akhilrajeev@nvidia.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Robert Moore <robert.moore@intel.com>, Len Brown <lenb@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Eric Biggers <ebiggers@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-i3c@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
	acpica-devel@lists.linux.dev, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v2 10/13] i3c: dw-i3c-master: Add ACPI ID for Tegra410
Message-ID: <adhkvFph8wzhvu0A@lizhi-Precision-Tower-5810>
References: <20260409105747.48158-1-akhilrajeev@nvidia.com>
 <20260409105747.48158-11-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260409105747.48158-11-akhilrajeev@nvidia.com>
X-ClientProxiedBy: SA9PR13CA0057.namprd13.prod.outlook.com
 (2603:10b6:806:22::32) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AS8PR04MB7990:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d6dae8f-ab15-419b-4250-08de96ab8350
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|52116014|376014|7416014|38350700014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	g4uUP4X7cf/6i7vPyCP+bcEyvZI/im9CWC4E3Ud3KQN5r/T7LzBSOGq/0347TBYugyPI0qZLhV2V0xR4/ntizCFeP1ROTbrwBWu9aJfG/A87MM9UuJo1ldU8+W/HnxUgKYb/i5KWUqQI05u92v4nFQ6Ul2z/5fR/+tRaJUum0vbBScI9jn5L+7Aki/GnRlVZ3zqCz2VVlWLhb96iSd0B5l3H68YF0K4soYieHFVSC1OBSOSg1cMd92qI8rYBQc/Pgkt8dkqszaZSKfg9wjgMpxUvz8exFolnVYVDoi8fbq+fEuJQ524DdtCFIVYwD8OB89n6qSpcKkhQ+ONchFNsGWHIm0gfQ9MQ3nxb4DGkdE6Gn94rTw9hnkYtBBL00cN/63YAmQUMcTRogQgJQyj0F1C/dxRFZLe699mEBluphEvOTt/oLK68n9Lm+ejSG1FVZ4pSQJ+G2dIebBMZWT4tBnKLwLiIxHndFaqyxzQJ1AMJSsSBNWyIfMhcXXh6CcQb2YRmJI8DyEQ4VTGdvpMBXIT+CD+SmGDoL8SZbN9M0mT3Bu1JdtLET7zZOmvc0O9du1pIgVSGF4eZMrgXRjsPlMtKlwGlLCyZ+QiQqWTfWygwltLYBkyiqifZvOg6+Vlxxe4VM327qY6Y4NUecRPlVYFKYAwfa5p4GAfXkg7pwxuw8bxYm3WRWNwErcQz3tdKf7rt4TxrcV036pMyA/Rk3K3C4Jg9W1YlGHqCuBdjYXnR0K8IZFf+JjjbJlrJ3jJ+6V2A/jiPn/M16zZWAiCByoxtLXNNUDWVDkQIKg5AKPI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(52116014)(376014)(7416014)(38350700014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sXX7JBKtbie9l5ojHiB/bll6DG0WulPYzIbGCEpiFEjpHy7iHgHd8ZzZon2G?=
 =?us-ascii?Q?k6pB8EAgVKdWJAt+NGZQWpxB/+atQ30W3fkttEUiv33KhUcJvXyGOQ8vsOYd?=
 =?us-ascii?Q?ygIXho37+Cqhhr4Re3U9RL9B2uYquLjTDOlBG2YUefDnsLLz3OPordeqwcWN?=
 =?us-ascii?Q?ePaYBgrFpgmFddT0ouviUb9BDSYIMZiB2qTaEy/RGadGRHa77HzXHGgYGx0R?=
 =?us-ascii?Q?VEKZvd6eRYjLK1Oip3OQ/bq+WfQWe8DkRls4TptYtj7NUhdRIVLVe8M7X6qz?=
 =?us-ascii?Q?2H5RE5/7SDbmvLHYZewL0XctPExaeKmxXb61cxgfAcPdwmCjYoAzRgFuOvu+?=
 =?us-ascii?Q?SLPw/PXp+yiZV7p/DoNJfhqn9aNW73tCMdMaTn4AkO/6Tva3X/bZtiYd4syC?=
 =?us-ascii?Q?FeIHD5sYihp35ftd63PavJqt4bVXXQga+J2Hh5wbHjHsciiqmg/q44ioZVaH?=
 =?us-ascii?Q?4ix44eD5rs+c63/R0AJCajGHb9MFj1SLM30EwpLq6p388erglQzDMBRrRMZG?=
 =?us-ascii?Q?VWHoOYUN//YjfVQggNxyH/xOirzBYg9V+20fXACXibF5PkDWR4eP8pPAU8Ii?=
 =?us-ascii?Q?gpBf0nicou/S/iXK4kS+B8YcVNqyRHvH6ZkWeZil1NFkAE3XLloW0XRvW1Mn?=
 =?us-ascii?Q?rhL4hqIRZHVek5nHvfsJ6mXL1KOGlEfHU9z4WZISpz/m2EegMMyxuDkmMLwB?=
 =?us-ascii?Q?gKxi9wvcJ2biKG+1PkWVDfRBvZw3hwP0wwocM5Qg4VR7NJLOem9y/bZXECNm?=
 =?us-ascii?Q?5123i+MyW/+OV80HfinT7J3/adPcEAA86CvlDPUhUqqTHwCRbbE8oqstNcEo?=
 =?us-ascii?Q?GXcSVp6lP6Uxx0jc4V7BrHxpmgIHZnfHTvsIxJ+TaP+E7VROrUJ9gInG+5cf?=
 =?us-ascii?Q?BERqigGQz3i4907ukRNNM+WRWyonFHEmwzJe+yFcYp1s3ltAtz6IVaGS0BCE?=
 =?us-ascii?Q?zd1pK+1Vi0pLtMVAMVY8gPxWcgmJzfkU4Sp10TWmbEhJLyA3Ypfc7aVnJq0x?=
 =?us-ascii?Q?T7JdIJTkm7l4p4aKovNMwxVZ6ZrlDOiUpbYXG82Gj23VtYdX355V/X1uCHMj?=
 =?us-ascii?Q?x8RfUrih2M00nBUkvs9yJR2AZMe7msOluu1/eqduV7Tb+wQV+O1Fwi2S55XZ?=
 =?us-ascii?Q?tReLTfch2+Jin1mFwcIbqVtzyOja29j1x7caaLWa/UYQ9u/4TcNFPHtUo7sr?=
 =?us-ascii?Q?2Q61/e6rFsKUDm0qsKZa0ACaVwkiXse48lbcEWc8xSgO0PM7C2kUZsALOjio?=
 =?us-ascii?Q?D25CNLNsP4gKd3j+BwvxEMbB4LDQE+ebvPXy1yAebcilw7pl8wHlr+5A0JmW?=
 =?us-ascii?Q?R+4cZihSO1zrZW/fvaVhLKcCc28VM9kcsEnR2xun8jXtgGtSv66S+/ZNTRiw?=
 =?us-ascii?Q?TRbAeHoGmMKicawKQ40LlpfPM9flD+b0JJ3NVDEtZHBWxrb90IXsPt/XEkY1?=
 =?us-ascii?Q?Svox63YBxKz5AaCHbAorZq1WQ+JGINWbcx2GBlbBpEGDIj24UzJ7C8xwn7dW?=
 =?us-ascii?Q?aalR2bFz3dz7CnuZTwi4OU5Y8uO6b1d+Xjuo//NGWO0CS8flaWHjmA6DPwYc?=
 =?us-ascii?Q?CWOoCNulka/9AWgQXdMuT8fSWWATiohpZnYyoPCl0mheX+sQEU1MbOrjRhxu?=
 =?us-ascii?Q?9iIP+OnMbi4jOjRCiNk7vjga6JjJ6vDshbvKI/32P0dL7NWNcsdrxwIYT71C?=
 =?us-ascii?Q?fP07d13e8Io7w82/M93/ONe2JpQ4rS/Lgh/U1Kr/pHOWnLRJmk9eVmp6qTzh?=
 =?us-ascii?Q?h5ewa5IqZg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d6dae8f-ab15-419b-4250-08de96ab8350
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2026 02:47:32.2801
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yRRLFutBwoYQ9VZd1RHQUm9Fvb5OT79KGJQr5fGq9xWf7jUsB75eC4m9XTzHxxaiAXubre/Z7R2EexMztQWQdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7990

On Thu, Apr 09, 2026 at 04:27:40PM +0530, Akhil R wrote:
> Update variable names to generic names and add Tegra410 ACPI ID to
> support the I3C controller in Tegra410 which is a DesignWare I3C host
> controller.
>
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/i3c/master/dw-i3c-master.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
> index a62eec6d2ac0..e0ca30308cbb 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c
> @@ -1869,11 +1869,12 @@ static const struct of_device_id dw_i3c_master_of_match[] = {
>  };
>  MODULE_DEVICE_TABLE(of, dw_i3c_master_of_match);
>
> -static const struct acpi_device_id amd_i3c_device_match[] = {
> +static const struct acpi_device_id dw_i3c_master_acpi_match[] = {
>  	{ "AMDI0015", AMD_I3C_OD_PP_TIMING },
> +	{ "NVDA2018", DW_I3C_ACPI_SKIP_CLK_RST },
>  	{ }
>  };
> -MODULE_DEVICE_TABLE(acpi, amd_i3c_device_match);
> +MODULE_DEVICE_TABLE(acpi, dw_i3c_master_acpi_match);
>
>  static struct platform_driver dw_i3c_driver = {
>  	.probe = dw_i3c_probe,
> @@ -1882,7 +1883,7 @@ static struct platform_driver dw_i3c_driver = {
>  	.driver = {
>  		.name = "dw-i3c-master",
>  		.of_match_table = dw_i3c_master_of_match,
> -		.acpi_match_table = amd_i3c_device_match,
> +		.acpi_match_table = dw_i3c_master_acpi_match,
>  		.pm = &dw_i3c_pm_ops,
>  	},
>  };
> --
> 2.50.1
>
