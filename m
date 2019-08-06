Return-Path: <SRS0=UELc=WC=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3241DC433FF
	for <linux-hwmon@archiver.kernel.org>; Tue,  6 Aug 2019 07:38:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E5A4F20B1F
	for <linux-hwmon@archiver.kernel.org>; Tue,  6 Aug 2019 07:38:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=analog.onmicrosoft.com header.i=@analog.onmicrosoft.com header.b="2AkLsV3H"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731835AbfHFHif (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 6 Aug 2019 03:38:35 -0400
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77]:51222 "EHLO
        mx0a-00128a01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731807AbfHFHif (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 6 Aug 2019 03:38:35 -0400
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
        by mx0a-00128a01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x767XHlF031960
        for <linux-hwmon@vger.kernel.org>; Tue, 6 Aug 2019 03:38:34 -0400
Received: from nam01-sn1-obe.outbound.protection.outlook.com (mail-sn1nam01lp2052.outbound.protection.outlook.com [104.47.32.52])
        by mx0a-00128a01.pphosted.com with ESMTP id 2u72vtgeh2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-hwmon@vger.kernel.org>; Tue, 06 Aug 2019 03:38:34 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OfoghRWX/IxuAd/rTKx50kJdw+bZzDQhGvT8QqWbW+IQr7IMNTT52N8oaZYyRUZ5mjk7CdCVBc+01Tuxfvk9LaOF4IVgQzy9AD4R8BpCrIYqRvr/jq2adkktyw7NYxcgkttV3f5WNOOefvap4x+xXlrhdDDZiq9i3RuzxqCXult6SnXeFzWynlUAQ0wSlX1IgP7CFEdj+nljnaDVLSz8NDjXuNg3SxWOHOV+snfpS823ePuusjRw96PsHVa2oklS7GKnuMzZEKe/a3ickShhjRnueykGMMSwaGxpV/JqiMTTVbSwbRzTkhOfuYMkwEG9u5W1KgCVMJQ7C5BAwqHP8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Oug1E/nC8uRXDACZnwdR5Rzljqyt/nFuNluRR/vX9s=;
 b=TWOSRgId5hqHlug9H+4fAwiTe0eWtDxFWEbQKU/2flyCX3VJQ+Csao6029zlvGNv1/l/TYOUCkKN1j/AvC6689t+EAyfzglZqEhQObso5jClmjcI9NXGq8C06/WR+CjHy9mMeL4+8TuhQyeooquldQTEo55KFOR2a5xTGXQBF3t7bDtuHXxbiSDmQxE4mYKYhxY7smFD5Hg+D+3lE3y7X0GjO+bYeBt/FMgBZd6Gwx6BUCr995cGQacu8Ov6vlqCc1Z8qaCHsek8+J+V4cNaBcsOhpPLlqnLPDknsV3YVQqz+6iBTUN3BfU4O5tL8fYeKeLu6bgb2MUxRr0NrCQIHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=analog.com;dmarc=pass action=none
 header.from=analog.com;dkim=pass header.d=analog.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Oug1E/nC8uRXDACZnwdR5Rzljqyt/nFuNluRR/vX9s=;
 b=2AkLsV3HmMbrCA4vLhaSaOm5kSBaqLNeIrZoIMYqm27bK6QBPYB5tgC9S/tyr7pZVTJNdXl47PY2eoFF45SVUUOFzBUvT5XSs34sbuDkYeHPI7PkNwTSoLwxK4f2S06XmQI6/hqV4X5DHOOotVM7hF6+wlkI9BdxgrQCi++WPT4=
Received: from BL2PR03MB577.namprd03.prod.outlook.com (10.141.92.20) by
 BL2PR03MB545.namprd03.prod.outlook.com (10.141.90.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.20; Tue, 6 Aug 2019 07:38:32 +0000
Received: from BL2PR03MB577.namprd03.prod.outlook.com
 ([fe80::c4f6:bd96:153c:7b5a]) by BL2PR03MB577.namprd03.prod.outlook.com
 ([fe80::c4f6:bd96:153c:7b5a%7]) with mapi id 15.20.2136.018; Tue, 6 Aug 2019
 07:38:32 +0000
From:   "Sa, Nuno" <Nuno.Sa@analog.com>
To:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: new device support doubts
Thread-Topic: new device support doubts
Thread-Index: AQHVTCnyPCy7zEg/P0iEkdVZTGov5A==
Date:   Tue, 6 Aug 2019 07:38:32 +0000
Message-ID: <80ab6867e69894f34131dbaac4d41ab0a254cac2.camel@analog.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.71.226.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cbe7ea91-4e7b-4a6e-9d30-08d71a4114fe
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:BL2PR03MB545;
x-ms-traffictypediagnostic: BL2PR03MB545:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BL2PR03MB54598D4D323F51122C6C88699D50@BL2PR03MB545.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0121F24F22
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(39860400002)(376002)(346002)(136003)(366004)(396003)(51874003)(199004)(189003)(53754006)(118296001)(486006)(14454004)(6116002)(7736002)(36756003)(8936002)(2501003)(81156014)(8676002)(305945005)(66066001)(53936002)(6486002)(81166006)(6436002)(6512007)(2351001)(256004)(5640700003)(6306002)(4744005)(68736007)(3480700005)(6916009)(2906002)(3846002)(26005)(186003)(86362001)(71200400001)(25786009)(91956017)(6506007)(99286004)(66556008)(64756008)(66476007)(966005)(102836004)(5660300002)(2616005)(476003)(66946007)(71190400001)(478600001)(316002)(66446008)(76116006);DIR:OUT;SFP:1101;SCL:1;SRVR:BL2PR03MB545;H:BL2PR03MB577.namprd03.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: analog.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: AS+2QoczUMYGIgXtt99wOQClCD387loUga5dhb07Ais8wwSpBDgqP2JkET/chy4LB+DQ+0EjnqAiOcTGdRzWd+n2LNVe2g8z76hrDdIAFoGXWZuGhua21TIb0WWvsgXFgkf0TH5qPVzgDHkPA/3yU5yMK8nIw8GvnWxYpOSYdp/OBAjClUQQvpFFBl2tNg1nYMY7bjiSk8J1tPAbg8QKCwBAoOh7lyXHp23/QqvX9hbMbQjvhTQM6/12UXuPJZwDKfNbWEYyeZisb8iOibCuN5mteeP3iyupVhR+ZoPs5VrlyBsOoTfnTpq35G4XZgLh1PTOAPHisuY7a4qcCyCzwNqiCM6/T+bDYmexUAGLXGV0FEuewsXA3ECasKxfth2g7NZdBqrQuABvskeNcv3Jn8khuUO1kXV7cKQt/NTM738=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1FDC7EBC09BF5D4B86D9222DB9468B07@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbe7ea91-4e7b-4a6e-9d30-08d71a4114fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2019 07:38:32.2991
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Nuno.Sa@analog.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL2PR03MB545
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-08-06_04:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908060082
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

SGkgYWxsLA0KDQpJJ20gY3VycmVudGx5IGRldmVsb3BpbmcgYSBkcml2ZXIgZm9yIGEgaHdtb24g
ZGV2aWNlIGFuZCBJIGhhdmUgYSBjb3VwbGUgb2YgcXVlc3Rpb25zIHRoYXQgbWF5YmUgc29tZW9u
ZQ0KaW4gdGhlIGxpc3QgY2FuIGhlbHAgbWUgd2l0aC4gVGhlIGRldmljZSBjYW4gYmUgZm91bmQg
aW46DQpodHRwczovL3d3dy5hbmFsb2cuY29tL21lZGlhL2VuL3RlY2huaWNhbC1kb2N1bWVudGF0
aW9uL2RhdGEtc2hlZXRzL0xUQzI5NDcucGRmDQoNClRoaXMgZGV2aWNlIGFsc28gaGFzIHN1cHBv
cnQgZm9yIG1lYXN1cmluZyBjaGFyZ2Ugd2hpY2gsIGFzIGZhciBhcyBpIHVuZGVyc3RhbmQsIGlz
IG5vdCBhIHN0YW5kYXJkIHR5cGUNCmZvciBod21vbiBzdWJzeXN0ZW0uIFNvLCBteSBxdWVzdGlv
biBpczogSG93IHNob3VsZCBJIGhhbmRsZSB0aGlzPyBTaG91bGQgSSBqdXN0IGFkZCBhIFNFTlNP
Ul9ERVZJQ0VfQVRUUigpDQpvciBpcyB0aGVyZSBhIG1vcmUgYXBwcm9wcmlhdGUgd2F5IG9mIGhh
bmRsaW5nIHRoaXMgKHVzaW5nIHBvd2VyIHN1cHBseSBzdWJzeXN0ZW0pPw0KDQpBbm90aGVyIHRo
aW5nLCBpcyB0aGF0IHRoZSBkZXZpY2Ugc3VwcG9ydHMgY29udGludW91cyBtb2RlIGFuZCBzaW5n
bGUgc2hvdCByZWFkaW5ncy4gT25seSBpbiBjb250aW51b3VzIG1vZGUNCndlIGNhbiBtZWFzdXJl
IGVuZXJneSBhbmQgY2hhcmdlLCBhbmQgdGhlIGRldmljZSBjYW4gaGFuZGxlIHN3aXRjaGluZyBt
b2RlcyBvbiBydW50aW1lLiBTbywgY2FuIHdlIGp1c3QgYWRkIGENCnN5c2ZzIGNvbnRyb2wgZmls
ZSB1bmRlciAvc3lzL2NsYXNzL2h3bW9uL2RldmljZSBvciBpcyBpdCBub3QgdGhlIHdheSB0byBn
bz8NCg0KVGhhbmtzIGluIGFkdmFuY2UsDQpOdW5vIFPDoQ0K
