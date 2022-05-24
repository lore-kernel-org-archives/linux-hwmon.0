Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65E5CC433F5
	for <linux-hwmon@archiver.kernel.org>; Tue, 24 May 2022 16:17:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234441AbiEXQRH (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 24 May 2022 12:17:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234263AbiEXQRG (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 24 May 2022 12:17:06 -0400
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam07on20610.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eb2::610])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2B0741996;
        Tue, 24 May 2022 09:17:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ETU8eLp5o+X7VI9Ca0g1g7rC0FN8ySarK9ScMuNujVQ4O3gd3MPY9CUFXCtdYF4Ouz2gQW/cDKmOlsIrEDWremW9TMkVK2EM3L1YsefhlAPiC0DU+6Dg2TQQNoGQhACcb/KAXXITqaURUaN0j1LZOYrCYKGZOynElJZ3VSYn3/22vl7Y0TwR6gLvqU0JokECWiffuB0IaLuzCkkrkWqOwih9jo0gfasg1AmAgfdjryHRM27LKui7dlQcODDdJCcVYeMzZTJSJKE4vf2AfcCkRcy2/BZedrAhCeHItf3fzJHJl64ktRdEG4FU3HiXIvzfTx52avYRiw1YG3gUORUxCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9AH9c5u/Bfm4FyDZrOZKbmxZ9AQwV5v57xQGi8+DiRI=;
 b=RFuUn/Dne+UPkiNWjKCgGzXxQnHV+sF75HDowlzXSmMEubGC90qWrioxMa2XAF6IL8+EaMbgJvQwF18kUsbLB9wCi6ybSri/UBBZfLXt3I6j6e3RHDzDwVZkxmAiA5yX3zM4MghUoJHH1qkLbQaieIMKvERDByQvFGFULlDs3ihszl9W08d1YFDhTIQ1CDoPFi2/fhay1p6osjJAEX/e+DqMD9S2pL8m9LgBi1SpxTSgtGwChcSGPVPT+Fh01ZXoQ7mE/3+3aIou9nvEbLhFy4shKdh/JFF37TUg4mIueDCJve1JKDF7Iyy5vbEQfCeoNiWWoG1m9uSxtRkXkczXSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9AH9c5u/Bfm4FyDZrOZKbmxZ9AQwV5v57xQGi8+DiRI=;
 b=tm7B8Hi+JZPrODkCDHXKSQFKht0mzBXTrEt8Bz9FDsj4WlHm9FbleiIrzXivKm4CPZ4ojF53DMeHwxUol+94FxIuudArhyQxTPZx1b5z6Zpy06sALAE2J/w45wV/GvgLIw32eHCbmKEb+02Xr1R8iMSN5J/zhOFt3psAY9giRhyVWJvg6ZmYWQWjsRmr5vxE2UeQ9jomG33OL2qzBAUbkM+x/Z8/veTctKMWXZCa/fL2IipMytErWJ0e2y1Mv/4s7grKIzsTP3Ufgqr+lX/J+vmjWdF2CJsY3J/2KGenH587x9nXN+W711KUo1R+fPOb5LcM1t2jxDmGVORHWcLufA==
