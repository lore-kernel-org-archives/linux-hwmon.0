Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11012016.outbound.protection.outlook.com [52.101.126.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41BE02C15AB;
	Mon, 20 Jul 2026 03:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784517395; cv=fail; b=BAU81rpoDxV6Vw7c7lXACl7vibENWW9Ew3GEH3z/GLYU2GjOKadhHEqkkd1vB6D7xGbigg8FH9uoHPL5xyH9J6B+pKYA8GDEeLUgj0MZavgQ+UneU1VRaJFmquTohhRqUQJ7HeKwXTGONes5n3HcnWl9ZTm63rPybRtTJkadj8g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784517395; c=relaxed/simple;
	bh=pMR632qXnFFW43vjDSkGFk0Xh5Klr6iC4OSSuonL8vo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YjI5/tPKAAmMCEggvcvSjcb+ZzBN7V6We17CHNDTEEs8bcVZ57gfmdvgO35M/Ud0H1F1wJGbuwuC4yms/LJNKbUUNkoyiFHpUfy2hmyW7qhlqySmfHPXOunYAKHx8dTq+NMGI0IX+7+qAfsHhaF+nag88VW6ezBZ73zsvdWBXvc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=eSiTK+GN; arc=fail smtp.client-ip=52.101.126.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="eSiTK+GN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Eyu/OGkEmOGiBwX7KQP11KxQkYjVCGKxp2oIGvafpqL023rbwu/pqJd7hNIX3xaO4VP2g0DPvMSUxktiVIRgrllaTPiPcwqXKfukRh/KV+9iui/3pHD90GEdO60L79nnMnXK5MoxYl8abKUa120yO8k2Wmzq1j09fOA2K7X7EZ7rTg1ibspRD1ir6r+1zFpCcVTMm+iZs779AJXw0dme3ij5F7B1Yv+XKA9q/2V4n3cJDWedaJQGnNWE7vk3+9bIU2lRgKGDlAEe9/vCgnLNcAWf5kG0qWSXPqUqbXLJtZFC0KLZ+0pP0RYq7EWse1ZIYws+qoKxC6jh/9jJN59iYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pMR632qXnFFW43vjDSkGFk0Xh5Klr6iC4OSSuonL8vo=;
 b=fVKT5TjJPDXMMMlXmG7RJFbTblQtL1DQyjb/UmPf2wHDAJiQGhj29QGBoo4cWT/+4L9ln7DPkN11GcdcTafvfqWKWopgQ/+XNPHdKziuw6xVqAy4w+MN4tN0aOnJWtkNZeJ99JyBbg+BpECNAsOGNsg7rPlbCq2epAM3J+jTQ27aONfTVY6k1zMes9ez8JHfkgHAHIIYey//9kwgmeDF3bMDXoSa/aleIvhU6NV4X5u3oN76tqV+TYn0QAXvS5XFVWS89PEdZVFicsY+MSvr4MXs6FE6FUlnJFm5Jp/LGAPU4fWRGEZbZ5oh1J9KbIqSnFVnhVzDxSDRy5vPnBYXSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pMR632qXnFFW43vjDSkGFk0Xh5Klr6iC4OSSuonL8vo=;
 b=eSiTK+GNgJEnN6LcIFOY57TxIRKyedv7D2EdwheMofFoi+cE6ci4d9BPcQKue/TIMGHT0HvSFDs9ikKPQXh948/4mbzQ/7SfqyHNhjV+VvDMWvc7Ij+uBNkI24nFIVvF6JxrSlvnQjMABthikvujpvOHwp3gOfupsOEd7sB6l0GxlWWDHCDoo2AeH3y60EMIPVLb9Y+YPVHN9sEYFsTK0C9st54u+CoXS6k9+frl5/uUIeZh29B0b8WnA+iaJvcvsKfNS+Z37qePf2xXMXUp0Ut/uackCOAXu6YOj7fV59UCJxXAqzboQeOlXqZY0QDIpMDz6XEXfw3RvF67/i3JcA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com (2603:1096:101:c8::12)
 by KUYPR06MB8482.apcprd06.prod.outlook.com (2603:1096:d10:8f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.16; Mon, 20 Jul
 2026 03:16:31 +0000
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b]) by SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b%6]) with mapi id 15.21.0223.015; Mon, 20 Jul 2026
 03:16:30 +0000
From: Pan Chuang <panchuang@vivo.com>
To: linux@roeck-us.net
Cc: andrew@codeconstruct.com.au,
	avifishman70@gmail.com,
	benjaminfair@google.com,
	jdelvare@suse.com,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	nuno.sa@analog.com,
	openbmc@lists.ozlabs.org,
	panchuang@vivo.com,
	support.opensource@diasemi.com,
	tali.perry1@gmail.com,
	tmaimon77@gmail.com,
	venture@google.com,
	yuenn@google.com
