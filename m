Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F4CA41C6A
	for <linux-hwmon@vger.kernel.org>; Sun, 30 Aug 2026 00:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788048296; cv=none; b=JMfMPwm2AKMBXg6pGt+rAGVwrSFiAK3t+/VsYppYd+YfashxYNVTncte/D1Pv+R6n7MzrcbToY9C5c83UMiv2xnUc71cGER/pnL02/T8I11c0xNB6CyFzTYRXi2JWeUh+823iHLBd/LB4tZcQLOiLsCpepo6SZ1SIn+aSE/2RR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788048296; c=relaxed/simple;
	bh=EQ7LXX8hrRjV5kynGgEIzz4GK/6e5K4uNEKumNr0MNk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LX3jqO8p6bTZnHSVty7R/UOwMMjjJYlVBtICSUfPG57RAqNDZVQJ6nozGQPiQ0zXe61LfOaD9Is4r3By2wSQ0a4Rg+k1NZeDFvnrma35BwsAisc5+F5zy9P4k5KzKq/vY3aamET2denVN0VNYex/j2otPdn9oj7A9UPaQVk+Ol8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r0QZxGKS; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r0QZxGKS"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2d7195706f1so22484275ad.0
        for <linux-hwmon@vger.kernel.org>; Sat, 29 Aug 2026 17:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788048295; x=1788653095; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Zdv1lueu1WcoCfunmUpcqS9uvGF8oyTuiM8llhtDUjw=;
        b=r0QZxGKSq87Q38NMLc6wDWfqrpWmhC3xiIs+VydSF2ExoezK9fL4HZjg68rKPT+slE
         Wb7Wp+8/szk0xivbOZuyExSlJLWkWGsk2Vx8xe+HiobRmKKK3YwJjl1XR1cRw1+2S+SD
         oT8oAOBxXCTgNF/EiCjRhAa4mcaNk8RByQ1EH2olLZiCDKmfNI09w0X5HZBthgZ/6qQ+
         bkJW1MP8Az8SiYUY7Qui3ZN70m+8Fhlq+6zo2nM/ef6Fit5UBIIA3uf8dQkB4Tr/ViSh
         Z4sp7T+Y9EB7jxHvJkQ2R0SFbi/7A4djczqo11xDWn6i2CR1BwhC0IXKAaq7aNkDaoSb
         nIpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788048295; x=1788653095;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zdv1lueu1WcoCfunmUpcqS9uvGF8oyTuiM8llhtDUjw=;
        b=OHy/wi1x29J/+LD2dRCWV0/VwH+81bga/+1V3Dzf4VuXyqHzAYU8O0Ij3QBrfL13pu
         gndlwSlLP0+YiZdI0Rt1QYMF3qnFVJLnIC8ghlpANP69xR22/MDykWWH68+ZZ4h2NoAY
         23dmKFtqRRq4kJI1rRMo+vjiAojneHTVOdPpakYuySS2xowxjxNONllkLds9PbddoznI
         7Kjlo7q0WeKAPnmqxG+E0FfB3/BnnacbAfKRaXCuvm+eudTL9d8ELKncYJYwqFCIVAB5
         jJkXNc+kQEOBUbHd1ztd54jHYfTDRFIXm3lS2fqRbiTSNhWV8dERHjymTEkl5jqPXrXs
         UvEw==
X-Forwarded-Encrypted: i=1; AKwUvBzoqRa4SSARmGyj9ap95+yA2SPc1+u5Pc2NBp6dFllSBtVcjLOfQU9xRPhmJx6BEULL79phIW+rcr9J5g==@vger.kernel.org
X-Gm-Message-State: AFuF++mJpf/Rb8NPMAxQqrqtHipbPMcvBpe/t6wI9ulFexPidThdgVMx
	OHgnxWRO44p3cmuuUUrf07BJ8EdwgTAlhc7f32liFtxyXDdKw/HxwRAC
X-Gm-Gg: AYBFou1yY2b8E6WHlYxuwn24cXNbGN0tWBZMkAbcMiTJrg9h1Wc5P+VjxhdEF1fyWbE
	3oCVM8TFcdfeu41lju/IbmqNv38kkV1fynTOI0LxYUHONb5x9PokCzwzPoMhJ7w/K69eBngENcs
	XvODXthvVGCQylU49AIuEDmnrihu6Fjb2mLyXr3fMtjJCWbkXX8EklCtkCSW/J98ip+JUboITOy
	BkkXwnEedVhKEEjv4C7W3rz+BkySNtWhS4C7n5BebWU7mh8e6JaOriwrUpzErBTvbTvdhKSrhoB
	uqr9JhvdCfREcVVHdWSCdEoeDl+/KlHAuvYRUADneajuQniSxYVAfDvx79Jbj+NN3YheuifBF7z
	0BLiXwi5oKl0RA7hTjG7OJEdJEux91jP1sj9KOogG+gDIy4elMaJq978IL5zH0ZA4wX5b3UIU/r
	PkKXM6xgkhTvJa8wiJ0rfKoEuM+whyUaRiuMwAhqV20TFlt4xH1h/TaXQmcUAqmkHq/5opIRFE7
	A==
X-Received: by 2002:a17:903:1843:b0:2cf:4339:aaa with SMTP id d9443c01a7336-2d74df513b3mr214268425ad.12.1788048294660;
        Sat, 29 Aug 2026 17:04:54 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d911a9651csm793615ad.21.2026.08.29.17.04.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 17:04:54 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 29 Aug 2026 17:04:53 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Flaviu Nistor <flaviu.nistor@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: national,lm90: Fix channel
 constraints for temperature offset
Message-ID: <6ca05f29-b0ed-4175-9047-2e16953d7d0e@roeck-us.net>
References: <20260826184750.4798-1-flaviu.nistor@gmail.com>
 <20260826184750.4798-2-flaviu.nistor@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260826184750.4798-2-flaviu.nistor@gmail.com>

On Wed, Aug 26, 2026 at 09:47:48PM +0300, Flaviu Nistor wrote:
> Limit temperature-offset-millicelsius to remote channels only, since
> channel 0 is local and this property does not apply to it.
> Channel 2 is only valid on devices with two remote sensors, so reject
> channel 2 for compatibles that do not support a second remote channel.
> 
> Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Applied.

Thanks,
Guenter
