Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5BE7372B50;
	Thu,  3 Sep 2026 03:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788405856; cv=none; b=M1Sp6aE98gUV+OWI51QvACFWGhLTUqXGwYEu7r3n5KY4AP4Ai59l2ucW+PlyTlP44CzbIcFrHsfZKF1yYlQ3ZSpy+Xwz6PDMAt3eRlriJzEbRBKkaN4F37cibr49DKMDvDzpN09ROaATcQUyT77nENqHepfHbCjpnTLS3pl6onA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788405856; c=relaxed/simple;
	bh=V+4yIgwu1Wz7LqCjXj/p+dTL2xWzWqKY6sqG86tw0rI=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IXGLba75m/q+A0M5aovvpe0OcAQ5KfgjaS3Mcnfl6dSoaX57TyIMgX53ILHaUQQkVOUussxD2oEE1652n+Xnba06AtBwQjcqnLWRtX8M1Isc1qW9R+BbJCZoynZQj45B1gbS8CTUuRASgcpgfxJ8mOai5yV/2KMno1l97wYVkjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vp480v/C; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vp480v/C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C279F1F00A3D;
	Thu,  3 Sep 2026 03:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788405854;
	bh=e2GhnOAM4LYEKzTqqXgSETDF6+BROa0YzDLZ0S/9yn8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Vp480v/C4e5HYZa69290CNQGB6cl3uyG5VxNFxRo2i8sftWBgLViJzrtrO6RBbFwz
	 jGSyg3iEzZDRZyZwAmZlEljnuPu+dw+loCBMUylTntJJwih/EWM2LxWKkcZGsonueF
	 4wCYFovem/hzKpKg8wgcNbsfFFlwxFkhFd/XigCJxF27Rtt6NlqWbupGmNG1Cb+Y9r
	 pT5F3c77qFULUPhgr1GjozYpHD90VUWHjtnTBaYQ3moohwL45RnrqTwDAFe1HEwJp+
	 Tyq9NrgyKv5uza8Jd1qdlKptDSVhF2Z9C7cQCtpgDGNdM1Na2J5xiwATlfZhOrqDh2
	 A9zjV+kPqT4qQ==
Subject: Re: [net-next,v2,6/6] eth: fbnic: firmware notifies hwmon on sensor
 threshold events
From: netdev-bot+sashiko@kernel.org
To: limzhineng2@gmail.com
Cc: alexanderduyck@fb.com, kuba@kernel.org, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 linux@roeck-us.net, horms@kernel.org, mohsin.bashr@gmail.com,
 kernel-team@meta.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hwmon@vger.kernel.org, zinclim@meta.com
Date: Thu, 03 Sep 2026 03:24:13 +0000
Message-ID: <178840585335.3394541.17896777130676865499@kernel.org>
In-Reply-To: <20260831212234.1212971-7-limzhineng2@gmail.com>
References: <20260831212234.1212971-7-limzhineng2@gmail.com>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 5 potential
issue(s) to consider:

Critical: 0 · High: 0 · Medium: 1 · Low: 4

- [Medium] fbnic_hwmon_notify_event() uses
  fbd->fw_cap.temp.{min,max,crit} and fbd->fw_cap.volt.{min,max} in…
