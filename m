Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5D03C345C;
	Sun, 18 Oct 2026 22:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792363853; cv=none; b=sNRP302H37It/uiuCKtdojziPKzYVK21JdxcPzsf3LywSukCKL5yO+Lo/1I55mptNhp2igXo+mYFQgqr+THtb+DP8CxY+sLkBoKVuad3nMY4dukzt81lAh1vzhhxq1TafIzxXB7E6+qnDP69sxn5lu5MhPk21Hij/HObYNSMBgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792363853; c=relaxed/simple;
	bh=56ph6YUmmDdJUJ4J4H27XwjPGATI/dmF9kemybCKWSs=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=m/5F/UlZ+JTdpDTMna18EcD4AhzyFmfYwrvw1YDp4PhMI3f4dt+jsGdRQliiXPSfgq3DHBei4B4SRJo2VxDWgQRbTYr1gjLVtCkNH8blhspmMmbM9CJEAi/gpYoxBXJ4caH81va/yYNQN8EOVfU4cdlfFN3iyrN1ArRaq8bdoPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ABvenEW2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ABvenEW2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CB991F000C5;
	Sun, 18 Oct 2026 22:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792363848;
	bh=p332EuKxIA2IxEfH2iz9HPbsFb9O2w7VObiKnnHPMTM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=ABvenEW27XHlrr3XGdaEOPoiweujbKXFUnnv4hbKuV1Ow1yMy+w8PBogPEOt3naQf
	 mVs9JCHut0v7hl3D1NzfcrDjwHjRRwJ/unyrvCgEA6mrifsRB7rsu8X6pYzP+N+bCU
	 iM2gLKqdsFI6mU6/rT9hfJiE57Bdzn/OgjvVMiooVSi3B28lYkPh/JI/0Wc7ND6Plh
	 x3iePWzqyurWA+5gxsBIVk1zjbzXvP35iCU9Ajtly3CdN0LiSV/eJT1p2c0yedkiRq
	 Jj+Si8qHcS9S2izDEEcCZwU9VeQGx5VtGVSTzhN/fyro2S+U0PDX2vTC6wKQJoye6z
	 timg6mU906suw==
Subject: Re: [PATCH net-next v4 5/6] eth: fbnic: report temperature and
 voltage alarms via hwmon
From: netdev-bot+sashiko@kernel.org
To: limzhineng2@gmail.com
Cc: alexanderduyck@fb.com, kuba@kernel.org, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, pabeni@redhat.com,
 linux@roeck-us.net, horms@kernel.org, hmohsin@meta.com,
 mike.marciniszyn@gmail.com, kernel-team@meta.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, zinclim@meta.com
Date: Sun, 18 Oct 2026 22:50:46 +0000
Message-ID: <179236384686.3135.5949938608549155286@kernel.org>
In-Reply-To: <20261014222225.2803660-6-limzhineng2@gmail.com>
References: <20261014222225.2803660-6-limzhineng2@gmail.com>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 6 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 4 · Low: 2

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The commit message says that exposing the firmware range as
  temp1_alarm/in0_alarm means "an excursion that starts and ends between…
- [Medium] On firmware that does not report a range,
  fbnic_hwmon_alarm_read() produces temp1_alarm/in0_alarm by comparing a…
- [Medium] fbnic_hwmon_register() publishes the new hwmon device to the
  mailbox IRQ thread with a plain WRITE_ONCE(fbd->hwmon, hwmon), which…
- [Medium] hwmon_cache.temp_alarm/volt_alarm are reset to
  FBNIC_FW_TSENE_ALARM_UNKNOWN only in fbnic_mbx_init().
- [Low] fbnic_hwmon_is_visible() hides temp1_alarm unless
  fw_cap.temp.min, max and crit are all reported, and hides in0_alarm…
- [Low] The new synchronize_irq(fbd->fw_msix_vector) in
  fbnic_hwmon_unregister() does not check that the FW mailbox vector is…

