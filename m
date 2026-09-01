Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com [148.163.147.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E6E637FF6A;
	Tue,  1 Sep 2026 21:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.147.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788297148; cv=fail; b=T2CKSFpKsT3HFtha5INrZGhcQswZy6WaRI/0tbDEHdm3604uDiOTHCqbiF951w8DeMMJxbdmZ0/jCffveiUvlQEWf3Z0LRn513cfQcRx+2kwwqw7QK+adrDjEdUIor1gr80aDhNRbfI7zsdoExkXH73sKEd0mPrIXyvE42zUxMc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788297148; c=relaxed/simple;
	bh=SYwVgme1SWfUpc2rq8u9KyFq17MOVNgpf6H8w7DqCCE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=iL0c+Lo1no0O18bOfq4URqWyKTUbw3nE55e0EjZ85b7QgxsREb/XrI7eaaFmsQlIMUi2s+Ig8ycF+mWIDm+7753XjDutZvP0dQA8r+65swbcqE4qEdtR54bzugLFrSRAGMW2akTs61/D2RMMLyPw0ByKmuspjRtLzCIIxT9sbxE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com; spf=pass smtp.mailfrom=hpe.com; dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b=VCUfrXqE; arc=fail smtp.client-ip=148.163.147.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b="VCUfrXqE"
Received: from pps.filterd (m0150241.ppops.net [127.0.0.1])
	by mx0a-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681Ka3Hp165419;
	Tue, 1 Sep 2026 21:12:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps0720; bh=SY
	wVgme1SWfUpc2rq8u9KyFq17MOVNgpf6H8w7DqCCE=; b=VCUfrXqEsriJv/7hEy
	3mZeQ/5moKp4UpmPfMtNoIwp9y4Yeu4XlSR3OKU1VTO76Fv8zb2tgIksX1AtFJh2
	16J9uqqKMOLeB+AHAC1+SfO6GtZiwZy+azmldYd2fmo07YaLKo3OxeUN1/lyBB1H
	lWufyVlHOXjTmUb8SqsPY31f1VGOyV8wkjrGWYjANx7lT+HVGSajCEBfEx68tLvc
	5pwjjxzO6uEQWA5wzIJWq8j3xS978rKaCvkj3RgccAmFTh+hk/tfCC3ss9pfiFhL
	krMsrW684WSmeLIQm+xgDSsB8dEaNFc3A1a4MIC0kKPhdOe2urXLV0aQMUaxp7D+
	13VQ==
Received: from p1lg14879.it.hpe.com (p1lg14879.it.hpe.com [16.230.97.200])
	by mx0a-002e3701.pphosted.com (PPS) with ESMTPS id 4ge5930w0t-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 01 Sep 2026 21:12:01 +0000 (GMT)
Received: from p1wg14925.americas.hpqcorp.net (unknown [10.119.18.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14879.it.hpe.com (Postfix) with ESMTPS id 394FF12B6A;
	Tue,  1 Sep 2026 21:12:01 +0000 (UTC)
Received: from p1wg14927.americas.hpqcorp.net (10.119.18.117) by
 p1wg14925.americas.hpqcorp.net (10.119.18.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 1 Sep 2026 09:11:50 -1200
Received: from p1wg14921.americas.hpqcorp.net (16.230.19.124) by
 p1wg14927.americas.hpqcorp.net (10.119.18.117) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 1 Sep 2026 09:11:50 -1200
Received: from PH0PR07CU006.outbound.protection.outlook.com (192.58.206.35) by
 edge.it.hpe.com (16.230.19.124) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Tue, 1 Sep
 2026 09:11:49 -1200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KbP1z7gSwRpBqUWGxOKKWxaAkqA4MCshIUMXFPyPpwaqCZ3pULdsOG5EaW7JLkeY27RWEYOseQcvq1wNr0cRJCGZDtSZnxQZ3VWNrBAAjPJMcHwNOCfYSQhLh95+D7SjFIG98M8ICGON4oQi35prxivLbI38VbyVHjlkPYRBqnwl9CcYHTFG2jc/aCsu60D3wzaI83oeU7PoAZYgwd8kRBoMJIkNGv3Mkszwby8cIYfNIQD9DRmBrnFjK859aH2jbPoCBHTtU8JYTARUdBj3zr/r0ujVFJJ65UTppTI30f51dhm7IQh48SGNLbt30m1MXIqNPO3em4Polyw4cuE+ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SYwVgme1SWfUpc2rq8u9KyFq17MOVNgpf6H8w7DqCCE=;
 b=n3gJm2jzmd54gQBoiu7HRjCnSc0/9oKK374aKpY7GK2PCQ5NK0XAnJzrzqIHv9VmDHWhTM2pfU4A7qa3jKW4ZQ20c28NuxE6oDzrLRU5qYFHZ/xWc5hFGY1oCMUSZ+HPtmteqXbKXPHxS4/OLTH9LiJ1xlqZvX6/uQMQtBR3/LuCAx92mpKMhbsJkHVsZ7rjdUjOSPu/sSueSyngiKi5Of7j9nIK8vfXFb4C4fT90Goj9yr2z0r9XqgwoYlYfUclt70AW4zIv2H5Jk50OgfCWXHa+/GXkY5AbA8M/kVf5HuF6TncnGxQGnrRAIdSCBxG5sR3xcFpsIHtg1DF372zuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:610:1cc::7)
 by DM4PR84MB1664.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:8:4b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 21:11:48 +0000
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f]) by CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f%5]) with mapi id 15.21.0360.008; Tue, 1 Sep 2026
 21:11:48 +0000
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
Subject: [PATCH 1/2] dt-bindings: trivial-devices: Add TI TPS53622 and
 TPS53659
