Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.14
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795108829;
	b=HL+fHMvHCOHYjoQGEf7In1cffA56mmFsMrC8gOhkfhVidnioMxNeA/+4GYmzzd4fyKrW
	 hyJe6G5gO+ZT5OhrzY2CbfTaDRRo8tjRxqzPXD3sb/WtX9t1TkjZ7gERQc8RyFH1xf3DK
	 2oFpcVpjPouU6J8e7TI1rfqKy00tp3DAZs7ehHWJPqkeL80QCQM9QyjFVMaXqwgE1ensj
	 gN98E+696S08vNk/WkYO478uvPm6mA69K53ReSxwettxgW6UdihnFmhhIDDSv8g/J4oJt
	 bWwlsjinQ4sfCH+HXDtATceg0I7/Yomq8qEe4rsMquEFSGA5tvoFxnlHDVFqcMmcHdg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108829;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:
	 x-ms-exchange-atpmessageproperties:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:Content-ID:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=Pv/mUWG6bhz1mze+rK3WOJWTAcd+w8K6K4Sqkajxs30=;
	b=4TtJuM93DBqQtozufRWQax2773kbIPDeU2TJ0QvUuyV1ErMMXKb9hRqQ2v2aUpU04F4D
	 K++6P447CCzNMQ9r4/NZxuFoxuWmal0Y5m3xNSjNAQwpOuYn/gCgBEft04W439E8JCYie
	 CeHNbOG9WU8JO4J6D/REtbHXVzRB3+dPINWax0oGycnD1KQQ4Ppzq/AGcupo0BCRjTRoz
	 zr5uimtCgkAIgzO0SyBoH0NeZe1xB2os+TjY4VfbXpHPwpiA+jpQvL+OSLt04LN2spJ6/
	 oMrYT5ehb/St/CsK1XL77ZM1GaAFRilFAGAzOJ3V90ORdj8sL4rUjjikUEFmmt8jE+Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=siemens.com;
	spf=pass smtp.mailfrom=siemens.com;
	dkim=pass header.d=siemens.com header.i=@siemens.com header.a=rsa-sha256 header.s=selector2 header.b=Xjdg6jCa;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.14
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010014.outbound.protection.outlook.com [52.101.69.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F842606A320
	for <linux-hwmon@vger.kernel.org>; Thu, 19 Nov 2026 17:20:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F842606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siemens.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=siemens.com header.i=@siemens.com header.a=rsa-sha256 header.s=selector2 header.b=Xjdg6jCa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xn0Uzszm5rTipVhE3Nx9/9YKkAIl9/Zx+jMygIlOtGCTzRTMS2e9SbR3hN6TmpdQwUfNMNLFJ6hJ5KNeLWhYLUBJ0BCmv48tYVeuUdp81Ntun6N4QBIfkrKD539zd+8+OA7m3wAxYSt2d6IQIGAxj/itNFM7bEAjpRq8bUQzh+Xm63RuPW3JyIbtOmwOANVlJrCQDKQeKswijPMrkJjCWrgztKU96ZCNkGgQgVESti2fm2T0xuxxflurAP6mXguvy881JxcewEhDQf2lo0bfKkvxuSRQxez5D05UelBKI/l1CORadt61x96lnHVlsf4pnHB5miIXy6bloJvbbf0PVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pv/mUWG6bhz1mze+rK3WOJWTAcd+w8K6K4Sqkajxs30=;
 b=KJWXGTH+6iQ/jeFRNNcFZnfken3dEuYsiriUZ3ufiupldWk9YNQKDDC1NkP+P1QopZg9W6nLXlteSUBRuiVhobuyf0w/CbtmBc+mNF3TdK4yBQXaJDV61Q1pHP8LvxQNwt1JEsd/OZTu1+gyDcpKTQo52aEhBNOLqo1ZpmM5JhJaIZnMsFnJqRGCiiv0Af4kmzfeSFOpZUpPqJN1e79Gfwhud4+dUPnS8SoRyxLvvjL+++plK0ztMRKW8VQW523Kbb3LOj6d0yMSiwCD1Lj1VUzXKJomkNtAcsrzNX4FxmvlHoKuyTWZkXr34Ayg2MPZcUxMbPUZCQQLEtOs5LIOlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pv/mUWG6bhz1mze+rK3WOJWTAcd+w8K6K4Sqkajxs30=;
 b=Xjdg6jCaHaP2GAhX4kwAv2NQm/KykaC3IK3s2MjCt3coqbnsDBRk3x758YuLeYsQ5JO/V6ZBo+oHW+tBa//CgzoMkoeNFgUVuRv+Hzj4dyF7+7gmg1OCozWaZvPzy91cU5E2odbsIF9crJjpi06P3CjDVfydf90PS9y8zegS4+fl1FAkJSI7W9LuIXGmHfucDnTD/f3MjLIDYEa5ui8MKLmhSaROce9k6S5pkFFIekpoteF0Q0Kk+wY8cTMD3/X9kGVUrBHI62xA+rsIuxpu8BdbMWhalC6qG0SjhGXxyZpI1gnJPN2t4Qf6Z/6sahT2NgCiM/d8Wk06m4+5dCD8oQ==
Received: from VI1PR10MB2368.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:803:84::20)
 by DB9PR10MB5428.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:333::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.2; Thu, 19 Nov
 2026 17:20:20 +0000
