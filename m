Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C98332EC8
	for <linux-hwmon@vger.kernel.org>; Wed, 19 Aug 2026 20:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787171537; cv=none; b=l4H/yg5fHUz9+7MDyIMWk73Fvk+1AHpbI8uB4Jggs6X/4f96lYgR4nuz8D8qd6kkrbO6vthWVOXOob5moZADuEhCcyMCDooC5MZ6gfQOmeqMrLfOnjNmNG3ap8fWPGGFhGGpc6wXJxBX5f49JhOvnZMs7qJvYtidPRzo3v4Ydeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787171537; c=relaxed/simple;
	bh=sR917INAPqiRWTwUavwb9f+zXWLqhKiK8ywqX9IbxYw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jyi8ghEQ0IInQL7JZw3cjmuRV9z3slPQ2Q7rtgsL+zUgjnEKBH67q3c5wrky9qXlY9nwEwZqvkEsNRTJf/eYMPMoZ8gd1bHFQZkATUZGZHqsywZnEgeAh5FIF174/Uk6UWG6MF5uhu/DHMFso+YPd+WNnJUDkSXO4SChL4ZQsCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wp1RrccS; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wp1RrccS"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-382ef647e20so1525025a91.1
        for <linux-hwmon@vger.kernel.org>; Wed, 19 Aug 2026 13:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787171535; x=1787776335; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kakQd7SwwB4qJFxzAT3GLQtskQ627s0NDgwkRoO1YnU=;
        b=Wp1RrccSlW1X9+Uaa1CnjB3s3pmxp7EniiOiDc+oDMhRJ6u8Tk5F2zuqktrdtcNhzV
         M05YvG3dnqFyPg8Rrs85KXdVDVM8jnXUco8dRrKVhfDahOSRUuchMInR2YiYfFBVTH/p
         Nkxc2Q+cXV77WyL93cqYvy7OUjulbrY045zyjER18oCu282KE8BG2txIAJy+WhBCE4Tl
         nG2fQ8j3JZtIuOuXSTuqmUY180bhQo3EjyFgCfoA/jz020Im456ZWaDGgqg5bWRLkDwr
         mWyickHWeugP70D72A+1XE/fWH8wF4tdxOEiJ22QUA+D+iUkpJxnqHy9PRAxvzpPnGR3
         TuFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787171535; x=1787776335;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kakQd7SwwB4qJFxzAT3GLQtskQ627s0NDgwkRoO1YnU=;
        b=HgM4BJA8lee48RAyK912KCkfCrVtNAgZYrM5D5TTTD0UzQFxnrxmapnNU11G3cQ6uZ
         2c9/+8oQvscMULa2hBEOIWA+xjhoaPj5ZiOXcX84FZceTl/oq07EAP5nPVgl2cJqGJkj
         Qob01TDDFrCHu/k3WyR7STDoFUZlDAQ6ZefBPdIjqyGm+h8Pr9byAes2KQxo7jOex1Ip
         lNLIIW0TT/6KNH4GYZewH+m+w0Im4VgFKKvDabzkAkPu0ijEV13yNUiFY3boVtyCccny
         SJAsC0gg8xjcG1NTKdqru5Mgvraky+nHeNh1Mbx1Pn8Q0SM8gi6vaob344Hy3oFskqDB
         8V1w==
X-Forwarded-Encrypted: i=1; AHgh+RpWOVpkyRRddPl9YacAR1RHfJFsPw7J6t18eVn8OynqlP6KG+G+QQ3ULVC41FnYEY/ZOLxIm95LdHvabA==@vger.kernel.org
X-Gm-Message-State: AFuF++mm91sNhr6Qd+73idrKb0oShCxSCn20vWc+dKDwtNdO274xUXAf
	bHCPx+91YZfvbTdT8aP/EKAHmRFPDFlimu/lfFy+HIwcfkN3bXJJ1R/g
