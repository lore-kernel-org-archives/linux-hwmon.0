Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2118.outbound.protection.outlook.com [40.107.241.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02EF22185B9
	for <linux-hwmon@vger.kernel.org>; Fri, 11 Oct 2024 13:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.118
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728653054; cv=fail; b=f4dm1cb4PFw91O9NvBkojrtVVKimTTQIRD711LmzT23qqksVOX8Xsa90vpMOi6woNri5icFYA8/mE+9vrH2zg/70KHkO0w24I38PC75cFsb8qIy4SyNzFpd7z54CYuI5+nQpA1znWPkQUBePKeefymZa8rF1xrdgJnB++LLQF4Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728653054; c=relaxed/simple;
	bh=0mk02oRbUomgP8smIxwcUaBttSyGBNk30DFBfLTJD/8=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=dEIZwBJgpeMVnXo2ga9I/qiemW0JQWhKpYIoljvBz7JvcAVyP0w546ivJ7TINSNjKrjHIfPoOcVMeISMhN/9zLyYZyehqIkWRJ2ZtKnTnJE1WLBNBilVpMmiAf5lPSzUTsS+IDvCWy/HzxphfHKkQYBK1ldfT2RTIDUU4OHDSOY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=danelec.com; spf=pass smtp.mailfrom=danelec.com; dkim=pass (2048-bit key) header.d=danelec.com header.i=@danelec.com header.b=XdpabRZM; arc=fail smtp.client-ip=40.107.241.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=danelec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=danelec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=danelec.com header.i=@danelec.com header.b="XdpabRZM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FRAJoZtDhfhGPKPEXuar3Wz3dsRh5KK66EBXpiBFmnC3sH7fDx5KSucW6aJcDxM26q5+xSGfNuMOwNKrNzx7X1mKK1bnozDBz1N/gusrK7U1PJ408/Hb8LLjYDpKEBLueXylmWrSwCYCgIp8ZmZRfqKJR3JMlBHd0m3QUhS0BDly7ltdi2a61IKifhhlqsYFAxVDOHcooRQ9eAFBrCeRbU0KqIrp2iDkQRXpulUYZlTUZTQP9ysonnvd6vcqMzG53L+LRB+170HnAWgTh7vaVlAlh+0yqssTy2vbeq46GIvp3XHTBq4bzZQG1u261iCg//G5khL9KY0UzV253hEN3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0mk02oRbUomgP8smIxwcUaBttSyGBNk30DFBfLTJD/8=;
 b=xAloafOnIwdrEUZ/s/H9MreUoqk01L1XRZe/1wO3KuKSV48B+8K8g8/qXxi5dyA5cZHDD3ZNJNkT0yyQX8cTviA8BEEyVxpsWv9lx0LCDtipLDwaR5x61A58A4P4owBOHafXQJ3fu0wTE+TT1SfnoAOGzcK3WB3w7ZaKBSUIHi5vwQhNJcgG+c0QLNlfbTntvA+/H4gYql1fvodLX2cyEkd8rt70fb0Y1UTM7pmCOc5Q7Ikg1DxswNibycMxnHEmLChabayvVkhK5qpW1lnbUsRbmXbzaGeQSgHb2vgGbXr1JAO3Em4zuIXrxgLOHKDTTn6DZ5rdaTW3cKp8hKtrUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=danelec.com; dmarc=pass action=none header.from=danelec.com;
 dkim=pass header.d=danelec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=danelec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0mk02oRbUomgP8smIxwcUaBttSyGBNk30DFBfLTJD/8=;
 b=XdpabRZMAfT+8+HTsRMtXUIweDUMroW2FCQTk+sx6Vp/BTwl/Y9XOSaMaeMrsM1FoEM3xjPyS2lT4oydGhmuAmr8KGxdecd3boWzB46X0zYd2CFXg7hA9Hyrbcs7UaJcczLERQunSaKkPPQLYoJUDdMJIGUqMO+8kUYe1604aOWVKKPUSHlssRQWK2x8Potnzog2LRUkePzUY4NhTkqanyjIMPaL0EliPDXIbbwghvZBpOXAr9HXLl24c/mDYCcw/9zGp83kcXiP3JF7atR1fQ4/2D8Y+yPOuXNLZPpmzsZT51n/wCuo46ppiNx6lf/YLZGfnyLYxe2efhWwXUv0xA==
Received: from AS4P189MB2133.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:518::15)
 by DB8P189MB0796.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:122::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.20; Fri, 11 Oct
 2024 13:24:07 +0000
