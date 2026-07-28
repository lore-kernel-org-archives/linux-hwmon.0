Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011009.outbound.protection.outlook.com [40.93.194.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE0E83B8958;
	Tue, 28 Jul 2026 06:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785221523; cv=fail; b=Ukqm4LKCWLexhcudqttNOlxkqYzjITi5VR6hiRFaUL5YVuUor3kacB7RK7DkZld5Wl7ZNuY2jhZclLSrz+6cYZZu5m1LtA6Yp8m7mtAn2IhrSX+HmPQIsqFJLb7MYj0t+blMr2Xof9ZAIuVUlRsj5zt7aox7+JwFVBXcAyDrnkU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785221523; c=relaxed/simple;
	bh=+54gHmVGkhJwOe6Sjv4iXJdLVjN/RS/FlUdIyvCuYOs=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=VTytEPecjlRoQ9oYh9V6H0R5Ca8fzC6elfqoOyg+GG9jQjIyZ1G6aRq3nLhumMDkqyf8HKWRgFQN21ssgg4ryU6eTLc8qjpeRpzz5phi9Dq/q0a6aqhscIAg4pjZL+P0Rn10VNXDsZ91Dbe4i9vdhslRcTz2QjHkJa6gabMxmGs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=km+QqCl3; arc=fail smtp.client-ip=40.93.194.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="km+QqCl3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AJ+W+4/zREb1sFTp3NPQD1/mYGloLcY+IQnkYPAi2BTjiT390PeqVad0TrLbmn9SpB6xiAzSn5o6KDWDm3jQYU283m8fB4RYx5zxPg8byv0RXpcpOfGK+H7KAthJKiMeHbB8v9gCxsqm+/nWoFA5eE0mwX82Jfuu4WK4hGZwJmuY3MLWOtGrRDp8RVzlkS5CT16arGf1fXnxkOnJCTo5P+R8H5m8+83Z9QNntN1NmOTs9z4rBzipAfl5QbT++BXVXhbqHpoie+oW+DmXY2hqSbkpPEtLYmbW1f/2q5VSMuE5ewQ6+fupWjQbDX96aKL56njT6TcX6Z/RKr9QcCIevA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+54gHmVGkhJwOe6Sjv4iXJdLVjN/RS/FlUdIyvCuYOs=;
 b=phtZcy2JITjXlY68ijtPBUZUXFmkFSEULwD8ZYp3Q+UDQrsgIDg8cMgcn+3sWZNP0ftI35p1notyGMOr/IOpK47gveMchtI7qSOLKOPAbIoJ9ve/fg8z94jQfttUFQEa26QEQobzj7STASsuPF7J9NSupLKERjki/g43cJ9d24P8QkPo+4iQJVlkg7hMl3PFsEOJyMKwLa8rc6q0xR/IztPD9y/xfe5c9xpNn1wWyIlx60ia1c84TixolYQtTH9DfhnXBjaTCCrRWNMARt1926m9UhCyOv0QWHk8fwfZS3lsB6yTOux97X/d8SeEnWEa6TjqhqMnlCNZukiiVAy6Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+54gHmVGkhJwOe6Sjv4iXJdLVjN/RS/FlUdIyvCuYOs=;
 b=km+QqCl32d2x7hTJ3UtOTDBRPeo2OzlRunoM0/Sji6yJdOkkRcIx8f39yucdphCy9EVfL8fuH60z4bDF2ID2reJzli8wLz12/VCAiVe0BxFkN4ola33MK0kpGXSuIdheftL5pfSfRH+y8y2TdSi/haSxrefCi1J7buwzlFLwR/0lfnFcRUMjee2s0MKyFgvYwJVb+D9i1S5mCgm3vIRDki36DSbBxa9JcmVpyFi1EVcUS+w1G78ocVzV5bFiGRQcGHFg16czasqGr6jA9imo7W364zSjgBiGz10pcESjq1uO0K+O1KMT+Tz5FJDSlGCILJPLmfw3TYZ9yuR1rlXg6w==
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com (2603:10b6:a03:2d3::20)
 by SJ0PR03MB6951.namprd03.prod.outlook.com (2603:10b6:a03:419::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Tue, 28 Jul
 2026 06:51:53 +0000
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01]) by SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01%5]) with mapi id 15.21.0245.012; Tue, 28 Jul 2026
 06:51:53 +0000
