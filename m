Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 666D8C433F5
	for <linux-hwmon@archiver.kernel.org>; Tue, 17 May 2022 08:38:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236976AbiEQIiW (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 17 May 2022 04:38:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232605AbiEQIiU (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 17 May 2022 04:38:20 -0400
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2105.outbound.protection.outlook.com [40.107.21.105])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A808665BC
        for <linux-hwmon@vger.kernel.org>; Tue, 17 May 2022 01:38:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ya+3AjDTl/Sa9NGdQCvWgB66VWjocWjfimBeGq956VmUd0u0Gd4aZMjsi91CZnHavuGCj6/EXO5+87XRWzKUQo7nl3TGNi4fMjcfwnD8F0YPAxMkLaEjFAfaiY23rxXVugLMyespwV4krWLy8C6iVcT0vWAXufyGSgu1CBQO8jbu3CAcn54HfoIn/QD9fxRrIM7ckQy9Yst3hbkyxnqL2MyQdxfj2Bu16BqNNJxfzP5gQn1eN0EaZkxyhXRIBIqbtRDO8xgD1/02GHIASvCodd66RO5I9nQ6JJsF2TR5PAafY+vyr2LFnHqp6u81r2kfNMe2V36KGmALFE8Xlut/Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3pxa68pgFH03FhrM2XrEbIPhLbpx+1erxsiPuW5ZJbg=;
 b=lIVMNBSyychQJWnZTWOTZvRjKeMgUn+peS8I9y7C/R4lqcnt4xgByBtRbH7jYXuvBG06wtqNoofN9k3KepKO2PXEA+zlYCGvnwcXYQxOZW0ajM6O7BtjtPDrqPJlC7dEqriNvDfIeYj6t5KC1k8xpszhUS6nfx7SsDX3G6JVHrwyGHRqEhZtc4IW9BrW66dcE2nxH8wK9ECG+JIvhjDYzS6aP2w7Jv8lTVQ5QknNncgsnnxgdwWiXjpFURLWAfD1CLVAxUecY/rreXKNC8S/96Q57j0BWsqDwxagWmu9bQjzRAVRxfHro+wShzrOmZq/Da0QuIkSuQX9n6GKxcWRaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hitachienergy.com; dmarc=pass action=none
 header.from=hitachienergy.com; dkim=pass header.d=hitachienergy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hitachienergy.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3pxa68pgFH03FhrM2XrEbIPhLbpx+1erxsiPuW5ZJbg=;
 b=dbNCDLLiNPO/FRVTKOPQSI1AgcOm1M4IP3IWWyd4CVwt3U4HWwUERexn0IRXPvof9ecxj7sxpRj9MvbVz5CyAka/dQi5K+dGYxbxRq3w2JyXcI1KXYJwu1YCyQSZfTrk7szPv8xcBgIV7aYYyl4sYX+h/4Zpot+OBBLSa3SixW4wcf7iKflCaVF1rFFQLVrbwmSpqAfeZnCh++upi0OHQmGNswMzjSfBQPsuIeyJ4mctegZzr8lTefObuBtAHRtyacMzTcYjr2/Jjih7/uZvmuA+AZAvR73tv7M8XBxwzBp+sEu51kKrGhhK4W7+4pWajZFgYOpscyjgQQ9hovfCyg==
Received: from DB9PR06MB7289.eurprd06.prod.outlook.com (2603:10a6:10:218::16)
 by VE1PR06MB7040.eurprd06.prod.outlook.com (2603:10a6:800:1a6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.13; Tue, 17 May
 2022 08:38:15 +0000
Received: from DB9PR06MB7289.eurprd06.prod.outlook.com
 ([fe80::7015:6796:8a61:93b4]) by DB9PR06MB7289.eurprd06.prod.outlook.com
 ([fe80::7015:6796:8a61:93b4%9]) with mapi id 15.20.5273.013; Tue, 17 May 2022
 08:38:15 +0000
From:   Holger Brunck <holger.brunck@hitachienergy.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
CC:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: RE: [v3 2/3] dt-bindings: hwmon: lm90: add ti,extended-range-enable
 property
Thread-Topic: [v3 2/3] dt-bindings: hwmon: lm90: add ti,extended-range-enable
 property
Thread-Index: AQHYacO1cYkICxoTB06LH1LqErnbRa0iu0+AgAAB+1A=
Date:   Tue, 17 May 2022 08:38:15 +0000
Message-ID: <DB9PR06MB72895A514CDE3E3BB5E46445F7CE9@DB9PR06MB7289.eurprd06.prod.outlook.com>
References: <20220517075703.16844-1-holger.brunck@hitachienergy.com>
 <02062376-86cf-dcee-7560-2edd55ee16de@linaro.org>
In-Reply-To: <02062376-86cf-dcee-7560-2edd55ee16de@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-processedbytemplafy: true
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=hitachienergy.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 43493579-9f60-48c8-0a21-08da37e095d0
x-ms-traffictypediagnostic: VE1PR06MB7040:EE_
x-microsoft-antispam-prvs: <VE1PR06MB704023CD8A3C4344ABF5967AF7CE9@VE1PR06MB7040.eurprd06.prod.outlook.com>
x-he-o365-outbound: HEO365Out
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Vn8kK4gjRWPfOTj+TkWjUWmX4KAktitWjbE5D8SIO2djA/h3vM8+iPEPElCb4qPhT/P5t0+vBzU1Dw5mFOXgHgRHx02pXO4QlY3zQv8z/x8buuWV6wJZ97WgHN93C8udEpUCcE9hOc4AGG9nKLdx6jz0MmnSK0JmF4tLLpxlyuBkF4ksanfnwoU1vdf578nZb51rDCR26iBbeR3ptuJwuu0p0EsL7XiOEDT2HCkRfKRHYdFJsW7/gtKOq7kDkEM2r4fAo0qJsiM5s2FpvsloL2RVT8AM+c5twEU0hpXgG9hBWLZH+rCXjFGvzgHDaT41puTJBjdBaomUeJGdrA7LKTjq/DpjSgv8b5FNz5gVgz14ZTBAxTOmOP37/RR4ZwdMGSPXtHeqRFQuxD+KNLEv78yNB4XgEraNQhYzwLh4QRgIYDtUdp/ssEbDHJ/1Oy/B8TpXiKbFneVpxievK9TOUhLXgZ17UHedhdOLA3EeLqtzriuWrJQyDlCbR1Kv12KnjYbL/tjmVh75PwdAtlDobRpSKT7vdKd2S6fU1rgXoOh0rz8a6RN/e01M5JP4kQtWnpNnhvXbZRv/jiXAaJCSqbCDzVH8pFp8H/S0wIPvLqB9JyON7II9Bfoh94DkK9Kgp1YjxElQ/aS5fgwgqoZr/yIETe2tRJW4iECmV1tZ4thHCLgpOI4QblVrNnaR+J8egXAsUT+nxxc634KDdqRJnQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR06MB7289.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(122000001)(82960400001)(26005)(71200400001)(9686003)(64756008)(66476007)(508600001)(52536014)(54906003)(86362001)(6506007)(53546011)(33656002)(38100700002)(2906002)(7696005)(316002)(5660300002)(186003)(38070700005)(8936002)(66946007)(66556008)(66446008)(76116006)(44832011)(110136005)(55016003)(8676002)(4326008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RmNwM0MzT3ZYbzRPSVNvVHU5b2h1bUp5UDdrN253R0lTR0NLNStDZnkrdGtF?=
 =?utf-8?B?Tmc3T1QxTUNKVmV1SjFzemQxdEdYYXY0L3dNZW8yU1Zjdjg1cWdHeVpVRm9N?=
 =?utf-8?B?cGFtU3FpWDgrUWFQczZYcmZUdDd1K2FDaDNDZ0xJT3oyUTA4UGh3V29mU3VP?=
 =?utf-8?B?VGJLMFc2NDFvNGhEd1NZeWh6d1hhSnl1d0lPS1VwV0d0VUFCR0orTmtGd0lr?=
 =?utf-8?B?bkZ2RDltQ0ppZ3N0dlZZWjVwaDRPYWplUWhhWmxNbFhIblVuQjE0L1Z0OG80?=
 =?utf-8?B?SkZmaXB0M1JydDJtenFUOEg0cklycmJlSmJRZERiQ2N2VUY0YXZ6dzFNNERJ?=
 =?utf-8?B?WFpLN3hZY0JEd2VkUmdoT1lobTNZMUQzZDArMmFqaTZ4Sy9lT0NLNlBaMXUx?=
 =?utf-8?B?NEMxbjcyMDJxaFlKK0sxcW5aeE5BOHNUWjgyN1FDLzBQTUFDV3k1VjM1d2Zh?=
 =?utf-8?B?Y0tMVmFUUFgwOTVJQUl6M3FYeFFOZ21teGpIWmxrVGM4dFdCS0RadDM1SjJS?=
 =?utf-8?B?cDd6T1dEaTdYc1g1OHBXa0N5SkZmNjdqNDBOKzZzQ3RJZkJia2hiNE4wK3hy?=
 =?utf-8?B?Ly90WXpGeWUxRFZoNzg0SjV6RzV2ejFwYnZjNEo5VGxCT0lqVVU0MHJpaUhj?=
 =?utf-8?B?UEhTMTgxdUFnNjNBQlhyM0pKWkUwOXdyV1B3V2VtS1E1Wi9FUGwwNGlFRDF4?=
 =?utf-8?B?dFdMWEpYNTFqUDBBVzFRWnZHNVpqeXFEK0crdnU4ZE9jRGJNYXI3L2h0bEx2?=
 =?utf-8?B?RGZpRFl2Y2dha0lpOTFQV3ZWSjkrdGR2OExZNEh3WEJzaFV2ZkFha1ducG9N?=
 =?utf-8?B?R1hyVnJYWnppK1pENktqeWR3Wko1UFZWWVJ3cU5hYmFQQU04YmphelU2OGpM?=
 =?utf-8?B?VTZRZUh5aGFqUnRvYnZTbnNNblNVM2pkV3Fla29ma01SYXlQWmxxakI4Uk9D?=
 =?utf-8?B?UTRnaFZxMTY1RXdmOWVkcFJuM3ROM3hjbXY1L1FZam8vRlZPM3FEVklxUGw5?=
 =?utf-8?B?L1FKaUs0K1Z0ZlZVTWNyTzNIRjFWb0VITWtkY2I2c3VKOVpBWFBCaXVVdFVh?=
 =?utf-8?B?dFZTR0pSa09EKzNla1FQaW9QLzV2OFNtM2FuLzBuVUs4TDdrRzFqTWMwSjBO?=
 =?utf-8?B?d21sdnNuZFhpN0FWSEw4c3RXbDI0S2dVQUlWSEhSWDcvQ0pTWnBKaDdJcnBM?=
 =?utf-8?B?WGJUeWhBNUJLelh0enhBV29id0h0UGhEUjRwbEtKNllDN1NSaTJFOHF6c2dh?=
 =?utf-8?B?Zm9FeDVUR1dFdFgwL1g5VzVmTFphRGZwSU9vSG5tNFptL2dja2FhRnBta1BS?=
 =?utf-8?B?RTJQN0ZrZXhORXlFc2RPaEEreENIejliSFkxT0RjM1M1dDRjWWc5d1JvSVk4?=
 =?utf-8?B?NzM4RFRWaUVTUlZmR0ZQSlczNkRZeXRrRDNxd2dEMmVIbjduWGtJdC8yR2FY?=
 =?utf-8?B?aUdPOHF1Ymg4UER6TlNOSk9CWnhuNE40c3JaQjNYWHkyNE1SQXR0SzZ0OEcy?=
 =?utf-8?B?RXV5bXdrTFE0TDVWbHlhT3p6a1JKajdDSExaUHh2SVNDNUlUSUx3YVYraXZk?=
 =?utf-8?B?akVtSjRqVmxwKzVFb09XTlBvcTl1ZjRqYkNnSEZxOHlzUnczQit3amxGbDBo?=
 =?utf-8?B?akhmYXJoWm0rM3UwQ08reWdWU1MzNmNYd3BsQVhYNEl1VEpxcWw5ZVBpVjZn?=
 =?utf-8?B?dXdhOUdhcEJyK1ExNnJxRHZEak9Nb0hrVWIxK0EzOE9OWW81OTRhdzVFaG1h?=
 =?utf-8?B?cDJxVndBbzhGU3BaSTY0c284RjQycXVVckRwaGlFUDhGb0VpdkR5MEVLdUZi?=
 =?utf-8?B?Tk1xTDlPUFZzVytwSmJ3eWtlNnVubHNvOVc0Z0ltN1lXbkY5ejZFb0tYZ01R?=
 =?utf-8?B?WVpjZSt3d2JTVlhteFNjc0E5QjV3cWo1TXFtWnNiQ2tGTGNhNDFKN3U4Nndr?=
 =?utf-8?B?UW1rajdnSFZBN0JIM3VraldkRVJXemg0MTZKUWt5MjJXanBzb1ZEVTcrdE4v?=
 =?utf-8?B?NHhsd1UxT3EvUGQzN3cyeFFmZ2N1MzVHUHNQZHhIeTJOOFpoTUZOREswM2VM?=
 =?utf-8?B?eXE5ci9VRC90TTRYZ1Y2d1NVVGFmSjJVaW9wcXlLSWgzYlh5K3I5Mmt1aEpw?=
 =?utf-8?B?bitobm5sN1crTldKV3lsdW9pU0ZKOEdTOHVJRWtEL1Rsa0xsTlArbTJYc1dq?=
 =?utf-8?B?VmtFRy8zb0h3ZDh0RkNjK1h5NmhKK0RhY1RhQzdxYlBDQzF4eWYvcWZ4bGJo?=
 =?utf-8?B?YUlXbG0xYTVQNmEraFo3dWJ2dWFwQ29mZzluOHdycFF1Y3phMzMyZjY5VXlT?=
 =?utf-8?B?TURieGp0MDhOT2JDVmEvQk14MkJYcXJpRkp0OUJMNjRHeUFaU0Q2RlJZSEJR?=
 =?utf-8?Q?h4WaK0lKTys0g0AE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: hitachienergy.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR06MB7289.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43493579-9f60-48c8-0a21-08da37e095d0
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2022 08:38:15.1675
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7831e6d9-dc6c-4cd1-9ec6-1dc2b4133195
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7GVD2/G2tCK1K9B8e6eqjF8TyZb3AeDbY9Z8anP9AYlJcKazoNS3s4vt+nj9YSGqEiTdqxP9vpSLgh+kHP6RYnY6Jz5H1bd26sy7DIWwXCg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR06MB7040
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

PiBPbiAxNy8wNS8yMDIyIDA5OjU3LCBIb2xnZXIgQnJ1bmNrIHdyb3RlOg0KPiA+IFNvbWUgZGV2
aWNlcyBjYW4gb3BlcmF0ZSBpbiBhbiBleHRlbmRlZCB0ZW1wZXJhdHVyZSBtb2RlLg0KPiA+IFRo
ZXJlZm9yZSBhZGQgYSBib29sZWFuIHRpLGV4dGVuZGVkLXJhbmdlLWVuYWJsZSB0byBiZSBhYmxl
IHRvIHNlbGVjdA0KPiA+IHRoaXMgZmVhdHVyZSBpbiB0aGUgZGV2aWNlIHRyZWUgbm9kZS4gQWxz
byBtYWtlIHN1cmUgdGhhdCB0aGlzIGZlYXR1cmUNCj4gPiBjYW4gb25seSBiZSBlbmFibGVkIGZv
ciB0aGUgZGV2aWNlcyBzdXBwb3J0aW5nIHRoaXMgZmVhdHVyZS4NCj4gPg0KPiA+IFNpZ25lZC1v
ZmYtYnk6IEhvbGdlciBCcnVuY2sgPGhvbGdlci5icnVuY2tAaGl0YWNoaWVuZXJneS5jb20+DQo+
ID4gLS0tDQo+ID4gY2hhbmdlcyBmb3IgdjM6DQo+ID4gICAtIHJlbmFtZSBwcm9wZXJ0eSB0byB0
aSxleHRlbmRlZC1yYW5nZS1lbmFibGUNCj4gPiAgIC0gdXNlIGFsbE9mOmlmIHRvIGNoZWNrIGlm
IHRoZSBkZXZpY2Ugc3VwcG9ydHMgdGhpcyBmZWF0dXJlDQo+ID4gICAtIHJlcGhyYXNlIGNvbW1p
dCBtc2cNCj4gDQo+IFBsZWFzZSB1c2Ugc3RhbmRhcmQgZW1haWwgc3ViamVjdHMsIHNvIHdpdGgg
dGhlIFBBVENIIGtleXdvcmQgaW4gdGhlIHRpdGxlLg0KPiBgZ2l0IGZvcm1hdC1wYXRjaGAgaGVs
cHMgaGVyZSB0byBjcmVhdGUgcHJvcGVyIHZlcnNpb25lZCBwYXRjaC4NCg0KSSBkaWQgdGhpcyBi
dXQgSSB1c2VkIG9ubHkgIi0tc3ViamVjdC1wcmVmaXg9djMiIGluc3RlYWQgb2YNCiItLXN1Ympl
Y3QtcHJlZml4PSJQQVRDSCB2MyIuIEkgd2lsbCBjaGFuZ2UgdGhhdCBmb3IgdGhlIG5leHQgdmVy
c2lvbi4NCg0KPiBTa2lwcGluZyBpdCBtYWtlcyBmaWx0ZXJpbmcgb2YgZW1haWxzIG1vcmUgZGlm
ZmljdWx0IHRodXMgbWFraW5nIHRoZSByZXZpZXcNCj4gcHJvY2VzcyBsZXNzIGNvbnZlbmllbnQu
DQo+DQoNCnllcy4NCiANCj4gVGhlbiB1c2Ugc3RhbmRhcmQgZW1haWwtc2VuZGluZyB0b29scyB0
byBwcm9wZXJseSB0aHJlYWQgeW91ciBwYXRjaHNldC4NCj4gZ2l0IHNlbmQtZW1haWwgZm9yIGV4
YW1wbGUuIEtlcm5lbCBkb2NzIGFsc28gZXhwbGFpbiB0aGlzLg0KPiANCg0KSSB1c2VkICJnaXQg
c2VuZC1lbWFpbCIgYnV0IEkgZ3Vlc3MgbXkgcHJvYmxlbSB3YXMgdGhhdCBJIHdhcyBzZW5kaW5n
IHBhdGNoDQpwZXIgcGF0Y2ggYXMgSSBoYWQgYSAgZGlmZmVyZW50IHNldCBvZiByZWNpcGllbnRz
IGluIHRoZSBDQyBsaXN0Lg0KIA0KPiBDdXJyZW50bHksIHRoaXMgcGF0Y2hzZXQgaXMgbm90IHBv
c3NpYmxlIHRvIGFwcGx5IGR1ZSB0byBtaXNzaW5nIHRocmVhZGluZy4NCj4NCg0KT2suIFNvIHdv
dWxkICJnaXQgc2VuZC1lbWFpbCAtLXRvIC4uLiAtLWNjIC4uLiAwMDAqIiB0YWtlIGNhcmUgb2Yg
Y29ycmVjdA0KdGhyZWFkaW5nICBhcyBpdCBzZW5kIGlzIGhhbmRsZWQgZnJvbSBvbmUgY29tbWFu
ZD8NCiANCj4gPg0KPiA+ICAuLi4vYmluZGluZ3MvaHdtb24vbmF0aW9uYWwsbG05MC55YW1sICAg
ICAgICAgIHwgMTggKysrKysrKysrKysrKysrKysrDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxOCBp
bnNlcnRpb25zKCspDQo+ID4NCj4gPiBkaWZmIC0tZ2l0DQo+ID4gYS9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvaHdtb24vbmF0aW9uYWwsbG05MC55YW1sDQo+ID4gYi9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaHdtb24vbmF0aW9uYWwsbG05MC55YW1sDQo+ID4g
aW5kZXggNDhiNzA2NTc5OGIwLi4xYzM5YjFiNDAxMWIgMTAwNjQ0DQo+ID4gLS0tIGEvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2h3bW9uL25hdGlvbmFsLGxtOTAueWFtbA0KPiA+
ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9od21vbi9uYXRpb25hbCxs
bTkwLnlhbWwNCj4gPiBAQCAtNTMsMTAgKzUzLDI4IEBAIHByb3BlcnRpZXM6DQo+ID4gICAgdmNj
LXN1cHBseToNCj4gPiAgICAgIGRlc2NyaXB0aW9uOiBwaGFuZGxlIHRvIHRoZSByZWd1bGF0b3Ig
dGhhdCBwcm92aWRlcyB0aGUgK1ZDQw0KPiA+IHN1cHBseQ0KPiA+DQo+ID4gKyAgdGksZXh0ZW5k
ZWQtcmFuZ2UtZW5hYmxlOg0KPiA+ICsgICAgZGVzY3JpcHRpb246IFNldCB0byBlbmFibGUgZXh0
ZW5kZWQgcmFuZ2UgdGVtcGVyYXR1cmUuDQo+ID4gKyAgICB0eXBlOiBib29sZWFuDQo+ID4gKw0K
PiA+ICByZXF1aXJlZDoNCj4gPiAgICAtIGNvbXBhdGlibGUNCj4gPiAgICAtIHJlZw0KPiA+DQo+
ID4gK2FsbE9mOg0KPiA+ICsgIC0gaWY6DQo+IA0KPiBub3Q6DQo+IGFuZCB0aGVuIHNraXAgZWxz
ZQ0KPiANCg0Kb2suDQoNCkJlc3QgcmVnYXJkcw0KSG9sZ2VyDQoNCg==
