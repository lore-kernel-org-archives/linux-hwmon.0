Return-Path: <SRS0=vS6D=ZE=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CF8AC43331
	for <linux-hwmon@archiver.kernel.org>; Tue, 12 Nov 2019 14:42:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0CBDD20818
	for <linux-hwmon@archiver.kernel.org>; Tue, 12 Nov 2019 14:42:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=distech-controls.com header.i=@distech-controls.com header.b="AXG4c7It"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726484AbfKLOmG (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 12 Nov 2019 09:42:06 -0500
Received: from mx0b-002ab301.pphosted.com ([148.163.154.99]:22982 "EHLO
        mx0b-002ab301.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726008AbfKLOmG (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 12 Nov 2019 09:42:06 -0500
Received: from pps.filterd (m0118795.ppops.net [127.0.0.1])
        by mx0b-002ab301.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id xACEeH3i004090;
        Tue, 12 Nov 2019 09:40:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=distech-controls.com; h=from : to :
 cc : subject : date : message-id : references : in-reply-to : content-type
 : content-transfer-encoding : mime-version; s=pps-02182019;
 bh=uziLPGfjTx3tN879vkz1CF+ppOdiOY3Qeotll8vOAtM=;
 b=AXG4c7ItbfDzoIfS3me7/VJQ4DThEWfb7sfOaV0YAelP5HNI7yHzfxZG7J1zHS4dkkVX
 tjhRI4+rsvACZr9TLBoohd6DTkptWNuWy+SLYKnAFFi1ehf2sIbA6URf7tOL5pfnx9Jw
 AQzjQXO2BiMpKtZCEwei6PVxbjX/mlpnienHVImp61D3bEFy0d+Qq6iONRGJjijoK5yK
 50J5yxhocQdnNhOW+GKa0Rr9dv6RxGE1jApZyKr0lmyVLxVqvlskUc/uh6MwuOLcmJRj
 fHT4OoNN1VY1WWQgyz6IlJdC3E6IPQPuLozshF0ip+DwXoByOvyufonPrQYTM6x2zM1g Mg== 
Received: from nam04-sn1-obe.outbound.protection.outlook.com (mail-sn1nam04lp2059.outbound.protection.outlook.com [104.47.44.59])
        by mx0b-002ab301.pphosted.com with ESMTP id 2w5r90ub1t-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 12 Nov 2019 09:40:17 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kNGBmCg7FzwlTfKrMWAVFMwOZUJf1EnHvCub5NnNQO2ZKwa0qv1HMSu4pO8rpE3RFmqLDPRtdCWPk0/pungOcEY2KMpBpBH8VQ1UVM5W4ntgg8HL1q/YjCrRqJQAMx9V8hXUaDMxh7w8he+dUsWFBMk05mcfYdpNdg2RE5gpobQ1Zph193oUxksu8vGMIoXaTXqh/5Ut4xulxOV9Ort95dPF7SKj+L5m2WiL2epQE7m2iFrloe2lrJIksV04N5jBr1cTDmb1jHV7zUqaEP/Dvihx4NqnU/sHM6oqwIczwGy7BlZj8oDoGwT5aaPBPv5TwfGrmhgRK1nhsceGTUAjAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uziLPGfjTx3tN879vkz1CF+ppOdiOY3Qeotll8vOAtM=;
 b=ArKFJFO18CCmABBZu9H/RGn7noVOLrbaX+NrVqtW7JBa/x0Ifk8cTrRI/rbcHW9pzmMyO66gC+1PG7LQl6muWCTN4zWyJp5vVOoAn9EioKphtxYY/L/tk8mkTeFjzCxZ8Wy7fWN8pdzzFl+xCj7cK6Zm68Faa64C1LsKqW+vWf49N05X9kTqV1TODlKeuUBMiPMvUt3SrOGXhzAjqQzZ1YUDwSTga0hjkdZoVyxDN9Yo5n+fsiR5XS53FbQAgG8oRfd5VAETdAUVkEI8tk0Slk70UBdVizBT8rHzgIz91Ao70pDBiGRdpCP4+Wqeo13pOOvChOG5/q89o8UkOsvGJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=distech-controls.com; dmarc=pass action=none
 header.from=distech-controls.com; dkim=pass header.d=distech-controls.com;
 arc=none
Received: from BL0PR01MB4835.prod.exchangelabs.com (20.177.147.211) by
 BL0PR01MB4385.prod.exchangelabs.com (20.177.240.26) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.20; Tue, 12 Nov 2019 14:40:15 +0000
Received: from BL0PR01MB4835.prod.exchangelabs.com
 ([fe80::b00e:eb7:d585:5086]) by BL0PR01MB4835.prod.exchangelabs.com
 ([fe80::b00e:eb7:d585:5086%6]) with mapi id 15.20.2430.027; Tue, 12 Nov 2019
 14:40:15 +0000
From:   "Tremblay, Eric" <etremblay@distech-controls.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
CC:     "jdelvare@suse.com" <jdelvare@suse.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "corbet@lwn.net" <corbet@lwn.net>
Subject: RE: [PATCH v7 1/2] dt-bindings: hwmon: Add TMP512/513
Thread-Topic: [PATCH v7 1/2] dt-bindings: hwmon: Add TMP512/513
Thread-Index: AQHVmM+QVZuvH6alYkaCtrsGmFXw6KeGxAMAgADXgpA=
Date:   Tue, 12 Nov 2019 14:40:15 +0000
Message-ID: <BL0PR01MB4835021C7014DA17D2BAA43B95770@BL0PR01MB4835.prod.exchangelabs.com>
References: <20191111203445.27130-1-etremblay@distech-controls.com>
 <20191111203445.27130-2-etremblay@distech-controls.com>
 <88a90ad1-cb97-b425-5fea-6580e9d8657b@roeck-us.net>
In-Reply-To: <88a90ad1-cb97-b425-5fea-6580e9d8657b@roeck-us.net>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mib-plugin: true
x-originating-ip: [207.253.3.19]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 32f6da98-ca71-47b7-56a3-08d7677e3b36
x-ms-traffictypediagnostic: BL0PR01MB4385:
x-ms-exchange-purlcount: 3
x-microsoft-antispam-prvs: <BL0PR01MB4385C5363DACF15AF148888995770@BL0PR01MB4385.prod.exchangelabs.com>
x-ms-oob-tlc-oobclassifiers: OLM:849;
x-forefront-prvs: 021975AE46
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(376002)(366004)(396003)(39860400002)(346002)(136003)(189003)(199004)(9686003)(478600001)(110136005)(74316002)(186003)(305945005)(54906003)(2201001)(8936002)(6306002)(26005)(6436002)(99286004)(5660300002)(76176011)(7696005)(25786009)(14454004)(476003)(53546011)(52536014)(4326008)(6506007)(7736002)(316002)(446003)(229853002)(102836004)(86362001)(966005)(11346002)(33656002)(2501003)(8676002)(71190400001)(71200400001)(6246003)(66446008)(486006)(6116002)(55016002)(66066001)(3846002)(256004)(2906002)(66946007)(76116006)(64756008)(66556008)(66476007)(81156014)(81166006);DIR:OUT;SFP:1101;SCL:1;SRVR:BL0PR01MB4385;H:BL0PR01MB4835.prod.exchangelabs.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: distech-controls.com does not
 designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QxYtXlB9VyIhVgpvzlNj5L+a/PvL4ls0WfzmKTJ3xk2HZSAi5ez/A9QQNIGeViALjgEbnWNYtGz6VcO/nfgHtpbPQdxrVOMB5bv4+LY/yEdRGn6qwvS+22BUfvUgVuUU5kbh/MEg7wcEnOfGINg9/JMTj0iVXxeItmUoSfNeRrGtvUKb64WMtitFOFimvvxdR+8B+tFHsrq9upUalxL1vg5W7bfBW8NpUDZlvVp3h7GiWyJ56AZHhpaSdWfNERhffH2m2hwrrbHKZgK+Q7P0mf3V9GzpwjTir0+94Dun61PoMGXkJsXc3NzDzPcNc/hNi1uGRbFh6Zrx/+U6gV8efFHdtgoIL+acvx3YBPYpljwSG78ASm6IctfL2b47opSeKXYLhzbgbOf1hukkHITkYlQ9T3h+OlhTnMMFoXsUiNva67JOVQMXHED4WX1ocw25K3D1CENmwWNKYPseIW7o1pAFf2lzebkCTbY78PZYZ0Y=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: distech-controls.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32f6da98-ca71-47b7-56a3-08d7677e3b36
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2019 14:40:15.1302
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: caadbe96-024e-4f67-82ec-fb28ff53d16d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: utg/ejUrQNwOMN3OB8G8k9VanNPT2z0H2itPhQBawQ9JA3a7H3xBU6oECQuNjWsGsytCLDjkxD9pqELYD1ZSug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR01MB4385
X-Proofpoint-Processed: True
X-Proofpoint-Spam-Details: rule=outbound_spam_notspam policy=outbound_spam score=0 adultscore=0
 spamscore=0 priorityscore=1501 phishscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 mlxlogscore=999 suspectscore=0 mlxscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1911120131
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

PiBGcm9tOiBHdWVudGVyIFJvZWNrIDxncm9lY2s3QGdtYWlsLmNvbT4gT24gQmVoYWxmIE9mIEd1
ZW50ZXIgUm9lY2sNCj4gU2VudDogTW9uZGF5LCBOb3ZlbWJlciAxMSwgMjAxOSA4OjQ1IFBNDQo+
IFRvOiBUcmVtYmxheSwgRXJpYyA8ZXRyZW1ibGF5QGRpc3RlY2gtY29udHJvbHMuY29tPjsgbGlu
dXgtaHdtb25Admdlci5rZXJuZWwub3JnOyBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsgbGlu
dXgtDQo+IGRvY0B2Z2VyLmtlcm5lbC5vcmcNCj4gQ2M6IGpkZWx2YXJlQHN1c2UuY29tOyByb2Jo
K2R0QGtlcm5lbC5vcmc7IG1hcmsucnV0bGFuZEBhcm0uY29tOyBjb3JiZXRAbHduLm5ldA0KPiBT
dWJqZWN0OiBSZTogW1BBVENIIHY3IDEvMl0gZHQtYmluZGluZ3M6IGh3bW9uOiBBZGQgVE1QNTEy
LzUxMw0KPiANCj4gT24gMTEvMTEvMTkgMTI6MzQgUE0sIGV0cmVtYmxheUBkaXN0ZWNoLWNvbnRy
b2xzLmNvbSB3cm90ZToNCj4gPiBGcm9tOiBFcmljIFRyZW1ibGF5IDxldHJlbWJsYXlAZGlzdGVj
aC1jb250cm9scy5jb20+DQo+ID4NCj4gPiBEb2N1bWVudCB0aGUgVE1QNTEzLzUxMiBkZXZpY2Ug
ZGV2aWNldHJlZSBiaW5kaW5ncw0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogRXJpYyBUcmVtYmxh
eSA8ZXRyZW1ibGF5QGRpc3RlY2gtY29udHJvbHMuY29tPg0KPiA+IC0tLQ0KPiA+ICAgLi4uL2Rl
dmljZXRyZWUvYmluZGluZ3MvaHdtb24vdGksdG1wNTEzLnlhbWwgIHwgODkgKysrKysrKysrKysr
KysrKysrKw0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDg5IGluc2VydGlvbnMoKykNCj4gPiAgIGNy
ZWF0ZSBtb2RlIDEwMDY0NA0KPiA+IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9o
d21vbi90aSx0bXA1MTMueWFtbA0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9od21vbi90aSx0bXA1MTMueWFtbA0KPiA+IGIvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2h3bW9uL3RpLHRtcDUxMy55YW1sDQo+ID4gbmV3IGZp
bGUgbW9kZSAxMDA2NDQNCj4gPiBpbmRleCAwMDAwMDAwMDAwMDAuLmRlNGVkMzY0NWUwZg0KPiA+
IC0tLSAvZGV2L251bGwNCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvaHdtb24vdGksdG1wNTEzLnlhbWwNCj4gPiBAQCAtMCwwICsxLDg5IEBADQo+ID4gKyMgU1BE
WC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wIE9SIEJTRC0yLUNsYXVzZSkgJVlBTUwgMS4y
DQo+ID4gKy0tLQ0KPiA+ICsNCj4gPiArJGlkOg0KPiA+ICtodHRwczovL3VybGRlZmVuc2UucHJv
b2Zwb2ludC5jb20vdjIvdXJsP3U9aHR0cC0zQV9fZGV2aWNldHJlZS5vcmdfc2MNCj4gPiAraGVt
YXNfaHdtb25fdGktMkN0bXA1MTMueWFtbC0yMyZkPUR3SUNhUSZjPXR2dkh4M3VDMFhkdGdHLUlt
UERqZk0wUW5hDQo+ID4gK2tJc21tR2N3ZWpRRFZ4RC1nJnI9eTM0ekxsOV9BdkJ5NU5TcnZza0c2
U0ZiaUtvQ3pJOTlXVzJ4aEtsc1ZWNCZtPWQzMw0KPiA+ICt3QktpZzdCWjBrc3MwT09VbW1OYmw1
SFdzV25NQkR0ZkZ2NS1yc1hvJnM9S2VPbWZRZXFVRWkxV2tKQ2djam5XVElJc1MNCj4gPiAra3pZ
MmhpUmFqSVZWa3EtbGMmZT0NCj4gPiArJHNjaGVtYToNCj4gPiAraHR0cHM6Ly91cmxkZWZlbnNl
LnByb29mcG9pbnQuY29tL3YyL3VybD91PWh0dHAtM0FfX2RldmljZXRyZWUub3JnX21lDQo+ID4g
K3RhLTJEc2NoZW1hc19jb3JlLnlhbWwtMjMmZD1Ed0lDYVEmYz10dnZIeDN1QzBYZHRnRy1JbVBE
amZNMFFuYWtJc21tRw0KPiA+ICtjd2VqUURWeEQtZyZyPXkzNHpMbDlfQXZCeTVOU3J2c2tHNlNG
YmlLb0N6STk5V1cyeGhLbHNWVjQmbT1kMzN3QktpZzcNCj4gPiArQlowa3NzME9PVW1tTmJsNUhX
c1duTUJEdGZGdjUtcnNYbyZzPU5lbDZPY0RmeXY4eFdYM2hHWWJFTEtmRW85WExFd0w3DQo+ID4g
K2xWcnpMS0hjQjZFJmU9DQo+ID4gKw0KPiA+ICt0aXRsZTogVE1QNTEzLzUxMiBzeXN0ZW0gbW9u
aXRvciBzZW5zb3INCj4gPiArDQo+ID4gK21haW50YWluZXJzOg0KPiA+ICsgIC0gRXJpYyBUcmVt
YmxheSA8ZXRyZW1ibGF5QGRpc3RlY2gtY29udHJvbHMuY29tPg0KPiA+ICsNCj4gPiArZGVzY3Jp
cHRpb246IHwNCj4gPiArICBUaGlzIGRyaXZlciBpbXBsZW1lbnRzIHN1cHBvcnQgZm9yIFRleGFz
IEluc3RydW1lbnRzIFRNUDUxMiwgYW5kIFRNUDUxMy4NCj4gDQo+IEkgdGhpbmsgdGhpcyBuZWVk
cyBzb21lIHJld29yZGluZy4gVGhpcyBpcyBub3QgYSBkcml2ZXIgZGVzY3JpcHRpb24sIGJ1dCBh
IHN5c3RlbSBkZXNjcmlwdGlvbi4NCg0KT2ssIEkgd2lsbCBvbmx5IGtlZXAgdGhlIGNoaXAgZGVz
Y3JpcHRpb24uDQo+IA0KPiA+ICsgIFRoZSBUTVA1MTIgKGR1YWwtY2hhbm5lbCkgYW5kIFRNUDUx
MyAodHJpcGxlLWNoYW5uZWwpIGFyZSBzeXN0ZW0NCj4gPiArIG1vbml0b3JzICB0aGF0IGluY2x1
ZGUgcmVtb3RlIHNlbnNvcnMsIGEgbG9jYWwgdGVtcGVyYXR1cmUgc2Vuc29yLA0KPiA+ICsgYW5k
IGEgaGlnaC1zaWRlICBjdXJyZW50IHNodW50IG1vbml0b3IuIFRoZXNlIHN5c3RlbSBtb25pdG9y
cyBoYXZlDQo+ID4gKyB0aGUgY2FwYWJpbGl0eSBvZiBtZWFzdXJpbmcgIHJlbW90ZSB0ZW1wZXJh
dHVyZXMsIG9uLWNoaXANCj4gPiArIHRlbXBlcmF0dXJlcywgYW5kIHN5c3RlbSB2b2x0YWdlL3Bv
d2VyL2N1cnJlbnQgIGNvbnN1bXB0aW9uLg0KPiA+ICsNCj4gPiArICBEYXRhc2hlZXRzOg0KPiA+
ICsNCj4gPiArIGh0dHBzOi8vdXJsZGVmZW5zZS5wcm9vZnBvaW50LmNvbS92Mi91cmw/dT1odHRw
LTNBX193d3cudGkuY29tX2xpdF9nDQo+ID4gKyBwbl90bXA1MTMmZD1Ed0lDYVEmYz10dnZIeDN1
QzBYZHRnRy1JbVBEamZNMFFuYWtJc21tR2N3ZWpRRFZ4RC1nJnI9eQ0KPiA+ICsgMzR6TGw5X0F2
Qnk1TlNydnNrRzZTRmJpS29Dekk5OVdXMnhoS2xzVlY0Jm09ZDMzd0JLaWc3Qlowa3NzME9PVW1t
TmINCj4gPiArIGw1SFdzV25NQkR0ZkZ2NS1yc1hvJnM9N1FrRHI4bjBKWFBWbUNHUmY2amhRUEs5
aDRFQ1JGTWZaSnJxdHRWeFdHOCZlDQo+ID4gKyA9DQo+ID4gKyBodHRwczovL3VybGRlZmVuc2Uu
cHJvb2Zwb2ludC5jb20vdjIvdXJsP3U9aHR0cC0zQV9fd3d3LnRpLmNvbV9saXRfZw0KPiA+ICsg
cG5fdG1wNTEyJmQ9RHdJQ2FRJmM9dHZ2SHgzdUMwWGR0Z0ctSW1QRGpmTTBRbmFrSXNtbUdjd2Vq
UURWeEQtZyZyPXkNCj4gPiArIDM0ekxsOV9BdkJ5NU5TcnZza0c2U0ZiaUtvQ3pJOTlXVzJ4aEts
c1ZWNCZtPWQzM3dCS2lnN0JaMGtzczBPT1VtbU5iDQo+ID4gKyBsNUhXc1duTUJEdGZGdjUtcnNY
byZzPTJjNDd6OWhkZFIzdnhXQXl0UnhLMDhTTzkzOVRzaTEyZVBIMXVHS19vSUkmZQ0KPiA+ICsg
PQ0KPiA+ICsNCj4gPiArDQo+ID4gK3Byb3BlcnRpZXM6DQo+ID4gKyAgY29tcGF0aWJsZToNCj4g
PiArICAgIGVudW06DQo+ID4gKyAgICAgIC0gdGksdG1wNTEyDQo+ID4gKyAgICAgIC0gdGksdG1w
NTEzDQo+ID4gKw0KPiA+ICsgIHJlZzoNCj4gPiArICAgIG1heEl0ZW1zOiAxDQo+ID4gKw0KPiA+
ICsgIHNodW50LXJlc2lzdG9yLW1pY3JvLW9obXM6DQo+ID4gKyAgICBkZXNjcmlwdGlvbjogfA0K
PiA+ICsgICAgICBJZiAwLCB0aGUgY2FsaWJyYXRpb24gcHJvY2VzcyB3aWxsIGJlIHNraXBlZCBh
bmQgdGhlIGN1cnJlbnQgYW5kIHBvd2VyDQo+ID4gKyAgICAgIG1lYXN1cmVtZW50IGVuZ2luZSB3
aWxsIG5vdCB3b3JrLiBUZW1wZXJhdHVyZSBhbmQgdm9sdGFnZSBtZWFzdXJlbWVudA0KPiA+ICsg
ICAgICB3aWxsIGNvbnRpbnVlIHRvIHdvcmsuIFRoZSBzaHVudCB2YWx1ZSBhbHNvIG5lZWQgdG8g
cmVzcGVjdDoNCj4gPiArICAgICAgcnNodW50IDw9IHBnYS1nYWluICogNDAgKiAxMDAwICogMTAw
MC4NCj4gPiArICAgICAgSWYgbm90LCBpdCdzIG5vdCBwb3NzaWJsZSB0byBjb21wdXRlIGEgdmFs
aWQgY2FsaWJyYXRpb24gdmFsdWUuDQo+ID4gKyAgICBkZWZhdWx0OiAxMDAwDQo+ID4gKw0KPiA+
ICsgIHRpLHBnYS1nYWluOg0KPiA+ICsgICAgZGVzY3JpcHRpb246IHwNCj4gPiArICAgICAgVGhl
IGdhaW4gdmFsdWUgZm9yIHRoZSBQR0EgZnVuY3Rpb24uIFRoaXMgaXMgOCwgNCwgMiBvciAxLg0K
PiA+ICsgICAgICBUaGUgUEdBIGdhaW4gYWZmZWN0IHRoZSBzaHVudCB2b2x0YWdlIHJhbmdlLg0K
PiA+ICsgICAgICBUaGUgcmFuZ2Ugd2lsbCBiZSBlcXVhbCB0bzogcGdhLWdhaW4gKiA0MG1WDQo+
ID4gKyAgICBhbGxPZjoNCj4gPiArICAgICAgLSAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9k
ZWZpbml0aW9ucy91aW50MzINCj4gPiArICAgIGVudW06IFsxLCAyLCA0LCA4XQ0KPiA+ICsgICAg
ZGVmYXVsdDogOA0KPiA+ICsNCj4gPiArICB0aSxidXMtcmFuZ2UtbWljcm92b2x0Og0KPiA+ICsg
ICAgZGVzY3JpcHRpb246IHwNCj4gPiArICAgICAgVGhpcyBpcyB0aGUgb3BlcmF0aW5nIHJhbmdl
IG9mIHRoZSBidXMgdm9sdGFnZSBpbiBtaWNyb3ZvbHQNCj4gPiArICAgIGFsbE9mOg0KPiA+ICsg
ICAgICAtICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3VpbnQzMg0KPiA+
ICsgICAgZW51bTogWzE2MDAwMDAwLCAzMjAwMDAwMF0NCj4gPiArICAgIGRlZmF1bHQ6IDMyMDAw
MDAwDQo+ID4gKw0KPiA+ICsgIHRpLG5mYWN0b3I6DQo+ID4gKyAgICBkZXNjcmlwdGlvbjogfA0K
PiA+ICsgICAgICBBcnJheSBvZiB0aHJlZShUTVA1MTMpIG9yIHR3byhUTVA1MTIpIG4tRmFjdG9y
IHZhbHVlIGZvciBlYWNoIHJlbW90ZQ0KPiA+ICsgICAgICB0ZW1wZXJhdHVyZSBjaGFubmVsLg0K
PiA+ICsgICAgICBTZWUgZGF0YXNoZWV0IFRhYmxlIDExIGZvciBuLUZhY3RvciByYW5nZSBsaXN0
IGFuZCB2YWx1ZSBpbnRlcnByZXRhdGlvbi4NCj4gPiArICAgIGFsbE9mOg0KPiA+ICsgICAgICAt
ICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjZGVmaW5pdGlvbnMvdWludDgtYXJyYXkNCj4gPiAr
ICAgICAgLSBtaW5JdGVtczogMg0KPiA+ICsgICAgICAgIG1heEl0ZW1zOiAzDQo+ID4gKyAgICAg
ICAgaXRlbXM6DQo+ID4gKyAgICAgICAgICBkZWZhdWx0OiAwDQo+ID4gKw0KPiA+ICtyZXF1aXJl
ZDoNCj4gPiArICAtIGNvbXBhdGlibGUNCj4gPiArICAtIHJlZw0KPiA+ICsNCj4gPiArZXhhbXBs
ZXM6DQo+ID4gKyAgLSB8DQo+ID4gKyAgICBpMmMgew0KPiA+ICsgICAgICAgIHRtcDUxM0A1YyB7
DQo+ID4gKyAgICAgICAgICAgIGNvbXBhdGlibGUgPSAidGksdG1wNTEzIjsNCj4gPiArICAgICAg
ICAgICAgcmVnID0gPDB4NUM+Ow0KPiA+ICsgICAgICAgICAgICBzaHVudC1yZXNpc3Rvci1taWNy
by1vaG1zID0gPDMzMDAwMD47DQo+ID4gKyAgICAgICAgICAgIHRpLGJ1cy1yYW5nZS1taWNyb3Zv
bHQgPSA8MzIwMDAwMDA+Ow0KPiA+ICsgICAgICAgICAgICB0aSxwZ2EtZ2FpbiA9IDw4PjsNCj4g
PiArICAgICAgICAgICAgdGksbmZhY3RvciA9IFswMSBGMyAwMF07DQo+ID4gKyAgICAgICAgfTsN
Cj4gPiArICAgIH07DQo+ID4NCg0K