From: "NG, TZE YEE" <tze.yee.ng@altera.com>
To: Guenter Roeck <linux@roeck-us.net>, Dinh Nguyen <dinguyen@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jonathan
 Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v8 2/2] hwmon: add Altera SoC FPGA hardware monitoring
 driver
Thread-Topic: [PATCH v8 2/2] hwmon: add Altera SoC FPGA hardware monitoring
 driver
Thread-Index: AQHdGmjO9/F/XJkvakuYEuRn7XqWQrZ6oGCAgAfl8gA=
Date: Tue, 28 Jul 2026 06:51:53 +0000
Message-ID: <4336dcd9-9988-463d-aea7-22191ff78636@altera.com>
References: <cover.1784785709.git.tze.yee.ng@altera.com>
 <d29d05f8bc25a89a0dbf59c8a0bb705f676a58a0.1784785709.git.tze.yee.ng@altera.com>
 <20260723061515.BAA0E1F000E9@smtp.kernel.org>
In-Reply-To: <20260723061515.BAA0E1F000E9@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR03MB5950:EE_|SJ0PR03MB6951:EE_
x-ms-office365-filtering-correlation-id: 2ba98117-a27a-4cae-8461-08deec74b528
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|56012099006|4143699003|11063799006|10067099003|18002099003|55112099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 3hit9icZDQlihNQ1s6yWppLJNB6ozHOKDNu3MhFMm47FGFORxqxWs8scLetTD6CqJkE5/SFX9RweUUeuFRnPGHvKCLgj/KH5Do0vXKeipRk6QZd5A7NcJt0uIE44wKD95afMijqk3i2jzWZsTUM7LVX0o2oF2tEsXBgDDflYIPP47i0aV3ChkGfSWvIYsnBClJiyobzxazxL0HboWJrK7PMGzPPJFbqF/C5KgSyNxA+B+LKOtrzDDnoBpkaKGfGkcqSQA15XOTWFXr7v2hvki8kPQWCK/8JgpKnP0z1EUuoThtceeY8sUGdG7q92HlHQAfjgqvW4lH+badCD72UR+Ha4QjFXV8pPkCe9c+BkcKhjJj9Bsrj4KaXbqGBMxla9OOUa8UAXED556yhZ3ullCiaz9qG4175zxgcE+GKHHJW2dqGIF423MdRvtIrkyKJ26gM0xRliUA2b+1oTRa2vd5B4wqITyqpwfV4/3+HLAcr39zTj3ZnlA6vtM1WCrJ0s86Sb2ueMt7DFA+hEPFe17/uI3usHGnTlIWY3Ip8OIcIEfEQtwOz56gAiaKGSvVwB4iMzhWBk+QFEOQjqsyoXOqtW04VQyzNxDwjvLvfFXeFuymWnLUUooZ0+KRt2at0dbr4AotOavdNDVoxQ3zBTSCFDha1yI//7IfZX7p6ODVa4+eCPu8xMp8bPHjzG96O2HSHVRSd7AX0R4qVZ1Tgm+W28ZYOl7wZXtQLkavzapFg=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5950.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(56012099006)(4143699003)(11063799006)(10067099003)(18002099003)(55112099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZW5QcUtpT2RQQjcwcU9nNm91bnRlNTNqejlnbUVIMW1HazliNEhnU0F5Mlk4?=
 =?utf-8?B?SzU3ZGV2QjR0a2EranJFU0lmVGlGMTZBQWNGTlpLN2V4NEdkWEtxQml1cWxJ?=
 =?utf-8?B?TXRPejlJdnJNL25OTFY2ejRwV1V1YVptNWZkV21oa2FXVEYxV283Nkc1WnVn?=
 =?utf-8?B?Tm1TYUdlTDlQMWxjck5NRmFqQWZUaGZFMlA2QTZUak4zTHRyLzcvZXBGSVA1?=
 =?utf-8?B?UHlucG0wQ3Z2TTc5NnBrUHZRSUQ3bmlockNmVld1cnpySFh0QnVBdVhQTXpy?=
 =?utf-8?B?V2cxRVBtNlNXcFlDcmZ2YVpCZnhiV25aU1JXVHZaVWYvWFlMWlhzRzE2cHpD?=
 =?utf-8?B?MGNjOXhtWXdsU1NzRkNiYWRxRjhIQ0xaSlZMNWx4L3h0ZmdkYXVDVTFlZFJn?=
 =?utf-8?B?c285T0x3aHdYK3hkYW9qcDlMV2dRTHh0QkcyalFUbFR1cEVqVHVlZ3NBZFZp?=
 =?utf-8?B?ZCswRElHdEttZEsvWWpxZ3ZLWHM5bWpPNlgzbXM0cmNTZXRqVm03NStZcDRL?=
 =?utf-8?B?czJ4dHpXWStBY3pkOUlWN0dJZUsyZmpjd3RFbXB0bklZQ3ZlcDJ3TTh3QVBv?=
 =?utf-8?B?UTJTV1lyOHc3a1JWZURpTFVlVTBSSkdXbDI3R3NROWdVdUQrODV0VklQTlRh?=
 =?utf-8?B?RW9wMDN6RjVjL0pySW80TXorS2NwY0c5elBPRlNvbkthbENFdDJ0UWhYY3Az?=
 =?utf-8?B?cEF6eDNaZTIxVGVXUXNDOCt5Tk1Xbjg1bnpHamh2Q1Y1NFZkbkNjb0tKdjQ0?=
 =?utf-8?B?MkQreUJtd1RqRFBGSVd6dVR5RzBrU09wWVBmcmZNYTFHN1BNbGxZNERDbGVH?=
 =?utf-8?B?UDJEZ3M3bE1RYUZoUHljbjZFR1FubVpLL052MlMzWk1FemcxVmJoN0Ftc2Vw?=
 =?utf-8?B?TGRTZzZpREZITVR5eGFucDNqMmFKUXpUemIvbXp5RXpVMWIrc0tETFlSSVdz?=
 =?utf-8?B?ZnVzaEkybTNCQVVCNnlYamRNM041WmJySGkyQ1ROdDc2cEtPTU1uR2ttNzJx?=
 =?utf-8?B?cCtCTXE4TkUzL3A2OW1pMHUvay9DU1gxRDM2L053OFFGOXo1aHZPL1VpajM2?=
 =?utf-8?B?V3lSNVJFWlYxbUQ5d3VmUC9uOXgvem5yc3BvSkljLytpMlJUeXVNeDRIZTFC?=
 =?utf-8?B?N252L0g3bGYzOVA3NFNObDNLR0MwV3EzM1VxZGdkZXdXc0gxNE9ySklOU2hu?=
 =?utf-8?B?VENkblRTYnV6Ri9mWTdMU0MxRFhTQUdpQkdVLzYweFVWdlkwTUxZRW9Bazdz?=
 =?utf-8?B?ZjFvYzk1emN4WFFoc0w1cmpCTllZMzRRSjhtWmxrU1I4Vkg4YVNQcnN2N1VL?=
 =?utf-8?B?eWpIK3A5Sm1kdTNjdEtsaVhaNVpIY1pkeFRsU0dlK2ZFMjdkdUpzTnFaQ3Bv?=
 =?utf-8?B?YU1IK2hwNWx4YzdaVE5XZ0w4ZWllM29uQ2RwVGZkZHdVTEFsN0Ywek0yMENR?=
 =?utf-8?B?cmFhajQ0TjZ4aTk2cVlBZTQ2T0FnZi9yc0JDSVRpZG1PMmhhMkhTYXBzMXcw?=
 =?utf-8?B?Q0FPVUNsTUJHN09NenFvVEVwVUhIWWFWVlRoWDA3K25Ba3BQL3FhVk9SVlhT?=
 =?utf-8?B?eDhEanF0T2NCSFc0MXZWQ25wNlF3K2l6UThraE1tdWdBTHNJZk5oTzhtTjNH?=
 =?utf-8?B?WkNqak1JSEthUDNxM2pBaVRxYUhzVEdSSGlqcWpRM0VRejRWTCtRMHRiOXho?=
 =?utf-8?B?OGY1TXoyZERUejBuNEo1UkdaTm5GOGJTeGRGaGRkRVR6bDFNTlJ3TEVqWDlx?=
 =?utf-8?B?d0Q5UVR1RzR5UnhEaTVsSUo2dTNBMk10bjFRN0pTTmN2R2szNUlYeW5kZWdw?=
 =?utf-8?B?WTlnNmxqRzI3T09NcVBZR1laS1dhTldUeWVDS1E4OHpQSldxd0l4cjRGT09t?=
 =?utf-8?B?SUhUbk9BVlE0ejFFTHJtOWMxNzlxQklWaGttdUNMTkRPSE9Id3k0dUFuS2x3?=
 =?utf-8?B?bmoxSmJ4SzFGSmVXNy9LVkh1S3RSS1c0U2N0UUVMU21BeDJZdHhyZW5HeXBZ?=
 =?utf-8?B?QXdFTFFJVHFiTXBkRmhRS2ZBdmhrbkxaY0RZd1ZLaEh6S291SzkzV3plQS9t?=
 =?utf-8?B?QWFvWHBQeURrdW0rZmd5YklnaGcvdURNTGdtZlVmUlBIT21US2pySXJSN1Jr?=
 =?utf-8?B?QVhnUmtCaVRRSW1kaXRtTnB1NHdFOWlXVWRSL1FPckFKMG45OVZjQ2dvbXYw?=
 =?utf-8?B?UjFRUDlVZlFUQkMvWGEvbnc0ZEFTbmtYRkNtK3lMMnFJd2Q2N2laK3pFNGhM?=
 =?utf-8?B?K0prYWwxd3JWVGJjalgrSU9kanRNTnZpL2xiTkE4OU4vbmExSTlXejNXb0RX?=
 =?utf-8?B?dWhNczFUY2Z5T0VIeHZoVGlPalhBaVZEc2lRTFVuZzRDUEp1MmNJYi9jK2tK?=
 =?utf-8?Q?KfEmgzEs/e7EvDto=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <34971042A681AC4FBEFE134592797B64@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5950.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ba98117-a27a-4cae-8461-08deec74b528
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2026 06:51:53.2270
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +EwlEA/LTk2wL7yuv92F/rMlBRC3VJ+EJGNbX8GW9r0760ScJePDqChuus5XvL7/ahlj1MJnUZ+18nBuNDAZEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6951

