Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87963C433B4
	for <linux-hwmon@archiver.kernel.org>; Tue, 11 May 2021 13:34:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4E00E6191C
	for <linux-hwmon@archiver.kernel.org>; Tue, 11 May 2021 13:34:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231443AbhEKNgC (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 11 May 2021 09:36:02 -0400
Received: from mail-bn7nam10on2059.outbound.protection.outlook.com ([40.107.92.59]:2560
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231401AbhEKNgB (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 11 May 2021 09:36:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ie5XEKYbwNwcGj4h3w1BNfDxhcSQ1hP/JaHBYldmutaCmzxuxVmFtizG2hL5V0//nVFaptcAz3zvxZgRbt079/XfEcO2E1kaUTYuWNwpeCVaJvZHH/IOiPVkPrJ78yXgJQYAvH93BpIJaGYCg5jp2ykZ9lsU655W7+EnJXMxTwlRcN9yVZq4E4Yh4Zo0LBBDNPu8rXiYOxKGTicp4OZ/2Tv2bQ7PE3M8NCBuvbOo4ESBEdOu7z6vJMPZs1sAnIKxizhHrAAwVAKIQKXQW7COxlRKHfvAm2YF6cvnD7azBmgUl7zDbnzjyN6qyAp5PMg5EqX31OWwn7LiUkKU/irSdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bi6nVHPdxls6TkJQDiwcgx7OQDwncC4CGCD/njWLMlM=;
 b=mjP5L8+YQy8zRLMJt/G6n+oDUplvB4NGXqiMuA+VoSggRKwuiQHayzfsPTCkR+qrNI6AxbMgrA0ADyY/YhqdlAP7MjXL2SfNjfQA35bY5ouGcfv/MyFJjd8DkTxXaPv/SDfcVey5awbeqbobm1V8mEZQfLf/cFkzD04U220lX+Ob4Jco+f+M1v1WZDvsKbabSrLcc3a0n7lCtqExUuxjN8Y5oSc5GS35SyV86R5O/lfNl29SwX1CebErSxkJkGeu9APkaRz2or+b5ae7BMhtKvBbTJeEID76uiWjLiethOVeHcZuIoDAHyVynEXIzFJpD7S+qi7b0k+Wems6HVgvFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bi6nVHPdxls6TkJQDiwcgx7OQDwncC4CGCD/njWLMlM=;
 b=RDt5uzZ+t25GKuL+JB479kFx+2Iu1GkxCqePzoKSMrLlOeV2O0i1MUqnWAJCr9BujHAXWWTtAIa7UYO/9Md09y9zONH+JIdPIP377RBb2z99mnQXLHpfTvel8GedqXtmsMYhFelg3/5rJjC2yGRjYELm0PY2TjPXLY9XirKgsMNSmCeibqIUG5zYA2f9oK7iLzdnUy2fIFTC+XDWTGZxk0CWO/EA1R+LOGidjtTuejOWiVHcQg6YpxEycPwr/2DUPEnveZ4q9BiJg3Gk6InJfjEzaL56I2bDDDdS8Zsp39f3XynOWnO12X0BfJMLoUaiHr42HXsvY6+P/7QhII+kVw==
Received: from DM6PR12MB3898.namprd12.prod.outlook.com (2603:10b6:5:1c6::18)
 by DM5PR12MB1929.namprd12.prod.outlook.com (2603:10b6:3:106::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.26; Tue, 11 May
 2021 13:34:53 +0000
Received: from DM6PR12MB3898.namprd12.prod.outlook.com
 ([fe80::dce6:427d:df17:3974]) by DM6PR12MB3898.namprd12.prod.outlook.com
 ([fe80::dce6:427d:df17:3974%5]) with mapi id 15.20.4108.031; Tue, 11 May 2021
 13:34:53 +0000
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
CC:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [PATCH hwmon-next v7 0/3] Add support for MPS Multi-phase mp2888
 controller
Thread-Topic: [PATCH hwmon-next v7 0/3] Add support for MPS Multi-phase mp2888
 controller
Thread-Index: AQHXRipuLL+jULWEu0a+/2x+DAlvKKreR78AgAAAP7A=
Date:   Tue, 11 May 2021 13:34:53 +0000
Message-ID: <DM6PR12MB38985D51FA4430D1CD1F6303AF539@DM6PR12MB3898.namprd12.prod.outlook.com>
References: <20210511055619.118104-1-vadimp@nvidia.com>
 <b967ca2a-acb6-6b76-7aee-788126f910e7@roeck-us.net>
In-Reply-To: <b967ca2a-acb6-6b76-7aee-788126f910e7@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=nvidia.com;
x-originating-ip: [46.117.116.151]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 75ee7d13-dfff-469b-0da0-08d914818f34
x-ms-traffictypediagnostic: DM5PR12MB1929:
x-microsoft-antispam-prvs: <DM5PR12MB192958547D9C5E32F833E3AEAF539@DM5PR12MB1929.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3DD9XFG074L+U04Bj0TqUMTa2/syxCBPA4xeBgDEuHjt6ryfs/LiEYKBrPhMx6lfU5ZHcgKxzCcv50yKF/k3kvVd0uROMYCXq53Bu8lra3JQPV7NgUye50hGx2627xfVFezcBE3ob35O8vMmwcHMYRdvU6BsIx6q1No20qI1jmyPc8yxefvpuLi9FwszPfGLQFIn5m6AXQ40qdeYZdSlqpEZbQX4itRhOiYC6Sxb+smHgRg/RmSs6Ug5Mj0jhONlMUP7fjFc6SUuD/PnmumWTfPdVujlfiDF9yYV9v02rM5jc8FOfTosVErGZ+W9aiaERD5BPqMnLsm9SQbLICE5k9j4F1bNiaLGGflN66RHVZz5W21vrEbHxc3LgbwtqwB0/qsYRhBepT9oGU8rZXq1mqhtXoKxHFIAZaq9fl/p3GhAco053oTa71JYlhWij+wgj8UA7h4cGVhyB5Uf7/J5ckSNxE5Mm1pIxvl8RftIRdtCjIF1tFzmLSeCMv6mxjwR36nLhtvm40qQA4ZVsJrCbUmaJCy0rF3lHATrvqlGdl2RHfxFPtk8hdPX2I4CqqO7kKxSc6bwe0W0REWBhFg8v1vDBFKJJClA4VCYPiKfrGo=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB3898.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(136003)(346002)(366004)(376002)(66446008)(83380400001)(2906002)(66556008)(64756008)(8676002)(7696005)(66476007)(33656002)(54906003)(110136005)(71200400001)(26005)(86362001)(66946007)(76116006)(316002)(6506007)(186003)(52536014)(8936002)(38100700002)(478600001)(4326008)(122000001)(9686003)(53546011)(5660300002)(55016002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?L1FkNkE3U3owQkFDUWpwRW5HdmpSZUNsWENIak41OUVGaDBENFM3blFGQk5S?=
 =?utf-8?B?N0tDa0t1dXNUY2RNMUw4N0phV1NscmVxdmdPSEg3cndSOVRSTnhWL2hMMWlX?=
 =?utf-8?B?TkJDcnowQ1hnSVNMTDJ6bS9vMnkrUkpOMy9WZlpMeldnZ3RVYjJxYlhmalFE?=
 =?utf-8?B?VEJlcmJFVUx3QmErTnZ6V0Q1MGx2R1hoMXQxTi9yZVVTMGgrQ2QwdjJOTDlF?=
 =?utf-8?B?cDM0RmJheU9FcWpocEFIS3JmYjJNd0lmUEdSRkxpZ1hEcS9HckVBSm8vMGY1?=
 =?utf-8?B?MERlS1BwS0NpMksxQXBpOFFBUTVURWRNS1llM3REU3BBSVZ5N1hwWTROaHFJ?=
 =?utf-8?B?aUFxdzJ6em9aVHpMdVZpYTBtajdlaFBsQiszdXFNbkV4MWpuaW4xUlJDNnJn?=
 =?utf-8?B?a0ZWZU55TXN3NHNNVGZWTnZ5ejhlSXBqazFQeENaNzZRZVZvSTYrZC9DN1c1?=
 =?utf-8?B?TFA5UEF1WHJCNXZSWXNGRDQvZmozaXFMVDZ6K0pQN0dlZ1EzVThRVjNGeU1J?=
 =?utf-8?B?VHBmY0d1NGxPQWV6cDVvZGpDTFBsSEVUR0tmcWJhQnlFR1E2VmVBVUhlaFZs?=
 =?utf-8?B?L0NpdCtQNGM4a0ZSYVlGMVk4cHVUZkFqeUd1WGdkSkIzWjdHbWRyejM0dEZF?=
 =?utf-8?B?RnBkVEVjYnJKdUtxamJlVHV5b2V2a0QrV1N6KzlWKzBaNDBjb1JNRVZLK1BL?=
 =?utf-8?B?RzQ5VE5qOVIzWFMwdmpuUmNLSDlpdVFlN3FHSE1yN29mcFh4MU1aSFlVSzNi?=
 =?utf-8?B?bmxFMURUbzU0R2pVTzYzZHlLN0ZyU0hZZE5VdXc1SDh0Ymd4VE5aeS9Oa09o?=
 =?utf-8?B?Smk2YTV0dlR5V2pKSWFudHl2UUxrQ0xMaU5nYlZkcFpMcmhpd2pwMXVLR1Bu?=
 =?utf-8?B?YnNGSkFiUzVrZDQ2YkxNMkNUck12REVjUzJDNDllWENIaklGWExFaURVVXYw?=
 =?utf-8?B?YWRtMnhNTnI5cXUyY3pPcU43dExHQnFNNW9KaytuMlFYSFdwNGgycVdZUCt6?=
 =?utf-8?B?eU92SkpVbXlZK0ZLN2JsKy81MGVHQ1p1akpQUEdaWEx5dzYwSUp4QW9hdUZW?=
 =?utf-8?B?R3RPRDVlRGRwMFU1SDFZc081eWJ5OWxERFFMOVB4RG1PR3k1UGRvakhJcnFo?=
 =?utf-8?B?Y29GZnVBQWdjV0pVKzd4NGROakFjRUhBODJOdk9JODUrTDlFYUwydHg2Vkd3?=
 =?utf-8?B?bkI1S0NJNXBxZSs4TW5ycElYK2ZWOE9vLyt5VkxuazZXTTFkeEZZR1h3aFZM?=
 =?utf-8?B?MEJZWEh1ampDeHJYM0FZK0VHc3c2UUVWbjFtenVINzgxZTVKZTA4d09vZFVs?=
 =?utf-8?B?TjV0Vzh3azZoR1VzU29WWGdrV29ZNmM5Mk04ay8wYTNjaU1Nb3Q1TzZjUHdK?=
 =?utf-8?B?a1g4VHdwb0YvMUVKUmNiVDA2eDhoalRyNE03RUJSNzQ4TGhvaEJSZmJiaEVj?=
 =?utf-8?B?ZjUwYTYzbVA0bjJheFV5WW9vUHFFSUVGVlRLNHBZdjU3Sm9HZjhienYxZlFI?=
 =?utf-8?B?MUtsbkg4TFRCM2tnSnQ5QVdqVk1qd2l2NTN4ekRsbGNLWVdBT3hrZjJuQUcv?=
 =?utf-8?B?OGM5VlFwcysyM1pQQm9jc1hWZWtFNC9oZmt1OGhVZDJyNzI3NnFEckVPNGNk?=
 =?utf-8?B?VC9pTWJtN2Z3VkpOWVo5eDYvUDFzMGRSSGZUbk01QVFlRjR6dFowMHlyRnV4?=
 =?utf-8?B?Slk5Sk9lNnJxMERQMnVXVWl2YTJPV1Y1YnVkWDZMT2JMUVdVSEpoMzJ0SFdD?=
 =?utf-8?Q?0CluYMj7iFKrC+PnPuUSJEm8nEqNIpJSBmdcnmU?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3898.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75ee7d13-dfff-469b-0da0-08d914818f34
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 May 2021 13:34:53.4016
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AQBDBa055VkqbjzO9bY8/fxuTb/i9yQgTH66PKomAAB+vFIisgENd3DMPkLJ7mNsgKXm21ZhYjKtJmA/i4Aleg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1929
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR3VlbnRlciBSb2VjayA8
Z3JvZWNrN0BnbWFpbC5jb20+IE9uIEJlaGFsZiBPZiBHdWVudGVyIFJvZWNrDQo+IFNlbnQ6IFR1
ZXNkYXksIE1heSAxMSwgMjAyMSA0OjMyIFBNDQo+IFRvOiBWYWRpbSBQYXN0ZXJuYWsgPHZhZGlt
cEBudmlkaWEuY29tPjsgcm9iaCtkdEBrZXJuZWwub3JnDQo+IENjOiBsaW51eC1od21vbkB2Z2Vy
Lmtlcm5lbC5vcmc7IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggaHdtb24tbmV4dCB2NyAwLzNdIEFkZCBzdXBwb3J0IGZvciBNUFMgTXVsdGktcGhhc2UN
Cj4gbXAyODg4IGNvbnRyb2xsZXINCj4gDQo+IE9uIDUvMTAvMjEgMTA6NTYgUE0sIFZhZGltIFBh
c3Rlcm5hayB3cm90ZToNCj4gPiBBZGQgZHJpdmVyIGFuZCBkb2N1bWVudGF0aW9uIGZvciBtcDI4
ODggZGV2aWNlIGZyb20gTW9ub2xpdGhpYyBQb3dlcg0KPiA+IFN5c3RlbXMsIEluYy4gKE1QUykg
dmVuZG9yLiBUaGlzIGlzIGEgZGlnaXRhbCwgbXVsdGktcGhhc2UsDQo+ID4gcHVsc2Utd2lkdGgg
bW9kdWxhdGlvbiBjb250cm9sbGVyLg0KPiA+DQo+ID4gUGF0Y2ggc2V0IGluY2x1ZGVzOg0KPiA+
IFBhdGNoICMxIC0gaW5jcmVhc2VzIG1heGltdW0gbnVtYmVyIG9mIHBoYXNlcy4NCj4gPiBQYXRj
aCAjMiAtIHByb3ZpZGVzIG1wMjg4OCBkcml2ZXIgYW5kIGRvY3VtZW50YXRpb24uDQo+ID4gUGF0
Y2ggIzMgLSBwcm92aWRlc3kgYmluZGluZyBkb2N1bWVudGF0aW9uLg0KPiA+DQo+IA0KPiBTZXJp
ZXMgYXBwbGllZC4NCg0KVGhhbmsgeW91LCBHdWVudGVyLg0KDQpJIHNlZSBmcm9tIHRoZSBmb2xs
b3dpbmcgZXJyb3JzIGZyb20gcm9ib3Q6DQo+PiBFUlJPUjogbW9kcG9zdDogbW9kdWxlIG1wMjg4
OCB1c2VzIHN5bWJvbCBwbWJ1c19kb19wcm9iZSBmcm9tIG5hbWVzcGFjZSBQTUJVUywgYnV0IGRv
ZXMgbm90IGltcG9ydCBpdC4NCj4+IEVSUk9SOiBtb2Rwb3N0OiBtb2R1bGUgbXAyODg4IHVzZXMg
c3ltYm9sIHBtYnVzX3JlYWRfd29yZF9kYXRhIGZyb20gbmFtZXNwYWNlIFBNQlVTLCBidXQgZG9l
cyBub3QgaW1wb3J0IGl0Lg0KPj4gRVJST1I6IG1vZHBvc3Q6IG1vZHVsZSBtcDI4ODggdXNlcyBz
eW1ib2wgcG1idXNfd3JpdGVfd29yZF9kYXRhIGZyb20gbmFtZXNwYWNlIFBNQlVTLCBidXQgZG9l
cyBub3QgaW1wb3J0IGl0Lg0KPj4gRVJST1I6IG1vZHBvc3Q6IG1vZHVsZSBtcDI4ODggdXNlcyBz
eW1ib2wgcG1idXNfZ2V0X2RyaXZlcl9pbmZvIGZyb20gbmFtZXNwYWNlIFBNQlVTLCBidXQgZG9l
cyBub3QgaW1wb3J0IGl0Lg0KDQpXaGF0IGRvZXMgaXQgbWVhbj8NCg0KPiANCj4gVGhhbmtzLA0K
PiBHdWVudGVyDQoNCg==