--

eth: fbnic: report temperature and voltage alarms via hwmon

This adds temp1_alarm and in0_alarm hwmon attributes to fbnic. They are
backed by the range firmware reports on each threshold crossing. When
nothing is cached, the driver falls back to a sensor read, or to
comparing the reading against the thresholds.

Pollers are woken through hwmon_notify_event() from the mailbox IRQ path.
fbd->hwmon is now published with WRITE_ONCE() and torn down with
synchronize_irq().

> diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c b/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c
> index 4df808f850cf8..310a2c52bb4df 100644
> --- a/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c
> +++ b/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c

[ ... ]

> @@ -120,6 +127,74 @@ static int fbnic_hwmon_read_threshold(long thr, long *val)

[ ... ]

> +static int fbnic_hwmon_alarm_read(struct fbnic_dev *fbd,
> +				  enum hwmon_sensor_types type, long *val)
> +{

[ ... ]

> +	/* Paired with WRITE_ONCE() on the mailbox thread. Firmware only
> +	 * reports on a threshold crossing, so nothing is cached until the
> +	 * first one. Read the sensor, whose response carries the range.
> +	 */
> +	alarm = READ_ONCE(*cached);
> +	if (alarm == FBNIC_FW_TSENE_ALARM_UNKNOWN) {

[Severity: Medium]
Can this return a range that a previous firmware instance reported?

temp_alarm and volt_alarm are only reset to FBNIC_FW_TSENE_ALARM_UNKNOWN in
fbnic_mbx_init(). That only runs from fbnic_fw_request_mbx(), at probe and
resume.

A firmware reboot while the host mailbox stays up takes a different path:

fbnic_fw_check_heartbeat()
    fbd->firmware_time < fbd->prev_firmware_time
    fw_heartbeat_enabled = false
fbnic_health_check()
    fbnic_fw_config_after_crash()

fbnic_fw_config_after_crash() sends the ownership message and reprograms
the RX filters. It does not touch hwmon_cache.

The commit message says firmware only reports a range when it changes. This
function only queries firmware while the cache is
FBNIC_FW_TSENE_ALARM_UNKNOWN.

After a firmware reboot, could temp1_alarm and in0_alarm keep showing an
alarm that never clears? Or could a stale FBNIC_FW_TSENE_ALARM_NORMAL hide a
sensor that was already out of range when the new firmware booted?

On firmware that reports ranges, reading temp1_input or in0_input would
refresh the cache through the TSENE read response. On old firmware, at the
end of the series, the cache is written by fbnic_hwmon_old_notify_event()
and read responses never refresh it. The stale value would then stay until
the next threshold event.

> +		err = fbnic_hwmon_sensor_read(fbd, id, &reading);
> +		if (err)
> +			return err;
> +
> +		alarm = READ_ONCE(*cached);
> +
> +		/* Firmware too old to report a range, derive it instead */
> +		if (alarm == FBNIC_FW_TSENE_ALARM_UNKNOWN)
> +			alarm = fbnic_hwmon_classify(thr, reading);

[Severity: Medium]
Is this fallback allowed by the hwmon ABI? Documentation/hwmon/sysfs-interface.rst
says:

    Alarms are direct indications read from the chips. The drivers do NOT
    make comparisons of readings to thresholds. This allows violations
    between readings to be caught and alarmed.

On firmware that doesn't report a range, the cache stays at
FBNIC_FW_TSENE_ALARM_UNKNOWN. fbnic_fw_parse_threshold_exceeded_resp() does
not cache FBNIC_FW_TSENE_ALARM_DEPRECATED events, and the read response has
no *_ALARM_STATE attribute. Every read of temp1_alarm or in0_alarm therefore
ends up in fbnic_hwmon_classify().

fbnic_hwmon_is_visible() still exposes the attribute whenever the thresholds
are present. Userspace can't tell an alarm the hardware raised from one the
driver computed. The value adds nothing over comparing temp1_input with
temp1_min, temp1_max and temp1_crit.

The last patch in the series, "eth: fbnic: derive the alarm range on older
firmware", keeps this fallback. It also adds a second driver-side
classification in fbnic_hwmon_old_notify_event().

> +	}
> +
> +	*val = alarm != FBNIC_FW_TSENE_ALARM_NORMAL;

[Severity: Medium]
The commit message says:

    Expose that as temp1_alarm and in0_alarm, so the alarm reflects a
    condition the hardware raised and an excursion that starts and ends
    between two sysfs reads is still caught.

Does the code catch that case? Nothing latches the alarm, and reading it
does not clear anything.

fbnic_fw_parse_threshold_exceeded_resp() overwrites the cache with every
range it receives, including the crossing back to normal:

		if (alarm != FBNIC_FW_TSENE_ALARM_DEPRECATED) {
			WRITE_ONCE(fbd->hwmon_cache.temp_alarm, alarm);
			fbnic_hwmon_notify_event(fbd, FBNIC_SENSOR_TEMP);
		}

Take this sequence:

    read of temp1_alarm returns 0
    firmware sends FBNIC_FW_TSENE_ALARM_ABOVE_MAX
    firmware sends FBNIC_FW_TSENE_ALARM_NORMAL
    read of temp1_alarm

The second read also returns 0.

The hwmon_notify_event() wakeups don't close this gap either. If both events
are handled before the woken poller reads the attribute, the poller still
sees 0. The KOBJ_CHANGE uevent carries only the attribute name, not a value.

The last patch in the series, "eth: fbnic: derive the alarm range on older
firmware", does not add latching either.

> +
> +	return 0;
> +}