T24gMjMvNy8yMDI2IDI6MTUgcG0sIHNhc2hpa28tYm90QGtlcm5lbC5vcmcgd3JvdGU6DQo+IFRo
YW5rIHlvdSBmb3IgeW91ciBjb250cmlidXRpb24hIFNhc2hpa28gQUkgcmV2aWV3IGZvdW5kIDEg
cG90ZW50aWFsIGlzc3VlKHMpIHRvIGNvbnNpZGVyOg0KPiAtIFtIaWdoXSBUaW1lb3V0cyBpbiBi
b3RoIHN5bmNocm9ub3VzIGFuZCBhc3luY2hyb25vdXMgcmVhZCBwYXRocyBhYmFuZG9uIHBlbmRp
bmcgcmVxdWVzdHMgd2l0aG91dCBmbHVzaGluZyBxdWV1ZXMgb3IgY2FuY2VsaW5nIHRoZW0sIGNh
dXNpbmcgcGVybWFuZW50IGRhdGEgZGVzeW5jaHJvbml6YXRpb24gb3IgaGFuZ3MgZm9yIHN1YnNl
cXVlbnQgcmVhZHMuDQo+IC0tPg0KPiAtLS0gUGF0Y2ggWzJdOiBbUEFUQ0ggdjggMi8yXSBod21v
bjogYWRkIEFsdGVyYSBTb0MgRlBHQSBoYXJkd2FyZSBtb25pdG9yaW5nIGRyaXZlciAtLS0NCj4g
Y29tbWl0IDQ2NzU0M2M5ZjllMzg5M2Q4Yzg0OTk1YzVlN2JjOGJhYjMxZGZiMjANCj4gQXV0aG9y
OiBUemUgWWVlIE5nIDx0emUueWVlLm5nQGFsdGVyYS5jb20+DQo+IA0KPiBod21vbjogYWRkIEFs
dGVyYSBTb0MgRlBHQSBoYXJkd2FyZSBtb25pdG9yaW5nIGRyaXZlcg0KPiANCj4gVGhpcyBjb21t
aXQgYWRkcyBhIGhhcmR3YXJlIG1vbml0b3JpbmcgZHJpdmVyIGZvciBBbHRlcmEgU29DIEZQR0Eg
ZGV2aWNlcw0KPiB1c2luZyB0aGUgU3RyYXRpeCAxMCBzZXJ2aWNlIGxheWVyLiBJdCBzdXBwb3J0
cyB0ZW1wZXJhdHVyZSBhbmQgdm9sdGFnZQ0KPiBzZW5zb3JzIGJhc2VkIG9uIHRoZSBzZXJ2aWNl
IGxheWVyIGNvbXBhdGlibGUgc3RyaW5nLg0KPiANCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2h3
bW9uL3NvY2ZwZ2EtaHdtb24uYyBiL2RyaXZlcnMvaHdtb24vc29jZnBnYS1od21vbi5jDQo+PiBu
ZXcgZmlsZSBtb2RlIDEwMDY0NA0KPj4gLS0tIC9kZXYvbnVsbA0KPj4gKysrIGIvZHJpdmVycy9o
d21vbi9zb2NmcGdhLWh3bW9uLmMNCj4gWyAuLi4gXQ0KPj4gK3N0YXRpYyBpbnQgc29jZnBnYV9o
d21vbl9hc3luY19yZWFkKHN0cnVjdCBkZXZpY2UgKmRldiwNCj4+ICsJCQkJICAgIGVudW0gaHdt
b25fc2Vuc29yX3R5cGVzIHR5cGUsDQo+PiArCQkJCSAgICBzdHJ1Y3Qgc3RyYXRpeDEwX3N2Y19j
bGllbnRfbXNnICptc2cpDQo+PiArew0KPiBbIC4uLiBdDQo+PiArCXJldCA9IC1FVElNRURPVVQ7
DQo+PiArCXdoaWxlICghdGltZV9hZnRlcihqaWZmaWVzLCBkZWFkbGluZSkpIHsNCj4+ICsJCXN0
YXR1cyA9IHN0cmF0aXgxMF9zdmNfYXN5bmNfcG9sbChwcml2LT5jaGFuLCBoYW5kbGUsICZkYXRh
KTsNCj4+ICsJCWlmIChzdGF0dXMgPT0gLUVBR0FJTikgew0KPj4gKwkJCS8qIHN0aWxsIGluIHBy
b2dyZXNzICovDQo+PiArCQl9IGVsc2UgaWYgKHN0YXR1cyA8IDApIHsNCj4+ICsJCQlyZXQgPSBz
dGF0dXM7DQo+PiArCQkJYnJlYWs7DQo+PiArCQl9IGVsc2UgaWYgKHN0YXR1cyA9PSAwKSB7DQo+
PiArCQkJcmV0ID0gMDsNCj4+ICsJCQlicmVhazsNCj4+ICsJCX0NCj4+ICsJCXVzbGVlcF9yYW5n
ZShIV01PTl9SRVRSWV9TTEVFUF9VUywgSFdNT05fUkVUUllfU0xFRVBfVVMgKiAyKTsNCj4+ICsJ
fQ0KPj4gKw0KPj4gKwlpZiAocmV0KSB7DQo+PiArCQlkZXZfZXJyKGRldiwgIkZhaWxlZCB0byBn
ZXQgYXN5bmMgcmVzcG9uc2VcbiIpOw0KPj4gKwkJZ290byBkb25lOw0KPj4gKwl9DQo+IFsgLi4u
IF0NCj4+ICtkb25lOg0KPj4gKwlzdHJhdGl4MTBfc3ZjX2FzeW5jX2RvbmUocHJpdi0+Y2hhbiwg
aGFuZGxlKTsNCj4+ICsJcmV0dXJuIHJldDsNCj4+ICt9DQo+IA0KPiBbU2V2ZXJpdHk6IEhpZ2hd
DQo+IElmIHRoZSBwb2xsaW5nIGxvb3AgdGltZXMgb3V0LCB0aGlzIGNhbGxzIHN0cmF0aXgxMF9z
dmNfYXN5bmNfZG9uZSgpIHdoaWNoDQo+IGltbWVkaWF0ZWx5IGZyZWVzIHRoZSBqb2IgSUQgdmlh
IGlkYV9mcmVlKCkuDQo+IA0KPiBTaW5jZSB0aGUgZmlybXdhcmUgbWlnaHQgc3RpbGwgYmUgcHJv
Y2Vzc2luZyB0aGlzIHJlcXVlc3QsIGNvdWxkIHRoZSBuZXh0DQo+IGFzeW5jIHJlYWQgcmV1c2Ug
dGhpcyBqb2IgSUQgYW5kIGludGVyY2VwdCB0aGUgZGVsYXllZCBjb21wbGV0aW9uIG9mIHRoaXMN
Cj4gdGltZWQtb3V0IHJlcXVlc3Q/DQo+IA0KDQpBZ3JlZWQg4oCUIHRoaXMgaXMgYSB2YWxpZCBj
b25jZXJuLg0KDQpPbiBhc3luYyB0aW1lb3V0IHdlIGNhbGwgc3RyYXRpeDEwX3N2Y19hc3luY19k
b25lKCksIHdoaWNoIGZyZWVzIHRoZQ0Kam9iIElEIHZpYSBpZGFfZnJlZSgpLiBQb2xsIGlzIGtl
eWVkIGJ5IHRyYW5zYWN0aW9uX2lkLCBzbyBpZiBmaXJtd2FyZQ0KaXMgc3RpbGwgY29tcGxldGlu
ZyB0aGUgb2xkIHJlcXVlc3QsIGEgbGF0ZXIgYXN5bmNfc2VuZCgpIHRoYXQgcmV1c2VzDQp0aGF0
IGpvYiBJRCBjb3VsZCBvYnNlcnZlIHRoZSBkZWxheWVkIHJlc3BvbnNlLg0KDQpBIHByb3BlciBm
aXggYmVsb25ncyBpbiB0aGUgU1ZDIC8gQVRGIChlLmcuIGNhbmNlbCBiZWZvcmUNCmZyZWVpbmcg
dGhlIElELCBvciBrZWVwIHRoZSBJRCBhbGxvY2F0ZWQgdW50aWwgZmlybXdhcmUgY29tcGxldGlv
bikuDQpXZSB3aWxsIGFkZHJlc3MgdGhhdCBpbiBhIHNlcGFyYXRlIFNWQyBzZXJpZXMgcmF0aGVy
IHRoYW4gcGFwZXJpbmcgb3Zlcg0KaXQgaW4gdGhlIGh3bW9uIGRyaXZlci4NCg0KUGxlYXNlIGxl
dCBtZSBrbm93IGlmIHlvdSB3b3VsZCBwcmVmZXIgYSBkaWZmZXJlbnQgYXBwcm9hY2guDQoNCj4g
WyAuLi4gXQ0KPj4gK3N0YXRpYyBpbnQgc29jZnBnYV9od21vbl9zeW5jX3JlYWQoc3RydWN0IGRl
dmljZSAqZGV2LA0KPj4gKwkJCQkgICBlbnVtIGh3bW9uX3NlbnNvcl90eXBlcyB0eXBlLA0KPj4g
KwkJCQkgICBzdHJ1Y3Qgc3RyYXRpeDEwX3N2Y19jbGllbnRfbXNnICptc2cpDQo+PiArew0KPiBb
IC4uLiBdDQo+PiArCXJldCA9IHdhaXRfZm9yX2NvbXBsZXRpb25fdGltZW91dCgmcHJpdi0+Y29t
cGxldGlvbiwgSFdNT05fVElNRU9VVCk7DQo+PiArCWlmICghcmV0KSB7DQo+PiArCQlkZXZfZXJy
KHByaXYtPmNsaWVudC5kZXYsICJ0aW1lb3V0IHdhaXRpbmcgZm9yIFNNQyBjYWxsXG4iKTsNCj4+
ICsJCXJldCA9IC1FVElNRURPVVQ7DQo+PiArCQlnb3RvIHN0YXR1c19kb25lOw0KPj4gKwl9DQo+
PiArDQo+PiArCXJldCA9IHByaXYtPmxhc3RfZXJyOw0KPj4gKw0KPj4gK3N0YXR1c19kb25lOg0K
Pj4gKwlzdHJhdGl4MTBfc3ZjX2RvbmUocHJpdi0+Y2hhbik7DQo+PiArCXJldHVybiByZXQ7DQo+
PiArfQ0KPiANCj4gW1NldmVyaXR5OiBIaWdoXQ0KPiBJZiB3YWl0X2Zvcl9jb21wbGV0aW9uX3Rp
bWVvdXQoKSB0aW1lcyBvdXQsIHRoaXMgY2FsbHMgc3RyYXRpeDEwX3N2Y19kb25lKCksDQo+IHdo
aWNoIHN0b3BzIHRoZSB3b3JrZXIgdGhyZWFkIHZpYSBrdGhyZWFkX3N0b3AoKSB3aXRob3V0IGZs
dXNoaW5nIHRoZSBwZW5kaW5nDQo+IG1lc3NhZ2UgZnJvbSB0aGUgY2hhbm5lbCdzIHN2Y19maWZv
Lg0KPiANCj4gSWYgdGhlIHdvcmtlciB0aHJlYWQgZXZhbHVhdGVzIGt0aHJlYWRfc2hvdWxkX3N0
b3AoKSBiZWZvcmUgZGVxdWV1aW5nIHRoZQ0KPiBtZXNzYWdlLCB3aWxsIHRoZSBzdGFsZSBtZXNz
YWdlIHN0YXkgaW4gdGhlIHF1ZXVlPw0KPiANCj4gSWYgc28sIGNvdWxkIHRoZSBuZXh0IHJlYWQg
c3Bhd24gYSBuZXcgdGhyZWFkIHRoYXQgZGVxdWV1ZXMgdGhlIHN0YWxlIG1lc3NhZ2UNCj4gYW5k
IHJldHVybnMgd3JvbmcgZGF0YSAobGlrZSByZXR1cm5pbmcgYSB2b2x0YWdlIHJlYWRpbmcgZm9y
IGEgdGVtcGVyYXR1cmUNCj4gcmVxdWVzdCk/DQo+IA0KPiBBbHNvLCBpZiB0aGUgd29ya2VyIHRo
cmVhZCBpcyBzdHVjayBpbnNpZGUgdGhlIFNNQyBjYWxsLCB3b24ndCBrdGhyZWFkX3N0b3AoKQ0K
PiBibG9jayBpbmRlZmluaXRlbHksIGhhbmdpbmcgdGhlIHJlYWRlciBwcm9jZXNzPw0KPiANCg0K
djggZHJvcHMgdGhlIGV4dHJhIHdhaXRfZm9yX2NvbXBsZXRpb24oKSBhZnRlciB0aW1lb3V0LCB0
aGVuIGl0IHJlcG9ydHMgDQotRVRJTUVET1VUIGFuZCBjYWxscyBzdHJhdGl4MTBfc3ZjX2RvbmUo
KS4gQXMgbm90ZWQgaW4gbXkgZWFybGllciByZXBseSANCnRvIEd1ZW50ZXIgWzFdLCB0aGUgcmVt
YWluaW5nIGNvbmNlcm4gaXMgdGhhdCBzdHJhdGl4MTBfc3ZjX2RvbmUoKSBzdG9wcyANCnRoZSB3
b3JrZXIgd2l0aG91dCBmbHVzaGluZyBzdmNfZmlmbywgc28gYSByZXF1ZXN0IGRlcXVldWVkIG9u
bHkgYWZ0ZXIgDQp0aGUgY2xpZW50IGhhcyBhbHJlYWR5IHRpbWVkIG91dCBjb3VsZCB0aGVvcmV0
aWNhbGx5IGRlc3luY2hyb25pemUgYSANCmxhdGVyIHJlYWQuIFdlIHBsYW4gdG8gYWRkcmVzcyB0
aGF0IHdpdGggYSBGSUZPIGZsdXNoIGluIHRoZSBzZXJ2aWNlIA0KbGF5ZXIgaW4gYSBzZXBhcmF0
ZSBzZXJpZXMuDQoNClsxXSANCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC9mYzdiNTc2Yy02
ZTgzLTQ1YzktYWViNC00OWYwMjExM2ZkZDBAYWx0ZXJhLmNvbS8NCg0KVGhhbmtzLA0KVHplIFll
ZQ0KDQo=
