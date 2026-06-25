Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011058.outbound.protection.outlook.com [52.101.65.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A5E3AA4EB;
	Thu, 25 Jun 2026 12:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782391338; cv=fail; b=GZE8u3f7KpVKyiYoafHccF9BKSPkIbEwQEwuJDn7LqzU20Q2TlpOsXWPbGhXnh535I2EeXiUQGGISsT6AEALtVJig2t32ENr5ym4YJAFQPSZ94bm9uttR2Ip8mLPheIUccVkA1tF9Gu9ia6qXtFwyZiPpXBF+mvTmJ9zJ5kFkeM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782391338; c=relaxed/simple;
	bh=5shSVQPMcfAF3niXMm1sytWfPT4tMExSx9YeOcFEBNA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=JT55IicDYfSd/dUK5rtbR65tGVOLgG6n5HgrP4Q+Bq37jIbNbKziT088pRBiNopYCsYAM03ZSQU659jLsPjJ5ZpZTEX99XW9HrmclkbkgB2QcTJXYqg0lnbVjjw3gDj/WL0bRika1JF/nqebKVClOeHXfPBKX8Kx14hM/jBKHv8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=VFFxe2Xw; arc=fail smtp.client-ip=52.101.65.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="VFFxe2Xw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p+U8nGhzblcKlfcPvKcvxoxTBqfJLs7pS5b0hRVPNpCfe3KkUQeGnjlalkHPRJ8xUJuubkEE0xxnD+ZbNl6B9Bwh8431tHEH43lRZZmiIckSoQVwL7P2nyI78no3KPaIBtHWjD3dn2TgJzqGkjlbwOT0ujRFAtF7DSPXxIs0nXV+Qe9bAgkxCu+Po2DpG8F07tV7KhXfen/Y0FFLXLr0sZCInko1pEs5azeSdXQRi5llyUb5o9bpLvOhI/fK9DK9alntuGhYUAmy3jf/M6WKcKSDNobnGW7IDzR+DOxfsOU3/V/pqx3LK/DPp3/XzgkpVzbx7sImfpHQZ52QbNCk6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ahWBdz9EY9bJ17Maw5hAKopAQGUFu3hIhmFjD9gNO6c=;
 b=CIybv6IrVa53GZbDi5PT8j+6ouKLUCCq4RLZw2UyA6xbBnovFZWNdKwoDe6FsiqI/c4FqzkauG1VwSPexDyxouRUpLdFVb85G2fXSwy1eynY5lvVVx2pYo/xX/lAGUdU6koSlAZ4cDMvYVafLpZIxmXJmSZbkTIlyHPK2uUVcpMP4pMf+VswMNiNYMZxWBOkt4+/FZfUAzUAALiarEGTWCcIWnDMYrYDI4vPPuKQf33gYtjKHBm7Z9YQsV5/5g3lSjtLzpkBSQITSmzp9B+UlUWaERzJKyY8Szq7qy2yIxkTORMNJ6yweKtPgUjL5w5P6FamKtC8Bhsmpd/R3yg3/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ahWBdz9EY9bJ17Maw5hAKopAQGUFu3hIhmFjD9gNO6c=;
 b=VFFxe2XwCS/1iFY5Em6Utqh9QPpqb1eKFek5OqWvtgqZBeK1IJOGeAv7fD4PwTd2E9mLZWUUALcL3jvPDLfqGDfS3jlzexhHibEGEZqO6suKMHjKPWwMm7oa7h98Sds5ku9okZ0H5xlv8rIUNOv0UT2/INgtQ5matE3X1RALNzJvt0sqY33MeOqUt3p4SdbAa64tAFqtgPAyiSlrLHTtxfW71Ykw70/CcH78H3U7sLSKkBGvCTdDE4EyCQR2iAB7LE/yUG4rBsWcKlcOrxW1Uui2ISlLlm4z7j5UaVte/kIP/rlLrefhJkhSiaccsisnAunRh8qMe7dJEpYngHOIzg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GVXPR04MB10023.eurprd04.prod.outlook.com (2603:10a6:150:118::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.14; Thu, 25 Jun
 2026 12:42:14 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Thu, 25 Jun 2026
 12:42:14 +0000
Date: Thu, 25 Jun 2026 07:42:03 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Akhil R <akhilrajeev@nvidia.com>
Cc: Frank.Li@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-i3c@lists.infradead.org,
	robh@kernel.org, sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH v5 04/12] i3c: master: Add support for devices using
 SETAASA
Message-ID: <aj0iG5xplWPWc6m_@SMW015318>
References: <ajwamrU8ehBINzxq@lizhi-Precision-Tower-5810>
 <20260625093815.1794492-1-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260625093815.1794492-1-akhilrajeev@nvidia.com>
X-ClientProxiedBy: PH7PR13CA0022.namprd13.prod.outlook.com
 (2603:10b6:510:174::24) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GVXPR04MB10023:EE_
X-MS-Office365-Filtering-Correlation-Id: ecd36fc1-0bde-430a-06cf-08ded2b72e9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|19092799006|366016|56012099006|3023799007|6133799003|18002099003|22082099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	ekZHme70r8cGLoG3VCdIc3bEc64j0j7LnY9wQgF7LdGPrZAGB7b03VVhTjwlu10fIGiy6o0vqNMOJWIczmo6m/cbWz35/EtrUd5IkN6+cZrSiEkvjiGZJrq68TdPJyEDLaTiKlM9/+ltwFdW5TB2eu7USQJ9rfEvrGdlZ5wmj5w5Qbf/sD5rYQdmk/0baIeagfiJX35WYHGLZCa3XnqSk62rKMGvlCqkV07t/JQI7bFBodjElSqaW2dZSxJr07jo3KfPvWHSxmWGw03Pwm/FTPHd+lXQfRG1j4day6SETmosbGuuE4AXdwU0GR+0emmTh0S9l/fBU8zW7FKDT1lbOmZqjjIgnXOHyxRyhoC06sbTRsSR4Fpmv5zYrX+YdOJjpPyD+E4lJsb6GjBvvrXEFQMFVZOq6t3cByzRxwNQl75KhyLwMPSEPwC0X6ssokGSHOdGaTWAgcn8vKskX4cDOlpEZBkmvscWpu0gETkiUhNgPKIeanq5sddQVGuwk9rbiySRIkRVFn/seiO210dWHmlUTW2gR5dql3DdJysYRA4KATO/wFT6DAE5j6uVaxrNeGoHFl4cIXUOBhh/INTIQZbDhIpw5XIIxQnWaQTz/OqgUk5rWEXhYFo5Kt3yMVVdwPn/uN5ZeFHMkJTZiYh/fNHRIpHuB1AP5s4N8i3rvao=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(19092799006)(366016)(56012099006)(3023799007)(6133799003)(18002099003)(22082099003)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2FA/K6rf1syld16wsdHGJ7HsWBBqze4/IFSB78BRsgMe+qxsANDQmEwfotvF?=
 =?us-ascii?Q?bc0KuzrB2KMPRr5hnOKrIrdWuBfjFblDXjq7OustE7euVdz7haslvuRhJ9t3?=
 =?us-ascii?Q?nKsR2A1E/oMCR4xvktqP9aSipa4dJwSMuUjS/1j8n6dR6B8VaGN5baocS3Kk?=
 =?us-ascii?Q?HHgDfr37tdFK2SEWNkuVDiKaXb1vgFGcDBKLPj1R+I7rWjqulo6Id+0kj1BJ?=
 =?us-ascii?Q?1SMHDbE9ILo7+3M5Z8iO8ZugSEvgxUHZnh3jatmw3iVkM6Lr3VHs0HICYP4A?=
 =?us-ascii?Q?ixrOd6SdcNKcZcD1C3EEVJGWR7Aqm9cB8WyDlfUJILuAFo6cb65HNbW9Y8my?=
 =?us-ascii?Q?Z+e88st4YYLxEGhX5bzPP4FkiZ4VyybxlnfI+PB9S03CfL0GgrNi8qMAuZNa?=
 =?us-ascii?Q?tOEUF+nNbnyndIM3+xnZcMbdAXjxB6dWhmOUbnF1OpT69+der7jkESqKg7a9?=
 =?us-ascii?Q?/iquWierTFRQnuwYV5rrO+E//Nq4fh12MmQ5LgCDpNIJS4OfsxsHrvzF/4Hd?=
 =?us-ascii?Q?4O4eCDQPa+3aLXswgrC7sQZuzuJe9eWMLPgF1jruisuRb11aIALTSI7D8faz?=
 =?us-ascii?Q?G2KBbHoISyr+kHxVDEab7cWjRThktnhFbER59ITRzhiyt1QYwGwnNXIZALCe?=
 =?us-ascii?Q?HsE9X1Z40ou0AMxm3Uk5mwlCSbqlYG+YDMkWaXOOyieFuhhub3rxE/oS5LNh?=
 =?us-ascii?Q?R/O1e6L96TVrXmZPrd9UZfoKBIQ+r8K33K4+s1M4XvqhFO8zfDa6h6jgvAH3?=
 =?us-ascii?Q?4MshgtimVQBKng9HNcRgXiFFdTLwuLF9duSQAdRsiUBfQYDFo+nCYiFWh1Qv?=
 =?us-ascii?Q?wR/BRDrFkivzaW4rUAp00uPN5hZ8IqQ/a6Pnb7o3DoQuSgHJkVzX+KnIFUfp?=
 =?us-ascii?Q?8l//IuzJzioGziyYNR6Rv+oJT+5iDeOO0rKINsqbGPdw9Qyn/qOp2ulxf73H?=
 =?us-ascii?Q?bueC9ou07kmilWrjog9tBSDjdA0rspTDbBs9E4ZtxkIk+GrApsTLbmwk/3JT?=
 =?us-ascii?Q?zc2oDFczMrCxUJXyPMsk98z24GXcghqcefYBwQQsHsrUArbdJDF8zGucM5LK?=
 =?us-ascii?Q?X/E1xU7Daw3+QWlPUY5jCALn3wDWv3yNf6l9dWtG8BOnAaUk0Mq8wO60Ks9a?=
 =?us-ascii?Q?A3niQa47YU5mn6asrrGiH8smMnUDJrCcMQNBLb/eBhou1J37ewjwOwctfkH9?=
 =?us-ascii?Q?6IbE+Bn2l5MqH/U0V8ZGQc9sx92T2ZcXKMM8/4kuK2ja21UhST81UmEoYoRS?=
 =?us-ascii?Q?eP6xhc7YkkxQLYR7S/SQp0VXPe/bqKEhl+L2t+TkvNAAhkZ2A6meyvraP2jt?=
 =?us-ascii?Q?II/EvFLgI8Bcbgyy/zrwh3zMCe8S79qaMfyETJcJSHzAWfACHSfkB8sAcaT+?=
 =?us-ascii?Q?nncq3w+1ml37h+nM+0mrXvBe2t8ivWYSTP/FT5rGbzSfFdOrxE23tSedXPCr?=
 =?us-ascii?Q?DOpLOuPWrj/G9PV4ZaGeXYd2FYIIPWrh+YduiDdyjB/moOUvGBHmkoPvGqHZ?=
 =?us-ascii?Q?ufA3JubYcGWflzUT0oVwtzO+H7jghoMlIje4HbvxDb56iANxW9OT/gsQ5qTJ?=
 =?us-ascii?Q?CZmJyPV3hmnK9iZlP4VWUOqk3uXi5keyefq18PLRZVp2y+XRuOFeWKXhsABm?=
 =?us-ascii?Q?koIhLpTl5jah9QMOJGKxHSPt5wi1qnQcuhgIN++a/AOrx1aBT4G3XZO5w68/?=
 =?us-ascii?Q?K6jUCy7v0/Uq2KCDRTP2LnIp8vvt0kg84jwnwmuLP2hEhiwJ3CuOmBQ+j1wO?=
 =?us-ascii?Q?ZxSpGNBse98SvEzRDRkOCBElpxi+ePz+0HMZuk2alHkrSmrZqa4Y?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ecd36fc1-0bde-430a-06cf-08ded2b72e9f
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 12:42:13.9666
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gjEAPxTMfF6fxhRN01dVnfx1d1cWaNzfK7h5ByqlqFlZYVbWBvypCZKQa4J4p6R4rBZP8qtlZiXcPioiwBATYHD4wEnfEgvd3rRm2ODgw2KbZsBLuyX9U8NXf8ljw/26
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10023

On Thu, Jun 25, 2026 at 09:38:15AM +0000, Akhil R wrote:
> On Wed, 24 Jun 2026 13:57:46 -0400, Frank Li wrote:
> ...
> ...
> >> [Severity: High]
> >> Is it possible that sending the SETAASA broadcast before direct SETDASA
> >> assignments breaks initialization for devices that natively support SETAASA
> >> but are configured for SETDASA?
> >>
> >> According to the I3C specification, any device on the bus natively supporting
> >> SETAASA will respond to this broadcast by adopting its static address as its
> >> dynamic address.
> >>
> >> After this broadcast, the driver iterates through devices and attempts to
> >> assign custom dynamic addresses via direct SETDASA commands:
> >>
> >> drivers/i3c/master.c:i3c_master_early_i3c_dev_add() {
> >>     ...
> >> 	ret = i3c_master_setdasa_locked(master, i3cdev->info.static_addr,
> >> 					i3cdev->boardinfo->init_dyn_addr);
> >>     ...
> >> }
> >>
> >> Since the target device already adopted its dynamic address during the
> >> SETAASA broadcast, it is no longer in the unassigned state and will NACK
> >> the subsequent SETDASA command.
> >
> > Look like correct, but I am not sure if target will NACK SETDASA. Or should
> > use SETNEWDA for SETAASA method.
>
> Yes, this looks valid for mixed device buses. I can move
> i3c_master_setaasa_locked() after the SETDASA handling and before
> i3c_master_do_daa() in the same function, so SETDASA-assigned devices will
> ignore the later SETAASA broadcast. Does that sound good to you?

yes, try it to follow spec.

Frank
>
> Best Regards,
> Akhil
