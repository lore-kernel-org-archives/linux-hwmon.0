Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F68366079;
	Thu,  9 Jul 2026 00:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.135.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783558779; cv=fail; b=LmzNCjZs+utTfNTZuLP03tehwc9iDS84ffYW8yOc9BGexLqqi4TFCemzNrqKc5/hkGqtq+3PGdZ4f9O8Q5Jp+I60yxZ3jU+avtl/zhLGDoZQYnfLqxwYSrRufd7uSRylk0ZTpeibuDta6KV8dgvZd/HIvS0NA8RUWgxaLMCWEXw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783558779; c=relaxed/simple;
	bh=9NG+rYKECPsHzlxK8NBY4Muk801sW9MXN2XsASre9zs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=B+nVTH5mDCNumZPUTLdsNvERKyMDamM3yMWcMscgq/7UJy+8koyxEmEMeIWXFEdypFElHITfs+EyRRfVlApyQspz9Slb/nYGOpwNxkVl0i+czFsfzDElieYYJUYbfeM6rUbelNr9SXg4JoJScS8JlGFHqmW8a78fnKg7EDJpGf8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=iIOoC21x; arc=fail smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="iIOoC21x"
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668N5ZTV3645967;
	Wed, 8 Jul 2026 20:59:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=9NG+r
	YKECPsHzlxK8NBY4Muk801sW9MXN2XsASre9zs=; b=iIOoC21xZa67IAjAUdSLs
	PlS/c8RRuRr0wZmZKCuUsu05u407w+g6vBQ9Z+QEFknTziGnGzIhvbZYbE5PBqK1
	g+lLm6GAaPv4TN1zJ4ge6BXPRkhuQ7k8mRpIrSoibUTDT1BnF8qXxy+ZeCiiusaE
	G9RQ3I3aoOdLhT/gHW2ThRYD3Vlf1I0F8CNVeT5ItGRaNWm/sKQISLnehrky6zzc
	fGUkAzW1r1g88zVl2XUC1mOCgkUptXb0y3alKJvPc6Es58fUCVr+MfYJzYlLsu1s
	rxafohtF23msVgI22Qo0Y2FxWngeY1YPzmvwXUzPyRUS0kzxwc7cDIRsxMUmAAMa
	Q==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011002.outbound.protection.outlook.com [52.101.62.2])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4f9mybu6ea-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 08 Jul 2026 20:59:02 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rdjmhaEaiI9mBccuZ5pwtw6lMyKbGXOGoQmTZ1IF4dVkcBXq/mtolIW2TrUb5vNqOU6V21maVLCuNDtqAmPDsY7kSUAb28xGMrw9RcVCFGy5OeWnvs6aaZ9yZEfHgSDwe1c8gHxsZvc8tt8MJcEUNm372DJEtg8TPH3hktJDpe6LulCAgwVVsZ/B2opwUHf3DXmN6Da9Mfcy/wLUmMFBM2H4cFyhf71hcq4KVuyQuBYBMJAkJahmA5dRcYN52U9GPr0j5m0vLHOkK9kItwMqH0o3ft8QDr78dXuSa9J0lFbkPf+wDdzqmRL+BKQKGapyWqyOj+jgIKQiShEEV9opjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9NG+rYKECPsHzlxK8NBY4Muk801sW9MXN2XsASre9zs=;
 b=NqK55YpQ7qE6RML9glnajleIM9SlWxbbSyoR0QLQwYyc/dSpyWONrVVpYjsaBECOumJvO7S8QzHbnCy6WAeB1vBQEa6Q3w4Aiby30hrIy+WFgkrBk2LPtIki9yr8PqPc3xN4EiMDWSrRKB8Jl49TExuK2T4TZr0AKCOAtDVcA9JBdp2YCUj7mZulp/eqkzkj1GLdn8l5I/GJKpseqUKRpSVKrF9pA9FwfxTAl083DCmGYuiNbDwp/MXzZ2bD7TM91P9o53pdqufIivaGNn1JcMRYEPdwE+Yck1Vc0QJ9FEPA9BNL62483M+4LdnMe1Wo28NhKtMF/XJU5qCJCCWQnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from PH0PR03MB6351.namprd03.prod.outlook.com (2603:10b6:510:ab::18)
 by PH0PR03MB5702.namprd03.prod.outlook.com (2603:10b6:510:41::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Thu, 9 Jul
 2026 00:58:59 +0000
Received: from PH0PR03MB6351.namprd03.prod.outlook.com
 ([fe80::1578:4572:29b5:2442]) by PH0PR03MB6351.namprd03.prod.outlook.com
 ([fe80::1578:4572:29b5:2442%4]) with mapi id 15.21.0181.009; Thu, 9 Jul 2026
 00:58:58 +0000
From: "Torreno, Alexis Czezar" <AlexisCzezar.Torreno@analog.com>
To: Guenter Roeck <linux@roeck-us.net>,
        =?utf-8?B?TnVubyBTw6E=?=
	<noname.nuno@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
CC: Fred Chen <fredchen.openbmc@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Wensheng Wang
	<wenswang@yeah.net>, Frank Li <Frank.Li@nxp.com>,
        Brian Chiang
	<chiang.brian@inventec.com>,
        Cosmo Chou <chou.cosmo@gmail.com>,
        Dixit Parmar
	<dixitparmar19@gmail.com>,
        Eddie James <eajames@linux.ibm.com>,
        Antoni
 Pokusinski <apokusinski01@gmail.com>,
        Thorsten Blum
	<thorsten.blum@linux.dev>,
        Ashish Yadav <ashish.yadav@infineon.com>,
        Syed
 Arif <arif.syed@hpe.com>, ChiShih Tsai <tomtsai764@gmail.com>,
        Abdurrahman
 Hussain <abdurrahman@nexthop.ai>,
        "Paller, Kim Seer"
	<KimSeer.Paller@analog.com>,
        Colin Huang <u8813345@gmail.com>,
        Yuxi Wang
	<Yuxi.Wang@monolithicpower.com>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "linux-hwmon@vger.kernel.org"
	<linux-hwmon@vger.kernel.org>,
        "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>
Subject: RE: [PATCH 2/2] hwmon: (pmbus) Add driver for Analog Devices MAX20912
 and MAX20916
Thread-Topic: [PATCH 2/2] hwmon: (pmbus) Add driver for Analog Devices
 MAX20912 and MAX20916
Thread-Index:
 AQHdDgvSVz7AoCbLVUu1ZWvGaSiXVbZiE7IAgAFGGACAABlIgIAAC54AgAB1ngCAAGiVkA==
Date: Thu, 9 Jul 2026 00:58:58 +0000
Message-ID:
 <PH0PR03MB63512A19C32B7722D17D0FD4F1FE2@PH0PR03MB6351.namprd03.prod.outlook.com>
References: <20260707122701.751878-1-fredchen.openbmc@gmail.com>
 <20260707122701.751878-3-fredchen.openbmc@gmail.com>
 <f9e32dd1-7c2c-4055-83fa-94683777e30b@roeck-us.net> <ak4QO9uhKOt68dl1@nsa>
 <20260708-true-carp-of-champagne-a0dcca@quoll> <ak41BRQBNdsQrYww@nsa>
 <b2a5e99c-6d4d-454e-8ecd-8638e4dc0ddb@roeck-us.net>
In-Reply-To: <b2a5e99c-6d4d-454e-8ecd-8638e4dc0ddb@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR03MB6351:EE_|PH0PR03MB5702:EE_
x-ms-office365-filtering-correlation-id: 105334a8-0fb0-466a-ec4d-08dedd554208
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|23010399003|7416014|1800799024|366016|56012099006|11063799006|4143699003|22082099003|18002099003|3023799007|38070700021;
x-microsoft-antispam-message-info:
 8lm0HFHAYXYj0iXMSr5nOz3jaxeYgWbxvk08YC5oomMg7ghTmjMNYGN2JOa2FWML3ri187OkFfIMFw0xg30LaY1cxmLizSP+GNYLcLFF8vK1d08PQ58v2LOwDykfq6pKe6JAzD3EpY741eOw0n4YQKer4l8fWnRNziYz+NFtmBqKYMvI6Ospu9PUUB8fcu6S79EBJQ7ObrQe6b7jv6zQ6p7q05pN272RME+QOO/uCDCgZRxVqnNFpZsvVw9JZ4IPqTvxm6odiKJpPaCAuU5LbJRRTEg32Dsui5s4qCm4+L55smO5jpDBZnRykRYcCTYONYfElYlda+1prLRtCmruuB+x6Ny3psdFzf9UI4+oa68g3XdGQ6M7rh5X1HOQeXwEKlYkLFlffxM17wxF7OgDdH+6M9EhPg36It7I9a2w6vNval7zSQboNl1RHdLLKmHPO8W0S1ozf5E2PlT4L55gFhJLIT3kU3kGcBOl3SCH8FKX7zfBfVwIbG1NSem0mGk1xHIZxbGH3NYhMp2oQKqDA3q6pQVxgQROmPyJpEB+ypcCPJM5mNE+DJYewaC8Rt1eLlvbz3V1roxAYLX73ldykz1dkTbFiVVtAC8ofGTbXqqLD3KAonJXSZhgHeaZPvDnGJMpbmEkoJbbS7zPyV9n6fHXiNFNRXoh2WO+DtzUa+yhdBZ0QvfiZa0+StMFWF6ICO4GqkSgUAnYAZOkcG42ZA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6351.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(7416014)(1800799024)(366016)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003)(3023799007)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MzM4dXBSR3Y5N0w3NzNUbUZKRnBJTTNRWTQ5UE9NbmkyQ2t0U1hPcUp0T3RX?=
 =?utf-8?B?VC9kYkp0cGs3UWh6WkxDNnVwMWp6QXgrQlFXTWRxY0ZRRWlZYUM0YXo3eUIv?=
 =?utf-8?B?dVJ2eGtQS1E1NHgwT0FJNUY5cUpWWHhXWHhSZFBZNlVxVTlMSVAxYm1wQWMz?=
 =?utf-8?B?aUxsNEFUNjdBZHVZcWthckYvcEx3MzJWQTJEU3F0TVJiWHZIZ0pMblVpNGM5?=
 =?utf-8?B?WGFERGZ4U3hka2hQQzJUOVp5SVdQcXZCSk91a09ENFRoeFZsYjgwMDlDakZH?=
 =?utf-8?B?QXB4Qk9ha0xZRzMwNWgzcVNpaTYyb095T2QwL2NoZGd0N09QL0ErRmlUWWQ4?=
 =?utf-8?B?aG5sNFIzZUs4YjVuOXJQS0k3MXRmd2VQNVU5bTZQNzdMU1o5RW11ZlNRMmdo?=
 =?utf-8?B?b0tTM1FXU1dISkc5K2pIaWNteUhmbWVJdFI4bFN3R1c5bUlFazZxQ1grL1Nt?=
 =?utf-8?B?R0xvNkdtV3ZxQkp5YXJpVk03R3V0QzQ0UzQ1QTQvcUt5aGJEYmtFYkxpOEtZ?=
 =?utf-8?B?eEFWM2dXRDdmU041Ti95TTZCdkE1Vi92bWljT3M3LzljU3NkWjRJaEdIa3h0?=
 =?utf-8?B?MnNKeFNmZnJ5Q2NCeHg1Wll2ck9NempSZ0lUWkxUSExxVld1OXhzYm5qcEdL?=
 =?utf-8?B?b2hmYWl1SVFXQi9VNWcwQVB5WWYvNXFZRk5mUHJObUFGNlpaNnNFR21BLzlt?=
 =?utf-8?B?ZG05ZnUyNjhzOG5FM0dyRU14UVJndUpENHZFaGhPenErUnBPeUl2d0s4NVg4?=
 =?utf-8?B?Z2Erd09JQ0FQZGg4VEE0L1BjT05HaU5pQjczOFBiR3pqdWFtaHFjcWQzZ0o1?=
 =?utf-8?B?RGlEVkdmdVFudXd5eHdVM2ZudTJqcnYvU1d1b0R4OWEvK0YwTzFWSi9Tbm9I?=
 =?utf-8?B?LzZPYjB2NlR0cVJhK2ZSSU16NDQ0MnRJN3loaEIwOXFBQzU4RmFDall3aU1j?=
 =?utf-8?B?WTNMRFNOS2ttMFE3QWRnL0crSThlRmxSSGRPaTNxS01TdlZUSGpMNGtpMjdM?=
 =?utf-8?B?Vm5HZDZTaVNYVWtiSk0xam5rdk5OUU5SL1VlaVdHdEFZTm9sRUYycEpSMTEw?=
 =?utf-8?B?UXQ3NEtmbFlKakpueEZGVldOQUluU2VhUEYyTE9mYkNUQUg0a0RKaHhRb1FF?=
 =?utf-8?B?TDNmZ1l1eDdhbDhLU2laU0tWTThCUFlRSDgrUC96OUJzKzByY25lOCsxa3NT?=
 =?utf-8?B?ZXhMZUZKUU5OMldQbDRTVWV2OTUyaFJkMVM4R3RCbk1Wc0szMXB2VjVRcml1?=
 =?utf-8?B?N1l5cWYyT0dNQWdzbE5BZnF0SWFkL2VORDFWeTdqM0hzZUU0aDdPRVZoODlP?=
 =?utf-8?B?NFZ0Y01sNW1pQ3J0MWFja0dLcGJ1SjVrZWFtRkJuMDJQa3lOcFJVU3BMY1Z4?=
 =?utf-8?B?WWhKRlFsaVJ0VHRZOXV2YWVUVzhZSUhxeUlGUnFBRmdXVHJOWW9nTkl5N0wy?=
 =?utf-8?B?MDhiNzVUQ2VDRmFKRkFhWFJIM3JCRktJdGNnZ0N4OU9ueXdKTTBLY2o3bEtx?=
 =?utf-8?B?akVkR3JBRCt6WktoM3lIMWRPY3BEMHVjOXBjVEtENzVnd3pDRFNCbis4d01K?=
 =?utf-8?B?eWl6Zi9MV25RSXY1R29BMWtDakFnN29NeTZNamRwVU53OEVrWnJJRnJCV003?=
 =?utf-8?B?U0tBbERHbU9IckQ3TTlRT0xZRzhLYXJFbXhKQXhmUm1qK21JdmhDMXR6djNC?=
 =?utf-8?B?VFlQai9jbll4K0pUQVorbzIrSk93Ynh4Ly9YdnpQb2tXVU9CbmhlalNreExN?=
 =?utf-8?B?WFpockdLYWhpUnNjVWsxTVZOSTRJK29oeFZxbW1WYlhmcnBpSjdkN3hzU3dC?=
 =?utf-8?B?RUpSbjhRaU1TRzljZVBZTHE1MTI2cXp3TmhGK1RZdnAzQSt5RWQxbzNUVFZT?=
 =?utf-8?B?YkNnNEU2MnFneGc5cEpzR1dKWFVrM3U4NDFWemRJeG5wRms2VWVsVHcwbXl6?=
 =?utf-8?B?aktWOXpHZkpLb2gybk02RENmTG9mVE0zN0hFZHU0bWM0UW41Y3hIUTY1REpN?=
 =?utf-8?B?UUk5NVdBMmNNMFRaTXBWc0ZnR0FKbWFnZmowdXlNcFRoSWs0Z2JyYlZJUzlH?=
 =?utf-8?B?MTF0b3grTE1LU0dDeG1aUFpLWGo3eW1WcElDdE1oYXROTzVMMUIvM2hlbHNS?=
 =?utf-8?B?UGNSQSs0cGNZNUdDdXNEeVErczlPdGtFdlRoL0pkUno5bFN2VXBBNXRvSFJM?=
 =?utf-8?B?K1UzNk1YMWNsc1NxbGlLQnhCQVp1a2hTdHhxbU1DeDZPYWRFbkNKNDFuS0x3?=
 =?utf-8?B?RVpweTU5NEc0bVp1WDE2dEJPUXE1WkV5S3hRV1p4dXJVOGVDRmdjWmpXK0xP?=
 =?utf-8?B?aWJ2dzJxUWR3NHhIQkxMZ0JXNlo5cG1rTjNBRUJTV1M4TnRVWkNFWHpRaE0z?=
 =?utf-8?Q?xwysAxfm2ATKUX3A=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	pEzJizK/wtERetqOBIF/DMcYEG9ogDdc9eITR3mb9DpTdEpql48Zn8l9yonWnAbFW/FuRYmp7805l+7e/xBqZIdVQ4Hi/t7ojUt+SzrFslEbXAZlwsfW6BNfjwOGlRcDHxbtN2Pila+7hVt4piqntgTzHDvytS5cYBoK7JOXaiHd35tpovS9Dt9As7v7v7AxD/0VtbPpYiH/iQ7sXYV4Gw4WS8g5deMWnXXX46sbX5wS8ATCJfo7gthJ4bwlhWFptZUQHdNLxK2/GmXxPtkGhOxypVtNQVdKaH8rYiR+oxmep4UOzA5nTMH1icAKqkNiswMJ5UyNiMLpol8QDyCvZQ==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6351.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 105334a8-0fb0-466a-ec4d-08dedd554208
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2026 00:58:58.2666
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /T4DhF4DsuXTyoeHslsJ7Sw97oB/10XxHqqScaJfo0+Wk7FDKIMxT9X8xfzbAOefSFoKqo7nzWdO1EkwPqUl3akHtAR8Os5fv3qDNk6ASkY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5702
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDAwNyBTYWx0ZWRfX3Pgy60eZaPpN
 OqfomddbDi22pcJnmc2kN6W3WFnFJ3hO2nSzb6muwC7L3RQi4PtGsmTL++io9zcdW9Gl8gATBQy
 0/XCZrJwPoibIg6KDTOBawIYChrYzL5wIsnF7Hre0txgqXhaKcIH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDAwNyBTYWx0ZWRfXwRnVFuDrW/jB
 ftlgWevmbuMBek2QPxCN3MNKAUK5ab4nYdVRq/mImgrqD8rNUqxRd+U0wbOHfrWecxdHXXP67cC
 r+hSN+pUc5uhe8hNZ75B8pSN91k2/+RiuzL6Lc20BMYnCdNqP0LzcQUf90k2HXz6Hnhj500KHio
 8xpg3A/nJEDO9PqvaRJF/eJBm3GNHENtgyEonpsiAdIRBubDVLRuhlF5jlafH//8XOYwk6qUm2Y
 ScF1/hXh+2XPPVP9x4/hijDEyB6dLYR1p+/7habs67kxvIs64jzQQsQkdp1smdDxEvtQT+OK6Xm
 uzPI1tdroFl6Bhxo2VzfOB+5dycs3ZwZgsDSpuSoV9uY1JzWefIR+EtRHp1DMOqx3G6rB7/UkFk
 lciLp15nEBmzqfIw2UyLNNXyHHcxvSNpFYlx9sRuPp1eQYABW5x9ktgKQb0v0emzPOiFEXleinq
 StkbKsJ12pReTKYevUg==
