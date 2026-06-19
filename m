Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011054.outbound.protection.outlook.com [52.101.52.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D105F40D590;
	Fri, 19 Jun 2026 09:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781861943; cv=fail; b=vEVeND7t+C9m15SoLWLuQSlYNx0QPYPwf0IPjpSk3P+v9FLzF0jbH5ic+B8HNSqbRVrjcmDu6ZSQattlCvrtQ2GdCmTZWYhnxfB/QM/Gj2edtfVuOuJDackaZ/YFzcYeAfbUweEWv5YewgWh0KCNzAF0mW3RNxxCMeoOpF9ZpoI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781861943; c=relaxed/simple;
	bh=eqqbXzEe/UV3377PP4LdoggfpFuVQyJzZwdnP0BNRYs=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=rG8TKvHGZmE3bRszfa2GZwAP3FPUt6r4wu6HXYtmjj4gF8vDh6vKzCaC5UWyl8FzNAjXFwFWHk+gCRi0TiOWF+Nra6B10KTbEHah6C2L4aWbePV9+nSMfmOrSR2IqXcOocgu7UTorSKjcYz2RHz2m+R6hLXjgfjaPG+yocCN3Ds=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=WUKhpdGh; arc=fail smtp.client-ip=52.101.52.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="WUKhpdGh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y7IeTSoX6ag8yhdi13GF6xdrMmVDZXMAn79Cz3FfwDLgb7YmYapzqgYqq/IlWuE9vHUqwRrYrrS1EN8Hk4pYqneleHkcNw7ovrrDbXEn9gGZYznUaUp5j2lc09EenZ897aNJhDd4oSEKvXt4UxB+lu9DVratf7EeNvWgYORHAzvtadjcL+g1Aeu0NwZtT0oBotnW+mkJBlX7TRUV2Ry/BLsEUk5VxmuXkmICwczPrHi/n3HgitKgP+gqDd3dcIBa74VYW13c+qU6QM3uHt244Lh4+VFWYvF9ZzYfNrsEger92Mrc93FeUp5HB2p0rVPSJcgmApWUjCEtllfKE+bj8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tAe5Wh6+daZwIk7oqXXmmqb8MEMWcpTsUn/H+jhyspw=;
 b=BRoZ3R/0sOgH2n6nIqDOFPJi74unhZOB9PNEKnOaPsoCyKva/df5LgjE6PoWW12CIY/a4LoMz+O+sV+TwLu5FNwH9YQxVNtcWw5bYG6WwUTWXITTI5sT4n8oUOMiDGLoPKU7Q1Nd1nwZd1P2PN2QvmOXIXK5alWLUvuq2vAVndZNkKD2NsQ8UM3tJv68MVavMwzck6YuKtcORgd8ESa0kWpt2stueTisaevzJNk1oIYj7kLGw3u6kG+3owDcUmPe6T1JOe1x5ShNtFT1uKZKnDG8UnFKEIf3xYVUBCpbiaqS+ZZItJ3z2XL2TVq2XyGfsS5SDvaS96L7fIBUhrbg6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tAe5Wh6+daZwIk7oqXXmmqb8MEMWcpTsUn/H+jhyspw=;
 b=WUKhpdGh1kbq9FfzMv3v6xaCBljUHPsvE74+sGnmocehE8vppxQTuIX1b0Ixc4mcJh1amQigq23zlsuJv+TecJ/xa8kpnlliU4QjmXkliu3ia/eKqoK4yzEUYDhIyj0E1Dx5P0g5AA657BnK0hILVfxz6fl7CbMz4ngow4RIwjsgpHxDxiOz0EoiOddr0IgphS2qDiB12AIYWfgitJLqHYZzaB5HvoA4l3no2YKuWXrjH8ocgDeBjfjSGBcVhsCHuQ+efjasyCpIfn/WaZVkNtHdCc/gYs5oZv/ULS7TvxPzJyo49f9j3w1QMgeRoJYs79lLxoFISeEdGlsHWORq2A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com (2603:10b6:a03:2d3::20)
 by LV3PR03MB7562.namprd03.prod.outlook.com (2603:10b6:408:28f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.17; Fri, 19 Jun
 2026 09:38:59 +0000
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01]) by SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01%4]) with mapi id 15.21.0139.009; Fri, 19 Jun 2026
 09:38:59 +0000
From: tze.yee.ng@altera.com
To: Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dinh Nguyen <dinguyen@kernel.org>,
	Mahesh Rao <mahesh.rao@altera.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org
Subject: [PATCH 0/5] hwmon: add Altera Stratix 10 SoC FPGA hardware  monitor support
Date: Fri, 19 Jun 2026 02:38:51 -0700
Message-ID: <cover.1781861409.git.tze.yee.ng@altera.com>
X-Mailer: git-send-email 2.43.7
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0039.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::14) To SJ0PR03MB5950.namprd03.prod.outlook.com
 (2603:10b6:a03:2d3::20)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5950:EE_|LV3PR03MB7562:EE_
