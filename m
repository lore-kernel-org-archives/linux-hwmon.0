Return-Path: <SRS0=Xc2u=X5=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F20AC4360C
	for <linux-hwmon@archiver.kernel.org>; Fri,  4 Oct 2019 14:45:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3BF95207FF
	for <linux-hwmon@archiver.kernel.org>; Fri,  4 Oct 2019 14:45:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=distech-controls.com header.i=@distech-controls.com header.b="ahJ0++0P"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389113AbfJDOps (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 4 Oct 2019 10:45:48 -0400
Received: from mx0b-002ab301.pphosted.com ([148.163.154.99]:12088 "EHLO
        mx0b-002ab301.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2389042AbfJDOps (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 4 Oct 2019 10:45:48 -0400
Received: from pps.filterd (m0118796.ppops.net [127.0.0.1])
        by mx0b-002ab301.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id x94EjQoL000937;
        Fri, 4 Oct 2019 10:45:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=distech-controls.com; h=from : to :
 cc : subject : date : message-id : references : in-reply-to : content-type
 : content-transfer-encoding : mime-version; s=pps-02182019;
 bh=OYsQAqO5JtVe8l9XQ9Gt+yV1hZhDGLKvFU+1ULAO1lw=;
 b=ahJ0++0PVDCnwfNS8Y7VYFh8Y3iaP78Z7+C95Bm8KU9IOTszeXSw/3dF9Nq+3ABWKFtf
 HEiituVf1aYB8K4iUPNwRRma207a7ft9ziswUbQmIr/HExmH793DLcIJyPnlVd83WrFp
 O3/TMMecEPKP/AZHKMaAXpesBNjlDGsTaURjF5iy+W92QzpTKXvi+EBkBDAezzDYnEFI
 i0Xl8OK99IbAEfR2P8BizYOgIePN5LbFnLXltAopDrUhZ6pRvPaky3SJchflfmZxbvFX
 cth4kiZA6clJMotAM1bfIv+FBfIvoqcRovsyfvukXhihBdisdiUr+tJ5nCmHltOgpLPx fQ== 
Received: from nam02-cy1-obe.outbound.protection.outlook.com (mail-cys01nam02lp2059.outbound.protection.outlook.com [104.47.37.59])
        by mx0b-002ab301.pphosted.com with ESMTP id 2ve79ug24w-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 04 Oct 2019 10:45:26 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oB/ldCdyEIIfP49anIuCczzak6iUdCwAyZ54IxAIRTJqzeGCO8I007hZo/Lxbhqu5Cx91/diQQwnNOd3SQQICOyPtW5nRT5vHwG9lTUA6QzYcZQ1DIzaIARoeiZputlPwL4Vn5B0lBf+rSLuv3YUWugr5jILUoNS1xQNpEgoJu26Zzn2DZpkCaaTJ52lcyaZkNIJuPU9CyYogLssVtUvHN0c2utvWSVETPJIaSStrwEpK86ymYIc60IlQktgZVsvFzE1wCtdIeTj6TrTEOtcGeNrZCyb0aPAS818qQkdc80Zmb4fum3E4ZvukE6TBUwpZ5Rtxo3ueCaC82P4HfDsuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OYsQAqO5JtVe8l9XQ9Gt+yV1hZhDGLKvFU+1ULAO1lw=;
 b=UxY0uTlykGO8JHtnng+GINf9ZcRD7HUDNA7RBnCzOLA47SVjVJ2fpNTUn0QOqgW3tfsHzTABtsUCZRdv/7VqWFI2a0BzdPNQtfi7GIoZUl4eB55LMw5LTeW1hmYGFeygHnjZ7DLyTNWQyrJsU+gK42tyflqz/3sBiUxh5b+ccBfzKZXzY8FqoHHP6eFV7VNT6LCxfg+YSX8QbOMhG/2FbZfSEfkWkNhaIMgFsS/M6UKJWEtgMhidQGIZT1N6ypWYvog+/IwUviEVpTIXYN9OzJCWR9PpYjvs/AUIrbZfHK3MKclfV0Hk2z95Sal8ZOwrkdrI3jXROqyrMBCjWOL1PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=distech-controls.com; dmarc=pass action=none
 header.from=distech-controls.com; dkim=pass header.d=distech-controls.com;
 arc=none
Received: from BL0PR01MB4835.prod.exchangelabs.com (20.177.147.211) by
 BL0PR01MB4498.prod.exchangelabs.com (20.177.242.75) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Fri, 4 Oct 2019 14:45:24 +0000
Received: from BL0PR01MB4835.prod.exchangelabs.com
 ([fe80::35e9:e131:c84f:e0a5]) by BL0PR01MB4835.prod.exchangelabs.com
 ([fe80::35e9:e131:c84f:e0a5%3]) with mapi id 15.20.2305.023; Fri, 4 Oct 2019
 14:45:24 +0000
From:   "Tremblay, Eric" <etremblay@distech-controls.com>
To:     Guenter Roeck <linux@roeck-us.net>
CC:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: RE: [PATCH v3 0/2] hwmon: Add driver for Texas Instruments TMP512/513
 sensor chips
Thread-Topic: [PATCH v3 0/2] hwmon: Add driver for Texas Instruments
 TMP512/513 sensor chips
Thread-Index: AdV6F0hjy4+RpFt6R++XpWeNAWFJwgAAfbAAAAQosgAAJe+6oA==
Date:   Fri, 4 Oct 2019 14:45:24 +0000
Message-ID: <BL0PR01MB4835012BE9BF6BB5E7D55B87959E0@BL0PR01MB4835.prod.exchangelabs.com>
References: <BL0PR01MB48359D174C7CE498D7367B42959F0@BL0PR01MB4835.prod.exchangelabs.com>
 <BL0PR01MB48354C0BF0D094921233611A959F0@BL0PR01MB4835.prod.exchangelabs.com>
 <20191003203358.GA16786@roeck-us.net>
In-Reply-To: <20191003203358.GA16786@roeck-us.net>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mib-plugin: true
x-originating-ip: [207.253.3.19]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ba1d5de4-ebb5-471c-abd4-08d748d97d57
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: BL0PR01MB4498:
x-microsoft-antispam-prvs: <BL0PR01MB44988183E2F10A7CABD78250959E0@BL0PR01MB4498.prod.exchangelabs.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 018093A9B5
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(346002)(376002)(366004)(136003)(396003)(39860400002)(199004)(189003)(6246003)(66066001)(71200400001)(14454004)(99286004)(102836004)(6436002)(7696005)(8936002)(11346002)(229853002)(6506007)(446003)(76176011)(81166006)(81156014)(8676002)(33656002)(14444005)(52536014)(5660300002)(316002)(2906002)(25786009)(478600001)(66476007)(66946007)(66556008)(66446008)(71190400001)(76116006)(4326008)(86362001)(64756008)(486006)(74316002)(26005)(305945005)(7736002)(55016002)(6916009)(6116002)(3846002)(186003)(476003)(9686003)(256004);DIR:OUT;SFP:1101;SCL:1;SRVR:BL0PR01MB4498;H:BL0PR01MB4835.prod.exchangelabs.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: distech-controls.com does not
 designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DJpPBvsdvJ0v8LxVGjYFTD2sYY/Nxqwyv20NGYSn6kXUV/gTdAWMM9wX2Jh4E3VNE2dicyHzX3JX+ap+A+3jS86fW6OkzD6e8zhnS0uPOVfrPtSQpi8afj/d0izcrSCLwMgI+SRYdZHtCC1GGBG/509n4mFH61BB7RdEXZnNEEO9Xs36zFpbDuOrUSbDil2SVrN0RknBRup4hTsosFN9AhB2GcNNvoh6U72LHxjGVj4v31tvsteBlmg6Kj/ihlMWhHyy75mbK2y9+KjbszCHFQ8kEKE/rCuPpINpItX/wJX+tYk/qoTg/RfUyylDYGRAU4JbXliNpI54OP0CYU6T3d0bOK9KSUKUVUm9pLr1jy0CLqe8qE+CLfKSg3qpR1zccdONkUEpZVYL4iOFKNOZC8mB+0WNOAdfXv4Xaq1CB7Q=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: distech-controls.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba1d5de4-ebb5-471c-abd4-08d748d97d57
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2019 14:45:24.2576
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: caadbe96-024e-4f67-82ec-fb28ff53d16d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ggnhc8YQlpcsRn1i1XXuELqXHHOfsCYsShZsTg1d+vJ3ypSmOKHNhBzpw014tFN8y1uzHhTs/1EQNmrH+/5UVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR01MB4498
X-Proofpoint-Processed: True
X-Proofpoint-Spam-Details: rule=outbound_spam_notspam policy=outbound_spam score=0 mlxlogscore=999
 impostorscore=0 malwarescore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 mlxscore=0 adultscore=0
 phishscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1908290000 definitions=main-1910040135
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

PiBPbiBUaHUsIE9jdCAwMywgMjAxOSBhdCAwNjozNTo1MVBNICswMDAwLCBUcmVtYmxheSwgRXJp
YyB3cm90ZToNCj4gPiA+IFZlcnNpb24gdGhyZWUgb2YgdGhlIGRyaXZlciBmb3IgVGV4YXMgSW5z
dHJ1bWVudHMgVE1QNTEyLzUxMyBzZW5zb3JzLg0KPiA+ID4NCj4gPiA+IFRoYW5rcyBhZ2FpbiBm
b3IgdGhlIHJldmlldywgSSB0aGluayB3ZSBhcmUgZ2V0dGluZyBjbG9zZS4gSSdtIG5vdA0KPiA+
ID4gaW4gYW4gZWFzeSBwb3NpdGlvbiBmb3Igbm93IHRvIHRlc3QgdGhlIGRyaXZlciB3aXRob3V0
IGRldmljZSB0cmVlLg0KPiA+ID4gSSBjYW4gcHV0IHRoZSByZXF1aXJlZCBlZmZvcnQgdG8NCj4g
Pg0KPiA+IFNvcnJ5LCBJIG1lYW4gdGhhdCBJJ20gbm90IGluIGEgZ29vZCBwb3NpdGlvbiB0byB0
ZXN0IGl0LCBidXQgSSBjYW4gcHV0IHRoZSByZXF1aXJlZCBlZmZvcnQgdG8gaWYgbmVlZGVkLg0K
PiANCj4gQWxsIHlvdSB3b3VsZCBuZWVkIHRvIGRvIGlzIHRvIHVzZSBkZXZpY2VfIEFQSSBmdW5j
dGlvbnMgaW5zdGVhZCBvZiBvZl9kZXZpY2VfIEFQSSBmdW5jdGlvbnMsIHNvIEkgY2FuIG5vdCBl
bnRpcmVseSBmb2xsb3cgeW91ciBsb2dpYy4NCg0KSSB3YXMgY2xlYXJseSBtaXNzaW5nIHNvbWUg
cGllY2Ugb2Yga25vd2xlZGdlIGFib3V0IHRoZSBkZXZpY2UgQVBJLi4uIEkgZGlkIHNvbWUgcmVz
ZWFyY2ggYW5kIEkgd2FzIGFibGUgdG8gaW5zdGFudGlhdGUgYW5kIHRlc3QNCnRoZSBkcml2ZXIg
d2l0aG91dCB1c2luZyB0aGUgb2ZfZGV2aWNlIEFQSS4gVGhlIHZlcnNpb24gMyB3b3JrIGFzIGV4
cGVjdGVkIHdpdGggb3Igd2l0aG91dCBwbGF0Zm9ybV9kYXRhIHByb3ZpZGVkLg0KDQpFcmljIA0K
PiANCj4gR3VlbnRlcg0KPiANCj4gPiA+DQo+ID4gPiBNYWluIGNoYW5nZXMgZnJvbSB2ZXJzaW9u
IDI6DQo+ID4gPiAJLSBSZW1vdmUgdGhlIG5lY2Nlc3NpdHkgdG8gcHJvdmlkZSBhIHNodW50LXJl
c2lzdG9yIHZhbHVlDQo+ID4gPiAJLSBSZW1vdmUgbWF4LWV4cGVjdGVkLWN1cnJlbnQtbWEgY29u
ZmlndXJhdGlvbiBhbmQgYWx3YXlzDQo+ID4gPiAJICB1c2UgbWF4IHBvc3NpYmxlIGN1cnJlbnQg
Zm9yIGNhbGlicmF0aW9uDQo+ID4gPiAJLSBNYWtlIHN1cmUgY2FsY3VsYXRpb24gZHVyaW5nIGNh
bGlicmF0aW9uIGNhbid0IG92ZXJmbG93DQo+ID4gPiAJLSBBZGQgdmFsdWUgY2xhbXBpbmcgZm9y
IERUIHZhbHVlIGFuZCBydW50aW1lIHBhcmFtZXRlcnMNCj4gPiA+IAktIFN1cHBvcnQgbm9uIERU
IHN5c3RlbQ0KPiA+ID4gCS0gTW92ZSBoeXN0ZXJlc2lzIGZyb20gRFQgdG8gc3RhbmRhcmQgYXR0
cmlidXRlDQo+ID4gPg0KPiA+ID4gTWFpbiBjaGFuZ2VzIGZyb20gdmVyc2lvbiAxOg0KPiA+ID4g
CS0gVXNlIHRoZSB3aXRoX2luZm8gQVBJIGluc3RlYWQgb2Ygc3lzZnMgYXR0cmlidXRlcy4NCj4g
PiA+IAktIFJlbW92ZSBub24tc3RhbmRhcmQgYXR0cmlidXRlcyBhbmQgcmF3IHZhbHVlLg0KPiA+
ID4gCS0gTW92ZSBzZXR0aW5ncyB0aGF0IHdlcmUgbm9uLXN0YW5kYXJkIGF0dHJpYnV0ZXMgdG8N
Cj4gPiA+IAkgIGRldmljZSB0cmVlLCB1cGRhdGUgZG9jdW1lbnRhdGlvbiBhcyB3ZWxsLg0KPiA+
ID4gCS0gRml4IGNvZGluZyBzdHlsZSBpc3N1ZXMNCj4gPiA+DQo+ID4gPiBFcmljIFRyZW1ibGF5
ICgyKToNCj4gPiA+ICAgQWRkIGRyaXZlciBmb3IgVGV4YXMgSW5zdHJ1bWVudHMgVE1QNTEyLzUx
MyBzZW5zb3IgY2hpcHMuDQo+ID4gPiAgIEFkZCBEVCBiaW5kaW5ncyBmb3IgVE1QNTEzIGRyaXZl
cg0KPiA+ID4NCj4gPiA+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9od21vbi90bXA1MTMudHh0
ICAgICAgfCAgMzMgKw0KPiA+ID4gIERvY3VtZW50YXRpb24vaHdtb24vdG1wNTEzLnJzdCAgICAg
ICAgICAgICAgICB8IDEwMiArKw0KPiA+ID4gIE1BSU5UQUlORVJTICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB8ICAgNyArDQo+ID4gPiAgZHJpdmVycy9od21vbi9LY29uZmlnICAg
ICAgICAgICAgICAgICAgICAgICAgIHwgIDEwICsNCj4gPiA+ICBkcml2ZXJzL2h3bW9uL01ha2Vm
aWxlICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDEgKw0KPiA+ID4gIGRyaXZlcnMvaHdtb24v
dG1wNTEzLmMgICAgICAgICAgICAgICAgICAgICAgICB8IDkwMSArKysrKysrKysrKysrKysrKysN
Cj4gPiA+ICBpbmNsdWRlL2xpbnV4L3BsYXRmb3JtX2RhdGEvdG1wNTEzLmggICAgICAgICAgfCAg
MjggKw0KPiA+ID4gIDcgZmlsZXMgY2hhbmdlZCwgMTA4MiBpbnNlcnRpb25zKCspICBjcmVhdGUg
bW9kZSAxMDA2NDQNCj4gPiA+IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9od21v
bi90bXA1MTMudHh0DQo+ID4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vaHdt
b24vdG1wNTEzLnJzdCAgY3JlYXRlIG1vZGUNCj4gPiA+IDEwMDY0NCBkcml2ZXJzL2h3bW9uL3Rt
cDUxMy5jICBjcmVhdGUgbW9kZSAxMDA2NDQNCj4gPiA+IGluY2x1ZGUvbGludXgvcGxhdGZvcm1f
ZGF0YS90bXA1MTMuaA0KPiA+ID4NCj4gPiA+IC0tDQo+ID4gPiAyLjE3LjENCj4gPg0K
