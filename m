Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16AB03E6396
	for <linux-hwmon@vger.kernel.org>; Fri, 18 Sep 2026 16:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789750788; cv=none; b=eZIxYyyILtG0mXuJwiUpb3fZWPjYd3f6QCNtNWDPJJP1SMAqT9v1duVdRWol0msw77WDWzhKDODUVNl0U50FFhbUnmHcv+JMlP5KNGSmNTg4dHYkjb0X6ZJSUcwklpwcO8LpEkss8Q8x0nEnQ1KoeAWFcq+AzJCyMO3mNfRPuU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789750788; c=relaxed/simple;
	bh=7MAUgk+sgbNvdd8ON7ni7gPcT/zwVM7BkjzKDHwRsmY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VysyU3xsNZQ5iwi2VR41ndMRbIe6DaMJjZdmKlWfuHLfKITEFdZ0N8ps9FkGlQES38qy2nOPy3ndceDVpp7huFBJl6JMkm5oeSxgG2KfuG6sVSzgMdADXp2R4ga/SHr7VdlvHdM1EgVlzbxc7lpcMhHNPO0CbodAkNarvWVoxtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IU8yuekA; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IU8yuekA"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-85469a34907so1195717b3a.1
        for <linux-hwmon@vger.kernel.org>; Fri, 18 Sep 2026 09:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789750785; x=1790355585; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wA4tmVoPxsXQFVURaD8KIg5IcFXnK99vMU7hA2iMDIc=;
        b=IU8yuekAu5q+tTsseAnEQEUUrTv350/05We+lWT0Ue6w9rAvH30GMrJSXEfl4YMzV/
         2IcdyROBQU7eLhwqPLdQjztFQ3v+2UUqNfd3gwx3RJJcYsPxcGVhP/kSHisDbU9h9mar
         0NU2raPKg9UNtVJBzM8jOool9xihbj8enPt8Bfu+WXVT9+ilH6b4e6HuIevV+3q6HMLx
         zJKjNTYBio6TnubLA2g+BgZUYNXakZTfdMCIoUWAg0bJr3UfUxXe8a0O0hLushlFoOhS
         5H/O7JCLqMp/nlzuCpiNKikhyoCoKDhs5zv9Z1hB3D5jwIIEZKYYwV11p5n30koOXt+w
         XBPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789750785; x=1790355585;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wA4tmVoPxsXQFVURaD8KIg5IcFXnK99vMU7hA2iMDIc=;
        b=ingnp2HDkz7nwnkH46vkd4u8JP4LIWhbfN2B+TW3ae2EbUDSUbBs6vN44Ojz8zigQ1
         agQEa9HYcEcyNemc3fgjD9HWRHzRyUoqjpiMMxJICrI5Yfjq2238VmoJY/smWzGuiSS7
         sj4p3ojwAwWh18erQto7X4IqL4dL3EduYF8fA2i8+I1PPwSFZSzO6hmvM6klpy+YYaV7
         zvJCl0Wip5H6X8u10tC71v9NaugMdVQV1ZITTcA2uQ8L2BxdAnTzqObBAYniSdKWJ1PK
         rM78NjR6cA7/rSs7GK+hK7C1TcIRIzplFbWCzGLM1bdjFk0Xa/VNGTFQj6NA6s0+kbfS
         MJIw==
X-Forwarded-Encrypted: i=1; AKwUvBxVIQ7foVH+eE1xQLGSMSTOohYGDANBRPRV/4n2kLe5n0Ew82OQBgcYD5ZmJJEgotXCacvdn8kLA2oj1w==@vger.kernel.org
X-Gm-Message-State: AFuF++mQbUSw0O8LeKPwn1amwPiKIJyuWDoA5wE5FR+5nFkgmSk9rmOr
	ssc6gBjYmMbB0U6/EB040Vc4lhjz6dS2W0G2XUceGzpl05uu9Zy8AUiU
X-Gm-Gg: AYBFou3cvbavhqKqgyTUg8xRzKPwL1jcs4/qDkRmS48QY44USWB7E5q9mhsAHGnFgqT
	29vNyjnTPY/MGePrznxLAHLHkRAe5IEvzmE/bFg0QUjltZS/BWG0+YIynfUy8VasnMlOo0p+U7c
	26yUhNLfM7xzO5db6hCk/yyFPE9fjXVH0EiGPpp8H52SdYvOrlBm/fv3igAl8MmSA/x63Jl76L8
	WjydDTjcM5r98bSa10yA+jIMSw/w5PMSF5RdShv5laRpzA5OylNxBRc1GJyjlDTY1Ux95wNKIJA
	pg89P66z3h0C+HNd4t2p4mMXxHPC6xPkXe3h6N3FamOxViF9eUPpFU/00h4xofiV/YnKNi8r7Je
	qQDKmLB4gwFjbB/uEZSz6rhcALVG9F4N1q0fWL2u+QtUi+VxNbRWQNcyhKynAWT73uzYqsqQrd3
	XiMxPRyVH9x46mmOFDJ71BEvl6VlkdZJ64vI68K+8M5PSf/u8zY+nIYjBSt/DEK7dVEs+NQtaFH
	3n9Kk7aPiLVQx8tgtcwMf3+
