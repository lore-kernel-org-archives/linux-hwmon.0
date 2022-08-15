Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E497BC00140
	for <linux-hwmon@archiver.kernel.org>; Mon, 15 Aug 2022 06:50:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241070AbiHOGu1 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 15 Aug 2022 02:50:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241085AbiHOGuU (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 15 Aug 2022 02:50:20 -0400
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2094.outbound.protection.outlook.com [40.107.117.94])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8C981B79C
        for <linux-hwmon@vger.kernel.org>; Sun, 14 Aug 2022 23:50:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m6s35C+H5cUmqtF7NG7vTjuku1pHyhfclA7G+p1FCVfLbf3KXzUldhpa4dZYuXOKlRszPLj2TqukxnPrWsHLmAsDGoGztLm/wspvYe0BqCFNemqaf2MrK6p1O7Z84OwCwspVIKGMB/oQ4qOXTHd7OaqiHdJeAJLbKZdyRBI2jkoETpr2kHvshRKo5vJQiS6nYp+ag6tYb9/XwkJ3n2pV2r9MAPt9k0pmBMJjdSokrhfXwKwAvt2xrF8F9NRjQ/cRWbKFXpQXy4+pK7sO6uHcpcM0/U3c4TM07jY9W426n4YIVn2NNUEQ5H2UBWREaRWUD5cVT4EImuI5Lasi6vpzKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DPHAipZ8dOyo4CtQdaKTasjZ5DdydAUAapJrR1gfksM=;
 b=NFoz6JbaS2q+9Hfc8KQmXNME7WQ4rcykTLaawOBklJ6pPVIKAtdunDvBw/vwC1Y1s5wwhcjmrwdilQEkZXgnwYsqvtxL0zkU9LgsNAiu7I3AD5rq8JSSXoJP8xF00HX+LZ/pOdXLAuipELvWH7U/CAdyklLsrhQ4Uowxf5YV9+YezjiKmUfXPC6hPa+Pt35PYlTg/tW3RDY9+tDfXmqIILRz2GypIXHWH7aaWyyLru8tcaK78dwaDnM0hH6u/ObEIPLnuAdgKPBnD/Q4lyG0EZR+db+hCzqa4sCdFB6whxJVHVtqADeAIO1IzeEfrhsVb0ZFw3iFHcB7ak7Cd/gXMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DPHAipZ8dOyo4CtQdaKTasjZ5DdydAUAapJrR1gfksM=;
 b=M8Hd4Ex//fRqO+JjbRckqu+JPuoEkRwKE2UoufMtbK6rSaZm+akEBr8UuI5JLEdt0Wfo1uyMmQ2kGY5H8IwkKqoziNreUDzeJfYJ4RB8BtWyyLCSrIFhi3obeQkCl/r6U1Y2dyCDWIwWm5jT3VL3A/nk1ok2cm/IZoN3Y8a7tJ0e0ycEjcVxslCi7l7P6Zig0NB+PLtCbiC4AcGY5avM9nRssXHU6iSuhPm5VNiMXQlVaemN7kFiJXJzL1xlbeH3fllC0oNSy9GmJmUk8JYE0dAQTOmKD46VsA0zqX1NeIz8igbk9weCteDEsQ+jT2FavgrQpXllArWi9GwIuzHKFA==
Received: from HK0PR06MB3362.apcprd06.prod.outlook.com (2603:1096:203:8b::10)
 by PS2PR06MB3592.apcprd06.prod.outlook.com (2603:1096:300:62::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Mon, 15 Aug
 2022 06:50:07 +0000
Received: from HK0PR06MB3362.apcprd06.prod.outlook.com
 ([fe80::1812:ba2:a847:dcd2]) by HK0PR06MB3362.apcprd06.prod.outlook.com
 ([fe80::1812:ba2:a847:dcd2%7]) with mapi id 15.20.5504.018; Mon, 15 Aug 2022
 06:50:07 +0000
From:   Billy Tsai <billy_tsai@aspeedtech.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Akinobu Mita <akinobu.mita@gmail.com>
CC:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH 1/2] hwmon: (pwm-fan) add option to leave fan on shutdown
Thread-Topic: [PATCH 1/2] hwmon: (pwm-fan) add option to leave fan on shutdown
Thread-Index: AQHXsCOe2FNL8sJbDk+9evk0Fc7dCqvN+eGAgeQSdQA=
Date:   Mon, 15 Aug 2022 06:50:07 +0000
Message-ID: <D056E665-7386-42E0-8A16-383B66FA3179@aspeedtech.com>
References: <20210923023448.4190-1-akinobu.mita@gmail.com>
 <20211011143421.GA2374570@roeck-us.net>