Thread-Topic: [PATCH 1/2] dt-bindings: trivial-devices: Add TI TPS53622 and
 TPS53659
Thread-Index: AQHdOlaAwwrL/ejnRk2heG69YbAECQ==
Date: Tue, 1 Sep 2026 21:11:48 +0000
Message-ID: <20260901211129.360792-2-sanman.pradhan@hpe.com>
References: <20260901211129.360792-1-sanman.pradhan@hpe.com>
In-Reply-To: <20260901211129.360792-1-sanman.pradhan@hpe.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR84MB3523:EE_|DM4PR84MB1664:EE_
x-ms-office365-filtering-correlation-id: 2bbb4bfc-8498-467d-dba3-08df086da2a8
x-ld-processed: 105b2061-b669-4b31-92ac-24d304d195dc,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|23010399003|38070700021|10067099003|56012099006|22082099003|18002099003;
x-microsoft-antispam-message-info: CRAFoRw+HbO6dniAlQnxVyYyAt6SLsiiBMEySO9geUtpzhYDUMTDI5xrZBmm9NVAhPHZ06X00hSZKtZL70khqYvdFDcyDbi2ihPxnMUMG5Q/YGGLkq0RFyu9zYEDUPl6l0uPHQicPHFaO/++wCFp/oO6aW/E81E/U8JfJkUOu7pQZa6tX1OV8Fe2s+JwgL5PQyVoAB9XOhG3wGP4pSMjO/lS1rlmI9ALOvs4MM23pMO85OnytY0OHQSSNFC0ThCd5OU2NYBmiy+vXcTzcZLB47QA6Cgqe+AFtn2tWKUpu81jsObii3//Xaaq14+03TaBszh358G8juYr5olAUZWWF7Gpe6cyZyJ1K/3LsDKiWQ6PnUgJd/bRbx+Yhj8bgwOrNEAIN8UILpFxPcgd56jZBeUsbqphO8x4K1Tp8kur0k4czXtgucKTBWcNid4c62JafQxBZss/O/cw2KBLinZPyH4tDzmjtCF5ztb/Ocpg1muAJVWuksoZGLRUJUNL7bwJ95LmxBsgefN3hb293dDfzqktStgrLopgg8t9INcH4L/SSue7wZFm/LTZXevlAH09ZLH424yYa7pu/BycPYUCArcLq//E7awZDMPbCyucSZAmaV2fcA71A8EuVAhrqzJHVnAYtYrILWS4b07yTt4S8I7XeOt7z9JPkF3r4lb077mPDV4U1yBEPs6be08H1nWovUh5vHQAY/Z8gkzkjsnc0b2jWwg63pgilWUD6tRM0/4=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(23010399003)(38070700021)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RTFXNGNxWXIrbEdhUy80L0ZkM0IyQkNndGxNbGR5RXh0MmRjUWgzdVdIbXJX?=
 =?utf-8?B?K0wvaXBCRlU0bldOazBvSWhtZ0t3RVhSTEhXL1hZa0VyUWJXNDR0dTNxazBr?=
 =?utf-8?B?NGlnekh5YVc5NWhUblVYc3lYWFkwbjBaTkRsNmxnSVBQNnJQQTFJOTN3aWFj?=
 =?utf-8?B?aDVIYVlSTzBzZEMyOTlLUDJGaldHTHJ1TnRzbXVVckd3VkppY0VGNjJXU0hT?=
 =?utf-8?B?RkR1aVl6aFpVbHBFMzJ3dldFZmNDeC9uTzN3OUF3YWlxNC9OK1dFVUlOMTZ3?=
 =?utf-8?B?WFkvLzN2ZXhtN3B6NWxLTmlrT3JPWHNRV0RiZzRES2prclpabGsrM3BpYnZF?=
 =?utf-8?B?VkRTVW1KUWtZeVVUQ1RhYmtCMTd2RHh2Mk1mY3g0RXk4cWlDZEN1cHgwYlFR?=
 =?utf-8?B?QmxsYkRQSVVNQkw2SVpSOTdRR1UyYTI0Q0drRktyL245UHpsRW5OZERKS014?=
 =?utf-8?B?UytPV1JodWpqVXdZVTNXK21TMUR1Wm5Qa3VqTHYvU2FZQ3cxS0FXNCtxb0ps?=
 =?utf-8?B?Um9ZSTE3S1Z6UnRCcG9BbmduMFRLeGxOSVl0NlVXb2ZGQmxmR1o2SVhIUUwv?=
 =?utf-8?B?TDhUVHVpSHRpMi9vVEFDdkRsOEZxdkFFbWRKVitwWlNncUhkSFhPUmNhelhK?=
 =?utf-8?B?R2ZkSFhublFGWFVvUHQ2VVJSVlo0N3ZIblIwM09GL1BVR1RQUVZaVjQzekp1?=
 =?utf-8?B?UWR3Nk03eURKQXQ2akxRNkhhQm9HRUIxZU41cjR6a29iWE1UZnI3Y2ZiNmds?=
 =?utf-8?B?TVhFYWhKOTZxL2FxNnlWc1Y5clQveUloRU1udkFyeGRYUVpKbHh2TGRGMkEx?=
 =?utf-8?B?TGRVS0ZLUXQ4bUp3R3ZWd2Z6NnM3R1lJcXcxTENPbU1XZW1FOE5BRkJnbmhm?=
 =?utf-8?B?UjNkcjFwNk5Lb255YmtwK0daaEIzd09iZDVOUkNEUG5CKzQxQW5lc21EaFVv?=
 =?utf-8?B?UXY3VlhvZENzcWtNSjZic0VUd0dEcUZXcGtIbzU2enZrOFlxRXlYZi9xMFNM?=
 =?utf-8?B?OHFHZnJWNnRwQ0pzTGUwTElvOHllenpXKzIvWkRIdHJLREdJRENmM3l4b3JN?=
 =?utf-8?B?clUrcmtGTm8rZE5IMSszbytJb3c4TzNqSWZHdmZWRVE4emRYMlBRVHFqT3RB?=
 =?utf-8?B?WE9XSjVvUkRDZnd3RmVuc3lmemFpU1QydHR4UXVER3BGMHNPRitCZVJCVVhD?=
 =?utf-8?B?U1V1VGQzZk1iVWJGQW5KMDRxdG1uaVN6blI0Qmx3cS9EMjhKQ0owZStZZkJy?=
 =?utf-8?B?QU1YOWRCRVJKUks3ZDFCOVlUZWlGZ1RtYkhIUlNIeWkwT3lLQlNmbEc5djd2?=
 =?utf-8?B?cGc1YlhsWGg5YjFJMzJ6VWtSaE1NWlBOUEtScmROMjBCSjc3VC9iekRjSlNi?=
 =?utf-8?B?WUJQZ1RNSHFZMy84YkNFeG15SDJrbUVYQjV6ZWxqcFpNL0p4UDNMZ1VlRGFB?=
 =?utf-8?B?S2MvZG9VK1hsaDYxd25rSnl4R0JDcENud2phaklEVStsTVNDbXVpRlN6dFpp?=
 =?utf-8?B?UHJRcnI5dlR4OVN4MDYxUDZXdVoxR3M3WEIyOWFHR0FTemorM09paitKN1BG?=
 =?utf-8?B?TnM0c0krWHgyWmpsMzBaV21ldEErcGV4MjNMdytSYUdhWTVrRFlvdFRJTzlw?=
 =?utf-8?B?QlQ2OUFnYTR3VGhvTER5WUdRaGlScFora3dkQnBmV3B4anVLNzMyNkdDem9j?=
 =?utf-8?B?WXVVcXc5NGlxa29JSWhMeFZqcm1ObkVxQVRDMGtXaEFDTzBxSHR6TWk5OTlY?=
 =?utf-8?B?eHdWVnQwelZueDd6MFA5ZENnUDY3azIySWgraGx2THNGUE9tTnJGYlJGQjhQ?=
 =?utf-8?B?VmtTUVZsL1IzVzZvMVYzM05wWkUyeXJWRXcxeXlpQi9IYjhaQ2M0QlJtMFZq?=
 =?utf-8?B?WTM4dU5LVU0vTUMvaXlaakNGc1hVVmhFQTRiK0R6Kzh6RGl1STlIWTRrWUpn?=
 =?utf-8?B?SGU2dFZ0TXVNalVkamRJaERjVEVtdFl2cGMzYnhpU2wzaU11SEhZZUhVeUlY?=
 =?utf-8?B?SlEvL0M2UGs1QzlSSnBBOHVEOThLQzdBaG50Zyt5STNWcEo0VHBTUVNQMmI2?=
 =?utf-8?B?aUwyOWF3cVRNckhnd2YrTm1uMlgxQng4YngvaWJ2NFdYRmJpTmtEY2ZVM2RV?=
 =?utf-8?B?V1IydUtqSnlDVjN5eGhjZ2NZZ082WDFUS21kK1cydXhiSVZlbDdPUXp1bTVE?=
 =?utf-8?B?d2JWQWlwd3haUGlvUERTYi9Ta3BqM3pKY2RNelJoeHBmLzNQT2ZGcGExMHdU?=
 =?utf-8?B?UEE4eG03Vzd0MDVrRXJQY3B3dXlZV1FwRjVBQ2M3NWwweXY3eVhKSndlcHhx?=
 =?utf-8?B?MHhCZ2dwM3FxMXF5eTQzamVMMnJua0Q0UDdjcFJSZ0xBdktKem9QUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: gSGTxXBSw7E6QwyPLzKOul3dPE1zCvB00j84iYRY2jCkXsRJLmaQxxTjsBnHIHKW+aa5OqZvyGGpbF3S6e8NfL6aHVh12MhryF/M4U23X+4cbjPUAX88qgwl9y5IdFjlVp3EptR6ocPUt0jIFWHdv37lFs5uBp3w94QET/u3B+EoxNDdgcm5N36dO5WqzNJhLSA3y47d5j/se8tG37oL4wUFGfVZxJx4UllX2NE8nGIZ5QF0qBM46HPTeDK+EwjdJCTQ7eojAG0i34IlPo7zk+x2kHklilyifO2b3Yavl+4JEGh2O9vqKHfXWTZp5Q2FOpkfz6gawX6/gpduy5PFhQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bbb4bfc-8498-467d-dba3-08df086da2a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2026 21:11:48.2703
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8UG1+mo8Q9dznpDkHXQr8gUy0gArG6+/R5StKqIZcLLtcgyVEYYv/czAZCPDJh03Z9eY/J6JCm2l9xg2h9q6lQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR84MB1664
X-OriginatorOrg: hpe.com
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDE4NiBTYWx0ZWRfX4y2ekdvqIFyt
 uGHBYay27cOscFi8WpidWi2j9MlpAY8W7ghD/0SNP0TwTZgyf8zVMbIu5O1hD4QdenkiOnLhcSH
 2YRdbPOQc8hn92DN/fu4obuyc21E2iw=