[ ... ]

> @@ -186,25 +266,69 @@ static const struct hwmon_chip_info fbnic_chip_info = {
>  
>  void fbnic_hwmon_register(struct fbnic_dev *fbd)
>  {

[ ... ]

> +	hwmon = hwmon_device_register_with_info(fbd->dev, "fbnic",
> +						fbd, &fbnic_chip_info,
> +						NULL);
> +	if (IS_ERR(hwmon)) {
>  		dev_notice(fbd->dev,
>  			   "Failed to register hwmon device %pe\n",
> -			   fbd->hwmon);
> -		fbd->hwmon = NULL;
> +			   hwmon);
> +		return;
>  	}
> +
> +	WRITE_ONCE(fbd->hwmon, hwmon);
>  }

[Severity: Medium]
Is WRITE_ONCE() enough to publish the device to the mailbox IRQ thread?

fbnic_probe() enables the mailbox IRQ in fbnic_fw_request_mbx() before it
calls fbnic_hwmon_register(). A threshold event can therefore reach
fbnic_hwmon_notify_event() on another CPU while registration is still in
progress.

On this path, __hwmon_device_register() calls
INIT_LIST_HEAD(&hwdev->tzdata) after device_register() and then returns.
The HWMON_C_REGISTER_TZ block is skipped because chip->info[0]->type is
hwmon_temp, not hwmon_chip.

WRITE_ONCE() has no release semantics. Nothing orders the tzdata list head
stores before the store to fbd->hwmon.

On a weakly ordered CPU such as arm64, with CONFIG_THERMAL_OF enabled, could
the reader see a non-NULL fbd->hwmon and still walk a list head that is
zero from kzalloc()?

fbnic_hwmon_notify_event()
    hwmon_notify_event()
        hwmon_thermal_notify()
            list_for_each_entry(tzdata, &hwdev->tzdata, node)

The window is very narrow, but the commit message relies on this pairing to
make registration safe. Would smp_store_release() with smp_load_acquire(),
or rcu_assign_pointer() with rcu_dereference(), give the ordering it
describes? The code is unchanged at the end of the series.

