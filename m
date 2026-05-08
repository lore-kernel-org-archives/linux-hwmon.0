Received: from FR4P281CU032.outbound.protection.outlook.com (mail-germanywestcentralazon11022137.outbound.protection.outlook.com [40.107.149.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 618BF22759C;
	Fri,  8 May 2026 06:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.149.137
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778222692; cv=fail; b=nBy+Zu06OoCg5Aq7zKx6QarMqIRXFGz1HXE9HbR15q6YND0gZ65aIWVmnbz26QbOdBIrJ8NUO20fmaEMf9Lul0KKkbqTxmTKjNeUH6q9w9XYWT7peFKdsD3UgGX4s/KKHOYpy27kNCThHU2pCw2bjwnWfnPZSwKy25HK3YAPzRc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778222692; c=relaxed/simple;
	bh=MxKCcBtOI+EbWOFwjTdi28HGHpYa6UOmHByDatDBWYc=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=cjLv1Xe2hYi+M4IcDiUZrpgt8vp2LeWBbKiHMQ4zU6lHQAQ2pQSlDjwdHVtD1PMXq+LPlPFLsjcOPB5kgFM21xuv1K79V/YAWFxEpucZxggZbz05HSQZ1kK+zMvpx0qF2BWflxNjuBPj5LjGqRt0/Ch5rReL6bdJSeC8W85DzGQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arctic.de; spf=pass smtp.mailfrom=arctic.de; dkim=pass (2048-bit key) header.d=Arctic.de header.i=@Arctic.de header.b=ShrLEC5X; arc=fail smtp.client-ip=40.107.149.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arctic.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arctic.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Arctic.de header.i=@Arctic.de header.b="ShrLEC5X"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BmQLupEeLQM/aFQ7vCgLgwRvlKHtAzZaSz2TctaPyCO1cJD5z1rOsuVgKNB9A+RRNMJgaaqwdFz7YjMFdR7YczPsJeBiqmJQj6RrawtfWpJu5+MId/KwULjBIImiIhCKZQloK7amEUT70FB2Clsn+pQoVcE/0iDsFrLdZ1HLDzqvp4vpMppc//Iwm7g4s9wo13SjGiHYVhmOP3gtrKNaY+I/YtOBYAe5FvefSYz5a5vdiCvxD0mH70BQzXcVcGD1CNishYBQIGIeEqwiG3Et+XEwwgh1MON21WhcK3w4D0XpSQ5zpgUETfkP2bF2yeLn/FxL9WwV3VX+01uXpFdHeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XRjFUkxzlu7hHXZp6c5KqYd6K3cqW3q3QyJ3ywUduJs=;
 b=kj6ejyGuENTLqasjqA8jGt7ShLN7DiaI+zakU2IPiQKBfvXJnI4ds5QlA6pwbyzYHo1QiBfN8M/5+Oc+cs2tdu9g5gGfBrrvCO8Y9zF/vVSf5nppIOX0su3XMpMoPSalf2fqgSrxWrLjTQ4XUq3XtTVxDZ96SS+SHMriN2zPmHC3qaeD08dDzOu5v1hbsTzJsLYUf6Fw29hcsGZVLcmYylSdXO6YgEfyqj/e+PHzjRYh1wf5nBNoM16fOB/D0IsQtiL/leRtCDjN2GCZGk4oIWOiKgnz1qUEH9RBdPEfoOnN65dqYoJTpUzSzjz6jq1LTB73hJS3PaeaTwcAVSWf7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arctic.de; dmarc=pass action=none header.from=arctic.de;
 dkim=pass header.d=arctic.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Arctic.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XRjFUkxzlu7hHXZp6c5KqYd6K3cqW3q3QyJ3ywUduJs=;
 b=ShrLEC5X9ScAt4CxJgmvUQwIFnLwLEjWJx4lQPY7dcYgfeTlFmphbp/O8QoKS9xX8LHOicuFsf9z8NHrRYx99IxL9Q8fiipHeuldy5oGQ0fuTyb8n4WOZJIxDjD1AJ+7uCwnUvcYlodfooUgVpFrvaZ6IQGvJDovL7oJI2rs2r02iUO/j+f42JVQZh1gudICxiT+aiEBunFbEX90Zg2HPuXxHRZwcJC/cpNH70Pl4mzDuytzAzyG/n72FIncGCaKloYiuBNm81+TDzacXXIHAk/hgBXmAo93rnqeaxh+wCmlDQjXdKnDZBLtVKJMblxmT84mdjF0wTxQ4Bo60MPLQw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arctic.de;
Received: from FRVP281MB5895.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1c3::20)
 by BE1P281MB3138.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10:6a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.20; Fri, 8 May
 2026 06:44:35 +0000
Received: from FRVP281MB5895.DEUP281.PROD.OUTLOOK.COM
 ([fe80::c6a2:6e8f:ea:cc0d]) by FRVP281MB5895.DEUP281.PROD.OUTLOOK.COM
 ([fe80::c6a2:6e8f:ea:cc0d%4]) with mapi id 15.20.9891.016; Fri, 8 May 2026
 06:44:34 +0000
From: Aureo Serrano de Souza <aureo.serrano@arctic.de>
To: linux-hwmon@vger.kernel.org
Cc: linux@roeck-us.net,
	linux@weissschuh.net,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aureo Serrano de Souza <aureo.serrano@arctic.de>
Subject: [PATCH v7 RESEND] hwmon: add driver for ARCTIC Fan Controller
Date: Fri,  8 May 2026 14:44:00 +0800
Message-ID: <20260508064405.38676-1-aureo.serrano@arctic.de>
X-Mailer: git-send-email 2.43.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TPYP295CA0009.TWNP295.PROD.OUTLOOK.COM (2603:1096:7d0:9::8)
 To FRVP281MB5895.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1c3::20)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: FRVP281MB5895:EE_|BE1P281MB3138:EE_
