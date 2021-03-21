Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A64CC433DB
	for <linux-hwmon@archiver.kernel.org>; Sun, 21 Mar 2021 16:24:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6178161934
	for <linux-hwmon@archiver.kernel.org>; Sun, 21 Mar 2021 16:24:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229904AbhCUQX6 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 21 Mar 2021 12:23:58 -0400
Received: from mail-eopbgr750057.outbound.protection.outlook.com ([40.107.75.57]:21767
        "EHLO NAM02-BL2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229903AbhCUQX2 (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 21 Mar 2021 12:23:28 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fR3BRpxxvDX3TCjbq8NLWsUobvvq2d62PlB97TsK3bcVdhDlz2Jc4nEs07GReqXB4QYzlvQx3oh9hpDKcjVZBFaQ45qfRL3yS5NhSX2e5Xpkxvw7j+zhstLCnTd2RZsXmhuFndc5cqD//0JPhwXO7v5ebEhw85TggQJZM7/77992D/G5ObSIt3VJhnf8sCNSzEoyVwEjwdlItMOSJ8k9pkqEVmRHcCNO8J6EmAEDMTObJXTRPgL0eVso9rGiZGZDp9oUE/wtxtpCRioOy8ql94nfDDfkNsUeGs2D6ZpVU+Td7qLcCWBZjEwfv6UwehfihTwr96BFSspk3EEuOzOV9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lJ6fRmK42KEHKS3WIMBdXTgqXQoz5JkXofOj7oQKJxQ=;
 b=ns/oKI9uwwaeBP7OWMpBu5BrYMFXUzUfc0ZIvFZvNVfpvmtu5zscZWTd9tVKYZiAWCpzNuCj4SOr1n2rwXjzQQ6i6TBOEQqi9y2pr8J8xt/C2fHJ4dlGL7sMRZPyJuWrpnU6TE5qsC6mhnR8vYiwy5aL9zDAcVd9nMOV87EFKUb7NQXHP0l6Z9cLkzUffzWJXRRKPcbQS6WWqWW59j/upfQe814bVZh+ndmGVGaojpANz657iUoMEQrQ1WjKjhSJmjzzRKOqpjnwAoYgFcvOuJvwv5pJ4raLIhU0IS8nfvLpP9Y5oCPdHje0wKu6fy01CLpbh1EaSsAj930dzkTGuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lJ6fRmK42KEHKS3WIMBdXTgqXQoz5JkXofOj7oQKJxQ=;
 b=bSMolnTCGcKFSCO9GJJ9Mvhm+OOgVWKuGgTJ5u1Vwcqu97D0DeH9GeMsDG3B4s6m8QClF3/zuangaS8bchDt8GyLrGAaFphE+z690MZekj3lLrmCPpuFhL9CeohMHs6oTjsMnD3+05SZNELELPVTNuOqY5f4qSyAgCLEihH/3VK8zjt2tBH3QlhxtFrqwdr40B1HGhLhneWMbKe+AY31GPNxp71/yI7yqKV99dpdCJ29E0vB6O1AOsmHMz6jWkp6JJ76ir0JPzgidD77x1W30z5cY10cNfI+W2yNz3M71E06GGeM80jmoFc1ccU5F9uzPJR/z3WYogMZs+tgUTJy+Q==
Received: from DM6PR12MB3898.namprd12.prod.outlook.com (2603:10b6:5:1c6::18)
 by DM5PR12MB1500.namprd12.prod.outlook.com (2603:10b6:4:11::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18; Sun, 21 Mar 2021 16:23:26 +0000
Received: from DM6PR12MB3898.namprd12.prod.outlook.com
 ([fe80::ddbf:58cc:edc6:7c6a]) by DM6PR12MB3898.namprd12.prod.outlook.com
 ([fe80::ddbf:58cc:edc6:7c6a%3]) with mapi id 15.20.3955.025; Sun, 21 Mar 2021
 16:23:26 +0000
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     Guenter Roeck <linux@roeck-us.net>
CC:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: RE: [Re-send PATCH hwmon-next v2 1/1] hwmon: (mlxreg-fan) Add support
 for fan drawers capability and present registers
Thread-Topic: [Re-send PATCH hwmon-next v2 1/1] hwmon: (mlxreg-fan) Add
 support for fan drawers capability and present registers
Thread-Index: AQHXGlxaEareZbbfU0ij/t2F6kk5M6qL2v4AgAJbL5CAAG8nAIAAAe2w
Date:   Sun, 21 Mar 2021 16:23:26 +0000
Message-ID: <DM6PR12MB3898FDC836258334669D61BCAF669@DM6PR12MB3898.namprd12.prod.outlook.com>
References: <20210316120239.1834485-1-vadimp@nvidia.com>
 <27c1929b-f817-8cc2-3947-5e7314f8b538@roeck-us.net>
 <DM6PR12MB3898FF4C290461A661859810AF669@DM6PR12MB3898.namprd12.prod.outlook.com>
 <35416886-eb25-c956-d56c-3f4c3ce02e40@roeck-us.net>
In-Reply-To: <35416886-eb25-c956-d56c-3f4c3ce02e40@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=nvidia.com;
x-originating-ip: [46.117.169.201]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f88e87da-4018-4797-2f42-08d8ec85a82d
x-ms-traffictypediagnostic: DM5PR12MB1500:
x-microsoft-antispam-prvs: <DM5PR12MB150056E45F4059B5EA43DFAEAF669@DM5PR12MB1500.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XeSwKAkQ0mtdXeSHDi/J8ELak07WvJ2LePA1Yzw8oJLHROt/xmd/iF1s0xz+gei0ktuWodX9/CUbe4l77WYM1WppVtesACXON2cJKSg8nBUuB9BIOm4EE/paZQwMXrjBiFXbpdAwtZco3Fpih2mxxuvazlpWfOaVJO7khSipv46jXOFt10o3X15EMw9USJ8pZb9V4o1SWgalrci2Moi+BEA4tqCzuVhMkkdD8/yypwfJp9R78OMEktQCwAMoP60c/ssd+owz9lB0A9TaTlVAoTnf6f9DXBBraV3CwscZSET20bik8VODQvRMjgusM+9Mzb7QfwuuVD0XYKGDwBxXxt80G230xfNn+2BeR9EgcDOivX0iFuDcOJuIrrEZn7hlLYcpsd6B78Y8uRwqrdeLrSOzVIVmIBciCcU7qN/7v5t+dVgzrKkKe1YUH0S+iP2/Per59aBmOebgvvXQ4J7vdwxuY2bJFGtyfVFGq4JejpXgKHQ4kmqlzh8k76/+aJf55Ow2SdihFNXMihT5ld7c9xJJFD0uoPMky/58WBAQFMXOgLpJ6/Qh9tzfDaFcZCQDSsTbKyD0VGRtwMm5rZwP8sMftpBa5+Mf7A5WlAFkXLW03UpYldsKHdpg/3WwkUyR+X+6JX3qNNcQzphMTK2u7mRP8MMcbg/SO4fd8kmR3xQE2erOBbYpACmrcmD7GmjFq3TBeg2gJnxgZfEGp67ouA5DbumPvZEk5xyTfyL5GD8=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB3898.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(376002)(366004)(346002)(39860400002)(71200400001)(83380400001)(33656002)(66476007)(76116006)(53546011)(52536014)(5660300002)(66556008)(64756008)(38100700001)(6506007)(7696005)(316002)(66446008)(66946007)(86362001)(478600001)(966005)(2906002)(186003)(26005)(9686003)(55016002)(6916009)(4326008)(8936002)(8676002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?ODhoR1NKZW9wR0luTFNsYmVjdVI0K0ZlK0x4a2pjQzgrbHdVaTY5S3BKdloy?=
 =?utf-8?B?aEZVNjRXWWpsRU42VXZQY1lSN0dSMGZ2Nkg2U3Fpci9UekJOZjIwVmJLVkc5?=
 =?utf-8?B?NWNuaHFpc0s0ZXVvUVB5U0NBNENGV1ZzbHdPbzZuTEtOTEFyRFh3N2Jwazky?=
 =?utf-8?B?Z3RiU05nN0Vkbkpsb216SGJHdHM4NG9FaGdYWm1tUXFKNDA5L0xTeHRVR25R?=
 =?utf-8?B?MTdPQnV6OEVKV2lINTVTOWNqclRVSWZOVVo2dUxYajVaeENVeVBGd0Y4TVI5?=
 =?utf-8?B?TTZKNEkwMm9YT1F5a25KVnpTYmJSTzBkQ3EzTUlHUlJsdVM5clQydVFqRzR1?=
 =?utf-8?B?L0c0L1V5aWxZeHJTbzVaTS9CTEhuZW8rRERob3VnRWc2R0xvaVA0ZUErTUYr?=
 =?utf-8?B?NDljYUd4YTdwMEJleXFMR2g4dWNmS0k3bG9YODNPVzRzanlPR2hqSU5TdnVq?=
 =?utf-8?B?bDhBQnp6Q2MwdEMwWlBNclFQOThWb3pDVnZsdm9qdFlsSjBXaUlUSmxiUXo0?=
 =?utf-8?B?QlpnYlU5TUJVYTBlQjFlb3RTcHBzdUgrZ0czWklYU3dtYVpOdmptOWQ1dlVX?=
 =?utf-8?B?QWtTeTJ2UGh3YlhyMG5DWkx0WDFFM1RyY1lSWktvNkM3REl4NEJqNTVQdlVw?=
 =?utf-8?B?T0RNbXE3aEU2WUlRL2pVczJZVjk0ejJLUEhzalFBMWlNOG5GcWIwd3Bza2s1?=
 =?utf-8?B?ZUUzb3RVSzhqMTViMHJ0NE9SajBGaVV5M0R1RVlVaXIzTkx1aFlRdmpoa3do?=
 =?utf-8?B?UEFNQTRFZWhrUWJCYXErK01oa21MMkV1NTBIeXFnTkttSDRHNFUrZUJ3ZTQy?=
 =?utf-8?B?d0l0Y2hpeTk2S1RwRitndWZ4ZlRwcXEyQXNCVjJaZXVBa2V2YzJFS3B0Q1hW?=
 =?utf-8?B?VlJlTW1ibi84ZzQwbXZSMFp6TEhMVzMzZUs5L1JkL1BoMkc0UUZnYzZmVFk5?=
 =?utf-8?B?N2EzcE5kUGt0UHV6T1pRUGJiY3Y0a3dnWmMvQ3BIeGxKT0ZVUTNnR2MrSEZJ?=
 =?utf-8?B?UUZSb0QxWDB5eFo3dlRyMWJsUnpnbzNYblYveXBoQU12dmZqTkYySExWd3U0?=
 =?utf-8?B?dmswNmcyaTdvMVJGMXROQk5PdE5jZGRSaFQ5bktKSTdxSHJQZ2VDLzc3M09J?=
 =?utf-8?B?Uy96R2xxVnRKVWF1cjBjaEVvQU96MWNTOEtYK0tIWTFFcG1WdEdkQy94OUsz?=
 =?utf-8?B?WVhiWWJaTFFldWFQaVhna2c5MGtTbEY5SllONWZnNXpUSzRsenIwK1R6SGlE?=
 =?utf-8?B?ZU9EVEg3SDl0S2NRTUltbUdIdDVjbW53L2g1N2phQ28rSFZHZHZmbjMyVlo0?=
 =?utf-8?B?M3VnK1Z4UkJaOXk5SUxpMk1XR1FVKzlPT2IvWUlnYjZwRHRkYzZSbWVLblRw?=
 =?utf-8?B?K1A5dkdva0gvUmVCVjZDaFZWRTVGVjhzUHVnbE10OWZ4MWV1QkxLUGpScFB6?=
 =?utf-8?B?c1RzRmM1dmFQNDNNTDZ3SmlVRE5ic2tZbDZzNWEyQ1JRSC96WElKb1BXOUlN?=
 =?utf-8?B?Y0hodWZTbzVXK25SSTNmczlDZVNOUDVaRjVDZDNLaFZYRjNVWGMvMkQzaXhu?=
 =?utf-8?B?aENoWWxxSWQzeWRNdUVmQ0xETFVqWDFKTkJkdFFwK0hpKzJtMThiaENBUE5l?=
 =?utf-8?B?TlM2YWEvU1RSVjdteWpDdXhYUUY1NTBqeEpVQzEyOCtPc1lBYnRFS2dFbFVC?=
 =?utf-8?B?TVE0a00zaDIxRTUxQjZuUndDckorTXBPYWxJWjQwdFM0SlVCTDNtOVpZck1C?=
 =?utf-8?Q?d/IvOdu6iq8RjocRQ8r+t1K94KpdOlE8+1TFpdD?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3898.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f88e87da-4018-4797-2f42-08d8ec85a82d
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Mar 2021 16:23:26.7865
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OEWl532wOM5jnc/O0dErR3Juf+NajdAgBFRb3Vv0yraEGpMnaJ6qzvWVLK7nlzzKr1ZdCVkJLezAEae+aok2dA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1500
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR3VlbnRlciBSb2VjayA8
Z3JvZWNrN0BnbWFpbC5jb20+IE9uIEJlaGFsZiBPZiBHdWVudGVyIFJvZWNrDQo+IFNlbnQ6IFN1
bmRheSwgTWFyY2ggMjEsIDIwMjEgNjoxMyBQTQ0KPiBUbzogVmFkaW0gUGFzdGVybmFrIDx2YWRp
bXBAbnZpZGlhLmNvbT4NCj4gQ2M6IGxpbnV4LWh3bW9uQHZnZXIua2VybmVsLm9yZw0KPiBTdWJq
ZWN0OiBSZTogW1JlLXNlbmQgUEFUQ0ggaHdtb24tbmV4dCB2MiAxLzFdIGh3bW9uOiAobWx4cmVn
LWZhbikgQWRkDQo+IHN1cHBvcnQgZm9yIGZhbiBkcmF3ZXJzIGNhcGFiaWxpdHkgYW5kIHByZXNl
bnQgcmVnaXN0ZXJzDQo+IA0KPiBPbiAzLzIxLzIxIDI6MzkgQU0sIFZhZGltIFBhc3Rlcm5hayB3
cm90ZToNCj4gPg0KPiA+DQo+ID4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+IEZy
b206IEd1ZW50ZXIgUm9lY2sgPGdyb2VjazdAZ21haWwuY29tPiBPbiBCZWhhbGYgT2YgR3VlbnRl
ciBSb2Vjaw0KPiA+PiBTZW50OiBGcmlkYXksIE1hcmNoIDE5LCAyMDIxIDExOjM2IFBNDQo+ID4+
IFRvOiBWYWRpbSBQYXN0ZXJuYWsgPHZhZGltcEBudmlkaWEuY29tPg0KPiA+PiBDYzogbGludXgt
aHdtb25Admdlci5rZXJuZWwub3JnDQo+ID4+IFN1YmplY3Q6IFJlOiBbUmUtc2VuZCBQQVRDSCBo
d21vbi1uZXh0IHYyIDEvMV0gaHdtb246IChtbHhyZWctZmFuKQ0KPiA+PiBBZGQgc3VwcG9ydCBm
b3IgZmFuIGRyYXdlcnMgY2FwYWJpbGl0eSBhbmQgcHJlc2VudCByZWdpc3RlcnMNCj4gPj4NCj4g
Pj4gT24gMy8xNi8yMSA1OjAyIEFNLCBWYWRpbSBQYXN0ZXJuYWsgd3JvdGU6DQo+ID4+PiBBZGQg
c3VwcG9ydCBmb3IgZmFuIGRyYXdlcidzIGNhcGFiaWxpdHkgYW5kIHByZXNlbnQgcmVnaXN0ZXJz
IGluDQo+ID4+PiBvcmRlciB0byBzZXQgbWFwcGluZyBiZXR3ZWVuIHRoZSBmYW4gZHJhd2VycyBh
bmQgdGFjaG9tZXRlcnMuIFNvbWUNCj4gPj4+IHN5c3RlbXMgYXJlIGVxdWlwcGVkIHdpdGggZmFu
IGRyYXdlcnMgd2l0aCBvbmUgdGFjaG9tZXRlciBpbnNpZGUuDQo+ID4+PiBPdGhlcnMgd2l0aCBm
YW4gZHJhd2VycyB3aXRoIHNldmVyYWwgdGFjaG9tZXRlcnMgaW5zaWRlLiBVc2luZw0KPiA+Pj4g
cHJlc2VudCByZWdpc3RlciBhbG9uZyB3aXRoIHRhY2hvbWV0ZXItdG8tZHJhd2VyIG1hcHBpbmcg
YWxsb3dzIHRvDQo+ID4+PiBza2lwIHJlYWRpbmcgbWlzc2VkIHRhY2hvbWV0ZXJzIGFuZCBleHBv
c2UgaW5wdXQgZm9yIHRoZW0gYXMgemVybywNCj4gPj4+IGluc3RlYWQgb2YgZXhwb3NpbmcgZmF1
bHQgY29kZSByZXR1cm5lZCBieSBoYXJkd2FyZS4NCj4gPj4+DQo+ID4+PiBTaWduZWQtb2ZmLWJ5
OiBWYWRpbSBQYXN0ZXJuYWsgPHZhZGltcEBudmlkaWEuY29tPg0KPiA+Pg0KPiA+PiBJIGhhZCBh
c2tlZCBmb3IgYSBudW1iZXIgb2YgY2hhbmdlcyB0byB2Mi4gUmVzZW5kaW5nIHYyIHdpdGhvdXQN
Cj4gPj4gYWRkcmVzc2luZyBhbnl0aGluZyBpc24ndCByZWFsbHkgaGVscGZ1bC4NCj4gPg0KPiA+
IEhpIEd1ZW50ZXIsDQo+ID4NCj4gPiBJIGFtIHNvcnJ5LCBJIG1pc3NlZCB0aGUgY2hhbmdlIHJl
bGF0ZWQgdG8geW91ciBjb21tZW50Og0KPiA+ICJUaGUgb3V0ZXIgZG91YmxlICgoICkpIGlzIHBv
aW50bGVzcy4iLg0KPiA+IEknbGwgZml4IGl0Lg0KPiA+DQo+ID4gSSB0aGluayBJIGhhbmRsZWQg
eW91ciBvdGhlciBjb21tZW50cyBvciBJIGFtIHdyb25nPw0KPiA+DQo+IA0KPiBOb25lIG9mIHRo
ZSBjb21tZW50cyBJIHNlbnQgYXMgcmVzcG9uc2UgdG8gdGhlIG9yaWdpbmFsIHYyIGhhdmUgYmVl
bg0KPiBhZGRyZXNzZWQuDQo+IA0KPiA+IFNob3VsZCBJIHNlbmQgcGF0Y2ggYXMgdjMgb3IgYXMg
djI/DQo+ID4NCj4gQW55IGNoYW5nZSByZXF1aXJlcyBhIG5ldyB2ZXJzaW9uLg0KDQpBaCwgSSB1
bmRlcnN0b29kIG5vdy4NCkZyb20gc29tZSByZWFzb24gSSBkaWRuJ3QgZ2V0IHlvdXIgY29tbWVu
dHMgZm9yIHYyIHRvIG15DQptYWlsIGJveCBhbmQgSSB0aG91Z2h0IGl0IHdhcyBqdXN0IG1pc3Nl
ZC4NCg0KTm93LCBJIGZvdW5kIHlvdSByZXZpZXcgYXQ6DQpodHRwczovL3d3dy5zcGluaWNzLm5l
dC9saXN0cy9saW51eC1od21vbi9tc2cxMDE5NS5odG1sDQoNCkknbGwgZ28gb3ZlciB5b3VyIGNv
bW1lbnRzIGFuZCBwcmVwYXJlIHYzLg0KVmVyeSBzb3JyeS4NCg0KVGhhbmtzLA0KVmFkaW0uDQoN
Cj4gDQo+IEd1ZW50ZXINCj4gDQo+ID4gVGhhbmtzLA0KPiA+IFZhZGltLg0KPiA+DQo+ID4+DQo+
ID4+IEd1ZW50ZXINCg0K
