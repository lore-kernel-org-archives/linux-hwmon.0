Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D888C43217
	for <linux-hwmon@archiver.kernel.org>; Tue, 24 May 2022 16:17:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238766AbiEXQRJ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 24 May 2022 12:17:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234263AbiEXQRJ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 24 May 2022 12:17:09 -0400
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam07on20610.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eb2::610])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDE433F329;
        Tue, 24 May 2022 09:17:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dgM7ILiH/qp3GUK24FcJ8IuiW1A/G/XVnWPTX1Nxwyt94R1Far7yfZid2ST6F9isNrHlzzkst5NnS7TX+fMH2Ht6yodzG2wBC4n8g4WtPzSVfJ9xrAqxj5iOKYpmPXJRTlkXJ0a5SPK5oO4aVESVnNRHdPuyt9HwuqId/g7StTX7YtD3ykAvMDNAgsphIpVRFW5tszCgw692koQRxv81DuX22WhF+7LowgglcPYNnfefmzqZJBvGhbufpZKYNY1wfgBo1b7ZfxYvLb5Xs7LLKH8OrXSmR5U/Mktn8juYxipJ0bKnTpjgsebUBr/O/WIzKWIcy7mTrew8Z7VZqu2n4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vTVLKnuGPyBn6N+QVzm+kPdbBkWP+pqJmEmsCTzXc88=;
 b=KA3Rfh9poT7rphM8IQMbJyFq85HE2ZCuVG+c8IMj9AVdJJkKVAlP4N2M0cuMja4DZ6Sz0te52aiUsT86aCDnYFzJYt+gszxzFaDJq0lxhixV6YgfiXH/nAcMOcCCeXTmkBeWyiHFLSTWUSjxRlHtabmo03R2RSSkHkyY4clOKKqlPD6o5/I5bApi68jX9/hX/60w9Y1LdIC3RR86qo96g6o9elwcXEXQyNP/VyEkPZ6oAKXQ6X+AAdEFWCLJ6SLEZpbwQPE/cpsAalp/YyFCUQ93vF1MQYY94clL5Ugrq42NkqE/hvg5rQHd2YBCfhcInd15CLDthEGITmkDGbbvPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vTVLKnuGPyBn6N+QVzm+kPdbBkWP+pqJmEmsCTzXc88=;
 b=fCz0ASgWh4oNXupcTK5G0Ypa6dIeUJ+S41BRlNraf1Wryw9YEyvr+g9F/e543w42LL0voQqSMKYoiPjH6krsRhfS4bnHvVCWmNSjQLWdg9VuItb4T9n3yD2PzURiTmP9P0d7Ei1x3mjpOB6LCtN7TjLRUbA+10tV7W4ti0ZI0FzodVEKAIFKcZ4n4182aoR3Eq9FQ1VrkdpcmlG/8mPnP+wgNO/izLsPd9bO3PKwCo8XWp53U4S2BiWEfCwWJ+e8WdSkktuGi58QPfpYcWllsOxix2NfoVDIT/s8wgqurj6+J67GFCyFcTyG906gvPXsjvasVYm1eoV/9X15KmZmwQ==
