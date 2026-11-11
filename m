Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.75
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794420749;
	b=vepHVo97IKO5SJIr16d3z7GoHhybyoUO50XhpSbqiXNFNkzOa7vkjnirPucFPjcxCxL5
	 X7+8ELxP6Yf+WdsQYV/nh1hOotnp3RVhRDSvn1v4AQk/Ym2jtJaMfs/eDIz5YyyuJ3iSc
	 tKcokVR6/s2lLMmp1TLhSwGFLoYZZEAg2fuuR/ZeCT2Sit9xEDFNNVkltbqplafAhDUTv
	 juJymD+CbxwCDh8j5PEzvk1rI/lVyD5XG3r8ncl4me/Doe5jsgAWc5TEJDqo8yg5TxPMT
	 cqO8iWvb7/UCf6YFUFhyWniWKlftJuAcyL5E44dHV4kLmtk2v56c34+Y1xCdcDvbE7Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794420749;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:Received:Received:From:To:CC:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-EOPAttributedMessage:X-MS-PublicTrafficType:
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
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/1vWBNQzkIYWxuC5ceE58JtJv/vGwcrCRPpVKU8ERF0=;
	b=pssrC/hHAKKwSsTpKJ39uJzxacUe6YGITQK4JI1Lzq17iiyxbTTjn1ZzcQ9raE+vM6CM
	 caoY1dzRDQ6ki1x3BZb6vsHPBYeHaumvc32+DMI2SDNhmpQynyKYBdMmcCbMd8wwinyCq
	 PwdfokxG9xQRTyiGfq2zEpkCxKsn1mqilS137FjrKfhgZujN9XCxAYW98ZiQv2MbqIBI/
	 BVHOyGMP6DpWePN3tNlQpOgIqy/sUojKtFpwyxIufQYIvkPcB3f/0yo8rfkIjtYIbJE4Y
	 7B+mfwSs/1tn3tVBr34qUcRbfHjDu5aoV0D5b2HbbUMi2k9zVULgkLki38duFwoFFkg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ti.com;
	spf=pass smtp.mailfrom=ti.com;
	dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=F+PaoNXX;
	dkim=pass header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=bA7e+GkS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.75
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1B28606B79D;
	Wed, 11 Nov 2026 18:12:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1B28606B79D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=F+PaoNXX;
	dkim=pass (1024-bit key, unprotected) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=bA7e+GkS
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6ABHsi0A948469;
	Wed, 11 Nov 2026 12:12:17 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=/1vWBNQzkIYWx
	uC5ceE58JtJv/vGwcrCRPpVKU8ERF0=; b=F+PaoNXXG+f0s5Obt1gWVn1CYJi9D
	EHE1BJALjCQI4YeQ4K04EbkMWzoHgbYP8PSti5sW1BajhPxfifm3moUj4rdwiMNE
	TdBH6z+e1UNUFlGb3hxfXSWMZtcgU36jylPzR2OUIBxz9FgrlvS4bj9bVH1cbH9+
	ywuEt2oUnl5cF0rNDa2lKBIECBifsx7gFc/POxySGffIhtTRbvTPMAmSPRSEEeQF
	DtqhZtdlp3MR0s8YeLwMyswaRvfktKK/Q7zO+Kw8XvlnAK4gtsGMrwx7oAmSBiuK
	xQBGPC+KOcHn5IumPinF3+NvqTsBuLdJ6/9Bx50qwgBLDY1HteZNeaXOQ==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011066.outbound.protection.outlook.com [40.107.208.66])
	by m0380145.ppops.net (PPS) with ESMTPS id 4hveupw2pd-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 11 Nov 2026 12:12:17 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eUtzohRa9LO9KGlNsHu+OHXRl6aHmffOF7QiQARI2EvbBwG++DgV0TWdvDDseOft2OWG/IYPXMTbH5JIZNtHdNZvMPkQDVJN1RFrc4yWvUwVLwfwxpCoxbj92lrtOKYT7EZhtdSw7Sml823Vcd3yBMuTLzNAw6R8Inezhg4Z4tKxLgRVaHz7FyJZrTZKnMMOwrmkSETLhwa+jx+EHYCzIkv0nepSGvNjmasOSw5hQF+T/MamjwR/z7xUEr2b7SSlDi4+tMtr5klolabyvnzLOyGVMmZBCfC7munaJz7yhQIHq7zlsBvTRzEI8kXxr8JGp9W3mGe+duNMNxAKhnedYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/1vWBNQzkIYWxuC5ceE58JtJv/vGwcrCRPpVKU8ERF0=;
 b=C9CUe1G07Gh7V1b+jsqOH/GJnKlhvUDJfvkRPPnjpjcvsbJ9ck0NdYdRLFUzh0DZfRa0SWcpdDn7Fzg2rL3jMP8LLbz32gSmw4hA7latzQseWbndlG3cUDU5iswD/5HNDxa/JyUDy8DqABS5SabkpgwXhr90Bdyeu32PrVf/RK+oBiYJfiAQAS7G7SpqfFEUXu+CgYN71hPgqWStca35niRTt5BEqhXIGdsqT+pERS49+NQoMgx/0xBG4alE6sNCelsEg9FdosKwuYBJakEwf7vWXZywg+V5s7lHztgm+g+D5O3i4b1lBNQB/15CgksNOWxhuO895lZBIxvsiX0i+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/1vWBNQzkIYWxuC5ceE58JtJv/vGwcrCRPpVKU8ERF0=;
 b=bA7e+GkSgFAeLJeuPxgcYa4Ev0qlR9s7G+qmPDDdodidZcJxDVrkSI5sFLyDwKmwJObV0zg7ZLGYNQSaMth3Al9fQtaUUkQHq2+hSMQ7VtzersJMt628VgSl4grCbPuNLPva/i5PfSj8NeJpqEVoVPOSAeYZPGK12CS2gPqmShk=
