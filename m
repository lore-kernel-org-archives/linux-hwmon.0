Return-Path: <SRS0=UELc=WC=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E1CFC31E40
	for <linux-hwmon@archiver.kernel.org>; Tue,  6 Aug 2019 16:23:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 197382086D
	for <linux-hwmon@archiver.kernel.org>; Tue,  6 Aug 2019 16:23:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=analog.onmicrosoft.com header.i=@analog.onmicrosoft.com header.b="7V+uLbuJ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732531AbfHFQXS (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 6 Aug 2019 12:23:18 -0400
Received: from mx0b-00128a01.pphosted.com ([148.163.139.77]:8304 "EHLO
        mx0b-00128a01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732048AbfHFQXS (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 6 Aug 2019 12:23:18 -0400
Received: from pps.filterd (m0167090.ppops.net [127.0.0.1])
        by mx0b-00128a01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x76GDbTe023165;
        Tue, 6 Aug 2019 12:22:59 -0400
Received: from nam02-bl2-obe.outbound.protection.outlook.com (mail-bl2nam02lp2058.outbound.protection.outlook.com [104.47.38.58])
        by mx0b-00128a01.pphosted.com with ESMTP id 2u7aq4rfet-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
        Tue, 06 Aug 2019 12:22:59 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YluW1M2A2/lRLuPA3aaks9809rZHb2tzdMC55biQj+w3Iv1IlmXygwcr5PV18BEunHDs9NMR3WrhqE3VdjZwE9cxz930N4B+EQDq/Sk5J9wELA+LHgGP22pRCFjICcoFB5w/kF/Oq/DYj9LRdmLVKwDMqTQLd43m1i+NxB4IWlaSAJ+zEUYvJU9wMstUcaXgMFgDqAnhAcJTVVjam5hcDO95QYhcR7WMYr42iQE7Xm60nYh70jAWW23WoXccuxYTrQStmUZbYvx63SMsGUlD6zf2Qi/Zfjiq4iRIMStIdk8lVW40pJvHhQPW8obTrmST/vi/ARPLdEP8M0/LfA6KdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QaVLDpq4NVA2sPw0EocD1d2XauabcvN0FvM+Q9vkTcc=;
 b=OPbqhKA8WMWIEyk2hj4op1jazajGmT7K7djNvtE0OAtwd+TFDpjpZ/IXm7yQOH0lqnBoZXgbjC3oFfxmIgHF8knEmgTwk8P4GAVAMF0h68m5zEXQhYHq6fNFnqQ7Oodh2Yk89AzqC+sU3xB9oT+ZL7se6Qqp+0yD+teX5MdGRhciXJO3YiZKLw3oQeMuL4/WSNtUV0/XdjR8878NsNgYF2Gdz/0Quraf/KLUMXjoSIT3MYNeaK91kcb6PgqRXh2CQ1dCcF/dQQioPLUlohjdf6ulW8Lx4pn0RcyDjO3kecBgHegUBY8+cKFHRsCIJFlcJOrLF27uAbiWU4gQKvYiOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=analog.com;dmarc=pass action=none
 header.from=analog.com;dkim=pass header.d=analog.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QaVLDpq4NVA2sPw0EocD1d2XauabcvN0FvM+Q9vkTcc=;
 b=7V+uLbuJOh41z4HKk3w8UAlUET91xTIQwj9Hmavl2esXje+BLBNVixJfKYXyAJwShlDBwnmFOM6Q6MV1nZtvUHgiNFcq8H8ujVHbw3oevc0XY6qGQrTQJ8sUPeaiThcNs9iUbymhWBYXWieSxxfAnxne8Uo8GbHvH5EQPAF5U6A=
Received: from BL2PR03MB577.namprd03.prod.outlook.com (10.141.92.20) by
 BL2PR03MB580.namprd03.prod.outlook.com (10.141.93.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.20; Tue, 6 Aug 2019 16:22:57 +0000
Received: from BL2PR03MB577.namprd03.prod.outlook.com
 ([fe80::c4f6:bd96:153c:7b5a]) by BL2PR03MB577.namprd03.prod.outlook.com
 ([fe80::c4f6:bd96:153c:7b5a%7]) with mapi id 15.20.2136.018; Tue, 6 Aug 2019
 16:22:57 +0000
From:   "Sa, Nuno" <Nuno.Sa@analog.com>
To:     "linux@roeck-us.net" <linux@roeck-us.net>
CC:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: Re: new device support doubts
Thread-Topic: new device support doubts
Thread-Index: AQHVTCnyPCy7zEg/P0iEkdVZTGov5KbuRwGAgAAHJgA=
Date:   Tue, 6 Aug 2019 16:22:57 +0000
Message-ID: <c4de129c0d9e6e1e79a24b06a214282e82f94afd.camel@analog.com>
References: <80ab6867e69894f34131dbaac4d41ab0a254cac2.camel@analog.com>
         <20190806155737.GF12156@roeck-us.net>
In-Reply-To: <20190806155737.GF12156@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.71.226.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 84e6b2cb-6bb7-4517-2579-08d71a8a57b3
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:BL2PR03MB580;
x-ms-traffictypediagnostic: BL2PR03MB580:
x-microsoft-antispam-prvs: <BL2PR03MB580853C9899CD2DBC1347DF99D50@BL2PR03MB580.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0121F24F22
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(136003)(376002)(346002)(396003)(39860400002)(366004)(199004)(189003)(68736007)(3846002)(5660300002)(102836004)(26005)(53936002)(1730700003)(6506007)(81156014)(81166006)(76176011)(6486002)(7736002)(8676002)(229853002)(5640700003)(6436002)(99286004)(2501003)(6246003)(486006)(2616005)(305945005)(316002)(446003)(8936002)(6512007)(476003)(11346002)(6116002)(186003)(6916009)(118296001)(256004)(5024004)(3480700005)(71190400001)(71200400001)(64756008)(4326008)(66446008)(66556008)(66476007)(36756003)(14454004)(2351001)(66066001)(76116006)(25786009)(66946007)(2906002)(86362001)(478600001);DIR:OUT;SFP:1101;SCL:1;SRVR:BL2PR03MB580;H:BL2PR03MB577.namprd03.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: analog.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 7egrNM+YtAvg2nU8+Mfs9d3JB94izRrxQQtLx+6wL5LV8OTcRKci9pOE1fusVgoEzut6DbGFRbhZuB7PidDRcBHNjqRFQOCjQGcdeA8yVo9bcRzcW/ekfWXnVOreb3ZxRg2pfnNNIz9NQFjhwSiw7sOgfrdUUf8VbC2ufK0Jm1ABA5bobeWKwuSurAt7qP525Zj/UbjYImJNovFnhdhL1nkhB3o9uAJaseenfPLeWktWBx9AAuNUXQ+dBhEFu1E4j77wZFERk8YhIkaznP1ejcjeZ9vpQDJpzaItGu/3kmEN2Ww5zRk1vmSmpOrvUaojI1KsntV/gSO4+pt45LiXRmb1k0O5CaUvjp22tebm8Z3UpPIwdrRbK51vKcctIl86vKD27Etk3axQRND8ujnkGd9eZJvJLqkSny5m8hlbyY0=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C69B944B55F51547B656125F8423BFFB@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84e6b2cb-6bb7-4517-2579-08d71a8a57b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2019 16:22:57.3930
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Nuno.Sa@analog.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL2PR03MB580
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-08-06_09:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908060153
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

T24gVHVlLCAyMDE5LTA4LTA2IGF0IDA4OjU3IC0wNzAwLCBHdWVudGVyIFJvZWNrIHdyb3RlOg0K
PiANCj4gVGhlIGh3bW9uIHN1YnN5c3RlbSBpcyBub3QgdGhlIGFwcHJvcHJpYXRlIHN1YnN5c3Rl
bSB0byByZXBvcnQgY2hhcmdlDQo+IGxldmVscw0KPiAobWVhc3VyZWQgaW4gQW1wZXJlLXNlY29u
ZHMgYXMgZmFyIGFzIEkgY2FuIHNlZSkuIGh3bW9uIGlzIGFib3V0DQo+IGhhcmR3YXJlDQo+IG1v
bml0b3JpbmcuDQo+IA0KPiBJIGFtIG5vdCBpbiBmYXZvciBvZiBzdXBwb3J0aW5nIHNpbmdsZS1z
aG90IG1lYXN1cmVtZW50cyBpbiB0aGUgZmlyc3QNCj4gcGxhY2UuIE1vc3QgY2hpcHMgc3VwcG9y
dCBpdCwgYnV0IGl0IGlzIGhhcmRseSBldmVyIHN1cHBvcnRlZCBieQ0KPiBkcml2ZXJzLA0KPiBm
b3IgdGhlIG1vc3QgcGFydCBiZWNhdXNlIHBvd2VyIHNhdmluZ3MgYXJlIG5lZ2xpZ2libGUgYW5k
IHRoZQ0KPiBkb3duc2lkZQ0KPiBvZiBzdXBwb3J0aW5nIGl0IChwcm9ncmFtbWluZyBjb21wbGV4
aXR5LCBkZWxheWVkIHJlYWRpbmdzKSBpcw0KPiBzdWJzdGFudGlhbC4NCg0KSSBzZWUuIFRoZW4g
SSBndWVzcyBJIHdpbGwgKGF0IGxlYXN0IGZvciBub3cpIGRyb3Agc2luZ2xlIHNob3QgbW9kZQ0K
c2luY2UgaXQncyBqdXN0IGFkZGluZyBjb21wbGV4aXR5IGFuZCBJIGFjdHVhbGx5IHRob3VnaCB0
aGUgcG93ZXINCnNhdmluZ3Mgd2VyZSBiZXR0ZXIuDQoNCj4gV2hhdCBpcyB5b3VyIHVzZSBjYXNl
IGZvciBib3RoIHJlcXVpcmVtZW50cyAocmVwb3J0aW5nIGNoYXJnZSBsZXZlbHMNCj4gYW5kIHNp
bmdsZS1zaG90IG1vZGUpID8gQm90aCBzZWVtIG11dHVhbGx5IGV4Y2x1c2l2ZS4NCg0KSSBkb24n
dCBoYXZlLCB5ZXQsIGEgdXNlIGNhc2UgZm9yIGNoYXJnZSByZXBvcnRpbmcuIEkgd2FzIGp1c3Qg
YXNraW5nDQpiZWNhdXNlIHRoZSBkZXZpY2Ugc3VwcG9ydHMgaXQgYW5kIEkgc2F3IGl0J3Mgbm90
IGEgc3RhbmRhcmQgaHdtb24gdHlwZQ0KKGFsdGhvdWdoIGFsbW9zdCBhbGwgdGhlIG90aGVyIG1l
YXN1cmVkIHR5cGVzIGFyZSkuIEJ1dCBJIGd1ZXNzIGl0IGNhbg0KYmUgdXNlZCB0byBtb25pdG9y
IGEgYmF0dGVyeSBhdHRhY2hlZCBvbiB0aGUgbHRjMjk0Ny4gU28sIGlmIEkgZW5kIHVwDQphZGRp
bmcgYSBjaGFyZ2UgYXR0cmlidXRlLCB3b3VsZCBpdCBiZSBhICJubyBnbyIgZm9yIGFjY2VwdGlu
ZyB0aGUNCmRyaXZlciB1cHN0cmVhbT8NCg0KVGhhbmtzLA0KTnVubyBTw6ENCg0K
