Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.135.77
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794390493;
	b=GihVL5OvzFbaNpNhQi6bWGbP0KSAQDSBt0BBFY5Ul2c/CaFySeefAUOi/079I6ZzVW5T
	 tTec2zescYxWpIcC8MWkSn4AbQ2ne3c0ksAnAciaehgf1LS/IKurllfVG9aLuKNGmbsJG
	 A4PXjDPJcJF+MxKKUNCfBerQmD1SR/4prpfp9UaoyzbEFr+5xIDs8P1OFz8viInMWcX3t
	 gxxlGfDUUEtYJrYAvHHTKFu84RIrx8ZfIEgwjy+wn78Cy6XbI01c/OWnoLI2z24zwszBk
	 WRFj4A82KwFH2VDYzEHq8ookkrn2GGkYIpJCOEMeEBVxwTBy9hglPU8xNeD+FfyxyCA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794390493;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Received:
	 Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=K7MGTylMyqL2zEg9SV0r8JFBPyweH2d+4b2BQ5+Wax8=;
	b=uAuXftr165oLttO0YvPzSlyWqQ2fkleV2UtvJGPH5ZS1q3CMX3ukK0gZt26kptOq2R57
	 5kEHv2tZ4p3zHn4rwwHDUyG9tEvGhYonH78AqsjiDVHkk0FDDkNnisxrQfsrAF/6xCaNY
	 eM55xXGVgq1RRMl8/1n20b85ELPGpk8e34xi1uy39hFyUm/HiUYNtnl06SsHh3MLNnJPW
	 2R8bEvrtbPzYtcqCFmpnczlOEL61nY9O8Ec/wZFoPrPkt3AkZAg0ylSC/BJDZi4O8N1Y6
	 Y+LdnP+hyo4Z4E5nVvwQXVJwiEOwWGFEiDo43Whg730i/8rLSw5yIiSikhBnW6+K9+Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=analog.com;
	spf=pass smtp.mailfrom=analog.com;
	dkim=pass header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=aAPGt1pl;
	dkim=pass header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=bDVH2sT8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.135.77
Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9BA1606A324
	for <linux-hwmon@vger.kernel.org>; Wed, 11 Nov 2026 09:48:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9BA1606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=aAPGt1pl;
	dkim=pass (2048-bit key, unprotected) header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=bDVH2sT8
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB8eMnf107369;
	Wed, 11 Nov 2026 04:47:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vtelectron.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	DKIM; bh=K7MGTylMyqL2zEg9SV0r8JFBPyweH2d+4b2BQ5+Wax8=; b=aAPGt1p
	lR9cCIhyMw/PMBGALh3WQmHEjxGdzPGafJbUNqlaRy2B0DzoThlLOA9+HyGv9bN6
	mk0MSklvlXXNf7ykBEc01Q6CkoJgDDcoxLF1no8UQ6HtQvF8UdOe9wMpb1B5tidh
	O7DsDt0t9Lx4I/mjlPMYDBZe8MOuipcDB5EjTcmj5esX7s8z6BTXJ7dJQh3dZVQa
	WhDTssFYHV/r/b4pB3uuVka/PkKw31aDcgKADp/gBpFSGpMOqNR0vnQuaWa8l0y7
	Rqq3n4ckoEqej77dqI8FJ4ufFQ+Fdy6cjtDpKOja6JzqDClv05JddSW8HUPtpJPY
	l9Bz9pvVsetWrRA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=K7MGT
	ylMyqL2zEg9SV0r8JFBPyweH2d+4b2BQ5+Wax8=; b=bDVH2sT8yu1niUgGcJJPr
	TeCp4u5VV9LvP+htVZQH/aHE8Tx015r+x+RpyKLv+IomFFKIe6foeFhWqp3AMo1L
	hNEdiXnW1s8AD7csQlzZ4HVIMLGMZ2L8TQLKmJ9Ec5ODyLVqZZIC1k7/wsHeXeq5
	OMDc+eCF0fmjop8ibt6/+9oOyWU1wuxLjYZDAaDdkWt4mDY5+hu2eFFAtfYb4/BZ
	bRd66y0q0YGLJaEbIHUiBoSA3CC1f/fWdYc1rUF0JuNIgqd02ytzy6TGcYN/VHRf
	iWtnFYhVVVGe5RczR3vE76rmsePRvn+pQqhYNbTa9deDf+BnWuJk7yuPXQjs8qAX
	w==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012018.outbound.protection.outlook.com [40.93.195.18])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4huwra1nv4-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 11 Nov 2026 04:47:51 -0500 (EST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M4TWisQIXeiftuJOVU7D3u0MHIQ+86WpQnhal4dC9/lYD7ccIoNam2WYy7SIGG3phxIm0zOz/kbPewCe7W6ui88Y0CAHzmDtOgtCuuSadf5SAROCLWhlu2lctZnP08KZK4gfjAr9paqLo5eUoiP8jU66MlHA3Hz3wCxOHZHrmxuHJ4L7TkiNG9yUgW1i6MxDMC8WThkh4WeSqj1/4OSGw0OQauF5LyHTjzDy8Ib6ibAQ5aPoS01BhRt1CmuBN66IF2nRmZwcfDiFdHfNQN9KxHhGE/aIpvyLtWPob1A5LxPePTJ5vMZ4GLiD7JGR81H2M0Pq4e9nTLwjTXss5ircVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K7MGTylMyqL2zEg9SV0r8JFBPyweH2d+4b2BQ5+Wax8=;
 b=NROsD2gHuj4jXqTQ1lEVzy7ywiLOss1nP7Z+zDU4w/BHffFgAY4Nr+4TGbAX31EB6YP+Gy2EJzEu738KGC924B/Ryxa+YtuTSwscABwADe6Y8AGGQIbBA3ZVRY+gbC8+/nM/tUtNeSOewruD7GeK0LLm5UiiLXogDyoyik1Bld7OAWQl2mT0zyg0BVE5Uqt4eizFBJGdqja5wmZ5aX7Te0cO/PgCm3RvbwMeMyoW4UuD+TN1D2IFC2MfiWmzffjQXpt2Fjg2HhDYmzPPOz4HbY8GYN4i1BC6ASKFl+xdYZZfZGNuC2TZlGyPdUZ++i+mK5/xZnkyZa8X7WfEgLuNfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analog.com;
Received: from SJ0PR03MB5469.namprd03.prod.outlook.com (2603:10b6:a03:28a::17)
 by BY5PR03MB5154.namprd03.prod.outlook.com (2603:10b6:a03:22f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 09:47:49 +0000
Received: from SJ0PR03MB5469.namprd03.prod.outlook.com
 ([fe80::2a19:76b2:e731:8c5a]) by SJ0PR03MB5469.namprd03.prod.outlook.com
 ([fe80::2a19:76b2:e731:8c5a%6]) with mapi id 15.21.0592.012; Wed, 11 Nov 2026
 09:47:49 +0000
Date: Wed, 11 Nov 2026 09:49:08 +0000
From: Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 08/10] hwmon: (max197) Remove driver
Message-ID: <avQ5zj8D5Oqlr-tg@nsa>
References: <20261110183434.181711-1-linux@roeck-us.net>
 <20261110183434.181711-9-linux@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261110183434.181711-9-linux@roeck-us.net>
X-ClientProxiedBy: MR1P264CA0160.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:55::11) To SJ0PR03MB5469.namprd03.prod.outlook.com
 (2603:10b6:a03:28a::17)
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
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5469:EE_|BY5PR03MB5154:EE_
X-MS-Office365-Filtering-Correlation-Id: bc8cbed5-3ac9-4b6f-f935-08df3fd8d8b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|10067099003|11063799006|4143699003|56012099006|261022075727099003|261022115727099003|261021123027099003|261021135927099003|261022113327099003|261021121427099003|261009223027099003|261022105027099003|261026121527099003|261026140227099003|261102123227099003|261028144727099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	pxi6HGXqFG96OrgGC/zZm5KElUV/z640tbsaTOaCbEKfbx30hLzJ+jGjBQnQ/kJ89wq5I/RrkIs9E9mDmUiKpR+XHyEcETCVM7rqQH+NSNXJjgmtnwmqRQ9p9OPd4STPCHtymtqbdrjbB+yOffhJ9K7EJHY9nKVy3kz6dodPhYDQXppu+356DsvMkjvh3N9UOcxbPEjS8CbwPX1fAU8ghnuI+PhjMkZ0jChSYB/2f6xKhQS55We3XU1e4+1HVAW27EhM74xxc/QmQ4Xf3URCob3jJL130J2BRhq/O+vNLDF7uJr9x+kzUZ+b4kglwnv+978nlRxjUIxD13LlcKqi63j4qzQ16w26psLd4zksTjAhjxETE3jj1QDwTIJ+NbxfAio0Qa6d7X3YrUNHjEyM/XUoCbN6GdOvodrSJVH5moQPRAGzg1V+Brg5LUZB2zvI/MOhNtUia3krsNTQU3T0yRJDuhRgAmKfWqSqMNPf6mPvfcAqp1w8UHmjj3j35c2KRusUcVz77GAQNRQ1CIAejj/snqusOo/usDVl6efSzjNTQ3RZ29It7qEPctLzFxmb1wEi7LOudIiHVCTt+WHgoiP5x0oewn5O/oTkNdBgk+CkVsChOVTXhNNWtk0dffiyODrF64DlnL1CMPLNQ2eaKygskxI9avMc53+ymI3PYLE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5469.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(10067099003)(11063799006)(4143699003)(56012099006)(261022075727099003)(261022115727099003)(261021123027099003)(261021135927099003)(261022113327099003)(261021121427099003)(261009223027099003)(261022105027099003)(261026121527099003)(261026140227099003)(261102123227099003)(261028144727099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aXdXRWZHaTlPVjRVaWlXZFFlVkJEOHNEbTNpMXVUbG5BUlF2VzhDcWtid1dP?=
 =?utf-8?B?N01oQ1BXUnlNSERndW12V3NrWWVPaWxYN2ZVMTNjYlphUjBFZE1ZYjR4Ynk3?=
 =?utf-8?B?VXhleFJJY0xDS3V4WFYyQWdhNVVGeE9qcjRmajVNWVVwUHpmbmREakVPR0hO?=
 =?utf-8?B?UUFJU2RDbDBqZWxMRnhxb3pFT012aURRTDMzVkdqQTExOGxSNWJVY1JRQlpF?=
 =?utf-8?B?Mkd1UURmZ1hLYm9heERDUHBxN2Y0Q1kvcmZDUW9NaWdqa1pUc0x1WG1jTnlo?=
 =?utf-8?B?bHNRRmVZb3l0VExPN1pUT2FEMzd2enY2V0JaRXZpTVk5aXNidWg5UEFZbkR4?=
 =?utf-8?B?Uy9MaVk5K0pJOEJFbzlPbmpZUEV6M0F0NjVZTUxnWnNITjBEOGV0RG1hM0ls?=
 =?utf-8?B?MVNmUlJGWERJODRBV0pEemdKU2thZDh0dnY3YjgzL05LdTRYME9NT0FQME8r?=
 =?utf-8?B?Z2QvUFhpZ1BQbVpsUkpqSURXUDBTVWdFbmpIOC9vMEpBdFJVL3lpN1h0N21p?=
 =?utf-8?B?SHF3TVVJeWZhNWtlMWpOWHVLUTc2bStPbDNYRi9Td0UraDZPNlA3UnBoVlc2?=
 =?utf-8?B?TVhlUmJvSXl5MmdkMXN1WW8xRnJ2V0JLOGNubmlUY016NHR2K1ljQlZTMFFq?=
 =?utf-8?B?VCs2c2ZBK3E4Y28yMW1GQVU0MjVaVkpPaE9JZk16OVkrRkJsc0JsYXg1Y3Ja?=
 =?utf-8?B?b0QzWkgvZXBSQmR5aTE4NkN5aWo4VzhrNGk2M0pGNk1KQnZ1TTBLQ2JraWhk?=
 =?utf-8?B?cUJielNaSHZ3SVFSMUYzaFVNWW5yRGJzMDFtb0ZTUkFxWlU2ZDk5YkE4UVRT?=
 =?utf-8?B?SUc3ajlDUEZYMHVjcExHTUJFLzRXYXJKdXVVQnBhNTVUbXZ2N2o1VXZ6ZGZa?=
 =?utf-8?B?NmRWUWNFWEhPK3BFcUpTS0NUUDZNTTVWb2Z1S004djhYYkQ1U1NvTTNlSlc1?=
 =?utf-8?B?blhhc0xVTyt3VjM2QnF5eWtjaGlvUnNtS0dOWlh2Vmo5K0lSbFlGUUlDWnRD?=
 =?utf-8?B?aUZESGYrWUJRM1hCdEgzenRvb3VlL2REVlgyZlF5V1NsRGhEa0grRDFGTGZZ?=
 =?utf-8?B?L0FRYkNyeDRqVFVjQktSUm5Sb1dPdFc1WXcwdHNjbmZoa3g3WjNzcnhOVHMy?=
 =?utf-8?B?ZERLZmF1ZEhGa1kwajhFaG5FaU5waVViSWZoSXkvN1J1aTVHRlBMN2cwVXIr?=
 =?utf-8?B?UUtXbnR3bXk4MDRKZHp6dkg0SWhUdDdUZG9FRndGbW9HcEFNSE9Mc2d0Ry90?=
 =?utf-8?B?V3UvV0x6bHB4SkNMbEdnOHJqU1JDQkhkWmhJeTNzZjRTWE52NXFzVXhvNkpT?=
 =?utf-8?B?eW04cnZwMU82RmlBZHNodmtBU0JJOHBSem9sWXRZQmMvbTdaVkpTbEVrWFMx?=
 =?utf-8?B?RlVWSzAyblRzWXh2ajY2V0NRdkdPZkVGMDdjMldJTTFndE5SNGxrYWowZXZ1?=
 =?utf-8?B?SWlRV2lpSGptTCtFQTBKY0dRQVVqTDd1cDZNRUxCNHRDWmRYYko4SEJKNUhB?=
 =?utf-8?B?R2NzRktFa3VidE9HRDJtUU50K0l0WkhQV09vSDIzTWw4d2Q5NFFmSHplUlE3?=
 =?utf-8?B?NHpjYmV5bzkwMEhDdWxXeCtIckVHS0dTSm5ZcVBDTjNUZ1ZkbUhkSktZSkN0?=
 =?utf-8?B?K0Y0R1ZOSDVkWkNIcWdDYlJzL2lrM2JPOVJiQStLNDQrbWluczNOMFIyWUtS?=
 =?utf-8?B?b3ZiR044RVR3bHM4RWliZEpUUEJMMFB4ZUhKYlNQK25JMjdaNVlBa3NMV2xx?=
 =?utf-8?B?bnFndHppTE5pQ0YwUVdaUll2cmJYbE5wWGIrTzdDcG40ZkVoWXg0NENna3Z2?=
 =?utf-8?B?OUNYcWtDNEloVWlUVzZRSDRxdDVqczhZQ21qRjVydFZNL09rUDVmVXMwN0d3?=
 =?utf-8?B?TXJUMEtzTGZSeTU5ampka1lZb21WdCtmMEVFWnBxSXJiR21FSEY3SXhvVWVF?=
 =?utf-8?B?VFhoOHg2WWRKcmRPNlFQYmphdFdubUFwdzVyMzdsNm1ONmVZM3c2WGJyb3VY?=
 =?utf-8?B?YklvZFZsV0VDQVE4QkZ3UXdLNjRHR0hBUmdGczhZTjlvMm1HazJJVm5YVkRF?=
 =?utf-8?B?Wmt5RWxtdWJkZmJpOWcrQ1F5bXdWYW1kVGJvU0pwdVErUTU2Sk4vMjd1aTBm?=
 =?utf-8?B?V2NOZkk4QVpwRmR5aXZlWnd0a1p1M1VwNjZGb2d4dFVuUHNvaVV1ajVUd1pG?=
 =?utf-8?B?aDNBbUJPamdETFNPTXZoT1llWElaeGxVMXhFUzNLUTlxcit0c1g2cE90WDhD?=
 =?utf-8?B?bE0zOVFtMFVaUzlaVVNIZHB4KzQxaUNCZHhVR1Awd3ppK1dHUWlqdnZoQTNQ?=
 =?utf-8?B?dW5Nc0g0UWRlbmQvL2grOFFkdC9nM2hnNUJBN3lCTGZlQXhhRkZ3dz09?=
X-Exchange-RoutingPolicyChecked:
	MtSaUHn9Yyos/tzBg8nkP+mKGDOo0dlfLGPzx5M07cHY6fbEfLBVZWStsrrjXBrzW/q+T+2hcXA2+aHZUFYVIc7LXTORJFC76qOrMQABmICUcQ97cW43r9+jR8QsnY+LqFQf46Bx2OhBlm0sOq7Vt0Of/+QMvJcOJbD3IQQbE9AIYaf5m99U8AfoA1iTq2qwzhRVKC9qpG0WxUBfZwvOT8r81ZlNhgG055NF+h7D7glfNJaBYWOylUsna2qC0KnprYhKM4NGFSZvNsLbCflVR1wFVQVfZ02sWbwGGeIpAcff7zdsS1oqAAJ05ZGfYlQXpLC1iZ15NJqgt7LyWzpwQQ==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc8cbed5-3ac9-4b6f-f935-08df3fd8d8b3
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5469.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 09:47:49.4473
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /hqxoj2HJmgpL4pGm9K85E3p0WGnlwD86AbVpvlsm3OKqDbrz1OkCqOgOuR8z1IbtsNTjOrrWj8Jy920ArD6Sg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5154
X-Proofpoint-GUID: 9dQN0RsFea9Z_fxmih_WD4pQ2Vu0IQAA
X-Authority-Analysis: v=2.4 cv=caBHPXDM c=1 sm=1 tr=0 ts=6af439c7 cx=c_pps
 a=QNQPV3WJHVGG3OZWPlqtww==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=N--XFCr6TIEc_64PeIT2:22
 a=gAnH3GRIAAAA:8 a=_jlGtV7tAAAA:8 a=aRxQL1JOAAAA:8 a=a-JqSdj8pl4FCktX504A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=nlm17XC03S6CtCLSeiRr:22
 a=lBRdisTmIr2YKkuu8atg:22
X-Proofpoint-ORIG-GUID: 9dQN0RsFea9Z_fxmih_WD4pQ2Vu0IQAA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAzOCBTYWx0ZWRfX7/ZHlFOqGjki
 fHo0Z0sLhh1w0PSL3+eqLxBo7+EoVBjg+XFUQEiDa9rttGzfsvEuJX7d0feRIyHs4FaAQ1qERZw
 nrhkZkrvxDmsIQ9e76HEShcXoFN6Z4hl9sbyWSc5cXAGF5JIfy4q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAzOCBTYWx0ZWRfX7430fmYrvPHd
 2x6GMBp0QW/ymSdC8fKb87FR5jReEYfS2EuBpHF/HBy7lY4QFshHZbQkBhwnVQlKRKCR9+/sH/W
 sHhPB8m3hxbVt9R/Bd8xGXzXbUW7mA/m1TKg57LKguD51qCwHz9OVT2QCOTdSnbJdJ1F2A/mw8u
 f4qr+kpxGSGgcguuCJXtTexMXJn3iFKtjsCjLLb59e7ZPeKKm7TOlrYj6WZlirIFFZmA0MidDy5
 KXx0tgjorCsJcVlhzJwdQRYsHObcL0kk1ABJBE2t2fuv665JRyWOEdHAXcCIK/CXTwXSNUbvPIH
 qFelCSIDkb/2an+W7X9t61KhCT27KbarqCVcOEOR+EAgfy/imP+tGyGIAlASgoiWmuC40Q7G2hd
 tLsyokkaaoPJDxmwDsJbtvJPPASLqQBJFSDNLfox93Gd7h3dfC/4biBS4hj3EyOQ117Ef2bxb4+
 2nD0pARw1ImY50jNJZQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0
 phishscore=0 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110038

On Tue, Nov 10, 2026 at 10:34:31AM -0800, Guenter Roeck wrote:
> The max197 driver requires platform data providing a convert() callback
> function pointer and fails to probe without it. No in-tree platform ever
> instantiates max197 or supplies struct max197_platform_data, and there
> is no alternative mechanism to access the chip.
> 
> Remove the unused driver, its platform_data header file, Kconfig/Makefile
> entries, and documentation.
> 
> Cc: Nuno Sá <nuno.sa@analog.com>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---

This one is still in production but looking at it I agree it would be
not so straight to make this driver usable. Hence,

Reviewed-by: Nuno Sá <nuno.sa@analog.com>

>  Documentation/hwmon/index.rst        |   1 -
>  Documentation/hwmon/max197.rst       |  70 ------
>  drivers/hwmon/Kconfig                |   9 -
>  drivers/hwmon/Makefile               |   1 -
>  drivers/hwmon/max197.c               | 341 ---------------------------
>  include/linux/platform_data/max197.h |  23 --
>  6 files changed, 445 deletions(-)
>  delete mode 100644 Documentation/hwmon/max197.rst
>  delete mode 100644 drivers/hwmon/max197.c
>  delete mode 100644 include/linux/platform_data/max197.h
> 
> diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
> index 7ce1a6f42ddc..e364e051457f 100644
> --- a/Documentation/hwmon/index.rst
> +++ b/Documentation/hwmon/index.rst
> @@ -168,7 +168,6 @@ Hardware Monitoring Kernel Drivers
>     max16601
>     max1668
>     max17616
> -   max197
>     max20730
>     max20751
>     max20826
> diff --git a/Documentation/hwmon/max197.rst b/Documentation/hwmon/max197.rst
> deleted file mode 100644
> index 00e16056823f..000000000000
> --- a/Documentation/hwmon/max197.rst
> +++ /dev/null
> @@ -1,70 +0,0 @@
> -Kernel driver max197
> -====================
> -
> -Author:
> -
> -  * Vivien Didelot <vivien.didelot@savoirfairelinux.com>
> -
> -Supported chips:
> -
> -  * Maxim MAX197
> -
> -    Prefix: 'max197'
> -
> -    Datasheet: https://www.analog.com/media/en/technical-documentation/data-sheets/MAX197.pdf
> -
> -  * Maxim MAX199
> -
> -    Prefix: 'max199'
> -
> -    Datasheet: https://www.analog.com/media/en/technical-documentation/data-sheets/MAX199.pdf
> -
> -Description
> ------------
> -
> -The A/D converters MAX197, and MAX199 are both 8-Channel, Multi-Range, 5V,
> -12-Bit DAS with 8+4 Bus Interface and Fault Protection.
> -
> -The available ranges for the MAX197 are {0,-5V} to 5V, and {0,-10V} to 10V,
> -while they are {0,-2V} to 2V, and {0,-4V} to 4V on the MAX199.
> -
> -Platform data
> --------------
> -
> -The MAX197 platform data (defined in linux/platform_data/max197.h) should be
> -filled with a pointer to a conversion function, defined like::
> -
> -    int convert(u8 ctrl);
> -
> -ctrl is the control byte to write to start a new conversion.
> -On success, the function must return the 12-bit raw value read from the chip,
> -or a negative error code otherwise.
> -
> -Control byte format:
> -
> -======= ========== ============================================
> -Bit     Name       Description
> -7,6     PD1,PD0    Clock and Power-Down modes
> -5       ACQMOD     Internal or External Controlled Acquisition
> -4       RNG        Full-scale voltage magnitude at the input
> -3       BIP        Unipolar or Bipolar conversion mode
> -2,1,0   A2,A1,A0   Channel
> -======= ========== ============================================
> -
> -Sysfs interface
> ----------------
> -
> -  ============== ==============================================================
> -  in[0-7]_input  The conversion value for the corresponding channel.
> -		 RO
> -
> -  in[0-7]_min    The lower limit (in mV) for the corresponding channel.
> -		 For the MAX197, it will be adjusted to -10000, -5000, or 0.
> -		 For the MAX199, it will be adjusted to -4000, -2000, or 0.
> -		 RW
> -
> -  in[0-7]_max    The higher limit (in mV) for the corresponding channel.
> -		 For the MAX197, it will be adjusted to 0, 5000, or 10000.
> -		 For the MAX199, it will be adjusted to 0, 2000, or 4000.
> -		 RW
> -  ============== ==============================================================
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 9979958a59a2..1612a408c287 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -1342,15 +1342,6 @@ config SENSORS_MAX1668
>  	  This driver can also be built as a module. If so, the module
>  	  will be called max1668.
>  
> -config SENSORS_MAX197
> -	tristate "Maxim MAX197 and compatibles"
> -	help
> -	  Support for the Maxim MAX197 A/D converter.
> -	  Support will include, but not be limited to, MAX197, and MAX199.
> -
> -	  This driver can also be built as a module. If so, the module
> -	  will be called max197.
> -
>  config SENSORS_MAX31722
>  	tristate "MAX31722 temperature sensor"
>  	depends on SPI
> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index ec4b0de8cf47..56776df17cfd 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -164,7 +164,6 @@ obj-$(CONFIG_SENSORS_MAX127)	+= max127.o
>  obj-$(CONFIG_SENSORS_MAX16065)	+= max16065.o
>  obj-$(CONFIG_SENSORS_MAX1619)	+= max1619.o
>  obj-$(CONFIG_SENSORS_MAX1668)	+= max1668.o
> -obj-$(CONFIG_SENSORS_MAX197)	+= max197.o
>  obj-$(CONFIG_SENSORS_MAX31722)	+= max31722.o
>  obj-$(CONFIG_SENSORS_MAX31730)	+= max31730.o
>  obj-$(CONFIG_SENSORS_MAX31760)  += max31760.o
> diff --git a/drivers/hwmon/max197.c b/drivers/hwmon/max197.c
> deleted file mode 100644
> index a613abfdc2db..000000000000
> --- a/drivers/hwmon/max197.c
> +++ /dev/null
> @@ -1,341 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0-only
> -/*
> - * Maxim MAX197 A/D Converter driver
> - *
> - * Copyright (c) 2012 Savoir-faire Linux Inc.
> - *          Vivien Didelot <vivien.didelot@savoirfairelinux.com>
> - *
> - * For further information, see the Documentation/hwmon/max197.rst file.
> - */
> -
> -#include <linux/kernel.h>
> -#include <linux/module.h>
> -#include <linux/init.h>
> -#include <linux/err.h>
> -#include <linux/slab.h>
> -#include <linux/mutex.h>
> -#include <linux/device.h>
> -#include <linux/sysfs.h>
> -#include <linux/hwmon.h>
> -#include <linux/hwmon-sysfs.h>
> -#include <linux/platform_device.h>
> -#include <linux/platform_data/max197.h>
> -
> -#define MAX199_LIMIT	4000		/* 4V */
> -#define MAX197_LIMIT	10000		/* 10V */
> -
> -#define MAX197_NUM_CH	8		/* 8 Analog Input Channels */
> -
> -/* Control byte format */
> -#define MAX197_BIP	(1 << 3)	/* Bipolarity */
> -#define MAX197_RNG	(1 << 4)	/* Full range */
> -
> -#define MAX197_SCALE	12207		/* Scale coefficient for raw data */
> -
> -/* List of supported chips */
> -enum max197_chips { max197, max199 };
> -
> -/**
> - * struct max197_data - device instance specific data
> - * @pdata:		Platform data.
> - * @hwmon_dev:		The hwmon device.
> - * @lock:		Read/Write mutex.
> - * @limit:		Max range value (10V for MAX197, 4V for MAX199).
> - * @scale:		Need to scale.
> - * @ctrl_bytes:		Channels control byte.
> - */
> -struct max197_data {
> -	struct max197_platform_data *pdata;
> -	struct device *hwmon_dev;
> -	struct mutex lock;
> -	int limit;
> -	bool scale;
> -	u8 ctrl_bytes[MAX197_NUM_CH];
> -};
> -
> -static inline void max197_set_unipolarity(struct max197_data *data, int channel)
> -{
> -	data->ctrl_bytes[channel] &= ~MAX197_BIP;
> -}
> -
> -static inline void max197_set_bipolarity(struct max197_data *data, int channel)
> -{
> -	data->ctrl_bytes[channel] |= MAX197_BIP;
> -}
> -
> -static inline void max197_set_half_range(struct max197_data *data, int channel)
> -{
> -	data->ctrl_bytes[channel] &= ~MAX197_RNG;
> -}
> -
> -static inline void max197_set_full_range(struct max197_data *data, int channel)
> -{
> -	data->ctrl_bytes[channel] |= MAX197_RNG;
> -}
> -
> -static inline bool max197_is_bipolar(struct max197_data *data, int channel)
> -{
> -	return data->ctrl_bytes[channel] & MAX197_BIP;
> -}
> -
> -static inline bool max197_is_full_range(struct max197_data *data, int channel)
> -{
> -	return data->ctrl_bytes[channel] & MAX197_RNG;
> -}
> -
> -/* Function called on read access on in{0,1,2,3,4,5,6,7}_{min,max} */
> -static ssize_t max197_show_range(struct device *dev,
> -				 struct device_attribute *devattr, char *buf)
> -{
> -	struct max197_data *data = dev_get_drvdata(dev);
> -	struct sensor_device_attribute_2 *attr = to_sensor_dev_attr_2(devattr);
> -	int channel = attr->index;
> -	bool is_min = attr->nr;
> -	int range;
> -
> -	if (mutex_lock_interruptible(&data->lock))
> -		return -ERESTARTSYS;
> -
> -	range = max197_is_full_range(data, channel) ?
> -		data->limit : data->limit / 2;
> -	if (is_min) {
> -		if (max197_is_bipolar(data, channel))
> -			range = -range;
> -		else
> -			range = 0;
> -	}
> -
> -	mutex_unlock(&data->lock);
> -
> -	return sprintf(buf, "%d\n", range);
> -}
> -
> -/* Function called on write access on in{0,1,2,3,4,5,6,7}_{min,max} */
> -static ssize_t max197_store_range(struct device *dev,
> -				  struct device_attribute *devattr,
> -				  const char *buf, size_t count)
> -{
> -	struct max197_data *data = dev_get_drvdata(dev);
> -	struct sensor_device_attribute_2 *attr = to_sensor_dev_attr_2(devattr);
> -	int channel = attr->index;
> -	bool is_min = attr->nr;
> -	long value;
> -	int half = data->limit / 2;
> -	int full = data->limit;
> -
> -	if (kstrtol(buf, 10, &value))
> -		return -EINVAL;
> -
> -	if (is_min) {
> -		if (value <= -full)
> -			value = -full;
> -		else if (value < 0)
> -			value = -half;
> -		else
> -			value = 0;
> -	} else {
> -		if (value >= full)
> -			value = full;
> -		else
> -			value = half;
> -	}
> -
> -	if (mutex_lock_interruptible(&data->lock))
> -		return -ERESTARTSYS;
> -
> -	if (value == 0) {
> -		/* We can deduce only the polarity */
> -		max197_set_unipolarity(data, channel);
> -	} else if (value == -half) {
> -		max197_set_bipolarity(data, channel);
> -		max197_set_half_range(data, channel);
> -	} else if (value == -full) {
> -		max197_set_bipolarity(data, channel);
> -		max197_set_full_range(data, channel);
> -	} else if (value == half) {
> -		/* We can deduce only the range */
> -		max197_set_half_range(data, channel);
> -	} else if (value == full) {
> -		/* We can deduce only the range */
> -		max197_set_full_range(data, channel);
> -	}
> -
> -	mutex_unlock(&data->lock);
> -
> -	return count;
> -}
> -
> -/* Function called on read access on in{0,1,2,3,4,5,6,7}_input */
> -static ssize_t max197_show_input(struct device *dev,
> -				 struct device_attribute *devattr,
> -				 char *buf)
> -{
> -	struct max197_data *data = dev_get_drvdata(dev);
> -	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
> -	int channel = attr->index;
> -	s32 value;
> -	int ret;
> -
> -	if (mutex_lock_interruptible(&data->lock))
> -		return -ERESTARTSYS;
> -
> -	ret = data->pdata->convert(data->ctrl_bytes[channel]);
> -	if (ret < 0) {
> -		dev_err(dev, "conversion failed\n");
> -		goto unlock;
> -	}
> -	value = ret;
> -
> -	/*
> -	 * Coefficient to apply on raw value.
> -	 * See Table 1. Full Scale and Zero Scale in the MAX197 datasheet.
> -	 */
> -	if (data->scale) {
> -		value *= MAX197_SCALE;
> -		if (max197_is_full_range(data, channel))
> -			value *= 2;
> -		value /= 10000;
> -	}
> -
> -	ret = sprintf(buf, "%d\n", value);
> -
> -unlock:
> -	mutex_unlock(&data->lock);
> -	return ret;
> -}
> -
> -static ssize_t name_show(struct device *dev, struct device_attribute *attr,
> -			 char *buf)
> -{
> -	struct platform_device *pdev = to_platform_device(dev);
> -	return sprintf(buf, "%s\n", pdev->name);
> -}
> -
> -#define MAX197_SENSOR_DEVICE_ATTR_CH(chan)				\
> -	static SENSOR_DEVICE_ATTR(in##chan##_input, S_IRUGO,		\
> -				  max197_show_input, NULL, chan);	\
> -	static SENSOR_DEVICE_ATTR_2(in##chan##_min, S_IRUGO | S_IWUSR,	\
> -				    max197_show_range,			\
> -				    max197_store_range,			\
> -				    true, chan);			\
> -	static SENSOR_DEVICE_ATTR_2(in##chan##_max, S_IRUGO | S_IWUSR,	\
> -				    max197_show_range,			\
> -				    max197_store_range,			\
> -				    false, chan)
> -
> -#define MAX197_SENSOR_DEV_ATTR_IN(chan)					\
> -	&sensor_dev_attr_in##chan##_input.dev_attr.attr,		\
> -	&sensor_dev_attr_in##chan##_max.dev_attr.attr,			\
> -	&sensor_dev_attr_in##chan##_min.dev_attr.attr
> -
> -static DEVICE_ATTR_RO(name);
> -
> -MAX197_SENSOR_DEVICE_ATTR_CH(0);
> -MAX197_SENSOR_DEVICE_ATTR_CH(1);
> -MAX197_SENSOR_DEVICE_ATTR_CH(2);
> -MAX197_SENSOR_DEVICE_ATTR_CH(3);
> -MAX197_SENSOR_DEVICE_ATTR_CH(4);
> -MAX197_SENSOR_DEVICE_ATTR_CH(5);
> -MAX197_SENSOR_DEVICE_ATTR_CH(6);
> -MAX197_SENSOR_DEVICE_ATTR_CH(7);
> -
> -static const struct attribute_group max197_sysfs_group = {
> -	.attrs = (struct attribute *[]) {
> -		&dev_attr_name.attr,
> -		MAX197_SENSOR_DEV_ATTR_IN(0),
> -		MAX197_SENSOR_DEV_ATTR_IN(1),
> -		MAX197_SENSOR_DEV_ATTR_IN(2),
> -		MAX197_SENSOR_DEV_ATTR_IN(3),
> -		MAX197_SENSOR_DEV_ATTR_IN(4),
> -		MAX197_SENSOR_DEV_ATTR_IN(5),
> -		MAX197_SENSOR_DEV_ATTR_IN(6),
> -		MAX197_SENSOR_DEV_ATTR_IN(7),
> -		NULL
> -	},
> -};
> -
> -static int max197_probe(struct platform_device *pdev)
> -{
> -	int ch, ret;
> -	struct max197_data *data;
> -	struct max197_platform_data *pdata = dev_get_platdata(&pdev->dev);
> -	enum max197_chips chip = platform_get_device_id(pdev)->driver_data;
> -
> -	if (pdata == NULL) {
> -		dev_err(&pdev->dev, "no platform data supplied\n");
> -		return -EINVAL;
> -	}
> -
> -	if (pdata->convert == NULL) {
> -		dev_err(&pdev->dev, "no convert function supplied\n");
> -		return -EINVAL;
> -	}
> -
> -	data = devm_kzalloc_obj(&pdev->dev, struct max197_data);
> -	if (!data)
> -		return -ENOMEM;
> -
> -	data->pdata = pdata;
> -	mutex_init(&data->lock);
> -
> -	if (chip == max197) {
> -		data->limit = MAX197_LIMIT;
> -		data->scale = true;
> -	} else {
> -		data->limit = MAX199_LIMIT;
> -		data->scale = false;
> -	}
> -
> -	for (ch = 0; ch < MAX197_NUM_CH; ch++)
> -		data->ctrl_bytes[ch] = (u8) ch;
> -
> -	platform_set_drvdata(pdev, data);
> -
> -	ret = sysfs_create_group(&pdev->dev.kobj, &max197_sysfs_group);
> -	if (ret) {
> -		dev_err(&pdev->dev, "sysfs create group failed\n");
> -		return ret;
> -	}
> -
> -	data->hwmon_dev = hwmon_device_register(&pdev->dev);
> -	if (IS_ERR(data->hwmon_dev)) {
> -		ret = PTR_ERR(data->hwmon_dev);
> -		dev_err(&pdev->dev, "hwmon device register failed\n");
> -		goto error;
> -	}
> -
> -	return 0;
> -
> -error:
> -	sysfs_remove_group(&pdev->dev.kobj, &max197_sysfs_group);
> -	return ret;
> -}
> -
> -static void max197_remove(struct platform_device *pdev)
> -{
> -	struct max197_data *data = platform_get_drvdata(pdev);
> -
> -	hwmon_device_unregister(data->hwmon_dev);
> -	sysfs_remove_group(&pdev->dev.kobj, &max197_sysfs_group);
> -}
> -
> -static const struct platform_device_id max197_device_ids[] = {
> -	{ .name = "max197", .driver_data = max197 },
> -	{ .name = "max199", .driver_data = max199 },
> -	{ }
> -};
> -MODULE_DEVICE_TABLE(platform, max197_device_ids);
> -
> -static struct platform_driver max197_driver = {
> -	.driver = {
> -		.name = "max197",
> -	},
> -	.probe = max197_probe,
> -	.remove = max197_remove,
> -	.id_table = max197_device_ids,
> -};
> -module_platform_driver(max197_driver);
> -
> -MODULE_LICENSE("GPL");
> -MODULE_AUTHOR("Savoir-faire Linux Inc. <kernel@savoirfairelinux.com>");
> -MODULE_DESCRIPTION("Maxim MAX197 A/D Converter driver");
> diff --git a/include/linux/platform_data/max197.h b/include/linux/platform_data/max197.h
> deleted file mode 100644
> index 03ef46f9cd65..000000000000
> --- a/include/linux/platform_data/max197.h
> +++ /dev/null
> @@ -1,23 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0-only */
> -/*
> - * Maxim MAX197 A/D Converter Driver
> - *
> - * Copyright (c) 2012 Savoir-faire Linux Inc.
> - *          Vivien Didelot <vivien.didelot@savoirfairelinux.com>
> - *
> - * For further information, see the Documentation/hwmon/max197.rst file.
> - */
> -
> -#ifndef _PDATA_MAX197_H
> -#define _PDATA_MAX197_H
> -
> -/**
> - * struct max197_platform_data - MAX197 connectivity info
> - * @convert:	Function used to start a conversion with control byte ctrl.
> - *		It must return the raw data, or a negative error code.
> - */
> -struct max197_platform_data {
> -	int (*convert)(u8 ctrl);
> -};
> -
> -#endif /* _PDATA_MAX197_H */
> -- 
> 2.45.2
> 
