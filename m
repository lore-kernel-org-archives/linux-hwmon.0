Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2095.outbound.protection.outlook.com [40.107.20.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9BF822B65A
	for <linux-hwmon@vger.kernel.org>; Fri, 25 Oct 2024 10:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.95
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729853743; cv=fail; b=JQ/iw5JmAH6BArc/ePthZwZRPN868G/J6imboyQlfdy0crRYFQvJ+af3DcaTKYkuquGTK6aBLJhsQ+OQjHEk/IMHcPTc7NjbRb7sByNEjShoGBhqO56A2wwJsKFhs52d4z0otQbqQzbdTRRZBic/OI8CN0LTbLe5E3dLTHQA6uw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729853743; c=relaxed/simple;
	bh=ZsnA70QWDeoZjmyF6H979jlp7VAg7/S3seuzHPvzKNc=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kn9tC0/X8cGtOq7Wg+GG+oV9rQBOcE+VQ4TAXPNSZypnZUBzj1lrN5htOAieptDMigZ6WgKNM2awQmtHtF6uLPhf7TbAZE6ERRUAYb5FiuNd9wwDiCUPh2LQfsMguDtNweFb09fIGLPhoSr6pQc5UUxLMLzGTZaf9L/Pcc0Jj4Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=danelec.com; spf=pass smtp.mailfrom=danelec.com; dkim=pass (2048-bit key) header.d=danelec.com header.i=@danelec.com header.b=GqnDCXh5; arc=fail smtp.client-ip=40.107.20.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=danelec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=danelec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=danelec.com header.i=@danelec.com header.b="GqnDCXh5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QK5fL86VpIqAHRQB7ra/AHGgkY5ieGs1fJrERHqUWPxxCzDuGt5p358dQ/OPaGAKxE8o51gvMb4vhtT+oPl2kIy/PXAR0swa09lCHA3a/t9JsVX7ZIbAcNVfAeCnIC4N2Lbfpjt96X61u2t4xt/DME30qjci5qsCjFC9IH3PF9jR3uWiuu++8m0ReC2c8OirFNpWYY79UuEwXp25AZdwt+o4vq/TQSdy8e6fRGpn1MS6THph4hDo0ZRTdkEsApwgvV83x4iecBL2QSAQQa9hUDlTrAR2Hpw8g6BQUzawveBAzziRLXP23FkhL6MvVi+SaBbKXKt7WRlpQFyUaYU3pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZsnA70QWDeoZjmyF6H979jlp7VAg7/S3seuzHPvzKNc=;
 b=iXVdKWY6QHy59VGKg9aEUGcnEzGfFuFf9azInKjaEZ5jUz2ZIPSzAXmyKp/JGuo49ccvnp7AawDkwrzquE6qdVjicEq4xEr0GcHjEXDXSUNqvFwGMF4v/6Gj/k0dzNJWNlgPHcWCN1D6O2Cgvrs8AbAccJp07lz/8MftGCispE5dzcsXDDhBrHYBNg17SeYSRuPq/wWonPrEtklhced9ii8vaojVfInlMkoc6pZip/41yoYtQWzl59dWDz4Qv3ykukq0fHzCD/gF4ofBciBK08izUMNHGPOzcGuxGpcz7c6Gr3O890SmQtntBrtnOKy035Z5SDTaBTDawda7YpzViQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=danelec.com; dmarc=pass action=none header.from=danelec.com;
 dkim=pass header.d=danelec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=danelec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZsnA70QWDeoZjmyF6H979jlp7VAg7/S3seuzHPvzKNc=;
 b=GqnDCXh5vLEwv0R7Nxhbyz5fVe4Ia8KqaLPhh+o2T1d9JqbFioM3b1FpfZE4Qe7mac/kk4vFCSMio8K0z/oZAUNo/ut9V1JpXNBZXj0wI3Hpi4itdk/58NkVK0CdmJb872FA1tkGzXS/bcjwDFa5/EDOiga/nGOXc3izYkHZLGiND02bzDJariucSLMLfpIKZTs5qxcrg8u2Q7SWvzJ7adA0Y0FUDZ7Oj4Sas7Fk3lCiX762rZNVM/9RM6FqoUGrVEjVnvAi3pgqPKFONCetNTbELzRjF6jwqbo+kmRn15oL487lkqh79OFBxviALfkliPQj2x+X55zB21k8tSDIBw==
Received: from AS4P189MB2133.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:518::15)
 by AM0P189MB0754.EURP189.PROD.OUTLOOK.COM (2603:10a6:208:1a2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.20; Fri, 25 Oct
 2024 10:55:35 +0000
Received: from AS4P189MB2133.EURP189.PROD.OUTLOOK.COM
 ([fe80::290d:81d4:f68d:41f9]) by AS4P189MB2133.EURP189.PROD.OUTLOOK.COM
 ([fe80::290d:81d4:f68d:41f9%3]) with mapi id 15.20.8093.018; Fri, 25 Oct 2024
 10:55:35 +0000
From: Mikael Lund Jepsen <mlj@danelec.com>
To: Guenter Roeck <linux@roeck-us.net>, "linux-hwmon@vger.kernel.org"
	<linux-hwmon@vger.kernel.org>
Subject: RE: ads7830 sensors declared in ACPI show up as ads7830-virtual-0,
 not as i2c device
Thread-Topic: ads7830 sensors declared in ACPI show up as ads7830-virtual-0,
 not as i2c device
Thread-Index: AQHbG+DZhncegZ9Qyk25ggdZd51gB7KBsIMAgBWku/A=
Date: Fri, 25 Oct 2024 10:55:35 +0000
Message-ID:
 <AS4P189MB21337DDF47CAEB6C9ED28BE0BA4F2@AS4P189MB2133.EURP189.PROD.OUTLOOK.COM>
References:
 <AS4P189MB21333CF67856C181281114C5BA7E2@AS4P189MB2133.EURP189.PROD.OUTLOOK.COM>
 <AS4P189MB2133236F43AF4D3A60E49BAFBA792@AS4P189MB2133.EURP189.PROD.OUTLOOK.COM>
 <c91afc26-61c9-4cb8-8993-ef2a750f2fc0@roeck-us.net>
In-Reply-To: <c91afc26-61c9-4cb8-8993-ef2a750f2fc0@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-xink-handled: Yes
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=danelec.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS4P189MB2133:EE_|AM0P189MB0754:EE_
x-ms-office365-filtering-correlation-id: beb80f4c-bc0a-4177-b161-08dcf4e38dbf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?aXBWSVg2WXlRNi9jeG0vdkJ4MWovOS9MaGtTMm5aVm8rR1Z3RnY4dUZ6MTQr?=
 =?utf-8?B?Nkx0WWJ5UmM1cTRobElZcXM4MW90UmxZSmRTVHpMUXJySUpWTXh6emZzenhR?=
 =?utf-8?B?Z2FUWE1MWG9YMndFbFppLzlHbW5TWXZVZFRyb2UzV2tSaCtWVmozWVB0VlZQ?=
 =?utf-8?B?MHRVVTY1dkNSVzRqSTFHMDlzSDYwUlhIcW5oYm1tZHIyWXhoeWRJREdzZG5J?=
 =?utf-8?B?TEdidGZMSmowZGlmZERYUEFJdlZGSXFoY0VHcVhWd2kvaGZYWjJFQWpOK3h0?=
 =?utf-8?B?eEtNS2lBYUJob3daWjhYV3RxT0VibFN1WEpVWlJ0d0VYVlJhR2Q5ejkxL0VH?=
 =?utf-8?B?MW41UXNTM0taZ1ZoQmNjZnMwV1l5VGthblZYaks0amhiUkk3a21SUThKQXRi?=
 =?utf-8?B?a2pKbHJMOXlnWW1QWTlGS2lBTm96YzRrcXRMMTV2SGNRUzNmTUIwendGTUhx?=
 =?utf-8?B?NkQ1QUlIZmo0TXluM0dOWHJ6QnRvN0JZUXZzL0ZqRjRvMkh5L3ZZQzFuWG8y?=
 =?utf-8?B?dWtmUXBaQnorUkNSSXowQTMrdlZ1RmhTREhGN20vWCtnYUI0TVVwSEdqeHYv?=
 =?utf-8?B?eGpYYXkwUTBvR3UxaDhtanlVVVBFOVVDR3VwaWpnYXNMUzBjS0RkcnVGVG96?=
 =?utf-8?B?Vmd4VG4rbWhnR09RT09xV2Z3aGlkd0tGTGgyR0VCZlNidTVUckFXS3pncXYz?=
 =?utf-8?B?d3RmRHRVOVI1dmxpZzUrdVpvcVZncDFzd3Z1Y0IzUTNHSFJvNTlXWEFPZ0cv?=
 =?utf-8?B?UUJDeDZTVVBDblRNV1lMZWsvVUlxUEZFajhock1JOTZqd1k3T0g4UlpCd2FP?=
 =?utf-8?B?d1Rha2VMMG5HQ2t6MTVlcTBGUUdSM294OGI1U1NvWFJmOGM5d1lnZ204NjZI?=
 =?utf-8?B?TDl6MlgvZDVrTkdOUHFjVzhMUEI2Szg4QmxHbTd1YVVIbHZuMnJ2Vlc1SXJM?=
 =?utf-8?B?UGphR3h3NHNLVzVEMit6bkQ0clAvclUza3pqejBhVFZGbmVia09WWUkwbkJF?=
 =?utf-8?B?Nlc2cVJyK2l0NXRjSkdYb3dBSHo2Q25SemRRbmJFWWE0T2Y2cm5ERE1lcFpC?=
 =?utf-8?B?aXJ3YXVCbWVYSksvdGQyQ3p4aW90NWdhUWxlL3hLY0VUU1M5R2U2aHprcGgz?=
 =?utf-8?B?dWVTOEN1R0poeTZybU1ISEsvYVREUHJzM0NWTzNid1ZJZkRHU2JIM0NiUytM?=
 =?utf-8?B?Qk9WTGhEU3NZYTBCbkpqNXM5bVo2T2lYZEQ2UGd3bmFLOTI1anRZUzRZc1Rw?=
 =?utf-8?B?cE8yMTJieGs3c0pxL1BNWSs1MlVQZWs1czlLd3BiblFzSW9QVGN2OWpTczY5?=
 =?utf-8?B?UVNVdGROY0RLcXFlTElkd1A2bTdxT1dNdDZtMnQwdzdEUkI2dmxtRGltSE9X?=
 =?utf-8?B?bzE2YkdZWFdONVQwc0VacUZ1bjlvL3JOVi9Eek9nQWdMZWx5VVZVd3ZyM2xm?=
 =?utf-8?B?aCswZmR6UldjM1RMMEJDMHB1bU5zVkNvQWpBU2dzVzhuQmlScVE5OUdDREt2?=
 =?utf-8?B?RlNBWW9ES2ZTSU5LVGJ3Z1VPQ1IzUXZDM1IyeVBHSVlnT09JUitkMlBBSnhk?=
 =?utf-8?B?bkFKaDhIeC91RzZ3MS9YMVBJS0x6SnJVTnc5cmszUS9PbElNalJKUDBPYjhB?=
 =?utf-8?B?NDMvbVFKdG0xS3FDL1VMMXBZbjRBSXR5bmhyaXljOUtKZ1ZoY3dwT3U3ZFB0?=
 =?utf-8?B?bWtJelI1RUhuREY0OU43MWtOZ1ltODVrZ3lHZjRiY1A4OGhQSXFacmtLUVZ6?=
 =?utf-8?B?ZjlCQjJtRUViVXovczZjbXU3YlBLSmJDbVA1V3grKzhtY0ZhZmUwN1FlK0dL?=
 =?utf-8?Q?y5UI2QQyQihNIzR/FFx9aCyC8LsMzmRibdJg4=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4P189MB2133.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?andobEZTNG1GMTNyd3psanNRNEhFM1FzKzdiOXlCSjJJRlNKdUpIYTZwaU5Q?=
 =?utf-8?B?RVNXeFlQMHlzZEF5WEUyc1hUMlR1M2VMNFZTQWs1VmI5RmpsREd6RU1BcVg5?=
 =?utf-8?B?dlpxMlN3WDVQTzg3UXMwZkNLalFjWlljTjVvZnMyWGwxOHhqSzBIYWxMM1Fu?=
 =?utf-8?B?blczNm9QK3dmajRkQW15L2wzQkVCdTBLOXpETTMxZE1oMXJuZzE1RVBHRXJ6?=
 =?utf-8?B?TDZmek40R0VlTGpGelIyaEFCWUZGWWJiVjhHV1ZmNys1aUZGb3Qyb3ovWS9n?=
 =?utf-8?B?RTcvR2dKd3NrcWpaSWExOXVkMEYvdk5Ra1BpWEdUcXAwa0k4QU5zOHFTdGdU?=
 =?utf-8?B?U0k3SlhVSGwrV0d1VmZsL1NadXk1UCtSZG9FN3JwZjJHbDJzN1BienVsaHJN?=
 =?utf-8?B?U2RJN3MrSXZ1MGVrYVFmVEdJLzZLRm9VbjBjMVp2am91Rlp0KzRCVm1DL1lB?=
 =?utf-8?B?V1EyMWV2djBWd296WDFWcE94RGdGcTJhNzFpVXRPL3N1M1ZqQkJ1Y2VvZlJT?=
 =?utf-8?B?clA0WFN1Yzg5eHR6VzZVa1NzQ2F1UEdRbGp5bW9iOGVRditrTjByb1ZqUXYr?=
 =?utf-8?B?YXFidGRHWVpuamlVenlGb3hTTTlCZ2RnQmkvQTdoWGhOaTNHOTR3MUlRK1Vh?=
 =?utf-8?B?dHhvTmhJZkdSbkR1MzlzNG9LVWo3ZjdKcGhNOTQ5MTFGU3VvemJyK1NTZXdT?=
 =?utf-8?B?YVl2UVVwUXluUDlkK1RVRHp0T2tUZkd5Ulc4MU1IVE9wT2dySm1WL1BQR0o2?=
 =?utf-8?B?Y0JIOEhZREhaemJIc0IxSzJYU3FZVUVDQmptV3BUd2xaeGFIQnFDV1k0SldH?=
 =?utf-8?B?YXRxNzNDOTU0UTc2NE5FdmhnMmJ2dU85TDhxNEFyZjFiKzhJMExsdkpnYzJG?=
 =?utf-8?B?N3JZTmU4Z3NDK3N2TC80UHY4ZXR3MnBVd3NyMjdIa1ZwV3QrbDhDaStNQWhJ?=
 =?utf-8?B?d29ZOFE5TGVNVllyam0zeHczUDh1K01EUkNWTjVxamhHOEt3U2xobWQ5ZHBy?=
 =?utf-8?B?ckRISjhXclZkbmR6RTA3aW5rY2IzZlNaTDI2VUZuRzZzZng2cnF2ODVpMUpv?=
 =?utf-8?B?ZDdxc3l0TndhdjBON3dqK0lMTmFMT291YStsTlB5eHYrc2U5VGZxeGVlUTFC?=
 =?utf-8?B?TGRQN1I2blJTS1J0SDU2dXF3VXcyeE9GeTBzSTl0M3VwYjJjYVZ1WmFMdjBh?=
 =?utf-8?B?YjN1eTlzV1Vzc3dJM2xwc0NxekxWbTV5NGNGWmlrNWFCZ2FiOWlpZzZQQ2Zk?=
 =?utf-8?B?V3d4WEFRRnZjQWRUY3ROMFhzZWxNcjNJeWZXMnc1NVZDZk9KeGsvNVlyNE16?=
 =?utf-8?B?VUJwamlGSlJNQ2JYdUhWWGtwZmNGTDJDMlVYSnh1RzZnYVpxanl0a0tMeDNX?=
 =?utf-8?B?c2tISW53SDIvODhuQVRwWmduKys4bDczd0grMi9kTWQ0SW04R0xpNzFQY09G?=
 =?utf-8?B?V3VPVWlXWUpzcWlSb0N2OWxIbWdET1MvOTF1Y0pycjg1UlFVSDRESFF5aSs4?=
 =?utf-8?B?aGFDdXlVcWdrdGx2UVE0K2J2bzF3NEltb1NLeUNnRkVYVUpnUTJNR3doam9u?=
 =?utf-8?B?T096RkI5UFpzTks2VzZxb0ovM29kVlpCamxaZ2FZZEdtSVcvbjBmVFRGT3M2?=
 =?utf-8?B?Mndsd1hRWTZZYnRNSER4aHNBSnhWdEpsUWdDTGVmaGpPQ29VMFkzeDhuV2ZS?=
 =?utf-8?B?Rmx3UVByY2kwM2dzZUJBTWhIL1FKRzJPb1VCUU1hWS9OZktvQ1NVVUgyTmVh?=
 =?utf-8?B?alBJWDhsdEZzVnBTLzFGaEFrU2ZPWWJlMVlweFYvOG1YSlNtUTc4L0pSc2Ru?=
 =?utf-8?B?NHFTbm1hVW53L2RheHhpUWFWRDRldjFJSEZtbXdib0wwMXJIeGVtRXhQc29N?=
 =?utf-8?B?cExydzRaVzBGL0dJSlB5K0htdWllNk1lME5vM0JHWElJSzZYQzd0UW5HNlU3?=
 =?utf-8?B?aklGOFJqbDZCcGdNdHhyZlN3N0FOdGttdms0QUg5bnhCMjJYMzN1Z2E5ME1a?=
 =?utf-8?B?U3ZLZ292TGFoSzZaMjF4bUhvWmhwSWxJVUZPQ1ZCUkFtT3NuU3ZRRXdxZURG?=
 =?utf-8?B?MkdmY0s0Zk5TV3V5ZndpNW15OHNmcjVEQmJzcnNkNmVVbkVnbzBzYURiYWhj?=
 =?utf-8?Q?uwZE=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: beb80f4c-bc0a-4177-b161-08dcf4e38dbf
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2024 10:55:35.2624
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d6bfedfe-b78c-47c3-8370-03356c3b6cf5
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W8nStY0I7Ri3IvSGcJpAmauqfJwtOtrfkDkmGc1rmRZXinus1cVfRmFi4iF6Jyf8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0P189MB0754

T24gMTEvMTEvMjQgMDY6MjQsIEd1ZW50ZXIgUm9lY2sgd3JvdGU6DQo+IE9uIDEwLzExLzI0IDA2
OjI0LCBNaWthZWwgTHVuZCBKZXBzZW4gd3JvdGU6DQo+ID4gSSdtIHRyeWluZyB0byBhZGQgQUNQ
SSBkZWZpbml0aW9ucyBmb3IgdHdvIGkyYy1iYXNlZCBhZHM3ODMwIHNlbnNvcnMuIFByb2JsZW0g
aXMgdGhhdCBsbS1zZW5zb3IgcmVwb3J0cyBib3RoIGRldmljZXMgYXMgImFkczc4MzAtdmlydHVh
bC0wIiwgd2hpY2ggbWFrZXMgaXQgaW1wb3NzaWJsZSB0byBkZWZpbmUgc2VwYXJhdGUgY29uZmln
cyBmb3IgbXVsdGlwbGUgc2Vuc29ycyBvZiB0aGUgc2FtZSB0eXBlLiBJZiBJIHJlZ2lzdGVyIHRo
ZSBzZW5zb3JzIHZpYSBzeXNmcywgbG0tc2Vuc29ycyByZXBvcnRzIHRoZW0gYXMgSSB3b3VsZCBl
eHBlY3QsIHdpdGggPGJ1cyM+LTxhZGRyZXNzPiBpbiB0aGUgY2hpcCBuYW1lIChlLmcuIGFkczc4
MzAtaTJjLTAtNGEpLg0KPiA+DQo+ID4gVGhlIGFkYXB0ZXIgb24gYW4gQUNQSSBkZWZpbmVkIHNl
bnNvciBpcyBiZWluZyByZXBvcnRlZCBhcyAiVmlydHVhbCBkZXZpY2UiLCBub3QgIlN5bm9wc3lz
IERlc2lnbldhcmUgSTJDIGFkYXB0ZXIiIGFzIHdoZW4gcmVnaXN0ZXJlZCB2aWEgc3lzZnMsIHNv
IGl0IHNlZW1zIHRoYXQgdGhlIGkyYyBidXMgaXMgbm90IGlkZW50aWZpZWQgcHJvcGVybHkgaW4g
dGhlIEFDUEkgY2FzZS4NCj4gPg0KPiA+IEkndmUgZm9sbG93ZWQgdGhlIGRvY3VtZW50YXRpb24g
Zm9yIEFDUEkgQmFzZWQgRGV2aWNlIEVudW1lcmF0aW9uLCB1c2luZyBQUlAwMDAxIGFzIF9ISUQg
dG8gbWF0Y2ggdGhlIGRyaXZlciB2aWEgdGhlIGNvbXBhdGlibGUgcHJvcGVydHk6DQo+ID4NCj4g
PiAgICAgICAgICBEZXZpY2UgKEFEUzApDQo+ID4gICAgICAgICAgew0KPiA+ICAgICAgICAgICAg
ICAgICAgTmFtZSAoX0hJRCwgIlBSUDAwMDEiKQ0KPiA+ICAgICAgICAgICAgICAgICAgTmFtZSAo
X0RTRCwgUGFja2FnZSAoKQ0KPiA+ICAgICAgICAgICAgICAgICAgew0KPiA+ICAgICAgICAgICAg
ICAgICAgICAgICAgICBUb1VVSUQoImRhZmZkODE0LTZlYmEtNGQ4Yy04YTkxLWJjOWJiZjRhYTMw
MSIpLA0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICBQYWNrYWdlICgpDQo+ID4gICAgICAg
ICAgICAgICAgICAgICAgICAgIHsNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBQYWNrYWdlICgpIHsgImNvbXBhdGlibGUiLCAidGksYWRzNzgzMCIgfSwNCj4gPiAgICAgICAg
ICAgICAgICAgICAgICAgICAgfQ0KPiA+ICAgICAgICAgICAgICAgICAgfSkNCj4gPiAgICAgICAg
ICAgICAgICAgIE1ldGhvZCAoX0NSUywgMCwgU2VyaWFsaXplZCkNCj4gPiAgICAgICAgICAgICAg
ICAgIHsNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgTmFtZSAoU0JVRiwgUmVzb3VyY2VU
ZW1wbGF0ZSAoKQ0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICB7DQo+ID4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgSTJjU2VyaWFsQnVzVjIgKDB4NGEsIENvbnRyb2xsZXJJ
bml0aWF0ZWQsDQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgMTAwMDAwLCBB
ZGRyZXNzaW5nTW9kZTdCaXQsDQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IlxcX1NCLlBDMDAuSTJDMCIsIDB4MDAsDQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgUmVzb3VyY2VDb25zdW1lciwgLCBFeGNsdXNpdmUsKQ0KPiA+ICAgICAgICAgICAgICAg
ICAgICAgICAgICB9KQ0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICBSZXR1cm4gKFNCVUYp
DQo+ID4gICAgICAgICAgICAgICAgICB9DQo+ID4gICAgICAgICAgfQ0KPiA+DQo+ID4gVGhlIGRp
ZmZlcmVuY2UgYmV0d2VlbiBkZWNsYXJpbmcgaW4gQUNQSSAoYWRkciAweDRhKSB2cy4gcmVnaXN0
ZXJpbmcgdmlhIHN5c2ZzIChhZGRyIDB4NGIpIGlzIGNsZWFyIGluIC9zeXMvYnVzL2kyYy9kZXZp
Y2VzLzoNCj4gPiAwLTAwNGIgLT4gDQo+ID4gLi4vLi4vLi4vZGV2aWNlcy9wY2kwMDAwOjAwLzAw
MDA6MDA6MTUuMC9pMmNfZGVzaWdud2FyZS4wL2kyYy0wLzAtMDA0Yg0KPiA+IGkyYy0wIC0+IA0K
PiA+IC4uLy4uLy4uL2RldmljZXMvcGNpMDAwMDowMC8wMDAwOjAwOjE1LjAvaTJjX2Rlc2lnbndh
cmUuMC9pMmMtMA0KPiA+IC4uLg0KPiA+IGkyYy1QUlAwMDAxOjAwIC0+IA0KPiA+IC4uLy4uLy4u
L2RldmljZXMvcGNpMDAwMDowMC8wMDAwOjAwOjE1LjAvaTJjX2Rlc2lnbndhcmUuMC9pMmMtMC9p
MmMtUFINCj4gPiBQMDAwMTowMA0KPiA+DQo+ID4gSSdtIG5vdCBzdXJlIGlmIHRoaXMgaXMgY29y
cmVjdCBiZWhhdmlvdXIsIG9yIGlmIHRoaXMgaXMgYSBzeW1wdG9tIG9mIHRoZSBBZGFwdGVyIGJl
aW5nIGlkZW50aWZpZWQgYXMgVmlydHVhbCByYXRoZXIgdGhhbiBhbiBpMmMgYnVzIGFkYXB0ZXIu
DQo+ID4NCj4gPiBEb2VzIGFueW9uZSBoYXZlIGFuIGlkZWEgd2hhdCBJJ20gZG9pbmcgd3Jvbmcg
aW4gbXkgQUNQSSBkZWZpbml0aW9uLCBvciBpcyB0aGlzIGFuIGlzc3VlIGluIHRoZSBkcml2ZXIv
aHdtb24/DQo+ID4NCj4gDQo+IFRoZSBkcml2ZXIgZG9lc24ndCBrbm93IGFueXRoaW5nIGFib3V0
IEFDUEkuIFRoZSBpZGVudGlmaWNhdGlvbiBhcyB2aXJ0dWFsIGRldmljZSBpcyBkb25lIGJ5IGxp
YnNlbnNvcnMuIFRoYXQgY29kZSBpcyBzdXBwb3NlZCB0byBmaW5kIEFDUEkgZGV2aWNlcywgYnV0
IG1heWJlIHNvbWV0aGluZyBoYXMgY2hhbmdlZCBhbmQgdGhhdCBkb2Vzbid0IHdvcmsgYW55bW9y
ZS4gT25lIHdvdWxkIGhhdmUgdG8gZGVidWcgdGhlIGxpYnNlbnNvcnMgY29kZSB0byBmaW5kIGEg
c29sdXRpb24uDQo+IA0KPiBOb3RlIHRoYXQgdGhlIGRyaXZlciBkb2VzIG5vdCBjdXJyZW50bHkg
c3VwcG9ydCBkZXZpY2UgcHJvcGVydGllcywgbWVhbmluZyB0aGF0IHJlYWRpbmcgaW5kaXZpZHVh
bCBwcm9wZXJ0aWVzIGZyb20gQUNQSSBpcyBub3QgY3VycmVudGx5IHN1cHBvcnRlZC4gVGhlcmUg
aXMgb25seSBhIHNpbmdsZSBwcm9wZXJ0eSwgInRpLGRpZmZlcmVudGlhbC1pbnB1dCIsIHdoaWNo
IHlvdSBkb24ndCBzZWVtIHRvIHVzZSwgc28gdGhhdCBwcm9iYWJseSBkb2VzIG5vdCBtYXR0ZXIu
IElmIHlvdSBkbyBuZWVkIHRoYXQgcHJvcGVydHksIHRoZSBkcml2ZXIgd291bGQgaGF2ZSB0byBi
ZSB1cGRhdGVkLg0KPiANCj4gR3VlbnRlcg0KDQpUaGFua3MgZm9yIHRoZSBzdWdnZXN0aW9uLg0K
DQpJIGRpZCBzb21lIGRlYnVnZ2luZyBvZiBsaWJzZW5zb3JzIGFzIHN1Z2dlc3RlZCwgYW5kIHdo
YXQgSSBmaW5kIGlzIHRoYXQgY2xhc3NpZnlfZGV2aWNlKCkgZ2V0cyBjYWxsZWQgd2l0aCBkZXZf
bmFtZT1pMmMtUFJQMDAwMTowMCwgbm90IDAtMDA0Yiwgd2hpY2ggaXQgdHJpZXMgdG8gcGFyc2Ug
dG8gZmluZCBjaGlwLmJ1cy5uciBhbmQgY2hpcC5hZGRyLiBUaGlzIG9idmlvdXNseSBmYWlscyBm
b3IgdGhlIEFDUEkgZGVjbGFyZWQgc2Vuc29yLiANClRoZSBkZXZfbmFtZSBjb21lcyBmcm9tIGxp
c3Rpbmcgbm9kZXMgdW5kZXIgL3N5cy9idXMvaTJjL2RldmljZXMgYXMgZmFyIGFzIEkgY2FuIHNl
ZSwgc28gSSB3b25kZXIgaWYgdGhpcyBpcyBhIHN5c2ZzL2FjcGkgcHJvYmxlbSwgcmF0aGVyIHRo
YW4gbGlic2Vuc29ycz8NCg0KVGhlb3JldGljYWxseSwgbGlic2Vuc29ycyBjb3VsZCBmaW5kIHRo
ZSBidXMgbnVtYmVyIGZyb20gcGFyc2luZyB0aGUgcmVhbHBhdGggb2YgdGhlIGkyYy1QUlAwMDAx
OjAwIG5vZGUsIGJ1dCBJIGNhbm5vdCBzZWUgaG93IGl0IGNvdWxkIGZpbmQgdGhlIGNoaXAuYWRk
ciB2aWEgc3lzZnMgdGhlIHdheSBpdCBpcyByZXByZXNlbnRlZCBub3cuDQoNCldoZW4gaTJjIGRl
dmljZXMgYXJlIGRlZmluZWQgaW4gRFRTIG9uIGFybSBzeXN0ZW1zLCB0aGV5IGFsc28gZ2V0IGFk
ZGVkIGFzIDxidXMubnI+LTxjaGlwLmFkZHI+IG5vZGVzIChzYW1lIGFzIHdoZW4gcmVnaXN0ZXJp
bmcgdmlhIHN5c2ZzKSwgc28gaXQgaXMgb25seSBBQ1BJIGRlZmluZWQgc2Vuc29ycyB3aGljaCBh
cmUgcmVwcmVzZW50ZWQgZGlmZmVyZW50bHkgaW4gc3lzZnMuDQpTaG91bGQgSSBwb3N0IHRoaXMg
dG8gbGludXgtYWNwaSB1c2luZyBhIG1vcmUgcHJlY2lzZSBzdWJqZWN0LCBvciBpcyB0aGVyZSBh
bm90aGVyIG1vcmUgc3VpdGFibGUgbGlzdCBJIHNob3VsZCB0cnk/DQoNClRoYW5rcywNCk1pa2Fl
bA0K
