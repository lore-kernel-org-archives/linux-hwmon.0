Return-Path: <SRS0=Xc2u=X5=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89A43C4360C
	for <linux-hwmon@archiver.kernel.org>; Fri,  4 Oct 2019 14:59:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 418F9222C2
	for <linux-hwmon@archiver.kernel.org>; Fri,  4 Oct 2019 14:59:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=analog.onmicrosoft.com header.i=@analog.onmicrosoft.com header.b="JDWGKIXh"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389131AbfJDO7z (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 4 Oct 2019 10:59:55 -0400
Received: from mx0b-00128a01.pphosted.com ([148.163.139.77]:44010 "EHLO
        mx0b-00128a01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2389113AbfJDO7z (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 4 Oct 2019 10:59:55 -0400
Received: from pps.filterd (m0167091.ppops.net [127.0.0.1])
        by mx0b-00128a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id x94EmLdl002164;
        Fri, 4 Oct 2019 10:58:53 -0400
Received: from nam04-sn1-obe.outbound.protection.outlook.com (mail-sn1nam04lp2050.outbound.protection.outlook.com [104.47.44.50])
        by mx0b-00128a01.pphosted.com with ESMTP id 2va19d2em6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
        Fri, 04 Oct 2019 10:58:53 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VeoHGRkJnRAzBBrqDzAPRW6GVWbGQM6DfRdGnA101MaEUcE7ezGaAH/YNpyYfoJJaHr8zFJZeEQH+sURGOLgEPgtkLAu414Och96DcHG1ZJ2pukUVIALyuVoe8aa1JOGqffMgzgCE7PkSdTZAFxAG5xBrKfUcjeF8JVcMuJC+d1IlnkbFRkhyah+Dhq/szi/p3WEYLKbdgWMm/tGZ2bomB2Dn69bn6jm/7KuVdzRzINiGI4yfaEDLBcQ92xiCthTzlKnTCMIJb9b3KXmIOauCCNysNbni11ERRUQy1yYO0XWCVRgOFhKpISkxf4cBdX2FZ45zRhlgoidjLH28kl0Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bkPUmojO/CquOK+xrdzgHlo58xo8dDweuU32yTPhjsE=;
 b=RKjbVeIk06Qze3XsJuHV0PWkXQpX1igWOPpWoRlTMr//eBiATZK1JHhJrDRKHdhQH0bfikVsFFjBxBhLqr2YUCXcFGqrvxO2Iv4DOxi1/5XtAlWfGSl/yxFM86HrdmIySa6I1tQId8N8tDWsmRFM9yd3SDwk+aDUf5WVJD0heDx+4H29XZiL4TLl6Jr2r+np5JV5sm/oty8SP2cvUjzR4cpkuec6xNr5Gt3cWef5hkSiljJ2MW5FFy2BCjbFZXYVGjrCLc/v6wDuYgPuOHG2/IaULyw3DDtg3W6cpTZlDMyWTLPkegTTirlIIlCocsIV42kE+TkbTcAjWklGI4gyCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bkPUmojO/CquOK+xrdzgHlo58xo8dDweuU32yTPhjsE=;
 b=JDWGKIXh09LBUTy/YARAEZAgbgaEtE7RqZqHLPIPrc6zRqA2BcnRJCJF2r4tKRPxQi3gJPWnfkxj5RPZrnVd5Zk2BkPy34owMt+KOwWfcijUEqO7Ws5Q09lRAFLW6kBdcIaSkiKMsG90TMMzys5yCmkCve2gWpZoFWmRHrNV8yU=
Received: from MN2PR03MB5117.namprd03.prod.outlook.com (52.132.171.137) by
 MN2PR03MB5053.namprd03.prod.outlook.com (52.132.170.199) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.15; Fri, 4 Oct 2019 14:58:52 +0000
Received: from MN2PR03MB5117.namprd03.prod.outlook.com
 ([fe80::8c20:8f3b:b536:dca5]) by MN2PR03MB5117.namprd03.prod.outlook.com
 ([fe80::8c20:8f3b:b536:dca5%7]) with mapi id 15.20.2327.023; Fri, 4 Oct 2019
 14:58:52 +0000
From:   "Sa, Nuno" <Nuno.Sa@analog.com>
To:     "robh@kernel.org" <robh@kernel.org>
CC:     "linux@roeck-us.net" <linux@roeck-us.net>,
        "corbet@lwn.net" <corbet@lwn.net>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "jdelvare@suse.com" <jdelvare@suse.com>
Subject: Re: [PATCH 3/3] dt-bindings: iio: Add ltc2947 documentation
Thread-Topic: [PATCH 3/3] dt-bindings: iio: Add ltc2947 documentation
Thread-Index: AQHVctabt7hELzS5OkeFI3rzndaj3qdHcx6AgAAOBQCAAEIMgIAC37qA
Date:   Fri, 4 Oct 2019 14:58:51 +0000
Message-ID: <eec33c7156674770ca2f3033baed76c0e05a8587.camel@analog.com>
References: <20190924124945.491326-1-nuno.sa@analog.com>
         <20190924124945.491326-4-nuno.sa@analog.com> <20191002002331.GA17502@bogus>
         <a85b33d3cd24b4225e4be3a25221f9c56cdcca5c.camel@analog.com>
         <CAL_JsqJPFfUmOOQ-f_ibbTXdzgYxYMf2+7HCq2eBn_MkfRsdbQ@mail.gmail.com>
In-Reply-To: <CAL_JsqJPFfUmOOQ-f_ibbTXdzgYxYMf2+7HCq2eBn_MkfRsdbQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.71.226.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2a928291-b7bd-41e6-caa5-08d748db5eb2
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: MN2PR03MB5053:
x-ms-exchange-purlcount: 3
x-microsoft-antispam-prvs: <MN2PR03MB505340C8516F29455991D3E3999E0@MN2PR03MB5053.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 018093A9B5
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(39860400002)(376002)(366004)(396003)(346002)(136003)(189003)(199004)(3846002)(66066001)(2351001)(81156014)(6116002)(81166006)(446003)(11346002)(486006)(2616005)(118296001)(4326008)(86362001)(14454004)(1730700003)(478600001)(8676002)(316002)(14444005)(256004)(8936002)(54906003)(6306002)(76176011)(2501003)(99286004)(2906002)(5640700003)(966005)(5660300002)(6512007)(25786009)(476003)(6436002)(36756003)(26005)(186003)(229853002)(6916009)(71190400001)(71200400001)(6486002)(53546011)(6246003)(6506007)(66476007)(66946007)(66556008)(7736002)(64756008)(102836004)(91956017)(76116006)(305945005)(66446008);DIR:OUT;SFP:1101;SCL:1;SRVR:MN2PR03MB5053;H:MN2PR03MB5117.namprd03.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: analog.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Seftj6efU2ze73VmIUKkawm908A31lDpZlFGkjKgnDaPzlcYoLw/P9eLE2Z6dsCagEFUuqLS3B1e54ratNJ2L5o5J360zas23VTSiEyOZJ+4LBwySIX/CuGoKOGyLGUFnwAN2dwMlRMNN4cpZ1X6Kc8MA2RRRwI9gsTU6QhC7g7pRJAJVMhiNOBXH3nvQs0V/qCv0mVLHE1t5bTlLPTNdhwS6fcjrkKsHYU0iJmkw4ysF4O3Qzg91GponGGZsLoNtw+RNe1wf3AoexX9A7IUjsSjoZXiemy2Sim54OK0EFqRW6Y6BTWSc2n4534yRJWnHetiQQ372JmRh2YxXPksDcLLWY9CYenlhbrZlGqmsX8W/1cGv7G0osEYL4lPsJUzr5xczGASrACwQL0beBXoaQ+7TwtzKipsgm2VvHEKlxHLOY3fsRnHakWmWoR8UzeVzSXusvjh38hS9eySCgjEKg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <594A9F19929C294AA8D4258E828C14A3@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a928291-b7bd-41e6-caa5-08d748db5eb2
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2019 14:58:51.8464
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VOBFm8h+FPht2vXAIVD7CPSHxlc39/XmBbQyXF33aNPlA0R9rR2fNsY0pVdCQbBxGBms0BGoS9jUThRVKTAJXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5053
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-04_07:2019-10-03,2019-10-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=999 adultscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 malwarescore=0 impostorscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1908290000 definitions=main-1910040135
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

SGkgUm9iLA0KDQpKdXN0IHdhbnRlZCB0byBjbGFyaWZ5IHNvbWV0aGluZyB3aGljaCBJIGRvbid0
IGtub3cgaWYgaXMgc29tZXRoaW5nIEknbQ0KZG9pbmcgd3Jvbmcgb3IgaWYgaXQgaXMgc29tZSBp
c3N1ZS4NCg0KT24gV2VkLCAyMDE5LTEwLTAyIGF0IDE0OjA2IC0wNTAwLCBSb2IgSGVycmluZyB3
cm90ZToNCj4gDQo+IE9uIFdlZCwgT2N0IDIsIDIwMTkgYXQgMTA6MDkgQU0gU2EsIE51bm8gPE51
bm8uU2FAYW5hbG9nLmNvbT4gd3JvdGU6DQo+ID4gT24gV2VkLCAyMDE5LTEwLTAyIGF0IDA5OjE5
IC0wNTAwLCBSb2IgSGVycmluZyB3cm90ZToNCj4gPiA+IE9uIFR1ZSwgU2VwIDI0LCAyMDE5IGF0
IDAyOjQ5OjQ1UE0gKzAyMDAsIE51bm8gU8OhIHdyb3RlOg0KPiA+ID4gPiBEb2N1bWVudCB0aGUg
TFRDMjk0NyBkZXZpY2UgZGV2aWNldHJlZSBiaW5kaW5ncy4NCj4gPiA+ID4gDQo+ID4gPiA+IFNp
Z25lZC1vZmYtYnk6IE51bm8gU8OhIDxudW5vLnNhQGFuYWxvZy5jb20+DQo+ID4gPiA+IC0tLQ0K
PiA+ID4gPiAgLi4uL2JpbmRpbmdzL2h3bW9uL2FkaSxsdGMyOTQ3LnlhbWwgICAgICAgICAgIHwg
MTAxDQo+ID4gPiA+ICsrKysrKysrKysrKysrKysrKw0KPiA+ID4gPiAgTUFJTlRBSU5FUlMgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAxICsNCj4gPiA+ID4gIDIgZmlsZXMg
Y2hhbmdlZCwgMTAyIGluc2VydGlvbnMoKykNCj4gPiA+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NA0K
PiA+ID4gPiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaHdtb24vYWRpLGx0YzI5
NDcueWFtbA0KPiA+ID4gPiANCj4gPiA+ID4gZGlmZiAtLWdpdA0KPiA+ID4gPiBhL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9od21vbi9hZGksbHRjMjk0Ny55YW1sDQo+ID4gPiA+
IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2h3bW9uL2FkaSxsdGMyOTQ3Lnlh
bWwNCj4gPiA+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gPiA+ID4gaW5kZXggMDAwMDAwMDAw
MDAwLi4yZWEwMTg3NDIxZDQNCj4gPiA+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ID4gPiArKysgYi9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaHdtb24vYWRpLGx0YzI5NDcueWFtbA0K
PiA+ID4gPiBAQCAtMCwwICsxLDEwMSBAQA0KPiA+ID4gDQo+ID4gPiBNaXNzaW5nIGxpY2Vuc2Uu
IFBsZWFzZSBtYWtlIG5ldyBiaW5kaW5ncyAoR1BMLTIuMC1vbmx5IE9SIEJTRC0yLQ0KPiA+ID4g
Q2xhdXNlKQ0KPiA+IA0KPiA+IGFjay4NCj4gPiANCj4gPiA+ID4gKyVZQU1MIDEuMg0KPiA+ID4g
PiArLS0tDQo+ID4gPiA+ICskaWQ6DQo+ID4gPiA+IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hl
bWFzL2JpbmRpbmdzL2h3bW9uL2FkaSxsdGMyOTQ3LnlhbWwjDQo+ID4gPiA+ICskc2NoZW1hOiBo
dHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMNCj4gPiA+ID4gKw0K
PiA+ID4gPiArdGl0bGU6IEFuYWxvZyBEZXZpY2VzIExUQzI5NDcgaGlnaCBwcmVjaXNpb24gcG93
ZXIgYW5kIGVuZXJneQ0KPiA+ID4gPiBtb25pdG9yDQo+ID4gPiA+ICsNCj4gPiA+ID4gK21haW50
YWluZXJzOg0KPiA+ID4gPiArICAtIE51bm8gU8OhIDxudW5vLnNhQGFuYWxvZy5jb20+DQo+ID4g
PiA+ICsNCj4gPiA+ID4gK2Rlc2NyaXB0aW9uOiB8DQo+ID4gPiA+ICsgIEFuYWxvZyBEZXZpY2Vz
IExUQzI5NDcgaGlnaCBwcmVjaXNpb24gcG93ZXIgYW5kIGVuZXJneQ0KPiA+ID4gPiBtb25pdG9y
DQo+ID4gPiA+IG92ZXIgU1BJIG9yIEkyQy4NCj4gPiA+ID4gKw0KPiA+ID4gPiArDQo+ID4gPiA+
IGh0dHBzOi8vd3d3LmFuYWxvZy5jb20vbWVkaWEvZW4vdGVjaG5pY2FsLWRvY3VtZW50YXRpb24v
ZGF0YS1zaGVldHMvTFRDMjk0Ny5wZGYNCj4gPiA+ID4gKw0KPiA+ID4gPiArcHJvcGVydGllczoN
Cj4gPiA+ID4gKyAgY29tcGF0aWJsZToNCj4gPiA+ID4gKyAgICBlbnVtOg0KPiA+ID4gPiArICAg
ICAgLSBhZGksbHRjMjk0Nw0KPiA+ID4gPiArDQo+ID4gPiA+ICsgIHJlZzoNCj4gPiA+ID4gKyAg
ICBtYXhJdGVtczogMQ0KPiA+ID4gPiArDQo+ID4gPiA+ICsgIGNsb2NrczoNCj4gPiA+ID4gKyAg
ICBkZXNjcmlwdGlvbjoNCj4gPiA+ID4gKyAgICAgIFRoZSBMVEMyOTQ3IHVzZXMgZWl0aGVyIGEg
dHJpbW1lZCBpbnRlcm5hbCBvc2NpbGxhdG9yIG9yDQo+ID4gPiA+IGFuDQo+ID4gPiA+IGV4dGVy
bmFsIGNsb2NrDQo+ID4gPiA+ICsgICAgICBhcyB0aGUgdGltZSBiYXNlIGZvciBkZXRlcm1pbmlu
ZyB0aGUgaW50ZWdyYXRpb24gcGVyaW9kDQo+ID4gPiA+IHRvDQo+ID4gPiA+IHJlcHJlc2VudCB0
aW1lLA0KPiA+ID4gPiArICAgICAgY2hhcmdlIGFuZCBlbmVyZ3kuIFdoZW4gYW4gZXh0ZXJuYWwg
Y2xvY2sgaXMgdXNlZCwgdGhpcw0KPiA+ID4gPiBwcm9wZXJ0eSBtdXN0IGJlDQo+ID4gPiA+ICsg
ICAgICBzZXQgYWNjb3JkaW5nbHkuDQo+ID4gPiA+ICsgICAgbWF4SXRlbXM6IDENCj4gPiA+ID4g
Kw0KPiA+ID4gPiArICBhZGksYWNjdW11bGF0b3ItY3RsLXBvbDoNCj4gPiA+ID4gKyAgICBkZXNj
cmlwdGlvbjoNCj4gPiA+ID4gKyAgICAgIFRoaXMgcHJvcGVydHkgY29udHJvbHMgdGhlIHBvbGFy
aXR5IG9mIGN1cnJlbnQgdGhhdCBpcw0KPiA+ID4gPiBhY2N1bXVsYXRlZCB0bw0KPiA+ID4gPiAr
ICAgICAgY2FsY3VsYXRlIGNoYXJnZSBhbmQgZW5lcmd5IHNvIHRoYXQsIHRoZXkgY2FuIGJlIG9u
bHkNCj4gPiA+ID4gYWNjdW11bGF0ZWQgZm9yDQo+ID4gPiA+ICsgICAgICBwb3NpdGl2ZSBjdXJy
ZW50IGZvciBleGFtcGxlLiBTaW5jZSB0aGVyZSBhcmUgdHdvIHNldHMNCj4gPiA+ID4gb2YNCj4g
PiA+ID4gcmVnaXN0ZXJzIGZvcg0KPiA+ID4gPiArICAgICAgdGhlIGFjY3VtdWxhdGVkIHZhbHVl
cywgdGhpcyBlbnRyeSBjYW4gYWxzbyBoYXZlIHR3bw0KPiA+ID4gPiBpdGVtcw0KPiA+ID4gPiB3
aGljaCBzZXRzDQo+ID4gPiA+ICsgICAgICBlbmVyZ3kxL2NoYXJnZTEgYW5kIGVuZXJneTIvY2hh
cmdlcjIgcmVzcGVjdGl2ZWx5LiBDaGVjaw0KPiA+ID4gPiB0YWJsZSAxMiBvZiB0aGUNCj4gPiA+
ID4gKyAgICAgIGRhdGFzaGVldCBmb3IgbW9yZSBpbmZvcm1hdGlvbiBvbiB0aGUgc3VwcG9ydGVk
IG9wdGlvbnMuDQo+ID4gPiA+ICsgICAgYWxsT2Y6DQo+ID4gPiA+ICsgICAgICAtICRyZWY6IC9z
Y2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3VpbnQzMi1hcnJheQ0KPiA+ID4gPiArICAg
ICAgLSBlbnVtOiBbMCwgMSwgMiwgM10NCj4gPiA+ID4gKyAgICAgIC0gbWluSXRlbXM6IDINCj4g
PiA+ID4gKyAgICAgIC0gbWF4SXRlbXM6IDINCj4gPiA+ID4gKyAgICBkZWZhdWx0OiBbMCwgMF0N
Cj4gPiA+IA0KPiA+ID4gVGhpcyBzaG91bGQgYmU6DQo+ID4gPiANCj4gPiA+IGFsbE9mOg0KPiA+
ID4gICAtICRyZWY6IC4uLg0KPiA+ID4gaXRlbXM6DQo+ID4gPiAgIGVudW06IFswLCAxLCAyLCAz
XQ0KPiA+ID4gICBkZWZhdWx0OiAwDQo+ID4gPiBtaW5JdGVtczogMg0KPiA+ID4gbWF4SXRlbXM6
IDINCg0KV2hlbiB0cnlpbmcgdGhlIGFib3ZlIEkgZ2V0Og0KDQoibHRjMjk0N0AwOiBhZGksYWNj
dW11bGF0b3ItY3RsLXBvbDowOiBbMCwgMV0gaXMgbm90IHZhbGlkIHVuZGVyIGFueSBvZg0KdGhl
IGdpdmVuIHNjaGVtYXMiDQoNCj4gPiBJIHdhcyBleHBlY3RpbmcgdGhpcyBhbHJlYWR5LiBXaGVu
IHVwc3RyZWFtaW5nIGFub3RoZXIgZGV2aWNlLCBJDQo+ID4gcmVhbGl6ZWQgc29tZSBlcnJvcnMg
d2l0aCBgbWFrZSBkdF9iaW5kaW5nX2NoZWNrYCB3aGVuIGV2YWx1YXRpbmcNCj4gPiB0aGUNCj4g
PiBleGFtcGxlLiBKdXN0IGZvciBteSB1bmRlcnN0YW5kaW5nLCBpcyB0aGlzIGFsc28gaW5jb3Jy
ZWN0Pw0KPiANCj4gVGhlIGFsbE9mIHN0cnVjdHVyZSBsaWtlIHRoaXMgYWxzbyB3b3Jrcy4gWW91
J2xsIGdldCBiZXR0ZXIgZXJyb3INCj4gbWVzc2FnZXMgaWYgc2NoZW1hcyBhcmUgbm90IHVuZGVy
IGFuIGFsbE9mLg0KPiANCj4gPiBhbGxPZjoNCj4gPiAgIC0gJHJlZjogL3NjaGVtYXMvdHlwZXMu
eWFtbCMvZGVmaW5pdGlvbnMvdWludDMyLWFycmF5DQo+ID4gICAtIG1pbkl0ZW1zOiAyDQo+ID4g
ICAgIG1heEl0ZW1zOiAyDQo+ID4gICAgIGl0ZW1zOg0KPiA+ICAgICAgIGVudW06IFswLCAxLCAy
LCAzXQ0KPiA+ICAgICBkZWZhdWx0OiAwDQo+IA0KPiBIb3dldmVyLCAnZGVmYXVsdCcgbmVlZHMg
dG8gYmUgaW5kZW50ZWQgdW5kZXIgJ2l0ZW1zJy4NCg0KSW4gdGhpcyBmb3JtLCBJIGRvbid0IGdl
dCBhbnkgd2FybmluZy9lcnJvciB3aGVuIGNoZWNraW5nIHRoZSBkdHMNCmV4YW1wbGUuDQoNCj4g
PiBJIHVzZWQgYSBzaW1pbGFyIHBhdHRlcm4gaW4gYW5vdGhlciBkZXZpY2UgdGhhdCBpcyBhbHNv
IHdhaXRpbmcgZm9yDQo+ID4gcmV2aWV3IDopLg0KPiA+ID4gPiArDQo+ID4gPiA+ICsgIGFkaSxh
Y2N1bXVsYXRpb24tZGVhZGJhbmQtbWljcm9hbXA6DQo+ID4gPiA+ICsgICAgZGVzY3JpcHRpb246
DQo+ID4gPiA+ICsgICAgICBUaGlzIHByb3BlcnR5IGNvbnRyb2xzIHRoZSBBY2N1bXVsYXRpb24g
RGVhZCBiYW5kIHdoaWNoDQo+ID4gPiA+IGFsbG93cyB0byBzZXQgdGhlDQo+ID4gPiA+ICsgICAg
ICBsZXZlbCBvZiBjdXJyZW50IGJlbG93IHdoaWNoIG5vIGFjY3VtdWxhdGlvbiB0YWtlcw0KPiA+
ID4gPiBwbGFjZS4NCj4gPiA+ID4gKyAgICBhbGxPZjoNCj4gPiA+ID4gKyAgICAgIC0gJHJlZjog
L3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvdWludDMyDQo+ID4gPiA+ICsgICAgICAt
IG1heGltdW06IDI1NQ0KPiA+ID4gDQo+ID4gPiBtYXhpbXVtIHNob3VsZCBiZSBhdCBzYW1lIGlu
ZGVudCBhcyBhbGxPZi4gT3IgZGVmYXVsdCBzaG91bGQgYmUNCj4gPiA+IGF0DQo+ID4gPiB0aGUN
Cj4gPiA+IHNhbWUgbGV2ZWwgYXMgbWF4aW11bSAodW5kZXIgYSBzaW5nbGUgJy0nIGxpc3QgZW50
cnkpLg0KPiA+IA0KPiA+IFNvIGl0IHNob3VsZCBiZT8NCj4gPiANCj4gPiBhbGxPZjoNCj4gPiAg
IC0gJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvdWludDMyDQo+ID4gICAt
IG1heGltdW06IDI1NQ0KPiA+ICAgICBkZWZhdWx0OiAwDQo+IA0KPiBZZXMuDQoNClJlZ2FyZHMs
DQpOdW5vIFPDoQ0K