X-Gm-Gg: AR+sD12UGR2zHHJ2NYu10YgjzDnA8WZk9DS5AQch8RR4jHS8luAyOg2K6hytK3qsmVZ
	izTvoy+QPO04M4qkG3NwuR96ne+oFvpk8UXZvNsVjUqHSphe+fhZjJ7ang6LyZvASFCOueNXd22
	2H/z77q9QpEJXj6//v5XHVjOYfD81nWtYEMtJhMjenD61aLIABIyOjPGZHmg4KFEEObcfmuoRcV
	S52gzLjRgAdFrHWSa+H27aRScZGh3cBILjzmB4HBJYq2ae6uEBmfTQOo1RAf/cgJPXsK88FykTW
	ylnriQelbNKUSfdCeygLqhebCCjAs6CADAMtwcrlr+Owh6iwe850zqP2xkwZw14CWvSQosUF4XP
	G14BjM/qac2DzNWdpLKJjNUnYWgQZr3OhkPFts1U3/cXu/yffs8Y4UzKWtRdzavqQFU7tTpOFzC
	26Zs4zDX4FG+zhxB3imlrL5gf+Jj5ee9Enip2LdjYwMsTLsrJAk7kvJzdS0+r2PgC1dWslfLPfT
	w==
X-Received: by 2002:a17:90b:4a8d:b0:38e:ad9d:1161 with SMTP id 98e67ed59e1d1-39580553dfamr13842543a91.0.1787171535016;
        Wed, 19 Aug 2026 13:32:15 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416ad6060asm16706081c88.6.2026.08.19.13.32.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 13:32:14 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 19 Aug 2026 13:32:12 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Tero Kristo <kristo@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
	Nuno Sa <nuno.sa@analog.com>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Antoniu Miclaus <antoniu.miclaus@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Andy Shevchenko <andy@kernel.org>,
	Sunny Luo <sunny.luo@amlogic.com>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	Mark Brown <broonie@kernel.org>, Kees Cook <kees@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-hwmon@vger.kernel.org, linux@analog.com,
	linux-iio@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-spi@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH treewide 3/5] hwmon: (ltc4282) Make sure clk_init_data is
 fully initialized
Message-ID: <0ee768d3-f913-4d29-902b-39f8bf973dd6@roeck-us.net>
References: <cover.1787165329.git.geert+renesas@glider.be>
 <8ec3c5cbd2df675a938f090470f5da5f22008517.1787165329.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8ec3c5cbd2df675a938f090470f5da5f22008517.1787165329.git.geert+renesas@glider.be>

On Wed, Aug 19, 2026 at 09:05:17PM +0200, Geert Uytterhoeven wrote:
> The clk_init_data structure contains several mutually-exclusive members
> for different methods to specify the possible parents of a clock,
> prompting drivers to initialize only the members they need.  However,
> not initializing all members may cause subtle issues, which are only
> exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> enabled.
> 
> ltc428_clk_provider_setup() does not fill in any parent clocks, and
> assumes that init.num_parents is NULL.  However, the latter in
> uninitialized, and thus may cause a crash.
> 
> Make sure all members are fully initialized, to fix such bugs, and to
> avoid future breakage when converting drivers to a different method for
> specifying the parents.
> 
> Fixes: cbc29538dbf7d740 ("hwmon: Add driver for LTC4282")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied.

Thanks,
Guenter

> ---
> Compile-tested only.
> ---
>  drivers/hwmon/ltc4282.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/ltc4282.c b/drivers/hwmon/ltc4282.c
> index b1675dc5b3c7fd2f..54ba4b8542e94b7b 100644
> --- a/drivers/hwmon/ltc4282.c
> +++ b/drivers/hwmon/ltc4282.c
> @@ -1106,7 +1106,7 @@ static const struct clk_ops ltc4282_ops = {
>  static int ltc428_clk_provider_setup(struct ltc4282_state *st,
>  				     struct device *dev)
>  {
> -	struct clk_init_data init;
> +	struct clk_init_data init = {};
>  	int ret;
>  
>  	if (!IS_ENABLED(CONFIG_COMMON_CLK))
