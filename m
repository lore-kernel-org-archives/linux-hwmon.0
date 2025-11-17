Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11021121.outbound.protection.outlook.com [40.107.130.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E36B330337;
	Mon, 17 Nov 2025 12:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.121
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763383218; cv=fail; b=gnY+AMIG1DnC6H4V9YXMQ2BF+g8a2leeieYMC3pDTsFqvocXs6AMzVujYJWiAwqfw+OTC6Tu3eYjoQTzpqQAu4DwKX7MSGheF/l4jUjkJJeMCq5IrcMH5vaMJESRNpdOCxCNBWO5NuvRwaFwGQSU32Teh/WukO4Kwf2QPJ36OHg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763383218; c=relaxed/simple;
	bh=HWV6l8E8xLbew1sxl07bk5QWo51FXEodcJUCuVwBHwA=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=jvQWTJPSrZ6gohxCF0UvQwVet9cNv5QjchBJaMvIqxuvIoLuhmQmS0q9y3GPpdTFTFdyS1k/zsK0ee3FDxJ0HKnsaHGbohZ+Knm0gFJBBDEJCEFNW7UIFZk9rnF6AllELpaz3xKXzuqY9NPjF+bgso6fc9gcahl5mq2Ibof4gsQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=becom-group.com; spf=pass smtp.mailfrom=becom-group.com; dkim=pass (1024-bit key) header.d=BECOMElectronics.onmicrosoft.com header.i=@BECOMElectronics.onmicrosoft.com header.b=rwFNze61; arc=fail smtp.client-ip=40.107.130.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=becom-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=becom-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=BECOMElectronics.onmicrosoft.com header.i=@BECOMElectronics.onmicrosoft.com header.b="rwFNze61"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gtsSjCLhxUFKm1AGp4bQ4T9DDY3Z9MkaI3Tv/D01djR3U3X0rCFUoGLuWUHcgeyCWZ8N2sr7cGDYKGoXwkQ239WhHHD52QNjNNMErmuLTti5S+ktTjy/9xZrdYjHlJjHSnneGSja0JywOtLKvUjGY4AjhhsbuIy8LDLn4zYbbJLYv0jvxQqsYY6D0iF95KBQMe2VtUGa8wPR5ERgysTkDquRT3rSXiaZVZ8aZ63C9KfeNN2st/e+d72DK0gOF6k20dLmSgInJx6FB8hZQ6zo9nN/N5LAycUryffXuP0p3jYKkAujqyjZm1qa8tTRnVgeoOY7gHlnwyGY8Sajuj9OHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=neFxRrtmaq6iW0AZRsUMna0HOwdFZhmJrnh0H9p0+rI=;
 b=O//TfSeztOrFsJTuRPgqy64fC9imao/SIv+s4z6qzfKvUGz3XcQky0Ph6nRWXrqLQZLerKiPMqOTavoITHc2I/DpKaeAjCloNjch+zXZUb2dgQaFDzfYf9NDeAbBSSKYtzAYIaWfOpN81nXNzuRg45cxUQ30Giaeo79rJCTo5D/2SPpUj6cQdqAph5rnhs0PJvMzzTwCbfLChOfv7vHL8HeWYFrDgtfLhr8pKE3ExH1ACiKKPd3M19dvW9fpOQwy0poN+KMjzjecv6j/0UCflCito4z0x3/8a+ZIpI6tZ9r8C1L2Fs5tFToKoteL+X3zVKrnLWzUs/yKnGUHOV371g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=becom-group.com; dmarc=pass action=none
 header.from=becom-group.com; dkim=pass header.d=becom-group.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=BECOMElectronics.onmicrosoft.com;
 s=selector2-BECOMElectronics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=neFxRrtmaq6iW0AZRsUMna0HOwdFZhmJrnh0H9p0+rI=;
 b=rwFNze61uKCRNmvG5HOEvLWGlVb12noPkI4rds41nAk5AeR/xA0iqZ3biizzlshQfJHHUI7+2R3ORHZRYr/TbNnIzYHbuA3ZsOrLUOhkp2Cn2I51t+AUx7Hy6l94Qb/TIM0kkSmcyjA6KyNFu0w8c6Bdo8N08Oq6OYIAcj7Un8o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=becom-group.com;
Received: from PAXPR01MB8613.eurprd01.prod.exchangelabs.com
 (2603:10a6:102:232::12) by DBAPR01MB6664.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:185::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Mon, 17 Nov
 2025 12:40:11 +0000
Received: from PAXPR01MB8613.eurprd01.prod.exchangelabs.com
 ([fe80::5ca2:88f2:e3ee:8eab]) by PAXPR01MB8613.eurprd01.prod.exchangelabs.com
 ([fe80::5ca2:88f2:e3ee:8eab%5]) with mapi id 15.20.9320.021; Mon, 17 Nov 2025
 12:40:11 +0000
From: Thomas Marangoni <Thomas.Marangoni@becom-group.com>
To: linux-hwmon@vger.kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux@roeck-us.net,
	corbet@lwn.net,
	Jonathan.Cameron@huawei.com,
	Frank.Li@nxp.com,
	michal.simek@amd.com,
	rodrigo.gobbi.7@gmail.com,
	chou.cosmo@gmail.com,
	wenswang@yeah.net,
	nuno.sa@analog.com,
	paweldembicki@gmail.com,
	apokusinski01@gmail.com,
	eajames@linux.ibm.com,
	vassilisamir@gmail.com,
	heiko@sntech.de,
	neil.armstrong@linaro.org,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	kever.yang@rock-chips.com,
	mani@kernel.org,
	dev@kael-k.io,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Thomas Marangoni <Thomas.Marangoni@becom-group.com>
Subject: [PATCH 0/4] hwmon: Add driver for wsen tids-2521020222501
Date: Mon, 17 Nov 2025 13:38:02 +0100
Message-ID: <20251117123809.47488-1-Thomas.Marangoni@becom-group.com>
X-Mailer: git-send-email 2.51.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR07CA0217.eurprd07.prod.outlook.com
 (2603:10a6:802:58::20) To PAXPR01MB8613.eurprd01.prod.exchangelabs.com
 (2603:10a6:102:232::12)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR01MB8613:EE_|DBAPR01MB6664:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f80f8df-b3e9-466d-ab3d-08de25d672b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YS9VRFU5QWRpa3JPV3ZHT1g5VzRSamxSbDdvNmEzS2I0Y1NnQTJhRVkvdUJv?=
 =?utf-8?B?L2Z0M1dHbzNxR3dTeC95YXRZMXJRQWkyeG4rdnpFYlFwZlQvV2hvYlBwVEk1?=
 =?utf-8?B?VE5IWU9ERDllTXZJcGZjRldPZEkrRUE1aHk5dkQ2RktXN0luN2h2OFJ1ZEtS?=
 =?utf-8?B?a0tUdXNrNTN0d2VGcGZ1eGhkdlNrZjZwOWw0cnlqZ3J1ZXlzdXVjd0VLMFlW?=
 =?utf-8?B?Y1V2MG9SMFVya2hNTnovaWFyK2Y3WEJZeFFoUGJPOWk2REhrajFmMDdCRCtR?=
 =?utf-8?B?K0kyYUt4TDRZZS82NlZSajJkTHRXTDUvN2hnUFlvTE51TlpEQkwxcVN2b2ht?=
 =?utf-8?B?eDdBQ3M4TU1tczRtY2VOeGFxTTQvTjFacnNMQkpaWnd1a294NExHd3U4SWxN?=
 =?utf-8?B?cXhjWVQzdVZ6ZW93MGtzUVJKYXRLU1g0cGxMb1VDMUVlMHJRZk9FMmxrRDVT?=
 =?utf-8?B?TEpiVlZSdmEwdFA0dS9IL0xRVGVYdEFTTExyQTgyK052VGErbFhnVnNGdkVP?=
 =?utf-8?B?ZVZ2a3Y2bGxiemRtUHBoMjFqdzRCRHdMemhrU2Q2SkhCTkhGMWpycGh3UGY4?=
 =?utf-8?B?WHIyL0lDZEpqdm5VK0dhc0x2V0lJUmY4WEJKVEFkNUpTMUNxZHBhOTlDTTBs?=
 =?utf-8?B?alE3U2d1Q2xPc1A5bkJwOVY2OGo2aDFOdmROVEJEKzZsUVBBd2Q2a1pCWkFT?=
 =?utf-8?B?ZnVqbUxSUDl6Y2FHblk5WjNKbHErZExiZ3dwTmdwdHpZMU92eEZHdjIzUENC?=
 =?utf-8?B?MkgxcjI0REVQYmdoa0p4d3R5U09hcEgvV0lHZ0hlcVcwdHY0dWZIN0JIenl5?=
 =?utf-8?B?MzFLTVF1d2kzNFpvQ0lJemYveWpZNDVxTm50N09NK0NQRzNkZlZtdElwQVhL?=
 =?utf-8?B?U2lLTE1Cc2dJbWhnc1NxQ2d2QTdDSUtLdzVzMENCclFnek81N0JMKzdNS21l?=
 =?utf-8?B?Z29oVHVDMEQySm1sbnJiMWxtZ0JuNFlWMmFoc2VtdU5KUFFLbE5RT204ZHJu?=
 =?utf-8?B?Zy8rT0YyWGJsdjNtM05TbHBQL3IrdVlRL0RkK2pNUk8vd05Sa2xKUndJYTRl?=
 =?utf-8?B?dk5pVUhZL3RERWVjVk1iTE8yeFVReWJkS2hlYS9BaFAreW5EZ0dQU0xyWmpG?=
 =?utf-8?B?SjJzdzVLQlo4TG0xcHNGajYyVkp6RE9zcTNLOXN5QllLQkgzY1ZFVEFxZjN3?=
 =?utf-8?B?VGhjOW04SkdzZDFOaVJxTGZUOXJMbkVtdFJMclJJUHFRSkdHK2JGZWFDVjJn?=
 =?utf-8?B?UTVWZGE3ZlN5Rmorc09uSmNBNW8xS2lLNUtMZnNQaHltd3U4VkVLc1NuSVBh?=
 =?utf-8?B?RUIxbGJXNjZoYUNKS3NubmVPY25xSTNxQmZiNnlxWlh4eUh4bzI2cFNkZFUz?=
 =?utf-8?B?UlE1QkdHS2FFWUFCQXhKV0czM0xxUzhyUVFMV3pGTVJNTldoamsxdDdQNVJl?=
 =?utf-8?B?WTBQVFdaeTNIQnRlbE4yNENkRm5jMVlGNnZ4dGgvaDdBUVRmRThYaVlxNjc3?=
 =?utf-8?B?bjJmZlkyQWJsblJTenRxOWtZeHAvZ2YvM3JibjBZeVRmeDlaeFBIZVpqNzYx?=
 =?utf-8?B?SjRaMFFrcmFjOU1nWVNRRWp3NFQzWGZIWjYzWVYrZmFSdGp2RGdLRDFmOGh4?=
 =?utf-8?B?eE5LcU9PN1JWQloxSjlLUk1mODRKMlc2U0lJMUVPKzN2dGlqN1h5Z3BLSXMz?=
 =?utf-8?B?VXhyOW92K0ErMGx5OVRnNEllWnkxcU1NMDNSZkZsT2YxV2hBK01hMmhvQWtn?=
 =?utf-8?B?Y1E0OWNhczE4QTJuQ1RuRG5mMjdiLzVyMEY0QUZZY2Q2R09oYnc4ekpia0Uw?=
 =?utf-8?B?M1BrRUZHZ3BQNFRCNms4bnVrekREbE44Rmd2R0pYSUg0cndhQzhWT2RIMUF5?=
 =?utf-8?B?SXFJd2laYlIvSklqSlNWU2lrQXBnSWozT0JOWVg3VXVYVDhXWGg0Z2QwODlR?=
 =?utf-8?Q?6UUbzN+tWPFK43xCDZp4JyzFsEFIZxyJ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR01MB8613.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Nk1RanN0bmRQekliRm9wbERiQzRBTzZBMExUWERBYmo2THZLVytSN002elZu?=
 =?utf-8?B?bHE5UzArd3k5VHBHY1puaC9veTJvTFRSdFdDa2lLSDZIblhYaDJYM1ZxMktk?=
 =?utf-8?B?T1MrNVVDTWlpcVlobmliclJUU3BxWWpSS09xQlRPRUFFSytKY2Rva0h1S3Yr?=
 =?utf-8?B?NUZrRGFkZVFsMWVjUjYxRFRzZERoSVFhNmdUQ2FIUCsrdFRuaStWZDB6S3Vt?=
 =?utf-8?B?UG82VkhwRmdCbGhtZjY4R1JXZWlqazVwdTRMK3E4TFAyaUVpNHc3dDVYVEt2?=
 =?utf-8?B?Q3gwYVVVbDV3SmpQSUp2NmV3b0xLSFRzRGlBbzFneS81bHBjWnNFL1hkZUV0?=
 =?utf-8?B?Y1YyV3djNGJPRk1VZzRBcitlUzJOYm1EM25RcFh3bElVMVRkdHRXb2YrZGda?=
 =?utf-8?B?c2tIZGNBVXYzZXlRTmd2NkZ3aXI5bmlicHZBTFhSNm9vK3BaL0I4eUI1R1Y2?=
 =?utf-8?B?MFFWLy8zaHlDbnc3WHVoYk83amZoOXQ1SGpNeXF1bWxINnlnbHdWNmhDeTVq?=
 =?utf-8?B?Qm5vZVF2M1BYeFZ5Zk4wbThVSXE1QWlEK3I5ZDY0RHhWa0FQY1RFTzN5eWpu?=
 =?utf-8?B?VFRXUGlBZ3ZKVjBURGVsazVsNytDa3pVY0crN3dPSklhOVc1UnFkMVZVTUU3?=
 =?utf-8?B?dWFsd29TODAvMDBiN1dmaFBHRVluOGlzL0VYdjdhWjI4MHJ1ckZqV3gzWU9r?=
 =?utf-8?B?dU9wbVhQcC9PajdLY2tRTThac2RzZFNSdmZKaXg4MkVvV0VzSldZcFNWNEtR?=
 =?utf-8?B?VUorTlR6bXhzWDZMZHNCRkpBSUUvaFJPRHc3SHhkYVp6RWFhaWg3MWUwQmxV?=
 =?utf-8?B?ZUVIRUZuamU5eFhtanhLQ1VEYTJEdWhiWkxXUUErak1iTTR2RmJwRUxNREp2?=
 =?utf-8?B?eHcvRmtMYmRpRDlGVzgwd09yWHFZZXcyUFZReWFHMFZ6K0kyMCtmR3lDNlIy?=
 =?utf-8?B?YlZsREVncldYQldsRUdyYWIrTFZYTW8yOFNQS1B4L3ZQZUcyeG9zQ1BzS25K?=
 =?utf-8?B?ZnB6djM3cU1VRWdtWWIyS1ovcjlMdnV4Z2M3VDhyVndsRmwvVEh4UUE1cXB3?=
 =?utf-8?B?V2s1UUZrdFVYaWM4Ym1uekg2Mjl2NmF2RXFmVmpLcExsQjZLV2dmdFkraGpt?=
 =?utf-8?B?cUdZWHNPNE84UGd3blBXOTVORnlrU2ptMk5VeWM4TlZRTmNhRzdkQ2dmclMr?=
 =?utf-8?B?WlpoWFk2U1VnQzdVSjVBT3BhSXpyMnJ2V3E1MTJJTzBSTi9SRFF1TmpLMnZ2?=
 =?utf-8?B?TmFQc1Y4dXcwOGdMbkd5MmpRRzdNeWE3VW8yV053N1FscTBMYkFxTCtXQUNY?=
 =?utf-8?B?bkpPOWZEejc0ZHg4MTNJRDFTMDVLZ2xlSjZHT0t3YnFXS2FOOUx5UnBneVlT?=
 =?utf-8?B?RWx3Q2xvc05URlIrdjBOc2V5N1FkQjNUSDdVRHljbFZrQm40ZVphZEZCZ2Rh?=
 =?utf-8?B?bUFUdVV6dDJLZkttMldEdzB3eGhJenZVWHNRdkwyQ1U1UVNSOTVQemY0anFZ?=
 =?utf-8?B?TkRRdk1VNm13a2lxNkc3Y1BjaWttQUtEdVdJUThDWnNPcFd1STZ5RWEvUzZo?=
 =?utf-8?B?SG1COUs0dlhqYjN6YVROYm5kclBZbENSY1RndFk1NGloRVZLaVpBS2pXVGJj?=
 =?utf-8?B?QVdzV3haN0dBeW1ZZVVlMUhnVmFBa2VFMjVwVHB0aU81RmFKYURqSFhBTzd6?=
 =?utf-8?B?RHJVQzZzYmZXN2dXSk92bHcyWHpYMXVpZ05FdWJHVW5ZOUFpM3JzQ0l3N3h5?=
 =?utf-8?B?bEtBTlhTZ0grbUNLdUN4QVR3dVpMMUNzZXRJcUVFTXJRNnloUTN0S2dCS3lt?=
 =?utf-8?B?eVZCTjJjZUFZakprZEV1enFkZkhVV21xV2JZVmp1elJuSEg3d0QrMFROK2Ji?=
 =?utf-8?B?b3FoMXVnUlBzdUFndWZwdkQyTUxVSFVTZGowemt0c3M4Ynd6NkozU2NoemR2?=
 =?utf-8?B?WTR6a29rRUVkSE9aYVlvSHlPa1dFTFptWU13SVk1alhWbHd0UVRDYzhRbzdP?=
 =?utf-8?B?RG4wUXNic0FmbUY2M3p1ejhyZ1BpdXJ4dEo1VUNGSFdoTllma0RFb2JMWTJI?=
 =?utf-8?B?MVlBVEZITkgydWpnYmhMUWJ0c0xxL0w5THQzSUFid2ljeThUd0RDNWZDQjRD?=
 =?utf-8?B?NzN4WlAxTVNPQWkzWS9ldmtQU1UxcXJEMVdDZnJuVyt6cUxRd2RqeGM0QkZk?=
 =?utf-8?B?MXc9PQ==?=
X-OriginatorOrg: becom-group.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f80f8df-b3e9-466d-ab3d-08de25d672b1
X-MS-Exchange-CrossTenant-AuthSource: PAXPR01MB8613.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 12:40:11.2945
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 738f6472-f50a-488c-ab88-c200fd976533
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rCmPQlaYmen7Ase7KrWI8PVBsQiPjTADq7Oiq3u6EaW7Ay3pzcHwfKDalGcfgbDjjUDtT1zkUWkciHSCn1L+urzU0G4sZZe4zwiUHBTX2m0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR01MB6664

This series introduces a hwmon driver for the Würth Sensor tids-2521020222501.

I've tried to implement all possible hwmon features with this sensor.
The patch series is tested again main branch of linux-next and
hwmon-staging.

Note: This is my first patch series, I tried to follow the submitting
guide, as close as possible. If something is missing, please let me
know.

Thomas Marangoni (4):
  hwmon: Add driver for wsen tids-2521020222501
  hwmon: documentation: add tids
  dt-bindings: Add tids in bindings and wsen as vendor
  MAINTAINERS: Add tids driver as maintained

 .../devicetree/bindings/trivial-devices.yaml  |   2 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 Documentation/hwmon/tids.rst                  |  61 ++
 MAINTAINERS                                   |   6 +
 drivers/hwmon/Kconfig                         |  10 +
 drivers/hwmon/Makefile                        |   1 +
 drivers/hwmon/tids.c                          | 560 ++++++++++++++++++
 7 files changed, 642 insertions(+)
 create mode 100644 Documentation/hwmon/tids.rst
 create mode 100644 drivers/hwmon/tids.c


base-commit: 0c1c7a6a83feaf2cf182c52983ffe330ffb50280
-- 
2.51.1

