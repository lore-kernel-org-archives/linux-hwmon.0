Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 396B13845C2
	for <linux-hwmon@vger.kernel.org>; Wed,  4 Mar 2026 21:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772661455; cv=none; b=YWH9kxRVjkWUl/ZE5He8XRICPFg2Nl0RdUkMQVyPFE3IJLqrrv32y0DHzM/MkM7hL6h9OgCDWkYSYDsj/0Pr388iS8UyoV7aeHbyOO3G2POI/zS+ooxTD645uH5iQuZaDJH6iz8iDLFXWqw6PXUHvl7sFQbVxtX9SKe/bAjmhF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772661455; c=relaxed/simple;
	bh=Q0VOiMFU1aqQcqk7bOZo/Sz1HFmSvyb1z6+x5NoPBl0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ecx+RPGGHVqPeLVKqH4PLle23tX1cvM8vFBxDzezwW5gwwQGyibmSZJC3k4KhsOubE2HZijPqZfkKLFyuJSv+Dj7YbeT1cDSiuPPedlASRY1lKBC0rt0PSE6mtTRZJQUswv2HSuh0lgJasYokBIZv1ppbxgVkVP2NBH7qmeL4Oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T+87FxpO; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T+87FxpO"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-826c49b7628so4659515b3a.0
        for <linux-hwmon@vger.kernel.org>; Wed, 04 Mar 2026 13:57:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772661453; x=1773266253; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CFJiUEJ4cZ9DGUU1Xeu28F+GFEVJPvOhjnpWSIGW3Yg=;
        b=T+87FxpOerXOSPOHCJD7pTwThQNNDcByWBrNNZ+Fl7JYDcqHvbf+cmuXNqSE1vsEQS
         mTyReITTid7Brr7x6eUyOIOOBRUsmxm4OGm2EcuhqKyUxmgKovW9UoAlRt0z0hFto0HX
         ZyGkfRDFMt4jg5xJVD5GRjPI0H+JbSywnlcXCXCm9jUHgky4Hd1FfG8BWPPrQQpGJkbN
         2pXhLytxxEUGao9hbV874VcPk7nfWcRU/wgcb3v1ZcEOqIHH7ki3YVBAxxmtAXZrhh8f
         YcpZHm4AwEDD5icTsY4rdsErWCp2QtHuT0E4XE0CTctxQtEcfb2WFwk4dYLdw95c5c9u
         KLxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772661453; x=1773266253;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CFJiUEJ4cZ9DGUU1Xeu28F+GFEVJPvOhjnpWSIGW3Yg=;
        b=Bnlph4uZ565dS0etDyDVXkAgkPvtTUzbTOdh5A2ANYBQgvv4XeNXED9GVwZNkdcVOg
         hK6Oo7Fr7FXSDzv+ks13rRccA6zt99kNkCx+dStsw5XV9GxpmjaNG9hsqJI8GZi74I/H
         41sEKNC5u7a5TeqVraUyKfV3ElmEOJqRNlLt54LRjMiZ9bGALYHRaQ67gtQ9EvegtBol
         Pw39F5eh4f5XZH+jAuhLNkxmGlv6So5Jv4pPwaxzz4Q6MIUAgzTVD4qUIou7zDNcGjkC
         53XNO+O2INf9KKzsW4BfoDgFhfphoFfA/fbtHnd4X7SbiOxeitLwzOxwkAU4hcGf01v0
         GhoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVroQfBHXT/O3qGce+7cmY/FVABrn90lIWgrlXHtW8aw9XwllKXWH8IMAk4d2gLm52+TTfgCpi0ijwsKQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxZDDc8LrVVBHGyMQw6X7VfJoD9+7jYLO+rLCID61ynMJNTZPN/
	LLMcq0JcMydyC0xTyP6YqAYRXSMHorPuvK109TMBgnXMvH46tzPmJZNqKpn8HHv1
X-Gm-Gg: ATEYQzxTRM+Kwhe159HA45FB6dFJ1Gh/3aR1NstyepWWL/Jg1Be+HWCNO5i1QsbD4Lb
	t9nmw+nYzaWBs6oE1SlLltHHtLrn8skO4eIOLauOUy0LnOxNw43o32/7HeGfLgssxnqerqEjjTs
	tNCrU6fdxUOlITBoI3PP5UmRl3t2O9Ebp26BPTyFIEZSYfZUcPjV5YJrbsk3tjszuFvk3vZaiyo
	Jakd5WRXOqH70OBPTbIEaJR9iRz84VqbvJaKCD/S+UCuO5K1l1MgiRzDL8Dq1bRIRgdTR9S3nu1
	dmtLhmb+mzfmzfQoX48wpP+oBTf+wlqp7tTLMIdCAM1DGc7u951oewLuGmOWsg40hA17FgP2a1V
	rVp+XeBg+NHKM+4mJi8Axas6wPjQiNS9xPrytY0xChB+GGe0iy1PBqsH4C33OwyNGgWwSlKV1/L
	mVs8BX9Ts5wqnt9J6Nq+xorAW7XB+8JVvpPnNt
X-Received: by 2002:a05:6a00:ac01:b0:823:1406:8797 with SMTP id d2e1a72fcca58-82972c63f44mr3058316b3a.31.1772661453188;
        Wed, 04 Mar 2026 13:57:33 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82984a01827sm109414b3a.43.2026.03.04.13.57.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 13:57:32 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 4 Mar 2026 13:57:31 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Olivier Sobrie <olivier@sobrie.be>
Cc: Naresh Solanki <naresh.solanki@9elements.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (max6639) fix inverted polarity
Message-ID: <374b8fe8-3eba-4c60-8700-8559fdd3660a@roeck-us.net>
References: <20260304212039.570274-1-olivier@sobrie.be>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304212039.570274-1-olivier@sobrie.be>

On Wed, Mar 04, 2026 at 10:20:39PM +0100, Olivier Sobrie wrote:
> According to MAX6639 documentation:
> 
>   D1: PWM Output Polarity. PWM output is low at
>   100% duty cycle when this bit is set to zero. PWM
>   output is high at 100% duty cycle when this bit is set
>   to 1.
> 
> Up to commit 0f33272b60ed ("hwmon: (max6639) : Update hwmon init using
> info structure"), the polarity was set to high (0x2) when no platform
> data was set. After the patch, the polarity register wasn't set anymore
> if no platform data was specified. Nowadays, since commit 7506ebcd662b
> ("hwmon: (max6639) : Configure based on DT property"), it is always set
> to low which doesn't match with the comment above and change the
> behavior compared to versions prior 0f33272b60ed.
> 
> Fixes: 0f33272b60ed ("hwmon: (max6639) : Update hwmon init using info structure")
> Signed-off-by: Olivier Sobrie <olivier@sobrie.be>

Applied.

Thanks,
Guenter
