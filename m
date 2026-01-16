Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010012.outbound.protection.outlook.com [52.101.84.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0583829E0E6;
	Fri, 16 Jan 2026 22:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768602501; cv=fail; b=KBXg+EsX5ID9zExwvn1A/TXcYKOgPqR/8TWzVGlbEtyu8KtV5DFn2lnl0kcffYcMp0ioZPKLMOD/PU0IWIw+Wo0BaOUnc7ZEgJE1Pgp/R8GwzD441RY/yqx6z43s7Oa3gTUpG81NpUe9/cDGVy0l9J8EgHLZYph8Q9TAyA91i1E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768602501; c=relaxed/simple;
	bh=g0hlFCqlY5P2ua39KN40QhEZO+YdX921Lq+MC2H/1uU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ANpPhs62KeAZR9iziUTzIjy0pp1qISCLG3pY823JfnXEdfethBNb7SKdQmOyUmtEjUnlCQKEZI6wxkFN8LsRcpidqFfiQseiDj2xVs2QL/aM6vnH+Rj7iFPgNL6sbBDRqR7Ew12jkGuDFEnkP88saY8OSAaIPW3sU2gEVDrdFDM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=dcyqxA2S; arc=fail smtp.client-ip=52.101.84.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="dcyqxA2S"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mi9N1SA5xSZ+SjqEWIMoL1ypex51rU69xZEOjTN99qSDDEtAKmWd0utj/QqB4ZKxGi4sywn47OkPSY7shd6GyIu9QXeqQCP3flITPChFsD3Hqwts6EQ0L/Vyy0dMnpWSZcqYi/mXJmAkxlTvqkzMsQWN50Z++723A58ETDVIfmkr6+2ifmCnINvC1J48D3p74Qf81L6PN4N9mUEe88B9XTm6VN2gvyRqZs5vPkPWU7tV60i3cOBoVml2UEDxiACJtCgxW5QUZuDzuQ/ms3A4Kt5CTqaOesoycB0/xX2qqzQWlM+yOuFgPd5cReXYEfXxJpK2iboeJmemkx9Ig+4AQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X2+pzwU0oEnxVt24zwRDw71PgnS6abaH6I07Ga+LT7k=;
 b=vt3pC8PQ/L93H8g3zlILUGEEvtQtUvfBJB2Kj3PWR1Y/Zdm5ESHJ9sdRgNbY/9q0y6lhaJoTtFw9UBKneZr/ZmUseenIU55F5wbeqmvFahu85fNSjAsN0HyeeFz3PLI+jXZGrBrRFU3zQYL3imxj1BIR8BpwZVdaeGJ9lGyZPlQGHE7wfzAd0AHtjWXu6V/cMX4ipyysoi2SQbkWUjqLxFR6expU/6NC95hNJyz/807Siy/wYWgF4APdhwl3MI2p3cApjRiNg15aC67bosKkg3EmDXqc+3k2J3agY5W81DUUQVQdb8ypwG+zftwRTpEtXe/EA0H7ZsUgmDzgRf2C5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X2+pzwU0oEnxVt24zwRDw71PgnS6abaH6I07Ga+LT7k=;
 b=dcyqxA2S4xAvj/Y00wozo5CXFX6eRvamNeyJnwOIOPWtaCAUQO7BpGB5pUJ0Gm5/8RU67Jx7iNOAsVImAqIzv7LK6syIRZ7pR4N9xIn7o577QVXSCsP+4vkhND9XelxSiOG6OaTS9KGqTrh6q4/QxLOPOnoxZJSWVkQHez4nbUPofVOz/lStZOmvW3XMPf3AOsSGTz6yg1usySTRJduilJvRIFRT/hRjWa952nMh2xz48/P9Sxv6lNLzQYjS4QGGjPUEOYGfgBJPARgvJAkVn050B4wEc7l3b+6yl8uVmODD6j/j3LNSZGD0V+ziVQM8iIvy7pFMl7hc45uzT/q3HA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by VI0PR04MB10344.eurprd04.prod.outlook.com (2603:10a6:800:215::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.9; Fri, 16 Jan
 2026 22:28:15 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9478.004; Fri, 16 Jan 2026
 22:28:15 +0000
Date: Fri, 16 Jan 2026 17:28:07 -0500
From: Frank Li <Frank.li@nxp.com>
To: Mayank Mahajan <mayankmahajan.x@nxp.com>
Cc: linux@roeck-us.net, corbet@lwn.net, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, priyanka.jain@nxp.com,
	vikash.bansal@nxp.com
Subject: Re: [PATCH v4 2/3] hwmon: (tmp108) Add support for P3T1035 and
 P3T2030
Message-ID: <aWq7d5XOpeUYdlzg@lizhi-Precision-Tower-5810>
References: <20260116113554.986-1-mayankmahajan.x@nxp.com>
 <20260116113554.986-2-mayankmahajan.x@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260116113554.986-2-mayankmahajan.x@nxp.com>
X-ClientProxiedBy: PH8PR21CA0012.namprd21.prod.outlook.com
 (2603:10b6:510:2ce::6) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|VI0PR04MB10344:EE_
X-MS-Office365-Filtering-Correlation-Id: d9dd2295-6d25-48a7-29e8-08de554e8a62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|19092799006|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IGfOYcVTslYgnzwLuHc+luxz3K6G46+XbNk7Ffw4Ab/f7swDu0UA6gXAYFXr?=
 =?us-ascii?Q?WYAYn/1dCDhNc4ehwSK95/qMlAp45lSdJ/ULPS/CW05leI98ASSQWbsl2jjn?=
 =?us-ascii?Q?j7S1ggr0REDsAHKdD4oxOH0gWIKFuZysmNaczwHkzupDPFPhOFA4vwyPvYZo?=
 =?us-ascii?Q?5H3T4iJGu65UAIaYaJwQyeCzERPsBpuBvo5M3Djqwj/PRKy2fulHaXn3Pwvm?=
 =?us-ascii?Q?JBM56XdgqPk6EDy61bsHvL5k25PQrmYP+bJV0MfYNBiO57Wx3+gvtftDIJpo?=
 =?us-ascii?Q?UepqCbbrrtmw2Rf6N8DsyJkg1VWZm4WplgJ2CERseaVqlpLxeKjRy8BJrCUD?=
 =?us-ascii?Q?6NpdN4D+KTsk2DBoWF7wsKEwYse5x5hMNxDyfXviczfKIxEu4dbTJ68pCzsm?=
 =?us-ascii?Q?sXcLhzzClTEW7uzxyQQQRQ9UeI6X0IZ+/rDOJhKp9OSx2DufdIW7jPT+ERai?=
 =?us-ascii?Q?cwR3Uqgh8rykbO0GpIXeqmDVcqPYP/N0uNFCQsgGFu2lop4kwfhhZIVEnLT4?=
 =?us-ascii?Q?Ri0qFi4/D8wk/qcd1Nzwt8Coh75tuwWmGNEViX1DFRqJ/Gn5zoAgnyA0FfqC?=
 =?us-ascii?Q?3rGU8WtZ9Ac43cyygghizQr1oErLgcv2B32vSNe1rkJuSWXBLBUaQHYBX2xx?=
 =?us-ascii?Q?zJjwtUNTWuuu+4ArE0FM772UJv81b8IgtzYQaaf5s9E5LEuZo29BlnTH3TgB?=
 =?us-ascii?Q?FXVY081OLSMeoCJ7AkYrCl5SC7AqCyfWL8w9SUbx/m74IKqELqVdh/NF9K8D?=
 =?us-ascii?Q?lJtQo+0TRGa0jc0kQ0p9cWdekxZG5IRptxegwtDFbJ+0RMQv0alMgBABSppt?=
 =?us-ascii?Q?Yc8mw9bRuyh5D6mUxdT7+T5ebVHxt6VsUp+cGzNRwgH916fNEdGgz0yEpnAi?=
 =?us-ascii?Q?rY9ZiH+1r1beas8sI+gSlOdQyOFmU6SrBBNeo6sqFlWoU/jAvdLVGBN5X31S?=
 =?us-ascii?Q?dFYZUHdtSylVno3/SCgPGRKbifjYrbWn//yVY6Gi6G2qHNeC/2EwZm5AkYKW?=
 =?us-ascii?Q?O1tns18SeXYFAVO0jbf65i/DPm4+SgiVRSPJPWjzNokUWVum+1uzNBLjOxjd?=
 =?us-ascii?Q?1g2m0gE/K8l33iAuCtNib1GwBhZoK4dGUeZ5GGOjGgH9TjBDRr+x4rB+YcyA?=
 =?us-ascii?Q?6K0Lmk+H+L8MtzDTgfEXWOTLqacP4/cga8merj2h1C2jrjUxzdODfQYeP/wf?=
 =?us-ascii?Q?ZcBt5KY7ycm5LWqZroMCl5ldKkbPDhlKpaHDscGm4fx0fd9WR0Wi8S9fQxLb?=
 =?us-ascii?Q?uakIk5pPShmyOgJ6AyA+NvR0fimGUWyiOVIPIPdj/KtESWIZkn1Jx2zoFzLe?=
 =?us-ascii?Q?abNBoBjnZRp793RtNk/FDh137V7wVvMZHHJpAoUshcqzWBJl2Ugfx7VkzfUp?=
 =?us-ascii?Q?vIjkD1ZbLpu/ufFaErdEdOHq1vrS6tUftt2szcGLCD+W99QTlhEOs8K9XMSM?=
 =?us-ascii?Q?14wyJYzWliQZWsLM50vBLGOCRRO6uSo6xa/Wyk/u9vl7tr7VpGHZ2H+zb2WF?=
 =?us-ascii?Q?JTaJ8VejyQmQu83bnk5NisRIV/8RJ0adqSpX96GbAGxlrtLXM8xbBnKTdtm3?=
 =?us-ascii?Q?Z+bFl4ncloJm3auKw2c5ycRxnYZqS6GAhIWvPLtc4/5nNokfjPnRApK3KlhP?=
 =?us-ascii?Q?oESTFkM+V2Ze366Sz4sHUUA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(19092799006)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?g4QBIl8u+8tg9c4enZ703TVDbvaoRuJgPZa8KfEd5uSfDHUPPFEaJzVunZl1?=
 =?us-ascii?Q?gBZFwBksD5CD8Q9tLsTzpvIXg3bK5zuQypQ8enZwL/Dy+0tVee0sugbxnvzG?=
 =?us-ascii?Q?Nz/4ogGuqlKySwYcYkGe92S08dRjlib6mx75OehT4EeW1sZ/pSwLEOQsg4AV?=
 =?us-ascii?Q?1Ra2AdqZoQGMCiKJ6R0g6hOC6TwhvHl4OZhr0KcPP+QIECVv4aJxiFvhNun2?=
 =?us-ascii?Q?KtWtxVTjix4Zo4lLClmXLRTO4oIg4N/Aj9NeYwAVLF33YlFVQivTU2PcscX7?=
 =?us-ascii?Q?WiNLM98Sx7J5AScji4GmiFsQ+mOqmAtgAAXnleSpYby1HaHENHd+zVMTy1wm?=
 =?us-ascii?Q?Z5ISS17Sn285KPSDiECG0T4aS/2/v2bIEhFgrK+osOpZTi1K2UvJj7AVA6DS?=
 =?us-ascii?Q?x2dKokk7UISU8S/kMc5BsNQlv1WQuor4LQqpaUbisq/J1OXlmISM9kE9gkR8?=
 =?us-ascii?Q?6AkOVLuQ8xcRrv0b7wUqdeuo4p72zfqqaPCLOXN9GJSVOhZmVYf3WAEwCoKw?=
 =?us-ascii?Q?T5I7b5uH/uS01lU4DmOnGtRoSPS2ZgCkIh+EysOTdZQK7JMmfmRSrenPhmkr?=
 =?us-ascii?Q?4jrCVtX1jOZU5lhkoldYQXJ7WwnY+J6WNBetHxAgDQNRlxoVRQMgBy+b5Ze5?=
 =?us-ascii?Q?bgm4GEAOvFzN0L1vK9OdwPesouNBhnwEuzhOJK6QGQ8rPqs3n8Ts5m/wYvfX?=
 =?us-ascii?Q?kDAuk3AJg2RLspqwC8BraLpdkgIfXXxHKoqRlGL4oO6HWriH+CP69bz8gHBh?=
 =?us-ascii?Q?O+VZsY2xMnr1gk/XLXwAuPNHCwWcJvq92YM8v/SqXItotkfuP2/zfsqjto/W?=
 =?us-ascii?Q?crdz9x+UAFk/uNL1ig+qRFCtFNXlZM4giNM7ndtIrDiRIVzhwAqOJUl/kdup?=
 =?us-ascii?Q?8q6NTHzLCNDkvahwCicXvnQ94+BroWHhCFA5tcrunRVzCikrEGzyYtwO6gDm?=
 =?us-ascii?Q?shkwFX4mHhzvUluWL8eC+c+75LUojs7rIAZL56vk8J95bi11IcnqMxGw8G88?=
 =?us-ascii?Q?t3CQaR/5TVgVESVY48eKTZ32IbqnUCsS1zb77F3MYycb79bq/crAahORI358?=
 =?us-ascii?Q?71EnfTP3ht68jlSby28ldqIKH2CMHoCuZDe7PsrO83zOUuO1ILvXYZY6AnRk?=
 =?us-ascii?Q?UxzgGok3cNkdEZZsgzYLguDVnEybvvhTWloDXStI7ev5EJqgCJxZTKyQo/Yf?=
 =?us-ascii?Q?oOOU68JoglJTBr9r0oooWLl11yBmjuZBEOFfGwisqENBMcooxu2ZeRn3xrjm?=
 =?us-ascii?Q?2IhoS69TJS3BPOnfbkslCCh7zG6XuECer+UbZmqgf4X0GTKQyVtgnW0gPpva?=
 =?us-ascii?Q?rMfQgqEu09yJJC2PFtujA7yzHBG3mZQA3wsvcmn/mmNnqZCoEHP6FdVch7vC?=
 =?us-ascii?Q?UzqKWYm24coHiDcI+xdj0eYPYLmRymRGVcn30ddgOyjf3YJpsA10EI64aXMJ?=
 =?us-ascii?Q?a/XLa0jkusET6YIPhrIi36/I+h5eCEuti4eRORzGgpokmh6fnPVN/GBN8qVX?=
 =?us-ascii?Q?XTxU61KeuVxyBNad7oH7nLEnCWBmY6pBFCOxArV0M3qa15A5v3+NPwAT0X2G?=
 =?us-ascii?Q?dy+SMS4qeuWyaRkiGniyx2AtxeD61wCmXEi6W8VbCT9wYygpH6YxP49FhKmQ?=
 =?us-ascii?Q?IMe2dLe1eFwY6NLyVhYC5u5Idy+svdIMaWz8BKbj1wBhXyoY/AQMTOBPxhnv?=
 =?us-ascii?Q?yncsysf2RqNFLmB01JrbmTuFvwxzWR3zZLsZ2sjus0K/ubPkDFNv0FVfDL9B?=
 =?us-ascii?Q?l5oE+5HpMg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9dd2295-6d25-48a7-29e8-08de554e8a62
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 22:28:15.2064
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RiTIo+LLktj9+TtMyQRZyafspzVRO+mYJSbEyOPHWuBarxFsEAZ5KjbcWcVwEPjsskDhB568uuTRjNaOmkV/7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10344

On Fri, Jan 16, 2026 at 05:05:53PM +0530, Mayank Mahajan wrote:
> Add support for the P3T1035 & P3T2030 temperature sensor. While mostly
> compatible with the TMP108, P3T1035 uses an 8-bit configuration register
> instead of the 16-bit layout used by TMP108. Updated driver to handle
> this difference during configuration read/write.
>
> Signed-off-by: Mayank Mahajan <mayankmahajan.x@nxp.com>
> ---
> V1 -> V2:
> - Disabled hysteresis in is_visible function for P3T1035.
> - Added tables for conversion rate similar to the LM75 driver.
> - Implemented different bus access depending on the chip being used.
>    - Removed regmap for 8 bits; now we are using one regmap as before.
>    - Added read and write functions for i2c and i3c for use with regmap.
>    - Mapped the 8-bit configuration register to a 16 bit value for P3T1035.
> V2 -> V3:
> - Remove changes not relevant to adding a new device in the driver.
> - Address warnings due to incorrect usage of casting operations.
> - Remove the usage of P3T2030 as it's functionally identical to P3T1035.
> V3 -> V4:
> - Add GENMASK for getting mask for conversion rates.
> - Add static arrays for containing sample times for different sensors.
> - Remove redundant code such as checking for NULL pointer in probe.
> - Improve readability by removing double negation.
> - Remove type cast where not required; make reg_buf & val_buf local.
>
>  drivers/hwmon/Kconfig  |   2 +-
>  drivers/hwmon/tmp108.c | 203 +++++++++++++++++++++++++++++++++--------
>  2 files changed, 164 insertions(+), 41 deletions(-)
>
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 157678b821fc..31969bddc812 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -2398,7 +2398,7 @@ config SENSORS_TMP108
>  	select REGMAP_I3C if I3C
>  	help
>  	  If you say yes here you get support for Texas Instruments TMP108
> -	  sensor chips and NXP P3T1085.
> +	  sensor chips, NXP temperature sensors P3T1035, P3T1085 and P3T2030.
>
>  	  This driver can also be built as a module. If so, the module
>  	  will be called tmp108.
> diff --git a/drivers/hwmon/tmp108.c b/drivers/hwmon/tmp108.c
> index 60a237cbedbc..d308e2aed18a 100644
> --- a/drivers/hwmon/tmp108.c
> +++ b/drivers/hwmon/tmp108.c
> @@ -17,9 +17,16 @@
>  #include <linux/regmap.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/slab.h>
> +#include <linux/util_macros.h>
>
>  #define	DRIVER_NAME "tmp108"
>
> +enum tmp108_hw_id {
> +	P3T1035_ID,		/* For sensors p3t1035 and p3t2030 */
> +	P3T1085_ID,
> +	TMP108_ID,
> +};
> +
>  #define	TMP108_REG_TEMP		0x00
>  #define	TMP108_REG_CONF		0x01
>  #define	TMP108_REG_TLOW		0x02
> @@ -61,6 +68,7 @@
>  #define TMP108_CONVRATE_1HZ		TMP108_CONF_CR0		/* Default */
>  #define TMP108_CONVRATE_4HZ		TMP108_CONF_CR1
>  #define TMP108_CONVRATE_16HZ		(TMP108_CONF_CR0|TMP108_CONF_CR1)
> +#define TMP108_CONVRATE_SHIFT		13
>
>  #define TMP108_CONF_HYSTERESIS_MASK	(TMP108_CONF_HYS0|TMP108_CONF_HYS1)
>  #define TMP108_HYSTERESIS_0C		0x0000
> @@ -70,12 +78,23 @@
>
>  #define TMP108_CONVERSION_TIME_MS	30	/* in milli-seconds */
>
> +#define TMP108_CONF_CR0_POS		13
> +#define TMP108_CONF_CR1_POS		14
> +#define TMP108_CONF_CONVRATE_FLD	GENMASK(TMP108_CONF_CR1_POS, TMP108_CONF_CR0_POS)
> +
>  struct tmp108 {
> -	struct regmap *regmap;
> -	u16 orig_config;
> -	unsigned long ready_time;
> +	struct regmap		*regmap;
> +	u16			orig_config;
> +	unsigned long		ready_time;

don't mix format change in this patch.
Now prefer orignial format, just one space between type and field.

> +	enum tmp108_hw_id	hw_id;
> +	bool			config_reg_16bits;
> +	ushort			*sample_times;
> +	size_t			n_sample_times;
>  };
>
> +ushort p3t1035_sample_times[] = {4000, 1000, 250, 125};
> +ushort tmp108_sample_times[] = {4000, 1000, 250, 63};
> +
>  /* convert 12-bit TMP108 register value to milliCelsius */
>  static inline int tmp108_temp_reg_to_mC(s16 val)
>  {
> @@ -101,21 +120,7 @@ static int tmp108_read(struct device *dev, enum hwmon_sensor_types type,
>  					  &regval);
>  			if (err < 0)
>  				return err;
> -			switch (regval & TMP108_CONF_CONVRATE_MASK) {
> -			case TMP108_CONVRATE_0P25HZ:
> -			default:
> -				*temp = 4000;
> -				break;
> -			case TMP108_CONVRATE_1HZ:
> -				*temp = 1000;
> -				break;
> -			case TMP108_CONVRATE_4HZ:
> -				*temp = 250;
> -				break;
> -			case TMP108_CONVRATE_16HZ:
> -				*temp = 63;
> -				break;
> -			}
> +			*temp = tmp108->sample_times[FIELD_GET(TMP108_CONF_CONVRATE_FLD, regval)];

This code optimation need seperate patch.

>  			return 0;
>  		}
>  		return -EOPNOTSUPP;
> @@ -192,22 +197,17 @@ static int tmp108_write(struct device *dev, enum hwmon_sensor_types type,
>  {
>  	struct tmp108 *tmp108 = dev_get_drvdata(dev);
>  	u32 regval, mask;
> +	u8 index;
>  	int err;
>
>  	if (type == hwmon_chip) {
>  		if (attr == hwmon_chip_update_interval) {
> -			if (temp < 156)
> -				mask = TMP108_CONVRATE_16HZ;
> -			else if (temp < 625)
> -				mask = TMP108_CONVRATE_4HZ;
> -			else if (temp < 2500)
> -				mask = TMP108_CONVRATE_1HZ;
> -			else
> -				mask = TMP108_CONVRATE_0P25HZ;
> +			index = find_closest_descending(temp, tmp108->sample_times,
> +							tmp108->n_sample_times);

Need seperate patch for the code cleanup.

>  			return regmap_update_bits(tmp108->regmap,
>  						  TMP108_REG_CONF,
>  						  TMP108_CONF_CONVRATE_MASK,
> -						  mask);
> +						  FIELD_PREP(TMP108_CONF_CONVRATE_FLD, index));
>  		}
>  		return -EOPNOTSUPP;
>  	}
> @@ -251,6 +251,8 @@ static int tmp108_write(struct device *dev, enum hwmon_sensor_types type,
>  static umode_t tmp108_is_visible(const void *data, enum hwmon_sensor_types type,
>  				 u32 attr, int channel)
>  {
> +	const struct tmp108 *tmp108 = data;
> +
>  	if (type == hwmon_chip && attr == hwmon_chip_update_interval)
>  		return 0644;
>
> @@ -264,8 +266,11 @@ static umode_t tmp108_is_visible(const void *data, enum hwmon_sensor_types type,
>  		return 0444;
>  	case hwmon_temp_min:
>  	case hwmon_temp_max:
> +		return 0644;
>  	case hwmon_temp_min_hyst:
>  	case hwmon_temp_max_hyst:
> +		if (tmp108->hw_id == P3T1035_ID)
> +			return 0;
>  		return 0644;
>  	default:
>  		return 0;
> @@ -311,6 +316,106 @@ static bool tmp108_is_volatile_reg(struct device *dev, unsigned int reg)
>  	return reg == TMP108_REG_TEMP || reg == TMP108_REG_CONF;
>  }
>
> +static int tmp108_i2c_reg_read(void *context, unsigned int reg, unsigned int *val)
> +{
> +	struct i2c_client *client = context;
> +	struct tmp108 *tmp108 = i2c_get_clientdata(client);
> +	int ret;
> +
> +	if (reg == TMP108_REG_CONF && !tmp108->config_reg_16bits) {
> +		ret = i2c_smbus_read_byte_data(client, TMP108_REG_CONF);
> +		if (ret < 0)
> +			return ret;
> +		*val = ret << 8;
> +		return 0;
> +	}
> +
> +	ret = i2c_smbus_read_word_swapped(client, reg);
> +	if (ret < 0)
> +		return ret;
> +	*val = ret;
> +	return 0;
> +}
> +
> +static int tmp108_i2c_reg_write(void *context, unsigned int reg, unsigned int val)
> +{
> +	struct i2c_client *client = context;
> +	struct tmp108 *tmp108 = i2c_get_clientdata(client);
> +
> +	if (reg == TMP108_REG_CONF && !tmp108->config_reg_16bits)
> +		return i2c_smbus_write_byte_data(client, reg, val >> 8);
> +	return i2c_smbus_write_word_swapped(client, reg, val);
> +}
> +
> +static const struct regmap_bus tmp108_i2c_regmap_bus = {
> +	.reg_read = tmp108_i2c_reg_read,
> +	.reg_write = tmp108_i2c_reg_write,
> +};
> +
> +static int tmp108_i3c_reg_read(void *context, unsigned int reg, unsigned int *val)
> +{
> +	struct i3c_device *i3cdev = context;
> +	struct tmp108 *tmp108 = i3cdev_get_drvdata(i3cdev);
> +	u8 reg_buf[1], val_buf[2];
> +	struct i3c_xfer xfers[] = {
> +		{
> +			.rnw = false,
> +			.len = 1,
> +			.data.out = reg_buf,
> +		},
> +		{
> +			.rnw = true,
> +			.len = 2,
> +			.data.in = val_buf,
> +		},
> +	};
> +	int ret;
> +
> +	reg_buf[0] = reg;
> +
> +	if (reg == TMP108_REG_CONF && !tmp108->config_reg_16bits)
> +		xfers[1].len--;
> +
> +	ret = i3c_device_do_xfers(i3cdev, xfers, 2, I3C_SDR);
> +	if (ret < 0)
> +		return ret;
> +
> +	*val = val_buf[0] << 8;
> +	if (reg != TMP108_REG_CONF || tmp108->config_reg_16bits)
> +		*val |= val_buf[1];
> +
> +	return 0;
> +}
> +
> +static int tmp108_i3c_reg_write(void *context, unsigned int reg, unsigned int val)
> +{
> +	struct i3c_device *i3cdev = context;
> +	struct tmp108 *tmp108 = i3cdev_get_drvdata(i3cdev);
> +	u8 val_buf[3];
> +	struct i3c_xfer xfers[] = {
> +		{
> +			.rnw = false,
> +			.len = 3,
> +			.data.out = val_buf,
> +		},
> +	};
> +
> +	val_buf[0] = reg;
> +	val_buf[1] = (val >> 8) & 0xff;
> +
> +	if (reg == TMP108_REG_CONF && !tmp108->config_reg_16bits)
> +		xfers[0].len--;
> +	else
> +		val_buf[2] = val & 0xff;
> +
> +	return i3c_device_do_xfers(i3cdev, xfers, 1, I3C_SDR);
> +}
> +
> +static const struct regmap_bus tmp108_i3c_regmap_bus = {
> +	.reg_read = tmp108_i3c_reg_read,
> +	.reg_write = tmp108_i3c_reg_write,
> +};
> +
>  static const struct regmap_config tmp108_regmap_config = {
>  	.reg_bits = 8,
>  	.val_bits = 16,
> @@ -323,7 +428,8 @@ static const struct regmap_config tmp108_regmap_config = {
>  	.use_single_write = true,
>  };
>
> -static int tmp108_common_probe(struct device *dev, struct regmap *regmap, char *name)
> +static int tmp108_common_probe(struct device *dev, struct regmap *regmap, char *name,
> +			       enum tmp108_hw_id hw_id)
>  {
>  	struct device *hwmon_dev;
>  	struct tmp108 *tmp108;
> @@ -340,6 +446,15 @@ static int tmp108_common_probe(struct device *dev, struct regmap *regmap, char *
>
>  	dev_set_drvdata(dev, tmp108);
>  	tmp108->regmap = regmap;
> +	tmp108->hw_id = hw_id;
> +	tmp108->config_reg_16bits = (hw_id == P3T1035_ID) ? false : true;
> +	if (hw_id == P3T1035_ID) {
> +		tmp108->sample_times = p3t1035_sample_times;
> +		tmp108->n_sample_times = ARRAY_SIZE(p3t1035_sample_times);
> +	} else {
> +		tmp108->sample_times = tmp108_sample_times;
> +		tmp108->n_sample_times = ARRAY_SIZE(tmp108_sample_times);
> +	}
>
>  	err = regmap_read(tmp108->regmap, TMP108_REG_CONF, &config);
>  	if (err < 0) {
> @@ -351,7 +466,6 @@ static int tmp108_common_probe(struct device *dev, struct regmap *regmap, char *
>  	/* Only continuous mode is supported. */
>  	config &= ~TMP108_CONF_MODE_MASK;
>  	config |= TMP108_MODE_CONTINUOUS;
> -
>  	/* Only comparator mode is supported. */
>  	config &= ~TMP108_CONF_TM;
>
> @@ -384,17 +498,20 @@ static int tmp108_probe(struct i2c_client *client)
>  {
>  	struct device *dev = &client->dev;
>  	struct regmap *regmap;
> +	enum tmp108_hw_id hw_id;
>
>  	if (!i2c_check_functionality(client->adapter,
> -				     I2C_FUNC_SMBUS_WORD_DATA))
> +				     I2C_FUNC_SMBUS_BYTE_DATA | I2C_FUNC_SMBUS_WORD_DATA))
>  		return dev_err_probe(dev, -ENODEV,
>  				     "adapter doesn't support SMBus word transactions\n");
>
> -	regmap = devm_regmap_init_i2c(client, &tmp108_regmap_config);
> +	regmap = devm_regmap_init(dev, &tmp108_i2c_regmap_bus, client, &tmp108_regmap_config);
>  	if (IS_ERR(regmap))
>  		return dev_err_probe(dev, PTR_ERR(regmap), "regmap init failed");
>
> -	return tmp108_common_probe(dev, regmap, client->name);
> +	hw_id = (unsigned long)i2c_get_match_data(client);
> +
> +	return tmp108_common_probe(dev, regmap, client->name, hw_id);
>  }
>
>  static int tmp108_suspend(struct device *dev)
> @@ -420,15 +537,17 @@ static int tmp108_resume(struct device *dev)
>  static DEFINE_SIMPLE_DEV_PM_OPS(tmp108_dev_pm_ops, tmp108_suspend, tmp108_resume);
>
>  static const struct i2c_device_id tmp108_i2c_ids[] = {
> -	{ "p3t1085" },
> -	{ "tmp108" },
> -	{ }
> +	{ "p3t1035", P3T1035_ID },
> +	{ "p3t1085", P3T1085_ID },
> +	{ "tmp108", TMP108_ID },
> +	{}
>  };
>  MODULE_DEVICE_TABLE(i2c, tmp108_i2c_ids);
>
>  static const struct of_device_id tmp108_of_ids[] = {
> -	{ .compatible = "nxp,p3t1085", },
> -	{ .compatible = "ti,tmp108", },
> +	{ .compatible = "nxp,p3t1035", .data = (void *)(uintptr_t)P3T1035_ID },
> +	{ .compatible = "nxp,p3t1085", .data = (void *)(uintptr_t)P3T1085_ID },
> +	{ .compatible = "ti,tmp108", .data = (void *)(uintptr_t)TMP108_ID },

Do not use device ID, define struct drvdata

	struct tmp108_drvdata
	{
		.samples = p3t1035_sample_times;
		.reg_width = 16,
		...
	}

Frank
>  	{}
>  };
>  MODULE_DEVICE_TABLE(of, tmp108_of_ids);
> @@ -444,7 +563,8 @@ static struct i2c_driver tmp108_driver = {
>  };
>
>  static const struct i3c_device_id p3t1085_i3c_ids[] = {
> -	I3C_DEVICE(0x011b, 0x1529, NULL),
> +	I3C_DEVICE(0x011B, 0x1529, (void *)P3T1085_ID),
> +	I3C_DEVICE(0x011B, 0x152B, (void *)P3T1035_ID),
>  	{}
>  };
>  MODULE_DEVICE_TABLE(i3c, p3t1085_i3c_ids);
> @@ -453,13 +573,16 @@ static int p3t1085_i3c_probe(struct i3c_device *i3cdev)
>  {
>  	struct device *dev = i3cdev_to_dev(i3cdev);
>  	struct regmap *regmap;
> +	const struct i3c_device_id *id;
>
> -	regmap = devm_regmap_init_i3c(i3cdev, &tmp108_regmap_config);
> +	regmap = devm_regmap_init(dev, &tmp108_i3c_regmap_bus, i3cdev, &tmp108_regmap_config);
>  	if (IS_ERR(regmap))
>  		return dev_err_probe(dev, PTR_ERR(regmap),
>  				     "Failed to register i3c regmap\n");
>
> -	return tmp108_common_probe(dev, regmap, "p3t1085_i3c");
> +	id = i3c_device_match_id(i3cdev, p3t1085_i3c_ids);
> +
> +	return tmp108_common_probe(dev, regmap, "p3t1085_i3c", (unsigned long)id->data);
>  }
>
>  static struct i3c_driver p3t1085_driver = {
> --
> 2.34.1
