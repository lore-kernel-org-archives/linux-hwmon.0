Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 702F9C47089
	for <linux-hwmon@archiver.kernel.org>; Mon,  5 Dec 2022 18:42:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230100AbiLESmS (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 5 Dec 2022 13:42:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233569AbiLESlk (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 5 Dec 2022 13:41:40 -0500
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2084.outbound.protection.outlook.com [40.107.101.84])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01E9A220D0
        for <linux-hwmon@vger.kernel.org>; Mon,  5 Dec 2022 10:40:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b/nteNSurY6OWS9WlzmksX/zZS/P/YXQdy6c6f8OAkjfhmpvRb0wfdjtpMCCkHWHlE4CEjdQ7mlsXz2lUnuqZ8SudOyyz/ertaOF40mb+3kIL4fh1AE/CVAat7yMx8epC4LBDZsYpaIjNaw6DO+aWk5QosaUfa/+UusZ9uiB7AzB/NGn5HiDmywmACTo+rF7Jgz5zwMiAQRYI5Co/CaVi3ZlhgIErPdjMU2lT0yoH+kYos/P0Mdi87+RPPUccHXQPNl1HGxDu/z2N3xRhXx5lGdfvEK83AGw0+58M2KOwTtNjca7lzee+g30/yABmPGPHAuxGZQl5BpxDnPaQ392pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oBwXC/Opz2tnJiQOLErCFvx91wYA6S8ZI8HS6y+Jot8=;
 b=Tki5sZm9FaWAqJDqQH43EbM86cQGZ0lR0yhyXEnXueShsU6eSVl3ipSrrjYcFZoIGT2F9PiDWRHW3YxPVwgXMcvift6PVxMzmm/rqzJmgH4ufYshe4lftEwn8ZnOxTe1fRoXNAY4tAA+Xz42Xo3mk4t+lUO5KtARcyv6PtNTV8+OmNezKotfNf8OfMLN/5fwsKiOQN2vA1Ux6q8wh0bmmKCIlmBA9v+SVUK6BR523uRtodQa0tFXbSrVPVGhO3fbLBMyaGxVNQaozxUKkxDiZE0dLy9VTMfIAtAjZwYG6NMMZInDl0t6MYtPQdPoDUk8ztM2rT+/bCwcY1JmsdhKag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oBwXC/Opz2tnJiQOLErCFvx91wYA6S8ZI8HS6y+Jot8=;
 b=pJlgn3Usp5y0QlHny5dihvHZyjSCxMCbPM3gObpDJiHnTcfJaMx/Wu63KCtIO0XV43zWrMH+V5pARpeDX/udAMCGFebncU7Tcd9m35UIX74Kp4DZHU5Jb2yl8Vk8HIxYeJv9PeWI7W4MX6jxd/0qekYkBaKC1YbrJwo3TJPvXlKQR7CE9nnlQgheLQDMSmfX6Nh+A/tATVwVFDtlE4J2J0jvSSxPiRofCdGkZUCtCR4xDUFKH0G8TU9vcG7SD+mssH93H5cjaZ80grm24xIvAyKqGQU3h2ivTyia+Nx5b/ny6cgQzb91mHhM2zZXo3KEu5NAwx1aiv4NWocPK17KbA==
Received: from DM6PR12MB4074.namprd12.prod.outlook.com (2603:10b6:5:218::11)
 by CY8PR12MB7338.namprd12.prod.outlook.com (2603:10b6:930:52::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.11; Mon, 5 Dec
 2022 18:40:15 +0000
Received: from DM6PR12MB4074.namprd12.prod.outlook.com
 ([fe80::df1c:cbcc:7a30:4760]) by DM6PR12MB4074.namprd12.prod.outlook.com
 ([fe80::df1c:cbcc:7a30:4760%6]) with mapi id 15.20.5880.014; Mon, 5 Dec 2022
 18:40:15 +0000
From:   Michael Shych <michaelsh@nvidia.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Xingjiang Qiao <nanpuyue@gmail.com>,
        Jean Delvare <jdelvare@suse.com>
CC:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: RE: [PATCH 1/2] hwmon: (emc2305) fix unable to probe emc2301/2/3/4
Thread-Topic: [PATCH 1/2] hwmon: (emc2305) fix unable to probe emc2301/2/3/4
Thread-Index: AQHZCNArGc6zrY8G+EW8OLIBQKKYHK5fmXCAgAAFaNA=
Date:   Mon, 5 Dec 2022 18:40:15 +0000
Message-ID: <DM6PR12MB40745541F0E38C69DB0A6040D4189@DM6PR12MB4074.namprd12.prod.outlook.com>
References: <20221205173611.145571-1-nanpuyue@gmail.com>
 <47fc8999-647e-be8e-60a6-cc43329746e8@roeck-us.net>
In-Reply-To: <47fc8999-647e-be8e-60a6-cc43329746e8@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR12MB4074:EE_|CY8PR12MB7338:EE_
x-ms-office365-filtering-correlation-id: 1cc022e2-a8cd-4139-dd30-08dad6f0267a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0t2v6BnIn/0bmCyUUeKxgoOkEXsPvdpM3TXqPoGKjcLpxGX+QeGypJo00IqPhw8faCCWwuLSe8OzBjKkj+GFLrpLZGZLXZ+ZWKzBiPVPSEqEPC2yfUxNpb1AqdVpr02aL4yJvH8NvuBcZpHxSIZVAT519NfCUv4W3ftDU8IjXGQiyKHBMhPSNX5A/Ta2ThtGmsiiQlMJoGO4zuPFcicBTKzcuq7D8BA2Qzt+b6cyDfx08gww44CRZQszfJkeKQ4aMG2OohG0e0FBLUlLIrj1r5v+eKIi1opoYihERa70R0RsGjzASD7yr3HC0gTyhcoFsCqeyRmUnSX0jVWkkeXKIaFGYLgP7IbSwilEVtH8QhsRdxwvaayyPnLKPIL6MrF9HYwl+2xpLNQmTweSUnEEHNC00vgEJj4VIXGpMSsTlKl5vwN/ykr/SuC0X6wj0tK5y/pWUuWgZF6QDKfCyUXNskoTwIUNeJvvfcw2uLgo1CUuNqSWfe5fl070f02/5Ug7H4TJDG7TDet5kZmENAEJnCq9tZljKYih+V4ww3mL9w5J0xNvivLSMf+su7ztpDdHeRcqgAHVtq5S/oOjUHQzkrl4AZP1hn4YN97u2ZpYcuAw5/ky9SVfjnrbF+idfHBafmbcRXe+vetWG0GIytMgCc7iw0RRrxEFa6tE2oQq0lC/GFN1ELcxzD5oOgCGqwvslgP+lE/jWemRlOWJHUsPhg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4074.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(39860400002)(396003)(366004)(346002)(451199015)(7696005)(478600001)(122000001)(86362001)(71200400001)(6506007)(38070700005)(53546011)(2906002)(66446008)(316002)(66946007)(76116006)(66476007)(8676002)(4326008)(64756008)(66556008)(55016003)(41300700001)(52536014)(33656002)(110136005)(38100700002)(5660300002)(8936002)(26005)(9686003)(186003)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cmNpeEdlYmNGV0RTa2FIRy9CbHdvZ2lKT0RsNVE4TDJ5U3hNNEx1RjAyWVMw?=
 =?utf-8?B?WlY4Zks0SFpkNXRuY1o0NndYUHo4Ny9LSmJjbHFrcVRxWFVKcWFyRThoTlNi?=
 =?utf-8?B?aWNPaVd6R3lrNHAzeEN1eFVZKytqYk1OWnB0cSswcVdyWm5TeVd3dWdKTFA2?=
 =?utf-8?B?bmgvMWhISVVvUnRJdVp1QmtrNzEyaTJzMHNuWU5QQ1ZKKzljQlQrcXNlQjgx?=
 =?utf-8?B?YnpCVzNhQi90RSs5T3dGblROKzJUd1ZJcUFrSU5ieUdkUEZUUWgvTVVDbitD?=
 =?utf-8?B?dE4yOVA2Uk10RGRUaWI0TERQWmxwMEh4TFRMVDVMVldya0V3RDU5enBMMk5p?=
 =?utf-8?B?TmpXWXlCaEVpaUJoY1Q4Z1pOaE5oT3dCNmpqTzdFLzhuK2l6aEJmM3o1aXd4?=
 =?utf-8?B?aXdxZDAzRjNRSWZSbEVWamtLZWdvd2srMkZUdDE2MVRyblVITEtJQnlGaGNN?=
 =?utf-8?B?WExtK1dBRExxa3U0SzBJRXFnWURsY0FJTENzajg3aEZZRVZwZENIUXRLWjJp?=
 =?utf-8?B?ckliOVFZUVhsZll3NCtMVWFhN3dBOGZxditteXc0UmRGanJrZjlHbUFpaktI?=
 =?utf-8?B?cTFFc1pXbC9hVElES0pTUTdvQ3NicXhjbXBCSHpWbFZFbS9iOFZ2M0kzellN?=
 =?utf-8?B?bVlMRDVpZzhrQVI5T1BYTG5uRjc4Z3Q3d1dUQThSQjdDeEJCMGxUbkFaMlZy?=
 =?utf-8?B?TWVsZjNCbjZLRWdGT3R1UTBXb3hVOXJ3TkZqUE9LUjVCeUhxMUhCK2d3L2M5?=
 =?utf-8?B?NDhVRU5ZbmJxa2RJVUQvWDEyYlJobGNObUlocE1xK3ZOaUFFaUpKby9HcllH?=
 =?utf-8?B?NjZKUXNYd0RWeGZLZWR2aDFmKzc5WEp4R2VlRzY3dTkxNWxRd211M1NEMFVT?=
 =?utf-8?B?a09aWFBWNjdOR0V6d1IzcDlmcS9wY052M0lISE9qZllPV3pzK3BNdy9sVk1Q?=
 =?utf-8?B?RzFaR0V4TDZwZmo1MFNBYzNRK2VUWmEyb1BiRE5vam5qVzdFaEZJN3ZHRGw2?=
 =?utf-8?B?TjM2RktvV3IycnRuOFIxOXpaNDF5dnorMkRTUE4zR2FVTVVhVGZWOE52RExj?=
 =?utf-8?B?TEtHZ3VZRi9DYkc2WFVlZzJ5ZjVGdGpVSCtaejU1TUlUVzROTU45MkhqUXRB?=
 =?utf-8?B?Q2Z2TXNxRjdDbElqVnQ1K2dkVW8zdHBWTHo5QzNIbFE3MDJBRGhaUlVmcGpH?=
 =?utf-8?B?S21PR1ZicWc1LzRHcVFjWTJtMlZITUp0VzdwTnVGcDZZSEZhbktBWWcwNTlo?=
 =?utf-8?B?OVAweGFtMVNCdmc0OW90NVMxSStLRGRBcmRxL05WcFpvWVp0UlFKdGFLYVZi?=
 =?utf-8?B?Z3pCS0phRDFPbmdyWGZkTUNCNmRxVFV1dzFBVmZIZktlUFg1aUFpVkFWeXRP?=
 =?utf-8?B?NlllcDNUWFhFMno5SjA1YS85My9xcVpUYTNSV1VGR0tOOGlxSkN3MlFzMzRI?=
 =?utf-8?B?QXhzbEluTnUvaHlud3luTlNld3dWOFZUSURuWENYSHZWNTRPZXp0YW9jbFhI?=
 =?utf-8?B?anlZbG5lT3dvRGowQXJlaDMvUzJaZnExNldmN3ZiQ3dVbVFrc2l0UGpyQWY3?=
 =?utf-8?B?MzVDRnd1RlV5WU1Bd3lGWTk4MDN6eE9nb2xDREZWQzl1bTF6OU1XbTRjck01?=
 =?utf-8?B?dHhtNnR4OWdRa2F2ZURHcUIyOHdrUkFwRitaQVVPc3kzbG80L3Y4U3ZVMEVP?=
 =?utf-8?B?UjVSOXE0N2R0QVltY1NQRWxZRWNzWG03UFJTVlNLbzI4TE9aVDdlaGdYQ0pY?=
 =?utf-8?B?cU1IcUJqRFN6YVFmMWFnV2wrcndIMmd5WCtYMmRGeStVUWFYM05qVHVwZHRz?=
 =?utf-8?B?UFRLcUUvUmQ3bUdxdTl1b1ZuOEdqaUdrUHMzUnI3WUtyMU02emhlZnBWdHNE?=
 =?utf-8?B?S1I4UElYVFo1T1gxZEtOcEMvUUJLZlZJRUJXdUYzZWxDR2E0RjhlOC90T2Vp?=
 =?utf-8?B?OWNqenJxbFJkeVFxanVvSmpYN2l0L3VMc2RNelZBY0JCbjZibW1oZWN3SWp6?=
 =?utf-8?B?dGVUMHI1cEVWUytCd3orU1BLR3dRQzdjRXFvUlE0NlMrVzdlNlBrS2hReE1D?=
 =?utf-8?B?ZlhodVBhSEJwZ0MxanZLUStPRVpsSWpUZlJLVCs5MFliZlF4YjgrbVJiSnFQ?=
 =?utf-8?Q?oZaptWiW013iqDPg+VtdOs7AC?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4074.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cc022e2-a8cd-4139-dd30-08dad6f0267a
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2022 18:40:15.2115
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: E6t4hvwWWuvh8qQrDWW3Oj9WccMKfSs1cvyc/2qkqb3hhlbDGKN9ydY5Ekipl0PZQ0EuRZut2zvcLWqBiubxxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7338
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR3VlbnRlciBSb2VjayA8
Z3JvZWNrN0BnbWFpbC5jb20+IE9uIEJlaGFsZiBPZiBHdWVudGVyIFJvZWNrDQo+IFNlbnQ6IE1v
bmRheSwgRGVjZW1iZXIgNSwgMjAyMiA4OjE1IFBNDQo+IFRvOiBYaW5namlhbmcgUWlhbyA8bmFu
cHV5dWVAZ21haWwuY29tPjsgSmVhbiBEZWx2YXJlDQo+IDxqZGVsdmFyZUBzdXNlLmNvbT4NCj4g
Q2M6IE1pY2hhZWwgU2h5Y2ggPG1pY2hhZWxzaEBudmlkaWEuY29tPjsgbGludXgtaHdtb25Admdl
ci5rZXJuZWwub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMS8yXSBod21vbjogKGVtYzIzMDUp
IGZpeCB1bmFibGUgdG8gcHJvYmUNCj4gZW1jMjMwMS8yLzMvNA0KPiANCj4gT24gMTIvNS8yMiAw
OTozNiwgWGluZ2ppYW5nIFFpYW8gd3JvdGU6DQo+ID4gVGhlIGRlZmluaXRpb25zIG9mICdFTUMy
MzA1X1JFR19QUk9EVUNUX0lEJyBhbmQNCj4gJ0VNQzIzMDVfUkVHX0RFVklDRScNCj4gPiBhcmUg
Ym90aCAnMHhmZCcsIHRoZXkgYWN0dWFsbHkgcmV0dXJuIHRoZSBzYW1lIHZhbHVlLCBidXQgdGhl
IHZhbHVlcw0KPiA+IHJldHVybmVkIGJ5IGVtYzIzMDEvMi8zLzQvNSBhcmUgZGlmZmVyZW50LCBz
byBwcm9iZSBlbWMyMzAxLzIvMy80IHdpbGwNCj4gPiBmYWlsLCBUaGlzIHBhdGNoIGZpeGVzIHRo
YXQuDQo+ID4NCj4gDQo+IFRoaXMgc29sdmVzIHRoZSB3cm9uZyBwcm9ibGVtLiBUaGUgY2hlY2sg
Zm9yIFJFR19ERVZJQ0Ugc2hvdWxkIHNpbXBseSBiZQ0KPiByZW1vdmVkIGluc3RlYWQgKEVNQzIz
MDVfUkVHX1BST0RVQ1RfSUQgYW5kIEVNQzIzMDVfUkVHX0RFVklDRQ0KPiBhcmUgYm90aCAweGZk
KS4gT24gdG9wIG9mIHRoYXQsIG1vdmluZyB0aGUgZnVuY3Rpb25hbGl0eSBvZg0KPiBlbWMyMzA1
X2lkZW50aWZ5KCkgZG9lcyBub3QgaW1wcm92ZSBjb2RlIHF1YWxpdHkgKHF1aXRlIHRoZSBjb250
cmFyeSkgYW5kIGlzDQo+IHRodXMgbm90IGFjY2VwdGFibGUuDQoNClRoYW5rcyBmb3IgY2F0Y2hp
bmcgdGhlIHByb2JsZW0uIA0KR2VuZXJhbGl6YXRpb24gZm9yIEVNQzIzMDEvMi8zIHdhcyBhZGRl
ZCBsYXRlciB0byB0aGUgY29kZS4NCkkgYWdyZWUgd2l0aCBHdWVudGVyIHRoYXQgY2hlY2sgb2Yg
RU1DMjMwNV9SRUdfREVWSUNFIHNob3VsZCBiZSBqdXN0IHJlbW92ZWQuDQoNCj4gDQo+ID4gVGhl
IHNlY29uZCBwYXJhbWV0ZXIgb2YgJ2VtYzIzMDVfcHJvYmUnIGlzIGFjdHVhbGx5IHVzZWxlc3Ms
IGl0IGlzDQo+ID4gbW9yZSBhcHByb3ByaWF0ZSB0byB1c2UgJ3Byb2JlX25ldycgaW5zdGVhZCBv
ZiAncHJvYmUnIGhlcmUuDQo+ID4NCj4gDQo+IFRoaXMgd291bGQgYmUgYSBzZWNvbmQgcGF0Y2gu
IEJlc2lkZXMsIHRoaXMgY2hhbmdlIGlzIGFscmVhZHkgcXVldWVkIGluDQo+IGh3bW9uLW5leHQg
Zm9yIHY2LjIuDQo+IA0KPiBHdWVudGVyDQo+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IFhpbmdqaWFu
ZyBRaWFvIDxuYW5wdXl1ZUBnbWFpbC5jb20+DQo+ID4gLS0tDQo+ID4gICBkcml2ZXJzL2h3bW9u
L2VtYzIzMDUuYyB8IDU4ICsrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
DQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygrKSwgMzkgZGVsZXRpb25zKC0p
DQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9od21vbi9lbWMyMzA1LmMgYi9kcml2ZXJz
L2h3bW9uL2VtYzIzMDUuYyBpbmRleA0KPiA+IGFhMWYyNWFkZDBiNi4uNGRmODQwNjVjYmZiIDEw
MDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvaHdtb24vZW1jMjMwNS5jDQo+ID4gKysrIGIvZHJpdmVy
cy9od21vbi9lbWMyMzA1LmMNCj4gPiBAQCAtMjEsOSArMjEsNyBAQCBlbWMyMzA1X25vcm1hbF9p
MmNbXSA9IHsgMHgyNywgMHgyYywgMHgyZCwgMHgyZSwgMHgyZiwNCj4gMHg0YywgMHg0ZCwgSTJD
X0NMSUVOVF9FTg0KPiA+ICAgI2RlZmluZSBFTUMyMzA1X0ZBTl9NQVgJCQkweGZmDQo+ID4gICAj
ZGVmaW5lIEVNQzIzMDVfRkFOX01JTgkJCTB4MDANCj4gPiAgICNkZWZpbmUgRU1DMjMwNV9GQU5f
TUFYX1NUQVRFCQkxMA0KPiA+IC0jZGVmaW5lIEVNQzIzMDVfREVWSUNFCQkJMHgzNA0KPiA+ICAg
I2RlZmluZSBFTUMyMzA1X1ZFTkRPUgkJCTB4NWQNCj4gPiAtI2RlZmluZSBFTUMyMzA1X1JFR19Q
Uk9EVUNUX0lECQkweGZkDQo+ID4gICAjZGVmaW5lIEVNQzIzMDVfVEFDSF9SRUdTX1VOVVNFX0JJ
VFMJMw0KPiA+ICAgI2RlZmluZSBFTUMyMzA1X1RBQ0hfQ05UX01VTFRJUExJRVIJMHgwMg0KPiA+
ICAgI2RlZmluZSBFTUMyMzA1X1RBQ0hfUkFOR0VfTUlOCQk0ODANCj4gPiBAQCAtNDg4LDQzICs0
ODYsMTQgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBod21vbl9jaGlwX2luZm8NCj4gZW1jMjMwNV9j
aGlwX2luZm8gPSB7DQo+ID4gICAJLmluZm8gPSBlbWMyMzA1X2luZm8sDQo+ID4gICB9Ow0KPiA+
DQo+ID4gLXN0YXRpYyBpbnQgZW1jMjMwNV9pZGVudGlmeShzdHJ1Y3QgZGV2aWNlICpkZXYpIC17
DQo+ID4gLQlzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50ID0gdG9faTJjX2NsaWVudChkZXYpOw0K
PiA+IC0Jc3RydWN0IGVtYzIzMDVfZGF0YSAqZGF0YSA9IGkyY19nZXRfY2xpZW50ZGF0YShjbGll
bnQpOw0KPiA+IC0JaW50IHJldDsNCj4gPiAtDQo+ID4gLQlyZXQgPSBpMmNfc21idXNfcmVhZF9i
eXRlX2RhdGEoY2xpZW50LA0KPiBFTUMyMzA1X1JFR19QUk9EVUNUX0lEKTsNCj4gPiAtCWlmIChy
ZXQgPCAwKQ0KPiA+IC0JCXJldHVybiByZXQ7DQo+ID4gLQ0KPiA+IC0Jc3dpdGNoIChyZXQpIHsN
Cj4gPiAtCWNhc2UgRU1DMjMwNToNCj4gPiAtCQlkYXRhLT5wd21fbnVtID0gNTsNCj4gPiAtCQli
cmVhazsNCj4gPiAtCWNhc2UgRU1DMjMwMzoNCj4gPiAtCQlkYXRhLT5wd21fbnVtID0gMzsNCj4g
PiAtCQlicmVhazsNCj4gPiAtCWNhc2UgRU1DMjMwMjoNCj4gPiAtCQlkYXRhLT5wd21fbnVtID0g
MjsNCj4gPiAtCQlicmVhazsNCj4gPiAtCWNhc2UgRU1DMjMwMToNCj4gPiAtCQlkYXRhLT5wd21f
bnVtID0gMTsNCj4gPiAtCQlicmVhazsNCj4gPiAtCWRlZmF1bHQ6DQo+ID4gLQkJcmV0dXJuIC1F
Tk9ERVY7DQo+ID4gLQl9DQo+ID4gLQ0KPiA+IC0JcmV0dXJuIDA7DQo+ID4gLX0NCj4gPiAtDQo+
ID4gLXN0YXRpYyBpbnQgZW1jMjMwNV9wcm9iZShzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50LCBj
b25zdCBzdHJ1Y3QNCj4gPiBpMmNfZGV2aWNlX2lkICppZCkNCj4gPiArc3RhdGljIGludCBlbWMy
MzA1X3Byb2JlKHN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQpDQo+ID4gICB7DQo+ID4gICAJc3Ry
dWN0IGkyY19hZGFwdGVyICphZGFwdGVyID0gY2xpZW50LT5hZGFwdGVyOw0KPiA+ICAgCXN0cnVj
dCBkZXZpY2UgKmRldiA9ICZjbGllbnQtPmRldjsNCj4gPiAgIAlzdHJ1Y3QgZW1jMjMwNV9kYXRh
ICpkYXRhOw0KPiA+ICAgCXN0cnVjdCBlbWMyMzA1X3BsYXRmb3JtX2RhdGEgKnBkYXRhOw0KPiA+
ICAgCWludCB2ZW5kb3IsIGRldmljZTsNCj4gPiArCWludCBwd21fbnVtOw0KPiA+ICAgCWludCBy
ZXQ7DQo+ID4gICAJaW50IGk7DQo+ID4NCj4gPiBAQCAtNTM2LDIwICs1MDUsMzEgQEAgc3RhdGlj
IGludCBlbWMyMzA1X3Byb2JlKHN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQsDQo+IGNvbnN0IHN0
cnVjdCBpMmNfZGV2aWNlX2lkICoNCj4gPiAgIAkJcmV0dXJuIC1FTk9ERVY7DQo+ID4NCj4gPiAg
IAlkZXZpY2UgPSBpMmNfc21idXNfcmVhZF9ieXRlX2RhdGEoY2xpZW50LCBFTUMyMzA1X1JFR19E
RVZJQ0UpOw0KPiA+IC0JaWYgKGRldmljZSAhPSBFTUMyMzA1X0RFVklDRSkNCj4gPiArCXN3aXRj
aCAoZGV2aWNlKSB7DQo+ID4gKwljYXNlIEVNQzIzMDU6DQo+ID4gKwkJcHdtX251bSA9IDU7DQo+
ID4gKwkJYnJlYWs7DQo+ID4gKwljYXNlIEVNQzIzMDM6DQo+ID4gKwkJcHdtX251bSA9IDM7DQo+
ID4gKwkJYnJlYWs7DQo+ID4gKwljYXNlIEVNQzIzMDI6DQo+ID4gKwkJcHdtX251bSA9IDI7DQo+
ID4gKwkJYnJlYWs7DQo+ID4gKwljYXNlIEVNQzIzMDE6DQo+ID4gKwkJcHdtX251bSA9IDE7DQo+
ID4gKwkJYnJlYWs7DQo+ID4gKwlkZWZhdWx0Og0KPiA+ICAgCQlyZXR1cm4gLUVOT0RFVjsNCj4g
PiArCX0NCj4gPg0KPiA+ICAgCWRhdGEgPSBkZXZtX2t6YWxsb2MoZGV2LCBzaXplb2YoKmRhdGEp
LCBHRlBfS0VSTkVMKTsNCj4gPiAgIAlpZiAoIWRhdGEpDQo+ID4gICAJCXJldHVybiAtRU5PTUVN
Ow0KPiA+DQo+ID4gICAJaTJjX3NldF9jbGllbnRkYXRhKGNsaWVudCwgZGF0YSk7DQo+ID4gKwlk
YXRhLT5wd21fbnVtID0gcHdtX251bTsNCj4gPiAgIAlkYXRhLT5jbGllbnQgPSBjbGllbnQ7DQo+
ID4NCj4gPiAtCXJldCA9IGVtYzIzMDVfaWRlbnRpZnkoZGV2KTsNCj4gPiAtCWlmIChyZXQpDQo+
ID4gLQkJcmV0dXJuIHJldDsNCj4gPiAtDQo+ID4gICAJcGRhdGEgPSBkZXZfZ2V0X3BsYXRkYXRh
KCZjbGllbnQtPmRldik7DQo+ID4gICAJaWYgKHBkYXRhKSB7DQo+ID4gICAJCWlmICghcGRhdGEt
Pm1heF9zdGF0ZSB8fCBwZGF0YS0+bWF4X3N0YXRlID4NCj4gRU1DMjMwNV9GQU5fTUFYX1NUQVRF
KQ0KPiA+IEBAIC02MDQsMTAgKzU4NCwxMCBAQCBzdGF0aWMgdm9pZCBlbWMyMzA1X3JlbW92ZShz
dHJ1Y3QgaTJjX2NsaWVudA0KPiA+ICpjbGllbnQpDQo+ID4NCj4gPiAgIHN0YXRpYyBzdHJ1Y3Qg
aTJjX2RyaXZlciBlbWMyMzA1X2RyaXZlciA9IHsNCj4gPiAgIAkuY2xhc3MgID0gSTJDX0NMQVNT
X0hXTU9OLA0KPiA+ICsJLnByb2JlX25ldyA9IGVtYzIzMDVfcHJvYmUsDQo+ID4gICAJLmRyaXZl
ciA9IHsNCj4gPiAgIAkJLm5hbWUgPSAiZW1jMjMwNSIsDQo+ID4gICAJfSwNCj4gPiAtCS5wcm9i
ZSAgICA9IGVtYzIzMDVfcHJvYmUsDQo+ID4gICAJLnJlbW92ZQkgID0gZW1jMjMwNV9yZW1vdmUs
DQo+ID4gICAJLmlkX3RhYmxlID0gZW1jMjMwNV9pZHMsDQo+ID4gICAJLmFkZHJlc3NfbGlzdCA9
IGVtYzIzMDVfbm9ybWFsX2kyYywNCg0K
