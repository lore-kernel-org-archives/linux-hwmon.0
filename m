Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11022074.outbound.protection.outlook.com [52.101.66.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96A76361DAA;
	Wed, 19 Nov 2025 12:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763556744; cv=fail; b=OMtSbTI1Sngvh6ahILzRnoMmnlqBHh6OEreC0hhTwIDbehVTEv2KfYGtnVs7WC9yUOaIMQb6aE9Rm21HIcU8D+gP2ZzZy8V9Ex/q5SDLXJtp3OucL7Mhq2byo1E3JxmYRE+vLipyHs9IAf+PZOEhItCckwAwBavcLP5KNcnu+10=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763556744; c=relaxed/simple;
	bh=w/OuqthzVWP5Q/A9W3TpyU9kCs6ogjuUqiqzzV7YLYM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Zf/7A2/WPTYyQfFaO9khvrW5acBwmUPDJi8W9KqJPydso8mj2CwkFAS3aFK4p2DpE7g2UHlfkKY7hAevwIVcF0oCVtxMB/EjZTZymKtFBgNamEaRBdGa3iVj6vEaNBCOeZx8XFXkW3bfkK8l0/ga/3hBGgavxEPjBETQxkGF3p4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=becom-group.com; spf=pass smtp.mailfrom=becom-group.com; dkim=pass (1024-bit key) header.d=BECOMElectronics.onmicrosoft.com header.i=@BECOMElectronics.onmicrosoft.com header.b=Ldm/zqJp; arc=fail smtp.client-ip=52.101.66.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=becom-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=becom-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=BECOMElectronics.onmicrosoft.com header.i=@BECOMElectronics.onmicrosoft.com header.b="Ldm/zqJp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bpKFy9WyzCR0Cmf/7Pgi+MAMuKcyf3Ro1PqgsWbnlnuuVRYoZnyr4BigLIV/pn1J6AwppiBbiPsstYB4n4zr/3O63mJI3WW17T5jkcujAPN0V+s0goMKVR2rBkhQS5orWKk0PvFDPMnEwVj4CShe/iHEfn0snJKyPMdm+2Czfx+YpBxIvxe2DedYk2xAz77SDksP21n5WH5dwsG2qtW+t7twe5Q3+WiJxU0yD0uUzf1N9f+F3gTkxG2FoyhzoyDie4sx4uYBDKTctrElFfretzwxJZBK2dDM8iCnHAMRaJIKJFauHdi694CwAe0lI+ozwtDC9XwD9Z7bUodG9n2y1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bRolUEWtFELlIzqz3HtNuUcBVlu5Z2wy6UvfDsTOTmc=;
 b=gNE1Z8wc6PJQQcFgzafJ0DTjYZYRb3uONC547+W/Ba4GelhEWyfKwwB6M21Lu1Ne9ishgQyT9YfUCdrZCFEqysYEOLo9MtMj4XFnMFtbjkDTzWtxMcxJgTtjUg7QARY7fPw3INQ7tqAmAD7RjynwjBf1Kd5VH+vxf/L+/di7Vt9S8LCIjMov87rYWWT8RVgT5E80o6BsSlV4Wh+pSAQHJu0E/fxDs9IAxW81+PduUdE/daxf0+8aLVfmtl0U/55UnQZYR3CNxLHZzXtimx7ClgDQJrDQngMQ62rSscEQa7upZRNpzyR29UQTjTONOPV5zXIWt2fafXQlJTlC1WAaaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=becom-group.com; dmarc=pass action=none
 header.from=becom-group.com; dkim=pass header.d=becom-group.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=BECOMElectronics.onmicrosoft.com;
 s=selector2-BECOMElectronics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bRolUEWtFELlIzqz3HtNuUcBVlu5Z2wy6UvfDsTOTmc=;
 b=Ldm/zqJpPqtVhB4bkhNycbblQB7UGsAdHwLfyHrnEjy5EKdTkX8qVQS1fuxWqGeSxPVtaRlVlQwWHd3o6+JEuCn3KLXRNXhDCRJWcAIoUCbiAXYHMabg6RjybQj5mZ7bCav+9QuTFJ80bTlPB9tpadWMIvilQL+R/gqFKqlbOMQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=becom-group.com;
Received: from PAXPR01MB8613.eurprd01.prod.exchangelabs.com
 (2603:10a6:102:232::12) by AS5PR01MB12563.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:753::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Wed, 19 Nov
 2025 12:52:08 +0000
Received: from PAXPR01MB8613.eurprd01.prod.exchangelabs.com
 ([fe80::5ca2:88f2:e3ee:8eab]) by PAXPR01MB8613.eurprd01.prod.exchangelabs.com
 ([fe80::5ca2:88f2:e3ee:8eab%5]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 12:52:08 +0000
From: Thomas Marangoni <Thomas.Marangoni@becom-group.com>
To: linux-hwmon@vger.kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux@roeck-us.net,
	corbet@lwn.net,
	Jonathan.Cameron@huawei.com,
	michal.simek@amd.com,
	nuno.sa@analog.com,
	Frank.Li@nxp.com,
	wenswang@yeah.net,
	apokusinski01@gmail.com,
	dixitparmar19@gmail.com,
	vassilisamir@gmail.com,
	paweldembicki@gmail.com,
	heiko@sntech.de,
	neil.armstrong@linaro.org,
	kever.yang@rock-chips.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	mani@kernel.org,
	dev@kael-k.io,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Thomas Marangoni <Thomas.Marangoni@becom-group.com>
Subject: [PATCH v2 4/4] hwmon: documentation: add tids
Date: Wed, 19 Nov 2025 13:51:41 +0100
Message-ID: <20251119125145.2402620-5-Thomas.Marangoni@becom-group.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251119125145.2402620-1-Thomas.Marangoni@becom-group.com>
References: <20251119125145.2402620-1-Thomas.Marangoni@becom-group.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1P189CA0017.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:802:2a::30) To PAXPR01MB8613.eurprd01.prod.exchangelabs.com
 (2603:10a6:102:232::12)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR01MB8613:EE_|AS5PR01MB12563:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e6618c9-1743-49f9-8afb-08de276a7347
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?uOfWj04/apKNXD67N36ULReeOXSrIvg51KFgE1CkEzIKG3y/flJaWm0dFbBS?=
 =?us-ascii?Q?isBSQf+ZPYgefWXwST1TyTGz44WB8xsftHyFduIz3h745yKpczUlZpeVx6K/?=
 =?us-ascii?Q?B9BWYHYu4zTy4G6jPBdme3eTwtW2rtrANmRbT7UGSTm1DOT86po0igsHHEjO?=
 =?us-ascii?Q?nqcUbx6D4fF/ztQNXSgBegqKcneCVMRH2RKV5gJ3k8KrOaKLRjAJS9HMsAjT?=
 =?us-ascii?Q?xEy5wxukk+ApNPMglT/cWsDU54zcNapdHRe4I/5GtwFwPYsYF5nUrQddZdmP?=
 =?us-ascii?Q?R4sBFQOxjmFxaH9kED73hMwhWiFryi/K02v+z1aKGpKg8PleoCOMNpY9mFCS?=
 =?us-ascii?Q?r4m+RD4oSH3NhQXe9RdpXVpUgOcsxnDoV9u9fs05Mw7geavZCjX3xAHX2u4p?=
 =?us-ascii?Q?A+FO5MtnJh+QeSFrw0MnUHH8kyZ/s5VcTs82iwEjxCJx6i53BFRUZaa60Dou?=
 =?us-ascii?Q?2AP2eYdMRm9tcJVkLsbt9tCd96Jpul8XuZtuLI99hQbRQ9nhabFf+ZWlMTz4?=
 =?us-ascii?Q?JyPsbTXNvxIW8rncNo8sOK3zAojYNjkByjimnblH2387XYByv5jPMYuD2+Ap?=
 =?us-ascii?Q?Ym11fo5nyDgTVHhXzRJL0gBt1fBJ5inzSSUm25bMAL5TD9ilVm2Wvj+90vw/?=
 =?us-ascii?Q?NncYRptGkae0r/BNYsb3WOY58/mJIf1U7KamQu0R4HBtxnsvYP3CNlpV424t?=
 =?us-ascii?Q?1gFWeSXM4VvFjViNqD+TmkaIZMxFmwux5Q7qb7qoZYy8Fg6tq1Vbfgrm0M6l?=
 =?us-ascii?Q?s/Mnrt92Q2yKbqftOvvmHOV8A20oFVed7sWvrZUgOUfD0EI6iNJ3sN4GsK+I?=
 =?us-ascii?Q?aP74UI06mHdbFk5LJtqSm2JY9hESTRFzEO0svC2fuksmhF0UAnp64AID7Pmp?=
 =?us-ascii?Q?ZDvU5AhC2//XvsdW8LrUCXktnplAkYY+X2xmGubQ0kvkXPfSjHYgycm3N8dv?=
 =?us-ascii?Q?+J4C0bjTBXExarAAGVwjwZh0JrgB87QsSb9yQWVOnWrdRglkl+rZvT2n3qqy?=
 =?us-ascii?Q?7/wSdMfVh2dhyyMrLATZuSCSxmvP53Z49nCf+GQ5piGcoc11a7rv7sHh8sZC?=
 =?us-ascii?Q?a8p2rAys71XbU+N0g9gtNtdUB8aJOgnDgXxwiNjeV25EdA8SSPQAPb78aoz+?=
 =?us-ascii?Q?9QzWjL+aSWVC/2YBxmDhPVUkvxmo6qqH5HD39On8cZI/v0Yi75nWcPbexKMT?=
 =?us-ascii?Q?2w8IugRoq2t3YWCfI719fQrFKvyvyemGn9A32/wcj+Sc7mcoqgybEemuiC7V?=
 =?us-ascii?Q?dO+Jw7Hsf7DCG9DUwd35DxMp0SROWZD93UTGGkNzmZaVyX6alpjtfcVG+DdM?=
 =?us-ascii?Q?1djS+KoSl+CktT/m8mHFedrmCqB8KYs8FMzFDmDcSNmu4zrz0YuWJo5HCzvf?=
 =?us-ascii?Q?nS4PZXbkD44oBIugU9d50ZbciczXEvm8I+BQ13HYMW9L9tkoYmvA0DQ0hCXV?=
 =?us-ascii?Q?luyHE5uh64rZ3mwKiFb2X2GR1rmVjowJqxqn/v1UOsccS7zRs3PZCg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR01MB8613.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?n2BTUmtF0IuEBI4jskJh3YUyuHk8g061vjSMYZlYrBQXpcaNSeu2VxQBNpSa?=
 =?us-ascii?Q?lyAFWmB5N8oLGDLHYjHR40p8gZWIBWvJyeQkyQeNnA7yO7cP5crnf9dsFjzS?=
 =?us-ascii?Q?nnWpPy9psYqHUa7TsymprX58lYPFZPCTI4GpI5C+Coyjx8bi5gn51ReQCaEE?=
 =?us-ascii?Q?XpUoBk/7Wxchy0bz7jN+SgUoJe5tWtQ5R6yWCHTaPKhn+WS0tXNm0wVgG+2T?=
 =?us-ascii?Q?xYPr1dOyQVFOiHPRbCoUTRMwWRNQLR+kd7e++HVwkohOoA5gGdSl8QfUxLp1?=
 =?us-ascii?Q?qut5Ha8rtdu8f/BtxVAYJB5HxThpmYPS07bm4uca7NTa2bn33ukDAqhEp+6P?=
 =?us-ascii?Q?s3rZJRNQ8Trw+JEBvYkwK6YcRIS92hzBFSYjlky3ffwTa0PcDn+Vv45M+1NM?=
 =?us-ascii?Q?2J3OQHDnhMm/qrdR6l3EQXJnn3/nXE1UMwknxEsxczs5MPWCxrzkCy7FjcBw?=
 =?us-ascii?Q?hY7xS8MMAvO/iTE460rn5+ybJ7CU0nCTtAPAW1AlaYiarDjDobzV31mqp1V5?=
 =?us-ascii?Q?trmjGbVvU5A8huFKQUK3faevi605m56thyWFeC6ULSFV57NLX68GRFjbJll9?=
 =?us-ascii?Q?EJlq6O+oU9jOxGflZOsTZoEtGBcVEAVDafwSwPjua0wlmcaaQWbi7b+nbcgL?=
 =?us-ascii?Q?Wz3vOk4aqMZhPitrMs0crst+KfSndf7QeCzqjV0ool/buHPhcH6toGJn18Mm?=
 =?us-ascii?Q?+F4pLoDXZoO7EkXYHSgwl7NRhFqYtx7mb8PQQkXcvJ26LezWnXVSm/Mxlgq3?=
 =?us-ascii?Q?zCWknBb8faw9XDUwYfKXIE/HvNSJ0z02gMhnjTkEAKMD583bUqAd6hmFSEIo?=
 =?us-ascii?Q?/V68UGiN6cghQ6tqu24aG/fyYeCAu9yC5jujCeh8VzJR5SAjHexua0jPcS11?=
 =?us-ascii?Q?VlpFyYcSZrOyqO163x359tl4RFvSV8qh0zmAlo9QsOp3k7qTk81mhckQF8i4?=
 =?us-ascii?Q?Mqql4D5iX26L9SGLe1rNibDa+QQ+si7ycDTlWbxhAs6Im1OIVeEVg4G5PYbU?=
 =?us-ascii?Q?dmsR0CwdXOVLnRMB5MyFykDUE9mz3gKDrJvuPTO9LSk+dHiBwToW7UgD+Rgi?=
 =?us-ascii?Q?T84gJ06vjJHP3jMG0C1rlkYtClpMR/fONsv8O1FFP3p5+fYhXQDrnZeZsFtW?=
 =?us-ascii?Q?fMny2/pMlIoScSpBcpCz1JRV2a3sKeKM4Oot9KyDSUhhRTncdQd1hD+g9sjL?=
 =?us-ascii?Q?aVk8cxQdhx1r7wHjQ0qIaMQZSQ1OK7FuG4ZM9naPEnuxG6qXO/rbTvLTPwyp?=
 =?us-ascii?Q?Y3WfQ41DdKh3mlxnUs14npci0gHcp8xdqTQDirEJKOIM0lDXW5VwzrZwwYoE?=
 =?us-ascii?Q?yegayzphU4ZZBupVEQW3pdLcAgCsVBtgdmWIKig3kW/JJo7rhRppMH7M/jXK?=
 =?us-ascii?Q?/jw17nHhF7WrIJL5VFzBbCvEWe2+Rz9pB1tycfBnQoRePpNoQ1a0BI/lkpN2?=
 =?us-ascii?Q?3JEzuTd7FBpUnCRguSukTQJwxM3oepmAr+IFBEokD1Fs4HtiIZapn/EzbMwa?=
 =?us-ascii?Q?394rr5bP1/Ihwp3hTwq/lJwaCFSCluYPv//kL6sCXqSWTMru23uGR6MrYh78?=
 =?us-ascii?Q?bVWSc9MDHkPvYd+73Ss0gzz52xyE7CrRCJv4H2DpXmcCb4HsFSD/2B+SB4C6?=
 =?us-ascii?Q?Vg=3D=3D?=
X-OriginatorOrg: becom-group.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e6618c9-1743-49f9-8afb-08de276a7347
X-MS-Exchange-CrossTenant-AuthSource: PAXPR01MB8613.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 12:52:08.7961
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 738f6472-f50a-488c-ab88-c200fd976533
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4f5wzic734lmA8+T+P6k/M0G3kB9/Z+cSKNtBS0nUXxKdenTVUXkfWA04bHCmXreTmyAqX/icQPiwwZ5gFMyWhWpA+IytKiOgZnV8v+wG78=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR01MB12563

Add tids driver documentation

Signed-off-by: Thomas Marangoni <Thomas.Marangoni@becom-group.com>
---
 Documentation/hwmon/tids.rst | 61 ++++++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)
 create mode 100644 Documentation/hwmon/tids.rst

diff --git a/Documentation/hwmon/tids.rst b/Documentation/hwmon/tids.rst
new file mode 100644
index 000000000000..254c4a90e6f8
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
+                milliseconds. Writable. Supported values are
+                5, 10, 20 or 40.
+temp1_max       The temperature in millidegrees Celsius, that
+                is triggering the temp1_max_alarm. Writable.
+                The lowest supported value is -39680 and the
+                highest supported value is 122880. Values are
+                saved in steps of 640.
+temp1_min       The temperature in millidegrees Celsius, that
+                is triggering the temp1_min_alarm. Writable.
+                The lowest supported value is -39680 and the
+                highest supported value is 122880. Values are
+                saved in steps of 640.
+temp1_max_alarm The alarm will be triggered when the level
+                reaches the value specified in
+                temp1_max. It will reset automatically
+                once it has been read.
+temp1_min_alarm The alarm will be triggered when the level
+                reaches the value specified in
+                temp1_min. It will reset automatically
+                once it has been read.
+=============== ============================================
-- 
2.51.1

