Return-Path: <SRS0=yVNc=SP=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04066C10F11
	for <linux-hwmon@archiver.kernel.org>; Sat, 13 Apr 2019 16:02:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B24F92084D
	for <linux-hwmon@archiver.kernel.org>; Sat, 13 Apr 2019 16:02:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nokia.onmicrosoft.com header.i=@nokia.onmicrosoft.com header.b="Hnw3vwaN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727048AbfDMQC5 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 13 Apr 2019 12:02:57 -0400
Received: from mail-eopbgr150110.outbound.protection.outlook.com ([40.107.15.110]:59495
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726998AbfDMQC5 (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 13 Apr 2019 12:02:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UvmGEqlfm0NyEKoQK1aIX+gwwnUqWWFA3Ua1The37JA=;
 b=Hnw3vwaNA8TXWGCfNQwrm2oP0vYiQRLtvXIUSiHHOqpGQx+TOfQpb6kl+SBh3fHwJkHCsw6q5Qlj//RvpsBtI43Gn3WR9qsIxn4p3PJsLANbPO/nOUgFBMcdEvSYsT5i66NAkyfMf5PVqW7154ejzpAqHOg1YNM2HD7BTLYD87M=
Received: from HE1PR07MB3337.eurprd07.prod.outlook.com (10.170.247.12) by
 HE1PR07MB4219.eurprd07.prod.outlook.com (20.176.166.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1813.9; Sat, 13 Apr 2019 16:02:52 +0000
Received: from HE1PR07MB3337.eurprd07.prod.outlook.com
 ([fe80::cd23:d96f:5d94:cee6]) by HE1PR07MB3337.eurprd07.prod.outlook.com
 ([fe80::cd23:d96f:5d94:cee6%7]) with mapi id 15.20.1813.009; Sat, 13 Apr 2019
 16:02:52 +0000
From:   "Adamski, Krzysztof (Nokia - PL/Wroclaw)" 
        <krzysztof.adamski@nokia.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
CC:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "Sverdlin, Alexander (Nokia - DE/Ulm)" <alexander.sverdlin@nokia.com>
Subject: [PATCH v2 0/3] pmbus: extend configurability via sysfs
Thread-Topic: [PATCH v2 0/3] pmbus: extend configurability via sysfs
Thread-Index: AQHU8hJZqYUL1niQz0y1HY91QncoFA==
Date:   Sat, 13 Apr 2019 16:02:52 +0000
Message-ID: <cover.1555151924.git.krzysztof.adamski@nokia.com>
Accept-Language: pl-PL, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1P190CA0051.EURP190.PROD.OUTLOOK.COM (2603:10a6:7:52::40)
 To HE1PR07MB3337.eurprd07.prod.outlook.com (2603:10a6:7:2d::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=krzysztof.adamski@nokia.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [131.228.2.29]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d4725d83-f4e6-4868-ee4b-08d6c0297bc6
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600139)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:HE1PR07MB4219;
x-ms-traffictypediagnostic: HE1PR07MB4219:
x-microsoft-antispam-prvs: <HE1PR07MB4219E9102DCF43EE542532C2EF290@HE1PR07MB4219.eurprd07.prod.outlook.com>
x-forefront-prvs: 00064751B6
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(396003)(39860400002)(346002)(366004)(136003)(189003)(199004)(6436002)(99286004)(54906003)(14444005)(256004)(71200400001)(71190400001)(97736004)(81166006)(81156014)(66066001)(8676002)(68736007)(6512007)(8936002)(110136005)(316002)(6506007)(386003)(186003)(102836004)(26005)(86362001)(5660300002)(106356001)(105586002)(6116002)(2906002)(36756003)(478600001)(52116002)(53936002)(107886003)(4326008)(6486002)(25786009)(3846002)(7736002)(14454004)(305945005)(476003)(486006)(2616005);DIR:OUT;SFP:1102;SCL:1;SRVR:HE1PR07MB4219;H:HE1PR07MB3337.eurprd07.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nokia.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: GvWe0yy5CkQxpLlK9m59fFoe1CJt0CD3NmloPrEtlRQ8CFKb7nMWcfmkvbcAmgCfFIIvNsegLaquCdlaIm8vhaZt+rzuFHtctb7ZbADcpUlKdIBRGyvz3WiNRPzguSqGVOpFNfErxoaroJU/R+SBHbltubSMh0WMyrWXunx7zABX90yiJBtABlbK/mjIMiGTs0Tzdd42mOiu70IIefkxfKQNMUTvUzg3dusYUJsGOmZZG3BYgqM7TnJjRZcjSmkU5TC+DQMUEBFCht3hnlUam268FshgAFs7DXOCJe4zo6WXOkw1od6bh9k5gTFmLVi6OfiXQVa22c9Rj0JCT4896M+tk8r/k4P/em2J/VNnRBPfSglaGaeT8PuH7TPJq7179NY/pgJLW9gPEVkHNT98DUGKgblt2wK0lp3ALy/4EM8=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <F40279131385AD4DAC4EB9D49AF79DFE@eurprd07.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4725d83-f4e6-4868-ee4b-08d6c0297bc6
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Apr 2019 16:02:52.5713
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR07MB4219
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi,

I'm posting updated version of this patchet. I think first two patches
implement things in the way that where suggested by Guenter (using
PMBUS_VIRT_*). I have to admit, I like this better than using custom
sysfs approach from v1.

I'm also posting updated version of the patch exporting coefficients
even though it was not liked by Guenter. I hope you could reconsider as
I think your arguments would be completely valid if it was "raw" hwmon
device but for pmbus devices, values are already reported in real-world
units and all drivers using "direct" mode uses those coefficients and
the only way userspace could adjust those reported values knowing proper
coefficients would be to also know the coefficients used and basically
reverse the calculations made by kernel and made them with proper
coeffs. While doable, I don't find this elegant or practical. If we
already do conversion in the kernel, I think there should be a way to
make sure this conversion produces sane values.

This patch series extends pmbus core for two specific use cases we have:
- First two patches allows lm25066 driver to set number of samples for
  average values (by controlling manufacturer specific SAMPLES_FOR_AVG
  register). It is useful to be able to set this register when using any
  of the *_average registers, especially since the default value means
  we are averaging 1 sample which isn't that useful.
- Third patch exports m, b, R coefficients so that they can be adjusted
  by user space. We can't use default coefficients values and in order
  to achieve high accuracy, we calibrate then per unit so using
  device-tree or similar concepts (which are generally shared by all
  board of the same type) to store them is not an option too. Thus, we
  export it so that the logic of loading proper coeffs can be
  implemented in user space instead.

v2 changes:
- PMBUS_VIRT_* registers used instead of custom sysfs groups for
  configuring samples for average
- coeffs are only exported as sysfs attirbutes if the format used is
  "direct"
- fixed memory allocation issue in coeffs patch

Krzysztor Adamski (3):
  pmbus: introduce PMBUS_VIRT_*_SAMPLES registers
  lm25066: support SAMPLES_FOR_AVG register
  pmbus_core: export coefficients via sysfs

 Documentation/hwmon/sysfs-interface |  18 +++
 drivers/hwmon/pmbus/lm25066.c       |  15 +-
 drivers/hwmon/pmbus/pmbus.h         |  15 ++
 drivers/hwmon/pmbus/pmbus_core.c    | 213 +++++++++++++++++++++++++++-
 4 files changed, 258 insertions(+), 3 deletions(-)

--=20
2.20.1

