Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010017.outbound.protection.outlook.com [52.101.85.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 744AF2E2DF3;
	Wed,  4 Mar 2026 08:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772612141; cv=fail; b=J1MF/9pH7yheMtom3ThLQR6vjF9rBPzIS6YKlWrdgB6ZrOnl4LY4b3dnfWVUTFDcIzGOvRs3ejJz4dylNoTpX+4PNasArs2fAxdKIp38D1yX6HBHEwlftYEUb0efAU6MTFdesPNfOFA3QQGgVw1Gt1+Bdoy3scg+rzTfE6cRa6U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772612141; c=relaxed/simple;
	bh=y61it8vyPqc0EnkuwzQvimMaMRIeE8Wxb0gQ0HFMqWY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hIhkN9r7wsa5YYv0kaYLmiDtuVMQqFmgsgw/iYoMNOfM/89poF1I0ZipFMinwPdFBI8wbG2bFwGhxXjxFRy4wZN/lKNlIjl614CKe5cjN5IU/rX+5fR3vRvS8/S0aSxvHe/zPYrLRdwa8HhXTzhBRdysZTKBj+ldxpvDZctBp3w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=MXiUXpv3; arc=fail smtp.client-ip=52.101.85.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="MXiUXpv3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p6esLdXaNx368VQLzU/yc9exuFhjlOLptvessPmiMJGVU8vQWU3cHqzJHsSrihQOlE+dhcOy/wfJ9eqdl61G2NASPRH24vzPTojuu4khlgrCf/DvB65a1ZE5NPiwXkzSYdc14rtMlS42vRYtoNvpNlLcbIIf7fLr2CczNHWxVKGqOuV5NLCkkyY7v0+2e2ircyif1rkF8JeZny+uvT9lDUG/jLZzZG8Vt9P2oRmeh1bqaToxOy6HPYlFndayEohQRYK7nnOCw1ivEL7j8bZzoniJhPSdE4h6/v6m67Yr5fF1KaTmNtzX8M79r6RVA/4fqY0WOCrfUQXs2Bx6PJ8sUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y61it8vyPqc0EnkuwzQvimMaMRIeE8Wxb0gQ0HFMqWY=;
 b=vIRXy1pRQuvTYLUKu99C21ySPxklzPAGTlLuDqazIjrHhWrHbQSCWi6AUycRrEymwFwkt1pbptIDbpCyPrnXLuy3W+lTAEtrFCmgFRVJOyAHlaJz66w5FbqUnfsDXKQyIUi9+ulPzwZEnQpGpk7QXxBBGddTsyhQ7hIa1AH354tDTdofMVhs9ufFL+glfAV77gisHrB7J++5HgF+SEXpdci4BhqTf/OW86FaPKzOkj253RlxchxlOTLeQkpf/tvuTPhDOvYjeRPkFXLxIUnIGMCK81zAEZVnLIvt6tSIyZDsf3NYiLTuJ4Sgl3Eqb83vR2MxfxLOO/6Sor8rKZJ7bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y61it8vyPqc0EnkuwzQvimMaMRIeE8Wxb0gQ0HFMqWY=;
 b=MXiUXpv3Z3/eAg7bsVp/JPTDdW8MQDSK5/kCq2G+df/y+NDR6Lu2/08BfiAw0DpJXqu0k4YtHxpd+xxcrpVsEVORbsY5UwjL7RQyth3AJ8v4farTwIrpZhP7LFGW5Ozp4s/wm0wCBgAe6u/pYMmk/2F1ellMYe3QAhRmo6QT95RM1gVtZQTLuvl+EezU13Q3EdsUqAfgJfCyJsfrmwYYIP2nkhAkJKi2suqIRUUor6CIki7eJKelfrh5akJTmqQkW2BMSEV5Ffhdec/QIte/tZoGCWTZrXEoNc0E22q6FW9GWGtKQJ0+XD4P+MWqZEJJ1Z4IXIBNEMdYYk/HJk5UHA==
Received: from SN7PR11MB7511.namprd11.prod.outlook.com (2603:10b6:806:347::17)
 by LV1PR11MB8849.namprd11.prod.outlook.com (2603:10b6:408:2b3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Wed, 4 Mar
 2026 08:15:33 +0000
Received: from SN7PR11MB7511.namprd11.prod.outlook.com
 ([fe80::b0d5:a33a:26fd:3fa0]) by SN7PR11MB7511.namprd11.prod.outlook.com
 ([fe80::b0d5:a33a:26fd:3fa0%6]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 08:15:33 +0000
From: <Victor.Duicu@microchip.com>
To: <krzk@kernel.org>
CC: <corbet@lwn.net>, <linux@roeck-us.net>, <linux-hwmon@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <robh@kernel.org>,
	<linux-kernel@vger.kernel.org>, <krzk+dt@kernel.org>,
	<linux-doc@vger.kernel.org>, <conor+dt@kernel.org>,
	<Marius.Cristea@microchip.com>
Subject: Re: [PATCH v10 1/2] dt-bindings: hwmon: add support for MCP998X
Thread-Topic: [PATCH v10 1/2] dt-bindings: hwmon: add support for MCP998X
Thread-Index:
 AQHcoBa9pxaxrTCHNUam0PksYnBYNrWHUwkAgARfnYCAAYuegIAC61YAgAADx4CADfCVAA==
Date: Wed, 4 Mar 2026 08:15:33 +0000
Message-ID: <77012a7d3ac4b7a6b66322fb84fa1adc42f1ff7f.camel@microchip.com>
References: <20260217-add-mcp9982-hwmon-v10-0-5e0aaae6f289@microchip.com>
	 <20260217-add-mcp9982-hwmon-v10-1-5e0aaae6f289@microchip.com>
	 <20260217-sincere-spotted-lionfish-d7abca@quoll>
	 <9a39d9f1d97eea245dd194a2db481297b92c6fbf.camel@microchip.com>
	 <4a84d57c-ede6-4038-9883-42aeafce2687@kernel.org>
	 <e32684ab5fd4e86ad61d2ca0e4f219fa29bd26fc.camel@microchip.com>
	 <17f4acc7-28ff-4325-b628-cf8d9307754e@kernel.org>
In-Reply-To: <17f4acc7-28ff-4325-b628-cf8d9307754e@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB7511:EE_|LV1PR11MB8849:EE_
x-ms-office365-filtering-correlation-id: 91a98c10-b28a-402d-b422-08de79c63505
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 S+0tLxjWfCzpMZ1kmxAbQe5qN2PRC5kiYg9WphoWcyNo2T1/qHqTw77AhyZaISo3n3HGSY9GLx/Nzxg3qKamEQ9EYT8EZrLVy+Wv2kLcMxb3cNlJdonNcmvty3ai3j8TqDK/V8Pyz4CoPNGaxiR9JieZo92tHqx8mwV3HcwrDxkVhasbXXKVTXNka8XhCvVLeunao+gXQDUKRaa26WvsxUvYIe5exV+Rhl0LbD01AGlBD+xwxMIwZE2pkrsMgKhohfXNgtbc8r2ttxeUzKNrzh7BLQsKf8u6lbp/4jaFEt3KoGlhQZDvXV5Ejj9zDm97H/7jmkBQFQwd+8Q2mrc0fW75kAI7IWG7AtSJsjUuUbjKVXK44iYN03cZ3v8BVnR/VnizQapDiV+DcbSW/eJu3nh3qbdzdR071XNLXOAelRc1HDUEDFmqE4CwnEZ7qaJM9HKj7kJTSixWu/ykt7FSPOEk8Z0tkhLYn/QlaDuHn2f2KUlJ+2JA9q9vmZMOtDEw6OCz7EbwNRKOv/GjzUg2+hBu7MAtchWMZYWQWlxphgMtaQVc0KmHiMDKzz6bB0EcE7oszvJfOcY41M00pwDCbks2lKqAD/sxgkAfABFsozL/vxkfwsLWEsHFXhn8XR6/qyr5m0QuNNYNDEHjtVddIvQ0dzZ7fTTDrk3MbT+Yz4FBu8YsqnoH03eQ4xdFKhllVYZ5x6iKDryW0mrpwnFEnNJMT8jktYLgmoiOReh5ZcS/R9zYPZmGc9x0PQLaln6heTK0TMhg0B8t/xfOIJD4/Kjw2IQ1EwhDudDBfV5yOck=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB7511.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OHorZ1RySTJCOUZ0a2k1RklBYmVQd1A0Z05GdmQ1NFJwT1ZtNzRETnVXd1hq?=
 =?utf-8?B?RjZ3cXlTdys2NUkrUDJUNkhpV0h5SDlqQk5HZ3JlM3NlcXNzT2J6QVBobkpN?=
 =?utf-8?B?Z21UYmZJM3czTVpYOU9wNzI0dHZBcVNCOWVjdGVFbHJDMDVjWE4zRjJIdzJv?=
 =?utf-8?B?cWdBSkQyQkhoSHRuQ2V5aytoNkQ0Q0xRSVpjQjFUQ2x3Nkhld2h3RjdPSlVT?=
 =?utf-8?B?aVQ3RzFDdldyaWJta01sRlUvbHBBN1c1VjhBazJqeFc0dit6QU55K3ZWemhs?=
 =?utf-8?B?ajQ5VHhUZFN0NlpaQ1J4WkQ1TEhWWkQvamw2dTdKUkIycDRrb2JlQnFRSXBk?=
 =?utf-8?B?WmhZV0N1S3JwcWowSVViTHpqbFZKa29PWE5EQ21rTHI5MmRkeEhGOHhramZN?=
 =?utf-8?B?dEgyUG45OHZTMkVOUWVDY3B4bVkydXNSWVhlckxXNXpFQ3BmbXNwZEczNWJX?=
 =?utf-8?B?bXFZVTJBdkNNYTJsdk1lc1g0NzI4K214c1dmWXZrUXl5bXlIUWo4dlExMVZu?=
 =?utf-8?B?UFhXbWhoRUtUMHNYbXJYYWllenBTZXVrMnl2UUJCL3lMOVFjaHo2cmYvcXhk?=
 =?utf-8?B?RHBTekI3Qzd5eENWTitBOFFxM3FIWTFPbDUrNXQ0UU0xcnR5QVo5QW02K2xF?=
 =?utf-8?B?WWJHWFVvZTRnT1lpODEwOHZZejJmZ055MU8rbnJ3aWdCRGVrYk03ZXo0RkxQ?=
 =?utf-8?B?SEZaVGd4cFE0RVE5anR0cjBwSjAreHM4QXN0c29zUXRha2xmODk4YzhWeU9T?=
 =?utf-8?B?V1E5R0xUV0t2bnI4U0U1NmxoaEFpcnpURHJlbHFEOEkwYzJJN2NjWDFBVFQ0?=
 =?utf-8?B?MDRjZUxTYmhwWWNiditla0diNkFzUXV2VVI3ZkpKandZRFY0MEU2ckx0QXdD?=
 =?utf-8?B?OHAyYWQwUDRlRVRLcW5wQ3NyNWVyVmV5RWpYcFRWdG1sSXZiQ3FRL2M1RzFG?=
 =?utf-8?B?dVJEQkV5dDRNSi9oSjZQTlY5U3h2UGxSWkx3NXQ5T2xPdSs3VkYzZkxTZHJF?=
 =?utf-8?B?MUxCcE9QTGU4R2JhaW54dCtONGpFc0dwOThWUXZXTjdQcld5bGpkZGhVSldu?=
 =?utf-8?B?SWU3cjd1dHgzY3duNjJsZUJQQk9iQUtpRys4Q29NZ1c5WTFKU1ZPMGY5SEhB?=
 =?utf-8?B?eFp3KzFBU1BPK3VScGRmKzhubFp5L2EzdkVDaG42QTBmck1MTXJKQ1IrQVdL?=
 =?utf-8?B?M3hvYmZtaFhiZTZrUDB5K2V4SkNncENWS3l4eTVxbmZvZ1ZsTUxVeXdybFMr?=
 =?utf-8?B?TStxaTZIdyt1V2VsR3pObWhma3hCN3c4ZmwyVFJxakhsbE11a0R3WXorazFs?=
 =?utf-8?B?T0xQaDdQWjVXZFJJMG1BZG5heEM4aXNxN1ViMlorOUNtZWRFZmlIZG1aL042?=
 =?utf-8?B?cnNjV2tEZ2M2T1RQSERWeTNXUlk0VEZJc05HZXUrRGJXejgzUTVoTzdWUk1D?=
 =?utf-8?B?RE1kVTkzeitIdUZDS1pCNDBPYk5HR1ZrR1R0dUxud2dXVTJwcUZJSG93YVlZ?=
 =?utf-8?B?cWhwM2dZN3lpZVRmQmRIYmlWZ2pTUFV2T1RmVi9BSU5pMXBDWlR2NkI4YkNs?=
 =?utf-8?B?SjhEWUVwRGw0NTZVUi9wbmlwTWswL0xnR2M2elE2ZVhNMmNMRE9iNDVaeHVn?=
 =?utf-8?B?Mkd5dGpqQWovNVJmU1hCMHdLcnlSWFNISHN4ZUFVZ1l6TVVKY2hzRHJuN1JI?=
 =?utf-8?B?SCtESFh6aUc5UFNKYmJOcVFkbDFrQ1pydy9QZ2dISGFIMkU4QkM1V3ZpOHBP?=
 =?utf-8?B?bVlDSGFkWG1vdmJGWHNna1c0OGd4amZ0aVdsOCtaMEJCVnVBM09YWE15dlNh?=
 =?utf-8?B?eXRzT2xESHZqc2FkOTNYa1lGV2ZGY1RyMzRZbnBwVk41OXE1MmdTMTJvK2xk?=
 =?utf-8?B?TlVERkxHcmxjSDUvSjN2ZXVZaVlQWFJ0bFR1VmxqRVYvZWsvZDljeDZFODlV?=
 =?utf-8?B?VkkzSWVBdjdrY3FRK0ZPb2NUUTZkL2JhOXRiYmlTT0FxM3YvRGxMUzc4eTNJ?=
 =?utf-8?B?N3BhdmFOOHRRaHE0ZGRsaXBoM1oxbmNGTi92NVZOdG9keGFLaFdNdDIrOVE1?=
 =?utf-8?B?WGVWcWU1Qk5YMDYrUUg3RmpzZkJFK09CY3dzeWw3aDRjK0RSQTRMcUJxdzlV?=
 =?utf-8?B?OXBxRmRZNUZ3MWtqWlV6U3ZQMnlFd0NGdmZ4WElPL2VteTJQRVJxUDFmMmg5?=
 =?utf-8?B?c1NOOUw5azZQL2hLVjR1Y0RaMEY0YlptVGxCSitjM3dxRzhBZHpiY0NaMlNT?=
 =?utf-8?B?U1hpaUlzeU1wUE5NdW94dmpmTE1ocW5KS1kvYmZoU2hhQ2xIYVN4bWg4RVZa?=
 =?utf-8?B?bzhMendFMlNpYUkwZ08zeVlsOHFHc040S2hOYVphTmpWVDR6NVZjbUZIbmpt?=
 =?utf-8?Q?0auihkEJjHKodFWQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D1C5ED7D22251D479F3AF6FBD99838B8@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7511.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91a98c10-b28a-402d-b422-08de79c63505
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Mar 2026 08:15:33.2899
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jLaQ4gqynE/87BGmqfJeROsrUJw7D4L2fcFcD0G9XOSVFSZRXmlsnqZczqjLr3zdBl0HV7U8b/oAZSIT8FLaaV8mDLBn270s+0zDWU8O4KU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR11MB8849

SGkgS3J6eXN6dG9mLA0KDQouLi4NCj4gPiA+ID4gPiA+ICtwcm9wZXJ0aWVzOg0KPiA+ID4gPiA+
ID4gK8KgIGNvbXBhdGlibGU6DQo+ID4gPiA+ID4gPiArwqDCoMKgIGVudW06DQo+ID4gPiA+ID4g
PiArwqDCoMKgwqDCoCAtIG1pY3JvY2hpcCxtY3A5OTMzDQo+ID4gPiA+ID4gPiArwqDCoMKgwqDC
oCAtIG1pY3JvY2hpcCxtY3A5OTMzZA0KPiA+ID4gPiA+ID4gK8KgwqDCoMKgwqAgLSBtaWNyb2No
aXAsbWNwOTk4Mg0KPiA+ID4gPiA+ID4gK8KgwqDCoMKgwqAgLSBtaWNyb2NoaXAsbWNwOTk4MmQN
Cj4gPiA+ID4gPiA+ICvCoMKgwqDCoMKgIC0gbWljcm9jaGlwLG1jcDk5ODMNCj4gPiA+ID4gPiA+
ICvCoMKgwqDCoMKgIC0gbWljcm9jaGlwLG1jcDk5ODNkDQo+ID4gPiA+ID4gPiArwqDCoMKgwqDC
oCAtIG1pY3JvY2hpcCxtY3A5OTg0DQo+ID4gPiA+ID4gPiArwqDCoMKgwqDCoCAtIG1pY3JvY2hp
cCxtY3A5OTg0ZA0KPiA+ID4gPiA+ID4gK8KgwqDCoMKgwqAgLSBtaWNyb2NoaXAsbWNwOTk4NQ0K
PiA+ID4gPiA+ID4gK8KgwqDCoMKgwqAgLSBtaWNyb2NoaXAsbWNwOTk4NWQNCj4gPiA+ID4gPiA+
ICsNCj4gPiA+ID4gPiA+ICvCoCByZWc6DQo+ID4gPiA+ID4gPiArwqDCoMKgIG1heEl0ZW1zOiAx
DQo+ID4gPiA+ID4gPiArDQo+ID4gPiA+ID4gPiArwqAgaW50ZXJydXB0czoNCj4gPiA+ID4gPiAN
Cj4gPiA+ID4gPiBZb3VyIGludGVycnVwdC1uYW1lcyBzYXkgMSBpdGVtIGlzIGNvcnJlY3QsIHNv
IHRoZXNlIGFyZSBkZS0NCj4gPiA+ID4gPiBzeW5jZWQuDQo+ID4gPiA+ID4gVGhleQ0KPiA+ID4g
PiA+IHNob3VsZCBiZSBhbHdheXMgY29uc3RyYWluZWQgdGhlIHNhbWUgd2F5Lg0KPiA+ID4gPiA+
IA0KPiA+ID4gPiANCj4gPiA+ID4gV2Ugd2FudCB0byBhbGxvdyB0aGUgdXNlciB0byB1c2Ugbm9u
ZSwgb25lIG9yIGJvdGggaW50ZXJydXB0cy4NCj4gPiA+IA0KPiA+ID4gV2hvIGlzIHRoZSAidXNl
ciIgaGVyZT8gSU9XLCBjYW4gdGhlICpoYXJkd2FyZSogd29yayBjb3JyZWN0bHkNCj4gPiA+IHdp
dGhvdXQNCj4gPiA+IHRoZSBpbnRlcnJ1cHQgbGluZSBjb25uZWN0ZWQgYW55d2hlcmU/DQo+ID4g
PiANCj4gPiANCj4gPiBZZXMsIHRoZSBoYXJkd2FyZSBjYW4gd29yayB3aGlsZSB0aGUgaW50ZXJy
dXB0IGxpbmVzIGFyZSBub3QNCj4gPiBjb25uZWN0ZWQuDQo+IA0KPiBBbG1vc3QgdGhlcmUuLi4N
Cj4gDQo+ID4gQXQgdGhlIG1vbWVudCB0aGUgZHJpdmVyIGRvZXMgbm90IHN1cHBvcnQgaW50ZXJy
dXB0cy4NCj4gDQo+IA0KPiAuLi5hbmQgcnVpbmVkIGl0LiBUaGlzIGRvZXMgbm90IG1hdHRlciBh
bmQgdXNpbmcgaXQgYXMgYXJndW1lbnQgbWVhbnMNCj4gSQ0KPiBkbyBub3QgYmVsaWV2ZSB5b3Ug
YWN0dWFsbHkgY2hlY2tlZCBpZiBoYXJkd2FyZSBjYW4gd29yayB3aXRob3V0DQo+IGludGVycnVw
dCBsaW5lcyBjb25uZWN0ZWQuIFlvdSBvbmx5IGNoZWNrZWQgdGhlIGRyaXZlci4gUGxlYXNlIHJl
YWQNCj4geW91cg0KPiBkYXRhc2hlZXQgY2FyZWZ1bGx5Lg0KPiANCj4gQmVzdCByZWdhcmRzLA0K
PiBLcnp5c3p0b2YNCg0KQXMgZGVzY3JpYmVkIG9uIHBhZ2UgMTEgb2YgdGhlIGRvY3VtZW50YXRp
b24gdGhlIGFsZXJ0LXRoZXJtLA0KdGhlcm0tYWRkciBhbmQgc3lzLXNodGR3biBwaW5zIGFyZSBv
ZiB0eXBlIG9wZW4tZHJhaW4uDQpNb3N0IG9mIHRoZSBkZXZpY2VzIG5lZWQgYSBwdWxsLXVwIHJl
c2lzdG9yIGluIG9yZGVyIHRvIHNldHVwIHRoZSBJMkMNCmFkZHJlc3MoZm9yIHBhcnRzIHdpdGgg
bmFtZSBlbmRpbmcgaW4gIi1BIikgb3IgdG8gY29udHJvbCB0aGUNCmhhcmR3YXJlIHRoZXJtYWwg
c2h1dGRvd24gbGltaXQoZm9yIGNoaXBzIHdpdGggIkQiIGluIHRoZSBuYW1lKS4NCkluIGFsbCBv
dGhlciBjYXNlcyBpdCBpcyByZWNvbW1lbmRlZCB0byBjb25uZWN0IGEgcHVsbC11cCByZXNpc3Rv
ciB0bw0KdGhlIHBpbiwgYnV0IGl0IGlzIG5vdCBtYW5kYXRvcnkuIElmIHRoZSBoYXJkd2FyZSBk
b2VzIG5vdCB1c2UgdGhhdA0Kc2lnbmFsLCB0aGUgcHVsbC11cCBjYW4gYmUgbWlzc2luZy4NCklm
IHRoZSBpbnRlcnJ1cHQgZnVuY3Rpb25hbGl0eSBpcyB1c2VkIHRoZW4gaXQncyBtYW5kYXRvcnkg
dG8gdXNlIGENCnB1bGwtdXAgcmVzaXN0b3IuDQoNCkluIG15IHZpZXcgdGhlICJ1c2VyIiBpcyB0
aGUgcGVyc29uIGRvaW5nIHRoZSBkZXNpZ24gZm9yIGEgc3lzdGVtDQp3aGljaCBpbmNsdWRlcyB0
aGUgTUNQOTk4WCBjaGlwLiBQbGVhc2UgY29ycmVjdCBtZSBpZiBJJ20gd3JvbmcsDQpJIGFtIHVu
ZGVyIHRoZSBpbXByZXNzaW9uIHRoYXQgdGhlIGRldmljZSB0cmVlIGlzIGEgaGFyZHdhcmUgZGVz
Y3JpcHRvcg0KZm9yIHRoZSBkcml2ZXIgdG8ga25vdyBob3cgdGhlIGhhcmR3YXJlIGlzIHNldHVw
L2NvbmZpZ3VyZWQgYnV0DQpzaG91bGQgbm90IHN1cGVyc2VkZSB0aGUgZGF0YXNoZWV0IGZvciBk
ZXNpZ25pbmcgbmV3IHN5c3RlbXMuDQoNCktpbmQgcmVnYXJkcywNClZpY3Rvcg0K
