Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64583C12002
	for <linux-hwmon@archiver.kernel.org>; Mon, 19 Jul 2021 15:51:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 543EB60FD7
	for <linux-hwmon@archiver.kernel.org>; Mon, 19 Jul 2021 15:51:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345168AbhGSPKZ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 19 Jul 2021 11:10:25 -0400
Received: from mail-bn7nam10on2085.outbound.protection.outlook.com ([40.107.92.85]:1248
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1346040AbhGSPJ7 (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 19 Jul 2021 11:09:59 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GgoF8AHhZ7D0KPUrfZvbGOCWMaKjIyhccOvehUYU6rYCa1U7QeOo9I9RBB5RZM6H22ohJmXrEiOe2CONiWEjMgf+NrBR1mnpT85dq0VZwoaZ9aQAIDaNsABArB2cx+rKTz1w30P0S1XYqpI5Aqx/2JHwB0zwZyxsOemo02kKUByzyXr/aZHN1mpF4uzUj7sYVIsduf1KnniOFbUdMMDvcw5LNFM8uVYaB6O0DmTdaaI8WnwCJuRC3Wf09itH2wzy3ZZQKB/v3lUOuN6H3M65KIa9W9O2GS/9UDqdBpPurbmpTw+/7kpnJGKPO57ldjGTfsfhijfNwzrcuUKGhz4gog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VoMsL40B0Gj54WxKx5ERJyqBA+lT365dSL5fkriE7zg=;
 b=B71CUBzHB0yiNwgllW1fLOgq6GcEw0JMmGYaR5HwyvuJA8M1v+V6Qjvd4u/XnmZoXnoFTBuOVlVfym7jzQTgbJzVpxHMcm5WFWi3jOl1nnIjrP6nfwbv6RmZXhEXdfWQo4SdBGkRWqUVDxJXSKarZImgCbmp8Dfd6oNtfjTd54yOSjTMmfKsXT5gcifFPhBmjtf/sT91ZpWgaEQICOQcpRFwK4z+gCecdC2/N5RwFOOrnyKSCoYys4BTBTwc83gI3wL9S7cT+wudGvAb3CH8neDJjLvatXA/GtVB+alFVp2JEK7pKxQO721bd4FAkCYzxSxpUGIpEjkDszhyLoEhBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VoMsL40B0Gj54WxKx5ERJyqBA+lT365dSL5fkriE7zg=;
 b=SU+C/D2vwjpb1TFEt89+8cWQV4ioLZe3lFzwuxjRezTwAWPwiR4AINWFaHMnGafAh9B888WQQbrB8cr5eKGIIIGZMrob4egt+bPBJfsPo8aziIgxBNtNuLp9bKHMvPINAz4NgogPARrvw145LK2RE7ctF8sPnwShxJgF8H4es90=
Received: from BL1PR12MB5286.namprd12.prod.outlook.com (2603:10b6:208:31d::6)
 by BL1PR12MB5095.namprd12.prod.outlook.com (2603:10b6:208:31b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.25; Mon, 19 Jul
 2021 15:50:37 +0000
Received: from BL1PR12MB5286.namprd12.prod.outlook.com
 ([fe80::8ce:4339:7e20:7022]) by BL1PR12MB5286.namprd12.prod.outlook.com
 ([fe80::8ce:4339:7e20:7022%7]) with mapi id 15.20.4331.033; Mon, 19 Jul 2021
 15:50:37 +0000
From:   "Chatradhi, Naveen Krishna" <NaveenKrishna.Chatradhi@amd.com>
To:     Guenter Roeck <linux@roeck-us.net>
CC:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "Gupta, Akshay" <Akshay.Gupta@amd.com>
Subject: RE: [PATCH v2 1/3] hwmon: sbrmi: Add support for sbrmi power module
Thread-Topic: [PATCH v2 1/3] hwmon: sbrmi: Add support for sbrmi power module
Thread-Index: AQHXc0kX6ukiv6vMeEKObmbscollvKtFKIwAgAVaXkA=
Date:   Mon, 19 Jul 2021 15:50:37 +0000
Message-ID: <BL1PR12MB5286E348111D26A45421EF4DE8E19@BL1PR12MB5286.namprd12.prod.outlook.com>
References: <20210625132544.18094-1-nchatrad@amd.com>
 <20210707155859.86240-1-nchatrad@amd.com>
 <20210716055812.GA717674@roeck-us.net>
In-Reply-To: <20210716055812.GA717674@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Enabled=true;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SetDate=2021-07-19T15:50:34Z;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Method=Standard;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Name=AMD Official Use
 Only-AIP 2.0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ActionId=ccfb9fad-924b-4f5d-b2a0-4241d480869d;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ContentBits=1
authentication-results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: af56fc15-b64e-4626-f339-08d94accf408
x-ms-traffictypediagnostic: BL1PR12MB5095:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BL1PR12MB509533C319D41E4B2B93FF01E8E19@BL1PR12MB5095.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6njwzNY3g9Lc/MtWB1a/msydI9H5nL5CNnG7F0hEWwuqNZqi7LSuobMnOSBLUEDO192i1uM3acBtBHGFDePoV+hZ1JHNd27SMXVZadhVr9yerGe/vYD8r0dpLPujVmoycK2ylBoM4zQSM/kTbqE9jNJ3HiktNW2GBOJYMg/T+fzeE7/ot15cHn2pjdzr2b3JQLtKyhIA88zP9gFCPXK1ujh6Q3lyJ9J8TN4CcNwTxstbNJzAS+gq3OHijWTIpVOGldjx5jcVhRVRztt+LswhKI983RlwZp+Fnjj/aNVI9fomFbPZ/7dJoMFcbPeNG7jlxIo1brWxnQd5+j7Fukn/dXv8Mfw1iI5/+c/RNNHqHyQoaTSJximCb9Pui4uQviM2wDnnuE/qnXTDsoP5ZvfSJwOty+FCyAymHV4O/BZ5BMHt8lR4CZeL6YsG3+S1YuRV45NpDqJ4nyKaFWUUL5FgjCHNBDp77HOVuD+ix81ypEbvjHYf0FFQ2q10Z1J+o8yd5v+mizUE5zljwXWBaWQuaWoqNV4aeXB2EMz9XV3oy1voYR8+mG8z22E1+TgZIL4ru2G8DsSfZ4GhxGqNonttC3JORF7wVjsi0ZTsl6A9YQ8H6C7cDlXhLvkUCk2W6X08ktkoVoiakmSuFBzkoiRA3dXpsu1xMdctEjITqGv6uvAwgbJYDZ+ONE9Cy3yTXld9jN5sIZndBCubI/elDeOE6yZFyb7X90h+azgaJzZJbWHzdROqKmnPbgNPW+TaEgcvxPmzjX6En/TPUtkxdboVnfHdvYejhiPdTyD6+99Sb/Q=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5286.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(396003)(39860400002)(376002)(366004)(54906003)(38100700002)(8936002)(478600001)(86362001)(966005)(53546011)(6506007)(4326008)(5660300002)(6916009)(71200400001)(8676002)(7696005)(316002)(122000001)(2906002)(55016002)(9686003)(64756008)(66446008)(30864003)(186003)(26005)(83380400001)(52536014)(33656002)(66476007)(76116006)(55236004)(66946007)(66556008)(38070700004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?KIGeXc2if1ITabAZl835oNXFAoDT3lVe/suFC7KXs1VROrU9pQbYGEcRidbT?=
 =?us-ascii?Q?hBY9QMagGU0QFWaJzg7Jv0MKI+dUs8cIDmzsxt1YpXUdHejs9ciEnnxNNu2b?=
 =?us-ascii?Q?SdKvdf3AMo0p+EgKbs8O03+S+s4EmbSAcoDHp19YPvewMdIYhXhA0MADuCPr?=
 =?us-ascii?Q?wGjjuIebOqGhczYnxBYhlUdKW3UnTe+hNxdLbTAhrYZJZQL1RuKdZVLYO00x?=
 =?us-ascii?Q?5OkU/BA/5r4bwqAgWl1oDUO5CpJX1driz+/fWwOVrQijPUWy5ljXoV2GZckB?=
 =?us-ascii?Q?KxxJ+OaF6dL/ouxJr5dB55j+tv3/cfk9E0iOE+/S9aM7C+9NLeM+pXBS3Uz4?=
 =?us-ascii?Q?MRiA75AHuODxXt1cWFBA12YI3uTiDpXJ1Ng5NywPpH0I12AnHRvM+EWwBVvM?=
 =?us-ascii?Q?K2xTM2PtRjUuGNP2R/WjZDxG46jDg5Hl/vgQ7Y0hV4brZB1RE90tGyvD2af/?=
 =?us-ascii?Q?ULhfd/issJk6IqYPPhoBNwrXZqsTzNUgUGBP1SHx69kYQ0rg2e4oaZA/jCXf?=
 =?us-ascii?Q?k463kkksHfxISJjYIjGtDjbWY8rYTJf2MrHQV7CjQk4nOXx/ioif4x8z6YyO?=
 =?us-ascii?Q?jAY9rGxE8kOMwPmPqB4M+9WR53WzBmhkkOl2VUQBWLo21jCH4wUUiK+8oYEH?=
 =?us-ascii?Q?2+Tms+/y9+Gu9tEaTkRhUL5EPReRT8GxU5yxNwQFKF50wTEyZwrnSyUxDYxK?=
 =?us-ascii?Q?qeHgJ4dXKRy8O2SJrHQroNWcIk2eU+02vEkzvOdXI9tM6Lat7QMfR0k6skM2?=
 =?us-ascii?Q?DakTH264rAyfy8/A2JZ8btQHPrpJdi77BhTKgtLSwwfNl2ZU0nYeeRph27S4?=
 =?us-ascii?Q?OpI1hJWVaTZiVJUYvt2S1RFZ3NGN24NhPfKLF2pKLubCAgPc+Y/Pzgly7ZJs?=
 =?us-ascii?Q?IJeRxe1BG9flqrq8TgYC9KviwawBp51u4tnuic1CJ1QVWru8q/2FILXasWr9?=
 =?us-ascii?Q?41aUaxwbR+PWQIqDA4CleVtvr8TgzjaP27H9aHCuNNlfjmVKVq9XVH611dYF?=
 =?us-ascii?Q?pAZWU1v9HhZ2CEOMmzka2EXB5/Qh+IIfDu6SMzWufBvUzUg+rwbvCIfF1XrU?=
 =?us-ascii?Q?03mYWnwDMNzfXh1/XO0JxCaLajf8jOp9dcgaCvLxN0ENbebEV6WoA9bTwajU?=
 =?us-ascii?Q?1yiplz9N9x9hZ5pE4JZQaRn443cOD1kA5G/Fkak8NMTGyV5s/zPrgXhJ9IXE?=
 =?us-ascii?Q?oJfjPDRuGblKkDm+dVBlivlhFNFaqTywdWjcUZFfGOONhOMp6l+V3N/E4xIp?=
 =?us-ascii?Q?8Qm1tLIeiJVMlX843GJxy7W2V/bCUARsXrCTftSQ/qxxdCds3prKBeC2DeYC?=
 =?us-ascii?Q?gBgAElCUn4M4DVdfLpIn+H+r?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5286.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af56fc15-b64e-4626-f339-08d94accf408
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2021 15:50:37.6780
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: d51KfIgtCYMWYY94dLq9OOw00kvpSOAndfyiTFqvclMM23rNcIuxsxZMo0yKhNqhmI7rDtcDVRN8jESGDLB7Gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5095
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

[AMD Official Use Only]

Hi Guenter,

Thank you for your review, will submit revised version shortly.

Regards,
Naveenk

-----Original Message-----
From: Guenter Roeck <groeck7@gmail.com> On Behalf Of Guenter Roeck
Sent: Friday, July 16, 2021 11:28 AM
To: Chatradhi, Naveen Krishna <NaveenKrishna.Chatradhi@amd.com>
Cc: linux-hwmon@vger.kernel.org; Gupta, Akshay <Akshay.Gupta@amd.com>
Subject: Re: [PATCH v2 1/3] hwmon: sbrmi: Add support for sbrmi power modul=
e

[CAUTION: External Email]

On Wed, Jul 07, 2021 at 09:28:57PM +0530, Naveen Krishna Chatradhi wrote:
> From: Akshay Gupta <Akshay.Gupta@amd.com>
>
> On AMD platforms the Out-of-band access is provided by Advanced=20
> Platform Management Link (APML), APML is a SMBus v2.0 compatible=20
> 2-wire processor client interface.
> APML is also referred as the sideband interface (SBI).
>
> APML is used to communicate with the
> Side-Band Remote Management Interface (SB-RMI) which provides Soft=20
> Mailbox messages to manage power consumption and power limits of the=20
> CPU socket.
>
> - This module add support to read power consumption,
>   power limit & max power limit and write power limit.
> - To instantiate this driver on a Board Management Controller (BMC)
>   connected to an AMD CPU with SB-RMI support, the i2c bus number
>   would be the bus connected from the BMC to the CPU.
>
> Signed-off-by: Akshay Gupta <Akshay.Gupta@amd.com>
> Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
> ---
>
> Changes since v1:
> 1. remove header file and move in alphabetical order 2. make all=20
> comments multiline 3. remove the pr_err, needed for debugging only 4.=20
> fix #define tab issue 5. uninitailize err,
>   - correct spelling & remove extra ()
>   - remove extra i2c functionality check 6. reduce call to=20
> data->client 7. remove usage of union
>
>  drivers/hwmon/Kconfig  |  10 ++
>  drivers/hwmon/Makefile |   1 +
>  drivers/hwmon/sbrmi.c  | 341=20
> +++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 352 insertions(+)
>  create mode 100644 drivers/hwmon/sbrmi.c
>
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig index=20
> 87624902ea80..f489972a6309 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -1551,6 +1551,16 @@ config SENSORS_SBTSI
>         This driver can also be built as a module. If so, the module will
>         be called sbtsi_temp.
>
> +config SENSORS_SBRMI
> +     tristate "Emulated SB-RMI sensor"
> +     depends on I2C
> +     help
> +       If you say yes here you get support for emulated RMI
> +       sensors on AMD SoCs with APML interface connected to a BMC device=
.
> +
> +       This driver can also be built as a module. If so, the module will
> +       be called sbrmi.
> +
>  config SENSORS_SHT15
>       tristate "Sensiron humidity and temperature sensors. SHT15 and comp=
at."
>       depends on GPIOLIB || COMPILE_TEST diff --git=20
> a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile index=20
> 59e78bc212cf..8031acf58936 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -164,6 +164,7 @@ obj-$(CONFIG_SENSORS_PWM_FAN)     +=3D pwm-fan.o
>  obj-$(CONFIG_SENSORS_RASPBERRYPI_HWMON)      +=3D raspberrypi-hwmon.o
>  obj-$(CONFIG_SENSORS_S3C)    +=3D s3c-hwmon.o
>  obj-$(CONFIG_SENSORS_SBTSI)  +=3D sbtsi_temp.o
> +obj-$(CONFIG_SENSORS_SBRMI)  +=3D sbrmi.o
>  obj-$(CONFIG_SENSORS_SCH56XX_COMMON)+=3D sch56xx-common.o
>  obj-$(CONFIG_SENSORS_SCH5627)        +=3D sch5627.o
>  obj-$(CONFIG_SENSORS_SCH5636)        +=3D sch5636.o
> diff --git a/drivers/hwmon/sbrmi.c b/drivers/hwmon/sbrmi.c new file=20
> mode 100644 index 000000000000..10622b1f23f2
> --- /dev/null
> +++ b/drivers/hwmon/sbrmi.c
> @@ -0,0 +1,341 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * sbrmi.c - hwmon driver for a SB-RMI mailbox
> + *           compliant AMD SoC device.
> + *
> + * Copyright (C) 2020-2021 Advanced Micro Devices, Inc.
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/err.h>
> +#include <linux/hwmon.h>
> +#include <linux/i2c.h>
> +#include <linux/init.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/of.h>
> +
> +/* Do not allow setting negative power limit */
> +#define SBRMI_PWR_MIN        0
> +/* Mask for Status Register bit[1] */
> +#define SW_ALERT_MASK        0x2
> +
> +/* Software Interrupt for triggering */
> +#define START_CMD    0x80
> +#define TRIGGER_MAILBOX      0x01
> +
> +/*
> + * SB-RMI supports soft mailbox service request to MP1 (power=20
> +management
> + * firmware) through SBRMI inbound/outbound message registers.
> + * SB-RMI message IDs
> + */
> +enum sbrmi_msg_id {
> +     SBRMI_READ_PKG_PWR_CONSUMPTION =3D 0x1,
> +     SBRMI_WRITE_PKG_PWR_LIMIT,
> +     SBRMI_READ_PKG_PWR_LIMIT,
> +     SBRMI_READ_PKG_MAX_PWR_LIMIT,
> +};
> +
> +/* SB-RMI registers */
> +enum sbrmi_reg {
> +     SBRMI_CTRL              =3D 0x01,
> +     SBRMI_STATUS,
> +     SBRMI_OUTBNDMSG0        =3D 0x30,
> +     SBRMI_OUTBNDMSG1,
> +     SBRMI_OUTBNDMSG2,
> +     SBRMI_OUTBNDMSG3,
> +     SBRMI_OUTBNDMSG4,
> +     SBRMI_OUTBNDMSG5,
> +     SBRMI_OUTBNDMSG6,
> +     SBRMI_OUTBNDMSG7,
> +     SBRMI_INBNDMSG0,
> +     SBRMI_INBNDMSG1,
> +     SBRMI_INBNDMSG2,
> +     SBRMI_INBNDMSG3,
> +     SBRMI_INBNDMSG4,
> +     SBRMI_INBNDMSG5,
> +     SBRMI_INBNDMSG6,
> +     SBRMI_INBNDMSG7,
> +     SBRMI_SW_INTERRUPT,
> +};
> +
> +/* Each client has this additional data */ struct sbrmi_data {
> +     struct i2c_client *client;
> +     struct mutex lock;
> +};
> +
> +struct sbrmi_mailbox_msg {
> +     u8 cmd;
> +     bool read;
> +     u32 data_in;
> +     u32 data_out;
> +};
> +
> +static int sbrmi_enable_alert(struct i2c_client *client) {
> +     int ctrl;
> +
> +     /*
> +      * Enable the SB-RMI Software alert status
> +      * by writing 0 to bit 4 of Control register(0x1)
> +      */
> +     ctrl =3D i2c_smbus_read_byte_data(client, SBRMI_CTRL);
> +     if (ctrl < 0)
> +             return ctrl;
> +
> +     if (ctrl & 0x10) {
> +             ctrl &=3D ~0x10;
> +             return i2c_smbus_write_byte_data(client,
> +                                              SBRMI_CTRL, ctrl);
> +     }
> +
> +     return 0;
> +}
> +
> +static int rmi_mailbox_xfer(struct sbrmi_data *data,
> +                         struct sbrmi_mailbox_msg *msg) {
> +     int i, ret, retry =3D 10;
> +     int sw_status;
> +     u8 byte;
> +
> +     mutex_lock(&data->lock);
> +
> +     ret =3D sbrmi_enable_alert(data->client);
> +     if (ret < 0)
> +             goto exit_unlock;
> +

Is it really necessary to call this for every command (instead of once duri=
ng probe) ?
[naveenk:] Will move it

> +     /* Indicate firmware a command is to be serviced */
> +     ret =3D i2c_smbus_write_byte_data(data->client,
> +                                     SBRMI_INBNDMSG7, START_CMD);
> +     if (ret < 0)
> +             goto exit_unlock;
> +
> +     /* Write the command to SBRMI::InBndMsg_inst0 */
> +     ret =3D i2c_smbus_write_byte_data(data->client,
> +                                     SBRMI_INBNDMSG0, msg->cmd);
> +     if (ret < 0)
> +             goto exit_unlock;
> +
> +     /*
> +      * For both read and write the initiator (BMC) writes
> +      * Command Data In[31:0] to SBRMI::InBndMsg_inst[4:1]
> +      * SBRMI_x3C(MSB):SBRMI_x39(LSB)
> +      */
> +     for (i =3D 0; i < 4; i++) {
> +             byte =3D (msg->data_in >> i * 8) & 0xff;
> +             ret =3D i2c_smbus_write_byte_data(data->client,
> +                                             SBRMI_INBNDMSG1 + i, byte);
> +             if (ret < 0)
> +                     goto exit_unlock;
> +     }
> +
> +     /*
> +      * Write 0x01 to SBRMI::SoftwareInterrupt to notify firmware to
> +      * perform the requested read or write command
> +      */
> +     ret =3D i2c_smbus_write_byte_data(data->client,
> +                                     SBRMI_SW_INTERRUPT, TRIGGER_MAILBOX=
);
> +     if (ret < 0)
> +             goto exit_unlock;
> +
> +     /*
> +      * Firmware will write SBRMI::Status[SwAlertSts]=3D1 to generate
> +      * an ALERT (if enabled) to initiator (BMC) to indicate completion
> +      * of the requested command
> +      */
> +     do {
> +             sw_status =3D i2c_smbus_read_byte_data(data->client,
> +                                                  SBRMI_STATUS);
> +             if (sw_status < 0) {
> +                     ret =3D sw_status;
> +                     goto exit_unlock;
> +             }
> +             if (sw_status & SW_ALERT_MASK)
> +                     break;
> +             usleep_range(50, 100);

I don't have the interface specification, but is ~600 uS guaranteed to be s=
ufficient time for the firmware to respond ?
[naveenk:] The SB-RMI is explained in the APML chapter of the reference man=
ual available https://www.amd.com/en/support/tech-docs?keyword=3D55898=20
I did not find any mention of the response time, we ran several times and n=
ever seen the loop execute twice. Do you have any recommendation here ?

> +     } while (retry--);
> +
> +     if (retry < 0) {
> +             pr_err("Firmware fail to indicate command=20
> + completion\n");

Please use dev_err(). Also, does this really warrant an error message ?
I am concerned that it may fill up the log if there is an issue with the cl=
ient, eg if it hangs. On top of that, there is already an error message bel=
ow. Please no more than one message per error.
[naveenk:] Sure will change to dev_err and remove one of the prints

> +             ret =3D -1;

Please use standard error codes (-ETIMEDOUT ? -EIO ? -EPROTO ?).
-1 translates to -EPERM which is presumably not what you want.
[naveenk:] Will use -EIO

> +             goto exit_unlock;
> +     }
> +
> +     /*
> +      * For a read operation, the initiator (BMC) reads the firmware
> +      * response Command Data Out[31:0] from SBRMI::OutBndMsg_inst[4:1]
> +      * {SBRMI_x34(MSB):SBRMI_x31(LSB)}.
> +      */
> +     if (msg->read) {
> +             for (i =3D 0; i < 4; i++) {
> +                     ret =3D i2c_smbus_read_byte_data(data->client,
> +                                                    SBRMI_OUTBNDMSG1 + i=
);
> +                     if (ret < 0)
> +                             goto exit_unlock;

This is a concern in conjunction with the ignored error in sbrmi_write().
If there is an error after reading a number of bytes, the returned value wi=
ll be partial/random.
[naveenk:] Will address the return value

> +                     msg->data_out |=3D (ret & 0xff) << i * 8;

The mask is unnecessary here. A byte read will never return a value > 0xff.
[naveenk:] Sure will remove

> +             }
> +     }
> +
> +     /*
> +      * BMC must write 1'b1 to SBRMI::Status[SwAlertSts] to clear the
> +      * ALERT to initiator
> +      */
> +     ret =3D i2c_smbus_write_byte_data(data->client, SBRMI_STATUS,
> +                                     sw_status | SW_ALERT_MASK);
> +
> +exit_unlock:
> +     if (ret < 0)
> +             pr_err("SMBUS translation failed\n");

dev_err(). Also, please consider that this may fill the log if the client o=
r the i2c controller/bus has a problem.
[naveenk:] Will remove this print

> +
> +     mutex_unlock(&data->lock);
> +     return ret;
> +}
> +
> +static int sbrmi_read(struct device *dev, enum hwmon_sensor_types type,
> +                   u32 attr, int channel, long *val) {
> +     struct sbrmi_data *data =3D dev_get_drvdata(dev);
> +     struct sbrmi_mailbox_msg msg =3D { 0 };
> +     int ret;
> +
> +     if (type !=3D hwmon_power)
> +             return -EINVAL;
> +
> +     msg.read =3D true;
> +     switch (attr) {
> +     case hwmon_power_input:
> +             msg.cmd =3D SBRMI_READ_PKG_PWR_CONSUMPTION;
> +             ret =3D rmi_mailbox_xfer(data, &msg);
> +             break;
> +     case hwmon_power_cap:
> +             msg.cmd =3D SBRMI_READ_PKG_PWR_LIMIT;
> +             ret =3D rmi_mailbox_xfer(data, &msg);
> +             break;
> +     case hwmon_power_cap_max:
> +             msg.cmd =3D SBRMI_READ_PKG_MAX_PWR_LIMIT;
> +             ret =3D rmi_mailbox_xfer(data, &msg);
> +             break;
> +     default:
> +             return -EINVAL;
> +     }
> +     /* hwmon power attributes are in microWatt */
> +     *val =3D (long)msg.data_out * 1000;
> +     return ret;
> +}
> +
> +static int sbrmi_write(struct device *dev, enum hwmon_sensor_types type,
> +                    u32 attr, int channel, long val) {
> +     struct sbrmi_data *data =3D dev_get_drvdata(dev);
> +     struct sbrmi_mailbox_msg msg =3D { 0 };
> +
> +     if (type !=3D hwmon_power && attr !=3D hwmon_power_cap)
> +             return -EINVAL;
> +     /*
> +      * hwmon power attributes are in microWatt
> +      * mailbox read/write is in mWatt
> +      */
> +     val /=3D 1000;
> +
> +     msg.cmd =3D SBRMI_READ_PKG_MAX_PWR_LIMIT;
> +     msg.data_in =3D 0;

Unnecessary (already initialized above).

> +     msg.read =3D true;
> +     rmi_mailbox_xfer(data, &msg);

Not sure if it is a good idea to ignore an error return here.
As far as I can see in rmi_mailbox_xfer(), the returned value is more or le=
ss random if there is an error.

If the maximum power limit is static, it might make sense to read it only o=
nce in the prob function and cache the limit in struct sbrmi_data instead o=
f reading it repeatedly.
[naveenk:] The maximum limit is fixed, will cache during probe.
If the limit is not static and it is indeed necessary to re-read the limit,=
 isn't this racy if there are multiple write requests in parallel ?
[naveenk:] the operating limit value can be set to a value below the max_li=
mit

> +
> +     val =3D clamp_val(val, SBRMI_PWR_MIN, msg.data_out);
> +
> +     msg.cmd =3D SBRMI_WRITE_PKG_PWR_LIMIT;
> +     msg.data_in =3D val;
> +     msg.read =3D false;
> +
> +     return rmi_mailbox_xfer(data, &msg); }
> +
> +static umode_t sbrmi_is_visible(const void *data,
> +                             enum hwmon_sensor_types type,
> +                             u32 attr, int channel) {
> +     switch (type) {
> +     case hwmon_power:
> +             switch (attr) {
> +             case hwmon_power_input:
> +             case hwmon_power_cap_max:
> +                     return 0444;
> +             case hwmon_power_cap:
> +                     return 0644;
> +             }
> +             break;
> +     default:
> +             break;
> +     }
> +     return 0;
> +}
> +
> +static const struct hwmon_channel_info *sbrmi_info[] =3D {
> +     HWMON_CHANNEL_INFO(power,
> +                        HWMON_P_INPUT | HWMON_P_CAP | HWMON_P_CAP_MAX),
> +     NULL
> +};
> +
> +static const struct hwmon_ops sbrmi_hwmon_ops =3D {
> +     .is_visible =3D sbrmi_is_visible,
> +     .read =3D sbrmi_read,
> +     .write =3D sbrmi_write,
> +};
> +
> +static const struct hwmon_chip_info sbrmi_chip_info =3D {
> +     .ops =3D &sbrmi_hwmon_ops,
> +     .info =3D sbrmi_info,
> +};
> +
> +static int sbrmi_probe(struct i2c_client *client,
> +                    const struct i2c_device_id *id) {
> +     struct device *dev =3D &client->dev;
> +     struct device *hwmon_dev;
> +     struct sbrmi_data *data;
> +
> +     data =3D devm_kzalloc(dev, sizeof(struct sbrmi_data), GFP_KERNEL);
> +     if (!data)
> +             return -ENOMEM;
> +
> +     data->client =3D client;
> +     mutex_init(&data->lock);
> +
> +     hwmon_dev =3D devm_hwmon_device_register_with_info(dev, client->nam=
e, data,
> +                                                     =20
> + &sbrmi_chip_info, NULL);
> +
> +     return PTR_ERR_OR_ZERO(hwmon_dev); }
> +
> +static const struct i2c_device_id sbrmi_id[] =3D {
> +     {"sbrmi", 0},
> +     {}
> +};
> +MODULE_DEVICE_TABLE(i2c, sbrmi_id);
> +
> +static const struct of_device_id __maybe_unused sbrmi_of_match[] =3D {
> +     {
> +             .compatible =3D "amd,sbrmi",
> +     },
> +     { },
> +};
> +MODULE_DEVICE_TABLE(of, sbrmi_of_match);
> +
> +static struct i2c_driver sbrmi_driver =3D {
> +     .class =3D I2C_CLASS_HWMON,
> +     .driver =3D {
> +             .name =3D "sbrmi",
> +             .of_match_table =3D of_match_ptr(sbrmi_of_match),
> +     },
> +     .probe =3D sbrmi_probe,
> +     .id_table =3D sbrmi_id,
> +};
> +
> +module_i2c_driver(sbrmi_driver);
> +
> +MODULE_AUTHOR("Akshay Gupta <akshay.gupta@amd.com>");=20
> +MODULE_DESCRIPTION("Hwmon driver for AMD SB-RMI emulated sensor");=20
> +MODULE_LICENSE("GPL");
> --
> 2.17.1
>
