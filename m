Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87A0AC433EF
	for <linux-hwmon@archiver.kernel.org>; Wed, 11 May 2022 13:50:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244167AbiEKNuc (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 11 May 2022 09:50:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229818AbiEKNu3 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 11 May 2022 09:50:29 -0400
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2094.outbound.protection.outlook.com [40.107.20.94])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F07BB248274
        for <linux-hwmon@vger.kernel.org>; Wed, 11 May 2022 06:50:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mkjyXobTy2oLReJLU82ikwtxcYfL8pctuJtr1vGRGBfN8S7UxXOeui3ovR85+ZaTi8N8+rRXJOmPH5IpdRod6Wus8OhmbyURdvs0c7ecuou/DnRYssUKsqE1/G/3HsiMKfSmPMzt+8WDTJYRJbMGlNKweKF9UXIsQ94V1k+pWlo4fLGm521DqOPXMqtEh+5ZE5sXmoC8OWDlny8qSSLPORhyzWE/C9qJroEn5yOj7U4WM2Dk4jCr1LzObTH97h5fSGZyh7X9GY8g8OrDMvGKQ++G3tatQADxF1s2GDsD1upAC8PkKlaTohVXkrEKi5Yk0F0nK3Nm5Y98EICe2SL90g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2PQH4bvs2FVfFSDEL8hfXLvHDpkkx0jtG+sUdxVqYmc=;
 b=j5pB/6BIP0PHcn8VhA7ad2NXS5goR1kOL2QFPWawuItcoXpfwimcmlw3R9abRsQHHPwiwBngknJKxwE0KqYqhR5sAzJXFAwqv8qpWa8EWkID9g5Eefm8CxYUNiqHED64unzEkQSBh8R4RuZR5393+k0uM1ntvv2nYpeFnS/JnvGsXqTVjApEFqSnxYlExEIHLrZEQTrdilDucrwBRRO4UKtLGULg20t0tz3tAcAqnpe3nsM6CMQo4mxz7D2c1gUk65NceyMDlROilTYht43XSUFk0/PSIxISoIRgDfIZCldn3RkmN6xEuGMtpv2oavzYZIRt6ef6erpUj98CKx2+hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hitachienergy.com; dmarc=pass action=none
 header.from=hitachienergy.com; dkim=pass header.d=hitachienergy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hitachienergy.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2PQH4bvs2FVfFSDEL8hfXLvHDpkkx0jtG+sUdxVqYmc=;
 b=SMvWt6Mun413jLCSKoSLYs/PzvZilJOBo9okA/OkAiZD1Nrbxte3qEWFKtOeUgKPUMEmYKfRRMoat/9ig8yP8mzt9BrxcYUk5i5DJuSEMOIeVnbM/Sdj2W1QUWzqxkAqHpp4UU3II0k4RMlsO5zVrUds1g5/tciwHBUnnBL77mqI/a21pNdF7rNGsGm1rvF/R+kN/wdI1+06LH3t1YXYatuuA08c1yTB0bWN8QnMDLHB1JrtgpD7AG6CeuEBhumf1mVo0kNf2KovJS72P79fpem3EFBSqWpcAqzawOeHBGe7DOeZHlJrQ8IDRoj7qxdWTZboS/ND2Wh44USEocOXZg==