X-MS-Office365-Filtering-Correlation-Id: fb3bf265-fb31-4cd6-60f5-08decde6970f
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|7416014|56012099006|55112099003|3023799007|11063799006|18002099003|921020;
X-Microsoft-Antispam-Message-Info:
	7QLe+teCPm5JrTjV5TpKH4c6K2EJP/P/7oZUWOR7CyAzldYE348KZIkUr73u42r1ob+jZDRRoS2HGlMyn6FgBl/ybjDvhlKSWvdLIYJym5H57IUaE3nHu2dfI20XA9gFubqlLp3f9WwE5xXfhEXtDrlQus5RF4T5Ul+niwg3N5VBRSHylz8o9u/LooRn0HXTJU75UnTwvY5r3uGTFDpVhiUDrgvWuGQENkP23JK8JSim9qaNWIzdYF0+IMwtjKE3XZQPOe/Q1PRFVqLj3JA3DEylUKyqcIadiMLc7RUczghG6ES2CnLf2zyOZEPj85BvEIiVh4IF2Bnub2wa+F+SlLAguXBCR3pexuiIuNb9ZeNo3PfkWSO67yyTMuXHiU5ipU52GLfHFp5oq8WmoN+PdFZjpNKoa15rg7mWOIWNmI7TRnVmPqHGvnOrPMFuucnz/kDlfj70pbjKqeE3nH5yeft75X8ALEHGr09lKij+l0zvZ5rGZWiLv/pzipJ3CEuPXHVUm6OD/bgWYTvD5Uu5R5cTG/jeQk0cOJTc4rFL1sUjEprTdwH5xniQtmLPJGqGGJ2gRu9eeqUO9RU8NA7usqGjdteTiyHi6X7mdV2kP9p1pEvtKLbPZhE1oUyvvultsd98znwvfmwS7RrQtsHhsA4v6qg+o8LoFMtIaOTBeDtGPoudqOaZHp5HWMUn7AMMzZxRUZTjtPlXMB0yClQe3Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5950.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(7416014)(56012099006)(55112099003)(3023799007)(11063799006)(18002099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GvNFgZZdaiIfORTHqlqSh3o0raVZhVHzL2skiExG+XZCeNkth1GG09PxkxQ+?=
 =?us-ascii?Q?0x7biebdHqSK4AjXNYqYd3b0slDodh5hdY0GEfGytNdY/aTc19c2wEKpxxU0?=
 =?us-ascii?Q?YmDB9doDWEZSiSbfr3ftllae0O5/7znd9ZgJvJgonpi39j4McUrQCLEhH0E5?=
 =?us-ascii?Q?ucxO8jId7hYBrppe6HACWcv+4EE+KaAXWJ3uy3BB0Nu/rKEVNHYI13ElZTCv?=
 =?us-ascii?Q?eONbxtE7Cqn1YyuNXQPXWBrwChkJLG5p1/ab7GWoaycZGn6EjAG+bf0KoCC0?=
 =?us-ascii?Q?QGf3PpMcEAsaaYAAeBJWEkysKnpRkLYfIsBBJ03AhOhbLORRD5pIju1LzEcJ?=
 =?us-ascii?Q?IIp0V7xqUSc8FGa7dN6nWr8BQMs5DLS5B/B54eUOi4iw1wBcZ0raMd3QQ0H5?=
 =?us-ascii?Q?KRgy2DYac+F0sCzUJJGE2bm7Nob73GtoKYQPqIpwjjjnBSV8L26Evcb6mMHh?=
 =?us-ascii?Q?yRRoQQSeJCEol65JTtjoTcR1qgfhtieWDIkm5gea7KPQa3R89/jbLCfW1CzH?=
 =?us-ascii?Q?Sub3eVBh9go63RHqcRvYrDxDt+DqLd+6ZoTDmRlkkJiMp0Hncvuc2PEXKgkw?=
 =?us-ascii?Q?4nVld+FGV9+O5wARHixooN9xnci1eoXMLCfsBLSws53Nnsgcff5ZKnsDw6f2?=
 =?us-ascii?Q?Jc1igEzIaJw0k6VcdMJjYRoXv27zppcti8lnGZaa8X3FuwBXvR5rRDtQOtzx?=
 =?us-ascii?Q?tmmFiElJWXvy5beN0RLbbjvzYGxebeKkrspAc9BItMED4bqrJLTTOpfe2AMs?=
 =?us-ascii?Q?kJnZATkVARKXcV0fJUf0QSxfx3U8rFbUw4qHXxrnk0+m/6i1iGeMhy5ZQlhs?=
 =?us-ascii?Q?Mme616N4s3ENFuakpZsrxmrF31kQQBLmlEH/4A3fYyb5K8rZy4VsicuI4JSu?=
 =?us-ascii?Q?ymzzyyvsOxT2k1vP1PUCL+oMLOvEQRBORLNBqocfgBvWOGyXa6ex16QjvQIL?=
 =?us-ascii?Q?MWE5zSRoPvOjHfI9/nYjBZIwkVl+hnU9Ge8280yGq0gu5TCcl4O4aTVG/RdC?=
 =?us-ascii?Q?39o5ZOahVo6EjRqPUoW1yIn8D1KFrXYiGybQWUC6IIOWEp4jEF1wsraDCohc?=
 =?us-ascii?Q?93c+8Dd21BCUvoNNdqzB4ql3CwMeAOPwL7DQwkdrVSIAFpkDAild7KbNEarL?=
 =?us-ascii?Q?vY46BiLfC+K13fyOlPYQ/sR9zMMXwynY/vmwcYSpN0pWtVjxTjgXSPmm6TRU?=
 =?us-ascii?Q?1kK8nK84NH1ur1wlY8eKwuvtHko5KAtOc9tnSkPXOzO4sijE4yUck9kXmz6N?=
 =?us-ascii?Q?WaYu6Vs5Vjwi+I5fBHziWQHK7/EXRDhAUZPWWiWfx6wLVuVZRGnxMwSif+av?=
 =?us-ascii?Q?N6HMuKe0LOdMYyC7Vx3TrFEq493rjbg/EAgilj+jBNUIykfuRqV2MCZ5Wkf/?=
 =?us-ascii?Q?DLFEaWCKx89LqYd2kYn5MpfMWVp8v4h+uFI2/xPKMYXVZcs8A16g5GNmyGRM?=
 =?us-ascii?Q?MXOG2B2/1DqK5xCquu5qsJa2VnTpeZeQohnJP+7SuUwBPclpr+1nYSSUSFbe?=
 =?us-ascii?Q?+hH3Lnh2LH4UOdmBRIO8Um7XdEdiiswpYDIkaxmkbog16Hv5EndskE3SsIrl?=
 =?us-ascii?Q?6LhC+ZOw46qKFHVpDBKBYvxS0fgqumVm821iENUxk06xhbol8tCc+K9g47Cu?=
 =?us-ascii?Q?PluecUJuuwjWL4ZKKfUY93aYo9cJoMZG9w3wQbJ7hdelyFW9H+pUDgXcbkK2?=
 =?us-ascii?Q?86BZmpke3lUZzEdNi11ihCUmTwKmxQ+vEw08iV5EkRRP7UTY3KeMULnYYSu1?=
 =?us-ascii?Q?5n51LzWOuw=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb3bf265-fb31-4cd6-60f5-08decde6970f
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5950.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 09:38:59.6345
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cQgUymSz3L+dHK+nR+xCEiOfMmeRm/HJUbTooZ4Jd9MZw6dBeCknE5yK8qUSgbOVW4/ACEo7TnMt6+GDrn7K7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR03MB7562

From: Tze Yee Ng <tze.yee.ng@altera.com>

This series adds hardware monitor support for Altera Stratix 10 SoC FPGA
devices. Temperature and voltage sensors are accessed through the 
Stratix 10 service layer and Secure Device Manager.

Patch 1 adds the device tree binding for the hwmon node and sensor layout.
Patch 2 extends the Stratix 10 service layer binding with an optional
hwmon child node. Patch 3 adds async HWMON read commands to the service
firmware driver. Patch 4 adds the hwmon driver, using the async service
interface when available and falling back to synchronous reads otherwise.
Patch 5 enables the hwmon node on the Stratix 10 SoCDK.

Tze Yee Ng (5):
  dt-bindings: hwmon: add Altera Stratix 10 hardware monitor binding
  dt-bindings: firmware: svc: add hwmon property
  firmware: stratix10-svc: add async HWMON read commands
  hwmon: add Stratix 10 SoC FPGA hardware monitor driver
  arm64: dts: socfpga: stratix10: add hwmon node

 .../firmware/intel,stratix10-svc.yaml         |   4 +
 .../bindings/hwmon/altr,stratix10-hwmon.yaml  | 164 +++++
 Documentation/hwmon/index.rst                 |   1 +
 Documentation/hwmon/stratix10-hwmon.rst       |  31 +
 MAINTAINERS                                   |   9 +
 .../boot/dts/altera/socfpga_stratix10.dtsi    |   5 +
 .../dts/altera/socfpga_stratix10_socdk.dts    |  33 +
 drivers/firmware/stratix10-svc.c              |  12 +
 drivers/hwmon/Kconfig                         |  10 +
 drivers/hwmon/Makefile                        |   1 +
 drivers/hwmon/stratix10-hwmon.c               | 575 ++++++++++++++++++
 include/linux/firmware/intel/stratix10-smc.h  |  38 ++
 12 files changed, 883 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/altr,stratix10-hwmon.yaml
 create mode 100644 Documentation/hwmon/stratix10-hwmon.rst
 create mode 100644 drivers/hwmon/stratix10-hwmon.c

-- 
2.43.7

