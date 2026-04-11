Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010013.outbound.protection.outlook.com [52.101.193.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F57C2DBF76;
	Sat, 11 Apr 2026 05:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775886089; cv=fail; b=duSNUK/aXOnC9fzn/rcaofSEwcc2D5sFBvR6VPUgeYDdDCWXTm/8zFeCu3zWM8iPh/KgDvAo8FqjezkTnuAcQUbpRo+ZoiKDe0tTjNJkFKZB4orObMzHca7zw2oXXn5IkbKCYVq+ZC7lluubSc3EZov9mDU49P6pEvFZtXb69w8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775886089; c=relaxed/simple;
	bh=Zi9YYF+wD3IxeiqdEoqw08las5xMg69g9vfnkqCvOFE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I+a/+/S6mBuN8TNQF8sfVll6WHAMs7x0acXPe+pJRlrAhisEMj+XsVow1nJT/9Qzoa149Vv/xyJbYvu62+uOX4C4LUJtc73OUjeyvXPqS6U4Kk7OJgxAn49pSEA3X2sOjjDbupCGUKcJmMz4WvZZAoA20dLaOStf+InbIHZcT88=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Pis9ojEK; arc=fail smtp.client-ip=52.101.193.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Pis9ojEK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=klh8csoBwx+q1yCpLdWUY6IA1PPVLnotYZI7cBifKkPtNw0GSz3S2Js8IqV3ItPGlb5PuXOhVYmZxcoJ053kXsSt7n/XANGb8gXcH/iw5AmNuorWsDfpk/NBaRx+08vAJn5GcgR8wskTLI7n8J2VxpESuIR+E29iaHkh6zyFUPD4uQa03oSwZenDSzDqr7qArnya4MdC/OHDpjlMOywoDJtIqDSp9Dp6MDurO6bDIHBKkEX0YhG62oFlr3q1kqwgTWuPb7F5g40LeuljWRce6taP//JDfAD5NCcQPSqieOeyAQoxX8Ak0zobxhUNzF0atIpP+QWO/CuDoah07MafFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aK+vOWvDBFMpLXYOmQRle+HbReR4882LXreDCWONZFU=;
 b=vLRhzz/qKVmpHEcqhym0sy3lWgXH3MLX160zOBkquBa8wanFKahxoEctr/OTA7lAgiC2bOljPjGDx5UXZFgq5XAI0aV3D8sMTw/WT+79ka5VlO+gxJPdjqOO1TOTGOWZhFQgwL56oEjyY1JzUPnnUOr0jZsd2fEF36MZ/tN7sOBcjMtn4exbkkbhA5sZylIRDvH9UDShwXInd76wNS8poD3BdkZlebYFabRcYToOZg/5pyKyn09nTuy//gD/bpNjJakl/WIjOlmI4hR/DQiwkd0rE86DaHuD0Z+3UR4jpwE82dXzZ82tsbiYphgxT+BInVz24fmTx2hHEaO0oJErVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aK+vOWvDBFMpLXYOmQRle+HbReR4882LXreDCWONZFU=;
 b=Pis9ojEK1o4fI7Zvvsgy7Edd2a2KXMcrFKBHDy9xQysBwSKBQPwmLebtNUU39p3qilIV39FL5OSRuAonuOCmAzMfhbMIxsSJgXVaIUXFqBPFt6fpe/a0cihUJUYwk+95uP7yZx9krXJDUmSUnovxshGSrmHOKLLuIn395tzF+bQ1AiXuygb61k35eXFqIETPkIPOMtSCLdnq2HzK7v18x6VkJ7YZPXONsXz/mZ+bQOgMf2IZylBJ/GftWI4p7mseAFVerP9tXEfSX1A3dvHGy/rXQb2bBwXdZrICLVDbwD34/0eF7Xo8EUnofAA3Y/ly2WY3JF/Tzhx+kfV1Niojlg==
Received: from BYAPR11CA0076.namprd11.prod.outlook.com (2603:10b6:a03:f4::17)
 by CH3PR12MB9218.namprd12.prod.outlook.com (2603:10b6:610:19f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9791.33; Sat, 11 Apr
 2026 05:41:22 +0000
Received: from CO1PEPF00012E83.namprd03.prod.outlook.com
 (2603:10b6:a03:f4:cafe::22) by BYAPR11CA0076.outlook.office365.com
 (2603:10b6:a03:f4::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.42 via Frontend Transport; Sat,
 11 Apr 2026 05:41:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1PEPF00012E83.mail.protection.outlook.com (10.167.249.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Sat, 11 Apr 2026 05:41:21 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 10 Apr
 2026 22:41:11 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 10 Apr
 2026 22:41:09 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Fri, 10 Apr 2026 22:41:02 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: <rafael@kernel.org>
CC: <acpica-devel@lists.linux.dev>, <akhilrajeev@nvidia.com>,
	<alexandre.belloni@bootlin.com>, <conor+dt@kernel.org>,
	<devicetree@vger.kernel.org>, <ebiggers@kernel.org>, <frank.li@nxp.com>,
	<krzk+dt@kernel.org>, <lenb@kernel.org>, <linux-acpi@vger.kernel.org>,
	<linux-hwmon@vger.kernel.org>, <linux-i3c@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux@roeck-us.net>,
	<miquel.raynal@bootlin.com>, <p.zabel@pengutronix.de>, <robh@kernel.org>,
	<sakari.ailus@linux.intel.com>, <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH v2 02/13] ACPICA: Read LVR from the I2C resource descriptor
Date: Sat, 11 Apr 2026 11:11:00 +0530
Message-ID: <20260411054101.50827-1-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <CAJZ5v0jW9=VtjyjeoEDTm9hrGKP_BYUeuKCxcKoV-VsvM5otiA@mail.gmail.com>
References: <CAJZ5v0jW9=VtjyjeoEDTm9hrGKP_BYUeuKCxcKoV-VsvM5otiA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E83:EE_|CH3PR12MB9218:EE_
X-MS-Office365-Filtering-Correlation-Id: 34e908d6-04b0-410b-0e0f-08de978cf638
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|36860700016|1800799024|13003099007|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	kpnPbVQy24QbgoaOT+RD0UGnuw2Hue+UmUShh15nA7LimZ4+kqfIJM7xU4PbWhOu1cjZkmtXlvD21qPgF/TqMzKm2q2zv855z3I+uAb51gGGMLgSzvQQv87U6FREs18sUkAV9nRnQ0CugBO7ISfrj05QYNtQ+LhV6J7KEtOgt6xqLzVKp+mNqkCwsbU0kxB102rmR3PQ9T7zBnARjs6ar2aD/Fq+w4nYT/fIFAl66xwAJKUH+3ds3V0tnhQw1Aqwgaaz6/UaSSN4D9C8gm7iALmnH8yzHncOnpdWrs91E/HFq6TQjgHM5p7pVS6AkZpYfc3HfSij2bp9FW5hQiOnjfXBMP0nVnWaI3HG21rvH/O2rLGtVw6CejSNmy3yhGFbZY/Df5fARIqMaU7l96co0Y1GnFNdf5drjAAcTwvWWd5qwe2x5Ibs+oS7VExjEcNXAGdcIeEC+rZmSPZ+9fbBLM6lKYHLmeZC/tuFbKTaFHeXyFY9b8RN4LRoZszTocmFhP8kT4uHzQflVZkv52DwxVw0hFkM8jznnRh0WsMvFf/XdvNhPVwp/fYRm6RsqyVJz0uqr7Bgpg6ZtorjQmX1aFG6YqOS3YMrtI0jSwfo5OhsIoysbzmKOPK9kAkWsBajSAIsExEzCWh85uGd5roceAUxSD0qqHl+pXSJbtrEFZUDFy0n/EO4DM72PuNt0/a+SCPH514hz+8ELO+TrR/MlgqJYitGP+K1TXVIZwuV/l4+pe4mIbQaY6up1zFd4sIPVx1QH1oKRctd1NJ+untqWQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(36860700016)(1800799024)(13003099007)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	D07tL7Gu7xXvNdbJBzKsooKMlLx7fvoOr8PmltRzUkCpbzJS7hE63CgEjeduA/tArKPMg7XoMGvcmCdA3OI5r0vl/cPzQ9RDDNL/CgQuSrmcI4t/SZFpudlBnhBbaQ7xaHNlawts8Sv6mPWk/QL7oO4rvo/yjFxjNiTzPSGTyybD//mX32Osi5kmF+ub2NLRAN30Fcm8DrMZ6/IWttGSNcjAMof2S5gGsNYbJTdZo93lR5FG7WieLGH3K95nDdVz/pGbqSXtl0mJzsJSTS0yF/IXgXo/BOLJrctF3LLqgaYOJYtceVvjzQHfPaQhz4XyHK080GGoFTInUMN0HF7i0Fi9Ewfl1P/u/FfI0LAvJzd1K8udnIWHhzSRtGgm6Q6+TDi4LZES1hcjvmLOdZBy6VqjYXjElNNVKQx+gx7A8dtaB2ZDHi7eNVMcR/LOLTza
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2026 05:41:21.3859
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 34e908d6-04b0-410b-0e0f-08de978cf638
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00012E83.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9218

On Fri, 10 Apr 2026 12:59:06 +0200, Rafael J. Wysocki wrote:
> On Fri, Apr 10, 2026 at 6:45 AM Akhil R <akhilrajeev@nvidia.com> wrote:
>>
>> On Thu, 9 Apr 2026 22:04:05 -0400, Frank Li wrote:
>>> On Thu, Apr 09, 2026 at 04:27:32PM +0530, Akhil R wrote:
>>>> ACPI 6.3 specifies byte 8 of I2C Serial Bus Connection descriptor to be
>>>> used for Legacy Virtual Register (LVR) data as specified in the MIPI
>>>> I3C Specification for an I2C device connected to an I3C Host Controller.
>>>> LVR will be read by I3C host controller drivers and it provides details
>>>> about the specific speed and 50ns spike filter capabilities of I2C
>>>> devices.
>>>>
>>>> Update the rsconvert_info to include this field. For I2C devices on an
>>>> I2C bus, this field is Reserved and unused.
>>>>
>>>> This commit is the result of squashing the following:
>>>> ACPICA commit 70082dc8fc847673ac7f4bbb1541776730f0b63e
>>>> ACPICA commit e62e74baf7e08cf059ec82049aeccd565b24d661
>>>> ACPICA commit c404118235108012cad396c834b5aabe2dd1b51a
>>>> ACPICA commit 7650d4a889ea7907060bfce89f4f780ce83e7b28
>>>> ACPICA commit 014fa9f2dbcc6b1bd42a4a4a6f6705d9cf7d460b
>>>
>>> These commit number is not existed at linus official tree. Please remove it.
>>
>> These are commits from ACPI-CA github. The files in the acpica folder is
>> a mirror of that repo. I suppose the commits in this folder are expected
>> to be structured like this. The process is also described here -
>> https://docs.kernel.org/driver-api/acpi/linuxized-acpica.html
> 
> While the above is correct overall, it would also be sufficient to use
> Link: tags pointing to those commits.

Ack. I will drop the commit IDs in the next version.

Best Regards,
Akhil
