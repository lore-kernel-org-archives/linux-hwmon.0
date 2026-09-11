Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75CDC3F23C0;
	Fri, 11 Sep 2026 04:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789102720; cv=none; b=h/6QKLSHw+/oqBZGq0YNyrhAZrUKh5Em/Ro+F4WA/2tdG8/n5fc4iHNGFop9h2Fd4DUMvX/Cf300n0Oqy4xuqk6jMCq21/hEhf5fH+aoGTh7P9nh35+rJJcKJkE0cQxYmY7MaGXkRcPSwVE70EHnegSL6Ms1ql0W+RTRWB1ruu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789102720; c=relaxed/simple;
	bh=991G3kkdWHXq7o1Os+yFHZ05JHDg0qE6C0idCcCmiok=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YYp2IKDur1ucE8PM7Bn0Aam8LBWDzUmleinsP1qx6Ujls6b7M2sLGLn07gsMPYR7daGLBJV/IeIkuedGM8x9tEc98lc3dJtjmoTEYmgktWdB8MLvefVSl7LL7sjQgHI45OgrVzi5THapimIeBKFVIT4SRQ4C0noiWqdJfcFOUlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eQc9ULJf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eQc9ULJf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 919C21F00893;
	Fri, 11 Sep 2026 04:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789102719;
	bh=NKms6hWDvQ0rPKNH+lvtzKVDIw7PqNTPLtvYchcjz0A=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=eQc9ULJf+R5CMhNTlDB/629z4ZLwXtAkmcU9+pab0KBr4nOU9KN+7B/EEM8QPI0N0
	 I6/vYyUHzlZoCm+I+9OeQuHIzMVh3MfiH4i9B/NJF+GWB6PrnEVFze+W+HFRqR6miY
	 4pxUoBb2tPnWrIylnLqxTgLah1IlQtP21b19K6Mk0GjQqkFaCwU2JiGK9JK97cklqk
	 oa+Np9/sMR3Cn8VbJvjOgnU6G4XUVUk0DvQBcct7lBd0WVAjIuhmMrNR8hZGAWFlgx
	 HKsGvwCdUKQ9cleVemz88rjxRJakrzu6x6V0HUPw+yyHenV/pkmfJLSs2cD41W++G5
	 isoSDs+Pi0Naw==
Subject: Re: [PATCH net-next v3 5/6] eth: fbnic: report temperature and
 voltage alarms via hwmon
From: netdev-bot+sashiko@kernel.org
To: limzhineng2@gmail.com
Cc: alexanderduyck@fb.com, kuba@kernel.org, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 linux@roeck-us.net, horms@kernel.org, mohsin.bashr@gmail.com,
 kernel-team@meta.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hwmon@vger.kernel.org, zinclim@meta.com
Date: Fri, 11 Sep 2026 04:58:38 +0000
Message-ID: <178910271815.219967.14604591538922575723@kernel.org>
In-Reply-To: <20260908225737.3034403-6-limzhineng2@gmail.com>
References: <20260908225737.3034403-6-limzhineng2@gmail.com>
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

Critical: 0 · High: 1 · Medium: 1 · Low: 1

- [High] The five new alarm attributes (temp1_min_alarm, temp1_max_alarm,
  temp1_crit_alarm, in0_min_alarm, in0_max_alarm) are synthesized in…
