Received: from usb-smtp-delivery-120.mimecast.com (usb-smtp-delivery-120.mimecast.com [170.10.153.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C669A3DCDB8
	for <linux-hwmon@vger.kernel.org>; Tue, 30 Jun 2026 17:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.153.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782840197; cv=none; b=SSBH0IiqxKlqb8AciJihnDdkxx+ERJMGxfqy4kz7PsQX3S6KeFQrWeJgJhvv6Cbo+aCQsAyN2gu6zK745tJjexsXxqj4LYAdMew929qIyQUc6rVslobd10EcLW75BOi3yXY/fNfngzDyvip0h4XFTIQ7kfDHoFkR+KQGA0MSj6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782840197; c=relaxed/simple;
	bh=EIKLfVxeX4UjvjUsMH57nMal050P+38lR90m+Sb2wOE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 MIME-Version:Content-Type; b=QTGst3PNn3+yA7ABERrfrITK6Ov29qjNcx+ZvGn2j9luhv2ZBrWQXB8N11NPXEs6QYD3uaMJBKCTXSxRBTp0JIGWWfk2qq58L+8Y0cPRSuu/HZdaZKyKYBLMpHFT3dLkS0VH63fILjRfynm6hhzo3uphVG2di2Nuas23Fj77s7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onsemi.com; spf=pass smtp.mailfrom=onsemi.com; dkim=pass (2048-bit key) header.d=onsemi.com header.i=@onsemi.com header.b=Kk02CUiV; arc=none smtp.client-ip=170.10.153.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onsemi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onsemi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onsemi.com header.i=@onsemi.com header.b="Kk02CUiV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onsemi.com;
	s=mimecast20250127; t=1782840187;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EIKLfVxeX4UjvjUsMH57nMal050P+38lR90m+Sb2wOE=;
	b=Kk02CUiVhbe51GEeWYKMt9I7et0FioTW+Qei+tMUm2G05PWBE8ZrWSafT5i8uSyTF2lV+2
	Fu9FJVHoGfXjve1lwvUS1T+1t0zTocI+EoK6e4fkyI68zY1THJB+JUaX+GxI2uZVFe3CKc
	gDVCogBnS1P1HhRT1RrPYqJQOD36MvTQiXNw93XNllEGkEcVaLDhDmbGUvrC+GoQmuF8+t
	2hYK3KxSGeT3+8nm6nl0+JwihCEh9vDqvHaMnipqjk7ytGb9kotaenqyuhsKa2MiAG9maT
	CYhoicFGhY+sq7xDeH67jLlWcixox+Tbf3CCjtzBNhMonMSh4dT+bB598dUsLQ==
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011012.outbound.protection.outlook.com
 [40.93.194.12]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 usb-mta-6-d_aydLttNQ-2cXcaXHyDpg-1; Tue, 30 Jun 2026 10:23:02 -0700
X-MC-Unique: d_aydLttNQ-2cXcaXHyDpg-1
X-Mimecast-MFC-AGG-ID: d_aydLttNQ-2cXcaXHyDpg_1782840179
Received: from CYYPR02MB9828.namprd02.prod.outlook.com (2603:10b6:930:b8::20)
 by DS0PR02MB11038.namprd02.prod.outlook.com (2603:10b6:8:293::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Tue, 30 Jun
 2026 17:22:57 +0000
Received: from CYYPR02MB9828.namprd02.prod.outlook.com
 ([fe80::2767:f7d2:778c:8dca]) by CYYPR02MB9828.namprd02.prod.outlook.com
 ([fe80::2767:f7d2:778c:8dca%4]) with mapi id 15.21.0159.012; Tue, 30 Jun 2026
 17:22:57 +0000
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
Thread-Index: AQHdAtUG0MJr3kYk70C0stjgUT+1+7ZMZ+AAgAA2+5CAAAYPAIABpgGwgAALPACAABXNEIAI9fUA
Date: Tue, 30 Jun 2026 17:22:57 +0000
Message-ID: <CYYPR02MB98281A2314A718EC3841464583F72@CYYPR02MB9828.namprd02.prod.outlook.com>
References: <20260622-support-fd5121-from-onsemi-v1-0-b31767689c65@onsemi.com>
 <20260622-support-fd5121-from-onsemi-v1-2-b31767689c65@onsemi.com>
 <20260623-anybody-gutter-e6ca04f53bdb@spud>
 <CYYPR02MB98280DF78A07EADACFD084EE83EE2@CYYPR02MB9828.namprd02.prod.outlook.com>
 <20260623-scared-judgingly-7efc1c188670@spud>
 <CYYPR02MB9828EECB3F6AFDD2A7BD3E9B83ED2@CYYPR02MB9828.namprd02.prod.outlook.com>
 <eed3e19b-8cc7-4aef-b058-b2242c94c940@roeck-us.net>
 <CYYPR02MB982898B8E8EC0513EF55D44083EC2@CYYPR02MB9828.namprd02.prod.outlook.com>
In-Reply-To: <CYYPR02MB982898B8E8EC0513EF55D44083EC2@CYYPR02MB9828.namprd02.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CYYPR02MB9828:EE_|DS0PR02MB11038:EE_
x-ms-office365-filtering-correlation-id: 0038a05a-09b3-4d2c-fef6-08ded6cc3a4e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|23010399003|7416014|1800799024|366016|18002099003|22082099003|38070700021|4143699003|11063799006|56012099006
x-microsoft-antispam-message-info: LpcHQD2hfBbekgUxnyaBGIp8UTb6ChfCmVAU9y9kRBxta96mQq0c7sZjqEowtLOchCvBWLjMR8V592z0UMdlHq/AQHB8TVGtACbIjMBMsDZJeHZUaUk1EnHnEfyzcSmECkO6uFqaMJQV9bUqAeyizbv4T4+CFxbHYdfH2YecQYnaFVIsddUhEX7f1sFpegwOVmGQws0JgBMH2P1QO9Ol4JDo6UDqXFr22sz/q9VxSnjrWOMvggpStLfkxqlO0RGramirJvVxKaEurA5owK95W6COsSlicEMHXSTluiYVaJrv9ciEfmAVnKRKk6uTcocqqoeOfTyNkkN0awWMZJIwWMC96KnkPC8695XC2CTscGnu+8ElBa8QWA0mNv9/71K8iostdgDIh5jkwmMgWB/iyqVfej911AJY8THmdwvYxkj0AO0cikOLMU2XU5YqdIwD0uXOPaMCIUuIbMNqsAbfxE1z5iKFYoQ1NCzv03ITHGx/I0G17Zp+LDy5vPN5C39CkM9m7xZFCL7rmB/zJXLbKMCIKBFTl+TAoSjjCoXFK9VnRlh05FdQOk3q/O6INrxqn2tQ3uSUQfzPQfVMJSc2Q3jEP6mPbN2IJtDmHj3jbykKNyhENiA73YTVBRrVvdd+6Gzs00GGaWEhZh2ifM1ZuGN0Z7QNx8VlO6P/2iyI8XQgz9qJpjg1ZTJugTM6+vNcokxUpzwyqCDRRfi/uc/uLkML9VS02KAPZv4D2WNAVgg=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CYYPR02MB9828.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(7416014)(1800799024)(366016)(18002099003)(22082099003)(38070700021)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VFNWS09KL3lMZEhqdzFmNzZRYncrQXNxL0cyVkhmQUV0b1dkK3ZHSFZkaXNl?=
 =?utf-8?B?MU40akZJd0JhQmtjckd1QWR1TDlMS0IvZHAxWnVwK0N6WDZwcGU5d2NPNlAr?=
 =?utf-8?B?K3pIZ0g2cHdhRUpsUFc0eXllbExJODQ1eElEWGt5QmxjbkNsMHk3Zm4ydzRZ?=
 =?utf-8?B?dElVZWQrU3I3WTVmK0NEQ1pLeG1LV1VrNE8wUlNzTUVSRHJnTFg0c2FVdEpj?=
 =?utf-8?B?REw5bFhvU3JIajYraDhnYWg5N3dWeEdGVVJXSjFsdzNVaG5udFRpb2J1VU1N?=
 =?utf-8?B?VEpkdEgwYXArd2ZTY3p4dUdCRHE0QXRFTE1LQjE1Tjl6RkVXeHpPdC9iWGph?=
 =?utf-8?B?Nk1YY1dGUWwxZFoxazZuSjRRQzlPYzVQay9DaTJKWWVscHh4UkNMNDhqZEFp?=
 =?utf-8?B?QzFhRTRjU3NTUmJ3SktmZ0RTR0wzL040alV1Mm1SNzFtdm1hNlErQjFNczk1?=
 =?utf-8?B?QUJhemh1ZDAyU0VmaUMveFlzQzN1d2JJMm5MbnZLMU9yNzJyaU1RL0lnL2sy?=
 =?utf-8?B?T0F1RG1TdS9YaTF2QnQvc3VUdkltREV2bUY3UkV1RUJRQUMzaWlTMkx3WFFY?=
 =?utf-8?B?VEZaaXNZTUVHcVBDanF2WW5nUEhoaC96YjUxYjB2cWdjZEdaQUFJTlpMNzVu?=
 =?utf-8?B?T2hGNkpkRG54dkRhYVlnT3N0U2tXWXBteXFkbGh2Tm1TWXhwbU1PazVvN3c0?=
 =?utf-8?B?cm9MUnk2aTdRMFJXKzdjQVZ6eUpjTFhiSC9UclQyRm91N3FHN3pPTldPcUlK?=
 =?utf-8?B?NkQzSWZWSWJKazFEaDhKYng4aUFYMTcvUzlHeG1LcjBFOU0wWWc5NGVRRTRh?=
 =?utf-8?B?Ym0zTEo2bCtxRGRacHV2MGpYVGF6amZYMURab24wM2tUaWQzQklWNTc3VTJF?=
 =?utf-8?B?bWdmWWYydFU2WVBNaGZmK0pxdktoczN4OW12ZHkxSDNrSDJNMHlrN1laam5M?=
 =?utf-8?B?czBGTXgzREJycGpXT2pIcjRQRVdkRDJ5bUhwallQMmNmTGNkRlo1TUVaUjFm?=
 =?utf-8?B?WE1sL2tkeG8zUCtMcFRUZkVNVmJCYmpKeXZ1SVBuMzdISlZaMSsvZm0zNi9S?=
 =?utf-8?B?TjZtdC9zM2IvZlJtQVY2d29kQ1ZpcFZodUxqSHkrcFhkOGt0QWxQZEN3MW1H?=
 =?utf-8?B?RFZqRXhiMTdRUHROeHpjaTJ2OEJuaCtoY242b0lsSjJxeE55WjB5NGc3V2Rk?=
 =?utf-8?B?dkgwNFhJLzlIMnFWY3hnd2VDWVlVOHhQbTI2WkJVM1kySU9sbFZ0N0pkYUU5?=
 =?utf-8?B?ZHJXZ1lzMTZKRW5vSE5IODA4LzNnZ3dqWG9TN3d3cDN2MGVKMExkWndwQjJL?=
 =?utf-8?B?VThtT0JkNkw5UU1TcVB4a1AvVEtxcjJ0NGhJc3FESVUxeGFNZitYYUltejd3?=
 =?utf-8?B?SkVRa3FJaGVoaVZCVnl3TUhPbFZWY2tBV1UwbktodWI2eXpoNU50OURRS0hG?=
 =?utf-8?B?MG9vMlozMDg1cXVNQ0lUMTdaVXJwOEdaT2tMdmpnbnpyanFmRDVMN0FVVDBT?=
 =?utf-8?B?SjlMU0gvY2syeEcvc0dZRk41dGMxSnZRSlhqK0VDNHZDZU9iOVB4cUxLVk1s?=
 =?utf-8?B?bUNMdE9DcTQxOEZvT0ozd0lSQlhYeUNrNGk1ZjJXNnVjb3ZCclUzM3ZNY3p4?=
 =?utf-8?B?bXQ1MnhlREVjUFNsMlVGR2lka3BlcTBPNUwxeHdCY001OHNNeW15bm16MnYr?=
 =?utf-8?B?dUQxZ01jYkpaRERndVJUd1hsbE5SN0EyTzVMNDVJaEM5KzRSZmhLTEp4UGRV?=
 =?utf-8?B?YVloT2twM3lWWmhvRHM4UEQ2M2ZYUC9qSndoaHBjTUMvTmxlRzlMK0laMVNB?=
 =?utf-8?B?LzAyajdVMFlWTkdyTjNFbGZMVFN4bWhVNGVJNElwWnJ6ODlZbkZ6SXlycWZS?=
 =?utf-8?B?ZEhyYkV4Ly9FS3BmdVlVV2pqMUU1b2Z4ck5xM01pUEptZ1FNUDBrc0RMNy9s?=
 =?utf-8?B?K0xUN09vZFJFa3BzSGExTnl3SmNMbDBqeUxTbWs1TktIVS9nWDk5ZURlTHdT?=
 =?utf-8?B?UXFuUzRreTZHOXA5czlOUFZQZXlkT3VQRzdFcEZlUGdNV0hWMmRUN005VUU0?=
 =?utf-8?B?UzZXYnQ0bUpGOEZkc3N3OGVaSG12WjJpazlNcTB2a0E1V0l5QnplbURKb01D?=
 =?utf-8?B?STNNbEMyWHlzMFRzZDlBTmVHOXVPRHJPSjRVcTNIbzBvMVZMc29pTTNjcmxQ?=
 =?utf-8?B?TEhFRlBnY3Bma2JJZjhWdHkvdTI5QWhveEpmOGs4Mkx3MnhtTGxEZlNkVVY3?=
 =?utf-8?B?WVdrMGVNQm5aUDQ4cVJhclNzbHhoaEIxKzFkYlFFeUd3STVUc2hEdDVzeVYz?=
 =?utf-8?B?QVRaR1Z3eWFpMEc3cFlMMCtOQTEyek5OWldPd1JFUWUwaUNFanVhdFlvRVRs?=
 =?utf-8?Q?N/0ZctGC0aaWhJLs=3D?=
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: WegMjY46DNehs23QXhNQWOHQqtOgeeeSKkKBXmH3ZF0TaT5/1IitJjHmgB0tbKijqfd82XsEgGcNLe8Hp0Jbsi6imZ2CTryZdPs8vwnZmiBG84lDBghC/pRY5A/YppGj099ej67xT0oZ1lOS+yBWn/Ukm82SAAq9A5MpMhbdFqUePNoPtdrt6tlAbbZHjcBndzVbMsreC1Yg4PxlwpePiMkYcMXk8F26y/cJTPzwNMCvOfJKqgZ+DB+vLbOaxlGlMmZEWxdOxVNAV2bwFH9Nmi1Kysq5qvEXyBHGmEsjeJvc4qIts4wU8P4+6XhO1dl0736PHDAB/vIUhfX8ArxFmg==
X-OriginatorOrg: onsemi.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CYYPR02MB9828.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0038a05a-09b3-4d2c-fef6-08ded6cc3a4e
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2026 17:22:57.2755
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 04e1674b-7af5-4d13-a082-64fc6e42384c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9ib4rDwxjGkqHOsWAXFpWcyPLr0bIxhnYghUjt3dr3/VU9/W5ZDz9Ha4H93aX1Q6BE9pKxvT8uIbJnSWEzXpg55ILgzrjIEMxrKGK2TrwFA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR02MB11038
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: S8yU0dlISn-yFnNObljRjl_jyYvsXDz_PyjfCbix0ko_1782840179
X-Mimecast-Originator: onsemi.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFNlbHZhbWFuaSBSYWphZ29w
YWwNCj4gU3ViamVjdDogUkU6IFtQQVRDSCAyLzNdIGR0LWJpbmRpbmdzOiBod21vbjogcG1idXM6
IFN1cHBvcnQgZm9yIG9uc2VtaSdzIEZENTEyMQ0KPiANCj4gPg0KPiA+IE9uZSBvZiB0aGUgcHJv
YmxlbXMgaGVyZSBpcyB0aGF0IHRoZSBjaGlwIGRhdGFzaGVldCBpcyBub3QgcHVibGljLA0KPiAN
Cj4gQWdyZWUgb24gYm90aCBwb2ludHMuIE5vIGRhdGFzaGVldHMgb24gb3VyIHdlYnNpdGUuIEFu
ZCBjaGlwcyBub3QgYXZhaWxhYmxlIHRocm91Z2gNCj4gZGlzdHJpYnV0b3JzLiBMaXR0bGUNCj4g
ZWFybHkgaW4gdGhlIHByb2Nlc3MuIEkgYW0gd29ya2luZyB3aXRoIG91ciBwcm9kdWN0IHRlYW0g
dG8gc2VlIGhvdyB0byBtb3ZlIGZvcndhcmQuIFNvLA0KPiB0aGVyZSB3aWxsIGJlIHNvbWUNCg0K
R3VlbnRlciwNCg0KQWZ0ZXIgeW91ciBxdWVzdGlvbiwgSSByZWFsaXplZCB0aGF0IHRoZXJlIGlz
IG5vIHBvaW50IGluIG1lcmdpbmcgdGhpcyBpbiBrZXJuZWwgdW50aWwgdGhlIHByb2R1Y3QgaXMg
YXZhaWxhYmxlIA0Kd2l0aCBkaXN0cmlidXRvcnMuIEkgZG9uJ3QgaGF2ZSBhbnkgdGltZSBmcmFt
ZSBmb3IgdGhhdC4gU29ycnkgZm9yIHRoZSBpbmNvbnZlbmllbmNlL3dhc3RlZCByZXZpZXdpbmcg
dGltZQ0KZm9yIHRoZSB0ZWFtLg0KDQpJcyB0aGVyZSBhbnkgd2F5LCB3ZSBjYW4gbWFyayB0aGlz
IHNlcmllcyAiYWJhbmRvbmVkIiBvciAib24gaG9sZCIgZm9yIGFuIGV4dGVuZGVkIHBlcmlvZD8g
DQoNCj4gDQo+ID4gZWl0aGVyLg0KPiA+DQo+ID4gR3VlbnRlcg0KPiA+DQoNCg==

