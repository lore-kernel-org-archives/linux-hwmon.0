Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11022074.outbound.protection.outlook.com [52.101.66.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF1A73612DE;
	Wed, 19 Nov 2025 12:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763556742; cv=fail; b=o6OC2ITC5tnUV7IzD9fTvFjQtB5RGX7d+5b8iJBIcV5h17lqfQG987RxkYE8/jbh8IOAuuf4Tnc04ma0bi6joZjtYzZ0Dk3udpU8LEbNJZxCFqUGg9547qbuXl1cbY8kSkN70jCwGPXOvgqcHjF2l2nvcvkNOL7qRAMM4CT8K0I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763556742; c=relaxed/simple;
	bh=qnRLggetnzdZxAgZL9UYYJvn0dMNpDHD4bfRHbuiiuA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aF+uuPHrRaV4Az3rua7zOCalbKxeSb985rxR/XHVJoc9iDS2VY25o9bBVnyxpHAqSsnzPfhXS43hp6JByqQDUai/HajyNNFL1Fybv56++cq+XNL+pevIm9UCOv1SUp+UY3X8LriPxutrq6wHNNwUzZblfeLS6yBzVgtC+4hQfJs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=becom-group.com; spf=pass smtp.mailfrom=becom-group.com; dkim=pass (1024-bit key) header.d=BECOMElectronics.onmicrosoft.com header.i=@BECOMElectronics.onmicrosoft.com header.b=gD+GdQ6D; arc=fail smtp.client-ip=52.101.66.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=becom-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=becom-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=BECOMElectronics.onmicrosoft.com header.i=@BECOMElectronics.onmicrosoft.com header.b="gD+GdQ6D"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S95acKw/pUnzk63nUBtqW6+L1dfcTJvYUo9Ypqnn/DtCN28qSmEWbMnSxotdciWfGtF3gdOpciaqsHbN4/YBKDKN3+59X1j0Q/XGLq4N3LTfM1V1Oxiog2Y71XqxxYoVvgR64Z5eh+vMCr4GQd7po8kEKWvvZcABKGXIG6I7doindN49vimu+3oDJ3lwFeuohMH2aSqnDL1c2Rf2bR3M5enVL8czc6L/u3vDG/eGT8KY6b96CzuOae1dD35zSrjOIktDh92G+JKkpVpkw3gmG8lyE67x1LaT7ugtHstOAAGYxKdFjZbwd7HD0qgL+D/V0EuoXjVHgtV5lPf5BpBIaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/hMjuo+5t/07LqZxjro2VFn8DHIlyB042fa3ZW6Z0CY=;
 b=IA1CP8zhllVjVApsao36VcyK0zittVCsvqQI62lIBjsw1Rb4cuXdkuIXcwRQTTCW1yVvOHHhk0kPlCpY3QggAdt10ynzYwtFIJslda8whRmKwKLLspBRB4ZqVqv+DZurty6bJOGbD+uIXnCaTRVrSVAWtksGK0N1XUHcfOE0+v5dY3StvmHzxVUL13sPECHquIB2olu9qzpUCmdnzQvYhDANaJ9oKrzOl4ye1wpGAa5flNn9RX05JjabuedKNLlZ4qyr9eKufgDXf/QCZNuQqH0Bla/YlyUU4Os9ObiHxnjnNeNepqECD2P4rLDwlox4w8MhWNK4OkiU0OaVt5vpfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=becom-group.com; dmarc=pass action=none
 header.from=becom-group.com; dkim=pass header.d=becom-group.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=BECOMElectronics.onmicrosoft.com;
 s=selector2-BECOMElectronics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/hMjuo+5t/07LqZxjro2VFn8DHIlyB042fa3ZW6Z0CY=;
 b=gD+GdQ6Di+x5YB56LEBZeumHXt9LzmKpiwnTlemVxzZjqC2+HFm71Tze8bP5qWfey3kIKUuYAPhgv4pl+C+jdzdNGatPKa8XOABIpxltCweVQBnqf5meCHgpM/XimSPVePWR1pMzVhmPbuM67xiSJB6LppA3Duqvv6lhNs8DMbM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=becom-group.com;
Received: from PAXPR01MB8613.eurprd01.prod.exchangelabs.com
 (2603:10a6:102:232::12) by AS5PR01MB12563.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:753::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Wed, 19 Nov
 2025 12:52:08 +0000
Received: from PAXPR01MB8613.eurprd01.prod.exchangelabs.com
 ([fe80::5ca2:88f2:e3ee:8eab]) by PAXPR01MB8613.eurprd01.prod.exchangelabs.com
 ([fe80::5ca2:88f2:e3ee:8eab%5]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 12:52:08 +0000
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
Subject: [PATCH v2 3/4] hwmon: Add driver for wsen tids
Date: Wed, 19 Nov 2025 13:51:40 +0100
Message-ID: <20251119125145.2402620-4-Thomas.Marangoni@becom-group.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251119125145.2402620-1-Thomas.Marangoni@becom-group.com>
References: <20251119125145.2402620-1-Thomas.Marangoni@becom-group.com>
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
X-MS-Office365-Filtering-Correlation-Id: 62673705-6fca-4154-0ffd-08de276a72d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RDNJR1dNMjNnYlJObFZ4cmJzZ2UrUVk4N0VwZW1DcEpmMDV3TGdETWFuWm1Z?=
 =?utf-8?B?U0VVUVlYZWRnQWN5djhwd2hzQkNFTTZYUlFsN3RwTXdyK1VHbThXWVBkMzM1?=
 =?utf-8?B?SUVETkVKazdvMjRRRHFkdFVNdkdHbEJXUzhNUFl4QkM3M3FTSTBmSFA2OUo1?=
 =?utf-8?B?Q0NUeHprdnZ5bEN3UzlQOEdIMmRNaXo1VDkzeUdiNVAvSW9qMVRlNEJpZStE?=
 =?utf-8?B?ZzFoTStXdkppdnVXZDNlK08yNnY2V09RRVlIeUlxcWdHK3VHL2dDMVFJQzF6?=
 =?utf-8?B?U0JJaWNkY1lEOXYwQmlnSmRxOVlPNkZTK1pqSUd3ZEIvbVdPWCtON0F5YmJt?=
 =?utf-8?B?NTJNdHZMYzQzN3ZGQ3FoRlhzNVhhY3hHVlVVY0ZvNkhZZ1V1dHdLaytQNXZi?=
 =?utf-8?B?TUk3ZEdzcWRRdGhheXQ5SENVVGpvcVBPQUFGczJXQXpxWDRnN21OZnhPd2Ra?=
 =?utf-8?B?dHo3a2JrMkFxOWxFK0Z4eXY0cW5hZERnUEpVTndaalF5N1gyeUlnZzNaQ3hV?=
 =?utf-8?B?TVloSDI4SWFacmlqVWxWcGVOS3AreE04Mnh3dEQzM0xBS2Z2K2hMTkU0MTY1?=
 =?utf-8?B?V2E4WVVOajNsaHVUNUFHaXhqNjdDOHNhOGt1TDVVd3I1aEZUNGdlQUJKRFlU?=
 =?utf-8?B?L21yV2lLT3h1S2Y1QVEzRFhlZFRDcENGYStuYzFmU1F1ektFZEVrR3N2YzVy?=
 =?utf-8?B?MXJ3WGljSkRhczV2VDJGdjFtUWtOYkVPWjRyemNObUZoY1FXbHNjdGtGRGlo?=
 =?utf-8?B?ck1Rd3JZOGJ0Njh6T2xYcUFmb1dnK25VVHE5YTN3NTZtWW1xUWJuVWJtSDcx?=
 =?utf-8?B?a0MwenF4ekcwMjZwYzQ5dXZhVGtYYVpUd01hSGlNNGowQkVoQVh2eXZ6UTlG?=
 =?utf-8?B?S3ZyNzcrR3dYSHNDbElOZG1XUEpqak82bzhhTUtoNmcycHJLaVV6eDlhUEhz?=
 =?utf-8?B?R0E2eXZVYzZzVWQvODFFNUdVVFl5WjllcDhDaDhqYW8xWGpXcU1pRXhoZ1VJ?=
 =?utf-8?B?TUxGcytiUEZtaWNTVFJiUkhjcUw5eDduZlpWRGhNTSthU1NEd3p0cm9xNDdz?=
 =?utf-8?B?bHZzVFZuejRkRUJSdjZMU3lZYWEyRUdjL1lXUHB2UklMUGdXa0piMGg2cHJn?=
 =?utf-8?B?TE4vdVVhNDFoMWtnS2hJUGJXMk02czhDcjNEVmJtWHlQWlU5VXZDTTBiRTBn?=
 =?utf-8?B?QjcycHdBVEYxakZoZG00ZjlQZXdMLzdxc3FwdzhYRjdkdTYzUkY2VGQyU2hP?=
 =?utf-8?B?Y0lSdnV0WHhmMlRqVlNiSEhVejU4dndiejdCVitrNm5zMXM2ZmlVSnRkMG1O?=
 =?utf-8?B?dklUOXpjdmVPNFlMQk5sQVBVUmp2bmtZOUUyb0VGRDB6bUY2S0FTYWlHa2pp?=
 =?utf-8?B?QXlMcnF2T0JaS3NldlFVbXdKaVhJTDJiYWh6MWNlK1NYUEs0N1gzNTNqdmRx?=
 =?utf-8?B?QVU4ekpKSVFKWkR3cnNOcGo4L1RpRXJzYXh4QldzeEs2TWNNYWxLUlViajhs?=
 =?utf-8?B?cGJTd21ScXhIaXk4bkNIc0R6L2FEOVpwTFZYQXhob0lmekw5dzJGR1hidHEy?=
 =?utf-8?B?MTZzWHY5R3pmTVdqN3FmaGdpSW1IU0tJUFVGZGdWaG15cU85cW96cFZTTjBB?=
 =?utf-8?B?TUkxN2IxcFVkTUdhVytWZVVxaHB2ZjIwbDRUd2JzQ2UrMUVZb082dDFZeHQ5?=
 =?utf-8?B?ZVVvRUJhTE1McG1nWG9aZC9mbGJNT21udENMaWs0UjduZ3FablkrN0IwcGZw?=
 =?utf-8?B?WG5GUm0rZXZVVE9abGMxdXNDMnBsK3ptalNxbC9mL3diVGJIRGJyTzVUbVVx?=
 =?utf-8?B?bzAwbzRVLzZtOHZWc29YRTdPWDRVcEs5REJrNTFrYWdMKzEza1VRdngzYmpF?=
 =?utf-8?B?bEpyb3lMcGlZbjJuMktiSGdoYmRwRTF4Wkhhekl1OWZVZkIzckl3NWZJckpm?=
 =?utf-8?Q?v5rl3czyJk2ES7IwCkVH8XB4AJyBteYg?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR01MB8613.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d0dsQm1PdEpzVHRkblR2YnNham9VbjNLQmQ4cHlqMFE4K0tpK2dsb0RDV1V4?=
 =?utf-8?B?OHVrNjFmdXV1NVNkVHpLWFNtMDFBaEQ0d2ZTb3FueXZuakh2SWtoenZPTUZU?=
 =?utf-8?B?b2J0TGFqd0YvVzhyeE0ydzJpb3lLS3dwQUJZbHNTTytMUzNVZ2dnd1JoQXp3?=
 =?utf-8?B?SmNENUJvS2xSR0lFcldXd3ZaV3BOM3JONmJiMFo0dUUxeFMydGlOZElLN1k0?=
 =?utf-8?B?SHAwc3VHSzd6VUw4emNmVmROanZCK0wxUE1lb2JSV2Y5dEx5WU1kbTBEcWMy?=
 =?utf-8?B?WGkrL2ovVE5qa0Z1UTIvL1F2eStaM2ZQalNLVG04M29sSG9BOTNXcHV4aWFr?=
 =?utf-8?B?NjdFZm9xa2IwRzVucjVkMlRTdEJoUy9QT25ZcnVxb2dXVm0xSzIyMzhkd1lF?=
 =?utf-8?B?MU16RThiNmhUbWN4OEFlYy9GdWIwaFJWMm04ejBtZE4yNUJCbmgzWEdxUkVm?=
 =?utf-8?B?OXV3WEJEQkVXemlzNTBIR1VKSTQvTzJSa3d2cFBkbkdnVld1UXBGeXlaQTBF?=
 =?utf-8?B?NmNSUW5yS2thZXdqQUo3SDBNUFF5UzVpQkVnNHh4MTBPT2RYYzFTWW1SaXRv?=
 =?utf-8?B?QTNDanZxMEFxUkluaUNRQXM4cHRIRVFMK2VVdzNGTm9uS0hWQmlKWkV5UmVM?=
 =?utf-8?B?OTkwOU14S3U2UUhOOGZWRHByeHdYRVU2RlBEYjZyZXVkYk5Od0hQNS9tdUNk?=
 =?utf-8?B?aGMvVmt0U0tGMHhOajQ4c09oRWZCYUlWUFdJSTFHVXY1Y3F3RWJrUmcyd0ZN?=
 =?utf-8?B?dS9aRG1EMG1QckVteWlPcTMvMjB3RVI0VC9pQlhyZTRINGtTdHZQNGZxVDFQ?=
 =?utf-8?B?MVNqL3hOUHJsdDdTYnBydlZZd2lpQW1QeWYvZ292b0RrMkZxL2NjU01WcmZR?=
 =?utf-8?B?RUtCYzEyTE5aS0pYT1NKcDZBcHVtMkRnRE1MbHp0b0ZaemIwRDc2U0xuK2NX?=
 =?utf-8?B?NXovUkNOZzcxTmo2S3E3ZTErV0M1K2thSWorRmxFSGxwc2VMWC9iaHIwaVo0?=
 =?utf-8?B?ZDd3dXBUekFsREFqYXRVaXFUSW1sZTJrd0NVWG5EL1BQZW93dlVhc1NrVmlk?=
 =?utf-8?B?RWM3NEFLellCVEVqR3d0dVpwUUViYzdQVnBiMk1rZ09pbG5RQjUxV3VaT2NI?=
 =?utf-8?B?ZEMyWTdsZVVQTFBlMjB5cE9aWU91MzVpeTVSZExkSHZvaTA1dTA4b0I2ZGlp?=
 =?utf-8?B?Zi8zVkRtTVZTWlh4V1RlZCszYldJV3IwZEpvTDVhZUxydkRQUytMaFdHdDAr?=
 =?utf-8?B?TldKekIxelJueEI3WDFlNm5CRmxRS1VDZmlFRVFBbk5keEIwaUNESk4xL28y?=
 =?utf-8?B?WVVOWWdDK3dZcmNDeStWN2d5UWo3Q29rRkR3TkdxbFVhaW5YS0pqRFFVd3lC?=
 =?utf-8?B?NWpyUkZOaS91L2IzYVNyZmV5WWNnN3Z1WkgwekhlejVDaGNDWm1DZDRZSitl?=
 =?utf-8?B?ODk2bHFEcjFJSDVRTUxqbG90NHBzNmh2UWY4QzJPdDgrWmU4NWg3MjNTeEF4?=
 =?utf-8?B?WlZXcUg0aGxHZUJQd3FvTFlwcG1TVFNBWW5UUnd6ZVNuM0diOEs1TVlIU0dJ?=
 =?utf-8?B?Q2dQbVo4RGk1VWRSNFZvd3k5YU5mK09KOTV6bEFuSmpuR2JyTVlVS2hYbnZx?=
 =?utf-8?B?Lysxd1A1T1V3eEQvVEdvNk0xbGZhb1lQM0o3aHB6Skl5dVpmcnhXTVBJSzY0?=
 =?utf-8?B?RE9lZ21vaktTZGkrM2lrNmdNZjQwZEZnTUEwcGhrZVdkN1VoalI5b2pNaTV0?=
 =?utf-8?B?enIrcW12VlFsek9HclVvNThVWFN1VVN4b1dkMGtyTlJOUXIrbTVXMlVBZVBE?=
 =?utf-8?B?Z3hiTitkWHdBdGx2TTVBWm5Mb2dFZkhSSE5PbWRCRkYwNmI0TC9lVVpVSkJH?=
 =?utf-8?B?QmpqcTJseVJtSDNPdEZ5dFQzc3dkNjNnTitFRGp0dlJOZ1dvaThFU1JDVnhn?=
 =?utf-8?B?bG9XakZ0TkNwTW5GUGZHUDdnNitBRklNUFRiTzhyQm83TElTb1VaSmtkbUpT?=
 =?utf-8?B?S3V5cTdDeklSNW0vdGplRzF2R0J6bHMvVUdmbmxxTk83Z0JmREx2MFlmU0x4?=
 =?utf-8?B?aTg2VTkvZW5pRlJjZUswNENMWHhOOHgxeWd4WE5zSG1oN05CSXZVVXJGU1Zt?=
 =?utf-8?B?T3QxcGpNSC9BTm1pSE1TdDh2NitVcFFiRGtNaE5kdEdBVVJCM3V1VG1qK0Vs?=
 =?utf-8?B?dGc9PQ==?=
X-OriginatorOrg: becom-group.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62673705-6fca-4154-0ffd-08de276a72d4
X-MS-Exchange-CrossTenant-AuthSource: PAXPR01MB8613.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 12:52:08.0824
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 738f6472-f50a-488c-ab88-c200fd976533
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3ZBwrynOpbDPFPhBI38trmSuCK55gQGXbQC5YqdASPyKc01U0PYLjBKgISKyb4kDexWFXfBLCKEZsTt2qbgUl5DNwQgJatSfoZUHpAxIWeU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR01MB12563

Add support for the wsen tids. It is a low cost
and small-form-factor i2c temperature sensor.

It supports the following features:
- Continuous temperature reading in four intervals: 5 ms, 10 ms,
  20 ms and 40 ms.
- Low temperature alarm
- High temperature alarm

The driver supports following hwmon features:
- hwmon_temp_input
- hwmon_temp_min_alarm
- hwmon_temp_max_alarm
- hwmon_temp_min
- hwmon_temp_max
- hwmon_chip_update_interval

Additional notes:
- The update interval only supports four fixed values.
- The alarm is reset on reading.

Signed-off-by: Thomas Marangoni <Thomas.Marangoni@becom-group.com>
---
 drivers/hwmon/Kconfig  |  10 +
 drivers/hwmon/Makefile |   1 +
 drivers/hwmon/tids.c   | 447 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 458 insertions(+)
 create mode 100644 drivers/hwmon/tids.c

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 157678b821fc..2737350bb661 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -2368,6 +2368,16 @@ config SENSORS_THMC50
 	  This driver can also be built as a module. If so, the module
 	  will be called thmc50.
 
+config SENSORS_TIDS
+	tristate "TIDS"
+	depends on I2C
+	help
+	  If you say yes here you get support for the temperature
+	  sensor WSEN TIDS from Würth Elektronik.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called tids.
+
 config SENSORS_TMP102
 	tristate "Texas Instruments TMP102"
 	depends on I2C
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index eade8e3b1bde..4eb77be3df67 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -227,6 +227,7 @@ obj-$(CONFIG_SENSORS_SY7636A)	+= sy7636a-hwmon.o
 obj-$(CONFIG_SENSORS_AMC6821)	+= amc6821.o
 obj-$(CONFIG_SENSORS_TC74)	+= tc74.o
 obj-$(CONFIG_SENSORS_THMC50)	+= thmc50.o
+obj-$(CONFIG_SENSORS_TIDS)		+= tids.o
 obj-$(CONFIG_SENSORS_TMP102)	+= tmp102.o
 obj-$(CONFIG_SENSORS_TMP103)	+= tmp103.o
 obj-$(CONFIG_SENSORS_TMP108)	+= tmp108.o
diff --git a/drivers/hwmon/tids.c b/drivers/hwmon/tids.c
new file mode 100644
index 000000000000..62e778202a5f
--- /dev/null
+++ b/drivers/hwmon/tids.c
@@ -0,0 +1,447 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+/*
+ * Copyright (c) BECOM Electronics GmbH
+ *
+ * wsen_tids.c - Linux hwmon driver for WSEN-TIDS Temperature sensor
+ *
+ * Author: Thomas Marangoni <thomas.marangoni@becom-group.com>
+ */
+
+#include <linux/util_macros.h>
+#include <linux/regmap.h>
+#include <linux/minmax.h>
+#include <linux/hwmon.h>
+#include <linux/bits.h>
+#include <linux/math.h>
+#include <linux/i2c.h>
+
+/*
+ * TIDS registers
+ */
+#define TIDS_REG_DEVICE_ID	0x01
+#define TIDS_REG_T_H_LIMIT	0x02
+#define TIDS_REG_T_L_LIMIT	0x03
+#define TIDS_REG_CTRL		0x04
+#define TIDS_REG_STATUS		0x05
+#define TIDS_REG_DATA_T_L	0x06
+#define TIDS_REG_DATA_T_H	0x07
+#define TIDS_REG_SOFT_REST	0x0C
+
+#define TIDS_CTRL_ONE_SHOT_MASK		BIT(0)
+#define TIDS_CTRL_FREERUN_MASK		BIT(2)
+#define TIDS_CTRL_IF_ADD_INC_MASK	BIT(3)
+#define TIDS_CTRL_AVG_MASK		GENMASK(5, 4)
+#define TIDS_CTRL_AVG_SHIFT		4
+#define TIDS_CTRL_BDU_MASK		BIT(6)
+
+#define TIDS_STATUS_BUSY_MASK		BIT(0)
+#define TIDS_STATUS_OVER_THL_MASK	BIT(1)
+#define TIDS_STATUS_UNDER_TLL_MASK	BIT(2)
+
+#define TIDS_SOFT_REST_MASK		BIT(1)
+
+/*
+ * TIDS device IDs
+ */
+#define TIDS_ID 0xa0
+
+struct tids_data {
+	struct i2c_client *client;
+
+	struct regmap *regmap;
+
+	int irq;
+	int temperature;
+};
+
+static u8 update_intervals[] = { 40, 20, 10, 5 };
+
+static ssize_t tids_interval_read(struct device *dev, long *val)
+{
+	struct tids_data *data = dev_get_drvdata(dev);
+	unsigned int avg_value = 0;
+	int ret;
+
+	ret = regmap_read(data->regmap, TIDS_REG_CTRL, &avg_value);
+	if (ret < 0)
+		return ret;
+
+	avg_value = (avg_value & TIDS_CTRL_AVG_MASK) >> TIDS_CTRL_AVG_SHIFT;
+
+	*val = update_intervals[avg_value];
+
+	return 0;
+}
+
+static ssize_t tids_interval_write(struct device *dev, long val)
+{
+	struct tids_data *data = dev_get_drvdata(dev);
+	unsigned int avg_value;
+
+	avg_value = find_closest_descending(val, update_intervals,
+					    ARRAY_SIZE(update_intervals));
+
+	return regmap_write_bits(data->regmap, TIDS_REG_CTRL,
+				 TIDS_CTRL_AVG_MASK,
+				 avg_value << TIDS_CTRL_AVG_SHIFT);
+}
+
+static int tids_temperature1_read(struct device *dev, long *val)
+{
+	struct tids_data *data = dev_get_drvdata(dev);
+	u8 buf[2] = { 0 };
+	int ret;
+
+	ret = regmap_bulk_read(data->regmap, TIDS_REG_DATA_T_L, buf, 2);
+	if (ret < 0)
+		return ret;
+
+	/* temperature in °mC */
+	*val = (((s16)(buf[1] << 8) | buf[0])) * 10;
+
+	return 0;
+}
+
+static ssize_t tids_temperature_alarm_read(struct device *dev, u32 attr,
+					   long *val)
+{
+	struct tids_data *data = dev_get_drvdata(dev);
+	int ret;
+
+	if (attr == hwmon_temp_min_alarm)
+		ret = regmap_test_bits(data->regmap, TIDS_REG_STATUS,
+				       TIDS_STATUS_UNDER_TLL_MASK);
+	else if (attr == hwmon_temp_max_alarm)
+		ret = regmap_test_bits(data->regmap, TIDS_REG_STATUS,
+				       TIDS_STATUS_OVER_THL_MASK);
+	else
+		return -EOPNOTSUPP;
+
+	if (ret < 0)
+		return ret;
+
+	*val = ret;
+
+	return 0;
+}
+
+static int tids_temperature_minmax_read(struct device *dev, u32 attr, long *val)
+{
+	struct tids_data *data = dev_get_drvdata(dev);
+	unsigned int reg_data = 0;
+	int ret;
+
+	if (attr == hwmon_temp_min)
+		ret = regmap_read(data->regmap, TIDS_REG_T_L_LIMIT, &reg_data);
+	else if (attr == hwmon_temp_max)
+		ret = regmap_read(data->regmap, TIDS_REG_T_H_LIMIT, &reg_data);
+	else
+		return -EOPNOTSUPP;
+
+	if (ret < 0)
+		return ret;
+
+	/* temperature from register conversion in °mC */
+	*val = (((u8)reg_data - 63) * 640);
+
+	return 0;
+}
+
+static ssize_t tids_temperature_minmax_write(struct device *dev, u32 attr,
+					     long val)
+{
+	struct tids_data *data = dev_get_drvdata(dev);
+	u8 reg_data;
+
+	/* temperature in °mC */
+	val = clamp_val(val, -39680, 122880);
+	/* temperature to register conversion in °mC */
+	reg_data = (u8)(DIV_ROUND_CLOSEST(val, 640) + 63);
+
+	if (attr == hwmon_temp_min)
+		return regmap_write(data->regmap, TIDS_REG_T_L_LIMIT, reg_data);
+	else if (attr == hwmon_temp_max)
+		return regmap_write(data->regmap, TIDS_REG_T_H_LIMIT, reg_data);
+	else
+		return -EOPNOTSUPP;
+}
+
+static umode_t tids_hwmon_visible(const void *data,
+				  enum hwmon_sensor_types type, u32 attr,
+				  int channel)
+{
+	umode_t mode = 0;
+
+	switch (type) {
+	case hwmon_temp:
+		switch (attr) {
+		case hwmon_temp_input:
+		case hwmon_temp_min_alarm:
+		case hwmon_temp_max_alarm:
+			mode = 0444;
+			break;
+		case hwmon_temp_min:
+		case hwmon_temp_max:
+			mode = 0644;
+			break;
+		default:
+			break;
+		}
+		break;
+	case hwmon_chip:
+		switch (attr) {
+		case hwmon_chip_update_interval:
+			mode = 0644;
+			break;
+		default:
+			break;
+		}
+		break;
+	default:
+		break;
+	}
+
+	return mode;
+}
+
+static int tids_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
+			   u32 attr, int channel, long *val)
+{
+	switch (type) {
+	case hwmon_temp:
+		switch (attr) {
+		case hwmon_temp_input:
+			return tids_temperature1_read(dev, val);
+		case hwmon_temp_min_alarm:
+		case hwmon_temp_max_alarm:
+			return tids_temperature_alarm_read(dev, attr, val);
+		case hwmon_temp_min:
+		case hwmon_temp_max:
+			return tids_temperature_minmax_read(dev, attr, val);
+		default:
+			return -EOPNOTSUPP;
+		}
+	case hwmon_chip:
+		switch (attr) {
+		case hwmon_chip_update_interval:
+			return tids_interval_read(dev, val);
+		default:
+			return -EOPNOTSUPP;
+		}
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static int tids_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
+			    u32 attr, int channel, long val)
+{
+	switch (type) {
+	case hwmon_temp:
+		switch (attr) {
+		case hwmon_temp_min:
+		case hwmon_temp_max:
+			return tids_temperature_minmax_write(dev, attr, val);
+		default:
+			return -EOPNOTSUPP;
+		}
+	case hwmon_chip:
+		switch (attr) {
+		case hwmon_chip_update_interval:
+			return tids_interval_write(dev, val);
+		default:
+			return -EOPNOTSUPP;
+		}
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static const struct hwmon_channel_info *const tids_info[] = {
+	HWMON_CHANNEL_INFO(chip, HWMON_C_UPDATE_INTERVAL),
+	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT | HWMON_T_MIN_ALARM |
+			  HWMON_T_MAX_ALARM | HWMON_T_MIN | HWMON_T_MAX),
+	NULL
+};
+
+static const struct hwmon_ops tids_ops = {
+	.is_visible	= tids_hwmon_visible,
+	.read		= tids_hwmon_read,
+	.write		= tids_hwmon_write,
+};
+
+static const struct hwmon_chip_info tids_chip_info = {
+	.ops	= &tids_ops,
+	.info	= tids_info,
+};
+
+static bool tids_regmap_writeable_reg(struct device *dev, unsigned int reg)
+{
+	if (reg >= TIDS_REG_T_H_LIMIT && reg <= TIDS_REG_CTRL)
+		return true;
+
+	if (reg == TIDS_REG_SOFT_REST)
+		return true;
+
+	return false;
+}
+
+static bool tids_regmap_readable_reg(struct device *dev, unsigned int reg)
+{
+	if (reg >= TIDS_REG_DEVICE_ID && reg <= TIDS_REG_DATA_T_H)
+		return true;
+
+	if (reg == TIDS_REG_SOFT_REST)
+		return true;
+
+	return false;
+}
+
+static bool tids_regmap_volatile_reg(struct device *dev, unsigned int reg)
+{
+	if (reg >= TIDS_REG_STATUS && reg <= TIDS_REG_DATA_T_H)
+		return true;
+
+	if (reg == TIDS_REG_SOFT_REST)
+		return true;
+
+	return false;
+}
+
+static const struct regmap_config regmap_config = {
+	.reg_bits		= 8,
+	.val_bits		= 8,
+	.max_register		= TIDS_REG_SOFT_REST,
+	.writeable_reg		= tids_regmap_writeable_reg,
+	.readable_reg		= tids_regmap_readable_reg,
+	.volatile_reg		= tids_regmap_volatile_reg,
+	.use_single_read	= 0,
+};
+
+static int tids_init(struct tids_data *data)
+{
+	int ret;
+
+	/* Triggering soft reset */
+	ret = regmap_write_bits(data->regmap, TIDS_REG_SOFT_REST,
+				TIDS_SOFT_REST_MASK, TIDS_SOFT_REST_MASK);
+	if (ret < 0)
+		return ret;
+
+	ret = regmap_clear_bits(data->regmap, TIDS_REG_SOFT_REST,
+				TIDS_SOFT_REST_MASK);
+	if (ret < 0)
+		return ret;
+
+	/* Allowing bulk read */
+	ret = regmap_write_bits(data->regmap, TIDS_REG_CTRL,
+				TIDS_CTRL_IF_ADD_INC_MASK,
+				TIDS_CTRL_IF_ADD_INC_MASK);
+	if (ret < 0)
+		return ret;
+
+	/* Set meassurement interval */
+	ret = regmap_clear_bits(data->regmap, TIDS_REG_CTRL,
+				TIDS_CTRL_AVG_MASK);
+	if (ret < 0)
+		return ret;
+
+	/* Set device to free run mode */
+	ret = regmap_write_bits(data->regmap, TIDS_REG_CTRL,
+				TIDS_CTRL_FREERUN_MASK, TIDS_CTRL_FREERUN_MASK);
+	if (ret < 0)
+		return ret;
+
+	/* Don't update temperature register until high and low value are read */
+	ret = regmap_write_bits(data->regmap, TIDS_REG_CTRL, TIDS_CTRL_BDU_MASK,
+				TIDS_CTRL_BDU_MASK);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+static int tids_probe(struct i2c_client *client)
+{
+	struct device *device = &client->dev;
+	struct device *hwmon_dev;
+	struct tids_data *data;
+	unsigned int value;
+	int ret;
+
+	data = devm_kzalloc(device, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->client = client;
+
+	/* Init regmap */
+	data->regmap = devm_regmap_init_i2c(data->client, &regmap_config);
+	if (IS_ERR(data->regmap))
+		return dev_err_probe(device, PTR_ERR(data->regmap),
+				     "regmap initialization failed\n");
+
+	/* Read device id, to check if i2c is working */
+	ret = regmap_read(data->regmap, TIDS_REG_DEVICE_ID, &value);
+	if (ret < 0)
+		return ret;
+
+	if (value != TIDS_ID)
+		return -ENODEV;
+
+	tids_init(data);
+
+	hwmon_dev = devm_hwmon_device_register_with_info(device, "tids", data,
+							 &tids_chip_info, NULL);
+
+	return PTR_ERR_OR_ZERO(hwmon_dev);
+}
+
+static int tids_suspend(struct device *dev)
+{
+	struct tids_data *data = dev_get_drvdata(dev);
+
+	return regmap_clear_bits(data->regmap, TIDS_REG_CTRL,
+				 TIDS_CTRL_FREERUN_MASK);
+}
+
+static int tids_resume(struct device *dev)
+{
+	struct tids_data *data = dev_get_drvdata(dev);
+
+	return regmap_write_bits(data->regmap, TIDS_REG_CTRL,
+				 TIDS_CTRL_FREERUN_MASK,
+				 TIDS_CTRL_FREERUN_MASK);
+}
+
+static DEFINE_SIMPLE_DEV_PM_OPS(tids_dev_pm_ops, tids_resume, tids_suspend);
+
+static const struct i2c_device_id tids_id[] = {
+	{ "tids", 0 },
+	{},
+};
+MODULE_DEVICE_TABLE(i2c, tids_id);
+
+static const struct of_device_id tids_of_match[] = {
+	{ .compatible = "wsen,tids" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, tids_of_match);
+
+static struct i2c_driver tids_driver = {
+	.class	  = I2C_CLASS_HWMON,
+	.driver   = {
+		.name		= "tids",
+		.pm		= pm_sleep_ptr(&tids_dev_pm_ops),
+		.of_match_table	= tids_of_match,
+	},
+	.probe    = tids_probe,
+	.id_table = tids_id,
+};
+
+module_i2c_driver(tids_driver);
+
+MODULE_AUTHOR("Thomas Marangoni <Thomas.Marangoni@becom-group.com>");
+MODULE_DESCRIPTION("WSEN TIDS temperature sensor driver");
+MODULE_LICENSE("GPL");
-- 
2.51.1