Subject: Re: [PATCH 1/2] hwmon: Remove redundant dev_err()/dev_err_probe()
Date: Mon, 20 Jul 2026 11:16:19 +0800
Message-Id: <20260720031619.95443-1-panchuang@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <2334832c-fbc6-4356-83fa-1e331e5ebea4@roeck-us.net>
References: <2334832c-fbc6-4356-83fa-1e331e5ebea4@roeck-us.net>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TPYP295CA0047.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:8::16) To SEZPR06MB5832.apcprd06.prod.outlook.com
 (2603:1096:101:c8::12)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5832:EE_|KUYPR06MB8482:EE_
X-MS-Office365-Filtering-Correlation-Id: 8905ca7d-db91-4066-0a46-08dee60d4b47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|52116014|366016|23010399003|38350700014|18002099003|22082099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	i4vCjirS2uiyKS+aodbh1aiXMHNRhNKI/CLLawBv5RRDEA8uF3LQLNf6Ugly0yOpjHZJtfKRW9CeEZdTp7PN8yAwcbsjiPUf3/BeqA4Eg8Y3aiZrOeNszVVLECEyfdnAwQPbU4mbFOGvukH83z1z3xCAmacUInPc0B5O/g6LFD6o2U6VwAht9JPRqyWZHmoJEiil6gwsWQJRDS0ONmQxbSIurOM7XwciKFz+i9WlpT4Mpg1S9A4qlMyhFM6rSIUS8IrHOHPSHIWKdiLL4A23pZ4Ob7GKEKqKRijiWXS/WqC3PwFoaU6W/uz9pweEhQWbDQ3FGzEfZTGp+RpUvQzSOAaQGRka++d7ux6J7mjX4UCAN+5LXkI4zhyQWcR40/Xx0j35m5SF8a6YjcO/+NYnakt6kfSwQLNOHMkJCe9SlJ9wxtnJI4HEAY/lQFulDi87Llj3psOiuX1rLCqkxCrGxJnLfwhvCDJfBy35Qbr2rNDPdKwfYmSmgfAMMHC5u/+qjmd6mrNzrHsscqfAQf66Bc6UUtwiOmzNaT3J5jJYa5PyoH9fq4ylzIdmyPsQV+Wh3LEcy2rvjB2OooDCaKUEhEm6ifF+IZSINoXn3m3a8MwiK7dj+btMPX00nn0hZqzVIQRBhM2uTm50N7FqxulTlmrVTjqUR+aR8o5RE6251BVKFgLS6O3KZYLE0kGX8AUAZSrng2Srcwl96RZ9XGpYbDZrcSOqXZzQHA81VF7RuZg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5832.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(52116014)(366016)(23010399003)(38350700014)(18002099003)(22082099003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?20C6a3l/iYmSptH4wyq+1WjUZ3mKZEa3hfeZE3KBJADIDHzXBkrCVeeZIcG3?=
 =?us-ascii?Q?bKJ/xKTb1bBLVSQbNLT8sOH36q7n7qpcwcHfHQ7zApOUD4ODwl1VEuyeXwbL?=
 =?us-ascii?Q?EahJ72w/70G1IRWszdP/RKoKXSTo2HLaHlGdGv1M2kBsSTIunwrcDAskW4y3?=
 =?us-ascii?Q?KcH8fCSFCAgAhHhj1Z6EBPxwRProh4HjLNS8e6+kz2PEIHBPUVKHdcCjrtx0?=
 =?us-ascii?Q?h6K89+w2IXmL7YJdCsVQw2ixAnywbiaYn7MIffrqKHjScKyhbzSQHGZCovKw?=
 =?us-ascii?Q?98kAjyDU12kqRv8KlbWRsBfzbiJrh5MqwclkOaJZFyxqGf7xGoECrtY5tiM4?=
 =?us-ascii?Q?7uM61xpclafKCx9vEAtOlQKSZcgbSe7RS/2MDwvAelm6NpMiqBfWBukxD9HX?=
 =?us-ascii?Q?E2xwML09ORjzyIqDoQlDpkuxxEz4NBKgGXrxjcvzlyEkDsYiqR1Nwnyj33J3?=
 =?us-ascii?Q?JQ5bNyEKts9MTJtGgIoVZiYBMnyAM5YGXMeEg8EHslxVvifd4PHgxnbVw4uz?=
 =?us-ascii?Q?lM9PR2joKYNXFGpF/fAlDmdEjxuqzTThXo75hm+6LWx/pK3zN0Wb4LGCDh9V?=
 =?us-ascii?Q?m9sXGtmZW00HGchfEIOJX89qgSEbJrZpP84OJHkNLLWsVqU/3CkRArjGwSJy?=
 =?us-ascii?Q?rRLMcdxv0ntC4XoD2tK2EVAGBu9iFYSyVftubnKYIBYjmYxjWqLcY0SSVGGC?=
 =?us-ascii?Q?y9dVY7yM/dk0ZOEH+t4QOJ7RS/6DI/E7APCQOtHXSJE0hKw07DzczxT2jxFC?=
 =?us-ascii?Q?20CQPueUeQLJbewu4Y2AMhbvOh6DKnVQ3Ft6sYQbPXKNhfVqcv6omCgzXwIH?=
 =?us-ascii?Q?JvV893EkLCUXOu/Y3suuAUhFdcrlWlJlIIWHl+pLV6DQwPIEoZoD50cs+iIq?=
 =?us-ascii?Q?q2+TrB0U8oDFFLvCddy5qwU/+gFxU89Q10Bnrv/SK+TBKomk6HUOhdG735TN?=
 =?us-ascii?Q?Sf7sV0KTN9u0Jjxxa20+gmEgpUwrZ5U/RdILYqhJt10DtherFZdvXoJPk7i2?=
 =?us-ascii?Q?0M8+LYeNYg9yiaYOSKklXYn51vZhqM0I3WmITJ6UdpynJYcgtGAglNCoTcWO?=
 =?us-ascii?Q?8ZO2KbHgWMV+exUOSez0IR1wVVAGyaGrzoasAbxW2R455rNMsTW7WhKJ3W1N?=
 =?us-ascii?Q?4ocGmcJfIO7TczG/jDA+rbugeQAiCypqe/QIWsl2zEDJsLWS8kRCi4ItsWS7?=
 =?us-ascii?Q?xX+ccshskf0SkjSMad2I93b3oRvmTUEDfzVpUcNnW3iH1dtq7hPDxIxzw+Vp?=
 =?us-ascii?Q?j1XxSOd4MctuyzqHIjdtFTluPxE0MMb0+P3vqJVdY0cyUapkhqJMI7MEWB02?=
 =?us-ascii?Q?Nl+OgQ6Yvz8stcJQIx0B5FOIHGzIB+zw/FeNjvCageoV/IZfTK3wNf5cfl2P?=
 =?us-ascii?Q?+4f2SvbvYDUlkWot3K85J3YREy/cpWiLAfgHrD/ehBem5WGgEmBPuVsJ3o8k?=
 =?us-ascii?Q?ur1ylqTLd7Z3JHdUl2PmiXonmT8r5uReTUmn3cpKOOglHoMy+i7l7okdDR4A?=
 =?us-ascii?Q?bgAn2u6RdDiL0zhSeQT6EAX5J5zC1745Ze+WIiKAYOjWF0alJU7ZwHyDP8vm?=
 =?us-ascii?Q?VXVqchI9C3pwnn68uVwnlkujHeq91ZQXfWksh3uX57eBhusR9CHeM3/Rmtw9?=
 =?us-ascii?Q?8F2YH7nIlklid7f7R0PtAPCObX9XD09BnY0m8x4siLGwMGT2HQ4GVT3J5Jir?=
 =?us-ascii?Q?XGNA8kUVlPazQqHZpTQm2i6lR0yarnbviNnY1/7gA6LxB4bEBjfUiuzOJ9I5?=
 =?us-ascii?Q?e4/iZmlsWA=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8905ca7d-db91-4066-0a46-08dee60d4b47
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5832.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 03:16:30.8504
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i2V/XY5FkzARKalHXynQzJgR/qPtxfeShQlp+anpxZJMRMnkdcWi2Pt4+BmGcLK+Y3mEFeqXdDx/hJFzwk4oDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUYPR06MB8482


On 2026/7/19 21:50, Guenter Roeck wrote:
> On Tue, Jul 14, 2026 at 09:02:24PM +0800, Pan Chuang wrote:
>> The devm_request_irq() and devm_request_threaded_irq() automatically
>> log detailed error messages on failure. Remove the now-redundant
>> driver-specific dev_err() and dev_err_probe() calls.
>>
>
> One patch per driver, please, and provide a reference to the patch
> introducing the error message (because I can not find it). I am not
> going to spend lots of time trying to figure out if this is real
> or not.
>
> Guenter
Thanks for the review.I will split the series into one patch per driver
and add the reference to the patch in v2.

Best Regards,
PanChuang
