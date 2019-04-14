Return-Path: <SRS0=rYov=SQ=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F9C2C10F13
	for <linux-hwmon@archiver.kernel.org>; Sun, 14 Apr 2019 22:37:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0DF1E2084D
	for <linux-hwmon@archiver.kernel.org>; Sun, 14 Apr 2019 22:37:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nokia.onmicrosoft.com header.i=@nokia.onmicrosoft.com header.b="dlwVlzqo"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725497AbfDNWhi (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 14 Apr 2019 18:37:38 -0400
Received: from mail-eopbgr40117.outbound.protection.outlook.com ([40.107.4.117]:45829
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725372AbfDNWhi (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 14 Apr 2019 18:37:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hoVno9GHjBphCFQHSACx6zT3KpbkHMjTrsabhGCzwhM=;
 b=dlwVlzqokfxo89hEZn8INe1XAil0YtYeAPU76JUUe/gg5m/10KBZ9NK9S5u4pJCUMWyUqWmTODS3H4RkAdok82FMjEfztnt8bQpQkaQ90gIP7WRtnrSfs5R1QyaZr6/TYbqWbREM9gieu6ihTYQpxRopZjMm5Faq8PkKcPXbIyI=
Received: from HE1PR07MB3337.eurprd07.prod.outlook.com (10.170.247.12) by
 HE1PR07MB4219.eurprd07.prod.outlook.com (20.176.166.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1813.9; Sun, 14 Apr 2019 22:37:33 +0000
Received: from HE1PR07MB3337.eurprd07.prod.outlook.com
 ([fe80::cd23:d96f:5d94:cee6]) by HE1PR07MB3337.eurprd07.prod.outlook.com
 ([fe80::cd23:d96f:5d94:cee6%7]) with mapi id 15.20.1813.009; Sun, 14 Apr 2019
 22:37:33 +0000
From:   "Adamski, Krzysztof (Nokia - PL/Wroclaw)" 
        <krzysztof.adamski@nokia.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
CC:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "Sverdlin, Alexander (Nokia - DE/Ulm)" <alexander.sverdlin@nokia.com>
Subject: Re: [PATCH v3 4/4] pmbus_core: export coefficients via sysfs
Thread-Topic: [PATCH v3 4/4] pmbus_core: export coefficients via sysfs
Thread-Index: AQHU8w1ZydbOroauu0aS8/AaxTnXF6Y8PywA
Date:   Sun, 14 Apr 2019 22:37:33 +0000
Message-ID: <20190414223728.GB18461@localhost.localdomain>
References: <cover.1555273192.git.krzysztof.adamski@nokia.com>
 <4887ef85022d7ceb26905997c19a874d7d89087f.1555273192.git.krzysztof.adamski@nokia.com>
In-Reply-To: <4887ef85022d7ceb26905997c19a874d7d89087f.1555273192.git.krzysztof.adamski@nokia.com>
Accept-Language: pl-PL, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1P192CA0004.EURP192.PROD.OUTLOOK.COM (2603:10a6:3:fe::14)
 To HE1PR07MB3337.eurprd07.prod.outlook.com (2603:10a6:7:2d::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=krzysztof.adamski@nokia.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [131.228.2.9]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3e431a94-6341-4ea3-3a16-08d6c129c8f4
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600139)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:HE1PR07MB4219;
x-ms-traffictypediagnostic: HE1PR07MB4219:
x-microsoft-antispam-prvs: <HE1PR07MB4219D0DD108C65B98EC23B31EF2A0@HE1PR07MB4219.eurprd07.prod.outlook.com>
x-forefront-prvs: 00073DB75F
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(136003)(39860400002)(376002)(346002)(366004)(199004)(189003)(97736004)(6436002)(54906003)(71200400001)(14444005)(1076003)(256004)(71190400001)(229853002)(81166006)(61506002)(110136005)(8936002)(81156014)(99286004)(8676002)(66066001)(68736007)(9686003)(6512007)(316002)(6506007)(386003)(3846002)(6116002)(102836004)(186003)(26005)(106356001)(86362001)(105586002)(5660300002)(14454004)(7736002)(2906002)(478600001)(107886003)(6246003)(4326008)(33656002)(6486002)(25786009)(11346002)(446003)(53936002)(76176011)(305945005)(476003)(486006)(52116002);DIR:OUT;SFP:1102;SCL:1;SRVR:HE1PR07MB4219;H:HE1PR07MB3337.eurprd07.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nokia.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Xn8KuKPFPOCLJA+K9cOzLXIGUVcjSUHGCFINRIhSHBz6JArZs92q93lHt2sy9djn+p3VLekO1cyJfYgz7dh1CcLjiPcV7hq8ydvVLFYyku99mz9etAqaYIK8ekwhmMGeyfqsdETrSLJvs6fk6M0MVjPlGTGQtouHcbQugRWWvrVuzAGuUwr5wKzold09qnxLB4sNOaIdoybsUAhsX1TUsPLgr6huqRtwICZquLkbL0f/+lFAUxeBYjO0E3RRTNrZHPJY4hLpR7DuH5CNorcnjRptM+V9xvSHrPWOU4y06W8Ri2h2mdJpN4myRTEDXN+WbatBE+GHi7zP39vCAJ7uRyyYZlX8uTgq9mAhoy1Q+5c1jVhzgGno4N9yR+11fIhKm8krEBUMPmFbDnh38JAAPm2glCNrCVdgpU5xnDJ05Aw=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <102C52392D97B94EAEC0E233C0D7C424@eurprd07.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e431a94-6341-4ea3-3a16-08d6c129c8f4
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2019 22:37:33.3385
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR07MB4219
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sun, Apr 14, 2019 at 11:59:38PM +0200, Krzysztof Adamski wrote:
>PMBUS devices report values in real-world units. Those using direct
>format require conversion using standarised coefficients and formula.
>This operation is already done by pmbus_core and the default values for
>coefficients are configured by chip drivers.
>
>However those default values are not allways suitable as they depend on
>the value of sense register and environment used. For that reason, in
>order to get values that make sense or just to get best accuracy, in it
>may be required to tweak coefficient values. The proper values may be
>measured during device production (to get best accuracy, they might be
>callibrated for each individual unit) and stored as calibration values
>in some place (like EEPROM or even a file).
>
>To support wide range of possible use cases, lets export those to user
>space via sysfs attributes so that it can implement its own policies
>about them. All those attributes are put into separate attribute_group
>struct so that we can set its name to group all of them in a
>"coefficients" subdirectory in sysfs.
>
>Signed-off-by: Krzysztof Adamski <krzysztof.adamski@nokia.com>
>---
>drivers/hwmon/pmbus/pmbus_core.c | 104 ++++++++++++++++++++++++++++++-
>1 file changed, 102 insertions(+), 2 deletions(-)
>

[...]

>+	pmbus_dev_attr_init(&ext_attr->attr, name, (S_IWUSR | S_IRUGO),

I screwed up and did not fix this also, sorry for that. I'm not sending
an updated version (yet) as I didn't get your approval for the concept
itself (though I still hope you will reconsider taking into account my
latest arguments).

[...]
>

Krzysztof
