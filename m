Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 667083F104C;
	Fri, 11 Sep 2026 04:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789102719; cv=none; b=NfD6saOSxNu0iFK9+oKkbxhRyHfeFFfD/1f6BofG1Pl083+PGgMMtyt+H95+P0HgjpPjT1jv7VbjAQarsDZyxMyCYt6eUS4mpAz9GnQOSWKxKKeIM6gbDl/i8Othz9Ms41uGg9N6aFlOX7j5QavKgirBvgv3zxHIjgYmtzlUHlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789102719; c=relaxed/simple;
	bh=Frfc2BK8V67LL3v5r/ExlTuJHBE8BO1EFOSfI92KLnE=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=G+oLitDPHFPu+Ml32kPUz7AisDGxv1BVTuC4T2FFid77qQOrwk0CXgM5JMqdgmq25nVfBGdQ/f4Jyg5KmbBDOZjSD9Rw6XMCWCbWBqGSUzL1H2mAKqUWOXWn+PvPBCY2mNwrTxa7iYwzQZUVuPujpgytjUtsikQyJbunAiujpr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n1cQiZXo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n1cQiZXo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 426821F000FF;
	Fri, 11 Sep 2026 04:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789102718;
	bh=9yO0mbJJWoylBxiFmEPx7krllJhxjC+XcKXgUQkc2x4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=n1cQiZXoAkHnD9q932RT+/R36fjQVmGLkOzBrPBpawu5jQ5wGP7D+EJ0nZf6161IX
	 QJMFx/ObjhRS4jZ/2E2aEDx2ZlBz70uM0vejHheyQtiJeufqruwJUFSXyBsmVrLYTX
	 FQvBbcy0mHrCe36/7WwkjXXeyTZyDwzdptDS5pJtzUady9adKKI+M6r9bDXpCWYSvF
	 U4CtuZzSuUOm87Cm1MnMkVOhbT4RkX5AOZrhCmOc5WtZaNa73qX5dBrm6sVV5B5VxB
	 +GiZz+gCCF+jtRP2YZsGRI818abex5BrUXi+MjfWYmgzKF4MAL0LNOLuifev7hZ1rM
	 rh7sXVCgWU6sg==
Subject: Re: [PATCH net-next v3 4/6] eth: fbnic: report temperature and
 voltage thresholds via hwmon
From: netdev-bot+sashiko@kernel.org
To: limzhineng2@gmail.com
Cc: alexanderduyck@fb.com, kuba@kernel.org, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 linux@roeck-us.net, horms@kernel.org, mohsin.bashr@gmail.com,
 kernel-team@meta.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hwmon@vger.kernel.org, zinclim@meta.com
Date: Fri, 11 Sep 2026 04:58:36 +0000
Message-ID: <178910271685.219967.14998432650064404078@kernel.org>
In-Reply-To: <20260908225737.3034403-5-limzhineng2@gmail.com>
References: <20260908225737.3034403-5-limzhineng2@gmail.com>
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
issue(s) to consider:

Critical: 0 · High: 0 · Medium: 2 · Low: 1

- [Medium] The FBNIC_SENSOR_NO_DATA sentinel promised by the commit
  message is not established on all paths, so userspace can read a bogus…
- [Medium] Unsupported threshold attributes are unconditionally exposed
  in sysfs, violating hwmon is_visible semantics.
- [Low] Unsynchronized access to the new threshold fields.

--

eth: fbnic: report temperature and voltage thresholds via hwmon

The firmware capability response is parsed for per-board temperature
(min/max/crit) and voltage (min/max) thresholds, which are stored in
fbnic_fw_cap and exposed via hwmon as temp1_{min,max,crit} and
in0_{min,max}, with FBNIC_SENSOR_NO_DATA reported as -ENODATA.

> diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_fw.c b/drivers/net/ethernet/meta/fbnic/fbnic_fw.c
> index ff1674eff7ad..e5669dfd9790 100644
> --- a/drivers/net/ethernet/meta/fbnic/fbnic_fw.c
> +++ b/drivers/net/ethernet/meta/fbnic/fbnic_fw.c

[ ... ]

