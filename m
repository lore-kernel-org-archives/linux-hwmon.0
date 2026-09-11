Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4769846EC88;
	Fri, 11 Sep 2026 13:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.139.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789134776; cv=fail; b=nCwwtprAMfqmoQl14kzlvFZa/3YHkJ7x+BoHmg0EnooDGBCsgCpieQMCiFMQ1sKU7S3c8365xjgCX9BUpwpH8CAQ4p1WVJt6ZnHIb/wflyoH9jyWmFSMb1BFuGGgeGTA1cF3stZ921lJP6TyqaLTthXWdncaX6Dgel47CYliRqc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789134776; c=relaxed/simple;
	bh=0pIkK1B8cSBdeVY+Er/YtpEF025bU0Ql1UAcEWSeS2E=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=otvtSI1cwt6CkwiPoGmQ5B9qrupxIUQ8qNkf/XINBW1RdBcFSGFJfy2FSyO3lecDMPWVMxI9r6pOrGKdpxSK3BtY8EqpI8BekkeXeyFerb+/Q7Xi7tfA1yAcxTt3ip9q+KMvfg7rJauKGVH25YiVfRNZBat0KZIV2VYTlptcKFg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=BSHn8XNn; arc=fail smtp.client-ip=148.163.139.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="BSHn8XNn"
