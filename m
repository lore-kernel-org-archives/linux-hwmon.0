Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11023085.outbound.protection.outlook.com [40.93.201.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A61F2066F7;
	Wed, 18 Mar 2026 08:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773822650; cv=fail; b=I9bc4jPpWoXdWz55Ht4ghp/HolZ3PYpcLwejwa7NZVJXU6lR/lA8tP9rBVhegQwBs/ZIlOrZi+652d/W/Fp/cF8uqFZDqircWvbxc85S/SG3mr71XLe301W72o65CPwc52wdfxZukg9ymy6MQoPIywdRHp3MPazMCqyXy5bAPV8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773822650; c=relaxed/simple;
	bh=nX/SptD3/YBDfP3qX2V++2hGBb0J+r5QUakluL0A7nk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=VKMgj5GjWqIucpWxNW9EZed5G6a0R8Z/TWUAASKBrWuqA7hdjR2efpIa/Jp5/JUac4vOD2qX6Y+Qhhy6T47jf2uqZ4P8v1ZbpmivH0azWNw6EfSifV3nDDtP9xVBnwByn61bYrop3u+p8Jg3Qg8wHyxObatDBpKLYivM6NoGR9Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=monolithicpower.com; spf=pass smtp.mailfrom=monolithicpower.com; dkim=pass (2048-bit key) header.d=monolithicpower.com header.i=@monolithicpower.com header.b=IX+N9SuS; arc=fail smtp.client-ip=40.93.201.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=monolithicpower.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=monolithicpower.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=monolithicpower.com header.i=@monolithicpower.com header.b="IX+N9SuS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d+mrRRW+t1gD0ezO8dvsm6jxhu8s0AjeMZJ+/wyfuwt2jWtHx7sPEYWtH2g6GcGhgA5xySFnc4o64Ns4pagHtpVFh+8+4IN4SpeW8f0jfJDBBCDk151USoqShSUoXk5qCiOYcQoHWYBCLhj+DwAhu8JO295EfBoceeXnsNkmX4frUpl5xgeVTMq1RjDd28zog5UNPo7yeGvslykpdYLL6rwjYZ+c46A6VkMMYQ5y4LOSxmlkhOgIT07CWwpyIJK36HtM1AOiYEK6zCFgw6ZEkpEE5rjv8Cu0gDVlFSYiN7184kPHOsvr+CVm58Dh6KidEwakwoSSWHzdc07lA81m3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nX/SptD3/YBDfP3qX2V++2hGBb0J+r5QUakluL0A7nk=;
 b=nQ0uXS3UWne4Tmq3jmYVrZ7pASOu7pjqKB0xfmTfOkS/RTBDLR4R9wi6rGk/RUG95gHVfo+hoP0QF/U6mRwVILxThK/6RcWBJzvJ6torOwvQL6Os1wpdXjNzaqoDWjczd0CTNJcWXIx89amGiEYinr2SXdyXOVG48ibXEejM2+rs65riG/H4nR1iYOW8aKBdLk1Fh/Ai5k6OkCrSTPkEHqJbNdLtdNcD3k4hBUczZyH3h5E79YHQR7wB2suqjAsZJsVW3mAVngaRFL/xtMcJ+e+yQo/rMUQlb8HhyDWRyEdURHuaRCFyTEryXnUPyBb5klc7lFxI6b+OSZ5PF/RwVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=monolithicpower.com; dmarc=pass action=none
 header.from=monolithicpower.com; dkim=pass header.d=monolithicpower.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=monolithicpower.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nX/SptD3/YBDfP3qX2V++2hGBb0J+r5QUakluL0A7nk=;
 b=IX+N9SuSM4wLb3wb/MRlp3iTFcpRAr44BdNe5ETxDS5NEnZyn2NoRYUlL/vgtVn2ous/VDBNMIAhCCnbl0YYeppdfyH0qdaHQi2kEllm9Ls1tcTS0wpopjeEIMt9YZkfIA18PdlzKAq/XLucc+HknXzKf9YEe3ofDnGWNnPgFKE1UTH9Vy1e06T8crH7fhBrfcaQu4WxMNdbpzvybGarSzmQcM9jmYGjLYWIrunHN+6qsl5j98TSvy4PMRSkcaT3nbSdIDUkrtOwMpBknyEQuLU0sXOn1FVn3QlOd13RbwzO0wHGDY2UPemLlYW64xRuvuzI6G0abgyOUwJJBQGRGA==
Received: from PH0PR13MB5316.namprd13.prod.outlook.com (2603:10b6:510:fa::15)
 by DM6PR13MB4480.namprd13.prod.outlook.com (2603:10b6:5:1b7::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.24; Wed, 18 Mar
 2026 08:30:45 +0000
Received: from PH0PR13MB5316.namprd13.prod.outlook.com
 ([fe80::c488:92bf:1790:b205]) by PH0PR13MB5316.namprd13.prod.outlook.com
 ([fe80::c488:92bf:1790:b205%7]) with mapi id 15.20.9723.018; Wed, 18 Mar 2026
 08:30:44 +0000
From: "Yuxi (Yuxi) Wang" <Yuxi.Wang@monolithicpower.com>
To: Guenter Roeck <linux@roeck-us.net>, "corbet@lwn.net" <corbet@lwn.net>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>
CC: "wyx137120466@gmail.com" <wyx137120466@gmail.com>,
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [PATCH 1/2] dt-bindings: hwmon: Add mps mpm369x driver bindings
Thread-Topic: [PATCH 1/2] dt-bindings: hwmon: Add mps mpm369x driver bindings
Thread-Index: AQHctqUoOCxToNDeM02WHARjyD5KJ7Wz7dSAgAAGMoCAAADKEA==
Date: Wed, 18 Mar 2026 08:30:44 +0000
Message-ID:
 <PH0PR13MB5316A355F187264692647EC4F64EA@PH0PR13MB5316.namprd13.prod.outlook.com>
References: <20260318070115.1609-1-Yuxi.Wang@monolithicpower.com>
 <0111019cffc080de-4f80c201-5cfb-4bcc-ab98-8c8747aa4639-000000@us-west-1.amazonses.com>
 <69ee987f-37d6-424f-bcf0-9a13c176b08b@roeck-us.net>
 <73d65018-d78b-4964-954e-bc02db11f0ef@roeck-us.net>
In-Reply-To: <73d65018-d78b-4964-954e-bc02db11f0ef@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=monolithicpower.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR13MB5316:EE_|DM6PR13MB4480:EE_
x-ms-office365-filtering-correlation-id: f1e403a2-ab24-46af-98ce-08de84c8a61f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021|22082099003|56012099003|18002099003;
x-microsoft-antispam-message-info:
 zry8U/BiD4PSkPF+z9NIKql9d4lPjJEdovkOz4raAqQ0Z8TvpzEQdyGeWz7zzfB+Upr1IhWef1H41ctUXfvYuzWr0cNhBFnIj7UUmPGiRzmGhP0MMtWXq3UsYCIjHoLUT4EzQXjbuI6HNVqNqrN/BcdDcCeMEYZByVFF5+68rMgvN7pz5kzHLtCNCHMCyL7Hp1w0zzE9+4+VOiQRQpwkRDsZ+OSba3sTvAgGDNG+W4LkIlvj6cuOuHUR+yyftUIQHWV/g9IESWtajj8j1zBvBytsVSON6kjKdGesCmCMpZfF5fG11k78UAIxYK8fAdSD1/H25v9B3H0za00q5JZX/7KrVo9vZEH9QHvV4CmDBgqilEWibQrbYZYigTfOIgVq3mNvrMpMfQ5HKJlz2IRXhg5jM1BEJhg8EJe221cUBNToBtmyXeZ/sxU2N9T7dnUYrinenlDaKduINn0W//XLIWExQJMaDURZkVQTt2ahzlifEE/uKcTc4CNqKnQ1Y7CbdhJFN190bYiJ6O1T5whEj4twdE/ueEc9hfBjGQ+uWKcWussOgI/I/l6e7LOin0X5CLREbb2uYCsJioGNJRCVZnh2z2xs7nDVPeOmIbzSgeGgmpGNH4N058I0KEF1u2aGWBmMr8s+DoNJLiXwsTmX9Pf8ZB0TzKtmEUP1uYZ4RFgRbHJewRWq+OAmTeiG2wo38+3UCTP5D0ULdBTYOotvxHyoJXLgGBWWioM9hbxh+Rg2vaLSpdxGfqExabZYkrLrX9Nm5eITIDGr6a5LfdMpUMMO5q9+fm+FvOk9EKxik4w=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR13MB5316.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dFFSNjllZW1kSUFwM3Y1SHZwaHZHbWVUTXpqZzhmQTJhYjJkM3p6L1JjZkNE?=
 =?utf-8?B?R3IwZUdkdFNIdzdRTUZMR25pWm45RXVmWlE0Ync0VDdWaGFOOUlvcXdxT0ZP?=
 =?utf-8?B?bTQyNnV6UWFjTG0vTytIK3IzZHZZZnFMTnZXbm5YYjhEOVJNUXF1Wm43aXB3?=
 =?utf-8?B?RitYRDYrVkxyVDRTZG5xNExtbURUVTNRTUQ4UjFRbUc5RHI2M1RpYTU4SGRk?=
 =?utf-8?B?NEpIU2lEVW4xNG5JTnExQ0dDQXhBeGV4cnI2YzQrdGtVVlhGSDNLUS8wc0NH?=
 =?utf-8?B?WTg4T0luRVZ6dURQYXl6U3hPN0kvSjFmaERZVzdUU2VvMW1qZHpCd3N4Y1FH?=
 =?utf-8?B?OUF0WXJ6eE5iL2l0aFNwN0czbDdlbFhvN1NLZW05c0NRNmM0bXdVUFUvT2lM?=
 =?utf-8?B?TmhKSWR3Y05iZDFhU3RPWnA1NDYrd2RPOUR5eTJjK0FEcVBMd0xZZVVxbnpi?=
 =?utf-8?B?SCs1K1dYNU1FSEs1aW4wRkg0MG8vaWRZWExnN2lBd200ZHpvQ1JFUFdQVVlN?=
 =?utf-8?B?YUtJMXVxQWtPTnpaWEp3T2ZEUGJGQ1JtK29OR0sxQ2xXbnFKSHRsUGUva0th?=
 =?utf-8?B?L2l2Ym1YMXZIYmVpcDFEdzN6by8yWkFLUnVYWW5hS1VpMFZTQVhzOU9yOUk2?=
 =?utf-8?B?T2NlcUFzTEE4NW1obmp6OWRMNi9LM2RQT2JsR2ZpRVVvYWo1YStkb1RMb2dX?=
 =?utf-8?B?aU5JbEhCdjVQWlBCZmNZaWNoaG0relVjYmxZdTAvc05wRG5QMnJEVysxSFJt?=
 =?utf-8?B?bnJNT1IxbUwzWmJWMXpVODAzeXpNVWRqem1CK0h5WXVIdTE4Z1lJTm5nRFgz?=
 =?utf-8?B?eEdQQS9qWFpWTzJyYVFscmlrSnRYVjVFOWRFMEpaQklrU0ZYazBEMFY3UTdH?=
 =?utf-8?B?QTJaaGJLS1ZGN2o3RXh2cTU3b3BYa2M0aHlVdzhqUlM4U3V5c2U4WHhabWpo?=
 =?utf-8?B?bHJnRlFuZ3pyU08xc0V4WjdLUHZ0NVNGOGkrZC9raDBaSWgweU13bVNaNHRw?=
 =?utf-8?B?bEk2TldQWjFnVThsdmJwT1RhRkhOWG9BeEN1NndTWEZhdzBWamZRWDhNelpv?=
 =?utf-8?B?UnIya2hSS2lvQXRwNStVTXdUa0Y4aXVNVjQ0S2cwTUtYK1ZtUzFSZ0ZDenBR?=
 =?utf-8?B?Y29NanVqSTMrMjZDUVRFUGY0MlZVZzArWGtEeTVNNFRJdUxjc1FpRTN6NDRD?=
 =?utf-8?B?VytPOGlwM0FoNUlXOGptWXhMYXpFNEcvQnA2d3hRRlVzSGlDMWM1YVlwbHpz?=
 =?utf-8?B?S1JuenhlRHhIelkza0ZINE5TYkxTNEhKOTFXZTlWYk9pVTc4ZjlDN2JFRGp4?=
 =?utf-8?B?RmVva3ZkTFJzMEpoN3hxTWNXN2ppWXZCcUpsYVBwZzlkbjFVbmRXRS9CR2Vj?=
 =?utf-8?B?WGVISjlxZWxJbGVlbGMxOGFaR25VRzRMVmFnbVhGL0hHMkFaTlNxQ3ltODNM?=
 =?utf-8?B?L0NHV3lKUUZqWE9ZQk1iUGcyZDdwQ2JNVlN4OXJiZ1gvdkRxcTNzc3FldExE?=
 =?utf-8?B?enFjN1ZUUEZDeVVWTDRTWHNpdzlZT2ZpdkpGSGh3MzZJbTB1MmszV25POUkr?=
 =?utf-8?B?Wm9PUCs3WFErRjRIRFJERnJROWM0ZzlTL1B5Vm4yamM0RE1uSHR1ZGdqUlFq?=
 =?utf-8?B?M0dJVCtuVTRET0lMNFVwMm5obkxqRThYeGx6T3R3NnZkdGJsdXhKTEUrVWZY?=
 =?utf-8?B?Smx3T01PaHlyWnE5Qm1EdWlKNGZGQzBpTkcySTFyU09mUlQ4Umtrb1dhTSs0?=
 =?utf-8?B?UmdIZ0RodDRKREs3QkM3R21jT3NXWWs5UDJ1ak5VY3lDL3N6VWZyQkZRcnVU?=
 =?utf-8?B?MzVjaC9qOFpKMUNXeG84SWZ5djcrTVJpb2hiU3VpKzI4MzVEdlozdENXaENa?=
 =?utf-8?B?Zjg2eHd0OVBnY3hOMjY3dXZDTDhQM3BYRCt4Q2psaVBtaHRueHQrNnMvdHds?=
 =?utf-8?B?cnorcExtQWVkbG1Ic21TbkJIdW0vSlpqTTBZSU1oS3pZWlZjVEMvSFVXVVlX?=
 =?utf-8?B?bFh4bkczWDA4VkxZVktQalBxRklBMGZVWWtDMGo2Zk9uTUhxUG1lZHVkTjY3?=
 =?utf-8?B?bEQ1eFRMeCtpWTJxblFjYlRobXF1OWUxT3p3dUFwQXk0ZEVJMHNFbGNQamRy?=
 =?utf-8?B?Uzc4TTBoNXFScjBKNFdXSmNPaG8xZCswVVcwZW5WaGEvdVJGcHI5QkVESTFW?=
 =?utf-8?B?L25xeE1zRUZvQng0RzBYVmluc1NycmIwTXU1YnBEeENDMThDM1BGMWRHMDVB?=
 =?utf-8?B?L09tZG5SL05xTXc4SkxuNUNNeHBYdzUxNGZSRktOU1ArN0hqbTlQSXJRdzhh?=
 =?utf-8?B?bURBS3NQU1hVWW1RWTdyMGpSbkE3UVdRUExkS1JOZnFBUHNmSXg2dz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: monolithicpower.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR13MB5316.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1e403a2-ab24-46af-98ce-08de84c8a61f
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2026 08:30:44.7814
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b862589a-7404-403d-98c7-6a3fede1a7b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a+kzrhLDBtid6Q4XS4Kh6shXBgCUr8js6EzpyzT/vg9usO7yVjbHusyhc7EsKupmL2nMgTqJMsV/LwSGk0ETa4vB7K6Pm9M3ELesskmAOQY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR13MB4480

DQo+IEFsc28sIHBsZWFzZSBub3RlIHRoYXQgbXBzLG1wbTM2OTUgaXMgYWxyZWFkeSBkb2N1bWVu
dGVkIGluDQo+IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9od21vbi9wbWJ1cy9t
cHMsbXBxODc4NS55YW1sLg0KPiBNUE0zNjkwIGFuZCBpdHMgdmFyaWFudHMgc2hvdWxkIGJlIGxp
c3RlZCB0aGVyZSBhcyB3ZWxsLg0KPiBBdCBsZWFzdCBvbmUgb2YgdGhvc2UgKE1QTTM2OTAtNTBE
KSBhbHNvIHN1cHBvcnRzIFBNQnVzLg0KPiANCkhpIEd1ZW50ZXIsDQoNCkkgd2lsbCBhZGQgdGhl
IG5ldyBjaGlwIHRvIG1wcTg3ODUgZHJpdmVyLg0KDQpUaGFua3MuDQo+IFRoYW5rcywNCj4gR3Vl
bnRlcg0KDQo=
