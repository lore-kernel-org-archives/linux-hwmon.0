Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50E9E36F421;
	Thu,  3 Sep 2026 03:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788405855; cv=none; b=dLgH9NqTjlklzkLEZeYBcHnymUaIeL7gAavncGbGqvzh7Z8ofamGJZE15T8eL3/qRGZcsE3dNkqYOyMCAquup7NPf/C79miG0C04rnhjIEKz1Mkv8HxSszwDTboWOz7r85prFsQvNCOY/QXWuDFW0lR+CYi3o8a/hzsqS94es4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788405855; c=relaxed/simple;
	bh=hQ7GF2ifSA20zbjG5larUkiWB6DOxvhY1c+fFLqyZ6s=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iuTv5rISpdbCAdQeoyADDPMk+yd0r2TK6wc/QW9tQhviW9kZQVyBF9aOoILLKANA7DkV42dAOq2uDtlFFifXdGfjP7ngQHHzH4jL1/lCnkescjhhdkxexq9fsjLQekW8Jb8sIXeOXFYU1u4GIF/p2Voytl0thPgQmZKp930YhGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K62FaLT2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K62FaLT2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72A5C1F00A3A;
	Thu,  3 Sep 2026 03:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788405853;
	bh=Ts+Hx2hFcpA8dw2dNAndrEA0Km09AzRzbPkJqhDcEIc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=K62FaLT2bv2+uzpr82klYy78X4Eb+8+z79A7np5SLDEuCgqPp/yka+7MmpLeiIcEm
	 kLiebLV52s1NWkn5UBYoeFGKTYZSUoIbGncHPvXTh5ttsmhcEhkKboaEc4Px4x49xg
	 sf5mK9ehqtaDPgfZ53cuj4pZ0v+kTS4RAQqATzaZDlqk2qwFaGiq1XjdSBhGh1JTP3
	 1PRRQYtaduTRfmMVUVuLoE3jSQX2DpjG0tLHP1h9UQn4CB3qMhhuXC7D2O3tudxZ/p
	 LcyRs7siKIgk+pQuofhoW9+cV6EmN4qkY0yMvcWUcOYUkADZWEakQ4rKGCjXoahw+T
	 HIPUU24E2h0qg==
Subject: Re: [net-next,v2,5/6] eth: fbnic: report temperature and voltage
 alarms via hwmon
From: netdev-bot+sashiko@kernel.org
To: limzhineng2@gmail.com
Cc: alexanderduyck@fb.com, kuba@kernel.org, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 linux@roeck-us.net, horms@kernel.org, mohsin.bashr@gmail.com,
 kernel-team@meta.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hwmon@vger.kernel.org, zinclim@meta.com
Date: Thu, 03 Sep 2026 03:24:12 +0000
Message-ID: <178840585205.3394541.17121542264844954721@kernel.org>
In-Reply-To: <20260831212234.1212971-6-limzhineng2@gmail.com>
References: <20260831212234.1212971-6-limzhineng2@gmail.com>
X-sashiko-severity: High
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

Critical: 0 · High: 1 · Medium: 2 · Low: 0

- [High] The new temp1_{min,max,crit}_alarm and in0_{min,max}_alarm
  attributes are synthesized in software by comparing a sampled sensor…
- [Medium] fbnic_hwmon_is_visible() returns 0444 unconditionally
  (drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c:10-15) while…
- [Medium] In fbnic_hwmon_temp_read() and fbnic_hwmon_in_read() the alarm
  attribute cases `break` out of the first switch and unconditionally…

--

eth: fbnic: report temperature and voltage alarms via hwmon

This adds temp1_{min,max,crit}_alarm and in0_{min,max}_alarm to the fbnic
hwmon interface.  Each alarm is derived by taking a sensor reading and
comparing it against the matching threshold cached in fbnic_fw_cap, and
thresholds the firmware never reported return -ENODATA.

> diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c b/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c
> index 4938f7b391402..c5cddd9cef124 100644
> --- a/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c
> +++ b/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c
> @@ -87,34 +87,84 @@ static int fbnic_hwmon_read_threshold(long thr, long *val)
>  	return 0;
>  }
>  
> +static int fbnic_hwmon_read_alarm(long a, long b, long *val)
> +{
> +	if (a == FBNIC_SENSOR_NO_DATA || b == FBNIC_SENSOR_NO_DATA)
> +		return -ENODATA;
> +
> +	*val = a >= b;
> +	return 0;
> +}

[Severity: High]
Is a driver-side comparison allowed for the *_alarm files?
Documentation/hwmon/sysfs-interface.rst says:

    Alarms are direct indications read from the chips. The drivers do NOT
    make comparisons of readings to thresholds. This allows violations
    between readings to be caught and alarmed.

Here fbnic_hwmon_read_alarm() computes the alarm in software from a single
sample, so a threshold violation that starts and clears between two
userspace reads is never visible, while the file name promises a latched
chip indication.

The effect is amplified by the cache in fbnic_hwmon_sensor_read():

	if (*cached != FBNIC_SENSOR_NO_DATA &&
	    time_is_after_eq_jiffies(cache->last_read)) {
		*val = *cached;
		return 0;
	}

so an alarm read can be answered from a sample taken in a previous jiffy.

