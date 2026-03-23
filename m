Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012064.outbound.protection.outlook.com [52.101.66.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C45129993D;
	Mon, 23 Mar 2026 09:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774256887; cv=fail; b=AfCJAadAOqiMjvDawOScses6t2cFVRdRjiwQ+RzuO71rWXOA4NQE69S8y9PSvPRUmQQH2BcHsMgoCcrCaJpZ1AVCGw/rCvE7blVRU6AgVGxGpjzst5L8qYYaVAWLnsTFaG3mCSGvdYMLr2eVMx/C6HACwD0M3I0Nb3lebrHOHmI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774256887; c=relaxed/simple;
	bh=aj68d4lzcmTu1wry1ivRPDy4/bRW4WKJvK3EU7kA83w=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=JA+XgyOgcLtstIBOylZOL+OBfaxgINSx+4LHvalXePSGEjXPBRkRPIpT4W+LwE5uoN8oJpaa69gYIAthd9yxKrSRaRDBtnA6eCIv8XL2g9oCBsjgOY/DGRokHk8fFeUm+atmKFp122POY4IqWjjBmDm8FCag1yZdfBk4BUsG44o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=PvX9g8Fs; arc=fail smtp.client-ip=52.101.66.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="PvX9g8Fs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iK8Ygg7MXZIqsg1u6euaXRheAj/I65oixQiZqGviED4xCcBYlS4Jb48onTpHMcgavSl0H+eqId5HOlq4PZAmIOB5MDdmkoTnkCa7Tle8UZch1PegL0iErzGMlxAIrWLnPgB51k11kGi3YcDqmJi5b0Pugmtk0pSvKjDIz0ZhDggkXkvqBVk1EThQ97eU6/2LPmUwrYSBRJY6lNPk4Xrh0Tk6qTlz8w5e07sAz+i6EPDek6j1ZYfKIrCL7EnN2gWZ8km/LsKzt9dC0XRn/Y1s5bwgHYJAouAsjks+Fc5lGh/a0tO6NhEHv24d/bTa3CRsPnXnTRCaAjzLf1wx+WnoqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r8V6Eom2rViGFebEUish+pLCDRvroG9b1wDJZpMW30s=;
 b=F2jQvHf/hFz8MUUTbt4mrkayqZlQPABWrAHl14tkVIRsgjqw58QhbfqYqmSaE7U6i0pXVdcM06UMM+l6s/CmJVakC5S91w/hgBmRM+g1rla24+HfrnksV9H4jD0Q9riPylWG/vZyOQ03PQeTmZhnjOIy6r0kyufEw4uQbXuI3zNP51kOZeC/CAIxEv6EEkBu1uTKKe9L4O46yfp/ggWs0n+R3Ry7slYPPcIA4gYWff4KGYfcZu4jcjKs+tFkFOpH63l611Ger40slU2l5q99qPp21+PznWiW1qyI0KXHDa9mDelc490XUWSq9LOv9EkZRxKJARoNXXt9XKjf7FEnig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r8V6Eom2rViGFebEUish+pLCDRvroG9b1wDJZpMW30s=;
 b=PvX9g8FskLS7PnVwUOwS+zJyp7IKSxVQT8+tXET/auJZrgkPQCxWjDBG8hWgGD/awrED13Ft1lxTMoSTeK78gn7cVM+whMJ+sCiNJoH8BBIMMBajHdqe/joGcT4345GpoD/aeMVlSpwXdq5cwSrMqLLnCqiIVDhwrWDLj8MO/fFu6CP19BH0hC51lapWMj0T4VELYYnH5kswZ+jsAk8H7btPLhRYf0x+zU6C1A+7EN6xaJrnZ0HmeCGVR7yTqxTHp6y/5yMHkmGoaye2vKPFb3LJ4Ak3TTJvuAyqomI5pSUfg5NkUqrqfPNHgpQJPSyPOS+ZM+OSusmNNGQ1gQBIAg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com (2603:10a6:150:2c6::8)
 by AS8PR04MB8279.eurprd04.prod.outlook.com (2603:10a6:20b:3f8::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Mon, 23 Mar
 2026 09:07:34 +0000
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4]) by GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4%6]) with mapi id 15.20.9723.030; Mon, 23 Mar 2026
 09:07:53 +0000
