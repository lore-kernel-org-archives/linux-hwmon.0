Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2123.outbound.protection.partner.outlook.cn [139.219.146.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F13A938D415;
	Tue,  1 Sep 2026 01:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.123
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788226809; cv=fail; b=AtyCe0e9diUo4R7YXQr/di33shTgAUoDf1aPLSZrIRkm3EgoNJr3mlRy1SJXD+wx13BWAZxVGqnDhACqzvtpVdmsyrR1lC25Ljq9dE5Y9AQCgHH7z1vpEdAXz/8JXFzISCSKtaZGry3uZZ1A/17YbpRTo1EvBu+p/ip6GxPOZqM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788226809; c=relaxed/simple;
	bh=h+XjJ905WMBUjqRl+v6TdAmsDcMPu80TlHLgt0FaKcA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=k4B0FrPYs0M6Oo+OpXjkgO2W7RCir9zMwQkXlHRDD9TrXNLgasbdBiY9JVv45YeHvmT/aFrXDNFrkTRJzSAMSjRcsB8b7WkHGS+l0Ug/BQsDECHRck5zb00NrAu4QUjrAQFxDSTlJ3x7sKafF39SuTbPLowZLfQ0RY+Oie2sEfQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XC4VuBVGemf9Bt0zOrd/LQh/uBBR7iSBCfxX1k55ASeEVm6AalQWLDDTv4LuQXHLWud6o3w50nff/+tAXeAPmZ6Nq1boUzhkSzN+idEZoOlCz2H28XV2DPgRi5cRRuDEsAK8lLdpLPVEHsBBZYa/4NT8hMfJWlhjNlFkPDZDQi1sEnxPqdhekYyOchiS79rxNSLjEyhjWTDhodMyrvY6TT8IMXTpRYdGm/Mul9sCBwU9FCjwSc07HDCDQB4roV5AruxtoDT+Or3Qk8sxK0imbHMLMFRfQhvSKjPrbMkEE7PiDGQvWZKinjfwHKH2ezqsqYt/cZAONwmjU5C8wSj7KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u81phPugYgBZZiK1OTKXbAX+K9ZVtk/izIY5170VMPA=;
 b=KGI4tM6zKla96w+nGSzn0pvUOSmuhHFZRTNQL60maFueSQLtligpsnppgEIJA/X6M1WLXgByW7aLh47MGxhG41Kj08EemGxKXElK45Ew/n3Y/riElYFoAIhyqejCPpVUHPqcfk0GIEmmK80G1Zv0A9S8LV5u6w/0LcVRbjBIpyod19/EvmHanjYC2eAM2zv+s+nZ0FNpKJTX9nthTHGv9IRSoDqEoddjOCaVZryt3BxyMRLaKIvZz+xwdQrPod4gifY3wFC5rp4gFaN+fCD7UxHgC6Qpr+EZJPe4gDjdgfZ6VRnujjJ2mScckMF9+nQYBhLhB5A9dgFEaM9kBwPfuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1137.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:13::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Tue, 1 Sep
 2026 01:24:40 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0315.011; Tue, 1 Sep 2026 01:24:39 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Conor Dooley <conor@kernel.org>
CC: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH v4 1/2] dt-bindings: hwmon: Add starfive,jhb100-fan-tach
Thread-Topic: [PATCH v4 1/2] dt-bindings: hwmon: Add starfive,jhb100-fan-tach
Thread-Index: AQHdOB2pWGWmLpoNUE2Go4xzfaaD97a4XHIAgACUoYA=
Date: Tue, 1 Sep 2026 01:24:39 +0000
Message-ID:
 <ZQ4PR01MB12023835F6083F45484E1ED3F2A82@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20260830011941.40199-1-changhuang.liang@starfivetech.com>
 <20260830011941.40199-2-changhuang.liang@starfivetech.com>
 <20260831-dominion-data-c8b6f691dd5b@spud>