> @@ -702,6 +707,22 @@ static int fbnic_fw_parse_cap_resp(void *opaque, struct fbnic_tlv_msg **results)
>  	/* Always assume we need a BMC reinit */
>  	fbd->fw_cap.need_bmc_tcam_reinit = true;
>  
> +	fbd->fw_cap.temp.min =
> +		fbnic_tlv_attr_get_signed(results[FBNIC_FW_CAP_RESP_TEMP_MIN],
> +					  FBNIC_SENSOR_NO_DATA);
> +	fbd->fw_cap.temp.max =
> +		fbnic_tlv_attr_get_signed(results[FBNIC_FW_CAP_RESP_TEMP_MAX],
> +					  FBNIC_SENSOR_NO_DATA);
> +	fbd->fw_cap.temp.crit =
> +		fbnic_tlv_attr_get_signed(results[FBNIC_FW_CAP_RESP_TEMP_CRIT],
> +					  FBNIC_SENSOR_NO_DATA);
> +	fbd->fw_cap.volt.min =
> +		fbnic_tlv_attr_get_signed(results[FBNIC_FW_CAP_RESP_VOLT_MIN],
> +					  FBNIC_SENSOR_NO_DATA);
> +	fbd->fw_cap.volt.max =
> +		fbnic_tlv_attr_get_signed(results[FBNIC_FW_CAP_RESP_VOLT_MAX],
> +					  FBNIC_SENSOR_NO_DATA);
> +

[Severity: Medium]
Is this the only place the FBNIC_SENSOR_NO_DATA sentinel gets written into
fw_cap.temp/fw_cap.volt?  The commit message says:

  "Values the firmware did not report are stored as the
   FBNIC_SENSOR_NO_DATA sentinel in the capability response parser"

but these assignments sit after all of the parser's error returns, and the
fields start out as 0 rather than the sentinel.  fbnic_mbx_init() does:

drivers/net/ethernet/meta/fbnic/fbnic_fw.c:fbnic_mbx_init() {
	/* Reset FW Capabilities */
	memset(&fbd->fw_cap, 0, sizeof(fbd->fw_cap));
	...
}

so the five new threshold fields are zeroed there, not seeded with
FBNIC_SENSOR_NO_DATA.

Can that window be observed from sysfs?  fbnic_mbx_init() is reached via
fbnic_fw_request_mbx()->__fbnic_fw_enable_mbx()->fbnic_mbx_init(), and
fbnic_fw_request_mbx() is also called post-probe from __fbnic_pm_resume(),
including the fbnic_err_slot_reset() AER recovery path.  Neither
fbnic_pm_suspend() nor fbnic_err_error_detected() calls
fbnic_hwmon_unregister() (only fbnic_remove() does), so
temp1_{min,max,crit} and in0_{min,max} stay readable while
fbnic_mbx_poll_tx_ready() waits for a fresh capability response.  During
that window, does a read return 0 (0 m°C / 0 mV) with success instead of
-ENODATA?

There also looks to be a permanent variant.  fbnic_fw_parse_cap_resp()
commits the version early:

	version = fta_get_uint(results, FBNIC_FW_CAP_RESP_VERSION);
	fbd->fw_cap.running.mgmt.version = version;

and can then return before reaching the assignments above:

		attr = results[FBNIC_FW_CAP_RESP_BMC_MAC_ARRAY];
		if (!attr)
			return -EINVAL;

		err = fbnic_fw_parse_bmc_addrs(fbd->fw_cap.bmc_mac_addr,
					       attr, 4);
		if (err)
			return err;

fbnic_mbx_process_rx_msgs() only warns and hex-dumps on a parser failure, and
because a valid version was already stored, the loop in
fbnic_mbx_poll_tx_ready() terminates with err == 0 and probe continues to
fbnic_hwmon_register().  Would that leave all five thresholds at 0 for the
lifetime of the device, so temp1_max/temp1_crit read as 0 while temp1_input
is positive?

Would it make sense to seed fw_cap.temp/fw_cap.volt with
FBNIC_SENSOR_NO_DATA right after the memset in fbnic_mbx_init(), or to move
these assignments ahead of the parser's early returns?  fbnic_hwmon_register()
already uses that pattern for the read cache:

drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c:fbnic_hwmon_register() {
	/* Seed cache with sentinel so the first read always refreshes. */
	fbd->hwmon_cache.temp_mdeg = FBNIC_SENSOR_NO_DATA;
	fbd->hwmon_cache.volt_mv = FBNIC_SENSOR_NO_DATA;
	...
}

> diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c b/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c
> index c8e7ff1d36fc..7dc4d705f566 100644
> --- a/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c
> +++ b/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c

[ ... ]

