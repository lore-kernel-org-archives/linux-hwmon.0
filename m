Received: from usb-smtp-delivery-120.mimecast.com (usb-smtp-delivery-120.mimecast.com [170.10.153.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32FCF3AE6E9
	for <linux-hwmon@vger.kernel.org>; Tue, 23 Jun 2026 23:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.153.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782256448; cv=none; b=LIRe0y/1btRyRcP9e66XR6c5j9BqmIOFvWGXhIHjKGtGlqLM60QzYTZ8q9rUOwLrOaiREvL7+YgE2ZQ1ry0gAjHtS1uMCdwKEwWYN5liBkxmb9i4VtNyn/xp321d/B8szVwd2x7davRf+PtD/7U+cElU/z4Pr4sJCUc7KuuQVQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782256448; c=relaxed/simple;
	bh=8i3kQwirmdmg0Kcw/kOY2a1all4CmENxf8WKxueAvII=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 MIME-Version:Content-Type; b=Rccy7NING6axdmKxfdXGPqUZcT3kuuk3NcqLz5nYy1lwC8NUuGd1bxW4xW68kRKMJf7biUkaM8mPHrUO6Cwi8KyLDcqXFz5zrSD2ENth1m5iDWf/scE6/Xs5mnoyvxjUuMiZ+tB+hqBOOkKynyqfiMn+2p6DwxWI5LWyZkdnwSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onsemi.com; spf=pass smtp.mailfrom=onsemi.com; dkim=pass (2048-bit key) header.d=onsemi.com header.i=@onsemi.com header.b=hJZNOF+f; arc=none smtp.client-ip=170.10.153.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onsemi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onsemi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onsemi.com header.i=@onsemi.com header.b="hJZNOF+f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onsemi.com;
	s=mimecast20250127; t=1782256446;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8i3kQwirmdmg0Kcw/kOY2a1all4CmENxf8WKxueAvII=;
	b=hJZNOF+f4nU13t85imQu4MeY9MK1xKSFGaorDh9iuw3AsbWvOoQiYZH4ItBJgUF6s4ED2u
	ngjwPdzmFVVEnY+j01HN0OGyW45w7vozw6Gtpikg3caR4Syjb9ihkrasX9szD+VgME9Vvd
	CbZNwy6VRNB/7ZAotDuCF6gfH60YvhC6veSoQS4RKib1P/now2jWM9PszUjIWxyLAuy2yu
	KiqBpk97bXOgZriYBY/MYOvEH4Yu2Xbuys5UyFDaDsZFi1O1fValDvgKkhoe4IoteEdiG4
	fHGnY/aJEmg+GIaxyLRHQyGjsnccLRuD6WiLLtEPkZzr+wkcBJe9HpqQ9s2tQw==
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010035.outbound.protection.outlook.com [52.101.61.35])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id usb-mta-55-n6R0rSwzOZGsu-rbinpILQ-1; Tue,
 23 Jun 2026 16:12:55 -0700
X-MC-Unique: n6R0rSwzOZGsu-rbinpILQ-1
X-Mimecast-MFC-AGG-ID: n6R0rSwzOZGsu-rbinpILQ_1782256374
Received: from CYYPR02MB9828.namprd02.prod.outlook.com (2603:10b6:930:b8::20)
 by DM6PR02MB6763.namprd02.prod.outlook.com (2603:10b6:5:221::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.19; Tue, 23 Jun
 2026 23:12:50 +0000
Received: from CYYPR02MB9828.namprd02.prod.outlook.com
 ([fe80::2767:f7d2:778c:8dca]) by CYYPR02MB9828.namprd02.prod.outlook.com
 ([fe80::2767:f7d2:778c:8dca%4]) with mapi id 15.21.0139.018; Tue, 23 Jun 2026
 23:12:50 +0000
From: Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>
To: Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [PATCH 3/3] hwmon: (pmbus/fd5121): Add support FD5121, FD5123 and
 FD5125
Thread-Topic: [PATCH 3/3] hwmon: (pmbus/fd5121): Add support FD5121, FD5123
 and FD5125
Thread-Index: AQHdAtUEg1iU98CpwE61O70G8ttbHLZMs8IAgAAPR6A=
Date: Tue, 23 Jun 2026 23:12:49 +0000
Message-ID: <CYYPR02MB9828DECA23A26C6ECE4B930483EE2@CYYPR02MB9828.namprd02.prod.outlook.com>
References: <20260622-support-fd5121-from-onsemi-v1-0-b31767689c65@onsemi.com>
 <20260622-support-fd5121-from-onsemi-v1-3-b31767689c65@onsemi.com>
 <320c44c9-924f-4b7e-a46a-37a72fa7267f@roeck-us.net>
In-Reply-To: <320c44c9-924f-4b7e-a46a-37a72fa7267f@roeck-us.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CYYPR02MB9828:EE_|DM6PR02MB6763:EE_
x-ms-office365-filtering-correlation-id: f728576a-521b-4d48-4d7f-08ded17cf211
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|23010399003|7416014|1800799024|366016|38070700021|11063799006|4143699003|56012099006|6133799003|18002099003|22082099003|3023799007
x-microsoft-antispam-message-info: qkfTDeAPkNH/4eKXfZH1CLW9JQuXgOf0LL/x93tWOSRU74X5pyvfGmz55bDTe74avdkqbpw6a3zeqT9UrQJXkIry1ns6QtI3bdcebOy/jmDWlAXtrNsIc06oSRTI16SCwQvvoH9lE466RGp9vEPJogu78cHZ8nTOaIXErCle+b0jf4h1JLzwdZTiQX4mFaEwNgkgO8gRI4Q+ic5KvBm5BhjvNsRdn5ctCre7gF1EPsYfsSlBRWNnPEhFjgHjSWSK/Qouj5ZMb0+TnQWTsbSYthaCNdWY7nh2BBceg78vONMsHe/sAO1ImpBZWteFlO/VzL1PTIGGDiR+1XjDoHYPYeOaKg2tA5HUIqbJIvxV9EVI7S6O/YBgCjpauZDamAGAYynkaUJ9+WWfSIYeXlssckWO9M6A6bKg8jXeVXhQRNQnW9K3dOBM/rKG+Vum/sfbDeMnZ851CIniehMVnqiKaUGAjAhPsYZwHjJrzdnjrNlr5VA6G7Xk4QsWmVEi1GFIN/Wd+Id+pq+9fPQkAMdvxBL1Y+8ynhuMWpaIobADuR2+ofuA5INto+nJkDfaJGf2yQH+s7dCaHF08c5700ZMxZCs8FORY/ummLRbEGja+ZOqbpXWxKrONznm0N037OuciDYToHnvZkSRj+J0ai2YoBCYaDo3pu9wxV7FB3mdq217dMNZSZxZDTxnJj4P8b5zIrDtRmy3zflKuBBpNEdkCJk5b6tIc/sqE+kknGg38cc=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CYYPR02MB9828.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(7416014)(1800799024)(366016)(38070700021)(11063799006)(4143699003)(56012099006)(6133799003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eFRUaGFPUDE0TXFTSkRVOW85bEY2VGVtbU1GYjZCRk1rK040UzhXMEJWL1FP?=
 =?utf-8?B?OWFWTjUrdEVRbXlQalljRzIyVVhoS0hNZ0dBVlBKdFFGYlRNUU5aTjZtb2ds?=
 =?utf-8?B?azBwOXdLSkxuSnlIM0pxZ0Qvb2doQkdGblA5azBCSkU1eVJ5bkFIWVlSYURu?=
 =?utf-8?B?Q25zd05mZUhta1ZCNzVJZWRGbnJKcEtiZzY1cUpGRW5tVWxkUCtOYnAycWZB?=
 =?utf-8?B?czl3Q0FLdlVJZkZOYzB3aHl5SCtWMytFUWhBUHgxUnpqUTlmR2RQd1JZcFhp?=
 =?utf-8?B?dU5RL0twbWJmZmhKK3NSZlp1TmpPczRNcmFkQlBmNnpBREFPMnJtaWsrVDlp?=
 =?utf-8?B?N3pDQnlRVGp5bmg5MThycVpuaDhQYUprUEw5c0hJemFuekdleDJMdzJKOVVT?=
 =?utf-8?B?cWFMaTN5NHRCS25OWVovbnNSSWI3K1BMNGVsOVhTbFNkVTAzS1laRjRxTVQx?=
 =?utf-8?B?UjlkREduQ2JRRWF3YUJYc3A3OEVOL3V2bTB0MU90MHRySkM0VWt6QnZJWjdj?=
 =?utf-8?B?T1FBaHpsMDZvMFB1cy9kcVUrd3M3MWhJU0o4b3BrdkVwUithZGVFNWhDbUFR?=
 =?utf-8?B?RUkrenlJS01JT1dXMFh5M3JTRDUvMTVyTFQzZDBEZzFhdHowVXI0Q0szZURa?=
 =?utf-8?B?ZWNLRzFMaUR1VjJxVjV3elJJU1lVTW9KS0tKRmM3a09NOUs0WU90anJHend0?=
 =?utf-8?B?emF6YXJjdEJqaC8wMUxtVzY3bHgwdmQvaGt5WllNbXBvcnJhQzZVWTlvTWxj?=
 =?utf-8?B?ZTV2b3lSemYrQ1RlaFNkbWRtVXo1c0VlME8zeWxIcTNObzVvV3lma0o3NzZQ?=
 =?utf-8?B?Uzh0bVFwejdqRlFsanNRd0RFZ3pIZDVoVE9qUUlqRTRBUmVyTzg5b0g3ckdL?=
 =?utf-8?B?bFBBdXF1ZEIzNktCNVpsZUpnbjJYYXZtY01mYzFJTDJqek5wWDZvZFJhMVFx?=
 =?utf-8?B?YzBnZnZmditZZ0RJUjlia3oyY2hiUmxVakw3WEwzRi9JRGNzTDk4OEs2Vm1K?=
 =?utf-8?B?bFlDd1hZVE5KaFhiL0lHT2xOZ3pSOVRoSExCRVV5RjNKWElYc2NGTExGOVh1?=
 =?utf-8?B?SGF4M1RreHZWVzZIVVpKdjRXaEhhQVZWdExxQnZITVdkZXc1Z0hSenFWL3Ns?=
 =?utf-8?B?UVVXOXRaZld2TFNhQXNnTFBMby9TUXBocXZsa3llS2VTR0VRVkVva3dROSsv?=
 =?utf-8?B?NXJLa0VsZnFVK2F2WWFZaTlqdENoM2x5cHRQemdqNS94b0NWNnNLZkF4WkdC?=
 =?utf-8?B?NmQrbndMbmlqdTA3RTBvSElacHR1dm4rVjFuelF3UWQ0aUJTSWFWNGdyelJ3?=
 =?utf-8?B?NWVsZnJhY0ZjMnMxd1drVURRZmtYaUVCbHVlZ2FWUHNUU0dQK2MrSjNJMEps?=
 =?utf-8?B?M0sxOCtiYlVsN09sTUh4Y0VpQ3ZCSUFyMkRWUzFPM0hhVHhiSG1WQUFYRlpL?=
 =?utf-8?B?NWtrV3d1NFB5MGFKcVAvaUEwNGN5QUZQVDB4Vlc2WU43MGk2MUpFcWlIUTZX?=
 =?utf-8?B?amo2SFdLMGkvOE1UaXRhYXZNWnlOUDl6QVhMR1llMVZDRTdOSVBpVXMxaGJv?=
 =?utf-8?B?Z1poeGI0TjFGSUh2UTlmWndpRmNTTE5YUUUrWHFTWnZqWE1SbFZML0h5WEhy?=
 =?utf-8?B?VzM1TExYUW4zRVRlNWlSZ2lKWU4veHcvbDBVWlVIaDBHc1lmc0JnSWdZVHV5?=
 =?utf-8?B?S3hQUDJyY1orZWNRSkkwQys4Y2EvL3NFelZROGF4aDFOOUExMnpCK3BLR21V?=
 =?utf-8?B?S1NXRzNlZ2pWakpyd2tOR2lLRFlQcHFRbGlwT3lwNjY1a2tWQXN3VEgyakEw?=
 =?utf-8?B?Nk1UT0s0SWJBNWtTZk5Eem5YTDJRUFovd2p1ZFJ2SDBSV3RDRWIvSGtDSGdS?=
 =?utf-8?B?eE1sU1p2aGsweGo1cTQycXUrbWwyWXdCK1FGQUVja2ppYzBsZkF2bFZzbE1J?=
 =?utf-8?B?NkFXeHhlcTB3emtJWEY0S3dPZ1RJbU4rNWtJOTRtT3B5bzVGa0tDSUc3UUtV?=
 =?utf-8?B?K0gxV0tSL2U0a1k2bklhYjNOejVHR3lkTitlMDhYaTZTbngwdWtSMDRWbmxw?=
 =?utf-8?B?SzAxNHdnTFE2clNVbW13eFpMcUZvRHJoV1pTd010SVFuZnZOajZLdEplMm0r?=
 =?utf-8?B?Y0lSZXdTNCsrNzgyOFRBRncrUHJzWUtQMWFUNHp5TElQU2lDMHpBRVBpYXdC?=
 =?utf-8?B?QzRZWWIwMTF1L09sRnBPLzdXK09iUXB0dGlPV3Z0aXFtall5NFNBcDdvOWVB?=
 =?utf-8?B?WDhoVngxWks5MFE2V2NyREhINm9qSTNTQkpzczFFTkR6MFFzOEVuVHkvKzBH?=
 =?utf-8?B?NmRaQ2RqbGdOVkoya3hRSzJKdHhyN0tScTVsdDhuVjg0TDdGUGlRZStRNk1o?=
 =?utf-8?Q?zN7bxdFdtD1hRHS8=3D?=
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: KY2Kxy8hokN697Fsty01bfipq4Bw4wrs4TVqNcsLPnSSkAaeyosF7/1SaIxDSh7zWTpV27JElt4OOsXZWeSly+nXkW+4K0xjUNYJJFv7vgLrI++emGEXtW5C8Ajm3GaZP3j6r9QtmRFzI374PEX6gfPHMi22vOjPcvlV6MxE4h9ZtJFc7gUAL9/y/Wcph5K+QWMGBrpb1cq5xJbSyLIfo6A1rE5X47S+BJfSRSgnXJO4L+4q0Pym17dpyqpaTCki785oP8SF+Kg3S3APKj4p13M+NoTMxmccvTI1zbPaxjggDtOTc6wbbQLqoTbUZx4IrXq95da2ZIgeKwSG8CgyIw==
X-OriginatorOrg: onsemi.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CYYPR02MB9828.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f728576a-521b-4d48-4d7f-08ded17cf211
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jun 2026 23:12:50.0018
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 04e1674b-7af5-4d13-a082-64fc6e42384c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i/TmVf7iz1mu0KZFb4LO3SwuH5jfXlmjUMPL3dMhf6Eprkn2WZmhP886veXntMxkVXT9jIX/YPEjtYLNab4jwfA6Fr0Ljni6D49A0EYxcnI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB6763
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5iLB1XY0leQ95hnWJY338UR6RBfCvKHbvYn6c2oO4_Y_1782256374
X-Mimecast-Originator: onsemi.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEd1ZW50ZXIgUm9lY2sgPGdy
b2VjazdAZ21haWwuY29tPiBPbiBCZWhhbGYgT2YgR3VlbnRlciBSb2Vjaw0KPiBTdWJqZWN0OiBS
ZTogW1BBVENIIDMvM10gaHdtb246IChwbWJ1cy9mZDUxMjEpOiBBZGQgc3VwcG9ydCBGRDUxMjEs
IEZENTEyMyBhbmQNCj4gRkQ1MTI1DQo+IA0KPiANCj4gPiArICZzZW5zb3JfZGV2X2F0dHJfdm91
dF90cmFuc2l0aW9uX3JhdGUuZGV2X2F0dHIuYXR0ciwNCj4gPiArIE5VTEwNCj4gDQo+IFRoaXMg
aXMgYSBjb21wbGV0ZSBuby1nby4gV2UgZG8gbm90IGV4cGxvc2UgcmF3IHJlZ2lzdGVyIGRhdGEg
YXMgc3lzZnMNCj4gYXR0cmlidXRlcy4gWW91IG1heSBleHBvc2UgZXNzZW50aWFsIHJlZ2lzdGVy
IGRhdGEgYXMgZGVidWdmcyBmaWxlcywNCj4gYnV0IG9ubHkgdGhvc2UgZGVlbWVkIG5lY2Vzc2Fy
eS4gVGhlIGFib3ZlIGlzIGp1c3QgImxldCdzIGJsaW5kbHkNCj4gZXhwb3NlIGV2ZXJ5dGhpbmci
LiBNb3N0IG9mIHRoZSBhYm92ZSBzaG91bGQgYmUgcHJvZ3JhbW1lZCBpbiBtYW51ZmFjdHVyaW5n
DQo+IGFuZCBub3QgYmUgdG91Y2hlZCBzdWJzZXF1ZW50bHksIG11Y2ggbGVzcyBhcyB3cml0ZWFi
bGUgYXR0cmlidXRlcy4NCj4gV3JpdGluZyBiYWQvdW5leHBlY3RlZCB2YWx1ZXMgaW50byBtYW55
IG9mIHRob3NlIGF0dHJpYnV0ZXMgY2FuIHR1cm4NCj4gYSBib2FyZCBpbnRvIGEgYnJpY2suIEl0
IGlzIGJhZCBlbm91Z2ggdGhhdC9pZiB0aGlzIGlzIGV2ZW4gcG9zc2libGUsDQo+IGJ1dCBleHBv
c2luZyBpdCBhcyBzeXNmcyBhdHRyaWJ1dGUgd291bGQgYmUgYSB0ZXJyaWJsZSBpZGVhLg0KPiAN
Cj4gSSBhbSBub3QgZ29pbmcgdG8gcmV2aWV3IHRoaXMgZHJpdmVyIGFueSBmdXJ0aGVyIGF0IHRo
aXMgcG9pbnQuDQo+IA0KPiBHdWVudGVyDQo+IA0KDQpUaGFua3MgZm9yIHlvdXIgY29tbWVudC4g
VW5kZXJzdG9vZCBhbmQgYWdyZWUgb24gY29tbWVudCBvbiBleHBvc2luZyBldmVyeXRoaW5nIHdp
dGhvdXQgZW5mb3JjaW5nIHdoYXQgaXMgYmVpbmcgd3JpdHRlbi9yZWFkLg0KV2Ugd2lsbCBkaXNj
dXNzIGludGVybmFsbHkgdG8gc2VlIGhvdyB0byBnbyBhYm91dCBpdC4gV2UgbmVlZCBzb21lIGN1
c3RvbSByZWdpc3RlcnMgZm9yIGN1c3RvbWVycy4gV2Ugd2lsbCBpZGVudGlmeSB0aG9zZSBhbmQg
DQpleHBvc2UgdW5kZXIgZGVidWdmcywgaWYgbmVlZGVkLg0KDQoNCj4gPg0KDQo=

