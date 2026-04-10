Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013043.outbound.protection.outlook.com [40.107.159.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC2D2ECD3A;
	Fri, 10 Apr 2026 02:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775788942; cv=fail; b=hpn6nN2kqkUJuYfcwn3Fa6zej+cDxw9lO1VwrxI8Lz/ZsVpt83MhaT+KgA0VWry7ZWAlq78WlVxeJwVEKa61XXqU+2DFtNSlruj1XOUVl6t8bK6DqnGWn6DLZlMZgfXQbeVOWXwcU5ih6OSQ8wsEPYUupOOMmjnEhDURHNWNvAY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775788942; c=relaxed/simple;
	bh=9vcoaU+V9cLRf3emFyJ13L+v6HFtNrlotDsU/hvTLJ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=t/E7XUvYReYtLYSTn28PIx5NIqzWZb57TIZiV7DdHPhri743sk9pFkWxQGpPv4dAfu7iDF/BzgG5tRkI7siplAz7tnE4gOvNeiDk/eq6pYNgkkmPvleKqKPLCMnO5PXP5YoX9490daqZe/qiH8PI8IPwTspTFZS1cYBiSfc6snQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=XZMEpWyF; arc=fail smtp.client-ip=40.107.159.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="XZMEpWyF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gtHm0Es00JV0CWjdMVUYP0gSfMpfkln5sntQJEJf6AjT6FNerJWOrAI7RFJwTAxZiG6aRJvyLUNAG7ZjTrflpb6vnyCW2q3z79zDPwED5+BVuVtAwx2eKBbQdpUyJJOd2QOkNGOh0MSFd9O5PQjzJ5IlEQrFIgkc/Djzu2bkvITxl0nTZteu4F1Higm1t06RTX0DUVvQ8+MHabcIgr41equOXaCuMBG9bMuKfGr8d/BTXmRiAGkCDucQjA2MtWe19YldMqmf3s0sU8/dZPQP3b41KSgnbrr+VrPTnnnhv2+MLv7OTowSV+qj64bLvSqxFpkUaBo4tceYiY1SzW3eDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pgvP2fw6ri2lhFRnCm0acPl/mOcThUlKIP8kjSFfVYc=;
 b=ePl2rCUyKXXswX5A5GH1dVLuJoKIwNu3rVrmc5Bl7GOK+GTNK7X6JdWKy5qmS8YZ+XoDuOx5MQKVe1/K8uNLdDLNDQp1FX+ocuRk+lXEhUSH5KY41tjaD/MFNfr2X8Qio3agBmRWZiYVroDp8erdo68DU9NV+NF7n0HLhL0Um3nzsKjPE1AyNMIaCXYJUw4xDqG7gMfLTsVs5VJFe3TDnCUfWUAIpoSEpgdfP5mJczXbgzYqh/wCqXh8yaYAhyj9oO0wWhQ8qiW7WaxRgeSTlZGiuqBSWP56OUEj8cCqE1r8ODDkuLTj69W7VKq4cMkQ78KKD4l3e7W11LbcfgR7Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pgvP2fw6ri2lhFRnCm0acPl/mOcThUlKIP8kjSFfVYc=;
 b=XZMEpWyF+qzOUYaOfTW4Hcu4bLylYgwmxuVf+Ldyl25lkHo33hibl/8cf4I2/nNp9Yh0BSuYU70VAWSIYXYNBFk2e+trQMITHVjAs+wH5xnN186loW60xBUM1bndVSqJAmP6it+dt5327hH3MPtrrOq9F7v03b2OZ5zUmDaS+7h74VJQEn7mLe5SAsYN+jWO0qWFoYv1LGTjAYsy8TxyhxqQb7KoreknbklZcvIuWkG9VjRx6vjhmHO/qwqJCnP8CH6PXeJG79OFgCuRQrcU5AopUZ/f4F6X+ZC5S1fCVWGOBsTHT4Fiz5DEUjV9AuHa3FCWxCYAYYXyP65eGDDmEg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AM7PR04MB6952.eurprd04.prod.outlook.com (2603:10a6:20b:107::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Fri, 10 Apr
 2026 02:42:04 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9769.018; Fri, 10 Apr 2026
 02:42:04 +0000
Date: Thu, 9 Apr 2026 22:41:56 -0400
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
Subject: Re: [PATCH v2 08/13] i3c: dw-i3c-master: Add SETAASA as supported CCC
Message-ID: <adhjdItVONsz55ds@lizhi-Precision-Tower-5810>
References: <20260409105747.48158-1-akhilrajeev@nvidia.com>
 <20260409105747.48158-9-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260409105747.48158-9-akhilrajeev@nvidia.com>
X-ClientProxiedBy: SA9PR11CA0023.namprd11.prod.outlook.com
 (2603:10b6:806:6e::28) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AM7PR04MB6952:EE_
X-MS-Office365-Filtering-Correlation-Id: 609c3ebc-ecd0-4058-1ddf-08de96aac01e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|52116014|376014|7416014|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	5VuzyIuKEbg29fwI+ov0uclkjRVSX7eVLdXnIpPUhCphN81WZVatoiO/7mOwwIHkbqIMMGfHm6odf8damFUop6ykzowMsypsSsD4+yW5cpzySsr9YiWIIpwqjMLXGz3Gak6CppBua4AJnK+YfW9InGrUBeCu6RTDQN6bxIU3XbzqN8IuWlipT9q6smxo4pCeroBl8dBTP/ro+vrTP4vzvaoGuhZO7TE47iDPa4Rv/O9i9qULyOEckHRwI0+UK5Hq0K0GPiym/ZxvDS4OVaroFj8VqR+9HYzwXMicvI2GRmDql9b410vdlrmUFMS24HoOv7MC+w9tykvbz0hGGgUvHhY0I/5Nnm2pJmlyTeRtcryEKTzAegQN43H9JJWgoE27FzwrjQkwRHRn26RFauwsGvkz+NsnaAb4QP6Cs5YQZrCitZEuEdOwVM6PhebhSReYnQG/8ynKmTmCvTiCoGKyqZGsRkxUwo9AzPweJMyCIFZmErw0t3QRTKCL7PPORbmTQ67LZflnvxvwlfdjpwHOjnIdR814EQNBc+I9g4REQGpIaidLvl7W2/Fj5BJhqi3fUAzpgZDO8FrmEhEQzAlouIaZ34umXgHVt/aSqHnYv/V3HWFoLllh5nrQfN1vaR1R85Jg+pNgfTNRd6Z2ArpIfsCc95Qp335vOR7ZdnBwCwUu00WsfmSGL635QiK5+Mm4zHeUL8Be53jarViL/t/K+7llemCzHgH+uDELum/fnUiAsJkD9vvM4V+wQ7b7d6zuJ2IjXNlvghxDmAHdfjxUdRSflIkYFQlwv8fmd2dv3uI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(52116014)(376014)(7416014)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UjzCZfKC/rZ47j0bPCONGsrpYzPRbtsWgF434XCzGMgB0lSOmOjq8Eid9WTY?=
 =?us-ascii?Q?eiKZt5l3HIj2dV0NiIY8tDsuvW3swC7qHp3C2ABU6h2D4XSEnX0/OyHf5O/o?=
 =?us-ascii?Q?HUWn3QOs3//SFS8l/5Bft3qsAqZRarfc6eaYKuaZaiSnsUVCti82ykpqhXkB?=
 =?us-ascii?Q?x+iO0vyF6jL5gG92DqZVizzQZzYjaDunlYHQMfOPs3oC9/QzgPjLagKIgPyQ?=
 =?us-ascii?Q?LJwcCR4vzU0Snl2SLdOZ84N2BfhtCqwoDNyGfOxa3x4VqZxNoBu2MMFFiOSI?=
 =?us-ascii?Q?u2pSL8Rh43EvS40FSy3pS78WPPBtl5TJCNexgL9hF1bxLcx7kALOKx3G+5W8?=
 =?us-ascii?Q?lLpdCWG/aXLw/X9KsgiZGsgYoxogYBzeZPmMb/lqLbUgXHGbqJ0eElfPou/3?=
 =?us-ascii?Q?kEcxTM4gS4lLSchac7pikRZP54i9wzDPPdbzkDbGp4LwQxwx/yFiBxbmukwh?=
 =?us-ascii?Q?MGpK96KYOHuajGiJ9py5IYUwAoS7i/N1i/ruqoJighRhqRlN0o+EcrT/A834?=
 =?us-ascii?Q?oE+is+l2IOPmCN1PDVkr7fczz0Kc0exSfZFo0UXxbHvtVdxPbZ02ptUjS22j?=
 =?us-ascii?Q?YvPK8Ul1c6Qk/j6KEJKjW5pEkyHnUrcaF3PqVlif+X8Qct8L0JsE5ogtKcsS?=
 =?us-ascii?Q?jBDcxK2DCr5dIysU/5n5tS4Rdhis1cJWa0Qr2X+nukSV0772brakAKmdmfQd?=
 =?us-ascii?Q?yxNJvkLaTl6SdWPoCRTBWTJMr1Ne7ELO7chSZNa57Wvlis4qHtu7xi7+5h6F?=
 =?us-ascii?Q?sOkSzk9bQFE5xW6zIqwDVcubqFwyloQ6z+z/4Ake76qPx3nII4Sb+E1P7cUe?=
 =?us-ascii?Q?7Pro4+MBPq1RDTaQ3ALvTVUYbFx18eC1n0zjY8b1yPcz1xSEISODyYL938rM?=
 =?us-ascii?Q?+ux4Hu773v13KRJmcumsZU/TlpuKmvKFTs0CKjjtXrNmV05dM52RotqzWET7?=
 =?us-ascii?Q?90corguuXlTuLM1B7qTi3/egJJfcRb+75PvOOYiLcXCsuznOBKQfdpg7wn0o?=
 =?us-ascii?Q?2f1G97zy6Vij4x3O19+ZeErQusZ23q75bfPky0qS9/rs0can6fIFRbZ9vkOK?=
 =?us-ascii?Q?2JfqL7U1AUBnorDp9X+H6JRWULUqZRGWydpIT6+HBr8bq62YS+ClOXru1jx5?=
 =?us-ascii?Q?AfffbrfL0zeCnXvetvHXtxEKeCL+/ZENhLvdc4+kWpF1WrVFHSVfxlgbul/B?=
 =?us-ascii?Q?n/KF2AhzZFjB5mpscceNxeaYHDNBGauxQSbD3+KE1zlYNGzB6DZ19PWlxz2z?=
 =?us-ascii?Q?v8eD4d5Ya7mMHzXW4271Hd+n7FaLhK6Q6SZIdO0k1Kp/5+g9oOYoE9iPGViM?=
 =?us-ascii?Q?gE2l5ns/z3I5zs6LLXIu2t+e00h6JU7Uh0ElV1oc4dH3PSnxilVOfSP4G2aZ?=
 =?us-ascii?Q?RZoP09Da4KcLVI/C2ilnZZpAGutDUdJsAANpamAzDphu17ElGFe4LfU3EHuc?=
 =?us-ascii?Q?KJXF5tSfa4TJtkr1nHxD7uqrjPu5h4Q4MHmxUGNQdNNHN3L0/h8Sax/2f6O1?=
 =?us-ascii?Q?V5QOg0Ph14sfJ5Z2ougd3a49NChxTmhT5aBgaENsgc0uRaJDB8nQtF6isOKU?=
 =?us-ascii?Q?LRoL3IrV6jf6aapFVetOMHCrBqPzzR/XurzTI1dEAPiWkZfyQcWo4kbgTZR7?=
 =?us-ascii?Q?suZhZz/OGnfoouheIWATUXk7mFZ9/0vGfkktVz+VzqBETDTmfMte3mY70oLW?=
 =?us-ascii?Q?FJzDZBdVdT1uNyEg4te2ZSLDqbQkOyKlfutWVdqwV686TkC+?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 609c3ebc-ecd0-4058-1ddf-08de96aac01e
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2026 02:42:04.6904
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lz37am613sDB3Mfp3A08FeN2gBCpHnU3/Omgf65Z+b8rPwjQynev/0CLW+Hii1YyD0N2BVtySwueKpE5Ix9oBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6952

On Thu, Apr 09, 2026 at 04:27:38PM +0530, Akhil R wrote:
> Add SETAASA and SETHID to the supported list of CCC commands for
> DesignWare I3C host controller.
>
> SETAASA is a broadcast command that assigns predefined static
> addresses to all I3C devices on the bus. SETHID is to stop HID
> bit flipping by the SPD Hub on which the SPD devices are connected.

can you wrap commit message at 75 char.

Add add extra empty line between paragraph.

Frank

> It is a prerequisite command to be sent before SETAASA as recommended
> by JESD300-5 and JESD403 sideband bus specifications.
>
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> ---
>  drivers/i3c/master/dw-i3c-master.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
> index d6bdb32397fb..05ccdf177b6d 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c
> @@ -308,6 +308,8 @@ static bool dw_i3c_master_supports_ccc_cmd(struct i3c_master_controller *m,
>  	case I3C_CCC_GETSTATUS:
>  	case I3C_CCC_GETMXDS:
>  	case I3C_CCC_GETHDRCAP:
> +	case I3C_CCC_SETAASA:
> +	case I3C_CCC_VENDOR(0, true): /* SETHID */
>  		return true;
>  	default:
>  		return false;
> --
> 2.50.1
>
