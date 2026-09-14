Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E707B33ADB1
	for <linux-hwmon@vger.kernel.org>; Mon, 14 Sep 2026 15:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789399820; cv=none; b=aB3mozn3IeaU2qvtsZrjUj3iIgcpegPBhHRx3PcnXxsWlAh8hLCTo2NyF3KKw8/hFw7A68sb76QMP77u8beSwjrUYIq+Ckj8EBU+dW9vVyADpl3z8j9wkkn59dwQvgOiTisbIwL82RwoNeMZsj92SIY1rCa5rNNHKWpn+loS0NI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789399820; c=relaxed/simple;
	bh=h/wDH6nToVf/TAYvuwPjg2RAFl5iJ36CneD4aSoPqTs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cRSblUnNHb20m1UdPARoY+GsLIG+3ioNj6UzBmPzCEBb7aSb4QpsTvf015ROLAzfVeEbdMPf8C9fSpnjv2bVBntpH7Bs3lVYG1mWhVmmKyR6+WTmGVEusCKI5RZqWA18an3NlVRDL9rUj54pp3MN2yvkvDAPyhOh7sB4G68GM3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dWEKv4fk; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dWEKv4fk"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747ed9866so23657085ad.2
        for <linux-hwmon@vger.kernel.org>; Mon, 14 Sep 2026 08:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789399817; x=1790004617; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Az8tNuJvyLtzVr3TXGzXDdP8iMuPRIZTqheTTOwSHa0=;
        b=dWEKv4fk4ZwbkYulN4HVXxzUvwe80b3iGC7osKGmhrxiWUVUjYjuTExddjCwWUXrph
         paCp/xCBnvIctXgHtHaF6/1NnuVwQp/dqoW+wpGfZ/I6UvyrYQiYUfMNxJkcv6UzBQDw
         WI+I+3M2NWgqsql5EIICGdLOPJ8Xg80Jdb2IWWm8EWUQrQy4W89jjqbXTwem9zUlabS+
         nB2WEcAFbRq0msiSpdmBDXkd0l0W6ok29MGf9bZ9DjZJFgv4y2WDg9BUKXQ918AQ/0SH
         mZramtUEoiP9z8zRo+NPymU6NqUa5MZfRM/EsxIWz/ARJBOWo43BjoFhRd8Kds89Bm1T
         /QuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789399817; x=1790004617;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Az8tNuJvyLtzVr3TXGzXDdP8iMuPRIZTqheTTOwSHa0=;
        b=r4kJFKoGGuQooQmQ5KzJ9HUZREYR5/tolntK0T3qujzorCBGFVhfVGe023uCThNdu2
         NoDi3HMD2/JwzRNN94xSFCYDdFpyFHBXoXKPNBTXvh8Tuy1vDiiHUvg0Ls+iSQK+M4Mr
         jSoVeQbVxp4w/BnXscYHKuHcxS8mb9qXYegh+dvL22ojszI4LLh8JoOnqYSxc69f8kps
         2cgb5qERfRBqcLdBe8Z9ef1ALciOIwGIpdcmVaDu0d6+M4XzhPd/I/ldPZv6mTZhVxoD
         Ai0QEt6KT0ACioi5fIlp5SqviZzYW3yQ7hQspR1EcTGFvJFPTVnrTY4WWk8HyJVcaJwS
         /SWQ==
X-Forwarded-Encrypted: i=1; AKwUvBz5LWWW2+UHfY35OCvJt5fZQCJssh8caozlFplFt5dKd5Uef4TyxrzguzMNhWmynHeNcAbnznU6Dog55Q==@vger.kernel.org
X-Gm-Message-State: AFuF++klLXY8T0BqcSdop73PAbk+HxvprfsPoXhDRaBoAJy9mdCU/bOu
	1wQHv/xtr8lhr6IpoFYr8Ak8gmbnWoI8NlO0pZmwFXoWULXXQKUUzqKz
X-Gm-Gg: AYBFou0+Jgp8xqFfVSnIIJEJup9kAYiniboDj9bNo3RXmtwzFRLBKLVvEkU+rZCxvsC
	5HLVpV0MMRa66eVbgQVBT3DBFQlkvLkkPGV6vnPyXNjMWgiA+7hS8hm4P+W4Re5nSuU1AkdOJpG
	nEzcRKP7LI05J8m0fGEZYtCZ9Y7TtuLclYi5nqrO+wsijLWvf3v8BM87liOlwoBZmjjCXgrBIJQ
	OAZrIdN9s0nAIjWYko699rHbX5mSMnBzsl8r0aDVIubmFw9tilr9ax3dJIOeV4gKbJgkJa6R0N1
	L+8hAkoU4z4puoPTtwlPBON/8C1PdnE/tXFFOpuplDX+o7RuO02JVAwL2vZdXO8pb+sTaZXQ1u8
	HcicTYfQGX3HaG5lx2zp7S9igMqMSorl87Lmd6IPWVDS8qNZywlDyNHKJwo/m6i6e7UQf2JC9bJ
	rL+P4NKrDs/PcN3gyUYpEPHICJQbh6A+tBQPGKNgsTO4JEDptWV9z/gFA/NcM6/Flx2PSdvo3FA
	IhBzmAhi6aRjA==
X-Received: by 2002:a17:902:f64c:b0:2d8:d4d1:3139 with SMTP id d9443c01a7336-2dd6c6fef53mr67714745ad.16.1789399816489;
        Mon, 14 Sep 2026 08:30:16 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2ce92ea4sm51503935ad.20.2026.09.14.08.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 08:30:15 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 14 Sep 2026 08:30:15 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: Marc Hulsman <m.hulsman@tudelft.nl>, Jean Delvare <khali@linux-fr.org>,
	Hans de Goede <j.w.r.degoede@hhs.nl>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] hwmon: (w83791d) remove fan/pwm 4-5 sysfs group on remove
Message-ID: <c5416dc9-f814-453f-ad2d-497d21dd8dd4@roeck-us.net>
References: <20260914062809.1650538-1-lgs201920130244@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914062809.1650538-1-lgs201920130244@gmail.com>

On Mon, Sep 14, 2026 at 02:28:09PM +0800, Guangshuo Li wrote:
> When the fan/pwm 4-5 pins are not used as GPIO, w83791d_probe()
> creates the w83791d_group_fanpwm45 sysfs group on the I2C client
> device.
> 
> The probe error path removes this group when a later initialization
> step fails, but the normal remove path only removes w83791d_group.
> As a result, the optional fan/pwm 4-5 sysfs files can remain after the
> driver is unbound.
> 
> The callbacks associated with these files access the driver data,
> which is devm allocated and released after driver unbind. Leaving the
> sysfs files behind can therefore result in accesses to stale driver
> data.
> 
> Remove w83791d_group_fanpwm45 during normal teardown as well.
> 
> This issue was found by manual code inspection.
> 
> Fixes: 6e1ecd9b8f13 ("hwmon: (w83791d) fan 4/5 pins can also be used for gpio")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>

Applied.

Thanks,
Guenter