X-Proofpoint-ORIG-GUID: ahEsSXNKz2NrqOJX9ne4xTt8SYWoS6pF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDE4NiBTYWx0ZWRfX0qN0oOra4xpM
 ON8AeibBtAqNfdZnXrUsY+DDiYxntaforHKdUJhFYrMRWP7mJaCzPhktf9nd8hFhnaITx4SPjVT
 pt07NW8c1RCNJ3vx6xinyaE6+Ee5QlwG1jTNpx358qkzu3CSi1fNjR7IFDeVR9J0STvBpN5q30G
 MoBMgfRrwMRpp0iVa5DcbAyCQAq+TZtsZlajSTH5ghKG3Z277oo4j3bzS2tCcarVEzdAb79QKda
 lv7WbtC+v1sZrNlbnItt5d3f4du7ajiXWV7BtUqdf2F/nUleJZknQr3pxlnIlD0wwbtTHE4zScA
 lv6mTT9v+jcREiUk9t2XrV66ScW2pHCz/UQdiUHZHb94+sM2jXyCAwIm8P1davst05KbkxuZqzx
 aqXJ/24tHxNhIfVzLI6Uir8II1NCCfsH27+jt8u7dBnO0FF9MP+4zcPe2lM29fVn2sHkSwAfVrv
 YBJIxlRkjrHh0Ruo8lQ==
