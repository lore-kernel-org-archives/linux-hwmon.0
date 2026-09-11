Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CD4B4756C1;
	Fri, 11 Sep 2026 13:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.139.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789134779; cv=fail; b=Te+NJqci3OAxpRag4ETFhWBILAOUOiRbIcWWpKtrPf7RdxFRzvq5iTCiQn+aUuzQrfYR3+YsCmsRXvl5eXay8+ZeCaQaq4vza1PoEEnb2mPEshJd0dR6hSsNC49HkcWXK562IJhoqMeYe0zSeIndVMelCxziomvivE+8vk0soB8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789134779; c=relaxed/simple;
	bh=DrOocyQcdrwqAH+WjBgXT7AKQg5lfv4MywtDtJjon1I=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=R4SeSghI5TaPWtaFejHdjiB13p+D1wAV5LLZKkrghv1oz9CKZ4WiigZ8kenbQpT4sfgT7W8nBIx2K5/09Py5amfzQBRSk8f9WwNLjgAfo2WOfb7iLcz++YqCZsy4NyuISmLQqtWnikqSKeU9PFh86g3g1Q8P8n9Wglpnbvhl8YQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=pq9jV4R3; arc=fail smtp.client-ip=148.163.139.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="pq9jV4R3"
Received: from pps.filterd (m0167091.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BCimCf382452;
	Fri, 11 Sep 2026 09:52:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=2jVWy
	tfi+2Hi4y9CZzB0foR2c+yewIbq849mURYzJWo=; b=pq9jV4R38WmpizDSsa7x8
	rRxCNimHNNUI4p5OtWruFCXdIAeDPtkDvYg/XsadGefRvgya/VgHlBAwcUGR6pmo
	NszSj1TYCEvAAxzA08TXmgjOnhS7JMb/49Rea0ht8BPeRa0Q9uqyKPlAAC1OvRyR
	/9GlILSGIwZvZRlXBHGB2hQH42b48QPdWsfOHKj/jMZeeCqZYAyh23qrORjHAPtY
	g2ZwqW+4h8zjP7fpKri4C5jMPEsMsJSIAs1L989UZeYXWoDXtwuqHxXdyTZymlge
	PaBog0rouFBKOUmiWE+o9LnDaIms4iRJqEtudy4q3UZ5oWZLRbyov8YV67pL8G/b
	g==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013034.outbound.protection.outlook.com [40.93.196.34])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4gkcx97mby-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 11 Sep 2026 09:52:34 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g8o335h7MewUfrngJJQSkEUYSDHzaj67wwENYK5pxl2hxG8aEE9L+uTtZazLWwgbOOwvrdXCyKCVT1/6bYSmictq7wLjxTYYA4NzSEoItUe6Xq97mxuwYfPnOP8vdG6XZs+xjigC12AP8ehaYVQ2hQbf6EoL9+0z0C+d5VBXGLsIHdyks7Sb1ajLfQH45hRDZcmP7t99J9pAF6rduQz2avHKWi5+edzcMxtU13ISH3mJGiYq/yprrcycfLiPhPsEwEQiuF08epak7WmiaIsSN3hNnEuLE6ywxkQ/mlKiBkKkQ7aJWxX6LxxZcvVn8qMU9HMHKBa0g1kHI2GOP+E/YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2jVWytfi+2Hi4y9CZzB0foR2c+yewIbq849mURYzJWo=;
 b=AD0kPR3jFreKnaAZS9KJ7gat9cNfxmHKsTGEnrli9E/8N45dl/cU+EvUHALa2ctxf4+eNO1Jpdl7Cs7yMN09BNIHWvkwl/U21yQChxj/LXpyuOiKtu1e/Q4Cy8CkvQI2bYr3w8Q83dzTA59Do7K4xQQKnHQj1ZAxIEH1nQBx/MfVps+PaB1OZNAnllbDy5ZrV3lN7lVlowwh4YjGUWqJyv0tufCt97YKE5AWX3Fjz7h68l7Is1uziE374w5IlMxVnPODcl5amGemSfE7B7Ed4H1z9rPFzmYUpI+ZdTHYjhbV4AeRHv9iX08/aJfDpxGyQcZ+tJoS7itVaqbUekFsrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from SJ0PR03MB5469.namprd03.prod.outlook.com (2603:10b6:a03:28a::17)
 by MWHPR03MB989357.namprd03.prod.outlook.com (2603:10b6:303:2a8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.10; Fri, 11 Sep
 2026 13:52:31 +0000
Received: from SJ0PR03MB5469.namprd03.prod.outlook.com
 ([fe80::2a19:76b2:e731:8c5a]) by SJ0PR03MB5469.namprd03.prod.outlook.com
 ([fe80::2a19:76b2:e731:8c5a%6]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 13:52:31 +0000
From: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>
Date: Fri, 11 Sep 2026 14:53:38 +0100
Subject: [PATCH v2 2/4] hwmon: (pmbus/core) Add mapping function to
 pmbus_read_block_data()
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260911-hwmon-max20826-support-v2-2-5e30cbd97d84@analog.com>
References: <20260911-hwmon-max20826-support-v2-0-5e30cbd97d84@analog.com>
In-Reply-To: <20260911-hwmon-max20826-support-v2-0-5e30cbd97d84@analog.com>
To: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789134819; l=3431;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=DrOocyQcdrwqAH+WjBgXT7AKQg5lfv4MywtDtJjon1I=;
 b=0JHKmCQkz4PpTV2WWG6pZvI9vRqpWvwvt0W2g1uToKEV/7zpYWNztvGgcburXc9sCytLVhgAG
 8FW5FUoD7C4B9z1gTYmokwLIayN2cY//C9YlJhggGZ6yNcGCAxQICK2
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-ClientProxiedBy: MA2P292CA0024.ESPP292.PROD.OUTLOOK.COM (2603:10a6:250::6)
 To SJ0PR03MB5469.namprd03.prod.outlook.com (2603:10b6:a03:28a::17)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5469:EE_|MWHPR03MB989357:EE_
X-MS-Office365-Filtering-Correlation-Id: 815d78ab-ade5-4402-afda-08df100becf1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|7416014|11063799006|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	puERfEWqLB5Rac5vpI0kd5KFZeialx4pt5tsgBocDRZsYj3iGr7DqxET1YbJf+gMuqC0ZMouKJ9zfqSo8LSRd+LcNRZ+OiOc/AlfYg0XYdOobbvzU4KTRoqoP4ckTLlPTtGbMZbBYCvybA2Fb7txDH3XGHhRl3x3Qwj02bA/IrHthezi9HAebW/+/5A9hUIpYa+BQTOh2gFqh6TC3lFFYL3ViN/YikVPAXytkTVYw0ylup+sl3GGxGtdSg1laAUJMP21oXCb07lIyZ2pbLiLFph1D7BsBVO0VxsHJdmeb67JOETD7EGOhkqhk8TWKqQqOZQ2t6urJGtYva42PXy2Ckmdl6gMe9KbmskpBPyEaokYOpSC1OUt58vUEqUwpFYm851Mly1kATKBgFK8qGbkpiiA2zM22k6HA8hk0H8cRZyPFrn6I+d/FdP6YqnEfzj40pCgCH1ZRt6uoHHhqw3utOfg4CSxf3N6lIlh7RkzHmBnSM/GZvHYzh1ZRw4hvz3IMAJsiOWm+sRI6yRiuVjr6VZtJj326anXFuSeSdvke7Wf3G/kicQhOTq/u3F2M61BGseenKJMEg3IFwfbLlVdijUO5qR9SXpgUkI0JV7BuwyOvSrwY0IXgD9jRjUZW0ROTtn+t4IPWt05wqC9MItGhlr5jaLtOpkYDaPFcZLhFPk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5469.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(7416014)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TWt1RGlaRFR3Q3Q5ajFPS0RsYWpic1ByNU5ZS2NkQklUV0lTTmZxbStRSGtC?=
 =?utf-8?B?VjRGWGt4bzFEcjg1Mk1MVm9Wc202YW82RVFxT1oxM2o5YjI1S3R1WWxMcHVq?=
 =?utf-8?B?NGo1NDl0dE9TY1c2RWhCSWhuZXpiUGR4Um1MaWg5MDVsZGtXMXl2OTV3THdw?=
 =?utf-8?B?dWdXRkdpMER6YVYzMG8xMmtWNGpnUGJpZDB0cWhTaWV3anZCNVpxSHFTanBK?=
 =?utf-8?B?RTk3OTMzRUZtTHVrZ3FUREk3WU8zSUVnVHFhM2gzTm82cGxraFNIanFYZ0FN?=
 =?utf-8?B?Vnc1S1BxbGg4RFFzN0E2ck9pQXhmejZ1NGVPcXBKalJPMENJRkU0dUdkbWRo?=
 =?utf-8?B?SWFsbDJNbE5SY0paYVNYYkFZNDdFUFpPY1hXTW55UFViK2ViV0g3RlhmbndI?=
 =?utf-8?B?djFHT1llTG1uSHJ4ekRzUUlNektneFEyQUZXL2VrVnM5SXh5RWhCZm0vbjRE?=
 =?utf-8?B?MmhidWdhekw1akFUODZOczl5VUMvN216a2JuWmY5bWZPV0JtY0xWU2tra3F2?=
 =?utf-8?B?NytwRXBvWHRhNWpXS1dBL1EwWHVCblpzSDNraC9DTFJXanhBRTFlSXEwN2Nl?=
 =?utf-8?B?bDRhdUhGUm1wdGRiaFJUd25QWnJMOGpJYzU2NmoybDFtY0o3SHFPeUdSdTRB?=
 =?utf-8?B?SklrUmZ6MEExL2t2cCtLd0lhaTY2a1g4bXZBZDdlelZuQVNNN09hTnVvK0Rk?=
 =?utf-8?B?U3hnK1A5a0V6dWVsZlpwTHFxV2tHazRMRTgvR1ZmOU5SOWJleW1IRGV0ajk5?=
 =?utf-8?B?aXdhSHRUZXIvL0dBQ1kwSk5HdkY0b1BnVU1USVlkL0tESHRNcWJlVkhGbWhR?=
 =?utf-8?B?Z3p6RWJic21LMkZ4VnNwUFFEdis2em9Kd3JWMGpGSWNiSktwREpQQlF6VFF1?=
 =?utf-8?B?YVZYamQ0NU41S1BPeExRZVVtVEQ1VXJxbE5KUlNFU1F5T3czZ0FadWFVT3B6?=
 =?utf-8?B?MXVRMFZ2NXRTeXFrUmNzNkgrZ01Ka1pLMHhPcFY4eXppUUNtUjZMZVBHQllT?=
 =?utf-8?B?MHU1emlmb0Iyai9EY0dhTURzcERRZ001RVlOV3NYZHZRTHZMdmF3dk16THNq?=
 =?utf-8?B?UHE0cWIycFhKdWp4b0U4U2d3aGdwUmlja0ROaWYwTWNicU5FOExOdFAwQXhD?=
 =?utf-8?B?TnBGTDBkazR0YytFWjZ2V09HbGhNN0R6MU9TNWJxWnREd3MrRHl1SlhtNFRh?=
 =?utf-8?B?NDQwN1ZLL0dQZmZ4TWRyRlV2cDlrVnUxV3hNRmtBSkw1VHZncTd6WVBwWWZV?=
 =?utf-8?B?bEQySXErSHNsc2Jsb0dNVUlmQUZnSGFqYVBIU05VYXNDU2xRZkpmZWV6bzVG?=
 =?utf-8?B?QU9YN0hGSisya21jbTQzMTVBTnc5RDFuS1k2djlwMXphS2dkWTZ5bVJpTEM5?=
 =?utf-8?B?K2RJZStyMTR0bUgrckhOSjk3a3ZJUGs0OEZSLytCZnNSTGcwcG1teGdRMU1n?=
 =?utf-8?B?NWpVY2p3cGNEcldaRkszVUZrUkU3RkFMend2SWphbWh0YzNQL2xrajFtMlQ2?=
 =?utf-8?B?V3EwUTNTTXErN3dTc0VtK2JIeCtEUWFQTHlsTWlYWGU5a0luWUJUbVk2THkz?=
 =?utf-8?B?dGhwWkhCZWNKcTNVWWY0VDBSRVc5ZzlSQ2JGK203ZThtbTdnL3BUY25MVk1h?=
 =?utf-8?B?ZmlIZkNIOWVpUlYyODM1b08zUEpYQ3hBbXROZnd2RWU0cHhsN29vMHRVaTFN?=
 =?utf-8?B?RHkweCs1Qlc0M3pMUU9zZ1lBK3FtNlRCN0RxRWZvWXpkV1hGeTY1aWZoeUl3?=
 =?utf-8?B?YzhZTEhYKzJSUkNYME9hcHRPRmZjcXllbGF6Zi9SY00waGE5UGlvNG1vUTFI?=
 =?utf-8?B?YlVuT3RMOEpzM3UxQ1NodDBpei8zZjFoWTBqck5xKzdJUGZkMDlhTjM5QzI0?=
 =?utf-8?B?OW1hYW4xc0xJODZMQzYzRDRnZmdWN0pyRllJZ3BIZ1FLTzdpZmZQVXNOanVj?=
 =?utf-8?B?NjVqU2htMDdFZ0FlVGFHeTlIbzc4Z00xWEMxUm5waGVTWkxKRVFGc2krdG9w?=
 =?utf-8?B?NzVRUWlyeFFWS0Z2bThuK3VkNXNmTFFhVkY2UmVmSFh5WDdqdnBIVHFVZlRT?=
 =?utf-8?B?U0o5eGpaS1BqMEpOUm9VcFFMN3JQYThXVXR6dzFCSjhKL0ZXWElUMzZUK0dF?=
 =?utf-8?B?RU9CY0ZpOUNRWjZPSFNFejBxSFluRytXcHd5NDdhd09QY2RLZTJ4L1ZpUDA4?=
 =?utf-8?B?YnN1MzFFOTJsb0k0Qm15TGJrUVdTTkNySGtHbUErSUpLUVdMME5GeFpFSW5P?=
 =?utf-8?B?TTY5VjIrZ3hBU3hMbDc0V1dPT29UdnplcHJRU29MZFJRMCt1enV6ckt1RldE?=
 =?utf-8?B?S1FFZ3h5YlVXeUordzN3MC9sL3dzTHNtZko0UWN5MXFXVzVjMlBUUT09?=
X-Exchange-RoutingPolicyChecked:
	ZxTpvXrTLxerj8nlMgLx/OnUiOTn5QJeMiZvgaC1XAtzuq62aY9hSpbywFO7N6P4qocokYTpPTV60MG7CuUsJqD8HVuNuID/Wte0TfX/zykjLC3fp8l8kN8SXpQOuJQxfzmJKHs47qu7pZRMG0y7KsgWj4SUaYn86a65WAu/5/wKcwiU/u5QEyUwKG06na/09VZYD8B3De2kADEYsO3/w6q3URW2/4hCsEbVSbp/zrrZsqIYVV1JHxgUpcYbCI9Ki0xEEeHToBgwXDTWUtWCyK5TlFSwKMMH8yamLleb1uOBhAelL1jR0sVb/oDNCoxac3PN22bPl5hSi4myON2hzg==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 815d78ab-ade5-4402-afda-08df100becf1
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5469.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 13:52:31.6754
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x2MGOUoLS0+ltT2PB6615IzSyjMkjt7vuNciQ4oe540Y8RFLY0E0r7KBvDdVT1+AO3xqCZyYFrS233H0pRYC9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR03MB989357
X-Proofpoint-GUID: dzXxA6j8bEPEMpF5nR_vz3myuL_CH8O4
X-Authority-Analysis: v=2.4 cv=DPMacCNb c=1 sm=1 tr=0 ts=6aa407a3 cx=c_pps
 a=SpR4UuZ//oCsNj7RudjQzw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=ugNRTJOwpmtT476g4l8T:22
 a=gAnH3GRIAAAA:8 a=uQ-vNoSQ2MSKvHIBFvUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDE5MyBTYWx0ZWRfX1obXU4L06p6x
 kUQrCnZ/TtY/0XZnI8sPfjtGm9cnUOPbfsr986I5k8zqx4l9wRkVfOqEcDJAati2q1qHKs7sB9F
 CWwzmumJlWLBOPOmI2WgxOarTonuL4IfYlKWwCpsU4ZZdjcjdv5Y
X-Proofpoint-ORIG-GUID: dzXxA6j8bEPEMpF5nR_vz3myuL_CH8O4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDE5MyBTYWx0ZWRfXwL+DTYBsydN/
 tBmH8G0YJzvVv9S3RYzKw8WEZN+9rD9zw4AUhDb50MBcj8+WUZOhqk1x1utgyAmRXBrQotuLvwB
 oieZkwXbM2kgVJHannvbwDxEg98hD6SD9rHeOGAlXbuyCn+0z1Ay5UQeWUjFyzSQs3Ysgyv4ldq
 8RA/m0XVr891QXM2yMJDLhlzyXLu4uk6z9WdyCzwbZ+9k2K/8Sg4cwa5jWL34DCwVWFqrkjWec1
 3YNnnIZgvRVzBwInAOku1fXvT2YNUnDiilVrtQfQ8xg+IZk/bWIZVoRlfgkjbui4iutD8UPq1vO
 0gFnjjKVS+ijeZSEXe6+bvZ7yn7IQiYAib8jY20RcNrkz+l5M5tWUKCYA089K+s8HBSWE8iRA79
 K5cw8iLP0+bDar3QCri4ZiYLYMhtkCA1PPAWv5uBwaARFPkhTF3JIgnzsdoyEaz67BBxEyCY4oH
 6aGM4b51vog0MglqefA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_04,2026-09-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 phishscore=0 spamscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110193

This is in preparation for adding support to a device which needs to
use it's own read_block implementation.

The MAX20826 family is one such device. When not in PMBus page mode, each
of its two rails sits at a different I2C address, so selecting the rail
cannot be done through pmbus_set_page() and has to be handled by the
driver.

Signed-off-by: Nuno Sá <nuno.sa@analog.com>
---
 drivers/hwmon/pmbus/pmbus.h      |  7 +++++++
 drivers/hwmon/pmbus/pmbus_core.c | 24 ++++++++++++++++++++++--
 2 files changed, 29 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
index 920c1102ab6d..5525c048a810 100644
--- a/drivers/hwmon/pmbus/pmbus.h
+++ b/drivers/hwmon/pmbus/pmbus.h
@@ -461,6 +461,13 @@ struct pmbus_driver_info {
 	int (*read_byte_data)(struct i2c_client *client, int page, int reg);
 	int (*read_word_data)(struct i2c_client *client, int page, int phase,
 			      int reg);
+	/*
+	 * data_buf is at least I2C_SMBUS_BLOCK_MAX bytes long. The callback
+	 * must never return more than I2C_SMBUS_BLOCK_MAX bytes of data and
+	 * returns the number of bytes written into data_buf.
+	 */
+	int (*read_block_data)(struct i2c_client *client, int page, u8 reg,
+			       char *data_buf);
 	int (*write_byte_data)(struct i2c_client *client, int page, int reg,
 			      u8 byte);
 	int (*write_word_data)(struct i2c_client *client, int page, int reg,
diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 5f69c1420b4e..5104fd29307b 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -616,6 +616,26 @@ static int pmbus_read_block_data(struct i2c_client *client, int page, u8 reg,
 	return pmbus_read_smbus_i2c_block_data(client, reg, data_buf);
 }
 
+/*
+ * _pmbus_read_block_data() is similar to pmbus_read_block_data(), but checks if
+ * a device specific mapping function exists and calls it if necessary.
+ */
+static int _pmbus_read_block_data(struct i2c_client *client, int page, u8 reg,
+				  char *data_buf)
+{
+	struct pmbus_data *data = i2c_get_clientdata(client);
+	const struct pmbus_driver_info *info = data->info;
+	int status;
+
+	if (info->read_block_data) {
+		status = info->read_block_data(client, page, reg, data_buf);
+		if (status != -ENODATA)
+			return status;
+	}
+
+	return pmbus_read_block_data(client, page, reg, data_buf);
+}
+
 static struct pmbus_sensor *pmbus_find_sensor(struct pmbus_data *data, int page,
 					      int reg)
 {
@@ -761,7 +781,7 @@ static bool __maybe_unused pmbus_check_block_register(struct i2c_client *client,
 	struct pmbus_data *data = i2c_get_clientdata(client);
 	char data_buf[I2C_SMBUS_BLOCK_MAX + 2];
 
-	rv = pmbus_read_block_data(client, page, reg, data_buf);
+	rv = _pmbus_read_block_data(client, page, reg, data_buf);
 	if (rv >= 0 && !(data->flags & PMBUS_SKIP_STATUS_CHECK))
 		rv = pmbus_check_status_cml(client);
 	if (rv < 0 && (data->flags & PMBUS_READ_STATUS_AFTER_FAILED_CHECK))
@@ -3679,7 +3699,7 @@ static ssize_t pmbus_debugfs_block_read(struct file *file, char __user *buf,
 	char data[I2C_SMBUS_BLOCK_MAX + 2] = { 0 };
 
 	scoped_guard(pmbus_lock, client) {
-		rc = pmbus_read_block_data(client, entry->page, entry->reg, data);
+		rc = _pmbus_read_block_data(client, entry->page, entry->reg, data);
 		if (rc < 0)
 			return rc;
 	}

-- 
2.55.0