Received: from VI1PR10MB2368.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::11f8:23f:fe2d:c421]) by VI1PR10MB2368.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::11f8:23f:fe2d:c421%6]) with mapi id 15.21.0662.000; Thu, 19 Nov 2026
 17:20:20 +0000
From: "Niedermayr, Benedikt" <benedikt.niedermayr@siemens.com>
To: Guenter Roeck <linux@roeck-us.net>
CC: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH v3 0/2] hwmon: simatic-ipc-ec-sensors: add BX-54A EC
 driver
Thread-Topic: [PATCH v3 0/2] hwmon: simatic-ipc-ec-sensors: add BX-54A EC
 driver
Thread-Index: AQHdeEjumgxel3S8eEW72lwsVO7Nxrc1o+8A
Date: Thu, 19 Nov 2026 17:20:20 +0000
Message-ID: <a2ed243f-3e77-408f-8042-7151800ccefd@siemens.com>
References: <20261119164708.1280862-1-benedikt.niedermayr@siemens.com>
 <3f758e2a-7b95-42fe-9b4a-407b3c1992c1@roeck-us.net>
In-Reply-To: <3f758e2a-7b95-42fe-9b4a-407b3c1992c1@roeck-us.net>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR10MB2368:EE_|DB9PR10MB5428:EE_
x-ms-office365-filtering-correlation-id: f793d696-8284-481b-f9f9-08df46616397
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|38070700021|10067099003|261026121527099003|4143699003|261026140227099003|56012099006|11063799006|261022105027099003|261009223027099003|261028144727099003|18002099003|55112099003|22082099003;
x-microsoft-antispam-message-info:
 UCmUqmh7nE3j6Z1bgV+0My6ulBUHA9wNqNGOVkqigfgC/NA3G+iuZ3CCKc/jB1t1yy6CO3AP2UXS1CNzDO3o+kNzbw4wMRuYoIdlrR9imKmMig/lGAJ+SkAMXFlh5VH6R1xmhoVWNTuqlBj3veYysxsO5P4PYwqBUXP3nW268+KshEc7bH7WfboSoz+qoupdQgw4RRjlQHUqvTb3z8CFIro3c//zvDAnLD1yfUoAHRpSevckHP/05seOfK3c0K8gFPNAcuXZGETcDao+OUz5DQmSGpji2U5YEo9hXKEKhxpgmARSdgDa7nkO/qimqmrR+Exvg5sO/SA5f1J7aBDBe8DAkko4OGBP7/3VVRQmC+nmH2vkT8XfZS2CvmaNqkK6KL8JVYMQjEIGP1vWF6QfGd227jUlBB82lxvtfUIrIeNxNGvgjKfmkDqmqV4/k4Nh7zvTHXE3EMAMsG+cRxZcTphjqsgVRaQum3evN+X+FdBHCCk0pZtUvZsPH+lGoJgSQ0gMa5yv7GVB/ZO7DrU6EHhym7pA7tZXbBDKqrXBJuhuS0iYqKY7DnkhWQMNKCIfnkgrTrjnTUQmRu9ArayrUR3H3YegC/vQFumNncN0Qc4rzfbGOYYBo8dXzwItdy8z2XFmsXe/bi3WIvlkeempKdfqgj64VgBeE/gybsWtpRDsU0OhjjSSgIpRpa5pro5E7ciOFb3PyXGwTkNM+OyXbN7sL+a7rPx09zEymFMyZjM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR10MB2368.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(38070700021)(10067099003)(261026121527099003)(4143699003)(261026140227099003)(56012099006)(11063799006)(261022105027099003)(261009223027099003)(261028144727099003)(18002099003)(55112099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OU9yNUhyZUFqWThrMEtLRnZ2OEd3Z29WQW9nb3NFZXh0RS9YUkNxSSsweEtD?=
 =?utf-8?B?VG1iV0pwNEVTSUJVT0RaODhlcDJkK2R5ZlNHeG1teEtpUDIrWlh5NTd0bCta?=
 =?utf-8?B?SVU4MWV0R0ROQ1gzR3VpUE4xQ2RmVk5zMnI5dmtLQ0lLVS9ZYmNGRncxNG4x?=
 =?utf-8?B?UHorUkc3ZlRLTko3Mng5aXUxU21sWFIzMG50WVR2bXFpMkRZMS9INDhqb01r?=
 =?utf-8?B?ZkFDUDZIZXVrWFpTNnlOdFd0K3JWL3BQdUJvM2U0Rld2WldBM29kejdDNGxm?=
 =?utf-8?B?OEJpMnRmc2Q5VUg3blhjUkI2ZGg4YWthTlhiR1cvVXlHQ0xncGtZUkJQY1RU?=
 =?utf-8?B?c01EbnJGNTFpS281TUl2cHRNOVoxK09OcHhDRzMvZEppRThUUVF5d3lKaS9O?=
 =?utf-8?B?RmR2K0FKblQ5cUpmZzkrT0pKZStFVjVBZEI5Wms3ajlYR2puMWhLU2VXRVNN?=
 =?utf-8?B?R3pERTlSeEVvT2RHVXpnbEtHL0IrL3habVZiUytycjBMYXpVUSsvb0ZFZFJq?=
 =?utf-8?B?YUU5ZUQvME9xelJZOVBPdHpRODZ2NUpkNzk2L0hvOEd0L0w2b0JwQkJwZkl4?=
 =?utf-8?B?Z1FKQTlUc3FxR0czVjdhdk5vZzYwajVrakpYZ0Y1dDM2aXBvdWhJTmFJS3li?=
 =?utf-8?B?bWQxZHMrNEFrN1duUGlacFBQWTVITVBMdWVheDN0TFd3V0N6VFN6MFozUlZz?=
 =?utf-8?B?eWl6VlNLQWVvWVlvMGNJTzBvQ25tVWVYenFZVnNXUytrR3c2ZnlYeU44UWF3?=
 =?utf-8?B?SlVLdFpFWFpxandKb09mR0FSNWxoMzBTNEVKUmp4RVBERTEzb1lTZnVZajRZ?=
 =?utf-8?B?Q0dQdEZHWHNUZXdZWi9EZTdXSmpUc3J3SG8vL2g3dnFvOG43WVl2Z3BnTzJZ?=
 =?utf-8?B?VnlHdTlmcmlZVWNGQlFlSUMxa1Q2ZG9GM2tJd2FtQU8zUWV0dGJ6aEFrSHdQ?=
 =?utf-8?B?ZWtENVp2YzR4Q01yclhHeTl6dUxra0VKY2xreWZNcEFTMCtGMnNTckI1OWRz?=
 =?utf-8?B?dWh4RXNPQmw1ZTVqeW5JdnVLYkZjZkpkd2JDYTNZT1ZYK3pCazBvaFI3dStW?=
 =?utf-8?B?M21QVSs2OFg5Vzl3VjlFUWJncytVa3dxTGRJbS95elNJTGtFaFA5UWVZelBs?=
 =?utf-8?B?c2xnVEhrdTJ1MG03WmJ1K0NIbHI4ekt1bU1MOEJYVlI1SlBFYlA2VDBGVWhT?=
 =?utf-8?B?QTB3Vnh3UklzcGhVV2NNdVovbWU4QkVWS1VFT0pJMHhsMXREK2REWTRXTnZ1?=
 =?utf-8?B?QTBCYUtRSS81MktoZHdsYVFac253Z25JZkZKS1F2SzJtby9IOE5tQk1SbS9E?=
 =?utf-8?B?ZTlXMXZIUzFtZFJpbzQ1RnVCZDlXRnYyaUpOREE2SStqSWQwRW9wY1FEekl3?=
 =?utf-8?B?eGVxMlJ6TW9SV2FwUm9aWUZReEVFMlBrVjdsNWg1UitKMk04Q0pFWm1EY290?=
 =?utf-8?B?dFB5WFBNc0M2SWJ3cGVadXRsTlNudUc3NzdEZUsrdm9nNGl2bDhZV2grcCtK?=
 =?utf-8?B?TG5ESmxuR1dqVWxTS01IUXkxbUhPdm5hSVduRmhUR1k1K1lKc1NsVC9UblR2?=
 =?utf-8?B?TjdRaW03VGl0VmJ3MllNdDlHY0RKV3o4RkpHcS9aME9OeE9QbUdWRTFseE80?=
 =?utf-8?B?ZUF1NFpsL0ZrVVJQNTZkcXpHa3h3R3lPSGdpcER5dUVuQWJoQ0gyWFRpcGRI?=
 =?utf-8?B?UmQrMTZCMTM0RjlrZTQ5VHZ6Ry9hQXo5b0xxVDM0aWswc1ZuZmljVlU3ZnJB?=
 =?utf-8?B?eU9mekhWK01IeG0rckRPMExRWDd0R05RNWxGUjkrc2hvNEpUTWoxK1VUQmN6?=
 =?utf-8?B?ZkRybFBPT1hpSnRidStTVk01OVBJUkpGb0VpUXdSeEthWEcrNUFOWjdwM21U?=
 =?utf-8?B?ZFBMQjNnTldac1BDUnpFemFIVVRvcFVPUk1IS3gxNnUzaG1YU3VLSWRtYkwz?=
 =?utf-8?B?YUZjK1hkclFtRW5VNm9sSURmK2s1cXVMVWtLZEI2RFBJSHBRWmp5d1BML2Vv?=
 =?utf-8?B?dlBGbllxVllaV2NGaFh3K3RFM3haUzdLNTBLZ1JBUXB4MDRxeExDdlcxdWZK?=
 =?utf-8?B?U2JDb3N1bzltaE1IUTlDU3pWVWMvTjhScm9JWkR6NUdJMkxpZW1iZHhKMmph?=
 =?utf-8?B?L1k4eEZEUEhBVWVHRHJDOVRIRFJpMWRFTkdGc29HRi82bjRTWWVybWl2WnlV?=
 =?utf-8?B?V3JuZDNZY214dTNNUmxxbUx4M2xzTnR0NGw5d2cwRU81NHovaUJRSWVmWmdJ?=
 =?utf-8?B?anlnc3IxNWV4dzFNZ1UyR1JCTkJOVWoxZVZteURYYUg2RFIrOTRua1NzQXVX?=
 =?utf-8?B?anRzblRnU09XdVBBeGdCck1GOTFqaFVPb0wvRTJZWjhYOHJaQm83ZXhzNjBC?=
 =?utf-8?Q?WZAyD/LVtEvNtHp4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <37105B3FB776C6408A779207375E688F@EURPRD10.PROD.OUTLOOK.COM>
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
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR10MB2368.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f793d696-8284-481b-f9f9-08df46616397
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2026 17:20:20.6361
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zAeKwGnUPkDjI9yU28pMbuS6pH4gMXMm6MLJegj/+s7+H+TEvKpCbPTiCMk+NOuhtmMJaNgLgLtcklL9dvM0UZg8HSetki33+SYjFvMuaoE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB5428

