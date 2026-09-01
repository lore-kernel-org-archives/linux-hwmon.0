Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com [148.163.143.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1509A1E51E0;
	Tue,  1 Sep 2026 21:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.143.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788297140; cv=fail; b=Bzo+bjQcLPogHxh8Cyf+3x3YrL4bDVt+ubVj5/H3q8xvzUfa5sDDIY/njYwhtw6cDogIQ16n+OdeDw4ZMTogBE5Z0m9liUCauDqqkemZWBNMd60uJUKRmXNi+IIgxzPvEZLfdO2uyBqmUSoUdiNCC8PKnYAhz6+VEW2w1nH8lEw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788297140; c=relaxed/simple;
	bh=lAF+pJo0ujibXJNi5UdFu90/I7dBNiLX9Lc3CC9xptk=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=fvTIEuNzQr/kMh2VJkEmdLPtBG2VHK62YFjkbCDZi0AR+f6815fph21/Tou5vvO0b6Y87dCxqTXSzTeHITIFNDl1HsSzcXfKuXkJRINYifMHvQsNHZxxihsl5nYxBmk3LAfdJrje9zDr0e1XsXAbeqlzxUjyzjp58U4vaY2+CKc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com; spf=pass smtp.mailfrom=hpe.com; dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b=NADDGxl7; arc=fail smtp.client-ip=148.163.143.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b="NADDGxl7"
Received: from pps.filterd (m0150245.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681KVqf22556317;
	Tue, 1 Sep 2026 21:11:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps0720; bh=lAF+pJo0ujibXJNi5UdFu90/
	I7dBNiLX9Lc3CC9xptk=; b=NADDGxl7G5xs1Fdl878vQzsaQkWZQm0wf+3xWqtE
	pSyRAc0JY9GD5YuW66BqpSmbU8SwWQjPdXfDBFpOMTqOtyzAb7i59SuCyr30ddW4
	jCjF44MN5zNJDh4h4GLck3bZx7XwM26WhSL2OLcCoc2Xi2dHX9Hm++5ov5a56h9J
	qBr8cpqIRjBMwH1qmzgKegY2qfoZCFDJgfYxf4MadX6hephTTtOBSeikJjgI8177
	g76gfmc+YanfLZ6cF2nnPWOQ04LdPHjHVOChyFne/OTF4rJoAZmv5DP2YZ9KWU0k
	3WlWRURL+EhpyEL2y0sWMUOd0TUprg1vw8PMVCduzmS+Yw==
Received: from p1lg14881.it.hpe.com (p1lg14881.it.hpe.com [16.230.97.202])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4ge10mmutd-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 01 Sep 2026 21:11:50 +0000 (GMT)
Received: from p1wg14923.americas.hpqcorp.net (unknown [10.119.18.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14881.it.hpe.com (Postfix) with ESMTPS id 35A7A806B2C;
	Tue,  1 Sep 2026 21:11:49 +0000 (UTC)
Received: from p1wg14925.americas.hpqcorp.net (10.119.18.114) by
 p1wg14923.americas.hpqcorp.net (10.119.18.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 1 Sep 2026 09:11:45 -1200
Received: from p1wg14921.americas.hpqcorp.net (16.230.19.124) by
 p1wg14925.americas.hpqcorp.net (10.119.18.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 1 Sep 2026 09:11:45 -1200
Received: from PH0PR07CU006.outbound.protection.outlook.com (192.58.206.38) by
 edge.it.hpe.com (16.230.19.124) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Tue, 1 Sep
 2026 09:11:44 -1200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zUPNLCfkfyXJastKCuq2AtfHGO+bRRMfm6dLPUy8FP/kOZyK70ZpK78LznvSUdNIxqh3+Q4o8JQXBT/APCnSLkGNtMFxJuG7/scHSNR3gImKG8jtUdf6qi9syStrmWjw0eZIzgTJhmj/76zMINs5miC6BVrA7Ky69TXfUOkgm2eqOatAR/F3MMKDQbI0howfTnAY7dZgG34I8G+pcS6NPTiSjrz5Dr7jKCBLk+NfFVuSV2GozEOM4qIsJ6WIMYh9CI5W0LeEtyJdpjFIzYgD1au0OVlDVasmKe2/xiO4Mw5RbTTYTFb6bl1fUCMRAoNB92XL7lrn82RFjmPGjjQ7FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lAF+pJo0ujibXJNi5UdFu90/I7dBNiLX9Lc3CC9xptk=;
 b=SqSoU2bqZN3X/JhNkHc4VF1UgJqmxjDoWzt+QNo0HPPRUAnWI/xXyjPGvw8ZBYi4DDNKdo6SUVcCFz/jEWwR76VejZNn1NYafha4yqS8r7z9DEAO14qI9MZNM0faR7mPd7yU0Lvf26JErKeifUZAwoAbpJkpY+cz5zHkr5igkoW7qgXn6rK6HiehNJx+bb6b9Z25H853zmf/mYaSFAuYHDVuq2djwAjp6cAsoBwdXfMIAeHoT66vYwqTCmv5DXNdG1S+NP/0l8shLgkUJbfXZV/10ViIHCDnCD7t2EdXDFWUKKkNF4h/TN1kBLrg7RzfG/93gcxMRKBnTZW2KErVEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:610:1cc::7)
 by DM4PR84MB1664.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:8:4b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 21:11:43 +0000
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f]) by CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f%5]) with mapi id 15.21.0360.008; Tue, 1 Sep 2026
 21:11:42 +0000
From: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Sanman Pradhan
	<psanman@juniper.net>
Subject: [PATCH 0/2] hwmon: (pmbus/tps53679) Add TPS53622 and TPS53659
Thread-Topic: [PATCH 0/2] hwmon: (pmbus/tps53679) Add TPS53622 and TPS53659
Thread-Index: AQHdOlZ84EgHOs+Cs0C1ri/ni/4OFQ==
Date: Tue, 1 Sep 2026 21:11:42 +0000
Message-ID: <20260901211129.360792-1-sanman.pradhan@hpe.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR84MB3523:EE_|DM4PR84MB1664:EE_
x-ms-office365-filtering-correlation-id: f9c41ac6-7c18-45c4-5aab-08df086d9f63
x-ld-processed: 105b2061-b669-4b31-92ac-24d304d195dc,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|23010399003|38070700021|10067099003|56012099006|18002099003;
x-microsoft-antispam-message-info: 9D+G2itsii1doltplfhLRnrOk86/H9UM0esffBsgvAB8FLYh2sKiNzYkoJ2aoJT0nyy6+Lm3QD+dVhhB04r11Nzj3LisPbHcknRHiP7raoYkshQ9wd1dxVJkcjyw5s43//6TTUH96yUeBh7YXCW4Y7m8Leo4JKimiXYFC6eq2ipTbAJahl63S0zaZE1DaUDXNlC4QAY10f7yddjAz701vLENb36+ywRj/Te0lZQoLQRmGUHOGsE04jXwxfVXgLLTXjOeiQefWJxsp33zB8QwTbtP63cXJvPgzLqvs4wfBODEMJsqDqffWcZDUKT1qdRNU9hzPxYw1sYFXcbTOuF+31Gz5Ky1fABQV62kroYRHvhS2r9i1hG+Wq8HZIOhg8ANKLTHNZSI9aad7yZgX07uPxOx9k9ZChQIYlLit7pX5YxxypSdch2+L66GaTb070mz2z5oOwN27SST25fb+iTxinzyGAyz00YH5KV/n+rtbCF3zJjZquIwEcfl/kK8j1K+yJjakOrWjqdhoaKNgSW1mdV6OIypTGiXbQ7Hrs2k0LN0U9tvGyFtNNFpL2Pn0B1dH+PiffdMGwxhfeYKqgiuTxfVCc9E1noZpmIc5MviS+Hc+oDdGmWmwYUf/M+xqzWjd0qqF+G3xiGettbCIFlxq9uuaXZHRlizp80koJTyu64bo9RY5gm2RaUUFCrrhxbX3Bu1MWDT9c4WxibBU9d2UfPm9cJcxEENXgJZZlLGtOQ=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(23010399003)(38070700021)(10067099003)(56012099006)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?REpxeTBTOEJhZWpDckZvWEpBdS8xdDVqTm1pRlBlcytQRVp2ZkE3MWJBRTVB?=
 =?utf-8?B?Yk9FTTNldEVURkdZWFROVVY1bGp0akloeWtJQWFGWU85SWVOWUFodTVrWlMz?=
 =?utf-8?B?WTEvZEdqbzdzdFJEOUFMNUlobmZuaUZUZlp3TkJRdThRT0pMd1FnUytyWWNO?=
 =?utf-8?B?dlkzOGdMTXkwYkNhTERocVJ0eXF3eUhrd2JrNTFKNFN0ZWVXdkFZdGtvYTc2?=
 =?utf-8?B?RnNVR2VhNU1WbGZabWphY3lFV0R3N1VXT2JOb0V0MXBKL09kaURJdG51YmpI?=
 =?utf-8?B?NzQ2cE9IaHRyanVjNzBLR012Um1Bdm9JN3ZDTXQxeFdxTEhNdkZlQ1RQQmwx?=
 =?utf-8?B?eVliK2NvektMY2JKS1FJeDFMd1ZEeEZQSk1Ld3hZNDRmL2NqT2hhclFwTXg4?=
 =?utf-8?B?U3Y0QVVaWVFvWDZyVmN4aXlyTHo5Q0RFYktZSE5GdXdHZTZqR1BpdHhkTE1F?=
 =?utf-8?B?SFpQUUpJQTVMc242djZmNHpnRjFMbjExbmo2R0J1WnFRc3BIQkVxRGRIQzEx?=
 =?utf-8?B?V1JSeXRRWGJJUW0yZmNwV29COVJFaFZWWlZ6SXl1ZHRuTFV1ZmZIbUpjVFBB?=
 =?utf-8?B?S2xhUVZoL2hsZHlDOFd0Ymp2dTJlQXJBMkIwN0F2amJ4ejhYYlEzUnI2U3BC?=
 =?utf-8?B?T01keS9NcFpBV0ZYb0VKTWJ4ZW1ERGQzUmNuc2dHaWZnVEFNSjZPdlhQRGxa?=
 =?utf-8?B?RjB4MllpSlZrQVBxRGxyaEpmVmZ5SnppaWNvTnZUNnJTVnp4RkExTjY3OG9V?=
 =?utf-8?B?aHRTWisrYVlFVFJJdjhmdUpQNS9XMHdIUzBIbjZ5eHlZd29Qb2xNaS80RFMz?=
 =?utf-8?B?cWFXemVkb1pSNGtYYW4zbnlENXJRTk5XWmN5b0J6a3l0Q0ZMbU5rQ01LQUl4?=
 =?utf-8?B?YVlhbW1CcnBMeFBiY2VTclNIamYveWR4SEQ0MW9VNG1iSnhYZTNYdW9kQWNY?=
 =?utf-8?B?L3RBc2ZaVXdnOHpGeGRUQjJyWkZVcThmaWlvTXVKdjVmc21TQnFqY2lYUnhF?=
 =?utf-8?B?Vm41TFFTalJpNFlraUVKSDI3N0JlUmhSZlFqOWZrTXN4K2ttdjN5dnhVelJv?=
 =?utf-8?B?WjNiUjloZTBuM2g2bFRoTXRIakpHelJzRFNvWWRwRUY3UllSNzFlUDZzRndO?=
 =?utf-8?B?RWhPTmRzcUp6VFA3cEFWRS9HTVdnSmF0dHRKQ2RoNzNBaFRkV0RYL1JVaTVr?=
 =?utf-8?B?QlQ3T21PZVlQVFBRSFcrTGo5WUZpdmJPZTZMTUZGdjRDWlZmTFRlblp0S2Jv?=
 =?utf-8?B?aUNQMDNzM08wc2NDdmhIeTh2c0RtS0E1U2ZKWGRtVjRkRmEyUTRWTVg5dkJB?=
 =?utf-8?B?b3lvZzV0dEdxNXFHUkhHK0dtOXgyZThtYUtOb3oxaDhZaVh2MG9TeUtwL0Zp?=
 =?utf-8?B?K1VTTnRxbnl3eWg5Z0pibm4zQ3FCZ09NSjNzYWNoS09yQXRnWHJZTWt2d0dE?=
 =?utf-8?B?WHA0N0ZNUVFka1NPaFYxbXJ5RXREb1BNdGU3QkhpQnI1aWt2SlA0aERSdzNM?=
 =?utf-8?B?dlJra1k0V0lKMWxpYXljVC9xenRCaXdGNmZGV3JiWC8wSUxqUFpOdXNHa25U?=
 =?utf-8?B?VkhqOThpYVJMQ3l1d0RYZGRlNjcrTGZBVFMvMFNEUThEM0dkOU9TMy9hNjBF?=
 =?utf-8?B?SGhtT2gyOHRGZXVQUFpIQzZ0bHNYZGhGWEwvUTJVeGdzdVhwOVVybEpmQnh3?=
 =?utf-8?B?clFpZFVTZTFyc2RweXM5RmZ3NUVLK0hCTE9vb2pQckt5WlZWVWM4YmxsTGc5?=
 =?utf-8?B?ek9qNGtXSk1FWWhEZ3gzWWxEKzVraW1oVW4yZGJTdXpldVI4RlFndllwREZh?=
 =?utf-8?B?TW9NTUQ0SjhxbGZWaGNqY3FydUh0QzJiK05nWUdML0hIUmdtRk56c24vZi8v?=
 =?utf-8?B?cTdabGZQYWZNSzFYU28vUUk2Rnl0OThKaEtjem8yVDlsWHh6ZUlzTis3YUU3?=
 =?utf-8?B?bzV6NzJreXU1aGpOSnpuVU1TMm5Zb2dFN1pOdlF1S0JDTlhzVm5qR0RRanEr?=
 =?utf-8?B?Z1FqbVo1Tzk5U2pHRnZCV1V5OEx3RkM5d3FvNktyR0QvV0dLeHB5dEE1OTFu?=
 =?utf-8?B?Q1VrZkVCRC8rNmdXTTJERzNkUjduZU5XRm5qaHFMWlpieFJMN3VUVThrTG5L?=
 =?utf-8?B?VEZ1OXMrb1UxZ24vZ0lCSGZYYmQvT0JtYTFteGJrbit3MGVrZk1kSlp4NHIr?=
 =?utf-8?B?bEUzKzNUZ3F1eGc1blk1U3pVcTNtK2h2YS9YK09leUgyRzJ6Z3lwVW15RW5a?=
 =?utf-8?B?OGV6dCtleCtMWTJzMXJmcVd0TThqaXV6VU9UTkkzZEpVMEN6TTljRUFMU3R2?=
 =?utf-8?B?cmU2ekZuUEJjS1JhbW1Pclg0U0ZLdWdyNlJ6cUdUenRHSGZyYUFtQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 1gfs2MXqzGbtMY0gdTRAZNgosYCnbIRaNgoyG4R/tCA7jclZYmr40Qqzt8d1kM2SMJkNid+mI727m8LLvO1nhLnwl2eNJss1RG1BPytnPh7WJiFfTXN5qiFe7sVknw60xclCBPWcB1WSiJa374JoKARUIfpVqxnoPN6FzCrkNgATF9mkf1PDL/AVVNl1KN1I4HUi4QzxgzqULtXE5gFEEZ4w74gWY7jDZKX4W25yAvMdU2pf3gpIzRgyhf17g9bPdCQ35zuqoqgBVfd6rfA63HwjUzW+Ct2TNjTDxI/zvyhLiSZt/yCmp4dsM4NkGYSxCTGBY7hcHh7HCre3y+Mzyg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f9c41ac6-7c18-45c4-5aab-08df086d9f63
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2026 21:11:42.8322
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AT2Bemap09/mIERyRunDZmF6fWzyQnh1NXEUNMi4ECbzz9AaGGUm/L/vBHHQcEFQQsyKrT8RJvVRuy0ia5R2gA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR84MB1664
X-OriginatorOrg: hpe.com
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDE4NiBTYWx0ZWRfXyBxvytcQs4d6
 0thmelSKiDDb0MaXjwUjGDnIMflNj5quK6LkMSkpaEsPPv64vclbo5KTQYK7R65TTQenevjmgRh
 LLQ9eeJYNgd88F06DXXbwJndJRmHeV2Ui05zE5UJxMnKGv/7gT7voVZDUw8BgtR84vKpvtxuj9e
 2iGN1zVISFBuue2s02OG2El6Dw3oaPlb4pfeBEOFYdYR8WFjLEmJpvdGn++ijVH9Yoq2PVB7/y/
 so2zkEo3FZNQrBUIpk5158E7IPFu+0i9v+0ALE4ZPVFNufeulSEE/8Xuz7k3inaltuqMS8sRYia
 IyeHKqaqeRwf79KJAEUFVgSiEBbOCOyR77jFiySlBHWNJ4wym4IZjsPs/ptXtaj0UPflsltgz2M
 TRxqdLaHaY2CRKtqPKnxXRv3Sqi+mIAzlvDVQMClqqn/M70YhIZkUI/GnXdJ9WEvfIrFTphcuDq
 YL/FkTFBkBSwZQmLFOQ==
X-Proofpoint-GUID: eUiYdEIfs_9pJDNW1iuRi7AQ1M28WliP
X-Authority-Analysis: v=2.4 cv=GKI41ONK c=1 sm=1 tr=0 ts=6a973f96 cx=c_pps
 a=FAnPgvRYq/vnBSvlTDCQOQ==:117 a=FAnPgvRYq/vnBSvlTDCQOQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22 a=6XKncaru_qjgLvANlS_8:22
 a=OUXY8nFuAAAA:8 a=NFYajKSO5jdy0drRDyoA:9 a=QEXdDO2ut3YA:10
 a=cAcMbU7R10T-QSRYIcO_:22
X-Proofpoint-ORIG-GUID: H7MQCTWu2gWjeGgHJNfL_7yf09oL4XMO
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDE4NiBTYWx0ZWRfXzs4xVsS/Jr67
 wpZ5rq7vGWD7qQbb28j62IVkw252P23U15M5g69D9vbTi0AR2aixbtWWeJrsunWfYkvCuB5MRgc
 P2KjL7AjvJ7iXkNhiFMOoMGo4OjPW/0=
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_06,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010186

RnJvbTogU2FubWFuIFByYWRoYW4gPHBzYW5tYW5AanVuaXBlci5uZXQ+CgpUUFM1MzYyMiBhbmQg
VFBTNTM2NTkgYXJlIFRJIGR1YWwtY2hhbm5lbCBELUNBUCsgc3RlcC1kb3duIGNvbnRyb2xsZXJz
CnRoYXQgdXNlIHRoZSBWSUQgVk9VVCBmb3JtYXQgYW5kIFZPVVRfTU9ERSBpZGVudGlmaWNhdGlv
biBsaWtlIHRoZQphbHJlYWR5LXN1cHBvcnRlZCBUUFM1MzY3OS9UUFM1MzY4OCwgc28gdGhleSBy
ZXVzZSB0cHM1MzY3OV9pZGVudGlmeSgpLgoKUGF0Y2ggMSBhZGRzIHRoZSBjb21wYXRpYmxlIHN0
cmluZ3M7IHBhdGNoIDIgYWRkcyB0aGUgY2hpcCBJRHMsIHNob3J0ZW5zCnRoZSBLY29uZmlnIHBy
b21wdCB0byB0aGUgZmFtaWx5IG5hbWUgKGFuZCBsaXN0cyB0aGUgYWxyZWFkeS1zdXBwb3J0ZWQK
VFBTNTM2ODUsIHByZXZpb3VzbHkgbWlzc2luZyBmcm9tIGl0KSwgdXBkYXRlcyB0aGUgZHJpdmVy
IGRvY3VtZW50YXRpb24KYW5kIGZpeGVzIGFuIGV4aXN0aW5nICJUUFM1MzU4OCIgdHlwbyBpbiB0
aGUgYXR0cmlidXRlIHRhYmxlcy4KClRlc3RlZCBvbiBKdW5pcGVyIGhhcmR3YXJlLgoKU2FubWFu
IFByYWRoYW4gKDIpOgogIGR0LWJpbmRpbmdzOiB0cml2aWFsLWRldmljZXM6IEFkZCBUSSBUUFM1
MzYyMiBhbmQgVFBTNTM2NTkKICBod21vbjogKHBtYnVzL3RwczUzNjc5KSBBZGQgc3VwcG9ydCBm
b3IgVFBTNTM2MjIgYW5kIFRQUzUzNjU5CgogLi4uL2RldmljZXRyZWUvYmluZGluZ3MvdHJpdmlh
bC1kZXZpY2VzLnlhbWwgIHwgIDQgKysrKwogRG9jdW1lbnRhdGlvbi9od21vbi90cHM1MzY3OS5y
c3QgICAgICAgICAgICAgIHwgMjQgKysrKysrKysrKysrKysrLS0tLQogZHJpdmVycy9od21vbi9w
bWJ1cy9LY29uZmlnICAgICAgICAgICAgICAgICAgIHwgIDUgKystLQogZHJpdmVycy9od21vbi9w
bWJ1cy90cHM1MzY3OS5jICAgICAgICAgICAgICAgIHwgIDkgKysrKysrLQogNCBmaWxlcyBjaGFu
Z2VkLCAzNSBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQoKCmJhc2UtY29tbWl0OiA0MGM5
ZjAxMzQ3YWQ5NGExZjkzNDYzMTMyMjZkNzg4YWZjZjEzNjZiCi0tIAoyLjM0LjEKCg==
