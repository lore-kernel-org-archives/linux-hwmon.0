Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71FFF4EA394
	for <linux-hwmon@vger.kernel.org>; Tue,  3 Mar 2026 17:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772557429; cv=none; b=jSGQJEbD+oJd7JTK3G8oH0mLsxw6pd/kIBmmZvLsFT0k/YfBoxZ/TmzuF49l8sIE5T5fNoO9KHJT7RioGV2OKQ0tRESGxvkJS5eZCHoIAl4lvnYpsAEIH12DcSvSh3ytQCgHTu+gX0q6pHjSOTbKa3gKDaA42F/eQ1uGkvC+rlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772557429; c=relaxed/simple;
	bh=SGGOf7kmYffkURw4Nk1MNpgFPMhYM8fpczwvkyA65D0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZV9j3lXJt2cdn4uOtPGJkJF8u6GAjy5wLK4ErWXbsEWHBKSspGj59+GnjE8cMbT5FoPzbWYGAVOKSF0xg0eY0S2HhgNwAbtn/3bksUyuiLf74ka5q0LjvR2OvYG8AC97NDIacrlREd4KuiYVn+qGbq+EzSorcaUkov6cervCMb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G1F0+J19; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G1F0+J19"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c6e1e748dc1so1970353a12.1
        for <linux-hwmon@vger.kernel.org>; Tue, 03 Mar 2026 09:03:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772557428; x=1773162228; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hW4QwqICcYKc2N+wxqS6AgsukbRG0bFVETsdqcER9XE=;
        b=G1F0+J19sN+gc9JlXVwou9QfX8HtvcjTndaWvTrfJT0B5p7tjFGLqrB++p9MqW+o7R
         KxDfzBGlFixajmlUV7KAtXvCoZNlq+a9gO6tM7KwBYrBYVmnLP7uA57gnN2lbd0O7uzt
         P81LtO7AgLpWaxAcuV5jwAvi88nTxCbQo4RQvEa/tuDD20cVyRd9X+9KOYcK8iaLt7J+
         azLa/EVFfRQecDIGSjfVT1bS9nDri7sSUIvNhZM5eVxCXjz9xjHeoS80m3+1sfrbiMkI
         4yb1tRAUUGLGwsbN+o0kqRjbnhBsHyxA940uUDGl0tXNLJ4cfu545FnIlecV55hvwgxb
         5bDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772557428; x=1773162228;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hW4QwqICcYKc2N+wxqS6AgsukbRG0bFVETsdqcER9XE=;
        b=O7qk1ugWqh9yb/Nps+S06vsv0U0psC/XFrjaO2iHk1hxTNRNW4WJW+j8N7Y2EoC5GO
         4FolX+vi4asQ7xANXzrl/okzTABySQ6WsH1jQyk+vLL++5ywmzLgLF7JR/RmCSrSYyok
         N54i0a5cLmwB/kVH5M1JlDwAvMcf0IIXXGwnvIQvYImpK53UkQb4KLPws2noVG/fZZrL
         sA8JhhoGBV25ZjKqkUi6I+rUww4oA+fiYtAHUbdFGvUliaauVAwjtSmlUQiLAwpLalTC
         U94SeTqL9LGym2XBVKd082145xFF0Jq+1+EfV+bfvSUIaOpYge+pk6k132XUaeeij+Pl
         PzdQ==
X-Gm-Message-State: AOJu0YxBBKO1h/ZUZyh3LVMcw5A9n492JeThQEVR/yKBdFOQvfrr3dzw
	nDA9VSCE4h+435qaelMTMRz+j9uPZ+6eVrGZIB/ZvHG/9wamtHcyNs/276w0Szwi
X-Gm-Gg: ATEYQzz9Gs2YO2FHQw+VIlNzJrTUbvLL77FrnHLnw5tJZU7347HiLNk+vVZM82VvKqK
	3GhTxQuF/BsZ0aajqhyF4mFZdGUjfk4XnU6Pf9QzhHqZuBQT1saYwEPulzhdZb0xTf5pQvJ/bgA
	vEFB1ZTp3EKc+1/QJPS8ZHLxmNxwRuYDKwPa6RcCBogXsektFeZxj2gFi3jXeNb6Czs6XRpcCqO
	BEKDsmeqpYqi/QsFEzjPaK4lnGvIbjdPou1tx/MhAMxaQ8Ls12GHXusQJ6bQJqvVMDo8PHmT2fn
	gqDTShB02Mnq5heLs2o1eIjLvttyZlWHGmwBb5KxCHyjBriZsUaP2zhZ1XtjQp0/3abm1W3FbjX
	eOywGDyKrEvDMDV546PG/OX/Wh3m6rsyVtrO1FZbzBMoxo6sZdEK5x5EnrWXVMOFtpo4ERoacI8
	swESkn6HXyYhHZ5r8qbcxOJSiUE+ewrdhnWzNW
X-Received: by 2002:a17:90b:2691:b0:359:84a3:1942 with SMTP id 98e67ed59e1d1-3599cecc8bamr2618927a91.13.1772557427652;
        Tue, 03 Mar 2026 09:03:47 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3599c8cb9e3sm1848130a91.3.2026.03.03.09.03.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 09:03:46 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 3 Mar 2026 09:03:46 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Amay Agarwal <tt@turingtested.xyz>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/5] hwmon: (max31722) Replace sprintf() with
 sysfs_emit()
Message-ID: <8c214234-0f9d-41c2-b359-294c8a6df7cf@roeck-us.net>
References: <20260303152456.35763-1-tt@turingtested.xyz>
 <20260303152456.35763-3-tt@turingtested.xyz>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260303152456.35763-3-tt@turingtested.xyz>

On Tue, Mar 03, 2026 at 08:54:53PM +0530, Amay Agarwal wrote:
> Replace sprintf() with sysfs_emit() when writing to sysfs buffers.
> 
> sysfs_emit() performs proper bounds checking and is the preferred
> helper for sysfs output.
> 
> No functional change intended.
> 
> Signed-off-by: Amay Agarwal <tt@turingtested.xyz>

Applied.

Thanks,
Guenter
