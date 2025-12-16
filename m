Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010027.outbound.protection.outlook.com [52.101.56.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7432033557C;
	Tue, 16 Dec 2025 06:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765867794; cv=fail; b=hE5iAirAoHccxTbX/dvmx62OkKoujjs9hG9Of4KLE3BV5nLpefTTuwCZFm2qtNMr+LNVU/rqpw2S+e6VBzGuq7MoQij/4rt7t03P4H2WD4z2xIl13DPWUtwd4TD6KGsysEl8hD/MAxCfOfuWWvRirC7D2kxMA6qCeJGLmuM4XhM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765867794; c=relaxed/simple;
	bh=Vb15h59m0rw6Djt/J5yzcIMmgGBXeL+x2WyOoSilfMQ=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QMxPkT8CofsOfsb9creR28fiTv8QuVgooSWme7Fle3AKvzfSsRfFlx1dGEjiQijIORQDCOB/KmTul1NdRD1iQVL8htn7Yqgpc6vaMBJT1Mclw8n8OSlL6Z53q7qKR07wvWyGdnInSU23RvWHSdI5S2R6d8RvTtiDbP1y7otwF/0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=FnfyY8n9; arc=fail smtp.client-ip=52.101.56.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="FnfyY8n9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ary40RBlQgMZEGdGcAPUClhHLv3TMj8bFyQYxm7V43fkbRJQ7C98CR88IK8WqP+IwRbysyCkv1gEyVi7wAMYpBHilRFCHpx9Pt+mHPNtLt/JUDEUASv73wz0rY84sfA94zHOdd3435muxTigpUSpPNLT/wd/+6wlMu5VVBvRgl5fI0uoSA36akH9RzqGOXh7FiiLGaO9n5KescdTYbiYQRa4+EdtRHVTcN9j0UVnRHRuGma4FyuR4zNyWiSdV8r/yIO0Y/sgcOjM6755OQh1AC1I7q5ehzWxZaG8fKMcFw9dFpQqiioh23CyuAS65/ggeSoAnx+Mo9KtMpk5uUtJ3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yOhp4XDogw0IeTkkfXyG0F/SI1wH7B5mMvV96EqVJtc=;
 b=wPQSvQEK5CMPJC8qIsEV/8AJV7OtFQDDMOrRdazESca8nAYJBEMNI80Si5MAoWoQzAxtJramjUyPErkAJtnoChFa1N6ChPBDg//lULlQNk/0wRh5VuCjrbGtN6X66fAVAhgyLvh7su/b8MmM4PrjTGIIxaOSL3UE3nAPVDhkqx7UkOYHxrd4uG3NUJIKbO3F00/k77mivqOp1A+8sY6TCZN3NcdsqXSi2zw2ywsO+MGeqc2pc32qIr9XaDuGaDs96MExmtHfuecDfM8lacRFOQhCdXXU6zWiDvoroPcNMnG7w3prImDSAPv+rj1KtXuB3DlETgMFE+gjOlu0CC3S2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yOhp4XDogw0IeTkkfXyG0F/SI1wH7B5mMvV96EqVJtc=;
 b=FnfyY8n9rnAL/IpHpAVngtO6k10M53xzXxleJ1h6omuPlNkOv381RIYIEgauxgfbxDZGvHrTbIn+VqomrPhJ2jOrq9WewRMtjMnAX8qO1zJMbvTLs9IEkuKM+B9Ng9yZQn+5U1SjbBpo07d15ktjjxPPUygBjaOlSo4H190+hs7qZkgbWUll8rPAffe8xSbNzUNfumB4p441tQBgGD9V9MfBlF1L+wd/2MOifQo5+jk3zwbi/L/BoRPZTeT7Geo4NsCWBqnn7Qjzy4Wgdn2t4ouKwHd42WZaBnCnG8p5MMVyTm97uSuVNCRDln0y3MmKkCQ3txY7M47Rr7B5zwjBPw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from BLAPR03MB5458.namprd03.prod.outlook.com (2603:10b6:208:29d::17)
 by DM4PR03MB6857.namprd03.prod.outlook.com (2603:10b6:8:40::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 06:49:32 +0000
Received: from BLAPR03MB5458.namprd03.prod.outlook.com
 ([fe80::7eda:fa34:15f9:e656]) by BLAPR03MB5458.namprd03.prod.outlook.com
 ([fe80::7eda:fa34:15f9:e656%5]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 06:49:32 +0000
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
Subject: [PATCH v1 3/5] hwmon: (altr-hwmon): Add initial support for SoCFPGA
Date: Mon, 15 Dec 2025 22:49:24 -0800
Message-Id: <20251216064926.15817-4-muhammadamirulasyraf.mohamadjamian@altera.com>
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
X-MS-Office365-Filtering-Correlation-Id: 6699cd8f-a529-4869-e6b4-08de3c6f44a7
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fdSLaY/jGCt8O9ZWJw0Y8oI/SWpUokHxoJB7aA+eWWDezhzqLdLytvKxVmFd?=
 =?us-ascii?Q?LQV4kYipKxOxet12STEl4JCs4W6nTuIIsoAvtamO4bDGCYMxn7sV3GM/7bgH?=
 =?us-ascii?Q?t2sc5hWSgF/3o0C+dj4hwavWEAJqqzYAm0r8EFqdiIqYfEvCRGjCttt2Fc9R?=
 =?us-ascii?Q?dMS91EelxmP/BWZWgKBg6YPaXtchGbElNzh2VBje9TsuHSeu4v7ndT0jjXTl?=
 =?us-ascii?Q?c783Csqcj5IHjc5EnPYM2NV7GgeeMCDm5RqAcDAsjN6iv78bA9CNUr4mXaaM?=
 =?us-ascii?Q?zoFo0j1tf3t6BHqth2aRIcLaXRjXaY+uRj+biseNgBiv9Jw0m0Ka5lwsAnZu?=
 =?us-ascii?Q?HAXhK+y/CHbJCUy8v0u2FRSLwPNHYrs4zHpL4Q0uHbms0XaFAz2kE/f4aXJM?=
 =?us-ascii?Q?0Vr2bo30mWGeLpM44ROsLNkzvtwSCv+ryD0dZM3RW3HGeOLnnu9i6aVVxY5Y?=
 =?us-ascii?Q?2uWt+3Kcab9ERtbCbHOFz1JU7Q2VGCTs7TmFpIOfdlG231giLxGNOh7BKmkL?=
 =?us-ascii?Q?0RfjmLVEvhX7T2DJxCHuZPu3/PKG9X4PK+KGlXzLcRHyQTHSkgl6gjBN3dQ6?=
 =?us-ascii?Q?NHpsnuZSgXWe7i//CEQgM/ZfeBYerjzHxFwPfthT/xymFgsdjFtHcH1oa0lD?=
 =?us-ascii?Q?ghBkVq18KO5tSDokrR8CJMYAa2JdTUdEAeo9nLMBcBTBhE4Nj1PvwyagZiLE?=
 =?us-ascii?Q?R1xI1rEBBqRhhMR7NWgLuNZ0j54HvTrNCVBPELuMu39ZP3JiOvbL0jJ96/7d?=
 =?us-ascii?Q?u605FsRwtAjyaGbppWdc3qq5Gmuxrj2TAonRLrziQBks5/U1AnLcEGA6ECbQ?=
 =?us-ascii?Q?daqyBRyfrFBKoIC3Tvjov/6tpVkdOq69Dvnh7qqV/BQu/LhkzdKFhZhfV3n6?=
 =?us-ascii?Q?pCCTYXM2pn15+yBrYag4qh+Zm+hyina+yA8z+lKU7suLWXHfrj9p+d7zwfei?=
 =?us-ascii?Q?wUmIWf29N7WTFVN1khvVW0nUBin3VjGTInwps5GFf9TPTPM1Wv7JnOHKhdrW?=
 =?us-ascii?Q?az+y4x4B7j3IQFM3ZGelNSgVWhFxqLWpGJ9ipuy5dHug5oAsbenHA5QobD12?=
 =?us-ascii?Q?C3rdJhH/RiXZ5Kyp6NYFhtCJA6j3BzDaJ5npVvBClRGcBK9EyWB5rED4/z5O?=
 =?us-ascii?Q?inGlEpqK+zDhaRBeHE0w81mXvcYfTsk4/T/RmDZ1FJfYCJiREpw5o9Mzp5N6?=
 =?us-ascii?Q?EpCdNwSqruOZko8zS9yX3xTx2qwPRLiHb84RQhSHQ169b0M0wmMGDDIY93iP?=
 =?us-ascii?Q?AGezy9toqD2m9WWcX0k6OvO6oQ49cP28R24EMPFQruSLEOXcUx+vmQBUbj47?=
 =?us-ascii?Q?F7eltZCVZCuNii6MXHGu8pt6KHBFgxvgURDY3ce1rGMYMSkWNKxKpETg77kd?=
 =?us-ascii?Q?aI5EeTLh+jkgBSVfZ48LE/A48kDGyfxzyGPMSb8P508g7rwUsaKTHJsQOk10?=
 =?us-ascii?Q?SKXs/iLhRvEhwmsJHAyJbSWOnuPh/6Fm5ekojur/FnIMacgS9iGRzzkl0w3K?=
 =?us-ascii?Q?CA89+hvvTOjaNCU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR03MB5458.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CmGQpON4QCgdMG1BmREJivYvBFh6n1Y5SXkVcd0Wfp7paHg/Ep1CDix6GCIk?=
 =?us-ascii?Q?AvexgiQcJtei2UNJ6QWk2aJdxpR24L2jp5LfWwO4JUgnp9GItFyMAZZe1Q+O?=
 =?us-ascii?Q?kzFwkf3xPBPFVi3BjE2su9jCwjuZk8mFwUYBhtCACb0qUC3cUoeKKyI3+0G3?=
 =?us-ascii?Q?1A4Jy4NU8JqBSXv6X2wrwX2Vub3hD3zEO4jQh9sSjaf0mP63uXK52qIMWhTn?=
 =?us-ascii?Q?7uZIl6hdwyC1IoewB8RktPFi1HRPtsb0aVPYJJ+WvY2gd45mtmQzekkjaqNo?=
 =?us-ascii?Q?7CNJzsdo6ZaqVPR3t9UThJhDnVLyMoN2+ljZaEwKPjTuRpF10jH4D/kWmPSu?=
 =?us-ascii?Q?+DIO3Ovb9T1Gmccj01dY/CvNHzgahgvi+U4Xs6Jim/IXY55UHh+CpvEgZSaN?=
 =?us-ascii?Q?HE+fHPOQCCcO2JiApY+1lpJ1zg42JZmXl1RSs5uCmjhdLhiq/Ltp2RC7hQ7W?=
 =?us-ascii?Q?9H53tLr0Oj84cKHrzOK8cnfaPr7W1UaV0nU7hJsPlYNCtSQSzXM+p4LJttGD?=
 =?us-ascii?Q?cQWIkrBhd3Xp3M+3SPuN+U74vxxIKHDQXXinYZpjZ/LwF7qlbm8OkOwUD6aw?=
 =?us-ascii?Q?XHBkr3cRVgjakwYb5Xs3Wbzplwef/gBTre9IPPoKWAeGtgnzLH6dxMTVYF/b?=
 =?us-ascii?Q?s6qNbGSQ4NIwcEyIFKyZtRTHaZrhRt4G+UHt6Zpi1ZLezOZaSkIbnhZYIEx5?=
 =?us-ascii?Q?Wk8R0AwTXzxO38rO7HaK4a4+6eG2Vad29fQ2OI80iX5qZ6i1nI97MnsMXbir?=
 =?us-ascii?Q?cnFcFz0vc7ZuXmUt2u7Vkl+92XgwN+JkfzEnmkbQDcR8qK7t2WYqEvnw6GVe?=
 =?us-ascii?Q?Eo5BvGgKvgVPozYU6yEPf/W4KYYTO6yZLJAUDY8Jg0T8MZ5vtkA46m1K67zO?=
 =?us-ascii?Q?BgA23yEgJHZ+RDs45Osd2aStuBR7fD01jFRPxtDylff9bON/0TX/YRsY/Czu?=
 =?us-ascii?Q?bPEGCiyexNWR9fDhdP/N4qRThW7avc7+VPImWCVep41B+hdgSd/Xhg2lYXxC?=
 =?us-ascii?Q?PfGWJdzSyA/STT5f8hDZbrhbzy7mwNKjKKEEBmyC+rw8eEejmGajzww4VxwE?=
 =?us-ascii?Q?vbujiO6phxxLR6vOa8PYEXX8heYXxAsCSVEBszfVdSlz9MdwPu8IixAJJLNT?=
 =?us-ascii?Q?EHBlD6eTseXuW+Cs/bz/QKzl06S/r1/GluUoj1kpnlO0fQmX3cqPqp+7xLjQ?=
 =?us-ascii?Q?4S5eoC5hicQEOgKH6+4dDofex0RZ3e8WcEW6Utqev/rZB7kyZKeYgZlLNj7n?=
 =?us-ascii?Q?hGvALtsXMHD9TyomC0zYt/DUKks+79fI2AtS3sUHFBuaczLH+q68Ibaff/yn?=
 =?us-ascii?Q?rm4eDQt1FS5V6p4CGrEoXcIQ5a1LfLvBTp6lp2IE/HnzO0wZX9V4l19k7P6R?=
 =?us-ascii?Q?8OXzTXT3rCG7kycpv5BbjU1Z2dN3xl4wIguq80H30zDICVR2msbmYjaN7oRl?=
 =?us-ascii?Q?pAbKYfE9mPrvdef6Bl4y6Tto+rJs88oZFZBhR4s+nWNXxCe36dpoCy+h3H6Q?=
 =?us-ascii?Q?HR60hHt0jMxo5hIzEv35KuwxxPq9g+gXlia5cOfkOHBy9zDflw0wy57SyLu/?=
 =?us-ascii?Q?ZeUYIS9xsyDfLZ7lOzfPw+QyAYkVQD1TvsM/zcXe6ABfZRTG32YYNlfYmyDE?=
 =?us-ascii?Q?QgCNbX9/L9E80JyVRVhu+W7TynkXEb3hdrsRNRvUzD9Q6RJx4a9ls+WVtD1E?=
 =?us-ascii?Q?72z99eM5eHdEe1izJY/DIfEVdSlB88PiU2TFg/kX/jIHjBqxPzOM+FadQz8L?=
 =?us-ascii?Q?7fUjUjfATUpPKd8EU+tS4ib4G+387wZsN545zEQOQqD00sqKAzT13169PsxW?=
X-MS-Exchange-AntiSpam-MessageData-1: ydFOkvurPqtaSg==
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6699cd8f-a529-4869-e6b4-08de3c6f44a7
X-MS-Exchange-CrossTenant-AuthSource: BLAPR03MB5458.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 06:49:32.5213
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jYIQyBKN0YnYrApQt8HVt2ug5maMEvx6qDbqMdHixNZSRmgUwbQpP2jAhM+kmVLvmGBWme+MVpDgKDtQzHaSJYZj64nZiwR6wNJ/su1DwejjrZ2TFeNbP/7AfFhHi/lGMHMMo9a/8U23+f2sBjtYHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6857

From: Muhammad Amirul Asyraf Mohamad Jamian <muhammad.amirul.asyraf.mohamad.jamian@altera.com>

This patch introduces a new hardware monitoring (hwmon) driver for the
Altera SoCFPGA platform, enabling kernel support for monitoring voltage and
temperature sensors critical for device health and system stability.

Changes include:
- New driver implementation 'drivers/hwmon/altera-hwmon.c' providing sensor
  reading and event handling capabilities tailored for SoCFPGA hardware.

- Build system integration by adding Kconfig and Makefile entries, allowing
  users to enable the driver in kernel configuration.

- Documentation added in 'Documentation/hwmon/altera-hwmon.rst', detailing
  driver features, usage instructions, device tree bindings, and
  configuration options.

- Update to 'Documentation/hwmon/index.rst' to reference the new driver
  documentation, improving discoverability and user guidance.

Signed-off-by: Khairul Anuar Romli <khairul.anuar.romli@altera.com>
Signed-off-by: Muhammad Amirul Asyraf Mohamad Jamian <muhammad.amirul.asyraf.mohamad.jamian@altera.com>
---
 Documentation/hwmon/altr-hwmon.rst |  32 +++
 Documentation/hwmon/index.rst      |   1 +
 MAINTAINERS                        |   2 +
 drivers/hwmon/Kconfig              |  10 +
 drivers/hwmon/Makefile             |   1 +
 drivers/hwmon/altr-hwmon.c         | 427 +++++++++++++++++++++++++++++
 6 files changed, 473 insertions(+)
 create mode 100644 Documentation/hwmon/altr-hwmon.rst
 create mode 100644 drivers/hwmon/altr-hwmon.c

diff --git a/Documentation/hwmon/altr-hwmon.rst b/Documentation/hwmon/altr-hwmon.rst
new file mode 100644
index 000000000000..3ef1ca0d1686
--- /dev/null
+++ b/Documentation/hwmon/altr-hwmon.rst
@@ -0,0 +1,32 @@
+.. SPDX-License-Identifier: GPL-2.0
+Kernel driver altr-hwmon
+=========================
+
+Supported chips:
+
+ * Intel N5X
+ * Stratix10
+ * Agilex
+ * Agilex5
+
+Contributor: Kris Chaplin <kris.chaplin@intel.com>
+             Khairul Anuar Romli <khairul.anuar.romli@altera.com>
+             Muhammad Amirul Asyraf Mohamad Jamian <muhammad.amirul.asyraf.mohamad.jamian@altera.com>
+
+Description
+-----------
+
+This driver supports hardware monitoring for 64-Bit SoC FPGA and eASIC devices
+based around the Secure Device Manager and Stratix 10 Service layer.
+
+The following sensor types are supported
+
+  * temperature
+  * voltage
+
+
+Usage Notes
+-----------
+
+The driver relies on a device tree node to enumerate support present on the
+specific device. See Documentation/devicetree/bindings/hwmon/altr,socfpga-hwmon.yaml for details of the device-tree node.
diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index 85d7a686883e..d37d4cbbe8b5 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -40,6 +40,7 @@ Hardware Monitoring Kernel Drivers
    adt7470
    adt7475
    aht10
+   altr-hwmon
    amc6821
    aquacomputer_d5next
    asb100
diff --git a/MAINTAINERS b/MAINTAINERS
index 8ac7fef4563a..01f776fdbf6f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -942,6 +942,8 @@ M:	Muhammad Amirul Asyraf Mohamad Jamian <muhammad.amirul.asyraf.mohamad.jamian@
 L:	linux-hwmon@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/hwmon/altr,socfpga-hwmon.yaml
+F:	Documentation/hwmon/altr-hwmon.rst
+F:	drivers/hwmon/altr-hwmon.c
 
 ALTERA MAILBOX DRIVER
 M:	Tien Sung Ang <tiensung.ang@altera.com>
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index d9bac1e3057b..4351725831d3 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -2122,6 +2122,16 @@ config SENSORS_SMSC47M192
 	  This driver can also be built as a module. If so, the module
 	  will be called smsc47m192.
 
+config SENSORS_ALTERA_SOCFPGA
+	tristate "Altera SoC FPGA Hardware monitoring features"
+	depends on INTEL_STRATIX10_SERVICE
+	help
+	  If you say yes here you get support for the temperature and
+	  voltage sensors of Altera SoC FPGA devices.
+
+	  This driver can also be built as a module.  If so, the module
+	  will be called altera-hwmon
+
 config SENSORS_SMSC47B397
 	tristate "SMSC LPC47B397-NC"
 	depends on HAS_IOPORT
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index eade8e3b1bde..4ae4726bd0cb 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -218,6 +218,7 @@ obj-$(CONFIG_SENSORS_SMPRO)	+= smpro-hwmon.o
 obj-$(CONFIG_SENSORS_SMSC47B397)+= smsc47b397.o
 obj-$(CONFIG_SENSORS_SMSC47M1)	+= smsc47m1.o
 obj-$(CONFIG_SENSORS_SMSC47M192)+= smsc47m192.o
+obj-$(CONFIG_SENSORS_ALTERA_SOCFPGA)	+= altr-hwmon.o
 obj-$(CONFIG_SENSORS_SPARX5)	+= sparx5-temp.o
 obj-$(CONFIG_SENSORS_SPD5118)	+= spd5118.o
 obj-$(CONFIG_SENSORS_STTS751)	+= stts751.o
diff --git a/drivers/hwmon/altr-hwmon.c b/drivers/hwmon/altr-hwmon.c
new file mode 100644
index 000000000000..beecfa8537a4
--- /dev/null
+++ b/drivers/hwmon/altr-hwmon.c
@@ -0,0 +1,427 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Altera SoC FPGA hardware monitoring driver
+ *
+ * Copyright (c) 2021 Intel Corporation. All rights reserved
+ * Copyright (c) 2025 Altera Corporation. All rights reserved
+ *
+ * Contributors:
+ *	Kris Chaplin <kris.chaplin@intel.com>
+ *	Ang Tien Sung <tiensung.ang@altera.com>
+ *	Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>
+ *	Khairul Anuar Romli <khairul.anuar.romli@altera.com>
+ *	Muhammad Amirul Asyraf Mohamad Jamian <muhammad.amirul.asyraf.mohamad.jamian@altera.com>
+ */
+
+#include <linux/arm-smccc.h>
+#include <linux/hwmon.h>
+#include <linux/hwmon-sysfs.h>
+#include <linux/module.h>
+#include <linux/firmware/intel/stratix10-svc-client.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+
+#define HWMON_TIMEOUT     (msecs_to_jiffies(SVC_HWMON_REQUEST_TIMEOUT_MS))
+
+#define ETEMP_INACTIVE         0x80000000
+#define ETEMP_TOO_OLD          0x80000001
+#define ETEMP_NOT_PRESENT      0x80000002
+#define ETEMP_TIMEOUT          0x80000003
+#define ETEMP_CORRUPT          0x80000004
+#define ETEMP_BUSY             0x80000005
+#define ETEMP_NOT_INITIALIZED  0x800000FF
+
+#define ALTR_SOCFPGA_HWMON_MAXSENSORS 16
+#define ALTR_SOCFPGA_HWMON_TEMPERATURE "temperature"
+#define ALTR_SOCFPGA_HWMON_VOLTAGE "voltage"
+
+struct altr_socfpga_hwmon_priv {
+	struct stratix10_svc_chan *chan;
+	struct stratix10_svc_client client;
+	struct completion completion;
+	struct mutex lock; /* protect fpga mailbox access */
+	int temperature;
+	int voltage;
+	int temperature_channels;
+	int voltage_channels;
+	const char *altr_socfpga_volt_chan_names[ALTR_SOCFPGA_HWMON_MAXSENSORS];
+	const char *altr_socfpga_temp_chan_names[ALTR_SOCFPGA_HWMON_MAXSENSORS];
+	u32 altr_socfpga_volt_chan[ALTR_SOCFPGA_HWMON_MAXSENSORS];
+	u32 altr_socfpga_temp_chan[ALTR_SOCFPGA_HWMON_MAXSENSORS];
+};
+
+static umode_t altr_socfpga_is_visible(const void *dev,
+				       enum hwmon_sensor_types type,
+				       u32 attr, int chan)
+{
+	const struct altr_socfpga_hwmon_priv *priv = dev;
+
+	switch (type) {
+	case hwmon_temp:
+		if (chan < priv->temperature_channels)
+			return 0444;
+
+		return 0;
+	case hwmon_in:
+		if (chan < priv->voltage_channels)
+			return 0444;
+
+		return 0;
+
+	default:
+		return 0;
+	}
+}
+
+static void altr_socfpga_readtemp_smc_callback(struct stratix10_svc_client *client,
+					       struct stratix10_svc_cb_data *data)
+{
+	struct altr_socfpga_hwmon_priv *priv = client->priv;
+	struct arm_smccc_res *res = (struct arm_smccc_res *)data->kaddr1;
+
+	if (data->status == BIT(SVC_STATUS_OK)) {
+		priv->temperature = res->a0;
+	} else {
+		dev_err(client->dev, "%s returned 0x%lX\n",
+			__func__, res->a0);
+	}
+
+	complete(&priv->completion);
+}
+
+static void altr_socfpga_readvolt_smc_callback(struct stratix10_svc_client *client,
+					       struct stratix10_svc_cb_data *data)
+{
+	struct altr_socfpga_hwmon_priv *priv = client->priv;
+	struct arm_smccc_res *res = (struct arm_smccc_res *)data->kaddr1;
+
+	if (data->status == BIT(SVC_STATUS_OK)) {
+		priv->voltage = res->a0;
+	} else {
+		dev_err(client->dev, "%s returned 0x%lX\n",
+			__func__, res->a0);
+	}
+
+	complete(&priv->completion);
+}
+
+static int altr_socfpga_read(struct device *dev, enum hwmon_sensor_types type,
+			     u32 attr, int chan, long *val)
+{
+	struct altr_socfpga_hwmon_priv *priv = dev_get_drvdata(dev);
+	struct stratix10_svc_client_msg msg;
+	int ret;
+
+	mutex_lock(&priv->lock);
+
+	reinit_completion(&priv->completion);
+
+	switch (type) {
+	case hwmon_temp:
+		if (chan > 15)
+			return -EOPNOTSUPP;
+
+		/* To support Page at upper word and channel at lower word */
+		msg.arg[0] = (((u64)1 << (priv->altr_socfpga_temp_chan[chan] & 0xFFFF))
+				+ (priv->altr_socfpga_temp_chan[chan] & 0xFFF0000));
+		priv->client.receive_cb = altr_socfpga_readtemp_smc_callback;
+		msg.command = COMMAND_HWMON_READTEMP;
+
+		ret = stratix10_svc_send(priv->chan, &msg);
+		if (ret < 0)
+			goto status_done;
+
+		ret = wait_for_completion_interruptible_timeout(&priv->completion,
+								HWMON_TIMEOUT);
+
+		if (!ret) {
+			dev_err(priv->client.dev,
+				"timeout waiting for SMC call\n");
+			ret = -ETIMEDOUT;
+			goto status_done;
+		} else if (ret < 0) {
+			dev_err(priv->client.dev,
+				"error %d waiting for SMC call\n", ret);
+			goto status_done;
+		} else {
+			ret = 0;
+		}
+
+		*val = ((long)(priv->temperature)) * 1000 /  256;
+
+		switch (priv->temperature) {
+		case ETEMP_INACTIVE:
+		case ETEMP_NOT_PRESENT:
+		case ETEMP_CORRUPT:
+		case ETEMP_NOT_INITIALIZED:
+			ret = -EOPNOTSUPP;
+			break;
+
+		case ETEMP_TIMEOUT:
+		case ETEMP_BUSY:
+		case ETEMP_TOO_OLD:
+			ret = -EAGAIN;
+			break;
+		default:
+			ret = 0;
+			break;
+		}
+
+		break;
+
+	case hwmon_in: // Read voltage
+		if (chan > 15)
+			return -EOPNOTSUPP; // Channel outside of range
+
+		msg.arg[0] = ((u64)1 << priv->altr_socfpga_volt_chan[chan]);
+		priv->client.receive_cb = altr_socfpga_readvolt_smc_callback;
+		msg.command = COMMAND_HWMON_READVOLT;
+
+		ret = stratix10_svc_send(priv->chan, &msg);
+		if (ret < 0)
+			goto status_done;
+
+		ret = wait_for_completion_interruptible_timeout(&priv->completion,
+								HWMON_TIMEOUT);
+
+		if (!ret) {
+			dev_err(priv->client.dev,
+				"timeout waiting for SMC call\n");
+			ret = -ETIMEDOUT;
+			goto status_done;
+		}  else if (ret < 0) {
+			dev_err(priv->client.dev,
+				"error %d waiting for SMC call\n", ret);
+			goto status_done;
+		} else {
+			ret = 0;
+		}
+
+		*val = ((long)(priv->voltage)) * 1000 /  65536;
+		ret = 0;
+		break;
+
+	default:
+		ret = -EOPNOTSUPP;
+		break;
+	}
+
+status_done:
+	stratix10_svc_done(priv->chan);
+	mutex_unlock(&priv->lock);
+	return ret;
+}
+
+static int altr_socfpga_read_string(struct device *dev,
+				    enum hwmon_sensor_types type, u32 attr,
+				    int chan, const char **str)
+{
+	struct altr_socfpga_hwmon_priv *priv = dev_get_drvdata(dev);
+
+	switch (type) {
+	case hwmon_in:
+		*str = priv->altr_socfpga_volt_chan_names[chan];
+		return 0;
+	case hwmon_temp:
+		*str = priv->altr_socfpga_temp_chan_names[chan];
+		return 0;
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static const struct hwmon_ops altr_socfpga_hwmon_ops = {
+	.is_visible = altr_socfpga_is_visible,
+	.read = altr_socfpga_read,
+	.read_string = altr_socfpga_read_string,
+};
+
+static const struct hwmon_channel_info *altr_socfpga_hwmon_info[] = {
+	HWMON_CHANNEL_INFO(temp,
+			   HWMON_T_INPUT | HWMON_T_LABEL, HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL, HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL, HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL, HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL, HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL, HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL, HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL, HWMON_T_INPUT | HWMON_T_LABEL),
+	HWMON_CHANNEL_INFO(in,
+			   HWMON_I_INPUT | HWMON_I_LABEL, HWMON_I_INPUT | HWMON_I_LABEL,
+			   HWMON_I_INPUT | HWMON_I_LABEL, HWMON_I_INPUT | HWMON_I_LABEL,
+			   HWMON_I_INPUT | HWMON_I_LABEL, HWMON_I_INPUT | HWMON_I_LABEL,
+			   HWMON_I_INPUT | HWMON_I_LABEL, HWMON_I_INPUT | HWMON_I_LABEL,
+			   HWMON_I_INPUT | HWMON_I_LABEL, HWMON_I_INPUT | HWMON_I_LABEL,
+			   HWMON_I_INPUT | HWMON_I_LABEL, HWMON_I_INPUT | HWMON_I_LABEL,
+			   HWMON_I_INPUT | HWMON_I_LABEL, HWMON_I_INPUT | HWMON_I_LABEL,
+			   HWMON_I_INPUT | HWMON_I_LABEL, HWMON_I_INPUT | HWMON_I_LABEL),
+	NULL
+};
+
+static const struct hwmon_chip_info altr_socfpga_hwmon_chip_info = {
+	.ops = &altr_socfpga_hwmon_ops,
+	.info = altr_socfpga_hwmon_info,
+};
+
+static int altr_socfpga_add_channel(struct device *dev,  const char *type,
+				    u32 val, const char *label,
+				    struct altr_socfpga_hwmon_priv *priv)
+{
+	if (!strcmp(type, ALTR_SOCFPGA_HWMON_TEMPERATURE)) {
+		if (priv->temperature_channels >= ALTR_SOCFPGA_HWMON_MAXSENSORS) {
+			dev_warn(dev,
+				 "Can't add temp node %s, too many channels",
+				 label);
+		return 0;
+		}
+
+		priv->altr_socfpga_temp_chan_names[priv->temperature_channels] = label;
+		priv->altr_socfpga_temp_chan[priv->temperature_channels] = val;
+		priv->temperature_channels++;
+		return 0;
+	}
+
+	if (!strcmp(type, ALTR_SOCFPGA_HWMON_VOLTAGE)) {
+		if (priv->voltage_channels >= ALTR_SOCFPGA_HWMON_MAXSENSORS) {
+			dev_warn(dev,
+				 "Can't add voltage node %s, too many channels",
+				 label);
+			return 0;
+		}
+
+		priv->altr_socfpga_volt_chan_names[priv->voltage_channels] = label;
+		priv->altr_socfpga_volt_chan[priv->voltage_channels] = val;
+		priv->voltage_channels++;
+		return 0;
+	}
+
+	dev_warn(dev, "unsupported sensor type %s", type);
+	return 0;
+}
+
+static int altr_socfpga_probe_child_from_dt(struct device *dev,
+					    struct device_node *child,
+					    struct altr_socfpga_hwmon_priv *priv)
+{
+	u32 val;
+	int ret;
+	struct device_node *grandchild;
+	const char *label;
+	const char *type;
+
+	of_property_read_string(child, "name", &type);
+	for_each_child_of_node(child, grandchild) {
+		ret = of_property_read_u32(grandchild, "reg", &val);
+		if (ret) {
+			dev_err(dev, "missing reg property of %pOFn\n",
+				grandchild);
+			return ret;
+		}
+		ret = of_property_read_string(grandchild, "label", &label);
+		if (ret) {
+			dev_err(dev, "missing label propoerty of %pOFn\n",
+				grandchild);
+			return ret;
+		}
+
+		altr_socfpga_add_channel(dev, type, val, label, priv);
+	}
+
+	return 0;
+}
+
+static int altr_socfpga_probe_from_dt(struct device *dev,
+				      struct altr_socfpga_hwmon_priv *priv)
+{
+	const struct device_node *np = dev->of_node;
+	struct device_node *child;
+	int ret;
+
+	/* Compatible with non-DT platforms */
+	if (!np)
+		return 0;
+
+	for_each_child_of_node(np, child) {
+		ret = altr_socfpga_probe_child_from_dt(dev, child, priv);
+		if (ret) {
+			of_node_put(child);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static int altr_socfpga_hwmon_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device *hwmon_dev;
+	struct altr_socfpga_hwmon_priv *priv;
+	int ret;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->client.dev = dev;
+	priv->client.receive_cb = NULL;
+	priv->client.priv = priv;
+	priv->temperature_channels = 0;
+	priv->voltage_channels = 0;
+
+	ret = altr_socfpga_probe_from_dt(dev, priv);
+	if (ret) {
+		dev_err(dev, "Unable to probe from device tree\n");
+		return ret;
+	}
+
+	mutex_init(&priv->lock);
+
+	priv->chan = stratix10_svc_request_channel_byname(&priv->client,
+							  SVC_CLIENT_HWMON);
+	if (IS_ERR(priv->chan)) {
+		dev_err(dev, "couldn't get service channel %s defering probe...\n",
+			SVC_CLIENT_HWMON);
+		return -EPROBE_DEFER;
+	}
+
+	dev_info(dev, "Initialized %d temperature and %d voltage channels",
+		 priv->temperature_channels, priv->voltage_channels);
+
+	hwmon_dev = devm_hwmon_device_register_with_info(dev, "altr_hwmon", priv,
+							 &altr_socfpga_hwmon_chip_info,
+							 NULL);
+
+	init_completion(&priv->completion);
+	platform_set_drvdata(pdev, priv);
+
+	return PTR_ERR_OR_ZERO(hwmon_dev);
+}
+
+static void altr_socfpga_hwmon_remove(struct platform_device *pdev)
+{
+	struct altr_socfpga_hwmon_priv *priv = platform_get_drvdata(pdev);
+
+	stratix10_svc_free_channel(priv->chan);
+}
+
+static const struct of_device_id altr_socfpga_of_match[] = {
+	{ .compatible = "altr,socfpga-hwmon" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, altr_socfpga_of_match);
+
+static struct platform_driver altr_socfpga_hwmon_driver = {
+	.driver = {
+		.name = "altr-hwmon",
+		.of_match_table = altr_socfpga_of_match,
+	},
+	.probe = altr_socfpga_hwmon_probe,
+	.remove = altr_socfpga_hwmon_remove,
+};
+module_platform_driver(altr_socfpga_hwmon_driver);
+
+MODULE_AUTHOR("Altera Corporation");
+MODULE_DESCRIPTION("Altera SoC FPGA hardware monitoring features");
+MODULE_LICENSE("GPL");
-- 
2.43.7

