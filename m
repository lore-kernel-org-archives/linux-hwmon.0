Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7246D39B497;
	Mon, 20 Jul 2026 03:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.139.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784518930; cv=fail; b=Az7PaQuFfqKVx4Nubqq4PHKg1bK/VsGzA+7N0vc0DzKE4gVQASvRrT10Lu1xqb6gSZK27V/ZNdhJgjgK2ERzp/MW0ZoSUGFPKH2wrlSoNIND7XXIUWmzecwG5mOqwJwLz6NZI3DC3JQun+I7GFlv5ivaHm5cBKPKj97x8gUdpL0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784518930; c=relaxed/simple;
	bh=j+JnPbd66ghJIlkTDKK26JkvDEYn+tFWU2ur2Uh0y8Q=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=O0kJHES4OIaKSZeWPcsliRljsrBIeuuKsPZheZMToakdmsaTMDkKvkR2w8TL4SmAX16eRwVgRNyQabuwumosh479vsTB5knRO19Sfx9C2GTyRVofVRwjH8QbrNsL+8CYtmQvYssUjTWdIYoTg0LXl8EBXhn26O59emzfYwbz4U8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=Z4wg/UXI; arc=fail smtp.client-ip=148.163.139.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="Z4wg/UXI"
Received: from pps.filterd (m0167090.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66JNsB6M3343748;
	Sun, 19 Jul 2026 23:41:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=j+JnP
	bd66ghJIlkTDKK26JkvDEYn+tFWU2ur2Uh0y8Q=; b=Z4wg/UXIgdOp9XNtok4Nk
	8CMi5HCZtMiTmNkIJ1IbTY2dLZ9Z/Sw5lObLoBFDImEgsd4Cj9FpTqAWjBKhcOWQ
	0t/K6ff9OHr0MHiEC0ZJ+vjFu5Y8iQvbybjlTDvZPiu9RjFyzaEoF3iwBzlMRGjY
	jSgp6+0n3/58ld0O/LyfhF7VVFp5f8u4eW20OlLUa4xhWjqncdhhFJAMdnfpEfpD
	IavZzZD2lwmQznXulEUVel6v/dC9CE2SzceR2WNX+eC+IyXIG+zCl8W8SqapfZ/L
	Czo788D9ACffQztAwZwXtqoLUsV/2CaqALeYy9OGHPVLZ6Bs31El3b6X/SdGdGo4
	A==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012057.outbound.protection.outlook.com [40.107.209.57])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4fg644c6xm-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 19 Jul 2026 23:41:47 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FtqFuu1N5AWZ8FUX2DVwy8N0uJp0QteHCtGpj0kBuzQikWmdJ14iVm6rEWFtgvce6qo3OHr67MgnCJ84RWYsY9ElzIeQ6A/vbTH2YV1mP3EzYUKCvZ4Mr60/qjEQz/MfJ2WKX5JmAojhzzNdTWYyTgTXRAceHA/7y6fg78qqgBNDi9lTlPX62LydkCMbACjYIMXNqNJJsRkeyAOWMfh1BXB5ngVE4EFajlQ8zKJv91mGpkPDiIO84j+EUbNaLKfrUGazSo5GozLGgrreRlcWwQOx+QifmZ0pPnQhVfuVBT8Jp/vZsX4U5niYZ9wLIfwtdTq5/Y00oRca72mynGSowg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j+JnPbd66ghJIlkTDKK26JkvDEYn+tFWU2ur2Uh0y8Q=;
 b=P8QdDnnNC4vzQBMF5qaxLJVQyw+ma0yC+Mns0B62u8m0cZeyb6R5K4TEdOtza5nV5eW4G06nC+Q5MsfkdEJLBqBfsLlA0Vk0TZ7n1pb8aHuW82vUT5+aWMHZZOE2O3OevMSNw9uzc9dWmU7EBpuQAmWnja6H9UZM5QLBu7KMJbshrsuK5pw5WKpk73ynm8zhwQoN+MsMW/f3swy/BZI8XS1BQNHgdgSl4jJSftbG5dIDMrn7AA45qn6CfI9Ty9a+E2Tv2gV/Zd9F6t9jD0P7eyNJnOzdH/vu1kFbRmsriYfA/mpiaEoeILkgR49WlKZLBADgVUHd3iUlE1bGg3T27Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from PH0PR03MB6351.namprd03.prod.outlook.com (2603:10b6:510:ab::18)
 by IA3PR03MB8384.namprd03.prod.outlook.com (2603:10b6:208:543::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.13; Mon, 20 Jul
 2026 03:41:45 +0000
Received: from PH0PR03MB6351.namprd03.prod.outlook.com
 ([fe80::1578:4572:29b5:2442]) by PH0PR03MB6351.namprd03.prod.outlook.com
 ([fe80::1578:4572:29b5:2442%4]) with mapi id 15.21.0223.015; Mon, 20 Jul 2026
 03:41:45 +0000
From: "Torreno, Alexis Czezar" <AlexisCzezar.Torreno@analog.com>
To: "Torreno, Alexis Czezar" <AlexisCzezar.Torreno@analog.com>,
        Guenter Roeck
	<linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet
	<corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>
CC: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@oss.qualcomm.com>
Subject: RE: [PATCH v3 1/4] dt-bindings: hwmon: (pmbus/max20830): add VOUT
 feedback resistor properties and complete examples
Thread-Topic: [PATCH v3 1/4] dt-bindings: hwmon: (pmbus/max20830): add VOUT
 feedback resistor properties and complete examples
Thread-Index: AQHdF/X8Z2VmjJDBfE+uXgH6InSLHLZ1wl8w
Date: Mon, 20 Jul 2026 03:41:45 +0000
Message-ID:
 <PH0PR03MB6351F6B8B86C56F9DF512797F1C32@PH0PR03MB6351.namprd03.prod.outlook.com>
References: <20260720-dev-max20830c-v3-0-9d06d27d6da3@analog.com>
 <20260720-dev-max20830c-v3-1-9d06d27d6da3@analog.com>
In-Reply-To: <20260720-dev-max20830c-v3-1-9d06d27d6da3@analog.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR03MB6351:EE_|IA3PR03MB8384:EE_
x-ms-office365-filtering-correlation-id: 6c164579-43cf-4db8-854c-08dee610d222
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|23010399003|1800799024|56012099006|11063799006|4143699003|10067099003|6133799003|18002099003|22082099003|3023799007|38070700021;
x-microsoft-antispam-message-info:
 ES7wT8P6jOl5+Sl0EGRguu8q+86ms0ZMZ4gVAKhQFfPW3u+OioIDRN4n73wikO14Q4lIHwXx1wcri7HNdm+jRLGAYHnfmMQ0p4qw7InnHvFJMbZ6py7pseilkxuryHca6HcL/WMTTl+YVbgHmYFhwitfkbRyjl7OUPpF5AWnv0I1KJeQ50hJKon0NUhFhd7/HiNrs8uDjm9WDFFzvuLLK/7LgLbrCkcmOhatGgONnCfic2zWISU42VsA9P8tDviVSaRmx2qVyPM/VV5oljgHBoGPepmkhM6ht5KukmcnP/2EmrEbNBIjR8mYWGkY7QHnnasRtmHfcqP5MQK8fbbSHBrmfNmwTrmbxF7OgL2ExkLxZeplxsKm+k3VMK+gm2ursaJgdRFDLqo7hcV4/xkOtT7pDp4fSPdFXF2nvc+HIQkE3n+/V1QMLiknWHDcmf3dIgErnVF3nBWzTY7N8AvTL0xnRSx4W2zHB2pnigTcy1YIJ/QCFE1suSHt6wYxZrxiaOqEmZGOYOjzLgpU1MLs5EqKcoFVkh95IBNB6bnk2dyQ7ysfZLtmxUVvU6k8WcdypFA90YhYDfpvTXahX1wbUTmjWFj80qpmyCO/i5D/uUAzr5h2Gcz7oqAtBNxtZpXXl6uzqtrst/lGEqdQ0DqdRpZHT0kEjeHhUM7eqES4wLpK2ncTawLWxk2L3AfRhs7k+6qu9U1iHf3CP88iTa7VTP2mtTfbeyL4xMwxgNrpDf8=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6351.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(23010399003)(1800799024)(56012099006)(11063799006)(4143699003)(10067099003)(6133799003)(18002099003)(22082099003)(3023799007)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cGF3cUtsR0w2ZGhXUkIyWVA1MDIzU3UwWjlUemw0WURDOEhDL3JTWHF3RUI4?=
 =?utf-8?B?bHRwTThOKzVGUjIwZ2J2MS9sZmllN3RtcWlkTWRnQmtIU3ZMTEJOY1NrcEo2?=
 =?utf-8?B?aEJOdHFFSG91SGhMY2VFQmNjZ1NTUGlqUWFSOWp5bXdIZXB5OFZ3Qzc2b3F4?=
 =?utf-8?B?TWQ1eU9WeXR3WFRvZXB6ZXZZb2ZVT3NRenNBUzMwWXpCREJFVTA5dmtxYitv?=
 =?utf-8?B?YjJXNlRDejY1Yi83S2U2UW5Gem81bDd3cnlKOXBMc3dXL3dMM3BSNTc0MjBm?=
 =?utf-8?B?b3FpaFU0UjlDMm0rYnl4MnhpamZpcWtrQjJrMlF5VFhwOXhRUVI3Y0ZhWmlv?=
 =?utf-8?B?em8xSzdzSTIvVm5MVVoySlBVVUI5UDU2a01GZTg3N0ZCOXUyTFBlemFtQzFa?=
 =?utf-8?B?eVhOSWRhM1ljTFVKYklGTzhURWw3aEdzbWcvMXhaSU9Eb0x5V1JSVWlJbXVs?=
 =?utf-8?B?K3h4c05BRCtQZjVXckROZ2tOZUJLdDFGRkxLREFYVFZxNnN3c3pBQ3YrYW1p?=
 =?utf-8?B?TkVhR2IvM3NiT01kYjdvcWp4Wm1rc0VwNDlMUkdxK1l5dEpZMU9YbjVCY0lL?=
 =?utf-8?B?UDFmQ1V6MTc3TjFGWFpmZlFpZXRZdmw2S3pBM1VuT2s4V2FkME1iMjI0Z3hq?=
 =?utf-8?B?eGpEL2RiU2EvRldid1Y5ZkEvaGRTeE1JZGlvRzB1a2M5MzFuVXFLOGNSalM1?=
 =?utf-8?B?WEt3cVp1YVFTSWRsOUxpdmxLMTM0ZFkvZmt4SmRvbE5qYTZxNWh5YzB2ekFj?=
 =?utf-8?B?ZzV0R050UDZoWVBTVG5wY0RwVWJ6Y2lNa0xyL2drL2Z3Nk11WExsUVdCd01D?=
 =?utf-8?B?K1c0dVVWZ1ova1hTOHdidUdiTHNuaVVmSWhMWVA4QVVMRWRsMEt4QlBhQ1F6?=
 =?utf-8?B?ZUVuWXhCQnZuZWNTSDczbVgvemNySU9MMGgrRExabDBWckVYWm13T3V2V2cy?=
 =?utf-8?B?YkRaenE0NG85YmNla0FocnBydDQ0VEpNMU92K1lkVEZTUm9vc2NxVFFVOVZI?=
 =?utf-8?B?SElaM2NRWXpBaytldThKSVRrUEdoNmI1RkJaNUtMUCs5UXBRQjBicUx5UXQv?=
 =?utf-8?B?aUFoTm9DeHpEQmhMUGRLdTNTQ3FBeVJxelViRHFvYkFNeThIL3cyREFMSkNY?=
 =?utf-8?B?ekNFU1U3ZmI2aUR1eENLcUhtRFphWGJqVGtqMVc5ZDNJYVN4S1o2MDA0Sk9W?=
 =?utf-8?B?VHkrazNpZDNOSTRxZFB2ZGFnNFlEZk5mby9XdVpEVll2SUtuQUVnT0EzMXBs?=
 =?utf-8?B?VE9oREVNdXZySFd0czF5ZFMyYmNRVFJjVmpyN1J6U0RwKzN5Y3JsNXZDamFr?=
 =?utf-8?B?VXZiNDBMTXFyTTA1T1lwamhqa2hXTk5kcmVyRFVOY3hYeXlGWXBNNGl1N3FT?=
 =?utf-8?B?UmV4MWR3NkJzMkNURnZHUTVpRTFMVjVuenFLYTV5d1pPaVBORmtPK2JMTWw3?=
 =?utf-8?B?VGxyRlJkbFBxUE9PWmtlTUlLb0sxWGR6L0loY1VCY2JoM2c4bFdjdWlHRmp4?=
 =?utf-8?B?TnJNMll3TTdqNGFoRnFudHhmUWRHTU02Y3BOWi9OK3p2T3JWUEZTWFV3Z0xS?=
 =?utf-8?B?UGJWbWVuQU05czU1VTZJZHVDOWZYVFErdW4zZXFIRE1oRnNWU3lxd1lWa2F2?=
 =?utf-8?B?MHhRMFlsb3YySjNJVE50MzhGeWRubXFBOEVEdlFUby83MWRkTXpsbm5weHN3?=
 =?utf-8?B?NVc5U0p4MzU4OW1zNXlQVmwwQ3VkTGR6akVZMS9LbFMwdituaVVvYU1DeEJC?=
 =?utf-8?B?Z1NEUkE1aXhFZDJPZUNlWVJNMVhCa0U2NGhpRFd0ejZabG8yWU1uVXZ3R0Zm?=
 =?utf-8?B?aU5zVHlxazViWjBUZEtVQzJuUjlrU25lY1J6emdpd1JCMWR1NGI1WmlUNmVE?=
 =?utf-8?B?Y0tta2lGMlh5cWJ5T2FzYWQ3VU1pTVpxN2F5SlZvL2Y1ZitKRTVaWGxiSFJH?=
 =?utf-8?B?WkNlaU55dW1zMk1rNEN1UU0wQUZPVkJLL1pzZkVHcVhwazZsNFpwUGNCb1M5?=
 =?utf-8?B?RzZiTDVrYXdpR1RBakdvbzBKSmw5MXpzNXFkNmF6T2h4SHQwdFk1bk9NZXh0?=
 =?utf-8?B?REpNOEdhaWs2dVpFaHZvNjh1MTVIeWF0NW0xS1E4cWkyU1pPMzRDdFdBdldS?=
 =?utf-8?B?THZXNzRRaHkyc01WMzFNNkhYL3pBL0JzNHlLL2tJYnI3K0NEWFZ2UThLVmpH?=
 =?utf-8?B?Z2FXdThwbDJGc00rdWdrSStNcmsyN3Fac1dLa0RIM0RBN2x2cDhJVjh2OFA2?=
 =?utf-8?B?SHJhek94TkVsT3lQR2Y4K2wvRlBzUndTZ3ZPOFc4ZmF3eVVTQm5SVVpRU2tl?=
 =?utf-8?B?SiswRDE5U0ZFQlFET0lEMEhzalFUWHN0MEdlMHU1Ky92S1VXZjdiVFpDeDMz?=
 =?utf-8?Q?tgPmKWImVto2aZBo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	PP+rs3PGWDXVcabum9r5MIxvHh0jzOWPi+YU+3agFPfINvOz1n4bvJ8uUNwxmCuzbvRweCG+YlvZsD+tofWXqjVdj4bDKbgtcup35G3qMSy23yD4jM2dVEnlfB6sgAO0teSLtJ4gyV0vct76xkXMfgj89KX3wDX2MMJWpfDJI3F2pW2HHZUYb70TP8Vixan17uHOKFjGMg3+xItOLM1npqOJt8SR0fVol8QOZTneRys6HaWnwIaWF6nVlaQVFAX+1VFK9pL/hdz9EgSZ2xOmK1WMEzM/TlML+klRdaUohU79TCLpN7WgFldHPU5SVU3y/PArRsFU8LaY4IdBBbWW2A==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6351.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c164579-43cf-4db8-854c-08dee610d222
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2026 03:41:45.2345
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kDmvgLby0y8sDQhjUXdgp+2W5bM9lUo5cHH9XDYyVBmrpDMirmnWNwWWqJNNZniXdHeFs0dDeJ0kUFS10gbgiWux5FuHfCE93N8Q/y4gEVs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR03MB8384
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDAzNiBTYWx0ZWRfX222+XrhOZ6G+
 lg8P7Hx98eP6jTdED9N5WRUhmQN9j9bvy8d3SFF3cbFZsHVTv+HkFBW3zRcHQ9WB26EyffHArkC
 KoSrJrrhADzRdGz3DQnyDSyPdMy25c4psnFwbVpV96tJeHOnVxrP
X-Proofpoint-ORIG-GUID: RYDDmEP8pUp2IPio2nItZ1nGz8m2epQr
X-Proofpoint-GUID: RYDDmEP8pUp2IPio2nItZ1nGz8m2epQr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDAzNiBTYWx0ZWRfX/bhndFXijyq4
 zcW8k8bhDmldA0s7XiKGPGz/91+sfcWlifsF6AGI3+4undZOTx3ynPYP7jUoY4L7iF/tO7y9JYN
 pQtIPegF6C2ejjDCsN2S7YsLn5cwSNmVqp2TSiuzV3b5eWGMS/LbWy8STfscFRgEk5ti/TuEK13
 nmwX3zTfOzXcaQskWbmgd5rFycR0RnXwO5gL7VpGrEIS5TLnl/nxEfT5MTAuEGBKDBdHH1W1TII
 McguACLskjycAwOewOM7vNbY2/UeZrr7t3CASJXv91fVs0Xj3tNSYVQO1gtpxbIoICmUsm58Yc1
 CFOK9j+bHbzH6b5i6M1yg75yUX4Y1n2pDZ8VnuLyycbjLZGivyWHIwvmmKYeAyfDQcq/LW3wDw6
 ysNy2fgMmhL01FpMWfjYChicxVvwtcbEpn2XE2DwwvZmNIMcF+1eo2HXbOv0deShoR6i3JLYuZ7
 jhV3j/X5U1wtEC6lcMw==
X-Authority-Analysis: v=2.4 cv=McdcfZ/f c=1 sm=1 tr=0 ts=6a5d98fb cx=c_pps
 a=Ovo9riOs5JmVBBfNyWc1Cw==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22
 a=_jAD5XSDOtq9-5Nde2OG:22 a=gAnH3GRIAAAA:8 a=_jlGtV7tAAAA:8 a=VwQbUJbxAAAA:8
 a=07d9gI8wAAAA:8 a=ag1SF4gXAAAA:8 a=EUspDBNiAAAA:8 a=JOa2Cq0ek4j1aV1kbiIA:9
 a=QEXdDO2ut3YA:10 a=nlm17XC03S6CtCLSeiRr:22 a=e2CUPOnPG4QKp8I52DXD:22
 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-19_08,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200036

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQWxleGlzIEN6ZXphciBU
b3JyZW5vIDxhbGV4aXNjemV6YXIudG9ycmVub0BhbmFsb2cuY29tPg0KPiBTZW50OiBNb25kYXks
IEp1bHkgMjAsIDIwMjYgMTE6MTUgQU0NCj4gVG86IEd1ZW50ZXIgUm9lY2sgPGxpbnV4QHJvZWNr
LXVzLm5ldD47IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Ow0KPiBLcnp5c3p0b2YgS296
bG93c2tpIDxrcnprK2R0QGtlcm5lbC5vcmc+OyBDb25vciBEb29sZXkNCj4gPGNvbm9yK2R0QGtl
cm5lbC5vcmc+OyBKb25hdGhhbiBDb3JiZXQgPGNvcmJldEBsd24ubmV0PjsgU2h1YWggS2hhbg0K
PiA8c2toYW5AbGludXhmb3VuZGF0aW9uLm9yZz4NCj4gQ2M6IGxpbnV4LWh3bW9uQHZnZXIua2Vy
bmVsLm9yZzsgZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LQ0KPiBrZXJuZWxAdmdl
ci5rZXJuZWwub3JnOyBsaW51eC1kb2NAdmdlci5rZXJuZWwub3JnOyBUb3JyZW5vLCBBbGV4aXMg
Q3plemFyDQo+IDxBbGV4aXNDemV6YXIuVG9ycmVub0BhbmFsb2cuY29tPjsgS3J6eXN6dG9mIEtv
emxvd3NraQ0KPiA8a3J6eXN6dG9mLmtvemxvd3NraUBvc3MucXVhbGNvbW0uY29tPg0KPiBTdWJq
ZWN0OiBbUEFUQ0ggdjMgMS80XSBkdC1iaW5kaW5nczogaHdtb246IChwbWJ1cy9tYXgyMDgzMCk6
IGFkZCBWT1VUDQo+IGZlZWRiYWNrIHJlc2lzdG9yIHByb3BlcnRpZXMgYW5kIGNvbXBsZXRlIGV4
YW1wbGVzDQo+IA0KPiBBZGQgYWRpLHZvdXQtcmZiMS1vaG1zIGFuZCBhZGksdm91dC1yZmIyLW9o
bXMgcHJvcGVydGllcyB0byBzdXBwb3J0IGV4dGVybmFsDQo+IHZvbHRhZ2UgZGl2aWRlciBjb25m
aWd1cmF0aW9uIGZvciBWT1VUIHNlbnNpbmcuIFdoZW4gdGhlIGRlc2lyZWQgb3V0cHV0DQo+IHZv
bHRhZ2UgaXMgaGlnaGVyIHRoYW4gVlJFRiwgYSByZXNpc3RvciBkaXZpZGVyIChSRkIxIGFuZCBS
RkIyKSBpcyByZXF1aXJlZCB0bw0KPiByZWFjaCB0aGUgaW50ZW5kZWQgdmFsdWUuDQo+IA0KPiBU
aGUgcHJvcGVydGllcyB1c2UgYSBkZXBlbmRlbmN5IGNvbnN0cmFpbnQgdG8gZW5zdXJlIGJvdGgg
cmVzaXN0b3JzIGFyZQ0KPiBzcGVjaWZpZWQgdG9nZXRoZXIsIG9yIG5laXRoZXIuIFRoaXMgcHJl
dmVudHMgbWlzY29uZmlndXJhdGlvbiB3aGVyZSBvbmx5IG9uZQ0KPiByZXNpc3RvciB2YWx1ZSBp
cyBwcm92aWRlZC4NCj4gDQo+IFRoaXMgcGF0Y2ggYWxzbyBhZGRlZCBtaXNzaW5nIGVudHJpZXMg
aW4gdGhlIGV4YW1wbGVzLg0KPiANCj4gUmV2aWV3ZWQtYnk6IEtyenlzenRvZiBLb3psb3dza2kg
PGtyenlzenRvZi5rb3psb3dza2lAb3NzLnF1YWxjb21tLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTog
QWxleGlzIEN6ZXphciBUb3JyZW5vIDxhbGV4aXNjemV6YXIudG9ycmVub0BhbmFsb2cuY29tPg0K
PiAtLS0NCj4gIC4uLi9iaW5kaW5ncy9od21vbi9wbWJ1cy9hZGksbWF4MjA4MzAueWFtbCAgICAg
ICAgICAgfCAyMA0KPiArKysrKysrKysrKysrKysrKysrKw0KPiAgMSBmaWxlIGNoYW5nZWQsIDIw
IGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQNCj4gYS9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvaHdtb24vcG1idXMvYWRpLG1heDIwODMwLnlhbWwNCj4gYi9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaHdtb24vcG1idXMvYWRpLG1heDIwODMwLnlhbWwN
Cj4gaW5kZXgNCj4gMTYyNWRkNTk0MTdmMWIzY2E2ODlhOWM4NmNhMjY2ZGE5MTNkMTIxNy4uMjE0
YWRmMWEzYjllOWVmZGVjYTdkYjNiZA0KPiA3Njc5YzcwNjU2ZTlhN2UgMTAwNjQ0DQo+IC0tLSBh
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9od21vbi9wbWJ1cy9hZGksbWF4MjA4
MzAueWFtbA0KPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaHdtb24v
cG1idXMvYWRpLG1heDIwODMwLnlhbWwNCj4gQEAgLTQ0LDExICs0NCwyNiBAQCBwcm9wZXJ0aWVz
Og0KPiAgICAgICAgR1BJTyBjb25uZWN0ZWQgdG8gdGhlIHBvd2VyLWdvb2Qgc3RhdHVzIG91dHB1
dCBwaW4uDQo+ICAgICAgbWF4SXRlbXM6IDENCj4gDQo+ICsgIGFkaSx2b3V0LXJmYjEtb2htczoN
Cj4gKyAgICBkZXNjcmlwdGlvbjoNCj4gKyAgICAgIFRvcCBmZWVkYmFjayByZXNpc3RvciAoUkZC
MSkgdmFsdWUgaW4gb2htcyBmb3IgVk9VVCBzZW5zaW5nIGRpdmlkZXIuDQo+ICsgICAgICBXaGVu
IHRoZSBkZXNpcmVkIG91dHB1dCB2b2x0YWdlIGlzIGhpZ2hlciB0aGFuIFZSRUYsIGEgcmVzaXN0
b3IgZGl2aWRlcg0KPiArICAgICAgaXMgcmVxdWlyZWQuIFZPVVQgPSBWUkVGIMOXICgxICsgUkZC
MS9SRkIyKQ0KPiArDQo+ICsgIGFkaSx2b3V0LXJmYjItb2htczoNCj4gKyAgICBkZXNjcmlwdGlv
bjoNCj4gKyAgICAgIEJvdHRvbSBmZWVkYmFjayByZXNpc3RvciAoUkZCMikgdmFsdWUgaW4gb2ht
cyBmb3IgVk9VVCBzZW5zaW5nIGRpdmlkZXIuDQo+ICsgICAgICBEYXRhc2hlZXQgcmVjb21tZW5k
cyB0aGF0IFJGQjIgZG9lcyBub3QgZXhjZWVkIDIuNWvOqS4NCj4gKw0KPiAgcmVxdWlyZWQ6DQo+
ICAgIC0gY29tcGF0aWJsZQ0KPiAgICAtIHJlZw0KPiAgICAtIHZkZGgtc3VwcGx5DQo+IA0KPiAr
ZGVwZW5kZW5jaWVzOg0KPiArICBhZGksdm91dC1yZmIxLW9obXM6IFsnYWRpLHZvdXQtcmZiMi1v
aG1zJ10NCj4gKyAgYWRpLHZvdXQtcmZiMi1vaG1zOiBbJ2FkaSx2b3V0LXJmYjEtb2htcyddDQo+
ICsNCj4gIHVuZXZhbHVhdGVkUHJvcGVydGllczogZmFsc2UNCj4gDQo+ICBleGFtcGxlczoNCj4g
QEAgLTYxLDYgKzc2LDExIEBAIGV4YW1wbGVzOg0KPiAgICAgICAgICAgICAgY29tcGF0aWJsZSA9
ICJhZGksbWF4MjA4MzAiOw0KPiAgICAgICAgICAgICAgcmVnID0gPDB4MzA+Ow0KPiAgICAgICAg
ICAgICAgdmRkaC1zdXBwbHkgPSA8JnZkZGg+Ow0KPiArICAgICAgICAgICAgYXZkZC1zdXBwbHkg
PSA8JmF2ZGQ+Ow0KPiArICAgICAgICAgICAgbGRvaW4tc3VwcGx5ID0gPCZsZG9pbj47DQo+ICsg
ICAgICAgICAgICBwd3ItZ29vZC1ncGlvcyA9IDwmZ3BpbyAyIEdQSU9fQUNUSVZFX0hJR0g+Ow0K
PiArICAgICAgICAgICAgYWRpLHZvdXQtcmZiMS1vaG1zID0gPDEwMDAwPjsNCj4gKyAgICAgICAg
ICAgIGFkaSx2b3V0LXJmYjItb2htcyA9IDwyMDAwPjsNCj4gICAgICAgICAgfTsNCj4gICAgICB9
Ow0KDQpEaXNyZWdhcmQgcGxlYXNlLCBJIGNhcnJpZWQgb3ZlciBhIGZldyBpbmZvIGZyb20gYSBk
cm9wcGVkIHBhdGNoIHRvIGNvbWJpbmUNCndpdGggdGhpcyBwYXRjaCBhbmQgbWlzc2VkIHRoZSBp
bmNsdWRlIGZvciBncGlvLg0KDQpBcG9sb2dpZXMgb24gY2FycnlpbmcgdGhlIHJldmlldyB0YWcs
IHNob3VsZCd2ZSByZW1vdmVkIGl0IGV2ZW4gaWYgaXQgd2FzIGENCnNtYWxsIGVkaXQuDQoNClJl
Z2FyZHMsDQpBbGV4aXMNCg0KDQo+ICAuLi4NCj4gDQo+IC0tDQo+IDIuMzQuMQ0KDQo=
