Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.139.77
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794391057;
	b=ZkT+6PHjXzTmlH/MTt/wTlBWRF1Vau5Ywt2b5ZtNTCPQWREBDJZKokDbuF55atx95zVF
	 ijvW1K1XE+HUo7pSC0SubFp7T80FG/EehfACKpcsUHrZTrmMv/6b/PhTvAJzWboSSxds2
	 22iHd1oEfLSU35YiyVBG1295liTUV33D+9qIQ1AMKSKIuqgiWNuSGhInvDdiiOdOhmMMt
	 JJyV7PYDEmpnyUIxA5mypssA6EvnHCmtCSOlz6NqL/EiCksp5KpcSwzD2lZda0ZSp8tLF
	 eD62oadGmKqRch5JQmn2XFOo0pSceDrME19il7VSTJlmCSxewAmJLJtFlZz1ohU2VYg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794391057;
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
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=n9qJxs5sfMGcPtOkV8Irqm3KCmcmqaof/Yfu8NJMQA4=;
	b=TmoSLfPDwAY6c3GPCgQmpgjEm/ENcETPw0W4visyli3McdQf2cfYRefCPp4Yo0mBpTfz
	 PDEAf2IPmlVjXGR5OFt27wYbgmpXZcIOGG1oHVqdEJUT+lpniwcP0QxJch76wtWDfi0GB
	 rlfnYhhKWqhq28bcXUQi1eE0PvXy4D/T3CtB42brpbWqOO0IqqbNoctOqWsWDxf3oXONB
	 hVXs2AW46m/lpzYoi3w2RIEdikjB+OWg4FqkujVYMjsJfXnwro92muA/A9UUGcD0Rz575
	 XJn2Zjdv7WKe8jsDNd8IOeiiCz9M2nkBCBjpSJrzqATLTpTT9x8EVfsyz9ezQg0YtPg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=analog.com;
	spf=pass smtp.mailfrom=analog.com;
	dkim=pass header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=cU92rh+L;
	dkim=pass header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b="d/NeGjXV";
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.139.77
Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA65606A321
	for <linux-hwmon@vger.kernel.org>; Wed, 11 Nov 2026 09:57:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4AA65606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=cU92rh+L;
	dkim=pass (2048-bit key, unprotected) header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=d/NeGjXV
