Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013048.outbound.protection.outlook.com [40.107.162.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DAF13CAE8D;
	Fri, 13 Mar 2026 16:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773421124; cv=fail; b=S4yajviEz+pzpOhrck9ebbqyVh8XbFmdajnV+LscKP5NxsJuamoID7ZZ/o/fS27NzlQ9LbatxE8h6jgLUaAMhpPEfOaOS3CibaGbHzWwmWPuzYEbAZRmie4vI6tAwXR8qKBU4n548VuSWPgoxxD2nsHz+QVApWJaZaHjs17c8wg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773421124; c=relaxed/simple;
	bh=oXX3Rol6lsaoDb2asClpdVXuKJf3chUVszIsFfFcdbs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=utSm9zyd3jceIm+MkpSzeqIeR6ozVDNSS4BnA4+Kuy2VQfN3JWnfaBa8UiovEH9iw2Z1ePrCaeu1aE/w0m1UoUFyuOhQUytxqu4X2DOGSxDW/Rr191Dy13B2VPu7/deTvIi6kuo4Sb4XgyXHH3eeqhiPJ9PjKVe5V1DXVGsvxbE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Nqy1qcKA; arc=fail smtp.client-ip=40.107.162.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Nqy1qcKA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=elOujBJtEleTJFfDWsQtGWiwXkmuGavuDa81yl/47PSzXo7AyrC/L5VxjfBO1hRNnfOYToLvJ6hTi5m/uw9d8p8/PGub0jeQYeOfcODmH2+QwfqR3JCShQ0e5olCpJVwV59I0M2QMhdGxyM95pVaheV2o1p70e5XFzFNASlojuj6x9+QM6o7cxTDs6PzzipqNQ/psByD4lPAWm28PtWn6mjx5F2nxNev/srywYfm7BRmL0Fkrbla+LLqBE8su7LYn52NXYNNEhGPDrIoXkKXT2lGCtOyfT4paRdhArFqSHDbuVWPMWLvvdkZyCRgNDv/bGVBT54L93fHucoKBeY7yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DQuU6FlFdBBlOUdgBP0iK/pkfsCErqdikP44QAvSWEQ=;
 b=Sx9/LmtxJ95bBLOAWK7xJwN/5t3X/wI5FoycxpvJb8BNIc0zGdpgHePShbC3ETkWI7pEZCefOG4Mo8NKagSeigXopEbN5OC/CflOXY/wVoCX7k2L/qNVIrfb8fhpUh1gDadFUY7jTRwe1tP+V0Tat5chQglp79g/f+/ChEaCk3ApzbEtBabhWm3ElDvnf53/zt3Hiu8qqsAauMbLQOJ6sjKBHm9rgjhB1aj1IqeMrSwOHAOfyWp5/LPLQDWbhYCDMU3qoOy/cRyGEPx4/B1H6EGHuWhkKjZQ3iyUIixvWkXH4OdD4s58lfWxKewfjeSwJianTQidPgVzj9S4ND/CQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DQuU6FlFdBBlOUdgBP0iK/pkfsCErqdikP44QAvSWEQ=;
 b=Nqy1qcKAu37OdSIKKhC4dN3wMBeADatrgYln9lO5p7zbMXUY9qQHvzJ0wMR1O/EAtZ1KTuUQ73lBet08NV8AcpjumU83tQRqS+SzGqHpfnByJ0jUPfi4ZXRolJKO5Z8jgeu5pRahO4VcZjfD7yCFn07fBJXSlxbW3qsB0dPbO9OUq735whJ7JsD8mtwNq7ZPZI0vfOCts13+AKydIBSg+cjXsKu3kGeEP0352uRSaXOhbb9rW9B4fDpg3ODbCcJGCtaH+sR4FPYleNcYgy3chaRw1dClpmalldGDMSB/UoJkoNaMk5/Q/udiMtJl7UpG6JjKODksHenMIcPT2JS+Aw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU7PR04MB11163.eurprd04.prod.outlook.com (2603:10a6:10:5b3::14)
 by PA4PR04MB7584.eurprd04.prod.outlook.com (2603:10a6:102:ed::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Fri, 13 Mar
 2026 16:58:29 +0000
Received: from DU7PR04MB11163.eurprd04.prod.outlook.com
 ([fe80::93f5:4ff3:2f4c:183a]) by DU7PR04MB11163.eurprd04.prod.outlook.com
 ([fe80::93f5:4ff3:2f4c:183a%6]) with mapi id 15.20.9700.010; Fri, 13 Mar 2026
 16:58:28 +0000
Date: Fri, 13 Mar 2026 19:14:33 +0200
From: Florin Leotescu <florin.leotescu@oss.nxp.com>
To: Conor Dooley <conor@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Shych <michaelsh@nvidia.com>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	daniel.baluta@nxp.com, viorel.suman@nxp.com,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	festevam@gmail.com, Florin Leotescu <florin.leotescu@nxp.com>
Subject: Re: [RFC PATCH v2 1/2] dt-bindings: hwmon: emc2305: Add
 fan-shutdown-percent property
Message-ID: <abRF+TPKuXFDJc55@ro-kernel-workstation>
References: <20260312122248.1281572-1-florin.leotescu@oss.nxp.com>
 <20260312122248.1281572-2-florin.leotescu@oss.nxp.com>
 <20260312-triage-shallot-1b3d9f07d250@spud>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260312-triage-shallot-1b3d9f07d250@spud>
X-ClientProxiedBy: FR2P281CA0048.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::19) To DU7PR04MB11163.eurprd04.prod.outlook.com
 (2603:10a6:10:5b3::14)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PR04MB11163:EE_|PA4PR04MB7584:EE_
X-MS-Office365-Filtering-Correlation-Id: d8cb421e-c284-4033-c502-08de8121bfa6
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|19092799006|366016|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	EFLgMCAFgK514/1GHjXUmAcC5JnYz3CtAJ/HdMalOPANNLXsJM3JmKWv87JV/Ckop2tpZDP0PNdz2cIAnc5Eiag0KBFBD8LcjYRT5xrAwiX6gHvED/hj1CWio8xwLxo0nygynrXNryjYDItaKL0n5Hr5E1hdUP+YM8rKn8rAKNPOwIuJrHKFEszI7AM5SBi/Wet9dbb6d9gazi1uiIaJ/eJ1dxY+XDpVrRn6MXI+ghmTNZKbG/tVebTjG3TQLeaUGdgLXMzgOqzq9npcgcRlTArQ+QukcIDs6JFb3RkwxA3RKY00/Zgs61Ix2FNMllvzMLgzjZz64IsFMz8VEFdxtXAiolFNuu5FFPX/0NmzpiW0KjIKKBnyU81SN18mLMfmpm3VeShcCD+uR/lKv3GGjONckYNwVpHI89S0xCUL/LYAXjWsOgI9qdq1xyBgZQHY4jq6Qf41AsM1ksnJOxfhFDyahQduqBJm4Mzkhm26EwmCBJJb9BUzUgdN48gFntU4lQWjRFKOkVahGxBBKbmtNWDplwbDfqtoJc5AX3aFD+J2zYCBIt0cfjr5RXFkkG8kztJIBqxIx2K7xjVzrDcDHdfeBkwlNDRRycUwqIBTQonDQ0klI/j2JPYNdNZ/cPFz8xz5yuyFh9luHT4yX0DQSGM4+XqZDqLhmUC6qL5h66VHoseQJ3njt52BsjldlUPjbInbrm/PxxlChvh6ycA45cVnPNX6G4dXsRKQyyVDxjE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PR04MB11163.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(19092799006)(366016)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Gpc152Vfszb5uUlr61Aw0hMKLN57+WNFUFmolafZwqzWMFq5PC4OyonAS1aj?=
 =?us-ascii?Q?6uhv5wO078DyNOYBwajQGcsjTa4tJoZ4L23IuizlpwAbnOJW1OVpSivAJVZv?=
 =?us-ascii?Q?gsOSDQ1D5WTK7lY7SyvNz/2p9qFJbOMhmsp28t32IGs/kXbZ8Cthko1lXLil?=
 =?us-ascii?Q?FfPHuXMk6NuDvIZhUZvqq0p3VJnbo9ERxXOBk/oZJUagQMxq6p46ke5FS4WK?=
 =?us-ascii?Q?ofmlpeKwSuAJPCV7yR/w1PW5a8aW0hVKSdqprdR57GA/g3dEs+QgEJFcTepz?=
 =?us-ascii?Q?EKOjEAoBp0V30TmIi3aJtQwLSLCJaKox/pS7JdQEjSb3xmFzlp0dhGJF5rof?=
 =?us-ascii?Q?Lhz1hs9riZ6UMMsjqbK7ZKktJ5HXUaBegEc39xp4SJdcrg91XMXEmdzlwGgR?=
 =?us-ascii?Q?8xHHoMH/+CBk5FRnaNwaPVmAkRWpKzVEsMLSEUdTYfYH+rcmy8K4m/hmONB4?=
 =?us-ascii?Q?+4DqkzZ7p3YfPC1VLRLIBOo1HWEajJwMcc91cp8D8sokVZHX11iJZLf2YByq?=
 =?us-ascii?Q?zVnI6ea2om/UCSt0AfQ1PzHQHSQa8haIhBTf58fL3USKt0gbwtZXNgk4EFMp?=
 =?us-ascii?Q?j1VpFdOj38+f87RgUcNN+ffcWITbces9aXwYs3byKXd0Pal/AmwTDZhW8Ype?=
 =?us-ascii?Q?E8cflknrPIhW246ThSU2xjLPB9RAKz+J8IBAHeQVZMlOvQmECGwsyjqy0JV6?=
 =?us-ascii?Q?nD3jtiI+B9aXHBSjnaCHTvqg8l8XMv7M7d4D0Rl9AGXuPZS1aC9cek0doQRt?=
 =?us-ascii?Q?pjUQl/23l9hc78LksxBSg34WurpwxjUY7j0TR7OwnE+rnZAoQOWfcyLRjEpG?=
 =?us-ascii?Q?ixcf9hBC0g5XHdfi+KIEmvzPiM9MHqBEiIalw2lzNetjbo0cxHqbUx7kGv1q?=
 =?us-ascii?Q?XIFIvOgRD+i+fSrtHf82uDnXV9HRyAUo3dxuCN2h0jZK36C4UjJ7gCDXpW5A?=
 =?us-ascii?Q?x28Ccg8LxD0x40jt4IvzBdWOTSp6q9T6+k8o9O36rjgQTsO+lJDtK6d03muq?=
 =?us-ascii?Q?FpRSQIBYQ6b4PeaOLJQqp6RnzIm3bnKkjnzrGm2LOzuw0zx5bHMzRw2mS2A1?=
 =?us-ascii?Q?zLVfMSm/+dumgM7vwtsGKMkjGvhK1e4MQTxQjWcwtQtwaIpvLUqfIK5+L5wm?=
 =?us-ascii?Q?sQMIaNRs5UIWrMGEn8gTpZA0wEowYtv/2/wq53hr4vV86GEwrtFkldga9wTu?=
 =?us-ascii?Q?UHugCbC4oJGwimvMsh10wKiT/lD9g0rhLv57kcd0JXFVyORDNfjvG8JfkPav?=
 =?us-ascii?Q?GgRgeYcmBP9Cs6EE27b1bNaBBEqBN4YLr432XOTnK48KsdKD5/i0fERZ9l0X?=
 =?us-ascii?Q?ouihuIWtixNa4iTv4FUtjLtd0Vz3QOxIAiIFTKUuUjajZOe2iwmYXSkD45wL?=
 =?us-ascii?Q?RwEGZcfHMSz/C0Th2zXpci2/3LhnaK989HCK9OCf13A1s5PVdJJw4nvqzTqC?=
 =?us-ascii?Q?6gTDjqBX9iwd81ylx3p8BUTj2q50CWsk/4SyJt4gmOD8kEVW/qFH24F7tyxz?=
 =?us-ascii?Q?R7E0gGuSdKYuFCZNX4a1hPOYXn+/wJ0ePvjnQDpn8IeX4A28rxTacM2nhI/J?=
 =?us-ascii?Q?C+4mZfUPsFGAe7hXKmwH7vyqpBcME6r4LCub6BBwlpn94UOn/MnEaEx4tP6u?=
 =?us-ascii?Q?DYoG7F7uyolMwWMLdg6n77v4rO7aqWLcdz5sBdcMjfpCdWN4iDwUoSbIZ7qc?=
 =?us-ascii?Q?koBzatEzW1jga3CzETD3dQZV9JYUD25fs6MRWBNIu5So8HdQ++FFHoKYkeor?=
 =?us-ascii?Q?lkGMrnymHQ=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8cb421e-c284-4033-c502-08de8121bfa6
X-MS-Exchange-CrossTenant-AuthSource: DU7PR04MB11163.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 16:58:28.4265
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KSn0Uj2kUOx6OKsEnlmvIPEi4TYr6WlyuMps64PRIOl13OUPVePonNG+5yW9JtlWuTeGY8XMspQvs1BdA+eI/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7584

On Thu, Mar 12, 2026 at 05:37:51PM +0000, Conor Dooley wrote:
> On Thu, Mar 12, 2026 at 02:22:47PM +0200, florin.leotescu@oss.nxp.com wrote:
> > From: Florin Leotescu <florin.leotescu@nxp.com>
> > 
> > The EMC2305 fan controller supports multiple independent PWM fan
> > outputs. Some systems require fans to enter a defined safe state
> > during system shutdown or reboot handoff, until firmware or the next
> > boot stage reconfigures the controller.
> > 
> > Add an optional "fan-shutdown-percent" property to fan child nodes
> > allowing the shutdown fan speed to be configured per fan output.
> > 
> > Signed-off-by: Florin Leotescu <florin.leotescu@nxp.com>
> > ---
> >  .../devicetree/bindings/hwmon/microchip,emc2305.yaml      | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml b/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
> > index d3f06ebc19fa..7bcadfab9fc4 100644
> > --- a/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
> > +++ b/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
> > @@ -54,6 +54,12 @@ patternProperties:
> >            The fan number used to determine the associated PWM channel.
> >          maxItems: 1
> >  
> > +      fan-shutdown-percent:
> > +        description:
> > +          Fan RPM in percent set during shutdown.
> 
> This sounds like something generic, that other devices might need and
> should be in fan-common.yaml?
>
Thanks for the feedback.

The property name was reused from pwm-fan.yaml where it already exists
with the same meaning. I kept it local to minimize the scope of the change.

However, if you prefer it to be modelled as a common property, I can adjust it in the next revision.

> > +        minimum: 0
> > +        maximum: 100
> > +
> >      required:
> >        - reg
> >  
> > @@ -80,12 +86,14 @@ examples:
> >              fan@0 {
> >                  reg = <0x0>;
> >                  pwms = <&fan_controller 26000 PWM_POLARITY_INVERTED 1>;
> > +                fan-shutdown-percent = <100>;
> >                  #cooling-cells = <2>;
> >              };
> >  
> >              fan@1 {
> >                  reg = <0x1>;
> >                  pwms = <&fan_controller 26000 0 1>;
> > +                fan-shutdown-percent = <50>;
> >                  #cooling-cells = <2>;
> >              };
> >  
> > -- 
> > 2.34.1
> > 


