Received: from FR6P281CU001.outbound.protection.outlook.com (mail-germanywestcentralazon11020096.outbound.protection.outlook.com [52.101.171.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E13EB3BED08;
	Wed,  1 Apr 2026 15:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.171.96
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775058081; cv=fail; b=c3IYf/EUqaSbMT3UUvJ4UWWtwLmeXr8xaMgp9+4bICCE+1H6K8Si1ZsoeUrvI6XCJ6YzayO0QxApeuR55R0GHtPMO2ep7CdwoRlk1GRKik7ToDbMUf8pqoFKrV0nm9QqhiY2L0ije2jgScnPBzCjN2XRd6b/pnJyNz2aZ+ezcyY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775058081; c=relaxed/simple;
	bh=wXxFSa5GWL1DE7Wda07EH8V7rprCeZntpYG1MNaYTpk=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=bO/wYbX1J5B/DVljszU332k2Q+04g2BxB+VtWOqzuudRAF+8eA2tIjIYnokug8/ViWa37/CAFQJ359Cs+hpawa3wx4rnxlasB7Fjx4U+s21P91r+jGLTW5ph6q4RV78LvH1RTjDgn5saTPzMJTCGSiQDd/4FRLS3qRVn/ycTSJY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arctic.de; spf=pass smtp.mailfrom=arctic.de; dkim=pass (2048-bit key) header.d=Arctic.de header.i=@Arctic.de header.b=LfoJtCZT; arc=fail smtp.client-ip=52.101.171.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arctic.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arctic.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Arctic.de header.i=@Arctic.de header.b="LfoJtCZT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PaUDQ4cpk+/Sywgup7OrNy0cTDXpfHd83XvnUSz3bucULwmrFBhvzQiPe5Kmx1xFHqHEu8E92LmzBLAlb/yYRkKntpkwiQ8YwdvTgVgsKUyDEGb8GwvboTXvsBqJpq+wQoC5oQGQGyoz/jTT4+m82oR06U9RHkCcn7oH8mtrsfRdrEeJugVq3Bz/TqCxGY4ily4WLEfm9XuAfmfUxcIkavJbBhBA5f/d40tPwzkMWYP5hZ5K8gJ069gvepn92POszDBt+3AJn7l5VtPY1dz28BrKGLFNCO+H50jT2eHaJYFG0FchG7vfbYP0/nqyBvoAeuVCWNxP2LHnNF7RwHCH0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X8O1fYe3YDs0AuxtHDeKs0sVKzLrMtMaKcxs0nXXd1A=;
 b=RwM/kTyadRAEUzszHIi1p44v2fXg/XWIpFrR95JPe7Jwo/mdjW+YBi8PPy8V18soJwVuxhc9/tMTQiSXwPdOKOip/AFUVXhdmLv6JAOGFiaITrYl06xN9iexnLYQYbJVdGtnDvCs8FLIVCquUKb0EDdGF852nY3R9k1kc+QxMqZ91ym2p9qW67fgJicpvyt8beWfBhKOSHbChHEa5RE+IHaR4wlq+NMlgLjPKdHUmzhh++AmX/JVA/hho1eqjWBJKNytvSGP5SBrcMYrp941mMih5eUK/Czc/xwvPHZutl9kPLCW1tycyEslOZ6q2BA2XH3w2KH7iO0VcJpIEtifhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arctic.de; dmarc=pass action=none header.from=arctic.de;
 dkim=pass header.d=arctic.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Arctic.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X8O1fYe3YDs0AuxtHDeKs0sVKzLrMtMaKcxs0nXXd1A=;
 b=LfoJtCZTsW5sXt6eko2T+J0NpVn7cyh++ibeJDBEqNzOsKn5BDaedHT1kNcg/Ius7lkk4hw7qs8qLxvr3+koH4PEpBjRGvAg6XSQeK/YCo++OzUqao5khQKTWAagz6s4jTzfh4JiAMvVKpg2KOaOhDU3QHsdyqSiXWN3BHrkpvssUf3ZWFzJhmsXSUluKuK/lnU51YZnqakaD6Wqb8pxxMUivcx+CT15t2ShxcrpPQQHk5EfEuIXPRdishge/FzYNjUC4/KalmYUIYXIVH/Ve4DBs6P3Cb1izf4MTdz/Su+Pq0UMhqlCbYWVLUSw69Dp1/N8QYtt5Z/F8RCjwBUv5w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arctic.de;
Received: from FR6P281MB5900.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1bf::9)
 by FR5P281MB5287.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:198::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Wed, 1 Apr
 2026 15:41:14 +0000
Received: from FR6P281MB5900.DEUP281.PROD.OUTLOOK.COM
 ([fe80::7eba:ac95:a60d:521c]) by FR6P281MB5900.DEUP281.PROD.OUTLOOK.COM
 ([fe80::7eba:ac95:a60d:521c%3]) with mapi id 15.20.9769.014; Wed, 1 Apr 2026
 15:41:14 +0000
From: Aureo Serrano de Souza <aureo.serrano@arctic.de>
To: linux-hwmon@vger.kernel.org
Cc: linux@roeck-us.net,
	linux@weissschuh.net,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aureo Serrano de Souza <aureo.serrano@arctic.de>
Subject: [PATCH v6] hwmon: add driver for ARCTIC Fan Controller
Date: Wed,  1 Apr 2026 23:39:47 +0800
Message-ID: <20260401153949.77488-1-aureo.serrano@arctic.de>
X-Mailer: git-send-email 2.43.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TPYP295CA0036.TWNP295.PROD.OUTLOOK.COM (2603:1096:7d0:7::8)
 To FR6P281MB5900.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1bf::9)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: FR6P281MB5900:EE_|FR5P281MB5287:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e82b7d2-674b-4d3f-dddd-08de90051b6f
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014|18002099003|56012099003|55112099003;
X-Microsoft-Antispam-Message-Info:
	iz1TDzLrc/6o8wt4NMirRB6zdevTaZa0LzcHee/mVGDVP4Zxkr5qpsJYRzmqhZpIunqhmGyS3kQ1JD3GtHQWk2ktodI/qLUD00OCLMeHZ/TPwevCyl1XzwVdWBcxKXe0lDnrnERJswuANV7Uqh/yiFsTbPcC7406BaU9I4dHiDg+khBVad7NQ9sPr+mUv2v0TtCUyY7uiRdDtgkhUWXHS1f5Jy1NQ3MfdLidjouWxtR85VoFjO7BnhWbeKfw4H/lzlBmpVSVgHCY/yqhz6dmPaNKTgnCwtczyB725buvrJHm1ySMRBDP/uPU4pzwaUY0dcg+wq5+mmCE7tHhrIr01RzjZg0gkCrESMYQ87Z6Ls/SJZXzqpKLVi3o555s6gz9Js3wFIYdUA8PDoZtWnTNMxGuOxgVolig8It2fFzd9h57k7GpAwYP7SkLPL8X8yn0P7AEETc34FXT4uaoaVRrJBS0peWThk7PIcW0LzlW/SZYhEjm7Stb/braT9qAcyJtbzkF0+jjq0KkgG/yhFn9nYPfR1EIfmaGVky98pL8QMi+MarGWySJ4BzjHWp3zNQdcmq+BXksBIYhEh+Xmm80UV5rlOnkaYX8Ohe2tBGSV8rXbn3OEJSm14oHvCy5iuKkxWRtllehHyi1olrV1PAeEsb5hjaIvK5qAGVrFXDW0Bwsrh6xloGIcxadOwp0//IldEwQ0SW8Tp93l0htmDohGQHItwtGhaTHydsofUYNZGg3zBZ0KuGurkn273TMGbHYnOdJWIpSmUokgf+a8bLfGBcewJL/B/Qwgp5KG12Q1po=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FR6P281MB5900.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014)(18002099003)(56012099003)(55112099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QUFyekd2TllXcENzNEoyNS9GQmdjUzBSMDJERSt5K2EzeURQK3RzbG9wYnkz?=
 =?utf-8?B?TVBwOHcva1EvdUhjU0FOaVhrbFU0aW9YWGFZeDBaa2xTaHhWd2I4ZlVzbUhM?=
 =?utf-8?B?R0JmVzZOcHl6aGRsWXR1Ym5hUXNJTHo0OEdUWjI1SWxRaHdZL2EwNWtFZTgv?=
 =?utf-8?B?aVZJTEhOZjdWNFRhTEdsOXRNSnpNQ3JvbDhDTDRNWXFjYW9GSXNZWHlzSXp3?=
 =?utf-8?B?VXBrcHc3UEoyeWJrYXJFRnJmdUpKRWRjMDN2amQ4UUZJM1NxbkxUTzBZQTUv?=
 =?utf-8?B?My8yNFdBMGpXeUh6VitqY29YQXFwWk02eWdLRkMrT1VNY2VmaGtpWHYya0lV?=
 =?utf-8?B?b241NWJlZC9NSkNndDRQTEFJSnd4aHl4ZDRseFd3TXRjcmJvVVFDOHN0T2pu?=
 =?utf-8?B?eDJXUkxQakpHVjVDeEVFUHN0Tm1KSFZrTXl3VVM0YjBxV2hFYzIrNTJKY0Q0?=
 =?utf-8?B?Yy9QTlViWmVFUU5nang2N09wZXdxTTFvK2wrcXI5VmpBdEZMRVZLb1dzMXY3?=
 =?utf-8?B?bnFoU0ZuaktRMkNRYTU5aWJIQ0RwcEhpbWwwWEx6UTJBZjBFaVk3Rm42Z2N1?=
 =?utf-8?B?ZWhDcTE4VVVSVGVaQk1OR3FoWmJNTk9EZ2llTnM1RCtxS25RL25WWkp3T0Ri?=
 =?utf-8?B?ZnNldHppTkRsL1hLS2VFTnRrY1RVenpKUTJlY2E5dDBBOHp6RXNydGJIeGth?=
 =?utf-8?B?VjZTb0k2cEdZQmFMcUN4TVdCcWV3M2J5T0x3bDVyREIxblZ5M0hZS3N6Nmcx?=
 =?utf-8?B?ekwyWjI5Z3lMSVdFWjdWdnRsUnM3eFpyOVF1SWlRV3dta3RPa1BTRmE5aWVD?=
 =?utf-8?B?K2hrdklVZkxuaWtRUlpDdWVzVDJuQTNKRVowTk1DNW41MGIvUFJYTG5TQXZU?=
 =?utf-8?B?Qy9uTStiNllXZjI1dzhzYitXN1R0ckt6WEZuNTZSRmpZdGRjUmdsYUxFYjlz?=
 =?utf-8?B?b29rUEt1bDZPQzNxaGN2bnYzMnpjQnRhZFB4TG9TeGZjNnJ1Q0RSYm5sblBT?=
 =?utf-8?B?NzFrVmtheDVCSE1wRnBCYXVXWjVKMHREVG9RQm0yMStFWllka1FUM2c1TnBO?=
 =?utf-8?B?Z2RDYjB0NlVIT1RBZ01qbUJKQWhLNlRNc09iemtlUGVsR3NYMHBzaWZwT1V2?=
 =?utf-8?B?aE5pUXdRemc3Q2dKSjFGR1M5ak8yMjN6UkMxZGdFQjJwTWc3cmV2YVMyVFFK?=
 =?utf-8?B?T3BHZ2Q3ZlhqeFVPcTZpWDlwVUVaa3hWdjAxaGd6eW43S016UC85TWgxN0Ri?=
 =?utf-8?B?cDNsY1A4ckFYZ29rbFMwOWluU1c0VUF0cVhlZjN5R0VTYnVicFZzMmpBRytq?=
 =?utf-8?B?c1VodFVDTGp2Mjk5OWdSM0dUYVpoL0JhaUlwRzFZay9obnhYQUtObnhVeU1N?=
 =?utf-8?B?M0FKOEVNT280b3BlRmFZcW5NQlBGN1l5ckZ2L3lmT1dQTFp5ak9TL3VjU2M5?=
 =?utf-8?B?d3BFTVZQSjF1K1FrRmNrcW1SV05GU3VFcUFGRmZoeUVyUTFqSmpsMk1pTHF5?=
 =?utf-8?B?TFRsbFQxN3d5enpEWVVJV1RGY1k4Q3U1Z0VPOWFRSXRrSXRrYVhPb3YvUHVP?=
 =?utf-8?B?Vng1ZHdzSWtMTVR6Y0k1VWhOMDYydEZ2cXUxQ2hXRk5oNWVKemZ6ZnZoT3h5?=
 =?utf-8?B?RXlKdll3Tklna2lkMEUzcm1nZDh1VHludmFrcmk2RlFOMUE0N2xOaEZjd3dv?=
 =?utf-8?B?Y01CWnZJcFAyTzRwQ0NyMWdFL3ptOE5JZi9ZbkMxOU5HdDZ0bFZEUkx2Rm54?=
 =?utf-8?B?T1pVM0JzYzM1SjdVaHZwczdBNUMrNmxmODRBQTN5bGg2NHo4NS9zdG5tSjJp?=
 =?utf-8?B?cWRUYVdhcTgzd21HOFJkOVA5VURuZ2NVR0tibmcyQ1VFMW9PWTV0TkY2ZUQ5?=
 =?utf-8?B?ZnFoalEzTTVHMzByU05pRERxSC9TU3p6WnNiVDF3NURPNWVvQWptOUVDNlRY?=
 =?utf-8?B?WEE1cDRXakR4Wk5BQ1BtUWVhUTVUMjFCK2xtSjN5cE4zWmJaek1YYUNOL0tG?=
 =?utf-8?B?UmtZVkdXQTZRbE43RXVIeDZ6NWFPUGx1cDZzMmd2TFp1ZzR3RUtvZndPK0Fa?=
 =?utf-8?B?RUFpcXFDZjNiZ3dBcVJqTlNmMC9GcVZzcG9mMFhWS1E4bk9WY04rQ1NVeXdV?=
 =?utf-8?B?T3A4a3J4bS9xMWY4SFAycndZMGhsU0RhdmJGRzE5TjlORGh0R04veENBZWxT?=
 =?utf-8?B?Vm01SWF3S1hFSkhrYWJQei9RVHVWbThSQkRKUVJGSXpsNFF4QTl2bWIxSmRL?=
 =?utf-8?B?dnN6UVRDVnJmYzlSaW1iRWNlczI5bTF6cnBYdmZrTk56dHhBNkZUZEdXdW1y?=
 =?utf-8?B?YVR4a1RFeFNNaGVEcHZoazczUTdGbHkzK2Z5MGtxN293R05mald5blA1WnNO?=
 =?utf-8?Q?pRcNWuXUZfq+NDUE=3D?=
X-OriginatorOrg: Arctic.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e82b7d2-674b-4d3f-dddd-08de90051b6f
X-MS-Exchange-CrossTenant-AuthSource: FR6P281MB5900.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 15:41:14.5633
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 51cc2c5f-af21-4667-81ec-d88d36e264bb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vOf9yvi9jMkbL21u1vvxZ2qGe9siuNhRzXQOnYKtnVmtP+CwfenyZn75XWDPGAGHzJup1tj7QtJnc30SiR+8/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR5P281MB5287

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
index 0000000000..2bfb003f01
--- /dev/null
+++ b/drivers/hwmon/arctic_fan_controller.c
@@ -0,0 +1,370 @@
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
+	struct device *hwmon_dev;	/* stored for explicit unregister in remove() */
+	spinlock_t in_report_lock;	/* protects fan_rpm, ack_status, write_pending, pwm_duty */
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
+	 */
+	hwmon_device_unregister(priv->hwmon_dev);
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