In-Reply-To: <20211011143421.GA2374570@roeck-us.net>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/16.63.22070801
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 137ef108-231c-401a-678c-08da7e8a63c5
x-ms-traffictypediagnostic: PS2PR06MB3592:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BTss5BguEw3pyvnaaxUwLQLoYn4FuEJtjlgzhJxJIH+28yEIGLSYOVHp8L2rHjqfkRtqZM3orLIkzoK6zzL/2XzVZKyzVS7fC6hnEveQNozoCWRN6rCzJPddgmeAmAl50LHuYwMFht9TZXNGRI1GbSnAfgEPJJMRaNh6Br2dGE25zZLYVrqjBBWrscFvehmS0QXKwRrF8qrzwVS9FLp+VBoXOS7AA3Ioc4DnP86bjzJJMGaM74SZlrwRuMtYHa2LTy79CJqrUKluEKcnaMd0pYt+3+G/n/nrd7J+aAfQyk2Jb8I1wbKSBt7B7VFNlul5SuIS2dD0nURqsoTAU+OmAmaq1Et0057ODrZRf8gOEj87yDmCHXWmz7rUTD4SIUJPWL4GnDrCQkMYptHskgk6/1OSbfgqodyhpBXev7CFOFoXAI60so4JkBD/D5J3cnF5MScV9mQQP5JdyHLWEH5rPghlXutDvo6VlLXKzKf7slhV2IHi0aWL20swz2oRtZChPCBZsnU/k4oO2rgb1eUqZXBr0Cmk8q39n3IFrFaXHg/WHbz27TAZ1k5/UdkE9aaZrbBNWNjN7cHGAjruvwY/ZQUnACgALn2FLiot/39xOsnxVFcr/ltQa+6xKJlcdPkFSjQB7dy/2Z0gKj3tRi7QPIfMfEBmNUPxjd80YF1fepYsl0Kd+mOpC/khSS1u2NJ2FTq3i6ZPgeylBgHangt8YoWsR7QQ/VjImAUoTLx4lNrDISy3sckoKNbrcVnIwkpUQ0JkOxdrXvdpHwlExPwGnerFtbFiEetc7rLoxW4JuybsEFTtdgJy0jLrW1Hjo9CUsDdCFUEywPu/9MiE16bMRA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HK0PR06MB3362.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(376002)(39840400004)(366004)(346002)(396003)(38100700002)(2906002)(66556008)(33656002)(76116006)(4326008)(8676002)(66476007)(66946007)(86362001)(36756003)(91956017)(110136005)(122000001)(64756008)(66446008)(38070700005)(83380400001)(2616005)(478600001)(186003)(41300700001)(71200400001)(6512007)(6506007)(6486002)(26005)(53546011)(54906003)(316002)(5660300002)(8936002)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TmEwUFF6VTV2YlJZcXh2NVBWV2hTUnRteXFpZHZVaW1Ucm1lcU0rMXRLTG9p?=
 =?utf-8?B?VkQ5bFlLYnFrUDhiN3czdCtMTjExT01jMjh4V2RvbmhFcmRCV1ovc1lpRFJu?=
 =?utf-8?B?TktVdDRJYzQ5S1lhejNYcjJFWm1kY245eEcveGk2a1NnOVBxOXFLdzZ2OUVh?=
 =?utf-8?B?SXc3SXV0V1JrU3Z1ampiODZ3OE9ETmkwWXB2d0FOMzRZZ0pTcUFZaXJGVDJQ?=
 =?utf-8?B?NDVqcFJsMkxVQTFKbDhPOTVsSFdZR0cyOUdyRFNWZnIxdmRuNEZOcjlwT243?=
 =?utf-8?B?MExnaGVvYkNIYy94OUQ1ZHVjQ210NGtYZTJlS2dkZlFEMUFTUlBQVFFWd3ZH?=
 =?utf-8?B?QnhvNGVtTVZvSU9zRHkwT01ocE9iWDlVRDNBV05TNDVYZzByUHNtd2V6aXBB?=
 =?utf-8?B?YVQ0ZHdoK2VPZGtQa29iaFNOL2VEZWhwSXZVVDZ0cUNMVkdqanVoL29adnR1?=
 =?utf-8?B?bHJ2T1ZSKytRNVhvS3lVVkM5THU4aUdNMkRqNHM4RmVOT1E2NkpKMTJHR2xz?=
 =?utf-8?B?dFpYbXpmSER2RjJXdE5CZ3lsZmdtcHlWUkZBY2lwTll0Yk42OWw0bU9Za3Qx?=
 =?utf-8?B?TGk4clFYK1hVZ2FEd2xUUDFvUlBSK2JvSEduUEQvRWNxU2JUa3h2U3JkOVZE?=
 =?utf-8?B?NjJVY2grRnVqL2VYczRzaU8zUFh1TnVLc1hSejFuNStGQ1MxYjFBcE0yNkY4?=
 =?utf-8?B?SmE5RHRRUGdmYTBhd0F0aDdNYm9HaS83c3RwRStCaC91UHpOMGJKdFREcGFY?=
 =?utf-8?B?c3VxUHBWTUVybjZjUFozQ0ZrRnh6NTViZ0E4OTYrM3JvN1Bma2VDdUlaaHMr?=
 =?utf-8?B?eXMzQ296RFFrZ0FXelJwYXl2NFZ4TzZnMk5wQ2RjVmRQZWI0UkJWSlV2bVFQ?=
 =?utf-8?B?MVBOQXRUcFYrdWR3RDZUb0xWM2FNVkNuTFBPb2gzQ0crZnBoemJMNXFmWUJ0?=
 =?utf-8?B?aEt0emRYelBvK0pzQmRwOUdsOW5ucGdqOFRkMk5QMkVuU25YME05ZEhUM3pu?=
 =?utf-8?B?Slhtb1grOEUvOFUwSzlzYVZWUk9DdGRyK2ViZmU1N0J1dHd1aTNoZk04R0Zl?=
 =?utf-8?B?TWtPcU56c3NRRXZKcCs5cUdFT3pBZFlFR1R6T3FTOE9jZHF3dXdUQUpPWGNQ?=
 =?utf-8?B?SnBJT1lKRFJvQjZiZ0xlMFV1d0xLYnVTcUJ2SXVYNDZMWGM5L2RRVGI1VVpl?=
 =?utf-8?B?SHRmNUM1WllwZVpucnBmSnV0V0d4cTNGbTFqZnNNYUFhWmhPdEhvQ09HOWx3?=
 =?utf-8?B?OStWNTRpRlRyWGlLVTdqRWgycmVEU0gzZDhGelpPbDBNY2RZL000ZHJwc1lx?=
 =?utf-8?B?MHVoOFowOHA0RFQzU0UwTWkxOHhaRFFmb1dIclQvbDUxWVBpaktpMVZUcnJ3?=
 =?utf-8?B?M0phTEY1Y1o0R3BqYlZQQ0pFVGZscGFjYlZld0JON2hKbGlTVGs5TVFzeThD?=
 =?utf-8?B?YXAraEMrSERsSHRzdkgxOGtrY2RDUGladWVUbnhWVFNwUGFUWk1jK1BhMlpE?=
 =?utf-8?B?dWl6ZDZZdm1FbDBsUTN6UERMN2FsSlQ2MGR2OWpOYSthK1NaSGp2c1dzYjJ5?=
 =?utf-8?B?UU45aDFrVmZjOTBFMjFJZGRQdCtDSlFaM2kyRmpndE1zZktBUDR6OXgyRTdq?=
 =?utf-8?B?N09QZlpWVFZjVU1mVnhPM205MzhibkFBUzJJSmM1TVhFN1pZa3lkMERKdFhz?=
 =?utf-8?B?RldNMWZ6L3JlTFJWOXlPVWVkVTdhSUw3N0tBTFZJbVhIUTFBZTZHN0R3Tkk3?=
 =?utf-8?B?OVdldnUyM1FTdENrckdSVlR6RTFLR01sV3Ewc1hLNU16bGxSQ3JsdlY2SUpQ?=
 =?utf-8?B?N1JZQ3YrbEY3NmVFN1N3QU5NbWxBczdUMzJ5dTd2bEVha2YxL1hvNjBTYnhw?=
 =?utf-8?B?YUhmQ1YrTUdXSEtheUUyTWNvMnFLeXVKWTJNdExRRFJnOHJ4Vm13WCtwTjZB?=
 =?utf-8?B?WGE3aXN5NTV6TkxReDRWa2dWbkF1SllYMndqanNnMUd1eGRxaHJjdHRGaEJS?=
 =?utf-8?B?SFM0SFFpbjdKczFVMzM5TDBESnJScmMwN2NWOVRyNVc0UVg2cFlpM2JSNGcy?=
 =?utf-8?B?VytybFNJYjJNRGR2dm9UUSthTVFvTkZERThEeXU1V1lxT3VDdnhLQkh4Y0ZJ?=
 =?utf-8?B?OEpNT3AxZmMvNDVPY1M1YVpUT04yd1F6T2xzS3BjaUx5cU9KdCtaanAyL01h?=
 =?utf-8?B?RWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <702E924152C8CE4DB5E2082D929116E7@apcprd06.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB3362.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 137ef108-231c-401a-678c-08da7e8a63c5
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2022 06:50:07.0189
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Fxxd/8g3xABceW1rmJ2oWWaBZ1CEObbG56OZu+h88rCv2gRNHaQ1t3K/aDmc+HJ2dY17x4B6QFq2GejxpZL7CoEvNKimlBPS17H5ck3/bOo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS2PR06MB3592
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

