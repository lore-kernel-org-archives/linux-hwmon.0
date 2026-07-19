Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31EA03921E9
	for <linux-hwmon@vger.kernel.org>; Sun, 19 Jul 2026 14:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784470410; cv=none; b=leODJy1jnv07o5FIf9zgSKLVgy7uErF4t/zJ7KISCwMPZlR1af0gps1ZAlx7C5wLAbNY/Gz9scEhXZT985Nodo1mzQBOAfO0zOz6AN3xjqdftnKY6kQ7REBmY1VG3yhmGVW/pHUCo4MIbVeK7DWPaRrH4/KGX1ukZ3bJUEjO4hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784470410; c=relaxed/simple;
	bh=37p3ImclFvdTwDfTBoPkMZmKKQW330CcKW9ITTBbnLA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C5o7LtGU7s5i6dTYFpAzDXW3hv6v2ObcqIG6GfHHla8oVl283GtDDuxBRvzDeSDuOLh8DKuYrOtHlu9bLGenIz5myYYqb4kJ2stfbmvJXX73Hf/1H5YjqbJh918EnddMfxT7LBeFWt5WuG3h/KNGayleg78k5wmfDjGJ7SD3Www=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IPf2sYgt; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IPf2sYgt"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2cca0c5799eso68583545ad.0
        for <linux-hwmon@vger.kernel.org>; Sun, 19 Jul 2026 07:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784470407; x=1785075207; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ntpNefQytHokS2a7/5H3L87tuEC3Cqf2CDF62E9JOe4=;
        b=IPf2sYgtBQxNjpVdLiffzbDO7QwTbI22oxI7KE/PXtNq37VzU6DuVATdCzt35A6PkZ
         gHZ5/aSFFZEcvKsaNDkmro5MEXqaIdKbJxZeoh3oaOunE9sqQZ26wLXkIbWUzlRYO+/5
         7Cbrh4s7o4eNzDE+bkLWfsRriIPhdKXYgyJQMkNz8+V/0K6w2LNbyoTQ8xOhgQR+gphE
         3rLctTGPE4GNuZuxfAr46+lvLHv9gvjcgqzxfnH5flRULRBewk7LdYLeAh6WUGivD82a
         O5M+7nmn35sx1dD3g3qHcD6pYMSdAFdSHo06nj54oSjkKvHvEZ+kB3qljVa61F5EurGB
         0eVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784470407; x=1785075207;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ntpNefQytHokS2a7/5H3L87tuEC3Cqf2CDF62E9JOe4=;
        b=diVqn+zChCt0vHdCYLxZHlHb9QbQgcxwgd+cSr9SR4/+4517Ol336ghLw9UKlppwNL
         NanvsvJmDdtMZe0TEBlxl9FCBBQjalQaoZIjPx9HIPPf8VxyhdxqJZDvDZlz5YXeF0bo
         0SuRuUBzI/p1l7n8ba7aIkvSvq9OpJ1obytXR2p0/nj6FQUwNR5A6KvqSP0d2jGtePgZ
         SJMn5bzHBHfNYwcJlTsL4r/uF0V+NkC5b7JRlOkCVuCu6skCuRmitoW0EuFAH1nHHtmP
         hCngrAX0LNSkNKr+nZ7SM/b+Ep1j+e6qo4QtG3y47Sqo/CcCrnr2LhGk8G+mdoKw1T5x
         jj4g==
X-Gm-Message-State: AOJu0YwMM2BH9eVg9pp6YfZvr5xh8xqWoHvQx0gAzzzZVRfaIbXr+lR9
	5GNzvx7tSqZuovmyCK6UOa54BMO+njueHHGCknykp+OIL81632otVVhX