In-Reply-To: <20260831-dominion-data-c8b6f691dd5b@spud>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1137:EE_
x-ms-office365-filtering-correlation-id: 7c5f382d-1888-4a39-d0be-08df07c7cb1f
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|38070700021|10067099003|4143699003|56012099006|22082099003|18002099003|3023799007;
x-microsoft-antispam-message-info:
 19GapsRZS1+PeD0RaWb6hGzeyq7/dLiD0Kxarhidc9jt83fZgEa4Pq3+r0mFjPjfWCuuhQld6ySh1+wwfTS9GD77RJXJXc+pdSe+NFAqD14+WD5ea+eLiMp903efQzHe9U7YQyUCCwje8Utpw5Tu/b26zwhtSa/2XV9C8rQ7fPAhjojS/DAGGQr1hZkqBUvyL8j67y6jGN1EtlAkqA3XfwN0O9xDTvETaQft9/0L8pG7rmch+Iya1m3asvjzLmhnMZr8/wRA5bovnHyjgCSFccS6G88Gthlbq7rxzksCQkv81gRNNnRyEYA4+8c4lIm2lCguwcTwfj+nnOWP9yvf1SIW8iti7eUL97lgY9bBIVkxOZijmGtjP3Yv/bywrh7Wx6zFWqVdCenXEHg32HOuZzvKrNFkXdcP9o+uog2c/skXTGKNQzkR2P1cmLbeKnkoRiHpO2ScNOCld2jijfycuWYN3Q7Tcgp5PeMCQ9X/CrYTPY50ZnQGZxoHuLdSf4uCHtFheHEeWA1tUOI8X9X5G3QwnwdBSLnG+SixNbo2jovbZeX4gMYvejm7RCCnSRN6
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(38070700021)(10067099003)(4143699003)(56012099006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?7VnDxJ33CfLm1YJQa+ryskBx/pQqqyUDXXEbK7+GqVmPKGAvQ1R6EJNnM6A/?=
 =?us-ascii?Q?OFAccCINNJ4YtAOjLIOTMYAA5KUaMjakv1y8blyBNzOoAgBpZZhv0Z7eUByF?=
 =?us-ascii?Q?TsTynWtbK9DRHq3+p8c3VVDn2XcB+2XQcWSA8XZDM6rJhU24kguQAmUmBBu8?=
 =?us-ascii?Q?4tDq4S5gJivBRpZ6Ds4gtxoaUT0sscBxbmhrQA664voVxjwaSpTDDbiMXBmc?=
 =?us-ascii?Q?cvroCsXIwJk5HjvDimSVRbyoY6xjzSBxp5GBEJCm9JM86gtEfP+j8JrjDEjH?=
 =?us-ascii?Q?BroveTDULX9i61RSgkX30ixGI8jqvj53ZesHPFnxFv0+et1mulByrL6j5dl6?=
 =?us-ascii?Q?tkJ+3m6Xqb09qVxkl0c7VGqVKQQuRMqLcbDB7q6979p49xA/9gVAJpHvw4RH?=
 =?us-ascii?Q?rE9J7NpSURbOfB/hXrF2jgDmi8CeSQ/6vMsB9P/iAgdOCdIqH4gHZ/uHKLZ6?=
 =?us-ascii?Q?j7KtAoiSOV9xopKBkOoLT98NFFvyw76Tohi9+TdViNtoO70tkD6LPMP4Vhwl?=
 =?us-ascii?Q?VXzSj630168ZME3NOpU+uSdLDf1m8Vr1CgilDq3ctlIfbfIHtoi5ZST5vSX1?=
 =?us-ascii?Q?4yJ80K8sojWS7nHE1EE3W75+X6RAtOi+JJcu+wYIk/zJdSwYEKoveeHwUkTG?=
 =?us-ascii?Q?z7g7aD1OzYOH2CUb2iTTp6D/fBcn+YozDmCNFpbys1FgN57sstEJ+c6ZbPQN?=
 =?us-ascii?Q?yplV4O7qkd1G8AhHiGDljHkkjWZiO88uMrQA6WWuDfAGCf0VYWJ8/kGgVHWJ?=
 =?us-ascii?Q?shBbmrCnB50/1m9MdNKlbFbHRfe58lzZlqaMuQYMpgsoeXihvf+PE61UEdOZ?=
 =?us-ascii?Q?BIU8c8mp8aCJbjNJTjpZuklix3dV7eINLRzFMlQe+9nsg8rXeGE4u7KE4/E6?=
 =?us-ascii?Q?3zYvElNLmAT2GOYBGt2vES3i6FRQawXwem/ms6znqvbCsLxH2Z/OB0SlTzje?=
 =?us-ascii?Q?3b+b6F/CliZZEKTNjZA5l5KxsebOwF3CHNVlvaFPC/RuSOlBXJR7A32+DeXd?=
 =?us-ascii?Q?tKmDtMtojxmdZE7uaQ+cLg3BLRY5Edt4TQQxifns6D/Oqu4upIq6CH6hSnPa?=
 =?us-ascii?Q?lxPCEgXScXFpDecyOcwonIFlBbuFYjZ2lUbwgvBZ5G8rCAe4QXRQm2JVOrQw?=
 =?us-ascii?Q?UAfb6Yvmj0Q9vjPrHc8nXPbQvd51yMksztiNn7rLjQe7Zgps9e1DJ4awt0CI?=
 =?us-ascii?Q?duIGGbJwym0gLWtQQ5l2H2ErrIa5kf0OxpEBPhnWRPnRdbfKrxbi35Dlz9bh?=
 =?us-ascii?Q?xbGkzpAQltF/zMohHOv8ZEQqg5hQI81V4ZacjtDokoCWDtfvcjEJzVglSSxw?=
 =?us-ascii?Q?AcqqrU2AtXKb7j1EWX8e+9bPCgRZ5AdcIWgE1vba+miXYT/6znvXOTl2O48b?=
 =?us-ascii?Q?VPcpTcxjlqTo4ahKQMlN8NULd3VJ/X4ricKxlJ7y5KxE/aQCOZ1vx/+YX5j7?=
 =?us-ascii?Q?/QSXCvYsa9vMPDzptz4b1uXS/cTAzZI+3YtcPuXvxj+iTRjHvfp+KCE95HTy?=
 =?us-ascii?Q?DReEaTdO25C6FDmc3CgS6qZN5Y0/mR2hkILsbV5W4alnQ2XG0wLDOvFPahFJ?=
 =?us-ascii?Q?SP3SyiPraCcwLwyvxlnN++vbwqATyui6YLWN7Tr0fbItzfxM4+fexZyB4Zze?=
 =?us-ascii?Q?TFrVTMkw3TMGrP8qqqoW6L8aiywMtfnEGf4GJ21LPzF0c79JnHp2ScFLvw4e?=
 =?us-ascii?Q?Yp8a7FZpTOKTAuSAMTjgIkszoFE663B6732ag0tMAQGDaFrouqK9qA4DZO2a?=
 =?us-ascii?Q?D4Z8NwQ8J86JXA17D56Rus1mYlT2RX8=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c5f382d-1888-4a39-d0be-08df07c7cb1f
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2026 01:24:39.7604
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Gx+WIxpjRqV2PdFvmiD4aOD1aU9ZPuELJsSVY4OZ26RPCy4BupT82ZvpfeT/Eb1avX7dxULdGsGE852i1QXWu21orAXT17iEfhcIrLwU35c54rSPCdUPp9yttbQy+ZKv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1137

Hi, Conor

Thanks for the review.

> On Sat, Aug 29, 2026 at 06:19:40PM -0700, Changhuang Liang wrote:
> > Add compatible "starfive,jhb100-fan-tach" for StarFive JHB100 Fan-Tach
> > controller.
> >
> > Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> > ---
> >  .../hwmon/starfive,jhb100-fan-tach.yaml       | 93
> +++++++++++++++++++
> >  1 file changed, 93 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/hwmon/starfive,jhb100-fan-tach.yaml
> >
> > diff --git
> >
> a/Documentation/devicetree/bindings/hwmon/starfive,jhb100-fan-tach.yam
> > l
> >
> b/Documentation/devicetree/bindings/hwmon/starfive,jhb100-fan-tach.yam
> > l
> > new file mode 100644
> > index 000000000000..1dcd4932768f
> > --- /dev/null
> > +++
> b/Documentation/devicetree/bindings/hwmon/starfive,jhb100-fan-tach
> > +++ .yaml
> > @@ -0,0 +1,93 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause %YAML 1.2
> > +---
> > +$id:
> > +http://devicetree.org/schemas/hwmon/starfive,jhb100-fan-tach.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: StarFive JHB100 Fan-Tach controller
> > +
> > +maintainers:
> > +  - Changhuang Liang <changhuang.liang@starfivetech.com>
> > +
> > +description:
> > +  The StarFive Fan-Tach controller can support up to 16 fan tach input=
.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - starfive,jhb100-fan-tach
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +  resets:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  "#address-cells":
> > +    const: 1
> > +
> > +  "#size-cells":
> > +    const: 0
> > +
> > +patternProperties:
> > +  "^fan@[0-9a-f]+$":
> > +    $ref: fan-common.yaml#
> > +    unevaluatedProperties: false
> > +
> > +    properties:
> > +      reg:
> > +        description:
> > +          PWM channel index. The driver allows two fans to share the
> same
> > +          PWM channel, or each fan to use a dedicated channel.
>=20
> Doesn't matter what the driver can do, the description should describe wh=
at
> the hardware supports.
> pw-bot: changes-requested
> Does this fan-tach controller provide the PWMs?
> If so (although Guenter may correct me), I think the fan-tach controller =
needs
> to be.
>=20
> If you don't do that, I think you're going to run into problems with havi=
ng
> multiple nodes with the same unit address when two fans share a pwm?
>=20
> I think what you're supposed to do is drop "reg" and replace it with "pwm=
s",
> but once again Guenter may correct me there.
> e.g. aspeed,g6-pwm-tach.yaml
>=20

Perhaps I can refer to aspeed,g6-pwm-tach.yaml and change "^fan@[0-9a-f]+$"=
 to=20
"^fan-[0-9]+$", which would remove the reg property. In fact, the driver do=
es not=20
use reg either.

Our fan-tach controller does not include PWM. The JHB100 SoC will have a se=
parate=20
PWM controller. (This controller uses the same IP as the JH7110 SoC, but th=
ere are=20
some differences in driver implementation.)

The JHB100 has 8 PWM channels and 16 fan tach channels.

So currently we expect the Device Tree to be configured like this:

	pwm0: pwm {
		compatible =3D "starfive,jhb100-pwm";
	};
=09
	pwm1: pwm {
		compatible =3D "starfive,jhb100-pwm";
	};
=09
	pwm2: pwm {
		compatible =3D "starfive,jhb100-pwm";
	};
=09
	pwm3: pwm {
		compatible =3D "starfive,jhb100-pwm";
	};
=09
	pwm4: pwm {
		compatible =3D "starfive,jhb100-pwm";
	};
=09
	pwm5: pwm {
		compatible =3D "starfive,jhb100-pwm";
	};
=09
	pwm6: pwm {
		compatible =3D "starfive,jhb100-pwm";
	};
=09
	pwm7: pwm {
		compatible =3D "starfive,jhb100-pwm";
	};

	fan0: pwm-fan0 {
		compatible =3D "pwm-fan";
		pwms =3D <&pwm0 0 40000 0>;
	};

	fan1: pwm-fan1 {
		compatible =3D "pwm-fan";
		pwms =3D <&pwm1 0 40000 0>;
	};

	fan2: pwm-fan2 {
		compatible =3D "pwm-fan";
		pwms =3D <&pwm2 0 40000 0>;
	};

	fan3: pwm-fan3 {
		compatible =3D "pwm-fan";
		pwms =3D <&pwm3 0 40000 0>;
	};

	fan4: pwm-fan4 {
		compatible =3D "pwm-fan";
		pwms =3D <&pwm4 0 40000 0>;
	};

	fan5: pwm-fan5 {
		compatible =3D "pwm-fan";
		pwms =3D <&pwm5 0 40000 0>;
	};

	fan6: pwm-fan6 {
		compatible =3D "pwm-fan";
		pwms =3D <&pwm6 0 40000 0>;
	};

	fan7: pwm-fan7 {
		compatible =3D "pwm-fan";
		pwms =3D <&pwm7 0 40000 0>;
	};

fan-controller {
	compatible =3D "starfive,jhb100-fan-tach";

	fan@0 {
		tach-ch =3D <0x0>, <0x8>;
	};
	fan@1 {
		tach-ch =3D <0x1>, <0x9>;
	};
	fan@2 {
		tach-ch =3D <0x2>, <0xa>;
	};
	fan@3 {
		tach-ch =3D <0x3>, <0xb>;
	};
	fan@4 {
		tach-ch =3D <0x4>, <0xc>;
	};
	fan@5 {
		tach-ch =3D <0x5>, <0xd>;
	};
	fan@6 {
		tach-ch =3D <0x6>, <0xe>;
	};
	fan@7 {
		tach-ch =3D <0x7>, <0xf>;
	};
};


> Cheers,
> Conor.
>=20
> > +        maximum: 15
> > +
> > +      tach-ch:
> > +        description:
> > +          The tachometer channel(s) wired to the fan(s) driven by this
> PWM
> > +          channel. Integer values in the range 0-15.
> > +        minItems: 1
> > +        maxItems: 2
> > +        items:
> > +          maximum: 15
> > +
> > +    required:
> > +      - reg
> > +      - tach-ch
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - resets
> > +  - interrupts
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    fan-controller@11be0000 {
> > +        compatible =3D "starfive,jhb100-fan-tach";
> > +        reg =3D <0x11be0000 0x400>;
> > +        interrupts =3D <128>;
> > +        clocks =3D <&per2crg 33>;
> > +        resets =3D <&per2crg 5>;
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <0>;
> > +
> > +        fan@0 {
> > +            reg =3D <0x0>;
> > +            tach-ch =3D /bits/ 8 <0x0 0x8>;
> > +            pulses-per-revolution =3D <2>;
> > +        };
> > +        fan@1 {
> > +            reg =3D <0x1>;
> > +            tach-ch =3D /bits/ 8 <0x1>;
> > +            pulses-per-revolution =3D <2>;
> > +        };
> > +    };
> > --
> > 2.25.1
> >

Best Regards,
Changhuang