X-Proofpoint-GUID: bKc8CTAjrPCbxJc4K1n9kT7T85i1hPMv
X-Proofpoint-ORIG-GUID: hfwgMqJS6pig0W5cu3zImjOfC5S1pm4l
X-Authority-Analysis: v=2.4 cv=FP8rAeos c=1 sm=1 tr=0 ts=6a4ef256 cx=c_pps
 a=wqOHD3zG9oVgxNNyXktjPA==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22
 a=uXIjobp8t2wMuQ0fPvqm:22 a=pGLkceISAAAA:8 a=gAnH3GRIAAAA:8
 a=DYyO0W3ymCTxO1Uk30oA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_05,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 phishscore=0 priorityscore=1501 clxscore=1011
 impostorscore=0 bulkscore=0 malwarescore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090007

PiBPbiA3LzgvMjYgMDQ6MzIsIE51bm8gU8OhIHdyb3RlOg0KPiA+IE9uIFdlZCwgSnVsIDA4LCAy
MDI2IGF0IDEyOjUwOjI1UE0gKzAyMDAsIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6DQo+ID4+
IE9uIFdlZCwgSnVsIDA4LCAyMDI2IGF0IDEwOjE5OjU2QU0gKzAxMDAsIE51bm8gU8OhIHdyb3Rl
Og0KPiA+Pj4gT24gVHVlLCBKdWwgMDcsIDIwMjYgYXQgMDY6NTI6NDhBTSAtMDcwMCwgR3VlbnRl
ciBSb2VjayB3cm90ZToNCj4gPj4+PiBPbiA3LzcvMjYgMDU6MjYsIEZyZWQgQ2hlbiB3cm90ZToN
Cj4gPj4+Pj4gQWRkIHN1cHBvcnQgZm9yIHRoZSBBbmFsb2cgRGV2aWNlcyBNQVgyMDkxMiBhbmQg
TUFYMjA5MTYNCj4gPj4+Pj4gZHVhbC1vdXRwdXQgbXVsdGlwaGFzZSB2b2x0YWdlIHJlZ3VsYXRv
cnMgd2l0aCBQTUJ1cyBpbnRlcmZhY2VzLg0KPiA+Pj4+Pg0KPiA+Pj4+PiBTaWduZWQtb2ZmLWJ5
OiBGcmVkIENoZW4gPGZyZWRjaGVuLm9wZW5ibWNAZ21haWwuY29tPg0KPiA+Pj4+DQo+ID4+Pj4g
UGxlYXNlIHByb3ZpZGUgZXZpZGVuY2UgdGhhdCB0aG9zZSBjaGlwcyBhY3R1YWxseSBleGlzdC4N
Cj4gPj4+PiBJbnRlcm5ldCBzZWFyY2ggY29tZXMgdXAgYmxhbmsuIEknbGwgbmVlZCBjb25maXJt
YXRpb24gZnJvbSBzb21lb25lDQo+ID4+Pj4gYXQgQW5hbG9nLg0KPiA+Pj4NCj4gPj4+IEhpIEd1
ZW50ZXIsDQo+ID4+Pg0KPiA+Pj4gV2VsbCwgaW4gZmFjdCBJJ20gaW4gdGhlIG1pZGRsZSBvZiBw
cmVwYXJpbmcgYSBzZXJpZXMgdGhhdCBhZGRzDQo+ID4+PiBzdXBwb3J0DQo+ID4+PiBmb3I6DQo+
ID4+Pg0KPiA+Pj4gIm1heDIwODI2Ig0KPiA+Pj4gIm1heDIwODU1YiINCj4gPj4+ICJtYXgyMDkw
OCINCj4gPj4+ICJtYXgyMDkxMiINCj4gPj4+ICJtYXgyMDkxNiINCj4gPj4+DQo+ID4+PiBBbGwg
dGhlIGFib3ZlIHBhcnRzIGhhdmUgdGhlIGRhdGFzaGVldCB1bmRlciBOREEuIEJ1dCBiZWZvcmUg
d2UgaGFkDQo+ID4+PiBhIG9uZSBwYWdlICJkYXRhc2hlZXQiIGluIGFuYWxvZy5jb20gYnV0IEkg
Z3Vlc3MgdGhhdCBpcyBnb25lISBGb3INCj4gPj4+IGNvbnRleHQgSSBtYWlubHkgZGlkIHRoZSBi
YXNlIChjb3JlKSBkcml2ZXIgZm9yIG1heDIwODI2IGFuZCB0aGVuDQo+ID4+PiBBbGV4aXMgYWRk
ZWQgdGhlIG90aGVyIG9uZXMuDQo+ID4+Pg0KPiA+Pj4gTm90IHN1cmUgaG93IHRvIHByb2NlZWQu
Li4gSSBjYW4gd2FpdCBhbmQgdGhlbiB3b3JrIG9uIHRvcCBvZiB3aGF0DQo+ID4+PiBGcmVkIGhh
cyBidXQgdGhpcyBwYXRjaCBpcyB2ZXJ5IG1pbmltYWwgd2hlbiBjb21wYXJlZCB3aXRoIHdoYXQg
d2UgaGF2ZS4NCj4gPj4+IExpa2U6DQo+ID4+Pg0KPiA+Pj4gKiBObyByZWd1bGF0b3Igc3VwcG9y
dDsNCj4gPj4+ICogTm8gZGlyZWN0IG1vZGUuIFRoZSBjaGlwIGhhcyB0d28gd2F5cyB0byBhY2Nl
c3MgcmVnaXN0ZXJzIChwYWdpbmcNCj4gPj4+IGFuZA0KPiA+Pj4gKiBkaXJlY3QgbW9kZSkuDQo+
ID4+PiAqIE5vIHdheSB0byBjb3VudCBob3cgbWFueSBwaGFzZXMgd2UgaGF2ZSBvciBpZiBSQUlM
X0IgKGZ1bmNbMV0pIGlzDQo+ID4+PiBiZWluZyB1c2VkIGF0IGFsbC4NCj4gPj4+DQo+ID4+Pg0K
PiA+Pj4gU29tZSBvdGhlciB0aGluZ3MgbW9yZSBpbnRyaWd1aW5nIGlzIHRoYXQgdGhlc2UgY2hp
cHMsIGFzIGZhciBhcyBJJ20NCj4gPj4+IGF3YXJlIChhdCBsZWFzdCBmb3IgbWF4MjA4MjYpLCBh
bHdheXMgaGF2ZSBiaXQgMiBzZXQgaW4NCj4gPj4+IE9OX09GRl9DT05GSUcgc28gYSBncGlvIHZv
dXQuIEFsc28gd2UgbmVlZGVkIHNvbWUgc3BlY2lhbCBoYW5kbGluZw0KPiA+Pj4gdG8gcmVhZCBw
aGFzZSBjdXJyZW50IHdoaWNoIEknbSBub3Qgc2VlaW5nIGluIHRoZSBkcml2ZXIuIFNvIEkgd291
bGQNCj4gPj4+IGxpa2UgdG8gdW5kZXJzdGFuZCBob3cgdGhlIGNoaXAgd2FzIHRlc3RlZD8NCj4g
Pj4+DQo+ID4+PiBBbnl3YXlzLCBpZiBGcmVkIGlzIG9rIHdpdGggaXQgSSBjYW4ganVzdCBmaW5p
c2ggd2hhdCBJJ20gZG9pbmcgYW5kDQo+ID4+PiBzZW5kIHRoZSBwYXRjaGVzLiBJdCB3b3VsZCBt
YWtlIHNlbnNlIHRvIGhhdmUgc29tZXRoaW5nIG1vcmUNCj4gPj4+IGNvbXBsZXRlIG9uIHN1Ym1p
c3Npb24gYnV0IEkgZG9uJ3Qgd2FudCB0byBqdXN0ICJzdGVhbCIgdGhlIHdvcmsgYWxyZWFkeQ0K
PiBkb25lLg0KPiA+Pg0KPiA+PiBCaW5kaW5nIHNob3VsZCBiZSBpbiBzdWNoIGNhc2UgcG9zdGVk
IGNvbXBsZXRlLCBzbyBwcm9iYWJseSBub3QgYQ0KPiA+PiB0cml2aWFsIGRldmljZS4NCj4gPg0K
PiA+IFllcywgaW4gbXkgc2VyaWVzIGJpbmRpbmdzIGFyZSBub3QgaW4gdHJpdmlhbCBhcyB3ZSBz
dXBwb3J0IHRoZSBlbmFibGUNCj4gPiBncGlvcy4NCj4gPg0KPiANCj4gU2FtZSBxdWVzdGlvbiBJ
IGFza2VkIGJlZm9yZTogV2hhdCBpcyB5b3VyIHVzZSBjYXNlID8NCj4gDQoNCkhpIEd1ZW50ZXIs
DQoNClVubGlrZSBteSBNQVgyMDgzMCBwYXRjaGVzLCBmb3Igc29tZSByZWFzb24gdGhlc2UgY2hp
cHMgKG5vdCBvbmx5IE51bm8ncyBtYXgyMDgyNikNCmhhcmR3aXJlZCB0aGUgYml0IDIgaW4gT05f
T0ZGX0NPTkZJRyB0byAnMScuIFRoaXMgbWFrZXMgdGhlIHVzZSBvZiBncGlvIHRvIGVuYWJsZSB0
aGUNCmRldmljZSBhIHJlcXVpcmVtZW50LiAgKGFzIG9mIHRoZSBsYXRlc3QgaW5mbyBnaXZlbiB0
byB1cykNCg0KUmVnYXJkcywNCkFsZXhpcw0K
