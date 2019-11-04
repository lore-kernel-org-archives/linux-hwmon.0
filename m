Return-Path: <SRS0=5TON=Y4=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 452CDCA9EB5
	for <linux-hwmon@archiver.kernel.org>; Mon,  4 Nov 2019 14:28:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 02952217F4
	for <linux-hwmon@archiver.kernel.org>; Mon,  4 Nov 2019 14:28:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=distech-controls.com header.i=@distech-controls.com header.b="wTVzSbN0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728510AbfKDO2k (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 4 Nov 2019 09:28:40 -0500
Received: from mx0a-002ab301.pphosted.com ([148.163.150.161]:14290 "EHLO
        mx0a-002ab301.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728321AbfKDO2k (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 4 Nov 2019 09:28:40 -0500
Received: from pps.filterd (m0118790.ppops.net [127.0.0.1])
        by mx0a-002ab301.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id xA4ER1aa005062;
        Mon, 4 Nov 2019 09:28:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=distech-controls.com; h=from : to :
 cc : subject : date : message-id : references : in-reply-to : content-type
 : content-transfer-encoding : mime-version; s=pps-02182019;
 bh=OPoP89siBJUZxa5hlY3iAfpS4zL+p+4kbgA5YaM6JDk=;
 b=wTVzSbN0wMX4dx5f02zSrRVFzGr63o3FqOJEvlIxg2BV0FWx2fLQTumq6aylmy6gWUJm
 /wnYmPGSfpoboRHCE0/slFsJ0RaVkUmj1GO7ZNKcxJi2riKuSju3PPSET3RAU8kUJmbB
 6dgTvzyJuv1E4hLjqZDaMEh1NKZxUW5EEUhbBpESAvzyHaAq8fZmj2waKQLqZFJiio3r
 UO0gr5dBxj8wxnXax1UVvog0zRWahNN/59JdDfF+HX6M8QhkBA1Sso1n8xR29x8Q/+kE
 uUCMqZSuaYp2Fc7sr1VVJQ6p4CgyhjP0uOEiHfAJN+z2eS2ccmWZ/vM38rWX7Gy8bgl5 6A== 
Received: from nam02-cy1-obe.outbound.protection.outlook.com (mail-cys01nam02lp2058.outbound.protection.outlook.com [104.47.37.58])
        by mx0a-002ab301.pphosted.com with ESMTP id 2w1595hsbv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 04 Nov 2019 09:28:12 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cVtK044HFLvt8x+UNm30v+SXQ1KrvK9Yfn9NAAE2QqDi1NfrtV8NO09YCvD5+eZCvcwo8u2JZcc+zucTQvMK9YKmfdqFEGVfMkgZAipuUSLkbkbq1XYQQrP6BTBZjdJ8erqRCJXZMyMfK8riQnBQDIlOOwDCVfmogNQOvSKlfb7cwUrcfhwZKwuFWA0iO3D+jMDPB1VcMUepHmSt19rGJRA4CKllcLaXr6PxEkaIRGTn/MkiQqdlOJ+MHp6pqKRIVLq1yU8EtuNp76LVmrbpsIKT0IKKXE70Hr3YwvLAAOJqHXvpWHQRvr5HlnvWh2rxtXjpon8S3HZ0IcpdrdyZ3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OPoP89siBJUZxa5hlY3iAfpS4zL+p+4kbgA5YaM6JDk=;
 b=k7p/AkYgi1Y7Hj3l0EY3GaTB7la6KKPTRun5q7xg0zMvSooR6iVUOai9XEO8IKke+P1dvLQwTxVBWOK8wI0HRm19GYeETxqrGsoZwREjIF9fl2pX7YoucdvCXWDyeKGmsL/LqFND2fEVQrxA+zh2aJjqx06q86rJKfmeObuSGQVcEVoi3Jn2Po1HndhiuM2QjvXypUTVN6hh0RjpGWLtQjx3OKak9H9NkHf2PMrI4M4Cm1SIuO0Uq2+ewApWzuZeFb2HDp86L0oSk0PLzZUDjNSZvxOhfASJLXTWsmOhkN17ykZZ/S1IF+XV0maswc/PeNuRLFHeRCXh4+bfRCcsyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=distech-controls.com; dmarc=pass action=none
 header.from=distech-controls.com; dkim=pass header.d=distech-controls.com;
 arc=none
Received: from BL0PR01MB4835.prod.exchangelabs.com (20.177.147.211) by
 BL0PR01MB4657.prod.exchangelabs.com (20.177.204.96) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2408.24; Mon, 4 Nov 2019 14:28:08 +0000
Received: from BL0PR01MB4835.prod.exchangelabs.com
 ([fe80::b00e:eb7:d585:5086]) by BL0PR01MB4835.prod.exchangelabs.com
 ([fe80::b00e:eb7:d585:5086%6]) with mapi id 15.20.2408.024; Mon, 4 Nov 2019
 14:28:07 +0000
From:   "Tremblay, Eric" <etremblay@distech-controls.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
CC:     Jean Delvare <jdelvare@suse.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        Jonathan Corbet <corbet@lwn.net>
Subject: RE: [PATCH v6 1/2] hwmon: Add driver for Texas Instruments TMP512/513
 sensor chips
Thread-Topic: [PATCH v6 1/2] hwmon: Add driver for Texas Instruments
 TMP512/513 sensor chips
Thread-Index: AdWOacI34kgY6s2GTamVc6URvCa5KADKKT8AAGJPuJA=
Date:   Mon, 4 Nov 2019 14:28:07 +0000
Message-ID: <BL0PR01MB483552B4B0F8B65EA84A09D1957F0@BL0PR01MB4835.prod.exchangelabs.com>
References: <DM6PR01MB4844A7A2E7DCA9168D44F34195610@DM6PR01MB4844.prod.exchangelabs.com>
 <32a41dac-9648-0d7f-afd9-79af0c3eed65@roeck-us.net>
In-Reply-To: <32a41dac-9648-0d7f-afd9-79af0c3eed65@roeck-us.net>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mib-plugin: true
x-originating-ip: [207.253.3.19]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: aba54337-04bb-459a-fd99-08d761333651
x-ms-traffictypediagnostic: BL0PR01MB4657:
x-ms-exchange-purlcount: 3
x-microsoft-antispam-prvs: <BL0PR01MB46571E2ACE64D079033EB0C1957F0@BL0PR01MB4657.prod.exchangelabs.com>
x-ms-oob-tlc-oobclassifiers: OLM:331;
x-forefront-prvs: 0211965D06
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(376002)(396003)(39850400004)(366004)(346002)(136003)(199004)(189003)(5660300002)(6506007)(81166006)(86362001)(81156014)(7696005)(26005)(53546011)(102836004)(446003)(9686003)(99286004)(66946007)(66556008)(66476007)(64756008)(52536014)(6306002)(66446008)(76116006)(7736002)(11346002)(305945005)(55016002)(486006)(476003)(76176011)(2906002)(8936002)(316002)(71190400001)(54906003)(14444005)(71200400001)(256004)(6246003)(186003)(2201001)(4326008)(74316002)(966005)(14454004)(8676002)(25786009)(3846002)(2501003)(478600001)(6116002)(66066001)(33656002)(6436002)(229853002)(110136005);DIR:OUT;SFP:1101;SCL:1;SRVR:BL0PR01MB4657;H:BL0PR01MB4835.prod.exchangelabs.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: distech-controls.com does not
 designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DSdxV3P6Lgun/ONg+xx/tB0BQbmdQ9hzqsFcnFySTc/325p3p9/FCTB26e1LfwR3V9KH3VF/ncjee9eCjLAqJG/cY3QhnZ5N7zyA/Ue8KlIHjUNwNetICuKFfewRz6dLZTfl/zqV6FncHeCy9ljgWTddaNQCc3Q+akUrEqPrABAnbqAiF7G1LZVTMlMjgRn3Z1+PUnWYg9ChqgKR9wbQNCS+ihOasRrQSqzusHXdTMfigYRQ4XMRSKN/3hkdEMxJSOfq1J/UhrjqZLhsgQNBf6G/TyT58NYwvcjlc7Wp/vcsBb9TXll50YYbBdEMI/yPT84cCyuLDNzE9x9eD+YUTyW8hXrpeeVTCi7Sif7D7prvufGLBWib66jJMZullNyaub3ILz9uL1jeD2dF4HwTkIBmvpWIM/xxeyFcO4tftaUmNt6kTSQVogOk7aiVRQ0Ygy6TT4jgPpxj7k21RWDQ/IDx+NLtM978x0vcedj08qs=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: distech-controls.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aba54337-04bb-459a-fd99-08d761333651
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2019 14:28:07.4986
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: caadbe96-024e-4f67-82ec-fb28ff53d16d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ce6LnPjeVDk+aGstMyMP4uPI4aEtfDjmPIZ/1a/mCjc8ercy18wkU9yoaaJuQbLGvMe1xzlZEXPRaRiOl/3QLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR01MB4657
X-Proofpoint-Processed: True
X-Proofpoint-Spam-Details: rule=outbound_spam_notspam policy=outbound_spam score=0 spamscore=0
 phishscore=0 clxscore=1015 adultscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 mlxlogscore=999 priorityscore=1501 suspectscore=0
 mlxscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1908290000 definitions=main-1911040144
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

PiBPbiAxMC8yOS8xOSA4OjA0IEFNLCBUcmVtYmxheSwgRXJpYyB3cm90ZToNCj4gPiBkdC1iaW5k
aW5nczogaHdtb246IEFkZCBUTVA1MTIvNTEzDQo+ID4NCj4gPiBBZGQgZHQtYmluZGluZyBmb3Ig
VE1QNTEyLzUxMyBzZW5zb3IgY2hpcHMNCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEVyaWMgVHJl
bWJsYXkgPGV0cmVtYmxheUBkaXN0ZWNoLWNvbnRyb2xzLmNvbT4NCj4gSSBkbyBnZXQgdGhlIGZv
bGxvd2luZyB3YXJuaW5nczoNCj4gDQo+IERvY3VtZW50YXRpb24vaHdtb24vdG1wNTEzLnJzdDoy
OiBXQVJOSU5HOiBFeHBsaWNpdCBtYXJrdXAgZW5kcyB3aXRob3V0IGEgYmxhbmsgbGluZTsgdW5l
eHBlY3RlZCB1bmluZGVudC4NCj4gRG9jdW1lbnRhdGlvbi9od21vbi90bXA1MTMucnN0OiBXQVJO
SU5HOiBkb2N1bWVudCBpc24ndCBpbmNsdWRlZCBpbiBhbnkgdG9jdHJlZQ0KPiANCj4gVGhlIC5y
c3QgZmlsZSBuZWVkcyB0byBiZSBhZGRlZCB0byBEb2N1bWVudGF0aW9uL2h3bW9uL2luZGV4LnJz
dC4gTm8gaWRlYSB3aGF0IHRoZSBmaXJzdCBwcm9ibGVtIGlzLg0KPiANCj4gR3VlbnRlcg0KDQpU
aGUgZmlyc3Qgd2FybmluZyB3YXMgYSBtaXNzaW5nIGVtcHR5IGxpbmUgYWZ0ZXIgdGhlIGxpY2Vu
c2UtSWRlbnRpZmllci4NCg0KSSdsbCB3YWl0IGZvciBiaW5kaW5ncyByZXZpZXcgdGhlbiByZXN1
Ym1pdCB3aXRoIHRoZSBkb2N1bWVudGF0aW9ucyBmaXhlcy4NCg0KVGhhbmtzDQogDQo+IA0KPiA+
IC0tLQ0KPiA+ICAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvaHdtb24vdGksdG1wNTEzLnlhbWwg
IHwgODggKysrKysrKysrKysrKysrKysrKw0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDg4IGluc2Vy
dGlvbnMoKykNCj4gPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NA0KPiA+IERvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9od21vbi90aSx0bXA1MTMueWFtbA0KPiA+DQo+ID4gZGlmZiAtLWdp
dCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9od21vbi90aSx0bXA1MTMueWFt
bA0KPiA+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2h3bW9uL3RpLHRtcDUx
My55YW1sDQo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gPiBpbmRleCAwMDAwMDAwMDAwMDAu
LmU1ZjNjNzJmZjU0OA0KPiA+IC0tLSAvZGV2L251bGwNCj4gPiArKysgYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvaHdtb24vdGksdG1wNTEzLnlhbWwNCj4gPiBAQCAtMCwwICsx
LDg4IEBADQo+ID4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wIE9SIEJTRC0y
LUNsYXVzZSkgIyBDb3B5cmlnaHQgMjAxOA0KPiA+ICtMaW5hcm8gTHRkLg0KPiA+ICslWUFNTCAx
LjINCj4gPiArLS0tDQo+ID4gKw0KPiA+ICskaWQ6DQo+ID4gK2h0dHBzOi8vdXJsZGVmZW5zZS5w
cm9vZnBvaW50LmNvbS92Mi91cmw/dT1odHRwLTNBX19kZXZpY2V0cmVlLm9yZ19zYw0KPiA+ICto
ZW1hc19od21vbl90aS0yQ3RtcDUxMy55YW1sLTIzJmQ9RHdJQ2FRJmM9dHZ2SHgzdUMwWGR0Z0ct
SW1QRGpmTTBRbmENCj4gPiAra0lzbW1HY3dlalFEVnhELWcmcj15MzR6TGw5X0F2Qnk1TlNydnNr
RzZTRmJpS29Dekk5OVdXMnhoS2xzVlY0Jm09Z0hSDQo+ID4gK09rX0RiZ3NfT2VVTjRIbzVjenZf
dmZ4YnhUNW9KYm9LY2ZROHBiOWMmcz1Idk00OTdZX1RmaVlzcmJnRUp3VUE3YWtwVA0KPiA+ICs4
QjFpdzU3NHM4VTA3ZzMzVSZlPQ0KPiA+ICskc2NoZW1hOg0KPiA+ICtodHRwczovL3VybGRlZmVu
c2UucHJvb2Zwb2ludC5jb20vdjIvdXJsP3U9aHR0cC0zQV9fZGV2aWNldHJlZS5vcmdfbWUNCj4g
PiArdGEtMkRzY2hlbWFzX2NvcmUueWFtbC0yMyZkPUR3SUNhUSZjPXR2dkh4M3VDMFhkdGdHLUlt
UERqZk0wUW5ha0lzbW1HDQo+ID4gK2N3ZWpRRFZ4RC1nJnI9eTM0ekxsOV9BdkJ5NU5TcnZza0c2
U0ZiaUtvQ3pJOTlXVzJ4aEtsc1ZWNCZtPWdIUk9rX0RiZw0KPiA+ICtzX09lVU40SG81Y3p2X3Zm
eGJ4VDVvSmJvS2NmUThwYjljJnM9eE5fcnNqQUdHdjI3MjZTN3QxOTJicV9VU2xsVGNKNm4NCj4g
PiArODV2U2xERldqVjgmZT0NCj4gPiArDQo+ID4gK3RpdGxlOiBUTVA1MTMvNTEyIHN5c3RlbSBt
b25pdG9yIHNlbnNvcg0KPiA+ICsNCj4gPiArbWFpbnRhaW5lcnM6DQo+ID4gKyAgLSBFcmljIFRy
ZW1ibGF5IDxldHJlbWJsYXlAZGlzdGVjaC1jb250cm9scy5jb20+DQo+ID4gKw0KPiA+ICtkZXNj
cmlwdGlvbjogfA0KPiA+ICsgIFRoZSBUTVA1MTIgKGR1YWwtY2hhbm5lbCkgYW5kIFRNUDUxMyAo
dHJpcGxlLWNoYW5uZWwpIGFyZSBzeXN0ZW0NCj4gPiArbW9uaXRvcnMgdGhhdCBpbmNsdWRlDQo+
ID4gKyAgcmVtb3RlIHNlbnNvcnMsIGEgbG9jYWwgdGVtcGVyYXR1cmUgc2Vuc29yLCBhbmQgYSBo
aWdoLXNpZGUgY3VycmVudCBzaHVudCBtb25pdG9yLg0KPiA+ICsgIFRoZXNlIHN5c3RlbSBtb25p
dG9ycyBoYXZlIHRoZSBjYXBhYmlsaXR5IG9mIG1lYXN1cmluZyByZW1vdGUNCj4gPiArdGVtcGVy
YXR1cmVzLA0KPiA+ICsgIG9uLWNoaXAgdGVtcGVyYXR1cmVzLCBhbmQgc3lzdGVtIHZvbHRhZ2Uv
cG93ZXIvY3VycmVudCBjb25zdW1wdGlvbi4NCj4gPiArDQo+ID4gKyAgRGF0YXNoZWV0czoNCj4g
PiArDQo+ID4gKyBodHRwczovL3VybGRlZmVuc2UucHJvb2Zwb2ludC5jb20vdjIvdXJsP3U9aHR0
cC0zQV9fd3d3LnRpLmNvbV9saXRfZw0KPiA+ICsgcG5fdG1wNTEzJmQ9RHdJQ2FRJmM9dHZ2SHgz
dUMwWGR0Z0ctSW1QRGpmTTBRbmFrSXNtbUdjd2VqUURWeEQtZyZyPXkNCj4gPiArIDM0ekxsOV9B
dkJ5NU5TcnZza0c2U0ZiaUtvQ3pJOTlXVzJ4aEtsc1ZWNCZtPWdIUk9rX0RiZ3NfT2VVTjRIbzVj
enZfDQo+ID4gKyB2ZnhieFQ1b0pib0tjZlE4cGI5YyZzPXJKNnpyNkJwcmx3ZXdqS1V6VnI2UGVF
cVA2Y0NzZHhURl9Tek5PbXdaaUEmZQ0KPiA+ICsgPQ0KPiA+ICsgaHR0cHM6Ly91cmxkZWZlbnNl
LnByb29mcG9pbnQuY29tL3YyL3VybD91PWh0dHAtM0FfX3d3dy50aS5jb21fbGl0X2cNCj4gPiAr
IHBuX3RtcDUxMiZkPUR3SUNhUSZjPXR2dkh4M3VDMFhkdGdHLUltUERqZk0wUW5ha0lzbW1HY3dl
alFEVnhELWcmcj15DQo+ID4gKyAzNHpMbDlfQXZCeTVOU3J2c2tHNlNGYmlLb0N6STk5V1cyeGhL
bHNWVjQmbT1nSFJPa19EYmdzX09lVU40SG81Y3p2Xw0KPiA+ICsgdmZ4YnhUNW9KYm9LY2ZROHBi
OWMmcz1OQ0sxeWZIaXN5ejdkTEV5bG04Y09iVUlTZEltZ0M1T0NZMXdWOVRKZHNBJmUNCj4gPiAr
ID0NCj4gPiArDQo+ID4gKw0KPiA+ICtwcm9wZXJ0aWVzOg0KPiA+ICsgIGNvbXBhdGlibGU6DQo+
ID4gKyAgICBlbnVtOg0KPiA+ICsgICAgICAtIHRpLHRtcDUxMg0KPiA+ICsgICAgICAtIHRpLHRt
cDUxMw0KPiA+ICsNCj4gPiArICByZWc6DQo+ID4gKyAgICBtYXhJdGVtczogMQ0KPiA+ICsNCj4g
PiArICBzaHVudC1yZXNpc3Rvci1taWNyby1vaG1zOg0KPiA+ICsgICAgZGVzY3JpcHRpb246IHwN
Cj4gPiArICAgICAgSWYgMCwgdGhlIGNhbGlicmF0aW9uIHByb2Nlc3Mgd2lsbCBiZSBza2lwZWQg
YW5kIHRoZSBjdXJyZW50IGFuZCBwb3dlcg0KPiA+ICsgICAgICBtZWFzdXJlbWVudCBlbmdpbmUg
d2lsbCBub3Qgd29yay4gVGVtcGVyYXR1cmUgYW5kIHZvbHRhZ2UgbWVhc3VyZW1lbnQNCj4gPiAr
ICAgICAgd2lsbCBjb250aW51ZSB0byB3b3JrLg0KPiA+ICsgICAgICBUaGUgc2h1bnQgdmFsdWUg
YWxzbyBuZWVkIHRvIHJlc3BlY3QgOiByc2h1bnQgPD0gcGdhLWdhaW4gKiA0MCAqIDEwMDAgKiAx
MDAwLg0KPiA+ICsgICAgICBJZiBub3QsIGl0J3Mgbm90IHBvc3NpYmxlIHRvIGNvbXB1dGUgYSB2
YWxpZCBjYWxpYnJhdGlvbiB2YWx1ZS4NCj4gPiArICAgIGRlZmF1bHQ6IDEwMDANCj4gPiArDQo+
ID4gKyAgdGkscGdhLWdhaW46DQo+ID4gKyAgICBkZXNjcmlwdGlvbjogfA0KPiA+ICsgICAgICBU
aGUgZ2FpbiB2YWx1ZSBmb3IgdGhlIFBHQSBmdW5jdGlvbi4gVGhpcyBpcyA4LCA0LCAyIG9yIDEu
DQo+ID4gKyAgICAgIFRoZSBQR0EgZ2FpbiBhZmZlY3QgdGhlIHNodW50IHZvbHRhZ2UgcmFuZ2Uu
DQo+ID4gKyAgICAgIFRoZSByYW5nZSB3aWxsIGJlIGVxdWFsIHRvOiBwZ2EtZ2FpbiAqIDQwbVYN
Cj4gPiArICAgIGFsbE9mOg0KPiA+ICsgICAgICAtICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwj
L2RlZmluaXRpb25zL3VpbnQzMg0KPiA+ICsgICAgZW51bTogWzEsIDIsIDQsIDhdDQo+ID4gKyAg
ICBkZWZhdWx0OiA4DQo+ID4gKw0KPiA+ICsgIHRpLGJ1cy12b2x0YWdlLXJhbmdlLXZvbHQ6DQo+
ID4gKyAgICBkZXNjcmlwdGlvbjogfA0KPiA+ICsgICAgICBUaGlzIGlzIHRoZSBvcGVyYXRpbmcg
cmFuZ2Ugb2YgdGhlIGJ1cyB2b2x0YWdlDQo+ID4gKyAgICBhbGxPZjoNCj4gPiArICAgICAgLSAk
cmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy91aW50MzINCj4gPiArICAgIGVu
dW06IFsxNiwgMzJdDQo+ID4gKyAgICBkZWZhdWx0OiAzMg0KPiA+ICsNCj4gPiArICB0aSxuZmFj
dG9yOg0KPiA+ICsgICAgZGVzY3JpcHRpb246IHwNCj4gPiArICAgICAgQXJyYXkgb2YgdGhyZWUo
VE1QNTEzKSBvciB0d28oVE1QNTEyKSBuLUZhY3RvciB2YWx1ZSBmb3IgZWFjaCByZW1vdGUNCj4g
PiArICAgICAgdGVtcGVyYXR1cmUgY2hhbm5lbC4NCj4gPiArICAgICAgU2VlIGRhdGFzaGVldCBU
YWJsZSAxMSBmb3Igbi1GYWN0b3IgcmFuZ2UgbGlzdCBhbmQgdmFsdWUgaW50ZXJwcmV0YXRpb24u
DQo+ID4gKyAgICBhbGxPZjoNCj4gPiArICAgICAgLSAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1s
I2RlZmluaXRpb25zL3VpbnQ4LWFycmF5DQo+ID4gKyAgICAgIC0gbWluSXRlbXM6IDINCj4gPiAr
ICAgICAgICBtYXhJdGVtczogMw0KPiA+ICsgICAgICAgIGl0ZW1zOg0KPiA+ICsgICAgICAgICAg
ZGVmYXVsdDogMA0KPiA+ICsNCj4gPiArcmVxdWlyZWQ6DQo+ID4gKyAgLSBjb21wYXRpYmxlDQo+
ID4gKyAgLSByZWcNCj4gPiArDQo+ID4gK2V4YW1wbGVzOg0KPiA+ICsgIC0gfA0KPiA+ICsgICAg
aTJjIHsNCj4gPiArICAgICAgICB0bXA1MTNANWMgew0KPiA+ICsgICAgICAgICAgICBjb21wYXRp
YmxlID0gInRpLHRtcDUxMyI7DQo+ID4gKyAgICAgICAgICAgIHJlZyA9IDwweDVDPjsNCj4gPiAr
ICAgICAgICAgICAgc2h1bnQtcmVzaXN0b3ItbWljcm8tb2htcyA9IDwzMzAwMDA+Ow0KPiA+ICsg
ICAgICAgICAgICB0aSxidXMtdm9sdGFnZS1yYW5nZS12b2x0cyA9IDwzMj47DQo+ID4gKyAgICAg
ICAgICAgIHRpLHBnYS1nYWluID0gPDg+Ow0KPiA+ICsgICAgICAgICAgICB0aSxuZmFjdG9yID0g
WzAxIEYzIDAwXTsNCj4gPiArICAgICAgICB9Ow0KPiA+ICsgICAgfTsNCj4gPg0KDQo=
