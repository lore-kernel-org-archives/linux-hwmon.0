Return-Path: <SRS0=U1Yy=YE=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 635BAC47404
	for <linux-hwmon@archiver.kernel.org>; Fri, 11 Oct 2019 07:00:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 302F92196E
	for <linux-hwmon@archiver.kernel.org>; Fri, 11 Oct 2019 07:00:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=analog.onmicrosoft.com header.i=@analog.onmicrosoft.com header.b="2bU0KjL0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726698AbfJKHAW (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 11 Oct 2019 03:00:22 -0400
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77]:8934 "EHLO
        mx0a-00128a01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726679AbfJKHAW (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 11 Oct 2019 03:00:22 -0400
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
        by mx0a-00128a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id x9B6vlRd005464;
        Fri, 11 Oct 2019 02:59:53 -0400
Received: from nam04-sn1-obe.outbound.protection.outlook.com (mail-sn1nam04lp2055.outbound.protection.outlook.com [104.47.44.55])
        by mx0a-00128a01.pphosted.com with ESMTP id 2ven1a2ep6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 11 Oct 2019 02:59:53 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OkCzlvgJ4AVB49fKE/YC6zP9xGh4PSA4pNS5sIy5wFJIV1yBOoUzSeSOM2VQY5UAVaNqNOtqxTdmGKlL9Biu+uTeQdkqFaZjncyYDIaRibcYyGsJRo/OaM/4elLCW5jZ7Z5C9ZR1qXfNLJ7uyH6heaWe9EjoUBuWiCZqKkXKsTeLzUFLeAE+GM7nYsubDU1zK0mhtyVUkNGQKeoL4EOVROclkbq4AOPFUJt1CEIKdYeRJmd5T0DHEXxnXvQY5RUr2++q4ZL7/+hXFJUNA1LeRA/fSmCSF73M40mGKGWwqqhkVt/fj/lpi4+a3qNz6ADZuycQagr+/dLCflZK/ji+vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ElKUqj/u7++maVDo5EsXu2dWDTS7II23eFEM0qX9s/g=;
 b=hfkTUltiDTuEl8i6/gk9JVDTcy/P05E6UuQFLfETxGbre9//mkpttMk5q+HT4XupRO8jVeCTxsbupLXd5ffdxvVSt6qYq8UkWRJdYRhMkoGGnYZvL4c388LO+2ok7h+e/Ngz0v/LgqvPhH1dUSmLhyla9nFHHIpkjYVOI3ttvbL6JPm3s/4EODRT1M/uAFusqMYsiVp2DA3EZbVFX6YqAEkb9b0fk4Z+FKpS6qo8hwhLNLMdr8A5QYqtoRDQXLvcGzFZ92FkMtvKnJzbIQdnEvmzzdqxHTQuqG5N6qUUPTacgs1pI50bU1aPT3BNc0A09iitffY2Q3tK0x4i+Kk4Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ElKUqj/u7++maVDo5EsXu2dWDTS7II23eFEM0qX9s/g=;
 b=2bU0KjL0Y/6Yz8ZoMqVb839Z/bND0HlKnit6P7G+Z2uz48W6oCZMVo7OHeDvNMiGEddBbg2O5EG+g5SfV2MD9Ay7S9qzsmKbOzhWBB7K6cbnXZvMD9NxlWkY3teqYtYxTzgDMtUfPN4EdZ7YlK3hkY1BgNUTrLATrjdr8GnIzgs=
Received: from DM6PR03MB5116.namprd03.prod.outlook.com (10.141.160.208) by
 DM6PR03MB4361.namprd03.prod.outlook.com (20.178.24.202) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.18; Fri, 11 Oct 2019 06:59:50 +0000
Received: from DM6PR03MB5116.namprd03.prod.outlook.com
 ([fe80::9459:e78f:c095:e8f3]) by DM6PR03MB5116.namprd03.prod.outlook.com
 ([fe80::9459:e78f:c095:e8f3%3]) with mapi id 15.20.2347.021; Fri, 11 Oct 2019
 06:59:50 +0000
From:   "Sa, Nuno" <Nuno.Sa@analog.com>
To:     "linux@roeck-us.net" <linux@roeck-us.net>
CC:     "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "corbet@lwn.net" <corbet@lwn.net>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "jdelvare@suse.com" <jdelvare@suse.com>
Subject: Re: [PATCH 2/3] hwmon: Add support for ltc2947
Thread-Topic: [PATCH 2/3] hwmon: Add support for ltc2947
Thread-Index: AQHVfQ0JfzZtaDJjC0uzTOP32sZwk6dPQ3sAgAQ23oCAAIhGAIABBlqA
Date:   Fri, 11 Oct 2019 06:59:50 +0000
Message-ID: <966c8c4b35ade5f7fcff0850a9d17b62f50646f6.camel@analog.com>
References: <20190924124945.491326-1-nuno.sa@analog.com>
         <20190924124945.491326-3-nuno.sa@analog.com>
         <20191003041446.GA2332@roeck-us.net>
         <d0a992bebbc3c388b6be100d1821fa5813fcc1b4.camel@analog.com>
         <20191004150623.GA28287@roeck-us.net>
         <7d4ca133201f8c75855de6777f6018567701e16a.camel@analog.com>
         <94cf417f-90fa-50b8-9d4a-d7e4c9dd3d8d@roeck-us.net>
         <5f280daff806cb73a160d10f5ec97be18d42aebb.camel@analog.com>
         <ea52f348c9fab8c9a3c3417909053f4abb12cbcb.camel@analog.com>
         <20191010152118.GB4320@roeck-us.net>
In-Reply-To: <20191010152118.GB4320@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.71.226.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 924afa50-b7bc-4c3f-2b73-08d74e189c86
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: DM6PR03MB4361:
x-microsoft-antispam-prvs: <DM6PR03MB43616D1B5256E02C24F13C5399970@DM6PR03MB4361.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0187F3EA14
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(136003)(346002)(376002)(396003)(39860400002)(366004)(189003)(199004)(91956017)(14444005)(2906002)(256004)(476003)(6512007)(76116006)(66446008)(76176011)(66556008)(66476007)(81156014)(81166006)(2501003)(64756008)(3846002)(486006)(66946007)(8936002)(54906003)(6116002)(8676002)(4326008)(1730700003)(99286004)(26005)(186003)(102836004)(316002)(6506007)(66066001)(36756003)(6486002)(71190400001)(2351001)(25786009)(6246003)(6436002)(446003)(71200400001)(6916009)(118296001)(229853002)(478600001)(2616005)(305945005)(5660300002)(5640700003)(14454004)(86362001)(4001150100001)(11346002)(7736002);DIR:OUT;SFP:1101;SCL:1;SRVR:DM6PR03MB4361;H:DM6PR03MB5116.namprd03.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: analog.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KNxts7OsDy+EfmgeqHXQiYQ4LgY8M6q8a4+VkfubDeszThRlC/KWMlYBtTsWx64sG/7xCyJ6FB5Y70I1VTGKGxgUwGGilazLOB5usDMG//UfXXdLaMxB5UqyzAwyApKB/6kJ1su0eWpdj+YAMnQUV4bB5N/3W5dgaMZC3SwXm3n9lJE1CSJu+m//cr8t6/iJWfWRN7j2cQ7/WOPnAG7oMjFhZ0Qn/YNZq3che73v/IUX3xWbIikXlaXVKeG9lSWOk5U88IofHRT7wHf08CCGq5zZvUOo3WIKyGWLgymkxMgK/+krmltAhVOiSATCqTuGbz+vzIhUKaiViUGXHPLP1yvs3LHDX/8p1MS98bYZnfTIdyp1hfhe55akGeDcU4jjOwOF7veuA9ZPLt74Mo/nV4QoHmrCPHo2pnHyb7TIGhk=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <D97A51A87F72424C8CB787B7257EAE3C@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 924afa50-b7bc-4c3f-2b73-08d74e189c86
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Oct 2019 06:59:50.6934
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZYbppARWaI/qzkzUaSEiTgXIyKEH9x/5yklXE7eePvdQwNkj8zZTjD8I3vg8MPzgKvjI4GUBrXYw7eG57EFtNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4361
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-11_04:2019-10-10,2019-10-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 clxscore=1015 mlxscore=0 lowpriorityscore=0 bulkscore=0
 mlxlogscore=999 malwarescore=0 adultscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1908290000 definitions=main-1910110065
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

T24gVGh1LCAyMDE5LTEwLTEwIGF0IDA4OjIxIC0wNzAwLCBHdWVudGVyIFJvZWNrIHdyb3RlOg0K
PiBbRXh0ZXJuYWxdDQo+IA0KPiBPbiBUaHUsIE9jdCAxMCwgMjAxOSBhdCAwNzoxMzowNkFNICsw
MDAwLCBTYSwgTnVubyB3cm90ZToNCj4gPiBRdW90aW5nIHRoZSByZXBseSBJIGhhZDoNCj4gPiAN
Cj4gPiAiQXMgdGhlIExUQzI5NDcgaXMgYmktZGlyZWN0aW9uYWwsIHRoZSBtb3N0IGxpa2VseSB1
c2UgZm9yIHRoZQ0KPiA+IE1pbi9NYXgNCj4gPiBFbmVyZ3kgdGhyZXNob2xkcyBhcmUgZm9yIG1v
bml0b3JpbmcgYSBiYXR0ZXJ5IGJlaW5nIGNoYXJnZWQgb3INCj4gPiBkaXNjaGFyZ2VkLiANCj4g
PiBBIGxpbWl0IGNvdWxkIGJlIHNldCBiYXNlZCBhcm91bmQgdGhlIGJhdHRlcnkncyBzdG9yYWdl
IGNhcGFjaXR5IHNvDQo+ID4gdGhhdCB0aGUgYmF0dGVyeSBpcyBwcm90ZWN0ZWQgZnJvbSBiZWlu
ZyBvdmVyY2hhcmdpbmcgb3IgZnVsbHkNCj4gPiBkcmFpbmVkLiINCj4gPiANCj4gPiBTbywgSSdt
IG5vdCBzdXJlIGlmIHRoaXMgaXMgYSB2YWxpZCB1c2UgY2FzZSBmb3IgaHdtb24gc3Vic3lzdGVt
Lg0KPiA+IEknbQ0KPiA+IGF3YXJlIHRoZXJlJ3MgYWxzbyB0aGUgcG93ZXIgc3Vic3lzdGVtLiBT
byBsZXQgbWUga25vdyB3aGF0IGRvIHlvdQ0KPiA+IHByZWZlciBoZXJlLiBTaG91bGQgSSBqdXN0
IHJlcG9ydCBlbmVyZ3lYX2lucHV0IGF0dHJpYnV0ZXM/IE9yIGNhbg0KPiA+IHdlDQo+ID4ga2Vl
cCB0aGUgbWluL21heD8NCj4gPiANCj4gVGhpcyBpc24ndCByZWFsbHkgYSBod21vbiB1c2UgY2Fz
ZS4gSGF2aW5nIHN1Y2ggbWluL21heCBhdHRyaWJ1dGVzDQo+IHdvdWxkDQo+IGp1c3QgYmUgY29u
ZnVzaW5nLg0KPiANCg0KR290IGl0LiBUaGVuIEkgd2lsbCByZW1vdmUgbWluL21heCBhbmQgdGhl
IGFsYXJtIGF0dHJpYnV0ZXMgZm9yIGVuZXJneQ0KYW5kIGp1c3QgbGVhdmUgdGhlIHN0YW5kYXJk
IG9uZXMuIFdoZW4gSSBoYXZlIHRoZSB0aW1lIEkgbWlnaHQgcHJlcGFyZQ0KYSBwYXRjaCB3aGlj
aCB0dXJucyB0aGlzIGRldmljZSBpbnRvIGFuIG1mZCBhbmQgYWRkcyBhIG5ldyBkcml2ZXIgaW4N
CnRoZSBwb3dlciBzdWJzeXN0ZW0gdG8gbW9uaXRvciBjaGFyZ2UgYW5kIGVuZXJneSBzbyB0aGF0
IGl0IGNhbiBjb3Zlcg0KdGhpcyB1c2UgY2FzZS4gSSBndWVzcyB0aGF0IHdvdWxkIG1ha2Ugc2Vu
c2UuDQoNCk51bm8gU8OhIA0K
