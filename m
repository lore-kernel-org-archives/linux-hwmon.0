Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010008.outbound.protection.outlook.com [52.101.46.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF843AD50C;
	Fri, 10 Apr 2026 08:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775810255; cv=fail; b=qknMjzaUrnbEsbCFX2D85bp42ErOS2HlaioiM/+KDKq0SWB59UAfxWF7UkHlAY+wHv/k2jgWStST0WHGCn4N48n92WvnIm1LkE5CI6YuzIFdJgFVRRdkQXzdNaFi5ivwyGLzZBtK8hWKHvMpqDiA6SFxxa6OcVhVuOXSawsJwD0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775810255; c=relaxed/simple;
	bh=kNMxsAzhENZiEqzMn92oeu+EzzvEdmX9tEFbSw2XP+U=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=A8f/BMODqlScv9ntNqUOdt5SmxrUJgRVwU1vlWUMBlD5DXZ4P3EuM/ONdL+2D6Fpsda+XzEnTSkl+9S1U8xWxiWKrOf0Ge56qmThAvqt5XpB+suORR3jojIIg1RlBCtw6yAYTS+kZiCI5uQ2dknpTdHCUagJRP5+7aHQc4uxHlo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=n2X2oje/; arc=fail smtp.client-ip=52.101.46.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="n2X2oje/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I8zgryn4AYWixxVmKAvnDzt/L5ND92DLC4T38UVvJc/8pmXsfjwQpECOJD22vxbLHPyfSh3f45IWxmSuBayJpdJEvf7mF9c+9p9rYiHMPCf5JWhy4/IHCYD/hoEEsvfTsQoZ7XVvy//2X9ZBKM1zt0euGb4YMuGUF2CChFQM9I7SMk8JZUn4nKv90pxXw3Bk+hOTgr0Gt3lmjSDpxN+XhI/0cxToDnoWXcbQNTTo/qTtOjcFiVmmjYfzdPv4BMemuYYL1jyR2ACAdqe6F1iTriMQNIoTeC6ERCYXNXZZBQpxl+mpdmYlDu+itpQNtG2v0LxH98HcoMZveoQSpj5A/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8gAq5SHGlhJtmqof+x0gOakD5TOlbbthR7QFVLWPOKY=;
 b=tH+ty93h3u2su/0rGFxMYdXiAPjUzaCKYUiy2sSCYpVjxc7poGVIujh0xtyZXalCu490SUbmSNxrHvEwWJROt5Fmaw53VBDY0yfbBy6LDtftK4PLbNEbSOHR16qaxJ6mM2gXh61vlOSnnpkcB4+4X1mBAFwf78uG9zx3bZ1YqMrBAyATQMsnTogR0MNkr6rIPzSU++qdSyLUJ1i069L7E0r7Lu4cP3SGpECDJKjPSxC+hdGXGYYgx3a770leXRh4LLN3oOJw7f3Yiblv4hjnQ20lJ49nwGiSU4K5wpUd8uFLci3xJYu2u43LlouivFbMHrripgrI2z13rZP/fDPQlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8gAq5SHGlhJtmqof+x0gOakD5TOlbbthR7QFVLWPOKY=;
 b=n2X2oje/jS/0gq2kXe633c4ANmo+tE9CSl2uPFB1D8MPw5DzCjmYG7dPSGygYTpjTz4o/m0zySsVdYj4IngalBrwea382dl8Q4mzHBRbplms4Om6QhsqZbRHRqTa76wkdJbgEu/OAmX1BpMts95MshhzHZCbOh9JiKzHVhXXrFF1tXxyaGsEVd2SjkSpRmhsg2OxQk3naPt+3UeDsKaS4gMADH1TbxdF7amD7+O1Ira3c4Lq3neOh8ZAAEPzna8eyZJAQJCDCwFxK4PHTkegl90pbGhUAY24nBn8CxIo+h1VQgft4F1WVsXd+zKZe4jrEw7VQN2RoJAqlZZ09zlKug==
Received: from SJ0PR03CA0249.namprd03.prod.outlook.com (2603:10b6:a03:3a0::14)
 by BY5PR12MB4049.namprd12.prod.outlook.com (2603:10b6:a03:201::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.42; Fri, 10 Apr
 2026 08:37:29 +0000
Received: from SJ5PEPF000001F3.namprd05.prod.outlook.com
 (2603:10b6:a03:3a0:cafe::cb) by SJ0PR03CA0249.outlook.office365.com
 (2603:10b6:a03:3a0::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.43 via Frontend Transport; Fri,
 10 Apr 2026 08:37:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ5PEPF000001F3.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Fri, 10 Apr 2026 08:37:28 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 10 Apr
 2026 01:37:17 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 10 Apr
 2026 01:37:16 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Fri, 10 Apr 2026 01:37:11 -0700
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
Date: Fri, 10 Apr 2026 14:07:10 +0530
Message-ID: <20260410083710.54993-1-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <9e1093e6-18f9-4edc-8659-510245c5d6db@kernel.org>
References: <9e1093e6-18f9-4edc-8659-510245c5d6db@kernel.org>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F3:EE_|BY5PR12MB4049:EE_
X-MS-Office365-Filtering-Correlation-Id: 14374aa0-250d-4f9a-cfc7-08de96dc6680
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|7416014|1800799024|82310400026|13003099007|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	tAKjWIsdeRY3G9QgZE0+SReQr6UeneY2oTcVk33HuzNMqiSyICd77ZWxqA0Vl20zWJJXMNNLfpsJ1aADY0aMSfi6KbEpKfK1vd8B0oJhhN2hJ4E+AjMKJMLKpSTdZ2MgXgVbBI5yfIlX9Irra2z4uAEVb8z57IRI0EeGJGq9Bepo0DUBjYJRB9d+haRZe3+2RqiBfapllcQGWMvax4TL/Uffp1NiPX1cne5oW3gpc8tMus/O8AysCoy3nHTsUS6ToNXnN/JxJ1KV68FAY8ca2UrgBJZ3JRuOIz1rgPLRCVssO0T3Ql1UWJ5c2abKDzAjRVrWs/7YdYHaon4jGNGZQF49rLmQ5wdh/BIC7A0iDp4nFv9urxy8fPUI2/VzcXYlp8psA3Z8uPwhPZlVPBtk10bdwn5VRWRDcfrWU3jkS5lYZm2dlvj/meD/lfeRbHTtHGM5ySWUIqAELnUPZBG4XQV3p5gu3oDH1ffmB162Dpz0Zss+227jDjNA6Re9EIv9+3d66lDh2AHhjuYbtAToP90kp/X4hD9fZxrUg3esCbDPq7/0jbSW18401XyTSUFQIhIWaCEZyMy4tW8PAEe4M1MQyz7+WTF/bnbJZUrHDdeMG78zg2GmUhrpHVbPGRE4Cw/J9cCDqq38c9W0yZk0/KXmNg4fhtwCi2y0F05nCrKowibV2Qz7teMKUOvHsmK9RGnV9KymJ3rF9oWWmgFGq5xuc2LowSrjSh5m8NWsdG/CIuCbuAaK7xTbr8c+sUVP7J/3zKvrrLNUd0Jba3Vaig==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(36860700016)(7416014)(1800799024)(82310400026)(13003099007)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	C0c5LhY/AfEGi7Fd5gd62UM/zln1ySYD8IIVQJFEumOOelZTOaB6T5cHgek53I493O+SqvZwAk+55s4f9bxx1dBZEo+ZeW94Apw7RUfdDO3skDf3jVe6VIA+N5C6nyFZcqkPT8rVj7VZOEdhjcKi/gJJXMOlkGMm7ob/EY7zlyEoCNKvisIbmx+xbPsBvGV2EOBQ1jOm9EnOlTtNBFveH1Ide4Yu4njOhvRTyQRIMJfaqens+rEnpiulm26iUvAKvQ2xpT3jRxJZr7ROaNGhDnqV/6t0kJgGXttdmx49Frw51wJMAP3TxZ2tUUVKimWZka2Bx07qB43FSpgCuvfEBVRJkw5CfxMlr3h9XPJVX/gMPenK3t6QmxOeQkkmtsZ3FTMX93DhpjqYoiDEixNHEWWmGmJ5NZSmD1wd4O9uHSIU/rYYoUKLGnXIoGy1BQiO
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2026 08:37:28.9426
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 14374aa0-250d-4f9a-cfc7-08de96dc6680
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4049

On Fri, 10 Apr 2026 09:18:48 +0200, Krzysztof Kozlowski wrote:
> On 10/04/2026 08:57, Guenter Roeck wrote:
>> On 4/9/26 23:39, Krzysztof Kozlowski wrote:
>>> On 09/04/2026 12:57, Akhil R wrote:
>>>> Add I3C subsystem support, DesignWare I3C master controller, and
>>>> SPD5118 hwmon sensor as modules to the defconfig and therefore
>>>> enable the support for SPD5118 sensor on SOCAMM found in NVIDIA
>>>> Vera platforms.
>>>
>>> git grep for "Vera" gave me zero results. Are you sure this is an
>>> upstream platform? Please point the DTS using this.
>>>
>>
>> I think this is an ACPI based system, or at least that is what Google search
>> tells me.
> 
> Thanks. Following Google Vera is either a "CPU" or entire architecture
> (at least that's how they call it), so it does not have SPD5118 sensor.

SOCAMM is a Memory Module. SPD5118, as it's Kconfig mentions, is a sensor
found within such memory modules. I didn't quite get why would you state
that the SOCAMM present in Vera architecture (or CPU) does not have
SPD5118 in it.

Pasting the below from the Vera Rubin product page [1] -
"NVIDIA Vera CPUs add enhanced serviceability with small-outline
compression-attached memory modules (SOCAMM) LPDDR5X and in-system tests
for the CPU cores."

[1]: https://www.nvidia.com/en-us/data-center/technologies/rubin/

> 
> 
> "Nvidia vera socamm" gives me something about "rubin". It's not me who
> should be guessing all this.
> 
> "nvidia vera socamm SPD5118" gives me even less, so justification is flaky.
> 
> To remind, this commit msg should convince why generic kernel for
> developers affecting all possible platforms - not end users, because
> they always use distro kernels - should enable these configs. And it
> should bring me clear rule what I can or cannot remove from defconfig,
> if in 2 years I come and start pruning it from symbols.

I found little details on what we should be adding in the defconfig. It
would help if you could share some guidance. Do you mean to say that the
defconfig should include only the configs which are necessary in
development platforms and not in end-products?


Regards,
Akhil
