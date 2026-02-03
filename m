Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010000.outbound.protection.outlook.com [52.101.61.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA86639B4A2;
	Tue,  3 Feb 2026 13:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770125494; cv=fail; b=lRYMX97DUSEHlj9Vw/ZArE37FKfKtXFqT0UwsShr2svgxrQWcbGrf2KsMKCUnqyEf+o26Nh3Jto5AoN4j3ATzkpC+MZjdMB+fa8lnjjZLZbSJYPZtNVP0CxBFCX84hGcAt3EhUpx46zpm2Fyu8WaygLCcDJtFpftH2E64GRtuSo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770125494; c=relaxed/simple;
	bh=G2GfBzzvYFSfF2KVtAn4GJFSu9+941U3H6wgM82Uce8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ugQO36DXwQ7BRyliu658kFc/uTdie7HPzq+FZ8u1HKS5BolJTzodN4EmJZg0hc8GCurvxZLCzfPWcUcy9PV2yr3DEmmrgv8d5lZRX+9lsxFR3VbWaGAtqDY0AP5nVZVdefjNa0JDn1RpE6P1wuFwJywwZIpVDxMr1zdB3OXQg/k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=kf3A+m87; arc=fail smtp.client-ip=52.101.61.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="kf3A+m87"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lZO6Y0jY2aGEo8CkLUQ2E76OX44dmyIsI485iT9nEmTvBXkKrj0fXv8FKt8L9yiw0+zKb/Bm6JCKaW0qq9QHZPpig1ZEXoq01zN0VRwOLqSb7QOYACV0gpuf53S5VZBdXdzT1ULCmZDdgXFmeJNusLWgqOdgE8NQ2EtY69ZxOmPvzs5agS7SSimksnKY/eSJols5GJQzrVdHyOCjpYr39qourIvsjEO4T5BZ1giEOHKtOZpe5UgU5dYQm3CjIJOLc8QJL47oA038PnwFOM8rAfODwNem0fV8GkUPKGudiDlxZ9dYs0aiU+X3pqXaCG80HMZwOD74CdsgGSWOWH6i4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G2GfBzzvYFSfF2KVtAn4GJFSu9+941U3H6wgM82Uce8=;
 b=JdirVEiIF6XcrZ7jSFS8WPxGJQfDz6INM009L68TjuXn36mxBoH7UbCTV9AglCleD9JxapsDWFqewNqbPhZYpxLXjqLsHRiibtIr9qyfE4WYdGYow6UVCJLf7RL4GpH9PlcdXNW3llLXUItvZzBZAlwkfvibZhjgbznHzRAZKK7hzJhn+Uz/GUcdhrl5Mui2rllx2maP5DRDq4/DpMxHdY7yZcYjiKUgLX+m6vPl4MSEowk5twyaMjfE1d3wE9lQQK5oRy5O8T4zO8fyFWY/zg703NQWdHHTVCFTAut2c2cIyxw2tt2Mf+daDSi889MeG4g8Z5U2PK3HjxwL9O16ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G2GfBzzvYFSfF2KVtAn4GJFSu9+941U3H6wgM82Uce8=;
 b=kf3A+m87kiUfXJr3YorozNr/qY0oPIgg9tanIUi6oQmcjwN1aDlTHhzi5mp+0XgmxOj9uJOJjLDzs8VSc5CGLAiU5eNAf69+3EPW3bRoljJTa6lY5C7Xi/pvyQzO3f70gHQS0iEbmZjNMrxwHskCD1sCKJGfwRe+VOqROi4c0T7mYekkZtXUZm1hLQS0eqV/lH+jzVHtvQr+6Q6EGQTlOJNB7piWmYsvnYeIMj7jhdvz4XZvzPfyQvfZvGdgEuP4Y/4IOC6Pa+OS9nRzwXDnkvd12TO0Gh39J+kU37Xglmies3YOJQ37zPtoIpdTvRvmihWCMRo+brgYmSLa7BmeOQ==
Received: from SN7PR11MB7511.namprd11.prod.outlook.com (2603:10b6:806:347::17)
 by SN7PR11MB7509.namprd11.prod.outlook.com (2603:10b6:806:346::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Tue, 3 Feb
 2026 13:31:29 +0000
Received: from SN7PR11MB7511.namprd11.prod.outlook.com
 ([fe80::b0d5:a33a:26fd:3fa0]) by SN7PR11MB7511.namprd11.prod.outlook.com
 ([fe80::b0d5:a33a:26fd:3fa0%6]) with mapi id 15.20.9587.010; Tue, 3 Feb 2026
 13:31:29 +0000
From: <Victor.Duicu@microchip.com>
To: <linux@roeck-us.net>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <corbet@lwn.net>
CC: <Marius.Cristea@microchip.com>, <linux-hwmon@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-doc@vger.kernel.org>
Subject: Re: [PATCH v3 2/2] hwmon: add support for MCP998X
Thread-Topic: [PATCH v3 2/2] hwmon: add support for MCP998X
Thread-Index: AQHcj6BPuXzMsn2URUy9ax6I0iNWhrVmXKAAgAi8bYCAAHYmgIABdFqA
Date: Tue, 3 Feb 2026 13:31:28 +0000
Message-ID: <05303055c7fae6ee4f190b69039c3a4f0d8217fe.camel@microchip.com>
References: <20260127151823.9728-1-victor.duicu@microchip.com>
	 <20260127151823.9728-3-victor.duicu@microchip.com>
	 <491bd9ec-d6b7-4f1a-877b-67ffbc658ba8@roeck-us.net>
	 <da5b2f992a430d30efb558502aec7dc6f6769b0d.camel@microchip.com>
	 <c5e1aaeb-d832-44ac-ba19-77f162b4f31d@roeck-us.net>
In-Reply-To: <c5e1aaeb-d832-44ac-ba19-77f162b4f31d@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB7511:EE_|SN7PR11MB7509:EE_
x-ms-office365-filtering-correlation-id: 130744b4-a736-402d-ee9d-08de6328897e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?L3oxeUtyZW5NMTl2UlM0Z0RJY0RKTkpJK3E5bnorNks1eG1BVlBmcWswOWEx?=
 =?utf-8?B?Ri9IOU5QQjFQRHA0TmhBOGpzNFVra011ZUFlbU03eHRUTmlPRlBGeEhUUk1B?=
 =?utf-8?B?bXo5SnZRQ2F4L0p6b0hJcDBvV215UzFMN2h0OXkzOWo2R1Z1a2hEd1I4MEtt?=
 =?utf-8?B?NUE1WThnV1hZek5DWkY4Yjk2WFl6aDhYTVR1NGpDSlVlVStXWVNqdjZ5RUxZ?=
 =?utf-8?B?M3ZoV1ByUkRpN3NRTWZvaUpDaWFlb2xvbi9PR0MwRUVsYngvbVZvVDJ4ZmFm?=
 =?utf-8?B?ZkFUd0kzSVJZaTVCaUdFVHY4ZXlnajJBMklKaHc0eWlFa1hHOHBtejF5Wm9Q?=
 =?utf-8?B?clBZeURmUnQxaW1UTWRjL01JdnluL2hyUnFyaXhTbFROZ2c4TVd2eWk3MytJ?=
 =?utf-8?B?ZHhnSGpveTVZR3BaTjNRYmNydHhlWXlvYVVkNnlGaTB5VjFZbTVmcTBjR1BD?=
 =?utf-8?B?M1hoQjIzK29hNUdXczc4OGFPaFdLbVRmNXhSbmNEc1pNT3NFK1hJMzZCY1N6?=
 =?utf-8?B?dUQ2bFMzV09BVEVFL2gyekVMTlZaL3J0UEdBYThHZTQvK0RZZFRva2FLb3M3?=
 =?utf-8?B?dGlaQ1ZvLzJoVkE2dGRicVlBRXRLYlNlMHJVN1diM0VBN1VNWm1qdkpEL3o5?=
 =?utf-8?B?Y1dQNWtqTVdVS2JHL2Y1cFJUTys0NmkwQWc5SXZJS3ZSdFRGbU80OWh6aWJT?=
 =?utf-8?B?UGVzRlhMR0pDYnc3S3hMRDBldzJEeGVGejZ0NzZrMG9qbTAyRTBOdi9YY3hq?=
 =?utf-8?B?bXdqV0krWkFXa2JVRHRvcHhCWGpBT2czVGdzeTg2dUJCMzkxeXF4b2ZTR1BJ?=
 =?utf-8?B?TG5mZFI4ZzNWRVZwQzVnUWdjOFc5Z0MyKzNOZ09vTkYyMlZmMHNSM2NRV0lz?=
 =?utf-8?B?RVd5Nm5PdENEQWI3bitySy9BK1Bmc0RDWGorc0FQaVAwTTd4aG0zQWlDU1Vo?=
 =?utf-8?B?TEtTR3NBRFJ4ZERWUTc3c0hNRGhoL0craW03SlFNNzNFUE50RDg4WUNHTmx4?=
 =?utf-8?B?QmV4c0lneUhOTzBZaC90bktDMGh6ME00R2M5Rzk1eUlTL0J0QXlGMk1wVW93?=
 =?utf-8?B?UUE4TGswdzFra0Qyb3JROERMdDI3blpIM3BkYmlPVlM1bk0rOHhvWEJGakZL?=
 =?utf-8?B?cnJ4RnpLRC9pbGY1bTdqTVhzOHRyM0xNNEZubVJ2UlZSdzBpaE93bHlDanZR?=
 =?utf-8?B?ZFVlWWgzdE5RNHFsSklJVmgySExIYTZaYitLN0ZlZXdOVnZVZ2w5dDhvcElV?=
 =?utf-8?B?a2kzOHVycjdNQXd4VGtjRTcxLy96aWZSZHJoT3R1SUdFazY5WWo4c1FUYkQw?=
 =?utf-8?B?MnZpU1FhVDJvczFSL3duR2JhRXhHQkxSVUxVOURnM0xOdDVBQlBSSzZoZFVy?=
 =?utf-8?B?cHhxczNoQytKaXVldXBDQUEyMUVaQ09kMW11QzRMdFZGZndQa0RwZVNVWkN1?=
 =?utf-8?B?L203V1lJOU5BVUw4RHhway9oN29IbVh5YVJ2QTlLcEpGc1ZOOGUyQ2ovQmxQ?=
 =?utf-8?B?bWM4RGp4cWRPajN4M0VnZ1QvaUlHQ3lBeFAvM0pHSFRncW93a1ZhSjFFVE5o?=
 =?utf-8?B?azJwYmhXQjlGSG5meXBvTm9NTjRQRm84c1FUSmJKWkkzMFhucms5Y2R4T2x4?=
 =?utf-8?B?UDNockttUWRabUdMd1JoeDFWalFsZU45cldKVDkvN3FROWhmamQyeUpndm95?=
 =?utf-8?B?SVJjcVZHOEEvSlRUWjNFMzdRdDNCbVVuS213NlRxTURBb1psRDFXekZGUlRQ?=
 =?utf-8?B?UkQ5ZTlzSHJOdVViaHpKdGhzRDBkVUh1bCtmcEV6NVBVSkhOK0JYTXErT0tO?=
 =?utf-8?B?cTZqZGtvRnZOSmg0YnlXRk4wM2d3V1VQSzM2TUt0VGJtNGFsWVNBcG1XSGdV?=
 =?utf-8?B?SitJR3d1V0ZlWnN5MHd4MHlRWmN3WXBmSkxYbVZlMjNvU0VEcXp2ck5pbjgw?=
 =?utf-8?B?TjRpNEJ6SG1oSFlxck53OFdOZmN2dUxHVEVyZ2JEWDJ0Ykl6YjFZcGFWdnhQ?=
 =?utf-8?B?cnNlOEgvRlNidmZkMGxBTHJvcFdqbWcrN0dGTXhFMGFvTjR0aytqZTlVM25P?=
 =?utf-8?B?akcyVFBWTi9JY0p2TXRhbmF5TUJyenVVTzF0TzNQWW1Naks2Zy9wZE43NXNs?=
 =?utf-8?B?MkRLODN0dHl0c0VOQitMV1NCRSszUk1NV0tRczFUTG9NbENaa1BCa1lweThp?=
 =?utf-8?Q?xXmYz0nca0fjmdaic1FEH6M=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB7511.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RHRSZk55WFlnN2hPclVwTFV5QUFTVlB3TXQ1ZndwU3J5QWdCMnJNNW1mOE52?=
 =?utf-8?B?T1dOVE5sMHIySjgrSzBpbHVYQjZNN1QrMEtteFRxQ2FGUXRqOG1QS09hd3Vs?=
 =?utf-8?B?djk4UDZCbUtqMW8wb25xai94L21sc1VpVldmUjdNQUcwQWFKdnFuM1V6MFFS?=
 =?utf-8?B?M0d2TFpPOEJ1dTB3Yno1WVZ5ZjR1aE52RjRuV0traXBZbWlZZ1llakxpWU5W?=
 =?utf-8?B?L0pxSElhQzBSWjdZaWNyUXlQbFZBeUdNQ2laTm5hMFdGQjNZcWNxaXFOOU9Q?=
 =?utf-8?B?TUlEdVhIZDEwNGZzbThkb0pCNE9uUExaSmhSVzRiVk5qb0hrRTN1L3p5Q0J6?=
 =?utf-8?B?TWFMNThBVTlCU2pDMm9RMXBKSXdzY21FWVZLbHdFWlpXUGMzQnRyV1cySFJV?=
 =?utf-8?B?YWljbWwvM3hSL25lZG9Uck4rSTkwYUhRMnRQTU1aR3dGS2I4OVJ3ZWtMMkFV?=
 =?utf-8?B?RUFiUW5wSHIvQVFMV09SalF4MkxYbXgxUDBCeVZMSXc0ZjVGZHdWYjMwSjRM?=
 =?utf-8?B?ZkcxSklHRlFseFJrZUdKbUNuTnF1RW9BbUlKMzl0ZThnMzdpNzArcUYyZTBn?=
 =?utf-8?B?SUVVY2xkWk1nblVYeUxyNTRLeDgyL3JINzV3SmFWWFE5WW13RFY0TTFyOVB2?=
 =?utf-8?B?UmFnSDJFdmVSeXIrTHpVbitPaXduano1SGx5ejRrK3Nla29VNE1YaHllbTZQ?=
 =?utf-8?B?eDRaRFFDWU1CazRDVjhBc0lGME9FUHF2RUd5N2VxVDY4d3p1T1RoVmhLOS9D?=
 =?utf-8?B?MlZ4RUdjeUpZQ3Z3WDdNTi95aHJLWU0vSDN0YjUxRjFGQU5qUVo1WEM4MmhG?=
 =?utf-8?B?Z2g3NDQ2bmVGTTFYNm5BZ0hyWkNYblNrdUM5c2UvQU1VZEtDNmc0dUszUHcy?=
 =?utf-8?B?alpOMEpoWUVWckw0bUlyNnlxQ3BHeGFWT1phRUowZVpwU2hRZ3VubFo0THZ3?=
 =?utf-8?B?K2JvNG82bnNRWWlsZzlwVENzS3Zqb1ZiMk1NekROZFF5YnlwakJZWWxPOEw5?=
 =?utf-8?B?dkhrZDhUbkRPSkFNdjNwckF1b1prb3pKQzg2Q3ZDK2pJUS9QQUxuR3NrMnh1?=
 =?utf-8?B?d1RObjFGTEtHcFBraUxERXkybnVhZHErMjhiUDZiOVBCakI1ZnVJZFg0Ykcw?=
 =?utf-8?B?QWQ2ZDVTWjV4K1RHYUZCZ0kzN2MzU1VOaXNYMUtTdjRpSmFTY2JWbksreDhJ?=
 =?utf-8?B?WnBJS0lLcUVGTHBiUTdXdlkrY3B0aXZUZ0Q2QVFnSmkyWi8rYWhvK09TU0pI?=
 =?utf-8?B?VDVOWUoxa2tSRytCOWhhK3pLTFJiNEZzRUtSTDdtR2RjbTZoV2FGTWdXSC8w?=
 =?utf-8?B?VVN5K1c0MlZ4eWRVaHR3VGZvRDZ3dXRnQWRhNjg2cmR3ZG5lMjEzUXYyNkMw?=
 =?utf-8?B?Ull6SlBFZk0zc3pNdDNUWm1mM2JPZXZTbHRJc1l5L2JZZ0ZYZ2IwQkdESnFW?=
 =?utf-8?B?bytneG5Va3ZVRXJrdUlIaDhVU0xXVktYd0ZYMGh2Qjl3aUhUbGRFQTVlNFJa?=
 =?utf-8?B?UitSWmIxbkV5Nm9NSTZ6b0diWUZ2RzUrOUhKYWltalgvUFFFNXVIOUpQbm1n?=
 =?utf-8?B?WEYwQVFvckpTNlV1Q3JLTGlwZDNQSWtIcmEvcGdDYVM3Q3A1R3U1ZTM4bVlR?=
 =?utf-8?B?aXZVWlNRZC8vdmg0eU8yRkIrRlBaa1g4UzBJWjYvK3lheldtWjBiVEpVT2s5?=
 =?utf-8?B?dEtnUlc3VHdIOUJ3YS82N3BtL1pDc3lmb2tlOEFVL3RzUmlyQ0JVc2s0d3FV?=
 =?utf-8?B?RkZNUC9YeC9SazlyYis5WDkwSmErUXlrMUNBaENiNU43L2ZSRGpHYmNZU0dN?=
 =?utf-8?B?REVWV1FlM3RCQXh4eGNSWStKcXdpQkc5bUZKU2VNcEFsZHBkbnRXLytURFZP?=
 =?utf-8?B?OUc3NDd0b25DaWxwRnlReTF5MkRJazVJaHg5NkZBUFY1a283T0F4dXA1ZGVU?=
 =?utf-8?B?MkRHWXQzejVQbU5semhrak1XVlBzVU1OUnFwK1FmL0NFOFFMNUZUZ0JVTHZI?=
 =?utf-8?B?QjdpMmpEZVJ3aFNBVURzaEpBSWFmTW9hd0xZSEg0RW1HMU1Gd3B6WWhvSDFS?=
 =?utf-8?B?UW9GMXZ0a2RxMzJUckJmVFBleElpL1hRbWJxd1ZKRG9lbGxoUTVld08xZmJC?=
 =?utf-8?B?RjFBY3Z5bTh6aDhzcExiNW91UUNSQ1VUZkE4YVZncHkzZ0dVRmtwT3NENFNu?=
 =?utf-8?B?UHJyblZ1cHFUQ2JYYVJWWWxqK0xlRVlpcytFZXlTenpMM1NpelJpRGxaaFoy?=
 =?utf-8?B?NlZiSWVJM241WGtLQUV2T2xpd3J4S3R2RDN3OXRkQ2dtSmRSdDRwUTFtWCsv?=
 =?utf-8?B?UDZsZ2NjOUpIb0UzTXJqb2w4Q1N2SVoxT2pBWHV6ZFhWT3VFMmkxaUlnWEp3?=
 =?utf-8?Q?mXvDGoBkedqPz6wU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0145A98A9F0E4C4B972F436BC360294B@namprd11.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 130744b4-a736-402d-ee9d-08de6328897e
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2026 13:31:28.9441
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LDl4Ser6/g6fLeEHW3L/KUfnivppFQXXHWN5kh6X1g7hPYkU174ytOp+xkBcXpf3URHBz/WHp85ZkjKiA+LkCWk1hUz+ayDklZvXOheNxlo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7509

T24gTW9uLCAyMDI2LTAyLTAyIGF0IDA3OjE4IC0wODAwLCBHdWVudGVyIFJvZWNrIHdyb3RlOgo+
IAouLi4KCj4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjYXNlIGh3bW9uX3RlbXBf
bWF4X2h5c3Q6Cj4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgaWYgKGNoYW5uZWwpCj4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGFkZHIgPQo+ID4gPiA+IE1DUDk5ODJfRVhUX0hJR0hf
TElNSVRfQUREUihjaGFubmVsKTsKPiA+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBlbHNlCj4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGFkZHIgPQo+ID4gPiA+IE1DUDk5ODJfSU5URVJO
QUxfSElHSF9MSU1JVF9BRERSOwo+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHJldCA9IG1jcDk5ODJfcmVhZF9saW1pdChwcml2LCBhZGRyLAo+ID4gPiA+
IHZhbCk7Cj4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
aWYgKHJldCkKPiA+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIHJldDsKPiA+ID4gPiArCj4gPiA+ID4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0ID0gcmVnbWFwX3JlYWQocHJpdi0+
cmVnbWFwLAo+ID4gPiA+IE1DUDk5ODJfSFlTX0FERFIsICZoeXN0KTsKPiA+ID4gPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAocmV0KQo+ID4gPiA+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1
cm4gcmV0Owo+ID4gPiA+ICsKPiA+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCAqdmFsIC09IChoeXN0ICYgMHhGRikgKiAxMDAwOwo+ID4gPiAKPiA+ID4gV2hh
dCBpcyB0aGUgbWFzayBmb3IgPyBUaGUgY2hpcCByZWdpc3RlcnMgYXJlIDggYml0IHdpZGUuCj4g
PiA+IAo+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICp2
YWwgPSBjbGFtcF92YWwoKnZhbCwgLTY0MDAwLCAxOTE4NzUpOwo+ID4gPiAKPiA+ID4gQ2xhbXBp
bmcgb24gcmVhZHMgaXMgaGlnaGx5IHVudXN1YWwuIFdoeSBpcyB0aGlzIG5lZWRlZCA/Cj4gPiAK
PiA+IMKgwqAgVGhlcmUgYXJlIGluc3RhbmNlcyB3aGVuIHRoZSBoeXN0ZXJlc2lzIGxpbWl0IGNv
dWxkIGJlIG91dHNpZGUKPiA+IHRoZSByYW5nZSBvZiB0ZW1wZXJhdHVyZXMuCj4gPiAKPiA+IMKg
wqAgRm9yIGV4YW1wbGUsIGlmIHRoZSBoaWdoIGxpbWl0IGlzIHNldCB0byAtNDUwMDAgYW5kIHRo
ZQo+ID4gaHlzdGVyZXNpcwo+ID4gaXMgc2V0IHRvIDIwMDAwLCB0aGUgaGlnaCBsaW1pdCBoeXN0
ZXJlc2lzIGlzIC02NTAwMCB3aGljaCBpcwo+ID4gb3V0c2lkZQo+ID4gdGhlIHJhbmdlIG9mIHN1
cHBvcnRlZCB0ZW1wZXJhdHVyZXMuCj4gPiAKPiA+IMKgwqAgVGhlIGh5c3RlcmVzaXMgaXMgc2V0
IHJlbGF0ZWQgdG8gdGhlIGNyaXRpY2FsIHRlbXBlcmF0dXJlICh0aGF0Cj4gPiBpcwo+ID4gaGln
aGVyIHRoZW4gdGhlICJoaWdoIGxpbWl0IikgYnV0IGl0IHdpbGwgYmUgYXBwbGllZCBhbHNvIHRv
IHRoZQo+ID4gImhpZ2gKPiA+IHRlbXBlcmF0dXJlIi4gSW4gdGhpcyBjYXNlIHRoZSBoeXN0ZXJl
c2lzIGlzIHZhbGlkIGZvciBjcml0aWNhbCBidXQKPiA+IGl0Cj4gPiB3aWxsIGJlIG91dCBvZiBy
YW5nZSBmb3IgdGhlICJoaWdoIHRlbXAiLgo+ID4gCj4gIlN1cHBvcnRlZCIgaXMgaXJyZWxldmFu
dC4gUXVlc3Rpb24gaXMgd2hhdCBpcyB3cml0dGVuIGludG8gYW5kCj4gcmVwb3J0ZWQgYnkKPiB0
aGUgY2hpcC4gSXQgbWF5IGJlICJvdXQgb2YgcmFuZ2UiLCBidXQgdGhlIHZhbHVlIGlzIHN0aWxs
IHdyaXR0ZW4KPiBpbnRvCj4gdGhlIGNoaXAuIFNvIHRoZSBxdWVzdGlvbiBpczogSG93IGRvZXMg
dGhlIGNoaXAgcmVhY3QgdG8gdGhlICJvdXQgb2YKPiByYW5nZSIKPiB2YWx1ZXMgPyBJIHN1c3Bl
Y3QgdGhhdCBpdCB0ZWNobmljYWxseSBzdGlsbCB3b3JrcywgZXZlbiBpZiB0aGUgdmFsdWUKPiBp
cyBub3QKPiBvZmZpY2lhbGx5IHN1cHBvcnRlZC4gVGhhdCBzaG91bGQgYmUgcmVmbGVjdGVkIGlu
IHRoZSByZXBvcnRlZAo+IHZhbHVlcy4KPiBNb3JlIHNwZWNpZmljYWxseSwgaWYgc2V0dGluZyB0
aGUgaHlzdGVyZXNpcyBpbiB5b3VyIGV4YW1wbGUgdG8gMTkwMDAKPiBpbnN0ZWFkIG9mIDIwMDAw
IHRyaWdnZXJzIGEgZGlmZmVyZW50IHJlc3BvbnNlIGZyb20gdGhlIGNoaXAsIHRoYXQKPiBuZWVk
cwo+IHRvIGJlIHJlZmxlY3RlZCBpbiB0aGUgcmVwb3J0ZWQgdmFsdWVzLgoKVGhlIGRyaXZlciBy
ZWFkcyB0aGUgbGltaXQgYW5kIGh5c3RlcmVzaXMgdmFsdWVzIGFuZCBjYWxjdWxhdGVzCnRoZWly
IGRpZmZlcmVuY2UuIFRoZSByZXN1bHQgaXMgb25seSBkaXNwbGF5ZWQgYW5kIG5vdCBzYXZlZCBp
biBhCnJlZ2lzdGVyLiBUaGUgcmVzdWx0IGlzIGNsYW1wZWQgdG8gYmUgd2l0aGluIHRoZSByYW5n
ZSBvZiAKc3VwcG9ydGVkIHZhbHVlcy4KCkluIG15IGV4YW1wbGUgc2V0dGluZyBoeXN0ZXJlc2lz
IHZhbHVlIHRvIDE5MDAwIGRvZXMgbm90IHRyaWdnZXIKYSBkaWZmZXJlbnQgcmVzcG9uc2UgZnJv
bSB0aGUgY2hpcC4KCg==
