Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDD774206D
	for <linux-hwmon@vger.kernel.org>; Thu, 19 Sep 2024 08:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726734633; cv=none; b=ECvKvB/D7jOop3MlC4QCnKv+twIlaDSZxV9tzfN4LydwVh5IohI5QoBC1iKoTwAFMtb/CD54PIZeH3MzG8SugnscOO7NCIu9olRgcGmEQPW3i0HmdDLF/Uf2P5af4D7pxmV8ms6WxEAh65246kRdCnQDZkBEZ4hSqOELDpYmSxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726734633; c=relaxed/simple;
	bh=aGhfLxZVnFwHurpTrYURAaQEZoj0tvcV7A7ja9PC56I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iOePA2aT+vk7xH7+aWGcwat9upIg0VzXtf6eJhz507fTiGZbDPg4+wU6OCRc4onRnLYcivF93+cPdtc7V8W/Ji2iagFD+Ex44VjF6xRIeouYBofb2oMQ4PQ/z08+i3ILJXE3QXJaP0VfxSrStmwjxWHgselace2SwIJ+WFkop5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eh8BlCyW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eh8BlCyW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DF45C4CEC4;
	Thu, 19 Sep 2024 08:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726734630;
	bh=aGhfLxZVnFwHurpTrYURAaQEZoj0tvcV7A7ja9PC56I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eh8BlCyWm/hgNy9hs2cI9kFDzpocIwjGEg/4+ZajUo0F8Zs4CuDGhX9nPf+LEsKJz
	 gz+9iHzYhEIuQAB9Qvz4N2BQPpRfD4riyfiXfoU/V9nPHPWp09p1NJOAo9q1PbacGY
	 j7EltP4tYDGgvHA8D5bNnoOlQUTKx8nzX5iU/oVyPY5jC4vc/0TtPrMbzFnm4GlBVU
	 dQZWW7CFSAzo0QUcfqxvyU+AwWS65ri1nRx/Xfrr9U/jBu+s9Wgum4pDcncNNpQHqH
	 HKq2GXKGQwkbDiNM/rkFw++ySV/zxfKr9XZtvHZ1EDAPTOj7Z45Yw3ufFwuqxTQEwm
	 5XUR3s4C7x8FA==
Date: Thu, 19 Sep 2024 08:30:28 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH 1/2] hwmon: (ina2xx) Add support for has_alerts
 configuration flag
Message-ID: <ZuvhJHxfkycgUVN0@google.com>
References: <20240913003145.1931634-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240913003145.1931634-1-linux@roeck-us.net>

On Thu, Sep 12, 2024 at 05:31:44PM -0700, Guenter Roeck wrote:
> Add configuration flag indicating if the chip supports alerts and limits
> to prepare for adding INA260 support.
> 
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>

> @@ -155,6 +156,7 @@ static const struct ina2xx_config ina2xx_config[] = {
>  		.bus_voltage_shift = 3,
>  		.bus_voltage_lsb = 4000,
>  		.power_lsb_factor = 20,
> +		.has_alerts = false,

No strong preference: or just don't set it.
