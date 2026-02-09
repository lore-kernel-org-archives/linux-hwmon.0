Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010015.outbound.protection.outlook.com [52.101.46.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D61E037BE7F;
	Mon,  9 Feb 2026 14:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770648422; cv=fail; b=boSeLQUkGktbFws8M16ETuTriNWvyXHsN0I7PwK4zQgHNlpv53FMl61xdR4y1vkAP8ab4UJcVuLHmze9uR4r2r9/QTWIZBqke0rnC4pCrUBLsB0JjejwLlhrAq1KYTHVHYdTBVwyWzl5rCaz4zYk2g/A251WxYDwQxsyO+4wnUk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770648422; c=relaxed/simple;
	bh=rXt/Y/pbmpsEUxYzYsbeb5EYvifFM5TBf+t2U+vg1Zc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=GtrbiJ70KC2wsO/My5aTVupcRvw+oK2KjVeLz3xkAccFnDvkMcSX5xlfx7MTQP2BBEloa4C18TygtZSM672xns1uZdpDEvfl1Pl5eMYCUtfpAExI4VN8/7YtwLr9LDkJLYS7NSA+DsM/Tvqb7DtBr+yau5CjN3j4bS0h3LQEjUM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=FFSkcR4S; arc=fail smtp.client-ip=52.101.46.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="FFSkcR4S"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KTsqNt8eTkNWR0fU2XnAYpMVmAziyLyfLzdNrrK3GXQp3I1LktMlrH/gR3W9UiXP3oaKQS5WMyhcC+QTm7ZKI3k3sdUJY7hh8tsE7Few/SYUG9Mu3dT4/RuYFvhzvy7riU2t38h2YxsG3bnSynrdl+NLu6G7ojKDrLYQna3OXyHxcA0wSt/J0SqjqW2oTlc8+YWwzEUqGau3e4psLF8paGCwd9SBwxwGds1X1JqBVoxpOT9fpsThyC9a3EBNtTOmC5FT7d1XElauTPcONv9fq0xR7b/pvV7jqdz421mNl0u/Ph79CLxTJJppMTfS5o5rQy3YGOB2JO7pmwoQ6kzHyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rXt/Y/pbmpsEUxYzYsbeb5EYvifFM5TBf+t2U+vg1Zc=;
 b=OBFPrJYE0QjdQt/IvP+9VSreKHCgcGT+JU2zVKLKy+VdTweSxIzZPeYVOvzgWhK9MlXrgcalVc2J7gHF9AIRFhXIFq9Rj7Aa2F8kI01SBnbiX3g7HIr5+6ZZdaTZxx9aiV3cwKBwbfS3ID4T5ok0swV6usKk15+EfoWibInjIANu+7pQHay1JAmD+yQtLpp2vkUWsmNuO5ZbxW/lMA9yz7pm8LJU3oYswtMXhvYhjRz/SxXKU70iikCSuqLZpsQfQJ1D0Z5wh/R5rEdxQ/bshud7818y0MAGqtZ4p464Hnn92CJ6B97uIhmJJ+J6DWw+p66aGarzLqT+SBTtRSoHiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rXt/Y/pbmpsEUxYzYsbeb5EYvifFM5TBf+t2U+vg1Zc=;
 b=FFSkcR4So67aW+qyTCfJIsAt/ODjNYMPl1o/krqiAGXHSDWcBjMV7hX+Ql4lyaos14/r5doMgE1e5iPFSlI6ND0fxgl2LEd9wtJ59yylEn4xzHrQuiuBL2C3KGUux1DkdIdQBM9cNNfUV91OXvY4VUzAEgrXRw45IQfwlKIUvN5BNoGaRxu65jeP5K1TJfYSQWaHKPCLfnm8fkBdyIFo17QzNM4Po3AgnKf/74myXTOCEgoZDWHYduw4Jf8Ymg3FExBs5ZtAVL/MBB47uhXPRdYMqaHXPbCTDeROh5aJBB3LXhd8pUyAl/y8tBMzL1ES6U5UpQLtZ8na6sjJ/U/qKA==
Received: from SN7PR11MB7511.namprd11.prod.outlook.com (2603:10b6:806:347::17)
 by DS0PR11MB8739.namprd11.prod.outlook.com (2603:10b6:8:1bb::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Mon, 9 Feb
 2026 14:46:56 +0000
Received: from SN7PR11MB7511.namprd11.prod.outlook.com
 ([fe80::b0d5:a33a:26fd:3fa0]) by SN7PR11MB7511.namprd11.prod.outlook.com
 ([fe80::b0d5:a33a:26fd:3fa0%6]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 14:46:55 +0000
From: <Victor.Duicu@microchip.com>
To: <linux@roeck-us.net>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <corbet@lwn.net>, <krzk@kernel.org>
CC: <Marius.Cristea@microchip.com>, <linux-hwmon@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-doc@vger.kernel.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: hwmon: add support for MCP998X
Thread-Topic: [PATCH v3 1/2] dt-bindings: hwmon: add support for MCP998X
Thread-Index: AQHcj6BW6iGqyMwWZEe+A522Hs6wtLV18VGAgASVT4A=
Date: Mon, 9 Feb 2026 14:46:55 +0000
Message-ID: <049f04c549bbea2f22b4fdab485beaa86af1b7db.camel@microchip.com>
References: <20260127151823.9728-1-victor.duicu@microchip.com>
	 <20260127151823.9728-2-victor.duicu@microchip.com>
	 <a9d4b53f-d8c2-4b31-aa13-901838c2933c@kernel.org>
In-Reply-To: <a9d4b53f-d8c2-4b31-aa13-901838c2933c@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB7511:EE_|DS0PR11MB8739:EE_
x-ms-office365-filtering-correlation-id: 9efc046b-bd03-428d-4b7f-08de67ea121a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?V09yUGdrVHpUbjFSa3ZRMlVnWFpUME9ZancrVEwrK0RqNXlNcjIrdk13dVpM?=
 =?utf-8?B?ZGcvd2wrVG9Yc1VjRnJpNktSc1BlSVpMUitNdlNzRXg2Y3B2a3hsWk5KYXdr?=
 =?utf-8?B?U2FacXgzZ2xPOUZrMGdzRnAxb0hpdS9vNVhJVXc4VGxHUzFpODl6NUFXK1dq?=
 =?utf-8?B?YzdVOEgybTNSYWZqc3JTUkh6bXNyMytqUDdjSEkwQ3g0ckpTRDJFeC9NU3hB?=
 =?utf-8?B?OFh4NXdQUm9CaHhWYmlmdGFyT1RlcmFTKzN5R092RFV1amZudEQxRFdkUENo?=
 =?utf-8?B?d0ZjZ2JidGZYUEhkQ2dKcy90Y2M5b1MvRXpGbk9uNjZoM2VGU2w4TzZVMEpp?=
 =?utf-8?B?TmVQZE9UNGNmc3I1bjA3cmsyZmgvUndaMS9NSFBYeStJTWcxSlVHQitWWVF4?=
 =?utf-8?B?S1lDN3BSWHRYbElXamsxYnR3SmhyazU5d0U3SEoxdXpmT1VsenZYcENOcGtX?=
 =?utf-8?B?UnhEc21oM1l1c2kwQzdqa0ZFcS8rUmpKTmRCTFR3TVZXZUoyTm5SNldzdnZu?=
 =?utf-8?B?OE9VVzBHSExuRzFWK1ZneWZIYmRIcE5RRThLRlJ4aTRiN3c4aG5lTU9BME1E?=
 =?utf-8?B?b2ZZNG9TazZNM1FLR3VTcVBKcEgrUU9DSC9nOW1YeEs4cXBjaUd4MHFxbllT?=
 =?utf-8?B?Si9EcWx2VWZDZVhqYW5hMFd0WHYvOHVvQ2pDeFNXNnd5Ryt1ZE9Pc1RNL2tr?=
 =?utf-8?B?WGhzQytaNDkyYTZwcE9FbjVxVlgydWZHSDgxTWdMenBDQVhEeTdQakQ3Z0E3?=
 =?utf-8?B?UjFSQkZMWnVraERqUlN3emk3dDBrTm9yazVvRTVHNVJ1Vkg2czdTWTdLeGxp?=
 =?utf-8?B?QlU2enlkbEFYUmFnK2VnL0p6aTJIZ1VhWnZWYklZZVMvdDN5Ulp1Q0UyUU82?=
 =?utf-8?B?TzhMZGNGSEl4ZmhnV2dyeVRlMjVtazF3NW5nYmg1ZDltQi9Bc2tmY05Fd20z?=
 =?utf-8?B?RkROdzhhbnQxTVlsRGN3Q3AxTUw5UEdab3dxZm1ZSW1NUXhVRkxmS0F0dzRs?=
 =?utf-8?B?cUFRazVkKzE4c3dmb3gzL21HOHdBbE5hN1poOXV2NEMraUpkeUM3TmFlUnVC?=
 =?utf-8?B?Mnk0YzBGejVBVG8zZUFVNXdJY3ZSeUY3cnVUMFdBZEpyVjFTbWZYMEdvRTVw?=
 =?utf-8?B?Mko5cFhXRUhSa0dhYkIzZkVGNVlhd2gzUUYvWFZDUGx5ZVJ2a1c0U0VwbkVF?=
 =?utf-8?B?MHd0S1BiRDlpMjI5UkJ1cXZtZy9qb0lVWlRJREJxL2tQVkdzTjA1U0cyRytZ?=
 =?utf-8?B?WGFWK2tNUnVwa0hlaytLVmFUNU1RTnNmVlZNVHI1aVl2OUFPdVJoWUhiR0Nu?=
 =?utf-8?B?MzBkVTBnd0d0ZHdzVkpsTjdReE9TdnlPT0tINHpjeWdzejdqYXhOSDFadlNw?=
 =?utf-8?B?QnNvdnQycVlHY1VCQW1vYXRKcDFiRjNPTEpmOXpRYUc0RitqcnYxTVlPRC9u?=
 =?utf-8?B?VGJzYkpHZS9QOFJqTkR5RFptOEtDV29LTnBjamYvSCtsdE9BYzhuZ09nZVhN?=
 =?utf-8?B?ajBFeGxMeDcvd0QydXlDWVJyaVk2RTBxenIvMlpoT2tVbGFDNEU2WTVZZEhS?=
 =?utf-8?B?UEpBL3pmNUlZY0V2OEk3UTdQUVFhTUFxRGFyU05xTkxmU3d6OHg2MVI4Y0lX?=
 =?utf-8?B?WTE3aFpUUGZ1aVMvTFhzVVg5T3FLc3pndHZMR2xzY1gwS1ZQYldSUHpNZThi?=
 =?utf-8?B?N0QzS2pLbGhPQ3RSMHNSN05wNFRNUU1paER6ZHpIWFdKbndpZklOZ2h0N2Zz?=
 =?utf-8?B?R1NxMFc5Ty9leFE5WCtEbks1M3c1eU9rNHZ0enZ2K3ZJMS9mVHg3cnYzM0xx?=
 =?utf-8?B?UE5GaWJKYzF5S0NPTXBVVHoxOGdHQ2hBM0NnMWdsZWQ3OGZ5eGVXSjlPMW1T?=
 =?utf-8?B?OGxnamc0elB3ZWhmcmtoeXJFZURZSHBLd2s0eXR6RG1QdWp0WHNBTVBRY3kx?=
 =?utf-8?B?cENOa2szZGFsRkg0RmNUVkVncU9OSHlPd2R0K0dPdlJzeVIyOFVDYi9Ud1NV?=
 =?utf-8?B?L1Fud1BHaVlDVkRuQ2k0Y3p3ck9rb3pBalhad1FIeSszdS9GNzYyN2xZN05x?=
 =?utf-8?B?MXdoQ1FaN3VCZHFSV283TFhneld6elc5TWFTWEREUGs0T3dGWlRZSERHcG9F?=
 =?utf-8?B?c3Zpa2JkY0l4ZmxYNDZuS1BqTzhjOWVZclJLQktYMVcvdC9iSGZrT2h0SXRl?=
 =?utf-8?Q?oAHMmmm5LcvwpuGPiXl2eFk=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB7511.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ODk4Z2tLZ2I2MEhQdDBqZ0crOXNBNkF0b1MzMWhuV0NjVVM5ZHFXMjcrVXd1?=
 =?utf-8?B?dVNkVjRleG04UDA3U3pmUS9CVStNTUhKdHV2dDR0SmExTXhIaFdzbi84QWZo?=
 =?utf-8?B?cG0zYW9sUWRCWGJobC9ra2szT29Pd1FVcGdYeXN2aThDVW4xUTVsVWlQMGps?=
 =?utf-8?B?OW0vMUZKSnErWklVcDJGL1FtZ0F5NlgrQTJGc3ZxNDBRYjFlY2I5aldveGto?=
 =?utf-8?B?UEZJa0VhWjJIRHZYK3ZyNlo3cFBVL0p1M1FRbG1wVVpRZUhMYmdRQmJOOGQv?=
 =?utf-8?B?TUQzQTZvaWtVcVlWVTdiOWE5SUlDY1Q0cE1sb2FZamUvWVpmcDFxYXh2Smpo?=
 =?utf-8?B?cXQzcUxLblRrM2hBeHJvMlpjbC8ycW42WWVRVGQyMmdDQ0dKVW1RbUh6anhR?=
 =?utf-8?B?TTRKWlNyTkxHMkhJL1VnTjhQRkhqS1Z4dFJ0Zkp3ckxKak5lWDlEYTBOYVNh?=
 =?utf-8?B?SndQSXhhVGovdkFvZXBmdE5JajVocEs4eU96eEZ4ZnlVU3Mya051bDdkblFU?=
 =?utf-8?B?SWJUSGtXS2U5aHlSeDE5eU9jTDI5N2RWZFMzVjZxQlFSN2pzbVNtbU4zWXFY?=
 =?utf-8?B?N0RXd1laUk83TU8rY0RJWkp4L3ZTU2xYd05kdFoyY2VUQU9OVVFOYWwyRmNv?=
 =?utf-8?B?eTFKblBCTWljUnJCSGJxRU1nZStYRTVLc3pDM3UzOW1jQ29xd3E1MjI2QUJh?=
 =?utf-8?B?TE5NbUFBOS9WWkRJeXAwOFU3SitWbUY3SG5GZ25MZnFhUWRYdE9BcDBQYkZo?=
 =?utf-8?B?RUxrQnV6OERBYTJ5YmlBYjhNSGRVaTh0MU1DWHJ4UGhlVitFN2J4QU1abnNu?=
 =?utf-8?B?dzEzL09OM0Z1NjdWRzc0TldDV1hzd2pYZlFzWGs3VlYwUlBrbE53Zm9HdVRs?=
 =?utf-8?B?MHJIMEJhRDcxKy9Zc29rRThuMmdlK3hGMkVOK0ROUk0yS0RvdjM0NWRxdlA2?=
 =?utf-8?B?bVVJLysyTWZIRzhmazRTRk1wSm40MzVvcW8ySU1mMDlRKzhTYnVXT3pLYndk?=
 =?utf-8?B?YXNnanVlQ2NINHh1bkdQZ3lQUDZoYmZicGdRUjhxd0FaY2l6VlFOVUZmT1V3?=
 =?utf-8?B?SGxETlBOeXZCL2xXMVpad0pSVE5TV01TZGRUeW1RN3RlOXMxbFlGMVBRV1Rj?=
 =?utf-8?B?eGkvWEt1MlQ2WnkvVyt6bXpYRGtNaHErM1I1NTFRRUtVcWNlN09FWUViV0d5?=
 =?utf-8?B?RXZtWXBSSmtNUFZTRkhkUzdPcDFwMEpveGx2UmszTU9SRTltVjhhK1crMXZ3?=
 =?utf-8?B?bjhxWEdpVjVmdEdqYjBvWUxkcVFhK1UxMStiSGhoM2lNY3dtVzVxdTYwZURz?=
 =?utf-8?B?WjZabnFSOTRDSzMwdmRWV09yOEJUSmR6VGVvV04vR080eTk2aXBseGhLYjBQ?=
 =?utf-8?B?MzNKVFdheEdTa2JQT2FzT2luME00amFBTFRrK1Z4QWhDY2pzcVBDaHBpQzIx?=
 =?utf-8?B?U1BkVHBINzFUMGlLUys2bG9UcnZTMWlNRXBNOFRnN0tzaHRKL2k5aElaZTNu?=
 =?utf-8?B?anVtNE8rRXJQanFNVDNyQTI0YzBmMFhINGE2cGlBTHp6ZU5uMmZVaXRDZEdR?=
 =?utf-8?B?SGJmKzRYUGFKWHhkUmxMelJIZXpuR0l4V3dMeHNsZzZ4TzVQUWM4Y2FmVDcw?=
 =?utf-8?B?ZHVUSVkrbDRXSEJBVHZPWkhGNmh3YVRhaE1Va2hRMDg4RnFnQklXQ0cvYlBY?=
 =?utf-8?B?bFZWVFU2NXdGQVBvV2h6LzdkUWZzbEV4OGtoSkZWYTRvNnpSM1RKdi9lVWFt?=
 =?utf-8?B?d1JnZSsyWlZ6aCtSMWN5RkluQ0dsVzFSMDlwSHlLZ3pYOUdLSWJWWXRQTk80?=
 =?utf-8?B?NkFJM2hEL2c5MDczRUNGTWx3a1hhYlpkUGRMM29aaHdXSENkdE9LQzlKbE9I?=
 =?utf-8?B?TG8yZ09YVzJ5d2krWTBQbUhmTWhSWnpUdURDYmh6SGxlVXZGZ3hTWkhlaFdL?=
 =?utf-8?B?Y1VlVUFaMCtucGYzMmhuSzBDa2UrN3RPTWdOdWRKTkF3Mzl0by9UcmFBa2Ny?=
 =?utf-8?B?bFhaUFRHbmxvSUNoTXcraTg2TEhwdzRFdEtiQkNJUDJncW5ydjJLTnFBTmxZ?=
 =?utf-8?B?aU1PN0JoQlBvb3NDZ2Q4TXdsS1JyM2YxV1hJSnJTV1lSZkRJUUVlaFpjbVhN?=
 =?utf-8?B?V0RWRmJXTzRPRmpwa296RzVtUm9SSEZCVlFMd3dwSHRUZ2c2bU9hd2NCQ0hl?=
 =?utf-8?B?Q3c2U20zZnVxMHpnb083Rlg2aWdIUXJaN29UbEdlamtzdFdpUTZlSGVKL25N?=
 =?utf-8?B?UVBnNDB4VWtrU0NxNkFuRDZrMkdHWk43NXgrTjIxd1FGVUZubUxOM2hUVXZD?=
 =?utf-8?B?ZTljSzlTR08wNWh3NXludEdrWm9KS0hRdzI5WFhuYWxoci8wK0RwRjI2ZGlN?=
 =?utf-8?Q?6WTfHfNahY39VliY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0BE492FE5E44AA45A9F0F1015346FB76@namprd11.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 9efc046b-bd03-428d-4b7f-08de67ea121a
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Feb 2026 14:46:55.6201
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xFRaGPIYN2FkYursI+nvVPxmtHnW++77pn9yAqZUlJ17118TTFqJPWvex/L9GqIGJtjgwnrdT8OObeyHMKzLp7LSZoo9UVZETUwAbQLxTHg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8739

SGkgS3J6eXN6dG9mLA0KDQo+ID4gKw0KPiA+ICvCoCBpbnRlcnJ1cHRzOg0KPiA+ICvCoMKgwqAg
aXRlbXM6DQo+ID4gK8KgwqDCoMKgwqAgLSBkZXNjcmlwdGlvbjogU2lnbmFsIGNvbWluZyBmcm9t
IEFMRVJUL1RIRVJNIHBpbi4NCj4gPiArwqDCoMKgwqDCoCAtIGRlc2NyaXB0aW9uOiBTaWduYWwg
Y29taW5nIGZyb20gVEhFUk0vQUREUiBwaW4uDQo+ID4gK8KgwqDCoMKgwqAgLSBkZXNjcmlwdGlv
bjogU2lnbmFsIGNvbWluZyBmcm9tIFNZU19TSEROIHBpbi4NCj4gDQo+IEFzIEd1ZW50ZXIgcG9p
bnRlZCBvdXQgLSBjb2RlIGlzIHdyb25nICh0aGFua3MgR3VlbnRlciEpDQo+IA0KPiBUaGlzIGRv
ZXMgbm90IG1hdGNoIHlvdXIgaWY6dGhlbjouDQo+IA0KPiA+ICsNCj4gPiArwqAgaW50ZXJydXB0
LW5hbWVzOg0KPiA+ICvCoMKgwqAgaXRlbXM6DQo+ID4gK8KgwqDCoMKgwqAgLSBjb25zdDogYWxl
cnQtdGhlcm0NCj4gPiArwqDCoMKgwqDCoCAtIGNvbnN0OiB0aGVybS1hZGRyDQo+ID4gK8KgwqDC
oMKgwqAgLSBjb25zdDogc3lzLXNodXRkb3duDQo+IA0KPiBOZWl0aGVyIHRoaXMuDQo+IA0KPiAN
Cj4gLi4uDQo+IA0KPiA+ICvCoMKgwqAgdGhlbjoNCj4gPiArwqDCoMKgwqDCoCBwcm9wZXJ0aWVz
Og0KPiA+ICvCoMKgwqDCoMKgwqDCoCBpbnRlcnJ1cHRzLW5hbWVzOg0KPiA+ICvCoMKgwqDCoMKg
wqDCoMKgwqAgaXRlbXM6DQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLSBjb25zdDogYWxl
cnQtdGhlcm0NCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtIGNvbnN0OiBzeXMtc2h1dGRv
d24NCj4gDQo+IFNvIHRocmVlIGludGVycnVwdHMsIGJ1dCB0d28gQU5EIHRocmVlIGludGVycnVw
dC1uYW1lcz8gVGhpcyBpcyBtZXNzLg0KDQpJIHdhcyBtaXN0YWtlbmx5IHVuZGVyIHRoZSBpbXBy
ZXNzaW9uIHRoYXQgSSBjb3VsZCBzZXQgdHdvIG91dCBvZiB0aHJlZQ0KcG9zc2libGUgaW50ZXJy
dXB0cyBkZXBlbmRpbmcgb24gdGhlIGNoaXAuIEJ1dCBJIHVuZGVyc3RhbmQgbm93IHRoYXQNCmlu
IHRoZSBjb2RlIHdyaXR0ZW4gYXMgaXMgYWxsIGNoaXBzIGhhdmUgdGhyZWUgaW50ZXJydXB0cy4N
Cg0KSW5kZWVkLCB0aGlzIGVycm9yIHdhcyBwcmVzZW50IG11bHRpcGxlIHZlcnNpb25zIGluIHRo
ZSBwYXN0IGFuZCB5b3UNCmlkZW50aWZpZWQgaXQgaW4gdjQgb2YgdGhlIElJTyBkcml2ZXIuIEkg
ZmFpbGVkIHRvIGZpeCBpdCB0aGVuLCBJDQphcG9sb2dpemUuDQoNCkkgd2lsbCB1c2UgdHdvIGlu
dGVycnVwdHMgb25seSBhbmQgcmVtb3ZlIHRoZSBpZjp0aGVuIGNvZGUgcmVnYXJkaW5nDQp0aGVt
Lg0KDQpLaW5kIFJlZ2FyZHMsDQpWaWN0b3INCg==
