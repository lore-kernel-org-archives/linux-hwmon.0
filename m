Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012047.outbound.protection.outlook.com [52.101.66.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C9C418C332;
	Fri, 10 Apr 2026 02:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775786658; cv=fail; b=RaEN6ND5zeYvIPvd38Yxp4bYyK4R7Y/x0HTVs5F0HX0z/nYYP3P8eKrbSAFJZlbaReIojYduK3+Ob0zr1xcajZtxR8vx5ZA3Bxb7x00ZLQjo/CnsMsvnCx72FkbZZU4KR6bsssMbdUWgBomuukEIcd/I1i/Ukl4jyb97WdQ0Z88=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775786658; c=relaxed/simple;
	bh=6rBqSO0auxFkjezG+soEGPVjs6E8XybjTbeW7/5+/Bs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=LvlXmRw+9w6aIVw+bmkQVnamiGbFse6j8XkJw3n7suF+S1qtzvDovNOHHTY9YA7vaLGYqeR+9+9aCca+EgzeQ9DHV+yIA01hcb+YddCiFe7OpGyMphsqqEHh2Z0Xo9rbMzhpk2EsYrCXEHiXM5WQpXfHMzCwMMLRu1Xr/ETXC4I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=egg3p+9T; arc=fail smtp.client-ip=52.101.66.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="egg3p+9T"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wjyW2Fu913MlibUb32IAH6FCrEzahaQmVOoGMOhTtWf9PuAexLv5ivDbn5ZYBLI3J/coMbozZ8BVZEkMu9Q9mEjIHhIyuh0Y9++pUWInKwrG5AN1cQjcabC78Bm8VMSqLqy1RO7GnmuWbPGlch4FT5uHML8AUIBHjWUZMF/zIxMdElvnQLIOxwCpsbanS8q5WnscJBkw0UZWu3M+Ezv9dk1l/NScaeEYdbrjlmGxSVA1uy/pjronRfllv5ilnQsd6mk5YDGUWxrukrLMMxACPN1bLNsnf70aXAmmrYbNCv8Op0vweyVgzOqhm72GxoW4QpKv3xBvhhgBrBQr7ieB5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iFT6uK28LmXHEwFrFqMz3PUgUT1wu7eJZk18WcIqOzI=;
 b=eFyySbFi/mPBoQbsNROqg1IcEea02z3r+5b1XRrreJY+MCAr9vOnuzJxu4oTH9S1sOVPqNC+4boETTmbawXsib77MFZl6SmNoJleVe/rhT4DnQ1HRKFzFS164AsbvdVWOTklhu/2ZCW8MD5nllAjB3Ug0QKhP/TjfBTApmPRyTch7d/odmDEaF/OmjKA+I6mPqrUqbnAF/ZJUDhBNpG0UN1wh4DzKvKpryn7tqHUXH97coqQi0CsSjYNyTl+TIFRQJ0v3xr8/Dc/Uj28OcQ50FpclKjYiVCtDjNtt1KUPJnnzZcVzZ6XGwSUXLNh0L4dcm+mIEwxz/4DRXC6XcsPlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iFT6uK28LmXHEwFrFqMz3PUgUT1wu7eJZk18WcIqOzI=;
 b=egg3p+9T5ELK/XogUcU2avAyo7NV2CGaZ5bmMoetRH9AVilOlHUYEggA1PqSVv24Ne6tq+pJz0b9rHlU9na4P+FnZvlQlO66AHzPoWspH+hu0YY5BbgbIIVFbgszoXNAdfVpzvYmWDFaqlPhME+ybucPO0ZbQGUF9WuIyJrMj5Qtt9+32r6cRwCkg/kRngN/oXjlm454uxE0xo9u4dMkHgZe+bfxWyd9sdD46hVpwER7Rmz4kjFvikKzOOzQZUjvvKM8svzMq9uCm/9amzYrAKCvL9qhWleUSGSrYOrOhlQ7ROIkoulLexLkPYfIwSbDch0z8RCWnWHl9m46n7k6ug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AMDPR04MB11620.eurprd04.prod.outlook.com (2603:10a6:20b:717::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Fri, 10 Apr
 2026 02:04:14 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9769.018; Fri, 10 Apr 2026
 02:04:14 +0000
Date: Thu, 9 Apr 2026 22:04:05 -0400
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
Subject: Re: [PATCH v2 02/13] ACPICA: Read LVR from the I2C resource
 descriptor
Message-ID: <adhalQxfbMsL3V0T@lizhi-Precision-Tower-5810>
References: <20260409105747.48158-1-akhilrajeev@nvidia.com>
 <20260409105747.48158-3-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260409105747.48158-3-akhilrajeev@nvidia.com>
X-ClientProxiedBy: PH8PR22CA0015.namprd22.prod.outlook.com
 (2603:10b6:510:2d1::23) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AMDPR04MB11620:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b75b496-627c-495b-b0e1-08de96a576e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|366016|376014|7416014|52116014|18002099003|56012099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	9aKl884Jz8geloC3oEZRL5TY+/+ppMmUVzDoFKD84/3XLCoFpTb8sM5QLffXTMrHC6YHNDXMk8VOf4fmu7vJ3y1tHtOpyxdztLUrpl313EqgrVClPVLY93oFg4h3WiwlqOKkXIY8G+c3UEu32lMAJtXrFMF8QJtIX7zKrprkxCorVPOkF9CaOlWEycLg0ordqB6qw/FwdwXvcYAbincYlj8r8jOAITKo7C7XomQ1AbWT3QhXs+hVO5TtTYaZ5pGOld1JtUBWk1Dg4Ydh6oetLl8cfJfZrAqViC1veBbzp8Pl2EWee5UFAllVf6vqza2yf7Y0kFXnuP59o6fUp03aQArM5muLmTDHA7bJA1qKZLdWoKRsmJNb+ACV6Hw7pHmsheqUnIrOptC/lerOdDbkhKUB0SEyiezCsXqOPna+/Zc8/qhNYqs+1ohDMrMQ1yAn3JVUT5XsRRciHh6Uq8jY6VuoIuepWFBVOBk/CwdgoqVwYWHVxEm8g+ldKIcNSnlhm3V2mX4b9ykt/3hePo/k3AYXuLPpQlEoEXa0/CjD2lPlUvJB+HtFfo8UBl4goGgcr3F9tqNpW2eYKYJWvRrUZHmEZuSjf245x58wYMi1m3AGfe5jFdZPQrlPTslWZJS/znsTJ2mvtodR73n9MUnly4VPQqoRa7iplBT7U4eGmwS7tvyOzgEYYgJvuJ/fqLVXwSsHLLUMY6aMlhtPcyYSlsoSYorN592n7KXRP+KHDxC1aoa42qCnNOeuj7pZpYqPcOiMloB5o+7T4Cq+sWaPC1e3D9h0fXci/P/Fkva5zP0eYDh+PG1eV7+sQdqW49vW
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(376014)(7416014)(52116014)(18002099003)(56012099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Do73MY1z9CaBSKidCGXHF3q4kf41WCQzSf35OwDT37sRnATjHJCTxvKC+xVA?=
 =?us-ascii?Q?JLofDS1h4MI0IsPUvQzAkvrvHvbu1qtmrSeSpoisiZs5YtwrfIwfzcUZdiJH?=
 =?us-ascii?Q?pPDwMpuIFeXnh4r4XDtiU6QBCyzx9MhW39AO9L/X1+ZjoyfHMDsqym8frWU9?=
 =?us-ascii?Q?XNWHP0afIB1ni66nIF/9qx2rVNCPZHXIkpDPJ11te5uYne9BckWD/WyfpzXt?=
 =?us-ascii?Q?e2lWRrdFUVDzqBfwIwVnamGPObkCwRSCDiZxqRtLqygGH5n8yN4NETys/dVC?=
 =?us-ascii?Q?w8kGh/oNtQYy6wwEJO/a+OaqkyB9QkT1oY8l3HqWOrMoLtxgRdFVyBtumui0?=
 =?us-ascii?Q?sxKoPnotTFwgjJxRgO6zxLV3/vBP5t7Gj768Vl7DeTfCQr3heNHDFFPI/m3L?=
 =?us-ascii?Q?e9XB7+FGFAXICApUkxQ0PhD8wojAi/R+ei/cmyJsdAkZeVPptEIi6Llv8wVR?=
 =?us-ascii?Q?zfQeCvyLAUlUjerABg/6qTSHAwLj6VZcx1S+EZWpXjTolTTh/25qjaoCSkeA?=
 =?us-ascii?Q?jT96Rup4dIarBmz+hq6yTAM3gfLuRXI0AiCivTeCOgZ3XUEbf4mzbux1sP5Y?=
 =?us-ascii?Q?qkVwk1vg0EDRk5lRwuSIO3e8EdMOUWWCEZ5Iq2QkbLB63ZkcW1GSxs8nst6e?=
 =?us-ascii?Q?UzNJBDMewCDtkZE3YOn4QEhlLyGaIY+jXSsS0TBiabRv+X1bt0ZiBBMo+xe+?=
 =?us-ascii?Q?yBGeSzrZTuBlFH2wudAJ5UtPVHd+SNvKYzqlohO5aKEF5fadtxDhZFW0VJwn?=
 =?us-ascii?Q?tEgJIt9aEPufEViLNoTVCNRxqH/7SYEckjm7w7p9rQdnB1WNVFyh5mlEyUbD?=
 =?us-ascii?Q?xYKh1j0jnFOHJlfJZifwfPIvkSQZIfWT95DrWLPCJ1szu6l7/s8BfjI5Kst7?=
 =?us-ascii?Q?BCi3grQCVymEtTgDHyb0nc6jCprvdVk7G5YlDjrINiIn+B7c6N6ItOyXT2gS?=
 =?us-ascii?Q?Zc3SSPsheObVB8kXd8EbUh6EEQf1O+tATNQ7WVtRYAcum7lkYuB9K1lbWufa?=
 =?us-ascii?Q?0ljOXttu12AEDzihrLc5cVuZ4EMc4iuTYKnEzS5PRNXji0Q3SBuFhuAS0o+O?=
 =?us-ascii?Q?y3KUYf/7bJP1KZldzLrDqzpr53NIVUnCTmJpdj/M+Gu3liQ2LYPtQ3LoQqmS?=
 =?us-ascii?Q?S6guw3iuu23FhkR22G+tMzL14JkIrZL4Jpdze/PBOjaQ2pf1wI4zMLnH0C7f?=
 =?us-ascii?Q?F0OAxtQMh6BKwPse6xMrWsENtlWoNFT0MlF8wXd3EwHS4dA2oQt6rzoJKX6h?=
 =?us-ascii?Q?YNkfFuwO9nVHqxDEbg9si9buvsqcs2XbYFI9GwiDJWmunlgQRdoof8fXGrBb?=
 =?us-ascii?Q?iqnb2jGOgDD4MkIs5fYz7E/0dkn6GS3M4kzAFpggaJTPtW2l9EewvwiK25MX?=
 =?us-ascii?Q?BVnwvEMZLGaCnVZ3nVDwXSeEk/e1AmdHHvXUdxZ2ILJ+Zjsk5rWod0azTTtU?=
 =?us-ascii?Q?3TQw3H72ARvgVudL8K73/fMIE0hKqm5VmfIt03U7bYxDVImoMRccjadwiB63?=
 =?us-ascii?Q?xdvXNOlhEU5ARycbNHJ8ajTDZ/Bkt5vM6/vbFz4T6I/ijk/EWYB7XZGiCSNI?=
 =?us-ascii?Q?XGDHej5gzYQeaCp8WWwHqk+D1UyPXt8ELf9KfwyYrsEk8zWSo5oIFWcxtkTe?=
 =?us-ascii?Q?tSKGmt8XWM5LNlUCl0X+UoxY48UhH0vf/c9AlJDAYGu4MvTSdz4qTr+FtGAy?=
 =?us-ascii?Q?nhNxbIW2hgwxx73ypjYkn+elI1thNWWT8znClQq9d5EJfE0M?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b75b496-627c-495b-b0e1-08de96a576e6
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2026 02:04:14.3494
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dlCmHBjZeWuvGjFbD5IcSgd4aFF6goN5uL1EbC82HH6QR7K+Z7xW3dTaVf68PdaTgcGZjg6GZnY2vO3ocKbgHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMDPR04MB11620

On Thu, Apr 09, 2026 at 04:27:32PM +0530, Akhil R wrote:
> ACPI 6.3 specifies byte 8 of I2C Serial Bus Connection descriptor to be
> used for Legacy Virtual Register (LVR) data as specified in the MIPI
> I3C Specification for an I2C device connected to an I3C Host Controller.
> LVR will be read by I3C host controller drivers and it provides details
> about the specific speed and 50ns spike filter capabilities of I2C
> devices.
>
> Update the rsconvert_info to include this field. For I2C devices on an
> I2C bus, this field is Reserved and unused.
>
> This commit is the result of squashing the following:
> ACPICA commit 70082dc8fc847673ac7f4bbb1541776730f0b63e
> ACPICA commit e62e74baf7e08cf059ec82049aeccd565b24d661
> ACPICA commit c404118235108012cad396c834b5aabe2dd1b51a
> ACPICA commit 7650d4a889ea7907060bfce89f4f780ce83e7b28
> ACPICA commit 014fa9f2dbcc6b1bd42a4a4a6f6705d9cf7d460b

These commit number is not existed at linus official tree. Please remove it.

Frank
>
> Link: https://github.com/acpica/acpica/commit/70082dc8
> Link: https://github.com/acpica/acpica/commit/b3c38dc9
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> ---
>  drivers/acpi/acpica/rsserial.c | 6 +++++-
>  include/acpi/acrestyp.h        | 1 +
>  2 files changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/acpi/acpica/rsserial.c b/drivers/acpi/acpica/rsserial.c
> index 279bfa27da94..c06e918ab889 100644
> --- a/drivers/acpi/acpica/rsserial.c
> +++ b/drivers/acpi/acpica/rsserial.c
> @@ -315,7 +315,7 @@ struct acpi_rsconvert_info acpi_rs_convert_csi2_serial_bus[14] = {
>   *
>   ******************************************************************************/
>
> -struct acpi_rsconvert_info acpi_rs_convert_i2c_serial_bus[17] = {
> +struct acpi_rsconvert_info acpi_rs_convert_i2c_serial_bus[18] = {
>  	{ACPI_RSC_INITGET, ACPI_RESOURCE_TYPE_SERIAL_BUS,
>  	 ACPI_RS_SIZE(struct acpi_resource_i2c_serialbus),
>  	 ACPI_RSC_TABLE_SIZE(acpi_rs_convert_i2c_serial_bus)},
> @@ -391,6 +391,10 @@ struct acpi_rsconvert_info acpi_rs_convert_i2c_serial_bus[17] = {
>  	 AML_OFFSET(i2c_serial_bus.type_specific_flags),
>  	 0},
>
> +	{ACPI_RSC_MOVE8, ACPI_RS_OFFSET(data.i2c_serial_bus.lvr),
> +	 AML_OFFSET(i2c_serial_bus.type_specific_flags) + 1,
> +	 1},
> +
>  	{ACPI_RSC_MOVE32, ACPI_RS_OFFSET(data.i2c_serial_bus.connection_speed),
>  	 AML_OFFSET(i2c_serial_bus.connection_speed),
>  	 1},
> diff --git a/include/acpi/acrestyp.h b/include/acpi/acrestyp.h
> index 842f932e2c2b..38a19b1d19ac 100644
> --- a/include/acpi/acrestyp.h
> +++ b/include/acpi/acrestyp.h
> @@ -423,6 +423,7 @@ struct acpi_resource_i2c_serialbus {
>  	ACPI_RESOURCE_SERIAL_COMMON u8 access_mode;
>  	u16 slave_address;
>  	u32 connection_speed;
> +	u8 lvr;
>  };
>
>  /* Values for access_mode field above */
> --
> 2.50.1
>