Received: from DB9PR06MB7289.eurprd06.prod.outlook.com (2603:10a6:10:218::16)
 by AS1PR06MB8443.eurprd06.prod.outlook.com (2603:10a6:20b:4c5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Wed, 11 May
 2022 13:50:23 +0000
Received: from DB9PR06MB7289.eurprd06.prod.outlook.com
 ([fe80::7015:6796:8a61:93b4]) by DB9PR06MB7289.eurprd06.prod.outlook.com
 ([fe80::7015:6796:8a61:93b4%9]) with mapi id 15.20.5250.013; Wed, 11 May 2022
 13:50:23 +0000
From:   Holger Brunck <holger.brunck@hitachienergy.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
CC:     Jean Delvare <jdelvare@suse.com>
Subject: RE: [v2 2/2] driver/hwmon/lm90: enable extended range according to
 DTS node
Thread-Topic: [v2 2/2] driver/hwmon/lm90: enable extended range according to
 DTS node
Thread-Index: AQHYZEU3R3ThQh9j2kG9BRADVG6ii60Y5tMAgADGtVA=
Date:   Wed, 11 May 2022 13:50:22 +0000
Message-ID: <DB9PR06MB7289970D299A48B840120D16F7C89@DB9PR06MB7289.eurprd06.prod.outlook.com>
References: <20220510080900.22758-1-holger.brunck@hitachienergy.com>
 <20220510080900.22758-2-holger.brunck@hitachienergy.com>
 <692d5ac7-840f-49da-c06a-c2b0e0e6cf8c@roeck-us.net>
In-Reply-To: <692d5ac7-840f-49da-c06a-c2b0e0e6cf8c@roeck-us.net>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-processedbytemplafy: true
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=hitachienergy.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: caf9dd13-5bf2-45b7-d9fe-08da33553200
x-ms-traffictypediagnostic: AS1PR06MB8443:EE_
x-microsoft-antispam-prvs: <AS1PR06MB8443DFAC7606F15DF9F4242AF7C89@AS1PR06MB8443.eurprd06.prod.outlook.com>
x-he-o365-outbound: HEO365Out
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jBMlXYrC3F6vp3B/wg6jvEO4W8kmACS/ZrLY0yCBfo09dfTofYreWe9jJ+pKqvulhGJrfbwqf3JCJlhTMFwiq07ho/RL+qOyxdBdT90QDOWxakb69z4UUrbKpyQPU4DrdzfPTtjk8BMGPJ4JQpjnEajntJ0e5Y/qQf0gTlMkCWwq7FBxi+vdH/gZ4CoK6N/ZbbL8qHlXRuGPrWsqlgxllDVT0a6MG9d0jdXbtxklRK0+LQN+OOmx6ja10Wk6GtPNtvIZ2ISnYHEXRxnuhcGmigOwvhcyiNp3M/EAwPmMThIyRNxjPRfF0S5AedrFBuna1OSPeewTscKQmiw6WiLkff+7MlwgIMthEFiQrUM203Ap90M3ioQgo6KdKL9V2nTNevoXdsRh0pjyMVCspd1RIq4yqrFvbzV6TGEUnqiQLdX6XaNioxFR/NczRKdMNWGggvzsxJzKz2gHQvblZCSNJZmJpytduHp1oxfF/5HfWJhffeWKv9VuKeKNIi0Gqrx778JedGN0QgGHlz1RpRK6z2rCoDbk00Yn0yAxK27ZWb2N2nZmF5hqBcgcCBbndrGQuoVBzqkFFuPOHxWBBjxYUItJsg0uLoEvHYUXjly0TYmkzKhHSu0B+NGAIDoNrPUzOnH3hH0LfzWamF7Lgiq9xZzwgwQw8eNAsQfeQ8VygMPrgPpERQzGfIQkdNNndOAZWZKy5DUr+2CTxlyPRBT46A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR06MB7289.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(122000001)(26005)(38100700002)(64756008)(38070700005)(508600001)(33656002)(44832011)(8936002)(5660300002)(6506007)(9686003)(82960400001)(52536014)(2906002)(66476007)(76116006)(66446008)(186003)(7696005)(66946007)(55016003)(71200400001)(316002)(110136005)(66556008)(53546011)(8676002)(4326008)(83380400001)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bGk1N3phS1JQcWJpNktuQXA2SDlwMGk2cElqYk93bXhzcmk0TjMzMGFBVjlh?=
 =?utf-8?B?L2ZmVzMzY0VIYlpiQWFBZzJBWUxZL3B2ZzhMZW9JRW9Kc1djaytRYWhkdk5m?=
 =?utf-8?B?MnFCVXdLNnJxaGpqeFV6Ynd2UHJGVXNMZ2J2bklHbmJZMjhnODM4Nk1MUmli?=
 =?utf-8?B?dCtYSlhWLzVNVTNqMUlJYzdSVFBvRlArRmptTjlPaWpSN3BaMnZUeStzaTRX?=
 =?utf-8?B?Uk84OThabTB6elFMTVZMV0pueUxyTlkzaEJpOXpISko3KzBKZUwwUGYxMGEv?=
 =?utf-8?B?RGZkS0NyK1gxU0NzVy9rTndhbmF3UDkzUUdnMUNNdnNad0JvWmowVEdQczJQ?=
 =?utf-8?B?bHlZditrUk9qMFJVbU5oNnZvYXF5K1RMODBlZW5BVlpZUTMwYzFCMlFxeWFl?=
 =?utf-8?B?MEQ0R2wxTW1GaU4xeWNiR0RFR1psbWFqdUovdXhhRFdPSlV0WnExM2tvNTAx?=
 =?utf-8?B?T1FUSEJ2cXdZMGpjTnd0aVZwRmFwc3crRWpLZW9Db0tWaGMySEZLcEwyR21h?=
 =?utf-8?B?RzdIVGJvYjRmaU1OSnU0MzB1aTdqTlg1UHBmbUhnc3dqSVJjdlcrRlp3bHZh?=
 =?utf-8?B?WkpuNDhuaHFHTmhpTGY4bS84QjB0a1Z1YXlxRjlwR1dESEZreGVHbXpQdUkw?=
 =?utf-8?B?MUpkZ0lwaEJKTk1VVHdDbW51Vnc3ditHMXNpTysxQ2pNNXR5ZjdjRG9iUm9m?=
 =?utf-8?B?S2syNnBHdklqNXV0QkxLTU1ISFVTdVU5eTVyNnREQVpBZ1JaU25HZ1RtWGEz?=
 =?utf-8?B?Z25TOS81S1A3U2JqQUZQQjdKOFhxYmdybmx6WjJqRWtGYXV0Z1FMSWxpZWxZ?=
 =?utf-8?B?Q3h0STF5QmJXZUYvdERYeFpySkdibDZ2SFBydzg1cXlOcEpxNTFEM2tzdzVS?=
 =?utf-8?B?UThnZWNBVjVHY24zSmVzSmtudW5FazFFLzlLYUxyUUU5dWw3TGZqaFJFa3BY?=
 =?utf-8?B?czA2eTVqenkySklHVjNwK1F3KzM0NmV0blREVlVKUG9naGxpeE1BYmVEei9I?=
 =?utf-8?B?V1h0aXZoOGl0NXJTZ3NyRkNsdGNqbENwRFNwNHpZS1pSc2VaSExaQmpzbjdO?=
 =?utf-8?B?UkkxZUhKV1FhdEcyTUhDcExoWU5QWnhCOVoraFUxNmx0bGJwalVJUEtHZEQ3?=
 =?utf-8?B?cjlsOThWejdJcnNObjgrMTdHSVpBTTYrMWhjVEszOFRGczNObnEwNUc2VWlr?=
 =?utf-8?B?S1NQcnFsRSt6Z3JkV2N3SzNPVGpFdnNVOXlvay91TDJCenBRc2pSZ2VwRVBC?=
 =?utf-8?B?L2huN1lFczFCWjlvdVpkaU1oR0xkUzcrRlBzeGsrTkhGbjB5Mk5vTnBaTjRC?=
 =?utf-8?B?Q3c4OGNjNXJwSXlyVHl3aTlFUjZ2UzMrUkQ5QktoenlsM0NrWDVSV2crR09R?=
 =?utf-8?B?RFdjWTBEejBpWjV3ZytlRittOEJZNXl2MEJrTHd1N1VFdktxWmFxd3BtTHN4?=
 =?utf-8?B?Zjg5K0gzTkFMWmpHSVppa3FWejZKWktqTzkwdUU0MjBIczV4RU5rOGJKUWpK?=
 =?utf-8?B?NU9hbFZPcVNydHZ3bWFxWUkyeGNuTHkwakhGdkh3Ui9EeXlnTmQ1dmQrYUpF?=
 =?utf-8?B?dlJzVWtUNStTRkpjdlV0cFYzNDZkU3VRU2xuS2t6d0RSL1M3Y0wrNjVmKzNT?=
 =?utf-8?B?dFN3OG42TDBYQjVTL3VhTndobnBvSzI1WHNRU2pWeEJtdDYrcldhWHZVNTBX?=
 =?utf-8?B?WEtWbmtnaDd5SS9wUmt4SjJmYVZsYVpKaGhDQ3Z2N21JVmh6Um96YXcrSlY2?=
 =?utf-8?B?Ny94S1VtTkt1Z0I3WmxGMnlGL3U2dGNicmhpRi8xL1Q5eExyeERZeDZ5STJy?=
 =?utf-8?B?TUNUV2JJVFIxZHl6NnJUc2V3Y0djLzVDU0JsemEzZ2RiUkk5NW5pN0hJay9W?=
 =?utf-8?B?WHh5ZzJMQUNDWENEWmpaNWJVQXlxYkZQSzVMYS94ZHAreEV4R1J0anZDeFVK?=
 =?utf-8?B?akVqN25FRnJlbGkwcDhsc202TDNEVndOVWx0RWwrMlJWRTJyRTBBQ2VCejM4?=
 =?utf-8?B?Y1lyWENYNFBTL3VZbTNoRVFhUGNRSENCU0VrTGg1V2lnVHYrYUdnYVVJU3Rx?=
 =?utf-8?B?bnBsSHYvOGM3amJDeWN6UllQcW1lREI5TUo2ODdjTytOaWhRNVV3a20zd2Uw?=
 =?utf-8?B?Yk5nY1doR3FNMFUxSW5iWE1lS2IzNCtwbGJoZmUxUWRzRFVZL2FJMUdhby9Z?=
 =?utf-8?B?R1RaVXlvSTJmaUYzR2prTFg2cGlKWDdLR1hoMVFoUW53N29ZQWxkVzJYQjZJ?=
 =?utf-8?B?aWYwSlBUWHhabDFmSVM1YWF2U0R6M09yUzFEeXZyb2hTelp4ZDZlL1Bub2oy?=
 =?utf-8?B?aG82ZWd3a0c3QjB0TkVUcmY4VE1NRTQwaFVFZFNZcWt5RFhxaW1SaFBPWTRY?=
 =?utf-8?Q?5BKAvaK+Hqtx6pv0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: hitachienergy.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR06MB7289.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: caf9dd13-5bf2-45b7-d9fe-08da33553200
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 May 2022 13:50:23.0187
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7831e6d9-dc6c-4cd1-9ec6-1dc2b4133195
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Dm1zaByqVGzrZLkRjUTDXRc+IQ84QJBBwjVYNacbHNfzpg99iVdQTl40yBBmaP9gSthIKwnem0UzEHRarxDphkqia3+EBvr5gRwAN8wq3wY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR06MB8443
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

PiBPbiA1LzEwLzIyIDAxOjA5LCBIb2xnZXIgQnJ1bmNrIHdyb3RlOg0KPiA+IFNvbWUgbG05MCBk
ZXZpY2VzIGNhbiBvcGVyYXRlIGluIGEgZXh0ZW5kZWQgdGVtcGVyYXR1cmUgbW9kZSwgdGhpcw0K
PiA+IGZlYXR1cmUNCj4gDQo+IGxtOTAgY29tcGF0aWJsZSAuLi4gbW9kZS4gVGhpcyAuLi4NCj4g
DQo+ID4gaXMgbm93IGVhbmJsZWQgaWYgdGhlIHByb3BlcnR5IGlzIHNldCBpbiB0aGUgY29ycmVz
cG9uZGluZyBkZXZpY2UgdHJlZQ0KPiANCj4gZW5hYmxlZA0KPiANCg0Kb2suDQoNCj4gPiBub2Rl
Lg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogSG9sZ2VyIEJydW5jayA8aG9sZ2VyLmJydW5ja0Bo
aXRhY2hpZW5lcmd5LmNvbT4NCj4gPiBjYzogSmVhbiBEZWx2YXJlIDxqZGVsdmFyZUBzdXNlLmNv
bT4NCj4gPiBjYzogR3VlbnRlciBSb2VjayA8bGludXhAcm9lY2stdXMubmV0Pg0KPiANCj4gQ2M6
IGlzbid0IHJlYWxseSBuZWNlc3Nhcnkgb3IgdXNlZnVsIHRvIGxpc3QgbWFpbnRhaW5lcnM7IFlv
dSBtaWdodCB3YW50IHRvIHVzZQ0KPiB0aGUgLS1jYyBvcHRpb24gb2YgZ2l0IHNlbmQtZW1haWwg
aW5zdGVhZC4gQWxzbywgaWYgdXNlZCwgaXQgc2hvdWxkIGJlICJDYzoiLg0KPiANCg0Kb2suDQoN
Cj4gRm9yIHRoZSBzdWJqZWN0LCBwbGVhc2UgdXNlICJod21vbjogKGxtOTApIC4uLiIuDQo+IA0K
DQpvaywgd2lsbCBjaGFuZ2UgdGhhdC4NCg0KPiA+IC0tLQ0KPiA+ICAgZHJpdmVycy9od21vbi9s
bTkwLmMgfCA0ICsrKy0NCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2h3bW9uL2xtOTAuYyBi
L2RyaXZlcnMvaHdtb24vbG05MC5jIGluZGV4DQo+ID4gMWM5NDkzYzcwODEzLi42Y2RiY2ZhYjlm
MjAgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9od21vbi9sbTkwLmMNCj4gPiArKysgYi9kcml2
ZXJzL2h3bW9uL2xtOTAuYw0KPiA+IEBAIC0xNzA3LDYgKzE3MDcsNyBAQCBzdGF0aWMgdm9pZCBs
bTkwX3Jlc3RvcmVfY29uZih2b2lkICpfZGF0YSkNCj4gPg0KPiA+ICAgc3RhdGljIGludCBsbTkw
X2luaXRfY2xpZW50KHN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQsIHN0cnVjdCBsbTkwX2RhdGEg
KmRhdGEpDQo+ID4gICB7DQo+ID4gKyAgICAgc3RydWN0IGRldmljZV9ub2RlICpucCA9IGNsaWVu
dC0+ZGV2Lm9mX25vZGU7DQo+ID4gICAgICAgaW50IGNvbmZpZywgY29udnJhdGU7DQo+ID4NCj4g
PiAgICAgICBjb252cmF0ZSA9IGxtOTBfcmVhZF9yZWcoY2xpZW50LCBMTTkwX1JFR19SX0NPTlZS
QVRFKTsgQEANCj4gPiAtMTcyNyw3ICsxNzI4LDggQEAgc3RhdGljIGludCBsbTkwX2luaXRfY2xp
ZW50KHN0cnVjdCBpMmNfY2xpZW50DQo+ID4gKmNsaWVudCwgc3RydWN0IGxtOTBfZGF0YSAqZGF0
YSkNCj4gPg0KPiA+ICAgICAgIC8qIENoZWNrIFRlbXBlcmF0dXJlIFJhbmdlIFNlbGVjdCAqLw0K
PiA+ICAgICAgIGlmIChkYXRhLT5mbGFncyAmIExNOTBfSEFWRV9FWFRFTkRFRF9URU1QKSB7DQo+
ID4gLSAgICAgICAgICAgICBpZiAoY29uZmlnICYgMHgwNCkNCj4gPiArICAgICAgICAgICAgIGlm
IChjb25maWcgJiAweDA0IHx8DQo+ID4gKyAgICAgICAgICAgICAgICAgb2ZfcHJvcGVydHlfcmVh
ZF9ib29sKG5wLA0KPiA+ICsgIm9uc2VtaSxleHRlbmRlZC1yYW5nZS1lbmFibGUiKSkNCj4gPiAg
ICAgICAgICAgICAgICAgICAgICAgZGF0YS0+ZmxhZ3MgfD0gTE05MF9GTEFHX0FEVDc0NjFfRVhU
Ow0KPiANCj4gTWF5YmUgSSBhbSBtaXNzaW5nIHNvbWV0aGluZywgYnV0IEkgZG9uJ3Qgc2VlIHRo
ZSBtYXRjaGluZyBjb25maWd1cmF0aW9uDQo+IGNoYW5nZS4gU3BlY2lmeWluZyB0aGUgZmxhZyBp
biBkZXZpY2V0cmVlIG9ubHkgcmVhbGx5IG1ha2VzIHNlbnNlIGlmIHRoZSBjaGlwDQo+IGNvbmZp
Z3VyYXRpb24gaXMgY2hhbmdlZCBhY2NvcmRpbmdseS4NCj4gDQoNCm9vcHMgeW91IGFyZSBhYnNv
bHV0ZWx5IHJpZ2h0IEkgbWlzc2VkIHRoYXQuIEkgZGlkbid0IHNhdyB0aGlzIGluIG15IHRlc3Qg
YXMNCnRoZSBjb25maWcgd2FzIHN0aWxsIHByZXNlbnQgZnJvbSB0aGUgcHJldmlvdXMgcnVuIHdp
dGggbXkgb2xkIGtlcm5lbCB3ZXJlIA0KdGhpcyB3YXMgaGFyZCBjb2RlZCBhbmQgdGhlIGNvbmZp
ZyBzdXJ2aXZlZCBhZnRlciB3YXJtIHN0YXJ0Lg0KDQpCZXN0IHJlZ2FyZHMNCkhvbGdlcg0KDQog
DQo=
