Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2065.outbound.protection.outlook.com [40.107.105.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC6C1885A0
	for <linux-hwmon@vger.kernel.org>; Wed,  4 Dec 2024 16:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733329245; cv=fail; b=b8ianIKtyXShRcFHE1Xquk8HDcb7+7VfwyJfn+B0L+Fi31ClfPXoBG4Fk6D89SXKap99H8Of8l/wMxv3GywfzWv6QTkDXUmC7oSCSoAmaPROcyo3nWrNaMvibzQhQ7uhvhhQONPCpJubX0FQp3YGC49Rw2xHpNC9SVsgERpQDGA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733329245; c=relaxed/simple;
	bh=+jH/LUutG6oGyADP/r9xNBsVR5uQ8zFkBzblER9s9+8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=uCKt/vV3J+rgbzT0Z6soboQDpJeVUIa34IBtcivO52fJlJJ/XsqBWHKt+Jqbdiduzb+bpUZvVUrVVT18A0Tno+sexw/AE69fYC84wrYJO1K7hNkQC/nR+Hnx0vwVwq5jhSEBZiXeStoHjT89qjRbVRXFr+oXd/l91sfM8+ax27k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=fkcIODrD; arc=fail smtp.client-ip=40.107.105.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="fkcIODrD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E8/W6fQgl8UOi4JzCRn+3CK3hTK1RPHgjfDwtO1+vGjO6CwEM+G0W7TspOpIStHkD3vdAr+b5HuVK82j5Zbmwy1deKCBkTWNArrEyAU+FaUxX4FdkL/UYClJ9nTxIdJSuljGJuW0LW968B8Pe6isPaPel/9rYdKzot2BzhJWHSUflXFHUj6SWuMP369zkO1HRGKIhTD9GzOWJLlApZdh/NTjIZ5M9rVmrM609QMrrSiYjZGVNtOoOL6iJcW2rsM5bmcaTnALy7QCrZGHCYO2C9NTJPTUBMa6a/yXCjMA0T69NNtv8vj4OrGGfzUHzvwG4bkXlvaTL8pFP3Lpg9vS+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SuyRIGKjX0pvxM3CwQYnzoVlLr6sBbzC9g7NgwIvSBM=;
 b=yblbFDVB8r6bYthp3wQD5LF3Z/oTT5H6/1uFvR1rEXkCTMHRH0Yv3C4g0ZkTkm5qVZhjeGDf1YayZYGZYD/IP/DyFNhMDRMSg7J2Q7IdGExHT38MYu3C9OSmN0yOqOYbk0m7ROljdVn9twryrCZjFxhmTxwFIjH5rZkmgD5IHkphyn4fO8kpfRO9L8zVOn5DmdGz/N7n5IAm30O+ik8dSmx4hIv5LWTCEqWrt8N5Qc1mrn2iLMdjIIHxsXFG50ufEa/8BkEjbQn7UhYMHNGhmYPYOToMTdecqpKxcS3LbtmJ9DhJ+3/eSBwnyzBcXw7TTNtIjP6jF+IZdLEqDT6cew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SuyRIGKjX0pvxM3CwQYnzoVlLr6sBbzC9g7NgwIvSBM=;
 b=fkcIODrDF7B8nYkhpm4XHCcQG8ktKj+/yoj9MCXKNHPB9uenho8TH1VHdHt3l1FdBZaw42Uvq4GULjc8GcRDVx/axlCUCXU1Q5wGGRiQOndMHpV4e4aY1aUg4yytqScdDq1npN46TpNG2zaSjpeg/xlpTWeLWFrOCoCFzHdju1cJJgEYvovi1FWXB/4xplgu3sqA0mM5MPf5P4FMj1GRsL5HG0mD+SVnQ2dAP1N3yB8nCsOcjBo7hJq21puch4T7wrTppfegOMoB1gIRpm2XMbcYmpQ1FGJ4q4NZwhfTHOh6hcZrPFxN42+qTxKnF7tjM8L7DeDi6hjjSda4CsfaVw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DB8PR04MB6859.eurprd04.prod.outlook.com (2603:10a6:10:119::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.12; Wed, 4 Dec
 2024 16:20:40 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8207.017; Wed, 4 Dec 2024
 16:20:40 +0000
Date: Wed, 4 Dec 2024 11:20:35 -0500
From: Frank Li <Frank.li@nxp.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] hwmon: (tmp108) Drop of_match_ptr() protection
Message-ID: <Z1CBU1wGEALtEBmO@lizhi-Precision-Tower-5810>
References: <20241204141754.4051186-1-linux@roeck-us.net>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241204141754.4051186-1-linux@roeck-us.net>
X-ClientProxiedBy: SA1PR04CA0004.namprd04.prod.outlook.com
 (2603:10b6:806:2ce::9) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DB8PR04MB6859:EE_
X-MS-Office365-Filtering-Correlation-Id: aaed39e6-f35a-4735-5c83-08dd147f986d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?FEq7p/bIB7pf4or6u/4WOgOFP7md0QuVEZn5cyyDIDTL8bkF9H7aVuWZ3bAd?=
 =?us-ascii?Q?SODGcUGlncRTg08VkVOSCpOXyde//O+qYFiNyQL9UoRWOGttXng6sGtyVjIO?=
 =?us-ascii?Q?9QxBWyIX48LbUvAGyiUb1fqeFZ+EPKfVS3LgJQH0tGKW+gfroG0UjHoLqCGt?=
 =?us-ascii?Q?r0EK+NH9dzJT8aRqt1hUXjeML74+qm5SAF3sEORdRtdWF96DGOHo49wjeeVn?=
 =?us-ascii?Q?QMX9+LgmTIvzAmZq+oG5IfKqHnyNBT7GzgMnPcBROfLXo9j7QUlLCwpXQM7a?=
 =?us-ascii?Q?HekjWKeDQxoeui9DaZHvfeoXzxWz7mkYBSGt+pK4f+nMBAJ/rP8+1rrZQPv2?=
 =?us-ascii?Q?kqM+1xlYui+01MOLcrnVV5FssvwCgC4bkAYzXLCAKJfI5QEBllnZorsmjvSC?=
 =?us-ascii?Q?7DXGYiqY6fwDfyACtLJ1wqwM63ilYh54FO+9LGLrEOA3NCCCfu9FGoepmnmX?=
 =?us-ascii?Q?rteNjQs0EHuT433tUKDtWHw4TLUP0T3hDXMc8a1fUzIhqpDGwyZE24zIER3W?=
 =?us-ascii?Q?AoWlb5S48acPhYyMrAhYsQukvzI0TEVTpY9kZN9E9w6mZXeiZ00bf5W31jxq?=
 =?us-ascii?Q?2sVIzqvnO1+EkgC0rlOw6LFlX6a5dt0XqZvIo85KQRfU6RboJUQSTtF4bz/M?=
 =?us-ascii?Q?LtovOZg0FUVoMuYV5mHG9AdYpIUHGClLsFQQN/ytjQwrJxle8M8O6XhSG3mF?=
 =?us-ascii?Q?0xSXnK9m7+/Lre+rhkoXcUlk5PB3rQSammikR+JoZEhd9WRuepTKiFv8KbRM?=
 =?us-ascii?Q?pwPm6/ADDbylDJoTUwXt29hunuLNyUpSsJdkKVLYJjft3LyU0RAGsJrMAzgY?=
 =?us-ascii?Q?KQpl+wXeFFqK1+GRjNkNRJEDBxlhVjHosqJa+bNBkn9q4Ug3Os5hx1Ki8laJ?=
 =?us-ascii?Q?Il0VR79Lt+Y/ubfwEasGdBN4gMV9qlLXfiH0W9zN4evZn/CxubYVAZldFkvb?=
 =?us-ascii?Q?MHTfrqZ8bBr1Zg1gUznq0vhlS87Edsxsfi93KapqgOKGML6paS75FVMJEHYU?=
 =?us-ascii?Q?hW6KGRdGlEy5qtzzETpa9KetLCgu4OEiGPtcAQvkIUwXbFH0NiYnz+QqnnOX?=
 =?us-ascii?Q?wIInyikuB7ipuPe7b/G7pC8WNEAzgtkp2jYExa2d/ePiPnlYa7mzAGoFs7kd?=
 =?us-ascii?Q?QcS259ZtCqazHPwGgBRDz2ltr/QIUjUtb+nTzgEUUUe/y7lU9jFkhxVkgfLa?=
 =?us-ascii?Q?SXpPxll/JKlGVY2ZJQ7cEokOkqvBtZ0hFqVqMsix4U3Em29HZQdzW94Q8syc?=
 =?us-ascii?Q?4AtX2/yRUTipZL8eu2kOr9gLl/PXl+yRexhRUNI0vZ0WvvBEIIIRtnZbvU3s?=
 =?us-ascii?Q?Xc+bAuvi0axS1Qmp/7m3I8b1uDnnMNQ41EotF9csiSVp6Ihfs0q2nKGup6M0?=
 =?us-ascii?Q?6T6LrqNEUNT2O4DMeCV8r/FZloZYB4QQKeFISXEkMDPWu9kz1Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?aVe+CmA7wPV41uv7v4ZiZpDxqTvQEj8fQycql9RcvZIPurcGEj/trDmLi1vP?=
 =?us-ascii?Q?v3X9yj/67JzK5eSMM1snbygCWV/gnvdjOGHkjPud/JtMJjhdvYckmkVvBC6z?=
 =?us-ascii?Q?Rlv+tDHsFPs6hdcEaoR/bAHIV8lL0vQEE6iq2Cls1VFtbix7GOxZfZCuny3D?=
 =?us-ascii?Q?qUpeBNmwvNYcO4DLZsCEyBJWznN40EAKZsowhYIgGWp1sRMAp7Fkj+r6+6Jg?=
 =?us-ascii?Q?snS4a3H3h2g+5DpYCZj61v5sAUYbKLZuPDB4dPlAwIkh/CRKxnv1yQ21o2g6?=
 =?us-ascii?Q?w0kpFKmto+IKNfjmjHe2O4EC4AaTJefuPxQKO5880tASnHSaS0nuyU+bav3g?=
 =?us-ascii?Q?IrzktvqO6lhXePus9PWT8ZjxvgATZ6HdIqOCqwJ/f0e8Bkmjz9oKEF3mOCEQ?=
 =?us-ascii?Q?ZNh7UEQD4N6tsLW/b22xqeg/uWrtgRx2IY2Y73vCqBx1swJJiMT98lOLEMGJ?=
 =?us-ascii?Q?LjFLW2gPpFqhxzrgZVio/Es/BhAGJgrSQkLbRgwr8Zesk6n19bvpwyxLQKns?=
 =?us-ascii?Q?LFcgAuUSA7V1U3YdWRRIsxkD/8/osCPtjmyi8K9Ewm6ry0jdGatZpYUmo7tm?=
 =?us-ascii?Q?SNyAhzS/CrFZWaVzhrXtjDUWuJpDNjSHzSeVfJDf1HvTw44q/pq3jaDnCZZh?=
 =?us-ascii?Q?uo0hG0i9gyELymV2rADP+Zep14pl8KK9yev0laOxmQ8MHxtiKppQE37hv6BN?=
 =?us-ascii?Q?VZsTdW/crucc1+jzOGTAzrBjroRVlnjB75UJmgbzDr90FxHRFSrKIXEQT4Gf?=
 =?us-ascii?Q?zlrG5ANoOl1fU3DdTU0sFFiDPePSZnamg/13bqX/3AvRDCXjwKpBDL/P9tm/?=
 =?us-ascii?Q?7rgb0uT81g8nOpERoYuXpJMUnMic0BuzueNv2Iwg+D/IPor4gR4Ha0VcJpVt?=
 =?us-ascii?Q?+iMPIYIDqrgHYbs23PtEG7puQNbFFEWeh3nsjHeBVIHPlpe22fXLhw+wDCPA?=
 =?us-ascii?Q?Tpc2+N9FKXIjNEb4PK1qxokK7MrnVJbpfu6hBW2HD/YQivRgKR+HozG/nUSF?=
 =?us-ascii?Q?2jVTH+ixcfUAZ2euT3calt68tTzg64f4z7xrDzVEDC9y1ULi5xEy5o/7GkUk?=
 =?us-ascii?Q?2zbe7MvfBJmu+F+JxwxVmi/N3r4Sf3TptfuYGD9yJ/NBMQA26JvV3Af3LtbB?=
 =?us-ascii?Q?JQ1zFjbkRNbLLJxHlVAW1qeiJEtbs/8L6hcmDb6AS0ah2zJOPcQ7O3IuBJJ/?=
 =?us-ascii?Q?ZLK7lkZImUw4qyYKNX2Rj9DEUgQ7Rz4A4e1yEK5Cw8OFAMzrCQYzcNY2qt01?=
 =?us-ascii?Q?CFRYwLiGEsByDoDFYDO+rJWZH7HNrlKAVDzfQUXd2YmmRXXLx0YHZ3DmA3Ib?=
 =?us-ascii?Q?F9gS0Ednih0Nm+MKZJppMVo8Zk0LUzUUfHTRHj/pFqCNA5h1+c/531YMbaVU?=
 =?us-ascii?Q?LcWZ9G14eHhgbRzKpxVS8nzaTEsCX01rwURWTsuV+ekjRPtuoXIOpea5xHAg?=
 =?us-ascii?Q?OUe0n3kNqXVXW5EoADiTUjaneRZC8toD3X/rtKExp/FIyr+9TOy0wARlziDb?=
 =?us-ascii?Q?179Xm4IPUpkB6CvBDtU1bW6JXE5z4/ZVxzA1tTTM4sq8GOSpbJRt5SKQ7Ild?=
 =?us-ascii?Q?/8eKoXV+yN7/Dzt6SRNTByq7Suvy17ONd3qxpv80?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aaed39e6-f35a-4735-5c83-08dd147f986d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2024 16:20:40.8430
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ps/vi/egPR6g31qcbzkpMt806PAw6F9mnFm+jyLiMZuwiGs2XRIot3e9L/l6apvXjezT9sBA7MNcGs0IoK0Bng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6859

On Wed, Dec 04, 2024 at 06:17:54AM -0800, Guenter Roeck wrote:
> Limiting the scope of devicetree support to CONFIG_OF prevents use of this
> driver with ACPI via PRP0001. Drop the dependency.
>
> While at it,
> - Switch of.h for mod_devicetable.h include given the use of struct
>   of_device_id which is defined in that header
> - Add I2C device ID for p3t1085
> - Drop the unnecessary include of hwmon-sysfs.h.
>
> Cc: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  drivers/hwmon/tmp108.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/hwmon/tmp108.c b/drivers/hwmon/tmp108.c
> index fbe673009126..8110601263bb 100644
> --- a/drivers/hwmon/tmp108.c
> +++ b/drivers/hwmon/tmp108.c
> @@ -8,10 +8,9 @@
>  #include <linux/device.h>
>  #include <linux/err.h>
>  #include <linux/hwmon.h>
> -#include <linux/hwmon-sysfs.h>
> +#include <linux/mod_devicetable.h>
>  #include <linux/module.h>
>  #include <linux/mutex.h>
> -#include <linux/of.h>
>  #include <linux/i2c.h>
>  #include <linux/i3c/device.h>
>  #include <linux/init.h>
> @@ -417,25 +416,24 @@ static int tmp108_resume(struct device *dev)
>  static DEFINE_SIMPLE_DEV_PM_OPS(tmp108_dev_pm_ops, tmp108_suspend, tmp108_resume);
>
>  static const struct i2c_device_id tmp108_i2c_ids[] = {
> +	{ "p3t1085" },
>  	{ "tmp108" },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(i2c, tmp108_i2c_ids);
>
> -#ifdef CONFIG_OF
>  static const struct of_device_id tmp108_of_ids[] = {
>  	{ .compatible = "nxp,p3t1085", },
>  	{ .compatible = "ti,tmp108", },
>  	{}
>  };
>  MODULE_DEVICE_TABLE(of, tmp108_of_ids);
> -#endif
>
>  static struct i2c_driver tmp108_driver = {
>  	.driver = {
>  		.name	= DRIVER_NAME,
>  		.pm	= pm_sleep_ptr(&tmp108_dev_pm_ops),
> -		.of_match_table = of_match_ptr(tmp108_of_ids),
> +		.of_match_table = tmp108_of_ids,
>  	},
>  	.probe		= tmp108_probe,
>  	.id_table	= tmp108_i2c_ids,
> --
> 2.45.2
>