> @@ -87,14 +77,58 @@ static int fbnic_hwmon_sensor_read(struct fbnic_dev *fbd, int id, long *val)
>  	return err;
>  }
>  
> +static int fbnic_hwmon_read_threshold(long thr, long *val)
> +{
> +	if (thr == FBNIC_SENSOR_NO_DATA)
> +		return -ENODATA;
> +
> +	*val = thr;
> +	return 0;
> +}
> +
> +static int fbnic_hwmon_temp_read(struct fbnic_dev *fbd, u32 attr, long *val)
> +{
> +	switch (attr) {
> +	case hwmon_temp_input:
> +		return fbnic_hwmon_sensor_read(fbd, FBNIC_SENSOR_TEMP, val);
> +	case hwmon_temp_min:
> +		return fbnic_hwmon_read_threshold(fbd->fw_cap.temp.min, val);
> +	case hwmon_temp_max:
> +		return fbnic_hwmon_read_threshold(fbd->fw_cap.temp.max, val);
> +	case hwmon_temp_crit:
> +		return fbnic_hwmon_read_threshold(fbd->fw_cap.temp.crit, val);
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static int fbnic_hwmon_in_read(struct fbnic_dev *fbd, u32 attr, long *val)
> +{
> +	switch (attr) {
> +	case hwmon_in_input:
> +		return fbnic_hwmon_sensor_read(fbd, FBNIC_SENSOR_VOLTAGE, val);
> +	case hwmon_in_min:
> +		return fbnic_hwmon_read_threshold(fbd->fw_cap.volt.min, val);
> +	case hwmon_in_max:
> +		return fbnic_hwmon_read_threshold(fbd->fw_cap.volt.max, val);
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}

[Severity: Medium]
Should the thresholds really be exposed unconditionally?

fbnic_hwmon_is_visible() still returns 0444 for every (type, attr)
pair, so with the new HWMON_T_MIN/HWMON_T_MAX/HWMON_T_CRIT and
HWMON_I_MIN/HWMON_I_MAX bits in fbnic_hwmon_info[], hwmon creates
temp1_{min,max,crit} and in0_{min,max} even on boards whose firmware
never reported them, and the only signal userspace gets is the
-ENODATA that fbnic_hwmon_read_threshold() returns on the
FBNIC_SENSOR_NO_DATA sentinel.  The commit message states this as the
design ("The thresholds are always exposed"), which is why I'm asking
rather than just flagging it.

The hwmon contract is the other way around: an attribute the device
cannot supply should not be created, and is_visible() returning 0 is
exactly the mechanism for that -- hwmon skips the attribute entirely in
that case.  A file that exists but always fails its read() is worse
than an absent one: libsensors and other consumers surface the read
error instead of quietly skipping the sensor, and every user of
temp1_max now has to special-case -ENODATA.  The drvdata handed to
fbnic_hwmon_is_visible() is the struct fbnic_dev, so it can inspect
fbd->fw_cap.temp.{min,max,crit} and fbd->fw_cap.volt.{min,max} and
return 0 for the sentinel cases without any new plumbing.

Two things I don't know the intended answer to.  First, is_visible() is
only consulted once, when fbnic_hwmon_register() calls
devm_hwmon_device_register_with_info(), so deriving visibility from
fw_cap requires the FW_CAP_RESP to have been parsed before that point
-- is that ordering guaranteed on all probe paths, or would a slow/
absent capability response silently hide the thresholds forever?
Second, fbnic_fw_request_mbx() re-sends the capability request from
__fbnic_pm_resume() and fbnic_err_slot_reset(), so fw_cap can be
re-parsed after registration; if a threshold appears or disappears
across a resume the attribute set is already fixed.  Is the intent to
keep -ENODATA purely as a defensive fallback for that case while
is_visible() reflects the state at registration, or is there a reason
you'd rather always publish the files?

[Severity: Low]
Is any synchronization needed between these reads and the firmware parser
that writes the same fields?

The writer is fbnic_fw_parse_cap_resp(), reached from
fbnic_fw_msix_intr()->fbnic_mbx_poll()->fbnic_mbx_process_rx_msgs(), i.e. the
threaded handler installed by fbnic_fw_request_mbx():

drivers/net/ethernet/meta/fbnic/fbnic_irq.c:fbnic_fw_request_mbx() {
	err = request_threaded_irq(vector, NULL, &fbnic_fw_msix_intr,
				   IRQF_ONESHOT | IRQF_NO_AUTOEN,
				   dev_name(fbd->dev), fbd);
	...
}

The readers above run in process context from the hwmon read callback.
fbd->fw_tx_lock only covers Tx enqueue, and the hwmon core mutex the reader
holds is never taken by the firmware path, so the two contexts share no lock
and there are no READ_ONCE()/WRITE_ONCE() annotations.

The FW_CAP_RESP parser stays registered in fbnic_fw_tlv_parser[] for the
lifetime of the device, and fbnic_fw_request_mbx() re-sends
FBNIC_TLV_MSG_ID_HOST_CAP_REQ from __fbnic_pm_resume() /
fbnic_err_slot_reset(), so a re-parse can land while hwmon is live.

Aligned s32 accesses will not tear, so this looks like a KCSAN-reportable
plain-access race rather than corruption, but can the min/max/crit triple be
read as an inconsistent set, or an attribute flip between a real value and
-ENODATA between two reads?

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260908225737.3034403-1-limzhineng2%40gmail.com
