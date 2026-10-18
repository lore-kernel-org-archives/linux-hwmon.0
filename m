Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 318BC3C2782;
	Sun, 18 Oct 2026 22:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792363845; cv=none; b=BRRROPglTBnbnv3CMUjvhOeB021P7zVUOnBUOgpcA7ahcUXt0KAuI6AgjkXFfOW5IvLLYZy/Peja2zeZfCrJGExOI5kLsHDy0FG+27Z2rt+t3uOxpWYc9cS/h+At7LdXL395TicExY13C2YuJ2JH78FumSUSWTER051/Ry93Ync=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792363845; c=relaxed/simple;
	bh=BsnodO9bUqcXqBPqHsLiIGUph5X+v/Dtrr+3+iwEpOc=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MzawEEMVxQv06vgwtBZgWmlm5RlzrfpibYY8/oHf2nZr46y9oC6jpkBBcp9Wvb2EKhS41gx9xKl4kF0pbijoHp9O/iE8XT0prELQbAaTYhBgSy+n268u37T3W6Q0WHHiMea+rmOPcgPtudgriFXvQiZsffs+IpwCZQXLKyf/RTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ivcZII2J; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ivcZII2J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1876F1F000C4;
	Sun, 18 Oct 2026 22:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792363843;
	bh=PiRVxH4R2qsJog4P9NbvU7dE8sn7+0Hca2L4IHl67VU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=ivcZII2JXUjMRfsvfGgSGiSY7bA5fgHAvZhN7rZ+7szCSmtFyyxHlv0t93IzcHaUZ
	 7v8qlIVxqOg+sxTCsFCDHXckYzYKBICW7q83WjN7RsiU5cs7CLbq7d706S7Jkv39W+
	 O1Ehz6HXOn3OHTZvzNlNU3U6BBq4mHMCVVHTc1EiGrnhRFNz1E9pvMwhb5HnnoJb8C
	 Ve3KLFn0VoGu05YjICgquupilzq5WjFntKDDuK2T3TweGTzVcT3hFWdmDhSZpQI9p0
	 QNW8eqN+7B+kQ6Wm1OvNFEgE6dXF1m/Lszd7OHfeplRRPKhJvyhI/rQAZJevsuWAqA
	 saEN4bHkTjGJA==
Subject: Re: [PATCH net-next v4 2/6] eth: fbnic: cache hwmon sensor readings
From: netdev-bot+sashiko@kernel.org
To: limzhineng2@gmail.com
Cc: alexanderduyck@fb.com, kuba@kernel.org, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, pabeni@redhat.com,
 linux@roeck-us.net, horms@kernel.org, hmohsin@meta.com,
 mike.marciniszyn@gmail.com, kernel-team@meta.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, zinclim@meta.com
Date: Sun, 18 Oct 2026 22:50:42 +0000
Message-ID: <179236384262.3135.12215729347519460836@kernel.org>
In-Reply-To: <20261014222225.2803660-3-limzhineng2@gmail.com>
References: <20261014222225.2803660-3-limzhineng2@gmail.com>
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

- [Low] fbnic_mbx_init()
  (drivers/net/ethernet/meta/fbnic/fbnic_fw.c:112-113) resets…

--

eth: fbnic: cache hwmon sensor readings

This commit caches the last TSENE temperature and voltage readings in
struct fbnic_dev. Hwmon reads are served from that cache for the rest of
the current jiffy. The cache is seeded with the FBNIC_SENSOR_NO_DATA
sentinel in fbnic_mbx_init(), so the first read always goes to firmware.

> diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_fw.c b/drivers/net/ethernet/meta/fbnic/fbnic_fw.c
> index 49b8813a35643..82307f212f583 100644
> --- a/drivers/net/ethernet/meta/fbnic/fbnic_fw.c
> +++ b/drivers/net/ethernet/meta/fbnic/fbnic_fw.c
> @@ -105,6 +105,13 @@ void fbnic_mbx_init(struct fbnic_dev *fbd)
>  	/* Reset FW Capabilities */
>  	memset(&fbd->fw_cap, 0, sizeof(fbd->fw_cap));
>  
> +	/* Seed cache with sentinel so the first read always refreshes. The
> +	 * cache mirrors what firmware reported, so drop it when the mailbox
> +	 * restarts.
> +	 */
> +	fbd->hwmon_cache.temp_mdeg = FBNIC_SENSOR_NO_DATA;
> +	fbd->hwmon_cache.volt_mv = FBNIC_SENSOR_NO_DATA;

[Severity: Low]

Can these stores race with a sysfs read in fbnic_hwmon_sensor_read()?

The hwmon device stays registered during PCI error recovery.
fbnic_hwmon_unregister() is only called from fbnic_remove(). The mailbox
is restarted on that path:

fbnic_err_slot_reset()
  __fbnic_pm_resume()
    fbnic_fw_request_mbx()
      __fbnic_fw_enable_mbx()
        fbnic_mbx_init()

This path runs under devl_lock(). The hwmon read callbacks are only
serialized by the hwmon core lock, so nothing orders the two.

Suppose a reader has already received a successful TSENE completion and is
preempted just before this code in fbnic_hwmon_sensor_read():

	cache->temp_mdeg = fw_cmpl->u.tsene.millidegrees;
	cache->volt_mv = fw_cmpl->u.tsene.millivolts;
	cache->last_read = jiffies;

fbnic_mbx_init() can then store FBNIC_SENSOR_NO_DATA. When the reader
resumes, it writes back the pre-reset readings with a fresh last_read.

Wouldn't that undo the "drop it when the mailbox restarts" invalidation?
KCSAN would also flag these plain concurrent loads and stores.

The practical effect is small. FBNIC depends on 64BIT, so the s32 stores
can't tear, and a stale value would only be served for the rest of one
jiffy.

Could the invalidation be done under hwmon_lock(fbd->hwmon) when
fbd->hwmon is set? Another option is READ_ONCE()/WRITE_ONCE() with a
validity scheme.

The same unlocked pattern appears to remain later in the series, where
temp_alarm and volt_alarm are also seeded in fbnic_mbx_init() without the
lock.

> +
>  	/* Reinitialize mailbox memory */
>  	for (i = 0; i < FBNIC_IPC_MBX_INDICES; i++)
>  		memset(&fbd->mbx[i], 0, sizeof(struct fbnic_fw_mbx));

[ ... ]

> diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c b/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c
> index 6c8c66ab86c13..0c3fe2a372275 100644
> --- a/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c
> +++ b/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c

[ ... ]

> @@ -72,7 +78,12 @@ static int fbnic_hwmon_sensor_read(struct fbnic_dev *fbd, int id, long *val)
>  		goto exit_cleanup;
>  	}
>  
> -	*val = *sensor;
> +	/* FW returns both readings in one response, cache both. */
> +	cache->temp_mdeg = fw_cmpl->u.tsene.millidegrees;
> +	cache->volt_mv = fw_cmpl->u.tsene.millivolts;
> +	cache->last_read = jiffies;
> +
> +	*val = *cached;

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261014222225.2803660-1-limzhineng2%40gmail.com
