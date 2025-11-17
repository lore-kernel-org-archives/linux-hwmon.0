Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11021121.outbound.protection.outlook.com [40.107.130.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07833334699;
	Mon, 17 Nov 2025 12:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.121
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763383224; cv=fail; b=WQMpZFfHufcCo8mxIqkCmYXTKmSLna2Mrmx8lqNE7j5XqVcX19nnsj0HsDFeeQf2isMawBuwfrrIcIBHIweLj/dxX8c+Xgkavp8RTAKT+OAlbwk0SWgsOGOuqx5amTH0h+v0lHAnsn72akJoNoaOghpi5tbiUemTcj/BjDEGXjU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763383224; c=relaxed/simple;
	bh=dNHqwgR1mxDkmdtLqyhpWugXwUBH1ZkNKPCUK669Gdw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gEjppLfPRAX06Y9M79k9JeFKkjuStp6HhyFHTeS9kpT1zMsb1TswfquX6XU7h8xnmRpxAM7CVdMBZYH4rimEttJRl3+YmB1eZH/yV0/XmLX3mn7Z2Jzdjr/j8xqj53U6f+0bfdrxOwbwSuRezv/FhklUuFt7IxuZGaF0tlfr2Uk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=becom-group.com; spf=pass smtp.mailfrom=becom-group.com; dkim=pass (1024-bit key) header.d=BECOMElectronics.onmicrosoft.com header.i=@BECOMElectronics.onmicrosoft.com header.b=Xdt7Tgg2; arc=fail smtp.client-ip=40.107.130.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=becom-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=becom-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=BECOMElectronics.onmicrosoft.com header.i=@BECOMElectronics.onmicrosoft.com header.b="Xdt7Tgg2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a5BhOvYvdH081UFfOA7Uw2PMGxjBvorLbU5wKioBoV42AcLgnPFSMZieXar4Lj4yei84GYmR2Y92DzLXlYWFasZyVchRISO+jTuWgDhxuUOzFsV64wsIwyq6ioDDaUYbcQ1sZeDVMDmkYaxSqX35D6QaMR2D/NgnWv0UVJbThr/Z31ZkfTu8fNkJhM4we/rBp89C3b/dV+gTRaoYTzIj8OKgZlXufpAw64cc9ryJ1P1IgiYVzlSBEGyebn0ajAZhQHN649IhU9B9N8QWYCcIJDoDZHd2+eQyaoRwDCQ2XfJiSbcZia0uGjAuSD7nqEyjujPwfzbIEjEB1ot4xKETTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Gq50RglMBRqovAny1f7QLh6DEs5L5CXT4Nu/lBdQhw=;
 b=jVmKmkLSvBiz5AdT8GfZym5VXTAapX7DnDYwDKw6YM84kxUrbKo+T4qGSR0qoIxWU+l0MNhXVg7afMBVCC4EcGIKIWhRFjsL+3qWllSUb/l1EdftWdvH6E9SjO8Quag0s3aCDBgLe3SF6AtWQJwXHco9c84rKcEdWZ3jPrO0SUygcZV1P+AKFCcePokNmkkYQFRMVjognkY0yvbyEEh5AD3AuqjPuWsGt4T4N0677ZFdmfA8C2QfeCID5YL2pchOG+3S8vm+MoFI68eURUv0jsREb/TzwdRbXVBjBELrCSETi0x+9J+jEdbIi3uENdvMJTEqq58sM1PwUQ5V9RnkwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=becom-group.com; dmarc=pass action=none
 header.from=becom-group.com; dkim=pass header.d=becom-group.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=BECOMElectronics.onmicrosoft.com;
 s=selector2-BECOMElectronics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Gq50RglMBRqovAny1f7QLh6DEs5L5CXT4Nu/lBdQhw=;
 b=Xdt7Tgg2ZUzaltJugY472yYG17CzHYioc85ilnwsRBLWjOLuoOEuMmkn1dsy6b8tVowTY2uc6uEkvAFXzbqViEMXYCj9xFLtJsI19f+3OhpUvqgfolcpNFEEIkbBhZK6/A+UiH/ZUtKXX/pP6Y1evrlU3uFYU8OAEP+nyjJpNsk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=becom-group.com;
Received: from PAXPR01MB8613.eurprd01.prod.exchangelabs.com
 (2603:10a6:102:232::12) by DBAPR01MB6664.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:185::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Mon, 17 Nov
 2025 12:40:13 +0000
Received: from PAXPR01MB8613.eurprd01.prod.exchangelabs.com
 ([fe80::5ca2:88f2:e3ee:8eab]) by PAXPR01MB8613.eurprd01.prod.exchangelabs.com
 ([fe80::5ca2:88f2:e3ee:8eab%5]) with mapi id 15.20.9320.021; Mon, 17 Nov 2025
 12:40:13 +0000
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
Subject: [PATCH 2/4] hwmon: documentation: add tids
Date: Mon, 17 Nov 2025 13:38:04 +0100
Message-ID: <20251117123809.47488-3-Thomas.Marangoni@becom-group.com>
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
X-MS-Office365-Filtering-Correlation-Id: bbccc3c2-b40c-42a2-59d8-08de25d673e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0bEC82Ua7/uY8iwJmJ/AGUboyXb9Vtvr7yw/Z4idJPmDyMSBdZIjAy2uIF0a?=
 =?us-ascii?Q?5+8xC6D1ZC922Klkjsg38Xnn2uVyIJ8lgvh52AMRP6ALjcyw/6h8+rERxekB?=
 =?us-ascii?Q?3rEBkpMZrn3gxquyNOImpWtFSjHQ+wunmHJ8jSp0r+jp0hH0aasXR/I9NwcV?=
 =?us-ascii?Q?ktkQ7BgPU5eEpFER84PqRrTB8DnyRcK0CHegzLaeTQrX+5cVVMnCUOwfyewp?=
 =?us-ascii?Q?MfKBtyLmVzJ6CV/lm8rDllGjhfSm19sqPwKMisnmwJzhGqFmh2imujuaoSec?=
 =?us-ascii?Q?cNxJbzKHnJCYA6bgtEY53bE6WbJx4+YObLt2PH19u1Py25AApiI07k6QMOSd?=
 =?us-ascii?Q?8p0cz2VuJcPA7lMqz5ZEfFeStLK6lDOlVtnVEWJ/ZN++CGZKmAbx49tm42um?=
 =?us-ascii?Q?L1T1Fi+uBGqLu5EMBjicMzkyB/PRjPQ4p7QY4BfUKqJPQR3mwWmGYQ5oPdRp?=
 =?us-ascii?Q?G/V6FlKJ3hrRHpRUojvpdjfNgh9KckqAYtN9+mnmDy1pFg0YBi3/1wYezTFj?=
 =?us-ascii?Q?CPGPwgNXuYLbDY5ls2LoC25SbguCTG1vTKSilKwlvM7ceIG2Z2Hn6NvMWY2O?=
 =?us-ascii?Q?ONYPfKpjPPOFswyf1sKz7HVE8CC+QxZSsTuWOXDv9u4MhY+lerfTbeyWlQlC?=
 =?us-ascii?Q?FcHcbEucdY6xAzAZN2H6tZhZ9rr3tL6Sr7tJ59oO/IZJu3uoquBuUki7MjbU?=
 =?us-ascii?Q?qS+KEkDX2YNx/T6BOwSR9+ZBnEUMiDJSGvzd1KvzCCO0678ijUYhXyR1YeZ8?=
 =?us-ascii?Q?ObWX9cWY2CHJjk2+g6F/E3QvfUpUVsIpRSBivlGacXGrs0YtF4OaiQVrI9Uo?=
 =?us-ascii?Q?sVeDN+uiEXMWZhKwArgpZalKYvEC0gQ+osvCZ/mD2f8tzhrT7ysFPVgDY4w/?=
 =?us-ascii?Q?+HwfLh3e+ZcCCyNcgiDzwv302iZ6ihfAjkI2wM9cSFb3ZgH9QWAM86cPvCjW?=
 =?us-ascii?Q?LxAHYYcX5Nv0LJxZ4o5V5+i6y6w0oRMLs+Kdc54karcUDsIDMLtaR58Qh0nk?=
 =?us-ascii?Q?EOGn/Ut0e6WmGeny9ZjmtoPS/S/uqzQKDl5NO9O9kMb0+KAl2yxK44tHcjXB?=
 =?us-ascii?Q?kqFTRwDXoBtf5T78NNAJq5I/kV7QglPZ9Ytiz0tTApHi+Yox01gThyKpp3e7?=
 =?us-ascii?Q?YhgXIc/W+jCix3dzuao8KLcugsVwdIWT1FnYWnvDltUp4RI9NS7Zaj+t5/2t?=
 =?us-ascii?Q?lRp/QgpOo+CZBhw2ZCVh0FQ0mzn3uZkXCtsradYdEywQoPE5bfKWdPZY0e9V?=
 =?us-ascii?Q?HzzRI4I6jBWzPq9NjAR1A4LtPralecoHziluEMpSiqqeYkWQFSM929pMWtGi?=
 =?us-ascii?Q?s0elEmB8r1EduP+jRnyZMw6dEPbWipI13OIwPX35HJ/0VuGQoRGJl8Q8gz4h?=
 =?us-ascii?Q?hN8UH5FQyy7NNUjStwalVT6aRFbvQ5aN+ymxFi1XzcEydNNZsBXiQd4Nurxu?=
 =?us-ascii?Q?bZCm7Cw9J+A7CT4rpKQvhZlbjX5heHnD?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR01MB8613.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hVH5PrKl6frL52uCUx/ktO97to6/HGb64NjmZBT/m8YvAqfzT/JWkURpMEX4?=
 =?us-ascii?Q?dt3ylcAEfR3C85BWfKv1PGP3nFp0/427pYWftuMVZHBY4+R3djJBpt52G8GI?=
 =?us-ascii?Q?snAFXvGOHSi++JeFKTqSJspmNcbE1lhZaI8rQHgNky06JnSuF44plY+nmSZZ?=
 =?us-ascii?Q?eV9m+qvtLFKVPoogm25PpcWt86uvgBrCaxH0EszuyIZ6iDcza4u4AUiS77DH?=
 =?us-ascii?Q?DSaKMqbVbrRs+/hu191v/eEX0z1Qu3cjLSuXfM1R7TsQoMT+d0kZkHFhkoXe?=
 =?us-ascii?Q?YxEybpmJhRLzVlnf2b3e152UuF2AzVdy+IKD5AYsS/fkrYpTIZ2UZAcaBi1T?=
 =?us-ascii?Q?1p+DXO/nVoA+G+XCecVWlW/dWL8egg2qGdZiKWQgfCemLMvHGuOS4T1YehYm?=
 =?us-ascii?Q?t46E+uwXhrtIiIbwP6J/BlsTBupY1QPuVv9rP3AFu1X0tfhf3yD8jyri+YHs?=
 =?us-ascii?Q?wWrncuP4SEflr2/adSmgJ8YMK6kFEPUTLzwNaZ4dWXo/jRiRsS1X1THzso+n?=
 =?us-ascii?Q?YmKI6bs+qoJCO6nRqwVGuaBM6wCbtCUUws/8iG5sYI5Sk8k5kWlTP++0GZB9?=
 =?us-ascii?Q?FV+QZkQG3pEK4KqiBQ3BfC/88UfexY/78yCrqp4PZ3D6TFJfSOBWyqHfSgok?=
 =?us-ascii?Q?BcNDAFEWem5jT2AIpQYMI03tFx10R07/HGln/A9oMu5VItNSU8o6CVpla4Iv?=
 =?us-ascii?Q?PuPB3XgbFiyUD7kJ5e/gmAkPsIyxtXH6L1bomFoRW4OUH7bk3oIsRtwes9N1?=
 =?us-ascii?Q?RxChb7nCnJkRqVGzgu06Q1mnTsgSc4nHpdbVnVuuHlZpaUQbb9orDAeD0QGF?=
 =?us-ascii?Q?l/0wtnkVBzBhqNqNb3diDDeFfKCAL437hkQMnYwF9qNVNh2Gmco7yMdHUb2p?=
 =?us-ascii?Q?y9gaIGYI8jzbDi9I2AqWzmVofNnxsAjK3t9buNAMBJj9BtL+lYhpdixZ6KDU?=
 =?us-ascii?Q?6Q5vtS2oPjcdMjcH7YrNMcvfmOdKobqWKT/QxWZPcLIUVMm/KRYBggX1EB/m?=
 =?us-ascii?Q?EpL7HC9VIR1pkb5zIMrkwb4E7HFwhOnEY15fH4/hLGaNQ1tAjLc6Xb56p3Ls?=
 =?us-ascii?Q?8aLTo6XBAKYvFI5NchJHPbh23MDjCMyzcdRBiY0sK+7ANvPvWbYWrCzmsJ2G?=
 =?us-ascii?Q?L90er+62uB08y+uaPcKk2TNkTh8wCuNUvbPBT0lXFTNuRB5KKwt1/Va6ZqCa?=
 =?us-ascii?Q?DEu1xJy/Jt1CsKF9d9cSCN7ukb7Pts4wZqgQPRKJiDIYwKNvsBYJOkEyPqTF?=
 =?us-ascii?Q?HlXXmNa6izwInTYX23CIfVDNC9Rz3nZrM3FWfNex40MoAfNJKnWjGh92kyIa?=
 =?us-ascii?Q?bkFFMxr5MET2kSjb5UcA1+AzUSNNTmB0RO17E/zGmYoignZsvUKy1tGMRvQZ?=
 =?us-ascii?Q?AfoR7A35NWEYPeDYs7qy6a06nieMlgT+42DhjmCWYDwfeP1SsHPBnYBtfzXG?=
 =?us-ascii?Q?miK/iCcLVPLAmmhEytk0mR6j+REb29j91AcpLYnK7Yrbc58XbTtACw0Nkuun?=
 =?us-ascii?Q?JiuQy2BLms25CB18xxoqV+4EjzuIFx35452U7cwxxhZ+TVtb65TxLVr1dDAO?=
 =?us-ascii?Q?tPKx5fcrSVrZPxfsXx06UfNQ7plrCO1PEzWskq4hn7IBScHbDYEq75IFH3Pk?=
 =?us-ascii?Q?2A=3D=3D?=
X-OriginatorOrg: becom-group.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbccc3c2-b40c-42a2-59d8-08de25d673e0
X-MS-Exchange-CrossTenant-AuthSource: PAXPR01MB8613.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 12:40:13.2075
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 738f6472-f50a-488c-ab88-c200fd976533
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AonVxO9ZBbXGJcuCoLmRyGtiBeqmWiuXNdxvvuTHKK9nEDuNf97rxsfifr9fZesg7mDpkzbK05Uey8oND91zT1P28mHLMxQbnVGlFB2SAio=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR01MB6664

Add tids driver documentation
---
 Documentation/hwmon/tids.rst | 61 ++++++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)
 create mode 100644 Documentation/hwmon/tids.rst

