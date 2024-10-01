Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2125.outbound.protection.outlook.com [40.107.21.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A37711B5820
	for <linux-hwmon@vger.kernel.org>; Tue,  1 Oct 2024 19:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.125
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727810737; cv=fail; b=iCbxN6ZK1hHhqizXPvSmGU0npUPegSLNxfuKbIt97PuOC6uejOhOtcP5t30g5ASHNysI7yS643izxLc47bRPSGkNc8SpHx7OzLJSlZCOYks2DIF2O8lALq+H+5Ojtr8N4m+LECJljTZlbbHCE197xHEsc9230qBrHE/VPaCu/BA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727810737; c=relaxed/simple;
	bh=HpcaAPZYlmkScb/TsGnajxHUBSvAsvyttnozKFNFUtY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=RdxazFNYJOczvvIbfR9qyI1zg+QUzK/Sas8YsSsOPe5MKjQTKzJtFUHG0AebWmnOFB6ShbT8/CB+JcmwCtFfjMoZab74JFSsgYMYWDopR63ON+CdZSxXCnbIB4a5P4xEracArTd04GSva4l4NEBWACIwhc3XaUogUdFoEhFT2pE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net; spf=pass smtp.mailfrom=wolfvision.net; dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b=NoEbSC5O; arc=fail smtp.client-ip=40.107.21.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wolfvision.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b="NoEbSC5O"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V1DcP8EyIgSPDLE8kznWype7xOickr5Yyp8RuGoDoX+H0ZMuCugSUd7MQ/Lz9EBeoVanOSLWyyXdMBCfr/P2hQn+JBSFf2IpHPXnqZYLq1Ae7oyxHnxSABvTRTqdVALIN+3QDdzW6A5Mlu3SItRJ7d3dQRXsev74Az9f1MZx6N3LW8y22jLQO0UII8s0s5aZGYnQ42HjARmpJTiLUf2vHEmr1g5TkSHQ36M8ngjROwobkY0cNsmxT7u+YJTK51Q5vT4lxkWJicimmHvQVvJWcqtbk3gfHZx7VVmo26wZQZ3o6OR/IS/vmItL4ngRQy3ILRzV9zJ53eHeFI9Ju2CE+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sow/29l8J9naKweAZndE7ZK/V4w1TbwHvC1gBsucUR0=;
 b=g+rwf+AWYtoneRtG5/ltlqnl9nb+HdniSWVGFJtwYUq8oBpZDaltzwDqyK1GeMvSlsST0gizJR7OHf4siYL8Rav0ImCA5mOHb8YE0Tl8zZ2ni/bpKvmPg4OsiT+Gnd0tpf1BZ4FZxZEZQ8Pmy+KkKhvB1rsd00c3yrB/mcioeMlFZou49xfs2Va7k+k/QWl9mOBG+fVb0udr/pqFMkq03h38tWBOSmRbYWwo08jCDZ/ULBzs1JBER2p1getAIVNHO/P+unGuG6evi59ZfpkqklBh7Nqy4TDJSq2k2fhPlFBDDLlS+DglqoFFdBAA7cwJpzg+Mekmzfyeeb8I1YyOdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sow/29l8J9naKweAZndE7ZK/V4w1TbwHvC1gBsucUR0=;
 b=NoEbSC5OxK76wl6QzOteLOOZ0N8itKInOSO1gHZjKtQOVFdw4jF0EcpVW2xK2BkXHPZzYcuNrz/mU8IYhSU8zWHhHkIYW2Ln3pDZBLqLqE645fvbh1hrc2EQmCwEkZQG+O4h0YzaON0pFWmY+qpqSCajJFRCg6rKfqmD6w48ZoY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DB4PR08MB9190.eurprd08.prod.outlook.com (2603:10a6:10:3fd::21)
 by GV1PR08MB8156.eurprd08.prod.outlook.com (2603:10a6:150:90::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.14; Tue, 1 Oct
 2024 19:25:30 +0000
Received: from DB4PR08MB9190.eurprd08.prod.outlook.com
 ([fe80::c7a:6978:9afa:19a4]) by DB4PR08MB9190.eurprd08.prod.outlook.com
 ([fe80::c7a:6978:9afa:19a4%6]) with mapi id 15.20.8026.016; Tue, 1 Oct 2024
 19:25:29 +0000
Message-ID: <817b130b-d732-4bee-be44-0174590af924@wolfvision.net>
Date: Tue, 1 Oct 2024 21:25:27 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: (tmp513) Add missing dependency on REGMAP_I2C
To: Guenter Roeck <linux@roeck-us.net>,
 Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>, kernel test robot <lkp@intel.com>,
 Eric Tremblay <etremblay@distech-controls.com>
References: <20241001184142.1695624-1-linux@roeck-us.net>
Content-Language: en-US, de-AT
From: Javier Carrasco <javier.carrasco@wolfvision.net>
In-Reply-To: <20241001184142.1695624-1-linux@roeck-us.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VE1PR03CA0043.eurprd03.prod.outlook.com
 (2603:10a6:803:118::32) To DB4PR08MB9190.eurprd08.prod.outlook.com
 (2603:10a6:10:3fd::21)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB4PR08MB9190:EE_|GV1PR08MB8156:EE_
X-MS-Office365-Filtering-Correlation-Id: 463d16ad-3eb5-403a-85f8-08dce24ecf61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c040aGwxckZOVWE1eFhnMGVlM2pJbFNFNEhUeW1mNjBQOXhZaCtkMWNXRlRF?=
 =?utf-8?B?QkVmOEZ2SkVlZGRVbGpiUFFPaXg3aFJVS0NBSGN3MVF2M1A4dDJ2bUtpZmNJ?=
 =?utf-8?B?UitYYlRoRzVjVDhqQkxmNmxZWFFvRUN0SlJMTnY5STMxWnRhZnc2cENJUjVM?=
 =?utf-8?B?MXhxMnpiZXpYUGo5eU5iWS9Ccmp6cDlxVWVVdW0xSWZ3NXpXeUdwKzFuL1NZ?=
 =?utf-8?B?WHpaVC8yV0U5RDVURldnOGwwQnM1VmxyME9OWjUzdUR5MFRhZnNvZTlBZkc3?=
 =?utf-8?B?a1BsZXdVUHNjMUY5VWVndjVnWUVHS1hKSGt0Tyt3VDRTK0hqYWwwVElmMkV0?=
 =?utf-8?B?U3d0aVhUcUM0RDk0d1c4dFh2SXB3R0s1R25FUjVNT0MrOTlRYlNVL3N5R3Vw?=
 =?utf-8?B?WnkxZnZPdEFQNlVUWDhwSldjcCtxQzI1YlpKeURxZVNXdWgvOXVkOHRpaEtX?=
 =?utf-8?B?U3UyYWV0SGhOOE5CTFJEY0hSOXE1dk1oRmk3YWhabHVYek9nSVFVTFJKN0dh?=
 =?utf-8?B?L29mRk5IWWY0cy93WjR1S09FR2lMSENqbHNMUU05RDVlOEs0QUd2UmpFdUZm?=
 =?utf-8?B?ZHZyZUdMa1V4eXFyanlUVG95WHcza3kyVjZKdGdmcFZ6U2FzdERrSFI5V0FQ?=
 =?utf-8?B?YXdmaXpaRXU0SVVOOSswcDZacGNDa2F6T1Z0Vk4rVGRWRGU3MFN1eFVTMlNY?=
 =?utf-8?B?Q2ZpUitqUVJ4K1dlU0lQUitpVElyWjRPUCtLbzVtcW9IWWVxUWdBdXRzZGdl?=
 =?utf-8?B?N28yOFBRZHpCZW1BV3ppbjJsREc4WXRpK3dPeG9ib0lTVzI3VEdLQnNxREtn?=
 =?utf-8?B?UzZuNGxZUkZmTTJBSSthc3pBd1U0YmRLZGY3VnNMbzNzUllNNS9udG1HUkdl?=
 =?utf-8?B?Y09sNlpJTlk0OVdIZU01Rzl5cXZsT0p0dEIwSDJwUWtGZm5WazNlTUNraUZO?=
 =?utf-8?B?SFArQWtZRTg5UWRhS1Q3SHYyVTV6anpIOE5rbXZKbVJqYjdpK0hOMkhwSEJT?=
 =?utf-8?B?VmNKTHdxdGdZUlpHNDNFUjRTWkZwRHN4SW91WDkwd2ZOQ3RpTmVyRkYweTlX?=
 =?utf-8?B?UHJwZVNiaU5acWROMVJoaXhHUC85MFpGcklVeWNhYjZGWWtiSEpGdXJNRVdR?=
 =?utf-8?B?aDJEM0l2ZmpWRDZYelVtY0FoNkJNM09uWFBhcnQ1L2JVUFFRb2t3VVRVNkZs?=
 =?utf-8?B?SmswZmlGYVZNR1UySzI4STYrSzl4aUY3TTNxSTNyN1VLTnVlbVgySWp1Wkt1?=
 =?utf-8?B?VnlQb2ZtK2x1RE9jdHJ2NG5KaWtMSm9UMTE1R1hlZ0lKeVdibURrOUgzQ3Jr?=
 =?utf-8?B?eGQ1SjdhaHZHNjlUaUVBaDlXR2ZJNTVwZFdUOTZQQzhERkNONGJkL0NZYWdL?=
 =?utf-8?B?TlJDUzJIRXNsU2l5YXczQ011Nmp6Mmh6QWR6SWliY2kvY21yYU1GZ0dUVHBY?=
 =?utf-8?B?akQwTFQvaVNKbXk0WFU3WE1XYjI5emV1c01xbHlGWUkrSG05TmtOUWlVdERM?=
 =?utf-8?B?MkFWSHBPSSs4V211WERLdWNldE9WVk9LVXhnTzd3Tm52S09ybHJFdUhiSmls?=
 =?utf-8?B?SVFPSXdJcHZKU05TV1E4ZFpQZk0zTU8vYmFTT2dHbGUyckV1SjVmcXUrcFRS?=
 =?utf-8?B?VEp3VmxvdnBQV1I4YXVJZlR0T2Z6SHlZWGdxbFlQMDVpb0FUZ0lLczZCTUNv?=
 =?utf-8?B?VEFNVDVxUEx5M2ozSElZR0pPV1ovWXhvR20yUGZZRGNITDkrYnBTeEFnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB4PR08MB9190.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(10070799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bHJhbTZZcVd2c2xwUE5ncWQzd2hFQnUxdXNLYUc0N3l6RUlSVVlzM2h1RDdk?=
 =?utf-8?B?UlBUdk42WndSRmxXOUI0ZEppOFJVeGx5TTJvdnQrYkRjSDI3RmRDM1c0QS9v?=
 =?utf-8?B?ZGJtQU1MNDhRSnJQUXBLK3FBbHJGWUQwWElFdjd6RDJaNXNMMllEbHZDN1g2?=
 =?utf-8?B?ajVVNzVEd3M0TmNqSGt5YVZ2SGZSNXkzaVFLZmo1K3N0RDM4UzBlc09tcDFZ?=
 =?utf-8?B?eVBrMkxGZUtvN2ozd2piNGFhS3hXb3lUN1hKSFFVN3RUMzVuN3ZTc25qd2Rp?=
 =?utf-8?B?cHBkNUZWM0wxdkoyWXlDMkMvMTZwM291WEs0bHFBbkllL1JxM0R6TnIzaTBJ?=
 =?utf-8?B?WldkQ0J0dmhXd0ZqWUFNUXRRb0IzYm15N0JtbkFVSXpFcVRYMzN6UENENXVa?=
 =?utf-8?B?MkZpRmFTMXg0VlByTit6S3VXcGs1ZkdaM2VHQnBDVkF6Y2FEZTlqWmQycjIy?=
 =?utf-8?B?M3lvbk1TYWlnaDF3Z3R4SlNNeVZTM2tsbHpIcE82VTJLR0tDNmhSUDJ5SVlT?=
 =?utf-8?B?ci9mM0J4R1I5N1dScW4xVTJVdzVUVFhjRlFaWHZ1QUgrd3BFS2J4OGIzazE2?=
 =?utf-8?B?cDBJZnduY0VDL0JZcGdsR3NBamVuUm5yWHBwYmJvd0JaMW5Yc0ZnaDdkUE9t?=
 =?utf-8?B?SFlQNEdXdzdJLzY2akM2S29Jb3JTYk84UUdFalY2Skx4ZkR4UlpJcHh3V201?=
 =?utf-8?B?cHFyR2lMRUJUNnhsSW4yWnpxZXFxbGk2WG1Zd2M5Y08yUEpvUkJYR0puVk1R?=
 =?utf-8?B?ckdqWXVqVTNZZ1NlSDBudkNheWJIK2NCOS8rckY4UmY3S0Z2WXVaSnM5VVNp?=
 =?utf-8?B?ZDlzeU9YZ0tIVWtDQjl1azRXZ3FpaGZpSlZDdHdZUWg1UW1MNDl2SE92bHE3?=
 =?utf-8?B?dWNqOHJsTzNKcUxjVWRldVRVdkFsYmdoemxHSHpHOUFCRW5Jb1hNM245R2hs?=
 =?utf-8?B?TTJZdXovYzlnbVZMNFhBT01IbHhINXdyQldETHZYbXN4c1YzcFdDNUY5VldE?=
 =?utf-8?B?ZVBLQXE1ZkxwZWYzMm4wUlBwbTFMVVBHNFlESWZNYWxMdVBqckxhUUJCZk5w?=
 =?utf-8?B?dVc0VDA3RUlldEFBMUlNTkxYWHZhMWdWaGZDaWc5L2VaQWZ4SlNFNy8rSmgr?=
 =?utf-8?B?UmpRckxTZDFvSHhYMnlOYWVNUGFMM1A1K2pSV2F0U2NHcGtyNzREdGZZWFFq?=
 =?utf-8?B?djdLOVRWSzRjUmE0Q0xEUUFKQStzbWRPQVY0R3FIRGpKSE0zUnlwV0x2N2FL?=
 =?utf-8?B?TWVMNDBKNEJGazFaOG1tZnVSTXlTRDNGdEpzYmMwaVVkeEN6Tkg0dmIyNlV5?=
 =?utf-8?B?aVdvd3ZlU2E2Y1lvT1JaejdJUTJHaWVIY0dQL2lSUmpNMXMzRWVrR3pXWC85?=
 =?utf-8?B?c1k5eFFoNnAydHJQRTBGd1FDZzEzVzZDZFpIT1hDMDhHNEx6YzJOZkRRRGhq?=
 =?utf-8?B?WHlnSTc0Vy8rUjFXYVFsKzVqSWVlTER3WEFWV2FLS2dIUmd5VlN0QlNyOGYz?=
 =?utf-8?B?anZtWElKQjMzRmhHNnBwdWRMMVhDcVRaZDBrbzc3bTZOc1RpOTRoWWRBUWZY?=
 =?utf-8?B?bE9NbHhDRSswOWhRVGFuVXZIbnBCQzBGdjMyQjVyVm42WkwrMUthUFFkOUIx?=
 =?utf-8?B?emYxbkE4RUtON24vVi9McmlrS2ltRFE2cEVqdExmSWZ2TWl3ZGtBSDg4aWxJ?=
 =?utf-8?B?UUozODhWdnFkZlJwVXBiQmF2YS9kVFRhMEZQZ1hYcGZlN1dGWUlpaHNJZXZG?=
 =?utf-8?B?Szg1bWtESFZpc214ZzVpUkx5NmVGMlNMYXo0aExIUjQ3N0J2dlJ6UHdLU3R6?=
 =?utf-8?B?R3FoY0lrRDJHUHVqaWpBWHRYUkc3RTMyMld4bzlhdGh5cWdtMG1lNXZ5RFNx?=
 =?utf-8?B?dktiRGN2bU9TOTJLSDBNdFZwdWtwTG9XRCtqL05MRHlqb0l6bzJvWHVyYjc1?=
 =?utf-8?B?NzRoQUt2Rkgycy9pUlVKSGZVUE9hUDQzUkV6c3djcGJVS1VvdDdQNVhIZVdt?=
 =?utf-8?B?aUlCQ0lnbHRhR09GWXpwampDRldybTkzRXVJeFBGSkI4OG5neTVQdDNJTmlL?=
 =?utf-8?B?NnR3TGI1QjZnMmw5QlhuVndOTkl2STZPUnpDMVN3L2VCUjFmU0lTSGtGWVgx?=
 =?utf-8?B?RVg3MFBQc0NCV0xGeVV4aGxLa1N2N05OQWo1MkswMXVZVWlmbjMwK2JPc0hx?=
 =?utf-8?B?YlNCOWNOalhIWG5uWXdHQ3daVmx6Vkh3cEpDQlRWLzZiTnVteXNMd2RxcWQr?=
 =?utf-8?Q?B/EhAnC+b+ru5Ae+dnpGzDetre4o1mj0/Gm04LVW9M=3D?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 463d16ad-3eb5-403a-85f8-08dce24ecf61
X-MS-Exchange-CrossTenant-AuthSource: DB4PR08MB9190.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2024 19:25:29.7792
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BMre8hsl2JE4LajUjA68P2/JJMak44ZET59SpFmGtTcrbA/VNzCtmORxkxOxLivPy66vZV1NmGpPux2f9hk1kHxGLJq3JlhPlhjvsJMCeXk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8156

On 01/10/2024 20:41, Guenter Roeck wrote:
> 0-day reports:
> 
> drivers/hwmon/tmp513.c:162:21: error:
> 	variable 'tmp51x_regmap_config' has initializer but incomplete type
> 162 | static const struct regmap_config tmp51x_regmap_config = {
>     |                     ^
> 
> struct regmap_config is only available if REGMAP is enabled.
> Add the missing Kconfig dependency to fix the problem.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202410020246.2cTDDx0X-lkp@intel.com/
> Fixes: 59dfa75e5d82 ("hwmon: Add driver for Texas Instruments TMP512/513 sensor chips.")
> Cc: Eric Tremblay <etremblay@distech-controls.com>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  drivers/hwmon/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 65ea92529406..68f585fc67c5 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -2312,6 +2312,7 @@ config SENSORS_TMP464
>  config SENSORS_TMP513
>  	tristate "Texas Instruments TMP513 and compatibles"
>  	depends on I2C
> +	select REGMAP_I2C
>  	help
>  	  If you say yes here you get support for Texas Instruments TMP512,
>  	  and TMP513 temperature and power supply sensor chips.

Reviewed-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
