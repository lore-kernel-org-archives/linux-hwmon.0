Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA59C35F192;
	Thu,  3 Sep 2026 03:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788405852; cv=none; b=foB0zKRcZ2NaOHsxW9qaPVhJg9AUWJ2iwW2qaqzegm9AK+e4k0+LnZS825CzffVfTcN+3Z8opO7GEcULBQL6y9UBPPqkHDmM8DpCGDlU0bcKIWbhYNP2UQIVvwNfKOM9KyVfK+zpbgpRdGoTT4xEOFBj5AAdi3DW5+EocqSMl9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788405852; c=relaxed/simple;
	bh=VVjapDuQK49pCo5JmvSEzR/2Eh4TFyqwy0kRedIR7Po=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EcTrWdUAmkBOwmXkA0sUza/1OC7sLmPjxc1W/izGKfv1x0wsZ+g8Hz1s7SVt0OszrZDfe51UWLPw2eqGXvZmHhK8ewAtNs38qxUlnq8ig/pkxm5FjMvbzZHBH2VbGj+W78U6zMJKDAZzqPylws/nbxAFNYj1M6zSQRQAYbuWGXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q2FPVqbC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q2FPVqbC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA23E1F00A3A;
	Thu,  3 Sep 2026 03:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788405850;
	bh=x32uFRhQMbE6B7SYkrUR+/pq/u7g4oPnV6y8VjTCL+U=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Q2FPVqbCXDqyxKSx4xOcKN4aH308wSn6/5bwETGi2Z8Bq9JD3GLpCMKZwsgw72Lji
	 epTNVMRjn8C38MDqVSb/uGz/Y0ABgxtWLgG6TJExj51b7D6Nmmy8pJNlaLP8XSkY3v
	 DUPqH6H9viu82sE9HpIzdL9sWWbZ4cDdmAu1p0M03T1kDRFKJERGffevG4z5nueCDz
	 vyBkJqEQk7bBZwQqsms06cEaMSbdLx5sIit5+3QPT4PMzTLI+NUmdH/ng0sxAOnHZh
	 VoCgFvckTq9H7lSqFLH1UMUH4qVU1Mda5GRGqfoGc5MrfI7RQ9W6jTUeAwA8/2X0NI
	 QmlHpMSg1X/ng==
Subject: Re: [net-next,v2,3/6] eth: fbnic: cache hwmon sensor readings
From: netdev-bot+sashiko@kernel.org
To: limzhineng2@gmail.com
Cc: alexanderduyck@fb.com, kuba@kernel.org, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 linux@roeck-us.net, horms@kernel.org, mohsin.bashr@gmail.com,
 kernel-team@meta.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hwmon@vger.kernel.org, zinclim@meta.com
Date: Thu, 03 Sep 2026 03:24:09 +0000
Message-ID: <178840584931.3394541.12792852899042444344@kernel.org>
In-Reply-To: <20260831212234.1212971-4-limzhineng2@gmail.com>
References: <20260831212234.1212971-4-limzhineng2@gmail.com>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider:

Critical: 0 · High: 0 · Medium: 1 · Low: 1

- [Medium] Using `time_is_after_eq_jiffies()` with a past timestamp
  causes up to 24.8 days of stale cache hits due to integer wrap-around.
- [Low] Concern (judged a false positive): the comment added above
  FBNIC_SENSOR_NO_DATA in…

--

eth: fbnic: cache hwmon sensor readings

This adds a small per-device cache for the TSENE temperature and voltage
readings so hwmon attribute reads within the same jiffy are served from
the cache instead of issuing a firmware mailbox round-trip each time.
The cache is seeded with FBNIC_SENSOR_NO_DATA at registration so the
first read always refreshes.

> diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_fw.h b/drivers/net/ethernet/meta/fbnic/fbnic_fw.h
> index d84723e4cfa36..42a5f83ddb45e 100644
> --- a/drivers/net/ethernet/meta/fbnic/fbnic_fw.h
> +++ b/drivers/net/ethernet/meta/fbnic/fbnic_fw.h

[ ... ]

