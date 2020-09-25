Return-Path: <SRS0=1Fx3=DC=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42221C4363D
	for <linux-hwmon@archiver.kernel.org>; Fri, 25 Sep 2020 07:26:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D0C062086A
	for <linux-hwmon@archiver.kernel.org>; Fri, 25 Sep 2020 07:26:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com header.i=@amdcloud.onmicrosoft.com header.b="BvB8uVH0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727449AbgIYH0N (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 25 Sep 2020 03:26:13 -0400
Received: from mail-bn8nam11on2071.outbound.protection.outlook.com ([40.107.236.71]:48060
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727132AbgIYH0N (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 25 Sep 2020 03:26:13 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KDZBC6+n0DbvqMJt8MzAYhwSvhBNVMPydOPrDiv7tHbES6VWT1r6ki6CygIohbcqVP2phW4QisszN6re/CswblgSnz+7LTHbcvqlRADxv01QT+CoxLPr1H969wJmoaUccHDyZGc55XRNQ5sZVW1H2xWtqomDteG0yHEHNhB5G+EN5stxfOSRzhW9BE2sie5jVC+iGaa++TyKEfa/PlVENSGnQZloTL02JGThOSLr076BhD5ae7ZfsCbRYttKUaoUCUbvjABnEBpwuWTflNouQL28sMhxH7s5Z4h5WwVWSh6F4d5auiAU+YZk3mJvNGG40a9EwmMxBNJEgwWXv6ZVMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0/c0s17rpz3jLm9aHE0CwXK/Zqm7njAKjg4jl4D1Ea4=;
 b=iDNZ2NcnfIkgtGu1kDTNjEnzjFL2Lc1oiN9j0Xa9uBWts5CUi3HvtmFtWEsYYL3kFnc0KEZkKKerST3IAUodrJdhDuuUktDE2/Y2XbFaurSuqZudTzOslW8PrtK7rey9RLqE+mIc1FdnHnHoNXDT8QkR+Cp39vrvQ1pH3pW1POSgIYpJ7ZIaS77Tw/Yg/2Z9OtCcOhbI9z3B2+h1Q1GqWsnqobFJWi+8dU3f34zFzHygsp/tXXvgwk7QV7vv0rjGoNena0GsIo4Smm+ylk/AW0/sswh7qzU3VX0N8qcrGXcJVTTFxzDckcsfJvw9GHmvNQP9D+vBg/4AfJxF8Lpvhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0/c0s17rpz3jLm9aHE0CwXK/Zqm7njAKjg4jl4D1Ea4=;
 b=BvB8uVH0vZYyPIpY4TChK9sulVbSlKoGzB90CN1x5aN4EBLT4bUt983SCxwkKUQFTa29+23JWpCIoNIX5Drz22SDJxAAD2+c1W7ss5Mom2Mith1FueI9cUff9OzPAO7On0OUCmEsv1R3IaMQwmXmFEa4qoFiwUIyxnEOCWOcAQI=
Received: from DM6PR12MB4388.namprd12.prod.outlook.com (2603:10b6:5:2a9::10)
 by DM6PR12MB4268.namprd12.prod.outlook.com (2603:10b6:5:223::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.24; Fri, 25 Sep
 2020 07:26:09 +0000
Received: from DM6PR12MB4388.namprd12.prod.outlook.com
 ([fe80::31b8:2b7f:39bb:23af]) by DM6PR12MB4388.namprd12.prod.outlook.com
 ([fe80::31b8:2b7f:39bb:23af%6]) with mapi id 15.20.3412.022; Fri, 25 Sep 2020
 07:26:09 +0000
From:   "Chatradhi, Naveen Krishna" <NaveenKrishna.Chatradhi@amd.com>
To:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
CC:     "linux@roeck-us.net" <linux@roeck-us.net>
Subject: RE: [PATCH 0/6] RFC: hwmon: few improvements to amd_energy driver
Thread-Topic: [PATCH 0/6] RFC: hwmon: few improvements to amd_energy driver
Thread-Index: AQHWg5Ft/d+yuu78rUCW+WvvVrNkdKl5EpLg
Date:   Fri, 25 Sep 2020 07:26:09 +0000
Message-ID: <DM6PR12MB4388FCD50A6A2A28DDD18BCBE8360@DM6PR12MB4388.namprd12.prod.outlook.com>
References: <20200905143230.195049-1-nchatrad@amd.com>
In-Reply-To: <20200905143230.195049-1-nchatrad@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Enabled=true;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SetDate=2020-09-25T07:24:15Z;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Method=Privileged;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Name=Public_0;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ActionId=abdbe0d9-a409-4c4b-a749-00001ed69b9e;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ContentBits=1
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_enabled: true
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_setdate: 2020-09-25T07:26:05Z
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_method: Privileged
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_name: Public_0
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_actionid: 59064b10-57f3-4e3c-976d-0000ece74110
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_contentbits: 0
authentication-results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
x-originating-ip: [165.204.159.242]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 9e938eb2-0c99-4967-5d98-08d8612445f9
x-ms-traffictypediagnostic: DM6PR12MB4268:
x-microsoft-antispam-prvs: <DM6PR12MB4268D586BA90A8F0CAB58D0AE8360@DM6PR12MB4268.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: myN4Rb1CVMUeyo8+RzZbG07mn7NgxyPveXkvQ7PbGiTvhmPSIR258SW8ScvqQQ3sdcBur/oit8qlVSMK1dQUkys0k6gGP1NcdWOg/1/8DHpHJzSOTQR8ZBORbHfJWMcZ2rAe85vzo6ytmnQZWoh4oePG6R8QKuFVvzuxc3q49HCEZ57chYsXWzamEINtIISJ34kysy9P8/Ryt7ZHRpSnRxh13YrohUgbdJy9G35srAYGJ/U3dKTnT1kN4Xb4o2ZwgBt92xmFOV3RVGOeFIciI2RPdA6MO8Ynm6wcKyVmYkbz1hprCiWPIulXcGaozl1EUkQ5i2/StDLOsQG8MtWps2uan45zWCBg6G4kpBgfL7ZkRlxubeIae46hMy5r80HT0y27HD+avwRje6cvyi2X1TmwzvZwob1yegrs8E67t3I=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4388.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(346002)(136003)(39860400002)(396003)(6506007)(53546011)(7696005)(186003)(26005)(4326008)(478600001)(8936002)(316002)(6916009)(9686003)(8676002)(86362001)(55016002)(5660300002)(52536014)(71200400001)(66446008)(64756008)(66556008)(66476007)(83380400001)(33656002)(76116006)(66946007)(2906002)(197533005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: IREEQQ3QSNdWFt9cIvxpUOFZRoEkCM7WV8dDCBJ62fNLYsyQaqQOqDGtQXR9WZ7fbOsiz1oc1U95ZoXxp+jLJgD848n2vhAJu55RSz6RD2ieskvXKd98aRxK08t6l32907KHhP0APV434FpAANnHjtg9RFdtqyy0VNNWyf6HSgjh8is5FG6pE6x/eTY6liDWuop1wonUthOgQEW4vGRDKWp43zybKZjXIUGXfM/FeofArrwze/P3jUFrreFAxv223YJxkR1hDJH5ODVyNBm5PgGp7UG+dDMAQsf3YT6LfBJxxfzJdIrguf6fY3nDkVPaX43i76sQqU5GGkGG0frTbfhsZ62HajpaUt/5Zo2U2NLighwoGcnyr5QTiVWUbMIPi1ComjvcVl0QEUD/5UolCLrVIIchOG6X+qaCO1qmgFUmp/CTMpE0I2F8z04V+YhPDe8E/leqVN6b8RkcubH2JPJTdY4S0xQvVFQ5Gi5iHApJHfJ5S54NzP6YZtq8/4aGKHLEriu0ps52Qb/EfHmeflIgDbFk4ei+g+Otd1ijjRYt8ww0Bm+tgjach0NB58stgnsJ6fSLLB/EfEQakuaVUM+CZst6ahxZORYLTS920TjHyhBeCPBw5qTnxluyLgpuC2Get1V3XO/n4YsE1gNjWQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4388.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e938eb2-0c99-4967-5d98-08d8612445f9
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2020 07:26:09.3154
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OrvNsOZxsbZVI9izfN41o+4JwSNY5EiernJUW3CVuX4e8vfTb8/CbXwLOlNt08LBUP3fd6hxvqk7/k8oE4823A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4268
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

W0FNRCBQdWJsaWMgVXNlXQ0KDQpIaSBHdWVudGVyLA0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2Ut
LS0tLQ0KRnJvbTogQ2hhdHJhZGhpLCBOYXZlZW4gS3Jpc2huYSA8TmF2ZWVuS3Jpc2huYS5DaGF0
cmFkaGlAYW1kLmNvbT4gDQpTZW50OiBTYXR1cmRheSwgU2VwdGVtYmVyIDUsIDIwMjAgODowMiBQ
TQ0KVG86IGxpbnV4LWh3bW9uQHZnZXIua2VybmVsLm9yZw0KQ2M6IGxpbnV4QHJvZWNrLXVzLm5l
dDsgQ2hhdHJhZGhpLCBOYXZlZW4gS3Jpc2huYSA8TmF2ZWVuS3Jpc2huYS5DaGF0cmFkaGlAYW1k
LmNvbT4NClN1YmplY3Q6IFtQQVRDSCAwLzZdIFJGQzogaHdtb246IGZldyBpbXByb3ZlbWVudHMg
dG8gYW1kX2VuZXJneSBkcml2ZXINCg0KSGkgR3VlbnRlciwNCg0KV291bGQgbGlrZSB0byBrbm93
IHlvdXIgZmVlZGJhY2sgb24gdGhlIGZvbGxvd2luZyBmZWF0dXJlcyBmb3IgdGhlIGFtZF9lbmVy
Z3kgZHJpdmVyLg0KDQoxKSBTeXNmcyBlbnRyeSBmb3IgZHVtcGluZyBlbmVyZ3kgY291bnRlcnMg
b2YgYWxsIHRoZSBjb3Jlcw0KwqAgwqAgLSBPbiBsYXRlc3QgQ1BVcyB0aGVyZSBjYW4gYmUgYXMg
bWFueSBhcyAxMjggY29yZXMuDQogICAgICBBbiBBQkkgZm9yIGR1bXBpbmcgYWxsIDEyOCBjb3Vu
dGVycyB1c2luZyBzZXFfcHJpbnRmKCkNCiAgICAgIHRvIGEgZGVidWdmcy9zeXNmcyBmaWxlIHdv
dWxkIHNhdmUgYSBsb3Qgb2YgY3ljbGVzLg0KDQoyKSBFbmFibGUvRGlzYWJsZSB0aGUgYWNjdW11
bGF0aW9uLCBEaXNhYmxlZCBieSBkZWZhdWx0DQrCoCDCoCAtIFRoZSBhY2N1bXVsYXRvciB0aHJl
YWQgbWF5IGludHJvZHVjZSBzb21lIG5vaXNlLg0KICAgICAgUHJvdmlkaW5nIGEga25vYiB0byBl
bmFibGUvZGlzYWJsZSAoc3RhcnQvc3RvcCkgdGhlDQogICAgICBhY2N1bXVsYXRpb24gaW4gc29m
dHdhcmUuDQoNCjMpIEFjY3VtdWxhdG9yIEludGVydmFsIGNoYW5nZSBiYXNlZCBvbiByZXBvcnRl
ZCByZXNvbHV0aW9uDQrCoCDCoCAtIEZyZXF1ZW5jeSBvZiB0aGUgYWNjdW11bGF0b3IgdGhyZWFk
IGNhbiBiZSBzZXQgZHVyaW5nDQogICAgICB0aGUgcHJvYmUgYmFzZWQgb24gZmluZSBncmFpbiAo
MS42MjUgbWljcm8gSikgb3IgY291cnNlDQogICAgICBncmFpbiAoMC4xMjUgbWlsbGkgSikgcmVz
b2x1dGlvbnMuDQpbbmF2ZWVuazpdIEkgd2lsbCBzdWJtaXQgdGhlIHYyIGRyb3BwaW5nICMxIGFu
ZCAjMiBmb3Igbm93LiANCg0KQWtzaGF5IEd1cHRhICgxKToNCiAgaHdtb246IGFtZF9lbmVyZ3k6
IE1vdmUgbGFiZWwgb3V0IG9mIGFjY3VtdWxhdGlvbiBzdHJ1Y3R1cmUNCg0KTmF2ZWVuIEtyaXNo
bmEgQ2hhdHJhZGhpICg1KToNCiAgaHdtb246IGFtZF9lbmVyZ3k6IG9wdGltaXplIGFjY3VtdWxh
dGlvbiBpbnRlcnZhbA0KICBod21vbjogYW1kX2VuZXJneTogSW1wcm92ZSB0aGUgYWNjdW11bGF0
aW9uIGxvZ2ljDQogIGh3bW9uOiBhbWRfZW5lcmd5OiBsZXQgdXNlciBlbmFibGUvZGlzYWJsZSB0
aGUgc3cgYWNjdW11bGF0aW9uDQogIGh3bW9uOiBhbWRfZW5lcmd5OiBkdW1wIGVuZXJneSBjb3Vu
dGVycyB2aWEgZGVidWdmcw0KICBod21vbjogKGFtZF9lbmVyZ3kpIFVwZGF0ZSBkcml2ZXIgZG9j
dW1lbnRhdGlvbg0KDQogRG9jdW1lbnRhdGlvbi9od21vbi9hbWRfZW5lcmd5LnJzdCB8ICAxOSAr
Kw0KIGRyaXZlcnMvaHdtb24vYW1kX2VuZXJneS5jICAgICAgICAgfCAzNTEgKysrKysrKysrKysr
KysrKysrKysrLS0tLS0tLS0NCiAyIGZpbGVzIGNoYW5nZWQsIDI3MyBpbnNlcnRpb25zKCspLCA5
NyBkZWxldGlvbnMoLSkNCg0KLS0NCjIuMjYuMg0K
