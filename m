Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB6663C4552;
	Sun, 18 Oct 2026 22:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792363853; cv=none; b=Za8GaW8q7/HhqR36ZJxXLBnaURnH6oSynhBi3VpSRWYTERbpjch8D76cuyqr++tmSOYp+pitC1h1CUZkNnBjtMoozqSf2almiBEF4P5RGr7xDeZ19yCCzWTHF8y3A2+OWF25Pl14qreZM3dVGFUwcnaY5IGpqb7DMqP0ebTT2LY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792363853; c=relaxed/simple;
	bh=JucXh2R3LUv3Cy0baZFfHCfh14scPTkL2FHNihynNOA=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PsD+hySV9z8//SHB/7JbR9MHZuncv/RYuNYDUaKKUEIecGoOaqVCEbTih1KEgC1PRW1zUcWck51PEfs5XBMYkByMw5kHuwZHB0sZu3Btuag6hMxe6pBnRTHVm7E9MewPK/ie8NxqdTBBN//GDgV47tBNBLmYZbqvatUnA6q02Dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KS2TlufD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KS2TlufD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B77941F000C4;
	Sun, 18 Oct 2026 22:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792363849;
	bh=27mD6PXalQwErPLfGWpQVxDkYblAb82bYZGv+kZlX3I=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=KS2TlufDBJa3tSJVebsHe3kBVqsI63aErrSXObnMgDTxs87JtyyDk7UAzNnMLOZoR
	 Dv7qUHeVzQT9ktaQXpRNaiN58bALf8fdblKWLq57iezXCaKiyyBLqWd2gmQn1x4an0
	 LOEJmc3IJUeBDAh/du4SoYQikqer2UPIid03SNOPpW5hc3DuVfEPp/Alpjtf7hdESg
	 jHXEGvKFX4iGSRwMDaM6ZaSO1ltnBEInf+w/CyalRX5zTz53/5bs5ZyO04GvfZMXl5
	 B0EEbvMa9NVbdATQ9b4jjswrN3lbmxv81AJlVG+GHmsn8fuArgzSGBp1cvnkU2xWZj
	 C2IbA76SdjeQw==
Subject: Re: [PATCH net-next v4 6/6] eth: fbnic: derive the alarm range on
 older firmware
From: netdev-bot+sashiko@kernel.org
To: limzhineng2@gmail.com
Cc: alexanderduyck@fb.com, kuba@kernel.org, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, pabeni@redhat.com,
 linux@roeck-us.net, horms@kernel.org, hmohsin@meta.com,
 mike.marciniszyn@gmail.com, kernel-team@meta.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, zinclim@meta.com
