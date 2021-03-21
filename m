Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87797C433C1
	for <linux-hwmon@archiver.kernel.org>; Sun, 21 Mar 2021 09:40:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 445EB601FB
	for <linux-hwmon@archiver.kernel.org>; Sun, 21 Mar 2021 09:40:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229835AbhCUJkL (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 21 Mar 2021 05:40:11 -0400
Received: from mail-bn8nam12on2070.outbound.protection.outlook.com ([40.107.237.70]:56576
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229766AbhCUJjm (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 21 Mar 2021 05:39:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S+kWd6Qq5a7c+ngE4J0H6QSqh0SEd2VehAwpPKYJvOxy9m0egSHBJTo7Shmdd0lfcAVeYaC8GMS7Vk4eryVFlrPGZPIhxqCRnyHgbSGYKFcj4rvLMegbrODukieC1Oyf1lJ9eIiF878W0DMdU1a5jk28Enj1jp57ohIEPkm1RUKIHHF/6rwqE7CkcXp3Wrq/B6i5nlP90gIvp6MyXdEnlsgfIf73lj+Ezmi9tSaUmWNN3r+nnyFAEuvx8fiqZBScMZC72gdQSRfsGNi2pQPkC/dVPXU0F+mRZIgtJKl9JYqZs+pwO6Qp/zo4l8RPiSdjE5OEN5cOT74caNoZaOGtdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GDnRAPOYiDVDgI3v93RWV9BYw1DYVpAQTbh4e/LmxlM=;
 b=bBDrjqGcyGEG9ZoyF4uXW9vTPJyz+pfcNuXgh5DOZ9qPIn22SWdcWPKb9zu79Aj7xgTnBTa+Fgx8o9DdrMWcbCOdJ9MSl5XTCerZjtNKribViPLFuEFUKd6S5O8JIyc9S1pxIblFmtyzIZXP0BnFlxgQc4ImDtcSyljei0pO3q/YETgo8gCNrtIMkP+dWhMjKC44RBkQXR9jIA7q07pDwqy0scSP+W+82IwKVqhcxrG+g6gzXcPUoq+fPtYeq9cv1Tmzw6XsYhfHqTGonXA6+BIT3+M536f0uN+b5pQ04VdcGjzcEQomsPZttRiL8l2Gz29rx2i++pAaJOSxOIz+6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GDnRAPOYiDVDgI3v93RWV9BYw1DYVpAQTbh4e/LmxlM=;
 b=jxtxx5CmBb1RRU4r8Ye5zCCQiwE0bQxuCrdk6hECQdwF3OlurmgDXoUEMRX/ecLdjQLt9GsEYWAoHXEVw6v9Zono5dW1k35ibfRemry7h1yj7DqCZJXMorItJtD6cc+SkSepVFfkwqlkecUqidW7+UqBrr2h5TCF/oOd1bQe+ixSd5LVRjwqT9OJnQbx+DTuS29dZBab/tvjzl/yZ2It/cl1a7EW6HdTdnuhitSOcoxvJdRuzi4I33NXwHyJ91gbu8MtcY2y7Vyg5bCFhsgY0gjHWUWums1oIycQpCRQhwqVMGbV1TWlaqyYCJs6vYHyTMqcVM7iksZdcffU4u3+6A==
Received: from DM6PR12MB3898.namprd12.prod.outlook.com (2603:10b6:5:1c6::18)
 by DM6PR12MB3097.namprd12.prod.outlook.com (2603:10b6:5:11d::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Sun, 21 Mar
 2021 09:39:41 +0000
Received: from DM6PR12MB3898.namprd12.prod.outlook.com
 ([fe80::ddbf:58cc:edc6:7c6a]) by DM6PR12MB3898.namprd12.prod.outlook.com
 ([fe80::ddbf:58cc:edc6:7c6a%3]) with mapi id 15.20.3955.024; Sun, 21 Mar 2021
 09:39:40 +0000
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     Guenter Roeck <linux@roeck-us.net>
CC:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: RE: [Re-send PATCH hwmon-next v2 1/1] hwmon: (mlxreg-fan) Add support
 for fan drawers capability and present registers
Thread-Topic: [Re-send PATCH hwmon-next v2 1/1] hwmon: (mlxreg-fan) Add
 support for fan drawers capability and present registers
Thread-Index: AQHXGlxaEareZbbfU0ij/t2F6kk5M6qL2v4AgAJbL5A=
Date:   Sun, 21 Mar 2021 09:39:40 +0000
Message-ID: <DM6PR12MB3898FF4C290461A661859810AF669@DM6PR12MB3898.namprd12.prod.outlook.com>
References: <20210316120239.1834485-1-vadimp@nvidia.com>
 <27c1929b-f817-8cc2-3947-5e7314f8b538@roeck-us.net>
In-Reply-To: <27c1929b-f817-8cc2-3947-5e7314f8b538@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=nvidia.com;
x-originating-ip: [46.117.169.201]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1b9802d5-837e-4365-8870-08d8ec4d4060
x-ms-traffictypediagnostic: DM6PR12MB3097:
x-microsoft-antispam-prvs: <DM6PR12MB30978FE87AA49AB7C59A43F6AF669@DM6PR12MB3097.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3173;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lPbE9QdJMfZRSqHLN3ufPcjZcfND5sqEB7JM4m6wb0Atx61uP4dw81p3BL+0SJaUGSmE2eoObDWGGFFc9Bf73b7yfEeBdNsWbgZBzhgQnxwGLAtDYMk4JjUPg4ZT+YqauQrMy7AIB1y40ZPDC3KCZE+DB9DNgw3klY0io45KhUsPFj2w9M7Y3kX6ZWI7UMvHE2ErytB7xaVlgh3z6pVFD1NaBAt1NQUzUaQsEBn066Dx8KHhw2tsg8mCdjex7exv2D7y6ldL2C75L66iTyzr4BoEaXNb1W5Wvbjy+22bVZh2WNZ/Hm9BDxK8e0OGlA9WsVfienQPn+6tQdub50gPBKJgBOh7NZYEb7iiWPtue1nyI6DFMcUL0PFzEufNIQvaAbEgSZXVM2sk02kDmczl2upJdALWWiU0A9u+W0OoydXUq5YIY4WHb9hrrefwLT7DpGnggsqEDvRH8yobCj6vA7ju3QDUiGGY3utf3aDuGjg2RkDzoOKeD7patpavI8LfQfS+MVzHtKwzNTbdajCTk7QIfexCLkZGH3h5vKSZAHRk8cmLsRspUMHEtiunvt52m+hc5pQdQYZsvyyy8iIXKa6P7hR6uHXvuupsqLVh4SH752UhsEPr35EGH51ie3+OSddw2PP1p0adjCIv3dym0weZRzMDtPd6R2FQiMjfWSs=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB3898.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(376002)(136003)(346002)(366004)(396003)(53546011)(7696005)(6506007)(66476007)(5660300002)(2906002)(6916009)(52536014)(8936002)(9686003)(64756008)(55016002)(66446008)(26005)(8676002)(86362001)(4326008)(66556008)(83380400001)(66946007)(478600001)(76116006)(38100700001)(33656002)(316002)(71200400001)(186003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?ck00SkZ3ZWJ4amRrbVppS1JsOHRMeHk5eUhFeVJtd25WQjRqM1VtZENNSTdJ?=
 =?utf-8?B?YnBjNzJ2eWRJOGFZVjBzbUxDbGNuSXBCOGRlcWtjRTE2ZXArMWtobU13cnJp?=
 =?utf-8?B?RTdRN082NHNTeGY4cC9IY1huSllGdDQ0MHhGbGRMcHdpbGVmc0FwMEdyTGZq?=
 =?utf-8?B?amo2Rll3Q0M4T28rVHZKS0xCV0Y5RlM1Q2dCTUxWMXFSRU9mQUY4ZUNlNURj?=
 =?utf-8?B?bEU0VFdPZHBkR0dWSXJJczhydGx3bDNrbnNINGFPOUtIRm04Sm1Ga1NldVpJ?=
 =?utf-8?B?V3UrY3B3V3RacnhKQzBSM3NpeVlvaWEzU3hxdGFjNXVCSG50aXBZQkNyOS80?=
 =?utf-8?B?dTRaRWZmOEluY2FkK1UrTmMraXZkVnZGaUx1U2doYUhHSU9Wa1lBQlNLR1lT?=
 =?utf-8?B?OWh5bXkrSGFDRlVxTGhHOERNSXZYdTZYM216cHZvTG8rM3pQTFMvaUd2bHJM?=
 =?utf-8?B?cnBCWWR2dzc0Tnp3bWN4QWFNdXk0dENleDB5ZHJWaGRwNkhXL3lKNWhrVWty?=
 =?utf-8?B?dkkxYzlLNk5PemZPQS9yVDVxTGxRcFNLcWgvTWpRcmJobzIwYWlYTWwyNDNj?=
 =?utf-8?B?ZlUrMkE5cHVXWDJPRStsU1EvQ29vZVNUSFg5UDgxWTZYbVorU3NSN0dBZ3BK?=
 =?utf-8?B?b0I0QWp0QUd4ZjRQdVFxZnJ3TVY4c3YzTWlEWnlvZHVDakJtM21vMXB5aE1T?=
 =?utf-8?B?d0FLMWh1SFdDc0RucXdEZ2lQbTJNRGE0cWdxc3VLOVdaM3AwaTNaQ2pMc29j?=
 =?utf-8?B?SHlvdGZhcmtHL3BRNGdUMlRISzlmWERMUGh2MDdYUUlobkZidDg3RUttZmV5?=
 =?utf-8?B?U2U0WmZPQXU1SmFhUWpDbWpJOElYSFh3bk9kMVN6Q1FleVBpYWpZbnZqWGVt?=
 =?utf-8?B?dERUUThTZWNmNjk2d3pYM3UwMTZkZVFLdGFSYlJHVHFqMlNpUitXdDc2ZVcz?=
 =?utf-8?B?S2M4K2FBVlpuSExxQlhGY29aZlVtcTc2aGIwZ2EvZ2s0QkhOR1dSa3EzbkEz?=
 =?utf-8?B?aUFnejVYYmVaZUxVT2pUaHd5SXY0bjUrUDZsWm5BbWMvUDJMdGRTY3ZSSHVD?=
 =?utf-8?B?Lzl6cXVUaTNqeTJDdE50UW1zMUdJQWRINGllRzhMREdUUkxCYUh6Z0JjcHM5?=
 =?utf-8?B?emlHRGdjMzlzM2xKU05jVVhCak5YYjBRUG1ZQUxjaTF3U2oxeUxxdGN0UFBz?=
 =?utf-8?B?Q2NkL2crTVdKczFFMURFRnk2RG9xbUtqcHFYL0NWTnBVYmxYOHdJNmtaektx?=
 =?utf-8?B?Vi9NQUNZY2hKMW9BZTNZMy9tNGROb1ZleXpzS1M5RzZaalI2aHJHcUJyMUR6?=
 =?utf-8?B?ZnVpd3pXSmptblJRRWNvY1QreExTelZ1TnJVUnN1SDdyeVZyWEFTTGdrRzFU?=
 =?utf-8?B?NnVONkVGWHhiUStPUnc4akJUSWhwZXd5T2QxWW0xYW83bnlEbTVDenJ4RFl0?=
 =?utf-8?B?cUhkYmpVaEI2R0tqSXZKMno2bVJKZXJMb0cxT1pCSlNzSzZKNnA5SHJ4MWZa?=
 =?utf-8?B?aEovcjNtZVIyZG5jSzFIV2tSSGFlODN2ZFRFa0NyaWtleXNPMVdseWVIYVJT?=
 =?utf-8?B?WmZhUnhDWERjcVdPVExLZEpTaG1ieEpxNURJc1R1NkowdVBSa2VWamRVOFhD?=
 =?utf-8?B?enM4WWJVVEdtbitaamJFcDhKU3Bwc2h6QmIwQndSODlZVkM2QTlLeUhlOGJy?=
 =?utf-8?B?bjl6c25mQlVoTVByMnphZVB1ZXpJdTV0Zkc2Mk5McHBublVhZ1hudmRreFMx?=
 =?utf-8?Q?QBD3hENHoHQVtpshxtV9kZho1RoxKV8DDkp1b9i?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3898.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b9802d5-837e-4365-8870-08d8ec4d4060
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Mar 2021 09:39:40.8970
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3IeoWWXmadbUAA00WiBnq2+hjl14jnHz9IZbsFI+Cu5hPDijHx/cHKTgSVY35ywB9tP4hrLMiAM5Z9NRphh6uQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3097
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR3VlbnRlciBSb2VjayA8
Z3JvZWNrN0BnbWFpbC5jb20+IE9uIEJlaGFsZiBPZiBHdWVudGVyIFJvZWNrDQo+IFNlbnQ6IEZy
aWRheSwgTWFyY2ggMTksIDIwMjEgMTE6MzYgUE0NCj4gVG86IFZhZGltIFBhc3Rlcm5hayA8dmFk
aW1wQG52aWRpYS5jb20+DQo+IENjOiBsaW51eC1od21vbkB2Z2VyLmtlcm5lbC5vcmcNCj4gU3Vi
amVjdDogUmU6IFtSZS1zZW5kIFBBVENIIGh3bW9uLW5leHQgdjIgMS8xXSBod21vbjogKG1seHJl
Zy1mYW4pIEFkZA0KPiBzdXBwb3J0IGZvciBmYW4gZHJhd2VycyBjYXBhYmlsaXR5IGFuZCBwcmVz
ZW50IHJlZ2lzdGVycw0KPiANCj4gT24gMy8xNi8yMSA1OjAyIEFNLCBWYWRpbSBQYXN0ZXJuYWsg
d3JvdGU6DQo+ID4gQWRkIHN1cHBvcnQgZm9yIGZhbiBkcmF3ZXIncyBjYXBhYmlsaXR5IGFuZCBw
cmVzZW50IHJlZ2lzdGVycyBpbiBvcmRlcg0KPiA+IHRvIHNldCBtYXBwaW5nIGJldHdlZW4gdGhl
IGZhbiBkcmF3ZXJzIGFuZCB0YWNob21ldGVycy4gU29tZSBzeXN0ZW1zDQo+ID4gYXJlIGVxdWlw
cGVkIHdpdGggZmFuIGRyYXdlcnMgd2l0aCBvbmUgdGFjaG9tZXRlciBpbnNpZGUuIE90aGVycyB3
aXRoDQo+ID4gZmFuIGRyYXdlcnMgd2l0aCBzZXZlcmFsIHRhY2hvbWV0ZXJzIGluc2lkZS4gVXNp
bmcgcHJlc2VudCByZWdpc3Rlcg0KPiA+IGFsb25nIHdpdGggdGFjaG9tZXRlci10by1kcmF3ZXIg
bWFwcGluZyBhbGxvd3MgdG8gc2tpcCByZWFkaW5nIG1pc3NlZA0KPiA+IHRhY2hvbWV0ZXJzIGFu
ZCBleHBvc2UgaW5wdXQgZm9yIHRoZW0gYXMgemVybywgaW5zdGVhZCBvZiBleHBvc2luZw0KPiA+
IGZhdWx0IGNvZGUgcmV0dXJuZWQgYnkgaGFyZHdhcmUuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5
OiBWYWRpbSBQYXN0ZXJuYWsgPHZhZGltcEBudmlkaWEuY29tPg0KPiANCj4gSSBoYWQgYXNrZWQg
Zm9yIGEgbnVtYmVyIG9mIGNoYW5nZXMgdG8gdjIuIFJlc2VuZGluZyB2MiB3aXRob3V0IGFkZHJl
c3NpbmcNCj4gYW55dGhpbmcgaXNuJ3QgcmVhbGx5IGhlbHBmdWwuDQoNCkhpIEd1ZW50ZXIsDQoN
CkkgYW0gc29ycnksIEkgbWlzc2VkIHRoZSBjaGFuZ2UgcmVsYXRlZCB0byB5b3VyIGNvbW1lbnQ6
IA0KIlRoZSBvdXRlciBkb3VibGUgKCggKSkgaXMgcG9pbnRsZXNzLiIuDQpJJ2xsIGZpeCBpdC4N
Cg0KSSB0aGluayBJIGhhbmRsZWQgeW91ciBvdGhlciBjb21tZW50cyBvciBJIGFtIHdyb25nPw0K
DQpTaG91bGQgSSBzZW5kIHBhdGNoIGFzIHYzIG9yIGFzIHYyPw0KDQpUaGFua3MsDQpWYWRpbS4N
Cg0KPiANCj4gR3VlbnRlcg0K
