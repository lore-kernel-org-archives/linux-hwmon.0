Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69BCD4206D
	for <linux-hwmon@vger.kernel.org>; Thu, 19 Sep 2024 08:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726734642; cv=none; b=Ii6lAmwGay5ZhVH8HzyQaiox1rKThvMoPjEpo9siQWtxy9IiuVpFKvkL6db6b07EWCSDwJqV6smls3zJ01rFDwNRxpXwyotG8BhUu9NzF+LaXFs1/VGWxTqdTrR9ueDKxSKgRqInoTJ+v+L3JyKsxzxKM9nfJJkJnE/kBvUjxcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726734642; c=relaxed/simple;
	bh=9JwAbkbEi+ef3Zah9QUuKnL8NOqIeviAR5e+y5plN4I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qSWYHbQMtyVlaKE5beuIWIrhCWiv2/Tq5xyVcwGnKiSVG+fCUco5eE5fPb2P1dPu9XH/YHkKcMWXtHi+XDGrbGn8Y/58eg3JBPC3fA/CDOORdaqWPgfFcroUA68EH1XQGR1uqaZpPqhCpTCblCZ9kz+EYbeue0v2Btmnj7DnGJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T3eYybWN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T3eYybWN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EDB0C4CEC4;
	Thu, 19 Sep 2024 08:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726734641;
	bh=9JwAbkbEi+ef3Zah9QUuKnL8NOqIeviAR5e+y5plN4I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T3eYybWNo46aDrDfp3R+OQh/qFNQlXTrEEd0Zz8pVRcERV3nZ6p2u9rtb8lYsvJG3
	 JaWsk7+AQfkYusekT/wtOtfn9+fLyEYCx0cYQU8tUtWSBez43nE7l/Wm2OG4H5vi+r
	 Kkw/8wEaCi62zMCXvLaScpiGKYkVA/OGQpJpsTtvU296FP08Oo8zAz8n1Bw5XB5Eud
	 pCzX6nwrrwZr4PiXI5z/p1sas/wlImtTLFirOPYA6Owc0p+To4de4wshYFZotHYwYy
	 xBIam+k7Fcnqe4Ydm2Ey+iQPSFT3rPgv31bg5Q7dLp0dgstTQtLwtYiHnczYAvzrAr
	 cvE03ORYW0XDg==
Date: Thu, 19 Sep 2024 08:30:39 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>,
	Loic Guegan <loic.guegan@mailbox.org>
Subject: Re: [PATCH 2/2] hwmon: (ina260) Add support for INA260
Message-ID: <ZuvhL4UbK5MvO67C@google.com>
References: <20240913003145.1931634-1-linux@roeck-us.net>
 <20240913003145.1931634-2-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240913003145.1931634-2-linux@roeck-us.net>

On Thu, Sep 12, 2024 at 05:31:45PM -0700, Guenter Roeck wrote:
> INA260 is similar to other chips of the series, except it has an internal
> shunt resistor. The calibration register is therefore not present. Also,
> the current register address was changed, though that does not matter for
> the driver since the shunt voltage register (which is now the current
> register) value is already used to read the current.
> 
> Cc: Loic Guegan <loic.guegan@mailbox.org>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>

> @@ -157,6 +160,7 @@ static const struct ina2xx_config ina2xx_config[] = {
>  		.bus_voltage_lsb = 4000,
>  		.power_lsb_factor = 20,
>  		.has_alerts = false,
> +		.has_ishunt = false,
>  	},
>  	[ina226] = {
>  		.config_default = INA226_CONFIG_DEFAULT,
> @@ -166,6 +170,16 @@ static const struct ina2xx_config ina2xx_config[] = {
>  		.bus_voltage_lsb = 1250,
>  		.power_lsb_factor = 25,
>  		.has_alerts = true,
> +		.has_ishunt = false,

No strong preference: or just don't set them.
