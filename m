Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CEDC38399C
	for <linux-hwmon@vger.kernel.org>; Mon, 14 Sep 2026 12:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.135.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789388418; cv=fail; b=Wf+/GyMmv0l9lEhnHduFA7L5luM6QMC3WVwiUCKphyqVrlMJiCrcl4hrxowOk+Dxvb8wqqGqc29wbsstVsS5h/fboprBp7vTq++4d+Qyqjtnw0PBozKz15tQqOYWtZCIY7DODZrOcE27etL32d6pkdl5E6WQGd8Vc4PGpDLqaGk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789388418; c=relaxed/simple;
	bh=WVoYGq4mLNyOv/KvmhPB5IJEotMflGCExuokU1tzqYk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=apoa3tBxYOSaYPfEtbB1aC+HWYhBjXIGGqSc4AZoNDaMcM1jqp2D3UjPqwLsyYB4MOu/jgcIjrBKXbbPu+Tf6bhqagEoJC8zi6ePzqAjOd841OEEEdlf5u0AFs+XHpfedGGzDM+lBVAIFC8k1mVxWSKn7hZnJDqjPxpI7DXYbnE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=a4bU/8BL; arc=fail smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="a4bU/8BL"
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E9o0jt2313451;
	Mon, 14 Sep 2026 08:20:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=PFsYP
	qESg5bAsnHhQSCdlbiw1UEIvwxxdBq4ZWK0ASs=; b=a4bU/8BLr/dflFlh7J9PW
	IYhmUUMLLVBahKdzu69IzobpQ8OQdjwJw65zR/KLjZ4q+kJESTEkUjq9jYrrwqOi
	3xXIfbvpN7NBeYwvw+s27e8SKMt4duew9qASkof01azi59SEh8PNBr37BwjABu3n
	I1t0fqSyBV+5ktpTcCVbE29xqpDivJMbSPx5kMKGIlM5UeXSmMjW8ACw1AE+K+RA
	62mwJyrzUWdqHdIKM2v9NH7xbzBUwaPxbmH5rU3i9ASUtxezQ1rAKmlrcoY5ew5x
	eVAmvqDP2FjpDCPpVpl4vRUdoT9EdzZprsxkJbCymuq/kfIb0Rz6OW/nw0NOiDWt
	A==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010025.outbound.protection.outlook.com [52.101.61.25])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4gn0jy8nqr-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 14 Sep 2026 08:20:04 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uAkMSvyuUxYb4x0KiQUi4DFD48mfmZByMP4nj7J5HKver4I4d/Cye+hXJ0fJ/qjyliH7s64FEdoZ38QmKHKSYCiq7YSrBEVWakdObWhnsitJlSrM4meGDHvzHlcKWq7TPskY4UxFiHCZ2VSlyrrt/WQbMAhxhqUPiTneZOJ0xZ1k3WNJn4klowtXSAC4wI7HzuBZ7W41tJHkZfciaR8xJDmwSQpUn1YOm3Z/zWJ9pFI5GOa7+SZRYAgFBAZ/kdL0i5SN9eCbqjukEL5az/9tnh78ix8NYis7OViA609SZ4q7a/dwj7zWA7f/Kvet0xbaxxt48WQDXuJKoL4ZwlHv4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PFsYPqESg5bAsnHhQSCdlbiw1UEIvwxxdBq4ZWK0ASs=;
 b=zRL75N5RYyH9Kz2lJWgIrYLaPgCW7ZjKo6j4EhgqJoBXi2A+3X/zrqAadVrBUbARg24BN8Pdb0enmt1tROcg89c3hxy6WtntewJL+XhQwGioyc6/yXKRmbjxlL09DKkhJsoHKw459R2I9HeXbfZHDD84S07klhj2W2Shwq/anRbG02yvOdGI5fGXyUED7ixLJz1dhp+88mK+oLIP636YxDb6dU7A99tOuBUdv6bTXGBBSk61bnoFeikpVIXJIYcpak9WIzdIe9NMvhZ0mXjOskdXfwirU7waehks8N2GidwoEbnymePYWQpZseQEzhFjvVH9XA3HMyzBJQrclZdD7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from SJ0PR03MB5469.namprd03.prod.outlook.com (2603:10b6:a03:28a::17)
 by SJ0PR03MB7077.namprd03.prod.outlook.com (2603:10b6:a03:4d6::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.10; Mon, 14 Sep
 2026 12:20:01 +0000
Received: from SJ0PR03MB5469.namprd03.prod.outlook.com
 ([fe80::2a19:76b2:e731:8c5a]) by SJ0PR03MB5469.namprd03.prod.outlook.com
 ([fe80::2a19:76b2:e731:8c5a%6]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 12:20:01 +0000
Date: Mon, 14 Sep 2026 13:21:16 +0100
From: Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH] hwmon: (pmbus) Validate number of phases per page
Message-ID: <aqfmipEHnoQ24vIZ@nsa>
References: <20260912145038.2411447-1-linux@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260912145038.2411447-1-linux@roeck-us.net>
X-ClientProxiedBy: MA2P292CA0024.ESPP292.PROD.OUTLOOK.COM (2603:10a6:250::6)
 To SJ0PR03MB5469.namprd03.prod.outlook.com (2603:10b6:a03:28a::17)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5469:EE_|SJ0PR03MB7077:EE_
X-MS-Office365-Filtering-Correlation-Id: eaa51ea6-54b9-4c96-2f67-08df125a7fea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|11063799006|56012099006|6133799003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	5HxbR+idz+T7Isp3CzzRXpsSsCGfWWWK0PZNo0vORI0VJw4fIV9dZof9H9Gx1trcHRFw2BswH0dtfoERkG+eSqIMe5S8gbij+oOixNUV+wDfKZaMN4W4F1DSCEDH6ArwM1ibZDMyVmf24MAoPNgrrG8AmpaEDaYQEB2wXFHA1NuT4XXmJACxFV08hFm85Pr33zz51mePqc8VndsD3+/71lYHksM09KxLsi0q6a6ZtN+GHMaCeyilFfagRYafdwuToiOYmMfgRa4iYm7WcTCrg1+WVBAjagg3lR3MDA2tQePqRNIu+WQpvwRJkUAEkzZTj5BnlZRz7RkQWTQMlDqnpbH6qbcwqZTZ3cN6paR9X1Hh/d/J+FqPaMag024NhP1lf8Mo4hwvVJanlihkQ6fM77eZGwbRfRvdzh3dzDdUiJ88D7TsEcfbHEn7BqLmOw02Gsl+YNUmRUs8kArvY1mY5XnXSwlJXWukqAOi0TnEVKZdh37/AYCNRDKskxCjMztMUtviFEGPNCBoQ27+1YY/X/cDzcIq2ly2WsnzKpB6P9J16P+lbzzcrkb4oHVS3ksb2oeMd7ZMK//d34z2y6L/okfn+IPHW0mr5Dh1lPl2y07SX/cBbIz+MXisjdywFdi0yBuiCaSaMEUwWgE1xG7/+A30GvThiSi2CYLXLzVdBXQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5469.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(11063799006)(56012099006)(6133799003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S3pDWFdYSnBrc3cxMjNCSmZSQVZVK3pEMzhzMVFnK2o1ZnBDdTJsT3o0TVB1?=
 =?utf-8?B?amtTd2lFYW9aaURlUlFiVEhYYzZaTWg3QnZLSklRaFovdWdKL1RuRUJ5MGFP?=
 =?utf-8?B?T0RQZ3k3MU13dUU0cE1YdE5FcVNTMjVTVlBpNzY2ZmlNYWZ3SWlVWHQxRHND?=
 =?utf-8?B?TGR3YTllVVEwNWhKSnNGdU1mU1JqR1V4c1JZUVBxbDBzYXo3SXNKd0kxb29n?=
 =?utf-8?B?SElaN3pLTkVKdFR2Sysvcmxrd3ZWS281M3JHSmx2dEtRZWpTSXJoRTJuUzJS?=
 =?utf-8?B?UzZZQTdEMHY2TGx3dkwwRlpHQ0FXUEVRSFEvR1g0UmZNQjJLeGtrY0Fnak5m?=
 =?utf-8?B?eHhpemY3VnlNNFFHSHFiaXFEWm1XQkxHUE9TWEF1Qm5kcysybkpsdzFUWmpL?=
 =?utf-8?B?UDNkMHorT1N5c2tuTEs3VWZZaXllcWpKOXY5dlR0Slk4alBNTDhJemhqMjFI?=
 =?utf-8?B?ZG9MNUNUbHlReW1PYmdhWmR4cUFXajRydmhFZTg1U2hjTlVLNWNIR3NWeU00?=
 =?utf-8?B?NFk2OGtBb0kwRjBjYnRwTzAvRnRBVFk1U0doT0l6aHpHN1hHT2l2TytHQWY0?=
 =?utf-8?B?cm1ZbWJJR1dOYzcyMzZSbW41SGwzU05adnJwVzJ2ckVkMVZyaVR0MVBxWklJ?=
 =?utf-8?B?VWE0UWJ4S0k0QVFQWjZoeCsrYVltaUZVSmFPdE02UlFtdDFPNUduZlFQM2xE?=
 =?utf-8?B?b1U0WlhaODljTVQ5N3djakJER0daUHlvS3dxRURzZ2h0aU1uSmJHUDMvSWs5?=
 =?utf-8?B?aWw2K05QMnd0V0xES2ZjUmpIZjgvU2ZEcHgxVFM5Zy90K0NpamJ2U3lCT2Vv?=
 =?utf-8?B?OXc0QnZGZVpRTWo5dk9lMDhmQjc5YXFaekVIbUVBSUxUZWVuUkVGRHlaRVdI?=
 =?utf-8?B?d2hoM2hwaFFJSjF0SG5SV1ZQZjE5UERCOVYrbmI5aEVPZFZhajJ2UkFqVnNy?=
 =?utf-8?B?T1hFQzRqMmZYTUswNHRPSzhBQTdQRXNqMm9aWVVuZHphM0dlNjViV3VFNExE?=
 =?utf-8?B?VlhJK0hYbHNqdXJ4by8xYlcyRDByRE4yZ0JzeXplcWE4ckcrZ2w0VlMyd281?=
 =?utf-8?B?WU1mSVRDeEx1N0I2YzQwRC9vRHR6SGpMK00wTUpHSTBWN1U4NFNjRVUrK05V?=
 =?utf-8?B?d3A4OTJsWGovRzdxbkdudStTNkxmbEJGRVZuNEZwYzU3My9CbS9PUEJkWEN2?=
 =?utf-8?B?OW52Y1FYZ3cwWmsxRkxycFBIMXFydTBONGJVakZ1Q1hKR2JQSEZNdFR2NUNp?=
 =?utf-8?B?dE8xMVhObnVXZlYyRUVxZnhrd2NmTUpEcldJVDRrUFZTd1V0NkJFZEMzZC9x?=
 =?utf-8?B?c05pOWZ1NWNiaEE5dDNrUmZLL3NFNndWeEZ5bHN4ZnF6Z2h0S0xnbk1mMDlq?=
 =?utf-8?B?SHBBZit5dU5PREVWZk1saWNYTFJBdXBDL09tazBhZ1pkc3FrVjQrSkR4NUd6?=
 =?utf-8?B?NDlRTVRLZG9GZXoyL1YzOFhUU3JHczJGbzhwV1RVU0REYTQreENOSmtqTnlF?=
 =?utf-8?B?TnJ0NjZtS2RNUS8wRVhLTDVkbU9DbWRJemwxS21DRjJjSldHd0JCcllxR2du?=
 =?utf-8?B?ZStzZXdEcjhaVjQzbHNzSk9xdkZFUjRZTXJiV1J5V3ZqWXpJR3Fibm16WmZ1?=
 =?utf-8?B?a2c2U2szNEdMVE50SGxXZkoxTmtJNmREU2ovMTBrNmxxWUQwV29TQVFxSW16?=
 =?utf-8?B?c3ZtckNwOWU4MlZJaGRqNm1MdHR4QmdOZjJCUlNEbm0xY1l5NEFtaHZaaGw2?=
 =?utf-8?B?T2V5dS9aaTlMdEV3YzJFaUxPbVhCVVUvM0lvcXg2UlEzWktZY2NZcWRrenJQ?=
 =?utf-8?B?QXNwcjNVVmpwYkFHL2x6Z2hMQXR4aThRaFArZUswaFA1NWVlMml1SGRzMkNh?=
 =?utf-8?B?WFo3K2FHOENVQ3ZzVlFZWmpXSnFYZVR0UDdmZUpjbXZWREhBajhndUhsMU83?=
 =?utf-8?B?dFBtMUg0RU96SmxuTnAxTzhoN3V0WW15VkN3aDBVeXdTNmw5RGQ3SmdxK3lT?=
 =?utf-8?B?TWRwcVRxWDVaaFVMcWNQejc0ZWJycGRURUNwaUhKR21rQm1yZkgwQTVWOVVj?=
 =?utf-8?B?Y05NZzRXbTVoTi9VYi9LZWF4NFBuVnQ3STRJSDhKLzdYZmlVY2lUNDJBV01m?=
 =?utf-8?B?SlBNT3lCVVExM1QwZ1pPOHdNTEtHaEZsT0s3eGoyNXhHWVU0V3VmcXdjK2VM?=
 =?utf-8?B?TVZlMUs0L1VFY3ZtOVBuc1Y3MUxBR2pCZkdvYVJGNDlULzNVMmdnL1hRaWFN?=
 =?utf-8?B?RGVtdGxSenBCQUZ0YklxVUZZak9NSnB0VHdXNjlwaHlLQS9GVFRZb1Bka1ZR?=
 =?utf-8?B?L2xOTWVOa2ppMkcxZDJoYUl6emw5UlZsQnpVc0k2eXhTN20vYW51QT09?=
X-Exchange-RoutingPolicyChecked:
	UiHaUsoD4jMgmxlRdHHzuXfxrPlzy8dao46ZUlevGxWx4Ye6jzA6yLApZegpF2eEM9o4jedYiG6r7jEgTgs9dlDb+XRXgGigYsMRj2CcXUCcRXQQzzAnTBbGHQ9nJFKzkZrFKlHjjXEfQYu8cSJmLa6++drobNdNK/f3ooMOX7JXM5w9FyXCCk7nPMDUjacTEJULuqz/7+HCtYheeCNWCk3mqShxqkn9g+I7N69ZGViGeryrfofXOFJ6K09GETTWWAxQOKf1m183lE4oCMcuUxfoobkz+kIuJ9OM5R6WDhoOElKxcXkULxp/4W6G87ENV99nmnhFAcZZVW3RoFazGg==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eaa51ea6-54b9-4c96-2f67-08df125a7fea
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5469.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 12:20:01.6911
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6kFxGjeUU9yfDzgLKdUCtDfRf9rVUEcNiSc8qGU0BwDUTMwpei0crLnakKvJ4Mb7zzq60fceBW1+DQMuGiQrGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB7077
X-Proofpoint-GUID: eO_TCCkFoADDgxIGv54-mceBWfAZiq4J
X-Proofpoint-ORIG-GUID: eO_TCCkFoADDgxIGv54-mceBWfAZiq4J
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE3NSBTYWx0ZWRfX5/m3M2QQfWKL
 XmiJ+coGfpZ/srWd8yS9FFO9Bzq7fxQP3VUlzoQ40hRbKsUIXigV9N8MKTOKKaSx/W0dyiL6Hfd
 yad+28rGX7FmT+Ja0atMGfnTkMIExTOpADmmNdE8tc6QzuEgSI7O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE3NSBTYWx0ZWRfXwvvdoGjCn/WR
 t/JyyNWvgQTzm+eVA4PwQnI/uc4zImKMfOi1PpLVdgNFAQGG3Lnb9NFju1/JRiEuAazUkUUf4ps
 2OcmFu604YEH32b5BH0d6SGOS0CUExq14KVMysHrYLhVkfHOMKdtWy3MrCjpcTRJpgrrajWhCjk
 Zl+6wNlm1b9OyXyCKGCJsvNxjV6ia/BUZjYPMbcePUnPQShh27+qEV4w0wfhLYlWYTBqNGoowsg
 BkqvFkaVsmt0QMabzUJpIj3MUuI/qzDAeJo18Xp7ktLDJ0VHDa8Sua4f15rYgWn0WbOR29Vf1P+
 ntv4Yg3q8LaiB8iPkvofCaUJHQXp0AY+bgsRdQEI7c3g5Z/SYSU+fXKi9nnAVtlLy7T0c8l4ta3
 FMuPQO1cxoDXnT1RsWCOwcSjj3uGwtg3K/RcXNU93RrwP/g7b70djQCT7fdlXm5sR+wp6ryGiCI
 eUACHa99o1nuC0KAPXA==
X-Authority-Analysis: v=2.4 cv=WI/qzXsR c=1 sm=1 tr=0 ts=6aa7e674 cx=c_pps
 a=vcXwJhCbSog8BousImPcCw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=uXIjobp8t2wMuQ0fPvqm:22
 a=gAnH3GRIAAAA:8 a=_jlGtV7tAAAA:8 a=XNRLDImiDAQeTul64bUA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=nlm17XC03S6CtCLSeiRr:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140175

On Sat, Sep 12, 2026 at 07:50:38AM -0700, Guenter Roeck wrote:
> It is possible for a PMBus driver to configure a phase count larger than
> the PMBUS_PHASES limit and cause an out-of-bounds read.
> 
> Add a bounds check for info->phases against PMBUS_PHASES in the core API
> to prevent the potential out-of-bounds read.
> 
> Cc: Nuno Sá <nuno.sa@analog.com>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---

Looks like sashiko comment does not apply with the patch on the max20826
series. Hence:

Reviewed-by: Nuno Sá <nuno.sa@analog.com>

>  drivers/hwmon/pmbus/pmbus_core.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
> index 5104fd29307b..d69f1bde1795 100644
> --- a/drivers/hwmon/pmbus/pmbus_core.c
> +++ b/drivers/hwmon/pmbus/pmbus_core.c
> @@ -2982,6 +2982,11 @@ static int pmbus_init_common(struct i2c_client *client, struct pmbus_data *data,
>  	}
>  
>  	for (page = 0; page < info->pages; page++) {
> +		if (info->phases[page] > PMBUS_PHASES) {
> +			dev_err(dev, "Bad number of PMBus phases for page %d: %d\n",
> +				page, info->phases[page]);
> +			return -ENODEV;
> +		}
>  		ret = pmbus_identify_common(client, data, page);
>  		if (ret < 0) {
>  			dev_err(dev, "Failed to identify chip capabilities\n");
> -- 
> 2.45.2
> 