- [Medium] For alarm attributes whose threshold was never populated by
  firmware (fbd->fw_cap.temp.{min,max,crit} / volt.{min,max} ==…
- [Low] The number of hwmon attributes whose read triggers a TSENE
  firmware mailbox round-trip grows from 2 (temp1_input, in0_input) to 7…

--

eth: fbnic: report temperature and voltage alarms via hwmon

This adds temp1_{min,max,crit}_alarm and in0_{min,max}_alarm to the fbnic
hwmon device.  Each alarm is derived by taking a live TSENE sensor reading
and comparing it against the matching threshold stored in fbnic_fw_cap.
Thresholds that firmware did not populate are meant to report -ENODATA.

A few questions on the new alarm attributes below.

> diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c b/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c
> index 7dc4d705f566..11fa8aab0f5b 100644
> --- a/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c
> +++ b/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c
> @@ -86,34 +86,84 @@ static int fbnic_hwmon_read_threshold(long thr, long *val)
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
Is deriving the alarm bits in software compatible with the documented hwmon
alarm semantics?  Documentation/hwmon/sysfs-interface.rst says:

    Alarms are direct indications read from the chips. The drivers do NOT
    make comparisons of readings to thresholds. This allows violations
    between readings to be caught and alarmed.

Here fbnic_hwmon_read_alarm() is a stateless comparison of one live sample
against a stored threshold, so nothing is latched.  If the temperature
crosses fbd->fw_cap.temp.crit and falls back before the next read(), does
temp1_crit_alarm read back 0 and lose the excursion entirely?

Looking at the firmware side, the TSENE response only carries the
instantaneous values plus an error code:

drivers/net/ethernet/meta/fbnic/fbnic_fw.c
static const struct fbnic_tlv_index fbnic_tsene_read_resp_index[] = {
	FBNIC_TLV_ATTR_S32(FBNIC_FW_TSENE_THERM),
	FBNIC_TLV_ATTR_S32(FBNIC_FW_TSENE_VOLT),
	FBNIC_TLV_ATTR_S32(FBNIC_FW_TSENE_ERROR),
	...

so there appear to be no alarm/status bits available to report.  Would it
make sense to base these files on latched state fed by the firmware
threshold-exceeded events instead, or to leave the attributes out until
such state exists?

This also seems to interact with the last patch of the series ("eth: fbnic:
firmware notifies hwmon on sensor threshold events"): can that path call
hwmon_notify_event() for temp1_crit_alarm while a subsequent read of the
same file returns 0 because the fresh sample is back under the threshold?

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
Should the FBNIC_SENSOR_NO_DATA test happen before the firmware round-trip?

The alarm cases break out of the first switch without looking at
fbd->fw_cap.temp.{min,max,crit}, so a permanently unsupported alarm still
enters fbnic_hwmon_sensor_read(), which can block:

	if (!wait_for_completion_timeout(&fw_cmpl->done, 10 * HZ)) {
		dev_err(fbd->dev, "Timed out waiting for TSENE read\n");
		err = -ETIMEDOUT;

Older firmware that omits FBNIC_FW_CAP_RESP_TEMP_{MIN,MAX,CRIT} leaves the
sentinel in place:

drivers/net/ethernet/meta/fbnic/fbnic_fw.c:fbnic_fw_parse_cap_resp() {
	...
	fbd->fw_cap.temp.min =
		fbnic_tlv_attr_get_signed(results[FBNIC_FW_CAP_RESP_TEMP_MIN],
					  FBNIC_SENSOR_NO_DATA);
	...
}

In that case, when the mailbox transaction fails, does the attribute report
-ENOMEM/-ETIMEDOUT (with a dev_err() console line) rather than the
-ENODATA promised by the commit message text "A threshold the firmware did
not populate reports -ENODATA for both the threshold attribute and its
alarm"?  The sentinel check looks order independent and could be folded
into the first switch, which would also avoid the discarded firmware read.
The same ordering applies to in0_min_alarm and in0_max_alarm in
fbnic_hwmon_in_read().

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
>  
>  static int fbnic_hwmon_in_read(struct fbnic_dev *fbd, u32 attr, long *val)
>  {

[ ... ]

> +
> +	err = fbnic_hwmon_sensor_read(fbd, FBNIC_SENSOR_VOLTAGE, val);
> +	if (err)
> +		return err;

[Severity: Low]
The commit message says:

    only attributes that actually need a live value fall through to a single
    sensor read that then feeds input and every alarm

Is that accurate across attributes?  hwmon_attr_show() in
drivers/hwmon/hwmon.c invokes ->read() once per attribute file, so there is
no shared read; the only coalescing is the exact-tick comparison in
fbnic_hwmon_sensor_read():

	if (*cached != FBNIC_SENSOR_NO_DATA && cache->last_read == jiffies) {
		*val = *cached;
		return 0;
	}

With that, does a sequential sweep of the channel (sensors, or a monitoring
daemon) issue up to seven FBNIC_TLV_MSG_ID_TSENE_READ_REQ transactions
where the pre-patch driver issued two, each serialized and able to wait up
to 10 s?  Could the commit message be reworded, or the cache given a
coarser validity window than a single jiffy?

> +
> +	switch (attr) {
> +	case hwmon_in_input:
> +		return 0;
> +	case hwmon_in_min_alarm:
> +		return fbnic_hwmon_read_alarm(fbd->fw_cap.volt.min, *val, val);
> +	case hwmon_in_max_alarm:
> +		return fbnic_hwmon_read_alarm(*val, fbd->fw_cap.volt.max, val);
> +	}
> +
> +	return -EOPNOTSUPP;
>  }

[ ... ]

> @@ -138,10 +188,14 @@ static const struct hwmon_ops fbnic_hwmon_ops = {
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

These five entries create the user-visible alarm files, and their semantics
become part of the ABI once merged, which is why the question above about
latched versus computed alarm state seems worth settling first.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260908225737.3034403-1-limzhineng2%40gmail.com
