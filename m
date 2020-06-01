Return-Path: <SRS0=6S3t=7O=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E6AFC433DF
	for <linux-hwmon@archiver.kernel.org>; Mon,  1 Jun 2020 11:12:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D4408206E2
	for <linux-hwmon@archiver.kernel.org>; Mon,  1 Jun 2020 11:12:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=maximintegrated.onmicrosoft.com header.i=@maximintegrated.onmicrosoft.com header.b="RZGZXZSk"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725935AbgFALMk (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 1 Jun 2020 07:12:40 -0400
Received: from mail-dm6nam11on2099.outbound.protection.outlook.com ([40.107.223.99]:28129
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725788AbgFALMj (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 1 Jun 2020 07:12:39 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h3lUjQg6qmstrosblKFsLShJVrrV1fVqAp0NMLesBRdO/NejiidXqoFQsbgPr3TwyUkvBpqt/qB5TzmV423KAF6sgCcYyLfgoKvKEkDLvit03POchx10TZzt0rZwDhRS6P7h/EmSxN566C6nQ162yZ6njatrIKPV5WNanUZ7w1FxeK79tq4DtUx2k/B9+Cov998XnEG6US3E0/ar9soVeYF7Na3xsT5qnncujNV6deh3EB9IEmwIbY6gQvuxX++Ro63D+qIp1STmxKTRH0Swwt8KGcnvtMbhY+Co34usWjXHa75OI3T3/HY/z7nk+C6gCswN/yW/SGcCW7oLihePlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sBCJqrDsUzjKY40KTPri41wo+x4g5a/bUIlH8A88aKo=;
 b=iSXqy7hbbJeY8K0lKG0Ij+4tj/3AoD/yGQqyq5TOq8dMbme4i/DtQ+UL8Q6gY4arI4Xur9ZpBKT6mEuFn4w6hiFNm0JMnMQfGhzu3fcDSF0HqKE9RXsfG0N42zxPmV93FthA1ZtXJm03M+ZRnCQEDXfpiLdouvEB121ph/wiCEBRf1HP3x8VQZzEokDe97R+YBvXyBPB7bJEP9NX9VpCQnR0BNjRBWQOn+EuS1QCpwxOy5efRNmwufZchUe7rGU2oVo1yKiYPF2IObkt2N+X365eo+PfJpc8WFg+M94mAffFzqaVn0dV9jtdnBv6ev2yVvVeamK//FhjieSQDHYOHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=maximintegrated.com; dmarc=pass action=none
 header.from=maximintegrated.com; dkim=pass header.d=maximintegrated.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=maximintegrated.onmicrosoft.com;
 s=selector2-maximintegrated-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sBCJqrDsUzjKY40KTPri41wo+x4g5a/bUIlH8A88aKo=;
 b=RZGZXZSkEEIwPTfuStwPVX1u1vuytfLzeOL5B2xjh9TZ2s5cPneqshcjqSq8yl/iHFPawNup1a/rIaz0QfuJ1sSd8PeIIKJkcIydYA849l9vkeplqA+DsP74/QqeVjjYp1Wqf8YPa2vVU2PtCo5LHcLxPRINodBWxdsOmEk/VvQ=
Received: from MWHPR11MB1661.namprd11.prod.outlook.com (2603:10b6:301:b::16)
 by MWHPR11MB1549.namprd11.prod.outlook.com (2603:10b6:301:c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.22; Mon, 1 Jun
 2020 11:12:37 +0000
Received: from MWHPR11MB1661.namprd11.prod.outlook.com
 ([fe80::6c65:6b11:a837:e9b1]) by MWHPR11MB1661.namprd11.prod.outlook.com
 ([fe80::6c65:6b11:a837:e9b1%10]) with mapi id 15.20.3045.024; Mon, 1 Jun 2020
 11:12:37 +0000
From:   Ugur Usug <Ugur.Usug@maximintegrated.com>
To:     Guenter Roeck <linux@roeck-us.net>
CC:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: Questions on hwmon/pmbus MAX20796 driver update
Thread-Topic: Questions on hwmon/pmbus MAX20796 driver update
Thread-Index: AdY4BYZlNOY1H7yGQme0jiZVjzz6/Q==
Date:   Mon, 1 Jun 2020 11:12:37 +0000
Message-ID: <MWHPR11MB16618819D60E71E952652ABCFD8A0@MWHPR11MB1661.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none
 header.from=maximintegrated.com;
x-originating-ip: [176.55.6.166]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 9602561e-8b9c-4d60-d463-08d8061cb107
x-ms-traffictypediagnostic: MWHPR11MB1549:
x-microsoft-antispam-prvs: <MWHPR11MB15497A205534EFB611AD6487FD8A0@MWHPR11MB1549.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0421BF7135
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DMnBrl35mZ2mZj6n1SOYLwcjol/GYQJw1cYNIVMnVxuEnUzzmIznU1IAQQwir3Lm70ygvivYsLpJRM2dCyxzeYGqTBggXGlt1pTGjZN1G1lqLl4rzn9rkxivcT0tBxJP8sSPLOBu2MnbJI2ZL1BtXP3Xak28LwsAZJ9rkYApz8VIqA4iP2PP6d1ViTE5xTwOgrnxIcPGB3bgPx+JD6VpBTbutcYSDnLaBDkssIWAqorJk+sWILSR4Rju9MtSrWwwk+h/G61yjSTPmrgCtl8LB1paNoAJsaMmh8/LjStB+GUTM8IkBon9njVQug+h6vlF
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR11MB1661.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(396003)(376002)(346002)(39860400002)(136003)(186003)(26005)(6506007)(71200400001)(86362001)(478600001)(2906002)(316002)(5660300002)(52536014)(4744005)(7696005)(66446008)(33656002)(8936002)(8676002)(6916009)(9686003)(66946007)(55016002)(76116006)(64756008)(66556008)(66476007)(4326008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: AKtHxa1Xb40enF+q6DYbrukSWA6nmDYYPjaeN3lJTTadwKwMLHelOdQJjjh6JSkRvqam5M1eXAcqZFYmsufAKjyqFIH/1mjgv/TMXPse2BH0wj4LuE3jwSPCrqhieUjYzvHTjZ4XJxr8BNb1fpF8yM9+PcfA3R9tawtHlmUtEEqyauA4xoGV91PH0Ylo7/wMjmI7pA976gE9deL976N9FjQ5039Srzuk32LX5TCGPpz6kXqf5WZbkLbq/6ujUHIxG4aaboNhQ+lA/nqYg2ljg6xtgCTMrX44c03dTphj8oyvSv2xv4+OTIT3eqcnnVzbjRUBEPSweg5X8Msw083Rgml68JiNKULp6rjgBIhjzHqLCErEgKYifz2xMMhaXXq46j+KLP3vBTWhldZJqlfSwL1KvBGv1Pjs7e8UtZ9aG2+MTnMfkzfPHFqistyvQXoEdC9MF92XtywPmzhVZkZNgV2SwiJ7sQo+lNeHce9cFg8=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: maximintegrated.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9602561e-8b9c-4d60-d463-08d8061cb107
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jun 2020 11:12:37.0587
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fbd909df-ea69-4788-a554-f24b7854ad03
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bdg95cnTdstd/S5sRg+2wqeKLq6d4s0iTE8wP1pb787HqNiLhDID7VNC7goIgYtkfA28zROsPEfqxXF5FItmArdINtNpLcxQhZql5fdMtLc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1549
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Guenter,

We want to add new device specific functionalities to existing support with=
 common pmbus.c on MAX20796. We want to cover some Maxim specific features =
and registers. We would like to take your suggestions on this? Could we cre=
ate a separate pmbus/max20796.c file for this and retract the existing comm=
on support from pmbus.c?

Thanks,
Ugur
