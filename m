Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010032.outbound.protection.outlook.com [52.101.56.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 634254E4C2D;
	Mon, 19 Oct 2026 11:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792410426; cv=fail; b=Ld35Fcicu3BH5dAb0rqLsQ7JGIcoReUEgCVkqRDVR/rcEk58+jcM8wcHFuPjfcrumi5yJvrpTlcB+pY48LXuOUxSBXVAP5lplDc6eJlxrHfIYZnyw01Drani8EveaWzrw2R7p/kDE1iH3oZtosx9aN0PGQvJvqFDPwWgwc12SqA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792410426; c=relaxed/simple;
	bh=mwoA9vyfSfQb7k7014ZC3W2Rihbg3uOmzgRjVBkklTs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=AcevIF0ccPXjwQWuLR8sMKUC8LRWQjROqL+r5NzVXal/3EDZYbCJviN2lRzkKzvq4FArSXH8rR3x7HbZzkfbwnPhKZOn415rkZEw/Fi63bHgUPOnBvOxvJH69F9GN0kCvdci5pFqWGpTY3Jm9ZOwz7/Gtlm0HZobldxvhS8yuos=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=bWk1XiGi; arc=fail smtp.client-ip=52.101.56.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="bWk1XiGi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N/iA+UZLuK/pgLvrHLX8Kgxablfwrww0Rvk/vrA0+inIogPmJ/zSjEEH06jUnrAOYP2bFNH9HtIo2FU362NhO0YK5Hu3swWD7QsNn4vkkzsHrRAIpYW76woQK7Tjrwyu90IDTqk6h90ziAqHnSMfwh5GY2AvBGLwYZsycIZ3vqE1uJgSUyHpimThen9TjlH3BTeUwtRTCjFkaS+jQdzri2w49a23C09kqvL4RzHygpchXtZyrJU82Z/AyyOCEoZN2XyI0e9eq1/mce4drH4HTYxugXQObTthSTB1yPmGAuXdgFvvfQMzDq8yfXWrFvGZTj97+N61UDl8qMi7kz0sGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mwoA9vyfSfQb7k7014ZC3W2Rihbg3uOmzgRjVBkklTs=;
 b=XgSBpSOJF3+D4eyyaOBgMTUjx05Q/+4GWi1NBnMFqHl+EuHczUl2+uvqmUcpvp690WgqhP2xGxwtB+wHEmXmk38E85SLulHQuVCJByD40hcPT/ocXkxW2jgoHejjtyfETTjzsepQ0lfA+6Jih2RSAeLAtsl+E35CHRBRRHytqUW1KWysCBorNtp+bZ5Z1VdILk9pgHPgwHke7ylftmlbNLM0gBS9qdKLNgKlNGCQsAGmNIoHrDniiAFuJZ31Z33+HTWYX4A1wae6URsz6Y6SYfg8tYiShh/kUPNfpWb3CAjKgqbSHBcp+zlpguXDJluOM3Qiu4B0CNjZV/9mZIUEZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mwoA9vyfSfQb7k7014ZC3W2Rihbg3uOmzgRjVBkklTs=;
 b=bWk1XiGikcTgnkrggpFQKDv+Wbv327V940nWxluwx8HY/1hZa1+hrslD+CCEsMHZZQPGlJwY6KaKSggEWHT2lwSDiHSYSGwsyqpIpbLpdDbPHFnkwYW5Zujb3Zyi6xWDEMsyfXh6Jv3K7g+L+ILHWMLvCm3boujMKHDfRipV/3HPnH9gKN/8mzbS99SnZ+o4J6SQi1po/g1H9bIbhOHB+5hxiinOLbAzj/FlYii6BW9H662KrhOemm1R1iOtiOoBYnkqKXarimZkTDWkKPwTpN1FXyjqdYacx+IgpPbLBes38F32J7hyH1wshXXLncOUh9SAEU9TndKwVhP3HFFfNg==
Received: from MN0PR11MB5962.namprd11.prod.outlook.com (2603:10b6:208:371::18)
 by LV3PR11MB8484.namprd11.prod.outlook.com (2603:10b6:408:1b4::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Mon, 19 Oct
 2026 11:47:00 +0000
Received: from MN0PR11MB5962.namprd11.prod.outlook.com
 ([fe80::d7e7:3843:50f1:ae38]) by MN0PR11MB5962.namprd11.prod.outlook.com
 ([fe80::d7e7:3843:50f1:ae38%2]) with mapi id 15.21.0522.017; Mon, 19 Oct 2026
 11:46:59 +0000
From: <Victor.Duicu@microchip.com>
To: <linux@roeck-us.net>, <pocj8ur4in@gmail.com>
CC: <linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] hwmon: (mcp9982) Update the interval cache only after
 successful writes
Thread-Topic: [PATCH] hwmon: (mcp9982) Update the interval cache only after
 successful writes
Thread-Index: AQHdXsWg2kCncpJ6kE+CHq/ZXS9w/LcEwYwA
Date: Mon, 19 Oct 2026 11:46:59 +0000
Message-ID: <a248dba6bdf09f94e220d0dc47b66caeb0ee8d4b.camel@microchip.com>
References: <20261018055750.1318723-1-pocj8ur4in@gmail.com>
In-Reply-To: <20261018055750.1318723-1-pocj8ur4in@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR11MB5962:EE_|LV3PR11MB8484:EE_
x-ms-office365-filtering-correlation-id: dd27161c-aebd-4c2e-8217-08df2dd6af67
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|18002099003|22082099003|10067099003|261009223027099003|11063799006|56012099006|38070700021;
x-microsoft-antispam-message-info:
 uyOhWR7W0Lpii0uBlCoyg5l32mLqPIOHfiS4RHiB5jVtvySK2Wx8a5wxg2aHx3MwHsMCJnPhmAvCgdH+/oMDCWO6Pib/HEg5VTbG6E6TphbuFCrdzltolMH04g7h4LkOhfVXNIZa0JYkvgdaWVcsuEDqKSCPh64ywgwTPyti91zg21pE2fYcPE8oFgSvSq8ytcStx6fdKyHeP6G9WaIl/wSWamLY2zAba3tguncZbDaScltoaHPN8htbR4rjlO7VAG6cu+o3b9QF5weRDORTvC/CCTyRSMFkogN8jNsDGPFW+iRZMbjBFexun4NCtz9O1mhJdHf8eJNqhHuEAfkb6WMOhwKS+1pTlDLWbD/9cShLZQeq3kGMmBS3zkLCmYSUGzKvNAuK1Kyb6Kx+ndjWMNsqygWxKDxLxHE6PegzDrQcqPkeaRuU3dISg2mfPtNUEhsXmVpCL/al2AyZO4klgaxVNiJG9GQI6W9q5dIw2Fx7adQ9wi/Mj89B8R/za1P6ApMbjlt2MaoC8Q9dkFuzMnIz6wGojFaBnGXoMRHt4UQIkvtkX1Lj9EuWyZhGKx4JbbjU4anDSKigMfz3rumvBWqJfa0Z7PPFdkV9MA+OuUgcB9pOklnpyVR4dyh3s0ORFkrpFouDbEdqr9EaR4CN6vmqBVnso75cadUIbGsyli8sfwhLDlCE+UiU34PPFWXacDZQe5ODHNi+ddMHxXy32tZCgPNS2CPWogGEuu4g1OY=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5962.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(18002099003)(22082099003)(10067099003)(261009223027099003)(11063799006)(56012099006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dmRRRmpTM0dWSmM3NjRNQjlOY2ZnMmwrcXJ2TmxEREt1N0tLcFROY0VvMllD?=
 =?utf-8?B?b29IQjQvZElnclBBZmxKQzgyNm5vRXFESldoTG5TSFh1MW1XQnUwN0U1VEU2?=
 =?utf-8?B?elBHZWcrT2dLMnhtOXM1Ty9UVUlJZmJqZGt2UUxVWW00amo2RzdXQUVvVVIv?=
 =?utf-8?B?YUhmU1dYclNLdkxPODhjNUpLUXFtQUFxYU5SL2VmSXhxQ2RBNUU4TXFoZ3NM?=
 =?utf-8?B?Q3NyQXpPOThPSlAzMDk3b3BiVzBUZE1YZ3plalFXcFpDYnNkQ1FQVnBaU3Ir?=
 =?utf-8?B?eWZEL2xTVXJDTGljMnNBbVZVY2NpMFNhdTErcGlOYWNhZmo5VEJmRXRvdVhn?=
 =?utf-8?B?MW8zYTBETjZmRm85OXhEVW9jQTl3VWNxbjNKSGF1VEdMYTRhVk1ubUpkUml6?=
 =?utf-8?B?TzVMWTZWbDVQUDVlN3A4R0J1OFZZRXV6dmRha2lvWmVpU3FyallFREU1SmRz?=
 =?utf-8?B?dDMwQTV5OFVEVktqRmdIMjdjTElGL083TUxiVk1MY2hab3lxVlYyOGNVT1FT?=
 =?utf-8?B?RTQvWDN2M1I2ZENGTm9tRExHMGp1dko5TyttZ3l0L1BDdkJxa0ozNjhHZHRw?=
 =?utf-8?B?bWJIN0dnNTJiZjJKejN3aHhjS0FkUE5iblJ4a0N6RVcvRC8ya2RDYndaWEdI?=
 =?utf-8?B?ZzdZc3N1aVQyZFI3UDhSMEszU0ZkaFlVdXFUZytJQlBWOFJKZWpFd0pRdUV3?=
 =?utf-8?B?RFdOb1AzUEI4RFRMVDVlZVJFdUkvVSsxUjg5RkxzNXFMa1RDUDNxdFZROURs?=
 =?utf-8?B?MVQvVk9mVG5uZDAxQkFYL0tpQTZjR0hvQ0RaeDVHQ2c4N2NHOUVXWGNOcE43?=
 =?utf-8?B?Q3MrUWM4Y241RHVDSHU5czBISGNFc0dhanEwQ3VqY2pWUWxtcC9IMXRXR29J?=
 =?utf-8?B?VlpxT2JRQ0xSamJ3OG1DTzV4L0p1bUJmUXU4NHI5RlRDNGQ0bkJoZUFzeU5p?=
 =?utf-8?B?b2hMVmFIYWJGV2xON1IzRlBVdDYyOEgyT0JWKzVwOElUSFhqdWl4NG9YWFlI?=
 =?utf-8?B?OWl2bGttMEczanlsNG5XK1QwTEhmZFhVWG9oNStGNFl0eGM0eHgxaGhPYlhq?=
 =?utf-8?B?TDFPdTJBSG9TOXdqT243MnNKT3IrbWUwQ0dpSXFFR3I5WFpmNUYzSzlSdEZO?=
 =?utf-8?B?RFpST1ZMdzZhRXNCVjkwWFRtd1VFUmJDRlhHYllTZFdxMms0TVVUcjNHbDhk?=
 =?utf-8?B?cEd2K3VFNWx6NGpaR24zdzlVQXE3QzVHMGNDRkV2RkZzRURJcnlBckluZk92?=
 =?utf-8?B?ZXVEZFNMeFpDRWZDSVJTNDA3TERmN0FGbTN4YUlHQzQzbUJwMGp4bzl1am01?=
 =?utf-8?B?RWxxSmxrMld5Qm5XNWpvWFZUWEUzRDZ6cXlXS3dqRm0zRHQxYnN4YVpFTzB2?=
 =?utf-8?B?bGZob0thOVQ5YkxZNUtUUnlpTXA0NTBNZVVZOHUzSTNxQUlldk5tMU9McWNn?=
 =?utf-8?B?YVFmOW5ZMmZwMFptNmZwT0ViYkwxeExucis5OEFYTHplRzdiNVNzaUJYbExL?=
 =?utf-8?B?Y1lhWnBubGJkWnlRcm1Pd2VqS0k2aUtiYk5yNmpzL1Zxa1RJalk4VTZVRTN5?=
 =?utf-8?B?ajRFWVpFdjVkdVJjWldQWTlrcWM3dlcvay9JdXAvNXl1U1dPYTlFbDJYYW5i?=
 =?utf-8?B?MEFkUitndFhlVFhBdGtCV2VLaHZUK1lXelRqeWFFNzJwZE1lbnhZS1B5S1BR?=
 =?utf-8?B?L0tyenR5dXVIajlSUFZhTU9hZlYwOUhFNUhXVE01RGxFOE4yZ2NheEozcGZ2?=
 =?utf-8?B?MnZQSGJ6U2JRQjN4czJXVXVleXl6RlJYdVpCNGdnU3puZGtBM0tzK0kwM1Fu?=
 =?utf-8?B?Q0RuWkZxSmJhdUgrUWFsaUhJMXVVR0FycGUzODRXU2ptN0NHRW1pcjJRcmVU?=
 =?utf-8?B?YWg5aWNsUlVlK1I5NTJEd2ZPQWVsamFTMmc2cG96UllrUzl6aTBxcnpNMW9r?=
 =?utf-8?B?TnhrMHd3WFZMMDBpM2Z1UG5SUUtQRCtsbm95a0pZaHlPYUxab1Z5TXF5TWRu?=
 =?utf-8?B?bFd6SFR5MFdKYmN0VnVTNk41ZGg3ZGwxMFdTbkFGa0d6b2RUUC9FWnd6bm9s?=
 =?utf-8?B?MGtiZEVWUjdzclFVTy9yN2l6WUdDeFM0UHZ1ampIakVra2U2UmNuR3JkZkcz?=
 =?utf-8?B?Mk4wY1VNZm5JR2cxeks5RWs2WU9yNGdWTkFBSFZ3SXU5WVFwL3Y0R0Q5bng0?=
 =?utf-8?B?RS91M1dNVU83YjNNRDhOd3NrZUdMUi9tR0hBaXRYT1RIRVZkYnV3Qkx1WXBB?=
 =?utf-8?B?RjI3dmZjSDVNUWpYNmdMdkZRejRPdGNjbFZHbkpnbkJFZU03a2Rub1ZuTXpF?=
 =?utf-8?B?VEdEelh6QnlRbWxIbWo2RVFHTnZpd0lyeG9rOTRJTXZ0cy9xdkZkQmdZZlMx?=
 =?utf-8?Q?ntKF3Xg6prE6bbg0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8BCDE9E6991AD94E99088A8351F020B7@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5962.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd27161c-aebd-4c2e-8217-08df2dd6af67
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Oct 2026 11:46:59.8509
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bskvA9yvuHvGjjMw/4RR625ihj0OvKUO7lDw5zmu+Y2URrNhoSq0PrfKTgN33ceExmBXnyvgWmy/aThM7ksrujdTf1SknDNEpDIA8oiOkuM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8484

T24gU3VuLCAyMDI2LTEwLTE4IGF0IDE0OjU3ICswOTAwLCBCYWVrIEt5dSwgS2ltIHdyb3RlOgo+
IG1jcDk5ODJfd3JpdGUoKSB1cGRhdGVzIGludGVydmFsX2lkeCBiZWZvcmUgd3JpdGluZyB0aGUK
PiBjb252ZXJzaW9uLXJhdGUKPiByZWdpc3Rlci4gSWYgdGhlIHdyaXRlIGZhaWxzIHdpdGhvdXQg
Y2hhbmdpbmcgdGhlIHJlZ2lzdGVyLAo+IHN1YnNlcXVlbnQKPiB1cGRhdGVfaW50ZXJ2YWwgcmVh
ZHMgcmVwb3J0IHRoZSByZXF1ZXN0ZWQgaW50ZXJ2YWwgaW5zdGVhZCBvZiB0aGUKPiBwcmV2aW91
cyBzZXR0aW5nLgo+IAo+IFVwZGF0ZSBpbnRlcnZhbF9pZHggb25seSBhZnRlciByZWdtYXBfd3Jp
dGUoKSBzdWNjZWVkcywgbGVhdmluZyB0aGUKPiBwcmV2aW91cyBjYWNoZWQgaW50ZXJ2YWwgaW4g
cGxhY2Ugb24gZXJyb3IuCj4gCj4gRml4ZXM6IGUyZmU5NTBmMzRlNSAoImh3bW9uOiBhZGQgc3Vw
cG9ydCBmb3IgTUNQOTk4WCIpCj4gU2lnbmVkLW9mZi1ieTogQmFlayBLeXUsIEtpbSA8cG9jajh1
cjRpbkBnbWFpbC5jb20+Cj4gLS0tCj4gVGVzdGVkIHVuZGVyIEFSTTY0IFFFTVUgd2l0aCBhbiBl
bXVsYXRlZCBTTUJ1cyBhZGFwdGVyIHRocm91Z2ggdGhlCj4gaHdtb24KPiBzeXNmcyBpbnRlcmZh
Y2UuIFJlamVjdGVkIHdyaXRlcyByZXByb2R1Y2UgdGhlIGluY29ycmVjdCBpbnRlcnZhbDsKPiB0
aGUgZml4IHJldGFpbnMgdGhlIHByZXZpb3VzIHZhbHVlLiBTdWNjZXNzZnVsIHdyaXRlcywgcmV0
cmllcyBhbmQKPiBNQ1A5OTgyRCdzIGludGVydmFsIGxpbWl0IHdlcmUgYWxzbyBjaGVja2VkLiBO
byBwaHlzaWNhbCBzZW5zb3Igd2FzCj4gdGVzdGVkLgo+IAo+IMKgZHJpdmVycy9od21vbi9tY3A5
OTgyLmMgfCA3ICsrKysrKy0KPiDCoDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9od21vbi9tY3A5OTgyLmMgYi9k
cml2ZXJzL2h3bW9uL21jcDk5ODIuYwo+IGluZGV4IDM5MThkYzM2Yzk0Ni4uMmNkNDFkY2JkOWFm
IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvaHdtb24vbWNwOTk4Mi5jCj4gKysrIGIvZHJpdmVycy9o
d21vbi9tY3A5OTgyLmMKPiBAQCAtNjI0LDYgKzYyNCw3IEBAIHN0YXRpYyBpbnQgbWNwOTk4Ml93
cml0ZShzdHJ1Y3QgZGV2aWNlICpkZXYsIGVudW0KPiBod21vbl9zZW5zb3JfdHlwZXMgdHlwZSwg
dTMyIGEKPiDCoHsKPiDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgbWNwOTk4Ml9wcml2ICpwcml2ID0g
ZGV2X2dldF9kcnZkYXRhKGRldik7Cj4gwqDCoMKgwqDCoMKgwqAgdW5zaWduZWQgaW50IGlkeDsK
PiArwqDCoMKgwqDCoMKgIGludCByZXQ7Cj4gwqDCoMKgwqDCoMKgwqAgdTggYWRkcjsKPiAKPiDC
oMKgwqDCoMKgwqDCoCBzd2l0Y2ggKHR5cGUpIHsKPiBAQCAtNjQwLDkgKzY0MSwxMyBAQCBzdGF0
aWMgaW50IG1jcDk5ODJfd3JpdGUoc3RydWN0IGRldmljZSAqZGV2LAo+IGVudW0gaHdtb25fc2Vu
c29yX3R5cGVzIHR5cGUsIHUzMiBhCj4gCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBpZHggPSBmaW5kX2Nsb3Nlc3RfZGVzY2VuZGluZyh2YWwsCj4gbWNw
OTk4Ml91cGRhdGVfaW50ZXJ2YWwsCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoAo+IEFSUkFZX1NJWkUobWNwOTk4Ml91cGRhdGVfaW50ZXJ2YWwpKTsK
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0ID0gcmVn
bWFwX3dyaXRlKHByaXYtPnJlZ21hcCwKPiBNQ1A5OTgyX0NPTlZfQUREUiwgaWR4KTsKPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKHJldCkKPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHJldHVybiByZXQ7Cj4gKwo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgcHJpdi0+aW50ZXJ2YWxfaWR4ID0gaWR4Owo+IAo+IC3CoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gcmVnbWFwX3dyaXRlKHByaXYtPnJl
Z21hcCwKPiBNQ1A5OTgyX0NPTlZfQUREUiwgaWR4KTsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIDA7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGRlZmF1bHQ6Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCByZXR1cm4gLUVJTlZBTDsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgfQo+IAo+IGJhc2UtY29tbWl0OiA1ODE2MWVhZDI5ZTUwZDcwYTMxN2VhMjZiNDcyZTBjNzUw
OGU2OWRhCj4gLS0KPiAyLjU1LjAKCkFja2VkLWJ5OiBEdWljdSBWaWN0b3IgPHZpY3Rvci5kdWlj
dUBtaWNyb2NoaXAuY29tPgoKQmVzdCByZWdhcmRzLApWaWN0b3IK
