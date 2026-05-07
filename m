Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2120.outbound.protection.partner.outlook.cn [139.219.146.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44EAD26AF4;
	Thu,  7 May 2026 01:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.120
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778117775; cv=fail; b=TY6NtxckyiUW731P+1Xq69IL/iOGlQ9diVsjXFye/ui6pHvoCEOTbAcGxANRvK3MS95F3ExT9EVlIC9ncBtMkA/Gzhdpl/H4j4B8LiUFhVk6fyWWibpkAus470OEjgNMtiJpm4tYbHI/pgFXfKcLs1oghvds84VjmZS2LnhyppU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778117775; c=relaxed/simple;
	bh=gyr1GKNYt4lm9aOyAOfVesuF5DCUkXeJ0fhov4AXAj4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=UI/Pr2e4zZVsk8kxpcFnMrpK/QiFggSTiNFHN99aOFO/hEVmqtEg8yWp43dG6vtY4nefpwVWxjy7gCBg+u1ixMTHkOz7FqDOlS89p86D40S7gwBYwlXkp1FdZ00EBlOA5YCaN1Jn/FXFDyWTotgWGOnORRL1hMDQR1HTPaWQDNU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VNOuHvK0kjEIxuWblDtbliY9cY8tNhSkMS89PQuWVMYyVft+0vFIedOr1qFT5vFtuTaltkHUBpNYpsNvXojJdSlxxeHjw01Ci1o9BX0WcjADghyB5UPUfVFBQeL+KLYI4IBLepQLRJeo+8n+CK8h8/l3dnvmGNS4D8W2Yhoz0317UnWN7cLYqTTeDsYftdqmLDSOULHXpBKSVxsZ9Sc6tIpf7/9rnVcMWQYjjTxYnT1F3NYAMdMbapeQVNCpMUFHH8KOZTsqQ2O7Zl4Zrt+73Fs/I+jVJwH0GV7LVUhyzbDksrr+0D8lhX+l+/i6cuByB+sesHuTqw2SpLuoFPZzcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bsMAEFVOAfcGd9SZo2lEx3sqED85A6q4WINmvoB324s=;
 b=fw2gmR8k/o1UfLmdQ1VqfPTNGk8lmUUSWMn65FdkFdnI7cMOhX/Xqs+dI327P7WsN93qhf5HzhIj1zZt2WZ/0YU8rjPDmJZ/oJ67u2zonkmPkj4RlpegdFS9ngepuV7BQF55MU7tjImbPY7Rs7d5TO5RVQ/tpvtvwr/WBT7QGr+/HA2hZ4lVdzdjWiGaI9Pz/5Pn0SoI8Sl5qW09hp8Zd1Cc0jwmdhVZnJSlc5zKFjwmDKaxxHjy5123CvpM1nj9p48oXpzIq48MsJ/foJvDWfcs8SYc3fKZN1ncsLQtT5vjWA64Zo+EQsXOYUet/TTZpx4tJEXnj6YiI7KmOF1Zfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1331.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.16; Thu, 7 May
 2026 01:36:06 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.20.9891.015; Thu, 7 May 2026 01:36:06 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Rob Herring <robh@kernel.org>
CC: Guenter Roeck <linux@roeck-us.net>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH v1 1/2] dt-bindings: hwmon: Add starfive,jhb100-fan-tach
Thread-Topic: [PATCH v1 1/2] dt-bindings: hwmon: Add starfive,jhb100-fan-tach
Thread-Index: AQHc1uhVBBxMuV54uku78jibDJpGKrYAQMIAgAGVKpA=
Date: Thu, 7 May 2026 01:36:06 +0000
Message-ID:
 <ZQ4PR01MB12029EC472A080E254DC8444F23C2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20260428082337.743546-1-changhuang.liang@starfivetech.com>
 <20260428082337.743546-2-changhuang.liang@starfivetech.com>
 <20260506012556.GB248179-robh@kernel.org>
