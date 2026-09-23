Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2136.outbound.protection.partner.outlook.cn [139.219.146.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB9E236B054;
	Wed, 23 Sep 2026 03:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.136
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790132487; cv=fail; b=cEZX7kW2/ifg/1iXxcnfdcCWZ5e04b2c7hfvthsuS0AenBXes19/u8GMJh9TEJnMcPwft0ZpZUleOSbSkbtQY3FquFPpbcMnIMj6ZQ5YaWGc3xsVQ5diM65vDKwfiFuIayTV6PySRUXj0XOWg0pwJfOjz+UTmP+fkAlFeLEvlpU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790132487; c=relaxed/simple;
	bh=Rs8A0SNxLWYX7onJvKi+EFeGuQgNCzHVCOJg6tp0sg0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=r5anPmpaOeozGT+yFH4zesmGroePYhRv8A7oH7XVmhayfqCpqot/RglHLIB0pn0Zj4jXXemm+JxmUC6X7434Gz+y5ceN/Ld2qB3AnWGMPCRiHjnapjcr2EajbHJATtr515BS6JjN67e/V8MlVjBdUEc6Wmu8CQhtyQwrn9VASlI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DAssdICX96P2pxZoOMujBxRIhmGOhKAcrZMsounQidNwoo1h/UEqi32+bCUHvIjSJVRIzAyiPstII6N0uuInYx36ioLx55PRonjLkh3/poKdxJTjF/mKBKb57wDus1D7blSseHLvHk7k/kXccbCFhc3H87dmv+/YazSMWluiLphOTtWVsdqtLBBcTf1dig0YK1UH5I6air6dM/pwguXFh3tmet4HOCuzFaZ8NJEon401zV3E5FSNNAOtN0IsA7/SftBcZhjDgP5edpEqUur4esN+94MnMsZQXVD7iHuCf6gtL/RVtlHZVAs6oavH8oSP9VpCviqXxaeITGyXb4eIkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1VTZtXkYj6r3JzNJ/X0xaqTxuWjrM7sRfZxlDPMxf+U=;
 b=i8llJOInQh0QHXvNVbGJ8NxVLEyw6tktG9+TiBlc8VNm/DaiuyXCzosSawtNlbZQTYfW8WG3lbRxC+2Ro/0rj++tjv8OlMNsbkO88abdHAh26Ny9EXQT1FK9FAAZIko4SL00Avx42HPdKHM+1h400dJLAZVNr4QvvxAxcG7m4cczVbOG17F7Guisf3K6bXYCfZFy2DPSp/SFQJtxp95OrCPX2XFlktKScte0ADDU9HUyUZcjSQ1LSYgTnnd4qAK5PFkt4vwGkUbnx0Bgz/ydr5apIHZCzK8Nrr8XBiL6tHaTxkVy7ZONiFHJ5uHZ07ZJaXcdirAWMwiNVNIDbV0bXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1298.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 23 Sep
 2026 00:27:55 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0451.014; Wed, 23 Sep 2026 00:27:54 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Conor Dooley <conor@kernel.org>
CC: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH v4 1/2] dt-bindings: hwmon: Add starfive,jhb100-fan-tach
Thread-Topic: [PATCH v4 1/2] dt-bindings: hwmon: Add starfive,jhb100-fan-tach
Thread-Index:
 AQHdOB2pWGWmLpoNUE2Go4xzfaaD97a4XHIAgACUoYCAAJPygIAAXoiAgAiT2BCAGI8bgIAAbgIA
Date: Wed, 23 Sep 2026 00:27:54 +0000
Message-ID:
 <ZQ4PR01MB1202CB83E2ED0A5C9042AAFEF2822@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20260830011941.40199-1-changhuang.liang@starfivetech.com>
 <20260830011941.40199-2-changhuang.liang@starfivetech.com>
 <20260831-dominion-data-c8b6f691dd5b@spud>
 <ZQ4PR01MB12023835F6083F45484E1ED3F2A82@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <20260901-contrite-cathouse-f50c63af6323@spud>
 <4cc20c64-bd95-4689-81b3-3f01d9c3bc8e@roeck-us.net>
 <ZQ4PR01MB1202328B1B28955A0C6DF44DF2B22@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <20260922-buffalo-urology-0395e437ae61@spud>
