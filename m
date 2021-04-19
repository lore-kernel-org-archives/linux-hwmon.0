Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 043FDC433ED
	for <linux-hwmon@archiver.kernel.org>; Mon, 19 Apr 2021 16:30:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C7FFD61246
	for <linux-hwmon@archiver.kernel.org>; Mon, 19 Apr 2021 16:30:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230063AbhDSQac (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 19 Apr 2021 12:30:32 -0400
Received: from mail-dm6nam11on2086.outbound.protection.outlook.com ([40.107.223.86]:13921
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229666AbhDSQab (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 19 Apr 2021 12:30:31 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KEMsh+uyiV3NwfdG1U/Ea1yVFDeWYgeOIIdf1Xg2JB/1AS5ol85oyfJ08lvbnVI0p1AvNHDGQyvUlNPT4RuW/5lwKddLoFzqFhzLgzZjl5q3CcuMKBNw/Jsy3n+m83fmSMLz3ea0/9hozb4X+H48Ti2GjOKQtCfXYBnaAn1fCpI50C8wtfkY75kozHJmH2RHwSVHbC8q2dgbYfZOaTQG+0A0lCIjYe+2h/k87ejjfx0wN6rfFn8ZntXm1GMt24tLt34WlQuBdXQrWBDdkiiBTBE0V8b9hAIjmiqkxoB8UvHSQ4xAAvpC1alkhjutsx/V0dCeIW8d4cw5wYOHkGbUhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0zqYTUj27/ky7OGQfkQS6OtjU5Eb6gVWlWsKUIcActY=;
 b=TYgfCRsK0vDudiVWgvgx+Ye2MCBaxcBE1Tnvp18O/otBTg/tbMdOW5B2+BNqKJRUg7zbjMJpbPVoo3hj9fjdzUnzpPwVWAbsG3gSjpvFOMFIyFbvKj9xAMX/Fir9+ZLKEwJft8oAwALwNawy8RCrSD1kxIbql4AkFaBJ17VKM4/xOCgURUeCFTPZlUsS5jLge2xpf4DEnCI8knNEDDUZ/406eEUHsQJzVeFbiwFe4N1MMdN0sOx5D/bDEMyD5O5/I04GOowLoEdLBa4psJwlWu9AwqgWzqaD4rdlRnrEyys7KbphKr4llp9LmvSq18koQcNsUXvZLzIuxLlKPa/KDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0zqYTUj27/ky7OGQfkQS6OtjU5Eb6gVWlWsKUIcActY=;
 b=ny74erYFr1Gu651+7oczXgV3KYiVxlI1RWWvxtzOOb8aAPHQOookdgh5L+x2er1UDzShHhP4qNlG5mOjQ5E2YMorzfiM4OYNdy6yQyYK8cisqwl/XeR/IoqecrYLCdP2g6Mfg+FBol6svFipIxk1tgQlsKmg2x1xej9a2nz2GsM=
Received: from DM6PR12MB4388.namprd12.prod.outlook.com (2603:10b6:5:2a9::10)
 by DM5PR12MB1545.namprd12.prod.outlook.com (2603:10b6:4:7::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.21; Mon, 19 Apr 2021 16:29:59 +0000
Received: from DM6PR12MB4388.namprd12.prod.outlook.com
 ([fe80::9030:4dbb:df11:c961]) by DM6PR12MB4388.namprd12.prod.outlook.com
 ([fe80::9030:4dbb:df11:c961%4]) with mapi id 15.20.4042.024; Mon, 19 Apr 2021
 16:29:59 +0000
From:   "Chatradhi, Naveen Krishna" <NaveenKrishna.Chatradhi@amd.com>
To:     Guenter Roeck <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.de>
CC:     Hardware Monitoring <linux-hwmon@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: RE: [PATCH v2 2/2] hwmon: (amd_energy) Restore visibility of energy
 counters
Thread-Topic: [PATCH v2 2/2] hwmon: (amd_energy) Restore visibility of energy
 counters
Thread-Index: AQHXLWig7HzrisESBk2FgaLUdUffuaqw06gAgAAg6YCAApPLgA==
Date:   Mon, 19 Apr 2021 16:29:59 +0000
Message-ID: <DM6PR12MB43888DFB5A7FD52DE4D4433DE8499@DM6PR12MB4388.namprd12.prod.outlook.com>
References: <20210409174852.4585-1-linux@roeck-us.net>
 <20210409174852.4585-2-linux@roeck-us.net> <20210412142744.54c55d06@endymion>
 <797392a6-2d45-2755-7de6-b58ed26c5a50@roeck-us.net>
In-Reply-To: <797392a6-2d45-2755-7de6-b58ed26c5a50@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=true;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SetDate=2021-04-19T16:29:52Z;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Method=Standard;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Name=Internal Use Only -
 Unrestricted;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ActionId=1ac3e235-3ac6-4edc-98a6-5dda2cd8c604;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ContentBits=1
msip_justification: My manager approved sharing of this content
authentication-results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=amd.com;
x-originating-ip: [49.207.193.20]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0314b060-4d89-4cb4-3994-08d90350602c
x-ms-traffictypediagnostic: DM5PR12MB1545:
x-microsoft-antispam-prvs: <DM5PR12MB1545933D6ABD50ABB31A1934E8499@DM5PR12MB1545.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XtbDLvNm1o6gb5RRI+IbgcLpdktWtyyua2oBATw8M5gCpHAVwzTlZgVpZMrHtZBr27YZm3UcH7WorEbOAL8q42ZyO1Nx7yHcTyTdgF6Xfo3vAyyHmMfa52xjXFI2EZCr9KnyUDACuqmFDo9eIdUsWPmayWN2rl8C65yVFeLqejZUGEqaIgbG1sad7Oc04Zc5KiJ5bdHnpE7sfmMCYL+cEw38Dj4Ar7OT8RDWH52E6s8Tz4nUqWNolhbaVempzE61ZlbU0cIFl6VtZkHEU55GzvufrSqUicIJ5+/ZPVGpGYwwb52bVynDmnelpB/6wVJW2uVyQLtmdSrNkAflbG0zgWdSgZ9tuA1A7n5Mor3cQb/arKKUyW4BszMN8u5nrzZknmOUCRLd5ewZgyWAB8AwZw0JJgWD+I3Y1xt3l4I2i+unoyv88GqXavDjDiQsYB4DE1fcJeigoiIrxPZmr5Mx7qx5pkro/+UirHF+DUpr6ci8altGmsJt7d3Y1ewHmXxhYwqdte0L0JJG5/gM9REuf9f+eAFQDI5NO64DDGYSfRBz8wL73SSzWvougpBbz+c6TqYmE/FgpWkQBcRuoykRiYuOmzOQysRovqXcvRCGXcE7kUPOvyEDSAEw3zyb2Whg05AwX8Ov8OVoZ/8yXC39L2m72M9A9n5tzkbBJhf26H6JerJuulH/4DppYIBMx30k
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4388.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(396003)(366004)(39860400002)(136003)(71200400001)(86362001)(54906003)(478600001)(66556008)(66476007)(64756008)(55016002)(76116006)(4326008)(2906002)(53546011)(55236004)(66446008)(7696005)(83380400001)(26005)(6506007)(66946007)(966005)(38100700002)(8676002)(33656002)(5660300002)(186003)(122000001)(9686003)(316002)(8936002)(110136005)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?YS9qZHdVUTNuMGJQT3luM2xtZHpJVWIyWkpFVDJoN2ZldkR5eDF2Q0RVek9K?=
 =?utf-8?B?VU9jeTQ5Q0ZlZVlZb1FOU1ZFT3lwZXp5L1o3QWt0cDJrSlVzTkJ0ZldpdndU?=
 =?utf-8?B?TUN2SXZJT2NrT1lpN1A1VjdsS1c4RTdua3h3WEFZVHdsMmRCc2dDOEV6Tk8x?=
 =?utf-8?B?d2xOcTNabjZpQ0pQY0d5blJTaEFmb0FuUEFmeFF4a2FISUtNcTZCWDV5cWhU?=
 =?utf-8?B?S0Z6VzNQMUZPUjNTNXVsTTkraURoWHdLK3haVGhuRElDTEpnSUt3czdmbm85?=
 =?utf-8?B?b2NvcmNialRHMEFDSnJDQlRQSDUyalEvTEF3QjBLdGU3UXRwNlF0ZXYxWGFv?=
 =?utf-8?B?d2liSDh2d0F5ZDRvWEhyeWdZYmlnV3ZKbEhia2lFWS9HMDRaUVUrdUN2MFRU?=
 =?utf-8?B?dUlMdnR6QmQySEF4VWYyVzFyVkRqYmg3YXowUTNZSzlVdmZ1bkRocEM5RFYv?=
 =?utf-8?B?amFMOTBmdnZ3WmNlbnlyQVc1SGVVRWNmS04vT2d1RFhjQzlRWGxyYUlWeHlH?=
 =?utf-8?B?KzRPUVpYU09KMVJKalJEL01hNWZPaVRVOWpwQWZ6M3dnVUZocjRUNWRHTnpB?=
 =?utf-8?B?Y2YzcXU2VnVFRWNjUmdJR3JUTWUvNUVKc2hHRC9oZi83MnpzejRJbnFqMVFo?=
 =?utf-8?B?MWM2K29mTGpmcDVNMkMrazByeEt2USsvekNlRUFIMXc2dWZJSXN4R3lkTEM0?=
 =?utf-8?B?Sk51bndFRzJsYkI3MUlOcU1NYlRiRk1QZ3lKZVowSnFoaGVFL3dyQ3hTa21Q?=
 =?utf-8?B?WWRqbWdzWnRZOVVPNXpIT2h6UXFDSkpxai9jVE50UGdtSHhGUk1oWXg3Mndl?=
 =?utf-8?B?Qi9ZRWlpM2lLNEV0aUUzZ0NXc0JMSGRzR1NRTml1U1dFVnFGNmxoakhNYjR5?=
 =?utf-8?B?eTEwck05VmZ3RmJQWmVoaEVPZW02cXVUaEtlRFNGRWNLTlFldW12aTZuL1Na?=
 =?utf-8?B?QTZRdGlvYUJQQzBsK2pDaFF6SVhjdDgxeTVsMGUxeHBLTlZ3bGR0RUNXcGNV?=
 =?utf-8?B?d3JFdUJYemVJSmo4R2U1ZUdFZnBRODkzQlRINi81NGdxS1RiMUwzLzZ4VzNx?=
 =?utf-8?B?Rm12MGZRcW9DLzNmSkwzSXczSklDN0srTzZyMmozWTdiWUtMa2tCQlcwelVT?=
 =?utf-8?B?NEtQV3pubmpmZGM1SUo1ZkcySXJCa1d4S1hQRi9SYnNtM0ttQVAxbTI4ai9T?=
 =?utf-8?B?eFhYbXlhdmdtd1dxTkdyM25LQlpGZXVGK3hRYlpZMWlPbnY0dnVKMDAvWk5W?=
 =?utf-8?B?TTV4cWNSb1huRDdSdlk0Y1ZiSnZzekprTzNWMnFaUmlrSjB3WHRkOXBVUUVM?=
 =?utf-8?B?VDFHNGhIMlN4RkFkcGZzeTJtOFNYZHlERVQ0dHdGOUR6VzNjN09PVmhWditr?=
 =?utf-8?B?bGpTMGpGMmhDVGkyMkZlYnhKbldNQ1RNRm9UaWQybGx1NDFvU2VuYjhmNEQx?=
 =?utf-8?B?R0tOaWExWXc1WXkxQ0xKQVNnTVU5cUU3cE9VaWkzNFVOZ2JadkVkaVlpSTUw?=
 =?utf-8?B?cCtkQnh0bzIyWTdNMWpoUUd3ZUZFaDFBejN1eTNuOTdpSTB3UGgyRkRmWDFu?=
 =?utf-8?B?ZElBb2VhT1BuWmlSdHBkWHJqNlBpY3ZmS2R0Uzh3ODFHN2tuVXhhcW1GeUhB?=
 =?utf-8?B?bTY1Zm5jSkFobEI1T3E0Uy8vTDNlSjVTY2p2dGRIYmw2d05Ca0JNUzBpc1Fq?=
 =?utf-8?B?d2IxNVFxOHhFVFNGVCswcTdvMlo4M0JuT3V5aFFCTW5WZExveUY1NkJ6cDEx?=
 =?utf-8?Q?IOhYRVYKEYPtAiKH6m3mRsSgnveo6yoQJ5qOGxJ?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4388.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0314b060-4d89-4cb4-3994-08d90350602c
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Apr 2021 16:29:59.4149
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 34jpkYWyCeQrbH6I9twX3m+zUfjtzMaS/fJrIfGJSX2p3a6fLYLNaLj4WoHSDSQc4lKA1IZFC7kfuX3GXAcr+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1545
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEludGVybmFsIERpc3RyaWJ1dGlvbiBPbmx5XQ0KDQpI
aSBHdWVudGVyLA0KDQo+PiAgICAgIGFjY3VtLT5wcmV2X3ZhbHVlID0gaW5wdXQ7DQo+PiArICAg
IGFjY3VtLT5jYWNoZV90aW1lb3V0ID0gamlmZmllcyArIEhaICsgZ2V0X3JhbmRvbV9pbnQoKSAl
IEhaOw0KDQpJJ3ZlIG5vdGljZWQgdGhpcyBjaGFuZ2UgaXMgcmV2aWV3ZWQgYW5kIGFjY2VwdGVk
LCBwbGVhc2Ugbm90ZSDigJxBTUQgZ3VpZGFuY2UgcmVtYWlucyB0byByZXN0cmljdCB0aGUgUkFQ
TCBNU1IgYWNjZXNzIHRvIHByaXZpbGVnZSB1c2VycyBmb3IgdGhlIENWRS0yMDIwLTEyOTEyLiBT
ZWUgMjAyMCB0YWIgaW4gaHR0cHM6Ly93d3cuYW1kLmNvbS9lbi9jb3Jwb3JhdGUvcHJvZHVjdC1z
ZWN1cml0eSNwYXJhZ3JhcGgtMzEzNTYx4oCdDQoNClJlZ2FyZHMsDQpOYXZlZW5rDQoNCi0tLS0t
T3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBHdWVudGVyIFJvZWNrIDxncm9lY2s3QGdtYWls
LmNvbT4gT24gQmVoYWxmIE9mIEd1ZW50ZXIgUm9lY2sNClNlbnQ6IE1vbmRheSwgQXByaWwgMTIs
IDIwMjEgNzo1NiBQTQ0KVG86IEplYW4gRGVsdmFyZSA8amRlbHZhcmVAc3VzZS5kZT4NCkNjOiBI
YXJkd2FyZSBNb25pdG9yaW5nIDxsaW51eC1od21vbkB2Z2VyLmtlcm5lbC5vcmc+OyBDaGF0cmFk
aGksIE5hdmVlbiBLcmlzaG5hIDxOYXZlZW5LcmlzaG5hLkNoYXRyYWRoaUBhbWQuY29tPjsgR3Jl
ZyBLcm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4NClN1YmplY3Q6IFJl
OiBbUEFUQ0ggdjIgMi8yXSBod21vbjogKGFtZF9lbmVyZ3kpIFJlc3RvcmUgdmlzaWJpbGl0eSBv
ZiBlbmVyZ3kgY291bnRlcnMNCg0KW0NBVVRJT046IEV4dGVybmFsIEVtYWlsXQ0KDQpPbiA0LzEy
LzIxIDU6MjcgQU0sIEplYW4gRGVsdmFyZSB3cm90ZToNCj4gT24gRnJpLCAgOSBBcHIgMjAyMSAx
MDo0ODo1MiAtMDcwMCwgR3VlbnRlciBSb2VjayB3cm90ZToNCj4+IENvbW1pdCA2MDI2OGIwZTgy
NTggKCJod21vbjogKGFtZF9lbmVyZ3kpIG1vZGlmeSB0aGUgdmlzaWJpbGl0eSBvZiANCj4+IHRo
ZSBjb3VudGVycyIpIHJlc3RyaWN0ZWQgdmlzaWJpbGl0eSBvZiBBTUQgZW5lcmd5IGNvdW50ZXJz
IHRvIHdvcmsgDQo+PiBhcm91bmQgYSBzaWRlLWNoYW5uZWwgYXR0YWNrIHVzaW5nIGVuZXJneSBk
YXRhIHRvIGRldGVybWluZSB3aGljaCANCj4+IGluc3RydWN0aW9ucyBhcmUgZXhlY3V0ZWQuIFRo
ZSBhdHRhY2sgaXMgZGVzY3JpYmVkIGluICdQTEFUWVBVUzoNCj4+IFNvZnR3YXJlLWJhc2VkIFBv
d2VyIFNpZGUtQ2hhbm5lbCBBdHRhY2tzIG9uIHg4NicuIEl0IHJlbGllcyBvbiBxdWljayANCj4+
IGFuZCBhY2N1cmF0ZSBlbmVyZ3kgcmVhZGluZ3MuDQo+Pg0KPj4gTGltaXRpbmcgZW5lcmd5IHJl
YWRpbmdzIHRvIHByaXZpbGVnZWQgdXNlcnMgaXMgYW5ub3lpbmcuIEEgbXVjaCANCj4+IGJldHRl
ciBzb2x1dGlvbiBpcyB0byBtYWtlIGVuZXJneSByZWFkaW5ncyB1bnVzYWJsZSBmb3IgYXR0YWNr
cyBieSANCj4+IHJhbmRvbWl6aW5nIHRoZSB0aW1lIGJldHdlZW4gdXBkYXRlcy4gV2UgY2FuIGRv
IHRoYXQgYnkgY2FjaGluZyANCj4+IGVuZXJneSB2YWx1ZXMgZm9yIGEgc2hvcnQgYW5kIHJhbmRv
bWl6ZWQgcGVyaW9kIG9mIHRpbWUuDQo+Pg0KPj4gQ2M6IE5hdmVlbiBLcmlzaG5hIENoYXRyYWRo
aSA8bmNoYXRyYWRAYW1kLmNvbT4NCj4+IENjOiBHcmVnIEtyb2FoLUhhcnRtYW4gPGdyZWdraEBs
aW51eGZvdW5kYXRpb24ub3JnPg0KPj4gU2lnbmVkLW9mZi1ieTogR3VlbnRlciBSb2VjayA8bGlu
dXhAcm9lY2stdXMubmV0Pg0KPj4gLS0tDQo+PiB2MjogU2ltcGxpZmllZCBjb2RlIGJ5IHVzaW5n
IHVuaWZpZWQgZnVuY3Rpb24gdG8gYWNjdW11bGF0ZSBlbmVyZ3kgDQo+PiBkYXRhDQo+Pg0KPj4g
IGRyaXZlcnMvaHdtb24vYW1kX2VuZXJneS5jIHwgMjkgKysrKysrKysrKysrKysrKysrKysrLS0t
LS0tLS0NCj4+ICAxIGZpbGUgY2hhbmdlZCwgMjEgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMo
LSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9od21vbi9hbWRfZW5lcmd5LmMgYi9kcml2
ZXJzL2h3bW9uL2FtZF9lbmVyZ3kuYyANCj4+IGluZGV4IDkzYmFkNjQwMzlmMS4uMWJmMGFmYzI3
NDBjIDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9od21vbi9hbWRfZW5lcmd5LmMNCj4+ICsrKyBi
L2RyaXZlcnMvaHdtb24vYW1kX2VuZXJneS5jDQo+PiBAQCAtMTgsNiArMTgsNyBAQA0KPj4gICNp
bmNsdWRlIDxsaW51eC9tdXRleC5oPg0KPj4gICNpbmNsdWRlIDxsaW51eC9wcm9jZXNzb3IuaD4N
Cj4+ICAjaW5jbHVkZSA8bGludXgvcGxhdGZvcm1fZGV2aWNlLmg+DQo+PiArI2luY2x1ZGUgPGxp
bnV4L3JhbmRvbS5oPg0KPj4gICNpbmNsdWRlIDxsaW51eC9zY2hlZC5oPg0KPj4gICNpbmNsdWRl
IDxsaW51eC9zbGFiLmg+DQo+PiAgI2luY2x1ZGUgPGxpbnV4L3RvcG9sb2d5Lmg+DQo+PiBAQCAt
MzUsNiArMzYsNyBAQA0KPj4gIHN0cnVjdCBzZW5zb3JfYWNjdW11bGF0b3Igew0KPj4gICAgICB1
NjQgZW5lcmd5X2N0cjsNCj4+ICAgICAgdTY0IHByZXZfdmFsdWU7DQo+PiArICAgIHVuc2lnbmVk
IGxvbmcgY2FjaGVfdGltZW91dDsNCj4+ICB9Ow0KPj4NCj4+ICBzdHJ1Y3QgYW1kX2VuZXJneV9k
YXRhIHsNCj4+IEBAIC03NCwxNyArNzYsMTQgQEAgc3RhdGljIHZvaWQgZ2V0X2VuZXJneV91bml0
cyhzdHJ1Y3QgYW1kX2VuZXJneV9kYXRhICpkYXRhKQ0KPj4gICAgICBkYXRhLT5lbmVyZ3lfdW5p
dHMgPSAocmFwbF91bml0cyAmIEFNRF9FTkVSR1lfVU5JVF9NQVNLKSA+PiA4OyAgDQo+PiB9DQo+
Pg0KPg0KPiBBZGQgYSBjb21tZW50IHN0YXRpbmcgdGhhdCB0aGlzIGZ1bmN0aW9uIG11c3QgYmUg
Y2FsbGVkIHdpdGggYWNjdW0ncyANCj4gJmRhdGEtPmxvY2sgaGVsZD8NCj4NCj4+IC1zdGF0aWMg
dm9pZCBhY2N1bXVsYXRlX2RlbHRhKHN0cnVjdCBhbWRfZW5lcmd5X2RhdGEgKmRhdGEsDQo+PiAt
ICAgICAgICAgICAgICAgICAgICAgICAgIGludCBjaGFubmVsLCBpbnQgY3B1LCB1MzIgcmVnKQ0K
Pj4gK3N0YXRpYyB2b2lkIF9fYWNjdW11bGF0ZV9kZWx0YShzdHJ1Y3Qgc2Vuc29yX2FjY3VtdWxh
dG9yICphY2N1bSwNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICBpbnQgY3B1LCB1MzIg
cmVnKQ0KPj4gIHsNCj4+IC0gICAgc3RydWN0IHNlbnNvcl9hY2N1bXVsYXRvciAqYWNjdW07DQo+
PiAgICAgIHU2NCBpbnB1dDsNCj4+DQo+PiAtICAgIG11dGV4X2xvY2soJmRhdGEtPmxvY2spOw0K
Pj4gICAgICByZG1zcmxfc2FmZV9vbl9jcHUoY3B1LCByZWcsICZpbnB1dCk7DQo+PiAgICAgIGlu
cHV0ICY9IEFNRF9FTkVSR1lfTUFTSzsNCj4+DQo+PiAtICAgIGFjY3VtID0gJmRhdGEtPmFjY3Vt
c1tjaGFubmVsXTsNCj4+ICAgICAgaWYgKGlucHV0ID49IGFjY3VtLT5wcmV2X3ZhbHVlKQ0KPj4g
ICAgICAgICAgICAgIGFjY3VtLT5lbmVyZ3lfY3RyICs9DQo+PiAgICAgICAgICAgICAgICAgICAg
ICBpbnB1dCAtIGFjY3VtLT5wcmV2X3ZhbHVlOyBAQCAtOTMsNiArOTIsMTQgQEAgDQo+PiBzdGF0
aWMgdm9pZCBhY2N1bXVsYXRlX2RlbHRhKHN0cnVjdCBhbWRfZW5lcmd5X2RhdGEgKmRhdGEsDQo+
PiAgICAgICAgICAgICAgICAgICAgICBhY2N1bS0+cHJldl92YWx1ZSArIGlucHV0Ow0KPj4NCj4+
ICAgICAgYWNjdW0tPnByZXZfdmFsdWUgPSBpbnB1dDsNCj4+ICsgICAgYWNjdW0tPmNhY2hlX3Rp
bWVvdXQgPSBqaWZmaWVzICsgSFogKyBnZXRfcmFuZG9tX2ludCgpICUgSFo7DQo+DQo+IE5lZWRz
ICNpbmNsdWRlIDxsaW51eC9qaWZmaWVzLmg+IG1heWJlPw0KPg0KPj4gK30NCj4+ICsNCj4+ICtz
dGF0aWMgdm9pZCBhY2N1bXVsYXRlX2RlbHRhKHN0cnVjdCBhbWRfZW5lcmd5X2RhdGEgKmRhdGEs
DQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgIGludCBjaGFubmVsLCBpbnQgY3B1LCB1MzIg
cmVnKSB7DQo+PiArICAgIG11dGV4X2xvY2soJmRhdGEtPmxvY2spOw0KPj4gKyAgICBfX2FjY3Vt
dWxhdGVfZGVsdGEoJmRhdGEtPmFjY3Vtc1tjaGFubmVsXSwgY3B1LCByZWcpOw0KPj4gICAgICBt
dXRleF91bmxvY2soJmRhdGEtPmxvY2spOw0KPj4gIH0NCj4+DQo+PiBAQCAtMTI0LDYgKzEzMSw3
IEBAIHN0YXRpYyBpbnQgYW1kX2VuZXJneV9yZWFkKHN0cnVjdCBkZXZpY2UgKmRldiwgIHsNCj4+
ICAgICAgc3RydWN0IGFtZF9lbmVyZ3lfZGF0YSAqZGF0YSA9IGRldl9nZXRfZHJ2ZGF0YShkZXYp
Ow0KPj4gICAgICBzdHJ1Y3Qgc2Vuc29yX2FjY3VtdWxhdG9yICphY2N1bTsNCj4+ICsgICAgdTY0
IGVuZXJneTsNCj4+ICAgICAgdTMyIHJlZzsNCj4+ICAgICAgaW50IGNwdTsNCj4+DQo+PiBAQCAt
MTQwLDEwICsxNDgsMTUgQEAgc3RhdGljIGludCBhbWRfZW5lcmd5X3JlYWQoc3RydWN0IGRldmlj
ZSAqZGV2LA0KPj4gICAgICAgICAgICAgIHJlZyA9IEVORVJHWV9DT1JFX01TUjsNCj4+ICAgICAg
fQ0KPj4NCj4+IC0gICAgYWNjdW11bGF0ZV9kZWx0YShkYXRhLCBjaGFubmVsLCBjcHUsIHJlZyk7
DQo+PiAgICAgIGFjY3VtID0gJmRhdGEtPmFjY3Vtc1tjaGFubmVsXTsNCj4+DQo+PiAtICAgICp2
YWwgPSBkaXY2NF91bChhY2N1bS0+ZW5lcmd5X2N0ciAqIDEwMDAwMDBVTCwgQklUKGRhdGEtPmVu
ZXJneV91bml0cykpOw0KPj4gKyAgICBtdXRleF9sb2NrKCZkYXRhLT5sb2NrKTsNCj4+ICsgICAg
aWYgKCFhY2N1bS0+ZW5lcmd5X2N0ciB8fCB0aW1lX2FmdGVyKGppZmZpZXMsIGFjY3VtLT5jYWNo
ZV90aW1lb3V0KSkNCj4+ICsgICAgICAgICAgICBfX2FjY3VtdWxhdGVfZGVsdGEoYWNjdW0sIGNw
dSwgcmVnKTsNCj4+ICsgICAgZW5lcmd5ID0gYWNjdW0tPmVuZXJneV9jdHI7DQo+PiArICAgIG11
dGV4X3VubG9jaygmZGF0YS0+bG9jayk7DQo+PiArDQo+PiArICAgICp2YWwgPSBkaXY2NF91bChl
bmVyZ3kgKiAxMDAwMDAwVUwsIEJJVChkYXRhLT5lbmVyZ3lfdW5pdHMpKTsNCj4+DQo+PiAgICAg
IHJldHVybiAwOw0KPj4gIH0NCj4+IEBAIC0xNTIsNyArMTY1LDcgQEAgc3RhdGljIHVtb2RlX3Qg
YW1kX2VuZXJneV9pc192aXNpYmxlKGNvbnN0IHZvaWQgKl9kYXRhLA0KPj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGVudW0gaHdtb25fc2Vuc29yX3R5cGVzIHR5cGUsDQo+PiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdTMyIGF0dHIsIGludCBjaGFubmVsKSAg
ew0KPj4gLSAgICByZXR1cm4gMDQ0MDsNCj4+ICsgICAgcmV0dXJuIDA0NDQ7DQo+PiAgfQ0KPj4N
Cj4+ICBzdGF0aWMgaW50IGVuZXJneV9hY2N1bXVsYXRvcih2b2lkICpwKQ0KPg0KPiBWZXJ5IG5p
Y2UuIFRoaXMgd2lsbCBtYWtlIHRoZSBkcml2ZXIgdXNlZnVsIGFnYWluIDotKQ0KPg0KPiBSZXZp
ZXdlZC1ieTogSmVhbiBEZWx2YXJlIDxqZGVsdmFyZUBzdXNlLmRlPg0KPg0KSSBtYWRlIHRoZSBz
dWdnZXN0ZWQgY2hhbmdlcy4NCg0KVGhhbmtzIGEgbG90IGZvciB0aGUgcmV2aWV3IQ0KDQpHdWVu
dGVy
