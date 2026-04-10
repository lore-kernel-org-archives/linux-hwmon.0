Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013050.outbound.protection.outlook.com [52.101.83.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD78E1A6816;
	Fri, 10 Apr 2026 02:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775787456; cv=fail; b=JDu+0QduNmfBLkX/aFWVlO8zHsjvkK5Ym9qekF+b1JSMzAsTLs4+rMikJLqpQwSIAKzgKkS+FLCAr5Zi193Fcz3U3VuUu3fztM4Jo0WVNkJZOXe4RHUvByTcNH5kjjmHX9n1FAxTXeL40iokT479R7aiQEinMV3ARxi1bOcK/dM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775787456; c=relaxed/simple;
	bh=0BAeJzeAkjqc4aT7pcIPTfmACXtqdlkWrqnAli/wUYk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=EGBsCovytUPtiguI5oPfi5Uq+0wKp921VFsEZ3YnXKcIysaeq/M2PPyHhBfoP0o3KeBJ2MLdIzSuInvTMPGDYgRZwq31+jvaps9SOY+gI8psxnNZTVc4ark8l2nMMKTLCvqQN/IRFE8FfMjFB5RgQBM3/D+VGh7dCvn0Cum3Ol8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=NGh4QVUy; arc=fail smtp.client-ip=52.101.83.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="NGh4QVUy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Alxz6YhtjCO2ylDFTXQ1HcbYE44AEzab+pyDItGci/7XiBb48AHUmyTJAeuLCA26BshCVjfsljpT39Y8BhH5QQ8nkcNqqRt12K2ww9PBJcgvsHoPk7PO0ckunrtljBB3uZmwq/0JRxvMXhaP6+2Lrspu44bJeiU0YurxYvPSiqKfJDj+alipMUHFqm/le6boK9iD8ElHJAOT4OqWsz9HzsO18L80Ts0wdGfV3Iyzou+M/niV6CfkNwkhSyAIhxrN74+iv2SSNt+WLzVwP+7f4Oc6EIqpLf8+VJSUfZRsUBCf55FTu+AYEaivR9y+5Y4MuLN0pxr0a6lQcl9sWuJfCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5dlw6GSU31Nq/fFJ3rAaqn4dfVi4RKAqlkISLwrx7Eg=;
 b=h8qsvPTSAVGSZllj2GItH1KcOyJoqpLZMYd2S3TLa//s5i0gXtfPWx+bGwR0/+r1f3LbCDzg/F94ScbCicJhAS2n5LwXeDsZ8RyIUFIdQVdylEn72hDMk5h8pz7SV+jHwVq/pS+zRkJlIQwt/ctTtMr7pYL7iaYH2DIbBwf7cU4MLXhQxNtXXLCNd7xL+SYQFCGSrS6JcTRu8UVG1r0+4Mij2gHNyr0bwWNObjwiN+96A1O9CWEjC5+tUW0G3DK/Ld8dw6ntzTX6SHKIWUueTry9AePBgrCblLZjkiosC98kyB3GSq8fSV1Nijo/hawjo3HR9XHrt5Dm9X6mCRzLRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5dlw6GSU31Nq/fFJ3rAaqn4dfVi4RKAqlkISLwrx7Eg=;
 b=NGh4QVUy4t28jguKRFLRqfW+nc/B/FGQjwVgE4aveset5k5vygAFHjUO5J9koarriC3j9K/KTb/UXJ7140j1+NeS3Rm4+8cAA07FedVAQtoJZ27KqXMOXOJ0xBIZLtcoqHjvDySHfzI1+0JJwKgGv9YvYb+gnSisuHqtyRFN00yQ/6eQFg5umG3MbjgUuOjNiKlzV3VdQ2M7h6AGIPCUTOe1tiQNpPIqzaZytpcb+bhc03EaTaFep0JazHg/HUdAVZP1qLbAinqJu5OUdwPBmg7QLktiGEV6yiOIwGXgDna1B6QgStoVeMV+d9lX2NCGeb8BpIY2rVfnnxK2oNvkmQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by GV2PR04MB11144.eurprd04.prod.outlook.com (2603:10a6:150:27a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.42; Fri, 10 Apr
 2026 02:17:30 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9769.018; Fri, 10 Apr 2026
 02:17:30 +0000
Date: Thu, 9 Apr 2026 22:17:22 -0400
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
Subject: Re: [PATCH v2 04/13] i3c: master: Support ACPI enumeration of child
 devices
Message-ID: <adhdsn6u4RAIL9wC@lizhi-Precision-Tower-5810>
References: <20260409105747.48158-1-akhilrajeev@nvidia.com>
 <20260409105747.48158-5-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260409105747.48158-5-akhilrajeev@nvidia.com>
X-ClientProxiedBy: SA9P221CA0021.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:806:25::26) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|GV2PR04MB11144:EE_
X-MS-Office365-Filtering-Correlation-Id: 92d1c67d-dad4-46e5-0e09-08de96a7519a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|19092799006|366016|1800799024|38350700014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	CLc5mOgUlOWbmSqEaRxI4+W5olCaibUBB0iFMwd5NaKspVo6J1KJ/9/N60DLwGf+A/jEL7BzyI4kpvusN4G/oFarnHWJR4nw7+HpMsdyUV8/cNw9Tka34cDyytGa90aRTS6B8tVgt1YqOioJQq4UGbDIKgawiR1pz4HIkvmJWt7PT9pljwjT9LdZIOX7VH4pLZgj24gnupTdusJy0PCIEJEe1UJHrZchuK0hGWpSC/Dl6mB300PwgqbemDCE8kPZaiyiRCrw/jSRcGJL7FcM00iJN4MNOpxau6R7rmsU8EYfpyhAMYS3KGoorjB61UD2KivJTZ177yEtja6fMJCGtcMnu1kt+yFdouu3L6MJTbK1tJZ5SVCPhg6cDsFmg0jo4qBpWXTi7b6jGl5S/Kl3sfrWQi6vSmD+W7T/oXSiY/id7aEcYhUIwDYO4rg2Wwi+QM9GmQJvgVL6aH81lskRijQw03lfLHJkyJw/mRnAfzlvDmApJnVXaIRlJQ5jKVxCwlO7VMTWb8U8NA1K0zQZpAdjqh8cy2H8oyCN7J+aAIETop3sHtzGDw706cRSd0nOb509CXsRYZgRPg65BwEugUxM6vOKziqLECSws5tExucj9xuPCNORNF1gbWDujVQsovrxjL/E5ou5lOJjYZT6Cwv6es5H2RRQEhThJYtVtskJu3RKbtmcl4imoYGEBl/UY1hyB2dmm+zieSis26t6slY213k1rOfpK5enG7MTycckUjFzlM7pKY3jSv195mQB
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(19092799006)(366016)(1800799024)(38350700014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4kTXg/gx1MTIAQx6GDH9V4o+Z/cvU7pwF/tL31wQpFi3hM5eJ2ownVFi4irs?=
 =?us-ascii?Q?BAb73OFzO/TWnOehA1EghmDx2fsd5HTB8HystPdcqsZTYFvSerRGwKU73XAM?=
 =?us-ascii?Q?yNS7e3nqSMvAiUV8+ciEjERkkHmzHViTG1KOXXH4Kh/qPXddVS+2/EoS5mz3?=
 =?us-ascii?Q?8oEPAbuEI2kRmfkhYiex70XKscJh5/ip81UZKWdgWI+ICpCVISaCC0tzdWYX?=
 =?us-ascii?Q?on6RDWfuRtQ38ctCiXjgwxlwbUX57XK6YOp0FEBdvRaXhCAN6xOpDwHZKDBv?=
 =?us-ascii?Q?uxUB7J7Wlu283sd2xjQHM2rfU9JrhqyYQq4swFH2zTJCxv4uaEtBgEKXCstm?=
 =?us-ascii?Q?Uh/zAy/1bL2V/4zMxJ2j9SvEXNTSAVgsNDPIY2GDtub+SHkNAeOdirjTST1Z?=
 =?us-ascii?Q?p92vTMftFkdxP7NTGjIxFgj45MKI5ncjHDuds+iXhzfyaBO2gFll1vOizBPP?=
 =?us-ascii?Q?VEQN9baRV4zwQfRHHRtL0GWVqQ+5pIgZISI0+m5YcIB+FBtctRZvkVk+Glhm?=
 =?us-ascii?Q?va2qDFFgOJX69nHQHpa2Br4jPOKPeCsFCeHnQrM9TZbsfdJTv/uyvD7+qBXA?=
 =?us-ascii?Q?CF9SLtN9W7PRYTb+sJW5cunXRjW5DvCGL/6CbpwIsdUlhXuDHMozdvdEOp71?=
 =?us-ascii?Q?Dl8wNsv3sVS0mHtNSuhjH17Lv6PY7PU3qDa1tlEWKAu8ONgFov+QS4PQ9Irz?=
 =?us-ascii?Q?wjQ5erZJrhX9sdP88JuN7gyPLvq9v0oWGPPIUo1ACqJN+OI8QTnBkgR5TMl1?=
 =?us-ascii?Q?JCk5FApZQPZCpeDVQXbxU+aS2bJJqjJcNva9ZhLKB1bS5A87D+YeyT2vKpK8?=
 =?us-ascii?Q?70oAdzto1BrUf0mO69BnTY3qMpVPKYRwe1Xjl0CtnFVUa49kBTsDgIi+nYcj?=
 =?us-ascii?Q?5kMTKKheUXLA7asy6UewSaxHulX1FukO5HCyBPeRMvM7fTxmnj3CqlBJYsiS?=
 =?us-ascii?Q?lVq/9zw9Xm+HirY8VVm4zrn+Mgbl3JujMxJL1G2wGBIw2Kgg7Z2byrM9Wxrd?=
 =?us-ascii?Q?UYKGMzi7MZLy1t+IUUXtxxSQGf3ATdaOJLtruEz4Hsyi/nqNAbNoivpCPFTr?=
 =?us-ascii?Q?M5A78e6pzTbGnIphsTF/JWd/ZZy37MqEc44s4eroKMEFxsxHgOIsaCw0t9+h?=
 =?us-ascii?Q?0N4o6y6O0qwENjVOzWgcbbENqTog0X0iqJGRT8i/M6USw8/CE6s4yHIqOCpQ?=
 =?us-ascii?Q?yw7KvYx9sCebvNvdC2xBrIPInSAteUGACEv0az5NLKVMHHIoIEtJr/27WP9h?=
 =?us-ascii?Q?O94pynG1THr7OcZmgHmhRztM+KuV+r98qD9X/QDCtFpOBFcELNyLcuK223SG?=
 =?us-ascii?Q?uNFKQQIEhHDUlAhWonC7n0om0VaWFHScuKKNoapQXEYKz5SFkeSyTRAnNem8?=
 =?us-ascii?Q?f+bEwkESclzqGYCFaUDwPkMJaN9V5bAdJXsi2yzLU6SvKJN1RFN8fbiX383y?=
 =?us-ascii?Q?tNReUNNJONGRdBxuDkC8CiHbfCC3wFTsNlPSPasA9IgFPugwtVi5E4e0C1nR?=
 =?us-ascii?Q?Ikwb+XdbNgetXryPY8QL5TvbQaCVOPZnfeMpDWJC3vFwPytDA27nM09bQ9BN?=
 =?us-ascii?Q?Cg9uRG4zwv0qB6EdOfVSKwO6/XkF7BZ5K0bCXpKHDErn1dnu7VPUOSgBbcIt?=
 =?us-ascii?Q?kJjLtBkIxRiIU+S45WqdwQBuuaYEhThGgX1jDX59qEf0YyNGv6UbAD+hMgq9?=
 =?us-ascii?Q?5ynEL3G/Le3Ac+MJBM9JyBTYSQTfb8Xru3xD06xUzKGEPTENyXZzOA96fPQR?=
 =?us-ascii?Q?W/2zrxhKMQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92d1c67d-dad4-46e5-0e09-08de96a7519a
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2026 02:17:30.7298
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rU34+qOQTf+xGQQcPTXFNMBPWGEzWEf5e+/TnYjQhRAmLidVR7bfPnlcQSRzPd7oGqtSVIbatllpnfuCjVKZmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11144

On Thu, Apr 09, 2026 at 04:27:34PM +0530, Akhil R wrote:
> Although the existing subsystem allows host controllers to register
> through the ACPI table, it was not possible to describe I3C or I2C
> devices when using ACPI. This is because the driver relied on reg
> property to retrieve the PID, static address etc whereas ACPI uses
> _ADR or serial resources to describe such devices.
>
> Read _ADR and LVR from the ACPI resources and extract the data as per the
> ACPI specification for an I3C bus. Also read mipi-i3c-static-address as
> per the MIPI DISCO specifications [1] to get the static address to be
> used. Hence enable describing the I3C or I2C devices in the ACPI
> table, which is required if the device is using a static address or if it
> needs some specific properties to be attached to it.

Please wrap your commit message at 75 char.

>
> [1] https://www.mipi.org/mipi-disco-for-i3c-download
>
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> ---
>  drivers/i3c/master.c | 140 ++++++++++++++++++++++++++++++++++++++++---
>  1 file changed, 132 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 5e0e926f61f3..08d0fcabd6f1 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -5,6 +5,7 @@
>   * Author: Boris Brezillon <boris.brezillon@bootlin.com>
>   */
>
> +#include <linux/acpi.h>
>  #include <linux/atomic.h>
>  #include <linux/bug.h>
>  #include <linux/device.h>
> @@ -2403,6 +2404,53 @@ EXPORT_SYMBOL_GPL(i3c_master_add_i3c_dev_locked);
>
>  #define OF_I3C_REG1_IS_I2C_DEV			BIT(31)
>
> +#ifdef CONFIG_ACPI
...

> +#ifdef CONFIG_ACPI
> +static int i3c_master_add_acpi_dev(struct i3c_master_controller *master,
> +				   struct fwnode_handle *fwnode)


Can you move this and below function to previous #ifdef CONFIG_ACPI block.

Frank

