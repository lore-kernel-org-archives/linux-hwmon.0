Received: from usb-smtp-delivery-120.mimecast.com (usb-smtp-delivery-120.mimecast.com [170.10.151.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE2DD364024
	for <linux-hwmon@vger.kernel.org>; Thu, 25 Jun 2026 00:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.151.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782347745; cv=none; b=uAzjWTVNXLYZJb0xigSWlEh1IUC7aasflWXqxato/a5AHImrx7W5CddzKXPFl/ff7HJs42TaX7AVR/5GC9V/jxgtLJMuxIUBp+juVd7+AIGyiRr5sXGIu48mscsih3A5KS2/DyeA2c0I7n92elaA+abonHmDFjL59rWeTD4aJH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782347745; c=relaxed/simple;
	bh=Ah3BK4c9COLZAJctBL1RfvkLf+/iMlAsnF8C0qtruuo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 MIME-Version:Content-Type; b=dtS40sUU4294bKfaNvao0B1sGNYjIBT+Oy0W6ollHyRR0EE/1VcyPLUhtBUqoU9uwtyKyFlEpDR672QblF6JlbxxKeHpOWqnivTZXvNZA216Y4p3Y6jXyzaS3zVlQqJtLvHXI5roVeuuwzvpqFw2EwWUkO/VO3UAvuLyTsRA8s8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onsemi.com; spf=pass smtp.mailfrom=onsemi.com; dkim=pass (2048-bit key) header.d=onsemi.com header.i=@onsemi.com header.b=AGWJwygb; arc=none smtp.client-ip=170.10.151.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onsemi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onsemi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onsemi.com header.i=@onsemi.com header.b="AGWJwygb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onsemi.com;
	s=mimecast20250127; t=1782347736;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ah3BK4c9COLZAJctBL1RfvkLf+/iMlAsnF8C0qtruuo=;
	b=AGWJwygb3qST83kUqqQolZi5QFiSQ2O00qplY/lTqmf8WWJ9+dqDAs6PmIhJKVI17WmpN3
	qiyt25PzEnEDwcpGh58EK5tJbmmnQQFokD68ksE8zK3M+z0OLtpGKakvj2mOxo0BZdxXsJ
	2fvRCtXkZSAUzg6baBvHghdD2MAzeCbjQpBeK4lG42cLXF01HTLKJuKoPo2C266bAPb+Wf
	Sb1g/II4xIjJZFtraT3M1uzKJNyr30HxmFiM9ToZnXIJbD79G/Ga9sWUAKaKIa5tFPPhvq
	TD0Yc2g4Dou2fcld5OODLxVSTbxVbeDrNXXrZOTv+DJLze6YjsnzTAA38MtgMg==
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010030.outbound.protection.outlook.com [52.101.56.30])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id usb-mta-71-efqtSu84P1a70JbMeIzeDw-2; Wed,
 24 Jun 2026 17:35:33 -0700
X-MC-Unique: efqtSu84P1a70JbMeIzeDw-2
X-Mimecast-MFC-AGG-ID: efqtSu84P1a70JbMeIzeDw_1782347732
Received: from CYYPR02MB9828.namprd02.prod.outlook.com (2603:10b6:930:b8::20)
 by IA1PR02MB9110.namprd02.prod.outlook.com (2603:10b6:208:42e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Thu, 25 Jun
 2026 00:35:29 +0000
Received: from CYYPR02MB9828.namprd02.prod.outlook.com
 ([fe80::2767:f7d2:778c:8dca]) by CYYPR02MB9828.namprd02.prod.outlook.com
 ([fe80::2767:f7d2:778c:8dca%4]) with mapi id 15.21.0159.012; Thu, 25 Jun 2026
 00:35:28 +0000
From: Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>
To: Guenter Roeck <linux@roeck-us.net>, Conor Dooley <conor@kernel.org>
CC: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, "linux-hwmon@vger.kernel.org"
	<linux-hwmon@vger.kernel.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>
Subject: RE: [PATCH 2/3] dt-bindings: hwmon: pmbus: Support for onsemi's
 FD5121
Thread-Topic: [PATCH 2/3] dt-bindings: hwmon: pmbus: Support for onsemi's
 FD5121
Thread-Index: AQHdAtUG0MJr3kYk70C0stjgUT+1+7ZMZ+AAgAA2+5CAAAYPAIABpgGwgAALPACAABXNEA==
Date: Thu, 25 Jun 2026 00:35:28 +0000
Message-ID: <CYYPR02MB982898B8E8EC0513EF55D44083EC2@CYYPR02MB9828.namprd02.prod.outlook.com>
References: <20260622-support-fd5121-from-onsemi-v1-0-b31767689c65@onsemi.com>
 <20260622-support-fd5121-from-onsemi-v1-2-b31767689c65@onsemi.com>
 <20260623-anybody-gutter-e6ca04f53bdb@spud>
 <CYYPR02MB98280DF78A07EADACFD084EE83EE2@CYYPR02MB9828.namprd02.prod.outlook.com>
 <20260623-scared-judgingly-7efc1c188670@spud>
 <CYYPR02MB9828EECB3F6AFDD2A7BD3E9B83ED2@CYYPR02MB9828.namprd02.prod.outlook.com>
 <eed3e19b-8cc7-4aef-b058-b2242c94c940@roeck-us.net>
In-Reply-To: <eed3e19b-8cc7-4aef-b058-b2242c94c940@roeck-us.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CYYPR02MB9828:EE_|IA1PR02MB9110:EE_
x-ms-office365-filtering-correlation-id: 6fab0a73-cfb6-423a-7246-08ded251a7b3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|23010399003|38070700021|22082099003|56012099006|11063799006|18002099003|4143699003|5023799004
x-microsoft-antispam-message-info: yhqt8sHRoAEUgJ5ZoPEmtQWGQO2w097ADqlyWQP4DyBaN4EUgOdZwas7/XFQTTeAIWL6/Yw24JrEWoSL4ZatS/ontJlhR+Dg93Bc66z7cJnG50B5nHmPWKUJccMzz7lz6zRTOpUDkutkuQZ+4+CR/IbkGutYqE8EIIpDGfcAaNSUnaaMtM+vhmo3EkrUU+oh+8LDf0eFMYQGM9r9DvBNhBK+SQNZqgW4qMYSHSxJClioqDqGZljFuPMDI54q8plB0EK4PGOJKqo0IoGPQOAj0xC8zGKl10vjBEsGKTMsj0GXOojqbJJzWaGMki6dAb+jK6k6YfNHPGau8E/Dq2vIkV+rrXQ2VL1k0+olwFTFogh4z6D8L2uqjPXhz7+4k8K7Sxp7AC8QKaHolMuNl7dmdx0zE/8CzgckF/UBSfiYE50N3lxh7qrQazn1t6B+Lx6IpAQhgnqGp8CzAAJUF0ucT/Aul6HioMnkO6dEhNIjZxs+n5QO4fzB/YbbY7SeN+lfwr9/Ggc3wCVyYK4wUr400ovG26/O9b5+tWd4auD9e8UpA/iUiLdYpnRWaMEf6PMVb27waDMm3KgnR1aJSNSWu02kmpyiU/6NZfkLuFt1EzT5yjkeCKVR3XKY15xtKPGL9sjalkWT5lg1mpzBw/Ecbjf25w/POX4QnNzHoUu/pfz5CVHlOvfgguHEguaUbuDfDxJTmRs3U5jophpmBxZFpb9ZMOIUSiVxDkPy10fLB5Q=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CYYPR02MB9828.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(23010399003)(38070700021)(22082099003)(56012099006)(11063799006)(18002099003)(4143699003)(5023799004);DIR:OUT;SFP:1101
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?elRiTkx2R0xEOUl2SGZNWmhHTmRhb29QcGJMVm9pWFNBclBKRlFwN05IYmo4?=
 =?utf-8?B?dDVWejJXdWxPUFlpQittS0lGakc5YURjcll1eWFZSmY5K2RqWEZpMDNmelFQ?=
 =?utf-8?B?U2lVcWk3VERBcFo0L1oxOXZmb2tyYzIyVmJxOEYycFphNTdmeUhJZk9aMGxx?=
 =?utf-8?B?S0lNSU8xZkFmSDZ1UWk1WmJ4cEE5V1ZEWndmb2dLZisxUDMrekxncjNUZTcy?=
 =?utf-8?B?ZXZrcTJzQ29vVkdpL2ZnNjRnTkxsMmNPKzJhaVVGQ29HWGV6ZnFwQk4xRUkx?=
 =?utf-8?B?Y1d1TTRrRlB0N2VLWUVYVUdCQ212b0dib0Rmc252VExQLytJZ2NiZU5QVEFq?=
 =?utf-8?B?REk5d0xsM0pzako1QWNheWFhTzJjRkxtM0xJeTVhM1VNY2RqVlIrUDRjeUM4?=
 =?utf-8?B?UDFoUnZmeldENnYxQjN6a041Rkt6di9KL09IT0Z6MkhubkE0Z2J0U3hHa2JI?=
 =?utf-8?B?K2VqTzVIZXBLelJxdXZTc3UrOXRaL2g0K3JUYmdPeDZ0Z1VyanhuWmVEOU9N?=
 =?utf-8?B?V1ZzNVlTZ1k3cTJ2YmNrYzlRa20vMHcrOEprbHdaZWUxcUhqNlhHTERicEVq?=
 =?utf-8?B?TFlwZWc3RjZldUcyTG9NM3k4dkRic1B4TS9RckI2TSt0VHNpREE0RHViV0pG?=
 =?utf-8?B?L01pdS8vYWxoaW1jc0lDbTV5RGt3M04vZlBZV1R1SHFlRmZJOHBnQTdXY1Jh?=
 =?utf-8?B?eTZhTHdudEEybjZUZVJGNmJPckEraFUrL2VYekJoNThmVERrR2FXaWdlRFFz?=
 =?utf-8?B?bDV0NldpZCsxQWVXWm05Z0kvaFc3UTNjcnRKT2NlNnp4SHh2bEg4YVFzS29W?=
 =?utf-8?B?MS9OVjg0RklXTTR1a0h3OVp1NnRLNEI0VWxsZ3JjV3BjZ0EzOEJjVXJ2ZUJB?=
 =?utf-8?B?NTB3SnBma1dKenZPcVVaQU13NkoveloxZU94MkdXVkZCbnJYeTU2d3k3Y3Ex?=
 =?utf-8?B?T3MzaXlYd0hmelVxM3QvTjNzRnBVVGE1aEhSYk80QjAyeDRLSHBWVk9IcUM4?=
 =?utf-8?B?UWt5a2NlbU9IZVdLMUZHaE5NMjJxVmJwUll4cnFZdzFwTE9nY1ZSRUp5UjBU?=
 =?utf-8?B?V1A0L2EvSWc3c3l3NDdlM2JkUDMrV3NIQlk0K1BmVzVDa3M0VHNMVXNTejJp?=
 =?utf-8?B?YkFYVXIxVEExOGhGdVlHVTE2UzU3SnNZTEJVaDlrTXE2OGRnRGp4WWRCWGJU?=
 =?utf-8?B?QkpIbEUrUW80Y0s3RUVCN0pYR1BCM3ZRQVNJSWVQbWQyQ0x6MDlTV1dLZCtN?=
 =?utf-8?B?YXBjWDc4U1NrOHZTQjNyUjRmRzh1aWt1eFUzREorbEZtM1lsblZ2eURla09F?=
 =?utf-8?B?S005bUtqTHJHUTJxbk9HTEZtQkRqRXhsK3JuN0wrZVpucTc2dncvRkpEa01F?=
 =?utf-8?B?K0lyZ1hMTHRaTUFSVVdSYVNPV1F0dWZiNUc3eGc1WGFMdXE3c0Q0cHFMMVgy?=
 =?utf-8?B?YnZWemN3ZGExSTZOK1FnOE5IUktObTdkQmtJblFDN1Ewd05hVVNMbExtT01T?=
 =?utf-8?B?c2tLYW9ZdWh5djV0SHdrSkRHcHRncXg3cTdpU3NnT0w5Vm41UFJOR04veENm?=
 =?utf-8?B?U0tmc1RlbTJyWlg5czk4K0JDVE9IaUdIb0U0aTNFaDY4REVUeWRZTE56UmJs?=
 =?utf-8?B?RDFyeDNDeGY4NFQrYTRQaHk2RC9TTHRpYk0wVzU2ZlNNYlhoZXNUQzRlK1lS?=
 =?utf-8?B?NGF5YXFPYUovL1grdWdJVjROdXR2VDVINmtWZTJKdVlFMW1sL0xkcmRDVTB4?=
 =?utf-8?B?U1o4aFoydUttRVBneUFveFRMVWJieUp2MUwrWXZtMWErb1JVR1RKRHM4M0Fh?=
 =?utf-8?B?KzluUmp6R3ZFOFAvdEZKRnlvMVBjVXplUG56SUphMWJ2N3gyRTNraGdjVmdK?=
 =?utf-8?B?LzNGMHlyekp4TTdhM0R3RWZPQXBoWFFnTExQMnF4ZE93TzlJK2R1UnAwaHQ5?=
 =?utf-8?B?c1k2Um5MZDZ2RDEyeXZOQk82RWNhRW9CRjZXK2NnRVVOR2txOWY1Wk1NVDJq?=
 =?utf-8?B?RkQzRjNuUm1TVVkvMnpQd3IrelZWRFFZUUdUb3hDWW9nT2YzSnVsOHJGMm9t?=
 =?utf-8?B?TUFFT0pGbDZGMTc1bko1bytweTBnTGQxbEpSQmhlSFI5eFFURkltS3ZMM05U?=
 =?utf-8?B?cU5QU3hrS2ZhbWxnUWxYRTlZSkkxeTJ5QXdrTzh1U1pGSms1ZTcvVytiV3FD?=
 =?utf-8?B?SUtPZFoyUlljM2JWZDR5UFJLbHpoa3FrVXpJL1ZJMjQyNmlhSHNQODJUNFNH?=
 =?utf-8?B?dTJpNEZYdDVMQ2FBWHdmenBkd2lUMnZpcm05SmFLeGFBVUZybmdFc2lZWGRs?=
 =?utf-8?B?YUh5c0dkV1F3OFNXRXVLZkVHZ2J0cVg2aHREbm95VGhiOGxpdGY3Rkozdlhl?=
 =?utf-8?Q?QE3gxZoGuZLMDc7A=3D?=
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: FHxa7hPD/6SyV828Kiod0KEtVaQuOU1wroKIgBGd6pJk1hebxuh1VjJpltRs+47fMvMxa7JE3Qmf4nFg/SjokUsKA+/HYd9ePJywQG0aBgzzJ837enGhJifTquykqP6BTrv18tOXltuQurlFp73wDcaTemshfRg9lKw31sW31YdkNb+eX1fe2fe12jE3c5A3oj+SZgNOMP2mRITqP/1650reedhFTGz9xjPZqGSz3suqJwQRZYkt3aYsXisD5SBwgRNMPz+h3sbKzD0i89PNGnaMb2L/u9jiP5yyZk5NNe07/5FC10VbUgAJQ046rKnIJY4tZ1fU9jZvMHAabYaBFg==
X-OriginatorOrg: onsemi.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CYYPR02MB9828.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fab0a73-cfb6-423a-7246-08ded251a7b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2026 00:35:28.0517
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 04e1674b-7af5-4d13-a082-64fc6e42384c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: S5F4SRFFiiZa35HEiI8I+UYGLjJy0EziREpjpvYl/tpqtpD1T8sZ10egq85U6GxLRdYFCSOwmQnaLDSGQG5Dx0pSeFPvBAjlLWnLSJrZrN4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR02MB9110
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: lZ3ZxuVlJPSTynMo9omBcP3gAcvJsEFi0TImxxl5t_s_1782347732
X-Mimecast-Originator: onsemi.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBHdWVudGVyIFJvZWNrIDxncm9l
Y2s3QGdtYWlsLmNvbT4gT24gQmVoYWxmIE9mIEd1ZW50ZXIgUm9lY2sNCj4gU3ViamVjdDogUmU6
IFtQQVRDSCAyLzNdIGR0LWJpbmRpbmdzOiBod21vbjogcG1idXM6IFN1cHBvcnQgZm9yIG9uc2Vt
aSdzIEZENTEyMQ0KPiANCj4gDQo+IE9uZSBvZiB0aGUgcHJvYmxlbXMgaGVyZSBpcyB0aGF0IHRo
ZSBjaGlwIGRhdGFzaGVldCBpcyBub3QgcHVibGljLA0KDQpBZ3JlZSBvbiBib3RoIHBvaW50cy4g
Tm8gZGF0YXNoZWV0cyBvbiBvdXIgd2Vic2l0ZS4gQW5kIGNoaXBzIG5vdCBhdmFpbGFibGUgdGhy
b3VnaCBkaXN0cmlidXRvcnMuIExpdHRsZQ0KZWFybHkgaW4gdGhlIHByb2Nlc3MuIEkgYW0gd29y
a2luZyB3aXRoIG91ciBwcm9kdWN0IHRlYW0gdG8gc2VlIGhvdyB0byBtb3ZlIGZvcndhcmQuIFNv
LCB0aGVyZSB3aWxsIGJlIHNvbWUgDQpkZWxheSBpbiBnaXZpbmcgbmV4dCBwYXRjaC4gVGhhbmtz
IGZvciB5b3VyIGZlZWRiYWNrLiBJIGhhdmUgYWxsIHRoZSBpbmZvcm1hdGlvbiB0byBzZW5kIGEg
Y2xlYW5lciwgaG9wZWZ1bGx5IA0KYWNjZXB0YWJsZSBwYXRjaCwgDQoNCj4gc28gd2UgY2FuIG5v
dCB2ZXJpZnkgd2hhdCB0aGlzIGFjdHVhbGx5IGlzLiBUaGUgb25seSBhdmFpbGFibGUNCj4gcHVi
bGljIGRvY3VtZW50IGFwcGVhcnMgdG8gYmUgdGhlICJvbnNlbWkgRkQ1MTJ4IEF4IERpZ2l0YWwg
Q29udHJvbGxlcg0KPiBVc2VyIE1hbnVhbCIgd2hpY2ggZGVzY3JpYmVzIHRoZSBjaGlwIGFzIGZv
bGxvd3MuDQo+IA0KPiAiVGhlIEZENTEyeCBEaWdpdGFsIENvbnRyb2xsZXIgaXMgYSBwcm9ncmFt
bWFibGUgZGV2aWNlIGRlc2lnbmVkDQo+IGZvciBtYWNoaW5lIHZlbmRvcnMgdG8gY29uZmlndXJl
IHRoZWlyIGVxdWlwbWVudCBhdCB0aGUgZmFjdG9yeS4iDQo+IA0KPiBUaGF0IHJlYWxseSBkb2Vz
IG5vdCBleHBsYWluIGFueXRoaW5nIGF0IGFsbCwgYW5kIGFjdHVhbGx5IGxvb2tzIGxpa2UNCj4g
YW4gQUkgZ2VuZXJhdGVkIHN1bW1hcnkgd2l0aCB0aGUgQUkgbm90IHVuZGVyc3RhbmRpbmcgd2hh
dCBpdCBpcyB0YWxraW5nDQo+IGFib3V0LiBBY2NvcmRpbmcgdG8gdGhlIG9uc2VtaSB3ZWIgcGFn
ZSwgdGhlIGNoaXAgZG9lcyBub3QgZXhpc3QsDQo+IGFuZCBpdCBhcHBlYXJzIHRoYXQgaXQgaXMg
bm90IGF2YWlsYWJsZSB0byBidXkgZnJvbSBhbnkgZGlzdHJpYnV0b3JzDQo+IGVpdGhlci4NCj4g
DQo+IEd1ZW50ZXINCj4gDQoNCg==

