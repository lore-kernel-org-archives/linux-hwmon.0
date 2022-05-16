Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 791B0C433F5
	for <linux-hwmon@archiver.kernel.org>; Mon, 16 May 2022 09:16:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229884AbiEPJPz (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 16 May 2022 05:15:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229849AbiEPJPy (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 16 May 2022 05:15:54 -0400
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (mail-eopbgr20117.outbound.protection.outlook.com [40.107.2.117])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 964416540
        for <linux-hwmon@vger.kernel.org>; Mon, 16 May 2022 02:15:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DIZJoPPT5EpmSaB5A0R1Tj0YXLQCAIaPWYjAavdQ4uOgytIw9XJ3R8HQVBPv/ztzZqzbGIPyH2cezvf1jUhfz+yp/RUk61rHOYumFB6BdN7/cSDAmPn5SkBhZj1HXjpAzlHKKysejVwuCXpGrsc7Wj2tFaiqpK2tGvSuu0pjOA4VECEGxn5/FXlvFtPCdNxkdMJzMEf1B9MsgWkpfdLkAecAMWIa7koyKyHFzmF/6Z0aU2L5aYRsj4sbIBM7BCaj4tMYIeGgV8wPZ5SvqHApBtH0XstETAwEvZ8rPr/QxHdNCHfNaUcm+90eqq5yqeV7t1NqOTWxLUgZWmiWoMPKYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bbDp0ACK8rwh/fiel4I2X72DkSwGWi8qiLiuA7t7ThI=;
 b=B4KqQsc0fTiJKWZ0oScDKlE1mf1U5+W2zhyiKB277/Ezc4aM5uoQcJtiFgEgDDd8SuL+J3kwa2z4LkyYYVf5RGgLYonJRfJkHXkB249h8Jefbrmo9vDwUikgEPztmg0E+qGzm43DSzA/eaChGEiEjuWlZsUo3SUjsCNJsCqi51L+7cdOFbX2pgsWguOcqd4+ItgEzvKeBmZAD+OT0lJ7xDK6Mn81+8C6aDE/MdP63Rbm97jSwJGaCQUaeoxYrwc+06gGjEjpyNbYQQJfIA5EeTpQ9PLfAxwWItH343mj871v32sBCgu8uwy48mJvRglUPDtaBDEbGis5nzkqwOpCzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hitachienergy.com; dmarc=pass action=none
 header.from=hitachienergy.com; dkim=pass header.d=hitachienergy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hitachienergy.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bbDp0ACK8rwh/fiel4I2X72DkSwGWi8qiLiuA7t7ThI=;
 b=gcS2qKlGLOG838r4j2PNHBnbECd5oaK5Wy7lzuX8hrsAuXtl56C2thUO8dfqtH/5AmaTyaDnoQUBpsrgCVnUA2aDKj93s2SZDme7WMjnrWi9u9UdBOCn2IMqPRCWy0nEE0QAYLOKLm74RPNR/MDrsD94gxmMy8DQiwUKSb04YnNbt82p1jeDINej00GPmyBF914AL7BmVxcht9W/lzP6FYZGIYKFRoLX1F7m7Xc8pEmIJOe/JcBTaAmuXqFXrChlf/xRp7rDTJ0wtNWJevzo/8ZFYJ8OZdypofjDSsxu87zTdctZTSqTQhyTWU5Gh75+osq6Qu2WyICfJun9Tg16sA==
Received: from DB9PR06MB7289.eurprd06.prod.outlook.com (2603:10a6:10:218::16)
 by AM8PR06MB7617.eurprd06.prod.outlook.com (2603:10a6:20b:36b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.13; Mon, 16 May
 2022 09:15:50 +0000
Received: from DB9PR06MB7289.eurprd06.prod.outlook.com
 ([fe80::7015:6796:8a61:93b4]) by DB9PR06MB7289.eurprd06.prod.outlook.com
 ([fe80::7015:6796:8a61:93b4%9]) with mapi id 15.20.5250.018; Mon, 16 May 2022
 09:15:50 +0000
From:   Holger Brunck <holger.brunck@hitachienergy.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
CC:     Jean Delvare <jdelvare@suse.com>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: RE: [v2 1/2] dt-bindings: add extended-range-enable property to
 lm90.yaml
Thread-Topic: [v2 1/2] dt-bindings: add extended-range-enable property to
 lm90.yaml
Thread-Index: AQHYZEU3zpQV6drY0Ea7oC4hNpHHEq0Z0AIAgAAYkQCAAAXggIAABV2AgAAERoCAB0l6sA==
Date:   Mon, 16 May 2022 09:15:50 +0000
Message-ID: <DB9PR06MB7289FE0306B5E021321B6FFFF7CF9@DB9PR06MB7289.eurprd06.prod.outlook.com>
References: <20220510080900.22758-1-holger.brunck@hitachienergy.com>
 <34d88cd9-2bcd-77e6-8cc9-93b8cbd63a8f@linaro.org>
 <037b551f-1781-321a-1984-117d098d980d@roeck-us.net>
 <b895f874-c8b8-3889-c7c9-0c0494e9bae0@linaro.org>
 <85d1ed0b-1e1f-bee7-9b0f-fbbf50921ad0@roeck-us.net>
 <15cb434a-7a64-58bb-083c-fa7aeacae672@linaro.org>
In-Reply-To: <15cb434a-7a64-58bb-083c-fa7aeacae672@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-processedbytemplafy: true
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=hitachienergy.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b10c52d6-e1e4-4af1-0cdc-08da371cab6d
x-ms-traffictypediagnostic: AM8PR06MB7617:EE_
x-microsoft-antispam-prvs: <AM8PR06MB7617DFA7609250EB4F47F632F7CF9@AM8PR06MB7617.eurprd06.prod.outlook.com>
x-he-o365-outbound: HEO365Out
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: s35wRyrZsIeKcR+XuYWfNnB8PSzNO/l0RzmS/bVkdKpM2F7fjJRQpawResEE65KlxiTGzpChc2apq/JMzinGWGjjEePk7DWevLb0mMOEKvqeL74NbAQLWIZuA9/JZXLVoRKIunVpvk+Z/8PqGaFOk4q1VBGu3IxE1NLofQJPpIOo3d8QAqVV9ladRUmatambdB6ay9oS0eei2HCf7aGOPGbJjdlM1Jnr4AywQtvq64uhdlme1DIB7zL69BNvOrwb36Is/iHDli36qH0uJrwssaO9zokchG86kM6uA5aC0QOYj6ZchSAyayXILI3ud2Tq9GBqJEyQaak18pkbMQokFoLDPXjIDOlNTPXxwiHTbI+c7G6oRGjxM6BkBqsAVBI+RgjoTmrpyqYCg+vJQ7iz9wP483qM88liC0p4VA/S9nm7ofITKhCqS7vDLisEH7pfNsTYTjla/HfSy998o8Bjg+gZWbUb9D3Ulgppi20URcH5fGb6gmX/q/zrAnVRZaK931QtPxlHQr9S/AFZut/ckPeIzm6WddHck9IvvkMq2I5b40KS4ZqCX0f1BpKU/coahr4r7YOamS4MTuwev2TPBsD2CEM+z80H/KP4zQh76bIfXFGYp290jwbdVEDJvoHByH1iwmoAmWfoiR2arm8paZGmc91nyQRIgHgET7xX0FH6ZsG4CuP7GnERweirHojhZcvhXxW+AP0PkGfORphH/Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR06MB7289.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(83380400001)(71200400001)(186003)(316002)(82960400001)(52536014)(86362001)(44832011)(122000001)(33656002)(2906002)(54906003)(5660300002)(26005)(4744005)(110136005)(55016003)(8936002)(4326008)(66476007)(66446008)(53546011)(66946007)(7696005)(9686003)(66556008)(508600001)(38100700002)(8676002)(38070700005)(6506007)(64756008)(76116006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZUNMRmRGRUp6SXJldGVadXpUMVJmaEU3MVlJeThMTEVCdmNUOWNoOHdtN1Q0?=
 =?utf-8?B?bzhvQmo4b3RLYWhWN2tNLzdXdTcyZk9EcjZRUjlXUVkvcVhsWWFxcDJGZHZx?=
 =?utf-8?B?UVFUeG54U0haM0VSYVlIRkk5YzlCQzE5SVR4cTNDM2ZES2pxdmk1THZRa0RK?=
 =?utf-8?B?bVg5OTYwamNoNmpTS3p0ZGdMamN4L0FIV3NLd0pXQXNHa3RpekRqSWhqd2VS?=
 =?utf-8?B?UHljTmg5YU9kV28zMlR5dGk2YndxYmxRM0NnVUlvbDM5dHFOT2pvYkJUMUZE?=
 =?utf-8?B?cFVueEdiU3RJaytuM2EvakQvVVd5azFXeUNlTFJ2M3JlZHpyc1R4c05LaVlq?=
 =?utf-8?B?N2RWSkRGZDBjU1Z6QUtkalN2VUVmODdKakl2aFhCS3VNMHkzVm0vUVQ3WUs2?=
 =?utf-8?B?QnNwVnI4MDhqUWpNK2FMeDRMbWJFUmdnWm9IZzVvSkNGTkJDajU2SW5jZkVS?=
 =?utf-8?B?NkxTZkNHKzl3N1lXZTBseVI4TTVScU02UXFzQVNxVzdNYmx3VWZUcnhUM2th?=
 =?utf-8?B?OUpWdmFHWnRRYVJuOUxvbHJZbGNFclZONU0wK05MbVl4Y3VoVi9lanRIdlp1?=
 =?utf-8?B?b2NKTG14UWR3REY1S1phckJTTEFhSkZVSVlmT28xZnk4a2ZvbUp6ZEtzdXlE?=
 =?utf-8?B?RXVCeVVWOVdzOWxWV0VaUjFsL0VTaGJwZ3d5RzlaVFpOQUdydUFncVdtM1JL?=
 =?utf-8?B?YXFhTHl4UGJ1RVoyYnMxam41YzFlTnNiWElQa2ZTL3l0aEg2Qm9yUFFlTnFu?=
 =?utf-8?B?UDVLZmZRWURCcERLRjBMRXF3SmpYdHZTdTV5dW5rQmZzaEo1RHRIdjdQKzE1?=
 =?utf-8?B?OWpzN3JPSVU0Q3pZME8reDBaMGI2UEl3by9idk5ZNmNYMkxRTTR0MnUxaXdP?=
 =?utf-8?B?eS9PS1RGMVpkb2dRc1dlZHNCdEZROVozR0k0R3JSSEZ5ZG1DWDJ2TVhOMjFF?=
 =?utf-8?B?aUlVaGNGOVUwS3BRTS96YnphbVpiVEdtT0RxQXpTeUxGZm4rWVpzMG4wMkdD?=
 =?utf-8?B?SExzeEM5NFdxeHhtNXJIb01xYVI2Y09RRVBIUGlzd2QrenVaK2dVazlzbDlL?=
 =?utf-8?B?S2lKU2Q4TE1kVmRkMDJNcUlZUlV2RVhvZzZPZ3BZQkhFWjFXNEUrblJYYkNJ?=
 =?utf-8?B?L3cxWXlyNVozR3BXb25MWGpHM05wVERqUk1HeS93bVRxdHU5cWhwSVFhN3Bk?=
 =?utf-8?B?ZU1QSmZDcTAyTU1yR3B5QVh5cmdtblJaUDBYZnlhV1QyU3I5WUx1YXIwcTQr?=
 =?utf-8?B?dVBzMCswL2lWa1ZTRmd5ZmpGRGJHdlY5cDB6TXVWbmgrYUVSbVlLT2pDT1No?=
 =?utf-8?B?MXNIQitoUDdRaTdRcGNheUdOWGJpNTFzTzJmem0vTG1wVG8yTmM4Rkw4TGJz?=
 =?utf-8?B?QWNtaUJOM1MxWW8rNzZCMk5zRUhNbDhRK3JUbVU1ZGRyRTZjcE9QdkRyK0pm?=
 =?utf-8?B?VzlTeW96VTFiRlVOMDMyRVh5VVg1SjRseDUvd3F6Qlh1clJGZmxZbFRkQTY3?=
 =?utf-8?B?VzFYM3l6VWlQeTdVZmUwTlNvRHF1Qm53dlpxZ2UySWI0SzNDZW5PRnJzUjRz?=
 =?utf-8?B?THc5SUVPbi9rckJhdEJ5MHBTZkRRRHExeHEzTDg1TWFKRXRRUGZkbnNlRzJM?=
 =?utf-8?B?WW5kYndOUjZJWXBpZ1JIRDQ1ZERwZ3NscktNcC91WWpGekgySVU2eHVZUXc3?=
 =?utf-8?B?dmoyYkpGYlVOK3pLMWppS3dPZzV5Z0ZjV1VFNmxnU2FadEllU2dlWjgrSzd4?=
 =?utf-8?B?dzRCMXRNWHdvNGtIaDhlTm1aWFV0c0k2QWNTS0VZQnpEWi83YmQwVm5sc0Zo?=
 =?utf-8?B?UytYTytFUHBPcGJhUUdkTGpUb2ZqREdUcXN6TGQvNHF0N0g5bVdoL3VUTjlz?=
 =?utf-8?B?d0h3ajRQZnNmWUxDbXFaSUovR0ppc1ZKVkY1Snppb1lqY01UZG40endBWHZn?=
 =?utf-8?B?K1Z4amxyQUg2VnNKMmFEelZNQk9uaGF5UGNlekJIcE9sWHA1RUxxRFpIamMv?=
 =?utf-8?B?UWphWm9BRUVsbm5VcUpTMiszREpqYlZOYWtSdlN6dmtxeVc4ekkxS2U0Sjk3?=
 =?utf-8?B?Tjc0ODAyOHI0Z2JkeHZQRGFIVjJONW15NEg2MWRBYy9hY0ZJM3NvTUZGT3h4?=
 =?utf-8?B?YTU0aS9tQk9zSzBWOVB4ZFhvdEVMQXpRT0YvV0V6Y3hUeTZ3MXhPNG9ucVlz?=
 =?utf-8?B?RVQ1QzZSYlFLdkx4UVl0dXFDclFpTmNabnZ4NStjdGhGZnR1bmZmNkh3RjBX?=
 =?utf-8?B?d1pwNGpjK2NMbko5YzZRVTJmYVdESC9WdmpVYmhZbDI5NGl5UVdXczJqUExR?=
 =?utf-8?B?R3dUc0tvZDVyWlI0dDNIVzcwRlo5WlNHOUdubnFXNk5nWEVJK3Y5bzEvc1V2?=
 =?utf-8?Q?zSIECK0jV72Ld8+s=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: hitachienergy.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR06MB7289.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b10c52d6-e1e4-4af1-0cdc-08da371cab6d
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 May 2022 09:15:50.0540
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7831e6d9-dc6c-4cd1-9ec6-1dc2b4133195
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GluPunSm7OfE86A37dy7WeOtDIvCrXrk+4weHz+8LvUEAtzM7uHfeGTCuUYGaLQ3Cpc9q0KsPzqNSFuyLF35mJtiUg/rZL6BBtTGhQ9Noe8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR06MB7617
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

PiBPbiAxMS8wNS8yMDIyIDE5OjQwLCBHdWVudGVyIFJvZWNrIHdyb3RlOg0KPiA+PiBNZSBuZWl0
aGVyLiBKdXN0IHBpY2sgb25lIG1hdGNoaW5nIHRoZSBkZXZpY2UgYWN0dWFsbHkgdXNpbmcgdGhp
cw0KPiA+PiBwcm9wZXJ0eS4gSWYgYWxsIG9mIHRoZW0gYXJlIHVzaW5nIGl0LCBob3cgYWJvdXQg
a2VlcGluZyBvbGQgIm5hdGlvbmFsIg0KPiA+PiBvciBpdCdzIG93bmVyICJ0aSI/IElmIG5vdCBh
bGwgb2YgdGhlbSBhcmUgdXNpbmcgaXQsIHRoZW4gdGhpcyB3b3VsZA0KPiA+PiBuZWVkICJhbGxP
ZjppZjp0aGVuIiByZXN0cmljdGluZyB3aGVyZSB0aGUgcHJvcGVydHkgaXMgKG5vdCkgYXBwbGlj
YWJsZS4NCj4gPj4NCj4gPg0KPiA+IEl0IGlzIG9ubHkgYXBwbGljYWJsZSBmb3IgdG1wNDUxLCB0
bXA0NjEsIGFuZCBhZHQ3NDYxW2FdLCBzbyBpdCBsb29rcw0KPiA+IGxpa2UgImFsbE9mOmlmOnRo
ZW4iIHdpbGwgYmUgbmVlZGVkLg0KPiANCj4gWWVzLCBwbGVhc2UuDQo+IA0KDQpvayBJIHdpbGwg
aGF2ZSBhIGxvb2suDQoNCkkgbm90aWNlZCB0aGF0IHRtcDQ2MSBpcyBtaXNzaW5nIGF0IGFsbCBp
biB0aGUgeWFtbCBmaWxlLCBzbyB0aGlzIG5lZWRzIHRvIGJlDQphZGRlZCB0b28uIFNob3VsZCB0
aGlzIGdvIGludG8gYSBzZXBhcmF0ZSBwYXRjaD8NCg0KPiA+IE5vdGUgdGhhdCBub25lIG9mIHRo
b3NlIGNoaXBzIGFyZQ0KPiA+IG9yIGhhdmUgZXZlciBiZWVuIG93bmVkIGJ5IE5hdGlvbmFsLiBH
aXZlbiB0aGF0LCBtYXliZSB0aSB3b3VsZCBiZQ0KPiA+IG1vc3QgYXBwcm9wcmlhdGUgPw0KPiAN
Cj4gU3VyZS4NCj4gDQoNCm9rLg0KDQpCZXN0IHJlZ2FyZHMNCkhvbGdlcg0KDQo=
