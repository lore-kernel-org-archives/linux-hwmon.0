Return-Path: <SRS0=YDtn=YA=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 455E7ECE58C
	for <linux-hwmon@archiver.kernel.org>; Mon,  7 Oct 2019 12:26:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F01E82173B
	for <linux-hwmon@archiver.kernel.org>; Mon,  7 Oct 2019 12:26:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=analog.onmicrosoft.com header.i=@analog.onmicrosoft.com header.b="OAS940p4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727983AbfJGM0V (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 7 Oct 2019 08:26:21 -0400
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77]:40820 "EHLO
        mx0a-00128a01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727467AbfJGM0S (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 7 Oct 2019 08:26:18 -0400
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
        by mx0a-00128a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id x97CMkTG002503;
        Mon, 7 Oct 2019 08:25:51 -0400
Received: from nam01-by2-obe.outbound.protection.outlook.com (mail-by2nam01lp2057.outbound.protection.outlook.com [104.47.34.57])
        by mx0a-00128a01.pphosted.com with ESMTP id 2ver39fm5b-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 07 Oct 2019 08:25:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U2Kxa2YrmNw6RdqTI09r1vo2QjWAlxMlgvgbHNv3v+ieRiAmuQk1hdjvdQP6hygmD7pC3uNPtWXr1StQQz/PTMWAZLYVvwQjn7W/B4p8i3YSc9rSLprFgSvcqddWUdxsprwJ0QrnrWoVy1ECuCbhdoSycO7rlmYVndMj2cYR9WCkCAZnecZt4Rilv2cwwDRHH7Tqq+KtFSh4OVbPzagXF696T73njvq555Qwu3Uhvo/Dwysn5tQnxIsaq8x4S3TagcFV/52XOHPDpoBdt/jCRgxRgDKBUCgF7GDK+7noPC+40wvXf214aX3b5nhs49OmMO+QbV54vAUWBX2GtwL8zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=27qkRDp3tbIOVFT/wldKftHOBBQWRoCappFWbZvc62g=;
 b=AaNjafIMxHAZbWGaEoxLAkVREnf7ZXoAkLOJn/E6OtQYyJIx5HZyCUqxO/UOmTAHKqiEkdiJaWC/wHUAMfq0trZkMkWkSf0bW9+qAalJlDiroKyA3pZBOu8488Dcld9h+JGAbgaCTxFg7UMW8hPzwsMtjqB+tJVW1s5HOkQPovQRp6UBOSmbJ4NTGzXccUZYsozZrUfPrZj0bPV2KZ0oVdi0hVEGBpg0gkwxBZpVxvUGsfKidx19SiFl2pN7NEoE2+cTVl0wSrH+qkxdChRrIQshjDIJPrlFNM6HusJTpGgGdMXeuYRzf+VSWTGck2pEh7ccrgTyWm/vzOSxlZhymQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=27qkRDp3tbIOVFT/wldKftHOBBQWRoCappFWbZvc62g=;
 b=OAS940p4Wj9xjMx5enEkaUnKJ+ucZuu7G+1YRKdLlpnlFKdl1sbBvRHX69+lhuZ8JkYyeIulriTEFzaYR3g6j4+iaDdodu4ZpKc++XepOVF+mMdj/m+9E5H1BpVbGavNud0LqcKCMgtJxwtRt5llQAYSmL0Xd97jzKfTm1rNnDQ=
Received: from MN2PR03MB5117.namprd03.prod.outlook.com (52.132.171.137) by
 MN2PR03MB4736.namprd03.prod.outlook.com (20.179.81.202) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2327.24; Mon, 7 Oct 2019 12:25:49 +0000
Received: from MN2PR03MB5117.namprd03.prod.outlook.com
 ([fe80::8c20:8f3b:b536:dca5]) by MN2PR03MB5117.namprd03.prod.outlook.com
 ([fe80::8c20:8f3b:b536:dca5%7]) with mapi id 15.20.2327.025; Mon, 7 Oct 2019
 12:25:49 +0000
From:   "Sa, Nuno" <Nuno.Sa@analog.com>
To:     "linux@roeck-us.net" <linux@roeck-us.net>
CC:     "jdelvare@suse.com" <jdelvare@suse.com>,
        "corbet@lwn.net" <corbet@lwn.net>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
Subject: Re: [PATCH 2/3] hwmon: Add support for  ltc2947
Thread-Topic: [PATCH 2/3] hwmon: Add support for  ltc2947
Thread-Index: AQHVctaaRoH0g8eimU2Gaa/u2JCpzKdIXIAAgAHNOACAAHssgIAEikGA
Date:   Mon, 7 Oct 2019 12:25:49 +0000
Message-ID: <7d4ca133201f8c75855de6777f6018567701e16a.camel@analog.com>
References: <20190924124945.491326-1-nuno.sa@analog.com>
         <20190924124945.491326-3-nuno.sa@analog.com>
         <20191003041446.GA2332@roeck-us.net>
         <d0a992bebbc3c388b6be100d1821fa5813fcc1b4.camel@analog.com>
         <20191004150623.GA28287@roeck-us.net>
In-Reply-To: <20191004150623.GA28287@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.71.226.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5e3c60c0-c1ed-42c5-5337-08d74b217cd8
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: MN2PR03MB4736:
x-microsoft-antispam-prvs: <MN2PR03MB4736F2E1E06BBB9BBFF251C9999B0@MN2PR03MB4736.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01834E39B7
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(346002)(39860400002)(376002)(136003)(396003)(366004)(199004)(189003)(118296001)(71200400001)(229853002)(2501003)(14444005)(256004)(6916009)(316002)(3846002)(6246003)(4326008)(2351001)(305945005)(71190400001)(6116002)(7736002)(6436002)(54906003)(6486002)(2906002)(6512007)(5640700003)(25786009)(102836004)(6506007)(81156014)(8676002)(76176011)(81166006)(99286004)(478600001)(11346002)(66446008)(5660300002)(2616005)(86362001)(14454004)(36756003)(26005)(66946007)(486006)(64756008)(186003)(91956017)(76116006)(446003)(66066001)(8936002)(66556008)(66476007)(476003)(1730700003);DIR:OUT;SFP:1101;SCL:1;SRVR:MN2PR03MB4736;H:MN2PR03MB5117.namprd03.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: analog.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DpPWEUtT7entUZ3+/OiKGxy74D/a5EiyoLMplG4/WOPEokBsFh+PsZOZgtfyqF0seDHM2v6LVwI84QLMuLfEI8YhaQjQsArgG7L1nWp5vBwEJ5D+k4Uec5sRI7bylfg2iXapKa8Zp0aD7bYAKvSaktMzPE6Wj3cr/L7+gVx3ZftXht3MSPfsguBDEzsyVjM5oFoYwradFvQ4IV8w3F2IfhUlBu8Df7TAQ0us4k0o9Ia8XvfmOQjaTGM2Uj+6wUoBaciPiumonJBx/ILewvkpjsdBZCXQEZiTod537aTXoT/20jBx0Nkxvx0aruMYZHpUfQjQVHJTstNuY64v22fwiNhP4fbUjZn3PT1QONkwwLZisJGSL0k95WACPjTBtLG6qmM3Gwh67yeptcDM9EURQN7wgfHhbnFA2aDpLgPgV7Q=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <2F51EDFA7F360948BA0534B875E4F455@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e3c60c0-c1ed-42c5-5337-08d74b217cd8
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2019 12:25:49.5844
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9IDerrJCWYGU4HKHNz0Od9crRfXVELsfgyhywbm5q7EvaZV1B2W51sIA0Jk5HYov7meF+3ESSmxlr/dMMG1iRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB4736
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-07_02:2019-10-07,2019-10-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 mlxscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1908290000 definitions=main-1910070124
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

T24gRnJpLCAyMDE5LTEwLTA0IGF0IDA4OjA2IC0wNzAwLCBHdWVudGVyIFJvZWNrIHdyb3RlOg0K
PiANCj4gT24gRnJpLCBPY3QgMDQsIDIwMTkgYXQgMDc6NDU6MDdBTSArMDAwMCwgU2EsIE51bm8g
d3JvdGU6DQo+IFsgLi4uIF0NCj4gPiA+ID4gK3N0YXRpYyBpbnQgbHRjMjk0N192YWxfcmVhZChz
dHJ1Y3QgbHRjMjk0N19kYXRhICpzdCwgY29uc3QgdTgNCj4gPiA+ID4gcmVnLA0KPiA+ID4gPiAr
CQkJICAgIGNvbnN0IHU4IHBhZ2UsIGNvbnN0IHNpemVfdCBzaXplLA0KPiA+ID4gPiBzNjQgKnZh
bCkNCj4gPiA+ID4gK3sNCj4gPiA+ID4gKwlpbnQgcmV0Ow0KPiA+ID4gPiArCXU2NCBfX3ZhbCA9
IDA7DQo+ID4gPiA+ICsNCj4gPiA+ID4gKwltdXRleF9sb2NrKCZzdC0+bG9jayk7DQo+ID4gPiA+
ICsNCj4gDQo+IE9uIGEgc2lkZSBub3RlLCBzdXNwZW5kIGNvZGUgaXMgc3VwcG9zZWQgdG8gYmUg
YXRvbWljLA0KPiBJZiB0aGlzIGxvY2sgaXMgaGVsZCwgdGhlIHByb2Nlc3Mgb3IgdGhyZWFkIGhv
bGRpbmcgaXQNCj4gd2lsbCBsaWtlbHkgc3RhbGwgc3VzcGVuZCBzaW5jZSBpdCB3b24ndCBydW4u
DQo+IEF0IHRoZSB2ZXJ5IGxlYXN0LCB0aGlzIHdvdWxkIGhhdmUgdG8gYmUgYSB0cnlsb2NrLA0K
PiB3aXRoIHN1c3BlbmQgZmFpbGluZyBpZiB0aGUgbG9jayBjYW4gbm90IGJlIGFjcXVpcmVkLg0K
DQpHb3QgaXQuIEV2ZW4gbW9yZSwgTm93IEkgZG9uJ3Qgc2VlIHRoZSBwb2ludCBvZiBoYXZpbmcg
dGhlIG11dGV4IGluIHRoZQ0KUE0gY2FsbGJhY2tzICh0aG91Z2ggSSBzYXcgb3RoZXIgZHJpdmVy
cyBkb2luZyB0aGlzKS4gQXMgeW91IHNhaWQsIGF0DQp0aGUgdmVyeSBsZWFzdCB0aGUgdHJ5bG9j
ayBzaG91bGQgYmUgdXNlZCBzaW5jZSBhIGZyb3plbiB0YXNrIG1pZ2h0DQpoYXZlIHRoZSBtdXRl
eCBsb2NrZWQuIEVpdGhlciB3YXksIEkgd2lsbCBkcm9wIGJvdGggdGhlIGZsYWcgYW5kIHRoZQ0K
Y2FsbCB0byBtdXRleF8qIGZ1bmN0aW9ucyBpcyBzdXNwZW5kKCkvcmVzdW1lKCkuDQoNCj4gPiA+
ID4gKwlpZiAoc3QtPnJlc2V0KSB7DQo+ID4gPiA+ICsJCW11dGV4X3VubG9jaygmc3QtPmxvY2sp
Ow0KPiA+ID4gPiArCQlyZXR1cm4gLUVQRVJNOw0KPiA+ID4gDQo+ID4gPiBOb3Qgc3VyZSB3aGF0
IHRoZSBlcnJvciBoZXJlIHNob3VsZCBiZSwgYnV0IEVQRVJNIGlzIG5vdCBjb3JyZWN0Lg0KPiA+
ID4gDQo+ID4gPiBVbmRlciB3aGljaCBjb25kaXRpb25zIHdvdWxkIHRoaXMgZnVuY3Rpb24gYmUg
Y2FsbGVkIHdoaWxlIGluDQo+ID4gPiBzdXNwZW5kID8NCj4gPiANCj4gPiBIb25lc3RseSwgdGhp
cyBpcyBtb3JlIGxpa2UgYSBzYW5pdHkgY2hlY2suIEknbSBub3Qgc3VyZSBpZiB3ZSBjYW4NCj4g
PiBnZXQNCj4gPiBoZXJlIGluIHN1c3BlbmQgbW9kZS4gRG9uJ3QgdXNlcmxhbmQgYXBwcyBjYW4g
c3RpbGwgcnVuIGluIHN1c3BlbmQ/DQo+ID4gSQ0KPiA+IGd1ZXNzIHNvIGJ1dCBJJ20gbm90IDEw
MCUgc3VyZSBvbiB0aGlzLiBEbyB5b3UgaGF2ZSBhbnkNCj4gPiByZWNvbW1lbmRhdGlvbg0KPiA+
IGZvciB0aGUgZXJyb3IgaGVyZT8NCj4gPiANCj4gU29ycnksIEkgd29uJ3QgYWNjZXB0ICJqdXN0
IGluIGNhc2UiIGNvZGUuDQo+IA0KPiBIYXZpbmcgc2FpZCB0aGF0LCBwbGVhc2UgaW5mb3JtIHlv
dXJzZWxmIGhvdyBzdXNwZW5kIHdvcmtzLiBVc2VybGFuZA0KPiBjb2RlDQo+IGhhcyB0byBiZSBz
dG9wcGVkIGJlZm9yZSBhbnkgaGFyZHdhcmUgY2FuIGJlIGRpc2FibGVkLiBTaW1pbGFyLA0KPiBo
YXJkd2FyZQ0KPiBoYXMgdG8gYmUgcmUtZW5hYmxlZCBiZWZvcmUgdXNlcmxhbmQgY29kZSBjYW4g
cmVzdW1lLg0KPiBPdGhlcndpc2UgdGhlIGtlcm5lbCB3b3VsZCBjcmFzaCBhbGwgb3ZlciB0aGUg
cGxhY2UuIEluIG1hbnkgY2FzZXMsDQo+IGRpc2FibGluZyB0aGUgaGFyZHdhcmUgbWVhbnMgdGhh
dCB0cnlpbmcgdG8gYWNjZXNzIGhhcmR3YXJlIHJlZ2lzdGVycw0KPiB3aWxsIGNhdXNlIGFuIGFj
ZXNzIGZhdWx0Lg0KDQpZZXMsIHlvdSBhcmUgcmlnaHQuIEkgZGlkIGNoZWNrZWQgdGhlIHN1c3Bl
bmQgY29kZSBhbmQgYWxsIHVzZXJsYW5kDQp0YXNrcyBhbmQga3RocmVhZHMgYXJlIHN0b3BwZWQg
YmVmb3JlIHRoZSBzdXNwZW5kKCkgY2FsbGJhY2sgaXMgY2FsbGVkDQpmb3IgdGhlIEhXIGRldmlj
ZXMuDQoNCj4gWy4uLl0NCj4gDQo+ID4gPiA+ICsNCj4gPiA+ID4gK3N0YXRpYyBzdHJ1Y3QgYXR0
cmlidXRlICpsdGMyOTQ3X2F0dHJzW10gPSB7DQo+ID4gPiA+ICsJJnNlbnNvcl9kZXZfYXR0cl9p
bjBfZmF1bHQuZGV2X2F0dHIuYXR0ciwNCj4gPiA+ID4gKwkmc2Vuc29yX2Rldl9hdHRyX2luMV9m
YXVsdC5kZXZfYXR0ci5hdHRyLA0KPiA+ID4gPiArCSZzZW5zb3JfZGV2X2F0dHJfY3VycjFfZmF1
bHQuZGV2X2F0dHIuYXR0ciwNCj4gPiA+ID4gKwkmc2Vuc29yX2Rldl9hdHRyX3RlbXAxX2ZhdWx0
LmRldl9hdHRyLmF0dHIsDQo+ID4gPiA+ICsJJnNlbnNvcl9kZXZfYXR0cl9wb3dlcjFfaW5wdXQu
ZGV2X2F0dHIuYXR0ciwNCj4gPiA+ID4gKwkmc2Vuc29yX2Rldl9hdHRyX3Bvd2VyMV9tYXguZGV2
X2F0dHIuYXR0ciwNCj4gPiA+ID4gKwkmc2Vuc29yX2Rldl9hdHRyX3Bvd2VyMV9taW4uZGV2X2F0
dHIuYXR0ciwNCj4gPiA+ID4gKwkmc2Vuc29yX2Rldl9hdHRyX3Bvd2VyMV9pbnB1dF9oaWdoZXN0
LmRldl9hdHRyLmF0dHIsDQo+ID4gPiA+ICsJJnNlbnNvcl9kZXZfYXR0cl9wb3dlcjFfaW5wdXRf
bG93ZXN0LmRldl9hdHRyLmF0dHIsDQo+ID4gPiA+ICsJJnNlbnNvcl9kZXZfYXR0cl9wb3dlcjFf
ZmF1bHQuZGV2X2F0dHIuYXR0ciwNCj4gPiA+ID4gKwkmc2Vuc29yX2Rldl9hdHRyX2VuZXJneTFf
aW5wdXQuZGV2X2F0dHIuYXR0ciwNCj4gPiA+ID4gKwkmc2Vuc29yX2Rldl9hdHRyX2VuZXJneTFf
bWF4LmRldl9hdHRyLmF0dHIsDQo+ID4gPiA+ICsJJnNlbnNvcl9kZXZfYXR0cl9lbmVyZ3kxX21p
bi5kZXZfYXR0ci5hdHRyLA0KPiA+ID4gPiArCSZzZW5zb3JfZGV2X2F0dHJfZW5lcmd5MV9tYXhf
YWxhcm0uZGV2X2F0dHIuYXR0ciwNCj4gPiA+ID4gKwkmc2Vuc29yX2Rldl9hdHRyX2VuZXJneTFf
bWluX2FsYXJtLmRldl9hdHRyLmF0dHIsDQo+ID4gPiA+ICsJJnNlbnNvcl9kZXZfYXR0cl9lbmVy
Z3kyX2lucHV0LmRldl9hdHRyLmF0dHIsDQo+ID4gPiA+ICsJJnNlbnNvcl9kZXZfYXR0cl9lbmVy
Z3kyX21heC5kZXZfYXR0ci5hdHRyLA0KPiA+ID4gPiArCSZzZW5zb3JfZGV2X2F0dHJfZW5lcmd5
Ml9taW4uZGV2X2F0dHIuYXR0ciwNCj4gPiA+ID4gKwkmc2Vuc29yX2Rldl9hdHRyX2VuZXJneTJf
bWF4X2FsYXJtLmRldl9hdHRyLmF0dHIsDQo+ID4gPiA+ICsJJnNlbnNvcl9kZXZfYXR0cl9lbmVy
Z3kyX21pbl9hbGFybS5kZXZfYXR0ci5hdHRyLA0KPiA+ID4gPiArCSZzZW5zb3JfZGV2X2F0dHJf
ZW5lcmd5MV9vdmVyZmxvd19hbGFybS5kZXZfYXR0ci5hdHRyLA0KPiA+ID4gPiArCSZzZW5zb3Jf
ZGV2X2F0dHJfZW5lcmd5Ml9vdmVyZmxvd19hbGFybS5kZXZfYXR0ci5hdHRyLA0KPiA+IA0KPiA+
IFRoZXNlIG92ZXJmbG93IGF0dHJpYnV0ZXMgYXJlIGtpbmQgb2YgYW4gYWxhcm0gZm9yIHRoZSBl
bmVyZ3kgb25lcy4NCj4gPiBJdA0KPiA+IHRlbGxzIHRoYXQgdGhlIGVuZXJneSByZWdpc3RlcnMg
YXJlIGFib3V0IHRvIG92ZXJmbG93LiBJIGd1ZXNzIHRoYXQNCj4gPiBzb21lIGFwcGxpY2F0aW9u
IGNhbiBlYXNpbHkgZmluZCBvdXQgdGhlIG1heGltdW0gdmFsdWVzIHN1cHBvcnRlZA0KPiA+IG9u
DQo+ID4gdGhlc2UgcmVnaXN0ZXJzIGFuZCBpbXBsZW1lbnQgd2hhdGV2ZXIgbG9naWMgdGhleSB3
YW50IGluIHRoZSBhcHANCj4gPiBpdHNlbGYuIFNvLCBpZiB5b3UgcHJlZmVyIEkgY2FuIGp1c3Qg
ZHJvcCB0aGlzIG9uZXM/DQo+ID4gDQo+IEkgdW5kZXJzdGFuZCB0aGUgb3ZlcmZsb3cgdXNlIGNh
c2UuIEhvd2V2ZXIsIHRoZSBtZXJlIHByZXNlbmNlDQo+IG9mIG1pbi9tYXggYXR0cmlidXRlcyBm
b3IgZW5lcmd5IGF0dHJpYnV0ZXMgc3VnZ2VzdHMgdGhhdCB0aGlzDQo+IGlzIG5vdCB0aGUgbWlu
L21heCB1c2UgY2FzZSBmb3IgaHdtb24gYXR0cmlidXRlcy4gVGhlcmUgaXMgbm8NCj4gIm1pbmlt
dW0iDQo+IG9yICJtYXhpbXVtIiBlbmVyZ3kgZm9yIGFuIGFjY3VtdWxhdGluZyB2YWx1ZS4gU3Vj
aCBhdHRyaWJ1dGVzDQo+IG9ubHkgbWFrZSBzZW5zZSBpbiBhbiBhcHBsaWNhdGlvbiBhYmxlciB0
byBtZWFzdXJlIGF2YWlsYWJsZSANCj4gZW5lcmd5IChlZyBhIGJhdHRlcnkgY29udHJvbGxlciku
IEknbGwgaGF2ZSB0byByZWFkIHRoZSBjaGlwDQo+IHNwZWNpZmljYXRpb24gdG8gdW5kZXJzdGFu
ZCB0aGUgaW50ZW5kZWQgdXNlIGNhc2UuDQoNClNob3VsZCBJIGp1c3QgZHJvcCB0aGUgb3ZlcmZs
b3cgYXR0cmlidXRlcz8gSSB0aGluayB0aGUgcGFydCBjYW4gYmUNCnVzZWQgdG8gY2hlY2sgYmF0
dGVyeSBjaGFyZ2luZyBlZmZpY2llbmN5IGZvciBleGFtcGxlICh0aG91Z2ggSSBndWVzcw0Kd2Ug
d291bGQgbmVlZCB0byBhbHNvIHN1cHBvcnQgdGhlIENoYXJnZSByZWdpc3RlcidzKS4NCg0KPiA+
ID4gPiArCSZzZW5zb3JfZGV2X2F0dHJfZW5lcmd5MV9mYXVsdC5kZXZfYXR0ci5hdHRyLA0KPiA+
ID4gPiArCSZzZW5zb3JfZGV2X2F0dHJfZW5lcmd5Ml9mYXVsdC5kZXZfYXR0ci5hdHRyLA0KPiA+
ID4gDQo+ID4gPiBTb21lIG9mIHRob3NlIGFyZSBub24tc3RhbmRhcmQgYXR0cmlidXRlcy4gWW91
J2xsIGhhdmUNCj4gPiA+IHRvIGV4cGxhaW4gZWFjaCBpbiBkZXRhaWwsIGVzcGVjaWFsbHkgd2h5
IGl0IG1ha2VzIHNlbnNlDQo+ID4gPiB0byBwcm92aWRlIHN1Y2ggYXR0cmlidXRlcyB0byB0aGUg
dXNlciBhbmQgd2h5IHlvdSBjYW4ndA0KPiA+ID4gdXNlIHN0YW5kYXJkIGF0dHJpYnV0ZXMgaW5z
dGVhZC4gQWxzbywgZm9yIHRoZSBfZmF1bHQNCj4gPiA+IGF0dHJpYnV0ZXMsIEkgZG9uJ3QgZW50
aXJlbHkgc2VlIHRoZSBwb2ludC4gSWYgdGhlIGZhdWx0IGJpdA0KPiA+ID4gaXMgc2V0LCBBREMg
cmVhZGluZ3MgYXJlIG5vdCB2YWxpZCBiZWNhdXNlIHN1cHBseSB2b2x0YWdlDQo+ID4gPiBpcyBs
b3cuIFRoaXMgbWVhbnMgdGhhdCBBREMgcmVnaXN0ZXIgcmVhZHMgd2lsbCBiZSBpbnZhbGlkLg0K
PiA+ID4gV2hhdCBpcyB0aGUgcG9pbnQgb2YgaGF2aW5nIGEgbm9uLXN0YW5kYXJkIGF0dHJpYnV0
ZSAtIHdoaWNoDQo+ID4gPiBsaWtlbHkgd2lsbCBiZSBpZ25vcmVkIC0gaW5zdGVhZCBvZiByZXR1
cm5pbmcgYW4gZXJyb3Igd2hlbg0KPiA+ID4gYW4gYXR0ZW1wdCBpcyBtYWRlIHRvIHJlYWQgYW4g
QURDIHZhbHVlID8NCj4gPiANCj4gPiBJIHdhcyBhbHNvIG5vdCBzdXJlIG9uIHRoaXMgKl9mYXVs
dCBhdHRyaWJ1dGVzLiBUaGV5IGFyZSB0aGVyZSB0bw0KPiA+IHRlbGwNCj4gPiB0aGF0IHRoZSBy
ZWFkaW5ncyBhcmUgaW52YWxpZC4gTm93IHRoYXQgSSB0aGluayBhYm91dCBpdCwgSSdtIG5vdA0K
PiA+IHN1cmUNCj4gPiBpZiBpdCBldmVuIG1ha2VzIHNlbnNlIHRvIHJldHVybiBlcnJvciBpZiB0
aGlzIGJpdCBpcyBzZXQuIFRoZSBwYXJ0DQo+ID4gaXMNCj4gPiBpbiBjb250aW51b3VzIG1vZGUg
c28sIGl0IG1pZ2h0IGhhcHBlbiB0aGF0IHdlIGhhdmUgdGhlIGZhdWx0IGJpdA0KPiA+IHNldA0K
PiA+IGZvciBhIHNob3J0IHRpbWUgYnV0IGFmdGVyd2FyZHMgdGhpbmdzIGdvIG5vcm1hbCBhbmQg
dGhlIGJpdCB3aWxsDQo+ID4gc3RpbGwNCj4gPiBiZSBzZXQgdW50aWwgd2UgcmVhZCBpdC4gU28g
bXkgcG9pbnQgaXMsIHdlIG1pZ2h0IGJlIHJldHVybmluZw0KPiA+IGVycm9yDQo+ID4gZm9yIGEg
Y29udmVyc2lvbiB0aGF0IGhhcHBlbmVkIHdheSBiZWZvcmUgb3VyIGN1cnJlbnQgcmVhZGluZy4g
QW55DQo+ID4gc3VnZ2VzdGlvbiBoZXJlPyBXb3VsZCB5b3UgYmUgZmluZSBpZiBJIGp1c3QgZHJv
cCB0aGlzIGF0dHJpYnV0ZXM/DQo+ID4gICANCj4gDQo+IEl0IHNvdW5kcyBsaWtlICJmYXVsdCIg
bWVhbnMgc29tZXRoaW5nIGxpa2UgIm9uZSBvZiB0aGUgcGFzdCByZWFkaW5ncw0KPiB3YXMgd3Jv
bmcsIGJ1dCBJIGRvbid0IGtub3cgd2hpY2ggb25lIGFuZCBJIGRvbid0IGtub3cgaWYgdGhlIHdy
b25nDQo+IHZhbHVlIHdhcyBldmVyIHJlYWQgYnkgdXNlciBzcGFjZSIuIFNvcnJ5LCBJIGZhaWwg
dG8gc2VlIHdoYXQgdmFsdWUNCj4gdGhvc2UgYXR0cmlidXRlcyBhcmUgc3VwcG9zZWQgdG8gaGF2
ZSBmb3IgdGhlIHVzZXIuIEF0IGJlc3QgaXQgY291bGQNCj4gbWVhbiAicGxlYXNlIHJlLXJlYWQg
dGhlIGFzc29jaWF0ZWQgYXR0cnJpYnV0ZSIsIGJ1dCB0aGF0IGNvdWxkIGFzDQo+IHdlbGwNCj4g
YmUgYWNjb21wbGlzaGVkIHdpdGhvdXQgdXNlcnNwYWNlIGFjdGlvbiBpZiBpdCBpcyByZWFsbHkg
bmVlZGVkLg0KPiBBbHNvLCBwZXIgZGF0YXNoZWV0LCBpdCBsb29rcyBsaWtlIHRoZSBmYXVsdCBi
aXQgaXMgc2V0IG9mIHRoZSBjaGlwDQo+IHZvbHRhZ2UgaXMgdG9vIGxvdy4gSWYgdGhhdCBoYXBw
ZW5zLCB0aGUgc3lzdGVtIGhhcyBhIHNldmVyZSBwcm9ibGVtDQo+IHdoaWNoIGNhbiBub3QgYmUg
cmVzb2x2ZWQgd2l0aCBhbiBhdHRyaWJ1dGUgdmlzaWJsZSB0byB1c2Vyc3BhY2UuDQoNCkkgd2ls
bCBkcm9wIHRoZSBmYXVsdCBhdHRyaWJ1dGVzLg0KDQo+ID4gPiBPdGhlcnMsIGxpa2UgZW5lcmd5
MV9pbnB1dCwgb3IgbW9zdCBvZiB0aGUgcG93ZXIgYXR0cmlidXRlcywNCj4gPiA+IGFyZSBzdGFu
ZGFyZCBhdHRyaWJ1dGVzLiBQbGVhc2UgZXhwbGFpbiB0aGUgcmVhc29uaW5nIGZvcg0KPiA+ID4g
bm90IHVzaW5nIHRoZSBzdGFuZGFyZCBBUEkgZm9yIHRob3NlLiANCj4gPiANCj4gPiBUaGlzIG9u
ZXMgd2VyZSBiZWNhdXNlIHdlIG5lZWQgNjRiaXQgdmFyaWFibGVzLiBGb3IgZW5lcmd5LCB0aGUN
Cj4gPiBwYXJ0DQo+ID4gYWxzbyBzdXBwb3J0cyB0aGUgYWxhcm1zLCBtYXggYW5kIG1pbiBhdHRy
aWJ1dGVzIHNvIEkgaW5jbHVkZWQNCj4gPiB0aGVtLg0KPiA+ICANCj4gSSBjYW4gdG8gc29tZSBk
ZWdyZWUgdGhlIGxvZ2ljIGZvciBlbmVyZ3kgYXR0cmlidXRlcywgYnV0IGRvIHlvdQ0KPiByZWFs
bHkNCj4gaGF2ZSBhbiBhcHBsaWNhdGlvbiB3aGVyZSB0aGUgY2hpcCBpcyB1c2VkIG9uIGEgMzIt
Yml0IHN5c3RlbSBhbmQNCj4gbW9uaXRvcnMgcG93ZXIgbGFyZ2VyIHRoYW4gMmtXID8NCg0KSG1t
LCBJIGxvb2tlZCBhZ2FpbiBhdCB0aGUgY2hpcCBzcGVjaWZpY2F0aW9uIGFuZCB1bmxlc3MgSSdt
IG1pc3NpbmcNCnNvbWV0aGluZyBvYnZpb3VzIHRoZSBwYXJ0IGNhbiBvbmx5IG1lYXN1cmUgKy8t
IDMwQSBhbmQgMC0xNVYgZ2l2aW5nIHVzDQorLy0gNDUwVyB3aGljaCBkZWZpbml0ZWx5IGZpdHMg
aW4gYSBsb25nIHZhcmlhYmxlLiBUaGUgb25seSB0aGluZyB0aGF0DQp3aWxsIGJlIHRydW5jYXRl
ZCBpcyB0aGUgbWluL21heCB2YWx1ZXMuIFRoZSBwYXJ0LCBieSBkZWZhdWx0LCBoYXMgdGhpcw0K
dmFsdWUgdG8gMHg3ZmZmIGFuZCAweDgwMDAgd2hpY2ggdGltZXMgMjAwMDAwdVcgKHBhcnQgc2Nh
bGUpIHdpbGwgYmUNCnRydW5jYXRlZC4gTm93LCB3ZSBjYW4gYXJndWUgdGhhdCB0aGlzIG1heC9t
aW4gdmFsdWVzIGFyZSBub3QgcmVhbCBhbmQNCnRoZSB1c2VyIGlzIGV4cGVjdGVkIHRvIHdyaXRl
IHRoaXMgYXR0cmlidXRlcyB3aXRoIHNvbWUgbWVhbmluZ2Z1bA0KdmFsdWVzPyBIb3cgZG8geW91
IHN1Z2dlc3QgdG8gcHJvY2VlZD8gU2hvdWxkIEkganVzdCB1c2Ugc3RhbmRhcmQNCmF0dHJpYnV0
ZXMgZm9yIHBvd2VyPw0KIA0KPiBJZiB5b3UgZG8gaGF2ZSBzdWNoIGEgdXNlIGNhc2UsIHdlJ2xs
IG5lZWQgdG8gZW5oYW5jZSB0aGUgQVBJDQo+IHRvIHJlZmxlY3QgaXQuDQo+IA0KPiBUaGFua3Ms
DQo+IEd1ZW50ZXINCg0K