Received: from AS4P189MB2133.EURP189.PROD.OUTLOOK.COM
 ([fe80::290d:81d4:f68d:41f9]) by AS4P189MB2133.EURP189.PROD.OUTLOOK.COM
 ([fe80::290d:81d4:f68d:41f9%3]) with mapi id 15.20.8048.017; Fri, 11 Oct 2024
 13:24:07 +0000
From: Mikael Lund Jepsen <mlj@danelec.com>
To: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: ads7830 sensors declared in ACPI show up as ads7830-virtual-0, not as
 i2c device
Thread-Topic: ads7830 sensors declared in ACPI show up as ads7830-virtual-0,
 not as i2c device
Thread-Index: AQHbG+DZhncegZ9Qyk25ggdZd51gBw==
Date: Fri, 11 Oct 2024 13:24:07 +0000
Message-ID:
 <AS4P189MB2133236F43AF4D3A60E49BAFBA792@AS4P189MB2133.EURP189.PROD.OUTLOOK.COM>
References:
 <AS4P189MB21333CF67856C181281114C5BA7E2@AS4P189MB2133.EURP189.PROD.OUTLOOK.COM>
In-Reply-To:
 <AS4P189MB21333CF67856C181281114C5BA7E2@AS4P189MB2133.EURP189.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-xink-handled: Yes
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=danelec.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS4P189MB2133:EE_|DB8P189MB0796:EE_
x-ms-office365-filtering-correlation-id: cfad80c0-3c9c-4906-9e13-08dce9f7fc49
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?bXV6NHBzYi9jV1hNTmZZT1BRVHZyUk90VkREYW53U053UTVDMWM5YnViLzcz?=
 =?utf-8?B?OTR0bnVhWm9hM2M3cExzN0RtaFE2T25QMVh3MjRxZ3NCbldsNU1abEhRMjB2?=
 =?utf-8?B?ZDR0YjUzcWo1OG1iMFg0SXdPS2ZMYlJpZjQrOHEyTVVJRVVxbjZNSnk1NVFB?=
 =?utf-8?B?dWx1ZEZUc0xLaEh2dGtYOWxaV1F3VkFGSHRBWEdGbGdIelB0ZE9JQVlKcEZy?=
 =?utf-8?B?QU9Yb1gwYW9kUkRuaWh1Z0RHQkJieHVBcVBTbFU5TVB6S1JMRDRKWFBoWEg0?=
 =?utf-8?B?NFNLMW55aFRvdklHM1JlNC9xR24vSlpNbzA5SXNEeWJpUEk0ZG02YjR3UUp3?=
 =?utf-8?B?Y2VSQ0RaQWF3dTdVRFVWaFBHYTRHaDJGZytodTVTVnh1SWN6QitqWXRzTDdB?=
 =?utf-8?B?RFp3bDJCY1ZlM0lQdGNsZVl2c0UrWGdnMThUaUdqb1Rwem51Vm1CYzlsK2dU?=
 =?utf-8?B?NWlIbytia3hFNWNVYVdCYWpmMjNlOEVJUzRUU1l0VW41ZmpINmZ6VWh2OHJM?=
 =?utf-8?B?S2Q0R1VWR0t1RnZ4aHVzM09zSDZGSVl3U3RmbXJrY0ZrU0ZqamVtT0dmSVZk?=
 =?utf-8?B?aUgvNVpTTFdxZkJhdGFSUmZkVExjNTYwWHFsbnVleHR3dG5hZ0NWT014d1dH?=
 =?utf-8?B?ekJGS2h5R0tNVTlnbXlIaTFIdnQ2Zi8zTEgvc2k4NWlpMkxmcjMxYnViRDN4?=
 =?utf-8?B?cUdWL2xFcVlPbjBZM0gwS1IwcWw5RFdTeVpRRlFqV09mZlFPZlVnNks2MGNS?=
 =?utf-8?B?ZndUY3BHaUhZeTd4MEQzd1d3UHhMQmIvVUl3ODRDcUE2b3dzd2xxaXIvc0hN?=
 =?utf-8?B?RS9heG9peHdZaThneTB0TE9Mc2hRemxFOWk4eG4zRVFpcXNzelh4UkVZd0ta?=
 =?utf-8?B?ZHJ6U29PRHl1SExRdGQrYXlVa2o3NWNadmFIY3MzZWVGOTNKb1diL3pQZkN2?=
 =?utf-8?B?V2VYM0Y2anYydHBpRGRwWWluak9ZQ1B1Mzh5L2dtaFpjeEhsRnYwYk9JbDJj?=
 =?utf-8?B?bGFIcnFjZHo4aWdURU9lN0xaVGpaQTJ4QWpwczlDMDBmK3h5Qk9CQjY3OE5G?=
 =?utf-8?B?YW1hQXJncEZDSnRmQWcrZldmeUJUd2tKd05TcG54QmpQR3I1VlZkSXIrcGZD?=
 =?utf-8?B?eUVvNWQ5aTZCMWtMd1ljRk9vazZMUEhRWFVRZk03Yys1UUhoZlhTZXlSSDY1?=
 =?utf-8?B?TFA2c1Y3dE9zQ05JRzA3V2ZFcWVyZTJYUjMzSVVGK1F0SXJ4N0g3L2xSOTYx?=
 =?utf-8?B?bVBZbEhZWmJEaWpzTWV4REdWc0FTM2pid3FZSHFMMFVHcjZId0ROZjJaYlFa?=
 =?utf-8?B?OUFPYVB3OE85VklMWm5XaTE3LzBGNmNHSjVNdmw2cU0ramYxWWZLZnc1MEtS?=
 =?utf-8?B?Q3dqTE1US0lSaU95WmN5ekJ6VERoSjM0SCtnWUI0MzlXVnpHOUh0Ykg2WEZM?=
 =?utf-8?B?ODQvWlcyVTVwbjhwdmw4Kzh4WGZ3R3Q2b01rd3ZmeGZkLzFWSGRKNktvbERj?=
 =?utf-8?B?T2JoaGZmWXNUaTY2U1lUMWc1Sy9lc1ExbFF5bHk2WGh2STd3dmJUT2pyVEdW?=
 =?utf-8?B?ODV2QWhWUE50eFRtcUtwNDA3SDlFUTlaWGdUZ3YxT21HMmN1bTJwaGVZNEgy?=
 =?utf-8?B?U0dtekV0RFA2bGNqZDVuK0F1cXM2WDlnRzFpWFVFSytXby9HTWNRVEdXUEk5?=
 =?utf-8?B?aXoxditxdUJ0czlRSVBjTUdrcjVJOTlRcFZTTmVSTmhnRnZiNTR1anFBQlNa?=
 =?utf-8?B?d1orc1ErcFlPSWo3dENVUDU2ekxVSFJaYllrYzhkZHBNek9WYys1dWVLT2dO?=
 =?utf-8?B?MEJudHJzTkNqcU5jczc5dz09?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4P189MB2133.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QlJaTkpHTUNyTFNZVTc0czF0S1Z4bUoxamFDUVl0RUdLWmZkTXV1NWhqSFRh?=
 =?utf-8?B?dzMyMGpHSWZ0YjEvcWhjNk5NUHo5aXVnMmFzd0J2UTJhejVOcWZyU0ZuQ0hm?=
 =?utf-8?B?ditmSXBRTVZ4UThTL3EwbVhIc3J4aWtpUi90d0pPVjd1eTVaSXVaSEpTUEgy?=
 =?utf-8?B?bnJmR0JJV1k3bmhVVSsvTXg0WThFZnFCMVo4REI4ZGJnemh5dmlnciswME40?=
 =?utf-8?B?dXVaVWI4NEJad1I1YytDVkQzSTFidDBqbnpyY2NzTTA2eExjNFRkeTQ0R3NQ?=
 =?utf-8?B?aTZ4UGN6Y2tKd0E5TjViRVZ3cklMVGtGanE1ZUYrQ0tBRCs3U0NOWnhiS1Jv?=
 =?utf-8?B?bWVTS21pbzlnc09KaFdrN2I1QWVOeDVZMis2anI2MGtRR0NjazFMYXhWTzRB?=
 =?utf-8?B?dmo5bDYwWEFUS2MzdWF6TS9Pc1g4NS9oa3Bzb0NERGxZZzloRXJOa0UrYWpz?=
 =?utf-8?B?NU9Mczc3WnJTS2xLdk01WEg1a1dueW9FeEJESW1QbE10K3J2RDJFVGJpaUJw?=
 =?utf-8?B?TnNnREUvT1pVelpyRFd5NmlzY0M2a21ZSEdPNlNXUHorZlZLT3F5R1hWRU5l?=
 =?utf-8?B?d3F3alU0WmdOYzhKZHRlNmUzRTBVdU9ndmpqZkMrU0Z3WXBrQUtrY0FkODha?=
 =?utf-8?B?dEZPeWVGVHJGeExkeGo3cHBIYmkyRk9kM05JSlF2cDZKZlhFc1ViZ1RHZ24v?=
 =?utf-8?B?S1BuR2xZRUpya2s2OUtHRnBiSXZVb29uZGNFRFRsTldOczduWk9SUlNReHlh?=
 =?utf-8?B?aS9Zd0s0Y2FhcWMvRXlaSmdoZHdYWDdXRkJ6SDVnNGpXQ3pmUFJUOFNPS0Jz?=
 =?utf-8?B?UEUxNklaayt6ZWUzUXlUUWoyL1pBWlU1YlJNVk5lQnQ5QlF6NHphclhWaXo0?=
 =?utf-8?B?UDJqZ1g0MHlIYjFoSHowb3BjZmZ2aVVubVZHOHh0OTgyZ1FOMnU2MHgxTTBa?=
 =?utf-8?B?aDBDVHJ0ajNQVnM2dFRnNlh5T1c5RDFsTENQQmRLamtEUCtPNXpWUmkzd0p0?=
 =?utf-8?B?UVh3bTZFdzJ4Z3BhYmpxeEFyMjdmMFRNdGJPY1hmYTRqNVJGTTNyZW16amJ5?=
 =?utf-8?B?S3BSbGhFSFJzT2hHeWpPTFkwUy9HSEQ2eDNGRktwZVdiRG8reGtWbXFTM0gr?=
 =?utf-8?B?K09FVTMvVTFURUt6THU3TGtTdURva2poeGMxa05JcXZaYXdwcFFLMXRvWWl3?=
 =?utf-8?B?d2l0ZUFtdGRVYmV3dkJjemdyWHMxV0xqTjVvN3owYUd1bFdmYi82eEE2R0xS?=
 =?utf-8?B?TlF3WVdzRU1pdk5CTjV6aSt6ckxhUTBjUSsyem1RYjduck56Ukl0VXFzUEtC?=
 =?utf-8?B?S2hKUFhxdjVWTXkvZVcwRTdGOXBxRHFMVUtVVFNZdHI3V09mWmdXVGhoT0po?=
 =?utf-8?B?VERsVkNIT1ZHc0l2ZDZ5WU56dnVKK3U0RzM3cXptWVdmMmhobXoxZWlza2Qv?=
 =?utf-8?B?a1dkTEVPUFR4ZTdjcncyV2dsU085VUNseFdlYS9tT1NrOFgwbnNFblBvMDBB?=
 =?utf-8?B?WTdzVGdDRHVFNWdJQUR0NVdUNThNMjJsQnk3d0ZSNjVFSXJoRStqTjdCNk9O?=
 =?utf-8?B?OEJWOTV1RE1NK0RYZ3dsRHBGb1dDUkd2WUlVbU45SnF2MWpKbmhiNXQ2NER2?=
 =?utf-8?B?NW1YdGh5ejN4SXlxdjZVaXJlQXNrRXVtbXQxZnFxUjRGVFlrbmtPN01DTWQ5?=
 =?utf-8?B?VzVYdU9vUk54NXFDMXYweC9WN3hETUFzNmoyY1R5anNYSGtvL0hwZTVHTTBB?=
 =?utf-8?B?SW0vOVVjVGVXT3hwdDlkZHpiQ1cyZTdjY09NWkM1SUNOdjYwNVdVU0hsQWhR?=
 =?utf-8?B?QlhEblZJWHJOdE5MM0Q5a3h0eGxmTWJVVHh1cm1lQ2hjdXArdFhzZER5WDdM?=
 =?utf-8?B?UjQrWEpneTVEVTFXaXB5NVMrNC9DcXU3ZWVNaDBSN2huNFAyOFBqUVFOVzMx?=
 =?utf-8?B?M1NJVDZVTm1VR2Y4S1NrK1RNeFRUcjVPblRTY1kwcDJGenVWU0JUMVQ1SHZS?=
 =?utf-8?B?TFJHSTBrS1FReXNDOXA0Yys0VW1PTmRzTGVWM29mRzJSNHlnbXkwUDFMekNv?=
 =?utf-8?B?aUdVWGtFN3VrUktnYzlEZ0JUdTJuRnFpbnB6ckc1VEJKMU9LRWxTTGFSN1U2?=
 =?utf-8?Q?htxI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: danelec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS4P189MB2133.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: cfad80c0-3c9c-4906-9e13-08dce9f7fc49
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Oct 2024 13:24:07.8414
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d6bfedfe-b78c-47c3-8370-03356c3b6cf5
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4QkkmxN4lRzf3zHddUn8diZ/LpVznsu2S5r76XnU3Fd2hG4yG4y9CE6FFHPUPw+I
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P189MB0796

