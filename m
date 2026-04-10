Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013043.outbound.protection.outlook.com [40.107.162.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B90302BCF4C;
	Fri, 10 Apr 2026 02:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775787962; cv=fail; b=c7U8yjgSZW6f+S212VielgcavvKCwp3OrpgaBmTVgJ34ORuq0uFkgJ9CHAkLQI6l7i/aNnYqFKVM57tBlurIgjYDPbLoZpWi+u9lbPS2yAYku97YbghpgWu97ktuardW6XcIoosLhoF6d3VSjtSamNYxLSbJX2Epkq+C6a+0/JE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775787962; c=relaxed/simple;
	bh=ZbehG7Ge60kFIst/J2rqGstpcGKCmOhEWadCtI9X34k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=IbwCXM1Kt3UnBoqvQ/8KEfjS9HT/m0mhm3WeozSgSE06NZisx9IXbnmnG5XvLwZ1NlcOrYDqtuZOtiTCirfDLVUQbLhd3JW0rZuafh9z7hBSRJB3SM7564B+8xZyeUGhk7TW7gS5u+gHl32avLLirvJJW+WbqPLJYxZ58Z30HmU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=kKcOG2tk; arc=fail smtp.client-ip=40.107.162.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="kKcOG2tk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YmZt5zAFBeo6aG1NAtScoYJJhgNhY9pqvuDq9yPmx+gBNZ/2J84GGX5sSUjdYN6XWRFRNlMJipgwEImz4gocho5ZXLQ19GRnspKJc+srkfJKdmmWDSrWONvx2U1A6PhTYLgh5DZkgzQYJMv63NvqXtKvYLK4grZkxu3o4e4uyM+XWHYOyFFcr9I2Q29gKjSRAnOv83+1O/osLQOXRNYJXtFhrobVu/lw4G6zSdhq6dgYGsfFtlTLraV9GP6iFsy5/UzQjf9lSnmNPrnwRmg2NjTjEwJ1beM9rGovP0XdrIk4zlXOtNFVo+wG6mESaO6fVEe+0pX6TqDV6o3zn9Fifw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+8tq36gcvUjWEhww+WX+vZwJ7iWjyQ1rDSlNRWVwsQE=;
 b=PpsQczyuYB6leVH1ChRNDSBWq+W4BM578EmAWhiHPcMJd6hFj1HD3SS6xgV20Wuibh0N57RBHehR05ltIiPaE7sDG6cWZGw3bevKYKnrBUlw8WPu6/TV4X/zkszlPQjethmV0A/CMMCfHIRAuaQ4/gi30cVoN/NYaFX7ZH1/7kkQKH0TA2sBtce28h/B17iXzOwmx/fZX9AudvH717jRvP/xct1ggSYSrEPmtRNE7Ol00ognQr4lhn6hoP9A79VzNm4j9c9gZFy5/Dsh3JZqG3zqc8maKvKK2MuCgYHnvjSJOR9JtBrwrLtcGocgEqDRQriuQlPiiAgKe4kl1DEDvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+8tq36gcvUjWEhww+WX+vZwJ7iWjyQ1rDSlNRWVwsQE=;
 b=kKcOG2tkTTLD5NrxSkfMc4fKy5PT1RWLhVSJkbg19tJ8DyI94+R3R96kYjksMjIHGYZdhgZCiFacRPf6efg87PLCkbOB8aH5PL1paZ9kgGOfwo/dCoFkgTrg/jgmnJIRoJo3gVuYvZjPN6cwZazp3Zk3nQ3JJBF2vuY87Gj98jt0lfuzz+EDiE9OFeaEHtDMM7WPJjH+AGvyokQ/3lpCqfGbumFGm//rfqH109RMfH/yk7C00oTDl5zSdWtaE3MtZSJEEaVtbj4b1KkkePMSq8Rq+uapQxjv+DD5+YsP+cwH42/ny6G1G24xHajPeh95tRy4Qc4bjRiVsJKDbqj1ew==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AM8PR04MB7940.eurprd04.prod.outlook.com (2603:10a6:20b:240::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.42; Fri, 10 Apr
 2026 02:25:57 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9769.018; Fri, 10 Apr 2026
 02:25:57 +0000
Date: Thu, 9 Apr 2026 22:25:47 -0400
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
Subject: Re: [PATCH v2 05/13] i3c: master: Add support for devices using
 SETAASA
Message-ID: <adhfqztT6y_NGp7u@lizhi-Precision-Tower-5810>
References: <20260409105747.48158-1-akhilrajeev@nvidia.com>
 <20260409105747.48158-6-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260409105747.48158-6-akhilrajeev@nvidia.com>
X-ClientProxiedBy: BY5PR04CA0006.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::16) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AM8PR04MB7940:EE_
X-MS-Office365-Filtering-Correlation-Id: 21eb244d-325e-4af0-9438-08de96a87f87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|52116014|7416014|376014|38350700014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	nLpGPexw0rWO05l2bViyXyrCcIjBiSUAgFbnXOQaYbCP5qaa542TrsSV9NBudAVxiwUd1xON6hkSz78Cyy1CHqjNGXA3aWJYDMgmHtZUsoC2kUR0759rhdRogWXmIBjy3NfAOHTKwnJ++hzb5TriduUp9J4R0kv/QwfGlRuC7C986lWuO+09AT7aMYt7wytXuJCFR9WPCnrz8c9hchdVG6gS/TOe9nwwC3oW2bN8Lz0nvGbyOfLeAUKwzx0Wx9WqnaAx58uVuEwOCSlKPgaI9Ln91UOPIaNNZ8PhMuvfYr8UsU7eGdxtjn5SETAeKy3RRYMV3nPhMTzidIZ+d810VS8kZ726C48CfzO4i5g+U3Bm83jet4m93R3uEtED0nPOgYsEP1Gk7Gia6FZR5g7ltibz9SKIEH4wDXfBAKvQjQewfdiUnnmE7oUbfnwCoOXgVRO0AoSmBJbNTtS3PB8uqE30kadOzJ+uq3PkuMqKdyhl/jf1IYheeX9Y4zqTrHDpdjJMZTBU49XazAvOqV3G0430Xeg40ql90U6FD685jgfzoeRbBM1RnC4VS2KINIGgJMY1nVvRj3J7zne85v4vDvmQ/ngNHNaEoyzzc2qVzQQAu775MV7cFAWolg8kAUhV14JEjn8rf2MVGXELA2cgJcXjMn4MeZU2M3/dbLqdieCYQ+Qre/1nd7XAdzPO6/fUfmDTeuMbggiw76+WDZAMYNueqfrqPWioaZY2g50SStQeTtSZ4pcpGVw8N3EXbyqQ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(52116014)(7416014)(376014)(38350700014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ErkHwuhDO8PRxtjqDa0IJKV//xhG36W1KYSGP+IdCxQPJsOxBxkIyX1O/+kd?=
 =?us-ascii?Q?4ypydBojiLStGsccko2zXnFwEeEo5+D1I3a5Q+rxqbSYNYjAA262xYIO/aqG?=
 =?us-ascii?Q?AZVQknRLcemNLWYJlZSxvMRDbv2XJHMi0sv0Ea5+hBSRSaAoycOnY5rCVKwK?=
 =?us-ascii?Q?zJXFve3S6dUkgfJgIJoVA+KeOO1xGicHd6oztUpzLFKpSggFS9M6YXJ6d3yy?=
 =?us-ascii?Q?r4HsBbbb/j7fX5Ik7wmzTAGrf0ojOfkdtXcrnYr1CYWxyIVj6x5BZOUvwN2q?=
 =?us-ascii?Q?6P0QpAAze8GYeqABj1VT4xKul16B94qNw4SWdLSyorghajTBW++pX9b0vO05?=
 =?us-ascii?Q?lRJbqrOf8ezNP5+ScDMeR0Hufa4PhBWQnzHTxjqio4NurGx0DOVxIrxtKC9Z?=
 =?us-ascii?Q?2lpTB01u/dO/pUXM53Wf55CHT3cw8NQz4yF4BD/NOXYWdliQe32tz/G6+1hx?=
 =?us-ascii?Q?mRyrQgiwKT/0aJr1xVPhpLG5BBUBSSpMVpBpMrDN3NUMQnwPXdWF4J9UOLix?=
 =?us-ascii?Q?SdHztc/5FixHOoSdbdKWu4HhAgbR0pR2xbhe4GUYORAVaMYylgmzr76w8+SI?=
 =?us-ascii?Q?V3ZyrHY53hO6IRCUs8WzqY1IgfrgpYRnDyqVYzouAlsHEy3SmmzwGcPHXYMn?=
 =?us-ascii?Q?gUP1RX1B03q2GIExQNrr/VQJQUNdxMjgy1jEKg8JrCwTN92nnsGes1Ku9g9C?=
 =?us-ascii?Q?ced7geuoggA3OvN3CfYKNipzPGDkabwm5G2u5NmsTTfCeY5avTB4PkxeiUpK?=
 =?us-ascii?Q?aylqIyax0Jy2wGk14ovK9brh8XfbDYVm6L4U6s+f2idx3vg7H6wHJODZvyuX?=
 =?us-ascii?Q?wiFMIFXZEY7IM7yAMrZ2/hNy6a9mbrpPGh4RFcYMByyBwbQRQORGYWbgkDph?=
 =?us-ascii?Q?SobF97idLAigtHtcnYHk4wFUdfCPCl34m2exRqS6gIGrbIyiW1+TQpaVuI5/?=
 =?us-ascii?Q?hwlZnNwsuTu3yJqwU/ckhV6neGTHS3rdCXQruICORZdDIEIj1P/8EdftGIM4?=
 =?us-ascii?Q?ujSNQGfmfdHyZmgdJV7JAceJFnz91W+0CvvPaLxfo2ElJxms8eXkgxm9+txx?=
 =?us-ascii?Q?U5fV7WbT7gKDviG84lOFxeglzajcS3gxzYrQ3wf6TFj3RYrfEwu3w8Sgmr/o?=
 =?us-ascii?Q?pTzP7slH4ii+KBX0IUjbJyRBcuZJFoipKip9L88qq+Oj+gkFaHjLjLoGUkkj?=
 =?us-ascii?Q?TvscyDkzimSQW7j7F2hof9Gzo7ZaOakMiTqYm1v54jMi/X0Otz0AP3keqH9V?=
 =?us-ascii?Q?ThtEoMq+nCK69Stq2WRTRt9SCNYrR2ByGUZM2epFfE3fFfnlcetIOmyXSrCp?=
 =?us-ascii?Q?rgn6n+9/VNB+Qk2cVkZHgMTNYe2S6j/0Q82OtRK5jcWErQtEvR3ltMl/94h8?=
 =?us-ascii?Q?4hWkr72+VVPf/geVSFaPqSmT74kj9aSZw5IqoAi4G67fAKEjS+XHwyXIvsdd?=
 =?us-ascii?Q?K6JdLVbcSKhRmQo1qqfTJj+/BbzHOp3z4yXQrqml5hfcUbWS5ZzArjVmVPfx?=
 =?us-ascii?Q?LHeNfzG6KuqEpcvNl2HWGBbYjQVI/iT4CWSDcmGgTwmRAl4PpT9/TBskWuhk?=
 =?us-ascii?Q?XMQ5uwVxK5moEtQQu6BN/OpkNQdEVLyqX+kW3BjnOkbzyNVp9Q8pQokwMm8N?=
 =?us-ascii?Q?90J0JqPicqWbSfP51eK5o+mEbPETitWwtPRy7TQOD2rwxbdNZUp5zM8XRdJa?=
 =?us-ascii?Q?poqfwGs9XkTpL2dcbREhoKSCBUhoGAF7xjS4bE94IHBFdsC4?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21eb244d-325e-4af0-9438-08de96a87f87
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2026 02:25:57.4911
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sK7lwqiqiBHWvwcr9rsLSvMyHr1HLwuJedZ1PQVZpjH/ug1qdA3cAAgO7oVqskz0oleTu0LTW/TEgQig0aPWOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7940

On Thu, Apr 09, 2026 at 04:27:35PM +0530, Akhil R wrote:
> Add support for devices using SETAASA, such as SPD5118 and SPD5108
> attached to DDR5 memory modules that do not support ENTDAA. Follow the
> guidelines proposed by the MIPI Discovery and Configuration
> Specification[1] for discovering such devices.
>
> SETAASA (Set All Addresses to Static Address) differs from standard I3C
> address assignment that uses ENTDAA or SETDASA to assign dynamic
> addresses. Devices using SETAASA assign their pre-defined static
> addresses as their dynamic addresses during DAA, and it is not mandatory
> for these devices to implement standard CCC commands like GETPID, GETDCR,
> or GETBCR. For such devices, it is generally recommended to issue SETHID
> (specified by JEDEC JESD300) as a prerequisite for SETAASA to stop HID
> bit flipping.
>
> [1] https://www.mipi.org/mipi-disco-for-i3c-download
>
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> ---
>  drivers/i3c/master.c       | 73 +++++++++++++++++++++++++++++++++++++-
>  include/linux/i3c/ccc.h    |  1 +
>  include/linux/i3c/master.h | 17 +++++++++
>  3 files changed, 90 insertions(+), 1 deletion(-)
...
>
> @@ -498,6 +507,8 @@ struct i3c_master_controller_ops {
>  				  unsigned long dev_nack_retry_cnt);
>  };
>
> +#define I3C_ADDR_METHOD_SETDASA BIT(0)
> +#define I3C_ADDR_METHOD_SETAASA BIT(1)

This one should in include/dt-bindings/i3c/i3c.h

Frank
>