Received: from PH8PR15CA0015.namprd15.prod.outlook.com (2603:10b6:510:2d2::23)
 by LV0PR10MB998147.namprd10.prod.outlook.com (2603:10b6:408:393::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 18:12:15 +0000
Received: from SJ5PEPF000001D6.namprd05.prod.outlook.com
 (2603:10b6:510:2d2:cafe::75) by PH8PR15CA0015.outlook.office365.com
 (2603:10b6:510:2d2::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Wed, 11
 Nov 2026 18:12:15 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ5PEPF000001D6.mail.protection.outlook.com (10.167.242.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 11 Nov 2026 18:12:15 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 11 Nov
 2026 12:11:55 -0600
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 11 Nov
 2026 12:11:55 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 11 Nov 2026 12:11:55 -0600
Received: from ula0226330.lan ([10.249.32.167])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6ABIBtLW217898;
	Wed, 11 Nov 2026 12:11:55 -0600
From: Andrew Davis <afd@ti.com>
To: Guenter Roeck <linux@roeck-us.net>
CC: <linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Andrew
 Davis" <afd@ti.com>
Subject: [PATCH] hwmon: (emc1403) Fix table name to match driver
Date: Wed, 11 Nov 2026 12:11:54 -0600
Message-ID: <20261111181154.445315-1-afd@ti.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D6:EE_|LV0PR10MB998147:EE_
X-MS-Office365-Filtering-Correlation-Id: fdb47af9-dae3-483a-a05f-08df401f50dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|23010399003|261021123027099003|56012099006|10067099003|261021121427099003|261102123227099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	H2gc8v6sLyvaGge0bc9HmSpNB+PcLbVkaylbxXK22iD8RJCI6QQERCA2Nd4SdakvIYIDFJkk9JLRedqYyp2XFXl/iHFCUKRyjEBDJuGVmlRzG+XTHgqCoaSCK+2aGw9jqty5dirm8FzHWV8KjXatdEl76Tp73XBLbCsw9jYNFJfYmUFgSNGQgh5Ebm1so1grCfjU/qk0g/zcmd1ZOnS3uPwX4pg3WZOnn9PrS2CrGobwpO6MgQl+dM+BqK1A13XLRsxBkn6Ab1f5bsAP0JKIggv4D0Aal9+a+LOWNwzBuZuESPJ+JjhI9IW2ixlMLDlllyCRu0lyTGRm2Fz2cepnpGwIjJANO7WQYCDB7YgBwLO1WnWVWMUUYectclD0oUA5keeVJCiyilTSHiX5GHvXQH7Cj8s001XnDAUSGjyY6WoEf4aXZJzh6uynysTQNqEwiFtukmbWWARMRWy/3F71DEvqsN7CAbKWmDKh+HtFuEY1W6P9Ecp587Jiy1gkx8TENgyc2HQXoP4/AyB07EIq/lgCQ6aaNFzN7idpKcizTpaLMGPjm/222vOWUIQZyNIpl2zMTM6ucECub5jvlxS+nqPD4MfOyVOf3fdl0r61xq9W0POR4CmCJABxbnmJrQB0aRDKIFVFnR9BxMJZl8ND4fhZBCZr3t7P+YJ1dVZrcHs6EOLQuzVmj0uEKdH+7tgRV0aFk02005FHLvLdV9haOQ==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(23010399003)(261021123027099003)(56012099006)(10067099003)(261021121427099003)(261102123227099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	3dGQdikBRIYbMcvvkWRI5zMczMoSPOaOSzRbgBzINWxRlZzjzLsHy28AB8uXt7+9iddnlT9lo8X22eApJs7HxVeSbDjs63he6XvdzHFQZaiverdhLL7jF8rYECP+9ePEm5tuHuF7kDI1kEUqF2qok1+LZ0NLlkobYukvwC6jQk0j+2Vu0wRI0ZK+QwOuXh+zfqrzxpf8kYb3OjSp5JzG1Z8ifPWxiK2aLZFb/hg/eGmwo8wXmsrphsQ9GwaWeTSVDzLish8BcKprM6f1sfDeB723pf+Rl1TxoRFIG17Gw1ZmJ+r0b9em8fUrmPHCg/6x9chuORvkPjUbScEE5xOllLN2iBUHRK5QXQT4GDOGZc+Sr1WIKE/Z85AH17MLh9s74qKbianmAXePFWx2SCsgCWcLLqCQCV3IBsLqPP5x/b8ydwSzw9r8BIk5lEje4N3f
X-Exchange-RoutingPolicyChecked:
	swlcdfS0pbnBQdRTr+siem/qwoFUrGSAORLhv12UMU7G7lZCgUPSQghScNf/Sx3glnh3k9gtbkq+q5MjcWUBAYPJDlFb1n1CzavTsr9lOucx5Y3nm/GOBVispz4SAa1tNd035yI3LH7VpXvwXasGb6f+mhoott9s5x/p2W5VVqHxXmxKwWIbdQD/FsNh+8Pt5qya5EFA6RczYxMRI6t2jFE8QXKj6vc0/NSHYvwT6Imv2YkZim5xL9K3JUNSIxgFrPEydFozp0WBBH7u+X2fYWFHSQavoZWnH7TILq8n1DPDlsN3mWkoBYISE1sUV5oX5r8T12Ze+MrP92ZsSlXQ7A==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 18:12:15.3451
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fdb47af9-dae3-483a-a05f-08df401f50dc
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001D6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR10MB998147
X-Authority-Analysis: v=2.4 cv=KeRHIgYD c=1 sm=1 tr=0 ts=6af4b001 cx=c_pps
 a=+lVouGy4Ef+S63FV+3Relw==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8 a=KVqrA9XW9gdmQf-NLsMA:9
X-Proofpoint-ORIG-GUID: 9mObfgjdB2ypFEjUuwI-CufaA3MUdhYR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA3MiBTYWx0ZWRfX84En9ThWMM5O
 N/zN+id52Mq8CGkSinaIkmsT2coiFDSOY1AopW5vESyc2ANwVhNK7L394pdd7wU8cVzn30clHjF
 loDwtZALgvHP8laGN/kF4tJJHgPU+KDj9prgsCP1SGJ2OJy6fFuEt/DgkRvn12tezt9alHdzCx4
 BDlhKS0il/N/XiY3Wtv5KC8SWf4SeQxneUgtmcuW3o2GCQiBuQkIs38p6UXrGsGdhb3meb9qELi
 NUcYaF0PegIfvU5eQlzxItUNnZzRgTRasCfhjFguyzwvFyMiHbx8QZFNY5cXSiEVZ0vyM/GZaFP
 /gBZ0tMyV0vLFP6w15/+iGTRpmjvHJdK2VCrd1PHfIsciNGsW/KhaiTtFnss8eS5IwO00PZwqb+
 16gBLtiQoIvjKX7C0MJce1FpFQ0AIdaTePMcjJ/QsmsFxCcqZqZZ6yid0vgYHEe20s0cRrmeMcl
 Fr+A2wzXXxdznmjeOUw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA3MiBTYWx0ZWRfX8ULOEe20MaX1
 Qx3yjE7F4INmVjseVmA0PrCsUbiH6VbWTs116YaxoLR50D0SFrP/EU7aHEOcC35QX+acdbRppzC
 teWH2sQLrc6j9jp6V5XEexWQm6kwTMw=
X-Proofpoint-GUID: 9mObfgjdB2ypFEjUuwI-CufaA3MUdhYR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110072

The temperature conversion time table is called "ina3221" but this
driver is "emc1403", this looks to be a copy/paste error. Rename
the table to match the driver.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 drivers/hwmon/emc1403.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/emc1403.c b/drivers/hwmon/emc1403.c
index 13ecc7372d9fe..97508a2ee852d 100644
--- a/drivers/hwmon/emc1403.c
+++ b/drivers/hwmon/emc1403.c
@@ -490,7 +490,7 @@ static int emc1403_temp_write(struct thermal_data *data, u32 attr, int channel,
 }
 
 /* Lookup table for temperature conversion times in msec */
-static const u16 ina3221_conv_time[] = {
+static const u16 emc1403_conv_time[] = {
 	16000, 8000, 4000, 2000, 1000, 500, 250, 125, 62, 31, 16
 };
 
@@ -498,8 +498,8 @@ static int emc1403_set_convrate(struct thermal_data *data, unsigned int interval
 {
 	int convrate;
 
-	convrate = find_closest_descending(interval, ina3221_conv_time,
-					   ARRAY_SIZE(ina3221_conv_time));
+	convrate = find_closest_descending(interval, emc1403_conv_time,
+					   ARRAY_SIZE(emc1403_conv_time));
 	return regmap_write(data->regmap, 0x04, convrate);
 }
 
-- 
2.43.0