Message-ID: <8a8d2991-cd85-4aed-a7ef-a90b0cd10fbd@oss.nxp.com>
Date: Mon, 23 Mar 2026 11:10:57 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] dt-bindings: hwmon: emc2305: Add
 fan-shutdown-percent property
To: florin.leotescu@oss.nxp.com, Guenter Roeck <linux@roeck-us.net>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Michael Shych <michaelsh@nvidia.com>,
 linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: daniel.baluta@nxp.com, viorel.suman@nxp.com,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 festevam@gmail.com, Florin Leotescu <florin.leotescu@nxp.com>
References: <20260320152959.1575978-1-florin.leotescu@oss.nxp.com>
 <20260320152959.1575978-2-florin.leotescu@oss.nxp.com>
Content-Language: en-US
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
In-Reply-To: <20260320152959.1575978-2-florin.leotescu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR02CA0113.eurprd02.prod.outlook.com
 (2603:10a6:20b:28c::10) To GVXPR04MB12316.eurprd04.prod.outlook.com
 (2603:10a6:150:2c6::8)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12316:EE_|AS8PR04MB8279:EE_
X-MS-Office365-Filtering-Correlation-Id: 628f04bc-e26e-48f6-971a-08de88bbaaa0
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|19092799006|366016|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	DGgeiRdkwuWL7gGvKzzP5UOIfJVa7vts/ZvGXKBFxLSYUTj1vvK6aNtFP/gLq8hsAZKXEL7P8rNfITaFGA1iBPjnMMdgCogBByVuzSNtMGXu090RQ6U5lDnlfPjGcUtNQTUf9voeicgf9jRZCKIQaDL+fixjygA3ApoFz8ghbmNkCsm9xLUM0F502nJ79gMR7oxUSh3QluAEcCOScaCIvJi1fJK+OQLopGny/qI4Xp1Q/L/l9NQr1jPLwyUrU4friOCbAEkj8baoYSjjkrJ43ICe442JE3d1oueiMI7fM2Z9gp/cakQ0kPwJG1LUxSKTFzhEa2q72iyY1Krx4ukbMDzMaEWMU89h4QHWY4IBG2zWRPXC43jhXrLGOGAsP4A2BAycyjO2jybnpST0cH/LXzmFrJM7tQx8hvwH/GaMYfoshvEfaf1lPrNOGQ3sv+rzoaJWCCD0m9LFFxuwRziZU/gjJ0Ko2P+2sXMZfMsZoH/v9tmbRMP8KOK3oDG3NKWVHE5XH+YetppafehXw2DIhyPgkb+HRk4K0d5W10JJ/ALJ1PxkAQiiLkXSy8dmF1xg8VHYxBomlDVOBrWMYx2g4IqkT/h0arohaczfdWmgxflRY7Cqu1FaJk0ygildTauzQQM1cWRAYN2p73xI61onlgUpmAZ3xTdWv5Ta6oVPZeV1vUT03ierP7eB8a9+KINcQAT4XXa17Fp5d6pTUfNI6TzAWSjrwxkkVOb7Ow4kgYU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12316.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(19092799006)(366016)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RW9MOHZuMWdTUlVuajF4MlBVV0RCQzNDc1lCampDZ0lxejJGMGdNUVZ2TVM3?=
 =?utf-8?B?MTgveGNWbTZ4UG5aVTVEbzA2YXV1VXFpa0lsQ1FNUkpiWGtxTmFaNHVqMGFX?=
 =?utf-8?B?TExSdG1sM205N2xTdXdZT1BzK2lMcEM4U2dVZ2d2MFhHdmUrbWg0dkZsU2hK?=
 =?utf-8?B?eEREeHlMdlN2SWpZQ0EwWHc0cGs3OE9mOXRPRjg3TXlGMWg0NSt0YVpNY2dR?=
 =?utf-8?B?Y0szRTlWckxZdWFmVnhQeVJYMFlqamZoNmVlYWNxam8wUGFRK3FIeDhFV1A3?=
 =?utf-8?B?dGdBZ0RXbzVyT3pWZzgrV3c4SVFFVk1LTUJoVGhnN1dOb2YrK3E0bW9KSFRu?=
 =?utf-8?B?bVdHK3RtbGE3MUh3d2h2cHNBSVQrVm9VVzN4OHZTbTFtOVJHdXdDZ2J2Mysw?=
 =?utf-8?B?bjJ5aFJaT1VrTVZBWDhKYmdyK3ZPV3hKMDNjNWVuQ2RmTDh5ZE5Bbjk2elpH?=
 =?utf-8?B?SCtuYnpJWjB5MXZSOXlZVTlyWnRUQklSb2xSYkVBaTlPNGVzWFJ4TTk1Ymp0?=
 =?utf-8?B?bGxaTmFsTFpDbllraUVLeWpUY3hFK3hWdUtENS9pN042MjN1RkhlM1FOTWZI?=
 =?utf-8?B?U0pvaW1hTWRMZUc1dFR4bzd0TGJ6UW5nNDNFMXIxTjIyY2RrMU9OaWxVQmcx?=
 =?utf-8?B?WmJZbll4Qk9QNTlHc3FZdmNma1poZTBkMmZieHp2YStMUkR4OWNxd1l5YnJ4?=
 =?utf-8?B?dlQ1QjU2ckJFYXNXeDVvbTlLb2ZaNEJmRlRGZUpWZU5CVTBiWnUyMXpVWGVn?=
 =?utf-8?B?bmx5eVZtalNMQUl0a0xLV0FuMkxZTjI3OHY0WnhvKzZDYWFEazJIaTl5N2pq?=
 =?utf-8?B?ZXJLcnl3M1g0ekJQNkhqM2R2QWhIUGdxMEo2ZUI1L3FoZVY1VFEra3NNRzFJ?=
 =?utf-8?B?RzNNSURkYkd5SW53TjcweUxNclpXU3dXaWV3T0pvVGpCa3ZCZUlRblJDalp6?=
 =?utf-8?B?clhuQjB5UzRWbFpTYzJxOC8wUTNVd2VDbHR5dFoyakZpUFhKVTI5bDgwM01k?=
 =?utf-8?B?Z0tMYzdxNHZwZUUxcHUvYUphRCs3eS83Vy9mTGJaYWtsd0VJUHMva1lRaWFN?=
 =?utf-8?B?NWxzMi84aFpYL1BheVBGUThHTDZUVmhLSlNZeTNhVGQ1bDRvM1Q1elJJQ1Ra?=
 =?utf-8?B?enRZZDBRK3pOemFNVmhLZGFoMEY3MkJIVnluR2hST2E2RThuWVFpOGExOFc3?=
 =?utf-8?B?LzllU0F4RTVOTkRCTW1Ra2hvM1J6NFR3QWRGOXVtY253Vmk2UStMYklvYnZF?=
 =?utf-8?B?M3ZrOWNTaUlXTW9RUU85WDNhc0xTK1lCTjRQdEhjWVdJdUd6K0U3QlVsZnhY?=
 =?utf-8?B?QWNRaEhYQWNudGJFV3FUNVc1RkQrNjR6VVBKZTBDYllqbUY5eGRqT1NZZzFZ?=
 =?utf-8?B?MjR2NW90LzEzVDk0K3FGNjZFVURaSG5lRlNuVnFGUTM5TUhybS8vZ01RdWo5?=
 =?utf-8?B?eWZYYytEMWRNZnp6K3ZSc0FJeURyTHFESmRvSTJ2bFF4bmp5KzNmS2FOMjlS?=
 =?utf-8?B?aHBsWUNDZ211TXRpUHQ1YThFc2w2Yjlxc2d6WDV6TnFHSGszTXEwUXZIOUZ1?=
 =?utf-8?B?NGIxV2ZmRm4xSHVjWHVHZHVIMHVSMUV4MmhGSU1hVlFlc3VtU0c5WmVhZk0x?=
 =?utf-8?B?M0JrVEE4dXJlZ09GbW94VitjQ3dqSjR4NDBYWnhTMlJHRmNPOEd2cXZ4Y0VB?=
 =?utf-8?B?ZzF3S0sybE1LWUNJVWdJcjdCZ3BVdVZucTUvT01maTlXVlZyTXNmQWFmNURP?=
 =?utf-8?B?M0RrQjJRS1YvV1F2S3VzbXZCa0dlVkloSUE0SUszWEhqbXRXbnl5OXFZbFZU?=
 =?utf-8?B?TTkrL2w3d3I4RWZzUlprZzNpYm1GSU9KWnN4MHlQVWNPY3hPL3FvVmFJR0Z6?=
 =?utf-8?B?Ym96REQxcWd4VEVrTzFCa294SEdzVnplR08veHJvT1VRdG55MkpVMEJoMjM2?=
 =?utf-8?B?NG1ESnI1TzZ3KzlzMytJdjgrQURzSXZHSVdhNkZZWjFVMTcwa1o4QithQWFN?=
 =?utf-8?B?NUFuSWpRZ1RQdTd1WVB2V2RJQnBkOGpIU08yQU8rNERrdy9NNUVCSTkrMm1l?=
 =?utf-8?B?ZmNXa3ljbmVjZWY2QmRKekJPWFU0YU1vakp2VmlENDUxa3lWbm5qc0YwTmlZ?=
 =?utf-8?B?NEd5ejdXTGpHOTBHV0RucUhOZXFBWUFLcEVkRGlIN2t0SUZVL09IR0hjdFNt?=
 =?utf-8?B?T29najRtSlMvQUVyTzlBMVBTY3BwMzYwMG41MzJUUW1meVhnVHB4TTdHTzRk?=
 =?utf-8?B?ZFRvZGxKQkpib2hHOVVXVlBNV0dET3k3SXJLRG41ZDlETTQ4Syt2ZE5pTUZq?=
 =?utf-8?B?U2VOYmhXTVp4MktGc3lDNjVNVFZBR3hmdThESHdscS9EaGRlU0FYZz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 628f04bc-e26e-48f6-971a-08de88bbaaa0
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12316.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 09:07:53.8179
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gy80enJ1JiJIV/7XvglR1s0QRIJ3ZSczRTaFOFb4MVOxH99O83vRlv99WydkmL7+FWuN11m/aeJlDTnFe0eTVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8279

