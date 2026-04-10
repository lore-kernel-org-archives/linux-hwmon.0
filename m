Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010064.outbound.protection.outlook.com [52.101.69.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F7C331E85E;
	Fri, 10 Apr 2026 02:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775786456; cv=fail; b=aYMqBvH88ct7FRizXauFhAUzXpgSEKaTAg1G67dZpgwt7dB8SZg2do4OzvMU1pqATIIBqTbV7N1L2AWKL4TfaVWziYs7JeUhdL6WDu9PGwRmTD0XZmd0L8ZsxehGDRV4fucw90l2wDkqCoSHuFesqBbxRLXid0DqeUY5w85F3EE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775786456; c=relaxed/simple;
	bh=JvITRfJ41XFY8qrYJ3OZ1ve+d4tOTfXRivLQrEq2XGg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=S1Yab3JH7IIPF6Vfywv/QEEhVuA0r1U9LNeOPoUf7x/II5dC/RhaBSiYs8EUjXLlt6vEn32J1GWeZgwsGgFKZVNuykzVoEs7tD51lhbdQ9p+og38+I575kdrmcKlXw0LQR7/L7CVxZtUlvov8/qSr/YjYjrPe7W9SaBHArLOk08=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=iD/h/0Ir; arc=fail smtp.client-ip=52.101.69.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="iD/h/0Ir"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fNe2F5/N0ckjMKM8UqUcgI8tEHXCJk359OCg/5CARTF3FUzOYRjYwo5cFH6oKDmLT3xA2XuQ/mT6JRkl4YRuTdblYRl2BsVu4OA/PMb19vkhxrS6jO2eR9PZSQDbH5xcITeKa/VEUHkkjGZAR9PWrvZG/knbfswkrphh2b82+UjFgMyve6Lmd/kepIXJdKUDIXyfJEs6PO62UAS4GBkj9SstpwiA33sEk/HICPF/O++VRafg4bQzK0pPRPTHmSPqn5GLXGMr18iOtb92JF1r6urT3upoPIUFrzCmF2gDjptWICGqCGzq+ukUH2gRZ6CErkaGrsogA/fwlS/vW2wGlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/3V6CHSIZ+sJr8sL/vGdO+JnQYM3ITy336iawgRLdSk=;
 b=IcOCVmkbfu0rPHsaYsgqzndnsovSqs13do0NRyMnqXS9h+/vDDbAWQkgXMZCKj3/1bt5KOgTCOlLfnSVwkVqsT2zfv5Ehw3ZCGW91/LCnQpT/tSic+/JjV3l6zb3KA3Va19QFBrbN73TaXMPcJm6dNoILyrrn2IVY8mZMHX48U+uOv1LCocnZmjHa9+x0TGiF6D69jXS0XgYmsKkg800aiW26yYdGDAHlj+SXtQzJ6U1pW6HP/PTbnZKgZ3fdZ2u70tmmDLv5qUJgaMrXTebzdydvus28ci8fbnyMFotUiFmACUBuVnz/jaqXd3hEQlq0B4rm73havrbHHLn8/k1xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/3V6CHSIZ+sJr8sL/vGdO+JnQYM3ITy336iawgRLdSk=;
 b=iD/h/0IrOwK8OvdLe3R6QvquZDgH22lNMH8GmMVVJQs1bH2zXTPcBo2tqnoEyAwLfI5480WiULSZpxiCOgKZAs6a4M5GbtTPr7m6TXmaz+imakk+551l0/hiLz7pY2VKUKOzZhWN3/ss0nomqRTOv/3Dlq9olsARqs4Kp8A1hsmXcgV1cD+lZJ2hiTrBSaaiXQgXMD3qhMDxKv5/2vBjivgBS8806173ZzLp+ROPCFHaxXJtllElaFXEi1R8hQu27YsIDxusJOrUn2kJpLnxVaIKnxC65k1n0cyT0QkLL9840O7AJnQnTPnvCW1b550zsM7N6NxP5Yy090wduZGjyg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AS8PR04MB7526.eurprd04.prod.outlook.com (2603:10a6:20b:299::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Fri, 10 Apr
 2026 02:00:50 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9769.018; Fri, 10 Apr 2026
 02:00:49 +0000
Date: Thu, 9 Apr 2026 22:00:39 -0400
From: Frank Li <Frank.li@nxp.com>
To: Akhil R <akhilrajeev@nvidia.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Robert Moore <robert.moore@intel.com>, Len Brown <lenb@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Eric Biggers <ebiggers@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-i3c@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
	acpica-devel@lists.linux.dev, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v2 01/13] dt-bindings: i3c: Add mipi-i3c-static-method to
 support SETAASA
Message-ID: <adhZnNozqpW0DaXF@lizhi-Precision-Tower-5810>
References: <20260409105747.48158-1-akhilrajeev@nvidia.com>
 <20260409105747.48158-2-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260409105747.48158-2-akhilrajeev@nvidia.com>
X-ClientProxiedBy: PH7PR13CA0008.namprd13.prod.outlook.com
 (2603:10b6:510:174::15) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AS8PR04MB7526:EE_
X-MS-Office365-Filtering-Correlation-Id: 75c6e0f7-1be9-4c84-152b-08de96a4fce2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|52116014|376014|19092799006|1800799024|38350700014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	t/4A9tRx5eRLVcyZmAdmTOezRFhSJRmEGSmciwemUn1sbc/MM1wLRgjZWeMYfiIVdG+6dnwsst1912JtiC1h67Jb/KM8gGSyAqueGeym8w+/8FGTFeFai4m/L12giSIY9De64FnfKD6mOn2TPPkfvmeEF1CeqkW5SK3HoMGUawxelFODwsWd70WwVCmrWvVRF4Bycb5mpvXTNDaxSIOQjMy8sTrk0xKCI54TSxWwhFX90UFC3KE7FU9wiAkZvVKeD2qgz59+0mlbynWOncOhnKUFDJ1x7PxnQ3lVE/g3c3wAuM63+aai/EpSBZ3e3zZAYHpG6T5i/LM7uEo5MBN2+AwSlJq12IWpEyzDHeXxL4uWr8XOecD919A/eFyaWcpsEePeCWlNYPpphaP8CtvORS8eyWAExShT74vQwIzroULVOQeyixAD6qS9Q9Avp8oF/9e4MzUhBa5OsVpMwmItdJ/NDidB+wDJSzyfv2YQdcEfcBWR9Ji+Im7piojkgI0sugJLauE+MxRXyAofLp0yjB3AW0h1f5ju4pwYUzMz3a04/ru7KxuAvrJC4UInifhXwz3bPG5J6dGnbLhYIm/6/OheWNJ9JzyTSIYLdWvTMwjmfgeHJjhL+s5/9bdXVVPAFyIIKFlqc1lp+jXIoBfo5VWTD+LWoQFrwNDJC0ULN5SVMfIwM/cajBwV0uAdk/rm0v5nj6UPZbuHgzTf1VPrPXrRUekcnm47frQoaUSaVFfVgni9maldBHfhkvr21P1/
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(376014)(19092799006)(1800799024)(38350700014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+ui5M3IhphxLpfdOMk1Y6XVqnOrT2nq2t2dqXrDU8/PgGSedu/SbCiaPff+y?=
 =?us-ascii?Q?8uAzYjp5PHZbXkoEudtCvBcXzQTkekB+wUtdBQHwFeZE+XwKGKn8wfMtnOj3?=
 =?us-ascii?Q?272VlkbR7YgBxwAvqS56Je842ntxXGXSWpiisU0vBYx1vFC2+Z4C73IcTvJm?=
 =?us-ascii?Q?QKutizZIDBsk+bpHUOPQtk+RwISQ9OtZk1kjyOq1UpA788cg2VGRieFLt53s?=
 =?us-ascii?Q?fpG/wbm+shO1zQB1/Ys1M8hI1IbCekRwarNPrvD0V8C63Bs36HWg6Shy2YgX?=
 =?us-ascii?Q?V8IwH6/K1uQhF2fgYKSwFlL4k7RlJxT/B2OxokAczrESF1TtTYR379Tng+kK?=
 =?us-ascii?Q?azqWdJVg58h07x5m/cYkrOFwbDZr3pd3ex71dViVYM+6Z32+PftrWF324qIm?=
 =?us-ascii?Q?y0nA2NIr1uykqXKxXdB45g9kgxdhUPk+AOV7vwKKVW6MK5a2FEPUzO4U12nK?=
 =?us-ascii?Q?C424PYfRiUUcu9pg4WCHfaoCqtO9q20sBcqqv7U8wBc0p0+7IzPxFMgbbBFH?=
 =?us-ascii?Q?IHuTFf16pk7XGsqSu1niFcB5ZtTBcsXu674MYs3tMF7c6RgBwmvBW8hoIuB6?=
 =?us-ascii?Q?N9Fc4QATEu0Jjvn+j3fLC6CPFqa/Xj4xg6UTI3FXPl+s4UBk+ai9eQLbuT2c?=
 =?us-ascii?Q?FAHXF/scKM1YD4w4Cf/UFg/vgS+jvjVZ+5t0yyCSfnzdSyNZBAiFvyvUyI4V?=
 =?us-ascii?Q?jnJ4MGY6hSVcZwUYaIN4ahuMBZn6IjKqwHuLjUHz9VTIdMATnqlWhe1QFm1R?=
 =?us-ascii?Q?suzSFhqPsVMiWdWq1rw368BueCBUP3XMSZ9Nkzh5lR73g/j8PCuwHjTRd3zT?=
 =?us-ascii?Q?CXViycwJEJDU/uJDMdgyz1UrB11HIZMQCIz+mSHreEiYk8/mi+OA6yU0PTrp?=
 =?us-ascii?Q?zFhJ73jAKzmt67/zuyEcfluC1/c+9ITBIyNtygEVqL9r4K5SX96bCb0yOALD?=
 =?us-ascii?Q?Yf+R3dgVSvutOEafOx4WqMo0ByUZ9TAAuHbbPZMzVzHumdFvtB3UYzwfTqzR?=
 =?us-ascii?Q?aM+r9fyDOVbd+CkelyHB51+P85AdcCJ07+W4y9BAdTsmBcp9hyo8J868kVAQ?=
 =?us-ascii?Q?h4rFBWqJqjaSHgCzjnlJhUyhJ1BLwgUPgfZ1U4LOf7ba3XLCRPs6VrTNkugI?=
 =?us-ascii?Q?nrNwE/MIWr2C/Vcg/g0DiNkG6OcyaZ97KUawpWu2LajoIzttpippN3HigtIK?=
 =?us-ascii?Q?HI3oe6mX3StKWMv7nsT1w9mhMiRDrZ8JqLi1pg/vgfJ3JGhTSzAQe5b9sglr?=
 =?us-ascii?Q?ftWwBvgYKGlKEqE/VaF3A/0MQoIZuaGzwKX7FUOSxDTqw4H3VQKkWG7zpfOJ?=
 =?us-ascii?Q?1xYz8fMIq0kYjbCq86oTkSxpM1iSiPtD0wZN1NOWqk9rVWl+5p9bwHHrYLIM?=
 =?us-ascii?Q?mJ0JvaXVj9I4luiPZ9H8YYPxx7Vggz5OQv3nb5HFBT04mWEp4mqyiHAN38ZM?=
 =?us-ascii?Q?LTXLO8OK1boycdPBgubKCPYRmym8MILEpWdlUDDWjq1QCCxv3eDJLZ8RBaIX?=
 =?us-ascii?Q?YFt3LeP5+WKLjS3gwK1wSYdoTTwuVsmtjVwMxmXEDKCrDhxCmkcjdaM98cpX?=
 =?us-ascii?Q?aTs9+UJuiK+br2dWaD6q5Zpaz+SsdvbTVlQODl6s7h0AY9hE0pljrMGzxemm?=
 =?us-ascii?Q?FNv8rjpJ1dQNNkMbxuk98S9zZuUq/p/0LClGxZRtuw5skQn0cYQ19O+t5ksY?=
 =?us-ascii?Q?34kKRmSjP6ORu4435QwP3HNFpTyh9KKTLYVvKqn5rjurBCB0vnwejW5iRVwL?=
 =?us-ascii?Q?dAFziN20aQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75c6e0f7-1be9-4c84-152b-08de96a4fce2
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2026 02:00:49.8861
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4iIv/IYLiWDS5hQe6RIK81zIWw72K8eWx3F5yVfNeSW12aJ/PfAjpQKCBCmDyBbWnPyIS7qBeMb3uh9IRkHIHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7526

On Thu, Apr 09, 2026 at 04:27:31PM +0530, Akhil R wrote:
> Add the 'mipi-i3c-static-method' property mentioned in the MIPI I3C
> Discovery and Configuration Specification [1] to specify which discovery
> method an I3C device supports during bus initialization. The property is
> a bitmap, where a bit value of 1 indicates support for that method, and 0
> indicates lack of support.
> Bit 0: SETDASA CCC (Direct)
> Bit 1: SETAASA CCC (Broadcast)
> Bit 2: Other CCC (vendor / standards extension)
> All other bits are reserved.
>
> It is specifically needed when an I3C device requires SETAASA for the
> address assignment. SETDASA will be supported by default if this property
> is absent, which means for now the property just serves as a flag to
> enable SETAASA, but keep the property as a bitmap to align with the
> specifications.
>
> [1] https://www.mipi.org/mipi-disco-for-i3c-download
>
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> ---
>  .../devicetree/bindings/i3c/i3c.yaml          | 30 ++++++++++++++++---
>  1 file changed, 26 insertions(+), 4 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/i3c/i3c.yaml b/Documentation/devicetree/bindings/i3c/i3c.yaml
> index e25fa72fd785..1705d90d4d79 100644
> --- a/Documentation/devicetree/bindings/i3c/i3c.yaml
> +++ b/Documentation/devicetree/bindings/i3c/i3c.yaml
> @@ -31,10 +31,12 @@ properties:
>        described in the device tree, which in turn means we have to describe
>        I3C devices.
>
> -      Another use case for describing an I3C device in the device tree is when
> -      this I3C device has a static I2C address and we want to assign it a
> -      specific I3C dynamic address before the DAA takes place (so that other
> -      devices on the bus can't take this dynamic address).
> +      Other use-cases for describing an I3C device in the device tree are:
> +      - When the I3C device has a static I2C address and we want to assign
> +        it a specific I3C dynamic address before the DAA takes place (so
> +        that other devices on the bus can't take this dynamic address).
> +      - When the I3C device requires SETAASA for its discovery and uses a
> +        pre-defined static address.
>
>    "#size-cells":
>      const: 0
> @@ -147,6 +149,26 @@ patternProperties:
>            through SETDASA. If static address is not present, this address is assigned
>            through SETNEWDA after assigning a temporary address via ENTDAA.
>
> +      mipi-i3c-static-method:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        minimum: 0x1
> +        maximum: 0xff
> +        default: 1
> +        description: |
> +          Bitmap describing which methods of Dynamic Address Assignment from a
> +          static address are supported by this I3C Target. A bit value of 1
> +          indicates support for that method, and 0 indicates lack of support.
> +          Bit 0: SETDASA CCC (Direct)
> +          Bit 1: SETAASA CCC (Broadcast)
> +          Bit 2: Other CCC (vendor / standards extension)

You need define at include/dt-bindings/i3c/i3c.h

Or direct use string arrray
anyOf
  - setdasa
  - setaasa
  - vendor


Frank
