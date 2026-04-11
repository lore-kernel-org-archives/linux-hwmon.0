Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013061.outbound.protection.outlook.com [40.107.201.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C81F61B4F1F;
	Sat, 11 Apr 2026 05:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775885699; cv=fail; b=gELKlLDUK6tMyVuPj0aFBGKwkgeOmN2nkdA/jkjSIrcA+2SSymnpnkIXZ5H5UC7CAvlchlT+pG5os8IYK9mrjFkxIosELdvmE5L1PDcVmMgmh2/GCUmXYFHDxvdPW4ui4MPgz/eGT5tjEfTj0fFpQFGcJbbyiNFRedZFiX+zHsY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775885699; c=relaxed/simple;
	bh=gzE2VrxV4rBk/H8LjFe8mTwnZ63IVvYOkxPAqIaBzng=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=frecviTIx1hf+wqwPcK6Ys4/bZPG9Qd2kHi/w4H09y0o9h0T6iZVdm30pk3Ie7mYRXHCKPwD5PJEHWmUVZuiOCcF3J+KAfnVTHbaJeacEF0gW3PB40OUgDbRAQ/uNpRXZitDIF3qrcLjSE75T+B+AfzRY5frVltoNh5cVYmn4vw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=nFAqJazB; arc=fail smtp.client-ip=40.107.201.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="nFAqJazB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dkt7GT1EaE5tz2e5Wf48FGLmkBSwYJ/1jBhmmCln5xjQzOkvFU7Skpx1V7Mavd8cMdY+7N+si447vv0R5BctVqv6gM4m+tO2apagvnPbS/JuAkFwGAm7GEDY+aAbbsqShuyWdfyf8tcj0OKySAHARtqruzLg+upEG3/PhEjefCeeZigVvnn3KMeSxsXz5dJt7U9PyMCF5yX2IReKU1rSP9Ihg6P6ed0Wv/bskqi51KGZQ2bghTTjZcVQv+ipV/WNmQOafHaEI1C8K8m3vuqcaj/dsaa/oVm0L2/+lWYY5AlAGd+RHNwpiLVzmVpaVLl8E8/UDqYJGZotPQIGo/WAhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lpGc8dBw9llcm0mKKvMYKradnz6nLEIt7vVQ5R284PQ=;
 b=EhVBPfEB4Xq+eyV3Cl9UgFzpbBP5RtMPhh4j1sxH4doUEZZ5MDuC51CjzyTtns4ln7DTe8WI75/byJC/27VchwdyuMCX3B36m3sxSkupOBOpXJ29CvLflv9tZ+iCQzcRfEGzeEXyOU5VCVekZz88ne00fEcSyKmE1hBvTmYgk71u9knqFxA4+OH3vIkqk62hp4c3yZ5Lp2iw+MtuHXeIEXj7fbPnhvCj5/qX5A+7TD9USGHuQm2xfz5mpFACZYyeXWPiGlV+LDeZ01TmS/SJz51ls0XEEWRB5Cj8gpNsTs8yFUm/klFlo8Hw1CdiDSiKBdvpnguhwFXrX1xm8454rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lpGc8dBw9llcm0mKKvMYKradnz6nLEIt7vVQ5R284PQ=;
 b=nFAqJazBwsjlhmYduttLwLog4E1huNogyTxGyQrRPUFy7FT0uEKW43Q9mW/cnZA4V/zW4pujXGXRXsB/e0IQgGMS3JO/hl1W2pajlYmhseiD70v+7rr2R1C4rOxVQ9ZrXiOgQ7nJCQFIltA+Lh6QAgzAYuKdvEmoTBASP2iTqixcAxn5zm5wFwDUJz/cPe0xzFR1ZVkugF9iYwUpiGl8UF8fUx9dYqvTIDVAEkX9ODbQYZyLqJ3T6ebZ0msp13hfU2hARmyzATj/TbHCVIXL7o0UMBJoVDDXnBMsv59K1IRvTkC/mRlg/O9eMOs5q3nTdJ+l432cQDk39mKEzIeNZw==
Received: from BY3PR10CA0027.namprd10.prod.outlook.com (2603:10b6:a03:255::32)
 by SA1PR12MB999251.namprd12.prod.outlook.com (2603:10b6:806:4dd::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Sat, 11 Apr
 2026 05:34:53 +0000
Received: from MWH0EPF000C6184.namprd02.prod.outlook.com
 (2603:10b6:a03:255:cafe::b6) by BY3PR10CA0027.outlook.office365.com
 (2603:10b6:a03:255::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.46 via Frontend Transport; Sat,
 11 Apr 2026 05:34:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 MWH0EPF000C6184.mail.protection.outlook.com (10.167.249.116) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Sat, 11 Apr 2026 05:34:53 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 10 Apr
 2026 22:34:40 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 10 Apr
 2026 22:34:40 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Fri, 10 Apr 2026 22:34:34 -0700
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
	<wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH v2 13/13] arm64: defconfig: Enable I3C and SPD5118 hwmon
Date: Sat, 11 Apr 2026 11:04:32 +0530
Message-ID: <20260411053433.49655-1-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <5c751739-5044-4d23-9648-8d46dd0945d1@kernel.org>
References: <5c751739-5044-4d23-9648-8d46dd0945d1@kernel.org>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6184:EE_|SA1PR12MB999251:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e2e1c14-1968-4dc9-71cd-08de978c0ed2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|7416014|13003099007|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	jX6+Pus/LnGkg9Smp/zH/Ut/gksBzT5XEtDxnFS+vdi7zp2y0/vDTIdT/zTt2pp8Y6xpHYot0RkYDbdthOSSjTLvlkC+MEwvPy9mANIzF3TKNFMmFSgZwt4sC6y6AhmqIgV4OwB0vxrY7rQOKymIoaf6gVZjBkm3ymBqP88uGx4xvN+LGKAoJbq86ste4s9pygCkTqJ5JraCbKkj/bGiSR5Vfo7LraihF1jU200EIELNvJB+RbEY7eJlmh77fiCCv5vh9A01ptznSNYkkfABM10LgX7rQFisiFP7QzvoCwxRDYhNrJoYJSt6pcsvPppYsyepogSXVDyZpmpJDzFm2i/zdRAZsjQirv8cRfbEqo76xyx7/M5/Vao3eGIME1jlgk6UAvn46lP4LWMhK1uJv3W5Q1ugQz69hLRhXflluZTglZuP+HZHopJ1fKMhjeKsOisl8iRPFHn+M2/ZMavqNko/pvuJuCvlYbTSvLcU/U3Rjm2YVTiz5QMhlayEi4nUZYXiFcaYJ+xXSAVbqee6KGkKrqU00wTsRUaHhopF/FP3VTQMOkWYWQ8C5UjY2WvHQwRJttyCFndT6A2JScizXvZqe15U5lCt37KKOciItrjqcYBY0DcpiDHXe+0mQ+Vnp9xWeRP3KOIjc+aLqYjoqVlHeUqeUvUfd7RcFFBXDNzATDBVRYiIdARxdGTxqR0BsUDEucok4YN3XkXk0J0H97reNkbiYZHYoJMnW9t8IaBs41q3fdWc9hQNzBldLFBYqVIgOo8N19gSU3oNTFAVIw==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(7416014)(13003099007)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	NmwbM599C6iwHnj8eNevOEA0Yr3FcLjjGY8XEun8JhqOzVviuBgR0p1QVg/MV5m9fYL4qXioPB5myLonOHqlJOAxgUetGTe4FnDg8WDtsEC/Moli8zGiXCJZ9lUe5jXEnKMCBS4qzFiGwqsNu12HjteAEDGbUd2UxQkggI5iR+qI8qP7/5IkZ9a0JZlZTVJ3SkVbUMLKa9nwF5uPExooGQSlAOWxr+PEOejgvimb0inLWMhe91pYK8NVjHrTrKXMryTDZHzrXaAdvrZcrVC4JHEHUGQ+eF84StbNQDKrzDWPBROMwifbqBL9k8IuHceJZQDdRketdFJJSCjzIVVKA4n33w5lnxK0A4wL0SfzwbQMl0Th3jFODnMQ8Zypx3MueCh1J0bysHvggRWTrJ0HjcdSlJGhu8udBHpFYfkIod1w2pQmEHO1zCNPAOdk0T0R
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2026 05:34:53.2269
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e2e1c14-1968-4dc9-71cd-08de978c0ed2
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C6184.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB999251

On Fri, 10 Apr 2026 11:57:11 +0200, Krzysztof Kozlowski wrote:
> On 10/04/2026 10:37, Akhil R wrote:
>> On Fri, 10 Apr 2026 09:18:48 +0200, Krzysztof Kozlowski wrote:
>>> On 10/04/2026 08:57, Guenter Roeck wrote:
>>>> On 4/9/26 23:39, Krzysztof Kozlowski wrote:
>>>>> On 09/04/2026 12:57, Akhil R wrote:
>>>>>> Add I3C subsystem support, DesignWare I3C master controller, and
>>>>>> SPD5118 hwmon sensor as modules to the defconfig and therefore
>>>>>> enable the support for SPD5118 sensor on SOCAMM found in NVIDIA
>>>>>> Vera platforms.
>>>>>
>>>>> git grep for "Vera" gave me zero results. Are you sure this is an
>>>>> upstream platform? Please point the DTS using this.
>>>>>
>>>>
>>>> I think this is an ACPI based system, or at least that is what Google search
>>>> tells me.
>>>
>>> Thanks. Following Google Vera is either a "CPU" or entire architecture
>>> (at least that's how they call it), so it does not have SPD5118 sensor.
>> 
>> SOCAMM is a Memory Module. SPD5118, as it's Kconfig mentions, is a sensor
>> found within such memory modules. I didn't quite get why would you state
>> that the SOCAMM present in Vera architecture (or CPU) does not have
>> SPD5118 in it.
> 
> I said that CPU or entire architecture does not have it.
> 
> Commit is pretty vague in helping me to figure out the things I asked
> for in last email.
> 
> 
>> 
>> Pasting the below from the Vera Rubin product page [1] -
>> "NVIDIA Vera CPUs add enhanced serviceability with small-outline
>> compression-attached memory modules (SOCAMM) LPDDR5X and in-system tests
>> for the CPU cores."
>> 
>> [1]: https://www.nvidia.com/en-us/data-center/technologies/rubin/
> 
> So this is for Vera Rubin? For what is this exactly?

SOCAMM is with the Vera CPU. Any Vera based platform would have this module.
Vera Rubin is one such platform.

SPD5118 is within the SOCAMM.

> 
>> 
>>>
>>>
>>> "Nvidia vera socamm" gives me something about "rubin". It's not me who
>>> should be guessing all this.
>>>
>>> "nvidia vera socamm SPD5118" gives me even less, so justification is flaky.
>>>
>>> To remind, this commit msg should convince why generic kernel for
>>> developers affecting all possible platforms - not end users, because
>>> they always use distro kernels - should enable these configs. And it
>>> should bring me clear rule what I can or cannot remove from defconfig,
>>> if in 2 years I come and start pruning it from symbols.
>> 
>> I found little details on what we should be adding in the defconfig. It
> 
> Then maybe we should not be adding it to defconfig?
> 
> We usually do not make changes which we do not know why we are making
> them. IOW, every commit must be useful for the community and this is
> achieved by either explicit or implicit answer why doing this.
> 
> And I gave in the past clear guidelines - this is config for the
> upstream kernel developers to use the upstream hardware and/or for
> distros to understand what is needed to support that upstream hardware
> (although last part in theory, because many distros do variantion of
> allmodconfig, so they don't really care about our defconfig).
> 
>> would help if you could share some guidance. Do you mean to say that the
>> defconfig should include only the configs which are necessary in
>> development platforms and not in end-products?
> 
> No, the type of product does not matter because upstream supports every
> type of product. Upstream does not say "oh, you run end-product, so we
> don't care about you". But defconfig is not used by endusers and has
> zero meaning to them.
> 
> It seems to missed or ignored one more reason I wrote:
> 
>>> And it
>>> should bring me clear rule what I can or cannot remove from defconfig,
>>> if in 2 years I come and start pruning it from symbols.

I am still a little confused on what information would likely accept (and
keep) these configs in the defconfig. Would updating the commit message
as below work?

"These configs enable the support for SPD5118 within the
Small-Outline-Compression-Attached Memory Modules (SOCAMM) LPDDR5X found
in the NVIDIA Vera CPUs. The Vera CPU uses ACPI and is part of platforms
such as Vera Rubin."

Regards,
Akhil
