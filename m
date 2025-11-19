Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11022074.outbound.protection.outlook.com [52.101.66.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1711358D14;
	Wed, 19 Nov 2025 12:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763556735; cv=fail; b=TNwx0XAw2SeBKszqVYdyGXIHznQyIA3k6zonXU/az7SRmx/O3uhidDJt3WGi7ticWXx14QiNR5D4K9dIeZBmhicByFICc0hfL1tVUc0zQ6NTKjY8PUn1KWCmcfl5EyfKzKWJemoaSKRglMFP8Q9eDZfzCXwhI0KRerpLLQ/jbjw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763556735; c=relaxed/simple;
	bh=aKKCKdm1X9FaHHyNatPStBEkPh4Wb/i9JbfGYCENmmo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HGmom6Gq8SEy02V7teii4a6C8TJkpcPjuZWTgVeGn8XvppiQ2uzmgYytX7hCU+ishWeBQS9BAlStvC8OK8sXHmWJvHL2bo7lD0NgIswSSoBRVqq2JJObpQlyMTWzlejzkt9cIbu+DPdC/+8Y8IW42uKf5zBxmM8AYdAyHAOroeI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=becom-group.com; spf=pass smtp.mailfrom=becom-group.com; dkim=pass (1024-bit key) header.d=BECOMElectronics.onmicrosoft.com header.i=@BECOMElectronics.onmicrosoft.com header.b=ntODjd5s; arc=fail smtp.client-ip=52.101.66.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=becom-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=becom-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=BECOMElectronics.onmicrosoft.com header.i=@BECOMElectronics.onmicrosoft.com header.b="ntODjd5s"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DcTnLZmHdmXYiXMnpCHFFCWKZmA0RB+/Kx7TsMJVZTj3m3wpwdAbTIuz00lkeR+s21lRllwbsYFYPpLkMeXGoWIrLr1N8PKArThZoXaXn2VcnF3Kftk68wi9Q2f36CNkGvKu/qiFd6IWssPMZjcKls/lPk7lsPWzCB+SLl2klqVRca0tnqFs61NuixcP60XRw4dCHMm08c/kXh0BQfY5V4ddU4CTiePYUT7xDORB9HoxzxMZbfVaHvzs6PAwZZY2XfVYw4tFYbfjJeoKVyJvkg7HDPZyynofCsxWANS/EV1MPRRRKU/wR3Meb6B+P92BxCKbTK/wopIlqen5xlHPOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4V5bNyLcmA+M7cdc2z9OCcB50uID9+V/6dibALZrIf0=;
 b=vRiX9vlP4Vnb+BE4jXgGfun58ziG4Rk8v3vgkLkKoGzHmndAaD2xhD84aLdSc2lr7TDLAHp09lwGv9l1Ka36/IjIA4Th7p85OeBRF86qIS7fPf2glCDsbsDy40bno1y25Q+cLoycPEnQoijbrJFvVHvWGFCp88b37WeYnGjSPyze5Uo6hrqMHOXZaZ0iSOXGifn7t0oOldhhaARAePYL5um687Okn3wvE0du6rmJkSg5qu3BdMQhllKASVEz3pjB7XCnDH9w0O5/vaKb7J/aNRzfjuToSha1F5At60B7eS/f+fjvXUBQiOXtoQEElqIbsyW2Zd/hO0VdmqLzi+OzAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=becom-group.com; dmarc=pass action=none
 header.from=becom-group.com; dkim=pass header.d=becom-group.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=BECOMElectronics.onmicrosoft.com;
 s=selector2-BECOMElectronics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4V5bNyLcmA+M7cdc2z9OCcB50uID9+V/6dibALZrIf0=;
 b=ntODjd5s82NLCbVvc5Weq0ScTe6qH6HfVhq9ONTos/WDH6y6PzM8acylH02rIV8crmMK/200Z2L+6MaqXNIg1lYrQjTlR/5ZobhDfHfI5bGxpXkfYC7m6ooZ/IzBoL24SVPRwnZtb5Zn4mKjAEyZ0XXMjx36V7l7LXbpDDwB1pc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=becom-group.com;
Received: from PAXPR01MB8613.eurprd01.prod.exchangelabs.com
 (2603:10a6:102:232::12) by AS5PR01MB12563.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:753::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Wed, 19 Nov
 2025 12:52:06 +0000
Received: from PAXPR01MB8613.eurprd01.prod.exchangelabs.com
 ([fe80::5ca2:88f2:e3ee:8eab]) by PAXPR01MB8613.eurprd01.prod.exchangelabs.com
 ([fe80::5ca2:88f2:e3ee:8eab%5]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 12:52:06 +0000
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
Subject: [PATCH v2 1/4] dt-bindings: Add trivial-devices for WSEN-tids temperature sensor and wsen as vendor-prefix
Date: Wed, 19 Nov 2025 13:51:38 +0100
Message-ID: <20251119125145.2402620-2-Thomas.Marangoni@becom-group.com>
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
X-MS-Office365-Filtering-Correlation-Id: 0da99beb-910e-453b-b067-08de276a71ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S2FZRy9XVGU2aW1sREo3TXRUM29OeUFJNGgwMUdGekdrd1AvYkpKSTNnQlcw?=
 =?utf-8?B?N1B6TUNaV3B5L0c3YStkUTJmZWlnU3ZxUFBDelBLejQ4WkRxa2dXRzBHVFdz?=
 =?utf-8?B?eXpYbExnQVVQcElQeERWcXAzUnI3MUg5cTJDcjdKWDZNNEhaZDl3TU9tVWFL?=
 =?utf-8?B?TnRqdmF0SlZKanFjdEpOVFY5ZHpKdVVUcXgrK1hweUF5Ykg4M3k5cHNaeEtk?=
 =?utf-8?B?eHNXcVkyWEY5RUlKSGxSVlFCVFRDUml3RU84bmlPTDM4Y2ErUTd2MTlCOHZ2?=
 =?utf-8?B?ZWdjS0Q5aUxQbHNmMk5tVWF5dGtZSGplYzJkYmdDWmU2OElyMXloZlk4WUlT?=
 =?utf-8?B?eW9PWnNoNU4yeXFHb0NZelRYb0hUQ2FpUDA3MENtN0FZRUQ0M04vbGdjbVpr?=
 =?utf-8?B?M3VFdExKWjJDc0N6YWp0TFU0bzgrL0ozN0dTU1BlR3k2eTVCYmo2YjdOLy92?=
 =?utf-8?B?S0RCcWhiUjNOZWZIZ2F4b2djZmkyeGRUaU5aN3cyUDBoUzcrOHZocVZMMFpn?=
 =?utf-8?B?NzBybGtHaEwzNEZ5VUVyMzI3bldQdk9XbmpyMC9PbWNZTTdkeWJJUEFabE92?=
 =?utf-8?B?Q2FNWWpFK2VFYVhpMFd1UWh0dzN0VFBmSmdHaFhSeTJuWUxKYXhHOVh5Nnlp?=
 =?utf-8?B?MzRXMkZVWDZXQTRETy9OcEJ0a2dBQVNZT3lHbTZsMHV5T1dLSU5KL01EcFgx?=
 =?utf-8?B?ZGppWk8vSFI5aVpZNVdORXRsN1Z2a04xWWExak9Rdys0Sk1Nb0NGRm1xdDNJ?=
 =?utf-8?B?cnBibUhPTnl4VmRDdTF0N0s4ZFhTeHJPMWRwMk1oWDhGRmZrM0RSNEdSSnNv?=
 =?utf-8?B?NnJBaFdmSUZjMzI5MmU4eFBhaWgxWnJGUlBrdnlUSHhHVUFWbHJ5V1RjVWVT?=
 =?utf-8?B?VVFjTVJ6ZlZBczBzY3JFM1g5MGM3bXdEOEkybSttbGR0cGt3YkRLb3ZocU5S?=
 =?utf-8?B?SjdVV3dxVUdidjNTbENURXZ3UHhEejFqYnFoakJBU1JiRS9RQlBYd0V4LzJR?=
 =?utf-8?B?OGVYRE8zNmN5NlN5cGFYZ1U2SVZ1cTFiQ3h1R1FqNWNhOG5pSXZSaE1ST0w3?=
 =?utf-8?B?ZTM5dmFQbi9DNjFobE9MZktQdU1laVgrdCtPSDB2SWpNVnJtWTJTWU96VW01?=
 =?utf-8?B?Qy9RUmNIdElsdFhSeXZPd2FaYjFvbEI4c0hGWjV2NUxlTTJ6K3BVdWhXRHdM?=
 =?utf-8?B?bmR5ZnI5UFg3bU4xSmxrdkZ4N3o5TXBSemxoeGJOZmxsVEVkclJKZ0ExdVdJ?=
 =?utf-8?B?ZHU2SEpDQk5PcDIvSWpkZk9WQVhYTGdsNEkxS2VBZklJR0FqZ3dncnJ4MWVu?=
 =?utf-8?B?Q250L3ZqQzVEVmJrZVV2YmU0ZERpRE80dWQ1SzNTYk9CQVdLdmc2aHAwaVNy?=
 =?utf-8?B?NXVHT3pmUmpSbk1qSnN0eWVCYjV1K0tZS2duRmp6cTNRVzdwTmN3Z2ZnODg0?=
 =?utf-8?B?d29rczJuRjRaOUFzQ2tWS3hkVTFvVnQ2V05VUmlMOVNneHNVTTBDMUp4eHQ2?=
 =?utf-8?B?ay95MUs3NG1lNzQ1KzZldWZWUk1OUGlrZ0NFZ084UHYycVMwYWpHbGFtWGE1?=
 =?utf-8?B?dXBtUVcySVVLbEd6bkg5VVNGSDd6Z1prZ0NBbzZpZUNJSGxtaHBzUGpESHAy?=
 =?utf-8?B?cmFQZVpPVm95UUl4SnNkaG1jcFlxYkg0UUMvWU1JVU1Ubk1WL0pPQVZwRXkv?=
 =?utf-8?B?bWlyWVNyVlZVZm0wVmluOHhzbU1jVThhNC8vY2RHMDYvcVJpRCtra0pWY3I0?=
 =?utf-8?B?eW5WR2dzd05ROGdTU1h6dEU2cTVEdC9GNmV0Qml3cnBIMUQvNEh5S2JON0ht?=
 =?utf-8?B?anJRUW9IamlUUENBdTJIdit5VlJJWEFnYW5nUUhxSzFrcS9VcHIvYUIvRlV4?=
 =?utf-8?B?aXZ4MHlsdldoUVJNazU5TzQ4cFoyUkJ4RWU5ZVJwQWhhSzNUd0lNTUhoTCt5?=
 =?utf-8?Q?iXsVBa7pIyZY3UJ6aXp+lUknkZKU4l+Y?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR01MB8613.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QVhreWFSdVBVVFVaWnJ1SUwyR3FYcmhPdHlHL0lIYTJ4MEtuM0IvclN4ZVlV?=
 =?utf-8?B?TE5NblhkZ3d0ZGoyTUZoZmkyVlVjdHFCdDZTV2Z4SmYrQ2lPd0Fva0F5YUdF?=
 =?utf-8?B?YnJvS3J6Y1MwMURicGVsbUZCcldTT05QbC95MzFmdTdZT1RPT0x1Y3J5MkdM?=
 =?utf-8?B?NVJZeUxUVXpmaDJISmgwTUdQS2pISys5MlpmVjRZQUFmQkhka2tXRlFCZEsv?=
 =?utf-8?B?aDJEb2lkTk55SFBjZU90NDF2d1pPd285akZUZmhYK2JiczRXV1JTQ1gwZWRL?=
 =?utf-8?B?bS80VFJLVmkwUWM1akRobkpzdlVoZkMvSlp3bHd3eEVrRWtiRXNPZG9EUU5o?=
 =?utf-8?B?TWtKZ3dFZ0VRcjdpVTNVNmN3Zy9yYVF6MEhLOThmSXRWRU00WXpMa3NLeHdw?=
 =?utf-8?B?dUE5R0NvY21JbTJ2VWU1OHV1Z1ZMa2FQVXpCa2JVSDdDTnNJVmJmakFaekI5?=
 =?utf-8?B?bzlvcytzQXBGN0s3d2I0UEVRWG5jK1dpRkw2SFMwcUpwcHhibmpEQUhwSTZK?=
 =?utf-8?B?ZzlPdUVGSEh3OW9keWpiaWlXM1Q5T1NCVGNMRW9QV1FZV1hpYUpCSlk4NDRD?=
 =?utf-8?B?MWIwNjdYRDRSUFk1c21OblNFWW1vYkl3Zm9keVdXVU1jV2JQWDZJNGVnUEE0?=
 =?utf-8?B?U2Q4dnJSRkhuTW5aUUxkQ3VRak9GenlVL1BpOCtHSVhURTIxK2RydWV0b1Uz?=
 =?utf-8?B?SnpuVkdsaFJMR3V0Um8xRDFzNzNsN29wcmYybldlbW9KTitEN1k3T3k3M0hB?=
 =?utf-8?B?OGd6K2dOSGRJOUZwZU40eVhWU294RkQrRFd2WWQ4SEVPbjkxb0IvdldtNkdG?=
 =?utf-8?B?RlgyMm55M2NON1NUNFNzVGVDY0I3WDhkakl4UXA3KzZXYlJmRGtlRGdMWUFy?=
 =?utf-8?B?ZmRtUUtVbXQrV044VFB1VVkrblV4UnhnQ0pBcndBdUlhZWlDazBrWVJmMmhY?=
 =?utf-8?B?UHRXSzgya1VkbUJUUEhTR2xTSEFhcnViR3NwS0syaVhyeEdDb3hqRWFheEZE?=
 =?utf-8?B?SmI0NVNZNi9HUDBIRXVXSkFudjBHRzk0V3JkSE5RTjQ4WE5hSE1LQmsxaVpv?=
 =?utf-8?B?Y1dORG9rNWx0eWtuVUhOQ21LN3krNkF6Q0FlcGFUT29EM0xTY2M3eVZ5bU5h?=
 =?utf-8?B?VVdmeDEvQXBEVE9ZejBQcmNsTWhBekxrMG85dWxrdUR5aWFoUFk3ZUQxSk9y?=
 =?utf-8?B?RFQ2UnVZTjVzTXdvSkZMMmNKL0pvRzVqdmQ1Y2g4OENJTEFvbzIvbkpCWThh?=
 =?utf-8?B?MStucFRsLzl0UkVyY3dGdE5JVzZmMk1EZ3RBM2F3NkxhNzdjS2ZjU2QwRk80?=
 =?utf-8?B?TnFPMHdybnlMbFJPWFJma2JZRXJiVjJSSTJ5YkJteXpNaVJRMmR5bFJpL0lU?=
 =?utf-8?B?cTA0K08wWGIzbEpQbDFrRDFieWpwaWdhcWVlenMzVVpxRUN2WTVCdzc0MzZU?=
 =?utf-8?B?eW1mTGNyL0dhNmN0bG5ldVZINXpJc1BDQkR0Z2EzTEtlR1VyNU41c2J1UTNw?=
 =?utf-8?B?Y0Q3a2toK1BpZUdVTkF1aWFObXNQVTdLUkxsRENqOEkrL0xSWkpjcmlTNmxW?=
 =?utf-8?B?YTh2L2JaUy9lWG5FRXFhU0ZOaUlzSG9CNmRYbHV2UHlyY0N0ekdwbm1FTmMr?=
 =?utf-8?B?cVVKTlpUbXZIMDNQU284cGRVWThUcHF2ekx5VW9MeTB5SC80VGNneGZsWWF3?=
 =?utf-8?B?ZENlU0lad3REUTVRK2J5UG4xTHhvR1FSV3hvVGx5bHZSVkNQZ0dQM3RucDhz?=
 =?utf-8?B?VFNXREJHUkhwakpnOVo5L2FkZXRTQU9UbmE5SnRGdlVvZGRyVlRxelpqOUc2?=
 =?utf-8?B?R0tETnVmbDBwR0hIUDR5eWc2dFhuaUY4Q1p0QXZ2UWN5R0JKbzBZUHI4ZHBt?=
 =?utf-8?B?bU5BdHpSMEtsU2grQ3hWVTBFbGl6cUwwOUsvK0tqZXhvdWd4eFB6NVd6ODNB?=
 =?utf-8?B?SVNlYVpScDExTDRmRVZlcHdDWXJQVVFmSDBockc4bTBrQXAyNnFaQ2JYcTll?=
 =?utf-8?B?NVJKbWczZ1pnTGxKRHZVWVluczU4SE9VQzV6a05PMmNlam5UZ1VzTkw5ZjJB?=
 =?utf-8?B?cVZXM2VBcno3c2hKdnI1WHZxZ0Rqc1FuNE5DaFBxcEJtV05Bc0dDbWFCYVQw?=
 =?utf-8?B?dkpGSWZMdFNRdzdNVHdlV0NYb1FWYW5iMnAvS2xFZkpQbkVDWWljNm5EN0c2?=
 =?utf-8?B?M3c9PQ==?=
X-OriginatorOrg: becom-group.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0da99beb-910e-453b-b067-08de276a71ef
X-MS-Exchange-CrossTenant-AuthSource: PAXPR01MB8613.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 12:52:06.5532
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 738f6472-f50a-488c-ab88-c200fd976533
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WqEgT18oZWUTBCdQhpaO8r2RMz+3Dg2TUjGWknFg3OuNaibxDRqXJo1udfpWxs7ZnFoz61UE2ZmI6KmlfGdqpTgyLYLVmI7MCsGENfjdEIo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR01MB12563

WSEN-tids only has an i2c interface and an optional interrupt. This
should qualify the sensor as trivial device.

WSEN is a subcompany of Würth Electronics specialized on IC sensors.

Signed-off-by: Thomas Marangoni <Thomas.Marangoni@becom-group.com>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 2eff6f274302..0a6b687552c8 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -488,6 +488,8 @@ properties:
           - ti,tsc2003
             # Winbond/Nuvoton H/W Monitor
           - winbond,w83793
+            # Würth temperature sensor with i2c interface
+          - wsen,tids
 
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 42d2bc0ce027..ef527e980137 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1787,6 +1787,8 @@ patternProperties:
     description: Würth Elektronik GmbH.
   "^welltech,.*":
     description: Welltech Computer Co., Limited.
+  "^wsen,.*":
+    description: Würth Elektronik eiSos GmbH & Co. KG
   "^wetek,.*":
     description: WeTek Electronics, limited.
   "^wexler,.*":
-- 
2.51.1