Received: from pps.filterd (m0167090.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BCjH3w459728;
	Fri, 11 Sep 2026 09:52:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=DKIM; bh=Dg8zArKJqJ9QXmildC2Off/g8eu
	MJ97cdt0Dcv9jFvY=; b=BSHn8XNn4Nc0ZnSwYN/lm3xQvbEZLKh9OFoklic3qGz
	Yh9ahonzGNlFuzhy4gfj4GsT+tPvsxB2VR8YiD3zQh3y9RedxlAx1xSofMqVtM+5
	KyWHU/TSEnGnlUJREKHJ+LinsB9jcQvmbqf1cWgNjiUvWGbihrnrjgPIULMR1x5m
	kbYUgceaQOz9dCrkon4uda2+H0vZSx0LBA2DOB24Xkljgnd4zz6IDdBqJKsYbAMU
	BZqi5eub9YuqNd23zoUd8b5Lenvz24q/X0TaD40gykRSSLhSa/YCp+b+ISm9j+dr
	1I8TGLWTwJuv2NVFQG8fWnIokI/deOu8NdXOfFJLibA==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010012.outbound.protection.outlook.com [52.101.85.12])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4gkcx8qtkr-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 11 Sep 2026 09:52:27 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DOou/TlEGTm7KcL7aJU4+JBKrC6cBCJvHv6WwyvJqNOsvNnDi8KEWMvaxzFlnBZdhKOHclNC9lls+QivmnAQSJ9sn6r9cduZYzGJUjODJz+ugrg2IvcyyBydtTHAnjREDtW1hd/N+aKA0vCv73QCd/EuUSMjpJbdqXwjQeNm6URs4XEU39GgrLxd6YzjKmiwmSv0HkDdL+1ka9E2cdVAWxfHQK5NFiUWf27qUMxDEWOZ3ph2Rz7KoWUrT97KeCrL95+6yRkjNwp26+xxLoxS2qWlboYHafhA2gfx7keoNiY6OzHQUDmazItx7W4V/YAP1SAtVwo81B2XW3PfOAI1+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dg8zArKJqJ9QXmildC2Off/g8euMJ97cdt0Dcv9jFvY=;
 b=gC8cJaKAvWCXs+fekZvI3ceO9CpWxfDPzrGpE+Wp4zAsSZVNsl2zLPQBPL0yjoqEsBbn8Ip9huFYcvLIvsUetxpB5R+VLT6urjPe/SiU8jaI8Cfn1K2cGn0c8IUTNEe/07bFGcucRPq0rSfdXJXuZJwOS0Ip3O3s6YjnG0XLI+9e1abmdWvb30xIW0DdDpqPMwYRlXLSWecZtfwYnPyPODWSe5cpLPG/CblSzEGiko+f97cqixyiuICFHeDRfyzGTJtacS2VUKemguTHf1Ii0XqdHgaEZbWOdd8B7pF0/EfZJe2bMIYxpHEKqYE/Dq2uj29zzw8E0eeEL/QBkjRkWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from SJ0PR03MB5469.namprd03.prod.outlook.com (2603:10b6:a03:28a::17)
 by MWHPR03MB989357.namprd03.prod.outlook.com (2603:10b6:303:2a8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.10; Fri, 11 Sep
 2026 13:52:24 +0000
Received: from SJ0PR03MB5469.namprd03.prod.outlook.com
 ([fe80::2a19:76b2:e731:8c5a]) by SJ0PR03MB5469.namprd03.prod.outlook.com
 ([fe80::2a19:76b2:e731:8c5a%6]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 13:52:24 +0000
From: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>
Subject: [PATCH v2 0/4] hwmon: (pmbus) Add support for MAX20826 and similar
 devices
Date: Fri, 11 Sep 2026 14:53:36 +0100
Message-Id: <20260911-hwmon-max20826-support-v2-0-5e30cbd97d84@analog.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNQQ6CMBBFr0Jm7Zh2oqVx5T0Mi1pGqJG2aQExh
 LsLeACXL3n//RkyJ8cZLsUMiUeXXfAr0KEA2xrfMLp6ZSBBSpSksX13wWNnJhKaFOYhxpB6tJq
 Y1VlKzRbWcUz8cNMevlU/zsP9ybbfapvRutyH9NmfR7l5f09GiQKJTqVSLIyt5dV48wrN0YYOq
 mVZviVNspXPAAAA
X-Change-ID: 20260728-hwmon-max20826-support-c82ee65118ec
To: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789134819; l=3836;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=0pIkK1B8cSBdeVY+Er/YtpEF025bU0Ql1UAcEWSeS2E=;
 b=HdI192xG6FclKauexX4R8YIKS073pCUsvJACYXV1pKL+rpv+6Yun+qmlVAM7QNjX3fi5mTz4a
 xT6M644C/LnADUbZo3+YYT5GxKt1wwRyyHXHFp/tSQe2yH3mmJO+V18
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-ClientProxiedBy: MR1P264CA0114.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:50::21) To SJ0PR03MB5469.namprd03.prod.outlook.com
 (2603:10b6:a03:28a::17)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5469:EE_|MWHPR03MB989357:EE_
X-MS-Office365-Filtering-Correlation-Id: d0a38555-4006-41ae-5181-08df100be87c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|7416014|11063799006|56012099006|3023799007|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	jzehttOrHlTQwn2uNn+ZBaSC/zDoyl6ZHUc/Dm14eS5nxqI/asCuSCIOhwG6UY0dzn0ZA8Qm+wSWwzzf4SE3s69cnL8JluFoqJAyTTE8iz+mIxwyrrpqTLgE6I7D0xiSmx0JtkcRZCenxOJcjKpwI+yPRsY34tsE9QVU17HumXzoRqWuxopr3fHvLTJ3wB3ZtXxVQC5cdQxC7N3Unl8AZh3EHQ5APGMB4I3ow+07G4XPAxdEe85l1IioEkMlVpVnlqdn4XvCHPiM7OFj5/bfmwPhCEW0O3IG11KXJzW+Or7+v+sOTOJf8kJ9MHUxgmn7RoKWUylYxvEivtHunOPzFfrPqoGX+3+w+7HzD0cf8DzHAZcYf9siTWSPj/pU6XYmJmHLlQMGZVp04bJTjuC3cqG11zvFK6tqV9jlIDVX78LM7tA/35hhGsRmtT7ns94vMaQpxZsA2qtCv2x9iwoatGCWr4+JeiQyb5QS+PB7aZ7vTTIBJiGXOoVcRKDXfXrQtiCpMHnoMIKvhJBWT63XjL0Mb5liugnr1TOnNbyD25QnOe4Be6tezegf1db/n3QE3aJRzmbuDZ2cEofyYI9/CdXCquHG6kIe/x4oE/7GYIROxbtVGpy/VEhjfLMRfWR/
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5469.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(7416014)(11063799006)(56012099006)(3023799007)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZGF0VW9SalRaMG1UbHhscXJuZThhZGN4U2VONExhblFwbnY2UStwYnBnUTN0?=
 =?utf-8?B?TTR6SkQzV0xWRkNiWVhkakZpS015VkJkcFhoc3VTTHROV1dhc2o4VWRhNGEv?=
 =?utf-8?B?OFhyd1pIOEtUZmRYbkxPeTVDZURXb3QxQm14ZFcyYk5DdTV1NHN3NjAxSFg1?=
 =?utf-8?B?WTczSk10di9xSlNBSWNsZEVCM2E4eFNPUDUxZ3daV0JMY0dkQ1RZWHYrVkEr?=
 =?utf-8?B?SUZkQmM5bDhrcG82NHpEQTZWTlYxUzJoWWVPRzh5WG5qdVVGMFM3UmRLcVlt?=
 =?utf-8?B?T1FXaEdzUmpaY0tGM240QlVWREIvZHpWdU9HY2dVZ1grWVZ5Mm5rcDEwemUw?=
 =?utf-8?B?cEF6bHR4dDZRelM2Z3J0Ump5U2Y2RW9EeVdFZGlycm9ZNGVqTXhHUENyZHFH?=
 =?utf-8?B?VFYxZFpCYUx4TlpISlJISTRKR094QzhLYnR2aXc1bzJ6WWJsQllvM2RKSDlK?=
 =?utf-8?B?Q0w1aE10UUtWZUdsNVFkVkFuZFNtejdLSm9tQjhPa3M1aDZIb1RZOE5GRHJs?=
 =?utf-8?B?ZEVlY3hNdHIzb1kraDBOQ3ZkNlNDdjZIZW8wMkI0SFdVaWFGdDBnSjZ5MW5q?=
 =?utf-8?B?Y2l0elhzK2J3MmgzcXlNbVE5NEhiUzRBRXVubEpkcjVFNlJ3Mm14L1dCbkc2?=
 =?utf-8?B?M1JqcmhJb2UwNTl0eVB3NkRrL3E0eUZoakJ1SUFRemRWYXFUQ1hSWGhjT0ly?=
 =?utf-8?B?QU54U2hiYU9MbVU5SGdyV3Y0alJtT0dOOVpaSFZFVi9hUjJpcWVPSjErUFMv?=
 =?utf-8?B?QVk2VmU0MVdCQTYydGx5VlhSZ1NPdHFGMTlTQzZPVFRqV2FuN2ZNWFVMNmdj?=
 =?utf-8?B?ZUpkQzZFNTRiQmxnQ3RhZFYxSkVYK0h3NklMY1lnSXh5YjY2K0tLUHVRRHlY?=
 =?utf-8?B?d1g1c3puNS9VbnFIRFNLRTFGVklVaHVYV0w3WU9KKzFFbDZIcFUwSmN4MVdv?=
 =?utf-8?B?bjIvcWM4TnV6SFhYM2MwT3JES3RoaWVadmJWbnFIRmh6dVhqZVQ5aXJHNDYr?=
 =?utf-8?B?Nmt0eXEyald1MzRFVDRZcUZqbFpJY3pWZXUzTElRRUkzN3hwY1MvaXBTbTJX?=
 =?utf-8?B?cXA1ci9sMUMxc0ZiYldkc1k4MUxjYWRzRThUY080RjVjV0w2Y1RuWXFmRHAr?=
 =?utf-8?B?S2prL2xpdWJZZjhoTld0WnN1Y0g1M1o4bWh1NnhjMGRnSGFFZ3NBNC8xYkN2?=
 =?utf-8?B?dXJNM1pDZHVDUmRtWkRZUFhhNEc4cmVxa1A2cFNTQVhxa2tDMG1pMzQwKzlJ?=
 =?utf-8?B?N3hMOTR6ZDRiUFVKVGYvYWFENWQxNXdWREhlUEZ0dkM3QUQxWGNvUkZpZndP?=
 =?utf-8?B?MHdHUkVDTUZtc0t1TTgrVU9FaE9hMWR5STZzbW5GSWplMlpZS3VRQ2xKZm5H?=
 =?utf-8?B?ckR2NmdyZ3c2WHRjdFNEZElheW1GdUZxZUw4Z2xrTThSdDZSYjZvMWhNVTlY?=
 =?utf-8?B?M2Z6M1luWnRYbXc1VFQ4eHBqenhhbDEwY3l1QXV2RUtReHh5MDNPZ1grczhW?=
 =?utf-8?B?RzRLUlVYdExaQWY2a3duM2VzQ0xmaWg3bjBpTWN5M0NzS291eVdiRVpkbUFK?=
 =?utf-8?B?MS91dXI1akd3aGZvTkd2UE5qMGZ4M2ltSkZSU21Xa3IvVERNREJ2WmlkVzND?=
 =?utf-8?B?MEtTT3dKQjlMeEE3ZHVtR0FKOHpBc3BhRGNHSEpySWlWcWhNWHVwdnhteG41?=
 =?utf-8?B?SzBFMDd6eDZpazFmVW9yY2trUlM1cXNCKzBVVFlML3p6R0dDTmdPTk9UNWJY?=
 =?utf-8?B?KzVpbnp2K09vS0kxZkl6VDFlRkVPbHR3SXgxUVA0aS9HdFpZV2FGK2hCS2NL?=
 =?utf-8?B?Q01oamxQZVVPcU9ETlFDV24vc3RYczNzZk1iWXNlNHRuWGx0c3dMdHBuRm0z?=
 =?utf-8?B?cVVidUpWWUxsellkb0RGMUc1L2Q5NDk0UGYwblBvVUJrcGdHNTlPdlhJYmZw?=
 =?utf-8?B?a24wblZSR1ArNXBkempxUk1ybmtMVkZJb1QvUWs2NlY0VklhSUswYXQ4KzNo?=
 =?utf-8?B?dUd2b05nazR6bFJGR1djbjNJSGVmVEhsNUJMVXFVZkdscnZpRHhVYnhRWDBL?=
 =?utf-8?B?dE03K3NoR25jVUJ2TGlSQjBQejBIMml4azV5ME4zVmcwZG5Nd1Jia29lMTFS?=
 =?utf-8?B?dFpwVGtMdy9TY21kRjVySjkzNVU5Wmx1cjlZTVp6d1RLV1BxaFRNYy9aY1lV?=
 =?utf-8?B?U0cvVUNwa2tHTExlTVFuTStmN2xnaGw3WnF5T3lTSzdEL0RIVXZUTjM0R2dK?=
 =?utf-8?B?QzVSTHczUlBiV3J1QzlxWERRU0wzSE4zdng5TU5zc1g2TzcrUjAwTVpYdjA5?=
 =?utf-8?B?TFp0ZEs1ZzBqV0Q4RVpOdE1VeHM0N2N1QkdxK241VzAyemF2MXFlUT09?=
X-Exchange-RoutingPolicyChecked:
	WfudfPm/cj6Y00qBVKamdNr1u4mNXBF2IlAbI+jDOsiXCgnVxrjwfHcOrI/E8Lo5cc0WxG857ysgdbY+maxoGNYijp4jT3YRpPg2WCfDwSmAvHljUWATdBSjulnUHXS0CNZwI8NYs2mLNGWUibYqWI4phXSaZeOrGE9+bRC7gVMvTX2tr++FuMSFtC5T+IfLojNOCbm5GqDHDOQSE9hfFR32zoDVbfY5e+Ll5EOM4e+3lY1a2mPTpnzCSJyN/Wyv322JS/n9gt8YgNMOOl1AQiN2Qo9ynEazsQVg847L9vPHlyRcR1UL8wl7+zm9td214TPIrrvnV4p42c3kvydAug==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0a38555-4006-41ae-5181-08df100be87c
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5469.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 13:52:24.1981
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: soHVP0pYHuJTJfw+QyRJAwYNsZx+RvBH9sqvPyaVsiOtP3RS5aRiOjbNU6FKBLDk414ekjrwAE5WgGnmnMA63g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR03MB989357
X-Proofpoint-GUID: fy9mFHwGujRgxGpTJ2nQUbnByAbmVjih
X-Authority-Analysis: v=2.4 cv=JaApPkKV c=1 sm=1 tr=0 ts=6aa4079b cx=c_pps
 a=cX17BFbqy3c2X70AxBoB8A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=_jAD5XSDOtq9-5Nde2OG:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=bC-a23v3AAAA:8 a=gAnH3GRIAAAA:8
 a=h9bl0AlvHLq22hQ9adgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: fy9mFHwGujRgxGpTJ2nQUbnByAbmVjih
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDE5MyBTYWx0ZWRfX5pTV4atpgICo
 0TarBmdXhTNEgN+PnmdufOVpVlTkF8V3fh+SEcKJ9VHmlQ06dENq7okXuIDtA81mFTr1xhKD3+9
 /7ttNRKz5WC8fPzKdcKCl1nNYW04DcCdjUcgZaH+tFjvLpFpQxH6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDE5MyBTYWx0ZWRfXxHUJHpXDZp18
 rz4ldTudGtYST7BHkpzuKl+oRxepwDm5GkPNFU/3zaqgmn2DZ5HFlvzh4Y0Sf4qkXdE4YbAl6tV
 hsU/JBLsQwWZQ85OXCdUoor1vzeZcHe8oOxg1+96sY0lS2LxAF7Hr/vwbAyqRT025opKA16psuz
 2+RYBcn6oe2gez8Jgdjt/WmLlinfdNiS13aAwrrrFxIEcW/vX1TRCUdkE6fMuUzbTSAfd+RtUl3
 dJwPdsfBzbCCBtnWuowtvWaG1NmegUgZMyGMDX/7kpE239qSg6YiVeMVUY1LtWmTAj3qRwBzXg/
 mjCflcWM5OHU1Y7EjqCEtjSuo+UQg5zsTJGFE3CxAABmK5yhupVD9a5RPZrrK4rQa/kZLMrYkzy
 OZK4PV/pHt8H7OP/+kDob1ACjDEUKbDhLfCQOrQTjIjkS0gBFLsZ5qyXd9oatZjmaMhwWJAcJ3x
 GFOqDU74UYMn5yunrVA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_04,2026-09-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 phishscore=0 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110193

Add support for Analog Devices MAX20826, MAX20855B, MAX20908,
MAX20912 and MAX20916 dual-output multiphase PMBus voltage regulator
controllers.

This follows up on the earlier MAX20912/MAX20916 submission and the
review discussion around it [1]. Compared to that minimal driver, this
series covers the full MAX20826 family and implements the device-specific
pieces discussed there: optional EN GPIO handling, non-standard phase
reporting, direct address mode, and regulator support.

The first patches prepare PMBus core support needed by the driver: allow
up to 16 phases and add a device-specific block-read hook. The remaining
patches add the DT binding and the MAX20826-family driver/documentation.

Note this revision is based on hwmon-next as the driver now makes use of
pmbus_read_smbus_i2c_block_data().

[1]: https://lore.kernel.org/linux-hwmon/20260707122701.751878-3-fredchen.openbmc@gmail.com/

Changes in v2:
- Dropped v1 patch 1 ("hwmon: (pmbus/core) fix regulator enable/disable"):
  the proper fix is to make pmbus_update_byte_data() only ever return 0 or
  an error code, which is now upstream as a19038a200f1 ("hwmon: (pmbus) Fix
  return value from pmbus_update_byte_data()").
- Patch 1:
    - No changes.
- Patch 2:
    - Fixed the read_block_data() comment to describe the actual API.
    - Explained in the commit message why the hook is needed.
- Patch 3:
    - Added the (required) vdd3p3-supply property.
    - Added the regulators node with the vout0 and vout1 subnodes.
    - Added the adi,rail-a-high-speed and adi,rail-b-high-speed properties.
- Patch 4:
    - Dropped the <linux/mod_devicetable.h> include.
    - Use pmbus_read_smbus_i2c_block_data() instead of the driver specific
      block read helper, which read past the end of its buffer and did not
      return the actual data size.
    - Use pmbus_update_byte_data() instead of the driver specific
      read-modify-write helper for everything outside of probe().
    - The source of the output voltage of each rail is now given in firmware
      with adi,rail-{a,b}-high-speed instead of through a writable sysfs
      attribute. in[2-3]_high_speed_en and in_high_speed_bus are now debugfs
      entries.
    - Split max20826_regulator_do_enable() out of
      max20826_regulator_enable() and use it in max20826_detect_phases(), so
      that the AVSBus workaround is applied when forcing the rail on.
    - Fixed a NULL pointer dereference in max20826_setup_vout_format(): it
      runs before pmbus_do_probe() but reached pmbus_set_page().
    - Make sure we swith to RAIL_A when RAIL_B is not available.
- Link to v1: https://patch.msgid.link/20260728-hwmon-max20826-support-v1-0-224766e0acd1@analog.com

---
Nuno Sá (4):
      hwmon: (pmbus/core) increase number of phases and add new mask
      hwmon: (pmbus/core) Add mapping function to pmbus_read_block_data()
      dt-bindings: hwmon/pmbus: Document MAX20826 and similar devices
      hwmon: (pmbus) add support for MAX20826 and similar devices

 .../bindings/hwmon/pmbus/adi,max20826.yaml         |  102 ++
 Documentation/hwmon/index.rst                      |    1 +
 Documentation/hwmon/max20826.rst                   |  139 +++
 MAINTAINERS                                        |    9 +
 drivers/hwmon/pmbus/Kconfig                        |   19 +
 drivers/hwmon/pmbus/Makefile                       |    1 +
 drivers/hwmon/pmbus/max20826.c                     | 1044 ++++++++++++++++++++
 drivers/hwmon/pmbus/pmbus.h                        |   10 +-
 drivers/hwmon/pmbus/pmbus_core.c                   |   24 +-
 9 files changed, 1346 insertions(+), 3 deletions(-)
---
base-commit: f614eea73fd43d0e8057fcc49465aaa4d2024975
change-id: 20260728-hwmon-max20826-support-c82ee65118ec
--

Thanks!
- Nuno Sá

