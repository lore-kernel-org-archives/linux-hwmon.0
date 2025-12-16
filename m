Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010040.outbound.protection.outlook.com [52.101.46.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C71ED3358C9;
	Tue, 16 Dec 2025 06:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765867799; cv=fail; b=MQxoG7GqMAoBPUkIBKTeeCm3Mb4jj4U6CEvdlrgNpEfM4B18LC1Rs4QuTi8oYxv+JthDuK30VjFqbiH9KUzt9Cgk9tEu0zikjhAKUmMdFgcU2s68+IDxIqyVR8+WQUthwq30PJZ/QZBKkBj6mbV+aMFaeDG0O40swm2KO1wJp4s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765867799; c=relaxed/simple;
	bh=7QLedPnDn9r6MSgtqNDHnroSvy0l3TAldfnS7ZwN0L4=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ptIxJUTpm1rgTj47DLLGvB8lbRgSOmy2XgaqEUuPMecKjT340Dis9++fkPsACReOczeOuJ3zyxia3axZ1f+Raxs0orJxTFS3edOkFbovVfR314VrJ4L2X61wDjuX1JoXjavRMIG3NeEfYi6UVo0szDdg1gY6WHoOoT3A4fzAU6c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=UD8RHwMI; arc=fail smtp.client-ip=52.101.46.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="UD8RHwMI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iErrqdjoV4Gznl+Xq0D2Hzo3Pvk98sy265RJFJzolAaSM9kwfbwmPvZTxBrfGhARHBBYB9lC545HLSLnm4IJv4rX6vZUqyOPq7liSDUJfqYzH+QKU3H7NH5UDRcxgx9OXU6Fd7hXMh/tXrSn8RrQjPq3MaESGjX9eTPeCgZ/WIPe8Mp2tGqxXwGAH9N1oWAoe+KzFt/7Sha6AVA6OhKnP4YXXJTTf+gGcRxYXE9qcf2kaxktRvA5vyUDEhoE/nqeCvD4Glpudn1DP5IFN5zIWMyrsRj12br16iTNpDeL5GYXVfb1M86NCG/Z0K5nR7xorDuYO+qTjOsnHydVFwQVpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=os5bdvhJhBnKmcgqS8qPo1au3vSXDI6ES8d6pON+nTw=;
 b=sbcANBevzieV6/ojdwtyKMBNePv2xnSyjVzEl/Wx4DZbnbY+m5hot1wCk9CuN1Q74tJojD5yR2z5dmySdJUQs2qReHIvk/WGj/deK5EXg6pUir3XKLdPT8az6bRD4sBlhhesQAvx+3mQxdzuR4yWIq2aF+7bpQI2VOykfhaSwpwsWqGwF+GoiKRAkj21ZesQQx/su4vKVCV7j6rGtOD0bvC1eSx3gJQx+hrMak7xiIGc4Va22skhNUVzfZmhb6+2pgRYCgTVnMOL2f177ZgEN4bkp0fk//DYBYaBO/xAew+g8VCVN1EP+1zxDwWoWYv2xx+TBI4hgw8oV6dUb/OXuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=os5bdvhJhBnKmcgqS8qPo1au3vSXDI6ES8d6pON+nTw=;
 b=UD8RHwMIz2DuiO0gLzNPEAZTAYdFWVPkOYqlSaYtap8y9j9zFV4sUjUwpVa8zKZidb0kf6V6lhYPrvivoYHaRbcbbBalnQ+oaw+DSHdCBEm7jF5K/iOhBS9YuNY9hTu3XviOy2A4bOPlPZtU+JRvmZ8+KR+tGseKzXa/KlFRXmmH5arh5CX0Fgr20xA0muzImi2NgGBv5xanl2jBSRxz9C2/SmyrJKMHOli+yAkEX16tL4sTYt5PmJvD9BTx7AFvO2llzqxUKQk7pwgRNMTVSxNX1kHbP+Lb00fqV9MAljf3EUI6cemEjbsVAl7sLJZTeWrv4/X8W44Sihc6U2obaA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from BLAPR03MB5458.namprd03.prod.outlook.com (2603:10b6:208:29d::17)
 by DM4PR03MB6857.namprd03.prod.outlook.com (2603:10b6:8:40::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 06:49:33 +0000
Received: from BLAPR03MB5458.namprd03.prod.outlook.com
 ([fe80::7eda:fa34:15f9:e656]) by BLAPR03MB5458.namprd03.prod.outlook.com
 ([fe80::7eda:fa34:15f9:e656%5]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 06:49:33 +0000
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
Subject: [PATCH v1 4/5] arm64: dts: socfpga: stratix10: Add hwmon node
Date: Mon, 15 Dec 2025 22:49:25 -0800
Message-Id: <20251216064926.15817-5-muhammadamirulasyraf.mohamadjamian@altera.com>
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
X-MS-Office365-Filtering-Correlation-Id: 9c5f02b5-d6f2-4448-e6f3-08de3c6f4551
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XkLZjFULV1vlP0xz5WdlSgAsre1wjquPnx1WV6+cC0DK4NmNi08L6KGkGyu7?=
 =?us-ascii?Q?w1EmjVYhQUQskZ9oWEU5/j0ao85vnfgnBt1MU0I2+tjCMFt/fJ5bhgzgY8hg?=
 =?us-ascii?Q?vOug1fGMdNQffVHsWdSxZeVY/iFDZyOivEqmvEuK+HnxF3QTNRqvct2GO/Cc?=
 =?us-ascii?Q?/AJGD3Zk51KWws4xXf7p72fcQ37VjiPooJu9XqjqwbdYyb8o5sQTpt9i48re?=
 =?us-ascii?Q?3O9taPBhYtcuAru4aNkcSWNCor3P4EUABHT3ZY08tQ+NpE+JoOTlij9nsrwN?=
 =?us-ascii?Q?xi9EU9/0RDrnekymDmkxV1W3mObEpphrv+7R5puLFERXTLvkRk6SG9NxhXya?=
 =?us-ascii?Q?Oi6O9Uwjlqb4kMKLVs5ODUWqYhmz9jxiDVoejArmWn7p7X300jiv76kuO7oM?=
 =?us-ascii?Q?me+1xXsXqMJNF8zalMbPSy4Ys0M0FlPvqWLgXC2mgMqD6M0/Nv6igmP4Ph9a?=
 =?us-ascii?Q?Fx+UGxiz0wq9Ierwqk/aqYYRDJXVpH3DjRCoWXB9IMSyXJiYxAYHb8dIXOSC?=
 =?us-ascii?Q?ibdABlMCnguD8K13M3ChXSWKddXDiJNYMW7orHzfI3p6z3kcyYNamu17RXSX?=
 =?us-ascii?Q?/jLmFFD5mhXXrQm3CnZDbSf3tcui/0pSs7FlBFe7S2qHH1XJSWE7bOqI8Fsh?=
 =?us-ascii?Q?aoTjirNm34gYO/YmR9l+2vO7pb3NsYVjY2oRpGEa2lE1s/+Tg49JwhU8ERfO?=
 =?us-ascii?Q?jAziFeXEOIRfQ0ceaBazS4RJpYqw1kXI624wGQ5CqhNbmn+A9t4V96Qyl4A2?=
 =?us-ascii?Q?RcQo366Jc7rIBtkNDV6AUKxKqBQPcv3i9EBLlzTRKeK8RhweUdIWZl9JTeBQ?=
 =?us-ascii?Q?wM8zHxGsn4t642a/nsr1HmpYSVU2U+eCF5xNWip0JkDJr1D3m0rOIOy+Lyuu?=
 =?us-ascii?Q?iawZWeDEfG/5mBO4tH77JyN0wxPwKcegqL7dRHP4YT+tdNjaEc705ED1WHeu?=
 =?us-ascii?Q?i1cjNjkHGYhgQ8z9pzCM/ltRJREAYO0OkTJXDMsYF3yBcmsROu5FrhKJTrkl?=
 =?us-ascii?Q?7i9/63v0ZgGVjZxZL0wE+1Q4kd8hK/dwi1qfp3H4YMnmGKWuw3oAxL2a8C9N?=
 =?us-ascii?Q?he7dbOxHFnkV6loSPyBtLvqcEKWryc4BF/TIMyXl470Y5WzeUUJDtIN89VP/?=
 =?us-ascii?Q?8gYlh/w3kdloahlCcgtIMLD+Hn7w4S0070vrtU5GYMcdmQ751RP2hZ3FgIz6?=
 =?us-ascii?Q?c2rtSdzxrmBadCw1wlkmShVpA2wGm+lvrjG4b0zCVEBL7BgqXgkI4sqIRpDx?=
 =?us-ascii?Q?3RK5v41hv08J+nspuWP2wSdmwpesQwKAknBYThRvNXn3o3+9UIMN5G9RoBtF?=
 =?us-ascii?Q?/EVzoJEfnG38NEs4p9Kib9KZ5GXpp6VQKUZzLVCwb/PiCD67F9CCpeZORz43?=
 =?us-ascii?Q?DJdSANOwu45eNpwMY13AGFKJ8kRwuF+jz5j+BSA63jouJuXqkqcRIHdKW0Ai?=
 =?us-ascii?Q?BN6dyfYhRHqnRsCeon2DZMw72CbuPPdhb0lN9MGmKeissJLgR9n+5Wldrb3a?=
 =?us-ascii?Q?1Bjmkr+8/Q5s2LE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR03MB5458.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?64ejHtHFnBuEIa7atq+GzDf71JwDanFVqL4L8hMnslsU7jrazGhGFsksBO5x?=
 =?us-ascii?Q?tBhEsmka5RDjUi5smTP/8Qaq8UUxMBSDscxCYm/R2fkDDWkcmYyI0cGKk0Qi?=
 =?us-ascii?Q?V4jWUiLppPxhVCu72Ro2Uspo/SKVFdRWnbwFBV2My9SB5gvALqgGlTMI0oY1?=
 =?us-ascii?Q?wE6n2QF3YrU3yUqGvVoINzNBa7E0URx2J7vIHRmWY1h8Z6jtLxkm9sMHNzaQ?=
 =?us-ascii?Q?Z2lOmQnCO/7RykB3gjJ4L2x0j/U6303rJIDQwV3/SYkGIikhTxmYkr22w6vD?=
 =?us-ascii?Q?D9Vhx+nW3QUkjUo4zRoW4V3U6UUJ1fP3VRdk5W617BnDb2fncii22nv6XDAG?=
 =?us-ascii?Q?oanic8bWre7AtB6La786CFqX34ZVvYLqIKpd/VlV4DBlZ6EAapI8suAWpNmO?=
 =?us-ascii?Q?SKwBIqCmuCScJGnsgCrLlfDEeTLDkr/YD/vQvhbnHNdmdUfA6Ybkh5kJbqnj?=
 =?us-ascii?Q?ZWOjnS3qT5vFtZ0vTF/rcKG/TIokSs2iRaeJzeyEXsk03kTCtDt8kwVwW/BN?=
 =?us-ascii?Q?ojoJ0WXkgNN5SgCI0eZ9T1fmQMiK8Bgalj3hCi7MabufU+h9nmlOeYVRHp5Q?=
 =?us-ascii?Q?iH9tB1nrTitDfIdbZJ3ITlHvvzJAKGH2OWDrNyaMjHtwjV0m9EtJG9DPpmYW?=
 =?us-ascii?Q?h5h1KYiP4Ngy8VVE3XwwuG7odLpear6yIXb4JD+YjoUEdbsD1g1m+hTenMyZ?=
 =?us-ascii?Q?uv54rTfPZt/5df3Qo+hTR0PHP8oa2Pd95uQWJ8iiAZ2oADl25kmh+7guiJxU?=
 =?us-ascii?Q?cqjnoEJ54upjOriE5mf9DZDC46QVIqDJlNuDPUBgN6B7/Hd5j/Fa6GCSgp8N?=
 =?us-ascii?Q?E4jQUbZAGg+taHmjCa0Vbm7+aitV26Or8+B2BuO5fIuDzurKHd/VPDE2srd6?=
 =?us-ascii?Q?e58XSednwM1snXnXWV6jt8n2dBRojYRjDJt7yI5r+/AIWXzDW3qpWOcLu/jV?=
 =?us-ascii?Q?Cc0JGxYz7DgIuIQnAyDt0cgsL1WVmB/YrkxgF4Wh5L42962GxNWTjiOtXSKA?=
 =?us-ascii?Q?Tj2gRT7QMgyjEgMax0uY6pkzQubCWu5qDZN4x41uh0Klhkq2ZXl2GRGMbgma?=
 =?us-ascii?Q?tJe0rlZrL/R+A0PFQRx8KrIk/TIhd9LXMuu9UK8psTUL/gRP8LafaWvDBRvC?=
 =?us-ascii?Q?reZ253YoTi4phQ77v6Csvo64l1c03rA6V1AsqNK2vcEZkGGbsBhJ6cOq62/2?=
 =?us-ascii?Q?fNPwJyEwiPeMe96m6PTQ+v8O6z8j2/yowFXYNTrWvVMenOLlPpMsc+IQTDaL?=
 =?us-ascii?Q?o7xLsaqVQjnyFkyGu2juDAQTDv0R38n/qarZe9hT0MP9KfE0955R84NAf4qb?=
 =?us-ascii?Q?x3FLeYgDclWVJwXyXKamJKhJwLogc+5kIS/bhiZlEXZSO/yyNh4NGH/vUwwb?=
 =?us-ascii?Q?d7pGqebPPq9RoARXhe/oYi++LI845aXjyM/CyKq/4b6RSVdJmDwOOB1gUXuY?=
 =?us-ascii?Q?oaoTLVnQnfPbeJ8gt/aq453U9UWH8Leuef0iQ5vxrNPvzMj7CFdvQzj9LUF1?=
 =?us-ascii?Q?O+MZ3NkBYwOUHMvtS8KX4Z2cbwbMagoTuf0PnpOPzwlalK2on4GZNwqOjkdm?=
 =?us-ascii?Q?/ok6bnhrfJwHC5SiLFWdrFskKAzXzDE8KZuCtOXRsgsdtqMjce1uIocbuSSb?=
 =?us-ascii?Q?NbEmRCHtwHHgPQMWfypBFhuIjBpbYpUjEmkZ03FFs/+vPvmJ8KcPmoeejsHW?=
 =?us-ascii?Q?n2XXGOqTvKjSxQErf6rvrFUC+XZhLPCe/TxO5q5f2kt30y+jEBThfOTCCaLf?=
 =?us-ascii?Q?dAnkD39EzYE4yu8Mn2jRYWWx67u2sslvPP1ZX6KJ4hGN9byvjXiaJg1KI8f8?=
X-MS-Exchange-AntiSpam-MessageData-1: oQDbcy7i9AyGhQ==
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c5f02b5-d6f2-4448-e6f3-08de3c6f4551
X-MS-Exchange-CrossTenant-AuthSource: BLAPR03MB5458.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 06:49:33.6713
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CaFgMK8XPPAW9+Gq3Z5b8pqHxHXmmpIsjjc8PNcgwBQgx5qlAADi3LsOSDsa3PI1GGa7BIbI+WEbUB6BFQr1HHe6G4JUCWWcC+JF6e9ZuRbmtJSgxF99Kw1EcBqThur4/Bwj2kyJ3E397vwQiOaY6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6857

From: Muhammad Amirul Asyraf Mohamad Jamian <muhammad.amirul.asyraf.mohamad.jamian@altera.com>

The Stratix 10 SoCFPGA platform includes hardware monitoring capabilities
that require proper device tree description.

Currently, the Stratix 10 device tree lacks an hwmon node, preventing the
kernel from binding the corresponding hwmon driver and accessing sensor
data.

This hwmon node with the compatible string "altera,socfpga-hwmon" ensures
the hardware monitoring subsystem can be initialized correctly, enabling
accurate voltage and temperature monitoring.

Signed-off-by: Ang Tien Sung <tien.sung.ang@altera.com>
Signed-off-by: Khairul Anuar Romli <khairul.anuar.romli@altera.com>
Signed-off-by: Muhammad Amirul Asyraf Mohamad Jamian <muhammad.amirul.asyraf.mohamad.jamian@altera.com>
---
 .../boot/dts/altera/socfpga_stratix10.dtsi    |  4 +++
 .../dts/altera/socfpga_stratix10_socdk.dts    | 31 +++++++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi b/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
index 657e986e5dba..73eead7ffdbb 100644
--- a/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
+++ b/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
@@ -78,6 +78,10 @@ svc {
 			fpga_mgr: fpga-mgr {
 				compatible = "intel,stratix10-soc-fpga-mgr";
 			};
+
+			temp_volt: hwmon {
+				compatible = "altr,socfpga-hwmon";
+			};
 		};
 	};
 
diff --git a/arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.dts b/arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.dts
index 58f776e411fc..63309001f1c5 100644
--- a/arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.dts
+++ b/arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.dts
@@ -197,3 +197,34 @@ root: partition@4200000 {
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
+		input@6 {
+			label = "0.9V VCCERAM";
+			reg = <6>;
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

