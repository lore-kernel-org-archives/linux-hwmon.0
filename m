Return-Path: <SRS0=HmyG=SM=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 946D8C10F11
	for <linux-hwmon@archiver.kernel.org>; Wed, 10 Apr 2019 22:38:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4354320820
	for <linux-hwmon@archiver.kernel.org>; Wed, 10 Apr 2019 22:38:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nokia.onmicrosoft.com header.i=@nokia.onmicrosoft.com header.b="oESJOhWU"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726073AbfDJWiV (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 10 Apr 2019 18:38:21 -0400
Received: from mail-eopbgr150095.outbound.protection.outlook.com ([40.107.15.95]:17890
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726026AbfDJWiV (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 10 Apr 2019 18:38:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZbnhkaX99XDbSDe4XakXP3ZOcGtQ2jFDD/AxJT/VQjk=;
 b=oESJOhWU95f3zTptvaMZej3NKM8p6cX2sVu2B5yWqGM7iMT7aR7x+BUDtPI41CmdB0PYrnxCwLUsLMffGdSJWuB8nJmL14GotSMrdXlQd0aqu5cBjqpKX+5DnSNYZ4ChVRJQdKwoUPGz6ezlwU4dBKcgDC3f9pjpzU/TzjyEdIg=
Received: from HE1PR07MB3337.eurprd07.prod.outlook.com (10.170.247.12) by
 HE1PR07MB3081.eurprd07.prod.outlook.com (10.170.244.155) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1792.12; Wed, 10 Apr 2019 22:38:16 +0000
Received: from HE1PR07MB3337.eurprd07.prod.outlook.com
 ([fe80::cd23:d96f:5d94:cee6]) by HE1PR07MB3337.eurprd07.prod.outlook.com
 ([fe80::cd23:d96f:5d94:cee6%7]) with mapi id 15.20.1792.007; Wed, 10 Apr 2019
 22:38:16 +0000
From:   "Adamski, Krzysztof (Nokia - PL/Wroclaw)" 
        <krzysztof.adamski@nokia.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
CC:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "Sverdlin, Alexander (Nokia - DE/Ulm)" <alexander.sverdlin@nokia.com>
Subject: [PATCH 0/3] pmbus: extend configurability via sysfs
Thread-Topic: [PATCH 0/3] pmbus: extend configurability via sysfs
Thread-Index: AQHU7+4WnwUg46bLd0SvdhklBou6gA==
Date:   Wed, 10 Apr 2019 22:38:15 +0000
Message-ID: <cover.1554934898.git.krzysztof.adamski@nokia.com>
Accept-Language: pl-PL, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1P190CA0006.EURP190.PROD.OUTLOOK.COM (2603:10a6:3:bc::16)
 To HE1PR07MB3337.eurprd07.prod.outlook.com (2603:10a6:7:2d::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=krzysztof.adamski@nokia.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [131.228.2.28]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: da2472d9-661b-4acf-6dfa-08d6be0538ca
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600139)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:HE1PR07MB3081;
x-ms-traffictypediagnostic: HE1PR07MB3081:
x-microsoft-antispam-prvs: <HE1PR07MB308157B280938E81FE685234EF2E0@HE1PR07MB3081.eurprd07.prod.outlook.com>
x-forefront-prvs: 00032065B2
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(136003)(376002)(396003)(39860400002)(346002)(189003)(199004)(25786009)(107886003)(4326008)(36756003)(6512007)(81156014)(8676002)(81166006)(7736002)(305945005)(14454004)(53936002)(105586002)(186003)(486006)(2616005)(478600001)(52116002)(14444005)(26005)(256004)(106356001)(386003)(6506007)(476003)(6116002)(66066001)(6486002)(3846002)(6436002)(99286004)(97736004)(68736007)(5660300002)(71200400001)(71190400001)(316002)(86362001)(2906002)(8936002)(54906003)(110136005)(102836004);DIR:OUT;SFP:1102;SCL:1;SRVR:HE1PR07MB3081;H:HE1PR07MB3337.eurprd07.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nokia.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: LmeTi+1De3YB/6dgL0kCoqsCkvemGEYbpfJS4oy0awTz6+cVN7z+X4dP0ZBfW0xKFNi0vUbw3Np9CUndJR+9XgSAUYskmt/wDIc/ZmuKQemUoN+q61v4BsEq8c2eu1ewz/cP7L66seo4Dy5Shxsk8MdFH6YnwO+24rpg0WRWBntC9rC6qNAJrAXzmCQg2WcHQDekpnmrrx25Norn/0JYyACo+RxWxHgp+Mmov//U31o+PmcryoPKgd4CQjpjNoBlnTRvNVYOsOx76kR8wdbhA557oikjvqgpFrvpMD/qPRolrgMY4JeUrS0JWOz5GKya180m6ug8cFuSGuQSNDFeU1qC1eXzTdoZ7VyqYi1VJJQjFSaP9H63fk0f5SzoE9Q2bG8f/fDWoTrFMz1WBUBd3EomWnxfte1uf8DQpuzjLwM=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <E0F0118067D6BB4A893CAB4E10FB2C3E@eurprd07.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da2472d9-661b-4acf-6dfa-08d6be0538ca
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Apr 2019 22:38:15.9600
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR07MB3081
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi,

This patch series extends pmbus core for two specific use cases we have:
- First two patches allows lm25066 driver to export custom sysfs entry
  for controlling manufacturer specific SAMPLES_FOR_AVG register. It is
  useful to be able to set this register when using any of the *_average
  registers, especially since the default value means we are averaging 1
  sample which isn't that useful.
- Third patch exports m, b, R coefficients so that they can be adjusted
  by user space. We can't use default coefficients values and in order
  to achieve high accuracy, we calibrate then per device so using
  device-tree or similar concepts to store them is not an option too.
  Thus, we export it so that the logic of loading proper coeffs can
  be implemented in user space instead.

Krzysztof Adamski (3):
  pmbus: support for custom sysfs attributes
  lm25066: export sysfs attribute for SAMPLES_FOR_AVG
  pmbus: export coefficients via sysfs

 drivers/hwmon/pmbus/lm25066.c    |  45 +++++++++++++
 drivers/hwmon/pmbus/pmbus.h      |   3 +
 drivers/hwmon/pmbus/pmbus_core.c | 109 ++++++++++++++++++++++++++++++-
 3 files changed, 155 insertions(+), 2 deletions(-)

--=20
2.20.1

