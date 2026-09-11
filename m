Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AEEA3F4DE2;
	Fri, 11 Sep 2026 04:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789102723; cv=none; b=Gp1NCBuBrTTG8rFGN4WKZzqKRHhrGzoKHZezQoVXcIHLjK2Rp6P7Q4Gz+3wCw47MyziP6z4QOK12c9uvut1b+VeTAG9CYefGoervPFYTzC1nBZ0UAJIvMXkB483LP44gRRPDNC1ieVa598olvN7USkcOCQdANDRZ9+w9CVdQxII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789102723; c=relaxed/simple;
	bh=nbSWmJfP5ITQ4Rj7cX0eODGXaPQAwd6Rmj1d24RdDbc=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lb/WIJru+Vp6DERzE9yFNc91MhnHEIswTt8P5INAuwRWHNMgmSqJPWFHYf2t/OswOWT6ARfMchlyUeWk99aF/1NPBzRPPfiv+cv7H29YrpuTpXaX7JFAf+qNY0AXXenWbcuTw3QDNF5kMZuBlG4EoimxDyPAXu53GX+tOOrjhvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dht5lf7N; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dht5lf7N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F25CA1F000FF;
	Fri, 11 Sep 2026 04:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789102720;
	bh=PTCW1o8sx1p57yZ7X6GT6IbEGRiGJoCqBn62nOwKH88=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=dht5lf7N5eVa33MLTNdxJq6TGE+OPhSWv3KCUXaLWwSC2ue9VdKlAd0TBcmkekuv/
	 A8c1iv6SXmtriOedkcKq5LSnHh1aCg1LZjr4InGlvVDlNPlnB1S3lbDhG5VRfSivRD
	 s8BA6GAyoP5oehanXP9MnmC5bC2ixN/QQzHz15jY3eXem2j4sQ1ojdWTivdl/vcarY
	 J7vVfrTuRz1U2oqC4d8knPKDPksAGFkXTuScWH9DqgTajxRGs8nwstTX0HG6nqvrar
	 pAFKHnSsNisx033whD5dYk6xdBqqI5B2DsnAmLOzB0jxIPHjjARC6uV6pRLuN+QHXV
	 Dqh79eoLJIwjg==
Subject: Re: [PATCH net-next v3 6/6] eth: fbnic: firmware notifies hwmon on
 sensor threshold events
From: netdev-bot+sashiko@kernel.org
To: limzhineng2@gmail.com
Cc: alexanderduyck@fb.com, kuba@kernel.org, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 linux@roeck-us.net, horms@kernel.org, mohsin.bashr@gmail.com,
 kernel-team@meta.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hwmon@vger.kernel.org, zinclim@meta.com
Date: Fri, 11 Sep 2026 04:58:39 +0000
Message-ID: <178910271954.219967.804405505124993424@kernel.org>
In-Reply-To: <20260908225737.3034403-7-limzhineng2@gmail.com>
References: <20260908225737.3034403-7-limzhineng2@gmail.com>
X-sashiko-severity: High
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 4 potential
issue(s) to consider:

Critical: 0 · High: 1 · Medium: 1 (1) · Low: 2

- [High] fbnic_hwmon_notify_event()
  (drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c:248-288) classifies the…
- [Medium] fbnic_hwmon_unregister() open-codes its teardown drain as
  'WRITE_ONCE(fbd->hwmon, NULL); synchronize_irq(fbd->fw_msix_vector);'…
- [Low] fbnic_hwmon_is_visible() returns 0444 unconditionally
  (fbnic_hwmon.c:10-15) and fbnic_hwmon_info[] advertises every…
- [Low] The newly registered hwmon device pointer is published to the
  concurrently running firmware mailbox IRQ thread with a plain…

Pre-existing issues:
- [Medium] A malformed firmware mailbox message can cause
  uninitialized/stale page contents to be dumped into the kernel log.

--

eth: fbnic: firmware notifies hwmon on sensor threshold events

