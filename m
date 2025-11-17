Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11021121.outbound.protection.outlook.com [40.107.130.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44E68334C29;
	Mon, 17 Nov 2025 12:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.121
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763383226; cv=fail; b=u2xH7acWQC/uwdUWp9dSRIU0y3gDDJfknowq/nOZF9crcF9tNJsEtO1llB4FUNlfrYit1niFtt92Ddt35bZeXldlaxKhggaYwpQjrKArJAhoYivCGw6iKob1xI/1OeQ6aUxpILxrNBXesxaqR6n4KobfeVpBLKsQkvOJI/ohV5c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763383226; c=relaxed/simple;
	bh=gTGiLfPIOOeGOh+7O5WjKpQSovTiAptaf7p59eoOLBY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iG09XWYTkb8D+PmBVzz3nlUXAlRLrs+VKowkIyfVPe08aAFTgSXf7gfkvFHpCMbwGnCafO+fM9iX6b55WpNQElaqnaxaMGVKF7OuIPWdpkv+0bdbWe8GFIa6y3CLi0ZTxv8OeXFblbRMQ52VQwCcgJ2nFqC6x9jlg8Q6WMrt1vE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=becom-group.com; spf=pass smtp.mailfrom=becom-group.com; dkim=pass (1024-bit key) header.d=BECOMElectronics.onmicrosoft.com header.i=@BECOMElectronics.onmicrosoft.com header.b=sepP1mej; arc=fail smtp.client-ip=40.107.130.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=becom-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=becom-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=BECOMElectronics.onmicrosoft.com header.i=@BECOMElectronics.onmicrosoft.com header.b="sepP1mej"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PHOETfi8aGIHD3WpcJIYFT349FQeXyWy3vgyAFr5fePkgjcPRxRtsm/ApfmnIxYa3FGzfdT8ZJvLO0yucjwO5+X6pWtJjSyyIp5flAuvMesnUIrBiyuogAw13dlcpx8liajvWeYLz00uRGhmcWwiBmds6QkoHB5jsvLxnFnk+7p0F3FM1q8e1iD0pX7isVf++gtrbqHTz9jmN+1HvqUJ9FWmxS8y6AvkPbelOj5p78s4VKmLJz/xwREfawAl6bobtrR+YBJzkNEzT9kHPl88hIdMifAUK4vDK8lNoZWsOpDsA8KO1AG3EEIyPDw5m6VWtv75mmSFkjI7vOv2gFn2Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x/oxqxVfKnNiK4apOP2Een7KXWWaNrvt4qzlNTnOKzw=;
 b=vRp28i5G9vsgNxSX28OeNNqlv6rRDebsxDdR3traIdme3mgRQE3o/tdsyF1gl4AJi0Pcxma6J/oAv2lmgSdgyWnVI8xvNQZmXyjmE8vTv0aHLNTlmz7V2CuLKY7QpaNkudGF0MJEk+dRExufFHac/BVNt0M3kdho9ea4v92ZG6V40cAGUhzOGR4l+15Zf3Z/byB2d9RwlNag4Mv66jeejqj6z03N+tRfs5OcoelnCf1tQtlFoMcd+wKw1ekhadrYa9t1InzgrWzPQkp1yfldEZYYVhdoM5+EXN86mF2ENAl+1va4WjD4oPMZjZwlmDnpbaUwZA3YgVUwjit9LLecgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=becom-group.com; dmarc=pass action=none
 header.from=becom-group.com; dkim=pass header.d=becom-group.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=BECOMElectronics.onmicrosoft.com;
 s=selector2-BECOMElectronics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x/oxqxVfKnNiK4apOP2Een7KXWWaNrvt4qzlNTnOKzw=;
 b=sepP1mejpofQk6NjfukSvFlTbWVC0xTNFJQ5NfTbYJlRoqTveWtduNZY2XDI4YjWiwocDbqRpiJ8n4KTyY1v8kJjGH3dZ4ATX4sfgxEh31ypixj1tufPDrqPCY0WZCsCBRC4/4i+Zz6r73JlKkBIi9Qd3FK5TmZQ3D8IZ7+RpH0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=becom-group.com;
Received: from PAXPR01MB8613.eurprd01.prod.exchangelabs.com
 (2603:10a6:102:232::12) by DBAPR01MB6664.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:185::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Mon, 17 Nov
 2025 12:40:15 +0000
Received: from PAXPR01MB8613.eurprd01.prod.exchangelabs.com
 ([fe80::5ca2:88f2:e3ee:8eab]) by PAXPR01MB8613.eurprd01.prod.exchangelabs.com
 ([fe80::5ca2:88f2:e3ee:8eab%5]) with mapi id 15.20.9320.021; Mon, 17 Nov 2025
 12:40:14 +0000
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
Subject: [PATCH 3/4] dt-bindings: Add tids in bindings and wsen as vendor
Date: Mon, 17 Nov 2025 13:38:05 +0100
Message-ID: <20251117123809.47488-4-Thomas.Marangoni@becom-group.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251117123809.47488-1-Thomas.Marangoni@becom-group.com>
References: <20251117123809.47488-1-Thomas.Marangoni@becom-group.com>
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
X-MS-Office365-Filtering-Correlation-Id: ba0291d8-e7a5-4cc5-8df5-08de25d6746c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dUpDZGdNa21yUnpMZFN0dkhxdTNNR1AvVWpZS1ZhTG9aWktqYnAwOGZkTUh1?=
 =?utf-8?B?V3R4ZFFWWkkzMTdHRm05RGd5cEdtY1pMdUQvTTJJWmpsOWllOXhBM3MwV3A4?=
 =?utf-8?B?UUx1Y1hLeVdoWitZMVRUUUVvU1o2czl5ejk3bUJYcTYxQ0NPWmxYM2ZWM00r?=
 =?utf-8?B?S1JLaVdub0pwT05DWEpuWnRva1NIcTFockhXeXM1QUNhWXlQbFo4Nm1nSXJt?=
 =?utf-8?B?YXNSSW8zYnBwbGcwTEt6L0tIbW84bWY3RTRTdG40VGZKYURaLzNhSGZLaTN2?=
 =?utf-8?B?QXJuTEJ6UzlBZGNJK2FmaFJuL04xYkZlUzVRSWVQVHhTSjBLa0pxU2NaRmhv?=
 =?utf-8?B?R1phTjNna29GTTJoRW5OYlJTaGZQNUZJOWIxZ3dHRzRGc2ttUitmdUQraGsw?=
 =?utf-8?B?U2tCOG5yQURSNFJ2SUxIU29oQXg4dG12TkZKL3lMNG0wZ1J0Q3BqVDZiMXVu?=
 =?utf-8?B?ZGRXV3lGUkl2eFhhbVpuSVF1M1FRTXl5Y2dDTEtpcWN6SndKcjdhVEpEM0g2?=
 =?utf-8?B?aFF4em5MT0gyNnhIOXRiMUs2RU1HSUNUT0t1WE5nemtIVWNONVFZL0YwUXFG?=
 =?utf-8?B?YW5udDVFbmo0blF6OUR0Tm9uV201Tzl3UzNlY3R3K1Q2MndjRy9tUnVuVjdw?=
 =?utf-8?B?MklFZWNuZEdseS9TL0VaM1VtOVBWbktxcEkzV2dKVzNTbEZ4Y0J4TVV1TUY1?=
 =?utf-8?B?b3BmQ3pSRVREZy9jQXNKem5haVZOYkNWYmpseTFONmt0UzNkaDZacWN6WWZP?=
 =?utf-8?B?OWN4T3libFhJTGhVVVIyL0RNRy9ENWVNYks3RTNhN2RlQmVReHlvc0tMUE5L?=
 =?utf-8?B?TXh2VTVoeGdLTnNzaG1BZDVzTURKL0FYYUpZalEyRGFZTXA1aXdXL2ZkOUlz?=
 =?utf-8?B?RUpGc1daR0tRS0dEZVZPN3grSWp6SWhHYjhiYkJFZ3lYWDF4dTlidWFpb25G?=
 =?utf-8?B?Z1U0U0JUSmhPSk1EaGczd1hlRWk1Q3NCMDN6YVVNeXNwRkJxM0pZQnU1OGl3?=
 =?utf-8?B?VHNOdjRyN3kyNWt0bGlZTks0U1NmaU5GanorbC9XWTlTeVRnRW9TOXJmZUp6?=
 =?utf-8?B?WlRDbklnVjlCMUNhSDZxSFJDNTBZN081dWYzbS9kaFRXSkNjcE1RTktaY0dw?=
 =?utf-8?B?WGNWeGFsd0tLOVh5MnRXek01WXNMa2Z6SkhpSUI1WGQ2eHZRUzhTWmZCL0Vz?=
 =?utf-8?B?a1RLK2RFY01ySDcxZVZYNDdUbzNSNjhUdk4wSE82K2g3UUZWRDdRczkzZlBW?=
 =?utf-8?B?UGR5YUlTdHFocWJTY2Y4ckpaK0d2ZGRNMTZDc0o4dDh6YXc4VE1KWWhvOUFT?=
 =?utf-8?B?OG1IVmMxV3YwWFkzbVlRKzFRT09LVWhMdkJ6MklHV2ppRXFzVktLYzc1WnpQ?=
 =?utf-8?B?ZUdzSWZ2WG5lL1ZBSFAwYXNZdjJBdjI1Z1hFRkpoQlU1ZlRaVzY3RThUSTdG?=
 =?utf-8?B?ZWQzWnBtSktBQ3JaWHZJc05hd0pPWld3dmdqeVlhekl5c1dBMmJ3UDVMcnJQ?=
 =?utf-8?B?bU1YYUdnQjExR1lqRldSRmo5SFRUL2Nxc3BvSVAxbnlNMlpGQWZzcXVzYzN2?=
 =?utf-8?B?cjJZRXdoSXZnZnNzc2RYSjVxWElIQVdjNEo0RnZadjdyNUx4U0c2bHJybFo3?=
 =?utf-8?B?cEJHS21SbmZZWmV1NXk1LzJzOGd6WjZFK2UwUThpYUZLYVZHRmRHTER3aDBT?=
 =?utf-8?B?TlBQaStxZytsbXhlRmUyUFljWGZJdFJUTU1DMmFDek5DWFMwa1NoWGZFZzRM?=
 =?utf-8?B?clBINGxMZjIrS2tBdC9qazBKdjNGcVVJSGRkZkE4RjJrWVRoVUlZOUo5K2tJ?=
 =?utf-8?B?Yjk1T0EzYmREM0oveWVPMWtzeEE5YTRNOEFyYitta0ZxNFJPTUZZOUt5OHY0?=
 =?utf-8?B?UHE3VnF4Qm1JQUh6ejBOaUY5ellKb2pwQkQ5VWU1dFhEaDBKY0R4RVh2UndC?=
 =?utf-8?Q?MRYbatxKEq9ehvFPkHoJ1FWHJSlys9Kg?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR01MB8613.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aDlpazBIdGtHMzF6UlplcHFmUWEzaWpITWFINUJaRTgzVWdRTE92Nlh3ODhn?=
 =?utf-8?B?VSs4bC8vcVpUK3hmSEFvRmcxVE4yVXdvMURkZy9CVGpqemI0SEdXVGRydmh4?=
 =?utf-8?B?bHkrLzJYMjB2L0x0cndmUFJhRXRhMmk1R2ZtMzlMOVZHRWVIODNFOHFPSjRP?=
 =?utf-8?B?dHNUQnY0Tk13cW9KSi80VXdPT1R3ME1mZFRPZmZHbHIreWxLdVJ3Mys2MndG?=
 =?utf-8?B?MnFsWXdlOXpGczNvRTdxNU51d1dXaDZrZGxpTE5YNndtaUtleE1BVEh3ZXU2?=
 =?utf-8?B?UTZ2a1pZWXg3MDJxTjNLMDM5aWw0SXJScC9hWHFDcmNmMzd1V0tzT1lJeWdC?=
 =?utf-8?B?Nk9XY1N6alJKajAzT0xhTEJhZHFDZTRmNjBrUW9DQzRBT0FyZTljTEhxVHVR?=
 =?utf-8?B?L3Yyb2htWEE3SHIvTTYvQ0VQUVlNOWoyUHhSclhkdWpTRWRFZHJTQ3l1YjFF?=
 =?utf-8?B?d2NzdEt1NEs3djgxYnpWK3lhSXA4R0RzU1pSY2RqQjlsV21FVy9aWG9DSUho?=
 =?utf-8?B?MXZyUWxMMHVWMUxRSHhKYytkaXJkdDNoMmNzaDR5L2NQMk5QWFF0cjNqaHp6?=
 =?utf-8?B?U2JJSDh5ajE0Y21TbjdHTDFBa0tDdTdTSWlHSXRqZDRaKzdRN0ZGSFh4ODhG?=
 =?utf-8?B?eEEzRFZjMmdOV1JTa2ZidkRRZlRrajNNa2VFQk1jUDF2YndLdUNheU1ZYzVv?=
 =?utf-8?B?VjUvaENKZDNycHErSlA2MVpaUEFNZWRUOWxyVHR4OTNiWDA3dlVUWTlBK0w0?=
 =?utf-8?B?cEtsenoxdHJnVnlleEFscjV2UE4yVGlMTHN6Y21rMnJXdG5FZE5jdkZudHZ0?=
 =?utf-8?B?cC9pQmgyWFpIUVpPK3ZiVitjU3A0Z0NzYlBrWFRhZkhCL2xwTHd3am1QSWJZ?=
 =?utf-8?B?V0lyQlF4NVNxM1BwYk1LcFpsbmdRUlhhVk9IRmQyUVFXWmRHY2pGdVplSXVB?=
 =?utf-8?B?UTJxNDV4L2pTbURZMTMwaEJpZ2V2N1piVjA4dUpvTGRqN0taNFdmNlZZbFZC?=
 =?utf-8?B?VVhnSmhVWWljWkFTOXBRRVduTEE3TGw1QmRCMjM5SERPUFJDNjN2cnluSFFH?=
 =?utf-8?B?cDBQb25FWnhmak5vS2Q2NkQ2Y0UrQ083a21pejFDUklQd3lzekxqZmpZdDFG?=
 =?utf-8?B?dFp2Z3ZiKzdrc09mOUg3WFpxbmlsK3FZTnZMV0c4dStPWEQ2REtzTjRuTWpr?=
 =?utf-8?B?M2xEZkJKek1sZm52U0pURC9wSG9KazVoOEJTT2ZJd0dOUUF2aHZyZ2kvTElJ?=
 =?utf-8?B?UmwvME1xaDZ0Wi84cE5CeEIzOGlUbkdsZkhYZlFGem8vOHpDQXBnUjFXcEJz?=
 =?utf-8?B?YjFyV3pzeW1vczQvSzJOL2tCSVJZbGNhOGgwWEJ4a2NEdzZ5WDVnN2gySENn?=
 =?utf-8?B?Y0xRK0srZlc4Z3Voc1hkVGxocWRHWmNmTVM3Vi9KZnN1UDJybyt6eGhPWXFs?=
 =?utf-8?B?Q2lCaEFrYSthTnRNRGJ6UUdNNmR5Ujk4YUVwOXZJaUFMMGtRWCtiY1d6YzdF?=
 =?utf-8?B?dnJSQ2tXVGNLa0txK1MvMDdQamlyUnFYbzZFTnY3OHpnaENoUlhVd1k1cFBT?=
 =?utf-8?B?Y0twRXRxMVlEL3l5MUNYcWViTGFFS3czQUcvRjEyTkFRaVJPeVFBekU0Zk1t?=
 =?utf-8?B?bWlXclBSeHB4TzRwazljamZoOFJoa2FlWHFzakx6Qmd4aUZuL3dBN00yVnBm?=
 =?utf-8?B?U1pocG5QeHpjK1dMT1FSOFA4OE9JT29icmJ5d3Zpem1MYko0a3ZwM1dEd2g5?=
 =?utf-8?B?bVhyVE8wVFQ0SHBFOEdEUTRndGY1V3ZmeEdoQVNNdGFEMTZEOVIvNEtHWWN2?=
 =?utf-8?B?R3MrOFBvcWFxL0ZYVzVDVDNic013blpKZm54YzZBVlZlL29zYXFvclg5TWtV?=
 =?utf-8?B?SFNRWWRCQ1Z5L0hmR3QveldzQURIZWpmVzFVSmdYOTF4UktNczdxbXVXN2hy?=
 =?utf-8?B?WExXNXloRS9PMzRTemR2ZmdXTjlvMmwwNVAyMWVBSmFCTTd6dXRvQ0R6MTBz?=
 =?utf-8?B?VnluZEdOT0c0UWhmcFR0aHNjekptOFl1c0JXcU9kMUI4Z0FEc001OVdKL2ZW?=
 =?utf-8?B?VnBaa1ZTOVd4L2QwbmxZekNkK3k2ZEl5NlNYRTBZbU90ZTV2aStVNTIwNSt1?=
 =?utf-8?B?ZFZCMkVWSTRpU0RXM3BwWkZrZWpEaFFOSUNucUt1cUQ4Z1BSNEFCcy9RL2NR?=
 =?utf-8?B?V3c9PQ==?=
X-OriginatorOrg: becom-group.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba0291d8-e7a5-4cc5-8df5-08de25d6746c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR01MB8613.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 12:40:14.1696
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 738f6472-f50a-488c-ab88-c200fd976533
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dHYMQYQGOLj5r3OwkbdwIsTW49o7ZqFliMVOPFYZ+hwrSI0GPZ0+aFUM5fklAvTHtvu/GECQ3ra5SMSj63HfOLkPrEgxbkfaDouEoiGQ9pU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR01MB6664

This patch adds the tids driver to the bindings as trivial-devices
and adds the WSEN manufacturer to the vendor-prefixes.
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 2eff6f274302..e120767ce119 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -488,6 +488,8 @@ properties:
           - ti,tsc2003
             # Winbond/Nuvoton H/W Monitor
           - winbond,w83793
+            # Temperature sensor with i2c interface
+          - wsen,tids-2521020222501
 
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 42d2bc0ce027..2cf753fdf5a7 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1823,6 +1823,8 @@ patternProperties:
     description: Wobo
   "^wolfvision,.*":
     description: WolfVision GmbH
+  "^wsen,.*":
+    description: Würth Elektronik eiSos GmbH & Co. KG
   "^x-powers,.*":
     description: X-Powers
   "^xen,.*":
-- 
2.51.1

