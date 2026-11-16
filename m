Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.139.77
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794791389;
	b=Nhy87zVtpCXgCWzuinD/goqfARwIgZ4wpSWmWvHlwwkRN2cxgbLA4pYZFWlFdHMmvddb
	 RxKaQ4HuIGXA+CEpAru5L+vuTfJq71Og7Vw+CyPB1MYlnuYuU42Pf3qHF++RnSj+uIrj+
	 JeVOjHI9/kM2OlCB1PTm5DjfwOX1lRBj1elc4OupuIZ8lQVIHnKDFFD0sspebGfgWhmvF
	 r8vMI3xvxB0CJBjLcdxlwc0Y0fEyS6vKEba9ImhkNSgEKJdBotSCbEJ1sE/bKz0W5tSHQ
	 8hqc4qciAg1rc02SIwk2YF7D4BwQhkYZxl12glwgDW244k2Grkiuo4eWz16I5CCJoEA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794791389;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Received:
	 Received:Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:
	 Message-ID:References:In-Reply-To:Accept-Language:Content-Language:
	 X-MS-Has-Attach:X-MS-TNEF-Correlator:x-ms-publictraffictype:
	 x-ms-traffictypediagnostic:x-ms-office365-filtering-correlation-id:
	 x-ms-exchange-senderadcheck:x-ms-exchange-antispam-relay:
	 x-microsoft-antispam:x-microsoft-antispam-message-info:
	 x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:
	 X-Exchange-RoutingPolicyChecked:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=LT0O0N0wi7DqcSdJaLZlpQruhz1UUjbu6hPv3N62iZE=;
	b=rXhQtCOMvUDIho/R8Az4tNfNDbXp4v2sW55HyvC8rlZOHHVxFH7CKhw+b2zWnetFbl8L
	 PGT+Gofx/4hkHhiqrkWmEYJ8jrU92TY9Kxy8hYQcatyzvhynBtVKkxoGsQSrlm63b539b
	 r9IigKg7u0IYnnLmR73zy7cgVEJIVdC70L8runHY8/BhMlRIO8wH0QDc8jAjR0PeV5Hoj
	 /FBpEbwujQ0xpM6Ay7Uws+0rzFkesSUxmwfe6cG4/rL3CU2Nj1LWQxq7DNRr1ymkVM1WJ
	 VLWqyndqtgDHD1CG+j3saxBmhIczRGsyqXJR4tsUemgHDI3ijRhDWgjyk0k2WlIJ8pg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=analog.com;
	spf=pass smtp.mailfrom=analog.com;
	dkim=pass header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b="DA/YjetD";
	dkim=pass header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b="DVIBm+N/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.139.77
Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E65C2606A323;
	Mon, 16 Nov 2026 01:09:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E65C2606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=DA/YjetD;
	dkim=pass (2048-bit key, unprotected) header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=DVIBm+N/