T24gMTEvMTkvMjYgMTg6MTAsIEd1ZW50ZXIgUm9lY2sgd3JvdGU6DQo+IE9uIDExLzE5LzI2IDA4
OjQ3LCBCZW5lZGlrdCBOaWVkZXJtYXlyIHdyb3RlOg0KPj4gSGksDQo+Pg0KPj4gdGhpcyBwYXRj
aCBhZGRzIGEgaGFyZHdhcmUgbW9uaXRvcmluZyBkcml2ZXIgZm9yIHRoZSBlbWJlZGRlZCANCj4+
IGNvbnRyb2xsZXIgb24NCj4+IFNpZW1lbnMgU0lNQVRJQyBJUEMgQlgtNTRBIHN5c3RlbXMuDQo+
Pg0KPj4gVGhlIGRyaXZlciBsb2FkcyBkaXJlY3RseSB2aWEgQUNQSSAiX0hJRCIgd2hpY2ggaXMg
cmVzZXJ2ZWQgZm9yIFNpZW1lbnMuDQo+PiBTZWUgY29tbWl0IGZvciBtb3JlIGluZm9ybWF0aW9u
Lg0KPj4NCj4+IEknbSBub3QgdGhlIG9yaWdpbmFsIGF1dGhvciBvZiB0aGlzIGRyaXZlciBidXQg
SSByZXZpZXdlZCBpdCBhcyANCj4+IGNhcmVmdWxseSBhcw0KPj4gcG9zc2libGUgYW5kIEkgd291
bGQgc3RlcCBpbiBhcyBtYWludGFpbmVyIGZvciBpdC4NCj4+DQo+PiBUaGlzIHBhdGNoIGRvZXMg
bm90IGVuYWJsZSB0aGUgaGFyZHdhcmUgcGxhdGZvcm0gb24gd2hpY2ggdGhpcyANCj4+IGNvbnRy
b2xsZXIgaXMNCj4+IHByZXNlbnQuDQo+PiBJbnN0ZWFkIEkganVzdCByb3V0ZWQgdGhlIGVuYWJs
ZW1lbnQgdGhyb3VnaCB0aGUgaTJjIHRyZWUsIHdoaWNoIGlzIA0KPj4gY3VycmVudGx5DQo+PiBp
biByZXZpZXcgWzFdLg0KPj4gSSB3YXNuJ3QgZXhwZWN0aW5nIHRoZSByZXZpZXcgdG8gdGFrZSB0
aGF0IGxvbmcsIHNvIGl0J3MgbWF5YmUgYmV0dGVyIA0KPj4gdG8gcm91dGUNCj4+IHRoZSBwbGF0
Zm9ybSBlbmFibGVtZW50cyB0aHJvdWdoIHRoaXMgdHJlZSBpbnN0ZWFkLi4uIEkgZG9udCBrbm93
Li4uDQo+Pg0KPj4NCj4+IGNoYW5nZXMgc2luY2UgdjI6DQo+Pg0KPj4gLSBmaXg6IHNoYXJlZCBt
dXRhYmxlIHRlbXAgY29uZmlnIGFycmF5IGluIHNpbWF0aWNfaXBjX2VjX2h3bW9uX3Byb2JlKCkN
Cj4+IMKgwqAgU3dpdGNoZWQgdG8gYSBkeW5hbWljIGFsbG9jYXRpb24gYXBwcm9hY2ggZm9yIHRo
ZSB0ZW1wZXJhdHVyZSBjaGFubmVscw0KPj4NCj4gDQo+IEEgc3RhdGljIHRhYmxlIGFuZCB1c2lu
ZyBpc192aXNpYmxlKCkgdG8gcmVwb3J0IHZpc2liaWxpdHkgd291bGQgaGF2ZSANCj4gYmVlbiBt
dWNoDQo+IHNpbXBsZXIgYW5kIHByZWZlcnJlZC4gQWZ0ZXIgYWxsLCB0aGF0IGlzIHdoYXQgdGhl
IGlzX3Zpc2libGUoKSBmdW5jdGlvbiANCj4gaXMgZm9yLg0KPiBJIGd1ZXNzIEkgaGF2ZSB0byBk
b2N1bWVudCB0aGF0IHNvbWV3aGVyZSBhcyByZXF1aXJlbWVudCwgYmVjYXVzZSBmb3Igc29tZQ0K
PiByZWFzb24gcGVvcGxlIHNlZW0gdG8gcHJlZmVyIHRoZSBtb3JlIGNvbXBsaWNhdGVkIGFwcHJv
YWNoLg0KPiANCj4gQW55d2F5LCBsZXQncyBzZWUgd2hhdCBTYXNoaWtvIHJlcG9ydHMuIEknbGwg
bGV0IHlvdSBnZXQgYXdheSB3aXRoIGl0IHNpbmNlDQo+IHlvdSBhcmUgdGhlIG9uZSB3aG8gd2ls
bCBoYXZlIHRvIG1haW50YWluIHRoZSBkcml2ZXIuDQo+IA0KDQpIaSBHdWVudGVyLA0KDQp0aGFu
a3MgZm9yIHRoZSByZXZpZXcgYW5kIHRoZSBzdWdnZXN0aW9uIQ0KDQpJIHdhc24ndCBhd2FyZSBv
ZiB0aGlzIGFueW1vcmUgYW5kIHdvdWxkIGRlZmluaXRlbHkgc2VudCBhIHY0IGZvciB0aGlzLiAN
ClNpbmNlIEkgbmVlZCB0byBtYWludGFpbiBpdCA7LSkNCg0KDQo+IEd1ZW50ZXINCj4gDQoNCg==