DQpPbiAyMDIxLzEwLzExLCAxMDozNCBQTSwgIkd1ZW50ZXIgUm9lY2siIDxncm9lY2s3QGdtYWls
LmNvbSBvbiBiZWhhbGYgb2YgbGludXhAcm9lY2stdXMubmV0PiB3cm90ZToNCg0KICAgIE9uIFRo
dSwgU2VwIDIzLCAyMDIxIGF0IDExOjM0OjQ3QU0gKzA5MDAsIEFraW5vYnUgTWl0YSB3cm90ZToN
CiAgICA+ID4gVGhpcyBhZGRzIGFuIG9wdGlvbmFsIHByb3BlcnR5ICJyZXRhaW4tc3RhdGUtc2h1
dGRvd24iIGFzIHJlcXVlc3RlZCBieQ0KICAgID4gPiBCaWxseSBUc2FpLg0KICAgID4gPiANCiAg
ICA+ID4gQmlsbHkgc2FpZDoNCiAgICA+ID4gICJPdXIgcGxhdGZvcm0gaXMgQk1DIHRoYXQgd2ls
bCB1c2UgYSBQV00tRkFOIGRyaXZlciB0byBjb250cm9sIHRoZSBmYW4NCiAgICA+ID4gIG9uIHRo
ZSBtYW5hZ2VkIGhvc3QuIEluIG91ciBjYXNlLCB3ZSBkbyBub3Qgd2FudCB0byBzdG9wIHRoZSBm
YW4gd2hlbg0KICAgID4gPiAgdGhlIEJNQyBpcyByZWJvb3QsIHdoaWNoIG1heSBjYXVzZSB0aGUg
dGVtcGVyYXR1cmUgb2YgdGhlIG1hbmFnZWQgaG9zdA0KICAgID4gPiAgbm90IHRvIGJlIGxvd2Vy
ZWQuIg0KICAgID4gPiANCiAgICA+ID4gQ2M6IFJvYiBIZXJyaW5nIDxyb2JoK2R0QGtlcm5lbC5v
cmc+DQogICAgPiA+IENjOiBCYXJ0bG9taWVqIFpvbG5pZXJraWV3aWN6IDxiLnpvbG5pZXJraWVA
c2Ftc3VuZy5jb20+DQogICAgPiA+IENjOiBHdWVudGVyIFJvZWNrIDxsaW51eEByb2Vjay11cy5u
ZXQ+DQogICAgPiA+IENjOiBCaWxseSBUc2FpIDxiaWxseV90c2FpQGFzcGVlZHRlY2guY29tPg0K
ICAgID4gPiBTaWduZWQtb2ZmLWJ5OiBBa2lub2J1IE1pdGEgPGFraW5vYnUubWl0YUBnbWFpbC5j
b20+DQoNCiAgICA+IEZvciBteSByZWZlcmVuY2UgKHdhaXRpbmcgZm9yIERUIHByb3BlcnR5IGFw
cHJvdmFsKToNCg0KICAgID4gUmV2aWV3ZWQtYnk6IEd1ZW50ZXIgUm9lY2sgPGxpbnV4QHJvZWNr
LXVzLm5ldD4NCiANCiAgICA+IEd1ZW50ZXINCg0KUmV2aWV3ZWQtYnk6IEJpbGx5IFRzYWkgPGJp
bGx5X3RzYWlAYXNwZWVkdGVjaC5jb20+DQoNCkJpbGx5DQoNCiAgICA+ID4gLS0tDQogICAgPiA+
ICBkcml2ZXJzL2h3bW9uL3B3bS1mYW4uYyB8IDkgKysrKysrKystDQogICAgPiA+ICAxIGZpbGUg
Y2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQogICAgPiA+IA0KICAgID4g
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9od21vbi9wd20tZmFuLmMgYi9kcml2ZXJzL2h3bW9uL3B3
bS1mYW4uYw0KICAgID4gPiBpbmRleCAxNzUxOGI0Y2FiMWIuLjFlYTBkMDU2MmMyOCAxMDA2NDQN
CiAgICA+ID4gLS0tIGEvZHJpdmVycy9od21vbi9wd20tZmFuLmMNCiAgICA+ID4gKysrIGIvZHJp
dmVycy9od21vbi9wd20tZmFuLmMNCiAgICA+ID4gQEAgLTM4LDYgKzM4LDcgQEAgc3RydWN0IHB3
bV9mYW5fY3R4IHsNCiAgICA+ID4gIAlzdHJ1Y3QgcHdtX2Zhbl90YWNoICp0YWNoczsNCiAgICA+
ID4gIAlrdGltZV90IHNhbXBsZV9zdGFydDsNCiAgICA+ID4gIAlzdHJ1Y3QgdGltZXJfbGlzdCBy
cG1fdGltZXI7DQogICAgPiA+ICsJYm9vbCByZXRhaW5fc3RhdGVfc2h1dGRvd247DQogICAgPiA+
ICANCiAgICA+ID4gIAl1bnNpZ25lZCBpbnQgcHdtX3ZhbHVlOw0KICAgID4gPiAgCXVuc2lnbmVk
IGludCBwd21fZmFuX3N0YXRlOw0KICAgID4gPiBAQCAtMzEyLDYgKzMxMyw5IEBAIHN0YXRpYyBp
bnQgcHdtX2Zhbl9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KICAgID4gPiAg
DQogICAgPiA+ICAJbXV0ZXhfaW5pdCgmY3R4LT5sb2NrKTsNCiAgICA+ID4gIA0KICAgID4gPiAr
CWN0eC0+cmV0YWluX3N0YXRlX3NodXRkb3duID0NCiAgICA+ID4gKwkJb2ZfcHJvcGVydHlfcmVh
ZF9ib29sKGRldi0+b2Zfbm9kZSwgInJldGFpbi1zdGF0ZS1zaHV0ZG93biIpOw0KICAgID4gPiAr
DQogICAgPiA+ICAJY3R4LT5wd20gPSBkZXZtX29mX3B3bV9nZXQoZGV2LCBkZXYtPm9mX25vZGUs
IE5VTEwpOw0KICAgID4gPiAgCWlmIChJU19FUlIoY3R4LT5wd20pKQ0KICAgID4gPiAgCQlyZXR1
cm4gZGV2X2Vycl9wcm9iZShkZXYsIFBUUl9FUlIoY3R4LT5wd20pLCAiQ291bGQgbm90IGdldCBQ
V01cbiIpOw0KICAgID4gPiBAQCAtNDkyLDcgKzQ5NiwxMCBAQCBzdGF0aWMgaW50IHB3bV9mYW5f
ZGlzYWJsZShzdHJ1Y3QgZGV2aWNlICpkZXYpDQogICAgPiA+ICANCiAgICA+ID4gIHN0YXRpYyB2
b2lkIHB3bV9mYW5fc2h1dGRvd24oc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCiAgICA+
ID4gIHsNCiAgICA+ID4gLQlwd21fZmFuX2Rpc2FibGUoJnBkZXYtPmRldik7DQogICAgPiA+ICsJ
c3RydWN0IHB3bV9mYW5fY3R4ICpjdHggPSBwbGF0Zm9ybV9nZXRfZHJ2ZGF0YShwZGV2KTsNCiAg
ICA+ID4gKw0KICAgID4gPiArCWlmICghY3R4LT5yZXRhaW5fc3RhdGVfc2h1dGRvd24pDQogICAg
PiA+ICsJCXB3bV9mYW5fZGlzYWJsZSgmcGRldi0+ZGV2KTsNCiAgICA+ID4gIH0NCiAgICA+ID4g
IA0KICAgID4gPiAgI2lmZGVmIENPTkZJR19QTV9TTEVFUA0KDQo=
