Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B14FC433F5
	for <linux-hwmon@archiver.kernel.org>; Sun, 15 May 2022 17:14:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237783AbiEOROz (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 15 May 2022 13:14:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237720AbiEOROy (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 15 May 2022 13:14:54 -0400
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2064.outbound.protection.outlook.com [40.107.93.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 346486176;
        Sun, 15 May 2022 10:14:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dXX3DXSMELr3E29MEBfJZymtR3hBCrii1J7dMKZjiCI1eQvSwV5vMsAdVYWjpHgx1UkzApTp1MTz/MyYBEfhlWmbHi7mFFnEEEFoeoZTWtqOKgAgInb/fCviXVur0pfqKoqB370bEdranoqPg7k+v9sysRqI/zE8eGHb73UIduJef71vcqmJvVBinG48clWClDw0F3rwmk9K9VrBP6Nbp3xIekKEbm/qV7umQhdK0JmAYXrvZJ1CnghZrYRCv2Nlq5PuIN/g4LRGNAd2109BLlqqDuGCGaBUjU4qQB9VcznyDhDY56aUwKaU0HemZi8853RPKn11IVMGCLYybJsWng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RtqgQM62/53+TvuAJW2X0kkUWsTWLSu4S5K/Xu8Ugv8=;
 b=Ez1qK9s+NrtFDe3Q2tgRfiyAWhcJK0LNTAPcdUfLB5p0nhdj1Rld4Nfx2KxNcbO1JAAHpFMOsNVdq+PiViY1W2t95zt93j4TP+YcZdbaW6rByLX73Bk70u6NNpsa75bO3cvRwnJNUBRD5pbXc5PtOCXaYVZHjUtet6rO9T5U5f35NleZBnnbUuLP3XfVnZLJetRVDxiHJfXSQxW/1TqoGQC/ZkdqnUTrt+s6i9CBaRBzJucbloPNSuEfoPxkA2oo3Pg1wOQJ6bvMNusZP1//Z8rVu/aDVDbFxpooxr10gnybpzN64xSDgOJMY0aHTZmpT9qpmieBO6DxGeAICEy2Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RtqgQM62/53+TvuAJW2X0kkUWsTWLSu4S5K/Xu8Ugv8=;
 b=i9AxAZYIFnYpwMnmNd4Df11xoWoJ3mh7JFOawRhRQUOcVIkHXjQS3+RuA8NdVL1bFwBlhtcT6LlUpZAjXqmqRC3TrIvtbs0Ue7lXJpuAPfBmuvOHfV+lmxfMwJcrmENliWT8UP6CSOUa+FCxiFcidZrC8SJKThsiVr+136C6ojaJK1MdRJ/EuMXaU5auxIBlaSofNUB2WFBSGVjgqR/5FxSgHxv2+7VCwvrstGNPx3rhz873HMWXrTRH+4EfbKB7vgII/JpKn2B3UmMhvMWoUo2i9rFIC/lB5Ux6UrtoPkpbY7s1hNSxnE1PMWKWTdqU93j9Shv0qSQlqKBdQfZcMw==
Received: from DM6PR12MB4074.namprd12.prod.outlook.com (2603:10b6:5:218::11)
 by BYAPR12MB3319.namprd12.prod.outlook.com (2603:10b6:a03:dc::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.18; Sun, 15 May
 2022 17:14:50 +0000
Received: from DM6PR12MB4074.namprd12.prod.outlook.com
 ([fe80::e1aa:8450:2ebf:a431]) by DM6PR12MB4074.namprd12.prod.outlook.com
 ([fe80::e1aa:8450:2ebf:a431%7]) with mapi id 15.20.5250.018; Sun, 15 May 2022
 17:14:50 +0000
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
Thread-Index: AQHYXIhSZcqaUVS1GEaoW1rc3c1WLq0L6JuAgBRXQUA=
Date:   Sun, 15 May 2022 17:14:50 +0000
Message-ID: <DM6PR12MB4074280B77E772A442B827FFD4CC9@DM6PR12MB4074.namprd12.prod.outlook.com>
References: <20220430114905.53448-1-michaelsh@nvidia.com>
 <20220430114905.53448-3-michaelsh@nvidia.com>
 <YnAgJVxh5fxijKQj@robh.at.kernel.org>
In-Reply-To: <YnAgJVxh5fxijKQj@robh.at.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c8805d7d-a6fb-4631-e9ee-08da36966b91
x-ms-traffictypediagnostic: BYAPR12MB3319:EE_
x-microsoft-antispam-prvs: <BYAPR12MB331984D1BB7D7F920B07C03AD4CC9@BYAPR12MB3319.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GyxP/awXuV4q9WDiXozdPEYcjCmIPF2rU/mEPoSo81EcZ36Lf0/3pyfVDhU6imXjL5ahODu+HhTMtaSQvKo0mfSrRMe5QvwjsldHmJg2o0OfZ9wVhWmhmAlcy60Bo4da4CL1K07vMTFuexWXHd2noaW2nCeIiFIl2QA4DfBlM4AHRGb4e4iVaB7DW0QmYAgkftuOpI0DLbr5aPRsIkLB/6xDNCXBwPGUS5iz/FAP4Q4oZRKzq/712+1uDPSXSlA+HfEtQXXIA/Gvz3VW4w1YA+aSuZA/AtRfsxJg9obwXJvsjvaWIFIwuTSeI4EZc9MvgS8niRzTfWV/xAIwCALYEhyyfNZw+0TE7Bo/5+P5ti4d22PQdpU5PKPBKKx6LaA+2t0wEWvqt82sLEBsJu1CPrrkfL/dgT4jOVe2vFz6u+rjvTiTPc/l+3ks4BUCIjNuexsrBqHdDXV012Ad0IuFuvLL5e+uuiKp65VJHBkwrM+1EAzzFfEqSzf1QLMPvS0D8PrZFlboLZ6tbkHYZLQsoAqnwLIfRNPR0UDtMkF6rNqSAPtDgMwGWoZDEA8B5FAaqYdG3Cszk1tyoDaMYFoTMXv6rgTBFY6X4hgyEpltYdwI0klgqD7upfrE6ujJrCdfk4zxxXRUL/eubs/CcoC4Vw83Wrb5LYEyhKBinqLO1fxMnHJqoTwuxUFPFTSIxioavjSVK9wPj2McP3kwXDfiGvhtWarE04whU/S4ugTTdY2Xl55yObA5IKQGD47pQA3NMgxq6pg4wXhRJr1/+uKD3/u8wX2HaUQG/b60kNKOdnwuGcqYgA/Bmqq/8jbjWK4XGwm1ZDxftH1qyNdlLEfE/Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4074.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38100700002)(38070700005)(122000001)(2906002)(9686003)(83380400001)(316002)(6916009)(7696005)(54906003)(66556008)(8676002)(64756008)(66476007)(71200400001)(966005)(186003)(4326008)(52536014)(66446008)(5660300002)(508600001)(66946007)(76116006)(8936002)(26005)(6506007)(53546011)(86362001)(55016003)(107886003)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?sSLRwZ9ht1GdMZmfUxUHBLd92pyOHBeA/RcK84q9S+5xO/4mh6Khtumbexxn?=
 =?us-ascii?Q?yJDcw7/sa+WjxLIRTMDR9Eydj59n8isZfUApnG22E4N7FSHCUBda/eMRZst7?=
 =?us-ascii?Q?eNQ2nho4m7t0vD9RcHFYHVs5ecxYFnQWBS/2f4r7tk6wfNe1q8gFnbZf3e8q?=
 =?us-ascii?Q?dCE+gb/WwJ6MnQxGpO0KjXUf+fgps/iibC+Q17qvOKnPlKKG90I00u+kVOot?=
 =?us-ascii?Q?d5YaM6Jp59YFXGOPLlY5SRzpbVgbHEbtVul/UEdFRGYtvEnqjaajb8V+MalF?=
 =?us-ascii?Q?Qbz32Q0T0/LDnKNXqigACoOADRLpcYD7W758a98Z84XLAL6WMTv3QiLie/en?=
 =?us-ascii?Q?tRyMQgHPVQ2wZI2l71Z7GbpKCOMDdj7q35xX9CEkD22+FgxoqDWl2G/Hee3s?=
 =?us-ascii?Q?SquazqB1w6EfDXUTuaxtJkOBg6u8an15/Uwo0LHAqZazBcjliZPgibpWtUzS?=
 =?us-ascii?Q?ElLN72FS3l2czZHaF6G5u4W+1nO2IFbq/KasqyAA9QzxoFDnkOAlx/yd6HYa?=
 =?us-ascii?Q?r0WIfKyCOf0UXTYgxPbFupAv53OjwqPAf4Dp9PmwZeWuA3JSP2oBx79cpHVf?=
 =?us-ascii?Q?+w9HYlzLOgNyiGq2CEone1T4svb8lZrZUDvwZTL7TTPqzQyDD/zms81rbN5O?=
 =?us-ascii?Q?II/vB1BpKXOE6h0kglPVadXZBgrL+mmnyPEnYdoKpuuEz9iixPzCyIpwQH1T?=
 =?us-ascii?Q?QqWSXqHYprcgScYhQDS6RsmXhw7QsOYpqwf/OYeq+ckErKBpWtezkBzpU+D4?=
 =?us-ascii?Q?ACADLwlX4N9wim69CjxbA7VnJe5Tf+kutmXdM8+/Gn+2w9YM8dft+oFem8Aq?=
 =?us-ascii?Q?uJhSje/YxowedTOy5zPi2+SrnM4tFWAaVf1d2zNC/ldA+4RDh7LlEa7JwBjB?=
 =?us-ascii?Q?Zu/TkofPcIjFfZ0qA/AoazRFZjX+AvU8NTcZsoy5PGknJ7U9iH0m/hpN1aGf?=
 =?us-ascii?Q?fOGCmXM2I4/h51Tl1Zb1Dr4tALoV4SNAOOCZOY+pM6m6ezMaFG+kDL0sPVZF?=
 =?us-ascii?Q?iSYd0Cl0AmcBQT2hN0a1wJHBBLp1oEsJZ0P1Kv7QW01+Fs2EtYrVn7hbFhm6?=
 =?us-ascii?Q?A7ykSjUhnNd0138tCHBtkEE3Y+luOQIDpVkLIVnn2tF7HJ6Cfrhm9GGd1K27?=
 =?us-ascii?Q?E/73x0YvnWL6G3biX5qGfVQyGrwXGpKGtWIU0Ck5RdPBugQfSW73kVCfQbva?=
 =?us-ascii?Q?zZL+YozKg+7CL0xoxPG+ksJkjtxHPoBMybWJdY+hPd+KDfELovsck6UaPVLg?=
 =?us-ascii?Q?KrqQchh45re1y1JgyhGzL455uz9wntBmpO4ArHrP+PtpQgUWhDcnlvMX2pLq?=
 =?us-ascii?Q?UcwFDvKpTbFAjCDU1K1ER6WtEaKWwJLEPSlhNkgFayi+6+o1sc5NCRom3f9S?=
 =?us-ascii?Q?AYiTTX2G9VnPPx021Dx6N+O8YVTaY3S1tcl3weIuZ8lf/PfGz9RNf6FOuq2L?=
 =?us-ascii?Q?i85tEKcZeu6BI58Z0A3/CJgPcij2ROsl2TVx6FTNNWlb5f2Hga7OxCfWUNnu?=
 =?us-ascii?Q?F1JtpGinhhvsu0lHLP7fVr3e+vCuGjlu2X594lBSfz0X2cPv3kL4tLrI5sIN?=
 =?us-ascii?Q?Qam5aceHRzZWLKAji7aG7sCXy26nZbeYfN7W0JVbxybQAUF/efcnkTblGlVk?=
 =?us-ascii?Q?Kiepo4UtBtllGBN6MY8UVREQMfy93wWBrdHrg+oTGMC/TdlKGniX9uCZM5lc?=
 =?us-ascii?Q?q45hDeyFUE3YZ9cp1UKPZWoctdzviD/lL9NdLFaD5M08BDaWbMewm5V2Rgdn?=
 =?us-ascii?Q?mj6u19Uk8A=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4074.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8805d7d-a6fb-4631-e9ee-08da36966b91
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2022 17:14:50.3596
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hcKwZgVb8rBNClUMmW3kviPG4pUVARR6jsBV3QSOmR+CO1vJdv68pKYF5uHtWPStYP6nTZSebD08W4XcBCFacw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3319
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Rob,

I fixed all dt binding check errors and changed the patch subject name
that you pointed out.
However, it's not clear completely your comment in this reply.
emc2305 device support 5 pwms.
The intention was to specify a simple configuration per pwm{n} - to allow s=
etting per pwm{n}=20
minimum and maximum duty cycle, cooling level stepping (10%, 5%, 1%).

Is there some way to provide such a configuration?
Do you think that the following example is OK?

fan {
    microchip,compatible =3D "microchip,emc2305";
    microchip,pwm-channel =3D <5>;
    microchip,cooling-levels =3D <10>;
	pwm1 {
		microchip,pwm-min =3D <0>;
		microchip,pwm-max =3D <255>;
	};
	pwm2 {
		microchip,pwm-min =3D <0>;
		microchip,pwm-max =3D <255>;
	};
	...
};

Regards,
    Michael.



> -----Original Message-----
> From: Rob Herring <robh@kernel.org>
> Sent: Monday, May 2, 2022 9:17 PM
> To: Michael Shych <michaelsh@nvidia.com>
> Cc: linux@roeck-us.net; linux-hwmon@vger.kernel.org;
> devicetree@vger.kernel.org; Vadim Pasternak <vadimp@nvidia.com>
> Subject: Re: [PATCH v1 2/3] dt-bindings: hwmon: add
> microchip,emc2306.yaml dt binding description.
>=20
> On Sat, Apr 30, 2022 at 02:49:04PM +0300, michaelsh@nvidia.com wrote:
> > From: Michael Shych <michaelsh@nvidia.com>
> >
> > Add basic description of emc2305 driver device tree binding.
> >
> > Signed-off-by: Michael Shych <michaelsh@nvidia.com>
> > Reviewed-by: Vadim Pasternak <vadimp@nvidia.com>
> > ---
> >  .../bindings/hwmon/microchip,emc2305.yaml          | 55
> ++++++++++++++++++++++
> >  1 file changed, 55 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
> >
> > diff --git
> > a/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
> > b/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
> > new file mode 100644
> > index 000000000000..c873172b7268
> > --- /dev/null
> > +++
> b/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
> > @@ -0,0 +1,55 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause) %YAML 1.2
> > +---
> > +
> > +$id: http://devicetree.org/schemas/hwmon/emc2305.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Microchip EMC2305 RPM-based PWM Fan Speed Controller
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - microcip,emc2305
> > +
> > +  emc2305,pwm-min:
> > +    description:
> > +      Min pwm of emc2305
> > +    maxItems: 1
> > +  emc2305,pwm-max:
> > +    description:
> > +      Max pwm of emc2305
> > +    maxItems: 1
> > +  emc2305,pwm-channel:
> > +    description:
> > +      Max number of pwm channels
> > +    maxItems: 1
> > +  emcs205,max-state:
> > +    description:
> > +    maxItems: 1
> > +  emc2305,cooling-levels:
> > +    description:
> > +      Quantity of cooling level state.
> > +    maxItems: 1
> > +
> > +required:
> > +  - compatible
> > +
> > +optional:
> > +  - emc2305,min-pwm
> > +  - emc2305,max-pwm
> > +  - emc2305,pwm-channels
> > +  - emc2305,cooling-levels
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    fan {
> > +        emc2305,compatible =3D "microchip,emc2305";
>=20
> Err, what?
>=20
> > +        emc2305,pwm-min =3D <0>;
> > +        emc2305,pwm-max =3D <255>;
> > +        emc2305,pwm-channel =3D <5>
> > +        emc2305,cooling-levels =3D <10>;
>=20
> All possible fans attached to this controller are the same and don't have
> anything that needs to be described? Based on other fan controllers, I do=
n't
> think so. As I've said multiple times, there's a need for a common fan an=
d
> fan-controller binding. Until that happens, I'm not inclined to accept fa=
n
> controller bindings with custom properties.
>=20
> Rob
