Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D41A265CBE
	for <linux-hwmon@vger.kernel.org>; Sat,  6 Dec 2025 15:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765033460; cv=none; b=KpN4yBwBg3yCxM819fvYn58K+LbXgvy/8G3HmTCPeVtw2Te6HeZ7cKoZXceN3ZDcq1pzApyuPb2mJcyucJ+jZS8Z+pndELMsHjSEbS29N6Fe6sUdbNdio1ADISLwqh91CixYhlWS+f1fcOV35AjxY1cZG8zz0egEJCs+VqEBJ04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765033460; c=relaxed/simple;
	bh=UFYV+JftR9lVL9V8knzkL+BQJdY0/Id4+zxN3z/OheY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WHnJfqmNFPkV81fJZHDDj0t/pgEpwfkddjEnsirXqrWjUwLRWG0FxYdZWftb1VttRIrvf35Fs9R56oJQR130eXNRgw6OXbDkNxpsFXvUN23jPwLtCjgqXqhE+PVfRxRWyX3z/BBvyDHsDZcvBeqBNArRPYnVrFt4dJD1eGZ5Zyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eGotrYtz; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eGotrYtz"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-bfe52539c40so246086a12.1
        for <linux-hwmon@vger.kernel.org>; Sat, 06 Dec 2025 07:04:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765033458; x=1765638258; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SAsG7pY3EGRyZDU3AoHz54nBjkfMPiN97fLKdxXtRJ8=;
        b=eGotrYtzoiHmpVFg0bXGPdd4YpyetHr5CRZiZmhto9u3ozj1THkVfQFgSWHrriVSpI
         u0KcGq8b8ve3u5mjLEApfdaa9W6q7jmEnUrI2uTSLS2WeCt+L3hut6uSYqqYzwcyEK5w
         b3wXTN+tFgpGd8ctUWeMk/Cj/wEvpgLJjna+NV7CnFTc2bwsxR53MJ5H08aXmrD2x4Du
         h7gKTiyhzTmGJBYcMdKSxKwXYsrw5CARQGJDiRzYWI3jYUa3ZhWzmN/aFGCAoeINIO6N
         b3hsoFpNqFsmCtkorIfHeQqhAEYU2ezqKCzGICohwb31v6iIAgz76IxizKXuWJ7L16QF
         AR5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765033458; x=1765638258;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SAsG7pY3EGRyZDU3AoHz54nBjkfMPiN97fLKdxXtRJ8=;
        b=YOCC48O38tYcXnD1Aj+aXrNQHlDexepXTXfTRHn05cxpcDTbIDMrbvOTL5AK24ZWRq
         4YVAAhilIi4pfx/DozJq+xNUD86g7GanCd9p9K4Myh2DViKbBJJqFRXHMiTQM7f4FuX6
         vt2p7aTNEUeQLcSiTvqOExM9D3NT0iPb+ZDPZZPeRBN9FLl0zmLqjD1VkRBQwYrVzjJx
         58eb937mBk3tjztTyM6oe+HrZ/uYWWJAKWpW1wqvFbxZdPYLtOO0d6vp8A6+8R3AammY
         oMXx7RNs48mmGtA6OiDZ7ZkxfRvqLLGMWIxlFwdIM+CZKwaWh92Qz0d3mPNI1mOGqdar
         CWlw==
X-Forwarded-Encrypted: i=1; AJvYcCUDj58go6um1+/CjXbZeW8HJl/6Tp8ou5uF6symKtvPUU8dFjLCw83X63lw0lOPldndoQkfNPCvbPc5Mg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxpOrrFEVUi3aWpPVe5dXwSOGQyVm6sT9HWdmPyzZfrTkO9D2jI
	wAbTihvsQyxdsGOzEAGfEsAeuyjk2ZvobQb9Gi4fsPLluyEemncsR3h2
X-Gm-Gg: ASbGncvCdJaptUzwZsGXQlEN4lfkVQadreO0p9l4yjxxToD1gJnj+37DtJ/mr4y6SfP
	ipjwWXUfpvPHArCEZI2OSHUwffFDACWUa+hszJhIL1Y/DDnfSsanGdCxFAAok9C4CexCCpFEobw
	hQJX+kwtI5L0VpGgIYx4AOs6mEL0hErVKmW3VU7q3xdmIrxTNxO5V4Sa7pF2ZwkE8BIueHNU6VN
	/StIHpztBf1eG2U0t/KJmmT6JNvFA/n4m3spPg/rdfqnyBC+KjTalzCyxCxpS9t/luWc9e+4T6r
	/+hI9uIk41Fpy6nBbUFehG0Nmtc9/LS7718FaPsqqW9rPTepT45iUHlPaXi2spnXkTcWDSk+A/X
	iuaVvGZGfy+scDdqt2GgqLvrMIsVEFhbrqtirVYtIPGuUsfhM0jYe1eWQoQ3sBn09n55Ci/jee7
	2RK+9umbgmtP5C0j5yrQDKKaM=
X-Google-Smtp-Source: AGHT+IFBia8WUGewoaSGLOjD9IMzOL/yRg92xHWGVXk1luKlN9GrQ0p/WvzqSJiggGae+AIlYipR0A==
X-Received: by 2002:a05:7301:9a94:b0:2a4:3593:466b with SMTP id 5a478bee46e88-2abc7113881mr1577588eec.7.1765033457708;
        Sat, 06 Dec 2025 07:04:17 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2aba87aa5fcsm21183628eec.3.2025.12.06.07.04.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Dec 2025 07:04:17 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 6 Dec 2025 07:04:16 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Kathara Sasikumar <katharasasikumar007@gmail.com>
Cc: corbet@lwn.net, linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, shuah@kernel.org,
	skhan@linuxfoundation.org, david.hunter.linux@gmail.com
Subject: Re: [PATCH] docs: hwmon: fix link to g762 devicetree binding
Message-ID: <2ff16215-1657-4c34-9acd-5f5f21609afd@roeck-us.net>
References: <20251205215835.783273-1-katharasasikumar007@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251205215835.783273-1-katharasasikumar007@gmail.com>

On Fri, Dec 05, 2025 at 09:58:35PM +0000, Kathara Sasikumar wrote:
> The devicetree binding for g762 was converted to YAML to match vendor
> prefix conventions. Update the reference accordingly.
> 
> Signed-off-by: Kathara Sasikumar <katharasasikumar007@gmail.com>
> ---

Applied.

Guenter

>  Documentation/hwmon/g762.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/hwmon/g762.rst b/Documentation/hwmon/g762.rst
> index 0371b3365c48..f224552a2d3c 100644
> --- a/Documentation/hwmon/g762.rst
> +++ b/Documentation/hwmon/g762.rst
> @@ -17,7 +17,7 @@ done via a userland daemon like fancontrol.
>  Note that those entries do not provide ways to setup the specific
>  hardware characteristics of the system (reference clock, pulses per
>  fan revolution, ...); Those can be modified via devicetree bindings
> -documented in Documentation/devicetree/bindings/hwmon/g762.txt or
> +documented in Documentation/devicetree/bindings/hwmon/gmt,g762.yaml or
>  using a specific platform_data structure in board initialization
>  file (see include/linux/platform_data/g762.h).
>  
