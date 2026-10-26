Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793028348;
	b=mkzRdqnrBWl3EbWKjg+9NP2nzEFVC4OZDbw8LRjSNUh8fp5vUCHsmjRe4fkpVRCEUPUe
	 UloFOSdrFEq8YjZ+RYb6f1+97x4NxC1eZzpkO3ACizCAcsys30agl/gnRic/MUpz154EQ
	 8THDtAxCasRQ6KPRzOxhaUuoguhXHtb/9aqV1wo3jMR1dAYPaty8DNHBXJdRq2Sh6C8+W
	 jG949t0OCOuLquzm/qOCj98s6cd98LOXai8TBX7xhf6FXLtxhu06WxhGpEeuI54eB8wqn
	 dT6ifpfNMfij3KgAVXU8z9Z2/82HALFmSBb23blf1gUo1GqiHyAtcKkOtyourO35r+Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793028348;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=FZK0CqS0Ve55H5eghd+REzyBIS02YjiNOfK98Fyiuv8=;
	b=GG3Xm4C1lrr5A096kSqcLZylgtq8qDibOLWliEQsV9Y7nKEfepOxm6uOxn/jjdCplaUn
	 o1ZKvtaXmW3E5oG7mTrG2ICUG8XkXHt/Wd7iG9t0lCPc4s/klD4AoAhccYOMPVROUjbXF
	 OLZY8w8/P94JzO7uiQOzAllGqw4trvWDjLJT1Ujlh+I/X+03lJZGlsocYF4Ywta4s5x0A
	 FbHcqDIP+8aqn7l+qaF2b/ByYo5a0jnCi3HDZZ58w0dWJXJ5OVpC+6eb7B76Di5DFGgqj
	 q2Die5rhmM7TwiqFYfc3auGEBIAaQsMz2TWqkrVrww50AgniZ9wzn9sE7bNvIeJPxyw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=d5yKvYNT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.53
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012053.outbound.protection.outlook.com [40.107.209.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62858606A31E;
	Mon, 26 Oct 2026 15:25:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62858606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=d5yKvYNT
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xygIRG9yBjAexbvyMJpNR3ICEUJL1Ulx0aM9SEn0Q/iByYJwPJB5BtV+bamdDWPPts/NSuH9wSEs4+exPh8LMvduD9CAmuYihWKZwPEnqd/DGSu6z2NQAewbNe8BBiLE/eACnKpsYXGTuEZxYS5UJfanmS+tUtg4zjQZh4VR+2BJTPZ+z+fYCtaci1SYBbdxd1zbci+WP6TpJQxtX5vnCP8weoAy7AfKZEfPLtEdWLUUnmBP4cJO7yIbXwEoaBebCg+asOcv9uWn765TS1b9r6IFg5vc2rhxlCvSC5eVPaEpMF3yrqZ0nZZcQbsIsXJS1Oj12HnTmI3lMKQD+GXGcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FZK0CqS0Ve55H5eghd+REzyBIS02YjiNOfK98Fyiuv8=;
 b=ibC77TKdtVQXqLUgORikVS74jCuWMaEOE1urzYMnE2zoe/n8h0UOAr6lQTZicRc0Ph2RwXXMsMokmMZpWJo29mz1P/dxtYsxdcGFs04Yt/eCnKEl33fgH8XhWFSSrq+6zPQFP/R52LjeHgG7a/nPUOSm8DMLCN/QuD+WVe0D0jnPTRL2xfoiuifUWjL9Uz0noirWmBrqLcF1gFl2WNEbwbpUREyU1SxWhOlfpqIMUyPDubLJKdjtER0CsT6g3WX12NAM93MLR2rv/b4qz9MURomgxHwYxkctLERBdbr6SNvjh235LV5ZRX5ttMBJISgPFeWmXqKYZ9Ti8W2Z6J0QXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FZK0CqS0Ve55H5eghd+REzyBIS02YjiNOfK98Fyiuv8=;
 b=d5yKvYNToeZD8YIERcy1l/QW9lfOzSsaOv0UkUvK9ujLb9zmsEqZvprbdW2AeHPMj3f0TJoXl3wA3NbwVfqOltHw7rl8MTQKx/kZLGvuIXp+jX/iHMPRUpBvOY1zy+wmnMsS6VripCbXlaqOrkjTBV8SObBfjl6O2BSpoMUK5hQ=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB9174.namprd12.prod.outlook.com (2603:10b6:510:2ed::9)
 by CH8PR12MB608111.namprd12.prod.outlook.com (2603:10b6:610:704::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 15:25:44 +0000
Received: from PH7PR12MB9174.namprd12.prod.outlook.com
 ([fe80::eaaa:b430:ba9:5dc]) by PH7PR12MB9174.namprd12.prod.outlook.com
 ([fe80::eaaa:b430:ba9:5dc%7]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 15:25:44 +0000
Message-ID: <baf91d42-13dd-41eb-88d7-d6311ee0d9f9@amd.com>
Date: Mon, 26 Oct 2026 10:25:41 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] platform/x86: msi-wmi-platform: Move guard out of
 switch in platform_write()
To: Antheas Kapenekakis <lkml@antheas.dev>,
 Derek John Clark <derekjohn.clark@gmail.com>
Cc: Guenter Roeck <linux@roeck-us.net>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 W_Armin@gmx.de, corbet@lwn.net, jdelvare@suse.com, kuurtb@gmail.com,
 linux-doc@vger.kernel.org, linux-hwmon@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org
References: <20250511204427.327558-1-lkml@antheas.dev>
 <20260803221614.59324-1-derekjohn.clark@gmail.com>
 <20260803221614.59324-2-derekjohn.clark@gmail.com>
 <f8b2c85a-2800-c9a3-4e56-7af4c53823e5@linux.intel.com>
 <58a9c644-98c2-47ee-b083-0d5b19fa5053@roeck-us.net>
 <CAGwozwGdwhE6Sm6oa2uxx_sHfFNQ6fHYnAhYHkEPQcp_Yb=Z6w@mail.gmail.com>
 <CAGwozwFUTagam+dr0SXyziAMz1MJKcYMYUgrogFcmvEaE1X0UQ@mail.gmail.com>
 <CAFqHKTmQ2R-UAP9rAZzoxe=p-T1_JKPU1NaQ2ijrVg0RXZEHUA@mail.gmail.com>
 <CAGwozwGUAEb4Q9pfd_+aXMw2P3qY376F+usPHdUFO5Q6mV_ATQ@mail.gmail.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <CAGwozwGUAEb4Q9pfd_+aXMw2P3qY376F+usPHdUFO5Q6mV_ATQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN7PR04CA0085.namprd04.prod.outlook.com
 (2603:10b6:806:121::30) To PH7PR12MB9174.namprd12.prod.outlook.com
 (2603:10b6:510:2ed::9)
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB9174:EE_|CH8PR12MB608111:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cb65fcc-5b5b-4f29-63c5-08df337566d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|7416014|1800799024|366016|261026121527099003|261009223027099003|5023799004|4143699003|11063799006|56012099006|261021123027099003|261022075727099003|261022105027099003|261021135927099003|261021121427099003|10067099003|18002099003|22082099003|6133799003|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	gCsotCwmps6/RuY0uXvmf/FH3mtsAB/VDoZOVbxY2uJExsEMaiWysp4AjGprg0h+75F93ngOcG0fYGxrw/3Km+rOS8IBFRNfRjepNioFaTX336Cq4bQjrR9fh4XdnNYdkcmlCN3alChEqhMKFoD5HSUHbzQKXt+Wx0MacQ8rc/+DPnJdPNCs3qSypA8VFNTRxBSZowr4wqrlsgd5FYCGSu267g00+vdhgrBlSJQf247/ZHGT0xUZgfZi6zNeVFkx8ERWs4Uzo57y7Xs5ExNicXthOfsT6B51NjccuZcZbzHk46f8M8xQbcheKO1mLRmP6Zou+vaUDIPWZRXsd+CDfTd+/Z/TTRYT51FF4CgBttiE3lCnZFcV9mIhRIeCIN++/GwWontREnvBDJ+xnRL2AzmDYBWNEz1zwkwZXPX1ONDYgGHLPr7aeYohpwm5X+A8xtp05J/fHmXNnG0OGO0qTF/FwqEr7m6XdD2XpPePTzJOWKMzASynfgAieWiLJ7MH1/jzNo3WCNyGe3NNs5a7JWSsOL86S7ghntfEmRIf2nbIcFzDmd1YbVjn90uoqebz2UpMs/pA2rbA7p8Jc+Yh7abH6b3z01QaiXXIvPZgLkIM7j4EXIPv374hmKrYtZ6d3T3z1HMbyJMexcofLE1XHZaCIE4Gc+oeeRqdnZWpMGM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB9174.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(7416014)(1800799024)(366016)(261026121527099003)(261009223027099003)(5023799004)(4143699003)(11063799006)(56012099006)(261021123027099003)(261022075727099003)(261022105027099003)(261021135927099003)(261021121427099003)(10067099003)(18002099003)(22082099003)(6133799003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?alUwaWhydFVvZ2lJYzNGcXhNSFN6MzRxTU1PNVF2dC9lbXRvd3BvY1p6U3hV?=
 =?utf-8?B?NUxUalB1c2Y3UEFUa3EvMmVXVVZhajNUSSt4cG1idTlrenR2MDVuenpIM2pm?=
 =?utf-8?B?ejVST0N1WWxmcG5nWlkzSU1VdVR3NG5GZnNOOERKWWdoT3lQYVZLUDVwM010?=
 =?utf-8?B?WCszWnoxMFhQckU5Z2hPeXpVWTdDcndSdloxZkp0aWtEUEhWTkxlU1lDV2gw?=
 =?utf-8?B?dDNGOFEwUmhRdEFzY3F1b21jZGh4bmhvdStzRVA4K3djVnJvQ3Z2SnlaVnhw?=
 =?utf-8?B?U2NOeWhwY3VJY0x0V05rSU5CSUZCYTFHemdyNW5HM21VYS92SDNqUmVFT0RQ?=
 =?utf-8?B?SHNGeDZVMmU0QlRodzRCM1RPRVcvOTlXZjdBSEU3M0NpY2VGejVrdkNhaE5W?=
 =?utf-8?B?QnB0NGxkdHJkeSsvNnpNT3gvM1ZDVW9qNFhXY2hHSnI2eDhDN2xIR2liM3dL?=
 =?utf-8?B?bjRFais4ZHVudk5HTTIxWENGQ0tCWnowb0lzSWNuUDFvQzNSN25HNHRaK2Vy?=
 =?utf-8?B?VjJBZE9FbkhkVXR2cnMzN2RFQkRqL1Y5bmFNRE5TVGE2TTVEbjcwdTNabEdM?=
 =?utf-8?B?QWRmcHNzOVJtY3VJVUpxNFNHcjJ2N0J4ZXZscTA0REVTRFc2R3I3cXp6QlhQ?=
 =?utf-8?B?dlU1NURERU1DaXdsM2FXYWFONUpsU0d2M2NwNm0yTVVkOEh6WDhYd245d0FZ?=
 =?utf-8?B?R2NaK1BDL28wMkorUHRJQ0pkYWoyRkZ2TGgyOW04S3hzWWkrVk9MVDZqQmtD?=
 =?utf-8?B?NkVOUVNDSFhqb1RlSkR1dTQwTWZwc0UzY1ZZSDZDdGpaWnJvV3RnbEsrMHBy?=
 =?utf-8?B?L3ZpeCtFdGNVZGJrMmlDQkg0SHlhaGU0dktxajJlTUpuVzM1TnhlMFZhUWVt?=
 =?utf-8?B?Zk0vK3cwdG1oeWpSU3VBcEh4WXBBbGt1UEFCbURFOWFrdURlUitIYytkUFNu?=
 =?utf-8?B?dWNMOWdZMzlkMHVDQXB3aEZ3d3g4LzJSd0prRjI2YkNqWWZRZTN4WXk1U3lO?=
 =?utf-8?B?d29oR0VPTnpYTldDNFZad1o3VHBkRjByaGYwV1RDUUdNcHZITEhOcC9Ja1Zz?=
 =?utf-8?B?WU5DdEVZOXpmWWM1Q1c4c3B6ckZjeTBCdEtCNUVmbHNRVmMwd01EQ0Z6ZXhE?=
 =?utf-8?B?U2Z3blF5ZHNyMGZMU1J5WkZOUDEzaHhteHZsRDc3Y3lMOWFJenNvNDZvVTk3?=
 =?utf-8?B?N1JPakl1VjdCWjVFcndmanBFRXBrNFhYVzlwc2RDT1Z2Z045WGNlQVo3SG45?=
 =?utf-8?B?VmxwTG1NZHRzZFZlaWpQUjFTbERaVTkzVUxScjZKdDcyMmNrbmd0NUxHYWFx?=
 =?utf-8?B?YXpZTExQV1VzYWkxTWdQNG9aUTh3ZFBpSFlWWCtZSnJWL051MTVGQzRaaS9o?=
 =?utf-8?B?eFpucHJEZk53a2ZnY2FBbysxR0tCQWErOUpoZzZ2UW1SM0p6VGxqMnU4cU5F?=
 =?utf-8?B?em1QOVlMMXBhSFdjNWJwckdaSkxpQzkwTzZMck0zUU1RNS9vY3lUYW45ZHRu?=
 =?utf-8?B?SWwyL2R0QUJvd3RQUnNUYXpwRnVMeEUwc2l5cmJ4a20rNnpmbU14RjlhaVBF?=
 =?utf-8?B?S2hlb1IzN0w0WmlBc20vZUZXcmlUOTFCU0o1c0FWZmJ3WFlMUGpsTmhpTjRS?=
 =?utf-8?B?RWRVR0VvTkkwSWlxdDl6VUFyN3FzZ01UNEt2ZWN1ZlA1Y3ZtSTFEeFB4d1pN?=
 =?utf-8?B?WmwrdndBK3h2bGVUckFuUmVoVGFQMW83eEhoVTdMRnh0UGt2WW5BOURBVzhJ?=
 =?utf-8?B?cFVicVBRVHhtNXAxTUVPcHU4aXdvaWpYbjl5dmp0UHg2b1ZIcm9sazFsS1d2?=
 =?utf-8?B?OU1WU054WnpIejFUOENHc3pKc095U29Pd2VIOXNwbnNOYnpqais3VExrdkc1?=
 =?utf-8?B?RWxpNklMTkJ5TmlxOG54dGs3L2VmK2xlR2JDVUk3ZHZpWmRIMTdOVHNMUEdw?=
 =?utf-8?B?c2RwN0dGc3owd2lMVjkxVXZFaVdzYWd0WjdIUW1VclBnYTdnOFZZaGtLK2Nt?=
 =?utf-8?B?RTVwN1J6U3hZQlVaK3FKMmhXRkZIbDV2cmtxbXpnaXh4UkhZTHcrdmZCWm8w?=
 =?utf-8?B?VjFBK3FGU2htYnFVZzBuTjIwZ1h6YlcvNjd1YTVzc0p4ODhlU0EvVlo2L0Iz?=
 =?utf-8?B?Q3VaL0NqUzlDR0p0Nm5CN3BsaUxMcCtobVh4MkVqNVJESDV5L3hUTHFPY3pE?=
 =?utf-8?B?ZlV4V3FOd3k1b1hKNmNScjNzRDFPUXQ4U2Ryc3JOT0J4NnY5Z1NGMlJPb1Ns?=
 =?utf-8?B?anZBMDllc1YwMzZHN0d3T3BkakJRdVVkYks0K1hQRVVVT1pqam1YVDRnb3ZI?=
 =?utf-8?Q?67JQHyPVKKR+JdxRqJ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cb65fcc-5b5b-4f29-63c5-08df337566d2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB9174.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 15:25:44.1743
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PNvHWrjiD3uKTcFWS3cuR3LhXYRp5wrcXVnHm/rk8ud3XrNP7mhgdZ/hLMU42u3samm75lFpeSh3lWRbBweFMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR12MB608111



On 10/24/26 04:24, Antheas Kapenekakis wrote:
> On Wed, 21 Oct 2026 at 05:26, Derek John Clark
> <derekjohn.clark@gmail.com> wrote:
>>
>> On Tue, Oct 20, 2026 at 2:53 PM Antheas Kapenekakis <lkml@antheas.dev> wrote:
>>>
>>> On Tue, 18 Aug 2026 at 17:26, Antheas Kapenekakis <lkml@antheas.dev> wrote:
>>>>
>>>> On Tue, 18 Aug 2026 at 16:42, Guenter Roeck <linux@roeck-us.net> wrote:
>>>>>
>>>>> On 8/18/26 07:12, Ilpo Järvinen wrote:
>>>>>> On Mon, 3 Aug 2026, Derek J. Clark wrote:
>>>>>>
>>>>>>> The ML patch set uses a guard within a switch case that violates cleanup
>>>>>>> rules. Move the guard outside the switch so all return paths are covered.
>>>>>>>
>>>>>>> Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
>>>>>>> ---
>>>>>>>    drivers/platform/x86/msi-wmi-platform.c | 2 +-
>>>>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>>>
>>>>>>> diff --git a/drivers/platform/x86/msi-wmi-platform.c b/drivers/platform/x86/msi-wmi-platform.c
>>>>>>> index dfb65ac8fbf6..33acd448f674 100644
>>>>>>> --- a/drivers/platform/x86/msi-wmi-platform.c
>>>>>>> +++ b/drivers/platform/x86/msi-wmi-platform.c
>>>>>>> @@ -675,11 +675,11 @@ static int msi_wmi_platform_write(struct device *dev, enum hwmon_sensor_types ty
>>>>>>>       u8 buffer[32] = { };
>>>>>>>       int ret;
>>>>>>>
>>>>>>> +    guard(mutex)(&data->wmi_lock);
>>>>>>>       switch (type) {
>>>>>>>       case hwmon_pwm:
>>>>>>>               switch (attr) {
>>>>>>>               case hwmon_pwm_enable:
>>>>>>> -                    guard(mutex)(&data->wmi_lock);
>>>>>>
>>>>>> While I cannot see the code easily, one could also add braces to inside
>>>>>> the case to avoid this problem.
>>>>>>
>>>>>
>>>>> I don't see the code either, but wouldn't this be a use case for
>>>>> scoped_guard() ?
>>>>
>>>> Hi, not explicitly stated in the cover letter, but this is essentially
>>>> a series on top of the series I sent last year but I did not clean up
>>>> due to a variety of issues with MSI firmware that would have made the
>>>> driver unsuitable for upstreaming (to my standards at least). These
>>>> issues span Intel driver problems, HID controller instability, and
>>>> varying WMI implementations esp. in regards to PLx setting between AMD
>>>> / Intel variants, shift mode behavior not acting correctly, and fan
>>>> curve application / resetting being weird (the fan curve on off bit
>>>> does not seem to change whether an automatic curve is used but how
>>>> close the device alings to the set curve? requiring us to back up and
>>>> restore the original curve? half of the devices keep the curve during
>>>> sleep and half don't? but if the fan curve is so finicky do we really
>>>> want a resume handler for it? Perhaps we can kick the timing quirks to
>>>> userspace)
>>>>
>>>> For this reason, I focused on other manufacturers such as Ayaneo and
>>>> OneXPlayer. I will revisit this series per request from Derek as he
>>>> seems to want this for steamos and hid-msi is already queued for 7.3?
>>>> Although, to be honest, compared to the controller firmware issues,
>>>> the WMI implementation is pristine.
>>>>
>>>> So I will need to go through these issues 1 by 1 and see which can be
>>>> fixed and either drop certain features in the beginning.
>>>>
>>>> Particularly for the fan curves, if we say that resume handlers are
>>>> required to be in the kernel moving forward, I do not know how
>>>> realistic it is to make those reliable for this WMI device family.
>>>
>>> This driver still needs work. I am getting bug reports about
>>> inconsistent TDP application on the EX. A8 is broken as well. Even
>>> with your patches Derek. I need to grab a new version of center M and
>>> see what they are doing.
>>>
>>> Does this driver work in your experience? What is that SMT toggle you added
>>
>> I've got a few reports of some issues, but nothing with much detail. I
>> have the 8 AI+, 8 EX AI+, and A8 in hand and all three had effective
>> TDP changes in SteamOS with these patches applied and SteamOS Manager.
>> I haven't done extensive testing over multiple suspends or longer
>> sessions myself. I'm also not aware if there have been BIOS updates
>> since my testing.
>>
>> By SMT toggle i think you mean the STAPM toggle for the A8? It was
>> referenced in API_UserScenario.dll (setPowerLimit_AMDSTAMP) which I
>> reviewed using ILSpy. After toggling that TDP started reporting
>> correctly and being settable.
>>
>> Hope this helps. LMK if you need anything tested or additional info.
> 
> Ok, I asked for more feedback. Yes, TDP changes do work, but they are
> not correct. Users AB testing with a Decky plugin called
> SimpleDeckyTDP report major divergence.
> 
> SimpleDeckyTDP uses a combination of RyzenAdj for AMD and RAPL for
> Intel. When set to 7W, users report 25W power consumption when using
> the kernel driver and 15W when using simpledeckytdp on A8. 15W is the
> correct value for a 7W envelope on an X840u APU.
> 
> STAPM should not be required to use or deviate from STT. Both of them
> should have equivalent behavior and match ryzenadj as the underlying
> DPTC hooks are the same, ryzenadj just accesses the mailbox directly.
> Using STAPM is a workaround for buggy vendor firmware that does not
> control boost values correctly (SPPT/FPPT) and is what the first
> generation Lenovo Legion Go did as well before they fixed it.
> 
> STAPM as a workaround works because it uses timers to control boost
> values, so they decay after 2-3 minutes to the steady state TDP set by
> the firmware. STT boosts for as long as the device thermal envelope
> allows. STAPM is deprecated by AMD, only STT should be used going
> forward. +CC Mario

It's up to the OEM to decide whether they have programmed their firmware 
to to use STT or STAPM.  They should not be used at the same time.

If their BIOS/EC is using one and reverse engineered software is using 
the other, you will expect problems.

> 
> This points to a BIOS firmware issue. You should consider getting in
> touch with your MSI contact for feedback and to plan a fix. I do not
> have an MSI contact. And yes, I am not happy my users have to rely on
> third party unvetted plugins for basic power controls.
> 
> But we cannot revisit this driver while basic behavior. does not work.
> If MSI does not fix this or there isn't a bug in this driver we can
> fix, the only viable way forward from our side is to move power
> controls to the DPTC RFC driver/RAPL for affected models and only
> retain fan curves on this driver. I do not want to do this, I have
> userspace integration for this driver already, but it is not
> functional to the standard expected by users.
> 
> I checked the ACPI firmware and unlike other manufacturers, there is
> no EC independent control of the power envelope. We would still need
> to check a low battery hook in firmware but other than that it is a
> straight translation.
> 
> Antheas

