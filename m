Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22CB2C433EF
	for <linux-hwmon@archiver.kernel.org>; Mon, 16 May 2022 20:09:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234144AbiEPUI6 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 16 May 2022 16:08:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351250AbiEPUCI (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 16 May 2022 16:02:08 -0400
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (mail-eopbgr140093.outbound.protection.outlook.com [40.107.14.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AFB24092B
        for <linux-hwmon@vger.kernel.org>; Mon, 16 May 2022 13:01:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gs5oIawzm5O6Q4tY071GDPkQK8QfTe4B0hDxESpyZOoVKOjdc50hmbYoIYwsx29horiQdKbmnPQwTUwqEc2HKrYfgF4G7JVohGUFjayVaT5x+bZtkSk7+A+j98ZMwggzhoUU7pLA0VhrRHaicU8JMUJ2r6ApaPJ0XhoENy+QByCWBTqSVBPMhc4xNiC1nEebGCYeW3bOw5U4HYFFfFImRVmEUq9yhxmguIDMlm0sAjsACACIh5rJvd3RtmrUkvr79WGNT4jqSgH0GlshOC98QpXDGQfW0Dywl4fAFSVNQzp9oIpg/NRGznhQgVehiygmg2UzmxTBkKq3ip27ihv/NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sb5/zWohiYdBPv+0F9ysf1SSgl8ONSqxdcnwg20qQo0=;
 b=kI/YUb3EiV3IsotBCXWg4V14N7/hJ89fT3yt9lH34wuluUb35LOnPlPl09kddhKBjhiKkmrZAuiEKIRP18Apb+XCVi5/XaXdEiah0+jmddWP4V5L4uIVZSv9CfiGQhz+TmDwUXMLcWbc+r7xNQWlhwLG6cKqLyyWrdhjE28DpgdoJMNAfsd874mAt8xkVdA/hMhRr4Vwgw++ZP9y8WR6T8R3uBnAKPkeIGA0x8341tvc06jUJOAZbhyN+c+JkNXRmp+V+mUygi4qMk4FlMHeUgQSBsLKqOaRexiRXxOYzMJeRVa6bTe5vMFfTV1VjlsRdOVqRR8NSgO3/+Rz0d9Xkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hitachienergy.com; dmarc=pass action=none
 header.from=hitachienergy.com; dkim=pass header.d=hitachienergy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hitachienergy.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sb5/zWohiYdBPv+0F9ysf1SSgl8ONSqxdcnwg20qQo0=;
 b=Kvvlt6lWRO2RFmRnHf2jAFdFWB2h9JUEqBKemUXrrtAMumdkNS8021y8UXA9XfDgHDoE3NqTk6u/3g7kJaEInvX+ISc7kTmJmJ73ePJxOgXaAe92qoBROjl7GOT8LBO24TZZwEPjJjjbUO0/1WB13fDFc9GnoSKUqTY7J84R8B2pqsO4fMrklRqW9ITysyVcgXP8woB7dPy44hBGB8scE9204EQN1F+v4gednR6G6l541pq0zQwzstRSbr5llY8VNl77UCupKMGUg0XmdW2ICrxttbMuMKIgFYDtqS3h9xFWzXtlRp5vR6AMGcXw3uoSZmHt9KVAoLNuSx5U6G22nw==
Received: from DB9PR06MB7289.eurprd06.prod.outlook.com (2603:10a6:10:218::16)
 by HE1PR0602MB3355.eurprd06.prod.outlook.com (2603:10a6:7:88::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.18; Mon, 16 May
 2022 20:01:35 +0000
Received: from DB9PR06MB7289.eurprd06.prod.outlook.com
 ([fe80::7015:6796:8a61:93b4]) by DB9PR06MB7289.eurprd06.prod.outlook.com
 ([fe80::7015:6796:8a61:93b4%9]) with mapi id 15.20.5250.018; Mon, 16 May 2022
 20:01:35 +0000
From:   Holger Brunck <holger.brunck@hitachienergy.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
CC:     Jean Delvare <jdelvare@suse.com>
Subject: RE: [v2 2/2] driver/hwmon/lm90: enable extended range according to
 DTS node
Thread-Topic: [v2 2/2] driver/hwmon/lm90: enable extended range according to
 DTS node
Thread-Index: AQHYZEU3R3ThQh9j2kG9BRADVG6ii60Y5tMAgAkL/OA=
Date:   Mon, 16 May 2022 20:01:34 +0000
Message-ID: <DB9PR06MB7289A0505D42DC7151BD8517F7CF9@DB9PR06MB7289.eurprd06.prod.outlook.com>
References: <20220510080900.22758-1-holger.brunck@hitachienergy.com>
 <20220510080900.22758-2-holger.brunck@hitachienergy.com>
 <692d5ac7-840f-49da-c06a-c2b0e0e6cf8c@roeck-us.net>
In-Reply-To: <692d5ac7-840f-49da-c06a-c2b0e0e6cf8c@roeck-us.net>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-processedbytemplafy: true
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=hitachienergy.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e75fdfc5-5c82-4f61-4873-08da3776e13e
x-ms-traffictypediagnostic: HE1PR0602MB3355:EE_
x-microsoft-antispam-prvs: <HE1PR0602MB335528F36A6E1B9EAB97B34FF7CF9@HE1PR0602MB3355.eurprd06.prod.outlook.com>
x-he-o365-outbound: HEO365Out
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OfH03bdtge1VK3S4lOfQBmu3Nclx6etWGqFTQxlMTZIj7U4X2qCEc/B5qi3vY2ODHtqYiqtUmIPTGGwF1zzE6fBgpJVF10ZAdWOs+xIi8wkJlvk5eSdjKuVLeFdV+731EAFE6dogyfz3qO/WkKRhwtwS8Q8ipwwGPH4q9ZaUdGG3D84Ufi8mYwah1k6NZROEfzbbVs9y2BkaRoACg4tia6pDIP5KDdzK496Hf+6KlqY14r/11cVdoEUT/Y/W4/PuzdwWNsx6pZrUMEFMvXHV3ryJbon22yrPDC0t+gAiB8wvGLGDfpt/pXNiwza9xOLJvs0law0aMfeUFKgy5InN8Iv45bUXh537d1YYjOx8jUIrbUn0wYhzRtoxgyV1Y8BJR25XaWvyQfJmHE4l1h5aBmpLJuU+dRvnD9D+DTH4SFh1HC5QjLJhAl3hnmNwckV50ZYc0pIQTKj5lHOj24+21ui+bIsESoXOICw+9efBp6TIdubXWBSIaWhb5BwSSzP7dTPEmdn41ivUQpOFWvjXdQ4ivNPf+cQVzOa4uvhpa7tZe4nGoEdBriVbdqKadmcRpco0s0kp/qYpoMIQKR9qX3IstMkEqjfxEWpfEmLd94f04UkVn0FfKKry6YAhULr7ATrIPHPLpn1eEyIdKNZsLX1qNSPdQhspju/ISHhjQdzYu4XIjt9gW1QdPdu6dMjtfnXE1e3Ku+sn40jhsD1PZw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR06MB7289.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(5660300002)(7696005)(52536014)(86362001)(8936002)(38070700005)(122000001)(76116006)(66556008)(66946007)(44832011)(2906002)(38100700002)(82960400001)(66476007)(26005)(9686003)(66446008)(64756008)(55016003)(110136005)(6506007)(4326008)(8676002)(316002)(508600001)(71200400001)(33656002)(186003)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cnlpSGFBSFBkN2llRVU1Nmk3c1E1azJ5bEN0SjhzSXVMdjRhVzBqd3FkZGF0?=
 =?utf-8?B?VFcxSlVDNmVZMkNsTzdGUkdxbE9tek0xVG9TM2ozOS9BUDFxRllYazFkNzJi?=
 =?utf-8?B?bUFNcm5KbTZCK2ZPdzNpdWNYQ1NYRGZmRVRsMW5KYWlBV2ZUVXdvQTVjMUJs?=
 =?utf-8?B?UFlRV1g3VWlyUmpYYnl3WXhaMHVCNWRqYzJLdTFBTFJvTVloWExZSndabTUw?=
 =?utf-8?B?MUpIUHNMUmY5b2l4bDBLRTBJN3NYdGJKdHVzT3F2K2ZpVldjcEdESlFsV3Jt?=
 =?utf-8?B?Z2w4M3Zma2pwL05VU3Q0aVgxQW5kSTIrL3YxN3BPU3h1aThnUlB6YU1KRmQ4?=
 =?utf-8?B?dUd5ckQybENVMmM4QWJCemxIcEUydElVcTUydHpuUjZYMC9ka1RwL3M5dWww?=
 =?utf-8?B?VjhBckhxY3pVVENVT2lZcHBUS0NCcmpxS25sSzVJb1E5RFFheFFqa1g4Y3R1?=
 =?utf-8?B?aEpZdThkVjJQVUpuTnBzTXJPaVUvbEhGdWQwMVVNREhkb3kzYjh0RjcvWjNL?=
 =?utf-8?B?MlFLdndlRUpYcklrUjI1Y0QvM1cxSU5KZlROc054dW1JUXRLaTVqVnBYK01w?=
 =?utf-8?B?cUVYNnl2SnpBOWpNNFNDeWpyZ1pJclQ2dEEzS25tUnlRM0lndlE1QUM4ZTBG?=
 =?utf-8?B?SEhKMXEwbERMUXVjbHZJRjJkUjhxTTAyUTNla2JtOFEvbnNJV1ZETmZzYWo2?=
 =?utf-8?B?QjgyRXdrcVhPMFppbXc1bnFHVEtFUXRzUmVNRnEycnBjQjg3QU52NDFsRjZF?=
 =?utf-8?B?aGxFc2c0bnRrTm4wN1lIQ1pPQlFKZVlicEIxbTQzbUowR0Yra0dPbGw3L2ov?=
 =?utf-8?B?VFNYaGlnbktsSUhZWEVIMUlySWtjaDNqeVlKUEVhUEdpQWRKZWNLNkZKQ3U5?=
 =?utf-8?B?ZE1Ya1hMRGxjeGRPUGIwQzNSdVFzKzF2TUFRTUFEUUZxUGxvcUZGazRNRnpJ?=
 =?utf-8?B?b3NmTGlVSUduajk1NTZETTMrOWI3STdtMis2Wjd4WHg2RnpKTkJQMHpEOXJI?=
 =?utf-8?B?T2pjSUMxWjI1Zk9tclNTRFNrNzB0UFBVN0taZDR6N25pSHlhcFNsclB4SXR4?=
 =?utf-8?B?RVFmemc3eUVJanJGd0hoMjlMcXhwdW9uZzFhVURGZXlRckZDVTNwZmZQeXNw?=
 =?utf-8?B?MVZKLzNDNzlrUThNZmNlNUM4cHY3NWE0eE5mbmhpVTNRS1BCSkpXbDJmSERL?=
 =?utf-8?B?QjdIS3pVK2d6WVdIR0xiNTFEVUtlVDFqeUpmZWE1b0prUlZWKzVzQm1VaktM?=
 =?utf-8?B?dUdvTXFsNlVYaWRZNHVqc0VRdEJld2pCS1drYm5vanU3eDZ2TmIyVTE2cHZR?=
 =?utf-8?B?MlA2d0FncHUxNWhvZTNyL2UyR0lsRDhnSzVLcGRLclZjSGNhc2dOOExqNTAv?=
 =?utf-8?B?NUxjNWVJclZ2SDFubXFYY3NyMU16SWt5N1JiMjV4VTN4Y0txaldlakZZRDRm?=
 =?utf-8?B?aHFzMGxLVVJXMlZsUHJydklxK0NSR2VjTnV0VVVKdkt2dmFXcVU3bElHSEw4?=
 =?utf-8?B?RW1xWlR0b1UvZXBQSXEwU2w4bkgwQWpsaU1WeHF5aDJLeFhiaEErSHdCU0hI?=
 =?utf-8?B?N21OZ2pyNmtkZVY4aVdod0VDQy8veGZ6WjkrVWpJYU9JK0pxcjRES0t4S0xj?=
 =?utf-8?B?VUpRTG9BUEZWS2NLdGhyeXJlckxnUzhuK0JQNHArNlFyUFhXMmJlNFlLd1FL?=
 =?utf-8?B?TWVESW1rc3REVHB1RVlXN2drbHlOQWRUMzlVeVNybFJndDBZNE40cWlxaTJX?=
 =?utf-8?B?YXFQeVZlSW5HNnY0TE0xZjJFbHd4NzQxWnZGa3FHWlhaUkRZOERDazQ3SW95?=
 =?utf-8?B?cGtPdDFobnllNUEySVBaZXpSZU13QVpCeFFnSys1eVp2MUhyQm4yQzJrQlFW?=
 =?utf-8?B?dVhpYlAreFlqRktrMXhqMC9lZU9Nd0tjSk5LVWdFS3JFaWZHM3B6VzF2L1BI?=
 =?utf-8?B?Q1NITGpyUDRYUml1NUkzL0JnTkNKVURyTFhWdm9Ddnh6WTA4NHgwd2JDTm16?=
 =?utf-8?B?RkE3U00veE9ISTAxUkFCRGZHbHgrb3NURzVMYTFLUnp1bmROZHdxcUduay9E?=
 =?utf-8?B?QUdLYkl4MTd0eVF4YmtpaVdMY1FwbXhhcDhDcnZJQzV6aDRYZDJ3bk9BQk12?=
 =?utf-8?B?ZG9FRXJSeC9HT01mTjJkSk13ZGpaNW1nKzdSbVdtZEZVeEdLY0F2SERsSWti?=
 =?utf-8?B?M25rK0NrWkoyM3V6bEdwYXZVdFBjd2FGaWVXTVQycHIxalNTMHM3ZWs4Titn?=
 =?utf-8?B?bjJuK2lFV0o2TmFVVjY1SFJ1dnlKaDdSOGxhSGdxUkFNNjRIYnJJM2lOMERx?=
 =?utf-8?B?ZkpnMUNYVjZEcTVPUmlFdVFpaEJtSzRxVkhiUERuWDNVWXlVOXV3aUgyNWtE?=
 =?utf-8?Q?gLBtRp7xuiN0oP40=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: hitachienergy.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR06MB7289.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e75fdfc5-5c82-4f61-4873-08da3776e13e
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 May 2022 20:01:35.0345
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7831e6d9-dc6c-4cd1-9ec6-1dc2b4133195
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gQo2uSWSePAi1mSuCMDuKE1Pp96IxEd4z5TBGROvLULvSrS2pM3iC+w9Qw0UPLvXzHtMmdW8BQcWbO84nclUmM9WOGKpYq/etpeUDqDIke8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0602MB3355
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

PiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2h3bW9uL2xtOTAuYyBiL2RyaXZlcnMvaHdtb24vbG05
MC5jIGluZGV4DQo+ID4gMWM5NDkzYzcwODEzLi42Y2RiY2ZhYjlmMjAgMTAwNjQ0DQo+ID4gLS0t
IGEvZHJpdmVycy9od21vbi9sbTkwLmMNCj4gPiArKysgYi9kcml2ZXJzL2h3bW9uL2xtOTAuYw0K
PiA+IEBAIC0xNzA3LDYgKzE3MDcsNyBAQCBzdGF0aWMgdm9pZCBsbTkwX3Jlc3RvcmVfY29uZih2
b2lkICpfZGF0YSkNCj4gPg0KPiA+ICAgc3RhdGljIGludCBsbTkwX2luaXRfY2xpZW50KHN0cnVj
dCBpMmNfY2xpZW50ICpjbGllbnQsIHN0cnVjdCBsbTkwX2RhdGEgKmRhdGEpDQo+ID4gICB7DQo+
ID4gKyAgICAgc3RydWN0IGRldmljZV9ub2RlICpucCA9IGNsaWVudC0+ZGV2Lm9mX25vZGU7DQo+
ID4gICAgICAgaW50IGNvbmZpZywgY29udnJhdGU7DQo+ID4NCj4gPiAgICAgICBjb252cmF0ZSA9
IGxtOTBfcmVhZF9yZWcoY2xpZW50LCBMTTkwX1JFR19SX0NPTlZSQVRFKTsgQEANCj4gPiAtMTcy
Nyw3ICsxNzI4LDggQEAgc3RhdGljIGludCBsbTkwX2luaXRfY2xpZW50KHN0cnVjdCBpMmNfY2xp
ZW50DQo+ID4gKmNsaWVudCwgc3RydWN0IGxtOTBfZGF0YSAqZGF0YSkNCj4gPg0KPiA+ICAgICAg
IC8qIENoZWNrIFRlbXBlcmF0dXJlIFJhbmdlIFNlbGVjdCAqLw0KPiA+ICAgICAgIGlmIChkYXRh
LT5mbGFncyAmIExNOTBfSEFWRV9FWFRFTkRFRF9URU1QKSB7DQo+ID4gLSAgICAgICAgICAgICBp
ZiAoY29uZmlnICYgMHgwNCkNCj4gPiArICAgICAgICAgICAgIGlmIChjb25maWcgJiAweDA0IHx8
DQo+ID4gKyAgICAgICAgICAgICAgICAgb2ZfcHJvcGVydHlfcmVhZF9ib29sKG5wLA0KPiA+ICsg
Im9uc2VtaSxleHRlbmRlZC1yYW5nZS1lbmFibGUiKSkNCj4gPiAgICAgICAgICAgICAgICAgICAg
ICAgZGF0YS0+ZmxhZ3MgfD0gTE05MF9GTEFHX0FEVDc0NjFfRVhUOw0KPiANCj4gTWF5YmUgSSBh
bSBtaXNzaW5nIHNvbWV0aGluZywgYnV0IEkgZG9uJ3Qgc2VlIHRoZSBtYXRjaGluZyBjb25maWd1
cmF0aW9uDQo+IGNoYW5nZS4gU3BlY2lmeWluZyB0aGUgZmxhZyBpbiBkZXZpY2V0cmVlIG9ubHkg
cmVhbGx5IG1ha2VzIHNlbnNlIGlmIHRoZSBjaGlwDQo+IGNvbmZpZ3VyYXRpb24gaXMgY2hhbmdl
ZCBhY2NvcmRpbmdseS4NCj4gDQoNCndoYXQgaXMgY29uZnVzaW5nIGhlcmUgZm9yIG1lIGlzIHRo
YXQgaW4gdGhlIGN1cnJlbnQgY29kZSB3ZSBoYXZlDQoiaWYgKGNvbmZpZyAmIDB4NCkiIGFuZCBp
ZiB0aGlzIGlzIHRydWUgd2UgY29uZmlndXJlIHRoZSBmbGFncyBhY2NvcmRpbmdseS4gQnV0DQp0
aGUgYml0IDB4NCBpbiBjb25maWcgaXMgbm93aGVyZSBzZXQgaW4gY3VycmVudCBjb2RlLiBUaGVy
ZWZvcmUgYWxzbyB0aGUgZmxhZyBpcw0KbmV2ZXIgc2V0LiBPciBkbyBJIG1pc3Mgc29tZXRoaW5n
PyANCg0KSSBhbSBhc2tpbmcgYmVjYXVzZSBpZiBteSBhc3N1bXB0aW9uIGlzIGNvcnJlY3QgSSB3
b3VsZCByZXBsYWNlIHRoZSBjdXJyZW50DQoobmV2ZXIgbWF0Y2hpbmcpIGNoZWNrIHRvIHRoZSBu
ZXcgcHJvcGVydHk6DQppZiAob2ZfcHJvcGVydHlfcmVhZF9ib29sKG5wLCAidGksZXh0ZW5kZWQt
cmFuZ2UtZW5hYmxlIikpIHsNCiAgY29uZmlnIHw9IDB4NDsNCiAgZGF0YS0+ZmxhZ3MgfD0gTE05
MF9GTEFHX0FEVDc0NjFfRVhUOw0KfQ0KDQpJcyB0aGlzIG9rIGZvciB5b3U/DQoNCkJlc3QgcmVn
YXJkcw0KSG9sZ2VyDQoNCg==
