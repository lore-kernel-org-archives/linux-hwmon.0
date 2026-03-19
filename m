Received: from FR6P281CU001.outbound.protection.outlook.com (mail-germanywestcentralazon11020089.outbound.protection.outlook.com [52.101.171.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C17F53B8BCA;
	Thu, 19 Mar 2026 10:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.171.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773916562; cv=fail; b=QTptctiZlRzpWqVuYdo2ba6ox9iHoN/r/6f3Gv3QEgZki4FdrBpeGj61ZOI9ytKFi5pk0lsiNBK7PzhkPeQTTCenEAHM+CmlU0hdu8XZdRphYMUPVW+/ogwqMS2zE8kt/4pEk0q61Ufff5o0Cn6fvj5+2+Kog3ECmF+J6dZi5ig=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773916562; c=relaxed/simple;
	bh=RZ+vNvqAd40KSBa2bgxy2SmDOHsZFPT5MRmvF7S/Q1U=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=vFILCscCf2Wdl6FZKJgYgKdRdl6RD8VWEyoSpru3mKM4SaAAnqnuuuVlNMe5tVZATQrwwIsXt2ItGg4g/oJeoRhWFMp7Ycf9ia9zXx4RoU5JOcqW4TIE7jGljwf4taCilcoMIKAt2Ibbvv7nU4BvxQJrzSWFOJg9w26NR+1nJxI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arctic.de; spf=pass smtp.mailfrom=arctic.de; dkim=pass (2048-bit key) header.d=Arctic.de header.i=@Arctic.de header.b=BxBoM9W7; arc=fail smtp.client-ip=52.101.171.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arctic.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arctic.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Arctic.de header.i=@Arctic.de header.b="BxBoM9W7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lDqDBpvHQDr+buA91F1/e+M6z9g+5mcm60CWWflqFo4q8mv9vKJiHqdBybdJfb4RNf4e5xlDgYKT6vfJs6MYq5MmvE/LhZ/rUEFgCSCCC5Qho0rYQqdwdF1p/XrsZ5YaSkiVz06foGpMbah5oyoOsdv5wIIZhsgcaT9h0jDFVQK0+l+MWWXAKDGKHUMEaaxK9OlxeQugCZEJiERnfDSwuaiGzxbsxxK+d78dX9OFIn/nKO9UtEsHoEnY24c3rv635KD9nuklCQX54uL0j0+A3JITzYWaV0m59CpzSfxrYmUKHB0dlq2MD0w735uk7wTxPcyQXjNrubFu4C+b2DS9OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Odui2S2cgNR5h1DMjCx8KJXWqehFBVO8ApQqQhICpsU=;
 b=hD8F2Rk2FEyJjDIbUWOTo787W0ZHgjjFX2Nu/Zc/cf5tQEnQJnilTfz2fputdY4tc2CsnosinPQLRdL3RF0wjhodbN61A6te9wUicg/BwWims2xcREfqFczKEIh0nhEyz1uw8Rn/r9024uvYiTBr2/tKjzvCoY8+Hr1HAKFMKhxlMSni42TJkdJraE/ECgL2F8A0lSxGG6gWFddx3aLbZqDjxoYTpo9ss35R8bT5fTEMD7LhV7FkpOw+ao6essPKcWNY77pePhIY4HIlG+GiRGRCuYz3uDT9IN5FQozRoY9QLtW/Txg3/MY02+LGpIctQc6wPMxJiq1Sk8KDYDCDKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arctic.de; dmarc=pass action=none header.from=arctic.de;
 dkim=pass header.d=arctic.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Arctic.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Odui2S2cgNR5h1DMjCx8KJXWqehFBVO8ApQqQhICpsU=;
 b=BxBoM9W7H3QpmT62Qfinrk5+g01RFYXPimmZcphklBETtn1sFSyQgHBREm65dQbrGq0Ik0wWcq9cZxNWab/MAS6YpL8pQetRJiyM1R00T9YivVllcQE7S8AVleM5sl15BFk2hbvWU11GeD/fxHYSaO9CLgdNjRj6UlRBoha/CSuKZmLpA9WcVi2n8ucFNpMdfibo07OFVLr4a8KMuws5mMckg+uvjX7mLX4aN6l/3s4kpN7bASedhaVgbwMVW+k+Yro4REkbOdXLGnaFnb3saUFwI2GIKPnLmZLyXvcudJ4v4oYQQJu4arCuv1P8MgOHpBzzzaRmVpMFyA6abTtCvQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arctic.de;
Received: from FR6P281MB5900.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1bf::9)
 by BE3P281MB5248.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10:d0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Thu, 19 Mar
 2026 10:35:54 +0000
Received: from FR6P281MB5900.DEUP281.PROD.OUTLOOK.COM
 ([fe80::7eba:ac95:a60d:521c]) by FR6P281MB5900.DEUP281.PROD.OUTLOOK.COM
 ([fe80::7eba:ac95:a60d:521c%5]) with mapi id 15.20.9723.018; Thu, 19 Mar 2026
 10:35:53 +0000
From: Aureo Serrano de Souza <aureo.serrano@arctic.de>
To: linux-hwmon@vger.kernel.org
Cc: linux@roeck-us.net,
	linux@weissschuh.net,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aureo Serrano de Souza <aureo.serrano@arctic.de>
Subject: [PATCH v3] hwmon: add driver for ARCTIC Fan Controller
Date: Thu, 19 Mar 2026 18:34:29 +0800
Message-ID: <20260319103509.243653-1-aureo.serrano@arctic.de>
X-Mailer: git-send-email 2.43.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TP0P295CA0006.TWNP295.PROD.OUTLOOK.COM (2603:1096:910:2::6)
 To FR6P281MB5900.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1bf::9)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: FR6P281MB5900:EE_|BE3P281MB5248:EE_
