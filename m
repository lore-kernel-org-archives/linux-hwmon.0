Received: from FR5P281CU006.outbound.protection.outlook.com (mail-germanywestcentralazon11022079.outbound.protection.outlook.com [40.107.149.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2786F36EAB7;
	Fri, 20 Mar 2026 08:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.149.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773994215; cv=fail; b=JOjkbZRW+n/0BndnTGVpR0lAOoJrBnsPLnw8yNFA64VB9u7T6IxHxY+IpHwBNwzJ0jd8gm6YDZk7HyrJUlW70WO1nK/g/GQ5qARzFzJmW2WwNKjn336+h6mwuU7cAp3WK6Brk+Z2kcBSmkfmNRXrFNto12mD19z7P61DS68kSmY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773994215; c=relaxed/simple;
	bh=0ViqLVH291F9X4kYTh5kYocimwQvgfHtYAQDJyjD63c=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Zq/Hn3R+DtnLhBRvkm6FJYDuh8ZigkQt4mXO4OMuZcvVDcjaqLF6gmdxN8N3BCc9F+lQIlXXetImKjUafaOrhjEbM59WCX9NV3/6gY0JIwv1dhUgnWKfEiwz3F94aXRGSKdVw/LLoY8Tgi0XQq2drKcmZGTtfwYVUkXThemnWQE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arctic.de; spf=pass smtp.mailfrom=arctic.de; dkim=pass (2048-bit key) header.d=Arctic.de header.i=@Arctic.de header.b=f2nj5eYX; arc=fail smtp.client-ip=40.107.149.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arctic.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arctic.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Arctic.de header.i=@Arctic.de header.b="f2nj5eYX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZAg98W7cZwx2vGJXcXFNIpiPXIPkM3TrTeP3XYkQNAsOeoMRQh2rfGhfBUdDep2InGjQjLsDBkSh6ELmBbc2EAydykpid2YIlHfz0bJ5Ph7O97Ds6tbSnzTG4nGVr+9q5ubaIwMzvbsKOPZIdMHEH5hYmKW03YdLto/VEEc/FZgzeyC6TCuTsS60p6FlM8acu5v+uqPptOc63zC5wiFxXLTs/FSFg4jR8yiBlBx6Vt3XsxLSy0oJ0HAcOCzq36Gdmb9qWIsH3YlJyoouYFewt96yacsvEvCm/KXlEsqjbLGyr+nItVS4CpqEPVzTpHvzVPKBlpi+ptHvaA3BNcC2vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0zWtBUSm5e7I9A/LWX37+NKXs9HHxRxBa9yqiA8yLOc=;
 b=HMtXFYh96BmldbJC6aVEQM9fdxf/LLBpdPEQOvyeDQZ4wrod4zL8WVlRtFi+90AbMNvVPio5TdYzqdi9TLg2RFgvzysvfUwZUwU+mTareqT+xLSCE+oH4tEpe6lCYLvmQI0e1awvuHbz7njsmLwiNUI2Kyh+wQZdjqhOftiMTTmgq748WvfGWje7Jy446RSRX4ssuTk+XvG5xGTyY0sou0XGIT74qh+/2Fn85EyBghKhsHDws55wUlU1MJBnlF3YWf0YVqgAkwd+cKr5mDgc1pNmhB6BL2mV32t2IKn3V5Gb3fjT6GL+Yn0rRCyiTDcHdhX65Vdd/XNBtkAnVLPJNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arctic.de; dmarc=pass action=none header.from=arctic.de;
 dkim=pass header.d=arctic.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Arctic.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0zWtBUSm5e7I9A/LWX37+NKXs9HHxRxBa9yqiA8yLOc=;
 b=f2nj5eYXKAezkCXnSAI9UoluhFWeAcPDj9t04f6smixGl7Od4omM2AJsLzVajwZhDw/p34EkYmb/pnDN3nzysKZQYj54xmiGCmVNTg8n5Wu8E11Ltm0Qza/Djuvj0/qDc7lHg5WwujNCWnGLC1x0//4qG3RRRoPAtKQcCwtoVIl5VsEoy0agQ4HGZPZPQJzRWXf2+PVpE0Vg4H1LF+YztCDKgulWL+rI7FLXjiHcr9r93h8SoPmFqRgc6uX6UaCOf3og4SWTRELj1YaVxVKCiPuTFgNhto7hDXJrSWjeODMDTjOvVdpJDitu4gbBzy+JcAgRBpaqbsgXCGYUWagJBg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arctic.de;
Received: from FRVP281MB5895.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1c3::20)
 by BE1P281MB3156.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10:68::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.23; Fri, 20 Mar
 2026 08:10:07 +0000
Received: from FRVP281MB5895.DEUP281.PROD.OUTLOOK.COM
 ([fe80::c6a2:6e8f:ea:cc0d]) by FRVP281MB5895.DEUP281.PROD.OUTLOOK.COM
 ([fe80::c6a2:6e8f:ea:cc0d%5]) with mapi id 15.20.9723.022; Fri, 20 Mar 2026
 08:10:07 +0000
From: Aureo Serrano de Souza <aureo.serrano@arctic.de>
To: linux-hwmon@vger.kernel.org
Cc: linux@roeck-us.net,
	linux@weissschuh.net,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aureo Serrano de Souza <aureo.serrano@arctic.de>
Subject: [PATCH v4] hwmon: add driver for ARCTIC Fan Controller
Date: Fri, 20 Mar 2026 16:08:39 +0800
Message-ID: <20260320080840.333968-1-aureo.serrano@arctic.de>
X-Mailer: git-send-email 2.43.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TYCP301CA0076.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7b::10) To FRVP281MB5895.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c3::20)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: FRVP281MB5895:EE_|BE1P281MB3156:EE_
X-MS-Office365-Filtering-Correlation-Id: 23de776f-9e8c-41a9-7409-08de86581975
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|55112099003|38350700014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	nvUxCl+d9vWYCAaapS/u6Rp3cslDldChTV5LzbiFF/nKTzTsWHXUtsY4rx1N5xKAf4swjg/OtktPeX25eD3g1OWVsxR4rJvQrG0fdCMwcQkh2rAq49KemJyRibnmMGe57FYid/G4MmvfT76lC6r4RKkgCS7tuNOJ4H4Ezt+twdKEDyBuBHcyUN7wIw5DMUCIoeDCkc3aYAWkZqeR5E1d+BIjxbM5hz5X3fKyRYIO7vfCffcc+nr9n9+2vC4xs0vAeqMVJqJcA6UMBHohbq2PeBrWJYMdKtmcQE1sqlcSR/gHubvFpbaizpRMiuJ63VKIsbaKDgJaYc7JB6+QrG1Lwnlr6Gz8gEdk6IhlKaDh3rXoil5MBQSOu48IF7Lmhsffox6jMc/7zxe8JM6C8zfmyfvw865537BxE+0QzEPua6ObhGf0+hwzvd4hytebbiFnpFuBaSVJYyAnEGcuTF63lJlv4SG3E7vBLt9pOmjtOoGUm9lXVRzzs+CKsmmVrpf+Koy2VqF1Be+luLw/hDzfCmoLhIKopNCoFWavpALvzYB7zxc15gGBl7VEOpBLMSZuKh4axSXVoD915U+yJQZBN0l2enT7GDLj8Y6R2KI/v9ueae5vObNMfGXsWmz7QQn6apYt+kEFSOl+sTWP6YXFFpUPk1RHthZRrEnDkNJOCT3WtJOoOHffGxHPe+yqXeKwPnXdIbQQUSBbUf5V5RqZgLLo5P+ytNHk/5VBPz1Ey941TS+WzZn7Uel61d7y4e9DJOiEoFqOXcbCXCbYad8/PNfNClKF69e1OxVqYn1DY3U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FRVP281MB5895.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(55112099003)(38350700014)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QXFsWHFtTkh3QTF2VkVZTGNoL0ovSWlhRVNFQjM0Z1FaVGVOVzFXT2V6TUxs?=
 =?utf-8?B?TjJiMXRhTHhLSE53MGRQck5PZ1pNWkxJY1lhWmJNYWNvajFtRmxtNzBlaHh2?=
 =?utf-8?B?UFNJcmRGa0ZtRE83eGp0eUVKNUhOc0d2cWx1b2hEb1FyRXJWaHFLdUhCTnBo?=
 =?utf-8?B?MHlVMEtXZ3FQY1JSOVJHS1VScWZHVmRnSFZBekRBU2c1cFVIQVpoblA2cTMy?=
 =?utf-8?B?QjRjQ3RXU0pxYnhWUE9oaHYwQWVOVHNuclZyNEhSdzFzY3ZRbjhIRG0rYUcy?=
 =?utf-8?B?eHRNYytBK1g4TXBzT0JFMmVQalpQNFoyR0IxazMzRXFqRXJhVmsyOUxwQVVF?=
 =?utf-8?B?Z2ZHUlNTckJoYnh1Yk1weFVpKzd5TWdVZ1ZJZ0hNdDdrbFRJNkY4K1dlVkdD?=
 =?utf-8?B?K09ZdldGZlJxdW1XRzFVVXB6WjRvdVBHbWhkMlduMFM0cjFaNlVjanpWUEpH?=
 =?utf-8?B?cHFydkZYTDBEQ0d1UDBiejVMWFRWeVFkb0piYzNTbmh4aXNtUXJxV2c1Z1dW?=
 =?utf-8?B?M3ZmcTdxRURGODhIWmZlcmQwZUZyT291a21PTmFJelBKWEVrRi9XbTN4OEJL?=
 =?utf-8?B?UmtDMWRLR25GNGJBVjFtWFdsN0VpdWdLZnFTM0hQZXJ4TzNkcXF1M0h1Skxa?=
 =?utf-8?B?Vjh0NTVnQi9xNFpENVdFSlNweEErKzhlWVlrQjVlWTRFNmk1SkRUaElCbzQv?=
 =?utf-8?B?cFhkWHowdVErTTNlekFsOUtlUDlCZ0d0a08zR2N2MFJsK1pCaE80d0NhbjRt?=
 =?utf-8?B?cUp1dEluSzBSWEN1Z2dsV1JyNzVabi9vNklXM2d1UHFkT2dFdVJpdTdCUHgy?=
 =?utf-8?B?c1Y4NEpEbUtuVG5ycHBwd1JHQ2JTK2wyM084a1lXZ25UQVVGVEhzRGpyYlJi?=
 =?utf-8?B?Q29LSXBZZ3FoSytydVltMzBzRG5DOWhCdzV4VlJEUVlETXJVUmwrOWdHVGRK?=
 =?utf-8?B?SjFIUFBuZWxNV3gyL1dCYzU3alZaeDBiVGs1UTMwV0FpQkFMTndZVllqalBJ?=
 =?utf-8?B?MEZ4UUhaQzQ4SlFjbEVPeUx0YzNHeUxtZ2o1NndaMVlEbEROLzB6VVd0MmhM?=
 =?utf-8?B?eVRodVZ0c1V4bERHL0w4cUkxTmVpYkpYS0lQT2NrSHdIdlRzNGJ5U0tPMlRm?=
 =?utf-8?B?Y1Y3c1FxM3NMbFUvbllaVnc3akYraHVtSytZTmxBQUd2OW5UYlM1d3RzaThr?=
 =?utf-8?B?UWpIWGJGUTNFeDlZY012UEt2eEhxWm5OUmZyV1FDcm9ZTEZhNjFGeFVIZFdJ?=
 =?utf-8?B?WVB1WG5OcW91T1RHQlpkbW9jRU41MythZStxQWxZNmtmby94U3YxazFkVVl1?=
 =?utf-8?B?SWZDRVhvV0JOdHMrbWFwNlRmK0RQMG8zdGRZZzRuVFp4MTJ2dkNSY1BvTU03?=
 =?utf-8?B?Wk53TUxQbWhrUHlIZHZFTmZhcWRBLzAvbkdScSs5R05oK0tucEQzek5Rdndt?=
 =?utf-8?B?M2lSM1ZuWkdlN2x1Z0ZaRFFJQloyd0Z5cDFRZjdCNzdBenR3N3BicWRXQ25j?=
 =?utf-8?B?V2I5SW9mekJUV2RSSmUrWXFPaUR0ODh6alR5VmxpR3huTUFvcmtEa0d5VkJO?=
 =?utf-8?B?eU9JMlVjNzA2MjdoZ3dSZm9aOEl4dXIzSWRwSkp4OCtMS1V2eEM2ZUNvQnVR?=
 =?utf-8?B?MmpSUTBtNldNakYwb21NUE9zcUlhVEFEYVByeDQ0Mk9NSXhPYTQva25DWUFl?=
 =?utf-8?B?bWRhNW11M3Ntak5oQ0NBd24vNjk5VFdRbXJqdnRvY1BweUhzSEdTOEZweHcv?=
 =?utf-8?B?b3pieTVPZjgwbGJrYUlDM2FrWlZablZIQ3krNUowS3RuNFFRdjBLTEdZaUM5?=
 =?utf-8?B?cFc2ZGxYbEFYUWswM1V0Q25yOExrYU9JMS8xajdkZWp6SjgySE1xampsRi9x?=
 =?utf-8?B?ZnFGc2RCTnFVUWN5azhrQ2dEaTg1bUNlWkZxSHQ5S0x5cVMxNUpWdjBUeDhn?=
 =?utf-8?B?WUhzVHMwMFllYldFc3MvcldLYTJzOVluVHVaTXdTOE1IeWRONHAreE5Ub0pP?=
 =?utf-8?B?dzF5enptYUJVeFBuMDllM0tjMk1LbVJDREduRnJlNUpBbmNSLytnaDU4N3My?=
 =?utf-8?B?b3VKbG1qUU0vWGpqMWtnQjNveFAxNkJJb240bnNwVnV3VENRTDNlR0tNYU5p?=
 =?utf-8?B?QkJuQ2NlQXRlTzhzMXE4Tk9kb0RqRUx5U3JMNGhSdFROWGZQbXlwaW80NlI0?=
 =?utf-8?B?RFFlOWppREJkOXgvUFQwRDVDdXp0R084ajhGV2hRUCtwbXhSbWVSVEdvb1Fh?=
 =?utf-8?B?bU1DMlZEUU1XV09DZGtPQ0o4Z21BTjgrUFVIMlhEQVpad2tFMHNKRkhJY2VO?=
 =?utf-8?B?Vi9YWXZqbFNFbVdac2Y1cnY3TC9IVURzOEpxeFd0bU9Ba3pDV0Judz09?=