This adds a parser for the unsolicited
FBNIC_TLV_MSG_ID_SENSOR_THRESHOLD_EXCEEDED_RESP firmware message and
translates it into a hwmon alarm notification through
hwmon_notify_event().  It also reworks publish/teardown of fbd->hwmon with
WRITE_ONCE()/READ_ONCE() plus a synchronize_irq() drain in the unregister
path.

No Link: tags present in the commit header.

> diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_fw.c b/drivers/net/ethernet/meta/fbnic/fbnic_fw.c
> index e5669dfd9790..fd96a3962e3f 100644
> --- a/drivers/net/ethernet/meta/fbnic/fbnic_fw.c
> +++ b/drivers/net/ethernet/meta/fbnic/fbnic_fw.c
> @@ -1639,6 +1639,57 @@ fbnic_fw_parser_test(void *opaque, struct fbnic_tlv_msg **results)
>  	return err;
>  }
>  
> +static const struct fbnic_tlv_index fbnic_threshold_exceeded_resp_index[] = {
> +	FBNIC_TLV_ATTR_S32(FBNIC_FW_TSENE_THERM_EXCEEDED_FLAG),
> +	FBNIC_TLV_ATTR_S32(FBNIC_FW_TSENE_VOLT_EXCEEDED_FLAG),
> +	FBNIC_TLV_ATTR_S32(FBNIC_FW_TSENE_THERMAL),
> +	FBNIC_TLV_ATTR_S32(FBNIC_FW_TSENE_VOLTAGE),
> +	FBNIC_TLV_ATTR_LAST
> +};
> +
> +static int fbnic_fw_parse_threshold_exceeded_resp(void *opaque,
> +						  struct fbnic_tlv_msg **results)
> +{
> +	bool therm_exceeded, volt_exceeded;
> +	struct fbnic_dev *fbd = opaque;
> +	s32 value;
> +
> +	therm_exceeded =
> +		fta_get_sint(results, FBNIC_FW_TSENE_THERM_EXCEEDED_FLAG);
> +	volt_exceeded =
> +		fta_get_sint(results, FBNIC_FW_TSENE_VOLT_EXCEEDED_FLAG);
> +
> +	if (!therm_exceeded && !volt_exceeded) {
> +		dev_err(fbd->dev,
> +			"Threshold exceeded message with no flag set\n");
> +		return -EINVAL;
> +	}

[Severity: Medium]

This isn't a problem introduced by this patch, but these new -EINVAL
returns add fresh ways to reach the malformed-message hex dump in
fbnic_mbx_process_rx_msgs(), which can print bytes the firmware never
wrote.

RX mailbox pages are not zeroed:

drivers/net/ethernet/meta/fbnic/fbnic_fw.c:fbnic_mbx_alloc_rx_msgs() {
	...
		msg = (struct fbnic_tlv_msg *)__get_free_page(GFP_KERNEL);
	...
}

and the error path dumps the full firmware-supplied descriptor length
rather than the validated TLV extent:

drivers/net/ethernet/meta/fbnic/fbnic_fw.c:fbnic_mbx_process_rx_msgs() {
	...
			print_hex_dump(KERN_WARNING, "fbnic:",
				       DUMP_PREFIX_OFFSET, 16, 2,
				       msg, length, true);
	...
}

Can this print stale page contents into the kernel log when firmware
advertises a large descriptor length but writes only a short malformed
threshold message?  Would bounding the dump to the parsed TLV length, or
allocating the RX pages with __GFP_ZERO, be preferable?

> +
> +	if (therm_exceeded) {
> +		if (!results[FBNIC_FW_TSENE_THERMAL]) {
> +			dev_err(fbd->dev,
> +				"Thermal threshold exceeded but no value received\n");
> +			return -EINVAL;
> +		}
> +		value = fta_get_sint(results, FBNIC_FW_TSENE_THERMAL);
> +		dev_err(fbd->dev, "Thermal threshold exceeded: %d mC\n", value);
> +		fbnic_hwmon_notify_event(fbd, FBNIC_SENSOR_TEMP, value);
> +	}
> +
> +	if (volt_exceeded) {
> +		if (!results[FBNIC_FW_TSENE_VOLTAGE]) {
> +			dev_err(fbd->dev,
> +				"Voltage threshold exceeded but no value received\n");
> +			return -EINVAL;
> +		}
> +		value = fta_get_sint(results, FBNIC_FW_TSENE_VOLTAGE);
> +		dev_err(fbd->dev, "Voltage threshold exceeded: %d mV\n", value);
> +		fbnic_hwmon_notify_event(fbd, FBNIC_SENSOR_VOLTAGE, value);
> +	}
> +
> +	return 0;
> +}
> +

