Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2F74C4361B
	for <linux-hwmon@archiver.kernel.org>; Wed,  9 Dec 2020 15:29:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 968CC23AC4
	for <linux-hwmon@archiver.kernel.org>; Wed,  9 Dec 2020 15:29:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730205AbgLIP3N (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 9 Dec 2020 10:29:13 -0500
Received: from mail-mw2nam10on2089.outbound.protection.outlook.com ([40.107.94.89]:31314
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730161AbgLIP3M (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 9 Dec 2020 10:29:12 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IwT7Km3HRLT7o17B0hVDSv6nLFXGB8c8wySAKK+1Olpv+znQYBQhJkDjsw4ujCLI6ZJpC7/jV6yjqYIB3wHkpS7+Ob0gASakoR6Q9t8WFrUU0T9mJ4gH0Xs1tep4x/+y9H71sqJSGuyEGoyNQo9yTLk4PYoV1cSGvR76wCC7kZ12WaewCooU1ZJLuVuOriMN6GmZbk9ASEZbAvA/uKXNLEVeyqzVyZZ7hD3+7SE6KBvsvN9BAP0tYoa/EVqsXVyqbxut5DRrZm3jsBP5lgkLZ0ZrRIfEKWXiHizpUP2vNhZbZIgxv8gfIoWxi8mJEWwVZy4Tsd7IF4AxJDmcpwmcEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vw16Jmp7LbjtUUwwpUjhVUz+9fkYuP9RUoG/I0CObWU=;
 b=mhhN/FxKbCOnPykE2IsqyesUjgI0zu+E1dqMr4/1IRXeHXf1DGU926vsjYdG2INzHQFoxE1vhAlrxxXnmionOf6WV8cQZnleV0mo8vr6QFsgi2PokFNUafEsikLKD0lYgw5+djpYzKe77HzzqoGtZ4hFBbd4D+MERo3QonbyFOmLTRa9PiUziwp5UBZIqVzaq07rK8ij5CzyoXgFqNwbspvOy/cBP4nG3NUDoNJOVYz1J14D/2A4aDv90udeBliWrQoN9s/GD6GMS65yeZGmchk7s1i2o1XmOEWYZFxy+PDnfP7WfzxJI+udWBgUUz8QWMidnISexc6qclMrgohfAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vw16Jmp7LbjtUUwwpUjhVUz+9fkYuP9RUoG/I0CObWU=;
 b=o42M4DzK9CN+4qeOPmhXIOJYMNNv0RUhyxLqUCPWm8Z5fM2QOeg9oIr+10Fh8XB5HV6XMygqkSG+9YQNAdsTUVj7u+QVmhKdo1BseRc4vQCkHKt8Ps7CQgVOuD0LM7JjM26Z0TDE1ilj8ALjJKmhd7D9c50zlvhT5MfBdwIg5dw=
Received: from DM6PR12MB4388.namprd12.prod.outlook.com (2603:10b6:5:2a9::10)
 by DM6PR12MB4267.namprd12.prod.outlook.com (2603:10b6:5:21e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20; Wed, 9 Dec
 2020 15:28:19 +0000
Received: from DM6PR12MB4388.namprd12.prod.outlook.com
 ([fe80::84e9:dd44:12cf:bdb3]) by DM6PR12MB4388.namprd12.prod.outlook.com
 ([fe80::84e9:dd44:12cf:bdb3%4]) with mapi id 15.20.3654.013; Wed, 9 Dec 2020
 15:28:19 +0000
From:   "Chatradhi, Naveen Krishna" <NaveenKrishna.Chatradhi@amd.com>
To:     Sandeep <sandy.8925@gmail.com>
CC:     Guenter Roeck <linux@roeck-us.net>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: RE: [PATCH] Add support for Zen 2 CPUs to amd_energy driver
Thread-Topic: [PATCH] Add support for Zen 2 CPUs to amd_energy driver
Thread-Index: AQHWzZ/GO5Lm98z6j0KVRyvWw2SpBKntqZ+AgACuc4CAAILVAIAAAofw
Date:   Wed, 9 Dec 2020 15:28:19 +0000
Message-ID: <DM6PR12MB438881D1D0F87627E78310C7E8CC0@DM6PR12MB4388.namprd12.prod.outlook.com>
References: <a14b8be6-e8b4-c658-2cd6-a2f280be0f99@gmail.com>
 <20201208204059.GA73427@roeck-us.net>
 <DM6PR12MB4388D95FCC7AD13E3E6AE26FE8CC0@DM6PR12MB4388.namprd12.prod.outlook.com>
 <CAGPDPzDC4zqoeR9dctNfmHv21uB4+NQ5ij7WfeOa2ueT0DY1zw@mail.gmail.com>
In-Reply-To: <CAGPDPzDC4zqoeR9dctNfmHv21uB4+NQ5ij7WfeOa2ueT0DY1zw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_c3918902-4ff3-42f6-8eb5-e5d9c71daf16_Enabled=true;
 MSIP_Label_c3918902-4ff3-42f6-8eb5-e5d9c71daf16_SetDate=2020-12-09T15:02:55Z;
 MSIP_Label_c3918902-4ff3-42f6-8eb5-e5d9c71daf16_Method=Privileged;
 MSIP_Label_c3918902-4ff3-42f6-8eb5-e5d9c71daf16_Name=Internal Use Only -
 Restricted;
 MSIP_Label_c3918902-4ff3-42f6-8eb5-e5d9c71daf16_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_c3918902-4ff3-42f6-8eb5-e5d9c71daf16_ActionId=366a16bf-01a6-4ff1-b97e-0000653d4725;
 MSIP_Label_c3918902-4ff3-42f6-8eb5-e5d9c71daf16_ContentBits=1
msip_label_c3918902-4ff3-42f6-8eb5-e5d9c71daf16_enabled: true
msip_label_c3918902-4ff3-42f6-8eb5-e5d9c71daf16_setdate: 2020-12-09T15:28:16Z
msip_label_c3918902-4ff3-42f6-8eb5-e5d9c71daf16_method: Privileged
msip_label_c3918902-4ff3-42f6-8eb5-e5d9c71daf16_name: Internal Use Only -
 Restricted
msip_label_c3918902-4ff3-42f6-8eb5-e5d9c71daf16_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_c3918902-4ff3-42f6-8eb5-e5d9c71daf16_actionid: 0680d31e-2065-4323-b3f2-00000bb206be
msip_label_c3918902-4ff3-42f6-8eb5-e5d9c71daf16_contentbits: 0
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [175.101.104.2]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: ee82e768-6409-43a2-cbe0-08d89c570e86
x-ms-traffictypediagnostic: DM6PR12MB4267:
x-microsoft-antispam-prvs: <DM6PR12MB4267CA1034EF57E74A80377AE8CC0@DM6PR12MB4267.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KHBgGUmV5md58lLFnva6OIl3YPpo7+riq7W8R/qEKp0NnhdDd7/0i6+MT4j6UG/5zXGi6fRIQ0a3Ma66R8kVfP8nX10a2lkCMXrrLBfFlTIrzTDXqSOvuvgI69Qnf2bUulDTa4jmdRm9A/N9q1zkhK/b8WpLbZY2+NcgjVU0W9KYgoqrmX2JI8mxLuSAqaJ3ORObA5MLm7i1y1ajyn3GrCPVuKzzwXnpDxFpx26bxpAXf5IsLx6C87yST35VsbhpaG9VGQmsm4UTXTYN1P6bYguIVmClgJ4djzhDiKPYtNgpJ8+oEsisPZpS3Y7ghZCpUZB3pF+xlxR8SAQxsfxFVDgq6VsSVJ18j5Y/12RT1pgpinbRDPTib74oGGedOR0U4JRoM4IW0bYo0PWJaWBn3g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4388.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(366004)(346002)(53546011)(4326008)(52536014)(8936002)(6506007)(7696005)(5660300002)(55016002)(64756008)(76116006)(66446008)(66556008)(66476007)(6916009)(66946007)(86362001)(83380400001)(186003)(966005)(8676002)(2906002)(45080400002)(26005)(508600001)(33656002)(9686003)(54906003)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?enNLYzVtNkxFVXMzT3ljRzREVm9HQUI1eUxLZkY4MDNuYzBOVnA3SEpYeHMw?=
 =?utf-8?B?Qmlhd1dJUm1vODcxaERaaUJ5S1F1SGpnSVc3VXUrM0dQZCsxNThUUndGNStp?=
 =?utf-8?B?SGE3WVZKZlVLMURIcUlRbE1iNlZGOEpiLzROc2xLcjEwZDFwSE90TDBTS1oz?=
 =?utf-8?B?bC9IZ0ZabUpXcnY2NkxReWVJNDgrY1d5UXoyZFJFbHRIUHVnN1ZOamdNRzVT?=
 =?utf-8?B?VU5yUGVpWXNEWklCL08vUDYvaWJGMW8zaXo4dnpGOHNVaTRhL0pLaWxiNzNo?=
 =?utf-8?B?RHlmKzU1UGJWZ3hWVC84ODZMbm55QTFtaGZMRnhDZGFlT3o4YzFxemlKcFNO?=
 =?utf-8?B?VVBocDNaSEFkbStYZjVvMXZYVFlPcWhqZFNUZUlLemEzeFZsTVFMMDRNN2Nh?=
 =?utf-8?B?R0xqanpvb0xCNGpmR3JjY29ZY29tZU1KVGh4Z0djSTFVekRPSDNPdEF3V3Fx?=
 =?utf-8?B?Vy8yQ2FEVVl2QnEySERWNEhJbnd4bS9qVUFZK1R1M2JiU3pwSS9IRjIrSkEw?=
 =?utf-8?B?RjEvOFRZV0svWVJRSTBqUmRPcGh6SGE0MUlxOXFETGNSSHFoSjR2VmJscXV0?=
 =?utf-8?B?VlB0MVIwazFHMVFPYVQ3UXZDZWZHZFdTNHkwdUhWUFIyMjVRU2JjcmFVVGoz?=
 =?utf-8?B?bnRGK24vTEpxRE9zZ2NuR1diakVMcTJ0dE50bjdYMmZkUGkvMHhiblRlT0pq?=
 =?utf-8?B?dld0NWdSMWVmZnpVU2dKMmNTRXRVUGlOLy9XZU81b1RhYW5lVlEyS0VxdGRj?=
 =?utf-8?B?YUlPcnVJVXlVa1BkMXJVb0lwWmpJZG9CMU1ObDIzREhpcytZYUxCamJPK256?=
 =?utf-8?B?eWs2b24yblNIRSs3cnNhUlhLcjVqdUJvZG1GM2RBOWo1NHJzblN0SXVFNTVV?=
 =?utf-8?B?dFMxK0RDaTE1akh1VXJ2c3ppZzc1ZFdGUXg1UUM0OEZ6c2F5RUUrSndjZVZN?=
 =?utf-8?B?Tjk2SW15RFFXR052Zks0OTlzTk9IcTQ4RjhlRkVWMEFrQnFnek04dGZ4Lzdy?=
 =?utf-8?B?VWtVdUg3WHhpQlRsaWNraXc5amdZRVZFVE40QWd5bXA4MkZVWEc2TURvWlYr?=
 =?utf-8?B?YTF4em1HRjRZeHVrNmlrNUJwdGlXa0J3Z05hL2tncVNRWldYUzgrd3FuMkdN?=
 =?utf-8?B?VFEySGZjRlUwSWhHVW8wV1N1VFhQcEdpbFhVMFYybVFqUDhBL3FaUkEvNUlz?=
 =?utf-8?B?QWFCNVdmck5BeDQ3QTFnWlJVVC9nNk85YjRjU2lDQ0xMOEtnRmhKU3NpS1dW?=
 =?utf-8?B?bGVUdWNqS3hsbFVqY3RJRSt1MEJiYWlOczJ3VHBROXIxaFE5Zit4WDdLdE0x?=
 =?utf-8?Q?ax2iFrODp/LlI=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4388.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee82e768-6409-43a2-cbe0-08d89c570e86
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Dec 2020 15:28:19.2548
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VtEIo9n3/jw4RCYC+a4X6H3iKZZC+ynZAy4C8qYFnIyklKphET1yHZ4zhZjm3ePWUYdoajEfH1QqgDUDux5jyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4267
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEFwcHJvdmVkIGZvciBFeHRlcm5hbCBVc2VdDQoNCkhp
IFNhbmRlZXAsDQoNCj4+IFN1cmUsIEknbGwgcnVuIHRoYXQgdGVzdC4gSSBoYXZlIGEgMzkwMFgg
dGhvdWdoLCB3aGljaCBpcyAxMiBjb3JlLCBzbyBkbyBJIGhhdmUgdG8gYWRqdXN0IGFueXRoaW5n
IGZvciB0aGF0IENQVSwgb3IganVzdCBydW4gd2l0aCB0aGUgcGFyYW1ldGVycyB5b3UndmUgc3Bl
Y2lmaWVkPw0KDQpJJ20gdHJ5aW5nIHRvIGdldCBob2xkIG9mIGEgc3lzdGVtIHRvIHRlc3QgaXQg
bXlzZWxmLiBJbiB0aGUgbWVhbndoaWxlLCB5b3UgbWF5IHJ1biB0aGUgZm9sbG93aW5nIGNvbW1h
bmQNCmluIHRoZSBiYWNrIGdyb3VuZCBhbmQgcmVhZCB0aGUgY291bnRlcnMgKGNvcmVzIGFuZCBz
b2NrZXQpIGF0IDUgdG8gMTAgc2VjcyBhcGFydCBhbmQNCnN1bSBvZiB0aGUgZGlmZiBvZiBjb3Jl
IGNvdW50ZXJzIHNob3VsZCBiZSBub3QgYmUgPiBkaWZmIG9mIHNvY2tldCBjb3VudGVycw0KDQpz
dWRvIC4vYXZ4LXR1cmJvIC0taXRlcnMgMTAwMDAwMDAwMCAtLXNwZWMgYXZ4MjU2X2ZtYV90LzEy
DQoNCllvdSBtYXkgcmVmZXIgaHR0cHM6Ly93d3cuc3Bpbmljcy5uZXQvbGlzdHMvbGludXgtaHdt
b24vbXNnMDgyNTUuaHRtbCBsaW5rIGZvciBtb3JlIGJhY2tncm91bmQgb2YgdGhlIHRlc3Rpbmcu
DQoNClJlZ2FyZHMsDQpOYXZlZW5rDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9t
OiBTYW5kZWVwIDxzYW5keS44OTI1QGdtYWlsLmNvbT4gDQpTZW50OiBXZWRuZXNkYXksIERlY2Vt
YmVyIDksIDIwMjAgODoyNCBQTQ0KVG86IENoYXRyYWRoaSwgTmF2ZWVuIEtyaXNobmEgPE5hdmVl
bktyaXNobmEuQ2hhdHJhZGhpQGFtZC5jb20+DQpDYzogR3VlbnRlciBSb2VjayA8bGludXhAcm9l
Y2stdXMubmV0PjsgbGludXgtaHdtb25Admdlci5rZXJuZWwub3JnDQpTdWJqZWN0OiBSZTogW1BB
VENIXSBBZGQgc3VwcG9ydCBmb3IgWmVuIDIgQ1BVcyB0byBhbWRfZW5lcmd5IGRyaXZlcg0KDQpb
Q0FVVElPTjogRXh0ZXJuYWwgRW1haWxdDQoNCk9uIFdlZCwgOSBEZWMgMjAyMCBhdCAxNjozMywg
Q2hhdHJhZGhpLCBOYXZlZW4gS3Jpc2huYSA8TmF2ZWVuS3Jpc2huYS5DaGF0cmFkaGlAYW1kLmNv
bT4gd3JvdGU6DQo+DQo+IFtBTUQgT2ZmaWNpYWwgVXNlIE9ubHkgLSBBcHByb3ZlZCBmb3IgRXh0
ZXJuYWwgVXNlXQ0KPg0KPiBIaSBHdWVudGVyLA0KPg0KPiA+PiBUaGlzIHBhdGNoIHdpbGwgcmVx
dWlyZSBhbiBBY2sgZnJvbSBOYXZlZW47IHN1cHBvcnQgZm9yIHRoaXMgbW9kZWwgDQo+ID4+IHdh
cyBwcmV2aW91c2x5IHJlbW92ZWQgZHVlIHRvIGluY29uc2lzdGVudCByZXN1bHRzOyBzZWUgY29t
bWl0IA0KPiA+PiBmMjhlMzYwZjI5MDMNCj4gKCJod21vbjogKGFtZF9lbmVyZ3kpIG1hdGNoIGZv
ciBzdXBwb3J0ZWQgbW9kZWxzIiksIEkgY291bGQgbm90IGdldCANCj4gaG9sZCBvZiBhIGJvYXJk
IHdpdGggdGhlIG1lbnRpb25lZCBwcm9jZXNzb3IuDQo+DQo+IFNhbmRlZXAsDQo+DQo+IEVhcmxp
ZXIsIHdlIG5vdGljZWQgb24gc29tZSBvZiB0aGUgZmFtaWx5IDE3aCBwcm9jZXNzb3JzIHRoZSBj
b3JlIGFuZCBzb2NrZXQgZW5lcmd5IGNvdW50ZXJzIGFyZSBub3Qgd2VsbCBjYWxpYnJhdGVkLg0K
Pg0KPiBXaGlsZSBydW5uaW5nIGF2eC10dXJibyB3b3JrIGxvYWQgDQo+IGh0dHBzOi8vbmFtMTEu
c2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1odHRwcyUzQSUyRiUyRmdpdGh1
Yi5jb20lMkZ0cmF2aXNkb3ducyUyRmF2eC10dXJibyZhbXA7ZGF0YT0wNCU3QzAxJTdDTmF2ZWVu
S3Jpc2huYS5DaGF0cmFkaGklNDBhbWQuY29tJTdDOGNkNzBmNjYxNzY1NDdlYTlkODIwOGQ4OWM1
MjVhZjUlN0MzZGQ4OTYxZmU0ODg0ZTYwOGUxMWE4MmQ5OTRlMTgzZCU3QzAlN0MwJTdDNjM3NDMx
MjI0ODE2OTQ0NjgyJTdDVW5rbm93biU3Q1RXRnBiR1pzYjNkOGV5SldJam9pTUM0d0xqQXdNREFp
TENKUUlqb2lWMmx1TXpJaUxDSkJUaUk2SWsxaGFXd2lMQ0pYVkNJNk1uMCUzRCU3QzEwMDAmYW1w
O3NkYXRhPW1KbU1uTDNZNFd3aSUyQkxDcVptbjlBanhHZUlLZHhnb0xyanolMkZxQVNubDY4JTNE
JmFtcDtyZXNlcnZlZD0wIGFzIGJlbG93LCB3ZSBub3RpY2VkIHRoYXQgZm9yIGEgZ2l2ZW4gdGlt
ZSwgdGhlIHN1bSBvZiB0aGUgZW5lcmd5IGNvbnN1bWVkIGJ5IGFsbCB0aGUgY29yZXMgaW4gYSBz
b2NrZXQgaXMgZ3JlYXRlciB0aGFuIHRoZSBlbmVyZ3kgY29uc3VtZWQgYnkgdGhlIHNvY2tldCBp
dHNlbGYuDQo+DQo+IENhbiB5b3UgcnVuIHRoZSBhdngtdHVyYm8gdGVzdCwgd2l0aCBmb2xsb3dp
bmcgb3B0aW9ucyBhbmQgY29uZmlybSB0aGUgcmVzdWx0cyA/DQo+DQo+ICAgLi9hdngtdHVyYm8g
LS1pdGVycyAxMDAwMDAwMCAtLXNwZWMgYXZ4MjU2X2ZtYV90LzgNCj4NCj4gVGhpcyB3aWxsIHJ1
biBBVlggY29kZSBvbiBhbGwgOCBjb3JlcyBmb3IgYWJvdXQgMSBzZWNvbmQuIFRvIHJ1biBpdCBm
b3IgbG9uZ2VyLCBpbmNyZWFzZSB0aGUgLS1pdGVycyBhcmd1bWVudC4NCj4NCj4gUmVnYXJkcywN
Cj4gTmF2ZWVuaw0KDQpTdXJlLCBJJ2xsIHJ1biB0aGF0IHRlc3QuIEkgaGF2ZSBhIDM5MDBYIHRo
b3VnaCwgd2hpY2ggaXMgMTIgY29yZSwgc28gZG8gSSBoYXZlIHRvIGFkanVzdCBhbnl0aGluZyBm
b3IgdGhhdCBDUFUsIG9yIGp1c3QgcnVuIHdpdGggdGhlIHBhcmFtZXRlcnMgeW91J3ZlIHNwZWNp
ZmllZD8NCg0KLSBTYW5kZWVwDQo=