Date: Sun, 18 Oct 2026 22:50:48 +0000
Message-ID: <179236384833.3135.4769313684458949765@kernel.org>
In-Reply-To: <20261014222225.2803660-7-limzhineng2@gmail.com>
References: <20261014222225.2803660-7-limzhineng2@gmail.com>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 3 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] fbnic_fw_parse_threshold_exceeded_resp() decides whether to
  log at dev_err level from the raw firmware attribute (`alarm !=…
- [Medium] The new legacy-event path computes the hwmon alarm by
  comparing a reading against thresholds in software, which contradicts…
- [Medium] Once fbnic_hwmon_old_notify_event() has cached a range for old
  firmware, a later FBNIC_FW_TSENE_ALARM_DEPRECATED event without a…

--

eth: fbnic: derive the alarm range on older firmware

Older firmware sends threshold events with the alarm attribute hardcoded
to FBNIC_FW_TSENE_ALARM_DEPRECATED. With this patch, the driver derives
the range from the reading in the event, using the capability response
thresholds, caches it and notifies hwmon pollers. If the thresholds are
not known yet, the cache is left unknown.

> diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_fw.c b/drivers/net/ethernet/meta/fbnic/fbnic_fw.c
> index 9485665cba467..cfec30e5cb988 100644
> --- a/drivers/net/ethernet/meta/fbnic/fbnic_fw.c
> +++ b/drivers/net/ethernet/meta/fbnic/fbnic_fw.c
> @@ -1737,8 +1737,13 @@ static int fbnic_fw_parse_threshold_exceeded_resp(void *opaque,
>  			dev_err(fbd->dev, "Thermal alarm %u, temperature is currently %dmC!\n",
>  				alarm, value);

[Severity: Medium]
On old firmware, alarm is always FBNIC_FW_TSENE_ALARM_DEPRECATED (1). So
the "alarm != FBNIC_FW_TSENE_ALARM_NORMAL" check above is true for every
event, including the crossing back to normal.

With this patch, fbnic_hwmon_old_notify_event() classifies that same
reading as FBNIC_FW_TSENE_ALARM_NORMAL, caches it and wakes pollers.
temp1_alarm then reads 0.

Won't the same event still print "Thermal alarm 1, temperature is
currently ...mC!" at error level? Here the 1 is the deprecated marker,
not a range. The kernel log and the hwmon alarm attribute then disagree
on whether an alarm is active.

The voltage branch has the same check in front of "Voltage alarm %u,
voltage is currently %dmV!".

Could the log decision use the derived range instead? Two ways would be
to classify before logging, or to have fbnic_hwmon_old_notify_event()
return the range.

>  
> -		/* Old firmware reports no range, leave the cache alone */
> -		if (alarm != FBNIC_FW_TSENE_ALARM_DEPRECATED) {
> +		if (alarm == FBNIC_FW_TSENE_ALARM_DEPRECATED) {
> +			/* Nothing to derive the range from, so do not guess */
> +			if (have_temp)
> +				fbnic_hwmon_old_notify_event(fbd,
> +							     FBNIC_SENSOR_TEMP,
> +							     value);
> +		} else {

[Severity: Medium]
Old firmware can send an event that has FBNIC_FW_TSENE_THERM_ALARM but
no FBNIC_FW_TSENE_THERMAL. What happens to the cached range in that case?

This branch does nothing for such an event. If an earlier event already
cached a range through fbnic_hwmon_old_notify_event(), that range stays.
By the model in the commit message, though, every old-firmware event
marks a crossing.

fbnic_hwmon_alarm_read() only derives the range again when the cache is
unknown:

	alarm = READ_ONCE(*cached);
	if (alarm == FBNIC_FW_TSENE_ALARM_UNKNOWN) {
		err = fbnic_hwmon_sensor_read(fbd, id, &reading);
		...

Would temp1_alarm keep reporting the stale value until the next complete
event, for example 1 after the sensor is back to normal?

Before this patch this was harmless, because old firmware never filled
the cache. The driver already expects this message shape, since it logs
"Thermal alarm %u received with no temperature!". The voltage branch
does the same with have_volt.

Would writing FBNIC_FW_TSENE_ALARM_UNKNOWN in the !have_temp and
!have_volt cases let the read path recover? That would match the commit
message's "Leave the range unknown and let the read path derive it"
approach.

[ ... ]

> diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c b/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c
> index 310a2c52bb4df..9fa9eb843c689 100644
> --- a/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c
> +++ b/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c
> @@ -302,6 +302,35 @@ void fbnic_hwmon_unregister(struct fbnic_dev *fbd)
>  	hwmon_device_unregister(hwmon);
>  }
>  
> +void fbnic_hwmon_old_notify_event(struct fbnic_dev *fbd, int id, s32 value)
> +{

[ ... ]

> +	/* Event arrived before the capability response containing
> +	 * the thresholds.
> +	 */
> +	if (thr->min == FBNIC_SENSOR_NO_DATA ||
> +	    thr->max == FBNIC_SENSOR_NO_DATA)
> +		return;
> +
> +	WRITE_ONCE(*cached, fbnic_hwmon_classify(thr, value));

[Severity: Medium]
Documentation/hwmon/sysfs-interface.rst says:

  Alarms are direct indications read from the chips. The drivers do NOT
  make comparisons of readings to thresholds.

Here, fbnic_hwmon_classify() sets the cached alarm by comparing the
reading against the fw_cap crit, max and min thresholds.

Old firmware also sends this event on the return to normal, so the event
by itself does not say whether an alarm is active. The value of
temp1_alarm and in0_alarm therefore comes entirely from the driver's own
comparison.

The earlier patch in this series, "eth: fbnic: report temperature and
voltage alarms via hwmon", already does this kind of classification in
the read path, and this patch extends it to the event path.

Is this consistent with the documented hwmon ABI?

> +	fbnic_hwmon_notify_event(fbd, id);
> +}

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261014222225.2803660-1-limzhineng2%40gmail.com