[ ... ]

> diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c b/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c
> index 11fa8aab0f5b..2dff59bc0e8b 100644
> --- a/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c
> +++ b/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c

[ ... ]

> @@ -213,22 +215,75 @@ void fbnic_hwmon_register(struct fbnic_dev *fbd)
>  	fbd->hwmon_cache.temp_mdeg = FBNIC_SENSOR_NO_DATA;
>  	fbd->hwmon_cache.volt_mv = FBNIC_SENSOR_NO_DATA;
>  
> -	fbd->hwmon = hwmon_device_register_with_info(fbd->dev, "fbnic",
> -						     fbd, &fbnic_chip_info,
> -						     NULL);
> -	if (IS_ERR(fbd->hwmon)) {
> +	hwmon = hwmon_device_register_with_info(fbd->dev, "fbnic", fbd,
> +						&fbnic_chip_info, NULL);
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

[Severity: Low]

Is WRITE_ONCE() strong enough for publishing this pointer?  The FW mailbox
threaded IRQ is requested in fbnic_probe() before fbnic_hwmon_register()
runs, so fbnic_hwmon_notify_event() can load fbd->hwmon on another CPU and
pass it straight to hwmon_notify_event(), which touches dev->kobj.

WRITE_ONCE()/READ_ONCE() prevent tearing but carry no release/acquire
ordering, so on arm64 or ppc64 the store publishing fbd->hwmon is not
ordered after the stores that initialized the device inside
hwmon_device_register_with_info().  Would smp_store_release() here paired
with smp_load_acquire() in the notify path express the intended ordering?

>  }
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

[Severity: Medium]

Is fbd->fw_msix_vector guaranteed to still name an IRQ owned by this
driver when fbnic_hwmon_unregister() runs?

fbnic_pm_suspend() tears the mailbox IRQ down while hwmon stays
registered:

drivers/net/ethernet/meta/fbnic/fbnic_irq.c:fbnic_fw_free_mbx() {
	...
	free_irq(fbd->fw_msix_vector, fbd);
	fbd->fw_msix_vector = 0;
}

fbnic_hwmon_unregister() is only called from fbnic_remove(), so if
__fbnic_pm_resume() then fails at fbnic_alloc_irqs() the driver stays bound
with fbd->hwmon != NULL and fw_msix_vector == 0.  A later unbind would pass
the !fbd->hwmon guard and call synchronize_irq(0); irq_to_desc(0) is
non-NULL on x86, so this waits on a descriptor owned by another device.

There is a second variant on the request side:

drivers/net/ethernet/meta/fbnic/fbnic_irq.c:fbnic_fw_request_mbx() {
	...
	err = __fbnic_fw_enable_mbx(fbd, vector);
	if (err)
		free_irq(vector, fbd);

	fbd->fw_msix_vector = vector;
	...
}

The vector number is stored even when the IRQ was freed, so after a
resume-time failure and pci_free_irq_vectors() the stored number can be
stale and may have been handed to another driver.

Since fbnic_remove() already does:

drivers/net/ethernet/meta/fbnic/fbnic_pci.c:fbnic_remove() {
	...
	fbnic_hwmon_unregister(fbd);
	fbnic_dbg_fbd_exit(fbd);
	fbnic_devlink_unregister(fbd);
	fbnic_fw_log_disable(fbd);
	fbnic_fw_free_mbx(fbd);
	...
}

would moving fbnic_hwmon_unregister() after fbnic_fw_free_mbx() give the
same barrier without keying it on a mutable vector number?

