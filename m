Return-Path: <SRS0=Is7H=SN=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB5F0C10F14
	for <linux-hwmon@archiver.kernel.org>; Thu, 11 Apr 2019 07:53:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B55E8217D4
	for <linux-hwmon@archiver.kernel.org>; Thu, 11 Apr 2019 07:53:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nokia.onmicrosoft.com header.i=@nokia.onmicrosoft.com header.b="fwZha0NH"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726139AbfDKHx6 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 11 Apr 2019 03:53:58 -0400
Received: from mail-eopbgr40098.outbound.protection.outlook.com ([40.107.4.98]:7492
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726121AbfDKHx5 (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 11 Apr 2019 03:53:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wpSeVaqPDrwCSJbrAJOQWCbUIJ+BOTDuMl0DumswCSo=;
 b=fwZha0NHfBYh+RkMt+MZbmdOOplanlEwcicr9DQumdhSkFrBO+KxmQnZVMT8SIKFN0O3TQkIq4SfVhSXCyQgh5dmiWrG5IuH2R3RDyFDSVDyTsPwka18L3Ng2wXQQXBhqatFf7OOaFqeVa+L55YpF2tfn//9npNm3w5DgCAjqnQ=
Received: from HE1PR07MB3337.eurprd07.prod.outlook.com (10.170.247.12) by
 HE1PR07MB3129.eurprd07.prod.outlook.com (10.170.245.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1792.11; Thu, 11 Apr 2019 07:53:53 +0000
Received: from HE1PR07MB3337.eurprd07.prod.outlook.com
 ([fe80::cd23:d96f:5d94:cee6]) by HE1PR07MB3337.eurprd07.prod.outlook.com
 ([fe80::cd23:d96f:5d94:cee6%7]) with mapi id 15.20.1792.007; Thu, 11 Apr 2019
 07:53:53 +0000
From:   "Adamski, Krzysztof (Nokia - PL/Wroclaw)" 
        <krzysztof.adamski@nokia.com>
To:     Guenter Roeck <linux@roeck-us.net>
CC:     Jean Delvare <jdelvare@suse.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "Sverdlin, Alexander (Nokia - DE/Ulm)" <alexander.sverdlin@nokia.com>
Subject: Re: [PATCH 1/3] pmbus: support for custom sysfs attributes
Thread-Topic: [PATCH 1/3] pmbus: support for custom sysfs attributes
Thread-Index: AQHU7+4igeeyk2Je+U2mqjLXNW/gsKY2HQeAgAB6dwA=
Date:   Thu, 11 Apr 2019 07:53:53 +0000
Message-ID: <20190411075340.GB28466@localhost.localdomain>
References: <cover.1554934898.git.krzysztof.adamski@nokia.com>
 <28f92a8e63ce4b0e1071e8fdb2315a057daee9c6.1554934898.git.krzysztof.adamski@nokia.com>
 <b3f0de78-e3bc-5c73-e732-9fa62c3404cf@roeck-us.net>
In-Reply-To: <b3f0de78-e3bc-5c73-e732-9fa62c3404cf@roeck-us.net>
Accept-Language: pl-PL, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR08CA0073.eurprd08.prod.outlook.com
 (2603:10a6:7:2a::44) To HE1PR07MB3337.eurprd07.prod.outlook.com
 (2603:10a6:7:2d::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=krzysztof.adamski@nokia.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [131.228.32.185]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 29d278ab-e3e6-4e47-fe0f-08d6be52d7bb
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600139)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:HE1PR07MB3129;
x-ms-traffictypediagnostic: HE1PR07MB3129:
x-microsoft-antispam-prvs: <HE1PR07MB3129632EE026D5E1C5D0B06FEF2F0@HE1PR07MB3129.eurprd07.prod.outlook.com>
x-forefront-prvs: 00046D390F
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(39860400002)(366004)(136003)(396003)(346002)(376002)(199004)(189003)(229853002)(6486002)(61506002)(2906002)(66066001)(86362001)(316002)(1076003)(81156014)(54906003)(14444005)(9686003)(8936002)(256004)(8676002)(68736007)(81166006)(26005)(476003)(7736002)(102836004)(486006)(186003)(52116002)(99286004)(305945005)(53936002)(6512007)(3846002)(6246003)(6916009)(107886003)(6116002)(4326008)(76176011)(5660300002)(33656002)(25786009)(478600001)(14454004)(6436002)(105586002)(386003)(71200400001)(106356001)(71190400001)(6506007)(97736004)(446003)(11346002);DIR:OUT;SFP:1102;SCL:1;SRVR:HE1PR07MB3129;H:HE1PR07MB3337.eurprd07.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nokia.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: TO9XqIt7l+iBs7cqPmvpVMzrqgGxnje7EIANhl38eAsZcwCzmC7N+Gz0UE9xlKMlZCRnUV+AnX7AnIGAVh9WODs5ryT6qnTGw3v2L5D/9Un5k0CNwLNxEsL1meEGyW3bIIFeykqyK1nctMIMeXEr9iUBxnXLu0nf8boIGa2b5SLqPQs1JYujLRTeLW0T0uPDYyWj1GS3TBdaTblcLxZNCCI8v7a/h28SchUEUJ0lbh3R60v4+khHB3X6vxBYgoAjxLeUjOpVrmNxv2fpm+2CxH9gg13qhbNtjoTZhglFKJLbgXr/g6T/0VjvMkdzq0MHqTqQ1Zl0Wq60KIK/rrXNKgJvQoKb07BVXYG9chNnDTAeCeJXu0/3+l9DI7HUlstI0fw/g6dHArcqcS2lXBwzl2dZQzGdeu6biogh8jgrlxk=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <07AD60F29C3AB3458E668C6808BFC6E1@eurprd07.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29d278ab-e3e6-4e47-fe0f-08d6be52d7bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Apr 2019 07:53:53.8263
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR07MB3129
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, Apr 10, 2019 at 05:35:21PM -0700, Guenter Roeck wrote:
>On 4/10/19 3:38 PM, Adamski, Krzysztof (Nokia - PL/Wroclaw) wrote:
>>This patch makes it possible to pass custom struct attribute_group array
>>via the pmbus_driver_info struct so that those can be added to the
>>attribute groups passed to hwmon_device_register_with_groups().
>>
>>This makes it possible to register custom sysfs attributes by PMBUS
>>drivers similar to how you can do this with most other busses/classes.
>>
>>Signed-off-by: Krzysztof Adamski <krzysztof.adamski@nokia.com>
>>---
>>  drivers/hwmon/pmbus/pmbus.h      |  3 +++
>>  drivers/hwmon/pmbus/pmbus_core.c | 13 ++++++++++++-
>>  2 files changed, 15 insertions(+), 1 deletion(-)
>>
>>diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
>>index 1d24397d36ec..fb267ec11623 100644
>>--- a/drivers/hwmon/pmbus/pmbus.h
>>+++ b/drivers/hwmon/pmbus/pmbus.h
>>@@ -417,6 +417,9 @@ struct pmbus_driver_info {
>>  	/* Regulator functionality, if supported by this chip driver. */
>>  	int num_regulators;
>>  	const struct regulator_desc *reg_desc;
>>+
>>+	/* custom attributes */
>>+	const struct attribute_group **groups;
>
>I can understand the need and desire for one additional group. More than o=
ne
>is highly questionable. Please explain why you think that more than one ex=
tra
>attribute would ever be needed. It does add substantial complexity, so
>there should be a good reason.

The only situation I could come up is if the driver would want to group
attributes in different directories by setting different name for each
of them. One other reason I choose to use this approach is that this
seems to be standard way for passing this information on other
layers/frameworks.  For example, this is the same "format" you would
pass this kind of data when creating a class, a bus, a driver or when
you use any of the *_register_with_groups().

This approach is simply more generic with (to my opinion) low cost of
implementation. But if we don't want to support that, I'm fine to change
this to single custom group.

Krzysztof
