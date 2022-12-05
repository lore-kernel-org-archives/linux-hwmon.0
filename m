Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BEF7C4332F
	for <linux-hwmon@archiver.kernel.org>; Mon,  5 Dec 2022 18:33:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233480AbiLESdd (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 5 Dec 2022 13:33:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233546AbiLESdR (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 5 Dec 2022 13:33:17 -0500
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on20629.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eab::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 519002251F
        for <linux-hwmon@vger.kernel.org>; Mon,  5 Dec 2022 10:28:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LbUjd1/Pc2nWydV+SQabDncCx3cGOfMek3eES+Y+m11V/Acp/iurpSzWZwjbCw+b+XmaXTvreZUDTcm2lmSCrNKkIL5Ies0phQiSp1PQ/6UTR/0iwZJ9F3vmwhSmF43Vd2DSHTOSbH7cp8VjUVaOXTWUxTuwboO0VTlR5jbEBaLOBZMGyGei+CeVyOYCVIADBB8fhEOvONHWdtq43i2iBF4TtDHiSMInu6vU8P6aiV57RA43SJdbo7ufpFron3PSvywiGQwVmLoJLHX+SQyBYNmJjY3A6MNaxK2WVFiGbFuOo3X1J2+b0OnkE1GQLwipi/gbMY6eImFbKxD8MhDA5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q5jUTDGehY9EMJV9EKa/Jrs/AJpKRxx9+fmXCEsrhH0=;
 b=CTeLIVmxuLzYAHavkg6htK6o4ZvMZX5b0NVuPa7ZhuiEKe3VoVWOyl3M0cCWe0kMWGGWp63O7P8oCf0kYc/C7MJqqSyjstMdvdwtgVt6WGdd3CGJCTh8OF3iBVFoxnHAxerbu2VRC/xdPaQqANJMlc5BBH1cXkvaOwaBqAUkO1WvP+EVdx6bv2XDdlN/ISddxrDYH9Pdr90JVw8kIDSDMmxh8KSkWCJk1Bg3eXvkBrOsYHDCTKHV0FtGzCLECDmwucjRJ9F4uZSDXV3yS9zy9IGdaGzBMJWsZF6PQKSp0YH15ufKr42F2ISdKa/BZCX+nbjtnUaqTFbitE3ADiv/LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q5jUTDGehY9EMJV9EKa/Jrs/AJpKRxx9+fmXCEsrhH0=;
 b=kGW+sRQpFbTKXXgoT+ucd6S5DCj2fzmzl+wL/+zavrL2upZzVOL7mCJT7tl9yGWFZv5cRJlpgtvKrzW6ijhcSLHELtywg/RRcGNE9mCKkqHPwK60uXI06ZPeiFMA3R64ZFGVKkd6tIs16unNSrFHI/rdAbe9UDfGHe0kb5mpkHzIFrZE5iW3nLTpVDiwNEwHZ0HrQOapUBRhkGy1tDB6O8CJgV2t2sZ8i/1cfAXiR46HzxUsPAuBMXsb562W8BwmY1pb44/fOceCdRAqdzn8ZHtTCTozZPjeBipZ/IVYXOKxk51V9p6wY+VXTK/ujxTY5NXccPHw07HB7Hf+g4MxEw==
Received: from DM6PR12MB4074.namprd12.prod.outlook.com (2603:10b6:5:218::11)
 by MN2PR12MB4423.namprd12.prod.outlook.com (2603:10b6:208:24f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Mon, 5 Dec
 2022 18:27:20 +0000
Received: from DM6PR12MB4074.namprd12.prod.outlook.com
 ([fe80::df1c:cbcc:7a30:4760]) by DM6PR12MB4074.namprd12.prod.outlook.com
 ([fe80::df1c:cbcc:7a30:4760%6]) with mapi id 15.20.5880.014; Mon, 5 Dec 2022
 18:27:20 +0000
From:   Michael Shych <michaelsh@nvidia.com>
To:     Xingjiang Qiao <nanpuyue@gmail.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
CC:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: RE: [PATCH 2/2] hwmon: (emc2305) fix pwm never being able to set
 lower
Thread-Topic: [PATCH 2/2] hwmon: (emc2305) fix pwm never being able to set
 lower
Thread-Index: AQHZCNAsR128Y9NAlk+phx3LPE1duq5fnAig
Date:   Mon, 5 Dec 2022 18:27:20 +0000
Message-ID: <DM6PR12MB40742D85F5F8932F81C8C34DD4189@DM6PR12MB4074.namprd12.prod.outlook.com>
References: <20221205173611.145571-1-nanpuyue@gmail.com>
 <20221205173611.145571-2-nanpuyue@gmail.com>
In-Reply-To: <20221205173611.145571-2-nanpuyue@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR12MB4074:EE_|MN2PR12MB4423:EE_
x-ms-office365-filtering-correlation-id: 1fe7d633-2f9e-4a40-0b34-08dad6ee5877
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EWXQGFJ4apzwCh5rr+Jh2CV0Sjz2G7nP78rXx/Qbh9lj2ytkb1mAYQ1njFYahz9mE1PoHrzZgMPM6kcWBstBBKhxlp0PBA2Tf1Pk153Zn4HLrH6M7qkFmluJ37HDiPnvNkWAvl+FwtUvImITF6lyP71xutDRpsJSleoe/q5kQUIESvhgD5lighe2zoMwDpJFMCUOf7BSTbOzjim0IUBzuuf+klqjasM0xUO/V7rj16R0SSfIAucYb4gg0Lc2zn3EAzhLwzT+WPpMDouieu2G4hmUowYeiq8Bp3tucjZ7C0d8jOXOSYAioW8er0Ex6YaggOwSGwK7VaRy+/G72pCl1t0sXJ/idoNTX8Oq7zSAhrsK/DqHIaVVu2Q9vg57lTmS1cD54Q+lG79X4I78z9179WVBOq3iUdxfuY2/Y6GGHltLQ/WvD6C4insYNXEjCTjbodfWnBZH+GFWHh8wNFort1fBVyuXhmJcQGdFN+H17PdFt6am22s+ysbc/oMbKc06DpssXMUw6igbncevTbdnYH8YTmbrozjySVsQ5gaHW/eZ2O1Zc75viU8lkddW3P3vwXSnDdYvfvbUc1Fg5iRrNyfAJe8uaHKPA3/il48WgGE8kibnnm0a58ReSUxNUHkCNOG6bW+ZpESO5XE5NdjbpHu/PMK7NNHkEaVqVYdaR3k1FAVgE/3zLQZV6MOA9kk8MyXYDTZYub1w+Ju2QE7N4Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4074.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(396003)(136003)(346002)(376002)(39860400002)(451199015)(55016003)(38070700005)(33656002)(86362001)(71200400001)(7696005)(6506007)(478600001)(53546011)(9686003)(26005)(8676002)(52536014)(5660300002)(41300700001)(8936002)(316002)(76116006)(64756008)(2906002)(110136005)(66446008)(66946007)(66556008)(66476007)(4326008)(83380400001)(38100700002)(122000001)(186003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ck41TGpsSHJOWGFnV0haSHJoRjR3NGsvb3FkcHIrQkYvNkZFa0xSM2pubDcw?=
 =?utf-8?B?T2tUQ21Zb2xSS0pIWVE4aTc5TjBwdlRGaWdlV0lpYnRZK3F1SjQyWTl3S3ps?=
 =?utf-8?B?Z0dZZVVWRVNTRHp3UXVVazUzWFRkUStSWVp3TU9VK2dJWkZ5WS9KQStTWTB0?=
 =?utf-8?B?OW9hY0kyd0RSSExWYnp0SUQvSk01S2dNdlNyR2RiVlk3eUxZK1lHN1RYa25L?=
 =?utf-8?B?eWhjUTJTOHU4NjlwWTVhQ0x4cHp0ZVpVUWtHM2g2azAxNVBkUUFaRTJMNlNk?=
 =?utf-8?B?VkhrNENLTmd6TzhJU082YlhhOU9QbURzSXpmUERPQzg5bkNPNnpyZi9ZdnJy?=
 =?utf-8?B?ZW9oQ1pJTnd6Y3ZjZ2tlbmVDbE55VWFRcGdxZS92SWNLeG41M0pBdThXWkxH?=
 =?utf-8?B?a1VDR1BHZ0ZkRkRzVFhDMjVFT29DTlNNT2Y5Q2tEUnJKbTB4SUFjcXdEN0Vx?=
 =?utf-8?B?MWo2Y1pKSjhiclZaNlBrRy9wZlcxU1VoeVJUMkhGRnlMMWJqTGRlbWxCN0JW?=
 =?utf-8?B?SWFZRzZKVW85YndpVjJZK09QSCsvRVlIU2xzV0VEL0kxSFZ0ZmlzMUdpbkdC?=
 =?utf-8?B?WWJoYUtZMXdNM3o3bHgzU0V6OUZ5SEJYTEhRMEllSTFGSXVSK1NJdUFLNE9a?=
 =?utf-8?B?bGE3eGJHcWpic1hseFNDTm5jVlM2V21ZVU8vYWtkRUV4V2ozMXRacVM1T3hY?=
 =?utf-8?B?dHBQbmR3eldWbG9CMFFoNGkvMnN6VlJEUm8yZS9GWXJmOHI5VldYeE5vWEJZ?=
 =?utf-8?B?YldDb1pWcXpXY2ZLZ243MHlLcGdoN2ViNjdPMHBqTDBpLzVNZE9pUGJlTnVp?=
 =?utf-8?B?MHhlZllhd1ppbjE4SEV3WWNBWWhZRkIvTHlHd2hOWFJzWUIzWWR5aU1pc1Rh?=
 =?utf-8?B?bU1iVWZISGRnajZCSFRvRFhqeDkvWXdmUlBaR3RmdXJrVDNZTjQxblduMW0v?=
 =?utf-8?B?WDFmdXU5ZzY5aFZFT2dLcENiSVViZERLTTNmYVR5Y09UOTFIeEExMXdoNlFr?=
 =?utf-8?B?V1gyNmJYcEVRVk9KbVJZSEsyTFE3dVBSTWpCeEJOUDNuZlVCaHNmdmZjdW9o?=
 =?utf-8?B?MDVDay9HUUR5eWFFYmNnLzZXRlVRSWVoc3ZRclIrcUZEaHhjRkRWdmt3bDZz?=
 =?utf-8?B?L0JMTGFCcTNzbG1mSkk1TjkvVndsMWUxekZvcGJONjMydVhucTVkR21NUVRE?=
 =?utf-8?B?aWs0aU9oNlZmdlFTekJxRC9wdDZvWEZkSEpzbGU0bmZQdE9LOVYrTWgwRStk?=
 =?utf-8?B?bTg1MWVFcWJaYTc4WCtQdkpSUmVGMHc4ZWhkZVkyRU1pcFdQeXhnNGROVXcz?=
 =?utf-8?B?K053RzIxZElwR2EyN251Sy82dzFQOUlNT1BGcStKMVdqd25WWk54bHBVSFJG?=
 =?utf-8?B?UE1WV3l1V093V2ZsQ052a3NkUDIyby9iTDdHM3k5U3duSFVsME9xTURUY21x?=
 =?utf-8?B?ZjRUZEpabU81bkFUVjBWVkRhSnBuc3h2SjZjdUVxTnoxNVNXSk9hMTdWbzd2?=
 =?utf-8?B?ajVRL0VBMFZRczZjbFlhSUZKdTFNQ2VKNWs5T2h1ZXNkenZ3L0xkU0RPekxI?=
 =?utf-8?B?ekxSbnhnOFdDbGpPc2tDemVuc0dkSmtUUENjUXNPRFNucUthTmxKOGFicXBH?=
 =?utf-8?B?cEszOVZ0dkxubUhKSmxwY3VBTnJ5aG1hT2VuQVk5Y1FlMlRnbEZXYzRPUjNT?=
 =?utf-8?B?UXlhMlFWTlhuMFVxK0ZRSnZKbG5ZY3pmcnF3WG9GbmVMK25RR1BlMU9zSVhE?=
 =?utf-8?B?WitkV0RpTkNWS05FVVozNjI3WUREM3VnUTZQY2VSZFVlUVM0QUFubjZaVlU4?=
 =?utf-8?B?cDRQeTVtNFJCSkJUQmM1WS9aN2NRVVV2RFlEamR1Nml4NnUrbXNnTGwrZUp2?=
 =?utf-8?B?UTNCcnBiWGpDRmREUVdhUTBPYmxLSTFXZnRuYmE5bUFGS1ExVVpkdWlqZTZP?=
 =?utf-8?B?c0pIMFErWjUxL0tmTXVKOVQ4MzBCMFdBQi96QzVSRCtPOVpjUFZVRDByVVBt?=
 =?utf-8?B?ZS9rYitNUm13U3ZhMmlOMFowZlBud1E4WWp2YU1nam9HWXI4anBseUFjemVX?=
 =?utf-8?B?dDZMZmdyL3Y0SUtRb0FCdThJdGpjdm1SSlE2LzZtcmRxTlE0YzFscUhpQkFB?=
 =?utf-8?Q?Sp/v8oBY0I+gYP7ZmUctUs+1O?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4074.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fe7d633-2f9e-4a40-0b34-08dad6ee5877
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2022 18:27:20.0465
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yE1jHTVkRyyX7Jef07gjzte7l8IBnGUbz+jLPlC09LjRZLBXqjZXrM1OXvCHNdnkhKiqAOJtGmmLFgGQralYcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4423
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

SGksDQoNClRoaXMgaXMgaW50ZW50aW9uIC0gdG8gc2V0IGxvdyBsaW1pdCB0aHJvdWdoICdod21v
bicuIA0KVGh1cywgaWYgaXQgaXMgc2V0IHRocm91Z2ggJ2h3b20nLCBjb29saW5nIHN0YXRlIGlz
IGxpbWl0ZWQgYW5kIG5vdCBhbGxvd2VkIHRvIGJlIHNldCB0byBhIGxvd2VyIHZhbHVlLg0KSWYg
dXNlciBkb2Vzbid0IHdhbnQgdGhpcyBmZWF0dXJlLCBoZSBpcyBub3Qgc3VwcG9zZWQgdG8gdXNl
ICdod21vbicgZm9yIGZhbiBzcGVlZCBzZXR0aW5nLg0KDQpSZWdhcmRzLA0KICAgTWljaGFlbC4N
Cg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBYaW5namlhbmcgUWlhbyA8
bmFucHV5dWVAZ21haWwuY29tPg0KPiBTZW50OiBNb25kYXksIERlY2VtYmVyIDUsIDIwMjIgNzoz
NiBQTQ0KPiBUbzogR3VlbnRlciBSb2VjayA8bGludXhAcm9lY2stdXMubmV0PjsgSmVhbiBEZWx2
YXJlDQo+IDxqZGVsdmFyZUBzdXNlLmNvbT4NCj4gQ2M6IE1pY2hhZWwgU2h5Y2ggPG1pY2hhZWxz
aEBudmlkaWEuY29tPjsgWGluZ2ppYW5nIFFpYW8NCj4gPG5hbnB1eXVlQGdtYWlsLmNvbT47IGxp
bnV4LWh3bW9uQHZnZXIua2VybmVsLm9yZw0KPiBTdWJqZWN0OiBbUEFUQ0ggMi8yXSBod21vbjog
KGVtYzIzMDUpIGZpeCBwd20gbmV2ZXIgYmVpbmcgYWJsZSB0byBzZXQNCj4gbG93ZXINCj4gDQo+
IFRoZXJlIGFyZSBmaWVsZHMgJ2xhc3RfaHdtb25fc3RhdGUnIGFuZCAnbGFzdF90aGVybWFsX3N0
YXRlJyBpbiB0aGUgc3RydWN0dXJlDQo+ICdlbWMyMzA1X2NkZXZfZGF0YScsIHdoaWNoIHJlc3Bl
Y3RpdmVseSBzdG9yZSB0aGUgY29vbGluZyBzdGF0ZSBzZXQgYnkgdGhlDQo+ICdod21vbicgYW5k
ICd0aGVybWFsJyBzdWJzeXN0ZW0sIGFuZCB0aGUgZHJpdmVyIGF1dGhvciBob3BlcyB0aGF0IGlm
IHRoZQ0KPiBzdGF0ZSBzZXQgYnkgJ2h3bW9uJyBpcyBsb3dlciB0aGFuIHRoZSB2YWx1ZSBzZXQg
YnkgJ3RoZXJtYWwnLCB0aGUgZHJpdmVyIHdpbGwNCj4ganVzdCBzYXZlIGl0IHdpdGhvdXQgYWN0
dWFsbHkgc2V0dGluZyB0aGUgcHdtLiBDdXJyZW50bHksIHRoZQ0KPiAnbGFzdF90aGVybWFsX3N0
YXRlJyBhbHNvIGJlIHVwZGF0ZWQgYnkgJ2h3bW9uJywgd2hpY2ggd2lsbCBjYXVzZSB0aGUNCj4g
Y29vbGluZyBzdGF0ZSB0byBuZXZlciBiZSBzZXQgdG8gYSBsb3dlciB2YWx1ZS4gVGhpcyBwYXRj
aCBmaXhlcyB0aGF0Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogWGluZ2ppYW5nIFFpYW8gPG5hbnB1
eXVlQGdtYWlsLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2h3bW9uL2VtYzIzMDUuYyB8IDYgKyst
LS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQ0K
PiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaHdtb24vZW1jMjMwNS5jIGIvZHJpdmVycy9od21v
bi9lbWMyMzA1LmMgaW5kZXgNCj4gNGRmODQwNjVjYmZiLi5mNTE3NjBmOGFhODUgMTAwNjQ0DQo+
IC0tLSBhL2RyaXZlcnMvaHdtb24vZW1jMjMwNS5jDQo+ICsrKyBiL2RyaXZlcnMvaHdtb24vZW1j
MjMwNS5jDQo+IEBAIC0zOTgsMTEgKzM5OCw5IEBAIGVtYzIzMDVfd3JpdGUoc3RydWN0IGRldmlj
ZSAqZGV2LCBlbnVtDQo+IGh3bW9uX3NlbnNvcl90eXBlcyB0eXBlLCB1MzIgYXR0ciwgaW50IGNo
DQo+ICAJCQkJICogVXBkYXRlIFBXTSBvbmx5IGluIGNhc2UgcmVxdWVzdGVkIHN0YXRlDQo+IGlz
IG5vdCBsZXNzIHRoYW4gdGhlDQo+ICAJCQkJICogbGFzdCB0aGVybWFsIHN0YXRlLg0KPiAgCQkJ
CSAqLw0KPiAtCQkJCWlmIChkYXRhLQ0KPiA+Y2Rldl9kYXRhW2NkZXZfaWR4XS5sYXN0X2h3bW9u
X3N0YXRlID49DQo+ICsJCQkJaWYgKGRhdGEtDQo+ID5jZGV2X2RhdGFbY2Rldl9pZHhdLmxhc3Rf
aHdtb25fc3RhdGUgPA0KPiAgCQkJCSAgICBkYXRhLQ0KPiA+Y2Rldl9kYXRhW2NkZXZfaWR4XS5s
YXN0X3RoZXJtYWxfc3RhdGUpDQo+IC0JCQkJCXJldHVybiBlbWMyMzA1X3NldF9jdXJfc3RhdGUo
ZGF0YS0NCj4gPmNkZXZfZGF0YVtjZGV2X2lkeF0uY2RldiwNCj4gLQkJCQkJCQlkYXRhLQ0KPiA+
Y2Rldl9kYXRhW2NkZXZfaWR4XS5sYXN0X2h3bW9uX3N0YXRlKTsNCj4gLQkJCQlyZXR1cm4gMDsN
Cj4gKwkJCQkJcmV0dXJuIDA7DQo+ICAJCQl9DQo+ICAJCQlyZXR1cm4gZW1jMjMwNV9zZXRfcHdt
KGRldiwgdmFsLCBjaGFubmVsKTsNCj4gIAkJZGVmYXVsdDoNCj4gLS0NCj4gMi4zOC4xDQoNCg==
