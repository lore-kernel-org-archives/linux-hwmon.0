Return-Path: <SRS0=nYzv=X2=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47B05C352AA
	for <linux-hwmon@archiver.kernel.org>; Tue,  1 Oct 2019 17:49:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E81EB2168B
	for <linux-hwmon@archiver.kernel.org>; Tue,  1 Oct 2019 17:49:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=distech-controls.com header.i=@distech-controls.com header.b="XgUMo73V"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726184AbfJARtB (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 1 Oct 2019 13:49:01 -0400
Received: from mx0a-002ab301.pphosted.com ([148.163.150.161]:1576 "EHLO
        mx0a-002ab301.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726062AbfJARtB (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 1 Oct 2019 13:49:01 -0400
Received: from pps.filterd (m0118792.ppops.net [127.0.0.1])
        by mx0a-002ab301.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id x91Ha82o008515
        for <linux-hwmon@vger.kernel.org>; Tue, 1 Oct 2019 13:49:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=distech-controls.com; h=from : to :
 subject : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=pps-02182019;
 bh=pMtmUQjsCsDVUOXH3MaMf9vAYGLuZaEyyQur9zj/Ya4=;
 b=XgUMo73VPg/XtAV8IjuM2RQjJ/vtZv01AP5niHoeipP/Qlav/EkRej/YsFh6U+6uwqO/
 QqbEfni+4AGHq1Xb+OjYL1eeWCulHBGgNWCt4Cw6vKa+xwlyxodjSLEO9cb8w2OCstGi
 HDp9EBgNnaIBteJcGabO4Z5q/WjHqGipVYEY98eu+ncYjm9Q3EMYkI2uD4lxAK8gA+Pn
 OSJdIgWzPM5R8K50mG2f6R3d0DdqT5dsa2d0HjcVbMC1bR5HISmzibd9kmcZar1rAPyB
 COsZsg+/SRau0gncWj8R1v3dnnGSn+lx/0XyxcwAQztQJy2evQLZb42aQ5hJ7FPHYlmK Gw== 
Received: from nam01-by2-obe.outbound.protection.outlook.com (mail-by2nam01lp2050.outbound.protection.outlook.com [104.47.34.50])
        by mx0a-002ab301.pphosted.com with ESMTP id 2vaej22u1g-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
        for <linux-hwmon@vger.kernel.org>; Tue, 01 Oct 2019 13:49:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TPtSpBa9h15eKG4c3NiWibz7053864zg9hUQR06gt/gJCNSVM5zW3FYyMo2FKgXSDtk0VECKexxwJWEbpIwuCwta4igovuHWxhaNeOMqr9oNhN6TdVec/V9M7yhmnKUC5qJu/LGWNR1L8/iNEOrd5kwn2LJH2zN14/JTzaRh8As3e3kBafFc7U4As+otQBLvUzxlAMZufSc18k4ChzxlRalMFToB+hwZcVwP2D13lxRSy3uKR+U38EWCZ4OgMj+ftXHEFee6htbwyJh+xrSlwNcEShydrD83EoJVvIJbCIghm7Imv+AQLfXDwtJBTZq20mQ62k7w1OZsKnLClIhQ9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pMtmUQjsCsDVUOXH3MaMf9vAYGLuZaEyyQur9zj/Ya4=;
 b=Cmt+kI3FWWJ9HrSnnV2ysMHx4aeKE8QiQg02xgCO6mc07tRwJ43X9+oR6Hk5xZq0xnRMQg61Gd6AsumkStscjT0InvGyi2DmoToXmPeSySRcezgjSlPWPTAe3fTtIZWoq8KSM7RWZUkqy1yLTG0PqqMBkMbSg1sZDN6kik2y3Do2PB62c6O6wYSTJqJX0T3CKzAqyggMQY2t448lC+vwsMQwhbF0miVw2dsl+aeEVykCh+dTeJdF17QRX1xKAoWtwkNB63s4E+sYL1z4G49c1UIbOFNMS2zfoxxGyViWuGctymxKihZLcfSuB0elievV6Y2SKI8EvI3Dv68tz8H28w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=distech-controls.com; dmarc=pass action=none
 header.from=distech-controls.com; dkim=pass header.d=distech-controls.com;
 arc=none
Received: from BL0PR01MB4835.prod.exchangelabs.com (20.177.147.211) by
 BL0PR01MB4578.prod.exchangelabs.com (20.177.241.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Tue, 1 Oct 2019 17:48:58 +0000
Received: from BL0PR01MB4835.prod.exchangelabs.com
 ([fe80::35e9:e131:c84f:e0a5]) by BL0PR01MB4835.prod.exchangelabs.com
 ([fe80::35e9:e131:c84f:e0a5%3]) with mapi id 15.20.2305.017; Tue, 1 Oct 2019
 17:48:58 +0000
From:   "Tremblay, Eric" <etremblay@distech-controls.com>
To:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: [PATCH v2 0/2] hwmon: Add driver for Texas Instruments TMP512/513
 sensor chips
Thread-Topic: [PATCH v2 0/2] hwmon: Add driver for Texas Instruments
 TMP512/513 sensor chips
Thread-Index: AdV4f8AIM6RDxt8pTSyjvLGwY5sKrw==
Date:   Tue, 1 Oct 2019 17:48:57 +0000
Message-ID: <BL0PR01MB4835FA750B01F614D8CA148E959D0@BL0PR01MB4835.prod.exchangelabs.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mib-plugin: true
x-originating-ip: [207.253.3.19]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 60860069-26e8-440f-d2da-08d74697a2b8
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: BL0PR01MB4578:
x-microsoft-antispam-prvs: <BL0PR01MB45780C442A275551F1C17C82959D0@BL0PR01MB4578.prod.exchangelabs.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0177904E6B
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(39860400002)(136003)(396003)(376002)(346002)(366004)(199004)(189003)(14454004)(4744005)(102836004)(9686003)(5640700003)(52536014)(476003)(186003)(5660300002)(2351001)(6506007)(8676002)(7696005)(55016002)(26005)(33656002)(66066001)(99286004)(74316002)(86362001)(81156014)(8936002)(71200400001)(71190400001)(66946007)(81166006)(66446008)(64756008)(66476007)(66556008)(6916009)(76116006)(2906002)(25786009)(486006)(6436002)(7736002)(478600001)(3846002)(256004)(316002)(2501003)(14444005)(6116002)(305945005);DIR:OUT;SFP:1101;SCL:1;SRVR:BL0PR01MB4578;H:BL0PR01MB4835.prod.exchangelabs.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: distech-controls.com does not
 designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QV4TiuUQ6BIdFwscqSzj7wtlN7zynJcXDWZof4r/1gqvt4U0+vvwS0f8X9wH1bARKPpWcSKUBQWovkxlT81I1ii+xScLzE73nub71S9o9N56xlrgtro3Fq5AVKtD1TImpk7Aasy4ayXE39rq7p7+o6Lp79pKjwqQP47i/r97NfS0jA8kBuEZWWj/bVT58+AL58p7lu9yliX8WdTnZpbIKmY90HSOFulocDPDjLf203zb+Bh4xh4RXIN0iO2YK7K55RqE6j2zXwkwo4+F9HnWHPy9Yqj/uQv1xcs6uZtOEqy9vMGF/mtw/YojPrG414LuvnQ0q52V5xbO39an2Vu6/v6CZHo7ghjbAKNVbSjMWsi/0Skt0WRiWbKeLeIRihoflEkm6dbB3pQSEpeJq0abUBXlbODlpZh4fiVSPMwJLxY=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: distech-controls.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60860069-26e8-440f-d2da-08d74697a2b8
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2019 17:48:57.8792
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: caadbe96-024e-4f67-82ec-fb28ff53d16d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lB4Qe+pkkItJT6H+Sen+YDGb7HmekkqqKjkEpRYsjkQms03YkqnGiu0EIEAcIFNvGiIOVhppzGbVNH08cwTDdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR01MB4578
X-Proofpoint-Processed: True
X-Proofpoint-Spam-Details: rule=outbound_spam_notspam policy=outbound_spam score=0 mlxlogscore=999
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 impostorscore=0 mlxscore=0 bulkscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-1908290000 definitions=main-1910010144
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

VmVyc2lvbiB0d28gb2YgdGhlIGRyaXZlciBmb3IgVGV4YXMgSW5zdHJ1bWVudHMgVE1QNTEyLzUx
MyBzZW5zb3JzLg0KDQpUaGFuayB5b3UgdmVyeSBtdWNoIGZvciB2ZXJzaW9uIG9uZSByZXZpZXcu
IEkgcmV3b3JrZWQgdGhlIGRyaXZlcg0KYmFzZWQgb24gdGhlIGNvbW1lbnRzIGxlZnQgb24gdGhl
IGZpcnN0IHZlcnNpb24uDQoNCk1haW4gY2hhbmdlcyBmcm9tIHZlcnNpb24gMToNCgktIFVzZSB0
aGUgd2l0aF9pbmZvIEFQSSBpbnN0ZWFkIG9mIHN5c2ZzIGF0dHJpYnV0ZXMuDQoJLSBSZW1vdmUg
bm9uLXN0YW5kYXJkIGF0dHJpYnV0ZXMgYW5kIHJhdyB2YWx1ZS4NCgktIE1vdmUgc2V0dGluZ3Mg
dGhhdCB3ZXJlIG5vbi1zdGFuZGFyZCBhdHRyaWJ1dGVzIHRvDQoJICBkZXZpY2UgdHJlZSwgdXBk
YXRlIGRvY3VtZW50YXRpb24gYXMgd2VsbC4NCgktIEZpeCBjb2Rpbmcgc3R5bGUgaXNzdWVzDQoN
CkVyaWMgVHJlbWJsYXkgKDIpOg0KICBBZGQgZHJpdmVyIGZvciBUZXhhcyBJbnN0cnVtZW50cyBU
TVA1MTIvNTEzIHNlbnNvciBjaGlwcy4NCiAgQWRkIERUIGJpbmRpbmdzIGZvciBUTVA1MTMgZHJp
dmVyDQoNCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9od21vbi90bXA1MTMudHh0ICAgICAgfCAg
MzMgKw0KIERvY3VtZW50YXRpb24vaHdtb24vdG1wNTEzLnJzdCAgICAgICAgICAgICAgICB8ICA5
OCArKysNCiBNQUlOVEFJTkVSUyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAg
IDcgKw0KIGRyaXZlcnMvaHdtb24vS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICAgICB8ICAx
MCArDQogZHJpdmVycy9od21vbi9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgICAgIHwgICAx
ICsNCiBkcml2ZXJzL2h3bW9uL3RtcDUxMy5jICAgICAgICAgICAgICAgICAgICAgICAgfCA4MDAg
KysrKysrKysrKysrKysrKysrDQogNiBmaWxlcyBjaGFuZ2VkLCA5NDkgaW5zZXJ0aW9ucygrKQ0K
IGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaHdt
b24vdG1wNTEzLnR4dA0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2h3bW9uL3Rt
cDUxMy5yc3QNCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9od21vbi90bXA1MTMuYw0KDQot
LSANCjIuMTcuMQ0KDQoNCg0KDQoNCg==
