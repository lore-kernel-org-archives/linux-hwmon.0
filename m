Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A45013CFF6B;
	Sun, 18 Oct 2026 22:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792363846; cv=none; b=ldMm7KODofjtzQyBUljlHVAhbHjKAsi6XohWXIgioUA/zXCFtqexHMENkQc2zmZGR6TgVffswt5i0Rgf1tB52sqHHbwKBj83NPjkiwEga20tce2XYF1V6WHaE1WzCrCf+AvFbtMBppTWSdSbcZBjVC461+2mGQO1NuQ0pYB5sMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792363846; c=relaxed/simple;
	bh=h+0k/Ph5f5AGx5NpU2UXs/+kuI2LeYtW1keBOczx2rE=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=f9HQ1hPTP3D4eUuIWzrbRzlvYGvuir0qQ1CCks6NG74/8dS0t8HS72mJszXLdUKjLVkjwMNtCotUYQwqf+9ZqidwRXD+Zb+B4kly71BKlw4RhMYNRnbVuII3/XIQyw5xbR0zttJwHKD5B2BxuSCyS6EOnv8OxV/6qcM271CJ4pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZR2+WEND; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZR2+WEND"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7867F1F000C6;
	Sun, 18 Oct 2026 22:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792363845;
	bh=Aj+FHwR0kJmbqJQIWLMCSbEfxgTGw/Jq283nwGKP/WY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=ZR2+WENDlrkG6fIcoU+MhuSUuqXqgqrz9JduasPs0wMNuPv/rVj/YN+V5W249Hvx3
	 rKJ4eZkEYt7ROWaCUjninpyg0CB0VPQ09j4Y7lPDyiMHnB//4CJwbVgD4Kts5Votba
	 Z20HYLCaaxcF/rWKoBDMcx7dktoSBa/Kui4SP1i0ZNWc+omqry0iEFDDsBFmmRBmMC
	 +T/jb+uUJIUM+16xr/+rxETsKfyjzbk1E0APd5f5zbjJbPgTN/j8whAQyWHEcWCNbm
	 z2TuzLOGcjr0iVo2ExV/4ebXKU+M6ZQ/kck7LrCta0q7YOgoVGSm23R65En8ABK2kC
	 BAILjuXq7qQlw==
Subject: Re: [PATCH net-next v4 3/6] eth: fbnic: report temperature and
 voltage thresholds via hwmon
From: netdev-bot+sashiko@kernel.org
To: limzhineng2@gmail.com
Cc: alexanderduyck@fb.com, kuba@kernel.org, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, pabeni@redhat.com,
 linux@roeck-us.net, horms@kernel.org, hmohsin@meta.com,
 mike.marciniszyn@gmail.com, kernel-team@meta.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, zinclim@meta.com
Date: Sun, 18 Oct 2026 22:50:44 +0000
Message-ID: <179236384403.3135.8309519042594471612@kernel.org>
In-Reply-To: <20261014222225.2803660-4-limzhineng2@gmail.com>
References: <20261014222225.2803660-4-limzhineng2@gmail.com>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] fbnic_hwmon_is_visible() decides whether temp1_{min,max,crit} and
  in0_{min,max} exist based on fbd->fw_cap.temp/volt.
- [Low] In fbnic_fw_parse_cap_resp(), the new threshold assignments come
  after fbnic_fw_parse_bmc_cap(), and that call returns early on error.
- [Low] The new threshold fields fbd->fw_cap.temp.{min,max,crit} and
  fbd->fw_cap.volt.{min,max} are read and written concurrently with…

--

eth: fbnic: report temperature and voltage thresholds via hwmon

This patch parses temperature (min/max/crit) and voltage (min/max)
thresholds from the firmware capability response and stores them in
fbnic_fw_cap. It then exposes them through hwmon as temp1_{min,max,crit}
and in0_{min,max}. Fields that firmware does not report are seeded with
FBNIC_SENSOR_NO_DATA and are hidden by is_visible.

> diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_fw.c b/drivers/net/ethernet/meta/fbnic/fbnic_fw.c
> index 82307f212f583..d9a00a2ef34da 100644
> --- a/drivers/net/ethernet/meta/fbnic/fbnic_fw.c
> +++ b/drivers/net/ethernet/meta/fbnic/fbnic_fw.c

[ ... ]

> @@ -742,6 +757,22 @@ static int fbnic_fw_parse_cap_resp(void *opaque, struct fbnic_tlv_msg **results)
>  	fbd->fw_cap.anti_rollback_version =
>  		fta_get_uint(results, FBNIC_FW_CAP_RESP_ANTI_ROLLBACK_VERSION);
>  
> +	fbd->fw_cap.temp.min =
> +		fbnic_tlv_attr_get_signed(results[FBNIC_FW_CAP_RESP_TEMP_MIN],
> +					  FBNIC_SENSOR_NO_DATA);

[Severity: Low]
Should these threshold assignments come before the BMC parsing step? Just
above them in fbnic_fw_parse_cap_resp() there is an early return:

	err = fbnic_fw_parse_bmc_cap(fbd, results);
	if (err)
		return err;

