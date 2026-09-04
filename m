Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com [148.163.143.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62DE33D6CCE;
	Fri,  4 Sep 2026 22:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.143.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788559792; cv=fail; b=JV14keUjw7qejpCmhqKiorwAcXstA9g61yz9cimNkLmu9Dhr/Yj96rIEFQ1cjOFXR8XdN0PE4NRb1nzuvexSJqlpyv6oQid+yVRetDReHbwVOvY+1OdJ3FQiLERytomqSmY4XK5COk5AKBSQAOyuBApY/qkQwvFudxkjptJuy0Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788559792; c=relaxed/simple;
	bh=3OynukwPLwPs9yxpGdCIZLCSDW9/uXpuGd2Riunp4bI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=mF5AN/rl2yz0PXMJ8iU2tvboewkyEL/wggvec0Q2XZlQO1l8VHrjFIlNDUlNbZF94NzB3HQgXow5HY76rF8R++MSwysel5l3IY2TfN5aL+2AiFJwBb11Uy1Qu/xzGrkkkRAJaoaQJPQhuPuVoBzMNqj5yrAjFC4+pDkpDXD9l4Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com; spf=pass smtp.mailfrom=hpe.com; dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b=jgs5s+T4; arc=fail smtp.client-ip=148.163.143.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b="jgs5s+T4"
Received: from pps.filterd (m0134424.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 684M2ORu2472206;
	Fri, 4 Sep 2026 22:09:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps0720; bh=3O
	ynukwPLwPs9yxpGdCIZLCSDW9/uXpuGd2Riunp4bI=; b=jgs5s+T4f57Hq2qIwD
	NZu2xg0Oa5epbgPX7XGjW/h/ry7w4sO3nHC9Sxq085N1aAGZJiLiVFwxfhsDI8o5
	/CL0zIHyBn4xgwbgro3/uZtdYoJvgK7Y6V9Ygb6ghrOKC91JB42OtqdTV0pEIn6f
	cE6aNBKi7LmqlKTXx7EmjJnZkkrLDeSPEglLTMskmBh04WhGkobZEgpxHv000xyz
	ykAKzR9T3AnhJH7W4o2z7tyA1PS5TIX8HvFHkTWIZUGlIrWxBXztL0okfbP3Is4x
	/+4wqwPKr5PFcHsZuT+Z3sDuIFYArl4pOFRNTJHU9F0yprr9vk+7zW40XlELddeK
	5FOw==
Received: from p1lg14880.it.hpe.com (p1lg14880.it.hpe.com [16.230.97.201])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4gg1b0m3j8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 04 Sep 2026 22:09:35 +0000 (GMT)
Received: from p1wg14926.americas.hpqcorp.net (unknown [10.119.18.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14880.it.hpe.com (Postfix) with ESMTPS id B30B9800EA2;
	Fri,  4 Sep 2026 22:09:33 +0000 (UTC)
Received: from p1wg14928.americas.hpqcorp.net (10.119.18.116) by
 p1wg14926.americas.hpqcorp.net (10.119.18.115) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 4 Sep 2026 10:09:05 -1200
Received: from p1wg14926.americas.hpqcorp.net (10.119.18.115) by
 p1wg14928.americas.hpqcorp.net (10.119.18.116) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 4 Sep 2026 10:09:05 -1200
Received: from P1WG14918.americas.hpqcorp.net (16.230.19.121) by
 p1wg14926.americas.hpqcorp.net (10.119.18.115) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 4 Sep 2026 10:09:05 -1200
Received: from BL0PR07CU001.outbound.protection.outlook.com (192.58.206.35) by
 edge.it.hpe.com (16.230.19.121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 4 Sep
 2026 22:09:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fz/j9r/2l0NK5WtRIo3RhKwUQ3j7pdJYCj5sYiY7lUW9Vvsb13W856v2nMgUbmQmT0FyeWWmIaQwtfmXtsRyloS3g02MWxV1Yp16AUqy/RRWDKT782o/L+lx+mWgodcq96aRy/CezEfvP7HT9VcFupWPTcvScnASk9yuJROSQL/oVHmyLqstrE4D3K0BsrX6YzuUP/OAaMnLCdr6u2aCzh1imPEYDOhY1/T3wHxEkZ9I3KUwhBKWrv81hPi/QuKy/jvkin610df2troAPQeDnuX6+y6/mZs6erUQeYIiKLBWwfMmOLOoBtNRNoSXMONF+JuILIPQF7W3ly3BwImKHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3OynukwPLwPs9yxpGdCIZLCSDW9/uXpuGd2Riunp4bI=;
 b=y2bMIKLT7wXOR0brKCIh9u5NxjwAhEio/ysCZkD8/DH+mSBDKCJD8/wlCqUlEJbXiwwrTXZUiArL5egIgLcO3iHhSmuKOg3WTXC5zlmMaBPkk7Fvt2zTdau9sxX9LD7KNQYZlbFiLtQnAVhM1RQrghzp2qpIOheeIn3tIMagc7f+eY9Qc9Ec0mqJ2/DmUugdpTnx6cgLdW3frD7sswVbPjaM+MXlrPQo2OBf6A2mo1UfAag2pcuPu5vJ7iSTxbIZOg8R5lZFUlxqdfI/R5HKiV2+0GsvupIen9O+nehXuMiy1cMWbm5wXgwsiIWCXU+HwgH4hz9wmRplukTASWxAsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:610:1cc::7)
 by DM4PR84MB2118.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:8:4d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 22:09:01 +0000
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f]) by CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f%5]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 22:09:01 +0000
From: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
To: Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>
CC: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Sanman Pradhan
	<psanman@juniper.net>
Subject: [PATCH 2/3] dt-bindings: trivial-devices: Add TI TPS536C7
Thread-Topic: [PATCH 2/3] dt-bindings: trivial-devices: Add TI TPS536C7
Thread-Index: AQHdPLn9HWmjQZUWskCSgx4j03y+xw==
Date: Fri, 4 Sep 2026 22:09:01 +0000
Message-ID: <20260904220843.495082-3-sanman.pradhan@hpe.com>
References: <20260904220843.495082-1-sanman.pradhan@hpe.com>
In-Reply-To: <20260904220843.495082-1-sanman.pradhan@hpe.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR84MB3523:EE_|DM4PR84MB2118:EE_
x-ms-office365-filtering-correlation-id: f0578fc9-5509-4898-8459-08df0ad1206b
x-ld-processed: 105b2061-b669-4b31-92ac-24d304d195dc,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|23010399003|38070700021|10067099003|56012099006|18002099003|22082099003;
x-microsoft-antispam-message-info: g0kt76qLd9xkNia1KUFpDIB/iqXC8/m0aEKuhi/k9mzDjy0f3Aisu1AQCxM7BLa5dv1suvM5NLLWigF6Xoyp/Q5gag4eoC1Cp4MlNBEY8RhCYW5NO4qoOO0oX3Ar0y4gAruQBZuWtMpaL02lksODFDLSnBurLS3fEuw0oRzTWA6b2A4VUifKhslqgeuCj1O2tS1i1tVWs8ca74AtlN9GCtmpzNlQkREXCL1zSyAQNQ6nQI/cfH213HfzC6ce6OIRSqHR0I9ZWT/wNaaZ6BRO81eb2XMY+QGPL91GyvpgjcTMsdpOEbkprnjbPH3YToYabzfAMt1bQ57JgciI594M4sYRs93cm/IUV6XB4+929p9DLBtsDkuF1GGVoay88eyArYWwm4l96qpTLXuwHjKR1N3YzVAUbHW7Xwe1HwljrkJJNOXU9B8G6YgQSxXJTiSBQB8d/LsH1Q9lUgcS0i0biw2tp4ueM3wj73Qm7u+ckZuNdyOKGk9f+fES6r0Gy1Q2D3yKPDBbN+pF4M4uulwtfiZTX/YPfS4bbkuE7mlvgAMcoLLXxj8zK3CcWZJR7ZqtZc1KZ45SdBELcbJELaPlvwRFX4M6xxs/bhIXdcNd80pwF+ILDweBqklSWqbPo5nwi+Vke2W/URjN/bVKVuO+jBJqraHX1JjeuHZd9hEF63wyJd0lIU7OJLD3FWKrRYXT0cHvGkfuMxfOx2cLOhwFIe/p5ZIAwwY8uLdDcXANZ9o=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(23010399003)(38070700021)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TmhyTG5MejBkcGxNN1RDdGRRM2p6dXl4dEZGWTA3T0RIZ1pZTGRLT3hjek94?=
 =?utf-8?B?QzZIamhBRVZSN2xjNWlEaDFLdXRHSE5aSDEzamVwK2JNRHhKWE9jdUtKVzRi?=
 =?utf-8?B?M0JDTWxDVGZyaW9XdHZlMFNRcThPNHNxZTlpQmRnOWVkYUdEOHMzNFNjQ2lm?=
 =?utf-8?B?WXpRbHVGMFJXUUVoa2M1cEp6R2ZZcWZGeWlOMjBOTTE2Rmw1VnRWNlg5Kzlt?=
 =?utf-8?B?WlFjSjA0Y3NFKzlldHgwVGNJb2p5L1BLVk93Z2IzTEZTSW1CNFRHY3dkb0RB?=
 =?utf-8?B?WXBvMVIrSEtpZ0duY3hmT25aQXJrbzlxZG1Hb1I3K25Zb0JTMFFIajA4MnBY?=
 =?utf-8?B?YmpSVjQ0RGt4anRSMVpWR05BbksvSW16a0p6OGFMS21LbzRmVkpXbkVoU0l2?=
 =?utf-8?B?MlJKWU9tZnAvTWRIVVlDVFlyMzZ2bWJlbFhZTHRKWXd6SmdQUXMrWDlvdS9z?=
 =?utf-8?B?ZDFLaDIvRTd2NWw2bG1vN2NicW43dU5tdEtjOXZFSElxVmxSSUhYdjMwNXVm?=
 =?utf-8?B?akZvc2dLakVzM2doa3plNmkyblE2b3B2N09HMHFzeUVQc2NwemdVNkxQZGdV?=
 =?utf-8?B?dkpRQTVacW8rOU9lRm8vOWdSVlRuQnBYK2FtR0RjcXBZL1NFS1FLdDM1Ujh1?=
 =?utf-8?B?TEFkL3hOWmEvNEtTemRWL2VkQ2JaamRzMFczdEpvaU1IV3RnbmVwV0tnb0lH?=
 =?utf-8?B?QUd4ejZPdWxLUHlkbHF4dE9teHZmTE5qRHJFd2ZEbVBUNEJuc1FrMFhLSTFF?=
 =?utf-8?B?aHMydlNWc015QU94UHIxc1E3aUpFZFppK1VTSndNaXFFbk93ekxsV3M2UGxl?=
 =?utf-8?B?N0IxZW83UjgrdTVJMHY2bjZjNjY0a2xjSjBZTWlTZlpOaGIvUU8xUjJKWDYw?=
 =?utf-8?B?STNWSjFNeXpiRlZ1M3h6dnUxeU5PV1dsaysxc3JiNDJEWmVkZXBMQVVCZ0g2?=
 =?utf-8?B?NkxNMkR2alVLYk8rUWhYQUk4aXVnMTB0M3duVENYL3RNOTlrZmIwWlg2UFhw?=
 =?utf-8?B?TWRNbENYTUFDaDA0Y0RacnhKZ0N6T1ZsbStBbmJ0TXI4TkF1VkY0a09zbTRJ?=
 =?utf-8?B?QlNIVnFncTdObHlPaTRQeEFlZ0Vsb3BpMDFTUldrbjJBTExNaWwvQUlYUXY1?=
 =?utf-8?B?NkM0WWU1MkRISHMwUUx6TVVFS29xV3QzVEt5N3o3YjNLcU14WnZSa0V6Ri81?=
 =?utf-8?B?aXdzck9MVnBQQkdBUGtYUTFNZXhHcHcxSnFMVVI0NThzU0N6Nyt3Vmsramxj?=
 =?utf-8?B?R245WThtdHdZSVE4NmgwMWxrWS9sNU9PYStZeHV0MXVnTWhQVTRHclJhNHhG?=
 =?utf-8?B?bUlDZ2NaT3VpTlR4dU5hQ3U5RDlST3NlZVYxSzJoUTNaTE5ROVh5WjZHL3Nn?=
 =?utf-8?B?VlNpcVdETjA4V0VwOGJhcWFCN2JWdFpORlVOb3FqekFicExMckR3MGJ1bDNV?=
 =?utf-8?B?Q1BXTEE0TTZia1NGMVBmMUpMdWk1SW0xaG93cjAyVUhHUVZtbmp2cG90V0hw?=
 =?utf-8?B?eFh3UjR6SnBZWU8vK2pmajF6VGhPOVVNR1c4MFpxM0o3SjluQW80RERPdys5?=
 =?utf-8?B?bStKS2FSdkc5YjhkazJYNkJ6R2k1ekpqVjFHaFZManlHcnk5ZVYzbXlma3NT?=
 =?utf-8?B?NFVlZTNkVlhwQ2E3cUljbmpqWmlxL2JqRFVBVEp1T1JoVUJURmFaenBnWG8r?=
 =?utf-8?B?TFVTK2c2Nm1nZWc5cWpxbjEwL3NycmZ4R25mdVNFNkdqWDcyKytXZEw4Uy94?=
 =?utf-8?B?OStlOVprNXhpTTROYWU1eitkVGxDd2xUVWJkanpzZVVvWVFHaEpUMitVbkZv?=
 =?utf-8?B?ekwzZldMQ2hLMmpZQUlObUlIR2ZDUk1hcDRtN0pLbC81eittNjVWZTZiNm9X?=
 =?utf-8?B?M3FkdFRUY2Z4S3FNT3dWazVHRjBZd2c1dXh5elZQZ3pSeGVsL0s3aWNQNnlz?=
 =?utf-8?B?ZVh6QTJ4Si9xdFZZODd0Vmc1Y3BMN0lrSjZKbzhuZThRSXdLUmZSZC9DVzFV?=
 =?utf-8?B?MXdIQ1RsM0JHWWNDU3E0WVhhc2VvR2grWDNldW1XZHJkWmo3aU5NazdFVHYy?=
 =?utf-8?B?S1JWWDd6TXVyUlZjQ2QweWJYWk11U2ZmVDFFeWpyd2o1SW1TbGI3WnpEYmEz?=
 =?utf-8?B?U0RWaFRPZVB3VGVHVmFpUVkyNmlsd0JIWit6SjQwOFZYTnJ5Y3BpM0xxRmdE?=
 =?utf-8?B?SWMwRldjaGxTcXhDYlFSYWpqb3NNcGJsQ29nc3pSMXpBemVBcDIxdi85aUdy?=
 =?utf-8?B?NlNvNlZva05DYVp0bkowT1d5U2RBRlJvdm9qaEFUTDZYNnU3bENiWTBleE9F?=
 =?utf-8?Q?lSqmo40vnhUW/hwwNq?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 0MHuJhj13SWWBHwG2hiZY1uMKDQNNhCZhBGRicJCYTmObniTdh5Shtt9Cx8PGT5P827jtzYpAJTpsiNNCKvLNN9Bh9MUG5Co7bSIMDExhycEn9qxm9OE/09IgWwJ0PrCbjb+tlURlekst+1lZQjCYShr5NngmC/D7rxJxcWGNxG0PMFkNjXNN75GGbjA6PlUgrBeSk2EQuVfc6mGuRomDMXDQ1e4n8pq4+26Vh62gFyZ1SPYvk7VQN2UE/F3+oXWc4krjwVbcYmLHPDwI+NFE5+O2z9UKiRCeqwYoLqC8sUYsC+6Kt7bidQeOT+USHAwLD+ugGFQoj6VhyYU9WfQMQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f0578fc9-5509-4898-8459-08df0ad1206b
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2026 22:09:01.8027
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fMri8L+ekQB/y80Rq8lCeqv05a+TgKoxxLoJddq4M22BwCwBKOB0C+e8V4FdIpKU3kAWRjwm45b8CtUEGmLebA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR84MB2118
X-OriginatorOrg: hpe.com
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDIwNSBTYWx0ZWRfXyfDvUQmsiSP0
 9NNQTtArSlNc0AcLvkWXlD8Q01yUrdlvaufnaJKjrzg0yFOVhmDb/hd5pWYkZOo0zw2ZYvNEXRP
 5rvhFec8vWhjxbhp7wTEPSAaIk6OdIavbDEpD9V1goKXIAQKnBwGBSX3ybi6G6kOmOiknXggea/
 SduJlxBWrClvJfTtTUd4P/Cb8Z8oMZHjqwWfAqOOmpCyW6o2/Prg/OkPXN+6qT47sWseviZdPlW
 sDFj+navwzhmBexgQmviAejzFj1yAmeGIewEQaP7N3vrZkd8A0Mr32/ly77zZ3AJn3avFZW+OLH
 TDnEGHAuxYb72w/lEHC7CRyjTjJ6elRarXHqm641LyWSggawircPApnVJi5mSokU5BGyCXtc/nk
 d3yVUd5nYWRZVtodj7E6jLgYOD57tntMJaEMLOFG9GxQi14p4uX8cZXAgG7eomw6trD41USMWvR
 0W62gjyLuGBuPUKWXOA==
X-Authority-Analysis: v=2.4 cv=Ytw/gYYX c=1 sm=1 tr=0 ts=6a9b419f cx=c_pps
 a=A+SOMQ4XYIH4HgQ50p3F5Q==:117 a=A+SOMQ4XYIH4HgQ50p3F5Q==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22 a=3haJ9R1Aw3gUfsUHDaCR:22
 a=OUXY8nFuAAAA:8 a=jfe4B9wozX6hrU8P5YcA:9 a=QEXdDO2ut3YA:10
 a=cAcMbU7R10T-QSRYIcO_:22
X-Proofpoint-GUID: _dvpem-5pihCMd-b5H2Kl-qPjt_sTSyP
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDIwNSBTYWx0ZWRfXwLpHdcKFbMsr
 RnO7TLf7AmwbvL7+HNeblmbSWe2PoTnGA/Q+F6u+YTBezVHIHsFF8aTi19euLx5wHayJn9eiJaT
 TVQFgzJ0VdOhqXNUGn1HTIR6KzIHLoE=
X-Proofpoint-ORIG-GUID: _egy5eFr-LhAHfdKhYzPoNw1SQdYtW5c
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_06,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 impostorscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040205

RnJvbTogU2FubWFuIFByYWRoYW4gPHBzYW5tYW5AanVuaXBlci5uZXQ+CgpUUFM1MzZDNyBpcyBh
IFBNQnVzLWNvbXBsaWFudCBkdWFsLWNoYW5uZWwgRC1DQVArIG11bHRpcGhhc2Ugc3RlcC1kb3du
CmNvbnRyb2xsZXIuIEFkZCBpdHMgY29tcGF0aWJsZSBzdHJpbmcuCgpTaWduZWQtb2ZmLWJ5OiBT
YW5tYW4gUHJhZGhhbiA8cHNhbm1hbkBqdW5pcGVyLm5ldD4KLS0tCiBEb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvdHJpdmlhbC1kZXZpY2VzLnlhbWwgfCAyICsrCiAxIGZpbGUgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL3RyaXZpYWwtZGV2aWNlcy55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL3RyaXZpYWwtZGV2aWNlcy55YW1sCmluZGV4IDk0ZTYzZDhhNThhZDUuLmY0
NzM5ZTA2NzcyMDMgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy90cml2aWFsLWRldmljZXMueWFtbAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvdHJpdmlhbC1kZXZpY2VzLnlhbWwKQEAgLTUzMCw2ICs1MzAsOCBAQCBwcm9wZXJ0aWVz
OgogICAgICAgICAgIC0gdGksdHBzNTM2ODUKICAgICAgICAgICAgICMgVEkgRHVhbCBjaGFubmVs
IERDQVArIG11bHRpcGhhc2UgY29udHJvbGxlciBUUFM1MzY4OAogICAgICAgICAgIC0gdGksdHBz
NTM2ODgKKyAgICAgICAgICAgICMgVEkgRHVhbCBjaGFubmVsIERDQVArIG11bHRpcGhhc2UgY29u
dHJvbGxlciBUUFM1MzZDNworICAgICAgICAgIC0gdGksdHBzNTM2YzcKICAgICAgICAgICAgICMg
VEkgREMtREMgY29udmVydGVycyBvbiBQTUJ1cwogICAgICAgICAgIC0gdGksdHBzNTQ0YjIwCiAg
ICAgICAgICAgLSB0aSx0cHM1NDRiMjUKLS0gCjIuMzQuMQoK
