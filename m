Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11021121.outbound.protection.outlook.com [40.107.130.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC83C335090;
	Mon, 17 Nov 2025 12:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.121
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763383228; cv=fail; b=lgefi4gub4Y56rG2R2HY/8da+dKFDmebt3RzaVtbnyZK7ziaUFBRjvI7WGNouMFj1x8l8/3ptnOw7vVqEcVr5TMmQW9o402cFglulo4zA1xZTcJTdJgQtboo1HxZ5CU1jHCuaprF80ORhGLctWT3sZBDfCJL6WDIhP1ohvazh/0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763383228; c=relaxed/simple;
	bh=bgsLEi9CvtvkyKKjgbsILooR647IQJoAIB8oxWLQLjo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fZHgmnBGA+9g+J1vfxC4mI4qYKSijW/scEy1GyGQsbW3xubZ+AenI0CFj4givhBt+UNjI0VEDVOpnlB59SV2erkM904QT4hAgC1ZSSKQDgmwqOpOYaYOLChbT1UatDjyQz99Dr/xPlqEUvhOFXEssJXwobatyEaskyXDERi1rNk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=becom-group.com; spf=pass smtp.mailfrom=becom-group.com; dkim=pass (1024-bit key) header.d=BECOMElectronics.onmicrosoft.com header.i=@BECOMElectronics.onmicrosoft.com header.b=Ft7OXNum; arc=fail smtp.client-ip=40.107.130.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=becom-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=becom-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=BECOMElectronics.onmicrosoft.com header.i=@BECOMElectronics.onmicrosoft.com header.b="Ft7OXNum"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ki+K0Eu2M6SDqlnYdsPHnFP47+wYCA66NOvQFlV15ttCqS3M+jcuuA/kPP/c1Fx5SpDZVLOcVIJOXsxyBYvktkO5ydsbkjJQtCm14ghHDH6o5kMGgj8n1+Y+C9f2+hGksYO6ZdS1af1ch27pxHtOlqhCLXzbLWEOs0mfQLxicuFlUc1G8qWM/qZ94sIsuX3GbFI8xKawv51e8cKL1ki242reqxL/vUXCyCVlt/swmN2/t+q/RaEJzPHHl4f65CrNGRjlm8oKnxj5CQOwiWyyiKKo0La0D/9eJ2f+WJlzMeNTnrOGUnDzAN/mkdUXbjOpFzdxrsGZlWru6D5FJxBJBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=62L4kqX53HcYRvKoRDzCwMrLeVHwjVsLbK5xN/5oiZg=;
 b=FtbrRQElJUmy+ZFbE0WokCXKOAaMfz9ibgtY6qYiAxSeWA93hVdpvyridnk0UW6Nq3HDM0GXRBJSNtAt9Ug2KPktQAKXEHHapyU8Q5GYhfoEMV2Pq+OwV+nO/6Bt1zgXmihLXr+OiUADbWk4eTZSnAmsscqE/WFnXyOjWnkSPb6XFIb+FcKU4xCFmi5Fx6xzfLO1a2qKvZuJILx0OWFafzi3L+M6bHmpTmkTQVkzoIE62uX3TEUDRUqABvkOH+VoeMWsZ4Ytg2F5YASmlUHcXtRE7GVglJ4kE5FHXdfT2UX26HAG5TyFNKNBHnb/89ND8F8maj9udrxjdume5FNzww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=becom-group.com; dmarc=pass action=none
 header.from=becom-group.com; dkim=pass header.d=becom-group.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=BECOMElectronics.onmicrosoft.com;
 s=selector2-BECOMElectronics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=62L4kqX53HcYRvKoRDzCwMrLeVHwjVsLbK5xN/5oiZg=;
 b=Ft7OXNum+ssHFdW2tVn75+xNhR0XajABE6+p5ykOGi6ykpHeuUB9rAfix2k/ioY80nVvH2h3RAv7L3UFijpRzOxKKe0MkR0z8PW/TlxRWMtMmS7TlfZ5wpr3H3YRiWp9NUs6A68WC3j7HTpVwWxfxpoJ1tDE6nBir1EvUswY7WE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=becom-group.com;
Received: from PAXPR01MB8613.eurprd01.prod.exchangelabs.com
 (2603:10a6:102:232::12) by DBAPR01MB6664.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:185::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Mon, 17 Nov
 2025 12:40:16 +0000
Received: from PAXPR01MB8613.eurprd01.prod.exchangelabs.com
 ([fe80::5ca2:88f2:e3ee:8eab]) by PAXPR01MB8613.eurprd01.prod.exchangelabs.com
 ([fe80::5ca2:88f2:e3ee:8eab%5]) with mapi id 15.20.9320.021; Mon, 17 Nov 2025
 12:40:15 +0000
From: Thomas Marangoni <Thomas.Marangoni@becom-group.com>
To: linux-hwmon@vger.kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux@roeck-us.net,
	corbet@lwn.net,
	Jonathan.Cameron@huawei.com,
	Frank.Li@nxp.com,
	michal.simek@amd.com,
	rodrigo.gobbi.7@gmail.com,
	chou.cosmo@gmail.com,
	wenswang@yeah.net,
	nuno.sa@analog.com,
	paweldembicki@gmail.com,
	apokusinski01@gmail.com,
	eajames@linux.ibm.com,
	vassilisamir@gmail.com,
	heiko@sntech.de,
	neil.armstrong@linaro.org,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	kever.yang@rock-chips.com,
	mani@kernel.org,
	dev@kael-k.io,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Thomas Marangoni <Thomas.Marangoni@becom-group.com>
Subject: [PATCH 4/4] MAINTAINERS: Add tids driver as maintained
Date: Mon, 17 Nov 2025 13:38:06 +0100
Message-ID: <20251117123809.47488-5-Thomas.Marangoni@becom-group.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251117123809.47488-1-Thomas.Marangoni@becom-group.com>
References: <20251117123809.47488-1-Thomas.Marangoni@becom-group.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR07CA0217.eurprd07.prod.outlook.com
 (2603:10a6:802:58::20) To PAXPR01MB8613.eurprd01.prod.exchangelabs.com
 (2603:10a6:102:232::12)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR01MB8613:EE_|DBAPR01MB6664:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b1b0272-4902-43ba-fbf2-08de25d67501
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hpQIg+aEoEa6aJcT28rGvfvYThX5MvfqTTNaJmM4V5z1HfEkrihNOuUuFkJ8?=
 =?us-ascii?Q?3GPhUC2uhyTfuhz6hexi+v1CRkfNcCKqLMqRcwQdeExGk8mVgA5QCMw8UuWf?=
 =?us-ascii?Q?1C4ZZyjqudZ12cKfAf1gOy+LNhtGC6mVLXXyeZOEHXDNEY8rv3yEimCrygBP?=
 =?us-ascii?Q?X6OrJuI1Nw+G40KXlvK61VMlQLbadf1yNKqDDChiYu+mZ75lHRUsjzTT+KDQ?=
 =?us-ascii?Q?E/3bUHspJf5gTblSURY7Z1mXHM1sZWdFlHdtcv8TQmSiPdc/oAXk5rZNl+Nm?=
 =?us-ascii?Q?tquU9brIRuORtg/l/BLINA04YGdz5drVzRQL/t5CbiMyn+DfqU7weLMJYzS5?=
 =?us-ascii?Q?1Mz0Imm5zGSfOVaRkZuMWGp92AL/JK49S/sQFkyUDB+5shTPVInbfY9wWjUj?=
 =?us-ascii?Q?0VstxENc+ylhar6VJOoD3MrUtPEyrHFR/Te2IT4H6g3tnKIITFokQGqj87Vw?=
 =?us-ascii?Q?yEHBHXL/oFJFE2tUx9B25LHiFnip2vTtbtlrh8tyQXol23lMTiXUwmtktdRa?=
 =?us-ascii?Q?wffZeLcd0cf12fNhgCGl4Y5lT0pjMZIVzB3L1T1ZcfP78a2n8M42dWpYWNXg?=
 =?us-ascii?Q?G0HX9AdFWMCr7zF8aumK0SAFNBhafLQLEiWwqyN7tgvCylCWw4Wl/m/H+5xI?=
 =?us-ascii?Q?8zvt03HyjvvNTQj0WNKIctrCknok4L8lQAAaXoAoJKbTvGI1oo0eRAq8O1Hj?=
 =?us-ascii?Q?jQ7hEOVm3yvbSrWOiTcUVF6rrRsEchw/+2zk/k4IUmhh5N077OSb30pcq6ar?=
 =?us-ascii?Q?5IOeVD6p3bs+jxvTz4mfMGxc/j5Bu5neZAtfllY9kfWUGaU91UEj4sykaL1L?=
 =?us-ascii?Q?hh5MvYa/ZlnDUkDs36QrK8dJiIxewWPcAjqsHVhPDXaDUPfx6UXKzgjCHeif?=
 =?us-ascii?Q?RM++5n2KXf6jlvp4kjC3kXTkMWGTno3wJ650NGCWNrk9ojresLNVQ7X32neZ?=
 =?us-ascii?Q?/+9fyh6NggmbfHXFMfzbzDHknAZW5GUisYTKyzhcR34UihIKFq9ZeyQhRF1A?=
 =?us-ascii?Q?v2Q36x2pkxNRh5vRzZyyLOOIY7l/mCXSZauwbqcMvvQ1bD6mZGG6sdINRELP?=
 =?us-ascii?Q?XOEYSs26z0EJ7bSPug/ljRXBjIG5G/DwQlrHNiMrS9ZAs6VhsAx5M7qYRbmC?=
 =?us-ascii?Q?GSXDHVRo7uf89HG5Oa3TspWNnrdY77DDwNk+AyrZ7lMuNiEaLw4jKhEXQ/KE?=
 =?us-ascii?Q?KwKIAiKl9nW+49UvFuGnSiy7Jw33L5hGIFhEDGp4c7uCDpnG9kHyNDSSC7eU?=
 =?us-ascii?Q?e2u84wOXBOiyuYt/p7tey8tctQ5ilALxATcBliyI/07N6q8T8C81Qy/k+rf3?=
 =?us-ascii?Q?vzQIXQICj9I6UkKm3z/CLBZgkmjGzKwDpGpZhJQcFdFxtNImPRmaqlILIDZ9?=
 =?us-ascii?Q?mLUlM1LHor/Wo0oRaMlEpcXO189dc+OgCykpK+Q9tKYBjslCWC239xXhejce?=
 =?us-ascii?Q?J8kQoKvmVhxsM/GCqNywl/QlUxL30SkG?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR01MB8613.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?z7wBhH7hVJP6lfT1kymfiE0dnnY2J38zOe+rW6YaCSC1c1tSkGcFb29S8rji?=
 =?us-ascii?Q?swx51j1PjpM/cn+ztYBWVP2xLwFFELZEKVc1FEb2ojIpLzvjtbPYeQv5Hvtm?=
 =?us-ascii?Q?yETRf3nc2G9ioBQX62ZqkJHV5SUa66Ij8z7b+wiP5PkU3B7+xSkstVHDhe0h?=
 =?us-ascii?Q?/xEzl7PoXR+DGzZ2x5TjV1dIe/FQTy4ZveOKB/EPFQbwtqbI2W1SYsYeuogF?=
 =?us-ascii?Q?vwaOrCtkCOa1Lh+SbRD868NPcLYyvWgScFfKoGghCS/zqfWRsm+5II0Zid6p?=
 =?us-ascii?Q?V+MAeviDj+IZLWyYMGcSbAOPCd3x8zPJ2opUl8c87tM3Qy71I5CUJOWAQyuq?=
 =?us-ascii?Q?P2rU1LG5PUZ3MHVH1ZzlzE2JO/Dl4sycU0ONaL45EUXF82iaYZkVcTzg6lOv?=
 =?us-ascii?Q?txeEXjWAPSM/iDnDVtImbgSsc/iwJ40GMyjZCVtHcBfCDlndf1bOUFroix+G?=
 =?us-ascii?Q?sbuL7e81vTawVTgKy8Oe0DMESthKtfwT2HytfYt/HsGwGct/yu9mxI/011DV?=
 =?us-ascii?Q?Gg5qQsizqZC6CUGVPfcf5oaVpaxVCK6HSMoelDf+j67TDEKBAIeJS7X/HJ+H?=
 =?us-ascii?Q?b89zjCmR8YOCwhttiah+JlKjek/wxK5i1CVlOI6EfVE8AJ75ACulGHxBhp0a?=
 =?us-ascii?Q?IQ5ks5gAf6QQ8ysfAEgDJWVrsRgcpmTFHvTgZw5xwoKwVVQWHxl06eYrwL93?=
 =?us-ascii?Q?MKTjR6JI3Dn8Kg90gNTvmZRbtgPxPhYZhNixRbK+gaWx2aD4CwSdqK/vc/WB?=
 =?us-ascii?Q?KONZLGLYJ9/C19twzBE259sGCmGcgHVTwz37JdNxqDTS9a31kb9UMMaWgab3?=
 =?us-ascii?Q?qVus1EuQB0pA3pL3Wh5RH7okiQSog9X08zYDz+i+NYxR2vxMcQDs7ygDALbn?=
 =?us-ascii?Q?Oj3hxM1h7NAabkX30Yg9nwQ/KJvXlshQtv/Jl1rooZgbDqGpuY5HQia1boxT?=
 =?us-ascii?Q?Sr6b3ltXy2I/5Wy92HUaPHPgzXZV13c4GIv2m80YvLSJhy/1Nf8Cep7X4JaW?=
 =?us-ascii?Q?MatxTIO4qatds32hvOYq0Ox/DM+StJ1v/lW61xP49xKBnhWm2K2mXFwhzzxU?=
 =?us-ascii?Q?zDJPiRp0xqAA85xiJXoKh6IjMt8XoNtJ22cf7HvRupjZ9QQOkKNScQpaO1vd?=
 =?us-ascii?Q?1qH7XcpYuFxfObBuxwALbJRBCm8WjhzN9S3D9UVc5IbG5KGvSqbsv2DAiUys?=
 =?us-ascii?Q?l6VoB5PLPL6PfhNaUD9sKjGoPWkaFoY3dgRmgb7PYhZxOvEybQqNz6RMa00j?=
 =?us-ascii?Q?PMj8mdrOcGusWPQh4XfqJ0ZS+AktAXNRAp0URmfF6GmfqR4H2d5gviUax3is?=
 =?us-ascii?Q?bHoy2dcnKvl6h5/0aHcOb30YISByOhcANqoo6C9gW1scTsRNeFZheC1eikjr?=
 =?us-ascii?Q?LrCKG9sJbYZwOREJNovkonlWb0vgo7wSuVjAnksx9gPz7NCA04sJOuaSTvRN?=
 =?us-ascii?Q?4vzG+PX+N4mOuVqaKtEe1ZyAJCiSP7T3dLc8FhRFCw818oUwQWeYr7GiHIwf?=
 =?us-ascii?Q?EV1ugP32tT1bcDLDIONR4JeCOAJMrr5cWon4wf60kW3Dy2L8YGe8XD1MwK8C?=
 =?us-ascii?Q?LSdo5T3/aNnY2NTsfDdTLneNvErNQrA70e5sX5fLgdWn9Kloib4KMzTtryRb?=
 =?us-ascii?Q?OA=3D=3D?=
X-OriginatorOrg: becom-group.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b1b0272-4902-43ba-fbf2-08de25d67501
X-MS-Exchange-CrossTenant-AuthSource: PAXPR01MB8613.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 12:40:15.1522
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 738f6472-f50a-488c-ab88-c200fd976533
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w9w75ev2PVMI7Uf2dByxDlp2YZCd9JCzKK503Kh72TeCScLk1BuQJ6Th29J1YtXZ3Uu6C9JmdNK4YOsrNldcva571X4/Xg7H6Dqrc3YVbVk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR01MB6664

I've added myself as maintainer for the tids driver.
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index ec635515c0c4..3f981252fa2a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -27965,6 +27965,12 @@ F:	Documentation/ABI/stable/sysfs-platform-wmi-bmof
 F:	Documentation/wmi/devices/wmi-bmof.rst
 F:	drivers/platform/x86/wmi-bmof.c
 
+WSEN TIDS DRIVER
+M:	Thomas Marangoni <Thomas.Marangoni@becom-group.com>
+L:	linux-hwmon@vger.kernel.org
+S:	Maintained
+F:	drivers/hwmon/tids.c
+
 WOLFSON MICROELECTRONICS DRIVERS
 L:	patches@opensource.cirrus.com
 S:	Supported
-- 
2.51.1