X-Gm-Gg: AfdE7ckZ01m56HhZ7CuFo654LFdvOUPCzx4k6Ta3MAZZEmzFOYNB4gfkl9wUddqchFC
	xfa1VLTVj5ai08ahG5AIugaAwV2LvVm8AA/E97x6VL31xIH6/slAsNGifR+PuWxheV/ANIajPOQ
	hQSzpKxELEUXD2yG+c1rNTcUtiCQck3Feangmv854xl35cPsc4NX1cExMW8dMFLpBy7AskJtSdH
	RMWC0DzRcpGs9z1ovyH/v/+sxPUSXBcg4FjMtx1PVtvIht453WqqIXWUZibt9S8yF3TML8ksZCk
	6Z8WqazrqADxsQXDUGnBSyNkXcoftxCqJKzb7X7MycFfO7s1DGEZ5uRuJ4qHscJNHQqLNTBDmHP
	N5BPwbNe7xspPOAo5FRyeTLEA6vwSCXBW4uUXTMcIu2erpAZTBcQHfzC0SJRRrzDtiozTEhpmq9
	8EqJvKJXNVNy5ZbPZ12Rr6dmF4xg==
X-Received: by 2002:a17:902:fc4e:b0:2bf:7b62:a038 with SMTP id d9443c01a7336-2cf34836892mr120951225ad.9.1784470406687;
        Sun, 19 Jul 2026 07:13:26 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf347a62fdsm41343825ad.83.2026.07.19.07.13.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 07:13:25 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 19 Jul 2026 07:13:25 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Eugene Shalygin <eugene.shalygin@gmail.com>
Cc: "open list:ASUS EC HARDWARE MONITOR DRIVER" <linux-hwmon@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/1] hwmon: (asus-ec-sensors) fix EC read intervals
Message-ID: <c3d44128-8cd0-4a26-afe5-0fd15b9d642e@roeck-us.net>
References: <20260712110650.1240071-1-eugene.shalygin@gmail.com>
 <20260712110650.1240071-2-eugene.shalygin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260712110650.1240071-2-eugene.shalygin@gmail.com>

On Sun, Jul 12, 2026 at 01:05:03PM +0200, Eugene Shalygin wrote:
> Take INITIAL_JIFFIES into account when setting up next update time.
> 
> Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>
> 
> Fixes: d0ddfd241e57 ("hwmon: (asus-ec-sensors) add driver for ASUS EC")

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/asus-ec-sensors.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/hwmon/asus-ec-sensors.c b/drivers/hwmon/asus-ec-sensors.c
> index 29a23484cbe7..eb71e41fd4f4 100644
> --- a/drivers/hwmon/asus-ec-sensors.c
> +++ b/drivers/hwmon/asus-ec-sensors.c
> @@ -1009,7 +1009,7 @@ struct ec_sensors_data {
>  	/* sorted list of unique register banks */
>  	u8 banks[ASUS_EC_MAX_BANK + 1];
>  	/* in jiffies */
> -	unsigned long last_updated;
> +	u64 next_update;
>  	struct lock_data lock_data;
>  	/* number of board EC sensors */
>  	u8 nr_sensors;
> @@ -1278,13 +1278,12 @@ static int get_cached_value_or_update(const struct device *dev,
>  				      int sensor_index,
>  				      struct ec_sensors_data *state, s32 *value)
>  {
> -	if (time_after(jiffies, state->last_updated + HZ)) {
> +	if (time_after64(get_jiffies_64(), state->next_update)) {
>  		if (update_ec_sensors(dev, state)) {
>  			dev_err(dev, "update_ec_sensors() failure\n");
>  			return -EIO;
>  		}
> -
> -		state->last_updated = jiffies;
> +		state->next_update = get_jiffies_64() + HZ;
>  	}
>  
>  	*value = state->sensors[sensor_index].cached_value;
> @@ -1402,6 +1401,7 @@ static int asus_ec_probe(struct platform_device *pdev)
>  	if (!ec_data)
>  		return -ENOMEM;
>  
> +	ec_data->next_update = INITIAL_JIFFIES;
>  	dev_set_drvdata(dev, ec_data);
>  	ec_data->board_info = pboard_info;
>  
