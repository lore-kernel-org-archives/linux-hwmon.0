Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794389574;
	b=otfXJ2Bl3DPZdXME9CiMbm+7+ceeQDi7tDSTazpNAyXeiSqiVuwfGnZ/tCuzFZZaEMtU
	 v0uWWEVFz6BSR69DpSeUtBGSC0gihnhNOSxxkNDKZ76OH8jBvr0QtOfrXHBXHyGbjHVb1
	 /Lr/TDJxnSay+5poRgDTIrVgAukJdbgp8Aj9TtDhg4e5YxZJE9GPgGhNzTPlkpt4w5Atv
	 vLj47VSJCkE/Kab04Q8RSP0QkS3Rh9nOTwFgsg8DsuboqyXcswXXbXLt3S9q8TXPRcwMg
	 eIj2S/K6XQBC/FAEzZnRPpVsrnYEA3CHEGr2d+bH+12S1+1BvjlC7jSGfX+kSdCFi/Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794389574;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Reason;
	bh=B7aQ3q2DNqnMo/WIPHLbk1Xhn2EPnkmKcTpn550r/qk=;
	b=1SStRax0AJtM4ZueFie/viPn88lwWXwqATmVhOXzJTDmt+51OFRPKQnd1pTCUy/UP/kv
	 +FUSxWrYd/bFbgYtakDN0CFehjdhJGRxikR0n7Wj0mVIgKGRXibmEBFDk+6rKtGQBLgjn
	 k9d9sB0BCRAheZR135fF6E2RaAa1AheFmsk1QCRqDcG6uX3v9Fdo8k0EV4sTtViJuGzHC
	 wuoFeKdfznQX+EXkH1GMlzjRmq0XyctB6oghrYY8EQbofBQNGc5SP7FqzeQJQgpOOqhNF
	 jOtxAu5gDrnN1XDu5Ia1x9+XrLSdzFz/5xmxZWxuHEMrcNDTdFsoCFEmp8E67BaghPg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=oJMwcuPp;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=sA+UmWsk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 647D6606A321;
	Wed, 11 Nov 2026 09:32:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 647D6606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=oJMwcuPp;
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=sA+UmWsk
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB919vh3365657;
	Wed, 11 Nov 2026 03:32:28 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=B7aQ3q2DNqnMo/WIPH
	Lbk1Xhn2EPnkmKcTpn550r/qk=; b=oJMwcuPpHwnjKGAAT606rYghDEWt9K8Osc
	+fpuW+UDkK5gW6ai5GWtqyKedlRx7jMirl6czaOhtITDM0/vDctSxUk49MdxNC8H
	Pbwshfubh0f5/llYLzakYgrrvBc+o9PSNIM/tYbEAoygVFxSkcu/bNguHGaaa9QQ
	9+O/q51MagV1YP1O2ZW+HK7y8LdDJmQzicQNlLM4wtdEPUHxM/hL49N3bCOQmVmo
	BAJQdxtkYM8wyc6P4QTvUcyoSb7Ho9lnwv2dh8clG3BVaM5WyfYRUEctSd8UGT92
	2fAc0b79oXBxyAAT+0PoKOi/aNq5OP49bTE//uUJe1VXqIKy1OKg==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11022081.outbound.protection.outlook.com [40.107.209.81])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4hv7urs7db-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 11 Nov 2026 03:32:28 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DBvDm/A1BRtJoLojAAxTlPHwvtaNjEIicagvXd6ATDBc3mRZNf7mUu1tIYfNMVfmBg3hlkkrrvNuUz/4Upst8FylfbVvX992C3NCEKgEey+4ihah0LWsv69C1Me9hXlRfnQ7aDLoG++7WWt85OV8JBF8xozhAj7yUccAUhOpttXKUtKV0Byiv5UkqL9uFvcWqC3dXJSe8kcComgMw2yq2u8dfUiwmc5cyAVDlft+5scxT9BMZH6cbylOkQm7rnT0XRv+LgocKbKb25P58rR3cN4TW4e9ELLWpM/VwdHQwf6/CTKxmPxsQb1YN41ncdpn+sAKrYc0s75fcBX7yT3PRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B7aQ3q2DNqnMo/WIPHLbk1Xhn2EPnkmKcTpn550r/qk=;
 b=AMExj6Zvn5RNgWKWs95S1fQ/vM/TlBNUkcBB9bzhxTeOnlAKVoEH48yuGCQjhXT/YowNMteW+T0SLDPnU45AuQgicESAwQzxkCZO1cYi5u0knuPS95G9GWMfpb3NWRQxvp7eH94PrIT4JfoWziOF/WLN1rY8xNoIaZe9UjKFlUbgD8jtLhmiYwghw4ke2i5mKQbd0aCCbDT5xAAefiFS6g/4Nbz4DXn+N7kX5HZmjTFUucs246QU3PbwM45jNBFMSxzeREHP77ES8A3NbxTDkJvnKfQGZ27ckCTCcLMpchmt5rElCn3798DTyPDHZ/DN+FR3AjONOO+pNHH/vmNhsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B7aQ3q2DNqnMo/WIPHLbk1Xhn2EPnkmKcTpn550r/qk=;
 b=sA+UmWskyzGqdWYR0jXjOHbDEVH0UewsbqiVusPtZlQFlEnU/LpEivnvISB2k6sTqK3roTPoqEQ+5LBuOH2rYb+2GH2KwfKaeUUfv8DKhu4/OnQ4JUJCEVdH3Q3daqqbJvr+ra+WKzNWIkSXnmYYejqIuOohtSCiKYjk9jAbNLA=
