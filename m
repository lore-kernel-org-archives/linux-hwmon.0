Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C45AC27703;
	Sun, 18 Oct 2026 22:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792363848; cv=none; b=FJdLLVuX6yPA4J46gD9F0C//XYbFyNEZMKHDGQCFEnsmCwEF7Y5jajOnUh+WsIEblXwWLy5sKLTut1jH6uDubYoDROTKMwI8gcLaRWPdEIa837J/RSXhXAn4JdZoYqjSX7TqEcQuwPLZcFF/VtpBGmjOeJG42gR+OQ9ZbflEgEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792363848; c=relaxed/simple;
	bh=2WmoBGXT5Zv1Vfx4ThS05D7UPTnCzpy+A8Cln6IZDvg=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Z+JkHe91sak6bClo+xwZQeIqeyUyVlZzUBXcgVlkVT5ZRG4IDrh4NMDTirtqyO2LBqI+cnKEe5VkA8PY/adzoCSVgp68JRfuRaIHBZ0HmHWopiBwM6nEVU/cZS00UHzd//C2kAu8bV7xeNwjm6Ko/qnzJb6gis3Ak2xPIxgi5hU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dv0jVm5D; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dv0jVm5D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1E7C1F000C4;
	Sun, 18 Oct 2026 22:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792363846;
	bh=8IMZdp5aTozJX/hGZevvohpK3mLzY53mYlNqMGgV6mM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Dv0jVm5DOpB4cJCicAmjuUEM/1kOBRCEkGqriB2ITJEMnDILWp4DaOs60U5cKCd1k
	 i41eH09Po+TNU67b9H+pAazLDh1Qmst1eB/k0HunHoJWu8e+ZTo1uSvQvVOt0vXDFi
	 7+dMNN4CGE5pZyeYkAjmVWRhykpPR8UiYe9W6GHL3mC4q7ITN3lMzIeEg2s92w3vK0
	 t+3KKclX11PdbY8dq5h2OYHQN6W2Ix2k+uJvSOo0EtThQoDbLmFOKbnmfiJBnl49y4
	 eHmXejCZes9xLQLqW4Nc/FRA7njd7cLlxf37YM6KgmSgA2OAXvHh8c3xkTim89LgrA
	 ivKmG7o7ZocuA==
Subject: Re: [PATCH net-next v4 4/6] eth: fbnic: parse the alarm range
 reported by firmware
From: netdev-bot+sashiko@kernel.org
To: limzhineng2@gmail.com
Cc: alexanderduyck@fb.com, kuba@kernel.org, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, pabeni@redhat.com,
 linux@roeck-us.net, horms@kernel.org, hmohsin@meta.com,
 mike.marciniszyn@gmail.com, kernel-team@meta.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, zinclim@meta.com
Date: Sun, 18 Oct 2026 22:50:45 +0000
Message-ID: <179236384550.3135.7080387933674561626@kernel.org>
In-Reply-To: <20261014222225.2803660-5-limzhineng2@gmail.com>
References: <20261014222225.2803660-5-limzhineng2@gmail.com>
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

- [Low] The firmware alarm range is a U32 TLV attribute, but
  fbnic_fw_parse_tsene_read_resp() and…

--

eth: fbnic: parse the alarm range reported by firmware

This commit parses the per-sensor alarm range that firmware reports in
two places: the TSENE read response and a new unsolicited
SENSOR_THRESHOLD_EXCEEDED event. It caches the range in u8 fields in
hwmon_cache. Both fields are seeded with FBNIC_FW_TSENE_ALARM_UNKNOWN
in fbnic_mbx_init().

> diff --git a/drivers/net/ethernet/meta/fbnic/fbnic.h b/drivers/net/ethernet/meta/fbnic/fbnic.h
> index 857a64b518f38..93bf7004b67d9 100644
> --- a/drivers/net/ethernet/meta/fbnic/fbnic.h
> +++ b/drivers/net/ethernet/meta/fbnic/fbnic.h
> @@ -26,6 +26,8 @@ struct fbnic_hwmon_cache {
>  	unsigned long last_read;
>  	s32 temp_mdeg;
>  	s32 volt_mv;
> +	u8 temp_alarm;
> +	u8 volt_alarm;
>  };