X-Received: by 2002:a05:6a21:4cc7:b0:3dd:a196:69d8 with SMTP id adf61e73a8af0-3dda1967a02mr367760637.51.1789750784772;
        Fri, 18 Sep 2026 09:59:44 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc5c50c821bsm1378768a12.22.2026.09.18.09.59.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 09:59:44 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 18 Sep 2026 09:59:43 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Jian Zhang <zhangjian.3032@bytedance.com>
Cc: Iwona Winiarska <iwona.winiarska@intel.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: peci: dimmtemp: Retry unstable DIMM mask detection
Message-ID: <26000aa9-86b0-4fd8-8bda-67f38372cdb7@roeck-us.net>
References: <20260918031831.1937973-1-zhangjian.3032@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918031831.1937973-1-zhangjian.3032@bytedance.com>

On Fri, Sep 18, 2026 at 11:18:31AM +0800, Jian Zhang wrote:
> Add a stable DIMM mask check around PECI DIMM discovery.
> 
> During host DIMM initialization, PECI can answer the DIMM temperature
> configuration reads before every DIMM has reached a stable ready state.
> There is no separate all-DIMM-ready signal for this driver to wait on,
> so a single early read can capture only part of the populated DIMM mask.
> Retrying the mask check avoids locking that transient state into the
> hwmon device layout.
> 
> The first successful scan is saved, and the driver immediately scans
> again before registering hwmon channels. If the two masks differ, the
> driver returns -EAGAIN so the existing delayed detection work can retry
> instead of exposing a partial channel set.
> 
> Signed-off-by: Jian Zhang <zhangjian.3032@bytedance.com>
> ---
> 
> This was tested on an affected platform where probing during
> host DIMM initialization could expose an incomplete DIMM mask. With the
> extra read, the driver observed the completed DIMM mask and exported the
> expected hwmon channels.
> 
> This is intentionally a conservative retry of the existing detection
> path. It does not add a sleep or force another delayed-work interval
> between the two reads, so it avoids adding an unconditional probe delay.
> However, this also means it is not a full proof that the host DIMM
> initialization has completed.
> 
> I am not aware of an Intel-provided all-DIMM-ready indication for this
> path. Feedback would be appreciated if there is a better way to decide
> that the PECI DIMM mask is stable before registering the hwmon device.
> 
>  drivers/hwmon/peci/dimmtemp.c | 28 +++++++++++++++++++++++++++-
>  1 file changed, 27 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/peci/dimmtemp.c b/drivers/hwmon/peci/dimmtemp.c
> index bd3e8715dfec..983e1e415ec2 100644
> --- a/drivers/hwmon/peci/dimmtemp.c
> +++ b/drivers/hwmon/peci/dimmtemp.c
> @@ -285,6 +285,32 @@ static int check_populated_dimms(struct peci_dimmtemp *priv)
>  	return 0;
>  }
>  
> +static int check_populated_dimms_stable(struct peci_dimmtemp *priv)
> +{
> +	DECLARE_BITMAP(dimm_mask, DIMM_NUMS_MAX);
> +	int ret;
> +
> +	ret = check_populated_dimms(priv);
> +	if (ret)
> +		return ret;
> +
> +	bitmap_copy(dimm_mask, priv->dimm_mask, DIMM_NUMS_MAX);
> +
> +	ret = check_populated_dimms(priv);
> +	if (ret)
> +		return ret;
> +
> +	if (!bitmap_equal(dimm_mask, priv->dimm_mask, DIMM_NUMS_MAX)) {
> +		dev_dbg(priv->dev,
> +			"Deferred unstable DIMM mask: %*pbl -> %*pbl\n",
> +			DIMM_NUMS_MAX, dimm_mask, DIMM_NUMS_MAX,
> +			priv->dimm_mask);
> +		return -EAGAIN;
> +	}
> +
> +	return 0;
> +}

I agree with the idea, but check_populated_dimms() already has retry
support. I don't see why it would make sense to add retry detection
(because additional DIMMs were detected) on top of retry detection
(because no DIMMs were detected).

Thanks,
Guenter

> +
>  static int create_dimm_temp_label(struct peci_dimmtemp *priv, int chan)
>  {
>  	int rank = chan / priv->gen_info->dimm_idx_max;
> @@ -322,7 +348,7 @@ static int create_dimm_temp_info(struct peci_dimmtemp *priv)
>  	 * All other states mean that the platform never reached the state that
>  	 * allows to check DIMM state - causing us to retry later on.
>  	 */
> -	ret = check_populated_dimms(priv);
> +	ret = check_populated_dimms_stable(priv);
>  	if (ret == -ENODEV) {
>  		dev_dbg(priv->dev, "No DIMMs found\n");
>  		return 0;