X-OriginatorOrg: Arctic.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 23de776f-9e8c-41a9-7409-08de86581975
X-MS-Exchange-CrossTenant-AuthSource: FRVP281MB5895.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2026 08:10:07.7615
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 51cc2c5f-af21-4667-81ec-d88d36e264bb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F6F4MuqriPhzpPn9FMiENSKlwou2BPfBDInQeNiFYnADifKaK0/vqqavG+O7TNWyFV4UuirHUjhzPL+/giVUGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BE1P281MB3156

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
Thanks to Guenter Roeck and Thomas Weißschuh for the reviews.

Changes since v3:
- buf[]: upgrade from __aligned(8) to ____cacheline_aligned so the
  DMA buffer occupies its own cache line, preventing false sharing with
  adjacent fan_rpm[]/pwm_duty[] fields on non-coherent architectures
- arctic_fan_write(): add write_pending flag (protected by
  in_report_lock) so raw_event() delivers ACKs only while a write is
  in flight; prevents a late ACK from a signal-interrupted write from
  satisfying a subsequent write's completion wait
- arctic_fan_write(): commit pwm_duty[channel] only after the device
  ACKs the command; a failed or timed-out write no longer leaves a
  stale value in the cached duty state
- arctic_fan_probe(): start IO (hid_device_io_start) before registering
  with hwmon; previously a sysfs write arriving between hwmon
  registration and io_start could send an OUT report whose ACK would be
  discarded by the HID core, causing a spurious timeout