[ ... ]

> diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_fw.c b/drivers/net/ethernet/meta/fbnic/fbnic_fw.c
> index d9a00a2ef34da..7863f6ba1e7da 100644
> --- a/drivers/net/ethernet/meta/fbnic/fbnic_fw.c
> +++ b/drivers/net/ethernet/meta/fbnic/fbnic_fw.c

[ ... ]

> @@ -1466,6 +1468,8 @@ static const struct fbnic_tlv_index fbnic_tsene_read_resp_index[] = {
>  	FBNIC_TLV_ATTR_S32(FBNIC_FW_TSENE_THERM),
>  	FBNIC_TLV_ATTR_S32(FBNIC_FW_TSENE_VOLT),
>  	FBNIC_TLV_ATTR_S32(FBNIC_FW_TSENE_ERROR),
> +	FBNIC_TLV_ATTR_U32(FBNIC_FW_TSENE_THERM_ALARM_STATE),
> +	FBNIC_TLV_ATTR_U32(FBNIC_FW_TSENE_VOLT_ALARM_STATE),
>  	FBNIC_TLV_ATTR_LAST
>  };

[ ... ]

> @@ -1497,6 +1502,20 @@ static int fbnic_fw_parse_tsene_read_resp(void *opaque,
>  	cmpl_data->u.tsene.millivolts =
>  		fta_get_sint(results, FBNIC_FW_TSENE_VOLT);
>  
> +	/* Cache here so that it and the threshold event land in the order firmware
> +	 * sent them. Firmware predating alarm state reporting sends neither
> +	 * attribute.
> +	 */
> +	alarm = fbnic_tlv_attr_get_unsigned(results[FBNIC_FW_TSENE_THERM_ALARM_STATE],
> +					    FBNIC_FW_TSENE_ALARM_UNKNOWN);
> +	if (alarm != FBNIC_FW_TSENE_ALARM_UNKNOWN)
> +		WRITE_ONCE(fbd->hwmon_cache.temp_alarm, alarm);
> +
> +	alarm = fbnic_tlv_attr_get_unsigned(results[FBNIC_FW_TSENE_VOLT_ALARM_STATE],
> +					    FBNIC_FW_TSENE_ALARM_UNKNOWN);
> +	if (alarm != FBNIC_FW_TSENE_ALARM_UNKNOWN)
> +		WRITE_ONCE(fbd->hwmon_cache.volt_alarm, alarm);

[Severity: Low]

The alarm state is parsed as a U32 attribute but stored in the u8
fields hwmon_cache.temp_alarm and volt_alarm. The only check here is
against FBNIC_FW_TSENE_ALARM_UNKNOWN, and it runs on the u32 before
the value is narrowed.

What happens if firmware sends a value that does not fit in a u8? 0x100
would be cached as 0 (FBNIC_FW_TSENE_ALARM_NORMAL), 0x101 as
FBNIC_FW_TSENE_ALARM_DEPRECATED, and 0x1ff as
FBNIC_FW_TSENE_ALARM_UNKNOWN.

fbnic_fw_parse_threshold_exceeded_resp() has the same pattern. There,
only DEPRECATED is filtered before the store:

		if (alarm != FBNIC_FW_TSENE_ALARM_DEPRECATED)
			WRITE_ONCE(fbd->hwmon_cache.temp_alarm, alarm);

The volt_alarm store in that function works the same way.

This only happens if firmware sends a value outside its documented set
(NORMAL, BELOW_MIN, ABOVE_MAX, CRIT). The worst case looks like a
wrong hwmon alarm value, since the cached byte is only compared and
never used as an index.

Should the value be range checked before it is narrowed into the u8
cache in both parsers?

>  msg_err:
>  	cmpl_data->result = err_resp ? : err;
>  	complete(&cmpl_data->done);

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261014222225.2803660-1-limzhineng2%40gmail.com
