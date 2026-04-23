Received: from FR4P281CU032.outbound.protection.outlook.com (mail-germanywestcentralazon11022092.outbound.protection.outlook.com [40.107.149.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46ED1349B1F;
	Thu, 23 Apr 2026 09:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.149.92
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776936032; cv=fail; b=krYvoPc6Uj4dnicXPWnqvkHyFc2xFWDgF/t+0291lRTlGeTy1ifETmi1t2EyWXeRbw7C2mQpXp0oSExRjKhaxft2QXKpZF87rJoa2GAmrQzTtj5fAE/pJfaajsZFJrN5mZ/nGRuyX2G+qw+uOY3OhY92vzBXWK/PRXvBM3RDGOE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776936032; c=relaxed/simple;
	bh=Ir3/yAqCFyiVWjygeUDqzMEQZYPJ9HzZzVEFq8IN9M0=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Yg/vMThvcgB9a4d7Zbm/glLLVvO+SPGBgsP8+sBTd29Yzn8SBEjCGhw9TXftqb/EFqPaIu6xp+sBOozgd/rEXuLfN/b+Wo/PIASVHus5zGoWE/h1r529hivpssQ6glTPmzNyU1buAqNWUfi0GG062YCMwCb9yif2Z0b65OvnfHA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arctic.de; spf=pass smtp.mailfrom=arctic.de; dkim=pass (2048-bit key) header.d=Arctic.de header.i=@Arctic.de header.b=B8bGOqTW; arc=fail smtp.client-ip=40.107.149.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arctic.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arctic.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Arctic.de header.i=@Arctic.de header.b="B8bGOqTW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vHADBTFcGNNVyM/VSZHZt/7QuNtVA72PWJxmO7DPEmvVyhHrWfzZWRXaVb6mtNQWIfomyL0eA0e/5AFnZUHrHiQT5Re3IftylP/oTsszax7V3iL+Yp13mxucj3deKm0pJQrRSVvOVX0Pwf4jFwNnNdcn+uHZK1QqwA3a9ZUFtNy/o3d4L1eZ774gDPDB/2G5HOp7wvzNaJI2GTPxPWuviSdxlECQdSw/iuqU1cAF8Evzb3qdvuZcFubLtazGHJZKsx9XacuFcZ9YpUuirthfnmKRHh4KEFYwLiXcIMbPDf3ZirsfvxcIHBianrKI9aheLCvl+VzVUmpQf6JcrGas4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ze/t6PI888ynzhg8n+tNEYSBxtM+40NooNHl/eEn+Fo=;
 b=VwBRQCwbnT4AvUfXvrTuKTZEgb/0ht9YFVOoS2y1RHrIheftGNc8F2sSiblZ1vSy+BWBWOsv6qZj3VIaUoeV+U7vljaT829J8D8ZZDWaLujcKP2rCfJS2GgBDxhrQPrNoF961eIzPDCgty2YPlNKoR3jVQZysDKM6NnTmeWVmsBSDXQ4QGVecWB2Lh0ai1UCAhwEZIs7ATtnYfHsh+7Ag0CPDQvqJiqxT3O1Vn/qGuMx1Ddyt2OI4JkgQQd/KrVe+9oFgMONd2OhbW52v5eYgftR5Be/0JDZT1Wx7oPTuIooKJ90/hCUopgY1P687A++6SVl09oEPlexUP6zhpDI3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arctic.de; dmarc=pass action=none header.from=arctic.de;
 dkim=pass header.d=arctic.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Arctic.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ze/t6PI888ynzhg8n+tNEYSBxtM+40NooNHl/eEn+Fo=;
 b=B8bGOqTWTpvhXaq4ExQ7iGyw37pCbwmMfKEXna/mhGW22bBKYzc0BKd0PenQU7jn+OG6yXtx5bdfW2PUAhLCjRq3Kf8MMt5W5FiYidvbcKEJlDk2Fu/0VaTLeUd3BJg+0yMydS5PI1Au90s9FfYrDJAWqrSGfCvahl3P1hAc5gkn6KMUaUCAq6oCd5AoT3dMGfDKViHp7iRTjERVqoyQMbJuPcV7Q5/4g260vQI3jACgGmtvEnoxfyh51TLzYaxYXYPC/sBe8vL5C7DhbeLH1gFiRRoPAjG31OAfWe1BPavG4TdjXCpKR61IU3nkGlvdGAiWyM4jxgQ5tt7Iz0dm1A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arctic.de;
Received: from FR6P281MB5900.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1bf::9)
 by BE1P281MB1491.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10:1e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.21; Thu, 23 Apr
 2026 09:20:25 +0000
Received: from FR6P281MB5900.DEUP281.PROD.OUTLOOK.COM
 ([fe80::7eba:ac95:a60d:521c]) by FR6P281MB5900.DEUP281.PROD.OUTLOOK.COM
 ([fe80::7eba:ac95:a60d:521c%3]) with mapi id 15.20.9846.021; Thu, 23 Apr 2026
 09:20:24 +0000
From: Aureo Serrano de Souza <aureo.serrano@arctic.de>
To: linux-hwmon@vger.kernel.org
Cc: linux@roeck-us.net,
	linux@weissschuh.net,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aureo Serrano de Souza <aureo.serrano@arctic.de>
Subject: [PATCH v7] hwmon: add driver for ARCTIC Fan Controller
Date: Thu, 23 Apr 2026 17:15:49 +0800
Message-ID: <20260423091551.15080-1-aureo.serrano@arctic.de>
X-Mailer: git-send-email 2.43.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TP0P295CA0004.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:2::14) To FR6P281MB5900.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1bf::9)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: FR6P281MB5900:EE_|BE1P281MB1491:EE_
X-MS-Office365-Filtering-Correlation-Id: cefe9acd-14e2-4a5b-1a58-08dea1198cc5
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|11006099003|18002099003|38350700014|55112099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	cSnTXxVZBbkJwVMfzs9icCppdhjeRdJfyG8iEXq8suS26MKCYyI0QjCF4oGdcPebYZqN2PqgaCU7RsBLFpzXjwtcKddlT9BrMojlGUEA3bKR0mk/10L2Y4DoYifnf9RLsocdZmdd2MVo774p7jrtC3bcxcZdzTlKNJmIGmr1jvtfNgdKFnSl6aTfHoxDObA+mRgk+G72mvqtFPrCLQm13PfciOw8wWtE+YcgNQTijNxI1zGZjChXPEyR9K+nR2XhOrT7AMDViLEx+RhHOdxOe2KhEERkBVfOYZ+D3EUOww1c9Y30/ddzWRiy/6sEkBCSV3zWVDJfQUmCSx5fc8yiIKBs59Yz9eKSV28VCuW4q1JsRaL16/cB1vg+lY1NbJ6DXXfaQBf3Aq5jyIJkDTCbiPamsHvD7lgHtY3OddBU3LLstIgV2ntNsPnZ9dvbsE4h4YPZ2vLtr01vnqec/BvaJY/yzqh8qMOaxViNs1WIg2YokKHFV9VIPlAnMAx7t9a+m5ooH/9delMb/qclMqBfd54tUxfhFNPooA9wQbxSRLTP/uiZ3f+3JGCVCapmNz9ncp3gsB1PkdE9oVXcBA4HrWM2HwtbQ7Ad3Chy5hVRblY9W7+0t7ABBGodEt95JkTmXmcgZeb3LJDx6kja9YvWceI1++ckdnDWQNYu8MGj8DlSkm/czeO0IsXcb4XSiKlGDfrepcxcYhG43W4L5c60lh157h9aTY5jJBTWbXYUE7MmzD5LPJLzbTBzz8FGEZo7Qbz7iXmoIC4aFoGcxc3KKRxt4I5/GqXgP9/eVLR0UlA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FR6P281MB5900.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(11006099003)(18002099003)(38350700014)(55112099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VjY1S2dORFJzUGsxQmRqR0d2UUVRVjJqd2R2WXgzYlJFU3orUmdCbWp1UDBM?=
 =?utf-8?B?c1FJd2Z1dWF0Y1JlUU9OaHlEbUgxTEhRY1orWFNacGVPcVJLVmxRYXM3RVo0?=
 =?utf-8?B?Undyc2pTQTZMUkt1d01TaWdlTVZQYXJ1eG9rV1NOOGQzWFJFd3lwRG0rbEpk?=
 =?utf-8?B?ZFpnQjVBRHhBdzA0WWlaTy95ZEpYK3pOeGRQZDh1czlrZHNjVktYRnBmWmpm?=
 =?utf-8?B?ZFFuSm5zdmI5YzBSaXdZMlFoQlhXOWtPVzhuYmdDVWVzRy9hbGtRNnlqbWk2?=
 =?utf-8?B?Zm9wa015R3ZOWklBbGdHNmZIN1JrSkhNcWMrNmpBNm1kL0dvdEdDTk9rTzJo?=
 =?utf-8?B?dU55WHYwSCtHTWxFRXd3U0hlanJkOXlkZTZtVjhiSlRaWTFOOFJKSVJpQVIr?=
 =?utf-8?B?N00ySzVtUkJrUTh0ZTloZWNzS0F4ZGJTRlNsWHVIOUJGVkxBTExSQzJveVZm?=
 =?utf-8?B?Ny83MDBKWS95K2xPdWIxUjUxU2VXa0xmTXJ1REFGUlZTVy9wNU9EN0RIbmdm?=
 =?utf-8?B?M3haZzFtcmJ1ZGt4WnhBVGNWcElmVjlXZG4rNWZEcUJ6bm1OeHl5NzdmS2s5?=
 =?utf-8?B?cmgxaGpwRGFWbTJlRkRieVFtMk8xSE1TOWtJQ2dpOVBPdVFpQmpkWVdKRExa?=
 =?utf-8?B?SnZRK3l6dmJNbTNlUGdoeEJuZWFGTXFUSVp3RXNrbWlKRm1weXlWMFkyMGg4?=
 =?utf-8?B?Tmtkb3ZmNzdvM1NUT1dCeHphakk4SjZseVJrL0FmWU1Jd1N0b1IzaGNGK200?=
 =?utf-8?B?N1lTUzMrYUlyNDFxbzU0WStqZ0c5c29BekkwR1FySjNYUFJWdlBweWFHNTI0?=
 =?utf-8?B?NVBxdjlaanNWb0tnbmJKZ3FrMXJTMHJVY252TEt2TFR3UVFCa25oOVRPWmZZ?=
 =?utf-8?B?Q2pjU0l4MEQ4aU1NbHZUd01OYTl6Y2RlVWJZaHp1WkJSeVlkbjY2ZkYxQURJ?=
 =?utf-8?B?bUovdzA2YmdZVU9KV01QMFQvOUJvVTlZWURzNFdQa25aUmpJZWJ1WU5qN0ds?=
 =?utf-8?B?TEJXZ0FZMjdHR1RmQ1gyOHZzbHhrQnlkOGtoeFpGSTZ1Nm4yRXM0UVBqWXJB?=
 =?utf-8?B?VmZ5bG1xdElISWdhdDhzRWJjeURyM20veFdUUitOajhSdW9wb0txL2NwcTFl?=
 =?utf-8?B?dWdMMFVsNkVsekhiSHZpQnVCSFFpVzhNZVRSZ2k1WjNzWTVobUVnb2ZxcFlK?=
 =?utf-8?B?cGFwVzFLWG4waStsN2pNM3FDeWFWaXVSUDA2bUVwWGJqNXBFeVVBTitUQXN0?=
 =?utf-8?B?UTZwd3dMMTJnRG1XaGd3ZFhDWlVzanNXbElzY1JMZEF2MFpDdXRKT2JGcFp4?=
 =?utf-8?B?eVBPMVkvaUs5cHF3MU1rUEV0T1QwNDEyU0s5K0FHc3FKeTlqQWxuRGUvbndl?=
 =?utf-8?B?WjQ4c2hiZjVFQnZiRnRYYUFTOEN0KzRZUi8vUjY2TnB2VVNqMk5oSW9udWla?=
 =?utf-8?B?U1RTUDI4Mi9MNmJFRHQ3Z0xsckxMRXlielErN3A1bEw2aE1kY0JGd2tIcmFH?=
 =?utf-8?B?bDd2QVZaRGZIZFI0bE5OVWpQaHpSQ2k2N1hkVENreG9HWmZoWEFyczdpTFpH?=
 =?utf-8?B?cGtNdEZuaVNRamtsME9oY2VLQ0VWQ0VrWmhvOUY1OVdncnMvWW0rVFpFKzlv?=
 =?utf-8?B?RzVnQ3FsN3J2WHJLQjI1b2krclgvdTQ2Ymppa2tJTHNGVHR3UlZ1RjNkVko4?=
 =?utf-8?B?N2l2U2MwRmJBWW1DV3FGajFLZ3M3RnJlWkVOL3Z0MDVuYytpclBEaDZqUFhX?=
 =?utf-8?B?c2RSdGpiMjRES2hhNlQ0dklSZkUvVlJwYVRiRHBhcDN0SjV4YzJacStmYmh6?=
 =?utf-8?B?OXQ3VWYrS25ndjZvKy9Jekc3UlhQaHNvWW01ZXduVmpYWkZDZ2kydVNxWUJC?=
 =?utf-8?B?Y1hoWm1nYVN2WFJrL2NHbWdCUnVvYWpFR2tvNTFjMlQ5Z1l6QUdneGhPMVhp?=
 =?utf-8?B?ZVpkTHJ6dFI5M04rZytTZ0lMYWs4dXNyOFB0TGUwcmlYVXVWWWRKcDNhUzUw?=
 =?utf-8?B?U21oeUNRVjd6QzloYi9WYXlyNUFTTmk0ZGtuRm1qdVNIYkxFSjQ3VEJVREJQ?=
 =?utf-8?B?RVYrK0lkZ1dqNkdKUXhRdGhFcjltcmt3QjFKRTlzcFZmVXAySFB5dlFpY0VU?=
 =?utf-8?B?U0RtMUI4RENNbnVGYXMwR0dDTEdRcE5SalZDUDAzcU9RMUhKQkwyV2VSSkl3?=
 =?utf-8?B?T1JPS2s0TGI3OWNpVUJSRktObjBHblVRdThPWnVJcHFRaWcvT2tyU1JJTTF5?=
 =?utf-8?B?b0pLTUVjZlVoMmNXeTdkSllsRk1ETm5iWXE3NElKdDF1cWZrcEd2bmI2OS9G?=
 =?utf-8?B?S3VBaXZBVmw5N0F0bUVhaloxM0tYWTRJYzRwRGYxa3BWMTc2dGRMUT09?=
X-OriginatorOrg: Arctic.de
X-MS-Exchange-CrossTenant-Network-Message-Id: cefe9acd-14e2-4a5b-1a58-08dea1198cc5
X-MS-Exchange-CrossTenant-AuthSource: FR6P281MB5900.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2026 09:20:24.4967
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 51cc2c5f-af21-4667-81ec-d88d36e264bb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P3ap8RY1j3STPzdlNcbdCQMqSn4b9vvGr6UInF2TQPkB6NPbU6GmeSalEN6btNSfsGNRxCRqpcLjy4zFGc+qXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BE1P281MB1491

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
a spinlock with irq-save. pwm_duty[] is also protected by this spinlock
because reset_resume() clears it outside the hwmon core lock. The OUT
report buffer is built and write_pending is armed under the same lock so
that no reset_resume() can race with the pwm_duty[] snapshot. priv->buf
is exclusively accessed by write(), which the hwmon core serializes.

Signed-off-by: Aureo Serrano de Souza <aureo.serrano@arctic.de>
---
Thanks to Guenter Roeck and Thomas Weißschuh for the reviews.

Changes since v6:
- arctic_fan_remove(): drop the redundant hid_device_io_stop() call.
  The HID core clears hdev->io_started before invoking ->remove(), so
  the driver's call hit the "io already stopped" warning path in
  hid_device_io_stop() (drivers/hid/hid-core.c clears io_started
  before calling hdrv->remove; include/linux/hid.h's inline
  hid_device_io_stop() warns when io_started is false). The
  hid_device_io_stop() in probe()'s out_close label is kept because
  probe itself calls hid_device_io_start().
- struct arctic_fan_data: wrap buf[] in
  __dma_from_device_group_begin()/_end() instead of
  ____cacheline_aligned, as suggested by Thomas. The macro pair
  expresses the DMA-buffer semantic directly and lets the surrounding
  comment shrink. Same pattern used by drivers/virtio/virtio_input.c,
  drivers/scsi/virtio_scsi.c, drivers/char/hw_random/virtio-rng.c,
  drivers/gpio/gpio-virtio.c and net/vmw_vsock/virtio_transport.c.
- #include <linux/dma-mapping.h> for the new macros; drop the now
  unused <linux/cache.h>.

Changes since v5:
- arctic_fan_probe(): switch from devm_hwmon_device_register_with_info()
  to hwmon_device_register_with_info(); store the returned pointer in
  priv->hwmon_dev for explicit teardown in remove()
- arctic_fan_remove(): call hwmon_device_unregister(priv->hwmon_dev)
  before hid_device_io_stop/hid_hw_close/hid_hw_stop; this closes the
  use-after-free window where a concurrent sysfs write could call
  hid_hw_output_report() on an already-stopped device; matches the
  removal pattern used by nzxt-smart2 and aquacomputer_d5next
- arctic_fan_write(): expand write_pending comment to document the
  residual theoretical late-ACK race (unfixable without a correlation
  ID in the device ACK report) and its practical impossibility (observed
  max ACK latency ~563 ms, timeout 1 s; a delay > 1 s indicates a
  non-functional device)
- arctic_fan_reset_resume(), arctic_fan_read(), arctic_fan_write():
  extend in_report_lock coverage to pwm_duty[]; reset_resume() clears
  pwm_duty[] outside the hwmon core lock, so all paths that read or
  write pwm_duty[] now hold in_report_lock to prevent a data race
  during resume
- arctic_fan_write(): build the OUT report buffer inside in_report_lock
  so reset_resume() cannot clear pwm_duty[] between the pwm_duty[]
  snapshot and the buffer write; this makes the lock coverage complete

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
index 0000000000..dbe84cd93c
--- /dev/null
+++ b/drivers/hwmon/arctic_fan_controller.c
@@ -0,0 +1,374 @@
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
+#include <linux/dma-mapping.h>
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
+	struct device *hwmon_dev;	/* stored for explicit unregister in remove() */
+	spinlock_t in_report_lock;	/* protects fan_rpm, ack_status, write_pending, pwm_duty */
+	struct completion in_report_received; /* ACK (ID 0x02) received in raw_event */
+	int ack_status;			/* 0 = OK, negative errno on device error */
+	bool write_pending;		/* true while an OUT report ACK is in flight */
+	u32 fan_rpm[ARCTIC_NUM_FANS];
+	u8 pwm_duty[ARCTIC_NUM_FANS];	/* 0-255 matching sysfs range; converted to 0-100 on send */
+	/*
+	 * OUT report buffer passed to hid_hw_output_report(). Embedded in the
+	 * devm_kzalloc'd struct so it is heap-allocated and passes
+	 * usb_hcd_map_urb_for_dma(). Exclusively accessed by write(), which
+	 * the hwmon core serializes.
+	 */
+	__dma_from_device_group_begin();
+	u8 buf[ARCTIC_REPORT_LEN];
+	__dma_from_device_group_end();
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
+		spin_lock_irqsave(&priv->in_report_lock, flags);
+		*val = priv->pwm_duty[channel];
+		spin_unlock_irqrestore(&priv->in_report_lock, flags);
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
+	 * Build the buffer and arm write_pending under in_report_lock so that
+	 * reset_resume() cannot clear pwm_duty[] between the pwm_duty[] read
+	 * and the buffer write, and raw_event() cannot deliver a stale ACK
+	 * from a previous write into this write's completion.
+	 *
+	 * priv->buf is heap-allocated (embedded in the devm_kzalloc'd struct),
+	 * satisfying usb_hcd_map_urb_for_dma(). Exclusively accessed by
+	 * write() which the hwmon core serializes.
+	 *
+	 * pwm_duty[channel] is committed only after a positive device ACK so a
+	 * failed or timed-out write does not corrupt the cached state.
+	 *
+	 * Residual theoretical race: if write A times out (write_pending
+	 * cleared), write B sets write_pending = true, and a late ACK from
+	 * write A—delayed beyond ARCTIC_ACK_TIMEOUT_MS—arrives during write
+	 * B's pending window, it would falsely satisfy write B's completion.
+	 * This cannot be prevented in driver code without protocol support
+	 * (for example, a correlation ID echoed in the device ACK report).
+	 * In testing, observed ACK latency stayed below the 1 s timeout
+	 * (maximum ~563 ms over 500 iterations).
+	 *
+	 * The wait is non-interruptible so that a signal cannot cause write()
+	 * to return early while the OUT report is already in flight; an
+	 * interruptible early return would create the same late-ACK window
+	 * without even the timeout guard.
+	 * Serialized by the hwmon core: only one arctic_fan_write() at a time.
+	 * Use irqsave to match the IRQ context in which raw_event may run.
+	 */
+	spin_lock_irqsave(&priv->in_report_lock, flags);
+	priv->buf[0] = ARCTIC_OUTPUT_REPORT_ID;
+	for (i = 0; i < ARCTIC_NUM_FANS; i++) {
+		u8 d = i == channel ? new_duty : priv->pwm_duty[i];
+
+		priv->buf[1 + i] = DIV_ROUND_CLOSEST((unsigned int)d * 100, 255);
+	}
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
+	/* Commit inside the lock so reset_resume() cannot race with this write */
+	if (t && priv->ack_status == 0)
+		priv->pwm_duty[channel] = new_duty;
+	spin_unlock_irqrestore(&priv->in_report_lock, flags);
+
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
+static int arctic_fan_reset_resume(struct hid_device *hdev)
+{
+	struct arctic_fan_data *priv = hid_get_drvdata(hdev);
+	unsigned long flags;
+
+	/*
+	 * The device resets its PWM channels to hardware defaults on power
+	 * loss during suspend. Clear the cached duty values so they reflect
+	 * the unknown hardware state, consistent with probe-time behaviour
+	 * (the device has no GET_REPORT support). Hold in_report_lock so
+	 * this does not race with a concurrent pwm read or write callback.
+	 */
+	spin_lock_irqsave(&priv->in_report_lock, flags);
+	memset(priv->pwm_duty, 0, sizeof(priv->pwm_duty));
+	spin_unlock_irqrestore(&priv->in_report_lock, flags);
+	return 0;
+}
+
+static int arctic_fan_probe(struct hid_device *hdev,
+			    const struct hid_device_id *id)
+{
+	struct arctic_fan_data *priv;
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
+	/*
+	 * Use the non-devm variant and store the pointer so remove() can
+	 * call hwmon_device_unregister() before tearing down the HID
+	 * transport. devm_hwmon_device_register_with_info() would defer
+	 * unregistration until after remove() returns, leaving a window
+	 * where a concurrent sysfs write could call hid_hw_output_report()
+	 * on an already-stopped device (use-after-free).
+	 */
+	priv->hwmon_dev = hwmon_device_register_with_info(&hdev->dev, "arctic_fan",
+							  priv, &arctic_fan_chip_info,
+							  NULL);
+	if (IS_ERR(priv->hwmon_dev)) {
+		ret = PTR_ERR(priv->hwmon_dev);
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
+	struct arctic_fan_data *priv = hid_get_drvdata(hdev);
+
+	/*
+	 * Unregister hwmon before stopping the HID transport. This removes
+	 * the sysfs files and waits for any in-progress write() callback to
+	 * return, so no hwmon op can call hid_hw_output_report() after
+	 * hid_hw_stop() frees the underlying USB resources.
+	 * Matches the pattern used by nzxt-smart2 and aquacomputer_d5next.
+	 *
+	 * The HID core clears hdev->io_started before invoking ->remove(),
+	 * so hid_device_io_stop() is not called here; doing so would emit
+	 * a spurious "io already stopped" warning.
+	 */
+	hwmon_device_unregister(priv->hwmon_dev);
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