> @@ -44,6 +45,12 @@ struct fbnic_fw_ver {
>  	char commit[FBNIC_FW_CAP_RESP_COMMIT_MAX_SIZE];
>  };
>  
> +/* Sentinel for a sensor value the driver does not have: a threshold the
> + * firmware never populated (older firmware) or a cache entry not yet
> + * refreshed.
> + */
> +#define FBNIC_SENSOR_NO_DATA			S32_MIN
> +

[Severity: Low]
This isn't a bug, but the comment describes two uses of the sentinel while
only one of them exists at this commit.

Grepping the driver at this commit, FBNIC_SENSOR_NO_DATA is referenced only
by the cache seeding in fbnic_hwmon_register() and by the cache validity
test in fbnic_hwmon_sensor_read():

  fbnic_fw.h:  #define FBNIC_SENSOR_NO_DATA  S32_MIN
  fbnic_hwmon.c:  if (*cached != FBNIC_SENSOR_NO_DATA &&
  fbnic_hwmon.c:  fbd->hwmon_cache.temp_mdeg = FBNIC_SENSOR_NO_DATA;
  fbnic_hwmon.c:  fbd->hwmon_cache.volt_mv = FBNIC_SENSOR_NO_DATA;

struct fbnic_fw_cap has no temperature or voltage threshold members yet, so
"a threshold the firmware never populated (older firmware)" has no consumer
here.

The threshold and alarm users (fbnic_hwmon_read_threshold() and
fbnic_hwmon_read_alarm(), together with struct fbnic_threshold in struct
fbnic_fw_cap) do appear in later patches of this same series, so the wording
is accurate once the whole series is applied. Would it be clearer to
introduce the threshold half of the comment in the patch that adds the
threshold users?

> diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c b/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c
> index 38bb26cb8e6cb..f35cb00650937 100644
> --- a/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c
> +++ b/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c

[ ... ]

> @@ -25,26 +26,32 @@ static umode_t fbnic_hwmon_is_visible(const void *drvdata,
> +	if (*cached != FBNIC_SENSOR_NO_DATA &&
> +	    time_is_after_eq_jiffies(cache->last_read)) {
> +		*val = *cached;
> +		return 0;
>  	}

[Severity: Medium]
The cache validity test uses the wrong end of the jiffies helper
family. time_is_after_eq_jiffies(a) expands to
time_before_eq(jiffies, a), i.e. it is meant to be applied to a
deadline that lies in the future, but cache->last_read is a timestamp
in the past (it is assigned plain jiffies right after the TSENE
response is parsed). It happens to give the intended "valid for the
remainder of the current jiffy" behaviour only because
time_before_eq() is a signed difference that goes negative one tick
later.

That signed difference is the problem: once jiffies - last_read grows
past LONG_MAX/2 (roughly 24.8 days at HZ=1000 where jiffies is 32
bits) the comparison flips back to true, and it stays true for the
next ~24.8 days. By that point *cached holds a real reading rather
than FBNIC_SENSOR_NO_DATA, so the sentinel check in front of it does
not help either, and fbnic_hwmon_sensor_read() will happily hand out
a temp_mdeg/volt_mv pair that is weeks old for temp_input,
in0_input and every alarm derived from them, with no mailbox traffic
and no error to hint at it. An idle device whose hwmon attributes are
only read occasionally is exactly the case that hits this.

Comparing against a past timestamp with the time_is_*_jiffies()
macros is fragile in general, so please express the intent directly.
Either store an explicit expiry in the future, e.g. keep
cache->expires = jiffies + FBNIC_HWMON_CACHE_TTL and test
time_is_after_jiffies(cache->expires), or, if a single tick really is
the intended lifetime, test cache->last_read == jiffies, which is
exact and wrap-safe.

While you are there: is one jiffy the TTL you actually want? A
userspace sweep of the whole attribute set, or a sensors(1) run on a
loaded box, can easily straddle a tick boundary and still issue
several round-trips, which is the flooding the commit message is
trying to avoid. An explicit millisecond-based TTL would make the
policy visible and would also make the wrap-safe deadline form
natural.

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260831212234.1212971-1-limzhineng2%40gmail.com