Received: from DM6PR12MB4074.namprd12.prod.outlook.com (2603:10b6:5:218::11)
 by MN2PR12MB3696.namprd12.prod.outlook.com (2603:10b6:208:169::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.17; Tue, 24 May
 2022 16:17:04 +0000
Received: from DM6PR12MB4074.namprd12.prod.outlook.com
 ([fe80::511d:9ad5:184d:31]) by DM6PR12MB4074.namprd12.prod.outlook.com
 ([fe80::511d:9ad5:184d:31%7]) with mapi id 15.20.5273.023; Tue, 24 May 2022
 16:17:04 +0000
From:   Michael Shych <michaelsh@nvidia.com>
To:     Rob Herring <robh@kernel.org>
CC:     "linux@roeck-us.net" <linux@roeck-us.net>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: RE: [PATCH v1 2/3] dt-bindings: hwmon: add microchip,emc2306.yaml dt
 binding description.
Thread-Topic: [PATCH v1 2/3] dt-bindings: hwmon: add microchip,emc2306.yaml dt
 binding description.
Thread-Index: AQHYXIhSZcqaUVS1GEaoW1rc3c1WLq0L6JuAgBRXQUCADhnfQA==
Date:   Tue, 24 May 2022 16:17:04 +0000
Message-ID: <DM6PR12MB407423D34A272AF4983B5E33D4D79@DM6PR12MB4074.namprd12.prod.outlook.com>
References: <20220430114905.53448-1-michaelsh@nvidia.com>
 <20220430114905.53448-3-michaelsh@nvidia.com>
 <YnAgJVxh5fxijKQj@robh.at.kernel.org>
 <DM6PR12MB4074280B77E772A442B827FFD4CC9@DM6PR12MB4074.namprd12.prod.outlook.com>
In-Reply-To: <DM6PR12MB4074280B77E772A442B827FFD4CC9@DM6PR12MB4074.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8bb944d0-0e37-49d0-0329-08da3da0d782
x-ms-traffictypediagnostic: MN2PR12MB3696:EE_
x-microsoft-antispam-prvs: <MN2PR12MB3696BAE112D297D3C01AEA84D4D79@MN2PR12MB3696.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: haVS9/TfD3SfiUBcUCJQt9zcT4IuN7wgBNV2izoKJX2N38Llsr0+Ia9LkGKSZ+Lpc7WzyCPCW5BwWA7HZk2SRS8q4r6nqqwInTDn34WGho5AjpCTxe9MfiklWA6aBrquzS34Dqc2rCUOPQB1+Tu/D2FYHJkoW8qmW0UJF0M2fPyqKVn6/Bm4ly/uogPz4HDAi+CCwl0Xzdkr9dpHE1JsTTW9g4XP2LqOBoUqiiVmF8zEqbQYmOA9qnQCOSM4wCJ6n//aT74W9iDq6Ki0lSlV3iKlWyuKepoTG7ctGHGgzKDXrG0w4awM03fDqzt3OvHouLcNJFXKRh+ktcolKlFuRDp8Me6YRVNzHyyG+j750+kXUepvsApSyHjRVir7D8Ln0CBcPmyuGj3VOdciOmez83nrF2gCSDqxWXJJLxx7HTw3kf4zOpRDuHyends9/SbFqqv2LY/Enxw54hHCp6O1Ln1NQs6/IO9xhRmZr7n3o4O+e2NFK51zyWUNozaGykfgQSc69BBScbDG9ufU7pM3I2SQmxksmm15saBDvvyhxr0MlqY2zpYtejYM2g2tlF3pUa911VJvfcd4x8baRSCkTRGgXCSBXI/qPzRFykoomXlTOgaxsj3yO/Y+3wizLuk6ayhzONEI2fE75nXYZTeSzIqqSwRh4K+RvXGQHjo87Dopya/sb85F9qTEzXCC/v3DBLN8/6+3CZQbqNK3jJSMcmkCbpG4uPfDXzLu7oMdjNUI1aKpQnSHe3uU7r2O6pEdwYdViRNT+nWP7UetjRZuDIfzAkyoOve5bNBgNXDTTrhxyQKVK1OiZ1YrcrEy8BQdD5yMe986vIiaG7S9ErHZsA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4074.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6916009)(6506007)(9686003)(54906003)(33656002)(83380400001)(26005)(7696005)(5660300002)(8936002)(508600001)(186003)(316002)(107886003)(55016003)(966005)(71200400001)(2906002)(4326008)(76116006)(66946007)(64756008)(66446008)(8676002)(38100700002)(66476007)(66556008)(53546011)(38070700005)(122000001)(52536014)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?yCehtsEI0xwwbXAU+5c5BHZSz7vEikQL2bsZNH89hcpgql2kAwnxjt2hs2IL?=
 =?us-ascii?Q?bJnvS8I/YxtlzBeaXgyH4GgOkJbraoyhwzTM73o9w8cneNzE1isg6rbPCa/d?=
 =?us-ascii?Q?d7IjcH77UaWqscrutOCZX2erzwPES3+4iwXa89im03wtM9Md93BjUN4Lq/hz?=
 =?us-ascii?Q?/TNU4lEuiIzq5Q+Drnv89ozaFkTCIoDHGSZcPOoQ7sFvmhM8mkIVY35+jIlr?=
 =?us-ascii?Q?WFd/0UG3gU/oU9gBMIJWqHC1N/yy6DoIy0tJ/WciRGu1KjYjy5ZMyicocYNe?=
 =?us-ascii?Q?QTB8RXYEkgI10nFefA+LPxAgjyIzS4VAam/M0gxLmX7kMjRLcX0uAucIoCe4?=
 =?us-ascii?Q?+Jn1AgT5o8XpZkflXnp+jvDjCpASJ+IotQYdh+aaDsBt5IS7G4XUGEl5uueM?=
 =?us-ascii?Q?FIt1mJhAVhTz9hNo+SbBoLuh24nIjrf7tRlSmG7mAi8FRoVKVXRNMd+Rn1Tu?=
 =?us-ascii?Q?T97SKstylFamU5A2NMLFZJ/DIwUHuMykwyYgGQSCyOgFAFztarjXNhceycgC?=
 =?us-ascii?Q?CMlKFUTm5WQLAZ5sGKi1WQrllntJUtVpx8ED6OgsqgODTqPvBU6jrOlNLUzk?=
 =?us-ascii?Q?ou6VKTSsi2R7KHfe8BtPSfknIfxfvxnXKqh832lIUfkht+J/+8HBTT4THTlD?=
 =?us-ascii?Q?bInXtSLvy8ogV2UECKVJNordWSaHlWpmnoV5h16B84tnHXNLJtsAvJZU5rKn?=
 =?us-ascii?Q?LgGhL1jC7XlOVawWeQpg7Ut/SIqKhyGi0qQiX+v9LOrPIkawE0UrSuQRMnca?=
 =?us-ascii?Q?WiWsg+xl1LU0OjfSNPcK+SrLxeX68BQ1Uuz+9tyhWFMOO6A0C+OeBgJCCz56?=
 =?us-ascii?Q?/KJy0P8WftoDuIYCIKezk7pDK+9fuDdM4eL0qMuGFJF94Pl0IS0ozlKCyUVU?=
 =?us-ascii?Q?RuqKDadrz+oqz1d6aN24yAtJ1kJAiTwF0wUSV/9fk6585M6fkqSrp3c5om/d?=
 =?us-ascii?Q?aaYc7J3DRRep1nOTE8AjhhcU2iaxM7IiKBc6Zq7qS15QLZNSSo2dYBORK1/c?=
 =?us-ascii?Q?BttOIxQw9fIu83+2+Y3sZuRhhN4XYl543YPwMQkMBLuHEmMjKn0oJsH40GDH?=
 =?us-ascii?Q?WtBGA9bbPP56rbS6kBhLLPP8SUlbvAyzrmTA3zne3fVDhHrMgG5VqN3Fwwnf?=
 =?us-ascii?Q?9pqtzeMkCyBTtI8B2sUFp8FtNwUbPsA1gxUqtN6ughfq1YW20jNCqxl9+pN3?=
 =?us-ascii?Q?2mFs7IVY0++/5bbl/MU8XYKKUUNfdjFVj0tLY50EIKNoxCfr7Ej1Em2dh79Q?=
 =?us-ascii?Q?9ecrWe9qW14NVqPG6ZSfcsSrLr6E7SybaytkuMxrtWVDgPpt+oIa9CRIZGqo?=
 =?us-ascii?Q?0RsHotPTbRzfIZfu6xQ4Psc7wPyNCjg4ZHLriV/kag6pytpU4HfhAOOd7fUi?=
 =?us-ascii?Q?Fw+lDK0uY25K7y3YJ5rKROByQ2qnkDFtiBvGI/hcofkeklRQAhOl2pC94NFA?=
 =?us-ascii?Q?6pWaMvHBJzbniQQ/0WeSst6+nEJ8xTctEP+A8aP9v3OiVyirdzwl/PhBc7xe?=
 =?us-ascii?Q?6tOTDKI0aQDhxvqv9xnSiEbmGcSYmV41wHaYSon+CS1B9+D8TcYkJiiiglJ9?=
 =?us-ascii?Q?1KyWTjYrywpOeysqj/0lCLhB+RkXCczInRIIDS4tlvjR9091dwn6CjONA59n?=
 =?us-ascii?Q?toZyr9DZ0G3JTXnuHckdMkb+isF/qtSmeyPn5BYDnIt1O6QreTKue3o0E4xV?=
 =?us-ascii?Q?LW1KEKIvlE1XL1dPOfGVtG7r7kGxEGsKK11gHafJJuFtIiavFutuCkmwQoE5?=
 =?us-ascii?Q?V8LF+PmUhQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4074.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bb944d0-0e37-49d0-0329-08da3da0d782
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 May 2022 16:17:04.5405
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9mJ8Y9vWlMsIDTac97wVaLTpx85P7cdyZQ97qqZmkxUscSjxIaTFFN4dTAzEbzIx/vtkXHNwjAO0W6wzYyONCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3696
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Rob,

I'm resending v2 patch set with mentioned below changes.

Thank you,
    Michael.


> -----Original Message-----
> From: Michael Shych
> Sent: Sunday, May 15, 2022 8:15 PM
> To: Rob Herring <robh@kernel.org>
> Cc: linux@roeck-us.net; linux-hwmon@vger.kernel.org;
> devicetree@vger.kernel.org; Vadim Pasternak <vadimp@nvidia.com>
> Subject: RE: [PATCH v1 2/3] dt-bindings: hwmon: add
> microchip,emc2306.yaml dt binding description.
>=20
> Hi Rob,
>=20
> I fixed all dt binding check errors and changed the patch subject name th=
at
> you pointed out.
> However, it's not clear completely your comment in this reply.
> emc2305 device support 5 pwms.
> The intention was to specify a simple configuration per pwm{n} - to allow
> setting per pwm{n} minimum and maximum duty cycle, cooling level stepping
> (10%, 5%, 1%).
>=20
> Is there some way to provide such a configuration?
> Do you think that the following example is OK?
>=20
> fan {
>     microchip,compatible =3D "microchip,emc2305";
>     microchip,pwm-channel =3D <5>;
>     microchip,cooling-levels =3D <10>;
> 	pwm1 {
> 		microchip,pwm-min =3D <0>;
> 		microchip,pwm-max =3D <255>;
> 	};
> 	pwm2 {
> 		microchip,pwm-min =3D <0>;
> 		microchip,pwm-max =3D <255>;
> 	};
> 	...
> };
>=20
> Regards,
>     Michael.
>=20
>=20
>=20
> > -----Original Message-----
> > From: Rob Herring <robh@kernel.org>
> > Sent: Monday, May 2, 2022 9:17 PM
> > To: Michael Shych <michaelsh@nvidia.com>
> > Cc: linux@roeck-us.net; linux-hwmon@vger.kernel.org;
> > devicetree@vger.kernel.org; Vadim Pasternak <vadimp@nvidia.com>
> > Subject: Re: [PATCH v1 2/3] dt-bindings: hwmon: add
> > microchip,emc2306.yaml dt binding description.
> >
> > On Sat, Apr 30, 2022 at 02:49:04PM +0300, michaelsh@nvidia.com wrote:
> > > From: Michael Shych <michaelsh@nvidia.com>
> > >
> > > Add basic description of emc2305 driver device tree binding.
> > >
> > > Signed-off-by: Michael Shych <michaelsh@nvidia.com>
> > > Reviewed-by: Vadim Pasternak <vadimp@nvidia.com>
> > > ---
> > >  .../bindings/hwmon/microchip,emc2305.yaml          | 55
> > ++++++++++++++++++++++
> > >  1 file changed, 55 insertions(+)
> > >  create mode 100644
> > > Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
> > >
> > > diff --git
> > > a/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
> > > b/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
> > > new file mode 100644
> > > index 000000000000..c873172b7268
> > > --- /dev/null
> > > +++
> > b/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
> > > @@ -0,0 +1,55 @@
> > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause) %YAML 1.2
> > > +---
> > > +
> > > +$id: http://devicetree.org/schemas/hwmon/emc2305.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Microchip EMC2305 RPM-based PWM Fan Speed Controller
> > > +
> > > +properties:
> > > +  compatible:
> > > +    enum:
> > > +      - microcip,emc2305
> > > +
> > > +  emc2305,pwm-min:
> > > +    description:
> > > +      Min pwm of emc2305
> > > +    maxItems: 1
> > > +  emc2305,pwm-max:
> > > +    description:
> > > +      Max pwm of emc2305
> > > +    maxItems: 1
> > > +  emc2305,pwm-channel:
> > > +    description:
> > > +      Max number of pwm channels
> > > +    maxItems: 1
> > > +  emcs205,max-state:
> > > +    description:
> > > +    maxItems: 1
> > > +  emc2305,cooling-levels:
> > > +    description:
> > > +      Quantity of cooling level state.
> > > +    maxItems: 1
> > > +
> > > +required:
> > > +  - compatible
> > > +
> > > +optional:
> > > +  - emc2305,min-pwm
> > > +  - emc2305,max-pwm
> > > +  - emc2305,pwm-channels
> > > +  - emc2305,cooling-levels
> > > +
> > > +additionalProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    fan {
> > > +        emc2305,compatible =3D "microchip,emc2305";
> >
> > Err, what?
> >
> > > +        emc2305,pwm-min =3D <0>;
> > > +        emc2305,pwm-max =3D <255>;
> > > +        emc2305,pwm-channel =3D <5>
> > > +        emc2305,cooling-levels =3D <10>;
> >
> > All possible fans attached to this controller are the same and don't
> > have anything that needs to be described? Based on other fan
> > controllers, I don't think so. As I've said multiple times, there's a
> > need for a common fan and fan-controller binding. Until that happens,
> > I'm not inclined to accept fan controller bindings with custom properti=
es.
> >
> > Rob
