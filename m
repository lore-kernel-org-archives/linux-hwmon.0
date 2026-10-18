Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B54457E5A
	for <linux-hwmon@vger.kernel.org>; Sun, 18 Oct 2026 16:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792340211; cv=none; b=kUCPMGoVj3TvXnuDl9Smnj9GyPn17n9WMdMsjZ6zDjgirKkh6e1v3bJ/4y6T03g/CGqp8xqm5s16aSbb2gBE0H0XGIA8QADh+yO+aQWxypPG4UZibriicacEKCh+NvHBeRybNVpk0udLpJknQvZVpKBAgVgPQE5u2hRgS/Ikdtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792340211; c=relaxed/simple;
	bh=VM9G2IU8S9PT+t8JNTFJvstcuDK+KPuMWkvaCXHk+EY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U0iFwZmV4F0TP5S2o/X88g4fTcXweyJ2tLyeogw1abnEQ50vAJsR6Qr8BdY6UIzuC60njShhqIdoZJt6sAyxF8wp7d7UTbRhDRPut1U+gzmaapcIQwkYglrcG9vesy8AJxNh8QiKraNENaxsW/IheRHlWuTnVmNAteZOWeXV/2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X6ih1d53; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X6ih1d53"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2e934449bb0so11953555ad.0
        for <linux-hwmon@vger.kernel.org>; Sun, 18 Oct 2026 09:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792340207; x=1792945007; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fc33dIGb22zLmtwbw3KptWfTKOOxa38o0ahhhSVqK7w=;
        b=X6ih1d53PVEJvbbmmi/ZO/JmJT98EAkZa5irOPMZ3+2ygBy5AiSj9846h3KmqXWZvy
         kCZvhAZbkkkacRs+pwgZE/UmR9YJYDzWT8ORtni0e4UXEgmxuHj9lOs5WgIb4HHaxhMb
         nJrTKpNotBuY8BmahWGthNemUeqsgR370/aErrsB2uTct4GCT4y1RhAuzXAULZA0zWyV
         CQtQxNasqHF6gPsckq59IiutRmi80QsRCtsGH4Sh07bptPJx+SZy4lj7tLqGhOadl4+2
         oDxr+5I6oJ8vqk3qyz4JPGh2Zuhi18S5yMFjDrQ+C8GfaaWwULo87Osyfpt5cBRom6Vh
         bHgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792340207; x=1792945007;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fc33dIGb22zLmtwbw3KptWfTKOOxa38o0ahhhSVqK7w=;
        b=IH8nCpDxwcvM+7Iuop96En1pbmzsCllg7AeFgQnNh/HNIc/gSclimoDBeqnyOBA5xu
         ev6n8eac9wCQ1gY9xoWvUIW5hJQhypPFtdQDOAUInsvc5uRgnYTrd4I5TdZzfM03We0w
         JtIlPH75WaWT+p+SCw/v8LqFex4x9DZx3XPdK13KLxCiCh12yH2gr3eCo2oENbsV1rWf
         tneRlT8ucSYaPfjX5u4pHkG9FDJ/4UToLiyoS/gV/gFHUzQzCiF2Ks8FwQFyzqBoLwZd
         XOmVHolC1wcxiL/TsVOle7qJ/h4ICEfezdJOiJUoXjfu7CldhX2RANx9dvFxM5QFT7ch
         dgag==
X-Forwarded-Encrypted: i=1; AKwUvBwtXrA/PdDSTaLMebc6jRtXuBrQU+dpPmZ0zaaMjK770HaHLV4yjlJzfV20uSaX33pj1sAds1uBp5DKvg==@vger.kernel.org
X-Gm-Message-State: AFq9FYIFlC5n8dEsc2d2XbAZLSjkEarKQkxTx6A9+nogX2hQEB6A120f
	Y/ZK7Zk14J0iqLVyA489KdJpZRNckZ8SEJTcoUcWw93lVXYWCbNNxC1s
X-Gm-Gg: AYBFou0bp8nBeSYgW2Tuwjgbr5j74IJpf4NHRxGbxKUTIpJdmcb2IqBxbVf+Fbcq6T7
	/wu3DtesUuf5MyS4UpmHWEVAAH4Ip8jfGk/kUD+ojPLZGTejHQFkaYI5hEfNo0plZbd3QO/pBpy
	Ow9zic30E9vyWN4M5Al8a0TtN5Z/LXFk1MyxZEwuRswVViYiVVtU/eh+wWUkBjSm84AzVYEBdDW
	gsuW3BPSBDdF9rzSdaWZE/4skHUwjYzgO9pv2cpGPOUGl+4NupwpNwI4xxRtICtNISaUL0cXNhp
	1nN9uMzaFH8cpNJAvGdyaTF6X6yltJ3H5SM037fChvUhves3MSbhmZTXJ0pQFjdvh//kWsHyuOD
	V06yG5zcoUed0gA734F2DXOdKACKcFLq09m1tvd0fsEVGzpgRSlHdKITVCKLtUet9J/IiUNjJl7
	spg7X/+9P5R8/auXPqqwOZGc60za64A8BTmSEGyJ4x4N3Jk9bfdHeyfG+aNZ3ROda1QNVy4tGTt
	IMt2Q85RVev5NBCt+gRORc=
X-Received: by 2002:a17:90a:6082:b0:3ac:ffb8:183b with SMTP id 98e67ed59e1d1-3acffb826b6mr2070104a91.51.1792340206761;
        Sun, 18 Oct 2026 09:16:46 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acc4972fe6sm12471343a91.15.2026.10.18.09.16.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 09:16:45 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 18 Oct 2026 09:16:44 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: =?iso-8859-1?Q?Sebasti=E1n?= Peyrott <speyrott@gmail.com>
Cc: "Paul E. McKenney" <paulmck@kernel.org>,
	Mark Brown <broonie@kernel.org>, linux-hwmon@vger.kernel.org,
	linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (minisforum-um780xtx) Fix clamp() build failure
 with GCC 11
Message-ID: <2bffbd3b-391d-492f-959c-fb9128bce49b@roeck-us.net>
References: <fda0e59f-20e1-4a94-a714-288940dcdd37@paulmck-laptop>
 <20261014214522.243253-1-speyrott@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261014214522.243253-1-speyrott@gmail.com>

On Wed, Oct 14, 2026 at 06:45:22PM -0300, Sebastián Peyrott wrote:
> GCC 11 fails to build the driver:
> 
>   error: call to '__compiletime_assert_727' declared with attribute error:
>   clamp() low limit 0 greater than high limit points[1] - 1
> 
> The store function returns -EIO unless points[0] < points[1], so
> points[1] - 1 cannot be negative when the clamp is reached. GCC 11 jump
> threading, however, duplicates the clamp() limit check and does not prune
> the copy in which points[1] is zero, so the compile-time check in clamp()
> fires on an unreachable path. GCC 8 to 10 and 12 to 16 accept the code.
> 
> Select both limits first and use a single clamp_val(). This does not
> change behavior.
> 
> Fixes: 9d980da93bbc ("hwmon: Add Minisforum UM780 XTX EC monitoring and fan control")
> Reported-by: Paul E. McKenney <paulmck@kernel.org>
> Closes: https://lore.kernel.org/r/fda0e59f-20e1-4a94-a714-288940dcdd37@paulmck-laptop
> Assisted-by: LLM
> Signed-off-by: Sebastián Peyrott <speyrott@gmail.com>
> Tested-by: Paul E. McKenney <paulmck@kernel.org>

Folded into original patch, as suggested.

Thanks,
Guenter
