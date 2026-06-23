Received: from usb-smtp-delivery-120.mimecast.com (usb-smtp-delivery-120.mimecast.com [170.10.151.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 441583955FD
	for <linux-hwmon@vger.kernel.org>; Tue, 23 Jun 2026 21:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.151.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782248590; cv=none; b=D+CTAb68LawTrzL4sO96ZktmIKPSYzKeWTzT7mEl17AdsVtF0Tau1YF3T+6O3wwObkR8ozjNtrBhs2SKSaK/Q2zElpROcNH7R6dLKcpPr0+gT4aLkfwNcDkrEZXw50oPXhgRoVwQ3xb/rdPQQUJHbsI6D0Q4M5D+8kim/85REgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782248590; c=relaxed/simple;
	bh=VoXNZuWIpw5aBl9CCnEpa3k+3ai7DI7ZtTILW7TbIM0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 MIME-Version:Content-Type; b=CtLlCzYYbEBmJdl5x4SvGZTNVA0umw9y9ayekFSjdGNA4qQwDdxa0TCdPYAN7jUepxXRc8UJupueeyRxS9ItJb+F7RHjiyUY4gptJNapzYlwV0+i9qcYvTgTEDFc/0JY6Im7/UTfjsyzFA/PlWljITpv7PRlHdPaGboyJ3OI2k0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onsemi.com; spf=pass smtp.mailfrom=onsemi.com; dkim=pass (2048-bit key) header.d=onsemi.com header.i=@onsemi.com header.b=jyHcveD+; arc=none smtp.client-ip=170.10.151.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onsemi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onsemi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onsemi.com header.i=@onsemi.com header.b="jyHcveD+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onsemi.com;
	s=mimecast20250127; t=1782248588;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VoXNZuWIpw5aBl9CCnEpa3k+3ai7DI7ZtTILW7TbIM0=;
	b=jyHcveD+gjNJBbRV7hs4t/aWq+HRMKDRLuNBU++JBPUfvdjhKLZX8LMg/uBHXQ9jEtJr7b
	6fD/yKqGMV5DdpgpWKhQ81xJYwLaCsmyGaWjj8STQgchMipZ1+Ihebk+56rsg/uuLfseSj
	DMyIIb0b5pZRRCd3Sljr6bTFPjZJ8SM0yhXrvq5gJPanjRF8h9AziQLEMlXLF9TMUaKG0i
	3okXf0U9T1Hp/NYHGDjHrxJ+tMAkvXTh59S6bT11BA9V2sJrWjz+YcWejDpR/3ehcw2oCq
	byKJQgBZyzEPcY6c508bqBwyVm8IJnSpPPtZX8K9RDV+W9gwOvkX6Q9bi7F2fQ==
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010056.outbound.protection.outlook.com [52.101.56.56])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id usb-mta-70-dD3AnzeUPBG0othoSzPYZA-1; Tue,
 23 Jun 2026 14:01:41 -0700
X-MC-Unique: dD3AnzeUPBG0othoSzPYZA-1
X-Mimecast-MFC-AGG-ID: dD3AnzeUPBG0othoSzPYZA_1782248495
Received: from CYYPR02MB9828.namprd02.prod.outlook.com (2603:10b6:930:b8::20)
 by IA1PR02MB9591.namprd02.prod.outlook.com (2603:10b6:208:3f8::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Tue, 23 Jun
 2026 21:01:33 +0000
Received: from CYYPR02MB9828.namprd02.prod.outlook.com
 ([fe80::2767:f7d2:778c:8dca]) by CYYPR02MB9828.namprd02.prod.outlook.com
 ([fe80::2767:f7d2:778c:8dca%4]) with mapi id 15.21.0139.018; Tue, 23 Jun 2026
 21:01:32 +0000
From: Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>
To: Conor Dooley <conor@kernel.org>
CC: Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [PATCH 2/3] dt-bindings: hwmon: pmbus: Support for onsemi's
 FD5121
Thread-Topic: [PATCH 2/3] dt-bindings: hwmon: pmbus: Support for onsemi's
 FD5121
Thread-Index: AQHdAtUG0MJr3kYk70C0stjgUT+1+7ZMZ+AAgAA2+5A=
Date: Tue, 23 Jun 2026 21:01:32 +0000
Message-ID: <CYYPR02MB98280DF78A07EADACFD084EE83EE2@CYYPR02MB9828.namprd02.prod.outlook.com>
References: <20260622-support-fd5121-from-onsemi-v1-0-b31767689c65@onsemi.com>
 <20260622-support-fd5121-from-onsemi-v1-2-b31767689c65@onsemi.com>
 <20260623-anybody-gutter-e6ca04f53bdb@spud>
In-Reply-To: <20260623-anybody-gutter-e6ca04f53bdb@spud>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CYYPR02MB9828:EE_|IA1PR02MB9591:EE_
x-ms-office365-filtering-correlation-id: 46fa7d85-cb2f-4962-6d03-08ded16a9ade
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|23010399003|11063799006|4143699003|56012099006|38070700021|22082099003|18002099003
x-microsoft-antispam-message-info: vQNyHMVCcxuDHA/24U97Hr8IFuZkALObPo/YtucAyk/A5nWerd51tGyO2w0IEt9uodKScpYvGMReLAo/barr4z6TSPeRx3CdYPCIr+YmF3m1TsmB4mtPj1Qz834Iy85rz2fmxmgc7pl8S6Tqd12PQC14rUFkY8Po/IifG/knYIPuS8wz32pCPlLkQnyJSP0CsYqQvBZWTSHmAwWmK/IQxqNPApK6XuieaaNl2qceZbfm3ewebNOszmRFVXK855zwAQs+7iN51TIejkHxfTBWd7pY5NrAmuYZ7ytx5OhPUzEPYRcZrvTPsGVNbDORjaMy6SkVv6AFwKQl06XMxFgSaBLK7eEEuTDeXV/X1q7G+DelEJawZByJlS1qtZzLk2gZsFh3IR9x1Kgvu2zfc/B+6XKHQ8OwouAdtVT3q9zyfaO2k2UbE39QPY0JLhv5NfJ8paOlLGeTwtNlT4GnqBm0JNtKGLgiHeykOZqRwMqBypPBnHxGPTvW8p73qOaAV/CMSLr8I3/DW2I8iz2paDaVTuD6VC4A9/+q+ZVYlKr21CH/LZJGAqJfeihUhXLUEFEJrM2fHA74EbzIF0NmvVPr+5rXaUo6fCyfPRalOCC2vmt6toeLJduq5CgGObX3Czslhv+lbY0jy0twG8pohIP3YWPT0KBp3qm2cPH9PQh05dyP9ilvwRWnRZM/cZjYlBT9VzZS4ahbc+N52EnPIRiKBXIjJfydaWjMs2fGkns+VGs=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CYYPR02MB9828.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(23010399003)(11063799006)(4143699003)(56012099006)(38070700021)(22082099003)(18002099003);DIR:OUT;SFP:1101
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?keJz4OJm+Whv9EJiWAgXeEy11fAg5Kmto7KvAqXo9JOpW6j938ejSqi5Zugi?=
 =?us-ascii?Q?3cAf74BYw2oZZT47EyS0l9ZM01DsSfZAAH03jIgAalEVw9YIff4kS/gR7B77?=
 =?us-ascii?Q?ULSsLR9kX6ko8fh/Vcl6WWyu+kgN7YZ+MpFzvHH94hRdBVUe9bvgWZbLfpHw?=
 =?us-ascii?Q?Q/GvvFcD2nCmZB0Fm0jaxsmA7P93TYt8dip8f32byTa9xaq7dSxAyAWGJaa1?=
 =?us-ascii?Q?VsFGUt1Xtzxm+dhwWj+BZEmyIhJsMf7yDuMyHR6NS7YQkY4Li/X19bYcJ3h0?=
 =?us-ascii?Q?5yhYSCPeQLinm7EE2YUpFgqsiVUchX1DLXr7dzWhAT62vLIHq7/c4LhbrT3J?=
 =?us-ascii?Q?irHhVouEUXbsClMKdqU+BTvCtcKtsrAae20WBgAk89256OETsl625VY5BgTJ?=
 =?us-ascii?Q?bcQpFpTsa06c+aVBx4EdErczfikbTpZ35YeEsRoq2RwsJTAQXjaB9QNYqBPY?=
 =?us-ascii?Q?kZ8NRlomOv/MKFHrL/V0t4bq5POLQUvF1KolSfNFAkBvXwyw4tYDQJzTkE+y?=
 =?us-ascii?Q?bmWAL5ClJxrKfVUs/A1IJCbLEdG5Y9JkQ5ZsRGp1xpqHAjDEO0wW0AX221Um?=
 =?us-ascii?Q?rtD9yvAHWWjvilxL+ATwfQK2GpbcCCZdeb5CuLq9QFwi4o2+Z1Mfw2QM0inT?=
 =?us-ascii?Q?QRhI9nr3iMi4o7OGs26NZ2nNmhPExnOb6gMIiGLtHU0Y4Wo8uHSNa8YOrhtH?=
 =?us-ascii?Q?bHe5oWjDcGGbfJOgwQu/7iJTkXgnq7kOP1Anv2t0nnG9rYPot91cvLcGmFE2?=
 =?us-ascii?Q?Tw6eXWAPW0ppAuX3mBdkLiK4P4kPnHRHeUUsaQ4tZB1ApKJvHkNT4697IrtM?=
 =?us-ascii?Q?MkcWf8Rl7eBQHYhikGKv0rgMU3LkznBsZ3e1OeuOk+m/Qx8mO4mLgnmEWhko?=
 =?us-ascii?Q?3AJy5SITmkvxsummRpht4abZspQyiI0TCFGKazhRr1W+B6TdbPXEp01TaQm5?=
 =?us-ascii?Q?q2nLooPcqkGKRbbxKjW+RlSN2YYiq+y+KPiSBaNwX1rdwRUb/Xb6y/+WTn8x?=
 =?us-ascii?Q?pjr6IweM1/+3LScunO/XZFOR8FXDuaRhU0sMSoW6hgWoTOvgMfEWN/BPNBvZ?=
 =?us-ascii?Q?qQ34XFKInYENedpbMBoLCKLVPJGUZXIPSIodkOljGWIrK924V3PvZWA5XuAx?=
 =?us-ascii?Q?NcTWoOXenLS/lkaqjxdqjsXaXTOpjYjVm1fLEJ+QqX2izOp+d2zDs9K368g6?=
 =?us-ascii?Q?GYKtYy/ffz+Y/5E1MgcXr22VthcYeeIzWCF/P6ImUJOjnOFrls6c/4jBGqBU?=
 =?us-ascii?Q?jEZ4fjMItFpZp5gOEzqjcpMc4suqVJl8APF3ANWCKN1aF7O8/h6OFiIVkCYE?=
 =?us-ascii?Q?k3ugUEezB79bMk0/aSgHzLhaHWiJAPeDMHqBYmSGFmCKTr3g5bTDox2fbBs4?=
 =?us-ascii?Q?KyaWB+Cd606sCMMvGFXSiklg5nvtZRT1HHOSUauo1DnzvtE6gYW0Im3ORbsD?=
 =?us-ascii?Q?hXVhx6RrxBvKZXFWTx3G8xRwpcO1lz/vmD/9Gd25XKoUY6kU3UByFTV4WO5A?=
 =?us-ascii?Q?xavxN0EkVSw6zBQ6fKtM8kl9HNGh7aKpfF6qv08Dy7l8tSaUMY8qA1qEFCgL?=
 =?us-ascii?Q?8hVtUZvV269prahNgFMhZP5WmcVFryuY+NNQPr8w8+MVbYuHBqtYsMDtjVb/?=
 =?us-ascii?Q?LBpb+1RieiLyyDYkrODIiUUKOMTFXYckCxfmk1kkj7SFOzQYi6CRJdsoc7LN?=
 =?us-ascii?Q?UPbN2h8cXYPn3v8zUtZ+8Jqb2WLOVGs7f3grMauHZbARUC4LCmg48ysQLCmE?=
 =?us-ascii?Q?LEI7r6uES6BALcisOOwj4O/0QohZkJs=3D?=
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: ZbSyuPlBbxx7uTbF6YN9wlsa8cy/aWdy6UAsKLJO5D1sy7c9EFTqI3V25KxwG6YL7AVEWuH0u871hMDRVmTxG4f8L9tVN6n/Jli4n54CLns/AIlh29nJqIo+C49VIlbGlAOgoBi/JpTymEgWytNZF+SxyioTr9bShzs3cxwTtB8XJNxIiV7pb4jwccrhGbHF1zO/Ylz4f1TE9JjlgGZ4nWzjrUQ7/vMrv3BsT+FSozBQG4mUgFQICD5oXqb86+Lkh/QbLIR4vFifRRlk9V6Jk3CsrwLIhMMYPTRnIQCUMbtPKfdoyv6og3UeU6NlZYzBmpJfo1T5plkhayvaY/5JNQ==
X-OriginatorOrg: onsemi.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CYYPR02MB9828.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46fa7d85-cb2f-4962-6d03-08ded16a9ade
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jun 2026 21:01:32.8082
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 04e1674b-7af5-4d13-a082-64fc6e42384c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RxLa84b3Rir1bnR0cirtlnU6iEE3Nn6s7bzvEfZOGLs+4+J+AVowlkzSMYOR/K/kcZBoc+pBEevSApagzey7hV3exMAjknsXBl9s6+b3zYA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR02MB9591
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 12A4fh9jiUl6XzJMlrl10ho7tLhk37AyKRV7MYwLJAY_1782248495
X-Mimecast-Originator: onsemi.com
Content-Language: en-US
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable


> -----Original Message-----
> From: Conor Dooley <conor@kernel.org>
> Subject: Re: [PATCH 2/3] dt-bindings: hwmon: pmbus: Support for onsemi's =
FD5121
>=20
>
> > +
> > +title: onsemi's multi-phase digital controllers
>=20
> Can someone explain to me what a "digital controller" actually is?
> Seems very generi and that a word may have been left out, were it not
> for the fact that this wording is used several times in the patch.
>=20

Thanks for reviewing.

According to me, "digital controller" means the controller uses digital cir=
cuits to implement=20
the features and functionality. We can remove "digital" and keep only contr=
oller. It won't make any
difference for Linux documentation.

> > +
> > + enum:
> > + - onnn,fd5121
> > + - onnn,fd5123
> > + - onnn,fd5125
>=20
> Your /OF/ match data in your driver suggests that you intended to permit
> fallback compatibles here?

Agree. Sorry about the discrepancy. Will fix it.

>=20
> |+#ifdef CONFIG_OF
> |+static const struct of_device_id fd5121_of_match[] =3D {
> |+ { .compatible =3D "onnn,fd5121" },
> |+ { }
> |+};
> |+MODULE_DEVICE_TABLE(of, fd5121_of_match);
> |+#endif
>=20

