Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013046.outbound.protection.outlook.com [52.101.83.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 607FC371881;
	Thu, 30 Apr 2026 11:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777549685; cv=fail; b=aA+kQYE377nrK0772PfJLeM29oc9vxl4TYuaIBEPCdm6RWTxJ5Ip10pJ+fpx9eCsGXW5F/8RRAZZkihAs3Jc2xV1qJKBABQa2MycxgPv9wW4w8TdSmrrN+Zi2iofkloeImQMbX7cjiJQvQ7JfZWqb+rqGU/0zwUm9ghYM4GyaWA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777549685; c=relaxed/simple;
	bh=UvGpsMZqWBoRRN4/r7Xj+2AZqqc9CPlvO1qtpKRXd2I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=HZbo6gJ4AHwFZdywOA5eNo23/11rUdkopx8s8CHd5ZCleIUwQy45NNp1KESvxep8dBpoMG+3TQCxno2UUvkAf+AaXENJqDSm5P8oB1KzbC4ylQXeXUtfgIXzqwFbfAmT31Z82wJZ8F8TaN1pCXFHGFYYHjVWnjC6JrMUeAo4VTo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=pdGeWNsW; arc=fail smtp.client-ip=52.101.83.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="pdGeWNsW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cl2570Car9QARc+uV5RXiK7SVoDK9ttKDz1cm6Kmodv8DrbA2QH5mXNJ46J2piAX7BP4yRj4aZHkFQHtx1KT1t0fYgDxPXfA7X6hBP8QV/WBovc0XS6qgo1WpN9bunUNHD/EhHubA5S91pAeZWzYpiDQoNPwh/ELnhtBiXJ00pEbWkPZEkyMSff6wBJkoRvzG6Iuz8V3tVQ7Vp9OmBywzaW0AQOvx+5WbrqM+N880jFH71BtMZjt7fTL0M1BO50FbzvXdR945nM8bCbjY5J7UIYdj0rsbQ7CumI+WHDAFDDQufz4iXM93fi0Pp1apkEuH0tUavtbPRNRsmnnj8JZCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4D+SfsBkb/gwxrltdCGwyKRdBreXnVHlaYeLC+TBIDU=;
 b=GEoHAHBA4cHQ9IGP8cii8km64sCdi2SAc4dk23zXUYtyPpgXJps1ZU2QetffCKmuWtEcHJ+FT3HSHxz0QF4GPKw84h9MGwk5LWIJ3EcLBTTRwdoXt6RbLPhl28KZ7YynbHYz/qpsnZRiTHk5xva1xNlOA4Kbxy3/Lbp81V+5Vn7fi86ISisK6FKf6Uu0YALFLdX9KfwK9FAkZpl9ebJm2gB+3fVWRyednb11VISCnWLkcKUNPfO/1up5JvqM6Ajh2are2GvYqJ9G1u4DvX0b8A2EC5rOgTVSHt/mwFHEW6Qy+KE5IQruqyV/kvRqTy4eEbiZ7oBTUED0CMMahfMPAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4D+SfsBkb/gwxrltdCGwyKRdBreXnVHlaYeLC+TBIDU=;
 b=pdGeWNsWKl8vVaFkRFFcyljJyD0yVhSGNiPeYyr2mGaj4dCJ9eoe348mCq+TYcmhEmx8pdM3i2oUiep/wAm6mA/nVvYQh0gm+BMwS6FCHAJoszRefGhdCtDqRh4KoTOm/t6bmjijH1Wj6BZeVjJaanqjqVAiux8ueGJ/EzaDAIdlygA2+ojdPhhg7WucVAu5vXDxet6VHj7SyyFpUu5onZIz1XBt76XA41ugO3YXeJPTwfwYorCmadfRjUtpf0vZaiV9u1uIttkW8/Yei7oEtngwBwreEjCooey60Z4FUmoJjgmlm81aHpqulA//BnoJQ2uBcWA3I4STKxorkAwYtQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU7PR04MB11163.eurprd04.prod.outlook.com (2603:10a6:10:5b3::14)
 by DU2PR04MB8645.eurprd04.prod.outlook.com (2603:10a6:10:2dc::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Thu, 30 Apr
 2026 11:47:59 +0000
Received: from DU7PR04MB11163.eurprd04.prod.outlook.com
 ([fe80::93f5:4ff3:2f4c:183a]) by DU7PR04MB11163.eurprd04.prod.outlook.com
 ([fe80::93f5:4ff3:2f4c:183a%5]) with mapi id 15.20.9870.020; Thu, 30 Apr 2026
 11:47:58 +0000
Date: Thu, 30 Apr 2026 15:02:43 +0300
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
Subject: Re: [PATCH v7 2/3] dt-bindings: hwmon: emc2305: Add
 fan-shutdown-percent property
Message-ID: <afNE46C7GBswP8LG@ro-kernel-workstation>
References: <20260429065955.2113012-1-florin.leotescu@oss.nxp.com>
 <20260429065955.2113012-3-florin.leotescu@oss.nxp.com>
 <20260429-shiftless-docile-e57509e967c4@spud>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260429-shiftless-docile-e57509e967c4@spud>
X-ClientProxiedBy: AS4P190CA0011.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5de::13) To DU7PR04MB11163.eurprd04.prod.outlook.com
 (2603:10a6:10:5b3::14)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PR04MB11163:EE_|DU2PR04MB8645:EE_
X-MS-Office365-Filtering-Correlation-Id: 3dea9469-f91a-41bf-0481-08dea6ae531a
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|1800799024|7416014|376014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	sPHHNJznqfkSTIqpTvg/O8U0aOjASBzLZnCwdUaCLnJP2ZdypAiKDxYymYd1tnRfM3twQHpDo1eiWqHWFeECwTaPjRAq3oaozXGJPpmwVm1axfHE/4tr/6RvOxuPjrfZ4lVz4ImnENBkR0i04OMjo26AIB0Ua+dCQwJrvL6mDDcWKtoKTqHI1KJbNddp7aQxvl2+CGPu95aFk5nrPG/ea5+hM9lOGoxg4dX7qtk1qNjd3i1pr8VUeuiHKwfIQZYj7naE8DS+0MkIqYrHQZ9eYHdlZOYRpwLnLYPbtPtU8jWPWAd8VjsXQBrR3LMoqNTbUCP39pHhZSBOBgKyheSYBsSLVmxIGYJR5oi+ECb6yVeduipyObm39NXGNmI3jEaU8W/Fxp2gqipAGfl19RR4HtNp9zF9Sx1RDR+TfhrGE7i71P+p+es5KGmUErmVGxwuefvRJl/C13gSapzAq4jmvcDEVxwVjugi4BeaXm/RBi41aEAUM8nQ4GMKh5XV/J5bPMKvMWi7Zys+gkTxE+OUEHprlqVYSgTYrx2mm+FvhOnloSy0hKnT0pPFDk+jLR84y9HEHp9/JNDWY2EaxSnakwC0ungVbYWq4nwNj4JThEvOyIsN+cWLjN3fo0xNyYnoaBP9R8Bq5EUFT8H8lqTgDKw4gaqiYGigNQHPm4kTDU1elJBfTyAzJgBLo4cXVMMU8fTzxzUBiH1IO+197Lx2JAWTYvWDlC8ByHQdo7rUGE0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PR04MB11163.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(7416014)(376014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6PTWV6r8k6DUgfjLaK96HNhNkLHr1+Jp0l/LLcmd81cdKwjHMgBqyYAvBSZ0?=
 =?us-ascii?Q?JU9ekkKRDYuiUD0IYhu8N9f0upYlkR0aBgIwcm2VPBMM+I69MOZaRirGKX22?=
 =?us-ascii?Q?g0qEyxAMOMsUFq8g2w3JqZY2j9LqS36P/MZmprBJRTonQlDpCuOALhObKape?=
 =?us-ascii?Q?sV/SjUne1MKuewaFYPqzBC8gNiqJ2eh6UU01rl5p/srZxOWeL9PEomf+GlHr?=
 =?us-ascii?Q?yMa5cIqFfwL7+JgoV8yHClZ/Ehe0oZ3vu4z5nd483Q/mKagTGb+yZcVH/kPv?=
 =?us-ascii?Q?xwARnN4efFNt/BlsIjpR3xFUZMnZ9+TsRGXAYy7qu51z1zxxtpfEpFXWRvE6?=
 =?us-ascii?Q?VXZIWFyhq+toraL2ZJT0Vexw6SPYAIOWPM30YQeoXjzPUd/2FD/1QFY3WW6T?=
 =?us-ascii?Q?VUNaF4MWluUvIASvemv/dl8uIhQls28jw6nRv5IiIPAcSQgA1EzkTOCidlUg?=
 =?us-ascii?Q?Si1qOUkln98Y6XuBaumJlmEn8GMP5HfZOlN8YNTgqdHiRDWl1/e0EhVHDIYp?=
 =?us-ascii?Q?eBSuT7W1DidCBuOElz4p/1FmgwIElnyTpBRnZvC9ELo21RO4DroAEB3cH3pU?=
 =?us-ascii?Q?1DyVwVQCN0qY/P39cVfNL6eNCvCdKxGa7gLHUtBuv4YXSkBBmhefhippMU0C?=
 =?us-ascii?Q?Eeey/KeXNj/60yQXRdQys13zDGYophLl/nekfRl7C7KS8xZkGldDE7yOB1Ug?=
 =?us-ascii?Q?m3ugh2XjHdfqmzWCSQ8niGBeSNIzcOc4SEleZKdzLpLfRzZxr6avgCsN80OM?=
 =?us-ascii?Q?vxxcey6qSR67X00vtKyciPT7yvg/7b4oobaXpWuCbsjfMqHVheCHSq2KhOnI?=
 =?us-ascii?Q?ycW/09dVcZmjyfQeKQuMHJeZU9a9hW5T4WyFvC2xN8o95zFAXLmyyaiIQuzo?=
 =?us-ascii?Q?iHAAm8hgSDYqt8vDqLS5mYhs7cokuotrGDkEblc2zwVGBRs4EojzubZLSZaM?=
 =?us-ascii?Q?+RxHTzgUyXAeSt7Qfi3RUIkiewdCLYCVqOcIAtLWm6gJwgbMyMhs8yufx7yc?=
 =?us-ascii?Q?k2466lcKDc9zfxsIdWoQPoVTagCSkh44Q4K2CDZNkjdysZCX1k3yo9KttHee?=
 =?us-ascii?Q?p0fgwnuQsEoXNHI6R/9nXqdn/taZMNJQsiIDCw9SuPMiEpZucGvmGH+RuVMm?=
 =?us-ascii?Q?x+/+m4rehZsUaN4DiG4yym9VwCKl3AB4/s4uIISo1fTQCXzplJXdII9HP0FL?=
 =?us-ascii?Q?2KW46MVD599A3lqNI9m4HElNjIKNjXAhvoIUm6CEjapt8HvyNi4KF2dW4Ug8?=
 =?us-ascii?Q?kkYSX46HEsX5QJvw0laDU8BpZ7lolBM9ve4O4Ul2vky/djSza6tu1GqKcWqm?=
 =?us-ascii?Q?uD8MkjVFY3luoWjtskbgE86Kf0IcAi7x+nZPvaczb5ETeSUuQy8P3psJlh4Q?=
 =?us-ascii?Q?KPZIWh/iV5NmLPZqS1UfzH+mEbt/JqZlK0phzARkWNIkBCWs/dw+khkxWvoO?=
 =?us-ascii?Q?zdRo09B+A87KOh2mRGCLdhKn6TT/wc2ETQL0PvADC2bJWdpA8CNRhi3eBVGv?=
 =?us-ascii?Q?4XoDVu4p7/v7jRsJnddl50WhjuCLYQK9lCJhRHZxDZ/inE/CfT9byXqQs9KJ?=
 =?us-ascii?Q?B8iq5VI1ZqFjMgYP2yFFwnSCqBIBAq3m7o8VimbUBRTUcWTeXHZBYURccz4n?=
 =?us-ascii?Q?OOBlMcwfY7x244AaPLeMJh1GAy08QQTJWsdE1X31kCH0usqv4mtGnWNsxhGU?=
 =?us-ascii?Q?euRH0imCblY8Ab5FwyEqLnabRbxzedx3JK/ee6UiLlN+Jotpa642dfVdBb6R?=
 =?us-ascii?Q?rujSPkDe5g=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dea9469-f91a-41bf-0481-08dea6ae531a
X-MS-Exchange-CrossTenant-AuthSource: DU7PR04MB11163.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 11:47:58.4989
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LGIVdAE7CWA8lZDjq0c3IU8tf5Eiy3UtuB1Ft6sgU296ptGEotJsihtS1LYbMRrV1kuN99k9g/e7iraSkcZPlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8645

On Wed, Apr 29, 2026 at 07:18:04PM +0100, Conor Dooley wrote:
> On Wed, Apr 29, 2026 at 09:59:54AM +0300, florin.leotescu@oss.nxp.com wrote:
> > From: Florin Leotescu <florin.leotescu@nxp.com>
> > 
> > The EMC2305 fan controller supports multiple independent PWM fan
> > outputs. Some systems require fans to enter a defined safe state
> > during system shutdown or reboot handoff, until firmware or the next
> > boot stage reconfigures the controller.
> > 
> > Add an optional "fan-shutdown-percent" property to fan child nodes
> > allowing the PWM duty cycle applied during shutdown to be configured
> > per fan output.
> > 
> > Signed-off-by: Florin Leotescu <florin.leotescu@nxp.com>
> 
> Why didn't you pick up my tag from here:
> https://lore.kernel.org/all/20260407-slang-scoff-795164352c62@spud/
>

Apologies, I missed your Acked-by tag when preparing the series.
I will include it in the next revision.

> > ---
> >  .../devicetree/bindings/hwmon/microchip,emc2305.yaml      | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml b/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
> > index d3f06ebc19fa..8c2548539d7f 100644
> > --- a/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
> > +++ b/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
> > @@ -54,6 +54,12 @@ patternProperties:
> >            The fan number used to determine the associated PWM channel.
> >          maxItems: 1
> >  
> > +      fan-shutdown-percent:
> > +        description:
> > +          PWM duty cycle in percent applied to the fan during shutdown.
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


