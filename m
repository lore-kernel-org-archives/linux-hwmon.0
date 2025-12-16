Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010027.outbound.protection.outlook.com [52.101.56.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB5F9320CCB;
	Tue, 16 Dec 2025 06:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765867800; cv=fail; b=cxiL/Fwwi37DkH70OjpzcjyZ01SS9SOgNajw2nkbjvDRnDaiq8PkLF3jj0uGWw3AU4/5R/utHVaZ3i3Oe+oyQcLH4DMbfxwLViSHFUOOe5gg9WsTUQGCuIfP8cMxIo3San6363DLo8wso5F2KmomJ5a8EmSn+2D8TVgDbpjI6i8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765867800; c=relaxed/simple;
	bh=6IQXYvRq0sBL0FuCDRLajT5ROKsIU3h2AbqNfuU3uk8=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lnoah7Owe11orspqkx3Zlx6WM5oKCMoQjlJO7Jcr/kKO8CoYcYpGWk5D/v3kPAFf17mVPifr25g1tpGjrHln9IYR+dCT8mX94t5gcSd0xVCzLbG8YxLIaZ4NoGNqFf/WF422J4MzK4mDYiAwHP0Q8or+KmwYakKcPY3S71saKbw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=GoP00wsO; arc=fail smtp.client-ip=52.101.56.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="GoP00wsO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cjVLkJyUgpA71d9oXY0dnlg4+N4Efawh0CuZytqvGKcC5JVnngFoX67cKOvz/H0x41a2IhA4fD5V17L3ZSO2ATS6Zt0buAQaSJ433Om8T3lYvHreOForPyZqC/pGxUfaYq0PmN2tJVQBl2p1hpN6B+PZ3A20NwLviJvp0fPl9UuT97LQzYoy31q/Gqy/AHDzyYD+EzqQk5jBm0AgoyR1rOqPkr8JN6rqBUCA8/+wLvDm8bZ/gS0Vs75K2ErE1Q7SuygugUDErbMvgjYSXVBOvLTSxeZUWbMmZF4JCl1G5VtqaS7UAqY6AhoDfCBnB4dqD+g26BhJsrYpL/B3L7tVNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aFL8SptuXtqd1+Bf+1Jii15iIltF3szi1VA4UJY0eQs=;
 b=GE1YxItETlLXrx8A3h3AoAR6H/zzxNtJcBaVHEaF8pBLlxO4edZgh0t8oH9PTqZw3LRLq1853SscQlYwW+JoaWjZ8LaUyM3W9DmMla9IdjmfnR1BmULwUUNow50Z0leDN9vOHOo3LTqipUDmx0y48hTKH187AF7RSId646V9Wxw/Af6evU73ZdJhtwjCTrd2IBdjYV7vcNfDSVBr20KrK1WePvEZzjHFbCjYQxgE5Ne1wwTnUqdNAftHCUIZa3eTf2LgyuDqte5RnXYGRd7onq4Fk+o2yqZnF0P2Q/KAj0eCXC1gqwgTjIqZcvOCEqGOYc00JejoFnpa6z7+vPGJCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aFL8SptuXtqd1+Bf+1Jii15iIltF3szi1VA4UJY0eQs=;
 b=GoP00wsOuYAskw2VKI7tgZMXL/8mQFx8qmYQGWG7vYe//N2CV+HnQZT2S9Rny+E7EiOGy4+GHerP85OhGu4oyXDL7UgLo1mFnobUZtbvdc8TPudj39pWnYp10a88Q4KQuZS4kdN7x6pfjkb9PrHXqknJdUUBjLIA7Tvc+yqevN9JraPRu5eS1xg5rEE3Uvg8uQSN7OPFHb8RlMAhfuwaqJ0L+/9cHUVuw/V6eAcxgN0f0aIK3pXFWJBeRk+UoOo0/wl/kMRNu+gk8Jpapttu7puVHIUMwgqoDEcNoR54JiZFsnWxS4+9zi/LalGUCGGxDWEN8qhxxrZ5ZFXVDUOGGw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from BLAPR03MB5458.namprd03.prod.outlook.com (2603:10b6:208:29d::17)
 by DM4PR03MB6857.namprd03.prod.outlook.com (2603:10b6:8:40::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 06:49:35 +0000
Received: from BLAPR03MB5458.namprd03.prod.outlook.com
 ([fe80::7eda:fa34:15f9:e656]) by BLAPR03MB5458.namprd03.prod.outlook.com
 ([fe80::7eda:fa34:15f9:e656%5]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 06:49:34 +0000
From: muhammadamirulasyraf.mohamadjamian@altera.com
To: Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org,
	Dinh Nguyen <dinguyen@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ang Tien Sung <tien.sung.ang@altera.com>,
	Khairul Anuar Romli <khairul.anuar.romli@altera.com>
Subject: [PATCH v1 5/5] arm64: dts: socfpga: agilex: Add hwmon node
Date: Mon, 15 Dec 2025 22:49:26 -0800
Message-Id: <20251216064926.15817-6-muhammadamirulasyraf.mohamadjamian@altera.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20251216064926.15817-1-muhammadamirulasyraf.mohamadjamian@altera.com>
References: <20251216064926.15817-1-muhammadamirulasyraf.mohamadjamian@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR08CA0008.namprd08.prod.outlook.com
 (2603:10b6:a03:100::21) To BLAPR03MB5458.namprd03.prod.outlook.com
 (2603:10b6:208:29d::17)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR03MB5458:EE_|DM4PR03MB6857:EE_
X-MS-Office365-Filtering-Correlation-Id: 4209d714-8197-43e4-5f48-08de3c6f4606
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?aFgjjnn3JtRi9EqpSLF+QkAOeiHaH+NQ7tN/ZiPybZSa4OI2+Mg1k3/d+qRu?=
 =?us-ascii?Q?k/C/fPEl+ByTHp1Uu57BEznIs86HR1ar785ZwUQF/1nYMOngVPCv9sXIkqae?=
 =?us-ascii?Q?b4tceKikDLHwxipuOrpu+0Zs0TwnmSr2iqTfl2Y8LDKKNyLMCLAZZe48DJ55?=
 =?us-ascii?Q?WXJQAIrconfks2D+xVwEeitjARKYFp5nQZ7IyyYh3ni2Fhf00qyAnYrjXvmt?=
 =?us-ascii?Q?3iNRygp+GgUz8uGZsLQmT4yQp3QQPDhiAfHSg0oApkMnmGzsMK91+eFfQ0Vc?=
 =?us-ascii?Q?tKB3/VRN0cGHtHaxBMhwtidfQyg8cD7QIPI7yhC4uW/3NnesSzZegz8HWlKr?=
 =?us-ascii?Q?JqmGEmdAwuk0ke2qGgXm3SUNMgvQPSDc9m/WbzpKfkRV/Pje5CB3cqS0ev7P?=
 =?us-ascii?Q?6Ifc2L5DxyzMQ9W/D3KzHmlP6x8gB0ZppvArvv++qwgv1ns481oJYHPxZode?=
 =?us-ascii?Q?SyIxGKyEyMB5upVkLKFwQLX57yUF2PD/iYATc5A1QQJcPBw7xVYPhf7af/aV?=
 =?us-ascii?Q?CGIupaPAr6o3Mw0n05N3se+enNmA8LnfsQ1IIPuOE76nIRBZSf/Gn+OniBnn?=
 =?us-ascii?Q?aJ2zWpNXgVJkG3HMmsrgxnW0MhBMFroqM6rzbEGDdrRkWta3VADwPTGq2kcr?=
 =?us-ascii?Q?GIo5r+YEWTetgWEOy7zYloioDeVVjO1fKKJqgX29XRnd92Fq5Uz3Fc79qQcv?=
 =?us-ascii?Q?226uCvcvsn2/sFCDfxy/oISxXJAQMnoFQwjnonvhqPYVYwW2tS/GbUx2nrpg?=
 =?us-ascii?Q?HNFg0kUMdVcnXTdXp5C3NctVzVJFtfaAc6Te7jZqTFAKlA2dFbTwKBhBuqb4?=
 =?us-ascii?Q?giHOlzP+OEPNWwuaW+X6cgfeTxcgdmhtWfSi31bZffZFvezHDmTWWKoooeML?=
 =?us-ascii?Q?dvW1e43JyG8tghA0msBa+0eH5KtvF99Hf21sZUsy5hx6xuxqZnSqT8DpiVvU?=
 =?us-ascii?Q?q5MjKCcuERT6b31q5+EqJzqj2PGpCSO6ZiU6/lJoVOEEAlCzC04rVN1eP9KF?=
 =?us-ascii?Q?/D5BKV5COYZwXqzsPfE3wM0DXmoF36vbh+/275pg1eZuPlOnIJIM1d2OjVJF?=
 =?us-ascii?Q?baqb1Zcpz+HdsAN21fX17gLcdzsS4rVFGj0jkT1kJFaa2THWQ6rWkjWPofCE?=
 =?us-ascii?Q?KrmZiamlOc+lhqcP+Buuae0IYiwcNWs2S0cZbGyNhHytvCClTSGYDNziJ2LF?=
 =?us-ascii?Q?5sei7Sh8ImONDQI44nAgovs+VPJgM0DcTtIlMlyY9m+6c1XErdcMva+qOh/G?=
 =?us-ascii?Q?M+gGzu2RRk3/HuIBUX0QOCh0OM9GmInNuxLiisWjjHMyc3mhxyAw4HZjUDmD?=
 =?us-ascii?Q?le/EqdQ2efjUCtD5IMPHTJ0bi9FqXNCP5cTQBVFd+K0ovzU3zSCtZuk0cCN+?=
 =?us-ascii?Q?EKHDXkP2In17eSEFSgqvbPXRC0cNFqrlBgsgYfMNQHkM9vkEl0rsIOYAPWYr?=
 =?us-ascii?Q?lBvN0vJDXpimZu0IA4dMyflaBeAKdi7+4RdqwGAJ6hAh9kTUdm4HqGyz9mM+?=
 =?us-ascii?Q?/X5B4F/92Cdyklc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR03MB5458.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LVobKCbv5oIFn5/TPf5xa/SbrFa1L1mpZN2ixd+wOJR8YCP0rP2KyHxTrGT7?=
 =?us-ascii?Q?OLfw3svj/eEKbfBgMMaXvhqQsPX6lBXTlZc3bLEiYeBFTuCekU3uN5L1okZU?=
 =?us-ascii?Q?xa8G0hni+G8SHfABK00JuVy0yBTVLy+hW3wJ38A7CWHwQyVraWoAxKPQ48Dq?=
 =?us-ascii?Q?5S2yAXkyYV+7NHvL2B5eDaiCQqbh/fT+9t0sGzUxrqNoDOKyA/6GBfIt2AS0?=
 =?us-ascii?Q?WHS/slKvffIbnVhtRxKevr4B+XQv3XdK2VaEo6TdKur0ZHCIT3+1+F99omC9?=
 =?us-ascii?Q?N0VkAbPHPZ7MvJnVkjrDmop7sG5GGz3J6ErONDKambyKT/L6B7G7ECZkWAIL?=
 =?us-ascii?Q?1xHC34Wwx3IDxm88VL7SyoUnCWjnAOwzhg1+EncRVv8Cfalks82prwlsHUVz?=
 =?us-ascii?Q?V2jpADvBcVh11ExIFKxi5y/8m4PHQZpCXN/FvVHdNmJuU+lYgUwIW+zlv1vH?=
 =?us-ascii?Q?AFSCqGBK1q8/Ghts2FhF8RZXdke1qI3mwVJphsAsIQp1SHN+cuvrFIqT2mxs?=
 =?us-ascii?Q?tBS/alxWBdgUeYwTtYb52deoZNikZxhhXK50iRMn3NVYgayiybY7PWdFm5+S?=
 =?us-ascii?Q?eVzprwUsBbSzpkNmV0uJSH2obghLEQpvrrFLFcX0/fOTCzmCeA4RGSZxKgSY?=
 =?us-ascii?Q?Ae09e3EGPLfE4R/SVpFJ+fXcZ3vDA9Vo4zosQzG0roMY+Bjs94Jjsw3nTce+?=
 =?us-ascii?Q?yqSK6et6JCbY9878Dm7dIxqZue1wEVPgQrRqPTYoiNUDzOQ+qr5J8ozwUAwz?=
 =?us-ascii?Q?3NgPG07IAa7B1O/R1Wj55HOhVrbxkNsYtOA0kx0EMkxxBwLmHi8p0/0ZTTyE?=
 =?us-ascii?Q?qyDNrWNqvHC9qQpea4l1H3oIJsMQK4g0GGpm352Bo/w79oLrb1/Iog+eORgX?=
 =?us-ascii?Q?gzdc6Ji4cOpYE/aE9c1AdqtnsLBND6wvwWRdsXT8TyJye6t/s6P88UjPplb/?=
 =?us-ascii?Q?79K10wKe5cmXzUk974/zkOzIZXhRjLKqxpEYoP05v5drNS91FgeZSqr9tb3L?=
 =?us-ascii?Q?dG6+Ulo+65EwxrDboscQS84mhuDzAciFNQ2sb04xbi+PvkmPF/PoxmTbeYkb?=
 =?us-ascii?Q?ObJyIVkhRBWCcj5wqIEvFjidwXqYrX/ftPicnKmUAwta4zUt6YoFVm5/QGpv?=
 =?us-ascii?Q?motId+ri1uRlBy+7Z409zTOEu0kTs6rlgSXOKRCxvHa2ATYXoHphK7A6qe9w?=
 =?us-ascii?Q?BtYJaWBBKX6GCE482KFyVnPaPqZSEIJHsX8msqBxOG03wOy+1wftCg+3DgH8?=
 =?us-ascii?Q?ca6Q0+W6RKVOUmUxlRnQsSeHK+HOrJtoUvwedF2pvifVnRsUoWHaGxv9tDqp?=
 =?us-ascii?Q?RvXh4wsvaA/mVjj2GxzyhxKwDClx9TbFZ9mORhcNwRznDkis8T7ECKBqXNer?=
 =?us-ascii?Q?jcVynIhwl4yGovLmVb/uib+jM7xoPOabWVr67suICVVX8TUwA6lpYbuNpoRw?=
 =?us-ascii?Q?UqtY4/TBTl6hF1jPm72b7tnfxXRuhs2xP2Srb3nF8v2UUGSb2oYdm1lUcvBd?=
 =?us-ascii?Q?mnS9YvvWMRXo0GZTjBe2c3NLqvpWbUNjT5rHm5qrhNZtbI5Ky4TwY/pqN+gf?=
 =?us-ascii?Q?wIQbZ91bQN4U8Q+sMhAmCVRwWUskBqP0FX1tH7+ECoKBA+2gOXMNO7PNvU3i?=
 =?us-ascii?Q?1h/XakGDfvopL0Ive0g9p8CyeSDGxuQ63LRaTvaWXDqNt/XFpen2z3kM/9IV?=
 =?us-ascii?Q?E9Zx21RS3X5MJ0+w5JHBDgpK7YWXHzJg1fd5d1GJAc0ANMcmZmjMb5552ySQ?=
 =?us-ascii?Q?FwkNjj4nprhZCwfuLJQ7ieRZaFpzLltJoPg4CXLkW/LJisyzZhPupShDueSt?=
X-MS-Exchange-AntiSpam-MessageData-1: J1Ny2NNDJrqyXA==
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4209d714-8197-43e4-5f48-08de3c6f4606
X-MS-Exchange-CrossTenant-AuthSource: BLAPR03MB5458.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 06:49:34.8170
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VClAIDJP70yvcPl1iuaHeRLrJH8AbrzkQFYwSEh4p0eeeUSeTQBBPuC4GgcKudFALeqXYf1jA1yTFyp5DPuAKyCo9GKxosxw82JAPWLSMS4XQ4Gf2nF/CTYVEIsxEz1XVfBFOfU9tkUm+fS17jt+2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6857

From: Muhammad Amirul Asyraf Mohamad Jamian <muhammad.amirul.asyraf.mohamad.jamian@altera.com>

The Agilex SoCFPGA platform includes hardware monitoring capabilities that
require proper device tree description.

Currently, the Agilex device tree lacks an hwmon node, preventing the
kernel from binding the corresponding hwmon driver and accessing sensor
data.

This hwmon node with the compatible string "altera,socfpga-hwmon" ensures
the hardware monitoring subsystem can be initialized correctly, enabling
accurate voltage and temperature monitoring.

The node is added for Agilex OOBE Daughter Card, Agilex with NAND daughter
card and N5X.

Define the temperature sensor locations to demonstrate the maximum
temperature value rather than the individual diode values.
    - arch/arm64/boot/dts/intel/socfpga_agilex_n6000.dts
    - arch/arm64/boot/dts/intel/socfpga_agilex_socdk.dts
    - arch/arm64/boot/dts/intel/socfpga_agilex_socdk_nand.dts

For N5X, only the main die sensor is present. Also, add Voltage Monitor
labels for the N5X device to align with the descriptions from the N5X
documentation.
    - arch/arm64/boot/dts/intel/socfpga_n5x_socdk.dts

Signed-off-by: Ang Tien Sung <tien.sung.ang@altera.com>
Signed-off-by: Khairul Anuar Romli <khairul.anuar.romli@altera.com>
Signed-off-by: Muhammad Amirul Asyraf Mohamad Jamian <muhammad.amirul.asyraf.mohamad.jamian@altera.com>
---
 arch/arm64/boot/dts/intel/socfpga_agilex.dtsi |  4 ++
 .../boot/dts/intel/socfpga_agilex_n6000.dts   | 66 +++++++++++++++++++
 .../boot/dts/intel/socfpga_agilex_socdk.dts   | 66 +++++++++++++++++++
 .../dts/intel/socfpga_agilex_socdk_nand.dts   | 66 +++++++++++++++++++
 .../boot/dts/intel/socfpga_n5x_socdk.dts      | 46 +++++++++++++
 5 files changed, 248 insertions(+)

diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi b/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi
index 0dfbafde8822..0e91a331da69 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi
@@ -69,6 +69,10 @@ svc {
 			fpga_mgr: fpga-mgr {
 				compatible = "intel,agilex-soc-fpga-mgr";
 			};
+
+			temp_volt: hwmon {
+				compatible = "altr,socfpga-hwmon";
+			};
 		};
 	};
 
diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex_n6000.dts b/arch/arm64/boot/dts/intel/socfpga_agilex_n6000.dts
index d22de06e9839..f45a76bff82a 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex_n6000.dts
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex_n6000.dts
@@ -64,3 +64,69 @@ &watchdog0 {
 &fpga_mgr {
 	status = "disabled";
 };
+
+&temp_volt {
+	voltage {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		input@2 {
+			label = "0.8V VCC";
+			reg = <2>;
+		};
+
+		input@3 {
+			label = "1.8V VCCIO_SDM";
+			reg = <3>;
+		};
+
+		input@4 {
+			label = "1.8V VCCPT";
+			reg = <4>;
+		};
+
+		input@5 {
+			label = "1.2V VCCCRCORE";
+			reg = <5>;
+		};
+
+		input@6 {
+			label = "0.9V VCCH";
+			reg = <6>;
+		};
+
+		input@7 {
+			label = "0.8V VCCL";
+			reg = <7>;
+		};
+	};
+
+	temperature {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		input@0 {
+			label = "Main Die SDM";
+			reg = <0x0>;
+		};
+
+		input@10000 {
+			label = "Main Die corner bottom left max";
+			reg = <0x10000>;
+		};
+
+		input@20000 {
+			label = "Main Die corner top left max";
+			reg = <0x20000>;
+		};
+
+		input@30000 {
+			label = "Main Die corner bottom right max";
+			reg = <0x30000>;
+		};
+
+		input@40000 {
+			label = "Main Die corner top right max";
+			reg = <0x40000>;
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex_socdk.dts b/arch/arm64/boot/dts/intel/socfpga_agilex_socdk.dts
index 9ee312bae8d2..33b5286655ef 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex_socdk.dts
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex_socdk.dts
@@ -136,3 +136,69 @@ root: partition@4200000 {
 		};
 	};
 };
+
+&temp_volt {
+	voltage {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		input@2 {
+			label = "0.8V VCC";
+			reg = <2>;
+		};
+
+		input@3 {
+			label = "1.8V VCCIO_SDM";
+			reg = <3>;
+		};
+
+		input@4 {
+			label = "1.8V VCCPT";
+			reg = <4>;
+		};
+
+		input@5 {
+			label = "1.2V VCCCRCORE";
+			reg = <5>;
+		};
+
+		input@6 {
+			label = "0.9V VCCH";
+			reg = <6>;
+		};
+
+		input@7 {
+			label = "0.8V VCCL";
+			reg = <7>;
+		};
+	};
+
+	temperature {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		input@0 {
+			label = "Main Die SDM";
+			reg = <0x0>;
+		};
+
+		input@10000 {
+			label = "Main Die corner bottom left max";
+			reg = <0x10000>;
+		};
+
+		input@20000 {
+			label = "Main Die corner top left max";
+			reg = <0x20000>;
+		};
+
+		input@30000 {
+			label = "Main Die corner bottom right max";
+			reg = <0x30000>;
+		};
+
+		input@40000 {
+			label = "Main Die corner top right max";
+			reg = <0x40000>;
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex_socdk_nand.dts b/arch/arm64/boot/dts/intel/socfpga_agilex_socdk_nand.dts
index 98900cb410dc..5246bf8b14b5 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex_socdk_nand.dts
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex_socdk_nand.dts
@@ -114,3 +114,69 @@ &usb0 {
 &watchdog0 {
 	status = "okay";
 };
+
+&temp_volt {
+	voltage {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		input@2 {
+			label = "0.8V VCC";
+			reg = <2>;
+		};
+
+		input@3 {
+			label = "1.8V VCCIO_SDM";
+			reg = <3>;
+		};
+
+		input@4 {
+			label = "1.8V VCCPT";
+			reg = <4>;
+		};
+
+		input@5 {
+			label = "1.2V VCCCRCORE";
+			reg = <5>;
+		};
+
+		input@6 {
+			label = "0.9V VCCH";
+			reg = <6>;
+		};
+
+		input@7 {
+			label = "0.8V VCCL";
+			reg = <7>;
+		};
+	};
+
+	temperature {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		input@0 {
+			label = "Main Die SDM";
+			reg = <0x0>;
+		};
+
+		input@10000 {
+			label = "Main Die corner bottom left max";
+			reg = <0x10000>;
+		};
+
+		input@20000 {
+			label = "Main Die corner top left max";
+			reg = <0x20000>;
+		};
+
+		input@30000 {
+			label = "Main Die corner bottom right max";
+			reg = <0x30000>;
+		};
+
+		input@40000 {
+			label = "Main Die corner top right max";
+			reg = <0x40000>;
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/intel/socfpga_n5x_socdk.dts b/arch/arm64/boot/dts/intel/socfpga_n5x_socdk.dts
index 0034a4897220..5ca111c158c4 100644
--- a/arch/arm64/boot/dts/intel/socfpga_n5x_socdk.dts
+++ b/arch/arm64/boot/dts/intel/socfpga_n5x_socdk.dts
@@ -126,3 +126,49 @@ &usb0 {
 &watchdog0 {
 	status = "okay";
 };
+
+&temp_volt {
+	voltage {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		input@2 {
+			label = "0.8V VDD";
+			reg = <2>;
+		};
+
+		input@3 {
+			label = "0.8V VDD_SDM";
+			reg = <3>;
+		};
+
+		input@4 {
+			label = "1.8V VCCADC";
+			reg = <4>;
+		};
+
+		input@5 {
+			label = "1.8V VCCPD";
+			reg = <5>;
+		};
+
+		input@6 {
+			label = "1.8V VCCIO_SDM";
+			reg = <6>;
+		};
+
+		input@7 {
+			label = "0.8V VDD_HPS";
+			reg = <7>;
+		};
+	};
+
+	temperature {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		input@0 {
+			label = "Main Die SDM";
+			reg = <0x0>;
+		};
+	};
+};
-- 
2.43.7