Received: from CH2PR18CA0045.namprd18.prod.outlook.com (2603:10b6:610:55::25)
 by DM4PR19MB6415.namprd19.prod.outlook.com (2603:10b6:8:a3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Wed, 11 Nov
 2026 09:32:24 +0000
Received: from CH01EPF000BE942.namprd02.prod.outlook.com
 (2603:10b6:610:55:cafe::90) by CH2PR18CA0045.outlook.office365.com
 (2603:10b6:610:55::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Wed, 11
 Nov 2026 09:32:24 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH01EPF000BE942.mail.protection.outlook.com (10.167.244.134) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Wed, 11 Nov 2026 09:32:24 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 2CD02406559;
	Wed, 11 Nov 2026 09:32:23 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 185CB820273;
	Wed, 11 Nov 2026 09:32:23 +0000 (UTC)
Date: Wed, 11 Nov 2026 09:32:22 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Zhu Jun <zhujun2@cmss.chinamobile.com>
Cc: rf@opensource.cirrus.com, linux@roeck-us.net,
        patches@opensource.cirrus.com, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (lochnagar) Avoid oversized shifts for zero
 readings
Message-ID: <avQ2JvdLKIp51/wH@opensource.cirrus.com>
References: <20261111064930.17408-1-zhujun2@cmss.chinamobile.com>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261111064930.17408-1-zhujun2@cmss.chinamobile.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH01EPF000BE942:EE_|DM4PR19MB6415:EE_
X-MS-Office365-Filtering-Correlation-Id: c91a10de-2f0c-45e2-9427-08df3fd6b18f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|23010399003|376014|61400799027|18002099003|22082099003|16102099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	1WAIYenRAGUO6Uayo3pwuMTxdsb2k+rFB3hZNmyPliB2Oy0QIJRW+ei3ZnpcLwjpPpI6WGK88ksWkHhQJC1oSk2898PjLaDpAaYdnX7QKPsh6gOjlHTXkCCxygASk8ysaob1kR5OzahR44+hRiSnLyRqlDm637Lk7VzhsFh/KW+b11/ESClvLknTl7FW6mOkU3HlBlrzfRmBp1gGakscCrhkkUOonKNPVwkb57fwt6rJbQHvSLnHT79K9GZXQ6muvwFCqdVViagyVPRx4GCS14dQmiASBVgPHzLv19rGXY+ljnLBVREOj89fopAQxlBMSkKSy9Yu/PD21ikZD3+l56BOoTTHw8StKPO2yth71uwMuDpFvsiPgiBHPWQNGom3Bx2HcHNsnpeXvlb8PsOQlF+f5D2YuDVQYw55u+OPHE/cE9JMGgrzThIVTVmLr5R5ibrj7LIZpgDvizUAp4f/KB/VCdAXvJM+qNuT9Bn7BeNSghWntiJyfrzfdqfeh7EiahxthQPFA3WAPmiWxJOi8zlComjwztDpHq+goQTPDlgXwuOyASfN/Xj/EYcMpXNxA7u8nzOionoIMxrKh4xdhn9QdPY6mdfReDw84WZnZV+bgFmBIU9cSk2fQ7t3VKqAROj/Ds1yCr/2n9S3jmFyryKdGKFhagyehPBSIvS+fX4ET59kZdRBy7XGI4ZjRMv3BHkiKQc3lww59blHQHlnOQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(376014)(61400799027)(18002099003)(22082099003)(16102099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	GLe36E/CbYIpommo+CsE0LoUwyXuw8s2Ciio84ZYHQ+s+gUl2y1/saHumaAbVAnvDvYzGdnqFFlxgQBXV3e0Rze8/gY4lsPKjw2mSg3Q78HciAqFKm+3KAgiH+S9p8SsT3kYTUyi/QnCCOsDrmCePidbyVBTwsJZIqFUY8XBdfH77DUELWoQcrHplYiM5kOjGxixgDa75/igFwED4g/ndnyR0sunOOoMbQWKvibIeXWGIgfMY+dID4Q/owGT9+Z/t7ukqimIHjWVjms7VfUgv0QGLnRlwvtOQkNm6dbtEw9Mdz3ORJDpKtYceqcQT5tNNWp26LRNK6G4qhB2OlCPXOI4WCPLJvB7Jf15KvS589ELWP6MQzkTcATUa3tncPG3mhj91b50nysHGRVz+WNhNinb/JETrOkt8XJ/uQzZ2MD1BPaRZOZzYFoopZpY4xhf
X-Exchange-RoutingPolicyChecked:
	kTiluLRIrAQPPZC12+rz+aoa80Skps7MW79mUCQTTwityt69dAXBGOJ0VK48Xxb1bxxg+kwtZ993CspLE+yg5F2eDzTju4Zq5rvURFSB10RgQyBtz03bKwvzrsFnI+SngU03Kjp/pEggjb6QEjVlhrRskpGFdJwsWoRxM2+3bxVQdqdupwkG9gjzdKoLQ8NxuSOdeSJbOUMQEDy0n6MdjzuyBKuHUIi+uj+bbG09rNSCbQGJj2FqmjPBhFdjI7XFgPn7C9UYYYYjGndShdVz1bEmXTRHAIdeItgZFnPnSPLNuWueBXSs55y4ThkTFffBL9TlFW4FLGVz+k6/WVU4tg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 09:32:24.2054
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c91a10de-2f0c-45e2-9427-08df3fd6b18f
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH01EPF000BE942.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR19MB6415
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAzNyBTYWx0ZWRfX+loshmtt7B/e
 RSn4RJFCag5do5sZvwy+uOmQv5/NrGqhEeaiujMekOBj0lsTAgQo1MTM9DZE52BYqDDhXUTUV2W
 iB3lrUkICYbvGRIT4XNl8/dOJ+/WSMxInkdNlFviR0RRvFXEMBs3W9osUZc/bUF5rifPaPMiKG2
 BdRRuoFM0BYnC/VGZnDq+KPBRUd2nxtirwy+Rj6BJP43522X1BOJ2lTPaQ8DyyaxgyxYKKyqGTG
 10ITJb2KgUTwoF4uIyM3hW2+MJIEW4E9MM4vGGUCy1IOL5q4/K3zzGdeJ0WobM9KKM8wJS7lJdI
 CQesuqFprrXLCpNaTDN2DVLPr5MW3+JmIB9rlmix/puyDjkv5SpUErE/BBqHhYucRodJxjO+ffQ
 Pd0Nkkrjdpj5yMS8R18shXU5ZyVtb/ouRjrx22rsc4T7Pao/bMxXqutiS2VD6lTuxX7vaxqawCP
 Frb/cDelLyBU5HTSMWQ==
X-Proofpoint-ORIG-GUID: anQeUH_8tz1R5sgQ3FrPCOw5GzFm2cvi
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAzNyBTYWx0ZWRfX5tKLTKCdlCA+
 658JRr/vvuVMyLR3TCPxeeA8zuV6/fvW90DqFsmK+a2u8che7PBKyxK7u0lXcLcV6M3jwz854uR
 EFCyIrdXQ9jQujp/3KLkqB/S6nhJGMk=
X-Proofpoint-GUID: anQeUH_8tz1R5sgQ3FrPCOw5GzFm2cvi
X-Authority-Analysis: v=2.4 cv=JagpPkKV c=1 sm=1 tr=0 ts=6af4362c cx=c_pps
 a=XJoAL0HPiv6B0cYJlRTKVw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=R5C9hjxsAAAA:8 a=FHBEN9-or5iHGesUZp0A:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Reason: safe

On Wed, Nov 11, 2026 at 02:49:30PM +0800, Zhu Jun wrote:
> A zero IEEE754 reading gives exp = -150 in float_to_long(). Both shifts
> in the rounding expression then exceed the width of u64. UBSAN reports a
> shift exponent of 149, and the conversion can return a nonzero reading.
> 
> Return zero when the required right shift is at least 64 bits. With the
> supported precisions, the scaled mantissa is too small to round up in
> this case.
> 
> Fixes: 4cdb56214746 ("hwmon: lochnagar: Add Lochnagar 2 hardware monitoring driver")
> Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>

Thanks for adding the sign off.

> +	else if (exp <= -64)
> +		result = 0;
>  	else if (exp < 0)
>  		result = (man + (1ull << (-exp - 1))) >> -exp;

But as I missed and Guenter Roeck kindly pointed out there is no
value in this. The shift in the following case will just result
in a value of zero anyway.

Thanks,
Charles