If the response carries a malformed BMC MAC array, for example a bad
attribute id, a bad length, or more than 4 entries,
fbnic_fw_parse_bmc_addrs()->fbnic_tlv_attr_parse_array() returns -EINVAL
or -ENOSPC. The thresholds are then never stored and stay at the
FBNIC_SENSOR_NO_DATA value seeded by fbnic_mbx_init().

Probe still goes ahead in that case. mgmt.version was already stored at
the top of the function, so fbnic_mbx_poll_tx_ready() leaves its loop
here:

	if (fbd->fw_cap.running.mgmt.version >= MIN_FW_VER_CODE)
		break;

fbnic_probe() then calls fbnic_hwmon_register(). is_visible sees NO_DATA,
so none of the threshold attributes are created for the life of the hwmon
device. In the final series, temp1_alarm and in0_alarm are hidden too.

The commit message says fbnic_fw_parse_cap_resp() "can return before it
reaches the threshold assignments", but only to explain the sentinel.
Would it be better to parse the thresholds before the fallible BMC step,
so valid limits are not lost because an unrelated field failed to parse?

> +	fbd->fw_cap.temp.max =
> +		fbnic_tlv_attr_get_signed(results[FBNIC_FW_CAP_RESP_TEMP_MAX],
> +					  FBNIC_SENSOR_NO_DATA);

[ ... ]

> diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c b/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c
> index 0c3fe2a372275..4df808f850cf8 100644
> --- a/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c
> +++ b/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c

[ ... ]

>  static umode_t fbnic_hwmon_is_visible(const void *drvdata,
>  				      enum hwmon_sensor_types type,
>  				      u32 attr, int channel)
>  {
> -	if (type == hwmon_temp && attr == hwmon_temp_input)
> -		return 0444;
> -	if (type == hwmon_in && attr == hwmon_in_input)
> -		return 0444;
> +	const struct fbnic_dev *fbd = drvdata;
> +
> +	switch (type) {
> +	case hwmon_temp:
> +		switch (attr) {
> +		case hwmon_temp_input:
> +			return 0444;
> +		case hwmon_temp_min:
> +			return fbnic_hwmon_thr_visible(fbd->fw_cap.temp.min);

[Severity: Low]
The hwmon core calls is_visible only once, from
hwmon_device_register_with_info(). That happens when fbnic_probe() calls
fbnic_hwmon_register(). Can the attribute set get out of sync with
fw_cap after that?

On resume, hibernation restore and AER slot reset, the mailbox is
reinitialized while the hwmon device stays registered:

  __fbnic_pm_resume()
    fbnic_fw_request_mbx()
      __fbnic_fw_enable_mbx()
        fbnic_mbx_init()   /* thresholds reset to NO_DATA */

The next capability response then fills the thresholds again.

The patch handles thresholds that go away (reads return -ENODATA). What
about thresholds that show up after probe? They are stored in fw_cap but
never become sysfs attributes until the driver is re-probed.

That could happen if the capability parse at probe failed early, as
described for fbnic_fw_parse_cap_resp() above, and a later resume parses
cleanly. It could also happen if new firmware flashed through devlink
starts running after a hibernation restore or slot reset without a
re-probe.

In the final series the same probe-time snapshot also decides whether
temp1_alarm and in0_alarm exist.

> +		case hwmon_temp_max:
> +			return fbnic_hwmon_thr_visible(fbd->fw_cap.temp.max);

[ ... ]

> @@ -92,14 +111,58 @@ static int fbnic_hwmon_sensor_read(struct fbnic_dev *fbd, int id, long *val)
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

[Severity: Low]
Are these threshold reads safe against the mailbox writers? The reads of
fbd->fw_cap.temp.* and fbd->fw_cap.volt.* in fbnic_hwmon_temp_read() and
fbnic_hwmon_in_read() are plain loads, and readers hold only the hwmon
core lock.

The writers are fbnic_mbx_init(), which does a whole-struct copy:

	fbd->fw_cap = fw_cap_reset;

and fbnic_fw_parse_cap_resp(), which uses plain scalar stores.

Both run from __fbnic_pm_resume(). fbnic_err_slot_reset() calls that
during AER recovery while userspace is running and the hwmon sysfs files
still exist. That path holds only the devlink lock, which hwmon readers
never take.

The commit message says reads "reject the sentinel with -ENODATA rather
than reporting it as a value". That relies on each read being a single,
untorn load.

Without READ_ONCE()/WRITE_ONCE(), after inlining the compiler may load
the field once for the thr == FBNIC_SENSOR_NO_DATA test and again for
*val = thr. A memcpy-based struct copy also gives no per-s32 atomicity.
Could a reader then report S32_MIN or a torn value? KCSAN would likely
flag this pair of accesses.

Later patches in the series annotate the lockless alarm cache with
READ_ONCE()/WRITE_ONCE() ("Paired with WRITE_ONCE() on the mailbox
thread"). The threshold fields are still unannotated at the end of the
series.

> +
> +static int fbnic_hwmon_temp_read(struct fbnic_dev *fbd, u32 attr, long *val)
> +{
> +	switch (attr) {
> +	case hwmon_temp_input:
> +		return fbnic_hwmon_sensor_read(fbd, FBNIC_SENSOR_TEMP, val);
> +	case hwmon_temp_min:
> +		return fbnic_hwmon_read_threshold(fbd->fw_cap.temp.min, val);

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261014222225.2803660-1-limzhineng2%40gmail.com
