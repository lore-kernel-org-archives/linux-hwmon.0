Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4714C433FE
	for <linux-hwmon@archiver.kernel.org>; Wed,  9 Dec 2020 11:04:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 76CE9225AC
	for <linux-hwmon@archiver.kernel.org>; Wed,  9 Dec 2020 11:04:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730317AbgLILEM (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 9 Dec 2020 06:04:12 -0500
Received: from mail-eopbgr700087.outbound.protection.outlook.com ([40.107.70.87]:34176
        "EHLO NAM04-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730161AbgLILEL (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 9 Dec 2020 06:04:11 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=khwsmca2EglDm8xKHUnDGAEdGCDF+ccEUjj7s/Zm9egKePxXGvPbHvtPIq+V2tGzEH8cvErm9V4ALngyEsXzSq80dYF4Txt2vInQgS4dafqGo9mxfollb5jxiilX/2rmTt1k5TwOiwSwEzAHY0D+ioIUVyxdPlzAiX+++T9FK4uC4f83UYrrTDV1s/RoHzFn8kIKWPxQst6fDkX5ewX8S9tTYu3Lgqt3hGbfdLrLT/K0tsWoJ0eK+/faPo9BDCPnvNu4J5AwBQ/O1s8Pcci+PTExCFxoGS2oGLcNQCJT0Ol/zXNcDFrf6LCtZ6t5dfp6BQBrYduZqqfQ0HR/qgwC6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5QFHLa1OlxOf47Mqhh2rxGa7f84ny/63W5VDYn7DKEM=;
 b=AuDMV0dWmyAVPiGPL2jUuzTeG9Psobkl+qvX7SGUyWgl420TxccCjSj4VUDeTdNHV+w4nkOctAmSilIP3UF5BeXiE0XwDHHgXFezJS8pBvvWzvVty5jL+jdx1sRG324tBxzapaBjA+q7i1WEmaBhuYqLgeyhBZyEtNs3kUg+AEqBORVlj6dpd4+2mtoq0eed4oSXqUDbhea5zGdfegwV1jvxFlRCWYLn+MTbukMVnPF16NNCrMP1e/th2Q7ulN9/HN5n7AoiMyTBUXnUqaF0LJm/xsv3rQ/gWJkUKNvFo2cO99DoP53W/EDnDzK+eiJctTQ46QXWANLzkM//5WQhNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5QFHLa1OlxOf47Mqhh2rxGa7f84ny/63W5VDYn7DKEM=;
 b=vizEh4mL/zr2I9PjfCECTaavJyudd2mbPLgTeA8T/gITB65LxEs98T3ReapbJILJJMD6KrVZixjN8O0HBXQdzOHk6k5juQJJFn8ElY/jIXMk/c9dN8InKPvrPX42nx++27YxvV5FA3X0NKXLb340yOQhFat0upqFPUfWBJrkFKI=
Received: from DM6PR12MB4388.namprd12.prod.outlook.com (2603:10b6:5:2a9::10)
 by DM5PR12MB2486.namprd12.prod.outlook.com (2603:10b6:4:b2::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Wed, 9 Dec
 2020 11:03:24 +0000
Received: from DM6PR12MB4388.namprd12.prod.outlook.com
 ([fe80::84e9:dd44:12cf:bdb3]) by DM6PR12MB4388.namprd12.prod.outlook.com
 ([fe80::84e9:dd44:12cf:bdb3%4]) with mapi id 15.20.3654.013; Wed, 9 Dec 2020
 11:03:24 +0000
From:   "Chatradhi, Naveen Krishna" <NaveenKrishna.Chatradhi@amd.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Sandeep Raghuraman <sandy.8925@gmail.com>
CC:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: RE: [PATCH] Add support for Zen 2 CPUs to amd_energy driver
Thread-Topic: [PATCH] Add support for Zen 2 CPUs to amd_energy driver
Thread-Index: AQHWzZ/GO5Lm98z6j0KVRyvWw2SpBKntqZ+AgACuc4A=
Date:   Wed, 9 Dec 2020 11:03:24 +0000
Message-ID: <DM6PR12MB4388D95FCC7AD13E3E6AE26FE8CC0@DM6PR12MB4388.namprd12.prod.outlook.com>
References: <a14b8be6-e8b4-c658-2cd6-a2f280be0f99@gmail.com>
 <20201208204059.GA73427@roeck-us.net>
In-Reply-To: <20201208204059.GA73427@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_c3918902-4ff3-42f6-8eb5-e5d9c71daf16_Enabled=true;
 MSIP_Label_c3918902-4ff3-42f6-8eb5-e5d9c71daf16_SetDate=2020-12-09T11:02:50Z;
 MSIP_Label_c3918902-4ff3-42f6-8eb5-e5d9c71daf16_Method=Privileged;
 MSIP_Label_c3918902-4ff3-42f6-8eb5-e5d9c71daf16_Name=Internal Use Only -
 Restricted;
 MSIP_Label_c3918902-4ff3-42f6-8eb5-e5d9c71daf16_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_c3918902-4ff3-42f6-8eb5-e5d9c71daf16_ActionId=d12aca7b-1298-470f-b6bc-00008750fc22;
 MSIP_Label_c3918902-4ff3-42f6-8eb5-e5d9c71daf16_ContentBits=1
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_enabled: true
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_setdate: 2020-12-09T11:02:39Z
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_method: Standard
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_name: Internal Use Only -
 Unrestricted
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_actionid: 9c0de82d-6ef4-446b-af1b-0000ef191c8e
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_contentbits: 0
msip_label_c3918902-4ff3-42f6-8eb5-e5d9c71daf16_enabled: true
msip_label_c3918902-4ff3-42f6-8eb5-e5d9c71daf16_setdate: 2020-12-09T11:03:20Z
msip_label_c3918902-4ff3-42f6-8eb5-e5d9c71daf16_method: Privileged
msip_label_c3918902-4ff3-42f6-8eb5-e5d9c71daf16_name: Internal Use Only -
 Restricted
msip_label_c3918902-4ff3-42f6-8eb5-e5d9c71daf16_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_c3918902-4ff3-42f6-8eb5-e5d9c71daf16_actionid: ba69081c-e2b4-4303-953b-0000bfc3d6b7
msip_label_c3918902-4ff3-42f6-8eb5-e5d9c71daf16_contentbits: 0
authentication-results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=amd.com;
x-originating-ip: [165.204.159.242]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 65683ea9-88bf-4466-8969-08d89c320c4c
x-ms-traffictypediagnostic: DM5PR12MB2486:
x-microsoft-antispam-prvs: <DM5PR12MB24860D0BCC13B369E1D077C0E8CC0@DM5PR12MB2486.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:923;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UyVIqPj4GfMOCEK1zQ79we9QPJzDMBZuMBCWjmk468gqv6w6R35FYt6RNndoyUeiE1WsnSVxUVFVObuDcBo/nYlqz2smOX+9XEEUSsA/XG2yfssxJzoouvmN4/DfbeuA/Nq57YB9oMAgUTYLJTIyzAHXnfO+l6lRp2cWOLKMZyu8EV1A2fyNi2bXQLMo7EkWBr6AO0ZOGXFeE83HR27GFPWjEV2OxfbP3A6ugim/97iBlZUvIINPspN47oGW3NG97Wq3eE6F12RX2iddyMf6GzvywZuhZIWVLJqHCyapFE/FCt20L2iS34wStZlqBiGshYlJHQR2gQvPT7QjUVvcgqrkHHJ7wX3kbr0832OWWZq0reYRbhuAAa0uQ0gkAXnpQYR6tz1bpMwtbgAI5zYzTA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4388.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(136003)(376002)(66446008)(86362001)(33656002)(52536014)(66556008)(66476007)(8936002)(9686003)(55016002)(71200400001)(66946007)(4326008)(2906002)(53546011)(26005)(6506007)(966005)(186003)(83380400001)(8676002)(110136005)(5660300002)(508600001)(64756008)(7696005)(76116006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?754u0g+eaknRdsbSjfEZmOD9oQAZvAJPmVqHznTZuPKCEusn0vemwlKr6PUr?=
 =?us-ascii?Q?JynVyn755fGNsny+3jf1JGz2xpXn6LIrNNGTRlDoVF5XUDbgEn2r2O+mve8i?=
 =?us-ascii?Q?kbnTllGJxNu4h5LOUYszzo03enyTGjC3jJJD+YWauQtIoqsIk2fdRWD7stn7?=
 =?us-ascii?Q?PX++tI+wPK10ZhmgXIouhCtqwXhxXrtcJmK/9Px1EWAjwb8i2z2bUmBpXEb4?=
 =?us-ascii?Q?grkyX1X+ePdgMxC/NhRKNhczo0IesiQDfPfPA3TsYwawwJhh0YZ8uCiYTLlv?=
 =?us-ascii?Q?2I+lsNfDl+6pRvsbXJGHFEmRosDrYO4x+F5R5ww6KgnT2UB6tZucpWC/crAF?=
 =?us-ascii?Q?eulM3h0wPKWBpy9AhM7d9UhMiUZOP7U5mwDFzY5ErMIekE0WXWB75IUcpAzI?=
 =?us-ascii?Q?pQo1PVWHFbCSdlp7OZ2ecOos3F56Zt+74whPdEuYD7y0sZApvmS8GWtNLgUG?=
 =?us-ascii?Q?nSc9rY0crI1aUcbCEHCuk4CoJD8YyOmP+OcnWtHTeCECpSPtJgGmJL4SxUff?=
 =?us-ascii?Q?FudlxEmcsjiZWE6/kHswHokUQ8PUwMLTjtjegMrcyfKY22soPqg87XXUXGiY?=
 =?us-ascii?Q?u5sE6POOKOBguCB546K01TYaOyo8NEBsBFqw6uJYs7AWyGnaDXQXLn5MUr+e?=
 =?us-ascii?Q?fgEYrre0o6/bTfKeEtlz2Gk+j0J/LYzKqQH8mgvgeEtd7s0q3ggCIMbKUaP0?=
 =?us-ascii?Q?p5+x24msRWCWL1A9Zws0APcIApA8gLJNS/p8ail/IJJHPpBeGKWdIwEZebAm?=
 =?us-ascii?Q?9QLZSc56rkdzhS8/zDAbV4Abz38nlwfUWRM2ZRByH8fHWF+Sg8yDQf7EaQzl?=
 =?us-ascii?Q?MTmGI4MfZVuHXvLggPBo68Dtigi2pMTxKVCxIVOtTKz0gIjhMRKKcAEnZEyL?=
 =?us-ascii?Q?fJ9vfJYR7nkj/vos0RpDnN0ECwSdFwMpykHeX9FlYWDGz5v+Ie5XhCZ6OJZZ?=
 =?us-ascii?Q?2SQPrue8ztjQ5vtH3IXR4OEWmYkShUBOfqv88x3hpZc=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4388.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65683ea9-88bf-4466-8969-08d89c320c4c
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Dec 2020 11:03:24.1087
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: o95mYSEba6GyYnph6kN/yaQVs0dtIqbWrCmsZRxR24D0fCzafS8toHoXTefZl5Kqm93OuBop1JAjDjyd31oqag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2486
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

[AMD Official Use Only - Approved for External Use]

Hi Guenter,

>> This patch will require an Ack from Naveen; support for this model was p=
reviously removed due to inconsistent results; see commit f28e360f2903
("hwmon: (amd_energy) match for supported models"),
I could not get hold of a board with the mentioned processor.=20

Sandeep,

Earlier, we noticed on some of the family 17h processors the core and socke=
t energy counters are not well calibrated.

While running avx-turbo work load https://github.com/travisdowns/avx-turbo =
as below, we noticed that for a given time,
the sum of the energy consumed by all the cores in a socket is greater than=
 the energy consumed by the socket itself.

Can you run the avx-turbo test, with following options and confirm the resu=
lts ?

  ./avx-turbo --iters 10000000 --spec avx256_fma_t/8

This will run AVX code on all 8 cores for about 1 second. To run it for lon=
ger, increase the --iters argument.

Regards,
Naveenk

-----Original Message-----
From: Guenter Roeck <linux@roeck-us.net>=20
Sent: Wednesday, December 9, 2020 2:11 AM
To: Sandeep Raghuraman <sandy.8925@gmail.com>
Cc: linux-hwmon@vger.kernel.org; Chatradhi, Naveen Krishna <NaveenKrishna.C=
hatradhi@amd.com>
Subject: Re: [PATCH] Add support for Zen 2 CPUs to amd_energy driver

[CAUTION: External Email]

On Wed, Dec 09, 2020 at 01:51:48AM +0530, Sandeep Raghuraman wrote:
> This patch adds support for Zen 2 desktop CPUs to the amd_energy driver.
>
> Signed-off-by: Sandeep Raghuraman <sandy.8925@gmail.com>

This patch will require an Ack from Naveen; support for this model was prev=
iously removed due to inconsistent results; see commit f28e360f2903
("hwmon: (amd_energy) match for supported models"),

Guenter

> ---
>  drivers/hwmon/amd_energy.c | 1 +
>  1 file changed, 1 insertion(+)
>
> --
>
> diff --git a/drivers/hwmon/amd_energy.c b/drivers/hwmon/amd_energy.c=20
> index 0dee535e6c85..21341c8e1d6e 100644
> --- a/drivers/hwmon/amd_energy.c
> +++ b/drivers/hwmon/amd_energy.c
> @@ -363,6 +363,7 @@ static struct platform_device *amd_energy_platdev;
>
>  static const struct x86_cpu_id cpu_ids[] __initconst =3D {
>         X86_MATCH_VENDOR_FAM_MODEL(AMD, 0x17, 0x31, NULL),
> +       X86_MATCH_VENDOR_FAM_MODEL(AMD, 0x17, 0x71, NULL),
>         {}
>  };
>  MODULE_DEVICE_TABLE(x86cpu, cpu_ids);=