The later commit in this series, "eth: fbnic: firmware notifies hwmon on
sensor threshold events", only adds hwmon_notify_event() wakeups and leaves
the sysfs read path computing the alarm in software.  A reader woken by such
a notification can then take a fresh TSENE reading and see the alarm as 0
because the transient already passed.  That commit also shows the firmware
does have a threshold-crossing indication - could the alarm attributes be
backed by that indication instead, or dropped so userspace compares
temp1_input against the already exported temp1_{min,max,crit}?

>  static int fbnic_hwmon_temp_read(struct fbnic_dev *fbd, u32 attr, long *val)
>  {
> +	int err;
> +
>  	switch (attr) {
> -	case hwmon_temp_input:
> -		return fbnic_hwmon_sensor_read(fbd, FBNIC_SENSOR_TEMP, val);
>  	case hwmon_temp_min:
>  		return fbnic_hwmon_read_threshold(fbd->fw_cap.temp.min, val);
>  	case hwmon_temp_max:
>  		return fbnic_hwmon_read_threshold(fbd->fw_cap.temp.max, val);
>  	case hwmon_temp_crit:
>  		return fbnic_hwmon_read_threshold(fbd->fw_cap.temp.crit, val);
> +	case hwmon_temp_input:
> +	case hwmon_temp_min_alarm:
> +	case hwmon_temp_max_alarm:
> +	case hwmon_temp_crit_alarm:
> +		break;
>  	default:
>  		return -EOPNOTSUPP;
>  	}
> +
> +	err = fbnic_hwmon_sensor_read(fbd, FBNIC_SENSOR_TEMP, val);
> +	if (err)
> +		return err;

[Severity: Medium]
Should the FBNIC_SENSOR_NO_DATA test happen before this firmware round-trip?

For the plain min/max/crit attributes the sentinel is checked up front, but
for the alarms the check only happens later, inside fbnic_hwmon_read_alarm().
On firmware that did not report a threshold, every read of temp1_min_alarm
(and in0_min_alarm / in0_max_alarm via fbnic_hwmon_in_read()) allocates a
completion, transmits a TSENE message and can block here:

	if (!wait_for_completion_timeout(&fw_cmpl->done, 10 * HZ)) {
		dev_err(fbd->dev, "Timed out waiting for TSENE read\n");

with the hwmon core's hwdev->lock held, only to return -ENODATA that was
already decidable without any firmware traffic.

There is a second consequence of the ordering: when the sensor read fails,
the attribute returns the transport error (-ETIMEDOUT, -ENOMEM, -EPIPE) plus
a dev_err() line rather than the -ENODATA the missing threshold dictates, so
"unsupported" is reported as a transient failure.

> +
> +	switch (attr) {
> +	case hwmon_temp_input:
> +		return 0;
> +	case hwmon_temp_min_alarm:
> +		return fbnic_hwmon_read_alarm(fbd->fw_cap.temp.min, *val, val);
> +	case hwmon_temp_max_alarm:
> +		return fbnic_hwmon_read_alarm(*val, fbd->fw_cap.temp.max, val);
> +	case hwmon_temp_crit_alarm:
> +		return fbnic_hwmon_read_alarm(*val, fbd->fw_cap.temp.crit, val);
> +	}
> +
> +	return -EOPNOTSUPP;
>  }

[ ... in0 hunk snipped, same pattern in fbnic_hwmon_in_read() ... ]

> @@ -139,10 +189,14 @@ static const struct hwmon_ops fbnic_hwmon_ops = {
>  
>  static const struct hwmon_channel_info *fbnic_hwmon_info[] = {
>  	HWMON_CHANNEL_INFO(temp,
> -			   HWMON_T_INPUT | HWMON_T_MIN | HWMON_T_MAX |
> -			   HWMON_T_CRIT),
> +			   HWMON_T_INPUT |
> +			   HWMON_T_MIN | HWMON_T_MIN_ALARM |
> +			   HWMON_T_MAX | HWMON_T_MAX_ALARM |
> +			   HWMON_T_CRIT | HWMON_T_CRIT_ALARM),
>  	HWMON_CHANNEL_INFO(in,
> -			   HWMON_I_INPUT | HWMON_I_MIN | HWMON_I_MAX),
> +			   HWMON_I_INPUT |
> +			   HWMON_I_MIN | HWMON_I_MIN_ALARM |
> +			   HWMON_I_MAX | HWMON_I_MAX_ALARM),
>  	NULL
>  };

[Severity: Medium]
Could these alarms be hidden instead of created and then always failing?

fbnic_hwmon_is_visible() returns 0444 unconditionally:

	static umode_t fbnic_hwmon_is_visible(const void *drvdata,
					      enum hwmon_sensor_types type,
					      u32 attr, int channel)
	{
		return 0444;
	}

so with these new config bits the five alarm files always exist.  If the
running firmware omits the threshold TLVs, fbnic_fw_parse_cap_resp() stores
FBNIC_SENSOR_NO_DATA and fbnic_hwmon_read_alarm() then returns -ENODATA for
that alarm for the whole lifetime of the device, which libsensors reports as
a chip read error rather than an unsupported feature.

The threshold availability is known when is_visible() runs: fbnic_probe()
calls fbnic_fw_request_mbx(), which polls in fbnic_mbx_poll_tx_ready() until
the FW_CAP_RESP has been parsed, and only afterwards calls
fbnic_hwmon_register().  Would returning 0 from fbnic_hwmon_is_visible() for
alarms whose threshold is FBNIC_SENSOR_NO_DATA (drvdata is the fbd here) be
preferable?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260831212234.1212971-1-limzhineng2%40gmail.com