>  
>  void fbnic_hwmon_unregister(struct fbnic_dev *fbd)
>  {
> +	struct device *hwmon;
> +
>  	if (!IS_REACHABLE(CONFIG_HWMON) || !fbd->hwmon)
>  		return;
>  
> -	hwmon_device_unregister(fbd->hwmon);
> -	fbd->hwmon = NULL;
> +	hwmon = fbd->hwmon;
> +	/* Pair with READ_ONCE() in fbnic_hwmon_notify_event(). Publish NULL
> +	 * and wait for any in-flight FW mailbox IRQ handler to finish so it
> +	 * cannot dereference the hwmon device after we unregister it.
> +	 */
> +	WRITE_ONCE(fbd->hwmon, NULL);
> +	synchronize_irq(fbd->fw_msix_vector);

[Severity: Low]
Can fw_msix_vector be 0, or stale, by the time this runs?

hwmon stays registered across suspend and resume. It is only unregistered
from fbnic_remove(). If __fbnic_pm_resume() fails, a later remove can see
one of two values.

The first is 0. fbnic_pm_suspend() calls fbnic_fw_free_mbx(), which sets
0. It stays 0 if fbnic_alloc_irqs() then fails during resume. The
err_free_mbx path also leaves it at 0.

The second is a stale vector, when __fbnic_fw_enable_mbx() fails.
fbnic_fw_request_mbx() frees the IRQ and still stores the vector:

	if (err)
		free_irq(vector, fbd);

	fbd->fw_msix_vector = vector;

fbnic_free_irqs() then releases the PCI vectors.

A later fbnic_remove()->fbnic_hwmon_unregister() would then call
synchronize_irq(0), or synchronize_irq() on a virq that may since belong to
another device.

free_irq() has already drained the fbnic mailbox handler, so this does not
look like a use-after-free, only a wait on an unrelated IRQ. Should the call
be guarded with if (fbd->fw_msix_vector)?

The stale assignment in fbnic_fw_request_mbx() itself predates this patch.

> +
> +	hwmon_device_unregister(hwmon);
> +}
> +
> +void fbnic_hwmon_notify_event(struct fbnic_dev *fbd, int id)
> +{

[ ... ]

> +	/* Pair with WRITE_ONCE() in fbnic_hwmon_unregister(). Skip the
> +	 * notification if hwmon failed to register or has already been torn
> +	 * down.
> +	 */
> +	hwmon = READ_ONCE(fbd->hwmon);
> +	if (hwmon)
> +		hwmon_notify_event(hwmon, type, attr, 0);

[Severity: Low]
Can this send a uevent for an attribute that does not exist?

fbnic_hwmon_is_visible() hides temp1_alarm unless the temperature min, max
and crit thresholds are all reported. It hides in0_alarm unless the voltage
min and max are both reported.

fbnic_fw_parse_cap_resp() parses each threshold as an optional TLV on its
own:

	fbd->fw_cap.temp.crit =
		fbnic_tlv_attr_get_signed(results[FBNIC_FW_CAP_RESP_TEMP_CRIT],
					  FBNIC_SENSOR_NO_DATA);

fbnic_fw_parse_threshold_exceeded_resp() calls fbnic_hwmon_notify_event()
for every range other than FBNIC_FW_TSENE_ALARM_DEPRECATED. It does not
check visibility first.

hwmon_notify_event() calls sysfs_notify(), which does nothing for a missing
attribute. It then always emits KOBJ_CHANGE with NAME=temp1_alarm or
NAME=in0_alarm.

So firmware that reports ranges but omits, say, the TEMP_CRIT TLV would
produce change uevents for a sysfs attribute that isn't there.

The mismatch remains at the end of the series.
fbnic_hwmon_old_notify_event() checks only min and max, while temp1_alarm
visibility also requires crit.

>  }

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261014222225.2803660-1-limzhineng2%40gmail.com
