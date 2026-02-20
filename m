Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012016.outbound.protection.outlook.com [52.101.48.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 925002C15B5;
	Fri, 20 Feb 2026 14:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771599527; cv=fail; b=Epd8hmjDVuqcvFAX35uz7qAIh1Ij/79ywlDH5yeyLtgRRqRimiPtiOgIr+rX8Nhi/PrIsGbuwS4uL3ohPTjMbx7fB+95F0rLBJvPtR8XJsopCHZjjy6Xlm3DXc1x5cg/dW/eMNeNoyMIb7/W0pWcIG2UMbg9mTB3b3kijnvma9I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771599527; c=relaxed/simple;
	bh=ksRZ8MtvTnThsCmOVkdmdtLldauzp+z+aym40GHFknA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Hli/IARMOQg87fIXSm5aL3A4wKW5rWPPq3UbSACw+ek6HRF1GdL0Z8TRxS2oht1L9DhCsUYjQMGljtS4sbLryvZeGawhtKcPwrLc7+ypLiPaNghCW6ATklyFvDfDzsXQItI1yE5GQ6dgZA20LWE+wJLCzX5gcBJZ7ynhHEC6ozM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=Q/RihT1j; arc=fail smtp.client-ip=52.101.48.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="Q/RihT1j"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vsERl6mAqUG0+tx3dNyKk3IlYgN/dwcuXfjYlb734+UMLCMxIJimIWnE1Dbyu40xYEgqNoY08tQbDb8mCrkkbipxybRJyTUSc7jYRZKLgmX9zwQiIRms9JGoFGWo1d+Kvjw32xvv9xX+pHfFdLjzwYqEGsdu1PmWRN9i03Vnl2dN8jMJkb/QFSQxc/Mmc7bP8lXPCude6bDTMm9jEmp2W2eC9fiFiEA29RBjJvs1IxrJyNmG4XhOgINtnLRY+QlOZyJ5cjwjX154z4tlz6NdlqU4Hf4pn3cwS5H+ZpzW+GkNtycQsU92KNogAybUxBftjvO0Mi2vVGqaMJZpsZbHXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ksRZ8MtvTnThsCmOVkdmdtLldauzp+z+aym40GHFknA=;
 b=GEoRBMsPTzUGHlnnE132g0+wJxhT1gKnq4TlJv1W9fX0AMwGFcU8eSUiBmKfTBljYwAOrTGt9ixRTNb8lCmJ9+umHTQOkG5j+vGVaK4hn+Bkhgp1H6ADznwMCCtfZBnFdlbagjIHgTcsitaNirHy7hwYD/8HZB0frl/Dz/DK2eNmwzQKNxQpSCr5lTFFxfa3QOLFcl8fZL3cgz1HHTdJS5HqA4jJ8Ha3W74YNTkW7btb7CydOO7hcVtfE9CBg7CXg1cDSWLsoIBar+D/DkK833kOks0AefBlDMPsPqAlzMXNGilemOR30nokwaOLhad5c/7oucJ/KSKDzh3IYgNbxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ksRZ8MtvTnThsCmOVkdmdtLldauzp+z+aym40GHFknA=;
 b=Q/RihT1jEzoI02JHy8m+uMeX0Mb4DpEmNGweE6zsx9e3yBpTdCCSUWZRgYw99Ft9FfJad5WcKZqnYLbX1KNnSdhaqKKxEuloqEh4G+hZw0TULSs+nTA+3maX8EySQNiSyI0XOBEzO+gFs8S3kah54FZT8kxFAPOnvCdDpMrJdtoZDakyrvnXN8IY1x+YTP82/aHA0C0rn1cEIJUiEMIh9F/nUGfJpGo0nICU/uqPs82qMnYuG83UyKzNkc9wtwl4teW14+n/MwGZKRgsIJLZdFxtN2j6rSVDfk58LpOcAHsznHkKuGQB341duS6u8rUN9VvunEql24NRdtWne2dAEA==
Received: from SN7PR11MB7511.namprd11.prod.outlook.com (2603:10b6:806:347::17)
 by DS0PR11MB8019.namprd11.prod.outlook.com (2603:10b6:8:12e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.15; Fri, 20 Feb
 2026 14:58:40 +0000
Received: from SN7PR11MB7511.namprd11.prod.outlook.com
 ([fe80::b0d5:a33a:26fd:3fa0]) by SN7PR11MB7511.namprd11.prod.outlook.com
 ([fe80::b0d5:a33a:26fd:3fa0%6]) with mapi id 15.20.9632.015; Fri, 20 Feb 2026
 14:58:40 +0000
From: <Victor.Duicu@microchip.com>
To: <krzk@kernel.org>
CC: <corbet@lwn.net>, <linux@roeck-us.net>, <linux-hwmon@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <robh@kernel.org>,
	<linux-kernel@vger.kernel.org>, <krzk+dt@kernel.org>,
	<linux-doc@vger.kernel.org>, <conor+dt@kernel.org>,
	<Marius.Cristea@microchip.com>
Subject: Re: [PATCH v10 1/2] dt-bindings: hwmon: add support for MCP998X
Thread-Topic: [PATCH v10 1/2] dt-bindings: hwmon: add support for MCP998X
Thread-Index: AQHcoBa9pxaxrTCHNUam0PksYnBYNrWHUwkAgARfnYA=
Date: Fri, 20 Feb 2026 14:58:40 +0000
Message-ID: <9a39d9f1d97eea245dd194a2db481297b92c6fbf.camel@microchip.com>
References: <20260217-add-mcp9982-hwmon-v10-0-5e0aaae6f289@microchip.com>
	 <20260217-add-mcp9982-hwmon-v10-1-5e0aaae6f289@microchip.com>
	 <20260217-sincere-spotted-lionfish-d7abca@quoll>
In-Reply-To: <20260217-sincere-spotted-lionfish-d7abca@quoll>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB7511:EE_|DS0PR11MB8019:EE_
x-ms-office365-filtering-correlation-id: 9d715ee5-babf-47f6-b8ff-08de70908898
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?UmdOZEpueWZwYkJYalZaTkdWRGhPNk1rWFkxWDZYMFQ5WXVrZmdnMjZFT3Fm?=
 =?utf-8?B?TSt5b2NRUTRXWEc5OTZRRXhnY3g5em9GK293bXloRWcraWdIWHVZcGF6eE5F?=
 =?utf-8?B?R3g0TkR3UHFsVVliRGVBMzFHbHBLVVBmaUVSYWRNb2tLNmN5SktiU0wxUlVr?=
 =?utf-8?B?c2s0QzhmcjJxVEJYSW9VaHhkaDJIbWdNaGYxVGcwSkJhdDdmU3BjWVVWWUla?=
 =?utf-8?B?aTRmT2ZSR2J0VmtaODBuVitZeVUwU3dSSXVvNlBJYkNVdEtPV3NZUVhNdk9a?=
 =?utf-8?B?VXI2dU5ybGE3SC95KzhUYW10Tjc1dW8xRDhsdnh1RXlGTDg0dTlhWlZEa0t5?=
 =?utf-8?B?cmgweEJLTnA3MUYxQkpobnUwR01tR3ZmM1k4V1AvbUN1Z1Vod243aEZ6aW5Q?=
 =?utf-8?B?UEZPYUg4WkgzaWVsS2tML1g0RitkZjk0aEhmcHdYVlo3Wk1YNitkcGVpRjAv?=
 =?utf-8?B?MFJJcFhZZE11SVhlOTRRcGRrUUFoV0lHWTlIdEc3aitkNG81V2pFTzgwOG42?=
 =?utf-8?B?V1RLNHloYXp6WFpMTzZxSlRLWEp5bGF2elp6SnhyOHhJMjhMWVlFR3pGVUdo?=
 =?utf-8?B?ME5GaFJCSGoycDdBV2lvcSsxOWhZYW9DZTd3bHljL1g0N1A3QjRJSzJHU0lV?=
 =?utf-8?B?Mzh5c2JFMlppRStnc0xqdkl0elZLeVJQdUtSTzJYUWdYUHZ4NWpXRlJxeHJ1?=
 =?utf-8?B?Z091MzJyWHdFNHhCVW43cnhmZGlRSy9saDFacjlVOVZaRnNYYzd0bzVVSjg5?=
 =?utf-8?B?a3l3V2lxZ2xlVHNLK1VSaGNQNlo4YVlpVzRLSFdVbzBtcXNqa01TcXhveHNt?=
 =?utf-8?B?QWdpUU1qZ1ZES0JvQmY5NXduSTdYOXhQQ05hOHZZcU01Q1JxRTZGV1Z0dHhL?=
 =?utf-8?B?SXJ0WUNiSkRiQkE0OXNjSGl4cE1ld1JtM3pJV1pBZWNnWjBUT05rNXhUSFh4?=
 =?utf-8?B?ZjFoV2RSaWFOZ0trVEc2U0tJdi9nd2IxWSsrM2NFL0Q3QVhtZW5rSVpyZnlL?=
 =?utf-8?B?VE9rem5TMkZGbGRCeVRmVlVydml2NzVCNzI0bU9iS3pjWkNMWjkzNmdlYVRs?=
 =?utf-8?B?amN6ZUFHU2MwZ2pRbXY0N3dtcUpROGlYUHBQTlJDcmVUNDlic0UxY0dzZUxQ?=
 =?utf-8?B?WTBSSU5vWFJaYk5VMGFEcml5dEgzODZ0RUNXbFREeC9UNG5kZE5lN1pXZis1?=
 =?utf-8?B?cTZxbTNXeFJiVTRadmxOMndKNHZ4bzFoam9EcXNySnhybGwyWUVtUXBBYnRQ?=
 =?utf-8?B?UTE3bkJoSGIzMnpHMm5jWDJwTm9GMjVOZTRLYkFwUWpma0VCMlhOZHdXOE5z?=
 =?utf-8?B?SjBNMHBIK3c4emsybnhGalROaFFwdXlqUmxtY21hNTkwU3NBNGZoTjI3ZWVX?=
 =?utf-8?B?ZW1MRkxyK29acEFZeHlTZC9iWHpwUGsrS2E2cjlkc2tqaWZJOEpxaEVpVHBl?=
 =?utf-8?B?S0pMOENnZUIxaWZHVG5oaDcyaUhuR2w0NHZqNTlhWkNVRVd1R2FjRDFlWXlZ?=
 =?utf-8?B?Z1NiOFdMbzFnclZIWEJ3Z1FieHlpbGR1Uk5pSnQ5UVh5bEJPMkl4VHU3dnYz?=
 =?utf-8?B?K09pUDhWVmxubjJ2QXNsYW81ZWRNbWJEYk1sK2Jaa2hnY0E5UEsyaVlBRGpy?=
 =?utf-8?B?S21ZMis2MVhVZEZYc1FOak9nV3RKakhLT0liOE0yb29LL1hpWUEvSTZSRnVk?=
 =?utf-8?B?MDE4STVtTUVid0ZXUEw1eGM5R1NXMFd1RytDMnhGcHhCK1Flc1VjV0FJc0xr?=
 =?utf-8?B?SStmR2xzZnhHSk9UYmNwZnc5ajhsMFFwcjZNaDc1NlhMaHQxMGYrbWNMb09i?=
 =?utf-8?B?M214RWFrMWRGeFB0clJWWmpmY25zVTc5ak1rRDRxdnZUY3AwL2tUQng5Z3Jh?=
 =?utf-8?B?Ukx1NSsrdUNjMExZeVEwYjd3ektqaHNINnZKNVFjVjRJVno1NzJ1cGFqVXB0?=
 =?utf-8?B?a0RpbU9vTXNpdGxrKzZ5ais4M2srS1l5bGE0RW5ndG91RzM5anFzdDFSemxU?=
 =?utf-8?B?R0p2NWo3dnhvNlIrdFBNVDJxTWNmckp4TlJiaC81UkE2UGNXT2Q1eTFrSWg1?=
 =?utf-8?B?ejBCUGlaRjJvWDgzOFBlTlozeW5JeUZqMjY1SlM1VllmakFRQkNPR0c2UXJ6?=
 =?utf-8?B?d0xodEFBREdaUzhJV05CcXViMU9MYUhxWEtva2xDOTZ3RFpHWHNRMUMxV1I5?=
 =?utf-8?B?TlE9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB7511.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RWFoN0xwVU0zYVE3c3NIWGtJOTVaTlFsaHJyMC9LQXYzVHBMRU5JOG5oOGhn?=
 =?utf-8?B?K3ZmdG5scFNqMVdQUmYwQVAycWFwdkh3NUIzUCtnUFBRc1ZJRmN2RThYcEhK?=
 =?utf-8?B?cjk1N0drT0NoU0k5a1FVS2NBQ0VIOTBJVzZFTnhydHdnTVFrT0x0TGdZbVFM?=
 =?utf-8?B?SFlTM2xJdG01eFh1azQ4ZDBWUm1VdS9aWFhDNU5WREVENm1IY3Y2RzJ3WHEz?=
 =?utf-8?B?dWNNMndKQXBtQjI1YXNOV2FBdTFJdjkwZHVrVDVsRk5Ball1aHArRkw2cW5Y?=
 =?utf-8?B?TitndGtIb1VINzVvUUpJUlJpOFZVN25UTm9JT0M2NUg0RGNMZ1FvUy9xNEpC?=
 =?utf-8?B?UG5VVlp6ZDc2SVZnc2hwdC94cEJNbys1bXZ2N1Y2RFlzRWVXSE5tYnhmNUxi?=
 =?utf-8?B?bnhVdS9ZWWdUZzNMSVgxSFJSajQ4NkNZY0xvZER5bkszc0d5WGt4aXk4RDUx?=
 =?utf-8?B?WTRWMDdqU2EwMnVMckN5Vk8vVjEwM3UvUzZ0RXNlVW1FWFg2SjZtejhBaFBu?=
 =?utf-8?B?MWNmSzVTQ3ZRQXdkbjg0TmVJR25IQWg1MlhUWlBWSU9GOGh4Z1dlMGMrYUpj?=
 =?utf-8?B?ak5nLzBPd0dNWm1OWlo2WVNHcy8zZXFRM09oZmZieGQvUkZQWWN6QityWXY1?=
 =?utf-8?B?aDNSN3hDRTNIOWY3SHJTVlM3NWx0WEtXeTJYaUV5YWxMdVJxcmlnZ3BkdGYx?=
 =?utf-8?B?OUN4NnJIODNvMy9udGt2YUovMlpSZGgyZ1NVaGxpbUNYUlREcVg5K0FFSVFM?=
 =?utf-8?B?eXlQTDRpQkU1MWtjZGNxUUJaUWdzRE1oMS9jb0VQNUNDaEVHYzMraTJ1SEQ4?=
 =?utf-8?B?K0VFVTE1b3k5cXJGbDNLSFlKMzFhSnlNYTFiMXJUdGV2V2VYMVIwQWRWL2M0?=
 =?utf-8?B?SkdqM3RRTzRxR1RVQ3ZncGpQUUkwejhNb2hEQlBaeS9FbXlsem5jK2xId2JX?=
 =?utf-8?B?d3UxaDNpMUhCQk1wYkI1N3JrRDBUL1QzRHNQZTlpSWNNOWN5ZTBWd09wK29U?=
 =?utf-8?B?akNicXFxSk8ySTlTYXVFb2NtUUF0Mk92TFZ5WDBLWmhVdGVReS9tanRPMStH?=
 =?utf-8?B?cFNGQ01rUlRHZ2tpMUVscnUrRFR2V0pneGd4U0Fia01ZUGt4aXlBRFltRFk4?=
 =?utf-8?B?WlZjSUV4MEVkckpGMEpEaElFOExoSG9GRkxEczRZa00xSFlhNzRYM3hTVm9S?=
 =?utf-8?B?NElvUWI2VGJ6d2ppdm1nWU5XWEs5clNNRi9vRzhydW9YRU1WalZCTTF4Y3RC?=
 =?utf-8?B?d3UzdEN1amVaZmdvTGRsVnNwRFBtcUhnci8vOG43enpPcjFIb0lsbkdBcjJr?=
 =?utf-8?B?Y0htZStPUzlGVFlERjRVTFAxNE1aUUJoa0QyZmtZMVVadEdRR2pMNjR1RXdC?=
 =?utf-8?B?MDlNemszZDdHOXY5VHlMKzg3OGFlS3pwSUttTWgyYzlwVHBmdW5xVWdBQldQ?=
 =?utf-8?B?emp1NTJmWDV1VGQ5Ukg4TkxSQzdsbGYvS0FxSjNNeHBCc1NleWNnSzlseDNy?=
 =?utf-8?B?V0Rqb1E2K1JSRWRSWlJMMC9neHVKaHUvSXJzZnpQOGl1R1oxY3VRZlJuVGFZ?=
 =?utf-8?B?K0huOFJXYTIwYUR3bU1URjQwSjVFM1haSm04UXZwa3pqcXVnVjV0d0h1WVBF?=
 =?utf-8?B?NXRzcERkSkZLZUdTejVsVnAySzE1a3dNUUFvenJneXJQWGtuWXBBMnhOU3lj?=
 =?utf-8?B?Q2F0SkM4NXViKzdoWTFyMFBtbnF6MDRjWVlWQzBIMjN1Wm4vaWxIcFhoRFNn?=
 =?utf-8?B?VlYxMEdaYkljL3A0RzNPbWh4L2JOTEdTbE40M0ZsZUxaaVM5cFpzdGtma0pC?=
 =?utf-8?B?ejJBWE4vYnRhbU9Ic1JMcCtFTFY2ZTNVQzhzM1NsSGlYbExSdThBRkhTbGtq?=
 =?utf-8?B?bjhCT3hzZFI0N1g2ZjlGNjc4Ulc2RTNMTEVKc2tMU3ZGZS9TK0FtWHdwbTIw?=
 =?utf-8?B?Qmx1aFpLbzBIMlpSYTEyalpzRzFpa0RLcjJKZ3hjZnZZOElheDNPK0hsTkZP?=
 =?utf-8?B?T0FDUURFSGcvMGpEdTJwYldJc2d1N0x6M2tKQUd6MWFmRGpqTXJjY0plTjA5?=
 =?utf-8?B?MWdsYW82bUlCdnBHeXZkTVhnZWR6M2ZkRHgwdjZGUWVJSGFyc3QxdlBZcFVv?=
 =?utf-8?B?YWppZGwxWWVoaHllOEVKZHBPRE16ZTB5SXc4cDMrQmgzd01vdzVVRXFWTCtU?=
 =?utf-8?B?WFpCSzFOeFEwKzJBMFdRdHlPK2xsU2FHZ3UzYjV0WlRtOFFaOUthVUllb2lR?=
 =?utf-8?B?eTlGUWpub1NhN3B0UTBsdGVyTzNXSDgrRWFsU3V0OERIeXN0K0pWSXZxVFVs?=
 =?utf-8?B?SGlqR2k1NWswSUNhUjJ1Q1k5MDNzdUttbEhWajNGUTZ5Q0JhcW1qcWd3Nm83?=
 =?utf-8?Q?TnNEfSxjZxfwJrYk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <799F04F0256F7B4E92F824ACCFBBD08B@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7511.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d715ee5-babf-47f6-b8ff-08de70908898
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2026 14:58:40.2362
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZVMtJ7HTO7knyzXU5VvUi9vs44i2mGzsKFrN38OE/E0SGskihD30N6vOiw03GxApSU+w+Pml3BJGoeJ6IqsQc+GwwRvOhtgPIIPNOKUtcB0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8019

SGkgS3J6eXN6dG9mLA0KDQo+IA0KPiANCj4gLi4uDQo+IA0KPiANCj4gPiArcHJvcGVydGllczoN
Cj4gPiArwqAgY29tcGF0aWJsZToNCj4gPiArwqDCoMKgIGVudW06DQo+ID4gK8KgwqDCoMKgwqAg
LSBtaWNyb2NoaXAsbWNwOTkzMw0KPiA+ICvCoMKgwqDCoMKgIC0gbWljcm9jaGlwLG1jcDk5MzNk
DQo+ID4gK8KgwqDCoMKgwqAgLSBtaWNyb2NoaXAsbWNwOTk4Mg0KPiA+ICvCoMKgwqDCoMKgIC0g
bWljcm9jaGlwLG1jcDk5ODJkDQo+ID4gK8KgwqDCoMKgwqAgLSBtaWNyb2NoaXAsbWNwOTk4Mw0K
PiA+ICvCoMKgwqDCoMKgIC0gbWljcm9jaGlwLG1jcDk5ODNkDQo+ID4gK8KgwqDCoMKgwqAgLSBt
aWNyb2NoaXAsbWNwOTk4NA0KPiA+ICvCoMKgwqDCoMKgIC0gbWljcm9jaGlwLG1jcDk5ODRkDQo+
ID4gK8KgwqDCoMKgwqAgLSBtaWNyb2NoaXAsbWNwOTk4NQ0KPiA+ICvCoMKgwqDCoMKgIC0gbWlj
cm9jaGlwLG1jcDk5ODVkDQo+ID4gKw0KPiA+ICvCoCByZWc6DQo+ID4gK8KgwqDCoCBtYXhJdGVt
czogMQ0KPiA+ICsNCj4gPiArwqAgaW50ZXJydXB0czoNCj4gDQo+IFlvdXIgaW50ZXJydXB0LW5h
bWVzIHNheSAxIGl0ZW0gaXMgY29ycmVjdCwgc28gdGhlc2UgYXJlIGRlLXN5bmNlZC4NCj4gVGhl
eQ0KPiBzaG91bGQgYmUgYWx3YXlzIGNvbnN0cmFpbmVkIHRoZSBzYW1lIHdheS4NCj4gDQoNCldl
IHdhbnQgdG8gYWxsb3cgdGhlIHVzZXIgdG8gdXNlIG5vbmUsIG9uZSBvciBib3RoIGludGVycnVw
dHMuDQpJdCB3YXMgbXkgbWlzdGFrZSB0byBzZXQgbWF4SXRlbXMgaW5zdGVhZCBvZiBtaW5JdGVt
cyB0byBpbnRlcnJ1cHRzLg0KRG8geW91IGZpbmQgdGhlIGZvbGxvd2luZyBhcHByb2FjaCBhZ3Jl
ZWFibGU/DQoNCiAgaW50ZXJydXB0czoNCiAgICBtaW5JdGVtczogMQ0KDQogIGludGVycnVwdC1u
YW1lczoNCiAgICBtaW5JdGVtczogMQ0KICAgIGl0ZW1zOg0KICAgICAgLSBlbnVtOiBbYWxlcnQt
dGhlcm0sIHRoZXJtLWFkZHIsIHN5cy1zaHRkd25dDQogICAgICAtIGVudW06IFt0aGVybS1hZGRy
LCBzeXMtc2h0ZHduXQ0KDQouLi4NCg0KVGhhbmsgeW91IGZvciB5b3VyIHJlcGx5LA0KVmljdG9y
DQo=
