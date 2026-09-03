Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5679E367F59;
	Thu,  3 Sep 2026 03:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788405854; cv=none; b=eq5/qUuNDfpy2Mcj2bqdvhecE4sG6RhIgwvWpp/5jTGHhYn+SoyXZZr4fUfV/duyWnWikOkcMUqLHp/22Jyl3BZJzImGmL7p58GRK58VEMIFIfJghFA7DkGck0X10QTKRem0lRgv512OWaW2RPDlxeY+syVpB/uFsPWG+zV+okU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788405854; c=relaxed/simple;
	bh=2gCcHM29+7LD9e5AZNs0oH+GqkPeEOnC4YitkEgOI+k=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Q/YGMhP5J97GewQkQLmQwdppR6JCmWykKVFrCmDOsvWSukOpv8GgTDb2XALY9IIgie/lsNRQWd/si5PWlkOlB6J+Uwu7Lsv+EtFyxnKEMDN32NJNCdP0TKlhhaEQo1yC53dSe85UdzwnfIKOppMJClWB7bfUjErYnawy5qlU72A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=II3Uv5Ew; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="II3Uv5Ew"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27B521F000E9;
	Thu,  3 Sep 2026 03:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788405851;
	bh=9mdT0J5OXjiWu3ZNxLzv2dIQQol0or7cKcr8KJyZ7wo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=II3Uv5EweSvCxGjPh4OSjPmEXJUlWqmtrjfJLNNYKAzHhJdiHSIP0hzdGhKR4qJc+
	 jn0EIB6NT486cKPJ/ny9BEUoVZbhTDOhbm0S7ZhTQkBD4Hqf1sLGPaPOlqzwsBnWYo
	 sHtvWKS6BFOx/U0OgB/RcuOqE5UuadMcl7Ovn2poYXGzrZgTIC75JHkPRPCero4F//
	 BSprJ6uy1/tbng4dOv7tg/ku81DWb2OaXFnYYD9/XMSdnjU4OiKgbYyzxhSCUZl1Mw
	 +0H160r/a6Thl9KbvKXCKPvwTNg6LOvq6BIhtHSPABwCgi+OBGkWP82pHCTJVCkVj7
	 qtsijF2ZVqKMQ==
Subject: Re: [net-next,v2,4/6] eth: fbnic: report temperature and voltage
 thresholds via hwmon
From: netdev-bot+sashiko@kernel.org
To: limzhineng2@gmail.com
Cc: alexanderduyck@fb.com, kuba@kernel.org, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 linux@roeck-us.net, horms@kernel.org, mohsin.bashr@gmail.com,
 kernel-team@meta.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hwmon@vger.kernel.org, zinclim@meta.com
Date: Thu, 03 Sep 2026 03:24:10 +0000
Message-ID: <178840585074.3394541.6341889704023786446@kernel.org>
In-Reply-To: <20260831212234.1212971-5-limzhineng2@gmail.com>
References: <20260831212234.1212971-5-limzhineng2@gmail.com>
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

- [Medium] The FBNIC_SENSOR_NO_DATA sentinel for the new thresholds is
  written only by the five stores at the very tail of…
- [Medium] The five new s32 threshold fields in struct fbnic_fw_cap are
  written from the firmware mailbox context (fbnic_fw_parse_cap_resp(),…
- [Low] struct fbnic_threshold
  (drivers/net/ethernet/meta/fbnic/fbnic_fw.h:54-58) declares…

--

eth: fbnic: report temperature and voltage thresholds via hwmon

The firmware capability response is extended to carry temperature
(min/max/crit) and voltage (min/max) thresholds, which are stored in
struct fbnic_fw_cap. The hwmon channel info is extended so the thresholds
are exposed as temp1_{min,max,crit} and in0_{min,max}, with unreported
values returning -ENODATA.

A few questions on the initialization and locking of the new fields.

> diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_fw.c b/drivers/net/ethernet/meta/fbnic/fbnic_fw.c
> index ff1674eff7ad5..e5669dfd97904 100644
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

[Severity: Medium]
These five stores are the only place FBNIC_SENSOR_NO_DATA ever reaches the
new fields, and they sit at the very end of fbnic_fw_parse_cap_resp().  Can
the thresholds stay at 0 while the hwmon attributes are already exposed?

Two paths appear to leave them zeroed:

1) The BMC block returns early, after fw_cap.running.mgmt.version has
already been accepted:

