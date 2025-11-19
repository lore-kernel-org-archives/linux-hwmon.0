Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11022074.outbound.protection.outlook.com [52.101.66.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACFFD358D12;
	Wed, 19 Nov 2025 12:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763556732; cv=fail; b=m/lPI0t2FNQnBb1/U2a+FQTLPNhhpCTNXgMuJqSLV/u7a7DS2gkKAedSn3f5H++7aLWlIJ8RXhLjAt2SeP9JKKJCybBR/Dh7tiUirBton1bshUPgEQJOLeR1KTkdWdqjWIO3QuuJc6SX0WJcN91plqjgbzT735FO4+GQS7q1LsA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763556732; c=relaxed/simple;
	bh=Zoaxh2j3clEXjA77Hbur96y+Q2vOqW3+de/WS5WWWPE=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Rwvmc3BB4ZVMjo0UdJSGliqTTVe5xMeenDNbXvV3b41H3R70cV0isch/jDLCgrfcceKaiyDYawyWy7yeDWujAi2thGTSbTqmTctLKE32mDlaPihhSwnGpIkEZupXI/sTyExGkPJGMdVxvh1QG3Jv3Wc0o0nl1dltlprXP1HPnSg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=becom-group.com; spf=pass smtp.mailfrom=becom-group.com; dkim=pass (1024-bit key) header.d=BECOMElectronics.onmicrosoft.com header.i=@BECOMElectronics.onmicrosoft.com header.b=aAreRv68; arc=fail smtp.client-ip=52.101.66.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=becom-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=becom-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=BECOMElectronics.onmicrosoft.com header.i=@BECOMElectronics.onmicrosoft.com header.b="aAreRv68"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ppxBCdRS4B5t1s8BLqCGrP7uUftZg8EX7bMhsv4A6ciXRx6P2dsJA0ajnYc7rGYSlYnnH99ZjNjoywQ0rxXKOygUZERjPQo07gydOkwo1FB4cdaF8WHXW+Q3Wy2MeGgp8RChe7AZiGP6OirO+v97kL8fEYEsAHB/STXr54ULFdMcY34b8jF/QT6aW8KTBeSg0czBFRToRorxkG2szVlitjgReoCB2a1rONd8HKCM+ApfQpb+hdkHvAmNyDCSmkGFn9dKHzu3P4YJMVO9wDIGnpIF6gf/TS6poL0dwm2wiSYDCSvR+prG0N2Q98O+W60WNFyGvlV4hzUA95Ne65pjZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=14IF1xXukIBpRWu2nj+0JEBmBqhG8O9rhFxJNQ2+12Y=;
 b=tcFkcQ2+A6EGKtxThEM2WVM714o1ISQwxP2sLzji9p6irUvHuBQPyGPshGuSjt1FK98klBBN8AFVEWzQvbmA/idvmKKZwc3+JAyWE/1FD1f3SyKvkqsTO75OlV3lZZ4ZeAZibQwwNRHAJkFX4RAlb/+N6LJXrAebnOSCaaht36vnPmGTiSQHcDXFHLqXzHz8zVRYOqk6dpKctcQzr1jpbqOZbLXm+x/L4Fcm2tnHrCVXVlJ11DuomvYRSiVhs8evmqroz+ci7YLyWsbJ0Oyg0eHHvfc0135oYnEzhkpWHiAJGkw8Li9iTLSHMJwwLjU515ZVMiovtnaTW90OSgONIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=becom-group.com; dmarc=pass action=none
 header.from=becom-group.com; dkim=pass header.d=becom-group.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=BECOMElectronics.onmicrosoft.com;
 s=selector2-BECOMElectronics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=14IF1xXukIBpRWu2nj+0JEBmBqhG8O9rhFxJNQ2+12Y=;
 b=aAreRv684Ww/tQMAp6wR0Q0KhHpx+HBkqKakdtLiTZQyhAX76yKxDL1TV00+IMAidoyMbW4jCjNMADuvdIAD9d6inGOijk5XvX/pIXEBE/fzgjerz/5rgNUCTpXWsNssjZudaYNPRHuLl6NQ0UgPJvjktG+PjSg6fx1C6eRM8G8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=becom-group.com;
Received: from PAXPR01MB8613.eurprd01.prod.exchangelabs.com
 (2603:10a6:102:232::12) by AS5PR01MB12563.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:753::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Wed, 19 Nov
 2025 12:52:05 +0000
Received: from PAXPR01MB8613.eurprd01.prod.exchangelabs.com
 ([fe80::5ca2:88f2:e3ee:8eab]) by PAXPR01MB8613.eurprd01.prod.exchangelabs.com
 ([fe80::5ca2:88f2:e3ee:8eab%5]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 12:52:05 +0000
From: Thomas Marangoni <Thomas.Marangoni@becom-group.com>
To: linux-hwmon@vger.kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux@roeck-us.net,
	corbet@lwn.net,
	Jonathan.Cameron@huawei.com,
	michal.simek@amd.com,
	nuno.sa@analog.com,
	Frank.Li@nxp.com,
	wenswang@yeah.net,
	apokusinski01@gmail.com,
	dixitparmar19@gmail.com,
	vassilisamir@gmail.com,
	paweldembicki@gmail.com,
	heiko@sntech.de,
	neil.armstrong@linaro.org,
	kever.yang@rock-chips.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	mani@kernel.org,
	dev@kael-k.io,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Thomas Marangoni <Thomas.Marangoni@becom-group.com>
Subject: [PATCH v2 0/4] hwmon: Add driver for wsen-tids temperature driver
Date: Wed, 19 Nov 2025 13:51:37 +0100
Message-ID: <20251119125145.2402620-1-Thomas.Marangoni@becom-group.com>
X-Mailer: git-send-email 2.51.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1P189CA0017.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:802:2a::30) To PAXPR01MB8613.eurprd01.prod.exchangelabs.com
 (2603:10a6:102:232::12)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR01MB8613:EE_|AS5PR01MB12563:EE_
X-MS-Office365-Filtering-Correlation-Id: a03b1e9e-faf7-4dcb-9d94-08de276a717f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MTA4ek4zblJSaTd1L2tzclhMR2tPeVBXTHk2dGk4Uk8wT3hpdmplVDMvSDZm?=
 =?utf-8?B?Z1dsWE03MHlRVDN5aFppU3RHYzZ0TVpNbS9qTVM3SXZBaExLWU5HR2x5aysv?=
 =?utf-8?B?Um9hNHVJUE03UG5UZ3JyVllKQWJ1N1hNbk8xTjZsSWZGa2M0d0tpMDJVUEZL?=
 =?utf-8?B?V092bWpOcHpBYUVDY3pLSFNpMWlqQWV5RE5ROHE1Z2pwR1E1THVHMk9ZZ294?=
 =?utf-8?B?YTFnNmtoNXlkTEYrN1p6cEFsT2VQdXF5UXhrY2hUR01tRWYxWVhXbHVRd2Mx?=
 =?utf-8?B?dWtBVUowQ2NaYU84Z3UxcUh4MS9xYjEwUGhjZEZMT3duZXVNaCtDblRmZHdH?=
 =?utf-8?B?L2VqUTBzdkpjdnd5S3hoN1AySHlKWWRCUUNwWWFkb2ZoczUvUjd1dmU0NU1x?=
 =?utf-8?B?M2lVNklZQXQxbUhpeTg5YU9zWFJNVmx2NlRTRUpFcC9ZS0lESXYrZDFESFUw?=
 =?utf-8?B?NGRrcGF1bGRJWXdwdEhOQTJFSFFBekJiSTBDVWtHSXp0ZE5sQXRVcVljVE5Z?=
 =?utf-8?B?VXdFUDl3dXNFUTRVc09CU0toTG9CYTFtTjEzVnlJU1FZczBSNjhoMHNMMWZi?=
 =?utf-8?B?OVRNUlFnZFZCTWQ1QzJHNkRiRldjU2wxQjVJMjhDdHJmc1FUZmxHdmxFTUE5?=
 =?utf-8?B?M3U4a3l5SXVWQUpSbE16MjhVZU9STDQ4T0NKbmtqZGMvQUFxRXdqUFhhUG9Z?=
 =?utf-8?B?SkxqT0FqV2YrYU5zNjdabkdmcWE3RGljc3VmUS9ydTdhYjQwMUdRNXUyVS9s?=
 =?utf-8?B?WTVCZkVJM05ZaEVDK0NMbXZwZEo0d0wrWlY5V3kweGpiZ2dwY29BTjMxT2Y2?=
 =?utf-8?B?OEhEdkVMZStRR1hJcW9GVk5mQVcwZnFlWHpGY1JOZnBMbmpOQ2pTc3JLT1c5?=
 =?utf-8?B?ZnpNek8xQmxJQzY1eVZKbzdDT0JrMzAwTGQrQmd0dEg0eEpZZkpUUGx5N1JF?=
 =?utf-8?B?WWJ0TzlZQk9Hdm5xTDlmN04xcm5zUkI0N0NFS0F5SWtYWEdUK3ZjTTNySmQ1?=
 =?utf-8?B?SVBmYndoT0t3VTVxY2xlTmE3cmR4WXNvcE9zenNPNzBURXFWbmxxMTdYTHVq?=
 =?utf-8?B?OTErYUx1dnk0ZzkyQjhPQjJHeUhtMStHUUsrS29Oa0dNTVBJRUVSUU9CeGRo?=
 =?utf-8?B?RzNvZFU3cjh0dU5OV2JSOUZ1ZU4yck5LeXBUa3JHY3V0Rk93N1lGQ0lORDRC?=
 =?utf-8?B?TnB1c3AzQVpneVVNWGdvVzJKSlNVWldEUEN4dThNWnBBSXo3bmxkRW83WWRX?=
 =?utf-8?B?T3BZZUg0dkhkZFE0bFhzdE1jMnNFT3FFeEdKUkhMN2lZWDZVVm9JcTI1NnVo?=
 =?utf-8?B?c3E3V1I2Z0c4eWNsSTJyeisxbWF6RkRZMjlTSm56alZxSzFUNEhPcFF2Um9M?=
 =?utf-8?B?TU5ib3dKMC9ycVlNVHFvUWtzclpHQWF5TDUvZjd2T3JSbks1SGp0cU5YelJl?=
 =?utf-8?B?NVVicE1makxsRTQrY1dDU3QyVTBmdTdYcHVOZE12WDhFSkFJZG8vREhzSmdR?=
 =?utf-8?B?dWg3eC9TY2pPc2VxUG4vVFlLcGE0b1BnVG9STDFpRkdqMjFKcXhYc1BuMmtk?=
 =?utf-8?B?ZktDcDNKdWpRU3RjSU80YzRBYTZyR0ZuakxxdFd6Z3dhQ1QvUzhQNllraFJ0?=
 =?utf-8?B?OUZHS1ZtbVNDdWY1YXV5cXBiMGdMVlBnNmI3eTFneXJLa0ZRQjR5bndlNlpy?=
 =?utf-8?B?L2xyMWJJZmFGRCtuRVg2MEpqcUZJN0tZL09icFJwSEpsU005L0NMMnNtL3BQ?=
 =?utf-8?B?TW96Njd4dU4vaDIyM1FmUHUrWU5KTXRiN1ZrNVhxSjdBV3hDZ09mVW5JSmk2?=
 =?utf-8?B?djhNejI3Sm9FRkhRUURNSFk0cTVPR0RLUEZyV3lXa2hkZUNDc01wdWpiV0dt?=
 =?utf-8?B?ZlZ6d2V4VXZNdE8wRS9GcjlUTjViNjNmVUFVb2RDMzM2Q2dKS25qdENGbVVX?=
 =?utf-8?Q?nMcWwU6y4Xd2S1uoBcNIeWNJI9ShBJ0D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR01MB8613.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TkU4c20zWkFDdkFXREpSSk5IY3NmZ1lGZTdIV0ZZcDF2RjVnTE90WFcwNkpY?=
 =?utf-8?B?enc2NjNEZWxWbEtGQ0hjNDVqTnIzenhyNEJCQWpIUjJWM2NTN0Y1VWVnN1V2?=
 =?utf-8?B?WDhJZ1JtSWZuS0FaeTVNU0JwRHlvaE02citiRW5FeGN1cmlPL3ZPUDd2bTVs?=
 =?utf-8?B?dno2TTJLS25ySWI2VnBTQzYrMVB0QnFaRytvYklsSVBXcGhrSHZRY1ZCc0d2?=
 =?utf-8?B?MFlpWjFxeEsvQkx3Mk00RzNxdzJuNE41czFkcDg3UENTK0tFOHhUcHROKytw?=
 =?utf-8?B?WFJQK1RFRWdIM0xpaVJHd0xIN0lHWHRDREJjblVKUW85ekFFZ3J0N2VuTWcr?=
 =?utf-8?B?T0YyajVjRVVBRGFxS2hTYkloazJyTUFiYmtsVFRYelBhRGV3OTlQL1lLSEFl?=
 =?utf-8?B?QzZ2VmtSb1FRNGxoVVFRbHhob1AzbHU1WTIyNHcrcTFkSUFOaXIrUmMyMk40?=
 =?utf-8?B?NVBXYTRrS3VWUEtVNDgrT2JTbmJ2aTAyYWlWNW5zWmtodEJSank4K2NGMmZG?=
 =?utf-8?B?Y2c5VEdQc0ExTWdYRnR5SWpheGFLTnNxY3ZvWVU0eHdFb3hpYVpYYWwwSEUv?=
 =?utf-8?B?djNCQVdGVTlWQnJHOU5mc1M0a3NVcXBlUWIzeTJIb1IxMHBoaDhRMzUvYXhk?=
 =?utf-8?B?b2kwY3lSTUdVZ0tFS285YVEwcUh4empxK0xIeTZXeStzdFVKYWExRDVCNC81?=
 =?utf-8?B?SkxYZU85aUNNSWdNMHdQUitIUE93cHZVRGVoMndSVUJqYnAxdlVPL1FvYjUy?=
 =?utf-8?B?anpsQThjZkxXT1JrbzdrOXBqb3JXc0ZUcjAvYmZXZ2J1U0hLa3JWTEJLb3RI?=
 =?utf-8?B?akNCU3h1bUhqM3pBcWp5MWUxajlqSUtvQnNYbm1EQ1NOQzFDOHoxeG9WMk4w?=
 =?utf-8?B?S045UmoxZlgxNlVqU3UvU2YwZ2pYazE1dXBPSVpnMEJsWmtuQ1hEYlY4czA2?=
 =?utf-8?B?S1dkNkZhbmdTdStBeFllRUM4VVZqaEtGamsyV2d5SENoWGZhRG9CbUhJKytS?=
 =?utf-8?B?MjlvV3JlYm5rSXdZUGhmQVdQeXFzOE9LclJ5QnpITGlZMG9yM2I0ZTU5Rjdh?=
 =?utf-8?B?bXN1eTBwWnlTUkhZTkNuM0hvaXpRKzJQeE15V3dHcVE4NS9QWDZyYUdDNE5G?=
 =?utf-8?B?aGRXZ0o2M2FaS3d3Vms4RlhXSUJQTE1NNFkvTEdReUQyNEt0RTUrWTRROFRS?=
 =?utf-8?B?TUtqOTh5c0JnMzcxeGhVRFRSaHkxTUNNdVZMNVUyVHQrUWJFUzNsL2ZmaFA5?=
 =?utf-8?B?WGE5ZU1tcWttT1NBRFpGVW92SmNkRndFanB0bjdBOE5wRGF4UXI5b1lSQ1RB?=
 =?utf-8?B?ZllvYThhZEEwUytYSkNNUFM1cnQ1TGhjZ3dPYUFHNlpzQTVJN01IWWNoQ2pH?=
 =?utf-8?B?UTB6b0FWQlNnY1orU3hEcHUwQUZHd3BRRlY3eTltTERZUTdMUDdNK2VsNVph?=
 =?utf-8?B?NWZBT3hmWEVubWpPRUU0V3NySitobWJOazB3RHBlTWg0aU1tVjRXYmxQTWxK?=
 =?utf-8?B?SEgvYmpKTGJ2VGZqaUdBNHprbDNyRzNPK0tVbnMzQ281N2lHUVJoc3hraGJV?=
 =?utf-8?B?YXRad0d6N1ZzY0hCV0lhQTVna2Q4ZGtIcy9NOTBEZGF1QUtwU0ZZaDFXRGhm?=
 =?utf-8?B?OTZCT29yaml1NzN6UCtkMGFXNjIwb2NrbWhIdkRWTkc4djU5OGtQaXZOKzg3?=
 =?utf-8?B?ek5BRWxEcVhjaWlBVnZLVWZRYjNBUXZZMlg5dlJHVU9DeEFkNjNGdjZzMGhn?=
 =?utf-8?B?dGNJVG9ybXhCRXhNZzhyTE5GWmwxY2ZsaGZtcTJ2Nm01S0hNZXRVVTdGaVox?=
 =?utf-8?B?YWRCNWkyZ0d6bytNMm93REh2VGRJd3NDUzJVbTNlU0pnUTFnbUNaRXdhU3lB?=
 =?utf-8?B?ZEgySXpRZ0g5QXNsUnlvVmZ1N3F4aE9tQXJjUkI2TjJrK3FQRDJYQU00YXJr?=
 =?utf-8?B?cWw4c2tmMlNXL3dOVFo4SGJzZ0tkcTB1M1ZJdzduSGQrOUQvUDZ2eXE2Qi9V?=
 =?utf-8?B?SitRODhnZWMzL244ZFdSem50bzNuSjdLdnMxM3l1RmNwWlRkVUlDTC9oRTJo?=
 =?utf-8?B?bi9PNmlxSEpzQXFDbXd2b0JaOGpla2dma1VvY2VrWVJScnhJNngrdjBsK2FP?=
 =?utf-8?B?czZrWmloVUdGWnpBMTRLYm9ZZmVmVEkwTE16dURBSWZtdFkxU2IrejRSQjAv?=
 =?utf-8?B?Qnc9PQ==?=
X-OriginatorOrg: becom-group.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a03b1e9e-faf7-4dcb-9d94-08de276a717f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR01MB8613.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 12:52:05.8322
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 738f6472-f50a-488c-ab88-c200fd976533
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JTjJ8a2JYriEglQt+cIz5twe6VSbVfJWWdE0t1Uft3Jofqd2SA2voAaiRSVj5/Y+GFq32OkpGjjJyiHwZj+KAx+3c6WwhYvktYcQps6AR/s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR01MB12563

This patch series introduces a hwmon driver for wsen-tids temperature driver.

Following hwmon functions are supported:
- HWMON_T_INPUT
- HWMON_T_MIN
- HWMON_T_MAX
- HWMON_T_MIN_ALARM
- HWMON_T_MAX_ALARM
- HWMON_C_UPDATE_INTERVAL

A register dump from the device with i2cdump:
     0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
00: 00 a0 00 00 4c 00 80 0c 17 e0 00 00 00 00 04 00

---
V1: https://lore.kernel.org/linux-hwmon/20251117123809.47488-1-Thomas.Marangoni@becom-group.com/

Changes since v1:
- Reworked regmap fields to regular regmap functions
- Reworded documentation
- Replaced temp_min_hyst with temp_min function
- Replaced temp_max_hyst with temp_max function
- Renamed tids-2521020222501 to tids

Thomas Marangoni (4):
  dt-bindings: Add trivial-devices for WSEN-tids temperature sensor and
    wsen as vendor-prefix
  MAINTAINERS: Add tids driver as maintained
  hwmon: Add driver for wsen tids
  hwmon: documentation: add tids

 .../devicetree/bindings/trivial-devices.yaml  |   2 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 Documentation/hwmon/tids.rst                  |  61 +++
 MAINTAINERS                                   |   7 +
 drivers/hwmon/Kconfig                         |  10 +
 drivers/hwmon/Makefile                        |   1 +
 drivers/hwmon/tids.c                          | 447 ++++++++++++++++++
 7 files changed, 530 insertions(+)
 create mode 100644 Documentation/hwmon/tids.rst
 create mode 100644 drivers/hwmon/tids.c


base-commit: fe4d0dea039f2befb93f27569593ec209843b0f5
-- 
2.51.1

