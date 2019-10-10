Return-Path: <SRS0=EtL0=YD=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 260B4C4360C
	for <linux-hwmon@archiver.kernel.org>; Thu, 10 Oct 2019 07:15:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D3AF22067B
	for <linux-hwmon@archiver.kernel.org>; Thu, 10 Oct 2019 07:15:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=analog.onmicrosoft.com header.i=@analog.onmicrosoft.com header.b="3bdIKhzA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732947AbfJJHPo (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 10 Oct 2019 03:15:44 -0400
Received: from mx0b-00128a01.pphosted.com ([148.163.139.77]:10048 "EHLO
        mx0b-00128a01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727130AbfJJHNo (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 10 Oct 2019 03:13:44 -0400
Received: from pps.filterd (m0167090.ppops.net [127.0.0.1])
        by mx0b-00128a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id x9A7D9Js028144;
        Thu, 10 Oct 2019 03:13:09 -0400
Received: from nam02-cy1-obe.outbound.protection.outlook.com (mail-cys01nam02lp2055.outbound.protection.outlook.com [104.47.37.55])
        by mx0b-00128a01.pphosted.com with ESMTP id 2veqt5ge5c-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 10 Oct 2019 03:13:09 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YYaiQH6ZLc236L/CdS9L9cU1vpwRxXZGZolODJRapVtxs9HCsCibRUxtAcrhMNVKoM2X6VqZdx+6gNIVDqlbqrBMIl3MP91XBZXLn+/ULDqKyaCpeg/awfemqg26IEkol9ug1n6Pz9/YxZ9hh6fpHWVy/GlpJfBQS+PlyCEoTlkk2DfONcRIYhsj1ZxbO8ixdT6Y5VugGRaR8GhMaV468sRhp5uE+usRvI5i4uSvguYkp5cQ8SJ1Ic8a4ceWmwK5HzegqA+OiWuKjMiuMcdaprmJgsvEn3KX9wOW/cZr3+aszaCQJ/FntVBURn7016VpCgAo0Z45TesL8jTNF38cHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IR2OG3SKjU8cRvqugdgSJGvSB4cTrBxf4krM6ET9mfI=;
 b=iac1n1KTnETJUcIo3An8qkaou3KYrrblW+Pjwr+dKJVQeTi5qvHUxUF2tLnm96nzP848F38t5x1YavOw/f74cGachDrBE3mz8kdyVBZ/KSjdmSy/6GgvzunPQOEsRBENqt8OK7DLpdVSvEf+QsH7cgIgFjDEof0cdDJeo5VaEtr9XHBQVkYZdPTq43aCbvnGSOO41EX9+GI7Hk+9h15BXEaAfEjYPjDfuFn7g4BOJZlqsYjw6rnwWllIGm405l6U3IccBuNRmRGTTl3eX1+VE4bZ6ft4SvWRl69D6bhJXK7RHXhvT+9bxju0XFvNMMnxc6hqaOtsmOXN/Tl3Zo+LzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IR2OG3SKjU8cRvqugdgSJGvSB4cTrBxf4krM6ET9mfI=;
 b=3bdIKhzAitAlZpHZx7lxhisupc34M9dNpVYiSrkKWSDCmlW+0ezAa1/RWfu1YHbg0DriQh0sINoKFRfgxenjqMo/PZnrSWt3/rggFif4W6fLhPpevqqxKNeTI7BJW0Ut0OSw48fZlZajrMZB0PsViRnW9DVKcDurwMUsRm8EVlo=
Received: from MN2PR03MB5117.namprd03.prod.outlook.com (52.132.171.137) by
 MN2PR03MB5278.namprd03.prod.outlook.com (10.186.147.204) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.17; Thu, 10 Oct 2019 07:13:06 +0000
Received: from MN2PR03MB5117.namprd03.prod.outlook.com
 ([fe80::8c20:8f3b:b536:dca5]) by MN2PR03MB5117.namprd03.prod.outlook.com
 ([fe80::8c20:8f3b:b536:dca5%7]) with mapi id 15.20.2327.026; Thu, 10 Oct 2019
 07:13:06 +0000
From:   "Sa, Nuno" <Nuno.Sa@analog.com>
To:     "linux@roeck-us.net" <linux@roeck-us.net>
CC:     "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "corbet@lwn.net" <corbet@lwn.net>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "jdelvare@suse.com" <jdelvare@suse.com>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>
Subject: Re: [PATCH 2/3] hwmon: Add support for ltc2947
Thread-Topic: [PATCH 2/3] hwmon: Add support for ltc2947
Thread-Index: AQHVfQ0JfzZtaDJjC0uzTOP32sZwk6dPQ3sAgAQ23oA=
Date:   Thu, 10 Oct 2019 07:13:06 +0000
Message-ID: <ea52f348c9fab8c9a3c3417909053f4abb12cbcb.camel@analog.com>
References: <20190924124945.491326-1-nuno.sa@analog.com>
         <20190924124945.491326-3-nuno.sa@analog.com>
         <20191003041446.GA2332@roeck-us.net>
         <d0a992bebbc3c388b6be100d1821fa5813fcc1b4.camel@analog.com>
         <20191004150623.GA28287@roeck-us.net>
         <7d4ca133201f8c75855de6777f6018567701e16a.camel@analog.com>
         <94cf417f-90fa-50b8-9d4a-d7e4c9dd3d8d@roeck-us.net>
         <5f280daff806cb73a160d10f5ec97be18d42aebb.camel@analog.com>
In-Reply-To: <5f280daff806cb73a160d10f5ec97be18d42aebb.camel@analog.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.71.226.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a9f87b5a-7334-4fc9-b350-08d74d514c96
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: MN2PR03MB5278:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR03MB52781CB7C6002F5D803DEA5F99940@MN2PR03MB5278.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 018632C080
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(136003)(366004)(376002)(396003)(39860400002)(346002)(199004)(189003)(91956017)(256004)(86362001)(36756003)(64756008)(14444005)(1730700003)(6916009)(66476007)(316002)(99286004)(76116006)(66946007)(2501003)(76176011)(81156014)(81166006)(66556008)(66446008)(118296001)(14454004)(26005)(186003)(305945005)(8936002)(6116002)(8676002)(102836004)(6506007)(53546011)(5660300002)(3846002)(25786009)(7736002)(66066001)(2616005)(11346002)(476003)(446003)(71200400001)(486006)(4326008)(6246003)(71190400001)(2906002)(5640700003)(6436002)(54906003)(229853002)(6306002)(6512007)(2351001)(6486002)(478600001)(966005)(6606295002);DIR:OUT;SFP:1101;SCL:1;SRVR:MN2PR03MB5278;H:MN2PR03MB5117.namprd03.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: analog.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xMmx7JrQJ/b59npWyrs5bLOANTCT8nJVCjaesXODvhY6WQniNMqUsCumBdqnUS0saNdHDYn+FiWH6BBeFFBX6g7gWhVi108B1LIoMGpzt57EP/QfmFOF/nQF4lphKSdtuAO8FVEvgcx2cev3HOHToGLcLkrhup88u9jb3bc92cAl070goB06XFlTl6c8xfVmmki/1N+JsOdogTIGglj3nABkP/jKs5YvujvHH/Yr7p0XdWRhnIm0w1t3h/Akyl/mlMSluVqHGIeE8w+d4RPYbwARS10q/hsRbvkNOwRgVo60c+iIQztEVoTyRdCMkj8q5mNcMppPQNlVp5OxyPSmpRvHgK2GMxsX4X24MQ2wwXEU2zcbZua1qd1QXyorTCFlMAhdDs4BR2mYYlEmRrJGrfLMVy9CDZxo/1qgxTxyrTMuR8SKwhad4/GFBHtVa4aIREVpil98p0Zkq1xdta3ZkQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <54670002C35DDF40AA6E1907C86CBEF3@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9f87b5a-7334-4fc9-b350-08d74d514c96
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Oct 2019 07:13:06.8490
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KTDTL+W3I8qQjdXJcGsnHidTD9bo9u5lIVRhxKj+qlsLAEeZZa+TGeTkKuxT3Btvph3eSDX9/ROEfoEApqXz0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5278
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-10_03:2019-10-08,2019-10-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 mlxlogscore=999 malwarescore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1908290000 definitions=main-1910100067
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

SGkgR3VlbnRlciwNCg0KSSBnb3Qgc29tZSBmZWVkYmFjayBhYm91dCBlbmVyZ3kgbWF4L21pbi4u
Lg0KDQpPbiBNb24sIDIwMTktMTAtMDcgYXQgMTQ6NTEgKzAwMDAsIFNhLCBOdW5vIHdyb3RlOg0K
PiBPbiBNb24sIDIwMTktMTAtMDcgYXQgMDU6NDQgLTA3MDAsIEd1ZW50ZXIgUm9lY2sgd3JvdGU6
DQo+ID4gT24gMTAvNy8xOSA1OjI1IEFNLCBTYSwgTnVubyB3cm90ZToNCj4gPiA+IE9uIEZyaSwg
MjAxOS0xMC0wNCBhdCAwODowNiAtMDcwMCwgR3VlbnRlciBSb2VjayB3cm90ZToNCj4gPiA+ID4g
T24gRnJpLCBPY3QgMDQsIDIwMTkgYXQgMDc6NDU6MDdBTSArMDAwMCwgU2EsIE51bm8gd3JvdGU6
DQo+ID4gPiA+IFsgLi4uIF0NCj4gPiA+ID4gPiA+ID4gK3N0YXRpYyBpbnQgbHRjMjk0N192YWxf
cmVhZChzdHJ1Y3QgbHRjMjk0N19kYXRhICpzdCwNCj4gPiA+ID4gPiA+ID4gY29uc3QNCj4gPiA+
ID4gPiA+ID4gdTgNCj4gPiA+ID4gPiA+ID4gcmVnLA0KPiA+ID4gPiA+ID4gPiArCQkJICAgIGNv
bnN0IHU4IHBhZ2UsIGNvbnN0IHNpemVfdCBzaXplLA0KPiA+ID4gPiA+ID4gPiBzNjQgKnZhbCkN
Cj4gPiA+ID4gPiA+ID4gK3sNCj4gPiA+ID4gPiA+ID4gKwlpbnQgcmV0Ow0KPiA+ID4gPiA+ID4g
PiArCXU2NCBfX3ZhbCA9IDA7DQo+ID4gPiA+ID4gPiA+ICsNCj4gPiA+ID4gPiA+ID4gKwltdXRl
eF9sb2NrKCZzdC0+bG9jayk7DQo+ID4gPiA+ID4gPiA+ICsNCj4gPiA+ID4gDQo+ID4gPiA+IE9u
IGEgc2lkZSBub3RlLCBzdXNwZW5kIGNvZGUgaXMgc3VwcG9zZWQgdG8gYmUgYXRvbWljLA0KPiA+
ID4gPiBJZiB0aGlzIGxvY2sgaXMgaGVsZCwgdGhlIHByb2Nlc3Mgb3IgdGhyZWFkIGhvbGRpbmcg
aXQNCj4gPiA+ID4gd2lsbCBsaWtlbHkgc3RhbGwgc3VzcGVuZCBzaW5jZSBpdCB3b24ndCBydW4u
DQo+ID4gPiA+IEF0IHRoZSB2ZXJ5IGxlYXN0LCB0aGlzIHdvdWxkIGhhdmUgdG8gYmUgYSB0cnls
b2NrLA0KPiA+ID4gPiB3aXRoIHN1c3BlbmQgZmFpbGluZyBpZiB0aGUgbG9jayBjYW4gbm90IGJl
IGFjcXVpcmVkLg0KPiA+ID4gDQo+ID4gPiBHb3QgaXQuIEV2ZW4gbW9yZSwgTm93IEkgZG9uJ3Qg
c2VlIHRoZSBwb2ludCBvZiBoYXZpbmcgdGhlIG11dGV4DQo+ID4gPiBpbg0KPiA+ID4gdGhlDQo+
ID4gPiBQTSBjYWxsYmFja3MgKHRob3VnaCBJIHNhdyBvdGhlciBkcml2ZXJzIGRvaW5nIHRoaXMp
LiBBcyB5b3UNCj4gPiA+IHNhaWQsDQo+ID4gPiBhdA0KPiA+ID4gdGhlIHZlcnkgbGVhc3QgdGhl
IHRyeWxvY2sgc2hvdWxkIGJlIHVzZWQgc2luY2UgYSBmcm96ZW4gdGFzaw0KPiA+ID4gbWlnaHQN
Cj4gPiA+IGhhdmUgdGhlIG11dGV4IGxvY2tlZC4gRWl0aGVyIHdheSwgSSB3aWxsIGRyb3AgYm90
aCB0aGUgZmxhZyBhbmQNCj4gPiA+IHRoZQ0KPiA+ID4gY2FsbCB0byBtdXRleF8qIGZ1bmN0aW9u
cyBpcyBzdXNwZW5kKCkvcmVzdW1lKCkuDQo+ID4gPiANCj4gPiA+ID4gPiA+ID4gKwlpZiAoc3Qt
PnJlc2V0KSB7DQo+ID4gPiA+ID4gPiA+ICsJCW11dGV4X3VubG9jaygmc3QtPmxvY2spOw0KPiA+
ID4gPiA+ID4gPiArCQlyZXR1cm4gLUVQRVJNOw0KPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiBO
b3Qgc3VyZSB3aGF0IHRoZSBlcnJvciBoZXJlIHNob3VsZCBiZSwgYnV0IEVQRVJNIGlzIG5vdA0K
PiA+ID4gPiA+ID4gY29ycmVjdC4NCj4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gVW5kZXIgd2hp
Y2ggY29uZGl0aW9ucyB3b3VsZCB0aGlzIGZ1bmN0aW9uIGJlIGNhbGxlZCB3aGlsZQ0KPiA+ID4g
PiA+ID4gaW4NCj4gPiA+ID4gPiA+IHN1c3BlbmQgPw0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+IEhv
bmVzdGx5LCB0aGlzIGlzIG1vcmUgbGlrZSBhIHNhbml0eSBjaGVjay4gSSdtIG5vdCBzdXJlIGlm
DQo+ID4gPiA+ID4gd2UNCj4gPiA+ID4gPiBjYW4NCj4gPiA+ID4gPiBnZXQNCj4gPiA+ID4gPiBo
ZXJlIGluIHN1c3BlbmQgbW9kZS4gRG9uJ3QgdXNlcmxhbmQgYXBwcyBjYW4gc3RpbGwgcnVuIGlu
DQo+ID4gPiA+ID4gc3VzcGVuZD8NCj4gPiA+ID4gPiBJDQo+ID4gPiA+ID4gZ3Vlc3Mgc28gYnV0
IEknbSBub3QgMTAwJSBzdXJlIG9uIHRoaXMuIERvIHlvdSBoYXZlIGFueQ0KPiA+ID4gPiA+IHJl
Y29tbWVuZGF0aW9uDQo+ID4gPiA+ID4gZm9yIHRoZSBlcnJvciBoZXJlPw0KPiA+ID4gPiA+IA0K
PiA+ID4gPiBTb3JyeSwgSSB3b24ndCBhY2NlcHQgImp1c3QgaW4gY2FzZSIgY29kZS4NCj4gPiA+
ID4gDQo+ID4gPiA+IEhhdmluZyBzYWlkIHRoYXQsIHBsZWFzZSBpbmZvcm0geW91cnNlbGYgaG93
IHN1c3BlbmQgd29ya3MuDQo+ID4gPiA+IFVzZXJsYW5kDQo+ID4gPiA+IGNvZGUNCj4gPiA+ID4g
aGFzIHRvIGJlIHN0b3BwZWQgYmVmb3JlIGFueSBoYXJkd2FyZSBjYW4gYmUgZGlzYWJsZWQuIFNp
bWlsYXIsDQo+ID4gPiA+IGhhcmR3YXJlDQo+ID4gPiA+IGhhcyB0byBiZSByZS1lbmFibGVkIGJl
Zm9yZSB1c2VybGFuZCBjb2RlIGNhbiByZXN1bWUuDQo+ID4gPiA+IE90aGVyd2lzZSB0aGUga2Vy
bmVsIHdvdWxkIGNyYXNoIGFsbCBvdmVyIHRoZSBwbGFjZS4gSW4gbWFueQ0KPiA+ID4gPiBjYXNl
cywNCj4gPiA+ID4gZGlzYWJsaW5nIHRoZSBoYXJkd2FyZSBtZWFucyB0aGF0IHRyeWluZyB0byBh
Y2Nlc3MgaGFyZHdhcmUNCj4gPiA+ID4gcmVnaXN0ZXJzDQo+ID4gPiA+IHdpbGwgY2F1c2UgYW4g
YWNlc3MgZmF1bHQuDQo+ID4gPiANCj4gPiA+IFllcywgeW91IGFyZSByaWdodC4gSSBkaWQgY2hl
Y2tlZCB0aGUgc3VzcGVuZCBjb2RlIGFuZCBhbGwNCj4gPiA+IHVzZXJsYW5kDQo+ID4gPiB0YXNr
cyBhbmQga3RocmVhZHMgYXJlIHN0b3BwZWQgYmVmb3JlIHRoZSBzdXNwZW5kKCkgY2FsbGJhY2sg
aXMNCj4gPiA+IGNhbGxlZA0KPiA+ID4gZm9yIHRoZSBIVyBkZXZpY2VzLg0KPiA+ID4gDQo+ID4g
PiA+IFsuLi5dDQo+ID4gPiA+IA0KPiA+ID4gPiA+ID4gPiArDQo+ID4gPiA+ID4gPiA+ICtzdGF0
aWMgc3RydWN0IGF0dHJpYnV0ZSAqbHRjMjk0N19hdHRyc1tdID0gew0KPiA+ID4gPiA+ID4gPiAr
CSZzZW5zb3JfZGV2X2F0dHJfaW4wX2ZhdWx0LmRldl9hdHRyLmF0dHIsDQo+ID4gPiA+ID4gPiA+
ICsJJnNlbnNvcl9kZXZfYXR0cl9pbjFfZmF1bHQuZGV2X2F0dHIuYXR0ciwNCj4gPiA+ID4gPiA+
ID4gKwkmc2Vuc29yX2Rldl9hdHRyX2N1cnIxX2ZhdWx0LmRldl9hdHRyLmF0dHIsDQo+ID4gPiA+
ID4gPiA+ICsJJnNlbnNvcl9kZXZfYXR0cl90ZW1wMV9mYXVsdC5kZXZfYXR0ci5hdHRyLA0KPiA+
ID4gPiA+ID4gPiArCSZzZW5zb3JfZGV2X2F0dHJfcG93ZXIxX2lucHV0LmRldl9hdHRyLmF0dHIs
DQo+ID4gPiA+ID4gPiA+ICsJJnNlbnNvcl9kZXZfYXR0cl9wb3dlcjFfbWF4LmRldl9hdHRyLmF0
dHIsDQo+ID4gPiA+ID4gPiA+ICsJJnNlbnNvcl9kZXZfYXR0cl9wb3dlcjFfbWluLmRldl9hdHRy
LmF0dHIsDQo+ID4gPiA+ID4gPiA+ICsJJnNlbnNvcl9kZXZfYXR0cl9wb3dlcjFfaW5wdXRfaGln
aGVzdC5kZXZfYXR0ci5hdHRyLA0KPiA+ID4gPiA+ID4gPiArCSZzZW5zb3JfZGV2X2F0dHJfcG93
ZXIxX2lucHV0X2xvd2VzdC5kZXZfYXR0ci5hdHRyLA0KPiA+ID4gPiA+ID4gPiArCSZzZW5zb3Jf
ZGV2X2F0dHJfcG93ZXIxX2ZhdWx0LmRldl9hdHRyLmF0dHIsDQo+ID4gPiA+ID4gPiA+ICsJJnNl
bnNvcl9kZXZfYXR0cl9lbmVyZ3kxX2lucHV0LmRldl9hdHRyLmF0dHIsDQo+ID4gPiA+ID4gPiA+
ICsJJnNlbnNvcl9kZXZfYXR0cl9lbmVyZ3kxX21heC5kZXZfYXR0ci5hdHRyLA0KPiA+ID4gPiA+
ID4gPiArCSZzZW5zb3JfZGV2X2F0dHJfZW5lcmd5MV9taW4uZGV2X2F0dHIuYXR0ciwNCj4gPiA+
ID4gPiA+ID4gKwkmc2Vuc29yX2Rldl9hdHRyX2VuZXJneTFfbWF4X2FsYXJtLmRldl9hdHRyLmF0
dHIsDQo+ID4gPiA+ID4gPiA+ICsJJnNlbnNvcl9kZXZfYXR0cl9lbmVyZ3kxX21pbl9hbGFybS5k
ZXZfYXR0ci5hdHRyLA0KPiA+ID4gPiA+ID4gPiArCSZzZW5zb3JfZGV2X2F0dHJfZW5lcmd5Ml9p
bnB1dC5kZXZfYXR0ci5hdHRyLA0KPiA+ID4gPiA+ID4gPiArCSZzZW5zb3JfZGV2X2F0dHJfZW5l
cmd5Ml9tYXguZGV2X2F0dHIuYXR0ciwNCj4gPiA+ID4gPiA+ID4gKwkmc2Vuc29yX2Rldl9hdHRy
X2VuZXJneTJfbWluLmRldl9hdHRyLmF0dHIsDQo+ID4gPiA+ID4gPiA+ICsJJnNlbnNvcl9kZXZf
YXR0cl9lbmVyZ3kyX21heF9hbGFybS5kZXZfYXR0ci5hdHRyLA0KPiA+ID4gPiA+ID4gPiArCSZz
ZW5zb3JfZGV2X2F0dHJfZW5lcmd5Ml9taW5fYWxhcm0uZGV2X2F0dHIuYXR0ciwNCj4gPiA+ID4g
PiA+ID4gKwkmc2Vuc29yX2Rldl9hdHRyX2VuZXJneTFfb3ZlcmZsb3dfYWxhcm0uZGV2X2F0dHIu
YXR0ciwNCj4gPiA+ID4gPiA+ID4gKwkmc2Vuc29yX2Rldl9hdHRyX2VuZXJneTJfb3ZlcmZsb3df
YWxhcm0uZGV2X2F0dHIuYXR0ciwNCj4gPiA+ID4gPiANCj4gPiA+ID4gPiBUaGVzZSBvdmVyZmxv
dyBhdHRyaWJ1dGVzIGFyZSBraW5kIG9mIGFuIGFsYXJtIGZvciB0aGUgZW5lcmd5DQo+ID4gPiA+
ID4gb25lcy4NCj4gPiA+ID4gPiBJdA0KPiA+ID4gPiA+IHRlbGxzIHRoYXQgdGhlIGVuZXJneSBy
ZWdpc3RlcnMgYXJlIGFib3V0IHRvIG92ZXJmbG93LiBJDQo+ID4gPiA+ID4gZ3Vlc3MNCj4gPiA+
ID4gPiB0aGF0DQo+ID4gPiA+ID4gc29tZSBhcHBsaWNhdGlvbiBjYW4gZWFzaWx5IGZpbmQgb3V0
IHRoZSBtYXhpbXVtIHZhbHVlcw0KPiA+ID4gPiA+IHN1cHBvcnRlZA0KPiA+ID4gPiA+IG9uDQo+
ID4gPiA+ID4gdGhlc2UgcmVnaXN0ZXJzIGFuZCBpbXBsZW1lbnQgd2hhdGV2ZXIgbG9naWMgdGhl
eSB3YW50IGluIHRoZQ0KPiA+ID4gPiA+IGFwcA0KPiA+ID4gPiA+IGl0c2VsZi4gU28sIGlmIHlv
dSBwcmVmZXIgSSBjYW4ganVzdCBkcm9wIHRoaXMgb25lcz8NCj4gPiA+ID4gPiANCj4gPiA+ID4g
SSB1bmRlcnN0YW5kIHRoZSBvdmVyZmxvdyB1c2UgY2FzZS4gSG93ZXZlciwgdGhlIG1lcmUgcHJl
c2VuY2UNCj4gPiA+ID4gb2YgbWluL21heCBhdHRyaWJ1dGVzIGZvciBlbmVyZ3kgYXR0cmlidXRl
cyBzdWdnZXN0cyB0aGF0IHRoaXMNCj4gPiA+ID4gaXMgbm90IHRoZSBtaW4vbWF4IHVzZSBjYXNl
IGZvciBod21vbiBhdHRyaWJ1dGVzLiBUaGVyZSBpcyBubw0KPiA+ID4gPiAibWluaW11bSINCj4g
PiA+ID4gb3IgIm1heGltdW0iIGVuZXJneSBmb3IgYW4gYWNjdW11bGF0aW5nIHZhbHVlLiBTdWNo
IGF0dHJpYnV0ZXMNCj4gPiA+ID4gb25seSBtYWtlIHNlbnNlIGluIGFuIGFwcGxpY2F0aW9uIGFi
bGVyIHRvIG1lYXN1cmUgYXZhaWxhYmxlDQo+ID4gPiA+IGVuZXJneSAoZWcgYSBiYXR0ZXJ5IGNv
bnRyb2xsZXIpLiBJJ2xsIGhhdmUgdG8gcmVhZCB0aGUgY2hpcA0KPiA+ID4gPiBzcGVjaWZpY2F0
aW9uIHRvIHVuZGVyc3RhbmQgdGhlIGludGVuZGVkIHVzZSBjYXNlLg0KPiA+ID4gDQo+ID4gPiBT
aG91bGQgSSBqdXN0IGRyb3AgdGhlIG92ZXJmbG93IGF0dHJpYnV0ZXM/IEkgdGhpbmsgdGhlIHBh
cnQgY2FuDQo+ID4gPiBiZQ0KPiA+ID4gdXNlZCB0byBjaGVjayBiYXR0ZXJ5IGNoYXJnaW5nIGVm
ZmljaWVuY3kgZm9yIGV4YW1wbGUgKHRob3VnaCBJDQo+ID4gPiBndWVzcw0KPiA+ID4gd2Ugd291
bGQgbmVlZCB0byBhbHNvIHN1cHBvcnQgdGhlIENoYXJnZSByZWdpc3RlcidzKS4NCj4gPiA+IA0K
PiA+IA0KPiA+IElmIGNoaXAgaXMgKG9yIGNhbiBiZSkgdXNlZCBhcyBjaGFyZ2VyLCBpdCBzaG91
bGQgcmVnaXN0ZXIgYXMgc3VjaC4NCj4gPiBOb3RlIG15IHF1ZXN0aW9uIHdhcyB0aGUgZW5lcmd5
IGxpbWl0IGF0dHJpYnV0ZXMsIG5vdCB0aGUgb3ZlcmZsb3cNCj4gPiBhdHRyaWJ1dGVzLg0KPiAN
Cj4gSSBkb24ndCB0aGluayBpdCBjYW4gYmUgdXNlZCBhcyBhIGNoYXJnZXIgYnV0IGl0IGNhbiBh
bHNvIG1lYXN1cmUNCj4gY2hhcmdlIChpbnRlZ3JhdGluZyB0aGUgbWVhc3VyZWQgY3VycmVudCBv
dmVyIHRpbWUpLiBBcyB0aGV5IGFyZSBub3QNCj4gc3RhbmRhcmQgYXR0cmlidXRlcyBJIGRpZCBu
b3QgaW5jbHVkZWQgdGhpcyBvbiB0aGUgZHJpdmVyIChJIHNlbnQgYQ0KPiBxdWVyeSBvbiB0aGlz
IGJlZm9yZSBzdGFydGluZyB0aGUgZHJpdmVyIC0gDQo+IGh0dHBzOi8vbWFyYy5pbmZvLz9sPWxp
bnV4LWh3bW9uJm09MTU2NTA3NzExNjEyODc3Jnc9MikuDQo+IA0KPiBJIHNlZSB5b3VyIHBvaW50
IGFib3V0IGVuZXJneSBhbmQgaGF2aW5nIG1heGltdW0gYW5kIG1pbmltdW0gZm9yIGFuDQo+IGFj
Y3VtdWxhdGVkIHZhbHVlLiBIb25lc3RseSwgbG9va2luZyBhdCB0aGUgY2hpcCBzcGVjaWZpY2F0
aW9uIEkNCj4gY2Fubm90DQo+IHNlZSB0aGUgaW50ZW5kZWQgdXNlIGNhc2UgZm9yIHRoaXMuIE1h
eWJlIGZvcg0KPiBtb25pdG9yaW5nL2NoYXJhY3Rlcml6aW5nDQo+IGJhdHRlcmllcyBzaW5jZSB0
aGVyZSBhcmUgc29tZSBjb250cm9scyBvbiB0aGVzZSBhY2N1bXVsYXRlZCB2YWx1ZXMNCj4gKHdl
DQo+IGNhbiBzZXQgdGhlIHBhcnQgdG8gYWNjdW11bGF0ZSBvbmx5IHdoZW4gY3VycmVudCBpcyBw
b3NpdGl2ZSBmb3INCj4gZXhhbXBsZSkuDQo+IEkgd2lsbCBkbyBzb21lIGludGVybmFsIHF1ZXJ5
aW5nIHRvIHNlZSBpZiBJIGNhbiBmaW5kIG91dCBtb3JlIG9uDQo+IHRoaXMuDQo+IA0KDQpRdW90
aW5nIHRoZSByZXBseSBJIGhhZDoNCg0KIkFzIHRoZSBMVEMyOTQ3IGlzIGJpLWRpcmVjdGlvbmFs
LCB0aGUgbW9zdCBsaWtlbHkgdXNlIGZvciB0aGUgTWluL01heA0KRW5lcmd5IHRocmVzaG9sZHMg
YXJlIGZvciBtb25pdG9yaW5nIGEgYmF0dGVyeSBiZWluZyBjaGFyZ2VkIG9yDQpkaXNjaGFyZ2Vk
LiANCkEgbGltaXQgY291bGQgYmUgc2V0IGJhc2VkIGFyb3VuZCB0aGUgYmF0dGVyeSdzIHN0b3Jh
Z2UgY2FwYWNpdHkgc28NCnRoYXQgdGhlIGJhdHRlcnkgaXMgcHJvdGVjdGVkIGZyb20gYmVpbmcg
b3ZlcmNoYXJnaW5nIG9yIGZ1bGx5DQpkcmFpbmVkLiINCg0KU28sIEknbSBub3Qgc3VyZSBpZiB0
aGlzIGlzIGEgdmFsaWQgdXNlIGNhc2UgZm9yIGh3bW9uIHN1YnN5c3RlbS4gSSdtDQphd2FyZSB0
aGVyZSdzIGFsc28gdGhlIHBvd2VyIHN1YnN5c3RlbS4gU28gbGV0IG1lIGtub3cgd2hhdCBkbyB5
b3UNCnByZWZlciBoZXJlLiBTaG91bGQgSSBqdXN0IHJlcG9ydCBlbmVyZ3lYX2lucHV0IGF0dHJp
YnV0ZXM/IE9yIGNhbiB3ZQ0Ka2VlcCB0aGUgbWluL21heD8NCg0KDQpOdW5vIFPDoQ0KDQo=