In-Reply-To: <20260922-buffalo-urology-0395e437ae61@spud>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1298:EE_
x-ms-office365-filtering-correlation-id: 6159ec16-4d3a-44d4-4b96-08df1909827a
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|38070700021|56012099006|4143699003|10067099003|22082099003|18002099003|3023799007;
x-microsoft-antispam-message-info:
 XNnaFVILTPro3F/GQez92cJdmoKVMoITytOuPegPbQuHWPsld0I8iw6uZ9knG3Nr8N4KGav6Z3QzvobtQGGnPMb77Bja+UKnjVHuhgJRrczPpqFppFMN5+ABASRY1qiJOVlzSeyPy3is07CLRIaDnnuuTByQdZ59cguB4ildFIrFAPTgu8A/zBI0ST5uk0548VqPj2ujpMlHSncNWP4iWZGaPmpdGhRTl1b16g+CkLvbLwvv+OFaZsesUaiqeKS3fjumKdESSUwMvyXggJt4CUwDi3qfn8l8MDIdYNhwyFKsovDY7WhKWKvy4vAi7CfkAuOWbVOA2vc6xwAAq+SgGAEVhSQ7xEJ9qkGIcEub8OYg32+58NBzQOH8w6rr+6VKAX2wb0AAXrS7aJ0U/D6Sp+8DYrBK1h9cLvD4v4Ii0dbAOgmZvsVxvVzJKkE96Zt5At8HTxwQTybrxSE9r4aSoK7jvs78x9718v9/WUgaJwVaHHhC7ntj5rL/BvGe1B47Pv77ZcM/Tj3PDa6hqWROHsfpZRwQapfaKy6T3bg2k5lOL+ZtQiCnFI60JN8BP58B
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(38070700021)(56012099006)(4143699003)(10067099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?qRJFpbrXfGx52hhF78912QY7e3XpXkU9Lcfg2GWqH2Ts9uy8sL9Y6lS7T7Lo?=
 =?us-ascii?Q?0a1PQghO/CIczwpItMOj//Sg8V3OT4ggKq3W8I9/Blz1SL/4rh/mXMFZxWes?=
 =?us-ascii?Q?iSuDQtyuCtOXGuFUgtzk0oyX4dG+6AL8D/RYBoTo2aZPsFJLes0fOs68y59W?=
 =?us-ascii?Q?HuCQqrii7rN4bTta5hoWQ/I95dgMKA7Vj3SWKbRB0QBtvAaZBlJ7A7OcDh34?=
 =?us-ascii?Q?n4iKDMtyNOU7Apv0Av65GgfjYDtpYQKbCbQdL0RK4aIuASCXJccSZ+1qOHmR?=
 =?us-ascii?Q?V93V/w9zii03XDR3b4+m/wYXsqbXuKnpcFfJqcme+4J6Rxxc1td3DxH0mopn?=
 =?us-ascii?Q?gSi9oaCuHCWO6qshNwsDIC8ufHUoJMedDonX52UvhKB1x+TeylN3rGSH2dmF?=
 =?us-ascii?Q?itwvrGmuk4fElXc98nDyReIbUdSTSAOeZ708BGSSSP3robWMvCv/Qe5S6VZX?=
 =?us-ascii?Q?+J0dobZBzQnK0aIUhDTQGHjWd5oY8x1/rjJQqNzmajf6ohjDUdtg2MGLcfQC?=
 =?us-ascii?Q?VyZjJd+a+dfWlcblebp1aBp6+PHbL6GLX+FQdPGzkNHJQ1cV6IRWh/lZ8lms?=
 =?us-ascii?Q?axX3RLa4W36DFU/T9fLtPDZWopEXexAC4Wb4sa0+i9S3WBtH1Rpj/bMrWqj9?=
 =?us-ascii?Q?xclQHkUvlK6O9ga0dV2PzSu7VaAXYqlWVr7B0RpfHyzku1kX8PidP+r2u8qo?=
 =?us-ascii?Q?i19+RELSpjZnIWYqWfa4AwO59f77TSc47iPxahF0yGNtgRavgw3yOCgjvHcJ?=
 =?us-ascii?Q?Ap6C1EdBnNhikPTxl2miwI1HUBwf99w56B2kh9+L8AlybRNpzFqDUvfJ6I78?=
 =?us-ascii?Q?ihcmKRLIMs1SxwaGn1HgW8RjkqGf2ETXgZ//OOf64F7EZxg+PCsT3ZUQyjCU?=
 =?us-ascii?Q?N/MBM8d0azM05Hdwr3Z0+8g8aas01MXLugNPc5zNHuowg3aEFjTUemRe/BbB?=
 =?us-ascii?Q?Pa4XrxRi96MdMhWv5RCEfskZWWieZE0RyNL03Y5TF6OUwMo2XSVc8AusgklI?=
 =?us-ascii?Q?uVGmcarxwu45lWTQi6i9JsMtZrd/vCjC4FZuxYzi0rtU9sLx8Oj/Yt8AooSu?=
 =?us-ascii?Q?TYoqjh5f9mIeJ5yA/ANY+nVSR8n8MbEgVLc4ADPYpj7MDHLb7CvMx/R6bq04?=
 =?us-ascii?Q?X+UhSlxQIw5Mk9vTafTkdEVYuFv33gzckKOgyvUsMUDFR97qYyJR6k/lMImd?=
 =?us-ascii?Q?FgfvWfHEA8CsI3euAbAI3D8SSXA3YHhvv1O9lj5RiOQxQy1Ks4HXndifXw+o?=
 =?us-ascii?Q?djLan9SqkEvCLMgzGlUTTgxcBhIAYDKaCnwca16S49/ahdXmGpltDhFJxaT6?=
 =?us-ascii?Q?J4mUl0vibFgtpkExb0PjU6s82bzznbY11D+OQtGLNkUY3g5GVkfCMA7AOuwY?=
 =?us-ascii?Q?xE8M7qXKuea/3GPyzCa6ka12zdhdf0umkJYh13zGfg1725lRz2isbYDobwpN?=
 =?us-ascii?Q?19tAK+AFY9ToPSTk31O3zavuAma3du61zMN3zaDmR1mdH/LTaRdtde+rW61k?=
 =?us-ascii?Q?DG5qx6+1mKuKFkYHNSRREg1WBGGVzPYZ7cA3VMXfqs9mj1ls+qiRbBZvLq0Y?=
 =?us-ascii?Q?NRPWV1cwTH3cnAd1DVtc/Asezs9rBKQ7RmMqAaKp81jMxKfuEwnxi/DS1blR?=
 =?us-ascii?Q?FH/vvjmJ8OcSxewVkQYCv/j6+afhBsrRQUu6987fQby5+joKWZK7LjpeJ4aw?=
 =?us-ascii?Q?RGJd4Jdacq8NhIJW2L7nL9OCbL0nVWL1IYhmMyvaM0vNj6g2qN3y8PIWxPNq?=
 =?us-ascii?Q?jG5Q1+M0TxzIbWsp4agUYmJA2+aYOig=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 6159ec16-4d3a-44d4-4b96-08df1909827a
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2026 00:27:54.4080
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NjrabXedQG3R5sog5DBIXZ3voGILZtoOOo5a1+75oMc01haPVgZYWdf/ZBIf3aNhwx7VwaPxsTx6qJ2ze7tMqtxgn67E2Y+bPBSiJIScWomN/T5hlTQhAnivoTaM5Lly
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1298

Hi, Conor

> On Mon, Sep 07, 2026 at 02:51:44AM +0000, Changhuang Liang wrote:
> > Hi, Guenter, Conor
> >
> > Thanks for the review.
> >
> > > On 9/1/26 03:14, Conor Dooley wrote:
> > > > On Tue, Sep 01, 2026 at 01:24:39AM +0000, Changhuang Liang wrote:
> > > >>> On Sat, Aug 29, 2026 at 06:19:40PM -0700, Changhuang Liang wrote:
> > > >>>> +patternProperties:
> > > >>>> +  "^fan@[0-9a-f]+$":
> > > >>>> +    $ref: fan-common.yaml#
> > > >>>> +    unevaluatedProperties: false
> > > >>>> +
> > > >>>> +    properties:
> > > >>>> +      reg:
> > > >>>> +        description:
> > > >>>> +          PWM channel index. The driver allows two fans to
> > > >>>> + share the
> > > >>> same
> > > >>>> +          PWM channel, or each fan to use a dedicated channel.
> > > >>>
> > > >>> Doesn't matter what the driver can do, the description should
> > > >>> describe what the hardware supports.
> > > >>> pw-bot: changes-requested
> > > >>> Does this fan-tach controller provide the PWMs?
> > > >>> If so (although Guenter may correct me), I think the fan-tach
> > > >>> controller needs to be.
> > > >>>
> > > >>> If you don't do that, I think you're going to run into problems
> > > >>> with having multiple nodes with the same unit address when two
> > > >>> fans share a
> > > pwm?
> > > >>>
> > > >>> I think what you're supposed to do is drop "reg" and replace it
> > > >>> with "pwms", but once again Guenter may correct me there.
> > > >>> e.g. aspeed,g6-pwm-tach.yaml
> > > >>>
> > > >>
> > > >> Perhaps I can refer to aspeed,g6-pwm-tach.yaml and change
> > > >> "^fan@[0-9a-f]+$" to "^fan-[0-9]+$", which would remove the reg
> > > >> property. In fact, the driver does not use reg either.
> > > >>
> > > >> Our fan-tach controller does not include PWM. The JHB100 SoC will
> > > >> have a separate PWM controller. (This controller uses the same IP
> > > >> as the JH7110 SoC, but there are some differences in driver
> > > >> implementation.)
> > > >>
> > > >> The JHB100 has 8 PWM channels and 16 fan tach channels.
> > > >>
> > > >> So currently we expect the Device Tree to be configured like this:
> > > >>
> > > >> 	pwm0: pwm {
> > > >> 		compatible =3D "starfive,jhb100-pwm";
> > > >> 	};
> > > >>
> > > >
> > > >>
> > > >> 	fan0: pwm-fan0 {
> > > >> 		compatible =3D "pwm-fan";
> > > >> 		pwms =3D <&pwm0 0 40000 0>;
> > > >> 	};
> > > >
> > > >>
> > > >> fan-controller {
> > > >> 	compatible =3D "starfive,jhb100-fan-tach";
> > > >>
> > > >> 	fan@0 {
> > > >> 		tach-ch =3D <0x0>, <0x8>;
> > > >> 	};
> > > >
> > > > Truncating this for readability, but it looks wrong to me. How
> > > > does the feedback loop work here when there's no way to determine
> > > > which fan is connected to a tach channel? The unit address of the
> > > > child nodes has no dt enforced guarantee to line up with node
> > > > names of the fans or pwm indices.
> > >
> > > Normally (for other fan controllers) the fan would have a target spee=
d.
> > > The controller measures the speed and adjusts pwm output values
> > > until the fan speed matches the expected value. The controller needs
> > > to know the association between tachometer input and pwm output for
> this to work.
> > > Typically (for classic fan controllers) that association is static.
> > > In the Aspeed G6 fan controller it is dynamic/configurable.
> > >
> > > I thought this is the case here as well, but I have no idea if that
> > > is correct (or if there is a chip-internal feedback loop to start wit=
h).
> >
> > Here is some information I found about fan tach and PWM control. It
> > looks like these two devices are managed through an application.
> >
> > Do you have any new suggestions for modifications?
>=20
> I, at least, have no new suggestions. I thought the most recent reply fro=
m
> Guenter was pretty clear? If you've got a dedicated fan controller with s=
tatic
> association then you don't need to provide the association, but if there'=
s
> dynamic/configurable pwm-tach then you need to provide the association so
> that the fan controller can work correctly?
> To me, that read as if the pwms property would be required here, because
> what's proposed above represents the same fan twice, as pwm-fan0 and
> fan0 without an association between the two because you have an different
> IP entirely providing the pwm.
>=20
> For this to work, don't you actually need to do:
> pwm0: pwm {
> 	compatible =3D "starfive,jhb100-pwm";
> };
>=20
> fan-controller {
> 	compatible =3D "starfive,jhb100-fan-tach";
>=20
> 	fan@0 {
> 		pwms =3D <&pwm0 0 40000 0>;
> 		tach-ch =3D <0x0>, <0x8>;
> 	};
> };
>=20

Okay, I recently came across a similar example:
https://lore.kernel.org/all/20260921-axiado-ax3000-pwm-fan-v3-0-3def8b6ffec=
9@axiado.com/
I'll refer to this for the next version.

Best Regards,
Changhuang