Received: from DM6PR12MB4074.namprd12.prod.outlook.com (2603:10b6:5:218::11)
 by MN2PR12MB3696.namprd12.prod.outlook.com (2603:10b6:208:169::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.17; Tue, 24 May
 2022 16:17:01 +0000
Received: from DM6PR12MB4074.namprd12.prod.outlook.com
 ([fe80::511d:9ad5:184d:31]) by DM6PR12MB4074.namprd12.prod.outlook.com
 ([fe80::511d:9ad5:184d:31%7]) with mapi id 15.20.5273.023; Tue, 24 May 2022
 16:17:01 +0000
From:   Michael Shych <michaelsh@nvidia.com>
To:     Guenter Roeck <linux@roeck-us.net>
CC:     "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: RE: [PATCH v1 1/3] hwmon: (emc2305) add support for EMC2301/2/3/5
 RPM-based PWM Fan Speed Controller.
Thread-Topic: [PATCH v1 1/3] hwmon: (emc2305) add support for EMC2301/2/3/5
 RPM-based PWM Fan Speed Controller.
Thread-Index: AQHYXIhQzHDEAv/S90KzeGYNiGew/q0IapiAgCXsl0A=
Date:   Tue, 24 May 2022 16:17:01 +0000
Message-ID: <DM6PR12MB4074A364BA0FD76A12BF054FD4D79@DM6PR12MB4074.namprd12.prod.outlook.com>
References: <20220430114905.53448-1-michaelsh@nvidia.com>
 <20220430114905.53448-2-michaelsh@nvidia.com>
 <20220430125721.GA1888736@roeck-us.net>
In-Reply-To: <20220430125721.GA1888736@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0ebc9f7a-1826-4fe8-cea6-08da3da0d5c1
x-ms-traffictypediagnostic: MN2PR12MB3696:EE_
x-microsoft-antispam-prvs: <MN2PR12MB3696EBE1DF445E67D98E2DFCD4D79@MN2PR12MB3696.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TaUIBIRleX/eXI6VjPmjgrF1E2c0UAi1GjJZQ0drPtnLHVtaaNt7ylE83Oz4XPbj032Ix0hQOBJ4SKXp/lSJP3BCLd0ijarDesBooETg4QFDmpb0mL1DGhErMufdwykh6iqbxThY8/XhEZPYR0lELlO0PaCr9pn3ok+Dt0qFAmEW6CmpwXmSifKoaZo0mfnEbN8wcuWZWxBl0YSSTkuKQBq3q386g1HSrVUPJz+5oGh134oP+RCrgp7AVJnuPJHUBsxiK/aWLhcuEC7HeahZ5RXgF4fliY8LhtNU6pJxsxWacMh2IzxejB5nloTLLJDhM8Dt3hyZ9YwHbbwP9EYeE/MI6NPIDUDDoQpq4+xL33qEKPdOz56G7E1bRQ8XGliiiNtj81X2skWg+KRA+DLH8tUc+9UnG+e4os4RvJUc6vzlmZKWaXfpe2ZEVbErWV2BsWVwH9dKcDr35lGEqh+aC8Us9/OfyDEU9SnH/Ttw0a2VzODmpVB2nGgMZj97b6LDixC1B/NSaK2UcACIen2aq0InLZsHLxv4KPFFQsGw8L31mPn8rYtisshQcm//6I08r4ZNTf0rdoetnf7qXnNake23nuxjzY8/rZnvhc+V/D97SZDzc4ML8oyrJNX2fTpYA5jN0zmXSyys/FEq7RLr+GwM8TnbYJO5U4hJuSGiuks2FFZ3VdyT0bJ3ZoXEWxZ9waH5s0/DfCMteD1sMRDKUw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4074.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6916009)(6506007)(9686003)(54906003)(33656002)(83380400001)(26005)(7696005)(30864003)(5660300002)(8936002)(508600001)(186003)(316002)(107886003)(55016003)(71200400001)(2906002)(4326008)(76116006)(66946007)(64756008)(66446008)(8676002)(38100700002)(66476007)(66556008)(53546011)(38070700005)(122000001)(52536014)(86362001)(559001)(579004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?8lI9O9II5kWqpvDniQ9ao5P6VK+v3/dCGWvbR0PvcjKuVWUu6RsF/WMGOMJe?=
 =?us-ascii?Q?D1dKSYhOoVAP1of8NEvtPJvsu0MpLvFH/E9CXpS9zXhSoYTxELxKo2g8gjYl?=
 =?us-ascii?Q?JTW29Hnz1Lo8zCuaePNaTPl9VzM+XZLH8MDxdRZ3/CD/QdNIzqhMwfi/Aekc?=
 =?us-ascii?Q?hTrq9iF9rgSyG3Tx4VdFMC696KoAt/GtpwfB09/kdJKgH0rRJb3gPlEGovST?=
 =?us-ascii?Q?SG9l+7ZVqXcO7g+CZBiiTlHLXpDdYqZQx+VnojHq6ni1duoQKL/ceq8YGZko?=
 =?us-ascii?Q?ym3nVAgmrqe1Az7bafheE61iMpLLX32/3ZABy7SKNY/N4S6VXZ7omdO64LWL?=
 =?us-ascii?Q?yftlmCLbYkrKPv1kUTp7cO7PbvXF+MLwn5NG5ZGdIq1OQ2KDHFMRm2QnVPqR?=
 =?us-ascii?Q?Jlb+8Y8HXw4ereEuQKDP8GdqCPpZ3dFlzauTQOSU4RYaX+lzbT40qmrTOxuZ?=
 =?us-ascii?Q?vxcNqOCPPczRtZUftFqscNQKMs266MfXh9rLhZ4FcTJET5QdBQWbsfkybBKC?=
 =?us-ascii?Q?oBl3j4FTvTkj2kBx41OF4Rj8dZ/rhvxgR2n3gDid2twE4EwsfgegjD7Hv+hq?=
 =?us-ascii?Q?lB3K/dujuoJiQCJsNeKxZRqyKkuSDWG6thtpWPx6wlqfYENfMqaRzTfxhGkK?=
 =?us-ascii?Q?xkIqtk8k0ob3s2qFzFkET9Jm2GvWN17XL42IFzgkXxxTm/8ES8ihGlcKM85x?=
 =?us-ascii?Q?clXtDBKvT1ry08ZSAPQMNM8V0JJdyeWb8vD2iAuZR9yU7vK6YeC8U+lPkr8Y?=
 =?us-ascii?Q?z6xjC0HHv572L+bN6JudrqiQPU0cT9/5CzJLqjIh9uP1ejEqY22aTvp7gpcj?=
 =?us-ascii?Q?aqLnwiIsXqGaPL05ncE2fvFYUklrPVw51HqBO/kspP/zD4bSFrehwJnCj8sR?=
 =?us-ascii?Q?IJltaGo11jd7pFadaM/Pn9nC93AzrhVh08zovrcfiuDY842LdyOAGBsfuA+n?=
 =?us-ascii?Q?PqfA2Jwxdt6PdACZIsZUgGnIb8SoXS3wSYo5KA5HyjYIUl0rwvlVL2w0+xmk?=
 =?us-ascii?Q?z/V/eM295JdsflfKFZjRiaaAAoAC1PyVOSa+jb3WMxxYxkqieaoHqvItKMDb?=
 =?us-ascii?Q?O8ftoa4cE7yK1P4dhfJTEVdpcOi2BkvjMJS+mQNFj7WdLIKs4yAXN5RZw0Lv?=
 =?us-ascii?Q?JJbU3KWi5Cv3FSiCtMkOUfPgbLyR4/91Nyy7RztjFmiqSx4wlL/8y2YBH+bd?=
 =?us-ascii?Q?0oSPH7B9hzPs/ursFUINKTA7c+5WD+bP9wGn/2tSLryyscAILIidwCml5m03?=
 =?us-ascii?Q?G1+PNjM90kF9yVFhJwdX7ZaF9816smmV5xv7L4DUv9Vwfrw0V+wnbj5Kne65?=
 =?us-ascii?Q?MvuUcMkrmA+QVK6qlo+RmGCbfQhw7EzD4wPOfyypXYlRwYnm3Pm50w3MGX0m?=
 =?us-ascii?Q?PL8EsXmPw3P0ctWU5TgMOKg0MKf/AwuXHzBCQIEgoY9qS+eAAnU6MYaNDqv6?=
 =?us-ascii?Q?DPBqMrwugk3jbgBFw17FH3TzplsV7mxgUYlGE1jCgReKoejEKLKyjQBd4m/V?=
 =?us-ascii?Q?s79G5YanLkAPPttXvwha+zHox924kV9Om6KWdcvyvj4h/HHTgTSpzRo2t6Du?=
 =?us-ascii?Q?2XcCwrgeXlrqjUFhkPfJlR6oyPZA2rAUtjpLjpqfnGvABddaiKTyQoPnFVaJ?=
 =?us-ascii?Q?tP6JYKwF1D0aRNam+1dsH9eSEKLbRygu+Dnop7soQZhOpez6trUMYyeuWJ4o?=
 =?us-ascii?Q?sJ8xOhICYGTVW2Pv65f6nrrOOYn4PtXBrjQ8evOMMVjUtvLICOeCbqFP6/RV?=
 =?us-ascii?Q?k9J3/g2l/w=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4074.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ebc9f7a-1826-4fe8-cea6-08da3da0d5c1
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 May 2022 16:17:01.6187
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7T/6YMKHf3P5TilMvJWNVBvTRnmAeLmp8myGmrxzquSlTNuNQn3dvqtHj4aL0IJR6n6Fqg9RVLAzSrO10Rxogw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3696
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org



> -----Original Message-----
> From: Guenter Roeck <groeck7@gmail.com> On Behalf Of Guenter Roeck
> Sent: Saturday, April 30, 2022 3:57 PM
> To: Michael Shych <michaelsh@nvidia.com>
> Cc: robh+dt@kernel.org; linux-hwmon@vger.kernel.org;
> devicetree@vger.kernel.org; Vadim Pasternak <vadimp@nvidia.com>
> Subject: Re: [PATCH v1 1/3] hwmon: (emc2305) add support for
> EMC2301/2/3/5 RPM-based PWM Fan Speed Controller.
>=20
> On Sat, Apr 30, 2022 at 02:49:03PM +0300, michaelsh@nvidia.com wrote:
> > From: Michael Shych <michaelsh@nvidia.com>
> >
> > Add driver for Microchip EMC2301/2/3/5 RPM-based PWM Fan Speed
> Controller.
> > Modify Makefile and Kconfig to support Microchip EMC2305 RPM-based
> PWM
> > Fan Speed Controller.
> >
> > Signed-off-by: Michael Shych <michaelsh@nvidia.com>
> > Reviewed-by: Vadim Pasternak <vadimp@nvidia.com>
> > ---
> >  drivers/hwmon/Kconfig   |  13 +
> >  drivers/hwmon/Makefile  |   1 +
> >  drivers/hwmon/emc2305.c | 629
> > ++++++++++++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 643 insertions(+)
> >  create mode 100644 drivers/hwmon/emc2305.c
> >
> > diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig index
> > 85c22bba439b..3c25ba0e6ef7 100644
> > --- a/drivers/hwmon/Kconfig
> > +++ b/drivers/hwmon/Kconfig
> > @@ -1750,6 +1750,19 @@ config SENSORS_EMC2103
> >  	  This driver can also be built as a module. If so, the module
> >  	  will be called emc2103.
> >
> > +config SENSORS_EMC2305
> > +	tristate "Microchip EMC2305 and compatible EMC2301/2/3"
> > +	depends on I2C
> > +	imply THERMAL
> > +	help
> > +	  If you say yes here you get support for the Microchip EMC2305
> > +	  fan controller chips.
> > +	  The Microchip EMC2305 is a fan controller for up to 5 fans.
> > +	  Fan rotation speeds are reported in RPM.
> > +
> > +	  This driver can also be built as a module.  If so, the module
> > +	  will be called emc2305.
> > +
> >  config SENSORS_EMC6W201
> >  	tristate "SMSC EMC6W201"
> >  	depends on I2C
> > diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile index
> > 93f2b774cc5e..e2238c207ef4 100644
> > --- a/drivers/hwmon/Makefile
> > +++ b/drivers/hwmon/Makefile
> > @@ -70,6 +70,7 @@ obj-$(CONFIG_SENSORS_DS620)	+=3D ds620.o
> >  obj-$(CONFIG_SENSORS_DS1621)	+=3D ds1621.o
> >  obj-$(CONFIG_SENSORS_EMC1403)	+=3D emc1403.o
> >  obj-$(CONFIG_SENSORS_EMC2103)	+=3D emc2103.o
> > +obj-$(CONFIG_SENSORS_EMC2305)	+=3D emc2305.o
> >  obj-$(CONFIG_SENSORS_EMC6W201)	+=3D emc6w201.o
> >  obj-$(CONFIG_SENSORS_F71805F)	+=3D f71805f.o
> >  obj-$(CONFIG_SENSORS_F71882FG)	+=3D f71882fg.o
> > diff --git a/drivers/hwmon/emc2305.c b/drivers/hwmon/emc2305.c new
> > file mode 100644 index 000000000000..5c896fdfc525
> > --- /dev/null
> > +++ b/drivers/hwmon/emc2305.c
> > @@ -0,0 +1,629 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/*
> > + * Hardware monitoring driver for EMC2305 fan controller
> > + *
> > + * Copyright (C) 2022 Nvidia Technologies Ltd and Delta Networks, Inc.
> > + */
> > +
> > +#include <linux/err.h>
> > +#include <linux/hwmon.h>
> > +#include <linux/hwmon-sysfs.h>
>=20
> Not necessary
Removed.

>=20
> > +#include <linux/i2c.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/thermal.h>
> > +#include <linux/version.h>
> > +
> > +static const unsigned short
> > +emc2305_normal_i2c[] =3D { 0x27, 0x2c, 0x2d, 0x2e, 0x2f, 0x4c, 0x4d,
> > +I2C_CLIENT_END };
> > +
> > +#define EMC2305_REG_DRIVE_FAIL_STATUS	0x27
> > +#define EMC2305_REG_DEVICE		0xfd
> > +#define EMC2305_REG_VENDOR		0xfe
> > +#define EMC2305_FAN_MAX			0xff
> > +#define EMC2305_FAN_MIN			0x00
> > +#define EMC2305_FAN_MAX_STATE		10
> > +#define EMC2305_DEVICE			0x34
> > +#define EMC2305_VENDOR			0x5d
> > +#define EMC2305_REG_PRODUCT_ID		0xfd
> > +#define EMC2305_TACH_REGS_UNUSE_BITS	3
> > +#define EMC2305_TACH_CNT_MULTIPLIER	0x02
> > +#define EMC2305_PWM_MAX			5
> > +#define EMC2305_PWM_CHNL_CMN		0
> > +
> > +#define EMC2305_PWM_DUTY2STATE(duty, max_state, pwm_max) \
> > +	(DIV_ROUND_CLOSEST((duty) * (max_state), (pwm_max))) #define
> > +EMC2305_PWM_STATE2DUTY(state, max_state, pwm_max) \
> > +	(DIV_ROUND_CLOSEST((state) * (pwm_max), (max_state)))
> > +
> > +/* Factor by equations [2] and [3] from data sheet; valid for fans
> > +where the number of edges
> > + * equal (poles * 2 + 1).
> > + */
>=20
> /*
>  * Please use standard multi-line comments.
>  */
Ack.

>=20
> > +#define EMC2305_RPM_FACTOR		3932160
> > +
> > +#define EMC2305_REG_FAN_DRIVE(n) (0x30 + 0x10 * (n)) #define
> > +EMC2305_REG_FAN_MIN_DRIVE(n) (0x38 + 0x10 * (n)) #define
> > +EMC2305_REG_FAN_TACH(n) (0x3e + 0x10 * (n))
>=20
> Please use
>=20
> #define<space>NAME<tab>value
>
Ack.

> > +
> > +enum emc230x_product_id {
> > +	EMC2305 =3D 0x34,
> > +	EMC2303 =3D 0x35,
> > +	EMC2302 =3D 0x36,
> > +	EMC2301 =3D 0x37,
> > +};
> > +
> > +static const struct i2c_device_id emc2305_ids[] =3D {
> > +	{ "emc2305", 0 },
> > +	{ "emc2303", 0 },
> > +	{ "emc2302", 0 },
> > +	{ "emc2301", 0 },
> > +	{ }
> > +};
> > +MODULE_DEVICE_TABLE(i2c, emc2305_ids);
> > +
> > +static const struct of_device_id emc2305_dt_ids[] =3D {
> > +	{ .compatible =3D "smsc,emc2305" },
> > +	{ }
> > +};
> > +MODULE_DEVICE_TABLE(of, emc2305_dt_ids);
> > +
> > +/**
> > + * @cdev: cooling device;
> > + * @curr_state: cooling current state;
> > + * @last_hwmon_state: last cooling state updated by hwmon subsystem;
> > + * @last_thermal_state: last cooling state updated by thermal
> > +subsystem;
> > + *
> > + * The 'last_hwmon_state' and 'last_thermal_state' fields are
> > +provided to support fan low limit
> > + * speed feature. The purpose of this feature is to provides ability
> > +to limit fan speed
> > + * according to some system wise considerations, like absence of some
> > +replaceable units (PSU or
> > + * line cards), high system ambient temperature, unreliable
> > +transceivers temperature sensing or
> > + * some other factors which indirectly impacts system's airflow
> > + * Fan low limit feature is supported through 'hwmon' interface:
> > +'hwmon' 'pwm' attribute is
> > + * used for setting low limit for fan speed in case 'thermal'
> > +subsystem is configured in
> > + * kernel. In this case setting fan speed through 'hwmon' will never l=
et the
> 'thermal'
> > + * subsystem to select a lower duty cycle than the duty cycle selected=
 with
> the 'pwm'
> > + * attribute.
> > + * From other side, fan speed is to be updated in hardware through
> > +'pwm' only in case the
> > + * requested fan speed is above last speed set by 'thermal'
> > +subsystem, otherwise requested fan
> > + * speed will be just stored with no PWM update.
> > + */
> > +struct emc2305_cdev_data {
> > +	struct thermal_cooling_device *cdev;
> > +	unsigned int cur_state;
> > +	unsigned long last_hwmon_state;
> > +	unsigned long last_thermal_state;
> > +};
> > +
> > +/**
> > + * @client: i2c client;
> > + * @hwmon_dev: hwmon device;
> > + * @max_state: maximum cooling state of the cooling device;
> > + * @pwm_max: maximum PWM;
> > + * @pwm_min: minimum PWM;
> > + * @pwm_channel: maximum number of PWM channels;
> > + * @cdev_data: array of cooling devices data;  */ struct emc2305_data
> > +{
> > +	struct i2c_client *client;
> > +	struct device *hwmon_dev;
> > +	u8 max_state;
> > +	u8 pwm_max;
> > +	u8 pwm_min;
> > +	u8 pwm_num;
> > +	u8 pwm_channel;
> > +	struct emc2305_cdev_data cdev_data[EMC2305_PWM_MAX]; };
> > +
> > +static char *emc2305_fan_name[] =3D {
> > +	"emc2305_fan",
> > +	"emc2305_fan1",
> > +	"emc2305_fan2",
> > +	"emc2305_fan3",
> > +	"emc2305_fan4",
> > +	"emc2305_fan5",
> > +};
> > +
> > +static int emc2305_get_max_channel(struct emc2305_data *data) {
> > +	if (data->pwm_channel =3D=3D EMC2305_PWM_CHNL_CMN)
> > +		return data->pwm_num;
> > +	else
>=20
> else after return is unnecessary
Changed.

>=20
> > +		return data->pwm_channel;
> > +}
> > +
> > +static int emc2305_get_cdev_idx(struct thermal_cooling_device *cdev)
> > +{
> > +	struct emc2305_data *data =3D cdev->devdata;
> > +	size_t len =3D strlen(cdev->type);
> > +	int ret;
> > +
> > +	if (len <=3D 0)
> > +		return -EINVAL;
> > +
> > +	/* Retuns index of cooling device 0..4 in case of separate PWM
> setting.
> > +	 * Zero index is used in case of one common PWM setting.
> > +	 * If the mode is set as EMC2305_PWM_CHNL_CMN, all PWMs are to
> be bound
> > +	 * to the common thermal zone and should work at the same speed
> > +	 * to perform cooling for the same thermal junction.
> > +	 * Otherwise, return specific channel that will be used in bound
> > +	 * related PWM to the thermal zone.
> > +	 */
> > +	if (data->pwm_channel =3D=3D EMC2305_PWM_CHNL_CMN)
> > +		return 0;
> > +
> > +	ret =3D cdev->type[len - 1];
> > +	switch (ret) {
> > +	case '1' ... '5':
> > +		return ret - '1';
> > +	default:
> > +		break;
> > +	}
> > +	return -EINVAL;
> > +}
> > +
> > +static int emc2305_get_cur_state(struct thermal_cooling_device *cdev,
> > +unsigned long *state) {
> > +	int cdev_idx;
> > +	struct emc2305_data *data =3D cdev->devdata;
> > +
> > +	cdev_idx =3D emc2305_get_cdev_idx(cdev);
> > +	if (cdev_idx < 0)
> > +		return cdev_idx;
> > +
> > +	*state =3D data->cdev_data[cdev_idx].cur_state;
> > +	return 0;
> > +}
> > +
> > +static int emc2305_get_max_state(struct thermal_cooling_device *cdev,
> > +unsigned long *state) {
> > +	struct emc2305_data *data =3D cdev->devdata;
> > +	*state =3D data->max_state;
> > +	return 0;
> > +}
> > +
> > +static int emc2305_set_cur_state(struct thermal_cooling_device *cdev,
> > +unsigned long state) {
> > +	int cdev_idx;
> > +	struct emc2305_data *data =3D cdev->devdata;
> > +	struct i2c_client *client =3D data->client;
> > +	u8 val, i;
> > +
> > +	if (state > data->max_state)
> > +		return -EINVAL;
> > +
> > +	cdev_idx =3D  emc2305_get_cdev_idx(cdev);
> > +	if (cdev_idx < 0)
> > +		return cdev_idx;
> > +
> > +	/* Save thermal state. */
> > +	data->cdev_data[cdev_idx].last_thermal_state =3D state;
> > +	state =3D max_t(unsigned long, state,
> > +data->cdev_data[cdev_idx].last_hwmon_state);
> > +
> > +	val =3D EMC2305_PWM_STATE2DUTY(state, data->max_state, data-
> >pwm_max);
> > +	if (val > EMC2305_FAN_MAX)
> > +		return -EINVAL;
> > +
> > +	data->cdev_data[cdev_idx].cur_state =3D state;
> > +	if (data->pwm_channel =3D=3D EMC2305_PWM_CHNL_CMN)
> > +	/* Set the same PWM value in all channels
> > +	 * if common PWM channel is used.
> > +	 */
> > +		for (i =3D 0; i < data->pwm_num; i++)
> > +			i2c_smbus_write_byte_data(client,
> EMC2305_REG_FAN_DRIVE(i), val);
> > +	else
> > +		i2c_smbus_write_byte_data(client,
> EMC2305_REG_FAN_DRIVE(cdev_idx),
> > +val);
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct thermal_cooling_device_ops emc2305_cooling_ops =3D=
 {
> > +	.get_max_state =3D emc2305_get_max_state,
> > +	.get_cur_state =3D emc2305_get_cur_state,
> > +	.set_cur_state =3D emc2305_set_cur_state, };
> > +
> > +static int emc2305_show_fault(struct device *dev, int channel) {
> > +	struct emc2305_data *data =3D dev_get_drvdata(dev);
> > +	struct i2c_client *client =3D data->client;
> > +	int status_reg;
> > +
> > +	status_reg =3D i2c_smbus_read_byte_data(client,
> EMC2305_REG_DRIVE_FAIL_STATUS);
> > +	return status_reg & (1 << channel) ? 1 : 0; }
> > +
> > +static int emc2305_show_fan(struct device *dev, int channel) {
> > +	struct emc2305_data *data =3D dev_get_drvdata(dev);
> > +	struct i2c_client *client =3D data->client;
> > +	int ret;
> > +
> > +	ret =3D i2c_smbus_read_word_swapped(client,
> EMC2305_REG_FAN_TACH(channel));
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	ret =3D ret >> EMC2305_TACH_REGS_UNUSE_BITS;
> > +	return EMC2305_RPM_FACTOR * EMC2305_TACH_CNT_MULTIPLIER
> / (ret > 0 ?
> > +ret : 1); }
> > +
> > +static int emc2305_show_pwm(struct device *dev, int channel) {
> > +	struct emc2305_data *data =3D dev_get_drvdata(dev);
> > +	struct i2c_client *client =3D data->client;
> > +
> > +	return i2c_smbus_read_byte_data(client,
> > +EMC2305_REG_FAN_DRIVE(channel)); }
> > +
> > +static int emc2305_set_pwm(struct device *dev, long val, int channel)
> > +{
> > +	struct emc2305_data *data =3D dev_get_drvdata(dev);
> > +	struct i2c_client *client =3D data->client;
> > +
> > +	if (val < data->pwm_min || val > data->pwm_max)
> > +		return -EINVAL;
> > +
> > +	i2c_smbus_write_byte_data(client,
> EMC2305_REG_FAN_DRIVE(channel), val);
> > +	data->cdev_data[channel].cur_state =3D
> EMC2305_PWM_DUTY2STATE(val, data->max_state,
> > +								    data-
> >pwm_max);
> > +	return 0;
> > +}
> > +
> > +static int emc2305_get_tz_of(struct device *dev) {
> > +	struct device_node *np =3D dev->of_node;
> > +	struct emc2305_data *data =3D dev_get_drvdata(dev);
> > +	int ret =3D 0;
> > +
> > +	/* OF parameters are optional - overwrite default setting
> > +	 * if some of them are provided.
> > +	 */
> > +
> > +	if (of_find_property(np, "emc2305,cooling-levels", NULL)) {
> > +		ret =3D of_property_read_u8(np, "emc2305,cooling-levels",
> &data->max_state);
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> > +	if (of_find_property(np, "emc2305,pwm-max", NULL)) {
> > +		ret =3D of_property_read_u8(np, "emc2305,pwm-max", &data-
> >pwm_max);
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> > +	if (of_find_property(np, "emc2305,pwm-min", NULL)) {
> > +		ret =3D of_property_read_u8(np, "emc2305,pwm-min", &data-
> >pwm_min);
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> > +	/* Not defined or 0 means one thermal zone over all colling devices.
>=20
> cooling
Changed.

>=20
> > +	 * Otherwise - separted thermal zones for each PWM channel.
>=20
> separate ?
>=20
> > +	 */
> > +	if (of_find_property(np, "emc2305,pwm-channel", NULL)) {
> > +		ret =3D of_property_read_u8(np, "emc2305,pwm-channel",
> &data->pwm_channel);
> > +		if (ret)
> > +			return ret;
> > +	}
>=20
> I think those values should be validated.
Checks are added.

>=20
> > +
> > +	return ret;
> > +}
> > +
> > +static int emc2305_set_single_tz(struct device *dev, int idx) {
> > +	struct emc2305_data *data =3D dev_get_drvdata(dev);
> > +	long pwm =3D data->pwm_max;
> > +	int cdev_idx;
> > +
> > +	cdev_idx =3D (idx) ? idx - 1 : 0;
> > +
> > +	if (dev->of_node)
> > +		data->cdev_data[cdev_idx].cdev =3D
> > +			devm_thermal_of_cooling_device_register(dev, dev-
> >of_node,
> > +
> 	emc2305_fan_name[idx], data,
> > +
> 	&emc2305_cooling_ops);
> > +	else
> > +		data->cdev_data[cdev_idx].cdev =3D
> > +
> 	thermal_cooling_device_register(emc2305_fan_name[idx], data,
> > +
> 	&emc2305_cooling_ops);
> > +
> > +	if (IS_ERR(data->cdev_data[cdev_idx].cdev)) {
> > +		dev_err(dev, "Failed to register cooling device %s\n",
> emc2305_fan_name[idx]);
> > +		return PTR_ERR(data->cdev_data[cdev_idx].cdev);
> > +	}
> > +	emc2305_set_pwm(dev, pwm, cdev_idx);
> > +	data->cdev_data[cdev_idx].cur_state =3D data->max_state;
> > +	/* Set minimal PWM speed. */
> > +	data->cdev_data[cdev_idx].last_hwmon_state =3D
> EMC2305_PWM_DUTY2STATE(data->pwm_min,
> > +
> data->max_state,
> > +
> data->pwm_max);
> > +	return 0;
> > +}
> > +
> > +static int emc2305_set_tz(struct device *dev) {
> > +	struct emc2305_data *data =3D dev_get_drvdata(dev);
> > +	int i, ret;
> > +
> > +	if (data->pwm_channel =3D=3D EMC2305_PWM_CHNL_CMN)
> > +		return emc2305_set_single_tz(dev, 0);
> > +
> > +	for (i =3D 0; i < data->pwm_channel; i++) {
> > +		ret =3D emc2305_set_single_tz(dev, i + 1);
> > +		if (ret)
> > +			goto thermal_cooling_device_register_fail;
> > +	}
> > +	return 0;
> > +
> > +thermal_cooling_device_register_fail:
> > +	emc2305_unset_tz(dev);
> > +	return ret;
> > +}
> > +
> > +static void emc2305_unset_tz(struct device *dev) {
> > +	struct emc2305_data *data =3D dev_get_drvdata(dev);
> > +	int i;
> > +
> > +	/* Unregister cooling device in case they have been registered by
> > +	 * thermal_cooling_device_unregister(). No need for clean-up flow in
> case they
> > +	 * have been registered by
> devm_thermal_of_cooling_device_register()
> > +	 */
> > +	if (!dev->of_node) {
> > +		for (i =3D 0; i < EMC2305_PWM_MAX; i++)
> > +			if (data->cdev_data[i].cdev)
> > +				thermal_cooling_device_unregister(data-
> >cdev_data[i].cdev);
> > +	}
> > +}
> > +
> > +static umode_t
> > +emc2305_is_visible(const void *data, enum hwmon_sensor_types type,
> > +u32 attr, int channel) {
> > +	int max_channel =3D emc2305_get_max_channel((struct emc2305_data
> > +*)data);
>=20
> Unnecessary typecast.
It's required as otherwise there is compilation warning.

>=20
> > +
> > +	/* Don't show channels which are not physically connected. */
> > +	if ((channel + 1) > max_channel)
>=20
> Unnecessary ()
>=20
Removed

> > +		return 0;
> > +	switch (type) {
> > +	case hwmon_fan:
> > +		switch (attr) {
> > +		case hwmon_fan_input:
> > +			return 0444;
> > +		case hwmon_fan_fault:
> > +			return 0444;
> > +		default:
> > +			break;
> > +		}
> > +		break;
> > +	case hwmon_pwm:
> > +		switch (attr) {
> > +		case hwmon_pwm_input:
> > +			return 0644;
> > +		default:
> > +			break;
> > +		}
> > +		break;
> > +	default:
> > +		break;
> > +	}
> > +
> > +	return 0;
> > +};
> > +
> > +static int
> > +emc2305_write(struct device *dev, enum hwmon_sensor_types type, u32
> > +attr, int channel, long val) {
> > +	struct emc2305_data *data =3D dev_get_drvdata(dev);
> > +
> > +	switch (type) {
> > +	case hwmon_pwm:
> > +		switch (attr) {
> > +		case hwmon_pwm_input:
> > +			/* If thermal is configured - handle PWM limit setting.
> */
> > +			if (IS_REACHABLE(CONFIG_THERMAL)) {
> > +				data->cdev_data[channel].last_hwmon_state
> =3D
> > +					EMC2305_PWM_DUTY2STATE(val,
> data->max_state, data->pwm_max);
> > +				/* Update PWM only in case requested state
> is not less than the
> > +				 * last thermal state.
> > +				 */
> > +				if (data-
> >cdev_data[channel].last_hwmon_state >=3D
> > +				    data-
> >cdev_data[channel].last_thermal_state)
> > +					return emc2305_set_cur_state(data-
> >cdev_data[channel].cdev,
> > +							data-
> >cdev_data[channel].last_hwmon_state);
> > +				return 0;
> > +			}
> > +			return emc2305_set_pwm(dev, val, channel);
> > +		default:
> > +			break;
> > +		}
> > +		break;
> > +	default:
> > +		break;
> > +	}
> > +
> > +	return -EOPNOTSUPP;
> > +};
> > +
> > +static int
> > +emc2305_read(struct device *dev, enum hwmon_sensor_types type, u32
> > +attr, int channel, long *val) {
> > +	int ret;
> > +
> > +	switch (type) {
> > +	case hwmon_fan:
> > +		switch (attr) {
> > +		case hwmon_fan_input:
> > +			ret =3D emc2305_show_fan(dev, channel);
> > +			if (ret < 0)
> > +				return ret;
> > +			*val =3D ret;
> > +			return 0;
> > +		case hwmon_fan_fault:
> > +			ret =3D emc2305_show_fault(dev, channel);
> > +			if (ret < 0)
> > +				return ret;
> > +			*val =3D ret;
> > +			return 0;
> > +		default:
> > +			break;
> > +		}
> > +		break;
> > +	case hwmon_pwm:
> > +		switch (attr) {
> > +		case hwmon_pwm_input:
> > +			ret =3D emc2305_show_pwm(dev, channel);
> > +			if (ret < 0)
> > +				return ret;
> > +			*val =3D ret;
> > +			return 0;
> > +		default:
> > +			break;
> > +		}
> > +		break;
> > +	default:
> > +		break;
> > +	}
> > +
> > +	return -EOPNOTSUPP;
> > +};
> > +
> > +static const struct hwmon_ops emc2305_ops =3D {
> > +	.is_visible =3D emc2305_is_visible,
> > +	.read =3D emc2305_read,
> > +	.write =3D emc2305_write,
> > +};
> > +
> > +static const struct hwmon_channel_info *emc2305_info[] =3D {
> > +	HWMON_CHANNEL_INFO(fan,
> > +			   HWMON_F_INPUT | HWMON_F_FAULT,
> > +			   HWMON_F_INPUT | HWMON_F_FAULT,
> > +			   HWMON_F_INPUT | HWMON_F_FAULT,
> > +			   HWMON_F_INPUT | HWMON_F_FAULT,
> > +			   HWMON_F_INPUT | HWMON_F_FAULT),
> > +	HWMON_CHANNEL_INFO(pwm,
> > +			   HWMON_PWM_INPUT,
> > +			   HWMON_PWM_INPUT,
> > +			   HWMON_PWM_INPUT,
> > +			   HWMON_PWM_INPUT,
> > +			   HWMON_PWM_INPUT),
> > +	NULL
> > +};
> > +
> > +static const struct hwmon_chip_info emc2305_chip_info =3D {
> > +	.ops =3D &emc2305_ops,
> > +	.info =3D emc2305_info,
> > +};
> > +
> > +static int emc2305_identify(struct device *dev) {
> > +	struct i2c_client *client =3D to_i2c_client(dev);
> > +	struct emc2305_data *data =3D i2c_get_clientdata(client);
> > +	int ret;
> > +
> > +	ret =3D i2c_smbus_read_byte_data(client,
> EMC2305_REG_PRODUCT_ID);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	switch (ret) {
> > +	case EMC2305:
> > +		data->pwm_num =3D 5;
> > +		break;
> > +	case EMC2303:
> > +		data->pwm_num =3D 3;
> > +		break;
> > +	case EMC2302:
> > +		data->pwm_num =3D 2;
> > +		break;
> > +	case EMC2301:
> > +		data->pwm_num =3D 1;
> > +		break;
> > +	default:
> > +		return -EINVAL;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int emc2305_probe(struct i2c_client *client, const struct
> > +i2c_device_id *id) {
> > +	struct i2c_adapter *adapter =3D client->adapter;
> > +	struct device *dev =3D &client->dev;
> > +	struct emc2305_data *data;
> > +	int vendor, device;
> > +	int ret;
> > +	int i;
> > +
> > +	if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_BYTE_DATA |
> I2C_FUNC_SMBUS_WORD_DATA))
> > +		return -ENODEV;
> > +
> > +	vendor =3D i2c_smbus_read_byte_data(client,
> EMC2305_REG_VENDOR);
> > +	if (vendor !=3D EMC2305_VENDOR)
> > +		return -ENODEV;
> > +
> > +	device =3D i2c_smbus_read_byte_data(client, EMC2305_REG_DEVICE);
> > +	if (device !=3D EMC2305_DEVICE)
> > +		return -ENODEV;
> > +
> > +	data =3D devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> > +	if (!data)
> > +		return -ENOMEM;
> > +
> > +	i2c_set_clientdata(client, data);
> > +	data->client =3D client;
> > +
> > +	ret =3D emc2305_identify(dev);
> > +	if (ret)
> > +		return ret;
> > +
> > +	data->max_state =3D EMC2305_FAN_MAX_STATE;
> > +	data->pwm_max =3D EMC2305_FAN_MAX;
> > +	data->pwm_min =3D EMC2305_FAN_MIN;
> > +	data->pwm_channel =3D EMC2305_PWM_CHNL_CMN;
> > +	if (dev->of_node) {
> > +		ret =3D emc2305_get_tz_of(dev);
> > +		if (ret < 0)
> > +			return ret;
> > +	}
> > +
> > +	data->hwmon_dev =3D devm_hwmon_device_register_with_info(dev,
> "emc2305", data,
> > +
> &emc2305_chip_info, NULL);
> > +	if (IS_ERR(data->hwmon_dev))
> > +		return PTR_ERR(data->hwmon_dev);
> > +
> > +	if (IS_REACHABLE(CONFIG_THERMAL)) {
> > +		ret =3D emc2305_set_tz(dev);
> > +		if (ret !=3D 0)
> > +			return ret;
> > +	}
> > +
> > +	for (i =3D 0; i < data->pwm_num; i++)
> > +		i2c_smbus_write_byte_data(client,
> EMC2305_REG_FAN_MIN_DRIVE(i),
> > +data->pwm_min);
> > +
> > +	return 0;
> > +}
> > +
> > +static int emc2305_remove(struct i2c_client *client) {
> > +	struct device *dev =3D &client->dev;
> > +
> > +	if (IS_REACHABLE(CONFIG_THERMAL))
> > +		emc2305_unset_tz(dev);
>=20
> It would be desirable to handle this with devm_add_action_or_reset() from
> emc2305_set_tz().
>
It's not required in case of devm_thermal_of_cooling_device_register
Added comment.
=20
> > +	return 0;
> > +}
> > +
> > +static struct i2c_driver emc2305_driver =3D {
> > +	.class  =3D I2C_CLASS_HWMON,
> > +	.driver =3D {
> > +		.name =3D "emc2305",
> > +		.of_match_table =3D emc2305_dt_ids,
> > +	},
> > +	.probe    =3D emc2305_probe,
> > +	.remove	  =3D emc2305_remove,
> > +	.id_table =3D emc2305_ids,
> > +	.address_list =3D emc2305_normal_i2c,
> > +};
> > +
> > +module_i2c_driver(emc2305_driver);
> > +
> > +MODULE_AUTHOR("Nvidia");
> > +MODULE_DESCRIPTION("Microchip EMC2305 fan controller driver");
> > +MODULE_LICENSE("GPL");
> > --
> > 2.14.1
> >


Thank you,
    Michael.


