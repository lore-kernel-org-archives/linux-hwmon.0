Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11021121.outbound.protection.outlook.com [40.107.130.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C95330B0F;
	Mon, 17 Nov 2025 12:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.121
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763383221; cv=fail; b=PyX2bCbMalGmcRPOLdRZmPA2J/aV7c6j7WGJcb9X/I+62tRos8W5b9XsWsI5ytL97o88K0uYoOsN/o3dsUjX76mxXsyfUB5OqN2qlE5yRLc9G8ndKK+KUvd33cIN1g/x5uOIeU1aKLW6X4pC4qnmwF1PkUz41i1CYXbsP6qVioM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763383221; c=relaxed/simple;
	bh=5CSt9JJwN7P/IDGFH68tQgHiJvVnXDMl/RqzRgrXl6c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YJrt7BCHDMjdbIYAS6BOd7vHVAXm74avhwmL0wth3OSwX5KwEzEPFB5EPlTZRWgdaHUfAZ8z3lOz3+Z6Nl5AXCj2baYopyu4KLVq/5Mrox/HMNUv77icn9FhLdxfmtN5ADic1NINcdUYALKY+x38RpGQfmcD/wS8dRuvrxM1H+M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=becom-group.com; spf=pass smtp.mailfrom=becom-group.com; dkim=pass (1024-bit key) header.d=BECOMElectronics.onmicrosoft.com header.i=@BECOMElectronics.onmicrosoft.com header.b=pDpzEW85; arc=fail smtp.client-ip=40.107.130.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=becom-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=becom-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=BECOMElectronics.onmicrosoft.com header.i=@BECOMElectronics.onmicrosoft.com header.b="pDpzEW85"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LyCn+ob/olcr1gD3DApk6AKvMKsk+FWVLZgadf8JZOuW3hKznOLUGMgA9zcnZWfwhOC/i0l36GgrqbwA1Cytt/s9eSz/wianMvNx/m3i4PLEWFx6YFaPZyWhPnHNlSDkwTA3IrKOg6lyALxqMHTBiT0mvnjafHRQ0nnDAFnx91noviK94YvgwkG1wsdlLoMuXmbz1XQuz/tTdh8o2kxF3Fcz44iGfESdqdMmbrg1ux3tSND240bSVDtTEQYhrubiGNK70/hMHmwHRtBDa3BXfDgnamW5STeeV1NblgeeYOb93x10BDYlLERd8SeVEROlned6OWVovmR4K7/O3PJrEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fpvRdtLoTrlUHbqzR6XudHUWHbHhLaQsg5Bb7+PbCAw=;
 b=zPg6vXSVAF38oJWHEY1N7CJDbsstXNurOUycs5geT8rWf6tZrJN2kJYPdzxzDQzQiUiLYuN/JrQGma73n4NxBqnwlYtOxmLKYAv6Idl5nxmffqK7tCQa0bCsmuBXoAMwz4b+nDp9ovRPIaapA754o183QJM3UsizxzsLjUWKnmeXuELvGAEGaikdGctnZmhWX3+hClkIjLaWljX4adVNmxx7qfdBdYI8doRzX5yrbf0i2W7eTxH/sbtSQoNb1CjhWPEVKB57unYtbm/kWtSkcuw9tNNPY5cTigT1wFogj8un2iTciBiSSika7pLCQnaiCeZB8Oo1F3fVWQK4FkFyzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=becom-group.com; dmarc=pass action=none
 header.from=becom-group.com; dkim=pass header.d=becom-group.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=BECOMElectronics.onmicrosoft.com;
 s=selector2-BECOMElectronics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fpvRdtLoTrlUHbqzR6XudHUWHbHhLaQsg5Bb7+PbCAw=;
 b=pDpzEW85ODI77nF+2AC/nmi7PDxa0BFNBs/l5/Ax6R1Ter2EFdKo3SBshf4w6SvP1zJGLVZniQbON9DRlp/rp/rRO6+l+KD9ccKUpZI4JB9g4z26IOgCkgUxNkI/f9BOvjjd9TzPj5Dl6kXkr4jVc13spN0lUGtzqqN4/CAK2L4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=becom-group.com;
Received: from PAXPR01MB8613.eurprd01.prod.exchangelabs.com
 (2603:10a6:102:232::12) by DBAPR01MB6664.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:185::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Mon, 17 Nov
 2025 12:40:12 +0000
Received: from PAXPR01MB8613.eurprd01.prod.exchangelabs.com
 ([fe80::5ca2:88f2:e3ee:8eab]) by PAXPR01MB8613.eurprd01.prod.exchangelabs.com
 ([fe80::5ca2:88f2:e3ee:8eab%5]) with mapi id 15.20.9320.021; Mon, 17 Nov 2025
 12:40:12 +0000
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
Subject: [PATCH 1/4] hwmon: Add driver for wsen tids-2521020222501
Date: Mon, 17 Nov 2025 13:38:03 +0100
Message-ID: <20251117123809.47488-2-Thomas.Marangoni@becom-group.com>
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
X-MS-Office365-Filtering-Correlation-Id: 7594b606-264a-43dc-9fa8-08de25d67347
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aFV1NWUzWUl5cVE1K2JLeXdwRlp6ZVN1R2Q5WU52K25wdDlXUy9GamVKRHdj?=
 =?utf-8?B?MVVaQkgvcFdQanhpa0d2QnB1djg3c3NjTk90M0s5SlRsdVczOXVRYnRuWndh?=
 =?utf-8?B?Q3FKWlFEdEtORUdqUjk1RENjMGhVSUhBVXppaUxkU25Da1ZybnAzYjVhY1Z4?=
 =?utf-8?B?aktLUlV4VmRWT0ZvZUZCMTlGa3F4QnhkZSt2R0tNcUpxc2t1WmpZTlhXQUND?=
 =?utf-8?B?YUhaOGZnRHhtZGVtUWRIY05rcXFVRzEwaTJ2a2oxdWdJTUo4QkpON1pQMkYy?=
 =?utf-8?B?dUVMWnkxRzV0STNmTHJ3UHdjNWV4L1ZVUXV4TW9YSzBtVzZuUWNwZzdQalZw?=
 =?utf-8?B?MUdRN2dPQ2xGWi91UWFGL3dTcGc0bi9XRUpBOUlCUXBYczV1TnBNSDZpRFM1?=
 =?utf-8?B?Vm9OdjFsdU92dXAya29tT1ZFcDMwUjk4SFFxVzltNTN3dEpVenM0RFJsc3Fa?=
 =?utf-8?B?ZzVUSnhKVXF1c2dUWTRtaUVyeG5tb09PVXpsTTlDMkFHRWxjT0NQRXFTa3pO?=
 =?utf-8?B?MitLTWRSRXIzYnRrOUJnNTBzVHJuWkdUUmpYT3pGcXIrWUZGWnRsOHlUTDJ6?=
 =?utf-8?B?SWRXRzQwSGVRM2J6V2lNSit5WEp4bHVOUzgvWmFabTMwbkhleGlmdi9VaWJy?=
 =?utf-8?B?NGJLeFlqN2o0Mk1uYmlzVDlwVHYvbHl3ckpCcVZYSkIvNDBYdDZoTjl3c2dR?=
 =?utf-8?B?dVlMbGNxSWlqUHlsOWRBQ0ZaMGtyOVdmekpVUGlMNFdaTzF4QUxIRTlXeHRy?=
 =?utf-8?B?L1RZWnBPcWh2ZjhhVWRQZzBLL2V1bk55WG1iV3RmZUMvbitHai9NbTZJck9w?=
 =?utf-8?B?aHpzSHBiVnZBNWdMd1hiN3kvNlBxazYxM1VzcGNBd1lrc3JPZ2FNWFEwRHFz?=
 =?utf-8?B?V09Vb3RySW81Z3lYcU81NkNRMTFCM1JHbmlkQkdvajl5SmplY2hBSVBLdW9D?=
 =?utf-8?B?SzllL3hJR0JqcU9FZ2ZlNktDOFcwMWp0TUZybVNSUmdHL3dKSFdISVRhMCtZ?=
 =?utf-8?B?bGRaMmY4Q2wxbithNWZpVlpPWkEvMkN6SU1UUW9aK29aTGhIcGk3UE9TU1Ba?=
 =?utf-8?B?SWZRanBNOW5DbGZ4Y2pGdHZtZDE3SEtxUXVLRk9ZWnM5Y2phR1FLZW8yc0RJ?=
 =?utf-8?B?VFB4R3UyOGRnM3VENVkwemkrTU82WFFUdXFiT3hzREFGRllCNmFhSnVCYXlP?=
 =?utf-8?B?SXN6UVk3ZWNxWEZGeHNUeExmSlgwRmJoNFlkV0FvRWRaWUk2ZVdINHYzN1pR?=
 =?utf-8?B?U3Y3bS9LSm5iQUhzSnRjNTZ1OUwyK0FiUmRCT005azRjaXJ6U3ZHeU1lbDlE?=
 =?utf-8?B?QjRTZWVBZ2hzM3VaZ0QweURCUkFWL29JRXZVWGxCUVlwbWRIeG9sSm5EUVNs?=
 =?utf-8?B?YXhnTVZ3OE44Y3kyWXFXM3BjblZBTk1Ea095Vzh0U0VqQllFT1hRaFh5QTdE?=
 =?utf-8?B?ZDlsdE9XcXRMK1VnWWVpSTBFQXA4RVZjQlpYZE9ITFc2YVZwTUV0R1ZUaGc2?=
 =?utf-8?B?YTB2MGNlUXlYSWNwTXFWL2NSQWRaTmRKY2lBc25ZdU03K2RaS1dscnFDOTRi?=
 =?utf-8?B?cytuUCt5R0E5OWZucXlHc2I4cFlidW1yL2FOdytNbFVvYWFUZ3BHUVdYQk9X?=
 =?utf-8?B?a3dvTVNRN2pHeGVlVkFsNTZUZ3JvZ0lqb0p5aFRKdW01UENiOHRRd2Z6YWlp?=
 =?utf-8?B?RVdFQVVQY0JHUWZqNUFLemNGdks0UmdBNlFHR0VXcU1rNThUVDg2RERBRHRm?=
 =?utf-8?B?b3BVV0ZJTDdLZFBZbXIyejNlR0NJdWI2MndGcVFrVWk2MUZ0TGU1OHR3c3c4?=
 =?utf-8?B?M2NobmdvMWVXZ3pYUko4UmlGejNoWGQ3Sk9nTnAzUHlsYm9PNFUzdncvZm16?=
 =?utf-8?B?U21PYkQwWkZCVFI5S3FrbzRabHVnekpkWUE2bHc4OEpDWW9tT2tTK3p1YUpR?=
 =?utf-8?Q?CqvsQPAgGXQdb7RC3Dui+HLeEEXT0Ub8?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR01MB8613.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?LzczRzFsOFo5blN4VEEvVXV0Y1pPMEN2bE1ZVm1ickFWRVF6YkhINDFCVHZC?=
 =?utf-8?B?RmJqZ0sxZ1NFT2djSW1nMHdPd0JHdjNiU0pQSjZuQVc1c3F6Ym15TlhRMVFt?=
 =?utf-8?B?UFp2aVdNcTVCNm1IU3I4VE9Nd29oQXp1cmwvVEtBa2tHYTROME9jV1BoV2tm?=
 =?utf-8?B?Tlc4TWN5MVJCVzNSZGxyU1JIWkRzNlhkQXJabUNBTzlFbzFrK282aVhCN0hs?=
 =?utf-8?B?Szc4c0MzUEVETi9SbGU3dnJja3k0V3BkemREc1NRbnMrMkVuTEMxaW1TaWJ4?=
 =?utf-8?B?L3U1b29QdVQ4MCtoZFp2MUFrcDlDTnUrV282aElUQmZoT2hsUkZOVCs1dk8z?=
 =?utf-8?B?SlBhd3VSaW9hcXdFQTEvVXFaeWFhTzB6cFJEVWxCK0loZEFYbDRLQ3habmM1?=
 =?utf-8?B?OUpiNGUyZDNhbGMzbXNyNllYZ2pMTWtkdTdjUkVPWmZoMUFBRXRNY2hrZGJ6?=
 =?utf-8?B?b0tlZEY2Wlg3aEJLUGdvNXVESWRvQmR4WUNhVmVMWG1DUjdxMmY3WWFnL3FK?=
 =?utf-8?B?TVo4WC9TR0dFRzZiMXc5RXBnS3JvVmxJNWZLSjdRNE40bm5nWnYwWHRHZC9Y?=
 =?utf-8?B?UVZJWnBsMnNVL0t2dGQ0NXF6NTlmdTVmdGlhZ1lOZ05US3pNb0hrSkxrb0RG?=
 =?utf-8?B?T2FWYzNNS0pOb1FLRStMRlhsMllNSm5mQWtyazUvMWFScGE2QmVDQng2WUVY?=
 =?utf-8?B?VmRRNGpDaGtYYm0yd05QVnBRWDNyaDVwaXJFcm1ZdjVnU2FDdHZoWndLRUlC?=
 =?utf-8?B?Qkc5OGdtYk9IK1JxMzVua0FxWlRzQVlHeWZJTytMeWxUWTlpeUVKTXRQRFBT?=
 =?utf-8?B?YldFUW5uZ0xKRUdkcExJTVUzaGN4UkdobitwQTNIa2VmUCs2TWFtZjZHVEVJ?=
 =?utf-8?B?YW1ySGpQaFJDUCtOTzZLUlNtZWYrZ3JmV0RGNm5JSHRIbVZjandpVzBadEM1?=
 =?utf-8?B?aERIbzM4YWVzTVdSaVkvNk1ndHhzL0oxdUFuZVYweEVRR01xdmZ4YWFDRC9E?=
 =?utf-8?B?dnM5MTdtbmtudGdTRVdzN3lGZkJGbSsrbTFzVW9JR3NqZkI4eWVVVGJYSGVm?=
 =?utf-8?B?d2hzODhpMThVVGFqUmNmbWJxOFdldFN6MXRYODNncGY1d3dZdWJQdUhhSlZO?=
 =?utf-8?B?dzcxSXpONEpITm1QZVR1MFduMXNubHY2N0dieFZZUTJramx6WitrR1lRVEMv?=
 =?utf-8?B?WXdwK3FTYVN1S2wySGdRR2dCYUdOdDhLZE1MU2xkeXZlVXdET1RYcENwbXQ3?=
 =?utf-8?B?T1RNZ1hlamdyc1NMZTBtMW1HdXRPUTc3TXNzRDZpWDlJdDJsdnZhYUdNMmtB?=
 =?utf-8?B?d21kWXpKUGoxSnNObnNNRVpCVndaQzJqT1NWSW1lTkFrdlpJTVN0ZXNLdWl4?=
 =?utf-8?B?R0VqeWh6cTZ1TXlWR0wxSkZ1ZU9GUmp6a0paYWFBWGhjcTNJK21HUXNzZUZr?=
 =?utf-8?B?WEl1czlmNmRJVXBWV1k1QTBiaGlINVp2MWpiSXluZlh0RlBHQ1l1VW5jNHor?=
 =?utf-8?B?WHBHVXhHclI3SlZzaGVESTdjdDhJR25aV0RRV1gzWG1ud1A2Y0FxM0RJYnI0?=
 =?utf-8?B?bXhlcGlTalBLSXFtL0ZDakFoK04vdGtDY1JyYUE2MDcwLzMrS1lnQm0yLzM0?=
 =?utf-8?B?ZjhPVWFIZW5zeEJHdkdxTWJPU2hvZEhOcjdRbWxWSXo0V0tibDFvaitwWlV4?=
 =?utf-8?B?NmJ6YnpTYWJzbGJKV1ZUOGI0YkRyN0tudkcrSkIzdCszZ2VpN3FleVBKa0F0?=
 =?utf-8?B?d1Z3ZUNBYWZJRXhrL01oTzBNc25vTHhwcmMweis3cDFhdzR1SGsxWXgvb291?=
 =?utf-8?B?cEFKTGJUZ0JPZDNBZ3dQbUx4SlRvZElOTytuUnA1OXhrd3FvenpSc2VKOU1T?=
 =?utf-8?B?SDEzTXNiNms2L1dldUtYL2ZVaUpCZEFlc1E1ekNJKzR0djJkbU10dXFhbit5?=
 =?utf-8?B?ZGtvTTRWYm9BMXc0NXY5dkVrNWNweFAvNWZId3dvb0d1UEVrdVdpb2pxN1V1?=
 =?utf-8?B?ZVNDYmRMd1MwQzdZb21aQkc1QmlDOVgyUzFGYTZ3K0FuNm12U1JhQVdUWXZV?=
 =?utf-8?B?S2VxMG5uMDNScnhnSk02Y29ISmtJcnlNMnpvTkZYSG1lR2xLS2c3NXBmNERt?=
 =?utf-8?B?czlnT085S3RINjRHcjVRUmVNM2daZVlhM2s5ZEx0ZjJnanRMZ25weEhCS0Fx?=
 =?utf-8?B?bVE9PQ==?=
X-OriginatorOrg: becom-group.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7594b606-264a-43dc-9fa8-08de25d67347
X-MS-Exchange-CrossTenant-AuthSource: PAXPR01MB8613.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 12:40:12.2508
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 738f6472-f50a-488c-ab88-c200fd976533
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Toq21byo48mdtzi32vNiW5vCMDiWFnwa5WojD4OxwVsGtXFb58FHxJI+anpQCrb3ZbdrF6QtLWdk2Dd5ktQWiLD57/xCv3uVdkNiUI3rCXU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR01MB6664

This commit adds support for the wsen tids-2521020222501. It is a
low cost and small-form-factor i2c temperature sensor.

It supports the following features:
- Continuous temperature reading in four intervals: 5 ms, 10 ms,
  20 ms and 40 ms.
- Low temperature alarm
- High temperature alarm

The driver supports following hwmon features:
- hwmon_temp_input
- hwmon_temp_min_alarm
- hwmon_temp_max_alarm
- hwmon_temp_min_hyst
- hwmon_temp_max_hyst
- hwmon_chip_update_interval

Additional notes:
- The update interval only supports four fixed values.
- The alarm is reset on reading.
---
 drivers/hwmon/Kconfig  |  10 +
 drivers/hwmon/Makefile |   1 +
 drivers/hwmon/tids.c   | 560 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 571 insertions(+)
 create mode 100644 drivers/hwmon/tids.c

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 8c852bcac26f..5e578241001f 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -2647,6 +2647,16 @@ config SENSORS_WM8350
 	  This driver can also be built as a module. If so, the module
 	  will be called wm8350-hwmon.
 
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
 config SENSORS_ULTRA45
 	tristate "Sun Ultra45 PIC16F747"
 	depends on SPARC64
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index a8de5bc69f2a..def052b2bdfa 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -244,6 +244,7 @@ obj-$(CONFIG_SENSORS_W83L785TS)	+= w83l785ts.o
 obj-$(CONFIG_SENSORS_W83L786NG)	+= w83l786ng.o
 obj-$(CONFIG_SENSORS_WM831X)	+= wm831x-hwmon.o
 obj-$(CONFIG_SENSORS_WM8350)	+= wm8350-hwmon.o
+obj-$(CONFIG_SENSORS_TIDS) += tids.o
 obj-$(CONFIG_SENSORS_XGENE)	+= xgene-hwmon.o
 
 obj-$(CONFIG_SENSORS_OCC)	+= occ/
diff --git a/drivers/hwmon/tids.c b/drivers/hwmon/tids.c
new file mode 100644
index 000000000000..0176a5e8b574
--- /dev/null
+++ b/drivers/hwmon/tids.c
@@ -0,0 +1,560 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+/*
+ * Copyright (c) BECOM Electronics GmbH
+ *
+ * wsen_tids_2521020222501.c - Linux hwmon driver for WSEN-TIDS
+ *                             2521020222501 Temperature sensor
+ *
+ * Author: Thomas Marangoni <thomas.marangoni@becom-group.com>
+ */
+
+#include <linux/bits.h>
+#include <linux/delay.h>
+#include <linux/hwmon.h>
+#include <linux/hwmon-sysfs.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+/*
+ * TIDS registers
+ */
+#define TIDS_CMD_DEVICE_ID	0x01
+#define TIDS_CMD_T_H_LIMIT	0x02
+#define TIDS_CMD_T_L_LIMIT	0x03
+#define TIDS_CMD_CTRL		0x04
+#define TIDS_CMD_STATUS		0x05
+#define TIDS_CMD_DATA_T_L	0x06
+#define TIDS_CMD_DATA_T_H	0x07
+#define TIDS_CMD_SOFT_REST	0x0C
+
+/*
+ * TIDS device IDs
+ */
+#define TIDS_ID_2521020222501 0xa0
+
+enum tids_update_interval {
+	tids_update_interval_40ms = 0,
+	tids_update_interval_20ms = 1,
+	tids_update_interval_10ms = 2,
+	tids_update_interval_5ms = 3,
+};
+
+/* TIDS control register */
+static const struct reg_field tids_reg_field_ctrl_one_shot =
+	REG_FIELD(TIDS_CMD_CTRL, 0, 0);
+static const struct reg_field tids_reg_field_ctrl_freerun =
+	REG_FIELD(TIDS_CMD_CTRL, 2, 2);
+static const struct reg_field tids_reg_field_ctrl_if_add_inc =
+	REG_FIELD(TIDS_CMD_CTRL, 3, 3);
+static const struct reg_field tids_reg_field_ctrl_avg =
+	REG_FIELD(TIDS_CMD_CTRL, 4, 5);
+static const struct reg_field tids_reg_field_ctrl_bdu =
+	REG_FIELD(TIDS_CMD_CTRL, 6, 6);
+/* TIDS status register */
+static const struct reg_field tids_reg_field_status_busy =
+	REG_FIELD(TIDS_CMD_STATUS, 0, 0);
+static const struct reg_field tids_reg_field_status_over_thl =
+	REG_FIELD(TIDS_CMD_STATUS, 1, 1);
+static const struct reg_field tids_reg_field_status_under_tll =
+	REG_FIELD(TIDS_CMD_STATUS, 2, 2);
+/* TIDS reset register */
+static const struct reg_field tids_reg_field_soft_reset =
+	REG_FIELD(TIDS_CMD_SOFT_REST, 1, 1);
+
+struct tids_data {
+	struct i2c_client *client;
+
+	struct regmap *regmap;
+
+	/* regmap field for ctrl register */
+	struct regmap_field *reg_ctrl_one_shot;
+	struct regmap_field *reg_ctrl_freerun;
+	struct regmap_field *reg_ctrl_if_add_inc;
+	struct regmap_field *reg_ctrl_avg;
+	struct regmap_field *reg_ctrl_bdu;
+
+	/* regmap field for status register */
+	struct regmap_field *reg_status_busy;
+	struct regmap_field *reg_status_over_thl;
+	struct regmap_field *reg_status_under_tll;
+
+	/* regmap field for soft reset register*/
+	struct regmap_field *reg_soft_reset;
+
+	int irq;
+	int temperature;
+};
+
+static ssize_t tids_interval_read(struct device *dev, long *val)
+{
+	int ret = 0;
+	unsigned int avg_value = 0;
+	struct tids_data *data = dev_get_drvdata(dev);
+
+	ret = regmap_field_read(data->reg_ctrl_avg, &avg_value);
+	if (ret < 0)
+		return ret;
+
+	switch (avg_value) {
+	case tids_update_interval_40ms:
+		*val = 40;
+		break;
+	case tids_update_interval_20ms:
+		*val = 20;
+		break;
+	case tids_update_interval_10ms:
+		*val = 10;
+		break;
+	case tids_update_interval_5ms:
+		*val = 5;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static ssize_t tids_interval_write(struct device *dev, long val)
+{
+	unsigned int avg_value = 0;
+	struct tids_data *data = dev_get_drvdata(dev);
+
+	switch (val) {
+	case 40:
+		avg_value = tids_update_interval_40ms;
+		break;
+	case 20:
+		avg_value = tids_update_interval_20ms;
+		break;
+	case 10:
+		avg_value = tids_update_interval_10ms;
+		break;
+	case 5:
+		avg_value = tids_update_interval_5ms;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return regmap_field_write(data->reg_ctrl_avg, avg_value);
+}
+
+static int tids_temperature1_read(struct device *dev, long *val)
+{
+	int ret;
+	u8 buf[2] = { 0 };
+	struct tids_data *data = dev_get_drvdata(dev);
+
+	ret = regmap_bulk_read(data->regmap, TIDS_CMD_DATA_T_L, buf, 2);
+	if (ret < 0)
+		return ret;
+
+	// temperature in °mC
+	*val = (((s16)(buf[1] << 8) | buf[0])) * 10;
+
+	return 0;
+}
+
+static ssize_t tids_temperature_alarm_read(struct device *dev, u32 attr,
+					   long *val)
+{
+	int ret = 0;
+	unsigned int reg_data = 0;
+	struct tids_data *data = dev_get_drvdata(dev);
+
+	if (attr == hwmon_temp_min_alarm)
+		ret = regmap_field_read(data->reg_status_under_tll, &reg_data);
+	else if (attr == hwmon_temp_max_alarm)
+		ret = regmap_field_read(data->reg_status_over_thl, &reg_data);
+	else
+		return -EOPNOTSUPP;
+
+	if (ret < 0)
+		return ret;
+
+	*val = reg_data;
+
+	return 0;
+}
+
+static int tids_temperature_hyst_read(struct device *dev, u32 attr, long *val)
+{
+	int ret;
+	struct tids_data *data = dev_get_drvdata(dev);
+	unsigned int reg_data = 0;
+
+	if (attr == hwmon_temp_min_hyst)
+		ret = regmap_read(data->regmap, TIDS_CMD_T_L_LIMIT, &reg_data);
+	else if (attr == hwmon_temp_max_hyst)
+		ret = regmap_read(data->regmap, TIDS_CMD_T_H_LIMIT, &reg_data);
+	else
+		return -EOPNOTSUPP;
+
+	if (ret < 0)
+		return ret;
+
+	// temperature from register conversion in °mC
+	*val = (((u8)reg_data - 63) * 640);
+
+	return 0;
+}
+
+static ssize_t tids_temperature_hyst_write(struct device *dev, u32 attr,
+					   long val)
+{
+	u8 reg_data = 0;
+	struct tids_data *data = dev_get_drvdata(dev);
+
+	// temperature in °mC
+	if (val < -39680 || val > 122880)
+		return -EINVAL;
+
+	// temperature to register conversion in °mC
+	reg_data = (u8)((val / 640) + 63);
+
+	if (attr == hwmon_temp_min_hyst)
+		return regmap_write(data->regmap, TIDS_CMD_T_L_LIMIT, reg_data);
+	else if (attr == hwmon_temp_max_hyst)
+		return regmap_write(data->regmap, TIDS_CMD_T_H_LIMIT, reg_data);
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
+		case hwmon_temp_min_hyst:
+		case hwmon_temp_max_hyst:
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
+		case hwmon_temp_min_hyst:
+		case hwmon_temp_max_hyst:
+			return tids_temperature_hyst_read(dev, attr, val);
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
+		case hwmon_temp_min_hyst:
+		case hwmon_temp_max_hyst:
+			return tids_temperature_hyst_write(dev, attr, val);
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
+					 HWMON_T_MAX_ALARM | HWMON_T_MIN_HYST |
+					 HWMON_T_MAX_HYST),
+	NULL
+};
+
+static const struct hwmon_ops tids_ops = {
+	.is_visible = tids_hwmon_visible,
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
+	if (reg >= 0x02 && reg <= 0x04)
+		return true;
+
+	if (reg == 0x0c)
+		return true;
+
+	return false;
+}
+
+static bool tids_regmap_readable_reg(struct device *dev, unsigned int reg)
+{
+	if (reg >= 0x01 && reg <= 0x07)
+		return true;
+
+	if (reg == 0x0c)
+		return true;
+
+	return false;
+}
+
+static bool tids_regmap_volatile_reg(struct device *dev, unsigned int reg)
+{
+	if (reg >= 0x05 && reg <= 0x07)
+		return true;
+
+	if (reg == 0x0c)
+		return true;
+
+	return false;
+}
+
+static const struct regmap_config regmap_config = {
+	.reg_bits			= 8,
+	.val_bits			= 8,
+	.max_register		= TIDS_CMD_SOFT_REST,
+	.writeable_reg		= tids_regmap_writeable_reg,
+	.readable_reg		= tids_regmap_readable_reg,
+	.volatile_reg		= tids_regmap_volatile_reg,
+	.use_single_read	= 0,
+};
+
+static int tids_probe_regmap(struct tids_data *data)
+{
+	struct device *dev = &data->client->dev;
+
+	/* Init regmap */
+	data->regmap = devm_regmap_init_i2c(data->client, &regmap_config);
+	if (IS_ERR(data->regmap))
+		return dev_err_probe(dev, PTR_ERR(data->regmap),
+				     "regmap initialization failed\n");
+
+	/* Allocate regmap_field for ctrl register */
+	data->reg_ctrl_one_shot = devm_regmap_field_alloc(
+		dev, data->regmap, tids_reg_field_ctrl_one_shot);
+	if (IS_ERR(data->reg_ctrl_one_shot))
+		return dev_err_probe(
+			dev, PTR_ERR(data->reg_ctrl_one_shot),
+			"regmap_field reg_ctrl_one_shot initialization failed\n");
+
+	data->reg_ctrl_freerun = devm_regmap_field_alloc(
+		dev, data->regmap, tids_reg_field_ctrl_freerun);
+	if (IS_ERR(data->reg_ctrl_freerun))
+		return dev_err_probe(
+			dev, PTR_ERR(data->reg_ctrl_freerun),
+			"regmap_field reg_ctrl_freerun initialization failed\n");
+
+	data->reg_ctrl_if_add_inc = devm_regmap_field_alloc(
+		dev, data->regmap, tids_reg_field_ctrl_if_add_inc);
+	if (IS_ERR(data->reg_ctrl_if_add_inc))
+		return dev_err_probe(
+			dev, PTR_ERR(data->reg_ctrl_if_add_inc),
+			"regmap_field reg_ctrl_if_add_inc initialization failed\n");
+
+	data->reg_ctrl_avg = devm_regmap_field_alloc(dev, data->regmap,
+						     tids_reg_field_ctrl_avg);
+	if (IS_ERR(data->reg_ctrl_avg))
+		return dev_err_probe(
+			dev, PTR_ERR(data->reg_ctrl_avg),
+			"regmap_field reg_ctrl_avg initialization failed\n");
+
+	data->reg_ctrl_bdu = devm_regmap_field_alloc(dev, data->regmap,
+						     tids_reg_field_ctrl_bdu);
+	if (IS_ERR(data->reg_ctrl_bdu))
+		return dev_err_probe(
+			dev, PTR_ERR(data->reg_ctrl_bdu),
+			"regmap_field reg_ctrl_bdu initialization failed\n");
+
+	/* Allocate regmap_field for status register */
+	data->reg_status_busy = devm_regmap_field_alloc(
+		dev, data->regmap, tids_reg_field_status_busy);
+	if (IS_ERR(data->reg_status_busy))
+		return dev_err_probe(
+			dev, PTR_ERR(data->reg_status_busy),
+			"regmap_field reg_status_busy initialization failed\n");
+
+	data->reg_status_over_thl = devm_regmap_field_alloc(
+		dev, data->regmap, tids_reg_field_status_over_thl);
+	if (IS_ERR(data->reg_status_over_thl))
+		return dev_err_probe(
+			dev, PTR_ERR(data->reg_status_over_thl),
+			"regmap_field reg_status_over_thl initialization failed\n");
+
+	data->reg_status_under_tll = devm_regmap_field_alloc(
+		dev, data->regmap, tids_reg_field_status_under_tll);
+	if (IS_ERR(data->reg_status_under_tll))
+		return dev_err_probe(
+			dev, PTR_ERR(data->reg_status_under_tll),
+			"regmap_field reg_status_under_tll initialization failed\n");
+
+	/* Allocate regmap_field for software_reset */
+	data->reg_soft_reset = devm_regmap_field_alloc(
+		dev, data->regmap, tids_reg_field_soft_reset);
+	if (IS_ERR(data->reg_soft_reset))
+		return dev_err_probe(
+			dev, PTR_ERR(data->reg_soft_reset),
+			"regmap_field reg_soft_reset initialization failed\n");
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
+	int ret = 0;
+
+	data = devm_kzalloc(device, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->client = client;
+
+	ret = tids_probe_regmap(data);
+	if (ret != 0)
+		return ret;
+
+	/* Read device id, to check if i2c is working */
+	ret = regmap_read(data->regmap, TIDS_CMD_DEVICE_ID, &value);
+	if (ret < 0)
+		return ret;
+
+	/* Triggering soft reset */
+	ret = regmap_field_write(data->reg_soft_reset, 1);
+	if (ret < 0)
+		return ret;
+
+	ret = regmap_field_write(data->reg_soft_reset, 0);
+	if (ret < 0)
+		return ret;
+
+	/* Allowing bulk read */
+	ret = regmap_field_write(data->reg_ctrl_if_add_inc, 1);
+	if (ret < 0)
+		return ret;
+
+	/* Set meassurement interval */
+	ret = regmap_field_write(data->reg_ctrl_avg, tids_update_interval_40ms);
+	if (ret < 0)
+		return ret;
+
+	/* Set device to free run mode */
+	ret = regmap_field_write(data->reg_ctrl_freerun, 1);
+	if (ret < 0)
+		return ret;
+
+	/* Don't update temperature register until high and low value are read */
+	ret = regmap_field_write(data->reg_ctrl_bdu, 1);
+	if (ret < 0)
+		return ret;
+
+	hwmon_dev = devm_hwmon_device_register_with_info(
+		device, device->driver->name, data, &tids_chip_info, NULL);
+
+	return PTR_ERR_OR_ZERO(hwmon_dev);
+}
+
+static int tids_suspend(struct device *dev)
+{
+	struct tids_data *data = dev_get_drvdata(dev);
+
+	return regmap_field_write(data->reg_ctrl_freerun, 0);
+}
+
+static int tids_resume(struct device *dev)
+{
+	struct tids_data *data = dev_get_drvdata(dev);
+
+	return regmap_field_write(data->reg_ctrl_freerun, 1);
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
+	{ .compatible = "wsen,tids-2521020222501" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, tids_of_match);
+
+static struct i2c_driver tids_driver = {
+	.class	= I2C_CLASS_HWMON,
+	.driver = {
+		.name			= "tids",
+		.pm				= pm_sleep_ptr(&tids_dev_pm_ops),
+		.of_match_table = tids_of_match,
+	},
+	.probe		= tids_probe,
+	.id_table	= tids_id,
+};
+
+module_i2c_driver(tids_driver);
+
+MODULE_AUTHOR("Thomas Marangoni <Thomas.Marangoni@becom-group.com>");
+MODULE_DESCRIPTION("WSEN TIDS temperature sensor driver");
+MODULE_LICENSE("GPL");
-- 
2.51.1