On 3/20/26 17:29, florin.leotescu@oss.nxp.com wrote:
> From: Florin Leotescu <florin.leotescu@nxp.com>
>
> The EMC2305 fan controller supports multiple independent PWM fan
> outputs. Some systems require fans to enter a defined safe state
> during system shutdown or reboot handoff, until firmware or the next
> boot stage reconfigures the controller.
>
> Add an optional "fan-shutdown-percent" property to fan child nodes
> allowing the shutdown fan speed to be configured per fan output.
>
> Signed-off-by: Florin Leotescu <florin.leotescu@nxp.com>
> ---
>  .../devicetree/bindings/hwmon/microchip,emc2305.yaml      | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml b/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
> index d3f06ebc19fa..7bcadfab9fc4 100644
> --- a/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
> @@ -54,6 +54,12 @@ patternProperties:
>            The fan number used to determine the associated PWM channel.
>          maxItems: 1
>  
> +      fan-shutdown-percent:
> +        description:
> +          Fan RPM in percent set during shutdown.
AI review suggests to update description to 'Fan speed percent' or 'PWM duty cycle in percent'. This could be an easy update.
More important question here is how should we proceed with the following observation:

"fan-shutdown-percent property is already defined identically in pwm-fan.yaml."

Guenter, should we move it from pwm-fan.yaml to fan-common.yaml and use it here?

Our initial thought was to add have it merged in microchip,emc2305.yaml as it is now

and then factor it out in fan-common.yaml in a later patch.


What do you think?