X-MS-Office365-Filtering-Correlation-Id: 640a100d-9e6b-42f1-d2d6-08deaccd43eb
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|52116014|376014|1800799024|3023799003|56012099003|18002099003|55112099003;
X-Microsoft-Antispam-Message-Info:
	Yvmbia01duVxe4kQ6Svm7Y9UI6eQevTplXoy5PAEFoDD+4dr8RVfKtq3a0U2F9aETeIczNesGbn2RaaxMI5oA4cDjURTVuwT9cIgP0r9rzosVlVTc7uuV1o7ydmL/IHCmCy0T1X2yunNEH7yNPB+YvzH0jt/FwIR3X7YwsiWtUbYd4YXbEl11bUEFGx26F+y5VWFKg9eEwVSOijBw2mYRIw8GTUcmKoqq9gXueN5RpCzmCLUZVNCidJmQO6pHs41i2JOAQ2eIkOLXEYmob6DjmCT1ymVJ07ETUmqmAlL1u5il1X6kLf4pCS+QeDPXcSTz5OuoDZ1WRH1SKihbFlXjHloSgpb5HC0gp2EAITxo0aDr9FVqUeQUpyVPP/MqsYmg41xaZQTADcTKvRW6lVF9sXO8iPXTr3VqQo6VQjazglGDrWLIdxQPUeYHNH8FCwnhNsaYjeaT27D82gTKkXpoF/PulHJV8hr9UZXlI2HwsWEqH4asHGbhjK812YwMOi0N+Xn7YNrRPGKgFIY/0CBLTNWO+u8ZW7vGD3B+6LmV2PBJgmyWY7EbmO6smT4HcDtSeeuGyleY+15w5Dr8VIdt4+7F8dMxk+PqlAqbO7rAABoSlu5BGSkwXGBOBgLFpk2EInZ+dr90gfsMHJQtgjvBv3z5aN9koHIVbwAgEeE/XpZA4ssgKtcXCmfbi3UTQaC
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FRVP281MB5895.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(52116014)(376014)(1800799024)(3023799003)(56012099003)(18002099003)(55112099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N2NGS0paVjBucUxGc3J4TUNEUllxTnM1V3BPOGROMVlTSy93bklxTEFHUFo2?=
 =?utf-8?B?RTRtVUEyTzdLWC9sRTNxL29iVkg4V21QbW9wUm1zeHBxUUJoYXVqWmZRRzZ4?=
 =?utf-8?B?amlkbE9scUV0dWYvb0x1bC9LWnA3SWMrZVhKUkxYOC9jWkZtZlBIT1g1TWpr?=
 =?utf-8?B?Z0theVRLTHQzNFNtUjhMQjNtZFZCTHFmYzF4amQzS2EwSkIvZTFzcEw4bHBP?=
 =?utf-8?B?WDd0QzFIM3NDckJyczZBUmRhWjhNaWh4OHd4WnAwdFA2bmllSUdmblhIQW5t?=
 =?utf-8?B?UzBEWVpNTzRsY1RVMXB1TTMzRVJLcXF2Tk5RYUd2ckJ1Z0tPUy92SXUyS1JV?=
 =?utf-8?B?SkdEM1hBMXAxTnBCZGRvT3NjUGk4dm9WZ0dsSjhrcG9tRFBJOWZJN29wQmE5?=
 =?utf-8?B?bTJldmtRdG1uaVVLNlBRWm1uV29NTmhXR2hEZ3Y1c2c1SlJSNGk3NlMzcjNS?=
 =?utf-8?B?aDJ0SDNUa21ldFNUanZKYUJRMHA3aTZHbHEwUjlFbHQrOWJNV2JnNmxqNmdp?=
 =?utf-8?B?OVh1V2NQeDVlVi80UTFSVFdGZFM2a0dFSDZ5WTFiQlV5MHNEUmtLMm5wdUlw?=
 =?utf-8?B?V2hpOWhSNE1DbEw2WDJYK2Jja0NaMWs3cGE3ckk0eXhobGthMTYyZW81NHRK?=
 =?utf-8?B?SG9vTkpmNEF5bFUzbzFLUVo0cENaT2Z3dmRoajdieXF5T2dxNmN4NkZPSUJV?=
 =?utf-8?B?SFRRUldqaEZSU1dTRk9lMXlFOG1uRVVEWGlzZDdJNjk2MDNBVjkwSmQ2QzRv?=
 =?utf-8?B?QzhIa3IvWFZyQ3ljYTJwNUFWYU9Eb1NBMGcrcVVadG1WejI1dTFIYnh0N0lO?=
 =?utf-8?B?M0ppTWNhSlVZc0JxaXp5WjVlZyttTDRhRXNIc3Z2aEFObWx6VldNZ2dMZndz?=
 =?utf-8?B?R3VPU3N5OGQxK2RKdHFXYnZBdk94bXpyK2RVa0NYS0lPS2wxM0dRZWVpdGhV?=
 =?utf-8?B?Z3A2S0FubHJoYURvU2FkenpIakdpekdhUFg4cW1yNE1qQVdRc2VCWEgzRVk3?=
 =?utf-8?B?dFZvRzZBcGV3NkpVc3ptNVB0UDVLL1BFaWFQT3RwNUFpTi9jUTdEZUFGdjJy?=
 =?utf-8?B?OXRZSTI1U0ZUUFRaeW1wdzEzbnU4aEZmVDM5WUV0bHl3VlNzTm9pdGRrVi9w?=
 =?utf-8?B?RFBKNGpoSWdraWZIQzVram9YU2phalBmaDUrOFpNTVptNjYwdWxnYU5ZeUto?=
 =?utf-8?B?TGdNS1M1U2lOcVY2MTNwMnBCOXlQZnRnOWE0UmRaeE1TYUJzdTJ6MnRNckhx?=
 =?utf-8?B?NnRMOG5QZTZ6RjlRaWJQQVUwcUtIK1kyUWxrM0svcmxXSEU5bU14ZXlkb1ZE?=
 =?utf-8?B?c1BjRXV1UmZoUlZXT1N1S1VXdldyQ2xwek1zNXRGR3J5VVJyWjJ5R1l1b2lF?=
 =?utf-8?B?T0doZWNHM1AzaWNtNzdpRjc2MFZRZFJ1WGNSTDRwSEpuclVoT2hHVEZzZ05L?=
 =?utf-8?B?SXErVmo3QTJhSkxSR1RPcUJMakNzUFg0citvWEVMSzBnVXhDM2llTEU5em40?=
 =?utf-8?B?ZWRBL3FvdFNNT3BwUWtlT1E2ZWFzOEV3MXIzVVZoejFtNUZIU2p0VkduS2Zk?=
 =?utf-8?B?QkFsVnpPbkJMK1hmUzY4NUJFM2xLd3dGR0lXZFhDcWY5VjU4WkZiazZVU1lU?=
 =?utf-8?B?Y0NHTWxDWkZkSlh0VXlwL2p3WUNUS2dQdzRRTEUxQ2xtbE1sZ1EzUENXcWRF?=
 =?utf-8?B?MUV5a0pFU1hlaS9kVzFxU1FGYzJDRk4yWThUNDVZRjNuR0M1NWsvSkJFYkRY?=
 =?utf-8?B?SlpaY0Z0VGhjU2JJdng2YTZ4eWpMUUhqS0NWY1ZQSzhObTFNLytCenNRakx3?=
 =?utf-8?B?cnN6VXk5UGdabm5SbytPMDBLQThkSXBja3lqOFFhUjYzWVVNOEtsbXJwdnVM?=
 =?utf-8?B?aVViaWdXL2k0WTRMeFJFNmhGOXVsMEZEUWFlMHVtWXFjMHk0T2lEcGx4a2Qv?=
 =?utf-8?B?NlFTUjBSUllNUzljc1lPNkRSMSsvdkFsZExaVzBJekhFeUM4UzlTajNVZ090?=
 =?utf-8?B?bzlaRmVTSC9WakpKaVA4K3ZKWEJSZ0FwS1BaTnpQeXNrVTZzVmhOdytLSVlZ?=
 =?utf-8?B?REkvL2dESHZtdmV2TjdvQnlPWHhUZStseCtYRUZLUGwweWxvRkJsSTZlUmJt?=
 =?utf-8?B?Q2V4Q1RSblNFNGhwN1EzZUhBVkxzZDYycXJ4SXdlYnRZUnp2SnljUTUzYVhk?=
 =?utf-8?B?TWwwVURYRUJjaWxZMGZVaW1LVkdlOVdSNUtKSTc0VXF2RE5ReCsyVGZQV2dR?=
 =?utf-8?B?ZTErQ2c1cEZnTytEaGJiRDV0SWdmWCtQSVovYm5jQVQyeFFrT0lCc0NnNVVo?=
 =?utf-8?B?RTRydzRDR1VDZ2ZocDFPelc2OENtN0JWZjdKYXhEd0ZRNUxZZk9pNXQrSSto?=
 =?utf-8?Q?ayuifLfscEfiSVMo=3D?=
X-OriginatorOrg: Arctic.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 640a100d-9e6b-42f1-d2d6-08deaccd43eb
X-MS-Exchange-CrossTenant-AuthSource: FRVP281MB5895.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2026 06:44:34.8581
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 51cc2c5f-af21-4667-81ec-d88d36e264bb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oJ6Ru+L30D8fwVIWmenKdhqS9w/lhwkH+GMiOxq4htWuxWpIzzKO6q4w+TxPx9l2NbhPRMjPTNYYi8PHZcCAnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BE1P281MB3138

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
Resend of v7; rebased on top of hwmon-next to fix the context
mismatch that prevented the previous submission from applying.
No code changes from v7.

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
- Add completion/ACK mechanism for OUT report acknowledgment
- Add Documentation/hwmon/arctic_fan_controller.rst and MAINTAINERS

 Documentation/hwmon/arctic_fan_controller.rst |  56 +++
 Documentation/hwmon/index.rst                 |   1 +
 MAINTAINERS                                   |   7 +
 drivers/hwmon/Kconfig                         |  12 +
 drivers/hwmon/Makefile                        |   1 +
 drivers/hwmon/arctic_fan_controller.c         | 374 ++++++++++++++++++
 6 files changed, 451 insertions(+)
 create mode 100644 Documentation/hwmon/arctic_fan_controller.rst
 create mode 100644 drivers/hwmon/arctic_fan_controller.c

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
index 595350bfc0..3cb9228f08 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -43,6 +43,7 @@ Hardware Monitoring Kernel Drivers
    amc6821
    aps-379
    aquacomputer_d5next
+   arctic_fan_controller
    asb100
    asc7621
    aspeed-g6-pwm-tach
diff --git a/MAINTAINERS b/MAINTAINERS
index 9fa9702d34..b9f5fe6d1b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2064,6 +2064,13 @@ S:	Maintained
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
index 14e4cea48a..997bba56fe 100644
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
index 982ee2c6f9..efbd1cb818 100644
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
--
2.43.0

