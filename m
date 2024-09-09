Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C46718C928
	for <linux-hwmon@vger.kernel.org>; Mon,  9 Sep 2024 22:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725920626; cv=none; b=LT4pYT45A39gwVbC6OXA5xljDYvQAuQTOC3ChmVCz/XA4gXlxdZ4k/LbEnrrP1pT+dVmsxmarYZscSmzsoN/SOl4iCaEOoccUKmwHT++F5HvTx5QREY1sZXizOfElgA2qVkuF7qg73YwlOftkA89NigNlGNQu7Svg9yDyxYHxIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725920626; c=relaxed/simple;
	bh=ZrYHl8+BkVQ1UebBvC4n7n352T9Glxnfg+bY4S/hFc8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O5zlo4Z+itiwzwSDuGXYeiyptJplny0jJ7cLIK+a7AN04pm5LgQ4bcazox+LRzm2xBelr0YX2taR/zlQ2P3Zl2c9+VvcCS4qGuPA8m/RD3xplYsDdk1tWAxMPY6I7A8vwKWWHFU2jS8mXkQAXm5jn20pbUZ/Gy2WC9qgwX8Y5uY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FXlv3dEl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FXlv3dEl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54522C4CEC6;
	Mon,  9 Sep 2024 22:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725920625;
	bh=ZrYHl8+BkVQ1UebBvC4n7n352T9Glxnfg+bY4S/hFc8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FXlv3dElNSb/X9i0vcdFoo9Z7DKKV5LoExFstahfmRyhSmI73HNb6/elWl14b4GzE
	 0jHPPwS6M4BRtqA9cibpqlMVnMohyPQKGxOt+cmPM/kJ6+NpxX21shFvS++Lp2l1uL
	 fZL4A78I0jgvQ/F0DUDGLP2ktmpToevcCGl7olvtyD4j9FcadHNOAkW3TPRWhzxLsQ
	 5vl4LQKieVsMtbVxWHdLFhXtQ9UqNuLaYvlcNTX/nR+vhQXzDyq71cJZUjt3EbljfB
	 /pEQxX0q/tRoo1PpzCs6vHlVq7e8iCP46lrDAUXVIFuYMpKfo9GWhhrxVJQIakYYCI
	 v7YptNJ43ZcVQ==
Date: Tue, 10 Sep 2024 00:23:41 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Raag Jadav <raag.jadav@intel.com>
Cc: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com, 
	rodrigo.vivi@intel.com, tursulin@ursulin.net, linux@roeck-us.net, 
	andi.shyti@linux.intel.com, andriy.shevchenko@linux.intel.com, 
	intel-gfx@lists.freedesktop.org, linux-hwmon@vger.kernel.org, anshuman.gupta@intel.com, 
	badal.nilawar@intel.com, riana.tauro@intel.com, ashutosh.dixit@intel.com, 
	karthik.poosa@intel.com
Subject: Re: [PATCH v2] drm/i915/hwmon: expose package temperature
Message-ID: <sd5g4sj6t373wu5jfdfaujh73t4uehcri4aqtu7dln4p4huyoh@sa4nivkflc47>
References: <20240906093118.3068732-1-raag.jadav@intel.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240906093118.3068732-1-raag.jadav@intel.com>

Hi Raag,

...

> +static int
> +hwm_temp_read(struct hwm_drvdata *ddat, u32 attr, long *val)
> +{
> +	struct i915_hwmon *hwmon = ddat->hwmon;
> +	intel_wakeref_t wakeref;
> +	u32 reg_val;
> +
> +	switch (attr) {
> +	case hwmon_temp_input:
> +		with_intel_runtime_pm(ddat->uncore->rpm, wakeref)
> +			reg_val = intel_uncore_read(ddat->uncore, hwmon->rg.pkg_temp);
> +
> +		/* HW register value is in degrees, convert to millidegrees. */
> +		*val = REG_FIELD_GET(TEMP_MASK, reg_val) * MILLIDEGREE_PER_DEGREE;
> +		return 0;
> +	default:
> +		return -EOPNOTSUPP;
> +	}

I don't understand this love for single case switches.

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi
