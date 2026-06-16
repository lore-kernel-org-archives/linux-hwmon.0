Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71BE39768C
	for <linux-hwmon@vger.kernel.org>; Tue, 16 Jun 2026 23:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781651366; cv=none; b=thpg5bvdOZPYpfNztAMdBuSYoB3XlQnUcc9CtLT3nOWBJ1GFEuTfZK+QbTYTXUmuZMn+Cl2TNBrRAebbSJEgF/WsuOIlA4WlZySbVlDDJGr2+KdpvD8DBq44mtYmbg+8tULzkQfAoLVCbSEppL68R8x2s3XSnCurN7TH9KZ7HiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781651366; c=relaxed/simple;
	bh=O820Q4lCe2dBUZQ2ZOmijlv2yQB0OwdH93pbJLnP998=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OIlRCqFku/kHHIw9T8pLkNK8NgKOQON3h8bKJngu2G9OmgrE8y0xq6SK3s08Rsx2ZgUae/TJ944K7V4Vp1Vl4/tl3/3FT66l/5RH+phyD716bgEF8euiHJr6fCnE2zA5/2eLNvDnnWKA3F7iKN20ejRgy5HDzH5wxJkmFHfVZPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a5XzxLl8; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a5XzxLl8"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-30b6dad2382so5525006eec.0
        for <linux-hwmon@vger.kernel.org>; Tue, 16 Jun 2026 16:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781651364; x=1782256164; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4g2qnOZaS9vdoUeNo75JgZbLIYCofMDc8Qj0YR5f7ak=;
        b=a5XzxLl8ivjJB30uih+zjESr7JoiSJiJlmxlegaOat6+BGc8D3+K5DBOWl9w8a+ODb
         bRy9EHVia6u6+HxnHptSC0oO1if26CdUc9IqGj6qg3BV6uSkJMW4yR2zenbrNGov9XMO
         KKr2juD0aT4mu0g6tXzERTBHxPw94fCR1z+HZKfkosEiWKWVWJFNwohVOpg3F7ndHt/5
         IiUoZTgeC2kN4VUivU4TSEkYydgUG2tgSw8uDVO0gFHJeH7AJwR3dOekS8ArYAOC0g0y
         Nku4DxAeIjnxIwwtA54nneDFqNpBWsx3rC8M8zyJDLDNSIC+irBQQa/YVj8tT4yHFbQL
         64KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781651364; x=1782256164;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4g2qnOZaS9vdoUeNo75JgZbLIYCofMDc8Qj0YR5f7ak=;
        b=qLh4zOyssYelPL9bv+fzM9N19/hi6wHra4S/SZTvvWtj53bn2bjjaJTUFU3IYYcrUA
         BBTwkQgQQcQTIw0i5nB0lAvgMkcmIDUrZcIsO4HEIQRIdEUcKuRcbNmbrzodUHArq4dz
         gyIVq4K79ok/MLymnXcaQXQMoDkIvcx9nSM1xOcf3lzcSyHUrVwhzduxIk2ONUop180E
         J2QTencynoye6tXMm0ed4MgNOmCAadDJCK+zfX+G+GlCP56Dj3iNM/f0m2Dx7xeqG8oj
         Ly9XAdAchI5wnTodKVGWhA0uyFFnaDPNbIC8mssiVGM3iyG3cq76uZaUtF4EzjUTAufA
         snqQ==
X-Forwarded-Encrypted: i=1; AFNElJ+3NhdxV+E1lqvn2oxy9AHMT7St9ztkNCj7dRFp6dPzYLGKJGliQgt8EhlmNKrDSM2IJsyRbAEYyAByaQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwjJwEeFvtEVe9RNIEC4FLjNoXmuFueJ0Zc3PsDsYT4QMWHdiVo
	9GLCmV4zTstAIeU6oP+zcb0YAVfR92GTAe3iBGmzK7bE+HC5dMLxXPlT
X-Gm-Gg: AfdE7cma2okE8bvkq9FFOuC4+nilMkQwC2akcDnwzlYkFHO0q1awPrVMBuP7PsiXtiC
	Rs7yRQRA+tqK8/oro+fCTvLyR/ASYXMeYUBGdow9BW8jTEAae9Uft9xeeOTWP7xYb6wYcQTFecN
	dQLLY5nMtqjKpxpeh3157wdbGqtxb5bVmUTSBrB5BFIWRzH+6Q3UDHBm4oRpYX8UZj6xd0Hz/iW
	Jou4OQkfyrH0p66h4UHYhsPvBthBAjB9plti2kyIlSnR4dn7BbZNJnDIWPo7k0n8tBQY07Lmbdx
	OGF1oXCBfhvSfs3gXSAjFV3zlkr50EQGWEDiDvIgxGFft0xx/3+KJf5DtifwEZK2Tu9bbCFva+u
	9IN+A4+ETqBsZ89SwkC/H3yz4x9VmHKdc2wP6/QZRXmsZsdQFpjB7lnxrHAjFbl1iZoUtWUKCIl
	KmeF6XfOEQ38bplKM5oV12W8YKR1e8NrSa/7Vb
X-Received: by 2002:a05:7301:608b:b0:304:bce8:fa30 with SMTP id 5a478bee46e88-30bca90ba42mr957048eec.5.1781651363996;
        Tue, 16 Jun 2026 16:09:23 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081eb95450sm25552833eec.28.2026.06.16.16.09.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 16:09:23 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 16 Jun 2026 16:09:22 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Rudolf Marek <r.marek@assembler.cz>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (w83793) remove vrm sysfs file on probe failure
Message-ID: <a651e9b2-7b76-4223-ac9a-6978b27e9a93@roeck-us.net>
References: <20260615064806.51139-1-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260615064806.51139-1-pengpeng@iscas.ac.cn>

On Mon, Jun 15, 2026 at 02:48:06PM +0800, Pengpeng Hou wrote:
> w83793_probe() creates the vrm sysfs file after creating the VID files
> when VID support is present.
> 
> The normal remove path deletes vrm, but the probe error path only
> removes the sensor, SDA, VID, fan, PWM and temperature files.  A later
> probe failure can therefore leave vrm behind after the driver data has
> been freed.
> 
> Remove vrm in the probe error path next to the VID files, matching the
> normal remove path.
> 
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>

Applied, but this is a typical case of fixing a minor issue while ignoring
all the big problems in the code. That entire driver would need an overhaul
to fix it for good (I am sure that Sashiko did not report all its problems),
but that only makes sense if the result is tested on real hardware. Please
leave it alone in the future unless you have real hardware, and then consider
converting it to use the latest watchdog and hwmon APIs.

Thanks,
Guenter

> ---
>  drivers/hwmon/w83793.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/hwmon/w83793.c b/drivers/hwmon/w83793.c
> index 24772cfbecb3..8726c5fe8a95 100644
> --- a/drivers/hwmon/w83793.c
> +++ b/drivers/hwmon/w83793.c
> @@ -1917,6 +1917,7 @@ static int w83793_probe(struct i2c_client *client)
>  
>  	for (i = 0; i < ARRAY_SIZE(w83793_vid); i++)
>  		device_remove_file(dev, &w83793_vid[i].dev_attr);
> +	device_remove_file(dev, &dev_attr_vrm);
>  
>  	for (i = 0; i < ARRAY_SIZE(w83793_left_fan); i++)
>  		device_remove_file(dev, &w83793_left_fan[i].dev_attr);