Received: from pps.filterd (m0375854.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AFLn34a3644886;
	Sun, 15 Nov 2026 20:09:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vtelectron.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	DKIM; bh=LT0O0N0wi7DqcSdJaLZlpQruhz1UUjbu6hPv3N62iZE=; b=DA/Yjet
	Ddff/xqY2WihOiJw8Udf8CZdfT8ukDLlMQCO9AJcqXCz+GYuL3LqQoTPo6TE8TpL
	Z7osUtQI+qyYCMuwLmi+UYjrmVX7vPqoihwL8A8uSzQeGgNIFm5cK66iq0tuf6/j
	fbJjjlHgLJLM0jmn2NbUSv49WZ+ufmiAJuiXGwXNVhfYO6wndoZZiSZqs1dZGAgC
	7fuVukJu9zEU0A1Mm9KlD/l+xssBqqcb0OqC2wHxbR9xmR6e3wYbPpQoIxZCv/WS
	rG1ScGdX9MaDvTxuONShLa/IJFa7pmJe/vOSuAbJshukL4AH1HGRWItW7McX+jd0
	fPPmvKbe2A0k/TQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=LT0O0
	N0wi7DqcSdJaLZlpQruhz1UUjbu6hPv3N62iZE=; b=DVIBm+N/tqG6s79rVuzQE
	dQw2R5D/l5l1CtyNQ+ggMgs+0K31apn6ICY/N+6Z8poLyl2GtbNmYjBWYywmlE1y
	ZVM3zK8YlWvm7lHcqtX0DWapbvygUbuBS0u+lcxSaxZ4a/fG0QWUU0Gn8Y2Qi8Nj
	nlrx2zHO4FW5fMg73g3GNAaa5NvIy9fK0myNfUWBCmo5Gc2uBtX1fOKbRcnocIvV
	ntiu2MgvPNUy49GAnvPpzL4lgkkm9YrAkE7KlCW75Dl5anoZeuYc4Y7zYqfewiob
	sYsAelvcymjI/+3pEoQrL+GeF6w2dLswl+rR97Kj+nRsyqRe6dFFK4rTKNEDne92
	w==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013020.outbound.protection.outlook.com [40.93.196.20])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4hyajkjv8q-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 15 Nov 2026 20:09:10 -0500 (EST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SJv8nfJTP5+9wrC/2Wcf5OlR2mHVHYvyfqmcppMvHlDpJW3niq3EJvglRi1GOmfkPnHYxgglt1Q/wrYeRiQkPmfbw1oJxhAvFoYqQkD/XTx/UNv1Dx/Lm5yHYHQ4IAQIo1s3CMNIMC/9GzhbNO3gGCIh0vfehYdrqp88QLfEZmZqj/5UIKTvZIwAhJtDcXWcHlC8uSZNeBdid0aKrNOypBY/UkquvwLO0tmX+dCz+ShlA1TcUz6wPncmkg2Wcdks2zz9yxn/yhrGg3Il0bRS1nP7BNLggvj1X51dI/zd4xrKtkEiITucOD2wt7OR6BjkbGWKDWonu3zJA9zBxkd3Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LT0O0N0wi7DqcSdJaLZlpQruhz1UUjbu6hPv3N62iZE=;
 b=SlUCcSIZnGDu6FDy4GCk352s/t3Nf6miNUJ5bcX6eKJq9jWYH9mffv65ORgcEt6chkeX9FZm72Le8KYUZBtOrbY4UKf1jutNDqY22nwjf3SYDEn0/vcMc4g6kNSmmiEo6EtCFOHZYkGcklD4cS/3qYmiCv5ZGXBG9Uv5kB9Gcm30q8QslVN019lNAkV6+TepIUGnbvvOXqJY1/RfbJlrCZ3P/XcVFlFJh8d6nwxf6IyV2x0mkUvN81adiEURGtzh0Ar5iBdgboHM+6qqlZgw/lu2YO2mqymiIz2GkJrPAInJCki7t04AOqMvpHR29EJ9ZAihRhOcsS7UUFpwDJ96lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from PH0PR03MB6351.namprd03.prod.outlook.com (2603:10b6:510:ab::18)
 by BN8PR03MB5009.namprd03.prod.outlook.com (2603:10b6:408:d7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 01:09:05 +0000
Received: from PH0PR03MB6351.namprd03.prod.outlook.com
 ([fe80::1578:4572:29b5:2442]) by PH0PR03MB6351.namprd03.prod.outlook.com
 ([fe80::1578:4572:29b5:2442%5]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 01:09:03 +0000
From: "Torreno, Alexis Czezar" <alexisczezar.torreno@analog.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: "Sa, Nuno" <Nuno.Sa@analog.com>, Guenter Roeck <linux@roeck-us.net>,
        Rob
 Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor
 Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan
	<skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Linus
 Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: RE: [PATCH v2 1/3] dt-bindings: hwmon: ltc4283: add ltc4284
Thread-Topic: [PATCH v2 1/3] dt-bindings: hwmon: ltc4283: add ltc4284
Thread-Index: AQHdb+VCm6Tqec+7X0yHajbH59n20LcqR8QAgAWdHpA=
Date: Mon, 16 Nov 2026 01:09:02 +0000
Message-ID:
 <PH0PR03MB6351420B5D68F96A3BF54E16F17C2@PH0PR03MB6351.namprd03.prod.outlook.com>
References: <20261109-staging-ltc4284-v2-0-14a270a38f7b@analog.com>
 <20261109-staging-ltc4284-v2-1-14a270a38f7b@analog.com>
 <20261112-misty-beautiful-caribou-c9bbea@quoll>
In-Reply-To: <20261112-misty-beautiful-caribou-c9bbea@quoll>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analog.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR03MB6351:EE_|BN8PR03MB5009:EE_
x-ms-office365-filtering-correlation-id: 8455bd23-908b-494b-d083-08df437e342f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|7416014|261102123227099003|261022075727099003|261021121427099003|261021135927099003|261026121527099003|38070700021|11063799006|4143699003|56012099006|10067099003|18002099003|22082099003|261009223027099003;
x-microsoft-antispam-message-info:
 8QWD9d7flF0cLcGqfW8ctzJtDqHvtNTutwgwyeX76ZJzR/mN/O7SY7nL1EoMB09QZ3rS1+0viGzaSevXDnJYFfSAsG3pMyWB7xtl83U7+Cg4cknboalBTDpL06trpj87/TbJImzzRrDqo159ITraoA/tEzAET+kKiIIFxlZrciRxrjpbT42YI4Gpz64IDVybf6NE6579K5ojtaaUMSXjB8EdFkaW8EmrW1wY+EH3YvDs4QhRW7GIdw2k9UThXB+mjgYFfbR0KkltOyukBa3gJu0Zm2oJvE5Nnci3doNGHuYKNYqvxdVugAaneR2/mCeqSj4u0Ka0ZzEYUajxnp8RTp+RHHgmW8lrNBR+V819hsNCPaVBSFOsF6qBGSvXGM01+VCndt9h48P0IUUElKuCANdmme5n7T6hyeTWnXAaChnoJTpUWoiqgfvFnMPgp3VFo9T3vy6WKqAvt37afFuhh1RisSw09EKRtooV7BC4keMiJbA28IWDNKYeSe8TLo0hIRfJcqC8YMB0ValZilpS/BOeDAt94iT28exqdZTO9BgsiedEK3KPHzXqdXZebNOXb9WBTFCsV2cGl3agP7qg0Rqc5mP+DRUVAgG25PvSWku1novXa7/8+WtjHIkGNZloS+MmKW/vtAYL20aaECgcdmSE6S9hqRqZqp8mW1PyNwUyLpaiwuedb7cCK9WuYiGyyMxr8rql+T4Rs2LWMy2gBFmhkIKmjvyLNMDrKOoSVGw=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6351.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(7416014)(261102123227099003)(261022075727099003)(261021121427099003)(261021135927099003)(261026121527099003)(38070700021)(11063799006)(4143699003)(56012099006)(10067099003)(18002099003)(22082099003)(261009223027099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UzRORXVNOVA1UEpBZ1BOYWlRMFhuM1h4SGFjSnNnSzUrOEFzVlFORmhzWmJZ?=
 =?utf-8?B?b2MzbXNvQWRyVmFpbk11U0c4OFQ3anYvZWFKQjBlZ3hrNDkwTGkxSVdTNmxu?=
 =?utf-8?B?OUdmR3pOOEN2K1R6eGsxRGJraWxzMTlvbDBVRHk5SFdpTzJsbnFiTndQSGYx?=
 =?utf-8?B?SUgwK3R5SWdyMXllWnBSNWFFdnFUTEtnUUtXR3R4TzRIU2hzd0NHU0V5c1lL?=
 =?utf-8?B?VjIxbzgzZ1cwbmRCRmxFSUQ3Z1MrOFcrNlZkL3Q5dzdDdzNhYU1TU2wxaXFt?=
 =?utf-8?B?WFNKNmZ2dnBNNDZ4MDRmUU1aNktmRTdkWldrVWtLZDYzcHRZTWFCWEhPRm80?=
 =?utf-8?B?RmZ4c1FvWmNjeWFtUTIyR0NLWUJzZExCTHdVM2p6MG1RK3laY0Z5a01QY2lG?=
 =?utf-8?B?UEVWbWlraXRZa2NUTzZnNnFKSlhOeWhrNytXQks3b0d0SkVpU1lqc2xmdEhR?=
 =?utf-8?B?WHB4M201cFZ5Rm1Ray80ZVhPK1BPOUdGbEltMVYrMmVyVFY1RmRZcVVMVDNx?=
 =?utf-8?B?dVlaOC9Wc0o4NFlRVTZBa0FuYXc3VzBwclhDWFFUSlk0dWZxeXZ6QjUvemJD?=
 =?utf-8?B?d1hYYW1XZi8wNFpTdVM5bEh6eHcwd0NGV0c3MG4ybjc2OEZZVTVqZm41RXRX?=
 =?utf-8?B?dWswRGo2SWhPTW5rekRGSHU0dEhjeTI4WVZPYTdLRHV4UDl5L3A4dk14TTZ6?=
 =?utf-8?B?dVlCK09KMUFkbW5jYi9nVnNkR2FValZYSFdZVmRrYS9IUkNkN0hVdXpHYzk5?=
 =?utf-8?B?YWFWUEhHZGs1UWYwaC95dU1FdzdvbzRJbHlqVlJYc0xzR2pxZmJPQndmOEcx?=
 =?utf-8?B?cE9IckRkN2FONGRLRWljaWJFM1QvUEJXUytxRWxTMFpSaFU2WnBKcjZuUEU0?=
 =?utf-8?B?TC9zYk5hZUpuUzVpdjAzSnMrS05ER0EzdUZ1dWNxSXJWUll4MXdoNmdja0FS?=
 =?utf-8?B?ZUJZandmZVIzbDErcjRVZFRiMFhPcWZWL3F2dUdzU1R3TDc2bEFBVHFobGlS?=
 =?utf-8?B?ZkFPT1VqSXYwcXg3TjE0andqeDRZbG1ySVFiSlg4QTFLdm1KTFVIdnByc0Jz?=
 =?utf-8?B?NzZhWXgxd2hXbFloV0FHNlFFZDlaMFV3VU5Ba1d3OElTVnRsQ3hvNFg1VXBB?=
 =?utf-8?B?NkhlUjVSTkxPdHl2bnE4SHpJY1NUQkt0eDgxenhSRHBkWW56RUpUWGJaMHNw?=
 =?utf-8?B?amFBdDdyV3FBdkhsaXV3SGc0RFd3dmRDaUdsUVo2WVkzZ2pnekpRK2hQVDJC?=
 =?utf-8?B?VzQ1VjZVTmlHR3RXVU9lSks3cDJaMm5NV2pQM1g5T2l2c01LLzVnT0Rhd1Az?=
 =?utf-8?B?R09CbS9xT3B0YzNTMlkyTnlpTUpYV2pzd1hkeHBHVHcvVmtmVjVjUGRoU3lR?=
 =?utf-8?B?VGk1U0c4VUsyekdHSjJmWUoxNGRzOXc4N09HY0dxRDFvNEM3bW04Qis0aHVq?=
 =?utf-8?B?UHdnQXdKSDJBejlOVTZXd280bSt0SmhpbTBPakJCMlpML3NncEswTEgwckgy?=
 =?utf-8?B?dlU0OUtyenRqTDZraWxBaDlEVC9yTHZ1OEJ5V1I1NXBPejN1UjRLa3ZxMnZU?=
 =?utf-8?B?WVJKOTJVbE1iYS9nVXNhTTVQQUdtYUR5Vkhnb3Y2a2kwV2U0WnJPL2tTZC9S?=
 =?utf-8?B?ZGtQRVNBSGthdFd3cjhiWFlGcUprNVNycFlSeVlac1dmVXhYMHB6U2VzUTZH?=
 =?utf-8?B?bXU3S0JHRCt3V0VRc25Yd2JucTk3R2RhYVdDbkxlN2VkaTVJaW9kRzNneXFh?=
 =?utf-8?B?cjdCenBDazR1QmhjU1lMNkFxdTRHeVJVTGRtRXkxYWhodlpOTDdlMzhYcmV3?=
 =?utf-8?B?K2k3TlZla3FoNHJid2cxMVBJWEZMbER4UEtyZXFrdU5lOW5qTERsbjZWTWE0?=
 =?utf-8?B?UTVaK1gzUlhiNnloQlp3Sm8zTWlzZ3gyMlc3allqQXFDWkQxeXB6RkNGV3lT?=
 =?utf-8?B?cU93QjVkV0hPZUlXK2JzTXgrdHQ5NTRIY1VsV2dQMGNPaE8wM0J1eE9SaHhE?=
 =?utf-8?B?c2kzdHJ1cTI5OTBKWVhpaUhrNW12eVllRmJ0VllFZ2Z4V2xha3hIMVkxNDU4?=
 =?utf-8?B?LzFFSkdNN0ZtQjFMMEQ1TkJZaWFSUlpweTJvcjBSK1dyNVRmZTZQdkFtd1Z4?=
 =?utf-8?B?VVdMaDdiUzZXem52eGwzb3hwcnZHa1RZa1oxbkJHTEZNdjRNSUZXYW1HNWU0?=
 =?utf-8?B?YlBVMy9LSW1QZDBzL1laeUxrZUF5bjNsUUxqdzkxSGhvK1Z2b2NQTENnbzds?=
 =?utf-8?B?N3BsbEhjRThsWDlGY0NYdDJ5ZEVJL0pFZUtNcVl0ZG1id1M3UytiR3JLd2tk?=
 =?utf-8?B?SVc0R0k3Mk9vWHpMOFlxU044L3R2TUFUbzZEck8vMkRuSXV6SnF6ZXhGUlh2?=
 =?utf-8?Q?GOVtQ/CaGmaViQEo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	cRezBWP6IIeBQvOxEH1TVOOuMbT5nZG++pQ3yICCdgjQDX0Kh3FMpuDqWBJ2hmiWJIuaPh7IfkZhHDHTdPNlXJHmmjoruHsXUzARbigmYJI6hlrJZYqUr2/IxbJS6qQe5Mu7n2fG+KfUKbecuDmI5SKhzZmmgcrN+vZWMt/BwIjm3IuI2FDgJtw0q3pTwAHUitF9mzpaptlkGCdeFtslMqfCFZVK9Ah8V4lx/e4Co2TJgtCXF4a/SvVXhCRSf/4AVv0FJ1oNO8oKD/6jmdV28qqvNLzC3b2qWos4zUnYJQ6c3JX7Q3B075Aig90748SuvtqdFsfKXSvP+KOcdQf1sg==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6351.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8455bd23-908b-494b-d083-08df437e342f
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2026 01:09:03.0118
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Hk/cVmBpp1RrqIUgakyJlVMD6S0JQnDm5E9JgnObsoFtCaBC06ydb6j1rP3DIXMjzqkHzG//trP9/Dj2T0jm8cy6bvXyJQ/qucrLo+1PAV4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB5009
X-Proofpoint-ORIG-GUID: _U4bBTaiSf6p8ISrXxLOx2aOCgc4LWxV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAwNCBTYWx0ZWRfX1c/ep4RQwHXp
 c8t3AvzMj4a2NiXHtxc95AEHTd5AEXbmYjJqWSBPx172qt1qT7yZ/+wq5xp9RwqFCGZd1CvDS7L
 qdZwGkaUJrvHBYcYNV/PFyJoqRDTmK5qvIdcJxRMEkgGZ6yLEeDdvp2sqKrDbnt1MNRfP90rp2k
 362Jj0Yb2r6Qr6z8iqZweajTeCe4V8m4l4FfBAGOTbvZwgpwK+2KnX0HZhpqep17YN0XG0WZUWu
 apB/3a7YGTrYk4XV0zQ6+yAZApwT00JcRv4U0grWX8GcVW202btkxdkDU6DcTHV7FWLyiBTFTd6
 me9l3WcorfSk/qZFIJ0tu0XOlfNFdomBGvK+67QcpDWJuZs/5i9YHAi9WQfhntTi39J8HdpqGAL
 xVGUCITxKqmEPQL6AUGiM8iTZeI6BzK0A8lbuYLgCTiXkmwEDxRr/faw4z0YZLm+urrp45B0Yrj
 Ot1RV2BXlqtVVDNJBWg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAwNCBTYWx0ZWRfX4MYhWKOFgY9e
 0hxDWig65VLOWWIxFDZk5/s4NQGDAUQqDJd4tAnY+DRAaaIpbyWUGt7VD+bZBluNYFN2r7IIVdL
 V2ge9Yrrvter/GUqpa6FfRHmO9dzFUZ/PLwiwHt6AvaSFDrX0ep9
X-Proofpoint-GUID: _U4bBTaiSf6p8ISrXxLOx2aOCgc4LWxV
X-Authority-Analysis: v=2.4 cv=Oo/aWC/t c=1 sm=1 tr=0 ts=6afa57b6 cx=c_pps
 a=PurIBXv9FE+FLdDnXy66Mg==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22
 a=iZSIUCweCk2Oy3QsdGPA:22 a=gAnH3GRIAAAA:8 a=NAsfQKQUMNPxL27j9k4A:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-15_07,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 spamscore=0 clxscore=1011 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160004

PiA+DQo+ID4gIGRlc2NyaXB0aW9uOiB8DQo+ID4gLSAgVGhlIExUQzQyODMgbmVnYXRpdmUgdm9s
dGFnZSBob3Qgc3dhcCBjb250cm9sbGVyIGRyaXZlcyBhbiBleHRlcm5hbA0KPiA+IE4tY2hhbm5l
bA0KPiA+IC0gIE1PU0ZFVCB0byBhbGxvdyBhIGJvYXJkIHRvIGJlIHNhZmVseSBpbnNlcnRlZCBh
bmQgcmVtb3ZlZCBmcm9tIGENCj4gPiBsaXZlDQo+ID4gLSAgYmFja3BsYW5lLg0KPiA+ICsgIFRo
ZSBMVEM0MjgzIGFuZCBMVEM0Mjg0IGFyZSBuZWdhdGl2ZSB2b2x0YWdlIGhvdCBzd2FwIGNvbnRy
b2xsZXJzDQo+ID4gKyB0aGF0IGRyaXZlICBleHRlcm5hbCBOLWNoYW5uZWwgTU9TRkVUcyB0byBh
bGxvdyBhIGJvYXJkIHRvIGJlIHNhZmVseQ0KPiA+ICsgaW5zZXJ0ZWQgYW5kIHJlbW92ZWQgIGZy
b20gYSBsaXZlIGJhY2twbGFuZS4NCj4gPiArDQo+ID4gKyAgVGhlIExUQzQyODQgZmVhdHVyZXMg
ZHVhbC1nYXRlIGRyaXZlcnMgd2l0aCBmb3VyIG9wZXJhdGluZyBtb2Rlcw0KPiA+ICsgKHNpbmds
ZSAgZHJpdmVyLCBwYXJhbGxlbCwgaGlnaCBzdHJlc3Mgc3RhZ2VkIHN0YXJ0LCBhbmQgbG93IHN0
cmVzcw0KPiA+ICsgc3RhZ2VkIHN0YXJ0KSAgY29uZmlndXJlZCB2aWEgdGhlIGhhcmR3YXJlIE1P
REUgcGluLiBUaGUgTU9ERSBwaW4NCj4gPiArIG11c3QgYmUgY29ubmVjdGVkIHRvIHRoZSAgYXBw
cm9wcmlhdGUgdm9sdGFnZSBsZXZlbCAoVkVFLCBWSU4sDQo+ID4gKyBJTlRWQ0MsIG9yIGxlZnQg
b3BlbikgYW5kIGNhbm5vdCBiZSAgY29udHJvbGxlZCB2aWEgc29mdHdhcmUgb3IgR1BJTy4NCj4g
Pg0KPiA+DQo+ID4gaHR0cHM6Ly93d3cuYW5hbG9nLmNvbS9tZWRpYS9lbi90ZWNobmljYWwtZG9j
dW1lbnRhdGlvbi9kYXRhLXNoZWV0cy9sdA0KPiA+IGM0MjgzLnBkZg0KPiA+ICsNCj4gPiArIGh0
dHBzOi8vd3d3LmFuYWxvZy5jb20vbWVkaWEvZW4vdGVjaG5pY2FsLWRvY3VtZW50YXRpb24vZGF0
YS1zaGVldHMvDQo+ID4gKyBsdGM0Mjg0LnBkZg0KPiA+DQo+ID4gIHByb3BlcnRpZXM6DQo+ID4g
ICAgY29tcGF0aWJsZToNCj4gPiAgICAgIGVudW06DQo+ID4gICAgICAgIC0gYWRpLGx0YzQyODMN
Cj4gPiArICAgICAgLSBhZGksbHRjNDI4NA0KPiA+DQo+ID4gICAgcmVnOg0KPiA+ICAgICAgbWF4
SXRlbXM6IDENCj4gPg0KPiA+ICAgIGFkaSxyc2Vuc2UtbmFuby1vaG1zOg0KPiA+IC0gICAgZGVz
Y3JpcHRpb246IFZhbHVlIG9mIHRoZSBzZW5zZSByZXNpc3Rvci4NCj4gPiArICAgIGRlc2NyaXB0
aW9uOg0KPiA+ICsgICAgICBWYWx1ZSBvZiB0aGUgc2Vuc2UgcmVzaXN0b3IuIEZvciBMVEM0Mjgz
LCB0aGlzIGlzIHRoZSByZXNpc3RvciBjb25uZWN0ZWQNCj4gPiArICAgICAgYmV0d2VlbiBTRU5T
RSsvU0VOU0UtIHBpbnMuIEZvciBMVEM0Mjg0LCB0aGlzIGlzIHRoZSByZXNpc3RvciBjb25uZWN0
ZWQNCj4gPiArICAgICAgYmV0d2VlbiBTRU5TRTErL1NFTlNFMS0gcGlucy4NCj4gPiArDQo+ID4g
KyAgYWRpLHJzZW5zZTItbmFuby1vaG1zOg0KPiA+ICsgICAgZGVzY3JpcHRpb246DQo+ID4gKyAg
ICAgIFZhbHVlIG9mIHRoZSBTRU5TRTIgY3VycmVudCBzZW5zZSByZXNpc3Rvci4gVGhpcyByZXNp
c3RvciBpcyBjb25uZWN0ZWQNCj4gPiArICAgICAgYmV0d2VlbiBTRU5TRTIrIGFuZCBTRU5TRTIt
IHBpbnMuDQo+ID4gKw0KPiA+ICsgIGFkaSxyYWRjLW5hbm8tb2htczoNCj4gPiArICAgIGRlc2Ny
aXB0aW9uOg0KPiA+ICsgICAgICBWYWx1ZSBvZiB0aGUgZWZmZWN0aXZlIHJlc2lzdGFuY2Ugc2Vl
biBieSB0aGUgQURDKy9BREMtIHBpbnMuDQo+IA0KPiBUaGVzZSB0d28gcHJvcGVydGllcyBhcmUg
bm90IHJlcXVpcmVkIGJ5IHRoZSBkZXZpY2U/IElzIHRoZXJlIGEgZGVmYXVsdCBpbiBzdWNoDQo+
IGNhc2U/DQo+IA0KDQonYWRpLHJhZGMtbmFuby1vaG1zJyBpcyByZXF1aXJlZCBmb3IgbHRjNDI4
NCBvbmx5IChkb2Vzbid0IGV4aXN0IGZvciBsdGM0MjgzKS4gDQpTYXNoaWtvIGZvdW5kIG15IGRy
aXZlciBwYXRjaCB0byBsYWNrIHNldHRpbmcgYSBkZWZhdWx0IHNvIHdpbGwgYWRkIHRoYXQgaW4g
djMuDQpUaGUgdmFsdWUgaXMgbGlrZSB0aGUgZGVmYXVsdCBvZiAnYWRpLHJzZW5zZS1uYW5vLW9o
bXMnLCBMVEM0MjgzX01JTl9SU0VOU0UuDQoNCkkgcHV0ICdhZGkscnNlbnNlMi1uYW5vLW9obXMn
IGFzIG9wdGlvbmFsLCB3aGVuIGFic2VudCBpdCBkZWZhdWx0cyB0byAwLCB0aGUNCmRyaXZlciB0
aGVuIGFzc3VtZXMgaXQgaXMgd29ya2luZyBpbiBzaW5nbGUtZHJpdmVyIG1vZGUuDQoNClRoYW5r
cywNCkFsZXhpcw0K
