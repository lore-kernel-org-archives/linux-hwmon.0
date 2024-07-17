Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5498517F39C
	for <linux-hwmon@vger.kernel.org>; Wed, 17 Jul 2024 13:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721223203; cv=none; b=p34X3TgRZgosbHrCpKmIvLgwOQrVCc3/PpdxHH5RqlL7oCUh2viv6FtHyE1fdOKoAKxC7Xw6wF0/W2vQ3mQlgD859T/2WrX4Tq6Y8mq8BpjS5svtbh7FlHVEjv/otp8YttnOfolgePW3A/T3+HmE8/RQ4snGdxCSnZj2Yh2iD1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721223203; c=relaxed/simple;
	bh=Ecjgrn7C5EDMsZaOb2z+OlCVqulzLaXMGjyy1hZi83E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MVbJuSnTkI/9wgj5uGGFd6OiqY1PBBBZtGgw/5/198fIKMPLFc2tf9BPbNbpeP4W5dkv0ESmOVt/eghuosQuoG5vKdiqGOb/OmMt6eFypzoXUZgg2ypBKRrgH4zCpb4gQWED6CEVdBvW/0u15Y5dz5zRZIe8YFVMNRhYzE3HPc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kEiVOaz/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kEiVOaz/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BB1AC4AF09;
	Wed, 17 Jul 2024 13:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721223202;
	bh=Ecjgrn7C5EDMsZaOb2z+OlCVqulzLaXMGjyy1hZi83E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kEiVOaz/H/UY5YmGfWiHUTKufqy/gtUnE14QBrBEEXofCll0WrT2xym2Lv2Dw0K+h
	 OuFu0A4qQusOsVXWYQVJAdKm1kGwbSv55jBiKIWP/EeyZf9QO+rJmDqO9N7gkw2ayO
	 akolNHATbq12/8jTcYQDM9CzpOodQeraj9l51B1pBaquimU2jQ3HDsVER2I7jYeL5m
	 /grqrkNa2I1Zc3LYfGsnYSfYY6ATgWkx1PTdZzEa5lXQH00SouiNYcgsAqzEUKBCe+
	 tgAG3bjGoyuX39twSJ7Yf4FRI11ENfitifbExT17GjA/N2T3IpftpFqXSu1IvkUPpt
	 Db+WsbxxgBA+A==
Date: Wed, 17 Jul 2024 21:33:19 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH 1/6] hwmon: (lm95245) Use multi-byte regmap operations
Message-ID: <ZpfIH6rwm-h1D3gf@tzungbi-laptop>
References: <20240716230050.2049534-1-linux@roeck-us.net>
 <20240716230050.2049534-2-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240716230050.2049534-2-linux@roeck-us.net>

On Tue, Jul 16, 2024 at 04:00:45PM -0700, Guenter Roeck wrote:
> Use multi-byte regmap operations where possible to reduce code size
> and the need for mutex protection.
> 
> No functional change.
> 
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>

> @@ -181,92 +181,77 @@ static int lm95245_read_temp(struct device *dev, u32 attr, int channel,
[...]
> -		ret = regmap_read(regmap, LM95245_REG_R_REMOTE_TEMPL_U,
> -				  &regvall);
> -		if (ret < 0)
> +		ret = regmap_bulk_read(regmap, LM95245_REG_R_REMOTE_TEMPH_U, regvals, 2);
> +		if (ret)
>  			return ret;
> -		ret = regmap_read(regmap, LM95245_REG_R_REMOTE_TEMPH_U,
> -				  &regvalh);
> -		if (ret < 0)
> -			return ret;
> -		*val = temp_from_reg_unsigned(regvalh, regvall);
> +		*val = temp_from_reg_unsigned(regvals[0], regvals[1]);

Just a note:
I took a while for realizing that a regmap_bulk_read() is sufficient here as
LM95245_REG_R_REMOTE_TEMPH_U and LM95245_REG_R_REMOTE_TEMPL_U are continuous.

The same logic applies to the rest changes.