X-Authority-Analysis: v=2.4 cv=Zbgt8MVA c=1 sm=1 tr=0 ts=6a973fa2 cx=c_pps
 a=5jkVtQsCUlC8zk5UhkBgHg==:117 a=5jkVtQsCUlC8zk5UhkBgHg==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22 a=_ZmgHqWwjZUDpi_pur5s:22
 a=OUXY8nFuAAAA:8 a=nx83eMxLe2ePa5QGLjsA:9 a=QEXdDO2ut3YA:10
 a=cAcMbU7R10T-QSRYIcO_:22
X-Proofpoint-GUID: YkNjhaH4dtryrpxqkCClccIKQKlLZRjs
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_06,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010186

RnJvbTogU2FubWFuIFByYWRoYW4gPHBzYW5tYW5AanVuaXBlci5uZXQ+CgpUUFM1MzYyMiBhbmQg
VFBTNTM2NTkgYXJlIFBNQnVzLWNvbXBsaWFudCBELUNBUCsgbXVsdGlwaGFzZSBzdGVwLWRvd24K
Y29udHJvbGxlcnMuIEFkZCB0aGVpciBjb21wYXRpYmxlIHN0cmluZ3MuCgpTaWduZWQtb2ZmLWJ5
OiBTYW5tYW4gUHJhZGhhbiA8cHNhbm1hbkBqdW5pcGVyLm5ldD4KLS0tCiBEb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvdHJpdmlhbC1kZXZpY2VzLnlhbWwgfCA0ICsrKysKIDEgZmls
ZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvdHJpdmlhbC1kZXZpY2VzLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvdHJpdmlhbC1kZXZpY2VzLnlhbWwKaW5kZXggNjIyOWE2NTE2MzAy
Li45NGU2M2Q4YTU4YWQgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy90cml2aWFsLWRldmljZXMueWFtbAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvdHJpdmlhbC1kZXZpY2VzLnlhbWwKQEAgLTUxMiw4ICs1MTIsMTIgQEAgcHJvcGVy
dGllczoKICAgICAgICAgICAtIHRpLHRtcDEyNQogICAgICAgICAgICAgIyBUSSBEQy1EQyBjb252
ZXJ0ZXIgb24gUE1CdXMKICAgICAgICAgICAtIHRpLHRwczQwNDAwCisgICAgICAgICAgICAjIFRJ
IER1YWwgY2hhbm5lbCBEQ0FQKyBtdWx0aXBoYXNlIGNvbnRyb2xsZXIgVFBTNTM2MjIKKyAgICAg
ICAgICAtIHRpLHRwczUzNjIyCiAgICAgICAgICAgICAjIFRJIERDQVArIG11bHRpcGhhc2UgY29u
dHJvbGxlcgogICAgICAgICAgIC0gdGksdHBzNTM2NDcKKyAgICAgICAgICAgICMgVEkgRHVhbCBj
aGFubmVsIERDQVArIG11bHRpcGhhc2UgY29udHJvbGxlciBUUFM1MzY1OQorICAgICAgICAgIC0g
dGksdHBzNTM2NTkKICAgICAgICAgICAgICMgVEkgRENBUCsgbXVsdGlwaGFzZSBjb250cm9sbGVy
CiAgICAgICAgICAgLSB0aSx0cHM1MzY2NwogICAgICAgICAgICAgIyBUSSBEdWFsIGNoYW5uZWwg
RENBUCsgbXVsdGlwaGFzZSBjb250cm9sbGVyIFRQUzUzNjc2IHdpdGggQVZTQnVzCi0tIAoyLjM0
LjEKCg==
