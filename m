Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8066C433EF
	for <linux-hwmon@archiver.kernel.org>; Tue, 17 May 2022 09:11:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235788AbiEQJLt (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 17 May 2022 05:11:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244272AbiEQJKm (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 17 May 2022 05:10:42 -0400
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2136.outbound.protection.outlook.com [40.107.104.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13560369F1
        for <linux-hwmon@vger.kernel.org>; Tue, 17 May 2022 02:09:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XhkMngmck6MzndtGeNof6btQaWembUOAseb0RbHNQid8wiwYQ0pvemU27yfpYDV9V0l8ntc0Xv4GAV1y6aVrlSw0socuvVpeDqoTnS6VK3DYYPSi89teF7Mb3RAM6oyuuMSwLJtgNwlUcc/b4rXf8FrKROBqWnleROAyd1mszL8Oday2e94x4N4zySx8lxlO1KYUIvq66nDM0AjzA/QFmw3eY2NBlqY8LhCmfstXtfpHfGjti7Vjvw8f2p3AzuyBaTg/VOF5+e7eofOYdF3/0Z50g5AwB8FhqPZuted6/o6XFvX2mQqArKegRrvCQD2D7pbkueZqtOFwO0FHWDidUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ioZk36M3JWZ61pvsKh/q4t+3rQ3K0vcn3KvLkBgOZYg=;
 b=J2Oc4+sUb9xi1XW3D653t0d/U9YSMhueqi7pwAM1w3R5FL5ocrFJ1VAjXqksndLL6UEPb6yeb6LmE9WDWnhIPVoU1CKBmrg5jpANxmYjneh6Sta8pSh9NdIdYpBman8nVCdiZjWa3PAl8O87wiGVdnwQs5On3rHhhCVJa3sRZ+EHDTl8aMaewmsZ5BGRWWf8qs9WgdUJwcyehrQpXiWvTh94I1FKiuZ5wRQ1Ks/+3od1MdSNPoUqOi/DHCMn0Ji4i2FzX72vIZ8h/Sche0WHndQycVW8w6QtXZj+dfmwmTz7he4YzoF7ZMDkSQMjxqUm0KygZkmepQIIvL1yVQdDog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hitachienergy.com; dmarc=pass action=none
 header.from=hitachienergy.com; dkim=pass header.d=hitachienergy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hitachienergy.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ioZk36M3JWZ61pvsKh/q4t+3rQ3K0vcn3KvLkBgOZYg=;
 b=Kdc4iKl/scSMWI6pG547G2G3CU+UZ2wFUtqTSj80BOxaB6ge+oB7puphmd0xvln2/7j5pVOLiXuKqCaSTec//62Z2AVs9NXRSDRaJS9wzgWkDXUaUwxFz/RUMYMfa0bmSWslKDDQjHmUfkCBy9bCa5Xkv6ilDLBzxeGNkLpcx7neJPzNDZGC9mbwqrpz24gRylDuOHTfizj6RdgwVleRhOH2yMxS3yl1NKeRYZT0QScCHsr4nJvlI8E/adQQGpxajZqx5tbRs7BhJNfITFWZDkGOPdNSIb3/BsJGPQM9uxGQt0nwUT7uMaFOs23Tji+uLW4QZ11nobwPEZz68TrWPw==
Received: from DB9PR06MB7289.eurprd06.prod.outlook.com (2603:10a6:10:218::16)
 by VI1PR06MB6062.eurprd06.prod.outlook.com (2603:10a6:803:91::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.14; Tue, 17 May
 2022 09:09:49 +0000
Received: from DB9PR06MB7289.eurprd06.prod.outlook.com
 ([fe80::7015:6796:8a61:93b4]) by DB9PR06MB7289.eurprd06.prod.outlook.com
 ([fe80::7015:6796:8a61:93b4%9]) with mapi id 15.20.5273.013; Tue, 17 May 2022
 09:09:49 +0000
From:   Holger Brunck <holger.brunck@hitachienergy.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
CC:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: RE: [v3 2/3] dt-bindings: hwmon: lm90: add ti,extended-range-enable
 property
Thread-Topic: [v3 2/3] dt-bindings: hwmon: lm90: add ti,extended-range-enable
 property
Thread-Index: AQHYacO1cYkICxoTB06LH1LqErnbRa0iu0+AgAAB+1CAAAMYgIAABing
Date:   Tue, 17 May 2022 09:09:49 +0000
Message-ID: <DB9PR06MB728952BDEB8B300C0E6C7749F7CE9@DB9PR06MB7289.eurprd06.prod.outlook.com>
References: <20220517075703.16844-1-holger.brunck@hitachienergy.com>
 <02062376-86cf-dcee-7560-2edd55ee16de@linaro.org>
 <DB9PR06MB72895A514CDE3E3BB5E46445F7CE9@DB9PR06MB7289.eurprd06.prod.outlook.com>
 <b0e8e834-cad8-e53e-7962-84d648f31d7c@linaro.org>
In-Reply-To: <b0e8e834-cad8-e53e-7962-84d648f31d7c@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-processedbytemplafy: true
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=hitachienergy.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 098db279-1042-4c34-35ec-08da37e4fee6
x-ms-traffictypediagnostic: VI1PR06MB6062:EE_
x-microsoft-antispam-prvs: <VI1PR06MB606202CAA0736C189DD12923F7CE9@VI1PR06MB6062.eurprd06.prod.outlook.com>
x-he-o365-outbound: HEO365Out
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PYS0ergH1oD6Hl8ncUmxQIYzUir8V/zRv6LQGM3ruCfYx2mcLGNsp6bl41NSlphssjQau8cXEQQL4Lc4V1bj0D0ayADs2J1uZhKLKUKm31Xd1nAdUjL0yyMGKITUc/gALQ6bz4SpRYyK9lwi/D0pgL+C1lgNfFpxBYiSobxM2UVe3wJn4mdbn2Ddp54u4WZ2Th9HGScxerRcAQhE/cZ/icFLu9jUphQ+lHAOUfYnORvormMPLVCvEzcLei1onLnFxI8ESYfi+I83Cfc6Y572FtiISrvtBDZ3kZ5MrtUJxVayj5K0d/cmmkHXjOBdYce7IHqRLlsS/sXYyhdXshfbafETqHlfHQbbPjWt+PL5r7oK80NBZiIuYG3frS/JfXwLHQzpcWLGokKJJsvtOAerm1Tk0ViI10qAmBh3IaAB4o7eLOki3lZFXRoXtHO1le+CZ/sNoS7xteJ2erL39nfBsWBwN+K9PuMByLsS+QBbvQ+xYSKMjPdf9hsgERsF/mi7jF51y8Gy+Okx0NkKlK8AP7pG7+XyP3A1V06CQzZRwU6l1ZC+gb88OMgcmOvAvTH+Fk0ikk0M2wd+sE8QkG9zNfMyBkKtqZhNcTs0ZM8PsAoNJgrPU5zEduCkD9AFvhl2H2Nbq+0+YLpiMeZjNbWYeG8wibop/pf7GOLOagfI18EdPB2U4w1T3rFdQM/ngx2jQMuOhD8woV9bJMDj6bjDmA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR06MB7289.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(71200400001)(6506007)(186003)(53546011)(82960400001)(52536014)(508600001)(54906003)(110136005)(26005)(9686003)(44832011)(55016003)(2906002)(38100700002)(316002)(64756008)(76116006)(66946007)(66476007)(66446008)(8676002)(4326008)(66556008)(122000001)(7696005)(33656002)(8936002)(5660300002)(86362001)(38070700005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RGFJNG4rbVBaMmc3TzhkWHBmNFFpeHdLRzQvUDN3UXZ2OVBHMks3bzFueGs3?=
 =?utf-8?B?bFJTbmNuckZ4K3A4MEg3aVExeEhhUEd1QkFhU2tpcmZ5R0RsUU95VWxUckt0?=
 =?utf-8?B?K2JKUWxUV3h3YnBlMHhPQWIrei9Sa0ZOd3NSVE5lcmZlV24zTmRKakkwMEhC?=
 =?utf-8?B?ZytHbDFtQktiOEtDeEtTK1NweTFIZUxlRk82RjYvaThhQ1JISmNVM3UvNTlX?=
 =?utf-8?B?Y3Z2VUFuRFh1VWEvamR5c1ZEbWIwSzJ6TzF6L0M3M3BvbTh6QnZoa3RDMTVq?=
 =?utf-8?B?T0ZabklXaHNnQjJ5RDF0NzV1QkQ4UlFQSWFuVnJyemowNDBwSDQ2VFRjK2pY?=
 =?utf-8?B?cmR2Sm40bHEwN0xnbERsL050K082eDBXbjJ4QkZVMlhSVjVncjlsWXVPWmhJ?=
 =?utf-8?B?MjhFYmhkUkR6YUZPQ3FVc1VCN1RQWSs2c0JMMEwrOFVMK2pGZDRTaVhwVExt?=
 =?utf-8?B?NXpNcTFGemhQUkdNdHEvSldnUHVnb2w3a0xiUXNSbFd0QUx0S2U3VmN3SGwz?=
 =?utf-8?B?M2x3L29xYWlieDJreTFLYWpmQ2ZmUXZqcGtvT0x5dEhwUnZwMTh4cmRrUW9L?=
 =?utf-8?B?TVEvd1VkNXg2RHZudzEyNGc3bTJpYWtXWDlwc1BVQTY0cUswZXU4eXR0QW05?=
 =?utf-8?B?T0xYZUFDTXk4OVFLRDhSdXlvQnp1SUJqTk40MnBjSTgyVkVUK1hTVGx4OC9z?=
 =?utf-8?B?YldmQXpzUUczeXpHOXZld1Rvc0h1eGFOR3A3L1NDVTMrOFRTZ1hUZlJQcW5J?=
 =?utf-8?B?WkFWMXVjWmhiWkxrOUd6bnQwWGh4a2ZJdWVKbHAxQXdBZlVKZVBjVHpJVFV6?=
 =?utf-8?B?YzFJOExUelNJZ3VhM3o1UE05c1NtZGpwR1dxWHVhQUpRc1hyNVBjZW4ybGk5?=
 =?utf-8?B?bHJ5YlUvd0Z0Tllkb2E1cFVNOUZ4T1gxTGJlNjVuQTRwWktqTUl5R0liOWtJ?=
 =?utf-8?B?OGhnTEUyTmhpcm4zZlJ3bWxBaUJwN0VvK1BjWWtYWTQ1ZklLZ0RVK3hyRVk1?=
 =?utf-8?B?UnphNkc5VnlIeVlsZGxDa1cvL2NQRjQxM2VxU2dDeENZK1hpMndrUmtybTBi?=
 =?utf-8?B?dExZVSszc3J4K2t1cldlbTBmTng5eS9TTmY0ZTFZQ1NpZWJIemoyeGtxVUZN?=
 =?utf-8?B?Q2FZRmtTbW5OaVdTWnZodFRteHRNcDMwQmhXbUd3YUQ1K3UxREJmSmt3dXY1?=
 =?utf-8?B?d0pRa2FBTnVpbG80TjZFVHRScmI4RTJ4eUJ2R2NkT1hvOW5kZWhieFJTVUIw?=
 =?utf-8?B?TzhndkVCWi9EdUVZZTQwYlFyQmM1aFJ5MlZaaStKelkwdVk1SzZaQU45MHB5?=
 =?utf-8?B?U0lDb1MxeUltZXpRcUpIaXZpcWZ5aVRjSUlkMnhSN3N2ajVDZ0JrQitsWDFX?=
 =?utf-8?B?QnloendPQmhSUUFrYVZ6QS9IYlRqZnRiY2NBT2x6YmYyQVoxb2lxVW5FeXZ2?=
 =?utf-8?B?YUZITEZVbWNEVldNMXVETEErL3NDYlR1TVN0OUYrRlh1WjI4RGFTNzdKYnpN?=
 =?utf-8?B?dEZRNkhYd3lTRXN4TWw1a1FCSHVCWTFWbkZ2MmVNb2xBaTVqWEttdUlZUk1y?=
 =?utf-8?B?WmtlbTN3bXZ6eWRhaGN6a200Q3JNVWhQaHRBOGNYZmh6bElFM1VndWhEVFFY?=
 =?utf-8?B?YXVYOC9wdkUzR1gwUUJzREhYMkNJczNWbDh0bi9VU2dpcHpEWWhOYjE5N3N6?=
 =?utf-8?B?NUIxemMrZjVaQzY0L3V5Uml1OUF6TDQ5VVNvODY4Skp1VllkNGNsbmU1VW1I?=
 =?utf-8?B?bnpzc2xLT3dQb3FJRml5US9WK1ZOK09yNmU0K1ZZOGh2SDBwY0xwaHNpdFYr?=
 =?utf-8?B?amNveGpGT2ZDelJpZjM3UGttT1Y0a0d2eEZHQUhwcFRadFVOdFBFV25VUW9n?=
 =?utf-8?B?VHo1MGlqZkNPZUhObXRlU0twcnV4eWpnc3NKaks5dGlNMVpFVWVFWVVIRDRj?=
 =?utf-8?B?WXNTYjBCYm9mMS9KZk5TUy9yeXAzb1pVakgzSEVqdzVoVXVTaEczL2VjL2kw?=
 =?utf-8?B?ZTBnRXlhOFFHY3NCY29IV1ZGRXpEVWs5Y0FLMXEyWWVySGZNZzI2M2Z3ekpv?=
 =?utf-8?B?S0prZkpYTzFrejRXY2pCcUg2WElhcHZ6cm02Sjlmczd1cFgzT3h6T0FPZU1q?=
 =?utf-8?B?Nmh6VklZb3g5U204VE1ZdFM4QlovWDRENFdCb2dWVWtmVncycjVTNVFNVnFo?=
 =?utf-8?B?YVlzR3lCZTVzdnlFTUdIdzhFSG9lNGxFN2pWck55dzl0eUQrZ1lzQWJKREEw?=
 =?utf-8?B?a1JLRHpzTmdlWjIzY3A2RGJDK1BQV2hQVkFwemdCL1AwR3JxdC82RHphaHZp?=
 =?utf-8?B?YXJYSU9TcStyajVnd2NKSDY1T1hFTkZZSU0xRmEwbGR6OWJWeWNxamlqK1Er?=
 =?utf-8?Q?vWix7yDmGvWjJ91g=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: hitachienergy.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR06MB7289.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 098db279-1042-4c34-35ec-08da37e4fee6
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2022 09:09:49.4448
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7831e6d9-dc6c-4cd1-9ec6-1dc2b4133195
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oeflrbGJDwth9d0LNbHZUDibRhh0eny9X6HniFoyHbOkeTW8EgM+kH51J5nKLJR96CidVmFjU0QLPEWAYxOTwPeEHEJaSqv9lQGyZt1eSSY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR06MB6062
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

PiA+PiBPbiAxNy8wNS8yMDIyIDA5OjU3LCBIb2xnZXIgQnJ1bmNrIHdyb3RlOg0KPiA+Pj4gU29t
ZSBkZXZpY2VzIGNhbiBvcGVyYXRlIGluIGFuIGV4dGVuZGVkIHRlbXBlcmF0dXJlIG1vZGUuDQo+
ID4+PiBUaGVyZWZvcmUgYWRkIGEgYm9vbGVhbiB0aSxleHRlbmRlZC1yYW5nZS1lbmFibGUgdG8g
YmUgYWJsZSB0bw0KPiA+Pj4gc2VsZWN0IHRoaXMgZmVhdHVyZSBpbiB0aGUgZGV2aWNlIHRyZWUg
bm9kZS4gQWxzbyBtYWtlIHN1cmUgdGhhdA0KPiA+Pj4gdGhpcyBmZWF0dXJlIGNhbiBvbmx5IGJl
IGVuYWJsZWQgZm9yIHRoZSBkZXZpY2VzIHN1cHBvcnRpbmcgdGhpcyBmZWF0dXJlLg0KPiA+Pj4N
Cj4gPj4+IFNpZ25lZC1vZmYtYnk6IEhvbGdlciBCcnVuY2sgPGhvbGdlci5icnVuY2tAaGl0YWNo
aWVuZXJneS5jb20+DQo+ID4+PiAtLS0NCj4gPj4+IGNoYW5nZXMgZm9yIHYzOg0KPiA+Pj4gICAt
IHJlbmFtZSBwcm9wZXJ0eSB0byB0aSxleHRlbmRlZC1yYW5nZS1lbmFibGUNCj4gPj4+ICAgLSB1
c2UgYWxsT2Y6aWYgdG8gY2hlY2sgaWYgdGhlIGRldmljZSBzdXBwb3J0cyB0aGlzIGZlYXR1cmUN
Cj4gPj4+ICAgLSByZXBocmFzZSBjb21taXQgbXNnDQo+ID4+DQo+ID4+IFBsZWFzZSB1c2Ugc3Rh
bmRhcmQgZW1haWwgc3ViamVjdHMsIHNvIHdpdGggdGhlIFBBVENIIGtleXdvcmQgaW4gdGhlDQo+
IHRpdGxlLg0KPiA+PiBgZ2l0IGZvcm1hdC1wYXRjaGAgaGVscHMgaGVyZSB0byBjcmVhdGUgcHJv
cGVyIHZlcnNpb25lZCBwYXRjaC4NCj4gPg0KPiA+IEkgZGlkIHRoaXMgYnV0IEkgdXNlZCBvbmx5
ICItLXN1YmplY3QtcHJlZml4PXYzIiBpbnN0ZWFkIG9mDQo+ID4gIi0tc3ViamVjdC1wcmVmaXg9
IlBBVENIIHYzIi4gSSB3aWxsIGNoYW5nZSB0aGF0IGZvciB0aGUgbmV4dCB2ZXJzaW9uLg0KPiAN
Cj4gQmVmb3JlIHNlbmRpbmcgeW91IGNhbiBhbHdheXMgcmV2aWV3IHRoZSBtYWlscy4gVGhlIGVh
c2llc3QgaXMgYW55d2F5ICJnaXQNCj4gZm9ybWF0LXBhdGNoIC0zIC12MyINCj4gDQoNCnRoYW5r
cywgdGhlIC12MyBvcHRpb24gSSBkaWRuJ3Qga25vdy4NCiANCj4gPg0KPiA+PiBTa2lwcGluZyBp
dCBtYWtlcyBmaWx0ZXJpbmcgb2YgZW1haWxzIG1vcmUgZGlmZmljdWx0IHRodXMgbWFraW5nIHRo
ZQ0KPiA+PiByZXZpZXcgcHJvY2VzcyBsZXNzIGNvbnZlbmllbnQuDQo+ID4+DQo+ID4NCj4gPiB5
ZXMuDQo+ID4NCj4gPj4gVGhlbiB1c2Ugc3RhbmRhcmQgZW1haWwtc2VuZGluZyB0b29scyB0byBw
cm9wZXJseSB0aHJlYWQgeW91ciBwYXRjaHNldC4NCj4gPj4gZ2l0IHNlbmQtZW1haWwgZm9yIGV4
YW1wbGUuIEtlcm5lbCBkb2NzIGFsc28gZXhwbGFpbiB0aGlzLg0KPiA+Pg0KPiA+DQo+ID4gSSB1
c2VkICJnaXQgc2VuZC1lbWFpbCIgYnV0IEkgZ3Vlc3MgbXkgcHJvYmxlbSB3YXMgdGhhdCBJIHdh
cyBzZW5kaW5nDQo+ID4gcGF0Y2ggcGVyIHBhdGNoIGFzIEkgaGFkIGEgIGRpZmZlcmVudCBzZXQg
b2YgcmVjaXBpZW50cyBpbiB0aGUgQ0MgbGlzdC4NCj4gDQo+IFRoZSByZWNpcGllbnRzIGxpc3Qg
c2hvdWxkIGJlIHRoZSBzYW1lLCB3aHkgaXQncyBkaWZmZXJlbnQgc2V0Pw0KPiANCg0KSSB0aG91
Z2h0IHRoZSBjaGFuZ2VzIGluIGRyaXZlciBjb2RlIGlzIG5vdCByZWxldmFudCB0byB0aGUgcGVy
c29ucyByZXZpZXdpbmcNCnRoZSBEVCBiaW5kaW5ncyBwYXJ0LiBCdXQgSSB3aWxsIGNoYW5nZSB0
aGF0IGluIHRoZSBuZXh0IHJvdW5kIGFuZCBrZWVwIHRoZQ0Kc2FtZSBjYyBsaXN0IGZvciB0aGUg
d2hvbGUgc2VyaWVzLg0KDQo+ID4NCj4gPj4gQ3VycmVudGx5LCB0aGlzIHBhdGNoc2V0IGlzIG5v
dCBwb3NzaWJsZSB0byBhcHBseSBkdWUgdG8gbWlzc2luZyB0aHJlYWRpbmcuDQo+ID4+DQo+ID4N
Cj4gPiBPay4gU28gd291bGQgImdpdCBzZW5kLWVtYWlsIC0tdG8gLi4uIC0tY2MgLi4uIDAwMCoi
IHRha2UgY2FyZSBvZg0KPiA+IGNvcnJlY3QgdGhyZWFkaW5nICBhcyBpdCBzZW5kIGlzIGhhbmRs
ZWQgZnJvbSBvbmUgY29tbWFuZD8NCj4gDQo+IFllcy4NCj4gDQo+IFlvdSBjYW4gc2VuZCBpdCBh
bHNvIG9uZS1ieS1vbmUgd2l0aCBwcm9wZXIgdGhyZWFkaW5nLCBpZiBmb3Igc29tZSByZWFzb24N
Cj4geW91IGRvIG5vdCB3YW50IHRvIGZvbGxvdyB0aGUgZWFzeSBwYXRoLiBSZWdhcmRsZXNzIHdo
aWNoIHdheSB5b3UgY2hvb3NlIC0NCj4gZWFzeSBvciBtYW51YWwgLSBqdXN0IGJlIHN1cmUgdGhh
dCBlZmZlY3QgaXMgY29ycmVjdCBhbmQgdGhlIHNhbWUuDQo+IA0KDQpvayBJIHNlZS4gVGhhbmtz
IGZvciB5b3VyIGhlbHAuDQoNCkJlc3QgcmVnYXJkcw0KSG9sZ2VyDQoNCg==