X-MS-Office365-Filtering-Correlation-Id: 0efda6ef-c0ed-41c2-35ca-08de85a34c3c
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014|55112099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	dDcJTXnOSuMhC4XV8MMx44VDdy6GFjFSYUp4ZURunVOtEDz8CGBS63sz4XBlmUwaBLFkz0s3NJUUBgGadWDeonelR1bWWOV/oDOQYckE/sZhogVrOMJYwq7izS0Mb9TMwiRwf5/UQ+4+qjRk67xFtOgk5LsQZ/5kaO1RSLc9NNqLFveT66JpmNUTBj8tiaSUEbeHV7TSaiP9uYSiG9ew+U4FmPR2ooN9Wfn2v0nIy3HdFRaeXmNtBY3w3q4CDL+UW3k1/Clk1uGW7+6LD42oqy+wAM/LfkIMZpOinlJuBW+mbvuTrt0DP+U3RlFB2cbyxc/1TdRWENyyvBdBMpTMf5AzC4De6qj2qjLLmdrUPk5rS7gqyk+4X4dAwQvnMH7qZGdgHhMikIqRQfTRfG2C4NAMWw29pDI5ZgqsTABd/NhXaGVP3UDf5c4npYQrJ3gcvtxmOmnVHITMP6MnfTsLnxa7TY8pDEINCCIUkeMY4Pxv2vWef2Hhv0CSzUoE6L9laACJ2JZgAoDBcvxkMXPJSgX/ZwbYz8GVXcQGXaj8M0qyP/3gppv+t/h0qBbjWZwEg52/ZLRsSLb3/cSWoQwTHlCcX5P7/jZtg4GobYZJOosrgvvAaq41roZql8K2fjrSE1FJaDOWPIzXQbg6Fn5HERCS3LcP9d6HSpd1hFaA1c6n5egkA9y3MzSQ+2ZNLMRnHA2s5Fw6wnhiP7NCUyLhXoIuNlPdS9L664x0ZEhuC6Dwv1NeTo70mZLlIwMUJ0rGv0cWVrLP5QxvwiyXPlDpWXo9WOiPW5g2mILiyUggDCQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FR6P281MB5900.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014)(55112099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bDlkS0MzQ01aWlROYjErQVJMZmFIcFpadHNsSytUb0RKMnBqSWo3RXJUWUNK?=
 =?utf-8?B?Q1JLc0IzOTI4RmZuUWRwMi9PeUh3dnViUm9qZlRVcWp4cjN3UlB4aXVlWEVK?=
 =?utf-8?B?T2oxSkc1VHMvMW9EL2NGbDlkVGc2SGtGNkw2d0lmNHhkTUdsZ21HRmF5SzJo?=
 =?utf-8?B?QVFFZXhINEtUY3dPdWNsT291dzJGNVNHNGcvU1VCakt4RFh2VlR1UFI1NTRP?=
 =?utf-8?B?cmpOaXdRekkzZUZ2YVNrd1pvTnE4Z3JMeVA5SC9pS1pJSTF3bjBNeUhBRmdp?=
 =?utf-8?B?RnVvNTRoY1NQOUZmN1A3WUpHMjJ0OFdVWjhBNE5uRlhZUE1DRUVUSGNXbjhO?=
 =?utf-8?B?WUhmS0RkSFpiVmZQK3RJTGQ5d3JNNW5hc1Vsb1UzYldTZ2h0WkVVMmE1cnhL?=
 =?utf-8?B?akkybEFJZXJBaWxIQ0ZFNlh6NVdvd3JXVTdWeXQrS0JNZ3p5c0p6d2Y4V01r?=
 =?utf-8?B?b0ZDZ1hWUTEvZ2lkMWVYcmh5dnk1YUN3Q0JVSjErZ3ZDUldUanZ2bXRnUWY5?=
 =?utf-8?B?UHNxK0JUSjlMbUxTc2czeWNKRDBiNzhidjRtWW9MMkdPay9INTN6Z0k3Rkx3?=
 =?utf-8?B?elFFemJ5d3pwamNZdHlwYTRKeUhNbTh1bk5CRDhaSXNqMzNOR0tFaGs1L0Fk?=
 =?utf-8?B?OWRGK05oRkNoamJHb2ppejFWUXVVM3RVbThiWFIxdk4xSnc1V3BKMGFGL24x?=
 =?utf-8?B?MkFDOFprQTlmbkhPUWZOQzRkc0NPdFJ2VHFtanZhM290V2hOYWo2dFErSXVU?=
 =?utf-8?B?bmp6Q2JSQVBxNUh2SWhFa0FQUEFvbnpaTXdZeWpxSW8vVVpNUEVJcG1OeTFh?=
 =?utf-8?B?WWVhempZWnZ1eEpLTEl5NWVsNmUyOEZzVEgvWEc1ZDhSVkYveFRGNjVLWWNu?=
 =?utf-8?B?N3ZFY24yWC9wLzFUdnlZeWlQMHI3MldpLzR3aDUxZWUvTWdiU1JtcU5KUy93?=
 =?utf-8?B?NTllMC9vMmNaRlA3TmZ4K0lzS0xzbUU3QVhJR1RleFpWM1g5d3VHa1RGZlpK?=
 =?utf-8?B?T1QzTVBWNVR5ZFI5YzJuRk9pMmN0bVExcXlpdk1uRzI2emovSzQ2UjQwUFhq?=
 =?utf-8?B?SEpRTENzUUp4WHgyS29FQkhoc01YcnF2MDBEaS9JWHZUMWRXWEQvdmdxT05B?=
 =?utf-8?B?SDF1YXU5UVNkVkV5WDkxNXR5YjBKU2pISngvelVUd0ZGa0NTcjU1MWVqV1VJ?=
 =?utf-8?B?ZU81Tk5QOHpJMGFUcmFNek9vOXA3NlVKYnNCd2Q4RlNhQ2VtTmt4WkJ4U3d4?=
 =?utf-8?B?OUs2WUlkLzN5TzNZVDJvaGxqS1gyQm1Sa1Bqei96RGlwbG9sU3pQdk5OdEVV?=
 =?utf-8?B?SjROaTdIS0tGc1ZWSjRTdHhGeklKWkNSR1BNcjNBSW9NRFRhVTluV0NJdGl4?=
 =?utf-8?B?dTBHZWFOaGlpaGxTTlpPUFk5dU9GV29ZVXA5OG9qUW9mb1lnRFkwRW15N3ZJ?=
 =?utf-8?B?cmFlQjc3Um00SGdkemlna2pabzRmbnBLbkgzQ1pnNE9ZZmdic1Nma216ejRT?=
 =?utf-8?B?VmZ2STFSVVFXSmpjQnArWlBJU1AwL01RSWYzZ3pJbzJ2bkdIM0tJeDVaTWk5?=
 =?utf-8?B?bWNMTldQZXJCeUdTZEtYWVkzbENlVjdSeDlCNWpkWUI2Y3JrR1c3cUxjcVdz?=
 =?utf-8?B?QUNUam5nVFZ6bE1hZDhOeDVrbDhudFVPVjFzTXd3Q1lWVmljVVQ1ajB4K0Zk?=
 =?utf-8?B?bHI4WWQ3SXdxaDNCY1o5VE5TZXIzRVZKSU1pL1ZlcmdjU2hOb1EyV2RRdlBC?=
 =?utf-8?B?bVR4bUtoNmRrc1dEbVVxKzhaa2IvMnhQYXl3U0xZSUR0Mmg0WVUzUm0zNTZv?=
 =?utf-8?B?NDZWRGZtTkNFREpZbG13ZFlvTkhZbzM3NEMxcEx2clZCckhub1FlT3ZQQytq?=
 =?utf-8?B?QkdoTnpMSGZRMHlvT1U2QVdmMUhaN1JzODR2bm5GSFQ1bmNTaXhmcjRwVCtv?=
 =?utf-8?B?TldXRkpBK25HZUZVTXlkZ09Zc1B2dmozbnU5Y2wyY2RHeDJSOHpKOFpsS29L?=
 =?utf-8?B?TlhSRUJJaGNPdnU2K3VXODM5ZG05MG9zUUNMdmp1YVhvdWpMc2xpVzRtYVF5?=
 =?utf-8?B?UEZmR3JkYjJja1kweGxQdkJUMldrMURrRkZTZHQ0dDJ0c0MxZUlVTldQNlVO?=
 =?utf-8?B?UDNGemJobmFVdUVDdDZYL3FiWTZ2OUtpcEhNNVBHVnlkelZIRVJEa005Q0lB?=
 =?utf-8?B?M0Q1YkdNa1ZheHBzUVQxZTkvMGxKWi9LalJoQnFLMkRYVjAzc0dnN2RDQU00?=
 =?utf-8?B?MkZDNkRIK2JmWmY1bDBLVkJuQXduQUhuTE1KYm9ZK0JDUXo1OGdVYVFPUStv?=
 =?utf-8?B?VklITjFRUXZDdnEremh1MklLQlRjNDVJN2dCZzZVU2p2M3AwSzgvQT09?=
X-OriginatorOrg: Arctic.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 0efda6ef-c0ed-41c2-35ca-08de85a34c3c
X-MS-Exchange-CrossTenant-AuthSource: FR6P281MB5900.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 10:35:53.9243
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 51cc2c5f-af21-4667-81ec-d88d36e264bb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8Z/tsKI/+cwMT/vL1LXBHH6qkQIMrA/fukSJNAs2hpi3ytV3blEtlBLgy9WzCg+mHWFKIM2VY6tA4djZm2+Hjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BE3P281MB5248

Add hwmon driver for the ARCTIC Fan Controller, a USB HID device
(VID 0x3904, PID 0xF001) with 10 fan channels. Exposes fan speed in
RPM (read-only) and PWM duty cycle (0-255, read/write) via sysfs.

The device pushes IN reports at ~1 Hz containing RPM readings. PWM is
set via OUT reports; the device applies the new duty cycle and sends
back a 2-byte ACK (Report ID 0x02). The driver waits up to 1 s for
the ACK using a completion. Measured device latency: max ~563 ms over
500 iterations. PWM control is manual-only: the device never changes
duty cycle autonomously.

raw_event() may run in hardirq context, so fan_rpm[] is protected by
a spinlock with irq-save. pwm_duty[] and the report buffer are
serialized by the hwmon core, which holds its lock for the duration of
the read/write callbacks.

Signed-off-by: Aureo Serrano de Souza <aureo.serrano@arctic.de>
---
Thanks to the reviewers for their feedback.

Changes since v2:
- buf[]: add __aligned(8) for DMA safety
- ARCTIC_ACK_TIMEOUT_MS: add comment noting observed max ~563 ms
- arctic_fan_parse_report(): replace hwmon_lock/hwmon_unlock with
  spin_lock_irqsave; hwmon_lock() may sleep and is unsafe when
  raw_event() runs in hardirq/softirq context
- arctic_fan_raw_event(): use spin_lock_irqsave for ACK path
- arctic_fan_write(): use spin_lock_irqsave for completion reinit
- arctic_fan_write(): clamp val to [0, 255] before u8 cast
- hardware teardown: register arctic_fan_hw_stop() via
  devm_add_action_or_reset() before hwmon; devm LIFO order ensures
  hwmon unregisters before hid_hw_close/stop; remove() is a no-op
- remove priv->hwmon_dev (no longer needed)

Changes since v1:
- Use hid_dbg() instead of module_param debug flag
- Move hid_device_id table adjacent to hid_driver struct
- Use get_unaligned_le16() for RPM parsing
- Remove impossible bounds/NULL checks; remove retry loop
- Add hid_is_usb() guard
- Do not update pwm_duty from IN reports (device is manual-only)
- Add completion/ACK mechanism for OUT report acknowledgement
- Add Documentation/hwmon/arctic_fan_controller.rst and MAINTAINERS

diff --git a/Documentation/hwmon/arctic_fan_controller.rst b/Documentation/hwmon/arctic_fan_controller.rst
new file mode 100644
index 0000000000..e417f54b62
--- /dev/null
+++ b/Documentation/hwmon/arctic_fan_controller.rst
@@ -0,0 +1,34 @@
+.. SPDX-License-Identifier: GPL-2.0-or-later
+
+Kernel driver arctic_fan_controller
+===================================
+
+Supported devices:
+
+* ARCTIC Fan Controller (USB HID, VID 0x3904, PID 0xF001)
+
+Author: Aureo Serrano de Souza <aureo.serrano@arctic.de>
+
+Description
+-----------
+
+This driver provides hwmon support for the ARCTIC Fan Controller, a USB Custom HID
+device with 10 fan channels. The device sends IN reports about once per second
+containing current PWM (bytes 1–10) and RPM (bytes 11–30). PWM is set via OUT reports
+(bytes 1–10, 0–100% per channel). Fan control is manual-only: the device does not
+change PWM autonomously, only when it receives an OUT report from the host.
+
+Usage notes
+-----------
+
+Since it is a USB device, hotplug is supported. The device is autodetected.
+
+Sysfs entries
+-------------
+
+================ ===============================================================
+fan[1-10]_input   Fan speed in RPM (read-only, from device IN reports).
+pwm[1-10]         PWM duty cycle. Sysfs uses 0–255 (0%–100%); the device uses
+                  0–100% internally. Read: current duty from IN report (scaled
+                  to 0–255). Write: set duty via OUT report (value 0–255).
+================ ===============================================================
diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index b2ca8513cf..c34713040e 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -42,6 +42,7 @@ Hardware Monitoring Kernel Drivers
    aht10
    amc6821
    aquacomputer_d5next
+   arctic_fan_controller
    asb100
    asc7621
    aspeed-g6-pwm-tach
diff --git a/MAINTAINERS b/MAINTAINERS
index 96ea84948d..ec3112bd41 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2053,6 +2053,13 @@ S:	Maintained
 F:	drivers/net/arcnet/
 F:	include/uapi/linux/if_arcnet.h

+ARCTIC FAN CONTROLLER DRIVER
+M:	Aureo Serrano de Souza <aureo.serrano@arctic.de>
+L:	linux-hwmon@vger.kernel.org
+S:	Maintained
+F:	Documentation/hwmon/arctic_fan_controller.rst
+F:	drivers/hwmon/arctic_fan_controller.c
+
 ARM AND ARM64 SoC SUB-ARCHITECTURES (COMMON PARTS)
 M:	Arnd Bergmann <arnd@arndb.de>
 M:	Krzysztof Kozlowski <krzk@kernel.org>
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 328867242c..6c90a8dd40 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -388,6 +388,18 @@ config SENSORS_APPLESMC
 	  Say Y here if you have an applicable laptop and want to experience
 	  the awesome power of applesmc.

+config SENSORS_ARCTIC_FAN_CONTROLLER
+	tristate "ARCTIC Fan Controller"
+	depends on USB_HID
+	help
+	  If you say yes here you get support for the ARCTIC Fan Controller,
+	  a USB HID device (VID 0x3904, PID 0xF001) with 10 fan channels.
+	  The driver exposes fan speed (RPM) and PWM control via the hwmon
+	  sysfs interface.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called arctic_fan_controller.
+
 config SENSORS_ARM_SCMI
 	tristate "ARM SCMI Sensors"
 	depends on ARM_SCMI_PROTOCOL
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index 5833c807c6..ef831c3375 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -49,6 +49,7 @@ obj-$(CONFIG_SENSORS_ADT7475)	+= adt7475.o
 obj-$(CONFIG_SENSORS_AHT10)	+= aht10.o
 obj-$(CONFIG_SENSORS_APPLESMC)	+= applesmc.o
 obj-$(CONFIG_SENSORS_AQUACOMPUTER_D5NEXT) += aquacomputer_d5next.o
+obj-$(CONFIG_SENSORS_ARCTIC_FAN_CONTROLLER)	+= arctic_fan_controller.o
 obj-$(CONFIG_SENSORS_ARM_SCMI)	+= scmi-hwmon.o
 obj-$(CONFIG_SENSORS_ARM_SCPI)	+= scpi-hwmon.o
 obj-$(CONFIG_SENSORS_AS370)	+= as370-hwmon.o
diff --git a/drivers/hwmon/arctic_fan_controller.c b/drivers/hwmon/arctic_fan_controller.c
new file mode 100644
index 0000000000..d71b323e0b
--- /dev/null
+++ b/drivers/hwmon/arctic_fan_controller.c
@@ -0,0 +1,288 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Linux hwmon driver for ARCTIC Fan Controller
+ *
+ * USB Custom HID device with 10 fan channels.
+ * Exposes fan RPM (input) and PWM (0-255) via hwmon. Device pushes IN reports
+ * at ~1 Hz; no GET_REPORT. OUT reports set PWM duty (bytes 1-10, 0-100%).
+ * PWM is manual-only: the device does not change duty autonomously, only
+ * when it receives an OUT report from the host.
+ */
+
+#include <linux/completion.h>
+#include <linux/err.h>
+#include <linux/hid.h>
+#include <linux/hwmon.h>
+#include <linux/jiffies.h>
+#include <linux/minmax.h>
+#include <linux/module.h>
+#include <linux/spinlock.h>
+#include <linux/unaligned.h>
+
+#define ARCTIC_VID			0x3904
+#define ARCTIC_PID			0xF001
+#define ARCTIC_NUM_FANS			10
+#define ARCTIC_OUTPUT_REPORT_ID		0x01
+#define ARCTIC_REPORT_LEN		32
+#define ARCTIC_RPM_OFFSET		11	/* bytes 11-30: 10 x uint16 LE */
+/* ACK report: device sends Report ID 0x02, 2 bytes (ID + status) after applying OUT report */
+#define ARCTIC_ACK_REPORT_ID		0x02
+#define ARCTIC_ACK_REPORT_LEN		2
+/*
+ * Time to wait for ACK report after send.
+ * Measured over 500 iterations: max ~563 ms. Keep 1 s as margin.
+ */
+#define ARCTIC_ACK_TIMEOUT_MS		1000
+
+struct arctic_fan_data {
+	struct hid_device *hdev;
+	spinlock_t in_report_lock;	/* protects fan_rpm[], ack_status, in_report_received */
+	struct completion in_report_received; /* ACK (ID 0x02) received in raw_event */
+	int ack_status;			/* 0 = OK, negative errno on device error */
+	u32 fan_rpm[ARCTIC_NUM_FANS];
+	u8 pwm_duty[ARCTIC_NUM_FANS];	/* 0-255 matching sysfs range; converted to 0-100 on send */
+	/* OUT report buffer; DMA-safe alignment; hwmon core serializes write callbacks */
+	u8 buf[ARCTIC_REPORT_LEN] __aligned(8);
+};
+
+/*
+ * Parse RPM values from the periodic status report (10 x uint16 LE at rpm_off).
+ * pwm_duty is not updated from the report: the device is manual-only, so the
+ * host cache is the authoritative source for PWM.
+ * Called from raw_event which may run in IRQ context; must not sleep.
+ */
+static void arctic_fan_parse_report(struct arctic_fan_data *priv, u8 *buf,
+				    int len, int rpm_off)
+{
+	unsigned long flags;
+	int i;
+
+	if (len < rpm_off + 20)
+		return;
+
+	spin_lock_irqsave(&priv->in_report_lock, flags);
+	for (i = 0; i < ARCTIC_NUM_FANS; i++)
+		priv->fan_rpm[i] = get_unaligned_le16(&buf[rpm_off + i * 2]);
+	spin_unlock_irqrestore(&priv->in_report_lock, flags);
+}
+
+/*
+ * raw_event: IN reports.
+ *
+ * Status report: Report ID 0x01, 32 bytes:
+ *   byte 0 = report ID, bytes 1-10 = PWM 0-100%, bytes 11-30 = 10 x RPM uint16 LE.
+ *   Device pushes these at ~1 Hz; no GET_REPORT.
+ *
+ * ACK report: Report ID 0x02, 2 bytes:
+ *   byte 0 = 0x02, byte 1 = status (0x00 = OK, 0x01 = ERROR).
+ *   Sent once after accepting and applying an OUT report (ID 0x01).
+ */
+static int arctic_fan_raw_event(struct hid_device *hdev,
+				struct hid_report *report, u8 *data, int size)
+{
+	struct arctic_fan_data *priv = hid_get_drvdata(hdev);
+	unsigned long flags;
+
+	hid_dbg(hdev, "arctic_fan: raw_event id=%u size=%d\n", report->id, size);
+
+	if (report->id == ARCTIC_ACK_REPORT_ID && size == ARCTIC_ACK_REPORT_LEN) {
+		spin_lock_irqsave(&priv->in_report_lock, flags);
+		priv->ack_status = data[1] == 0x00 ? 0 : -EIO;
+		complete(&priv->in_report_received);
+		spin_unlock_irqrestore(&priv->in_report_lock, flags);
+		return 0;
+	}
+
+	if (report->id != ARCTIC_OUTPUT_REPORT_ID || size != ARCTIC_REPORT_LEN) {
+		hid_dbg(hdev, "arctic_fan: raw_event id=%u size=%d ignored\n",
+			report->id, size);
+		return 0;
+	}
+
+	arctic_fan_parse_report(priv, data, size, ARCTIC_RPM_OFFSET);
+	return 0;
+}
+
+static umode_t arctic_fan_is_visible(const void *data,
+				     enum hwmon_sensor_types type,
+				     u32 attr, int channel)
+{
+	if (type == hwmon_fan && attr == hwmon_fan_input)
+		return 0444;
+	if (type == hwmon_pwm && attr == hwmon_pwm_input)
+		return 0644;
+	return 0;
+}
+
+static int arctic_fan_read(struct device *dev, enum hwmon_sensor_types type,
+			   u32 attr, int channel, long *val)
+{
+	struct arctic_fan_data *priv = dev_get_drvdata(dev);
+	unsigned long flags;
+
+	if (type == hwmon_fan && attr == hwmon_fan_input) {
+		spin_lock_irqsave(&priv->in_report_lock, flags);
+		*val = priv->fan_rpm[channel];
+		spin_unlock_irqrestore(&priv->in_report_lock, flags);
+		return 0;
+	}
+	if (type == hwmon_pwm && attr == hwmon_pwm_input) {
+		/* pwm_duty is modified only in write(), which the hwmon core serializes */
+		*val = priv->pwm_duty[channel];
+		return 0;
+	}
+	return -EINVAL;
+}
+
+static int arctic_fan_write(struct device *dev, enum hwmon_sensor_types type,
+			    u32 attr, int channel, long val)
+{
+	struct arctic_fan_data *priv = dev_get_drvdata(dev);
+	unsigned long flags;
+	long t;
+	int i, ret;
+
+	/*
+	 * The hwmon core holds its lock for the duration of this callback,
+	 * serializing concurrent writes. priv->buf is heap-allocated (embedded
+	 * in the devm_kzalloc'd struct), satisfying usb_hcd_map_urb_for_dma().
+	 */
+	priv->pwm_duty[channel] = (u8)clamp_val(val, 0, 255);
+	priv->buf[0] = ARCTIC_OUTPUT_REPORT_ID;
+	for (i = 0; i < ARCTIC_NUM_FANS; i++)
+		priv->buf[1 + i] = DIV_ROUND_CLOSEST(
+			(unsigned int)priv->pwm_duty[i] * 100, 255);
+
+	/*
+	 * Serialized by the hwmon core: only one arctic_fan_write() runs at a
+	 * time, so reinit_completion() and wait_for_completion_*() below are
+	 * not racy against another concurrent write.
+	 * Use irqsave to match the IRQ context in which raw_event may run.
+	 */
+	spin_lock_irqsave(&priv->in_report_lock, flags);
+	priv->ack_status = -ETIMEDOUT;
+	reinit_completion(&priv->in_report_received);
+	spin_unlock_irqrestore(&priv->in_report_lock, flags);
+
+	ret = hid_hw_output_report(priv->hdev, priv->buf, ARCTIC_REPORT_LEN);
+	if (ret < 0)
+		return ret;
+
+	t = wait_for_completion_interruptible_timeout(&priv->in_report_received,
+						      msecs_to_jiffies(ARCTIC_ACK_TIMEOUT_MS));
+	if (t < 0)
+		return t; /* interrupted by signal */
+	if (!t)
+		return -ETIMEDOUT;
+	return priv->ack_status; /* 0=OK, -EIO=device error */
+}
+
+static const struct hwmon_ops arctic_fan_ops = {
+	.is_visible = arctic_fan_is_visible,
+	.read = arctic_fan_read,
+	.write = arctic_fan_write,
+};
+
+static const struct hwmon_channel_info *arctic_fan_info[] = {
+	HWMON_CHANNEL_INFO(fan,
+			   HWMON_F_INPUT, HWMON_F_INPUT, HWMON_F_INPUT,
+			   HWMON_F_INPUT, HWMON_F_INPUT, HWMON_F_INPUT,
+			   HWMON_F_INPUT, HWMON_F_INPUT, HWMON_F_INPUT,
+			   HWMON_F_INPUT),
+	HWMON_CHANNEL_INFO(pwm,
+			   HWMON_PWM_INPUT, HWMON_PWM_INPUT, HWMON_PWM_INPUT,
+			   HWMON_PWM_INPUT, HWMON_PWM_INPUT, HWMON_PWM_INPUT,
+			   HWMON_PWM_INPUT, HWMON_PWM_INPUT, HWMON_PWM_INPUT,
+			   HWMON_PWM_INPUT),
+	NULL
+};
+
+static const struct hwmon_chip_info arctic_fan_chip_info = {
+	.ops = &arctic_fan_ops,
+	.info = arctic_fan_info,
+};
+
+static void arctic_fan_hw_stop(void *data)
+{
+	struct hid_device *hdev = data;
+
+	hid_hw_close(hdev);
+	hid_hw_stop(hdev);
+}
+
+static int arctic_fan_probe(struct hid_device *hdev,
+			    const struct hid_device_id *id)
+{
+	struct arctic_fan_data *priv;
+	struct device *hwmon_dev;
+	int ret;
+
+	if (!hid_is_usb(hdev))
+		return -ENODEV;
+
+	ret = hid_parse(hdev);
+	if (ret)
+		return ret;
+
+	priv = devm_kzalloc(&hdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->hdev = hdev;
+	spin_lock_init(&priv->in_report_lock);
+	init_completion(&priv->in_report_received);
+	hid_set_drvdata(hdev, priv);
+
+	ret = hid_hw_start(hdev, HID_CONNECT_DRIVER);
+	if (ret)
+		return ret;
+
+	ret = hid_hw_open(hdev);
+	if (ret) {
+		hid_hw_stop(hdev);
+		return ret;
+	}
+
+	/*
+	 * Register hardware teardown before hwmon so that devm cleanup runs in
+	 * LIFO order: hwmon unregistered first, then hid_hw_close/stop. This
+	 * ensures no userspace sysfs write can reach an already stopped device.
+	 */
+	ret = devm_add_action_or_reset(&hdev->dev, arctic_fan_hw_stop, hdev);
+	if (ret)
+		return ret;
+
+	hwmon_dev = devm_hwmon_device_register_with_info(&hdev->dev, "arctic_fan",
+							 priv, &arctic_fan_chip_info,
+							 NULL);
+	if (IS_ERR(hwmon_dev))
+		return PTR_ERR(hwmon_dev);
+
+	hid_device_io_start(hdev);
+	return 0;
+}
+
+static void arctic_fan_remove(struct hid_device *hdev)
+{
+	/* devm cleanup (LIFO) handles hid_hw_close/stop after hwmon unregistration */
+}
+
+static const struct hid_device_id arctic_fan_id_table[] = {
+	{ HID_USB_DEVICE(ARCTIC_VID, ARCTIC_PID) },
+	{ }
+};
+MODULE_DEVICE_TABLE(hid, arctic_fan_id_table);
+
+static struct hid_driver arctic_fan_driver = {
+	.name = "arctic_fan",
+	.id_table = arctic_fan_id_table,
+	.probe = arctic_fan_probe,
+	.remove = arctic_fan_remove,
+	.raw_event = arctic_fan_raw_event,
+};
+
+module_hid_driver(arctic_fan_driver);
+
+MODULE_AUTHOR("Aureo Serrano de Souza <aureo.serrano@arctic.de>");
+MODULE_DESCRIPTION("HID hwmon driver for ARCTIC Fan Controller");
+MODULE_LICENSE("GPL");