diff --git a/Documentation/hwmon/tids.rst b/Documentation/hwmon/tids.rst
new file mode 100644
index 000000000000..f3fea4e416ea
--- /dev/null
+++ b/Documentation/hwmon/tids.rst
@@ -0,0 +1,61 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Kernel driver tids
+===================
+
+Supported Chips:
+
+  * WSEN TIDS
+
+    Prefix: 'tids'
+
+    Addresses scanned: None
+
+    Datasheet:
+
+      English: https://www.we-online.com/components/products/manual/Manual-um-wsen-tids-2521020222501%20(rev1.2).pdf
+
+Author: Thomas Marangoni <Thomas.Marangoni@becom-group.com>
+
+
+Description
+-----------
+
+This driver implements support for the WSEN TIDS chip, a temperature
+sensor. Temperature is measured in degree celsius. In sysfs interface,
+all values are scaled by 1000, i.e. the value for 31.5 degrees celsius is 31500.
+
+Usage Notes
+-----------
+
+The device communicates with the I2C protocol. Sensors can have the I2C
+address 0x38 or 0x3F. See Documentation/i2c/instantiating-devices.rst for methods
+to instantiate the device.
+
+Sysfs entries
+-------------
+
+=============== ============================================
+temp1_input     Measured temperature in millidegrees Celsius
+update_interval The interval for polling the sensor, in
+                milliseconds. Writable. Must be 5, 10, 20
+                or 40.
+temp1_max_hyst  The temperature in millidegrees Celsius, that
+                is triggering the temp1_max_alarm. Writable.
+                The lowest possible value is -39680 and the
+                highest possible value is 122880. Values are
+                saved in steps of 640.
+temp1_min_hyst  The temperature in millidegrees Celsius, that
+                is triggering the temp1_min_alarm. Writable.
+                The lowest possible value is -39680 and the
+                highest possible value is 122880. Values are
+                saved in steps of 640.
+temp1_max_alarm The alarm will be triggered when the level
+                reaches the value specified in
+                temp1_max_hyst. It will reset automatically
+                once it has been read.
+temp1_min_alarm The alarm will be triggered when the level
+                reaches the value specified in
+                temp1_min_hyst. It will reset automatically
+                once it has been read.
+=============== ============================================
-- 
2.51.1

