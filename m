Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 990ECC433EF
	for <linux-hwmon@archiver.kernel.org>; Mon, 18 Jul 2022 12:39:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234826AbiGRMjG (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 18 Jul 2022 08:39:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234779AbiGRMjB (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 18 Jul 2022 08:39:01 -0400
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2052.outbound.protection.outlook.com [40.107.95.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 524075FED;
        Mon, 18 Jul 2022 05:39:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FF05GSDKzDzEalEmwH2QyjWFVmxPkIy2TcDiJXNW7DrMjGuTQ0LmNkIYMQcmI/agnzHS/5DO+1dULrAruD1z5d1LGTpmvWsiuH06d49lR3yBTkgmuC8ZKBAwVCGpQTtCNM9zvymGxH0mZ7KkGMl9DreBO7vEFn7JeRKNKZWufgPta9mWbleeZ9Zt34xPdprVlB3zY5i4MFg5QUvXfr7YynFo0sOJ74eVvF5Obwl/39nvKaCs2jEyZduZqBpt5kmEvJEuJVW79qggshDlmzujmyYZNY6YYKcJB7rvjAi9qc/OT4Yf6bgFQwfCoTP6fPlhO6hucdY+K1mT879qZs9Zyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nnHcrR0cRQRLvA/zQj9mD+kGmZ+e7lXsO75E15nNuik=;
 b=ZMorefVVmLC/zbsLsU/stai1KmkrtOohnXHl7eop2McAEGZZgUgZJkE3bBnY00YrK9o8s0sleyV07b4fg9jZH3sMEbBlnMeU88E7dFlRw9y73gKk+NvrE4xtQYYDp6TJ9aatmtv+6or7x8AaKxQmDSBApGEO32fsEI5e5w5/Y6MVSMKF7t85FqkfkiBL3jnAa0wwFu8ctK6oo5nkXqEgUs/G/PS6HX+0yfCv0lD5y/PMYpLhd4L89LWRw9k71QgWVjlU7KRpmsR1hIc5dneJNRmqx2aHwlIzB7gvSn/ftjikvcrdFFuBaBJN8b4WFsIVlz6fCOlT6gW8h/eYieHbyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nnHcrR0cRQRLvA/zQj9mD+kGmZ+e7lXsO75E15nNuik=;
 b=cIsERvxDVneE9grBmmotiLoIlq+tlQl0JrdrNZDlhS7m7ox6khWkvfErr+zJllxrx4nJeda6W6Wp0/Qwc19AQuqQK0b5cCD8Wo9+BGsTAWfvwETS2/gtD3+btZBGYbP61myMAKOAQu1FYHOK76wkXD/OmsU4ebIgn/VLpsGvVqpRibM223dK8N0cYN6csssDYqWJX8mv5AwricyEKYH8bVijj3cFbXbNU4Dk3omJ39fZ3WtxzzuHf1lN7TJ3NBn3c77ybRgnxnk3dJweoU3G3gu2iOfzunYALE/EhWgEG+6sbHfjEKkbpFgcRojMmUVFcKEW3EZCcG7/wpwn4u15NQ==
Received: from DM6PR12MB4074.namprd12.prod.outlook.com (2603:10b6:5:218::11)
 by BN6PR12MB1842.namprd12.prod.outlook.com (2603:10b6:404:fb::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.12; Mon, 18 Jul
 2022 12:38:58 +0000
Received: from DM6PR12MB4074.namprd12.prod.outlook.com
 ([fe80::922:a4de:a886:d992]) by DM6PR12MB4074.namprd12.prod.outlook.com
 ([fe80::922:a4de:a886:d992%7]) with mapi id 15.20.5438.023; Mon, 18 Jul 2022
 12:38:58 +0000
From:   Michael Shych <michaelsh@nvidia.com>
To:     Rob Herring <robh@kernel.org>
CC:     "linux@roeck-us.net" <linux@roeck-us.net>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: RE: [PATCH hwmon-next v4 2/3] dt-bindings: hwmon: add Microchip
 EMC2305 fan controller.
Thread-Topic: [PATCH hwmon-next v4 2/3] dt-bindings: hwmon: add Microchip
 EMC2305 fan controller.
Thread-Index: AQHYhyGkg750di/Wu0mA/Z/XHoUc661ojo+AgBumSnA=
Date:   Mon, 18 Jul 2022 12:38:58 +0000
Message-ID: <DM6PR12MB40747C492C3197BDD64027FCD48C9@DM6PR12MB4074.namprd12.prod.outlook.com>
References: <20220623165217.59252-1-michaelsh@nvidia.com>
 <20220623165217.59252-3-michaelsh@nvidia.com>
 <20220630221157.GA3402568-robh@kernel.org>
In-Reply-To: <20220630221157.GA3402568-robh@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 75fa382c-ab6d-4357-0c77-08da68ba7c5c
x-ms-traffictypediagnostic: BN6PR12MB1842:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sa5pU4uzHQwluir8IiuiS1hz7Uxj2DB5IXKo7+AqnCcim3mMvKVdjG6Q+RNBGLMHK1RogsuU/OSMBi0HKv5Cfl8KmduuRjlRI7WtJjlVMgJHp3EMIq2R0U8OQPrGN3oxUDjzvQ6nndEZ1ahGOfNoXgWLjURd+HFTouwsqzZZp6EF6VQehSFjlRuA3v84ZHGQZQ4yXfOD6yif0QsnbZvyfIXMuRldSVFI76VjRU/rccBuyAQR1TI148vw8HkOmPRVpxLYvBytkOQ3xpVs7mQj2Rpk+za3S6MJ9EKMCnckDAONHNslB5TK8xOcpFAj+c7z4rtLCVNu4OPkH8Kfppd9QvVH5LpL6mwuZZ6EmrhaHKsGzxP0+ZJqKh1LL6iJdZv02MpXYCtKFaEuaFpK3Rucs50PWHmEw7YXbq/+6c+4JiTuE74dUfBfqa0kQ98VsZ0IsSsC4sU3AVT1e6Ko/HeqXD0nq/TCNUbR4vS6gAxyv09P5/Yq0CsKlIB/rjk1fkQTzR6g6ntQN9/WpBZg5QD3T/pIAooGvQLykZT0KD+UfkLN/rMmeFm2mvVFo9n9GoUNzAz7o7bcCQi9fMmjPuJbgt+GFZm83xj8WHXhJZfx8xksVA+AsBhXFQj66RLz1R+mAsSmmsjZcrarR3JoG94uvdo32zurx2n5ENb8n4t1M2fBqorzPS0vrMYm5MLYziY5pHQ/EE32mQNzvtflfdIyETbtlYDI2gtXGfmrl/+/3nWbFE7OcY5JnHqXgA5wZtJZWs4HBw/uBh/uBfWmOkU5z2OScwCD1JfPG7jopVnQshGeQQxqXH/Wy6Pyd7nrebMDSwRzLaeHxhGdEmH0yOSpKIqaUTIqVxyadRdeDV7LU9OktnpBipkSzTlIPhkr7F5UdrZqjwZP2DMBBANtdVtbfXZiLplIrJELFCJ0wgo+BP5fzlWgkoWKiyPd1VXYl+lY
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4074.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(366004)(136003)(376002)(396003)(39860400002)(83380400001)(71200400001)(478600001)(966005)(38070700005)(41300700001)(6916009)(9686003)(26005)(6506007)(7696005)(316002)(107886003)(186003)(53546011)(38100700002)(54906003)(55016003)(76116006)(8676002)(66476007)(66446008)(5660300002)(4326008)(66946007)(52536014)(66556008)(64756008)(8936002)(122000001)(33656002)(86362001)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?e6kq9zbtsHNzHK4fTktHm+TN8UuIWaAPpDsv3brgWKzGsOoOFHoYXybBuRWV?=
 =?us-ascii?Q?4vKVi1EMZ3arC11Hw0gqtawinpgk0I1WIWCsRtttyxMkTLPPdSLf3GPq+VNj?=
 =?us-ascii?Q?QHK97KtmFtvFWrNGuMqNs1DJYSnzhwMicK29XOjq03t0vOaN/pTIxXFWXgwz?=
 =?us-ascii?Q?AdDutUAixPVs8U97lTUl7/bC36SaSDGnfoK9RUlu1m6C2RIa9AtcTqnIgQcH?=
 =?us-ascii?Q?NQOMrbApKbH6gwZscwvphl01F9skG4nMkXBcMPsiO7OhVGrmQoRwe4Ojj2ry?=
 =?us-ascii?Q?igwZkfz1YNCC1roCVqPlBg/cTaEjSpi9UmUySs7GMYdgoO3TBQaGBv6W0j1l?=
 =?us-ascii?Q?7HZ2G0U0LbL9IRYbIx+LvUvI6llOu9x3K0x7wZ/HCTR2odWnz2doDcL58Msc?=
 =?us-ascii?Q?pa7HPNk3q7sOTw0LSFSH+tMTHRWsGL0VAK5+czrDu0WstQNsCzsorTp2Rmaz?=
 =?us-ascii?Q?Ce8kVToNrMZQXN0PURyg19K0WkXdCnMaK/bds9I3U/AJOL57H6my4NXpBurM?=
 =?us-ascii?Q?Qnw6hHVOK85el/fimhHla8AyBE+H67oRGkb0wpqFLCBDbw3ESpiSuPkiqenz?=
 =?us-ascii?Q?JG8ETqXbCXguKfOCaPAquC2E2Nqr/5bymk+4aW0+N1wAPXIocbtHO/3egBQL?=
 =?us-ascii?Q?aW+ntdkHC3ZeksRU4ipQRrj1MBIU8eoxptW4W5PshvwvjbULbZZt+0bYISV/?=
 =?us-ascii?Q?cgAhMb22af4ADvytjwVQMrr4yFBUPdXD9kyw+EOUJngl6/tFBxzHPn/Yjl2X?=
 =?us-ascii?Q?E6AMmyhCFS7tJep/IWe7QGVe4hEwcnHhY3Q9sa4/AWxQhz0FChMOj011PsX3?=
 =?us-ascii?Q?lq7Uwg5OEkZYHc5zwcCzyoSS3QqIKpxPdl1XLfVcPsm0ZYbuAuGofD0oTGN5?=
 =?us-ascii?Q?Iw5uPC9shq3YLr3UnbIoGHDgl1gI8eXblA5vk5O8opT+tLAlYESRlnPikmx9?=
 =?us-ascii?Q?PSM3zi/EpEMTRtW6+axOuAHBu8kYyF8nf+gjwLWR4zR4K+gYB4apOX7q6pRr?=
 =?us-ascii?Q?IOwvvDNIBJHbsZsPbtAgkDjZW1pRCHMW9zBDIEco4t7eA+d+0N1IZd3fLswd?=
 =?us-ascii?Q?JDybut3Jvg4lRekDJw+/TlCGPlIWI+AvioY0k6s2tBCF0moadILQnFw6q2fb?=
 =?us-ascii?Q?pOxH+QTotz85xdahT0w7UsEsQSCGylwBLKpJRT/9pdlGDbA0HL5Jv+19k0Vx?=
 =?us-ascii?Q?+m5sPkWsJJdg4o5M7i/fNDMMBWcBFwaDu4biwBgVB1huzBKAdvHUHudIm3Ua?=
 =?us-ascii?Q?KSZD877yvUxkp894r0IAnhVSCdtzzIIWzn11OxjZaiNG11HYVZBAFm0EFfGK?=
 =?us-ascii?Q?JC7eHYBB7+dYQHjavXNK/eiNDlpMDDQtBgC+kCdBZWrPJDksuYtzrIgAdqMt?=
 =?us-ascii?Q?6chGhVfWxILNpBgtPh2WeV0ZR8dmMbr//EoLURlaztRtBwVu6xmJXNUpW9oJ?=
 =?us-ascii?Q?/EveDjrz2rFkJa7SAU2GAhxtb809Yw+ABci+leo4hmF4aUCjCVQ0FhBFfh5l?=
 =?us-ascii?Q?995sTwFQCuQuZ08u0G8Z1m6NU1B0a51h/u5hfqxSoyWqdcKKCidub/fk1eaP?=
 =?us-ascii?Q?IjudNkjTRC0m4Uz/JDIcwZjZULF7bg1qW6xgty/g?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4074.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75fa382c-ab6d-4357-0c77-08da68ba7c5c
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2022 12:38:58.5647
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a7Lv/xsRw1ATsc49NGZyyYUFPmvZiakhkuHm23Jb7iyDqysP4cv3g5TXQ8K+4QqYfVv1TkN8iEQk3TBWv3qyoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1842
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi,

Sorry for long delay in getting back to you.
Please see below.

Thanks,
   Michael.

> -----Original Message-----
> From: Rob Herring <robh@kernel.org>
> Sent: Friday, July 1, 2022 1:12 AM
> To: Michael Shych <michaelsh@nvidia.com>
> Cc: linux@roeck-us.net; linux-hwmon@vger.kernel.org;
> devicetree@vger.kernel.org; Vadim Pasternak <vadimp@nvidia.com>
> Subject: Re: [PATCH hwmon-next v4 2/3] dt-bindings: hwmon: add Microchip
> EMC2305 fan controller.
>=20
> On Thu, Jun 23, 2022 at 07:52:16PM +0300, michaelsh@nvidia.com wrote:
> > From: Michael Shych <michaelsh@nvidia.com>
> >
> > Add basic description of emc2305 driver device tree binding.
> >
> > Signed-off-by: Michael Shych <michaelsh@nvidia.com>
> > Reviewed-by: Vadim Pasternak <vadimp@nvidia.com>
> > ---
> > v2->v3
> > Changes pointed out by Rob Herring and Guenter Roeck:
> > - Describe separate channels of fan-controller;
> > - Remove pwm_max property;
> > - Fix compatible property.
> > Changes added by Michael Shych:
> > - Fix dt binding check warnings.
> > v1->v2
> > - Fix dt binding check errors;
> > - Add descriptions;
> > - Add missing fields;
> > - Change the patch subject name;
> > - Separate pwm-min, pwm-max per PWM channel.
> > ---
> >  .../bindings/hwmon/microchip,emc2305.yaml          | 106
> +++++++++++++++++++++
> >  1 file changed, 106 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
> >
> > diff --git
> > a/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
> > b/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
> > new file mode 100644
> > index 000000000000..d054ba46ae23
> > --- /dev/null
> > +++
> b/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
> > @@ -0,0 +1,106 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause) %YAML 1.2
> > +---
> > +
> > +$id: http://devicetree.org/schemas/hwmon/microchip,emc2305.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Microchip EMC2305 RPM-based PWM Fan Speed Controller
>=20
> RPM-based? So there is a tach signal too? Don't those need the number of
> pulses per revolution that the fan provides.
>=20
It's not relevant. The driver implements Direct setting mode according=20
to the Datasheet: https://www.microchip.com/en-us/product/EMC2305
I can add this note to the documentation patch.

> To repeat what I say for every fan controller binding now, until there's =
a
> common binding to describe fan controllers, fans and their relationship t=
o
> each other, I'm not signing off on any fan binding doing its own thing.
>=20
I'm confused here as I thought that I already changed to common fan-control=
ler with advice of=20
Gunter in patch series V3.
Do you mean that we should use some common FAN/PWM/ TACHO etc. generic bind=
ing
mechanism that fits all drivers?
Could you advise if it's already existed and reference to example?
If it doesn't exist, it'll be too complicated to provide such a new generic=
 description within=20
the submission of a driver for EMC2305 device.
We can just completely remove OF interface and pass the necessary configura=
tion through
the platform data.

> Rob
