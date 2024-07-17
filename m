Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB73566A
	for <linux-hwmon@vger.kernel.org>; Wed, 17 Jul 2024 13:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721223366; cv=none; b=SSWpbltGn33+AsCI+u6DAVoiXCZrIbAuRTKjyegRAEdQJc0mFBUmG9xMav9Qtv7rA+fi7R4p1dP3U8q8TmWzLyWEwIEJ+YAGfssce5tVuadO+i09pIxX/lxre9zsmfTTMfPNIKzeUdo0SkOktoBF2JZURBK5yU+dLgy/5q+YzCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721223366; c=relaxed/simple;
	bh=KEIaiaFKAOPB21Vt284EkkZTHyGL6Vib/Zy0dPVeiSg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qYz9wk4xRelPVFAeDsSQaxdCt1+MY41S9UQq+9lPFv0eAZrOdy3k3tLTX5briT01fzDZ5HcDRl+5iJJflg8KbMAPWz4uN5+RKIcI5/Y4hFLRiznCfcaUlW6xtmFIqVFM2n4RWGIL4DWihKdW4aP071nB2MrZAKPtYoDoEQiP5yU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uTtUlFeF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uTtUlFeF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41B69C4AF09;
	Wed, 17 Jul 2024 13:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721223365;
	bh=KEIaiaFKAOPB21Vt284EkkZTHyGL6Vib/Zy0dPVeiSg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uTtUlFeFc67V0NvFCBjq2jmgQB5JAmoqc5uQcZwfX3Bh28AyRZKWhO3IOTQ1JP1Ue
	 piUhutz9idR9Q/W7CYFSZozKRznk3A1Pz81E4tq2QnljQHCmm9fuflr+KWHwTP11fm
	 RbVsjO3x2GI9KH5nQhly99xXg6btd7LcsLqYLbLjgqdbmeDTpE99bqJV9iMa1/aG6p
	 VI62IeAzBz24c8vFXaq9Hhs1JnPibCKY+NvhrubCJNHuM2oNO3O4VhwgxrU7GVBGBY
	 OXhmrykbJxs8Lxgr+hRqqsx9zXLULEirxcQpzgiS9UpbywgAHXmLiqbfHb6CC9cA/W
	 AyQ3dve/JDGnA==
Date: Wed, 17 Jul 2024 21:36:02 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH 5/6] hwmon: (max6639) Use multi-byte regmap operations
Message-ID: <ZpfIwpmmte8PUrjk@tzungbi-laptop>
References: <20240716230050.2049534-1-linux@roeck-us.net>
 <20240716230050.2049534-6-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240716230050.2049534-6-linux@roeck-us.net>

On Tue, Jul 16, 2024 at 04:00:49PM -0700, Guenter Roeck wrote:
> @@ -88,25 +88,16 @@ struct max6639_data {
>  
>  static int max6639_temp_read_input(struct device *dev, int channel, long *temp)
>  {
> +	u32 regs[2] = {MAX6639_REG_TEMP_EXT(channel), MAX6639_REG_TEMP(channel) };
                       ^                                                       ^
To be consistent, either drop the space or insert an extra space otherwise.

> @@ -290,8 +281,10 @@ static umode_t max6639_fan_is_visible(const void *_data, u32 attr, int channel)
>  static int max6639_read_pwm(struct device *dev, u32 attr, int channel,
>  			    long *pwm_val)
>  {
> +	u32 regs[2] = { MAX6639_REG_FAN_CONFIG3(channel), MAX6639_REG_GCONFIG };
                       ^                                                     ^
Same here.

> @@ -303,26 +296,13 @@ static int max6639_read_pwm(struct device *dev, u32 attr, int channel,
>  		*pwm_val = val * 255 / 120;
>  		return 0;
>  	case hwmon_pwm_freq:
> -		mutex_lock(&data->update_lock);
> -		res = regmap_read(data->regmap, MAX6639_REG_FAN_CONFIG3(channel), &val);
> -		if (res < 0) {
> -			mutex_unlock(&data->update_lock);
> +		res = regmap_multi_reg_read(data->regmap, regs, regvals, 2);
> +		if (res < 0)
>  			return res;
> -		}
> -		i = val & MAX6639_FAN_CONFIG3_FREQ_MASK;
> -
> -		res = regmap_read(data->regmap, MAX6639_REG_GCONFIG, &val);
> -		if (res < 0) {
> -			mutex_unlock(&data->update_lock);
> -			return res;
> -		}
> -
> -		if (val & MAX6639_GCONFIG_PWM_FREQ_HI)
> +		i = regvals[0] & MAX6639_FAN_CONFIG3_FREQ_MASK;
> +		if (regvals[1] & MAX6639_GCONFIG_PWM_FREQ_HI)
>  			i |= 0x4;
> -		i &= 0x7;

Just a note: this line can be safely dropped.
