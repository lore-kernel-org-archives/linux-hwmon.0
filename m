Return-Path: <SRS0=/pPu=YP=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A86CCA9EA0
	for <linux-hwmon@archiver.kernel.org>; Tue, 22 Oct 2019 13:33:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0D52E21783
	for <linux-hwmon@archiver.kernel.org>; Tue, 22 Oct 2019 13:33:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=distech-controls.com header.i=@distech-controls.com header.b="IU3sQgf0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732065AbfJVNdt (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 22 Oct 2019 09:33:49 -0400
Received: from mx0b-002ab301.pphosted.com ([148.163.154.99]:36856 "EHLO
        mx0b-002ab301.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731981AbfJVNdt (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 22 Oct 2019 09:33:49 -0400
Received: from pps.filterd (m0118796.ppops.net [127.0.0.1])
        by mx0b-002ab301.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id x9MDU3wY025204;
        Tue, 22 Oct 2019 09:33:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=distech-controls.com; h=from : to :
 cc : subject : date : message-id : content-type :
 content-transfer-encoding : mime-version; s=pps-02182019;
 bh=OHfWqRNrM4KLke+JV4p0Bl6H4azXA0yTUEHl7an7BN0=;
 b=IU3sQgf0ZDRjhjwQHY61aIn9HHfiBPVeoJFMPnHwUYTxuShr2n0P9BhcUFOYToDni6gO
 IrrRzZSyrSPxlw9hdQQOpUq9EWCgnb4IHNH1tESwJPToRAb6+cmfdBLKyEMwH//vu0iF
 jr42t3D48Y3EArxoIvnMQgT+K3LT+3JXJltGTHBL+BZ1pzrWhbVafmUmnhvJ5oN305WX
 DA5hVEIMKp5uA94+vRuqVJ5Dvysr84iCyXMAarGBdzkyrKXpW+4u9ogwakFp5ZGrCWHY
 GxYk9k8kW9xN5aGZDlDGhxNxZiSC1cdLn1W3EmZNkkHheVTdn3GZVKYYyJq3aqevDIQF QQ== 
Received: from nam03-co1-obe.outbound.protection.outlook.com (mail-co1nam03lp2050.outbound.protection.outlook.com [104.47.40.50])
        by mx0b-002ab301.pphosted.com with ESMTP id 2vsk6prrgx-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
        Tue, 22 Oct 2019 09:33:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J922cr9DGykLm5LdLeg3EwGeNzdn0AjZsjEFiwZtpo6L7bJ4F9KBwPySjJIorgImJczhzqj5eFVFPoPHNDq0zV33JlQYGrp9JZpE+71fuFVSEFtzrJjE7/LuSyJWEGV8cUMPxDVHn6grb4LLSNPuRcPBHbycY6mi/M/mu4y80dkt4rKwOxzVro1qHCeEK2hukgIN7J9kxcTzkd6kAHxsJsSvKfUXVSQdH7GhWG9fqUBkVrL1AhHxpNkAQBPY8CU1Jh7EDYU+jSoGtie90Llti2MrkM/1dc42cPYRnBskFFnPEWyVB9YWWxNg0vhZA7N6HDRrMIJla+e4S6H271T1zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OHfWqRNrM4KLke+JV4p0Bl6H4azXA0yTUEHl7an7BN0=;
 b=SC7M5sibd7jNP6cqTKS/3dqcLE1588CEbw30YpwEY4/TorpbcPUzJnSZc80wyUTgsyuGVpg+s5U0MaOY/FqgrXTa0kZ9aH+8UkQcnNP0K3Bmlg8AaEQQDZaWlI5Kv9asq1lKN5S3fLAUXtDF0NrrmU1FURto4QEfHfY8NBssM6xLYI5hdWc42hV7fEt3b7qnqnv0KlODDjHPKYPqMJsaqyUipNRoVpwESnNAUWyvKHLY+JFvaaX5Glk5AZzJe8OHYISWi444DSJJVyLKMeZ8VdToWHr9y3zI3t2Q5zNBM9hBb+XfVPR43h7OBF1r00IFh4S7WsP0cFFoEkRO/j2znw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=distech-controls.com; dmarc=pass action=none
 header.from=distech-controls.com; dkim=pass header.d=distech-controls.com;
 arc=none
Received: from BL0PR01MB4835.prod.exchangelabs.com (20.177.147.211) by
 BL0PR01MB4484.prod.exchangelabs.com (20.177.241.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2367.24; Tue, 22 Oct 2019 13:33:17 +0000
Received: from BL0PR01MB4835.prod.exchangelabs.com
 ([fe80::5c78:d9d4:3906:a553]) by BL0PR01MB4835.prod.exchangelabs.com
 ([fe80::5c78:d9d4:3906:a553%2]) with mapi id 15.20.2347.029; Tue, 22 Oct 2019
 13:33:17 +0000
From:   "Tremblay, Eric" <etremblay@distech-controls.com>
To:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
CC:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH v5 0/2] hwmon: Add driver for Texas Instruments TMP512/513
 sensor chips
Thread-Topic: [PATCH v5 0/2] hwmon: Add driver for Texas Instruments
 TMP512/513 sensor chips
Thread-Index: AdWI3C769AAu1seTT8uKbML+UcyFaQ==
Date:   Tue, 22 Oct 2019 13:33:16 +0000
Message-ID: <BL0PR01MB48352E51CE1F532A92A9142695680@BL0PR01MB4835.prod.exchangelabs.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mib-plugin: true
x-originating-ip: [207.253.3.19]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 2f442894-f806-44b4-e9be-08d756f46577
x-ms-traffictypediagnostic: BL0PR01MB4484:
x-microsoft-antispam-prvs: <BL0PR01MB4484B902B845133CF506C0C695680@BL0PR01MB4484.prod.exchangelabs.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 01986AE76B
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(396003)(346002)(136003)(39860400002)(366004)(376002)(189003)(199004)(476003)(14454004)(2201001)(86362001)(33656002)(478600001)(81156014)(8936002)(81166006)(8676002)(66476007)(66556008)(66446008)(66946007)(76116006)(2501003)(66066001)(486006)(64756008)(186003)(25786009)(5660300002)(52536014)(256004)(14444005)(26005)(102836004)(6506007)(71190400001)(305945005)(7736002)(6116002)(4326008)(3846002)(74316002)(6436002)(9686003)(55016002)(2906002)(99286004)(54906003)(71200400001)(316002)(110136005)(7696005);DIR:OUT;SFP:1101;SCL:1;SRVR:BL0PR01MB4484;H:BL0PR01MB4835.prod.exchangelabs.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: distech-controls.com does not
 designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8OPqR8OP2iQZdCQXkOi3uUfQs96/dVp7ew423HXGVXiVZnJt+OyNJFCc1hQK3BV5YIwBWsCBA5jE5mnyVp+3AcXdwbrjRdVyxJceEnghEilIM3+J65gXt9uT7XSgCLlKQC16B1dYlKRfFMutMyQ4spdXTG05lAF0nhZtMTXQzwlbpefVrIjBw/StyBO5Ba9TPQ2iU5sbFcPPkvn80CHwe1sVJs8lPFXXFDNztj9VO0dNsGlEimRbCe7RncTupEJDNZhUsXy5PuRN3liGGf2V6e4I59oe5SKjsPA/npUW12w2mGUMsgy53GpwxXeWFKUhek2C9XRoi9CCXuReGx6R5/wRHWV8IOdTrtTZE8xFex9R6tp4o6+rph69LwZEYFrjD+0kAmWWEOOLlJBFwfgB5Ht5GxUvi/NsrpyJaMaFPgN5AdnIh6tMFeSU0ZeVqm3r
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: distech-controls.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f442894-f806-44b4-e9be-08d756f46577
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2019 13:33:16.8342
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: caadbe96-024e-4f67-82ec-fb28ff53d16d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /dc2k4c+WE7QLmp2RCiY5EUXqMcPG2NZ+LXbZt1qRLftUlCInEJPH1zk4n+j954KyV8RUZygeaH0mpMoZXfOQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR01MB4484
X-Proofpoint-Processed: True
X-Proofpoint-Spam-Details: rule=outbound_spam_notspam policy=outbound_spam score=0 suspectscore=0
 spamscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1011 impostorscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1908290000 definitions=main-1910220125
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

VmVyc2lvbiBmaXZlIG9mIHRoZSBkcml2ZXIgZm9yIFRleGFzIEluc3RydW1lbnRzIFRNUDUxMi81
MTMgc2Vuc29ycy4NCg0KVGhhbmtzIGFnYWluIGZvciB0aGUgcmV2aWV3Lg0KDQpNYWluIGNoYW5n
ZXMgZnJvbSB2ZXJzaW9uIDQ6DQoJLSBSZW1vdmUgY29uZmlnX2xvY2sgbXV0ZXgNCgktIFJld3Jp
dGUgZHQtYmluZGluZ3MgaW4geWFtbA0KDQpNYWluIGNoYW5nZXMgZnJvbSB2ZXJzaW9uIDM6DQoJ
LSBSZW1vdmUgdG1wNTF4X2NvbmZpZyBzdHJ1Y3R1cmUsIHRoZXJlIHdhcyBubyB1c2VmdWwgc3Rh
dGljDQoJICBmaWVsZCBpbiB0aGUgc3RydWN0dXJlLiBUaGUgZGF0YSB3YXMgbW92ZWQgdG8gdG1w
NTF4X2RhdGENCgkgIHN0cnVjdHVyZS4NCgktIFJlbW92ZSBwbGF0Zm9ybSBkYXRhDQoJLSB1c2Ug
ZGV2aWNlXyBBUEkgaW5zdGVhZCBvZiBvZl9kZXZpY2UgQVBJDQoJLSBVc2UgYXJyYXkgZm9yIG4t
RmFjdG9yIHZhbHVlcy4NCgktIFNldCBzaHVudCBkZWZhdWx0IHZhbHVlIHRvIDEwMDAgdU9obXMN
Cg0KTWFpbiBjaGFuZ2VzIGZyb20gdmVyc2lvbiAyOg0KCS0gUmVtb3ZlIHRoZSBuZWNjZXNzaXR5
IHRvIHByb3ZpZGUgYSBzaHVudC1yZXNpc3RvciB2YWx1ZQ0KCS0gUmVtb3ZlIG1heC1leHBlY3Rl
ZC1jdXJyZW50LW1hIGNvbmZpZ3VyYXRpb24gYW5kIGFsd2F5cw0KCSAgdXNlIG1heCBwb3NzaWJs
ZSBjdXJyZW50IGZvciBjYWxpYnJhdGlvbg0KCS0gTWFrZSBzdXJlIGNhbGN1bGF0aW9uIGR1cmlu
ZyBjYWxpYnJhdGlvbiBjYW4ndCBvdmVyZmxvdw0KCS0gQWRkIHZhbHVlIGNsYW1waW5nIGZvciBE
VCB2YWx1ZSBhbmQgcnVudGltZSBwYXJhbWV0ZXJzDQoJLSBTdXBwb3J0IG5vbiBEVCBzeXN0ZW0N
CgktIE1vdmUgaHlzdGVyZXNpcyBmcm9tIERUIHRvIHN0YW5kYXJkIGF0dHJpYnV0ZQ0KDQpNYWlu
IGNoYW5nZXMgZnJvbSB2ZXJzaW9uIDE6DQoJLSBVc2UgdGhlIHdpdGhfaW5mbyBBUEkgaW5zdGVh
ZCBvZiBzeXNmcyBhdHRyaWJ1dGVzLg0KCS0gUmVtb3ZlIG5vbi1zdGFuZGFyZCBhdHRyaWJ1dGVz
IGFuZCByYXcgdmFsdWUuDQoJLSBNb3ZlIHNldHRpbmdzIHRoYXQgd2VyZSBub24tc3RhbmRhcmQg
YXR0cmlidXRlcyB0bw0KCSAgZGV2aWNlIHRyZWUsIHVwZGF0ZSBkb2N1bWVudGF0aW9uIGFzIHdl
bGwuDQoJLSBGaXggY29kaW5nIHN0eWxlIGlzc3Vlcw0KDQpFcmljIFRyZW1ibGF5ICgyKToNCiAg
ZHQtYmluZGluZ3M6IGh3bW9uOiBBZGQgVE1QNTEyLzUxMw0KICBod21vbjogQWRkIGRyaXZlciBm
b3IgVGV4YXMgSW5zdHJ1bWVudHMgVE1QNTEyLzUxMyBzZW5zb3IgY2hpcHMuDQoNCiAuLi4vZGV2
aWNldHJlZS9iaW5kaW5ncy9od21vbi90aSx0bXA1MTMueWFtbCAgfCAgOTAgKysNCiBEb2N1bWVu
dGF0aW9uL2h3bW9uL3RtcDUxMy5yc3QgICAgICAgICAgICAgICAgfCAxMDIgKysrDQogTUFJTlRB
SU5FUlMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICA3ICsNCiBkcml2ZXJz
L2h3bW9uL0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMTAgKw0KIGRyaXZlcnMv
aHdtb24vTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMSArDQogZHJpdmVycy9o
d21vbi90bXA1MTMuYyAgICAgICAgICAgICAgICAgICAgICAgIHwgNzg2ICsrKysrKysrKysrKysr
KysrKw0KIDYgZmlsZXMgY2hhbmdlZCwgOTk2IGluc2VydGlvbnMoKykNCiBjcmVhdGUgbW9kZSAx
MDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2h3bW9uL3RpLHRtcDUxMy55
YW1sDQogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vaHdtb24vdG1wNTEzLnJzdA0K
IGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2h3bW9uL3RtcDUxMy5jDQoNCi0tIA0KMi4xNy4x
DQoNCg==
