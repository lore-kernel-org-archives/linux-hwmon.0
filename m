Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010066.outbound.protection.outlook.com [52.101.85.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D22A7392C34;
	Mon, 13 Apr 2026 06:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776063494; cv=fail; b=Enxale0MBTPW87Sf2sFKgQpukkCxNlewsRaUNAlyXmxKaVDMDpHQzMTb23nmc2LFD8M1beGjYOrM3iCz7dncorptoEpfn5Nh9C2Rl4JjnQCwgJZ1Sw6zMIqUrwLLYmcrlIM/MYD3aIUUTERdfsHrd5YXtQB41eONWNrcVtrEkME=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776063494; c=relaxed/simple;
	bh=nOaLsznnGxDwKWkP4iEzftFBAR3zQFAyunG4ZfHyXFc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WoWbLPoTif2N9gVuF91JekjGmH5VaUI/4gYiQ/RQpfh4pArOOt69aSSsowRzO6OyqgxH7SHZF2bNhFNEI/ApPN95V8rrhol90kXDCLVAQHEfINB6l28A7ulHXUIYJe/6pXAgDxgq8CUkf7fXi0fGuJ8O8GStaztXxLP/nSZP158=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Q7HYvaOh; arc=fail smtp.client-ip=52.101.85.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Q7HYvaOh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sIhW0lapTjZbrn1Em7mPTKDQc8QWo45wLqp4BsHw/WR9dCLYrm/8+zCKy7n1av4IVSmQRXd2w46st8wyAULrRkT/dOxdy8gq/y9lq3vHhezooWYKH6NxUJwa66GKeVmPbetd6OJRkAthQP0GpTQTx5L06Yf0Q2GXUjmtftZrSS5xj99Mkjo7L4zsqsC9mdsQwPANNu41OP9Kw8GlegGyZYCxoVbqNDk01uyPmkfANK4g3EpHkGG4P7OEHQQleWxcmw56bP/ceZJr5dLbzUFLjDSVDsXLPgjwpKLhaMrS24+gjeSHkJb6/gEjYq5z3nKb2nx1Hf770Gtf9fVp6QBCqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mc2JHPftxn6su4G20FRzk/QpZ1WTGhsqylFzBr/VyDE=;
 b=IYAK1N+AZTjxNQiWHqfX0laScaN4stp3fYkjSNG7Q+KcXZKyBi9/to56R8bH7Hsoltue4UAlMWkHIcIZR2oBiQhhKN0An4EBXX7pHgJA4lOHFWB2kqMZZbRH25UFnUu/Ks0Pp3AP8ymTpgKf0jY9v1b7AlRPo+Mhz2c2eYXc2OMjFrJh8SacuUGJIqQNBj/CgRYS2zs0qgwNDCCQWhc9Nlv/egT/lNf/x8CtLjYY6tu2m4HLbv0YaCz4O3CW/JOnUwoXN0YSSX1mH8plNbadnl6iJ0c8zHLT6UjsBDZNWB/cOcrafBPfNCsO/DXLZlopYa/cPiV9djBf3mbSPQfd5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mc2JHPftxn6su4G20FRzk/QpZ1WTGhsqylFzBr/VyDE=;
 b=Q7HYvaOhiC0TT79by63DisdL1y6VB1KNWvYv8J6IDaBbIKIR2tvWQwZ691VkgSHsBpsXmEzVzcIxMzRNhcyVgvYbCSn0gAbRqRtZ2S/3J+E/5BmwV/HwsQl2HwNlgBgXJ1YfXZXztywefJgJRk6v7f1M8hkz8JJC3uboyJGfNcsrxYMiYOgfIi2bz2u7SXwGFEvroteN41QtTPwNPO0hLheyvrSkKFEg9k7i/DytKGdtMucpPOtazqJU/fJ70mrpBYvrYZAgcJK6zDFCd/ZNGk1+A3+wUoU3P8/mVooWVZoNjI63kTINh85tDCtBmch1QErdDR25tuWF/DwcXBR7Xg==
Received: from DM6PR06CA0102.namprd06.prod.outlook.com (2603:10b6:5:336::35)
 by CH3PR12MB7691.namprd12.prod.outlook.com (2603:10b6:610:151::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.46; Mon, 13 Apr
 2026 06:58:06 +0000
Received: from DS3PEPF000099DE.namprd04.prod.outlook.com
 (2603:10b6:5:336:cafe::6d) by DM6PR06CA0102.outlook.office365.com
 (2603:10b6:5:336::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.48 via Frontend Transport; Mon,
 13 Apr 2026 06:58:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS3PEPF000099DE.mail.protection.outlook.com (10.167.17.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Mon, 13 Apr 2026 06:58:06 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 12 Apr
 2026 23:57:55 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 12 Apr
 2026 23:57:54 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Sun, 12 Apr 2026 23:57:48 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: <krzk@kernel.org>
CC: <Frank.Li@nxp.com>, <acpica-devel@lists.linux.dev>,
	<akhilrajeev@nvidia.com>, <alexandre.belloni@bootlin.com>,
	<conor+dt@kernel.org>, <devicetree@vger.kernel.org>, <ebiggers@kernel.org>,
	<krzk+dt@kernel.org>, <lenb@kernel.org>, <linux-acpi@vger.kernel.org>,
	<linux-hwmon@vger.kernel.org>, <linux-i3c@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux@roeck-us.net>,
	<miquel.raynal@bootlin.com>, <p.zabel@pengutronix.de>, <rafael@kernel.org>,
	<robh@kernel.org>, <sakari.ailus@linux.intel.com>,
	<wsa+renesas@sang-engineering.com>, <smangipudi@nvidia.com>
Subject: Re: [PATCH v2 13/13] arm64: defconfig: Enable I3C and SPD5118 hwmon
Date: Mon, 13 Apr 2026 12:27:46 +0530
Message-ID: <20260413065747.31834-1-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <d62130c6-c503-479d-99d8-b4f0f0582a4b@kernel.org>
References: <d62130c6-c503-479d-99d8-b4f0f0582a4b@kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DE:EE_|CH3PR12MB7691:EE_
X-MS-Office365-Filtering-Correlation-Id: b5be24d7-9276-48e4-e76a-08de992a03bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|7416014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ZQjKTw9HTlQb5z2XaQqH1IBWWpR1VtJAy/8tpfAO+TC+ysEI0cW71RN4IF2vJHgqg38BRvtUbyaOFMj7PifIpxl7MyBqGhNrWWq5WMhfJ33itKrH1poEQaYLQOwFI+CMKTcrfGTaYuGGE21tmXwFt+6izHa4L93lj3q1N4I+TlVeWp0/OGCWvzxNZnZY8KO5iHISI+umXi2ZYM1Uat2OM6uschWzah5H91RqSHUlpmPASyb2age563Cw9YUHjwt1L8cbCJj0E/j438CpYhbm8xVvzbDwv0welXpHZqvmwDBcsclgu9yAPvrbAOkKb8V2dFdmddAnUUd88Yru7qIUL7atOZxdK8SDaUwWN5ItUntss0xV/IBJ8JItE2ntHNq0iYwlgRgWqye3/sLaKGQ+BvChDlhj4dAUDdphLrVHwnMWuJlzsw+LBoan4d2zz9vdPjOSadiJcVWs96Fw4hl0j5eqmu1yMYq2V/CQtsQmZHIAZedUAjpTZ875CaWLLLG0T5OfuTP9pG6VJ9wMvvMKixXiizSg2q5J2x48R/BXvzI1RF2yURHzfsR9xruSan2sXa7jppmkYKPdQLyNj2aNGkQKrKVSWtxNsKzLV1fomdXN80e/ln0aK4zp/ZH/jv//Sf9xKJcjhx4Jyo5Qsz23gDGMrLToxjx9HPVmbM/AgOjMO2vsc6aSKlqqFbBlAbwI/u6w3szH0w62KQrlAgLE+f8E23xDKv6W2qdhg69UQ4ZTkMLO9aI3tQjz/INA9ms2HvkOmGHr873ZWVpb6ZtNEA==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(7416014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	7fFm/0xKZWgjYAVZjbIvc/H2N7gna0e8taFZoQNRcXQSQu7GThrf/BdgEINCGlKBqLfTbRfWrvZqdhZFTUZ7cJtWU+3DwZaGNGEhwyjMSXOtDMJDi5Xq2degfQ3LOs8a/XjRaCGVJ5g0UKGpKrgkGyvQTce1e6D5Q3kiz/7h5Uxzen/mN9fSACvMtAeCneuOWFfWGufigLHNkkEbdI5w3c5FR/Y3ZRr6+zEb8S+tMAKxpZgqD6f0zf1eo6KJVr4oFbhOTrCUx58M1tYwP0Q17719e3t5xiskrZ969CiO9XayKVggfyrZxv5T0X14ZqEt5FGcEALs/QVlWqSEnjwqAehn0RzFAVIZJdLVpqJ6Hv8LSaUGfqaaEO7CYEScKvbWOF3lNyoTqsSRc/7XS0++BtO4hB/jtJSGT2ZWfZN55sZ1qcIQpbLq26FNgKw40rdu
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2026 06:58:06.2048
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b5be24d7-9276-48e4-e76a-08de992a03bb
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099DE.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7691

On Sun, 12 Apr 2026 15:33:42 +0200, Krzysztof Kozlowski
> On 12/04/2026 15:32, Krzysztof Kozlowski wrote:
>> On 11/04/2026 09:20, Guenter Roeck wrote:
>>> On 4/10/26 22:34, Akhil R wrote:
>>> [ ... ]
>>>>>>> And it
>>>>>>> should bring me clear rule what I can or cannot remove from defconfig,
>>>>>>> if in 2 years I come and start pruning it from symbols.
>>>>
>>>> I am still a little confused on what information would likely accept (and
>>>> keep) these configs in the defconfig. Would updating the commit message
>>>> as below work?
>>>>
>>>> "These configs enable the support for SPD5118 within the
>>>> Small-Outline-Compression-Attached Memory Modules (SOCAMM) LPDDR5X found
>>>> in the NVIDIA Vera CPUs. The Vera CPU uses ACPI and is part of platforms
>>>> such as Vera Rubin."
>>>>
>>>
>>> It is quite interesting that we argue about SPD5118 which is mandatory in
>>> DDR5 systems. At the same time, CONFIG_IGB_HWMON, CONFIG_SENSORS_MACSMC_HWMON,
>>> CONFIG_SENSORS_RASPBERRYPI_HWMON, and CONFIG_RTC_DRV_DS3232_HWMON _are_
>>> enabled in arm64:defconfig. CONFIG_IGB_HWMON is even built-in.
>> 
>> Why CONFIG_SENSORS_MACSMC_HWMON is weird? It is part of the soc using
>> the defconfig?
>> 
>> The author here has troubles bringing any arguments why his drivers
>> should be defconfig and keeps asking what do I want to hear. If one
>> cannot make an argument why a change is needed, then maybe the change
>> should not be sent?
>> 
>> It's the job of the author to convince why the community needs this
>> change, unless it is obvious, ofc.
>> 
>>>
>>> It is kind of difficult to understand why those are more important than
>>> the temperature sensor on DDR5 modules (or the temperature sensor on DDR4
>>> modules, for that matter).
>> 
>> No one discussed this. I have no clue what is SPD5118 and commit msg did
>> not explain that. Did not even provide accurate user of that.
>> 
>>>
>>> I don't know what the policy for defconfig is, but just based on that it does
>>> seem to lack consistency.
>> 
>> No wonder... people write poor commits and send that to upstream. And
>> when asked "why do we want this" they got stuck.
>> 
>>>
>>> A separate question is if it is time to enable I3C in default configurations.
>>> I'd think so - more and more chip vendors support it, and presumably they would
>>> not invest in it if there was no demand, but that is just my personal opinion.
>> 
>> Isn't I3C needed for SPD5118. Otherwise I understand even less from this
>> rationale - why I3C is being enabled here?
>> 
>> And before author asks what do I want to here: no, it is author's job to
>> convince me to accept I3C in defconfig. Not mine.
> 
> BTW, all this was asked at v1 and author did not improve the commit msg
> beside giving quite broad/unspecific "Vera".

If I am not wrong, the ask in v1 was to specify the product which this is
getting used - 'Vera' it is. I do not know why you would think it is
unspecific.

As Thierry and Guenter mentioned, the lack of policy and 'mix of both' in
the defconfig makes it quite difficult to understand what could genuinely
be convincing other than putting down every little detail or do a trial
and error.

Anyway, I will describe where each config is getting used in the next
revision - hoping that would help.

Regards,
Akhil