- Documentation/hwmon/arctic_fan_controller.rst: document that cached
  PWM values start at 0 (hardware state unknown at probe) and that each
  OUT report carries all 10 channel values

Changes since v2:
- buf[]: add __aligned(8) for DMA safety
- ARCTIC_ACK_TIMEOUT_MS: restore 1000 ms; note observed max ~563 ms
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
index 0000000000..834f09c813
--- /dev/null
+++ b/Documentation/hwmon/arctic_fan_controller.rst
@@ -0,0 +1,49 @@
+.. SPDX-License-Identifier: GPL-2.0-or-later
+
+Kernel driver arctic_fan_controller
+=====================================
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
+This driver provides hwmon support for the ARCTIC Fan Controller, a USB
+Custom HID device with 10 fan channels. The device sends IN reports about
+once per second containing current RPM values (bytes 11-30, 10 x uint16 LE).
+Fan speed control is manual-only: the device does not change PWM
+autonomously; it only applies a new duty cycle when it receives an OUT
+report from the host.
+
+After the device applies an OUT report, it sends back a 2-byte ACK IN
+report (Report ID 0x02, byte 1 = 0x00 on success) confirming the command
+was applied.
+
+Usage notes
+-----------
+
+Since it is a USB device, hotplug is supported. The device is autodetected.
+
+The device does not support GET_REPORT, so the driver cannot read back the
+current hardware PWM state at probe time. The cached PWM values (readable
+via pwm[1-10]) start at 0 and reflect only values that have been
+successfully written. Because each OUT report carries all 10 channel values,
+writing a single channel also sends the cached values for all other channels.
+Users should set all channels to the desired values before relying on the
+cached state.
+
+Sysfs entries
+-------------
+
+================ ==============================================================
+fan[1-10]_input  Fan speed in RPM (read-only). Updated from IN reports at ~1 Hz.
+pwm[1-10]        PWM duty cycle (0-255). Write: sends an OUT report setting the
+                 duty cycle (scaled from 0-255 to 0-100% for the device);
+                 the cached value is updated only after the device ACKs the
+                 command. Read: returns the last successfully written value;
+                 initialized to 0 at driver load (hardware state unknown).
+================ ==============================================================
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
index 0000000000..7b991735ed
--- /dev/null
+++ b/drivers/hwmon/arctic_fan_controller.c
@@ -0,0 +1,328 @@
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
+#include <linux/cache.h>
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
+	spinlock_t in_report_lock;	/* protects fan_rpm[], ack_status, write_pending */
+	struct completion in_report_received; /* ACK (ID 0x02) received in raw_event */
+	int ack_status;			/* 0 = OK, negative errno on device error */
+	bool write_pending;		/* true while an OUT report ACK is in flight */
+	u32 fan_rpm[ARCTIC_NUM_FANS];
+	u8 pwm_duty[ARCTIC_NUM_FANS];	/* 0-255 matching sysfs range; converted to 0-100 on send */
+	/*
+	 * OUT report buffer. Cache-line aligned so it occupies its own cache
+	 * line, preventing DMA cache-coherency issues with adjacent fields
+	 * (fan_rpm[], pwm_duty[]) on non-coherent architectures.
+	 * Embedded in the devm_kzalloc'd struct so it is heap-allocated and
+	 * passes usb_hcd_map_urb_for_dma(). Serialized by the hwmon core.
+	 */
+	u8 buf[ARCTIC_REPORT_LEN] ____cacheline_aligned;
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
+		/*
+		 * Only deliver if a write is in flight. This prevents a
+		 * late-arriving ACK from a signal-interrupted write from
+		 * erroneously satisfying a subsequent write's completion wait.
+		 */
+		if (priv->write_pending) {
+			priv->ack_status = data[1] == 0x00 ? 0 : -EIO;
+			complete(&priv->in_report_received);
+		}
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
+	u8 new_duty = (u8)clamp_val(val, 0, 255);
+	unsigned long flags;
+	long t;
+	int i, ret;
+
+	/*
+	 * The hwmon core holds its lock for the duration of this callback,
+	 * serializing concurrent writes. priv->buf is heap-allocated (embedded
+	 * in the devm_kzalloc'd struct), satisfying usb_hcd_map_urb_for_dma().
+	 *
+	 * Use new_duty for the target channel and the cached value for all
+	 * others. pwm_duty[channel] is committed only after a confirmed ACK so
+	 * a failed or timed-out write does not corrupt the cached duty state.
+	 */
+	priv->buf[0] = ARCTIC_OUTPUT_REPORT_ID;
+	for (i = 0; i < ARCTIC_NUM_FANS; i++)
+		priv->buf[1 + i] = DIV_ROUND_CLOSEST(
+			(unsigned int)(i == channel ? new_duty : priv->pwm_duty[i]) * 100, 255);
+
+	/*
+	 * Set write_pending before sending the report and clear it in every
+	 * exit path. raw_event() calls complete() only when write_pending is
+	 * true, so a stale ACK from a signal-interrupted write cannot
+	 * satisfy the next write's completion wait.
+	 * Serialized by the hwmon core: only one arctic_fan_write() at a time.
+	 * Use irqsave to match the IRQ context in which raw_event may run.
+	 */
+	spin_lock_irqsave(&priv->in_report_lock, flags);
+	priv->ack_status = -ETIMEDOUT;
+	priv->write_pending = true;
+	reinit_completion(&priv->in_report_received);
+	spin_unlock_irqrestore(&priv->in_report_lock, flags);
+
+	ret = hid_hw_output_report(priv->hdev, priv->buf, ARCTIC_REPORT_LEN);
+	if (ret < 0) {
+		spin_lock_irqsave(&priv->in_report_lock, flags);
+		priv->write_pending = false;
+		spin_unlock_irqrestore(&priv->in_report_lock, flags);
+		return ret;
+	}
+
+	t = wait_for_completion_interruptible_timeout(&priv->in_report_received,
+						      msecs_to_jiffies(ARCTIC_ACK_TIMEOUT_MS));
+	spin_lock_irqsave(&priv->in_report_lock, flags);
+	priv->write_pending = false;
+	spin_unlock_irqrestore(&priv->in_report_lock, flags);
+
+	if (t < 0)
+		return t; /* interrupted by signal */
+	if (!t)
+		return -ETIMEDOUT;
+
+	/* Commit the new duty only after hardware has acknowledged it */
+	priv->pwm_duty[channel] = new_duty;
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
+	/*
+	 * Start IO before registering with hwmon. If IO were started after
+	 * hwmon registration, a sysfs write arriving in that narrow window
+	 * would send an OUT report but the ACK could not be delivered (the HID
+	 * core discards events until io_started), causing a spurious timeout.
+	 */
+	hid_device_io_start(hdev);
+
+	hwmon_dev = devm_hwmon_device_register_with_info(&hdev->dev, "arctic_fan",
+							 priv, &arctic_fan_chip_info,
+							 NULL);
+	if (IS_ERR(hwmon_dev))
+		return PTR_ERR(hwmon_dev);
+
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
