Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1404A3EA957;
	Fri, 11 Sep 2026 04:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789102718; cv=none; b=Ygr9gLWpkQP1mRJHtBdUXh1gK/6lXkBOgkjoGyu7ly5ce5diQwo4EJ3h1f0UMGKu/0hL549sb5W5c2O+CJ/7hYRn3tG0B97ltk7Ziw/ljSrv9V3/GBNvymVTzqGNUtms17PMJx5mK9APjx2mJzjF682niKjUQKC2GFA1BmXDQAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789102718; c=relaxed/simple;
	bh=PcoW02aKiumAzv31hlu0gloWZkv5YlL5DKyxMv8xn6c=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZSipgrk3QXbZ9hJTBI7YFOPKJG2dZtUEf9Pf7hJ/UCSQybqk/iwSlaisYoKTxRYwSUbOnqOPVhItZoLMp1W2duyX/49oD7rE+Sc5rcDwEfn5xMiQJHhZWM23xeOB0etDhE4j5FyztEeUE5H7AvsQMlTQxymgeo7OjogcFjZ049g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c01G4QB/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c01G4QB/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D52D31F00893;
	Fri, 11 Sep 2026 04:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789102716;
	bh=Sgl7jWW7+snT3KTwzH+9tOEtTA5xJEYcCqA9VzWmklc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=c01G4QB/hyLbkUVvZAergd0BXteTSKSw1gmqNqIAnHC/1SP0We1Ql35uyJrsd9ovH
	 AsxaJbiWpzN3IDC6FlH0Hpq4oNJb3Eqv1fjWYlMlO/lqV9qkgedUW1iMQZNA/0WXsq
	 u+plEXG4D/0u7E1iD1/f+3dcZiq9Dr9pviy/V+sA9dPOmUsqZogRckowgvEPFiUXSd
	 0EA6VV2eUW2KZEQ7ghypcAEoA2SveDPUgmHoW5PgGwsKnnQ2kg/Iek2tQShX1kcpDT
	 93PtJ36mQW9WyhxNZF6Ry7UPAQubhlXiTsSVPBeijTumKUk2l+3+ZB4xJSRdTJBgfl
	 bZCxrgNyVUxCw==
Subject: Re: [PATCH net-next v3 3/6] eth: fbnic: cache hwmon sensor readings
From: netdev-bot+sashiko@kernel.org
To: limzhineng2@gmail.com
Cc: alexanderduyck@fb.com, kuba@kernel.org, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 linux@roeck-us.net, horms@kernel.org, mohsin.bashr@gmail.com,
 kernel-team@meta.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hwmon@vger.kernel.org, zinclim@meta.com
Date: Fri, 11 Sep 2026 04:58:35 +0000
Message-ID: <178910271541.219967.12326431015095958990@kernel.org>
In-Reply-To: <20260908225737.3034403-4-limzhineng2@gmail.com>
References: <20260908225737.3034403-4-limzhineng2@gmail.com>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider:

Critical: 0 · High: 0 · Medium: 0 · Low: 1

- [Low] Forward-referencing comment on the newly added
  FBNIC_SENSOR_NO_DATA macro in…

--

eth: fbnic: cache hwmon sensor readings

The patch caches the last TSENE temperature and voltage reading in
struct fbnic_dev and serves hwmon reads from that cache for the
remainder of the current jiffy, so a single firmware round-trip can
satisfy a batch of attribute reads. The cache is seeded at registration
with a new FBNIC_SENSOR_NO_DATA sentinel so the first read always
refreshes.

> diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_fw.h b/drivers/net/ethernet/meta/fbnic/fbnic_fw.h
> index d84723e4cfa3..42a5f83ddb45 100644
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

This isn't a bug, but does the comment describe more than this patch
implements?

At this commit the only users of FBNIC_SENSOR_NO_DATA are the cache seed
in fbnic_hwmon_register():

	fbd->hwmon_cache.temp_mdeg = FBNIC_SENSOR_NO_DATA;
	fbd->hwmon_cache.volt_mv = FBNIC_SENSOR_NO_DATA;

and the cache-validity test in fbnic_hwmon_sensor_read():

	if (*cached != FBNIC_SENSOR_NO_DATA && cache->last_read == jiffies) {

There is no threshold concept yet: struct fbnic_fw_cap has no temperature
or voltage threshold fields, and fbnic_hwmon_info[] registers only
temp1_input and in0_input.

The "a threshold the firmware never populated (older firmware)" wording
only becomes accurate later in the series, once the capability parser
starts using fbnic_tlv_attr_get_signed(..., FBNIC_SENSOR_NO_DATA) and
fbnic_hwmon_read_threshold()/fbnic_hwmon_read_alarm() compare against it.

Would it be clearer to restrict the comment to the cache semantics here
and extend it in the patch that adds the threshold handling?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260908225737.3034403-1-limzhineng2%40gmail.com
