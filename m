Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010030.outbound.protection.outlook.com [52.101.193.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C8F2EC553;
	Fri,  6 Feb 2026 14:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770387457; cv=fail; b=qRqgRPdaLENfj6B1oDx9/8AWNgWM9gWxepkfjZEAniovwCJcKuAeUJthZfgUTLWy/OJQ2Kzk8fW24BOMX61pU0xmXo5sFIBhEEHac+cwmzTC8siejDSLvbMq6U/DnbiYpEH7PIZsiOf6B8hD4ho0ErYMpI5VVpKpg2/ayGwyXXE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770387457; c=relaxed/simple;
	bh=VM/pvv7aUGI4kmWQHJCFtSel1Z9sB4R4GzXQh1AcliQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ZynPMQXRa0wXgt/9x/7LOVrfUq/e7TOFwIiyigGmpBQk1GaGbM8Xr+w1ZWNthYrlPYIHJxK+vaBpaCiNDkskbvQ4WihpUx2yEXZVZzsGTaUxF7h+7oFRXCNf/1BfefP8YFHOic+Fr99XV0qXT2satKBAyWvXAutbNE89QozOJzU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=z1BY29/N; arc=fail smtp.client-ip=52.101.193.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="z1BY29/N"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZlUtQA7QNoUxGbFOE3BWp4ZWRCvJSHFsLkcJZ/G6AVWbiSi4yMSdnI3/ePY0eINagRH5hBJOBWy0/qlqvJ1M3EfkoM4i/o7LH39CxCI6k4ka5ajLtR1lu6UimECgZ4gN7uN6lemr7d7fDrYR+iJKWDGBCP/Sx4jkouiqEbcMLjd08l+3sg49bzLyMwenNUO3AIeP4wyeutntJkfd6D5Ol5myEoNhK38CjKD0lk5vq8+4vF7Riz64F/hnQcbecvrZE9KvUXi99crvtyqWEIsyzcStWp7iwWeR7FTfY4/XgRj1Tm36rJfAO+apmCkcN85iLMkqVFD0jAe9yzNEJMqiJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VM/pvv7aUGI4kmWQHJCFtSel1Z9sB4R4GzXQh1AcliQ=;
 b=NUvaVOUpsCkG7YvYi75QlT37lxuyjM50N4QxLZWqaBQ9o5CioJHjEi/Wi000AVyqHL7k6e5FPmAk3aAnxm5VeWAPUN+GcD4akk4DgA0Ge8ClR09n7FoKbujIghyBL/IiYfOJeVVFiwqgIKKFBbpbH89TWa3rU1q12o2gokXOBc/rV+yle3oRbyT3ruRV2M7Yav3iNOj+DByqYAX0g5iPNVmrR6qoRbe0vlhsrvwPBQvj6N9/4XrHkobLk17CbOVK/5k98kXc/8ne1QChkjhPDhEjmAX0ZWnlOJTeACqsdW0jhIfzbuBZ9FsDqSpZxx7x5lO7+guLPh5u1wX2BYvfrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VM/pvv7aUGI4kmWQHJCFtSel1Z9sB4R4GzXQh1AcliQ=;
 b=z1BY29/NId8bn6GKNTWdDPPcpHNxavTqJkaCh74YkbF9327n6DR1+RIHd1zaCK9ocseIum0+PP7BjHHqBl4o00Fhp2MdwjNv9Hb/jJNF7ddLjAltORLHA6cbubBTIr4sFD9ICc+nheAE28wGl+TRyp3PlY9F0s9bzgGdJhVZSI1iaq/YhjTAuqRNxljn5lo/MjGZ5f9fl1c75BqxDnCpjj/J2ouqm159jNaFPAWeY2EvPpOEFbdDnqihdxB136lSUZ0jH+8RYAOMSNXMgDOGmsGY0LvdkLEpNdNS+qMPZjIoXDC0ItyfHX8Q0oAmc0Rc5BxUsN/V+XKtBdIgiybD8g==
Received: from SN7PR11MB7511.namprd11.prod.outlook.com (2603:10b6:806:347::17)
 by DM4PR11MB7376.namprd11.prod.outlook.com (2603:10b6:8:100::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Fri, 6 Feb
 2026 14:17:33 +0000
Received: from SN7PR11MB7511.namprd11.prod.outlook.com
 ([fe80::b0d5:a33a:26fd:3fa0]) by SN7PR11MB7511.namprd11.prod.outlook.com
 ([fe80::b0d5:a33a:26fd:3fa0%6]) with mapi id 15.20.9587.013; Fri, 6 Feb 2026
 14:17:33 +0000
From: <Victor.Duicu@microchip.com>
To: <linux@roeck-us.net>
CC: <corbet@lwn.net>, <linux-hwmon@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <robh@kernel.org>,
	<linux-kernel@vger.kernel.org>, <krzk+dt@kernel.org>,
	<linux-doc@vger.kernel.org>, <Marius.Cristea@microchip.com>,
	<conor+dt@kernel.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: hwmon: add support for MCP998X
Thread-Topic: [PATCH v3 1/2] dt-bindings: hwmon: add support for MCP998X
Thread-Index: AQHcj6BW6iGqyMwWZEe+A522Hs6wtLVxY7wAgARjsYA=
Date: Fri, 6 Feb 2026 14:17:33 +0000
Message-ID: <595e616ad403e805ee50fa7bc57d25584949924d.camel@microchip.com>
References: <20260127151823.9728-1-victor.duicu@microchip.com>
		 <20260127151823.9728-2-victor.duicu@microchip.com>
		 <0b3979d6-895f-4c8a-8251-d3c793385bf4@roeck-us.net>
In-Reply-To: <0b3979d6-895f-4c8a-8251-d3c793385bf4@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB7511:EE_|DM4PR11MB7376:EE_
x-ms-office365-filtering-correlation-id: fd63cc71-d5a1-4d66-6d40-08de658a7899
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700021|18082099003;
x-microsoft-antispam-message-info:
 =?utf-8?B?WG1DV2NDay8wZ21KSDJLcE5vTThWd2hDeU5CU2NuSjlRRlozdEI2WGxacFNU?=
 =?utf-8?B?NHBYV0NXcEw0cCtPam5wR2hWNDJ4MzA1cUtBYUVwMzNZV0tPK1VWWkJaY1Q3?=
 =?utf-8?B?U2F2aUVFeHAxTlRhZ0ZpN1JseU1BYVgycTd6MTgzVjNPTTZNRUQzYU9KNGVa?=
 =?utf-8?B?dFpQRFhqNlpKRU5iYlJpaXU5bzdEKzh2U1pNVmNDWmRYbTBzNzFBc0VDMnZJ?=
 =?utf-8?B?NUkrRWFDY29hcGx6dnRmaFpXdTk0MmxrNnBNOUhUbXIveDFlYlY3N2tJMFhx?=
 =?utf-8?B?RzE2MHBFbCtNOWJleUR4dlN3QnJaaGVNZkk4ditWbk1GSUhRUTBubU8xZnQ4?=
 =?utf-8?B?dCtFZjQ4QnI5RndlY1BNOEdpWXB5ZDB3WVMvcjNFOGVnL3JxQklrTVlPd1g2?=
 =?utf-8?B?dDFUK3pYYVdoOUxkd3RrWU5oZ1lXK0FoaDBNSDZNS2krRVhnQ0lpb09BTEZ3?=
 =?utf-8?B?M3cvRDJheExUNjA2ekpKK3NpVGVPa3BoWWM3eXNsejNlTmNaWXBGV29yRy84?=
 =?utf-8?B?YU1HVjhsOGdtRi9hNWhONEJ2cDBteDBnZVVuSUFOejlHOU1DOVlwMzlvSTBW?=
 =?utf-8?B?d29BWEl5VjNMSXhuRWs0RERhSjBKcUtObisxTEltYVN3aERBTCszaFdxcUVj?=
 =?utf-8?B?dFZnNkJiVlhIT3VCTnZUWWJnVWZXamZTZ21KSTM3WHNCVzRYODJTSkhPMERD?=
 =?utf-8?B?bzlEYS82NmZTczM1KzJYN1plenQrb0hpVVpiT1diOXZUdk5XV3hzbFpqWmhE?=
 =?utf-8?B?QkJUQUZBVmJiQmt6ZGU1NVNkek55eFFpTDUxcWhoWkRjbWpCbTdtc3JEQmdC?=
 =?utf-8?B?L3RIWVVUMm9XWmJsVkJFOFdkclFFRWd0YlZaQ01XUTJFVi84MHJjWU5Hb0N3?=
 =?utf-8?B?eWE2Q24xdmVXUUlyVUk4L2RveEQ5OVBwaUMxNFBta3pRMnRwTEZwRFZyaDlV?=
 =?utf-8?B?WFZiQUJXb2JTNGpDelNHd01oc0tVTE4vU0hqRVJwMSttYXVuVFJVVzdxemho?=
 =?utf-8?B?TUpyS0xwdnYwUExjUW1KamZsOUNuWml2ZU5pUkFIWm5JTkVmSWNyc1Ztcytk?=
 =?utf-8?B?dlBFaEs4VU9iY3lkdlhKc0NKS2VoeEtNRG92ZCtkWDJhdEJ2VjhmL0FVaTMr?=
 =?utf-8?B?STBqWnlPbXhwcUdaWFllQnY0bXd0ZSt2M2MyeXBsNXIveWJGbmJNWFdVa1k0?=
 =?utf-8?B?QzBGVWlheDBuMmpzVkJyY3ZWM09ZUmpBdEptZk9HVmNNanpJem9PY2VVUlEv?=
 =?utf-8?B?SzFVaHRHTTVSK01CZ3lTNlVVdkZPUE5VdXM1MFVVdDArSlEyZ1NDSFNNRlNZ?=
 =?utf-8?B?VjhCT2xlajYyV2dZdGg5Ylp5NnNCN1hjcVpENUhNMEE2T2FqS1dVUm5WWEtq?=
 =?utf-8?B?Z3pQUFMrRExGelNLRzlkYnVlVGlBNFRuUnB2NEFIOFdHWkhzc1E2UjhsMCtZ?=
 =?utf-8?B?aDVmeUU5RjJUTDNxdUoxOVVrcHU5RlJaSXBvV2U0WXZ0Q1FmMmQ0RTBSQzdG?=
 =?utf-8?B?ODV2ZWpFMmpmeGZjaHBhRTA3QU1CVjVmZ2JQcUw3Q3N4b05pYy8wVWJrMllQ?=
 =?utf-8?B?SGRydHBubmhXMjZOdy80SE94cmF3L3FtNi8xeE15MFExZU9XRHYvUTdrOE00?=
 =?utf-8?B?QkRodGhxWnYxNkE5SG9PZ0lwcUg4eFVDR2VldGJBUDJwdXlRKzJpV1VLV2pF?=
 =?utf-8?B?MVpIdkU3Z3hmYmtVK2RYQ01IWFh2cHc5YXpiSy9heS93TVFyTFk5ajZjZ1hr?=
 =?utf-8?B?SitCZ3hBZThWdUQ3T0pZbUVOcFpvcXhyQ2U5aDRqQk51VjBOVEhtOW9XNWd3?=
 =?utf-8?B?SnB6THZkRFFQUEI0WVRKQXQyOXd3YXVWU3ZTR0lnZUFSZGR4YWlpSWRNYzRO?=
 =?utf-8?B?TndNZGdJOU84aFJUSnlyWHpaZU9Lc29uSGd4bTVBcnJwMHFKUnU0TDZaTmpP?=
 =?utf-8?B?VDNVbXlSNXJzVXBCNUh6bFFZdG1BYlBIOEk0WUpnNEJ0ajh3VERyenA2eEwv?=
 =?utf-8?B?UjVpdGRyWFFkMG9XbjJVMlB5aHJNZnA0ZkhFaXM5L0hwVndGcmk2NHFyZ2tS?=
 =?utf-8?B?TEpqR2cwOXB1aWpHQ2lJbUx3NlJPM0plWC9BTzVjaERpZ1BvbmU3a0hqRzEy?=
 =?utf-8?Q?mXrAWj3IZV0R/cyfaiR0ypqgD?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB7511.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(18082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?V2Rtemc0ZjdhWmUrd1Z2VjI4M1dXY1lXLzdoeXZOOW9tdVZEdFVXLzNvVGRY?=
 =?utf-8?B?bXRZcUdaWVpjYWZHdzdHczFiQUlRdXNkd0lRY2ZHd2kyblNrYjZvNllzTnVu?=
 =?utf-8?B?U3N0MnhneTdZR3EyTkRTVmdMUkMrQjE2clJ1eVJ0dUJFTTdmMlUrQXBabmNL?=
 =?utf-8?B?aktocU5zZlRLVk43S0Z3cWVKZkczZm5DRktZSEx2Q3hTaFlQUkVRNTh5NlNG?=
 =?utf-8?B?M0dzNUVaYlpqSkhGZnhIdVlHa2YxT1ZmVG81eGpLVmpJaTRJK3BzT0NiVUhs?=
 =?utf-8?B?ZVFpRndmZXd3Y3R4MFNmL2p0aEFLSnZkcHVHTFJYTGFzNzg2aldOUGNNMVhR?=
 =?utf-8?B?eFpTMkJ0Y2xRNzBvZXZsNk0wTnRmZEtWcFREUHNtK3N3YXpwR3plNzlWMWtq?=
 =?utf-8?B?ZHFEM2l4L21lc3lKUXNVOGwxdjlNWnNnSFFzRmVjSXJQbjI1cGhBMSt3TWhW?=
 =?utf-8?B?bU9OWHZCS05CL0MzRDIrMUM3WUUxU1ozT09HUUN4WkNDZVdUV2dDa09vRkRW?=
 =?utf-8?B?WXlPdzVuY2Rudi9uTWc5cGlvbnJJcHMvaVp1RnJFZyt5aHROUHJSYW9wSkMz?=
 =?utf-8?B?YXRnRWthTUgyWEY5dmJNdHArdjJ4UExibFJ6SGJPS0Vob1Exb0o3NTl5MU9L?=
 =?utf-8?B?TXljYyttTHRjcnoxM09zQ3d0Kzc0eS9rTHR2RFltNDk4dlVXbm4rSE40Y3Ez?=
 =?utf-8?B?RkpXb0RBRHNibm9yZ0w1bnA2Yy9PZmJROFZRRTVzSlcyZXZnTFUvR0xhTHlS?=
 =?utf-8?B?VThJWHJuUHQ0YmduY0cyS29JVk1OcXpacGRwSG0zNkh4VUtvbzBMeW5MZGtw?=
 =?utf-8?B?QVNuRmJnWjB1OEthQmE5eDVOVWw2SnJJQnNHNlV4dmhXNTk0Tng1SnRsZWc5?=
 =?utf-8?B?SFZ1dnJyUlpuSWRDR2VRaVpqR3N3RUhuWDJSMW1OeGovY01VaTg4QVk3T3R4?=
 =?utf-8?B?YkFFOGJKY0wvUXVoSDRYMjJzeWYwNDkvNmFCYXg1RE8yZXZqeEdtRHZDK3JU?=
 =?utf-8?B?eHFYUXMwVlRWQ2o0cjZkTE5YVlRibUFZVGg3dXZTc0R4K005RnBQZUdNeFVW?=
 =?utf-8?B?KytrZW1xSjdrQ2RacXdESE0zWElvUnpYclFpcHBTTmVKWlBnaHpkQ0p5VTRy?=
 =?utf-8?B?Qkh0QVJEcFZ6Z1VlaDczbnZKSHBpLzBJeHk2bThGajRQUURIcXVjUmhxRmJz?=
 =?utf-8?B?cktBT2xMdUx3dU9KU3F0Z2xWNnV5amFjN1BVVXl4Y2doTTFZbXB6RENaYkZo?=
 =?utf-8?B?VHBkMndGSGluN1ZyT216VXl0MlFVcm9KK0RqNVV2WXJDdU96a3Z5WGcxWTQz?=
 =?utf-8?B?dFJLek0xdHE4ckZNS1ZRaG96UmJBSkpCT3NVS3N3U214eW9HdVNBUVg1bUJw?=
 =?utf-8?B?cVhhd0ZFc1B5dVR5UG03M1ZNeHpXbm1CdVNBa0w1OXFML3NZSzlTdHdnYlk0?=
 =?utf-8?B?ejJEVUdNb2tJaGpxaU8zN1FGbDgyRmYyaDJ6NC9UU2JEY1dUaGFJNGxzNEkv?=
 =?utf-8?B?Zm9QQjZ2RW5ob1lOclNlVWxSTUR1RHBxeWtTL3ZCbHY2bERYWFFQUUZuY3VI?=
 =?utf-8?B?NlV1YU5lT2tVQUl0OSt1UVpRZzFFNHNuYm1qaEFvNWN3UWhvMUdBTmxnR0Jx?=
 =?utf-8?B?aDI3Y2VVU0pPa3JJNjlsTzJCNTJwWGdGWW9heDV3bzY5SWZzNHd3c1BLdlBY?=
 =?utf-8?B?cEg3a3NSajAraE1NaEp1eEViVEYzSWlUcGFTUWlVNUxhWkJpTFptcFpZVjZw?=
 =?utf-8?B?bjJqV2kwcGo5MGFVTWR3RExaZnVEWmtpZnBUQnFyTHFIbDRnOXZaK0Rrb0Fy?=
 =?utf-8?B?N0FSSC9WTXEvTkhFVnZuUklRN1VJWnlXZjFITjBYYkdwdkcrL3FuNW9YODA2?=
 =?utf-8?B?VG8zamxoZnIxdy9Dd1RSZCsxd2RrRTFxc1ZyemNBV096ZkI3bHBpUUd0b1lD?=
 =?utf-8?B?a251cFpFVk5sVVNIRmZPRVAvVTRkSDNlTkdEQzVHWGE1and3OVFLQ1cxaENu?=
 =?utf-8?B?WkpMSW5FVjIxeXhaOXlaaDdWblg2RjVkcVA4NDBTd1NteVJ0NC9GYjY2OWM0?=
 =?utf-8?B?VHgvQkd5QzNrNHFwaXd0R3FKWnB0SURlTHNrai8ydVJmU1Arc3RhVkhaajFT?=
 =?utf-8?B?RFprSjVtYThUYjUvV0lvT0ZrT2wwRkpCTDl1dGpSQzI4NHV2QTBOblhNemRh?=
 =?utf-8?B?Wk01MzZDTDNZOWIwR3hWUHRLTjE4bUU2UUtWeEZWbFZXWVQwUnVMV3NTdkxI?=
 =?utf-8?B?Rjl5UlZqaXhYYVRtWWh5RVlXQTcrNTlmWkcxYVZCcmJJcSs0cU1SZ1Q4VmNP?=
 =?utf-8?B?NDB2cWwyZFJrMUgwVEV1L0l0elZUNVdzUHlLazZDU2Fwby9QNVQ0SzlqUFdS?=
 =?utf-8?Q?hMrvmv7M4ZYN83hQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6E3E1DB752CC084E974D2A2F8CBEC8C3@namprd11.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: fd63cc71-d5a1-4d66-6d40-08de658a7899
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Feb 2026 14:17:33.5960
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +WK+IXDmmxMJkJ3QKMVQPAgylKijC8h4EcJDyqATgotcsJF1ClCEr1jzZsiS/7HDUpmuK2FAhdJScVYnam/Fcg4+UjU6lHlLqFSEdcPZxb8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7376

T24gVHVlLCAyMDI2LTAyLTAzIGF0IDExOjE1IC0wODAwLCBHdWVudGVyIFJvZWNrIHdyb3RlOg0K
PiBFWFRFUk5BTCBFTUFJTDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMg
dW5sZXNzIHlvdQ0KPiBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUNCj4gDQo+IE9uIFR1ZSwgSmFu
IDI3LCAyMDI2IGF0IDA1OjE4OjIxUE0gKzAyMDAsDQo+IHZpY3Rvci5kdWljdUBtaWNyb2NoaXAu
Y29twqB3cm90ZToNCj4gPiBGcm9tOiBWaWN0b3IgRHVpY3UgPHZpY3Rvci5kdWljdUBtaWNyb2No
aXAuY29tPg0KPiA+IA0KPiA+IFRoaXMgaXMgdGhlIGRldmljZXRyZWUgc2NoZW1hIGZvciBNaWNy
b2NoaXAgTUNQOTk4WC8zMyBhbmQNCj4gPiBNQ1A5OThYRC8zM0QgTXVsdGljaGFubmVsIEF1dG9t
b3RpdmUgVGVtcGVyYXR1cmUgTW9uaXRvciBGYW1pbHkuDQo+ID4gDQo+ID4gQWNrZWQtYnk6IENv
bm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+DQo+ID4gU2lnbmVkLW9mZi1i
eTogVmljdG9yIER1aWN1IDx2aWN0b3IuZHVpY3VAbWljcm9jaGlwLmNvbT4NCj4gDQo+IFNvbWUg
QUkgZ2VuZXJhdGVkIGZlZWRiYWNrIGlubGluZSwgZ2VuZXJhdGVkIHVzaW5nIEdlbWluaSAzIGFu
ZCBDaHJpcw0KPiBNYXNvbidzDQo+IHByb21wdHMgYXMgYmFzZS4gSSBkb24ndCBrbm93IG11Y2gg
aWYgYW55dGhpbmcgYWJvdXQgZGV2aWNldHJlZQ0KPiBwcm9wZXJ0aWVzLA0KPiBidXQgaXQgZG9l
cyBzZWVtIHRvIG1lIHRoYXQgdGhlIEFJIGhhcyBhIHBvaW50Lg0KPiANCj4gPiAtLS0NCj4gPiDC
oC4uLi9iaW5kaW5ncy9od21vbi9taWNyb2NoaXAsbWNwOTk4Mi55YW1swqDCoMKgwqAgfCAyMDUN
Cj4gPiArKysrKysrKysrKysrKysrKysNCj4gPiDCoE1BSU5UQUlORVJTwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKg
wqAgNiArDQo+ID4gwqAyIGZpbGVzIGNoYW5nZWQsIDIxMSBpbnNlcnRpb25zKCspDQo+ID4gwqBj
cmVhdGUgbW9kZSAxMDA2NDQNCj4gPiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
aHdtb24vbWljcm9jaGlwLG1jcDk5ODIueWFtbA0KPiA+IA0KPiA+IGRpZmYgLS1naXQNCj4gPiBh
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9od21vbi9taWNyb2NoaXAsbWNwOTk4
Mi55YW1sDQo+ID4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaHdtb24vbWlj
cm9jaGlwLG1jcDk5ODIueWFtbA0KPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+ID4gaW5kZXgg
MDAwMDAwMDAwMDAwLi4wNWVhM2M2YTU2MTgNCj4gPiAtLS0gL2Rldi9udWxsDQo+ID4gKysrDQo+
ID4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaHdtb24vbWljcm9jaGlwLG1j
cDk5ODIueWFtbA0KPiA+IEBAIC0wLDAgKzEsMjA1IEBADQo+ID4gKyMgU1BEWC1MaWNlbnNlLUlk
ZW50aWZpZXI6IChHUEwtMi4wIE9SIEJTRC0yLUNsYXVzZSkNCj4gPiArJVlBTUwgMS4yDQo+ID4g
Ky0tLQ0KPiA+ICskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL2h3bW9uL21pY3Jv
Y2hpcCxtY3A5OTgyLnlhbWwjDQo+ID4gKyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9t
ZXRhLXNjaGVtYXMvY29yZS55YW1sIw0KPiA+ICsNCj4gPiArdGl0bGU6IE1pY3JvY2hpcCBNQ1A5
OThYLzMzIGFuZCBNQ1A5OThYRC8zM0QgVGVtcGVyYXR1cmUgTW9uaXRvcg0KPiA+ICsNCj4gPiAr
bWFpbnRhaW5lcnM6DQo+ID4gK8KgIC0gVmljdG9yIER1aWN1IDx2aWN0b3IuZHVpY3VAbWljcm9j
aGlwLmNvbT4NCj4gPiArDQo+ID4gK2Rlc2NyaXB0aW9uOiB8DQo+ID4gK8KgIFRoZSBNQ1A5OThY
LzMzIGFuZCBNQ1A5OThYRC8zM0QgZmFtaWx5IGlzIGEgaGlnaC1hY2N1cmFjeSAyLXdpcmUNCj4g
PiArwqAgbXVsdGljaGFubmVsIGF1dG9tb3RpdmUgdGVtcGVyYXR1cmUgbW9uaXRvci4NCj4gPiAr
wqAgVGhlIGRhdGFzaGVldCBjYW4gYmUgZm91bmQgaGVyZToNCj4gPiArwqDCoMKgDQo+ID4gaHR0
cHM6Ly93dzEubWljcm9jaGlwLmNvbS9kb3dubG9hZHMvYWVtRG9jdW1lbnRzL2RvY3VtZW50cy9N
U0xEL1Byb2R1Y3REb2N1bWVudHMvRGF0YVNoZWV0cy9NQ1A5OThYLUZhbWlseS1EYXRhLVNoZWV0
LURTMjAwMDY4MjcucGRmDQo+ID4gKw0KPiA+ICtwcm9wZXJ0aWVzOg0KPiA+ICvCoCBjb21wYXRp
YmxlOg0KPiA+ICvCoMKgwqAgZW51bToNCj4gPiArwqDCoMKgwqDCoCAtIG1pY3JvY2hpcCxtY3A5
OTMzDQo+ID4gK8KgwqDCoMKgwqAgLSBtaWNyb2NoaXAsbWNwOTkzM2QNCj4gPiArwqDCoMKgwqDC
oCAtIG1pY3JvY2hpcCxtY3A5OTgyDQo+ID4gK8KgwqDCoMKgwqAgLSBtaWNyb2NoaXAsbWNwOTk4
MmQNCj4gPiArwqDCoMKgwqDCoCAtIG1pY3JvY2hpcCxtY3A5OTgzDQo+ID4gK8KgwqDCoMKgwqAg
LSBtaWNyb2NoaXAsbWNwOTk4M2QNCj4gPiArwqDCoMKgwqDCoCAtIG1pY3JvY2hpcCxtY3A5OTg0
DQo+ID4gK8KgwqDCoMKgwqAgLSBtaWNyb2NoaXAsbWNwOTk4NGQNCj4gPiArwqDCoMKgwqDCoCAt
IG1pY3JvY2hpcCxtY3A5OTg1DQo+ID4gK8KgwqDCoMKgwqAgLSBtaWNyb2NoaXAsbWNwOTk4NWQN
Cj4gPiArDQo+ID4gK8KgIHJlZzoNCj4gPiArwqDCoMKgIG1heEl0ZW1zOiAxDQo+ID4gKw0KPiA+
ICvCoCBpbnRlcnJ1cHRzOg0KPiA+ICvCoMKgwqAgaXRlbXM6DQo+ID4gK8KgwqDCoMKgwqAgLSBk
ZXNjcmlwdGlvbjogU2lnbmFsIGNvbWluZyBmcm9tIEFMRVJUL1RIRVJNIHBpbi4NCj4gPiArwqDC
oMKgwqDCoCAtIGRlc2NyaXB0aW9uOiBTaWduYWwgY29taW5nIGZyb20gVEhFUk0vQUREUiBwaW4u
DQo+ID4gK8KgwqDCoMKgwqAgLSBkZXNjcmlwdGlvbjogU2lnbmFsIGNvbWluZyBmcm9tIFNZU19T
SEROIHBpbi4NCj4gPiArDQo+ID4gK8KgIGludGVycnVwdC1uYW1lczoNCj4gPiArwqDCoMKgIGl0
ZW1zOg0KPiA+ICvCoMKgwqDCoMKgIC0gY29uc3Q6IGFsZXJ0LXRoZXJtDQo+ID4gK8KgwqDCoMKg
wqAgLSBjb25zdDogdGhlcm0tYWRkcg0KPiA+ICvCoMKgwqDCoMKgIC0gY29uc3Q6IHN5cy1zaHV0
ZG93bg0KPiANCj4gVGhlIHRvcC1sZXZlbCBkZWZpbml0aW9uIG9mIGludGVycnVwdC1uYW1lcyBz
cGVjaWZpZXMgZXhhY3RseSAzDQo+IGl0ZW1zLg0KPiBIb3cgZG9lcyB0aGlzIGludGVyYWN0IHdp
dGggdmFyaWFudHMgdGhhdCBvbmx5IGhhdmUgMiBpbnRlcnJ1cHRzPw0KPiANCg0KVGhlIGNoaXBz
IHdpdGggIkQiIGluIHRoZSBmYW1pbHkgaGF2ZSB0aGUgc3lzLXNodXRkb3duIGFuZCBhbGVydC10
aGVybQ0KaW50ZXJydXB0IHBpbnMuIFRoZSByZXN0IGhhdmUgYWxlcnQtdGhlcm0gYW5kIHRoZXJt
LWFkZHIgaW50ZXJydXB0DQpwaW5zLiBUaGUgY29uZGl0aW9uYWwgYXNzaWducyB0aGUgaW50ZXJy
dXB0IG5hbWVzIGRlcGVuZGluZyBvbiB0aGUNCmNoaXAuDQoNCi4uLg0KDQo+IA0KPiA+ICvCoMKg
wqDCoMKgwqDCoMKgwqAgaXRlbXM6DQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLSBjb25z
dDogYWxlcnQtdGhlcm0NCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtIGNvbnN0OiB0aGVy
bS1hZGRyDQo+ID4gK8KgwqDCoMKgwqDCoMKgIG1pY3JvY2hpcCxwb3dlci1zdGF0ZTogdHJ1ZQ0K
PiA+ICsNCj4gPiArwqAgLSBpZjoNCj4gPiArwqDCoMKgwqDCoCBwcm9wZXJ0aWVzOg0KPiA+ICvC
oMKgwqDCoMKgwqDCoCBjb21wYXRpYmxlOg0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqAgY29udGFp
bnM6DQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcGF0dGVybjogJ15taWNyb2NoaXAsbWNw
OTk4KDJ8MykkJw0KPiA+ICvCoMKgwqAgdGhlbjoNCj4gPiArwqDCoMKgwqDCoCBwcm9wZXJ0aWVz
Og0KPiA+ICvCoMKgwqDCoMKgwqDCoCBtaWNyb2NoaXAsZW5hYmxlLWFudGktcGFyYWxsZWw6IGZh
bHNlDQo+IA0KPiBJZiAiRCIgdmFyaWFudHMgb25seSBzdXBwb3J0IFJ1biBtb2RlIGFzIGRlc2Ny
aWJlZCBpbiB0aGUgcHJvcGVydHkNCj4gZGVzY3JpcHRpb24sIHdoeSBpcyB0aGlzIHByb3BlcnR5
IHJlcXVpcmVkIGluIHRoZSBkZXZpY2V0cmVlPw0KPiANCj4gU2Vjb25kIGZlZWRiYWNrOg0KPiAN
Cj4gU2luY2UgdGhlIGRlc2NyaXB0aW9uIHNheXMgIkQiIHZlcnNpb25zIGNhbiBvbmx5IGJlIHNl
dCBpbiBSdW4gbW9kZQ0KPiAod2hlcmUgVHJ1ZSBzZXRzIFJ1biBzdGF0ZSksIHNob3VsZCB0aGlz
IHByb3BlcnR5IGFsc28gaGF2ZSBhIGNvbnN0Og0KPiB0cnVlDQo+IGNvbnN0cmFpbnQgaGVyZT8N
Cj4gDQoNClRoZSBwcm9wZXJ0eSB0aGF0IHNldHMgdGhlIG9wZXJhdGlvbiBtb2RlIGlzIG1pY3Jv
Y2hpcCxwb3dlci1zdGF0ZS4NCkNoaXBzIHdpdGggIkQiIGNhbiB3b3JrIG9ubHkgaW4gUnVuIG1v
ZGUsIGJ1dCB0aGUgb3RoZXIgb25lcyBjYW4NCndvcmsgaW4gUnVuIG9yIFN0YW5kYnkgbW9kZS4N
CkluIHRoZSBjb25kaXRpb25zIHdlIGZvcmNlIFJ1biBtb2RlIG9uIHRoZSBjaGlwcyB0aGF0IHJl
cXVpcmUgaXQNCmFuZCBhY2NlcHQgZWl0aGVyIG1vZGUgaW4gdGhlIG90aGVyIGhhbGYgb2YgdGhl
IGZhbWlseS4NCg0KPiA+ICsNCj4gPiArwqAgLSBpZjoNCj4gPiArwqDCoMKgwqDCoCBwcm9wZXJ0
aWVzOg0KPiA+ICvCoMKgwqDCoMKgwqDCoCBjb21wYXRpYmxlOg0KPiA+ICvCoMKgwqDCoMKgwqDC
oMKgwqAgY29udGFpbnM6DQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcGF0dGVybjogJ15t
aWNyb2NoaXAsbWNwOTk4KDJ8MylkJCcNCj4gPiArwqDCoMKgIHRoZW46DQo+ID4gK8KgwqDCoMKg
wqAgcHJvcGVydGllczoNCj4gPiArwqDCoMKgwqDCoMKgwqAgbWljcm9jaGlwLGVuYWJsZS1hbnRp
LXBhcmFsbGVsOiBmYWxzZQ0KPiA+ICvCoMKgwqDCoMKgIHJlcXVpcmVkOg0KPiA+ICvCoMKgwqDC
oMKgwqDCoCAtIG1pY3JvY2hpcCxwYXJhc2l0aWMtcmVzLW9uLWNoYW5uZWwxLTINCj4gPiArwqDC
oMKgwqDCoMKgwqAgLSBtaWNyb2NoaXAscGFyYXNpdGljLXJlcy1vbi1jaGFubmVsMy00DQo+IA0K
PiBTaG91bGQgdGhlIHBhcmFzaXRpYyByZXNpc3RhbmNlIGNvbXBlbnNhdGlvbiBwcm9wZXJ0aWVz
IGJlIHJlcXVpcmVkPw0KPiBUaGVzZQ0KPiByZXByZXNlbnQgYm9hcmQtc3BlY2lmaWMgcGFyYXNp
dGljcyBhbmQgbWF5IG5vdCBiZSBwcmVzZW50IG9uIGFsbA0KPiBkZXNpZ25zIHVzaW5nIHRoZXNl
IGNoaXAgdmFyaWFudHMuDQo+IA0KDQpBcyBub3RlZCBpbiB0aGUgZG9jdW1lbnRhdGlvbiwgZm9y
IGNoaXBzIHdpdGggIkQiIHBhcmFzaXRpYyByZXNpc3RhbmNlDQplcnJvciBjb3JyZWN0aW9uIG11
c3QgYmUgZW5hYmxlZCBzbyB0aGF0IHRoZSBoYXJkd2FyZSBzaHV0ZG93biBmZWF0dXJlDQpjYW4n
dCBiZSBvdmVycmlkZGVuLg0KDQo+IA0K