Received: from pps.filterd (m0167091.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB912hk3546495;
	Wed, 11 Nov 2026 04:57:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vtelectron.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	DKIM; bh=n9qJxs5sfMGcPtOkV8Irqm3KCmcmqaof/Yfu8NJMQA4=; b=cU92rh+
	LWgnBGPJu09++Ei5GktTdH1dKtQwfZ5UjroqmxoWylWndvBb3/JFtPo/JSUBsI2i
	gdIqVj9Zcri0Go7nrTIy/dcKtxD4hLwHnrvCNBwIaZ5syhjKkEcMd4yNCT6Fcg/q
	GtGaCzBhUmgL+ypWfLoEBkNyx4fpirCsyZPI34qSUYKHmXM1dyzlESsBI1EZc3UM
	ncZ7F9BE6xrmAi0ZWywWmmlLs4/FiSaHUKQrwaD//L6EhIka8p9UStcDR5QDE8iW
	WMq+D16yi+uZwWO24rvWlKTWG68FvTVoPf3I1++MXzmCqbltIW8foQ+8shAf2C/J
	h7Gc75EiAB/cqdw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=n9qJx
	s5sfMGcPtOkV8Irqm3KCmcmqaof/Yfu8NJMQA4=; b=d/NeGjXV39vGm1hvwIH9J
	mnJShbYYiiToBTnTOXFptj5cfEMk4glIYiAT2YALRCHlPWMQGe7lLZzJdafnHAjt
	3ySBdaGjCHNUjqdffjc/miVMpVOxahVNB0/nOomgUtwnDfj85nYfsJbTQHhlE/OL
	ju7uwr8zx3/Zgb8dEeN/d8PG1ohPkP28RI4auOPH+Om7LumBaGSI6TIsv8jn3P9q
	372W8b9bcjrvZPO5AYXn+tytmcQMBcz9zDSDG5pjxlhl/n4EjYn5OC2qc6j7ea05
	H+obq2WKMmYCk8cA+N/ylJZzPM0iysAF0bhCg+GMpurhBmYUAbzq8fcJ1k5Aq07n
	A==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010007.outbound.protection.outlook.com [52.101.61.7])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4hvhw398fm-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 11 Nov 2026 04:57:22 -0500 (EST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UeetLvAcx8yXo6u0iHDi7NnL+ACDkViVlPbVoHjdHINkUA5pHZpCH+bho/bpkBTh+pdDZ94Jg3cyNj/iJ2aQejqqRDo4Fd1qZokEYadHtFt8SLTYQSKqT7ubpUnk0VXxZugiYyNwCzH5fo2blqbBJhCwWAWF4ZDULUL/fgT5gJSpv638YV/sJa/QuNKS9RZNXh6W5Rn0K0Unjr0WnEw1mi8QgcQXNSAHe4U6yIkSwVQp5VAWgVQTWA+cdzUE4lukNiTv3boJbXy5m5ueNmA/+R+sm/mKEighSynv7U9Md3fe8n4/Bsl9x7h9CkaKr2wvneEVQyuxdp07Cl7jc2OAFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n9qJxs5sfMGcPtOkV8Irqm3KCmcmqaof/Yfu8NJMQA4=;
 b=NBQ3tYpDB5vZaCVwnWz0/LZpQC/Sij1nVEIfML5kYkTEQGNUp1nYtcoAEOrEdAZdu5BlnQWCa7e1xiv0vUjegTF1co1R4YTpXU3/IlANRDYvdQpyIq+DHaF3oIwhxMcZ//hWnYjfEvAvSuTCq7GM8fkqzwGo20TGOTftyby3ObDioduj3tefk+NP+0XpJxLsw16QB7SHyJz60iOb1jfAGRbrzpXN0jeR5BJzf/R8kJLZFPGlWaT8ge+aBJ35ozL1ZXH9XzPJGkxB0dMVlwvXnyr/TMgiJGnXKWhriGo1z921a9oqqtUfCJTXRS/rXhiFeALhZQcuyhiDkaOCTwpEtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analog.com;
Received: from SJ0PR03MB5469.namprd03.prod.outlook.com (2603:10b6:a03:28a::17)
 by SJ0PR03MB5951.namprd03.prod.outlook.com (2603:10b6:a03:2de::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 09:54:36 +0000
Received: from SJ0PR03MB5469.namprd03.prod.outlook.com
 ([fe80::2a19:76b2:e731:8c5a]) by SJ0PR03MB5469.namprd03.prod.outlook.com
 ([fe80::2a19:76b2:e731:8c5a%6]) with mapi id 15.21.0592.012; Wed, 11 Nov 2026
 09:54:36 +0000
Date: Wed, 11 Nov 2026 09:56:03 +0000
From: Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 10/10] hwmon: (ds620) Drop platform data support
Message-ID: <avQ7j_KPONllgLcK@nsa>
References: <20261110183434.181711-1-linux@roeck-us.net>
 <20261110183434.181711-11-linux@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261110183434.181711-11-linux@roeck-us.net>
X-ClientProxiedBy: MR1P264CA0131.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:51::16) To SJ0PR03MB5469.namprd03.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5469:EE_|SJ0PR03MB5951:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fb7de8c-097e-48a7-3961-08df3fd9cb9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|10067099003|11063799006|4143699003|56012099006|261022075727099003|261021123027099003|261021121427099003|261026121527099003|261102123227099003|261009223027099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	kNgmRHxhHyfQx5JfntB9RMsryBI3qV8OtaoBIikjWGty4gmXBZgu0br8Nfrx+gA+Agdon0e0X5301l5StY7qbpv1c74IKbvHE7fbcB9LOkVoACRmx0/3hjLaLLeJeQTdVciyWhw15ach4kem89a7gO5d/szy+tdzibti3ivTuyFFQS1NU77RBNKwIWcq8Q7CaZc6dqgIqx8rNQ9WzDGivOLELr+m+NTgS78xYzeItOIuFWDNqmUkmvf/7dNjRZ2OQ/kMMdhVoS8A5uWw1U15WbPPXAYBpDHPioxHKpXSFbtFDD3xT4c/K5VFyPZkyN7eLwTLAyCL+9OJ39EqtrtAugzNxaSYEE+lFgHeuezfSGnenFLj8fa7+qDpCh+sKy80wVEclHpxIZnZsEYqLB8+Y9GvILGujjax5YHVeZlMXeFqjddkVnBWvhGnXZqp3zH56GtGsMc9syDsRceH7IZd+e4LGL1P0IsfRyAfLc+BYF+6K0dPJiTeC3fVmdKoawdi8FDIceLOB3Lj1MvkFOh2reH6Q45KBu9iboWBlgBiwvfOAblIXwS3xZhCWfW0O01x0LEkWVzt995EjmFounSUkHwjWM3vS5G94gvZ5b9kNeBMuDVeajALcn8N+98uIg/pHVd2GvT96TcnzWKFmaslqcNpq3b5I1QO+4F3BD9zqdU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5469.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(10067099003)(11063799006)(4143699003)(56012099006)(261022075727099003)(261021123027099003)(261021121427099003)(261026121527099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MncxSS9ZNGViREpYMUdiNVI2cUxUYml1QitQNUo5WUxGRzN3K3N2eWI1ODlV?=
 =?utf-8?B?TVN6QlRUM1ppSDF1WEtpSXpMajBiQTRFcHBuNXMzbWVydERmWlV3d2RTMkg0?=
 =?utf-8?B?cnJGT1o0MlRqcWpqNDVnSTI3WXhQTmt5N1lxczFaZ0FwVytmSEZRN0lrSElz?=
 =?utf-8?B?RGpUdjVDaUNTVDhmbWxRWXpKUGtyUjVRZmtPTUpsUjZHU1ZLSk95OU9HZXl2?=
 =?utf-8?B?TTlYa3l2akxCWkUzSkpzTWpMZEt6cWxzVEU2SlRod29tWlRYK2s4L2tBMzRT?=
 =?utf-8?B?NWdKajNXVm1IMktJNldGMktsdlN2cXF6Z1kzdEtSWW1mTDFtTjZodGdhdEZz?=
 =?utf-8?B?L0h3TXAxUWtpdzFNdzFjcnp4UUg0dEcxWkxjaWJPR01QUDRDckVKK1duZy81?=
 =?utf-8?B?cHVBVjg5L0p3VzBoL055Nm02SW5FbXh5ZGN5V2JPWE1USjZsek9zWkdsalQy?=
 =?utf-8?B?NVNtVXNpZjhkS0ZDUTc4bE5wUjQ3cnUxZFJxRFJINFZDRW10MlN0N0p4KzJk?=
 =?utf-8?B?Q3B0aHg2aUVSQW90S3hmYzJEdUpxbXp0dUc4V0JpWThDb1ppOVhjU1Azc3ZF?=
 =?utf-8?B?VmlFWmlBVjc4T1MzSUNlNFk1K3pJN0pyaGlDb0Q5RFRyejJuOWlWS2RjZ1pq?=
 =?utf-8?B?MUFITktqZ245a3F2dlBrdGNSb2dzdS9UWW1JazRRQmxyUWcraXZ5QUk0RnR4?=
 =?utf-8?B?NXU3OUtLdXZveW1PQlNENTk3SE96NU94U3FqRWt2Ti90ODJJTGtvbzlFcmJv?=
 =?utf-8?B?RmNKZnJGQS8rOVNaQzczYmh3bGFFa3FLQ1daMEtJR1ZoWit3eUpEa0dUMVFJ?=
 =?utf-8?B?cm5lelN5WEFadkxDV2RIcXJmK1RqWjNUZG16TkUxRFNSaEswU2dEWXhiYTZk?=
 =?utf-8?B?aytlVkovY0JkRkVXbk92cGRkbjduVlFVYXhoN1k1cDY5T3lwUzFLOC9BZDlP?=
 =?utf-8?B?L05qSTQ2VWIzcnJPNHR2VTB4RWdEdFg2eDFLdVoxQ1lBM25wOHJLeDJ6eW9V?=
 =?utf-8?B?QXFBcnVqWFFJczJvQTVqYW1GWFFHNUEyYiszdEdIRjd1VjMycTZiRWxubDdt?=
 =?utf-8?B?RzhFY0p0K2tnT0ZqZm14T04vTkJqS2x4eFBoM01mMTI4cU9JVXJhTWNPenk4?=
 =?utf-8?B?WVB5SjJvU0ZTR1liV1dUQmw5aVJISUIyajRoMzNHL3hIUjRzOFNzQlh3OWVh?=
 =?utf-8?B?Tzh3R0REaTZONHNaUTV5NWtWSTIyODRJK1k5UEpMWEtYZmxNRE1GWGRTeWF1?=
 =?utf-8?B?ZjBjWlRjM3dKeDU4LzVnVjB6cjAyMkM1S1FjQTFxNWdVS1lPM3V2L2ZTdklT?=
 =?utf-8?B?cEVvWHBHdFQ5cHR4emZadlZQYjFnaHQ4b2VJeWI2ZWkrczFQejlCRHN1VEdG?=
 =?utf-8?B?M0VZSkxLYnl0eWtDalFmMjg3OHZ5cDA5eEZmZTIyTlpVVmMvbTk4M1JGNHox?=
 =?utf-8?B?bUs5MmEzdWdBc0pPVXVKb2hnSW5KYVdOQW1kM2dDZjBuWktnQ2lFcVgxei9J?=
 =?utf-8?B?TE5vM3FOdVRiVWdUcDh0WGl2SmZEUC9JSW1VSy9wczBjb1VLdTZWY2g0ODk4?=
 =?utf-8?B?eDVkdlJoYnh2YndycStIQWVyNnZJMXNzOVJjWlgwREdGaStjWFduOE1TV0ww?=
 =?utf-8?B?ZHRCcWFoUXBlZ0Nqd2xvcm5Nb04zbEZ0V1lEbVpNaGNOd0Iycy82OGsyVFhE?=
 =?utf-8?B?S3VjZGVMWk9vbkdsVUpNK1hvcEh1TlhRNVNacUo5eGVkd3B2YXZOY1M2UXA2?=
 =?utf-8?B?akp3N3hJVHU2MytUWDYvb3FuUGl2dG5VVEJxRGw2emRCSFdhbEY0dDJNbHUw?=
 =?utf-8?B?MEF0WnFkYmVaTnpWekZBbU5jUEdSOERQaEc5dEFaZVBBSXBPUnR6bkxSaWhM?=
 =?utf-8?B?dWs0Vm53d0JEQnRYd05IQ01LSytyWjIySGNOMnQ4d0JIYjFFTzFnME91ZFhC?=
 =?utf-8?B?U1FnR2xpMTRjNE5GN1ZwRDM5MTNsWjFrSmpHeDhzbjdra0FLN3owUkFtb3dH?=
 =?utf-8?B?QVR5NUt5SndTcDBqNHhuV01rMC80QXR1cllKSDhRc0Q3QlVqbkNuYWxISGRr?=
 =?utf-8?B?NTNSbnRtaE9xY3FiQlF1bmtqQ0NXQ0ptRnd3c00xbE5aZlluTEErYzliSStv?=
 =?utf-8?B?OU1CVlkvUFBEZEw4K3lab1JNalhmNzNUOFg5THJ5czl0anpvZUF6bW5GV3c1?=
 =?utf-8?B?ekFCdkc4VUxuNTZFM3duQmp6MFJ5YUpUYkcrSHFiMWRwK3hQdy9xK21uVHh1?=
 =?utf-8?B?V2VBVDdYZnBuaGJySWt2SmlIMnZhdTJadnQ5Rk43cWxsNjJGUHUzajhGdkxG?=
 =?utf-8?B?YmY1dUd5YXJUam52SGJZMW9heFlsU2crbWhvdlpxSzNUdlpmN3BTUT09?=
X-Exchange-RoutingPolicyChecked:
	PvMtewjQtVWJ/CiMRC7g9f23jEmoLMRhZESZBC0q24iQWhC48aNrPPmdvlxhikWWR1jyu34l+HWVSdo0VLRVKB5zy0+aD/8+g/eWwDoacBJ9tSZUobQLs3NoSIX6kEhsV/PgAqyEr0uFr/E6YDTg4FYTUiouBbz8UJngZ7jodRv80pZqXt0fnTyxGWGUS/3Bc6Uba9jGu7MNKa7f4wQRQ/oqp9wBVGV2FwNtsJAiR7prrucFyRZn1LVBpiU2W2EQXctk3P+rwlc7gDDDbOcU+QIIiUg7a2b78tLECZcl7K4diSzsQmvYrwihsZkW1n1mKqA7FUaX29uT5KfqwR3Jww==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fb7de8c-097e-48a7-3961-08df3fd9cb9b
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5469.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 09:54:36.7482
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dsvM3a7IwcL9d52HlLEuviffkxDAHN6iUYIILMDPUAgCCnqPVNyD6pW2wDp1bwZ+5ad0D0UplZ8mOInPs83saw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5951
X-Authority-Analysis: v=2.4 cv=VJhIDNPX c=1 sm=1 tr=0 ts=6af43c02 cx=c_pps
 a=jRvQvoFr2LhS1HEjeZSEyQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=ugNRTJOwpmtT476g4l8T:22
 a=gAnH3GRIAAAA:8 a=_jlGtV7tAAAA:8 a=IqvJWBZhPkysaHNNBJoA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=nlm17XC03S6CtCLSeiRr:22
X-Proofpoint-GUID: i3t9wm5ZqdQqwD22m7LcXQ0tdlVDwBLF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAzOSBTYWx0ZWRfX8A4MnNqQBO1O
 1km0rQIfgb6cVa4pRC07D7D0gEONAS8Vavwgd6CB2zDPhVyiKViCvIFDdnR5wWmC1r72I42VqDx
 jFcSt6Q8NA0e0xMc9SkBbwGGrA+vWa79WfIUUOAZjzRacHQiAhWP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAzOSBTYWx0ZWRfX0IpKsfipqmfQ
 1izPDa/qwNaBplKikTnZQ2+RKMeumuijBzpSWRIe13q890VdHpLr0x6v5O6j5CWFQ4g7BuqZ9Wn
 8D2QqH/z54X7flEnq6xTtLTYPY2Q+tOW3JMTiISDAishnv9ZXDQZem7/kgwJRRy2AnOXPNZ8SnN
 DPobRikjfnY80h9rtelLyQ66N+sHnRI2aDSEzAIBefJYRB8z513gJWtGCkOi4ZkLVRZ5QEOAdms
 cTWvyrrFeNgbu+DV6XY1wvw4G/OsWp89Qhn3hEJQEwdSp4FFXSTWIGxUlcqmolUBwKXrMQr8jA2
 r1z+w9CkqlshVFto9zR/6pxamxG7mV6RDQGQ+n4Rzgz4Be1Q1Ppre5xiMvefZRgbGC/e3SoVbxZ
 9XPSOv4MHQVfY+R65W7j8aDVTU9GJqInbHIhMI0ipNqRLPPXnZXxr7JLAR3LoYYyZiIFxOd1vgV
 oJlmeIL5MaKS8FkMBUg==
X-Proofpoint-ORIG-GUID: i3t9wm5ZqdQqwD22m7LcXQ0tdlVDwBLF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 impostorscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611110039

On Tue, Nov 10, 2026 at 10:34:33AM -0800, Guenter Roeck wrote:
> There are no in-tree users of ds620_platform_data. Without platform
> data, the driver clears PO2 to keep the thermostat output pin low,
> which is the default valid configuration.
> 
> Drop platform data support from the driver, remove the unused
> platform_data header file, and update the driver documentation.
> 
> Cc: Nuno Sá <nuno.sa@analog.com>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---

For whatever patch you end up applying...

Reviewed-by: Nuno Sá <nuno.sa@analog.com>

>  Documentation/hwmon/ds620.rst       | 12 +-----------
>  drivers/hwmon/ds620.c               | 13 ++-----------
>  include/linux/platform_data/ds620.h | 22 ----------------------
>  3 files changed, 3 insertions(+), 44 deletions(-)
>  delete mode 100644 include/linux/platform_data/ds620.h
> 
> diff --git a/Documentation/hwmon/ds620.rst b/Documentation/hwmon/ds620.rst
> index e2d915a988a2..6a18ecea5c4f 100644
> --- a/Documentation/hwmon/ds620.rst
> +++ b/Documentation/hwmon/ds620.rst
> @@ -25,14 +25,4 @@ into non-volatile on-chip registers). Temperature range is -55 degree Celsius
>  to +125. Between 0 and 70 degree Celsius, accuracy is 0.5 Kelvin. The value
>  returned via sysfs displays post decimal positions.
>  
> -The thermostat function works as follows: When configured via platform_data
> -(struct ds620_platform_data) .pomode == 0 (default), the thermostat output pin
> -PO is always low. If .pomode == 1, the thermostat is in PO_LOW mode. I.e., the
> -output pin PO becomes active when the temperature falls below temp1_min and
> -stays active until the temperature goes above temp1_max.
> -
> -Likewise, with .pomode == 2, the thermostat is in PO_HIGH mode. I.e., the PO
> -output pin becomes active when the temperature goes above temp1_max and stays
> -active until the temperature falls below temp1_min.
> -
> -The PO output pin of the DS620 operates active-low.
> +The thermostat output pin PO is configured to be always low.
> diff --git a/drivers/hwmon/ds620.c b/drivers/hwmon/ds620.c
> index efb005bedabb..17ae9cc72761 100644
> --- a/drivers/hwmon/ds620.c
> +++ b/drivers/hwmon/ds620.c
> @@ -17,7 +17,6 @@
>  #include <linux/err.h>
>  #include <linux/mutex.h>
>  #include <linux/sysfs.h>
> -#include <linux/platform_data/ds620.h>
>  
>  /*
>   * Many DS620 constants specified below
> @@ -64,7 +63,6 @@ struct ds620_data {
>  
>  static void ds620_init_client(struct i2c_client *client)
>  {
> -	struct ds620_platform_data *ds620_info = dev_get_platdata(&client->dev);
>  	u16 conf, new_conf;
>  
>  	new_conf = conf =
> @@ -72,15 +70,8 @@ static void ds620_init_client(struct i2c_client *client)
>  
>  	/* switch to continuous conversion mode */
>  	new_conf &= ~DS620_REG_CONFIG_1SHOT;
> -	/* already high at power-on, but don't trust the BIOS! */
> -	new_conf |= DS620_REG_CONFIG_PO2;
> -	/* thermostat mode according to platform data */
> -	if (ds620_info && ds620_info->pomode == 1)
> -		new_conf &= ~DS620_REG_CONFIG_PO1; /* PO_LOW */
> -	else if (ds620_info && ds620_info->pomode == 2)
> -		new_conf |= DS620_REG_CONFIG_PO1; /* PO_HIGH */
> -	else
> -		new_conf &= ~DS620_REG_CONFIG_PO2; /* always low */
> +	/* thermostat output pin always low */
> +	new_conf &= ~DS620_REG_CONFIG_PO2;
>  	/* with highest precision */
>  	new_conf |= DS620_REG_CONFIG_R1 | DS620_REG_CONFIG_R0;
>  
> diff --git a/include/linux/platform_data/ds620.h b/include/linux/platform_data/ds620.h
> deleted file mode 100644
> index f0ce22a78bb8..000000000000
> --- a/include/linux/platform_data/ds620.h
> +++ /dev/null
> @@ -1,22 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -#ifndef _LINUX_DS620_H
> -#define _LINUX_DS620_H
> -
> -#include <linux/types.h>
> -#include <linux/i2c.h>
> -
> -/* platform data for the DS620 temperature sensor and thermostat */
> -
> -struct ds620_platform_data {
> -	/*
> -	 *  Thermostat output pin PO mode:
> -	 *  0 = always low (default)
> -	 *  1 = PO_LOW
> -	 *  2 = PO_HIGH
> -	 *
> -	 * (see Documentation/hwmon/ds620.rst)
> -	 */
> -	int pomode;
> -};
> -
> -#endif /* _LINUX_DS620_H */
> -- 
> 2.45.2
> 
