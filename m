Return-Path: <SRS0=nYzv=X2=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D60A9ECE587
	for <linux-hwmon@archiver.kernel.org>; Tue,  1 Oct 2019 18:17:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A2160215EA
	for <linux-hwmon@archiver.kernel.org>; Tue,  1 Oct 2019 18:17:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=distech-controls.com header.i=@distech-controls.com header.b="Kn+twnsw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726376AbfJASRi (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 1 Oct 2019 14:17:38 -0400
Received: from mx0b-002ab301.pphosted.com ([148.163.154.99]:32986 "EHLO
        mx0b-002ab301.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726873AbfJASRi (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 1 Oct 2019 14:17:38 -0400
X-Greylist: delayed 1622 seconds by postgrey-1.27 at vger.kernel.org; Tue, 01 Oct 2019 14:17:36 EDT
Received: from pps.filterd (m0118796.ppops.net [127.0.0.1])
        by mx0b-002ab301.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id x91HaKV1007340
        for <linux-hwmon@vger.kernel.org>; Tue, 1 Oct 2019 13:50:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=distech-controls.com; h=from : to :
 subject : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=pps-02182019;
 bh=tfCYR9qa+o11pkF/dU9FpdHIUOkauZgHljcQqMTZ9q0=;
 b=Kn+twnswdgHeyP6wFnWaef8+FIdBDsQzDhNHaxgvWzGfjWCnSGc8A7WSj9ASSmRMb/6M
 NzCT1NS8NMd+u3cZ/MtTNQ3vawWJtQtWn41aIrN/+jq8gT0ic6FZ7MZqrylsUrsCHE4G
 NALgilZ0f0AZ7mMnar2N4Otg/zvldMBLF+VWqpWLAW+cjpQ6GE9jt7vsw6DCpcecicc8
 pdUtKC8bSzvvnxX6PSfl5hwADBFQZWMFt0vjk0+mt6nUV+Y/7LXz12Jsml7unDShdBls
 TsD/2z588R5lpjGkWN9t1rDgTFU25pY2Lyf+9cJrpGm6K8QrQjH9Col4Mi3SHGe/CYfA Dg== 
Received: from nam01-by2-obe.outbound.protection.outlook.com (mail-by2nam01lp2053.outbound.protection.outlook.com [104.47.34.53])
        by mx0b-002ab301.pphosted.com with ESMTP id 2vaej1jsws-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
        for <linux-hwmon@vger.kernel.org>; Tue, 01 Oct 2019 13:50:34 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oHCq6PWVHNZ0OKLFlyex56EMt98ailRRgFDloO35qT8koMWrc1UWjSMWtLZZkRW5BeQFBFfIrT2NXzmavsqIt6ZBjW+qiq3cF4vlVBkLKFUtJkz8tCqlRhZ4RM1liu522c8X6cluburusuaZN5pbpGHlOHaaeIcFReP9obKxhaGLOtm+pbO2p8SZu6EPmksi1qH2R36G+SEBCkk1nIj6nICkjSmjrMZPh34xnM9EkiNAqFtjHwM14Q2TEUIO7PxM5HuwefUFaSrBtB4OOZ5Wn/spGTWeiSrb7oKk9l/zwTv05PP/8i7xVT26FYvgjM/iUytiVTvl8gQF7bxSv/JMAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tfCYR9qa+o11pkF/dU9FpdHIUOkauZgHljcQqMTZ9q0=;
 b=FB/gdtKVrKuR76aeuacrjkA31Pg3fLq5Hd/oB5mZJdIlYXoAuDgFgLkLgYLZHYmIVyUcP9ETEQ/DdEU+HuF4tyRmpVBNzuaatDCZwfwm5pRQr2521GKQIQPJUQ99mJHx0MjbQdHE8a1TEv5IzS1bs2GoIasGlu7YOYXiAZcO4OVJStkMWiBJwEmGWMRWNzEmbGOl00pca6O06oMxZJy7cdZDYu+on3islT2RqW9PUhmD0EjsBkbNbUHYQ8rekP2L6hMy2YFi4GqI29pWHXG6ybZKhEXX1BbT/seH1bfynhKSat/YZPPB/2lXYWdgvWw07fxmg7VZHkBXs9H0FkiCyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=distech-controls.com; dmarc=pass action=none
 header.from=distech-controls.com; dkim=pass header.d=distech-controls.com;
 arc=none
Received: from BL0PR01MB4835.prod.exchangelabs.com (20.177.147.211) by
 BL0PR01MB4578.prod.exchangelabs.com (20.177.241.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Tue, 1 Oct 2019 17:50:32 +0000
Received: from BL0PR01MB4835.prod.exchangelabs.com
 ([fe80::35e9:e131:c84f:e0a5]) by BL0PR01MB4835.prod.exchangelabs.com
 ([fe80::35e9:e131:c84f:e0a5%3]) with mapi id 15.20.2305.017; Tue, 1 Oct 2019
 17:50:32 +0000
From:   "Tremblay, Eric" <etremblay@distech-controls.com>
To:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: [PATCH v2 2/2] hwmon: Add driver for Texas Instruments TMP512/513
 sensor chips
Thread-Topic: [PATCH v2 2/2] hwmon: Add driver for Texas Instruments
 TMP512/513 sensor chips
Thread-Index: AdV4gKvqq5zO+PMTRB+ZZ75+ZF+MTg==
Date:   Tue, 1 Oct 2019 17:50:32 +0000
Message-ID: <BL0PR01MB48359694ECBFB5D97A508C10959D0@BL0PR01MB4835.prod.exchangelabs.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mib-plugin: true
x-originating-ip: [207.253.3.19]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3e5293fb-2f34-46ea-3bbf-08d74697dae1
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: BL0PR01MB4578:
x-microsoft-antispam-prvs: <BL0PR01MB457828AA6DAB61A45782225C959D0@BL0PR01MB4578.prod.exchangelabs.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 0177904E6B
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(39860400002)(136003)(396003)(376002)(346002)(366004)(199004)(189003)(14454004)(102836004)(9686003)(5640700003)(52536014)(476003)(186003)(5660300002)(2351001)(6506007)(8676002)(7696005)(55016002)(26005)(33656002)(66066001)(99286004)(74316002)(86362001)(81156014)(8936002)(71200400001)(71190400001)(66946007)(81166006)(66446008)(64756008)(66476007)(66556008)(6916009)(76116006)(2906002)(25786009)(486006)(6436002)(7736002)(478600001)(3846002)(256004)(316002)(2501003)(6116002)(305945005);DIR:OUT;SFP:1101;SCL:1;SRVR:BL0PR01MB4578;H:BL0PR01MB4835.prod.exchangelabs.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: distech-controls.com does not
 designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5KEYluh66crQq3r+E7JbtKhzr9xYLUReyWHI08FJ9fdcAcohwkSysOqK77DM1VSkIG1JQrh1mNSmYu6cH+uKx3iha6dXind+yCU5wVj3d7fRwqcMlsakmtTnAx3nbi9mG3nxvE29J3VlKYcmH8+m7kcl27eJRZpUsWcPayKp8A1hyatVL7V+oIEQQ4GdZ/96QWWtud2PJOzFQfwrNyhYDJYPGXSb1yW8nwPEkaIawU24VDQn43hgTsOA/HoyajGxMAErhTdY1NRKK4tyvIHH/ODmKfv2nFuiMFX6k+6Xxd24UpqRXxm+8p6bSFnucO0/Onupq5NfBNS9Q+4YjLhIyPK+xS1Vye1XUhTO8dbkWcUumwtrhG0V7gK8tO403e8Y89ZkOVIi/WMI4niP5c7q83Vv4uuaKBcAXKFZjaRCaV8=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: distech-controls.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e5293fb-2f34-46ea-3bbf-08d74697dae1
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2019 17:50:32.0905
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: caadbe96-024e-4f67-82ec-fb28ff53d16d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MxnOcWwvt7qQtC6n9ocXWEh3S9oG2tIEGaJ0Z8kYQ85siiGyuB5f7UBbm+vwwoJ1+uB7L8GAYrfnzlFV8ZNJ2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR01MB4578
X-Proofpoint-Processed: True
X-Proofpoint-Spam-Details: rule=outbound_spam_notspam policy=outbound_spam score=0 bulkscore=0
 mlxlogscore=999 adultscore=0 clxscore=1015 spamscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 mlxscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1908290000 definitions=main-1910010144
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

aHdtb246IEFkZCBEVCBiaW5kaW5ncyBmb3IgVE1QNTEzIGRyaXZlcg0KDQpTaWduZWQtb2ZmLWJ5
OiBFcmljIFRyZW1ibGF5IDxldHJlbWJsYXlAZGlzdGVjaC1jb250cm9scy5jb20+DQotLS0NCiAu
Li4vZGV2aWNldHJlZS9iaW5kaW5ncy9od21vbi90bXA1MTMudHh0ICAgICAgfCAzMyArKysrKysr
KysrKysrKysrKysrDQogMSBmaWxlIGNoYW5nZWQsIDMzIGluc2VydGlvbnMoKykNCiBjcmVhdGUg
bW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2h3bW9uL3RtcDUx
My50eHQNCg0KZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9o
d21vbi90bXA1MTMudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2h3bW9u
L3RtcDUxMy50eHQNCm5ldyBmaWxlIG1vZGUgMTAwNjQ0DQppbmRleCAwMDAwMDAwMDAwMDAuLjBm
NjE3OTNjYmYyZg0KLS0tIC9kZXYvbnVsbA0KKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2h3bW9uL3RtcDUxMy50eHQNCkBAIC0wLDAgKzEsMzMgQEANCitUTVA1MTMgc3lz
dGVtIG1vbml0b3Igc2Vuc29yDQorLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KKw0KK1JlcXVp
cmUgbm9kZSBwcm9wZXJ0aWVzOg0KKy0gY29tcGF0aWJsZTogb25lIG9mDQorCQkidGksdG1wNTEy
Ig0KKwkJInRpLHRtcDUxMyINCistIHJlZyA6IHRoZSBJMkMgYWRkcmVzcyBvZiB0aGUgZGV2aWNl
LiBUaGlzIGlzIDB4NWMsIDB4NWQsIDB4NWUsIG9yIDB4NWYuDQorLSBzaHVudC1yZXNpc3Rvci11
b2htIDogVGhlIHNodW50IHJlc2lzdG9yIHZhbHVlIGluIHVPaG0uDQorDQorT3B0aW9uYWwgcHJv
cGVydGllczoNCistIGJ1cy12b2x0YWdlLXJhbmdlOiAzMlYgb3IgMTZWLCBkZWZhdWx0IHRvIDMy
Vi4NCistIG1heC1leHBlY3RlZC1jdXJyZW50LW1hOiBNYXhpbXVtIGV4cGVjdGVkIGN1cnJlbnQg
dmFsdWUuIERlZmF1bHQgdG8gbWF4IHBvc3NpYmxlIHZhbHVlLg0KKy0gcGdhLWdhaW46IFRoZSBn
YWluIHZhbHVlIGZvciB0aGUgUEdBIGZ1bmN0aW9uLiBUaGlzIGlzIDgsIDQsIDIgb3IgMS4gRGVm
YXVsdCB0byA4Lg0KKy0gdGVtcF8yX25mYWN0b3I6IG5GYWN0b3IgZm9yIHJlbW90ZSBjaGFubmVs
IDEuIFZhbHVlIGFjY29yZGluZyB0byBUYWJsZSAxMSBpbiBkYXRhc2hlZXQuDQorLSB0ZW1wXzNf
bmZhY3RvcjogbkZhY3RvciBmb3IgcmVtb3RlIGNoYW5uZWwgMi4gVmFsdWUgYWNjb3JkaW5nIHRv
IFRhYmxlIDExIGluIGRhdGFzaGVldC4NCistIHRlbXBfNF9uZmFjdG9yOiBuRmFjdG9yIGZvciBy
ZW1vdGUgY2hhbm5lbCAzLiBWYWx1ZSBhY2NvcmRpbmcgdG8gVGFibGUgMTEgaW4gZGF0YXNoZWV0
LA0KKwkJCQkgIFRNUDUxMyBvbmx5Lg0KKy0gdGVtcF9oeXN0ZXJlc2lzOiBIeXN0ZXJlcmlzIGZv
ciB0ZW1wZXJhdHVyZSBsaW1pdHMuDQorDQorRXhhbXBsZToNCisJdG1wNTEzQDVjIHsNCisJCSAg
Y29tcGF0aWJsZSA9ICJ0aSx0bXA1MTMiOw0KKwkJICByZWcgPSA8MHg1Qz47DQorCQkgIHNodW50
LXJlc2lzdG9yLXVvaG0gPSA8MzMwPjsNCisJCSAgYnVzLXZvbHRhZ2UtcmFuZ2UgPSA8MzI+Ow0K
KwkJICBwZ2EtZ2FpbiA9IDw4PjsNCisJCSAgbWF4LWV4cGVjdGVkLWN1cnJlbnQtbWEgPSA8MTAw
PjsNCisJCSAgdGVtcF8yX25mYWN0b3IgPSA8MHgwMT47DQorCQkgIHRlbXBfM19uZmFjdG9yID0g
PDB4MDI+Ow0KKwkJICB0ZW1wXzRfbmZhY3RvciA9IDwweDAzPjsNCisJCSAgdGVtcF9oeXN0ZXJl
c2lzID0gPDU+Ow0KKwl9Ow0KLS0gDQoyLjE3LjENCg0K