SSdtIHRyeWluZyB0byBhZGQgQUNQSSBkZWZpbml0aW9ucyBmb3IgdHdvIGkyYy1iYXNlZCBhZHM3
ODMwIHNlbnNvcnMuIFByb2JsZW0gaXMgdGhhdCBsbS1zZW5zb3IgcmVwb3J0cyBib3RoIGRldmlj
ZXMgYXMgImFkczc4MzAtdmlydHVhbC0wIiwgd2hpY2ggbWFrZXMgaXQgaW1wb3NzaWJsZSB0byBk
ZWZpbmUgc2VwYXJhdGUgY29uZmlncyBmb3IgbXVsdGlwbGUgc2Vuc29ycyBvZiB0aGUgc2FtZSB0
eXBlLiBJZiBJIHJlZ2lzdGVyIHRoZSBzZW5zb3JzIHZpYSBzeXNmcywgbG0tc2Vuc29ycyByZXBv
cnRzIHRoZW0gYXMgSSB3b3VsZCBleHBlY3QsIHdpdGggPGJ1cyM+LTxhZGRyZXNzPiBpbiB0aGUg
Y2hpcCBuYW1lIChlLmcuIGFkczc4MzAtaTJjLTAtNGEpLg0KDQpUaGUgYWRhcHRlciBvbiBhbiBB
Q1BJIGRlZmluZWQgc2Vuc29yIGlzIGJlaW5nIHJlcG9ydGVkIGFzICJWaXJ0dWFsIGRldmljZSIs
IG5vdCAiU3lub3BzeXMgRGVzaWduV2FyZSBJMkMgYWRhcHRlciIgYXMgd2hlbiByZWdpc3RlcmVk
IHZpYSBzeXNmcywgc28gaXQgc2VlbXMgdGhhdCB0aGUgaTJjIGJ1cyBpcyBub3QgaWRlbnRpZmll
ZCBwcm9wZXJseSBpbiB0aGUgQUNQSSBjYXNlLg0KDQpJJ3ZlIGZvbGxvd2VkIHRoZSBkb2N1bWVu
dGF0aW9uIGZvciBBQ1BJIEJhc2VkIERldmljZSBFbnVtZXJhdGlvbiwgdXNpbmcgUFJQMDAwMSBh
cyBfSElEIHRvIG1hdGNoIHRoZSBkcml2ZXIgdmlhIHRoZSBjb21wYXRpYmxlIHByb3BlcnR5Og0K
DQogICAgICAgIERldmljZSAoQURTMCkNCiAgICAgICAgew0KICAgICAgICAgICAgICAgIE5hbWUg
KF9ISUQsICJQUlAwMDAxIikNCiAgICAgICAgICAgICAgICBOYW1lIChfRFNELCBQYWNrYWdlICgp
DQogICAgICAgICAgICAgICAgew0KICAgICAgICAgICAgICAgICAgICAgICAgVG9VVUlEKCJkYWZm
ZDgxNC02ZWJhLTRkOGMtOGE5MS1iYzliYmY0YWEzMDEiKSwNCiAgICAgICAgICAgICAgICAgICAg
ICAgIFBhY2thZ2UgKCkNCiAgICAgICAgICAgICAgICAgICAgICAgIHsNCiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgUGFja2FnZSAoKSB7ICJjb21wYXRpYmxlIiwgInRpLGFkczc4MzAi
IH0sDQogICAgICAgICAgICAgICAgICAgICAgICB9DQogICAgICAgICAgICAgICAgfSkNCiAgICAg
ICAgICAgICAgICBNZXRob2QgKF9DUlMsIDAsIFNlcmlhbGl6ZWQpDQogICAgICAgICAgICAgICAg
ew0KICAgICAgICAgICAgICAgICAgICAgICAgTmFtZSAoU0JVRiwgUmVzb3VyY2VUZW1wbGF0ZSAo
KQ0KICAgICAgICAgICAgICAgICAgICAgICAgew0KICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBJMmNTZXJpYWxCdXNWMiAoMHg0YSwgQ29udHJvbGxlckluaXRpYXRlZCwNCiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgMTAwMDAwLCBBZGRyZXNzaW5nTW9kZTdCaXQsDQogICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICJcXF9TQi5QQzAwLkkyQzAiLCAweDAwLA0KICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBSZXNvdXJjZUNvbnN1bWVyLCAsIEV4Y2x1c2l2
ZSwpDQogICAgICAgICAgICAgICAgICAgICAgICB9KQ0KICAgICAgICAgICAgICAgICAgICAgICAg
UmV0dXJuIChTQlVGKQ0KICAgICAgICAgICAgICAgIH0NCiAgICAgICAgfQ0KDQpUaGUgZGlmZmVy
ZW5jZSBiZXR3ZWVuIGRlY2xhcmluZyBpbiBBQ1BJIChhZGRyIDB4NGEpIHZzLiByZWdpc3Rlcmlu
ZyB2aWEgc3lzZnMgKGFkZHIgMHg0YikgaXMgY2xlYXIgaW4gL3N5cy9idXMvaTJjL2RldmljZXMv
Og0KMC0wMDRiIC0+IC4uLy4uLy4uL2RldmljZXMvcGNpMDAwMDowMC8wMDAwOjAwOjE1LjAvaTJj
X2Rlc2lnbndhcmUuMC9pMmMtMC8wLTAwNGINCmkyYy0wIC0+IC4uLy4uLy4uL2RldmljZXMvcGNp
MDAwMDowMC8wMDAwOjAwOjE1LjAvaTJjX2Rlc2lnbndhcmUuMC9pMmMtMA0KLi4uDQppMmMtUFJQ
MDAwMTowMCAtPiAuLi8uLi8uLi9kZXZpY2VzL3BjaTAwMDA6MDAvMDAwMDowMDoxNS4wL2kyY19k
ZXNpZ253YXJlLjAvaTJjLTAvaTJjLVBSUDAwMDE6MDANCg0KSSdtIG5vdCBzdXJlIGlmIHRoaXMg
aXMgY29ycmVjdCBiZWhhdmlvdXIsIG9yIGlmIHRoaXMgaXMgYSBzeW1wdG9tIG9mIHRoZSBBZGFw
dGVyIGJlaW5nIGlkZW50aWZpZWQgYXMgVmlydHVhbCByYXRoZXIgdGhhbiBhbiBpMmMgYnVzIGFk
YXB0ZXIuDQoNCkRvZXMgYW55b25lIGhhdmUgYW4gaWRlYSB3aGF0IEknbSBkb2luZyB3cm9uZyBp
biBteSBBQ1BJIGRlZmluaXRpb24sIG9yIGlzIHRoaXMgYW4gaXNzdWUgaW4gdGhlIGRyaXZlci9o
d21vbj8NCg0KQmVzdCByZWdhcmRzDQpNaWthZWwgTHVuZCBKZXBzZW4NClNvZnR3YXJlIEVuZ2lu
ZWVyDQpEYW5lbGVjDQo=
