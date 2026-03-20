Received: from FR6P281CU001.outbound.protection.outlook.com (mail-germanywestcentralazon11020138.outbound.protection.outlook.com [52.101.171.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CEC73E0259;
	Fri, 20 Mar 2026 18:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.171.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774030133; cv=fail; b=A3Ihwrgo7ujmmkeeMhgz8awIjVwfod0nLw8fJwTUcI0dOcAfmSsM9tlz1oRE7EDjDo3N/BoQfIyTWbH0UyoJbtdBLa0CsaMFPrEcHY7bZB5SkIBUGZVBbJ9y9ijSULc/BLW2g+w+hDIXGGUpqG9+IdulyH3B4ixrM82aoffI+38=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774030133; c=relaxed/simple;
	bh=K24ZqYrXRnNbhFVU9eMH5uVTf8aeVQW7msNjjuzb4ew=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=jNnT9+0TpwcTNoAYKWS1tYq15jG9jWAWgLRZ6+kAke6mftVIEq3BFl0JNWrMMaC548KhNDnstpEhJGlOcCAQxvs8kxORi6JXpxAyxPtdm47fwDO5ZM09iLA1qBR249J7JkyANWhZs2aQINOqx0c7MK8ZKCeXI4C/rJsu5UQo37c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arctic.de; spf=pass smtp.mailfrom=arctic.de; dkim=pass (2048-bit key) header.d=Arctic.de header.i=@Arctic.de header.b=nvrtJwHN; arc=fail smtp.client-ip=52.101.171.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arctic.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arctic.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Arctic.de header.i=@Arctic.de header.b="nvrtJwHN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H6MhWIfi0lA1HBB4JcURQKbo35oPQatKNJ6zqPX3QJZCH8JO2nsBGgFuxVToSRm1Eue2jE0OFqNu0JyPQyXgMqMEKjxILvm54Q0F2tUzMo17Phg2u40KTxUCyQ/Yzh4DgMoxU4dTpyl1csk3TE9V4BP0VNzDOVHlkLuP5XCusTeTZqOLdzbLi87QeBVFYbwK3Zimd4IzFJ9YAgVyjR+tPBgFlwN4RkvEEQvLY25hUeYuS9FocC+9+YCXkRoz6E/XhZ+M8IGldAwgd22i27U2GyNHGQssD0ctiuMJ+CG1RLBIpyu/6v3Ul7g5FhggUM7/EdU22kmtzPhEe+1Dx37fPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dn9c7qVfIJi8lalhXB0I+tuUXeeTohI1RyXDlH7EK0c=;
 b=TeFLhNJFw+ieXQtVxKVmFHNVoOxKncZoTibj95hR6cVsZQqhCEeahrLorNeiHtTDA/CaozUtkDXUA3koGriuwLDfKXCJjk7cWtRdhS/SxPP/keAZATioHBsMjswrdv9N+BbdXToJMh8V9JymGyE0c4zQuRQWTRBmE7fFomy5gKKoMe9u+RAFArBxGe1szFQUqriBAH9BrztvY/hKiDWB3XhVLpbx4W0AUk5Ch5t9dbni63aZJ4TkcrxV658i8MBcyNCzBeF4X9WHk7x6ORNmKrArvp5dPg32X5SoCA6rHUtkU5+R7TVnDTJeD3SGjXshzgP0P/83bKciYQ2YpFaOTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arctic.de; dmarc=pass action=none header.from=arctic.de;
 dkim=pass header.d=arctic.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Arctic.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dn9c7qVfIJi8lalhXB0I+tuUXeeTohI1RyXDlH7EK0c=;
 b=nvrtJwHNX7IXWz9QyxbLWrN2lhJs0Jf/AcfPMMptUkEmzjT9Kp0sJQbIhRrUGWOuX7sqydQKzzfOC30G2LjFB+mYK4sm7dQK8G6JUhQk979gEhDa1lL68seNi9/vC5DQx/EWMp+Kd9iFrpmzlHLI94rBmEAUQATq4QTvhDfd04BbUokBC6vWLT4rbKJGG+BAvPhr1ooeSQ/CSIDmBwuPE4cjbpMNWuFyr5vpqIzcay4sQ50XysbgHzGIWEgRDUUX1w4rNgVQRRrkpiKihE85EFXMsLDInnRVy97tOyabSt+rcNrzP4Wc5CCiEFr4pnqEHVdidvYXJlWkuBniJoLegA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arctic.de;
Received: from FR6P281MB5900.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1bf::9)
 by FR0P281MB1723.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:83::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.23; Fri, 20 Mar
 2026 18:08:44 +0000
Received: from FR6P281MB5900.DEUP281.PROD.OUTLOOK.COM
 ([fe80::7eba:ac95:a60d:521c]) by FR6P281MB5900.DEUP281.PROD.OUTLOOK.COM
 ([fe80::7eba:ac95:a60d:521c%5]) with mapi id 15.20.9723.022; Fri, 20 Mar 2026
 18:08:44 +0000
From: Aureo Serrano de Souza <aureo.serrano@arctic.de>
To: linux-hwmon@vger.kernel.org
Cc: linux@roeck-us.net,
	linux@weissschuh.net,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aureo Serrano de Souza <aureo.serrano@arctic.de>
Subject: [PATCH v5] hwmon: add driver for ARCTIC Fan Controller
Date: Sat, 21 Mar 2026 02:00:53 +0800
Message-ID: <20260320180723.462765-1-aureo.serrano@arctic.de>
X-Mailer: git-send-email 2.43.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TYCP286CA0298.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c8::12) To FR6P281MB5900.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1bf::9)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: FR6P281MB5900:EE_|FR0P281MB1723:EE_
X-MS-Office365-Filtering-Correlation-Id: cebf9685-0a93-430b-0f80-08de86abb97e
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014|56012099003|55112099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	2uZbGqB1eOBSjcGWxgeefsKeld327oBYjFCykXeRWbJsdlxIsstRF/vD53u0PUz9GeMJmPFxqLy6JmZWW8zdc1HlMtZglAcOoL0C43QSpQ5Uaue3iGmuHbdVcaXB3dU+adRv4q3EzblYPzdhHbo5ZwIGTiYKiTs8T2+T7J9xy/rT03IhZ0Rc9c1+sByLn6PlenH9gkKcb8WErVdC+eVEyVpoOzJFqg+FtyLHxdvBZZhjdUc5wicbmCQzQTG4GBjXDzxn0Nb24OlWJyZzrKnQLPXJ1sCiZcr+oxChe4rtB/aBVNMdLCyLjBrY4v/tPZF6o13kSUb0j4OPzuWsqcAS/tCVA4xltovxVjZHskdItbTKlZ525mLr4rQBtqW9nylVlskESoPn89YeXnRUEhm4kINy0YLztfB6cu2qHezSk8D/ieQ1ZVR/cyPgXc4Y8pJY5Nr0Nf5RN96mtknyAQIo9FpbXhZZ1iSUJZZj7pQlIwTWAUA2e/naFfpKmqJgKURqGzslF1sLuDweKEBpF0rMN4vHQKbSmzxTZ8tjdhTm6WMCkPl0XhnyCgEPcS9jT1kqeUgApN+/AIgOVoYiG4NuF+lSVo8IyoDHFlXZj+1HZkQanO3kmKVOAZIe4wg0/7shP6Pxg7obOSOIhJs/oSjnYf8D9CiyaS2dnNXO/3yJJsbz1GqfMyekse7TznYKif8hriwwFP/AaAfdcs9eUxQa7e0cVTV3iCp0L0F/ZhCY0VrjxhaB86qUoxQfNBzH19pOHuiOi/duVv0tFjzEBo9TBFucLU70b8hqjwr2OItDblY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FR6P281MB5900.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014)(56012099003)(55112099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dHU5cS9TNklHd0U0MGU3djA3V0tIcFUvYnRtSEhYZXRYSXlNa2VsTHNYVTc3?=
 =?utf-8?B?cEhWNFV3S3phRThIdXBZSlVNR2E3dFhmWXdkUUJWcnlSWVBsSHU3RTF1U1Jv?=
 =?utf-8?B?NFY1alplUUU0dkpSZGtuc3ZKSlRxVDdVdmY1MlBOMUtyQTZyWFV4ZFBWbngy?=
 =?utf-8?B?TGJpYy9Zb2dBRHg1TWtRRlVxSDRIeVI2c0VTaDJZUmZ2S0hMNWd4WGZJQ0Iv?=
 =?utf-8?B?dmwrRlU4aXBGd3IxTG9wVDJNcE5Na2J6d3dnS0w4clI2UHkzUFJzTVlXVXdB?=
 =?utf-8?B?NVlhZ0R2dmVtczBKUkFoSmNiMHdKV1Z4Q3R4NGZyTGFIaytjM0Rmc2MrRXo1?=
 =?utf-8?B?OEpaSWl3ZGp4ZkN3QmViS0N0WHRENVlQdmJGaGdkZ29DK0VTTHlRbmhlY3pw?=
 =?utf-8?B?ZHplOWJZb2ZJZWxRT0NWY09SeFJtdU50T0oyZXRtcU56dDBWTnlhR2tXcThi?=
 =?utf-8?B?NXFBMEZINDhIM21EV2N2bnExSmYzM00xbjJsVXh3aGVMYlEyOVhSaGl2K2k3?=
 =?utf-8?B?dTR4V2VCc0l4OGsxRU8zRlNETUVRakR1MXdHWEFZUUsrMSthY2NjQ0pXbE5Y?=
 =?utf-8?B?MGVMSGtwTFRqUHNEemlNVVdTbmVKVEVTcWU0bnVPSW8yL1Q0aWJmNno4RkQv?=
 =?utf-8?B?M2YrMklaSlZ2d25QeU1lOGxRcWYyTkFpSVNOSHBZeFB3alFpZFYrMDJrc0oy?=
 =?utf-8?B?cGNuUlhyS0RGb2VHeEJIS1V2Q1dadGx5bDVYQ1dTNzlIMGlteHE4NzE1WW9q?=
 =?utf-8?B?N0FrMFh5b1J3QS9pQlB2ajNRZnpGdHZlL2lwZEp6VVJGVTVIUEJEQitHUU5P?=
 =?utf-8?B?ZEhVank0dVp4OXB2YitSWWhsWnZLWDcvUTBjQ0NEYTR5YzllcElYLzRpdWF2?=
 =?utf-8?B?YlFrM2xObitkU1c4T0ZoSnZRc3BYd01ta2tUU3dKbGEwWVphUTlHcTMzVnhn?=
 =?utf-8?B?UmpiNmQ0bzdXY0FMaUU2Yzk0VlhQbEw3Vy9EVDZQcmVnL3J1ZEorK3NDK0Fs?=
 =?utf-8?B?ODB1d3EvcHZWZGJtWHE2aWZXK1VSV2t5RlRYUE8vdjJVRE9pUUxOdyszc2Ja?=
 =?utf-8?B?b0ZTakRLRGhmODM1N2d4KzZKMGh2Q0RlYzFCNHJqa05Da0Fwa21ZMm1RWjVo?=
 =?utf-8?B?U3hzVXh4cEEyMENMZFhNeWltSFFUbEoxVWRHMG5FR3NTM2M3Yy9ZRWs4RlBP?=
 =?utf-8?B?L2E5cHhRVldWbVV2TjNuODZjV0hKbWEwQVVnWUFrYXpWNnpMWE5sbWY2dWFW?=
 =?utf-8?B?Ty9DYU5sNEpBMWNyZFl6d0xGR1pRRHR5bXJkTEluS1cyc0lKY0JJVE9VTU9F?=
 =?utf-8?B?Tklwb3AxZjBYMVdkNFdIZ3huYWxhbmRBS20vMEZMUjBxZjlVZnFoeU5uV2gy?=
 =?utf-8?B?Uy8vYzFnSlJ2alhja1FhV1ptNUhFcHRsOUxkMC9rc1p3YU55eWNJYnRTc3Rk?=
 =?utf-8?B?VHc0SzIrQ3hPRnlEVndjcHI3WHF2aHBUa0tNNTlXTjlXU3ZDTXUxeEgvUC95?=
 =?utf-8?B?K0JDRWhvcGI1ZkZaY3RGUzJnSU9vbVRXaDdwdlJsNFNsUE0ya2xpV1JYcTZ2?=
 =?utf-8?B?a2lCL0hOUVJIbXVkVk84ODY4blhHYzk2MkZIQ1p6VXZmcElieUhsNnpJemJi?=
 =?utf-8?B?bzBRc3UxbEI1RUVtOCtCTkpaR25xRG8rUlppVGJ4ZzlCYTVyb1c1cDlMTnlm?=
 =?utf-8?B?SVVjazhveVFaM2U5WWxESlVPWXphYTZmRTRzT1ZYck44bml0S3ZBV0hkeTQx?=
 =?utf-8?B?QzBuS3JydndpaDdvNXkvNjJ4OXVIcGZoQVJwODExTXJVaVhKZXN2TlAzVFQ3?=
 =?utf-8?B?RW8zUGJ2VWFydStLdFZmaEpvNk1kMklseldWbmErc203Nmx4czJ3T1EvYmhz?=
 =?utf-8?B?T0hXVWpPRGZOM3hZT3E1L0p0bnhnQUpiNGlxWGdyUWh1VU90RjB3TkRZU3ZU?=
 =?utf-8?B?a1BKcmxadHAzYmFpR0p5YkxPU0IrUkJKQjA2STZMUVhoczN2ZTdseW5tMTJH?=
 =?utf-8?B?M2pwMG5POVpyYmhoS0ZmaEpGSGs2ODBwdkdCbGpVcytKUjh0QnZXSE1Ob2N3?=
 =?utf-8?B?MnB4aVRpN0hIREhYekhSZU1HTC9RU2tPVDRZWURBOWVpVjZkZFFrQklEVTgy?=
 =?utf-8?B?T0hGQjRZelZnalRLbDU2U0VsU2pvbnppMEU5b3prVENwbHNsTi9ESUxHejZ6?=
 =?utf-8?B?NXR0dzcvUTFvMURERHpRRmdBNGJGZ1hHZ1FWNXA4N1RTWXNRN1BrWjhEWUk4?=
 =?utf-8?B?ZWU1amNtYWdFSTU0WUV2Q080SGh1dGhmbkQ2ejVlaGRvQ3dUNVFRaWg2U0ZB?=
 =?utf-8?B?TmtEWnB2VlI5TG9RUmhwMHJPZGxsaUxNRU42YnFBTWd6SUFRRmxoQT09?=
X-OriginatorOrg: Arctic.de
X-MS-Exchange-CrossTenant-Network-Message-Id: cebf9685-0a93-430b-0f80-08de86abb97e
X-MS-Exchange-CrossTenant-AuthSource: FR6P281MB5900.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2026 18:08:44.3884
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 51cc2c5f-af21-4667-81ec-d88d36e264bb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZNcDR/yVecMZEGtq1+RUblYay69LcpV9GYR8OEXMY4HpAJDntYacFD+IvcFFItrXTBmjQBD4u8PTEUYYZ1ftRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR0P281MB1723

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

Changes since v4:
- arctic_fan_write(): switch to wait_for_completion_timeout() (non-
  interruptible); eliminates the signal-interrupted write case of the
  late-ACK race that write_pending could not fully prevent
- arctic_fan_write(): guard pwm_duty[channel] commit with
  ack_status == 0 check; a device error ACK (status 0x01) no longer
  silently poisons the cached duty used in future OUT reports
- arctic_fan_probe()/remove(): replace devm_add_action_or_reset() +
  no-op remove() with explicit hid_device_io_stop/hid_hw_close/
  hid_hw_stop in remove(); devm_add_action_or_reset() was called after
  hdev->driver = NULL, causing a NULL deref in hid_hw_close() on unbind
- add reset_resume callback: device resets PWM to hardware defaults on
  power loss during suspend; driver now clears cached pwm_duty[] on
  reset-resume so stale pre-suspend values are not re-sent as if valid
- Documentation/hwmon/arctic_fan_controller.rst: document suspend/
  resume behaviour and the updated pwm[1-10] read semantics

Changes since v3:
- buf[]: upgrade from __aligned(8) to ____cacheline_aligned so the
  DMA buffer occupies its own cache line, preventing false sharing with
  adjacent fan_rpm[]/pwm_duty[] fields on non-coherent architectures
- arctic_fan_write(): add write_pending flag (protected by
  in_report_lock) so raw_event() delivers ACKs only while a write is
  in flight
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
index 0000000000..b5be88ae46
--- /dev/null
+++ b/Documentation/hwmon/arctic_fan_controller.rst
@@ -0,0 +1,56 @@
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
+On system suspend, the device may lose power and reset its PWM channels to
+hardware defaults. The driver clears its cached duty values on resume so
+that reads reflect the unknown hardware state rather than stale pre-suspend
+values. Userspace is responsible for re-applying the desired duty cycles
+after resume.
+
+Sysfs entries
+-------------
+
+================ ==============================================================
+fan[1-10]_input  Fan speed in RPM (read-only). Updated from IN reports at ~1 Hz.
+pwm[1-10]        PWM duty cycle (0-255). Write: sends an OUT report setting the
+                 duty cycle (scaled from 0-255 to 0-100% for the device);
+                 the cached value is updated only after the device ACKs the
+                 command with a success status. Read: returns the last
+                 successfully written value; initialized to 0 at driver load
+                 and after resume (hardware state unknown).
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
index 0000000000..f50a9a6689
--- /dev/null
+++ b/drivers/hwmon/arctic_fan_controller.c
@@ -0,0 +1,338 @@
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
+#include <linux/string.h>
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
+		 * late-arriving ACK from a timed-out write from erroneously
+		 * satisfying a subsequent write's completion wait.
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
+	unsigned long t;
+	int i, ret;
+
+	/*
+	 * The hwmon core holds its lock for the duration of this callback,
+	 * serializing concurrent writes. priv->buf is heap-allocated (embedded
+	 * in the devm_kzalloc'd struct), satisfying usb_hcd_map_urb_for_dma().
+	 *
+	 * Use new_duty for the target channel and the cached value for all
+	 * others. pwm_duty[channel] is committed only after a positive device
+	 * ACK so a failed or timed-out write does not corrupt the cached state.
+	 */
+	priv->buf[0] = ARCTIC_OUTPUT_REPORT_ID;
+	for (i = 0; i < ARCTIC_NUM_FANS; i++) {
+		u8 d = i == channel ? new_duty : priv->pwm_duty[i];
+
+		priv->buf[1 + i] = DIV_ROUND_CLOSEST((unsigned int)d * 100, 255);
+	}
+
+	/*
+	 * Set write_pending before sending the report and clear it in every
+	 * exit path. raw_event() calls complete() only when write_pending is
+	 * true, so a stale ACK from a timed-out write cannot satisfy a
+	 * subsequent write's completion wait. The wait is non-interruptible
+	 * to prevent the same race in the signal-interrupted case.
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
+	t = wait_for_completion_timeout(&priv->in_report_received,
+					msecs_to_jiffies(ARCTIC_ACK_TIMEOUT_MS));
+	spin_lock_irqsave(&priv->in_report_lock, flags);
+	priv->write_pending = false;
+	spin_unlock_irqrestore(&priv->in_report_lock, flags);
+
+	if (!t)
+		return -ETIMEDOUT;
+
+	/* Commit the new duty only after hardware has positively acknowledged it */
+	if (priv->ack_status == 0)
+		priv->pwm_duty[channel] = new_duty;
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
+static int arctic_fan_reset_resume(struct hid_device *hdev)
+{
+	struct arctic_fan_data *priv = hid_get_drvdata(hdev);
+
+	/*
+	 * The device resets its PWM channels to hardware defaults on power
+	 * loss during suspend. Clear the cached duty values so they reflect
+	 * the unknown hardware state, consistent with probe-time behaviour
+	 * (the device has no GET_REPORT support).
+	 */
+	memset(priv->pwm_duty, 0, sizeof(priv->pwm_duty));
+	return 0;
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
+	if (ret)
+		goto out_stop;
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
+	if (IS_ERR(hwmon_dev)) {
+		ret = PTR_ERR(hwmon_dev);
+		goto out_close;
+	}
+
+	return 0;
+
+out_close:
+	hid_device_io_stop(hdev);
+	hid_hw_close(hdev);
+out_stop:
+	hid_hw_stop(hdev);
+	return ret;
+}
+
+static void arctic_fan_remove(struct hid_device *hdev)
+{
+	hid_device_io_stop(hdev);
+	hid_hw_close(hdev);
+	hid_hw_stop(hdev);
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
+	.reset_resume = arctic_fan_reset_resume,
+};
+
+module_hid_driver(arctic_fan_driver);
+
+MODULE_AUTHOR("Aureo Serrano de Souza <aureo.serrano@arctic.de>");
+MODULE_DESCRIPTION("HID hwmon driver for ARCTIC Fan Controller");
+MODULE_LICENSE("GPL");