In-Reply-To: <20260506012556.GB248179-robh@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1331:EE_
x-ms-office365-filtering-correlation-id: 7589a3b4-6982-47c6-b3a2-08deabd90228
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700021|56012099003|18002099003|22082099003|3023799003;
x-microsoft-antispam-message-info:
 bH/n8d6M0YTTVXvztPX4jL6NztCFUQrlJxtPxhBmmvlC7UDdt8wCxDUowR6hTluQAUn85FJDXZBNHt13HWWdgDr0nzY6UXaNs9G5/3MngDnJxRUYefHb8+4ck4lMgfbv/VYE9e5I4NdXQCC5xBtkXIbqf4k/yBoM6TkDrcFuroRQ6ts0KErE636fmqpyqvfxFdc1Ru/dMm42rDCSlf48nYVr/wOYGar4ciDuUF5dzpsmzgrm826oc9zvvVp/owve9PgvzGgX4f5ZjD2UzMG23AWKo3rtCU/TrcumuSqahzu+Ui8nrg3pGEzSQdWfsqtW5B0PT5k80D/9m6QqsQ7SQZo6PVTSafltyTL/iHBLForABCf2wijK5zw5WkOkJ06/0yEA7JhG6FlQ69g/baylwkGPw8LTM5z36Stl2xm5sXZ1OODV/v/h10z/suFqGXe7bWqRgZHvsPxrrJzbbES1TjIYYRY68wT3AVDpfJQ3GRDRlLG5ig3K7Or6ZUVibJkZ81Rdaxms25jXl6+FCKFmUg2Wzx7jugU9mtU2HtDEWo9vuf2RCuNsFKiiAv3z5RuF
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(56012099003)(18002099003)(22082099003)(3023799003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?4qSKW36WrPL8PFt8D/Wq6HkmNR1ZrG/U6+xU0e+t+0/yHZaJHZQS9QOLiqVO?=
 =?us-ascii?Q?hhYpwRdJ8tPSpQv3GUliwlYazmUXJ+r5TfPkRperm0O9NJ7aRUDjUGENyDXp?=
 =?us-ascii?Q?+a7h3WhG5J1iPVshAd7pV2uAYC5Q9ESpYkejkmtLqZGim6yXqB3BcJXjKG2k?=
 =?us-ascii?Q?hXrIKWVmV/5OdNwn2oHL2PIxFIttdtnHO7seAgdPDbG4u7hKbVAYQu8TByZm?=
 =?us-ascii?Q?toukASDCL8mDGsmdHx61bq6jC1dO8TaFJ1w0YgLhzOz9q/wFUmsSml+Nh9ji?=
 =?us-ascii?Q?XYY3toVeHLmnsj/EOlRzr76icsRgrOlzXYS7svaChEVLfnqPG9sIzZZQ4PVF?=
 =?us-ascii?Q?ctAO/6RtbIWauMKyhwdoCR98mfwqqaKAtU5Sh4xCLZhI8O5NElL69IA7wpUo?=
 =?us-ascii?Q?Phpcxf3R8GVSMP+yk3CBxcafNTOBCSqjEXg66UrJ+ETB8ffFp8KK0Hnd6Vmv?=
 =?us-ascii?Q?YcAstcQIDUX43OBI0lAbWpODyhFCiItbPvc/ngUDTtdkueiDBU+kg8myjRd4?=
 =?us-ascii?Q?seoq+cbJG1K6cNUPWDIp/M8Fn+7abgADXB3mtjJuwv1tQCB7wmxoDGq3zyY4?=
 =?us-ascii?Q?31o62Rcr2aSpcZ1TQvgI3pWS4H2B39z9jMCmrPmt8ytiLjWIgybrZhEJcKDz?=
 =?us-ascii?Q?kZ4bEAr8wuZV3mX4Mf3D6DpqQYuRJuIovnOHABhfMwQ+5dOJi1Oefs4MfiYN?=
 =?us-ascii?Q?P3dvrOLQ17WO5v2vjfPSyoq+C0h9R+PRcp0Eukae9JDdzRaFamIjcTxedAVY?=
 =?us-ascii?Q?kiBQlaVkQBHX3NzTxlBSSraAiYvhWzJnv8Fx923uhKTTHXGsWXH+9QSOcaaB?=
 =?us-ascii?Q?nEFW65AX5hSvacXN/PgUqZ9bfFoXYpKXtWsS8efh6on62QsB4bx7vv6NfAI/?=
 =?us-ascii?Q?/5JNmgFl50eFdcKZp1om2x/n9dIUWt7tHsLYY/VmTOfwyqA9T+irRd+6rut0?=
 =?us-ascii?Q?p0hVIKAdWrl2B/7SLDbRH29VUw7AAZLqiHGZVdgiRwzj8ju0PBPymcV0T1QJ?=
 =?us-ascii?Q?U5j5E63ITBZca+OUPKGDqdV6W7eQfNPl24wqjw1jz40/XTTHJhCig9rCRAMi?=
 =?us-ascii?Q?6cCTzeJElEayb2ggjXKIgCeuvqItNGf5PVx3fpcVehEmGfolGeTiCpzGdS3X?=
 =?us-ascii?Q?25sxmidymMK21rRunFfccsVVNVr5+I7ih2LK/NC+iS7KsrVG/Kj8jtgR+rHs?=
 =?us-ascii?Q?sUJvRLqFcHQHmzBdhdx1AeDXTieX8Z4kIo0vUJXTSKgZ5rSf7KN4+F7nhBBb?=
 =?us-ascii?Q?UFJiH8Sv2HVZNOYVW0kqAorTpnRsVzsQVaFakvJxbTXhEdvV+dJkbczg+ajM?=
 =?us-ascii?Q?DpcWBf9TshDcF9GK/jKkdBDHoVQsazSUmNz9w8go9CPYhr9KLcsnBmt8Pbuv?=
 =?us-ascii?Q?xTUrQX6v5hbc/I4h0vG90lxiL41Me8yCq8fC/c8BLltANV4L63xdnPSB40hN?=
 =?us-ascii?Q?9EpEbk9wRoF/h2b+Rsjjc/giQxbDoHbCOg5dY+3hCmod72xWDI+6Z7Sd/+vv?=
 =?us-ascii?Q?JyniweP3go0ckJ4orOdOcNFyT0dSl1GM+GtaRgCJxVOP/YLiduQAhiAM9swd?=
 =?us-ascii?Q?UzGKPgGL3tA2aoGx7VF00Jqm5GJXs1L3qSUPmiHR/LsxKeF40nfM/LmPnIEm?=
 =?us-ascii?Q?4z/xy/p60v9+dka780CXy8MFGOqwqe4ZGmTpn7aJeeO9H0vJxbEr9k5JYK4s?=
 =?us-ascii?Q?x80aMLNm1jbOO4rw7Ar7iKwTv7jn4jytZjzX2Bg2nnKQJt6YAwqqprwDZGaO?=
 =?us-ascii?Q?U589b50KCahMKMX0PyczB97pvoauF80=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 7589a3b4-6982-47c6-b3a2-08deabd90228
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2026 01:36:06.5168
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W+Ari0/lKy7ugS5LDbrbWaozvv/8aypb3FpS6/EMC1rCBUOgR6hWww4kSd0N+EicHCCKAE3ZdSjQVNwKACrAoXE9CBtavzYouiX3TE27abm6yhefaSo4lzKhc5EuqAr1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1331

Hi, Rob

Thanks for the review.

> On Tue, Apr 28, 2026 at 01:23:36AM -0700, Changhuang Liang wrote:
> > Add compatible "starfive,jhb100-fan-tach" for StarFive JHB100 Fan-Tach
> > controller.
> >
> > Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> > ---
> >  .../hwmon/starfive,jhb100-fan-tach.yaml       | 98
> +++++++++++++++++++
> >  1 file changed, 98 insertions(+)
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
> > index 000000000000..fdc8539ec804
> > --- /dev/null
> > +++
> b/Documentation/devicetree/bindings/hwmon/starfive,jhb100-fan-tach
> > +++ .yaml
> > @@ -0,0 +1,98 @@
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
> > +  '#address-cells':
> > +    const: 1
> > +
> > +  '#size-cells':
> > +    const: 0
> > +
> > +patternProperties:
> > +  "^fan@[0-9]+$":
>=20
> Unit-addresses are hex.
>=20
> > +    $ref: fan-common.yaml#
> > +    unevaluatedProperties: false
> > +    required:
> > +      - reg
> > +      - tach-ch
>=20
> You need constraints on the 'reg' values. Also, what does 'reg'
> represent in this case?

"reg" is only used to distinguish between different fan instances.

>=20
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
> > +    fan-tach-controller@11be0000 {
> > +        compatible =3D "starfive,jhb100-fan-tach";
> > +        reg =3D <0x11be0000 0x400>;
> > +        interrupts =3D <128>;
> > +        clocks =3D <&per2crg 33>;
> > +        resets =3D <&per2crg 5>;
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <0>;
> > +
> > +        fan@0 {
> > +            reg =3D <0>;
> > +            tach-ch =3D /bits/ 8 <0x0>, <0x8>;
>=20
> How do you have 1 fan with 2 tach signals?

On our platform, two fans share one PWM channel. It seems there was a misun=
derstanding earlier.
I will change it to the form of one tach per fan.

Best Regards,
Changhuang
