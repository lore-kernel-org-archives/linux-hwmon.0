Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D674D369D5B;
	Fri, 29 May 2026 05:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780033058; cv=none; b=qrjXSUTq28bO/6+5FcJ5OPRbNpOCJntmg2pMcN8YdiicLndQs+z3YyQN1jyZK33iJEtdosNShZie4eMx9eW26lAUFjePJZechrmiWw72mMZAZ1tFJQEkCjN2jo5iYW5wEkUkp9/YGlHIKPBqYNS5aTyLQ9bzdbZvork75SAG294=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780033058; c=relaxed/simple;
	bh=K9WFXYzbsh/m8MeVFM605XIzF/P2IVFKg/UbAV0bTwU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZvjlU7rHr8zpyutvhjofUh1XCUlHHUk29GzyOLwbgzSJIKP5GljHmV8gws6NgXOc65hgr4RGqqawxy/j32yMQSl52QEyMZh8Vbpnkj8hjhEbnHWi4R6aAAC6i023+Yhy5v2qOzBPaxYtxjPaz295WiPY4svZ76QhxC3SyyIuwTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=V1ULx6J6; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="V1ULx6J6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1780033049;
	bh=K9WFXYzbsh/m8MeVFM605XIzF/P2IVFKg/UbAV0bTwU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V1ULx6J63x00ZcpTIHpyIveQoPgwr3fV5mUZ8DoaZvOYEqOIBBnhwFSU9+fBg8dTD
	 hGFpTIqJ5vRadA3wL9ERyuxNhtRsmx3wPt5KJv7i/t+LvTqwFcr4D209c18RZW44X0
	 Y2Tj17vAfR6FVhogv8kREUOpHKawmLcGEZHxkzoY=
Date: Fri, 29 May 2026 07:37:28 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Benson Leung <bleung@chromium.org>, 
	chrome-platform@lists.linux.dev, linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] hwmon: cros_ec: Drop unused assignment of
 platform_device_id driver data
Message-ID: <fe146f93-f2c7-406a-9364-f226e93435ae@t-8ch.de>
References: <cover.1779894738.git.u.kleine-koenig@baylibre.com>
 <972c9998054c7944f63266819d6fb08b36edb5c5.1779894738.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <972c9998054c7944f63266819d6fb08b36edb5c5.1779894738.git.u.kleine-koenig@baylibre.com>

On 2026-05-27 17:15:52+0200, Uwe Kleine-König (The Capable Hub) wrote:
> The driver explicitly set the .driver_data member of struct
> platform_device_id to zero without relying on that value. Drop this
> unused assignments.
> 
> While touching this array unify spacing and 

> use named initializers for .name.

Not sure why this is better.

> Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>

... but it doesn't really matter, so:
Acked-by: Thomas Weißschuh <linux@weissschuh.net>

> ---
>  drivers/hwmon/cros_ec_hwmon.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwmon/cros_ec_hwmon.c b/drivers/hwmon/cros_ec_hwmon.c
> index 7c308b0a4b9e..f6cf254395a8 100644
> --- a/drivers/hwmon/cros_ec_hwmon.c
> +++ b/drivers/hwmon/cros_ec_hwmon.c
> @@ -654,8 +654,8 @@ static int cros_ec_hwmon_resume(struct platform_device *pdev)
>  }
>  
>  static const struct platform_device_id cros_ec_hwmon_id[] = {
> -	{ DRV_NAME, 0 },
> -	{}
> +	{ .name = DRV_NAME },
> +	{ }
>  };
>  MODULE_DEVICE_TABLE(platform, cros_ec_hwmon_id);
>  
> -- 
> 2.47.3
> 
