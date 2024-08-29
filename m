Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F059A1A7AE4
	for <linux-hwmon@vger.kernel.org>; Thu, 29 Aug 2024 14:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724943310; cv=none; b=m6mZ4XNhnZw+DZF44EaW8ocrmw/qaQ1SiTx7mT5zPhCVEqhUkWrUfadS5RN9vanVWmnf/DgT4AbaRTKu/WXz3pMVQd3LuuJB6w/vy//mT+NZsT8irFA5TWwcUJKqy0/3/OHLgYOswoyqd50D93k2TSIw1Wd4bD98tL75m9rM+Tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724943310; c=relaxed/simple;
	bh=q5q6GT7OaA639cUUUr/NuKmEDK1Zb7pH3bvrOb/sUTM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BGwsz+bwDAX3e5QG3jXoORSwtgiEaSXnYGEmkHhD2qLhD2in8MI4XUtT+qhNKaNPh2L1jypgruSwryDWy8Yykq2Geih5TUbrLC08l0osRGTclPWaYM/uUmNUMog94fsq3dZGPWgvzU4BSoPtNZFmchAwMWCRQ1MWdS36iZCS+4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C+OwInAZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C+OwInAZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3902CC4CEC1;
	Thu, 29 Aug 2024 14:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724943309;
	bh=q5q6GT7OaA639cUUUr/NuKmEDK1Zb7pH3bvrOb/sUTM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C+OwInAZEn6jE340R7r3V87BkrlLieZEJihAldcp+otgK7LVaSRDJOcNkGBw8Mjc/
	 yDOvhdpe5S1WaPfWQYxm5i/EY8sRtJnV/sCXZXnCaHdvPgqL2FfZxJV+iCkvtrZHn+
	 4hbiwwsaYUq2rcUHD86X2D3qnBvVFLTASc9BcsL7sTvCifg20kNQej6MZuwk55XLwt
	 I1Rm1fOCduBtXF/qUoZWgqmK8Xmy/t33ZyAtOC2nJsQSDAagIQXe2dyI7RB9Ywb6B4
	 5XxmGwW1LiYc6S2gyr/A/7o0+QPFxwB2POoqE4cEbbKlyCYUiHA5s+Y9UwFoxOCYYy
	 qufGekeHjE8Vg==
Date: Thu, 29 Aug 2024 22:55:07 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH 08/11] hwmon: (ina2xx) Fix various overflow issues
Message-ID: <ZtCLy9Y20v2lxwqw@tzungbi-laptop>
References: <20240827153455.1344529-1-linux@roeck-us.net>
 <20240827153455.1344529-9-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240827153455.1344529-9-linux@roeck-us.net>

On Tue, Aug 27, 2024 at 08:34:52AM -0700, Guenter Roeck wrote:
> @@ -301,8 +307,8 @@ static int ina2xx_get_value(struct ina2xx_data *data, u8 reg,
>  		val = DIV_ROUND_CLOSEST((s16)regval, data->config->shunt_div);
>  		break;
>  	case INA2XX_BUS_VOLTAGE:
> -		val = (regval >> data->config->bus_voltage_shift)
> -		  * data->config->bus_voltage_lsb;
> +		val = (regval >> data->config->bus_voltage_shift) *
> +		  data->config->bus_voltage_lsb;

The change looks irrelevant to the patch.

Either with removing the change or not,
Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
