Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6048529CB52;
	Fri, 11 Sep 2026 04:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789102716; cv=none; b=LcbU3nVY5js83UfVcNkuSPy/CzVVOEvaVaOiODv8KYTz8sYzJsWZ0u4b72XC+BpNt8W7740pg/BaSfeOPrM3yXxmT9jAChqvSrlIBE+kRq4YCdjVElSVRgMSd3Q3YsHqCTb5HUoI/J2H51sCobjyWOKXGRDrLls9cAg4PQWpj9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789102716; c=relaxed/simple;
	bh=gzVZcd0nYK5OknQ2ujvy8noZetZLed2bqxdbIXYSqV8=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=vBPcHe93VFiK2nQ+0S+AWptLFisIkKe59TKyYQSS/K+Wt8XsFtplEm7HSR5xWK2FvvrFVmCdWxRQN893UWNg9Q3PX93s07f7iCWU/vKK5AWXPC8/OL/aAj2dRbfaqFY4sPXK8OJ0JP/BrGF6N7ULlqoMU4hm6jQRNhp0Ym52nRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GhBtBFlD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GhBtBFlD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FD9B1F000FF;
	Fri, 11 Sep 2026 04:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789102715;
	bh=mxLtN1rUAxpxujxcJxVSU0H8JTSHoecCS1f86w2a72w=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=GhBtBFlDSceDJan+8MeQXug2gBMG67ihUbDnuRx67r1l3w+ui8BcUWs3+dovumvta
	 UNvm6vMynPVKm5O4p5mCojtvIXBGKllHhkMtSIQ9T567/mCIml1uuDGjj0VXiYVymp
	 kpzqR2LDxVYMB99QnF2Ojh3VY+9TFT0dRavtry4Un8CDthZCyf7lhMBYv++ly8kMOz
	 mOoDgeoI/DGyiIzAk9knnxcwr6aIXZdloMZ+g3joYLC9wctQZPn9p2QfaUnNgAeLqj
	 zaZhZ4j46SqUTnfuESeuwnCF/ffSzgrNX1dpvoqd9kkzEE66SZLF3YIkbFod1RNZup
	 pwgzuN9kbYFiw==
Subject: Re: [PATCH net-next v3 2/6] eth: fbnic: expose all hwmon attributes
 unconditionally as read-only
From: netdev-bot+sashiko@kernel.org
To: limzhineng2@gmail.com
Cc: alexanderduyck@fb.com, kuba@kernel.org, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 linux@roeck-us.net, horms@kernel.org, mohsin.bashr@gmail.com,
 kernel-team@meta.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hwmon@vger.kernel.org, zinclim@meta.com
Date: Fri, 11 Sep 2026 04:58:33 +0000
Message-ID: <178910271394.219967.9519388161335061129@kernel.org>
In-Reply-To: <20260908225737.3034403-3-limzhineng2@gmail.com>
References: <20260908225737.3034403-3-limzhineng2@gmail.com>
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

- [Low] fbnic_hwmon_ops keeps a constant-returning .is_visible callback
  instead of the core-provided static-visibility field.

--

eth: fbnic: expose all hwmon attributes unconditionally as read-only

This changes fbnic_hwmon_is_visible() so that it returns 0444 for every
sensor type and attribute instead of matching on hwmon_temp/hwmon_temp_input
and hwmon_in/hwmon_in_input. The stated motivation is to prepare for
threshold and alarm attributes added later in the series.

> diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c b/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c
> index 6c8c66ab86c1..38bb26cb8e6c 100644
> --- a/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c
> +++ b/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c
> @@ -20,12 +20,7 @@ static umode_t fbnic_hwmon_is_visible(const void *drvdata,
>  				      enum hwmon_sensor_types type,
>  				      u32 attr, int channel)
>  {
> -	if (type == hwmon_temp && attr == hwmon_temp_input)
> -		return 0444;
> -	if (type == hwmon_in && attr == hwmon_in_input)
> -		return 0444;
> -
> -	return 0;
> +	return 0444;
>  }

[Severity: Low]
This isn't a bug, but is the callback still needed at all here?  After this
change fbnic_hwmon_is_visible() ignores all three of its discriminating
parameters (type, attr and channel) and returns a constant, which is what
the static visibility field in struct hwmon_ops already covers:

include/linux/hwmon.h:
    struct hwmon_ops {
        umode_t visible;
        umode_t (*is_visible)(const void *drvdata, enum hwmon_sensor_types type,
                              u32 attr, int channel);

The kernel-doc there describes visible as "Static visibility. If non-zero,
'is_visible' is ignored", and is_visible as "Mandatory unless 'visible' is
non-zero".  The core honours this in hwmon_is_visible():

drivers/hwmon/hwmon.c:hwmon_is_visible() {
    if (ops->visible)
        return ops->visible;

    return ops->is_visible(drvdata, type, attr, channel);
}

and hwmon_device_register_with_info() accepts a chip that supplies only
ops->visible.

Would it be preferable to delete fbnic_hwmon_is_visible() and write:

    static const struct hwmon_ops fbnic_hwmon_ops = {
        .visible = 0444,
        .read = fbnic_hwmon_read,
    };

The callback is still a bare "return 0444;" at the end of the series
(d8d0db421cc5), so nothing later in the series appears to reintroduce
per-attribute discrimination.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260908225737.3034403-1-limzhineng2%40gmail.com