> +
> +	hwmon_device_unregister(hwmon);
> +}
> +
> +void fbnic_hwmon_notify_event(struct fbnic_dev *fbd, int id, long val)
> +{
> +	enum hwmon_sensor_types type;
> +	struct device *hwmon;
> +	s32 attr = -1;
> +
> +	if (!IS_REACHABLE(CONFIG_HWMON))
> +		return;
> +
> +	switch (id) {
> +	case FBNIC_SENSOR_TEMP:
> +		type = hwmon_temp;
> +
> +		if (val <= fbd->fw_cap.temp.min)
> +			attr = hwmon_temp_min_alarm;
> +		else if (val >= fbd->fw_cap.temp.crit)
> +			attr = hwmon_temp_crit_alarm;
> +		else if (val >= fbd->fw_cap.temp.max)
> +			attr = hwmon_temp_max_alarm;
> +
> +		break;
> +	case FBNIC_SENSOR_VOLTAGE:
> +		type = hwmon_in;
> +
> +		if (val <= fbd->fw_cap.volt.min)
> +			attr = hwmon_in_min_alarm;
> +		else if (val >= fbd->fw_cap.volt.max)
> +			attr = hwmon_in_max_alarm;
> +
> +		break;

[Severity: High]

Do these comparisons handle the case where firmware never advertised a
threshold?  fbnic_fw_parse_cap_resp() stores the FBNIC_SENSOR_NO_DATA
sentinel for any threshold the capability response omits:

drivers/net/ethernet/meta/fbnic/fbnic_fw.c:fbnic_fw_parse_cap_resp() {
	...
	fbd->fw_cap.temp.crit =
		fbnic_tlv_attr_get_signed(results[FBNIC_FW_CAP_RESP_TEMP_CRIT],
					  FBNIC_SENSOR_NO_DATA);
	...
}

and that sentinel is the smallest s32:

drivers/net/ethernet/meta/fbnic/fbnic_fw.h:
#define FBNIC_SENSOR_NO_DATA			S32_MIN

So with temp.crit unset, "val >= fbd->fw_cap.temp.crit" is always true and
every threshold event is reported as temp1_crit_alarm.  Does that also make
the temp1_max_alarm arm below unreachable, since the crit test runs first
even when temp.max is a real value?  The voltage case looks the same:
an unset volt.max turns any reported value into in0_max_alarm.

The read paths filter the sentinel explicitly:

drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c:fbnic_hwmon_read_alarm() {
	if (a == FBNIC_SENSOR_NO_DATA || b == FBNIC_SENSOR_NO_DATA)
		return -ENODATA;
	...
}

which means userspace gets woken on an attribute that then reads back as
-ENODATA.  Should the notify path skip thresholds equal to
FBNIC_SENSOR_NO_DATA the same way?

> +	default:
> +		return;
> +	}
> +
> +	/* Pair with WRITE_ONCE() in fbnic_hwmon_unregister(). Skip the
> +	 * notification if hwmon failed to register or has already been torn
> +	 * down.
> +	 */
> +	hwmon = READ_ONCE(fbd->hwmon);
> +	if (attr >= 0 && hwmon)
> +		hwmon_notify_event(hwmon, type, attr, 0);
>  }

[Severity: Low]

This isn't a bug in the new notify path itself, but related to the
attributes it notifies on: fbnic_hwmon_is_visible() returns 0444
unconditionally and fbnic_hwmon_info[] advertises every threshold and
alarm:

drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c:
	HWMON_CHANNEL_INFO(in,
			   HWMON_I_INPUT |
			   HWMON_I_MIN | HWMON_I_MIN_ALARM |
			   HWMON_I_MAX | HWMON_I_MAX_ALARM),

so temp1_{min,max,crit}, in0_{min,max} and the matching *_alarm files exist
even when the capability response omitted the threshold and
fbnic_hwmon_read_threshold() can only ever return -ENODATA.

Documentation/hwmon/sysfs-interface.rst says:

  All entries (except name) are optional, and should only be created in a
  given driver if the chip has the feature.

Could fbnic_hwmon_is_visible() key visibility off the corresponding
capability value, and hide an alarm when its threshold is unavailable?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260908225737.3034403-1-limzhineng2%40gmail.com