drivers/net/ethernet/meta/fbnic/fbnic_fw.c:fbnic_fw_parse_cap_resp() {
	bmc_present = !!results[FBNIC_FW_CAP_RESP_BMC_PRESENT];
	if (bmc_present) {
		attr = results[FBNIC_FW_CAP_RESP_BMC_MAC_ARRAY];
		if (!attr)
			return -EINVAL;

		err = fbnic_fw_parse_bmc_addrs(...);
		if (err)
			return err;
	...
}

That failure is only logged by fbnic_mbx_process_rx_msgs():

	err = fbnic_tlv_msg_parse(fbd, msg, fbnic_fw_tlv_parser);
	if (err) {
		dev_warn(fbd->dev, "Unable to process message: %d\n",
			 err);

fbnic_mbx_poll_tx_ready() still returns 0 because it only waits for
mgmt.version >= MIN_FW_VER_CODE, so fbnic_probe() goes on to call
fbnic_hwmon_register().

2) fbnic_mbx_init() does:

	/* Reset FW Capabilities */
	memset(&fbd->fw_cap, 0, sizeof(fbd->fw_cap));

and it is re-run after probe via __fbnic_pm_resume() ->
fbnic_fw_request_mbx() -> __fbnic_fw_enable_mbx(), while the hwmon device
registered at probe is still live (fbnic_hwmon_unregister() only runs from
fbnic_remove()).  If the mailbox does not come ready again, the thresholds
stay 0 for good.

Since fbnic_hwmon_read_threshold() only maps the exact S32_MIN sentinel to
-ENODATA, userspace would then read temp1_min/temp1_max/temp1_crit and
in0_min/in0_max as genuine 0 mC / 0 mV limits, i.e. a board permanently
above its critical temperature and outside its voltage window.

The commit message says:

  "Values the firmware did not report are stored as the
   FBNIC_SENSOR_NO_DATA sentinel in the capability response parser, and a
   read of such an attribute returns -ENODATA."

Should the fields be seeded with FBNIC_SENSOR_NO_DATA where fw_cap is
established (or at hwmon registration) rather than only on the successful
tail of the parser, so 0 is never published as a limit?

> +	fbd->fw_cap.volt.min =
> +		fbnic_tlv_attr_get_signed(results[FBNIC_FW_CAP_RESP_VOLT_MIN],
> +					  FBNIC_SENSOR_NO_DATA);
> +	fbd->fw_cap.volt.max =
> +		fbnic_tlv_attr_get_signed(results[FBNIC_FW_CAP_RESP_VOLT_MAX],
> +					  FBNIC_SENSOR_NO_DATA);
> +
>  	return 0;
>  }
>  

[Severity: Low]
volt.crit is never assigned here, and there is no
FBNIC_FW_CAP_RESP_VOLT_CRIT attribute, so it keeps the 0 left by the zeroed
allocation and by the memset in fbnic_mbx_init() rather than the
FBNIC_SENSOR_NO_DATA convention every other member of the type follows.

Nothing reads it today (fbnic_hwmon_info declares no HWMON_I_CRIT), so this
is dead state for now.  Would seeding all fbnic_threshold members with
FBNIC_SENSOR_NO_DATA avoid publishing 0 mV as a valid critical voltage if
in0_crit is wired up later?

> diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_fw.h b/drivers/net/ethernet/meta/fbnic/fbnic_fw.h
> index 42a5f83ddb45e..68ffd49e0cddb 100644
> --- a/drivers/net/ethernet/meta/fbnic/fbnic_fw.h
> +++ b/drivers/net/ethernet/meta/fbnic/fbnic_fw.h
> @@ -51,6 +51,12 @@ struct fbnic_fw_ver {
>   */
>  #define FBNIC_SENSOR_NO_DATA			S32_MIN
>  
> +struct fbnic_threshold {
> +	s32 min;
> +	s32 max;
> +	s32 crit;
> +};
> +

[ ... ]

> diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c b/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c
> index f35cb00650937..4938f7b391402 100644
> --- a/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c
> +++ b/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c

[ ... ]

> @@ -88,14 +78,58 @@ static int fbnic_hwmon_sensor_read(struct fbnic_dev *fbd, int id, long *val)
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
> +

[Severity: Medium]
What serializes these plain loads of fbd->fw_cap.temp.{min,max,crit} and
fbd->fw_cap.volt.{min,max} against the writer in
fbnic_fw_parse_cap_resp()?

The writer runs from the firmware mailbox context:

fbnic_fw_msix_intr()
  fbnic_mbx_poll()
    ...
      fbnic_fw_parse_cap_resp()   /* five plain stores */

and also from the service task and from fbnic_mbx_poll_tx_ready() during
probe and PM resume.  The reader here runs in process context from a sysfs
read of temp1_crit and friends.  fw_tx_lock only covers the Tx mailbox
ring, and the hwmon core mutex serializes sysfs and thermal accesses
against each other, not against the mailbox context, so there is no common
lock and no READ_ONCE()/WRITE_ONCE() annotation.  Would KCSAN flag these
accesses?

Beyond the plain-access race, the stores republish the fields one at a time
with no publication protocol, so can a reader see a min from one capability
response combined with a max/crit from the previous one?

And because __fbnic_pm_resume() -> fbnic_fw_request_mbx() ->
__fbnic_fw_enable_mbx() re-runs fbnic_mbx_init(), which memsets fw_cap
while the hwmon device stays registered, can a read landing between that
memset and the parser's repopulation return a transient 0 that
fbnic_hwmon_read_threshold() reports as a valid 0 mC / 0 mV limit?

Note that a bare READ_ONCE()/WRITE_ONCE() pair would not close the
transient-zero window; a lock shared with mailbox Rx processing, an
atomically published snapshot, or snapshotting the thresholds once at
hwmon registration would.

> @@ -104,8 +138,11 @@ static const struct hwmon_ops fbnic_hwmon_ops = {
>  };
>  
>  static const struct hwmon_channel_info *fbnic_hwmon_info[] = {
> -	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT),
> -	HWMON_CHANNEL_INFO(in, HWMON_I_INPUT),
> +	HWMON_CHANNEL_INFO(temp,
> +			   HWMON_T_INPUT | HWMON_T_MIN | HWMON_T_MAX |
> +			   HWMON_T_CRIT),
> +	HWMON_CHANNEL_INFO(in,
> +			   HWMON_I_INPUT | HWMON_I_MIN | HWMON_I_MAX),
>  	NULL
>  };
>

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260831212234.1212971-1-limzhineng2%40gmail.com