- [Low] The new unsolicited-message handler logs at KERN_ERR
  unconditionally for every firmware threshold event (dev_err…
- [Low] fbnic_hwmon_unregister() calls
  synchronize_irq(fbd->fw_msix_vector) unconditionally, but…
- [Low] temp1_max_alarm and temp1_crit_alarm are independent attributes:
  fbnic_hwmon_temp_read() computes max_alarm as (val >= temp.max) and…
- [Low] fbd->hwmon is published with a plain WRITE_ONCE() after the hwmon
  device has been fully initialized and the sensor cache seeded, and it…

--

eth: fbnic: firmware notifies hwmon on sensor threshold events

This adds a parser for the new unsolicited
FBNIC_TLV_MSG_ID_SENSOR_THRESHOLD_EXCEEDED_RESP firmware message and
translates it into a hwmon alarm notification via hwmon_notify_event().
It also reworks the publish/teardown of fbd->hwmon with WRITE_ONCE(),
READ_ONCE() and synchronize_irq().

A few questions below.

> diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_fw.c b/drivers/net/ethernet/meta/fbnic/fbnic_fw.c
> index e5669dfd97904..fd96a3962e3f5 100644
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

[Severity: Low]
Should the logging in fbnic_fw_parse_threshold_exceeded_resp() be rate
limited?

Message ID 0x40 is registered in fbnic_fw_tlv_parser[] and dispatched
straight from fbnic_mbx_process_rx_msgs() with no completion slot and no
host request gating it, so the arrival rate is entirely controlled by the
firmware. Each accepted event emits an unconditional dev_err() and then a
KOBJ_CHANGE uevent through hwmon_notify_event() -> kobject_uevent_env().

The three new -EINVAL returns feed the existing amplifier in
fbnic_mbx_process_rx_msgs():

	if (err) {
		dev_warn(fbd->dev, "Unable to process message: %d\n",
			 err);
		print_hex_dump(KERN_WARNING, "fbnic:",
			       DUMP_PREFIX_OFFSET, 16, 2,
			       msg, length, true);

so a firmware sending a malformed threshold message in a loop produces a
full hex dump per message. Would dev_err_ratelimited() (or _once) be
preferable here?

Also worth noting: in the volt_exceeded path, if the thermal notification
already happened and the voltage value attribute is missing, the function
both notifies and returns -EINVAL, so the same message triggers the hex
dump too.

> diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c b/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c
> index c5cddd9cef124..3f33522fcfd2b 100644
> --- a/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c
> +++ b/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c
> @@ -214,22 +216,75 @@ void fbnic_hwmon_register(struct fbnic_dev *fbd)
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
Is a plain WRITE_ONCE() enough on this publish side?

fbnic_hwmon_register() seeds fbd->hwmon_cache and registers the device,
then publishes the pointer that another CPU dereferences in
fbnic_hwmon_notify_event() -> hwmon_notify_event() -> sysfs_notify(&dev->kobj,
...). WRITE_ONCE() carries no release semantics and READ_ONCE() only gives
address-dependency ordering for loads through the pointer, so the preceding
initialization stores are not ordered against the pointer store on a weakly
ordered architecture.

The in-code comments in fbnic_hwmon_unregister() and
fbnic_hwmon_notify_event() describe the WRITE_ONCE/READ_ONCE pair as
providing that guarantee. Should this be smp_store_release() /
smp_load_acquire() instead, or should the comments be adjusted?

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

[Severity: Low]
Can fbd->fw_msix_vector be 0 or stale at this point?

fbnic_fw_free_mbx() treats 0 as the "no IRQ" sentinel and guards on it:

	/* Vector has already been freed */
	if (!fbd->fw_msix_vector)
		return;
	...
	free_irq(fbd->fw_msix_vector, fbd);
	fbd->fw_msix_vector = 0;

That runs on the PM suspend and error-recovery paths without touching
fbd->hwmon, and fbnic_hwmon_unregister() has a single call site in
fbnic_remove(). So an unbind after a failed resume reaches
synchronize_irq() with fw_msix_vector == 0.

fbnic_fw_request_mbx() also leaves a stale value behind:

	err = __fbnic_fw_enable_mbx(fbd, vector);
	if (err)
		free_irq(vector, fbd);

	fbd->fw_msix_vector = vector;

synchronize_irq(0) does not return early when irq_to_desc(0) yields a
descriptor, so the code would wait on an unrelated line rather than the
fbnic FW mailbox IRQ, and the drain the commit message describes is not
performed. Would guarding on fbd->fw_msix_vector != 0 (as
fbnic_fw_free_mbx() does), or ordering the hwmon teardown against the
mailbox teardown, be more robust here?

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

[Severity: Medium]
Do these comparisons need to filter FBNIC_SENSOR_NO_DATA first?

fbnic_fw_parse_cap_resp() stores the sentinel when the firmware cap
response omits an optional threshold:

	fbd->fw_cap.temp.min =
		fbnic_tlv_attr_get_signed(results[FBNIC_FW_CAP_RESP_TEMP_MIN],
					  FBNIC_SENSOR_NO_DATA);

and FBNIC_SENSOR_NO_DATA is S32_MIN. Since every real reading is greater
than S32_MIN, with temp.crit unpopulated:

	val = 45000;
	45000 <= temp.min (S32_MIN)   -> false
	45000 >= temp.crit (S32_MIN)  -> true  -> hwmon_temp_crit_alarm

so any thermal event is reported as temp1_crit_alarm regardless of the
actual condition, and the same applies to in0_max_alarm when volt.max is
unpopulated. hwmon_notify_event() for hwmon_temp additionally calls
hwmon_thermal_notify(). A listener woken on temp1_crit_alarm then reads the
attribute and gets -ENODATA back from the peer helper in this same file:

	static int fbnic_hwmon_read_alarm(long a, long b, long *val)
	{
		if (a == FBNIC_SENSOR_NO_DATA || b == FBNIC_SENSOR_NO_DATA)
			return -ENODATA;

The mirror case also loses events: with temp.min == S32_MIN an
under-minimum reading matches no branch at all and nothing is notified.

[Severity: Low]
Should the max and crit alarms be notified independently rather than
selected by an if/else-if chain?

fbnic_hwmon_temp_read() derives them from separate comparisons:

	case hwmon_temp_max_alarm:
		return fbnic_hwmon_read_alarm(*val, fbd->fw_cap.temp.max, val);
	case hwmon_temp_crit_alarm:
		return fbnic_hwmon_read_alarm(*val, fbd->fw_cap.temp.crit, val);

so with temp.max <= temp.crit a reading at or above crit makes both
temp1_max_alarm and temp1_crit_alarm read as 1. Both files are created
(fbnic_hwmon_info[] advertises HWMON_T_MIN_ALARM, HWMON_T_MAX_ALARM and
HWMON_T_CRIT_ALARM, and fbnic_hwmon_is_visible() returns 0444), but the
else-if chain only notifies hwmon_temp_crit_alarm, so a poller on
temp1_max_alarm is never woken even though that attribute just changed from
0 to 1.

The firmware event format in fbnic_threshold_exceeded_resp_index[] carries
only a per-sensor exceeded flag plus a value, with no indication of which
threshold was crossed, so is there anything that justifies picking exactly
one alarm?

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

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260831212234.1212971-1-limzhineng2%40gmail.com
