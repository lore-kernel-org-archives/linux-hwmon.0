Return-Path: <SRS0=rYov=SQ=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8328C10F13
	for <linux-hwmon@archiver.kernel.org>; Sun, 14 Apr 2019 22:23:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8CF4C2070D
	for <linux-hwmon@archiver.kernel.org>; Sun, 14 Apr 2019 22:23:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nokia.onmicrosoft.com header.i=@nokia.onmicrosoft.com header.b="Rjm+t9CM"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725497AbfDNWXC (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 14 Apr 2019 18:23:02 -0400
Received: from mail-eopbgr50097.outbound.protection.outlook.com ([40.107.5.97]:23630
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725372AbfDNWXB (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 14 Apr 2019 18:23:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uB4L9BiwUZNgpnFM10v9Di4gM3bsnfrGfhrobjuDNEU=;
 b=Rjm+t9CMqEuDla07tyTND1ZaYF/+H8WOy/k1OEGuSCYWWtOtDSfe7iv3oYppI9rAnNwJbTV/Ls2AkjqmS3elWzgjoPrj4lfmMCXAma4dB+psJVyRifvaoou5KUC/vB8IJ5Eu2DH4O5mFN5zWFQiljJYZqGl4aXmyBISfy53qQ4o=
Received: from HE1PR07MB3337.eurprd07.prod.outlook.com (10.170.247.12) by
 HE1PR07MB4249.eurprd07.prod.outlook.com (20.176.166.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1813.9; Sun, 14 Apr 2019 22:22:58 +0000
Received: from HE1PR07MB3337.eurprd07.prod.outlook.com
 ([fe80::cd23:d96f:5d94:cee6]) by HE1PR07MB3337.eurprd07.prod.outlook.com
 ([fe80::cd23:d96f:5d94:cee6%7]) with mapi id 15.20.1813.009; Sun, 14 Apr 2019
 22:22:58 +0000
From:   "Adamski, Krzysztof (Nokia - PL/Wroclaw)" 
        <krzysztof.adamski@nokia.com>
To:     Guenter Roeck <linux@roeck-us.net>
CC:     Hardware Monitoring <linux-hwmon@vger.kernel.org>,
        Jean Delvare <jdelvare@suse.com>
Subject: Re: [PATCH] hwmon: (pmbus_core) Replace S_<PERMS> with octal values
Thread-Topic: [PATCH] hwmon: (pmbus_core) Replace S_<PERMS> with octal values
Thread-Index: AQHU8w0OYAS8f6MZxEuwLFW+2xa4VaY8OxmA
Date:   Sun, 14 Apr 2019 22:22:58 +0000
Message-ID: <20190414222253.GA18461@localhost.localdomain>
References: <1555279044-25139-1-git-send-email-linux@roeck-us.net>
In-Reply-To: <1555279044-25139-1-git-send-email-linux@roeck-us.net>
Accept-Language: pl-PL, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1P190CA0011.EURP190.PROD.OUTLOOK.COM (2603:10a6:3:bc::21)
 To HE1PR07MB3337.eurprd07.prod.outlook.com (2603:10a6:7:2d::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=krzysztof.adamski@nokia.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [131.228.2.9]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6250cf9f-6437-44b7-3ab4-08d6c127bfb4
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600139)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:HE1PR07MB4249;
x-ms-traffictypediagnostic: HE1PR07MB4249:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <HE1PR07MB4249DA8BB5A163910FA4D288EF2A0@HE1PR07MB4249.eurprd07.prod.outlook.com>
x-forefront-prvs: 00073DB75F
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(376002)(39860400002)(346002)(396003)(136003)(199004)(189003)(9686003)(105586002)(6116002)(3846002)(186003)(5660300002)(2906002)(11346002)(446003)(256004)(486006)(14454004)(61506002)(476003)(14444005)(76176011)(6306002)(6512007)(52116002)(99286004)(97736004)(26005)(6506007)(54906003)(53936002)(316002)(386003)(102836004)(4326008)(6246003)(229853002)(8676002)(8936002)(81166006)(81156014)(1076003)(106356001)(71190400001)(33656002)(71200400001)(68736007)(7736002)(305945005)(86362001)(66066001)(25786009)(6486002)(478600001)(6916009)(6436002);DIR:OUT;SFP:1102;SCL:1;SRVR:HE1PR07MB4249;H:HE1PR07MB3337.eurprd07.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nokia.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: XaZ263Dmo2jwx6VvTAs2KVXHQTa57ue89DKI4GB1lQGJA6U+pwPZrMq3y1kCSxMkXwX/XU7IqIaZoyouZ69M8xhH9lBiTBz79Wr9V08RY2i8Jp02/wFC/8NP+jcLJWogDYeUm/JoPOyp6sP3534rLiMbCKUXl2QPI5bCPsvwotEEfPkoREEEI6CZFB6iQAY9xNDSraepEhH8Ai4YpVSp7hAfBecuL5ZDhn/FJ4aTTZYLoFsX24uP5tV/eeGEyDlLZ9Jzoe0GPnffQfEo4xHFEnBiz3htR7j7VYs/JtwoFf5pDbOCiwc4d1BtCwlG4f3mSYAzx7cKM3HJHAEH2X6iDsmWQpdIuGkRxNBePsSj/SN56gCrjW1pu5S/fQLO3dp17hAl0PO9G7eLeJ5d5Dv7WsLHyIMb1qYa5DHYBFO4Qbk=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <D2D26C24123FE541905F76D33ED591F9@eurprd07.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6250cf9f-6437-44b7-3ab4-08d6c127bfb4
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2019 22:22:58.7371
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR07MB4249
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sun, Apr 14, 2019 at 02:57:24PM -0700, Guenter Roeck wrote:
>Replace S_<PERMS> with octal values.
>
>The conversion was done automatically with coccinelle. The semantic patche=
s
>and the scripts used to generate this commit log are available at
>https://github.com/groeck/coccinelle-patches/hwmon/.

The URL is 404. blob/master/hwmon instead of just hwmon at the end would
work.

>This patch does not introduce functional changes. It was verified by
>compiling the old and new files and comparing text and data sizes.

I don't think that the sizes would change even if there was some error
introuced if it still compiles. But of course both the conccinele script
is ok and I manually verified the patch. Also, git grep "\bS_" pmbus*
does not return anything meaning all the places were converted.

>Cc: Krzysztof Adamski <krzysztof.adamski@nokia.com>
>Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>---
> drivers/hwmon/pmbus/pmbus_core.c | 6 +++---
> 1 file changed, 3 insertions(+), 3 deletions(-)
>
>diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_=
core.c
>index 2e2b5851139c..e2366428a9a9 100644
>--- a/drivers/hwmon/pmbus/pmbus_core.c
>+++ b/drivers/hwmon/pmbus/pmbus_core.c
>@@ -1073,7 +1073,7 @@ static int pmbus_add_boolean(struct pmbus_data *data=
,
> 		 name, seq, type);
> 	boolean->s1 =3D s1;
> 	boolean->s2 =3D s2;
>-	pmbus_attr_init(a, boolean->name, S_IRUGO, pmbus_show_boolean, NULL,
>+	pmbus_attr_init(a, boolean->name, 0444, pmbus_show_boolean, NULL,
> 			(reg << 16) | mask);
>
> 	return pmbus_add_attribute(data, &a->dev_attr.attr);
>@@ -1107,7 +1107,7 @@ static struct pmbus_sensor *pmbus_add_sensor(struct =
pmbus_data *data,
> 	sensor->update =3D update;
> 	sensor->convert =3D convert;
> 	pmbus_dev_attr_init(a, sensor->name,
>-			    readonly ? S_IRUGO : S_IRUGO | S_IWUSR,
>+			    readonly ? 0444 : 0644,
> 			    pmbus_show_sensor, pmbus_set_sensor);
>
> 	if (pmbus_add_attribute(data, &a->attr))
>@@ -1139,7 +1139,7 @@ static int pmbus_add_label(struct pmbus_data *data,
> 		snprintf(label->label, sizeof(label->label), "%s%d", lstring,
> 			 index);
>
>-	pmbus_dev_attr_init(a, label->name, S_IRUGO, pmbus_show_label, NULL);
>+	pmbus_dev_attr_init(a, label->name, 0444, pmbus_show_label, NULL);
> 	return pmbus_add_attribute(data, &a->attr);
> }
>
>--=20
>2.7.4
>

Krzysztof
