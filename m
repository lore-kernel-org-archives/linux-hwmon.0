Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E7A25B09D
	for <linux-hwmon@vger.kernel.org>; Sun, 19 Jul 2026 14:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784471877; cv=none; b=krloH015Wq+Sw7+7u78SMikJLanFMdl1fz+7hljmUo8G50u5KZ9piw2470hQmHAXujF5ngRCMAXUfdc35k/X8JIrEqo2cPMMUWR+V79VB9hkuDRCaf6qfKxly6H5F6AIRlZeflKg9C9rJjyboCsTBtv6k05n+cZsrElxN2lO/mY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784471877; c=relaxed/simple;
	bh=Rw4KkabFvRk6x0m0sIuUEkqg5GHr20VlpBkIP4HsAiE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BiDUOZrxOgzmuTwgaqnMwhVWJ6HB570F8T6SnFMHIVN1CdHBqoaN/PKzh7maYXFGcbfIabypagxMr1BokAf+GttHxDz8zfS6FDAN0219VkmHZtE5/3BTrFZKJgCMK2L64EeH3c2RToqvCW1vLwCZqBvWhGSNUbrNDaJTAq2Wi3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PhIoEkp0; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PhIoEkp0"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-ca12086c06eso7710566a12.0
        for <linux-hwmon@vger.kernel.org>; Sun, 19 Jul 2026 07:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784471875; x=1785076675; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CC0aMb7qAWXPhUjbInQtFGyG9kN9aEnozpd6uGSLXow=;
        b=PhIoEkp0gR5EgYTwgFouOk5Lkbdu29iv8uDpU0FVW+GQSHNOSK33ClNF+agxhuMG/j
         KeaJybm3NBQMJ1htGRp7d1vStNLFZuAkNLVlPdjjSVmFXVZVkSTp0wza4geUZQNhC8La
         vcftsxdeAb+GtM2tEKCdbrgN420IoF+Q52Q4WMLoSd7yt65vcfkVyeX2pDU3KH35SkHv
         gkl61JXPGI8E5NUtGepWAi5HfvdUNFk++mlhBjiuH6i3cFPLvKZ5qVl4s5tSaFGOX41W
         wCjLUWzUwpf1wqEmlvWe1YAHoBBuwOGHckvvXZ1tpEbBP80ryoXN4fX6OTdZcLei7eA+
         0arw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784471875; x=1785076675;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CC0aMb7qAWXPhUjbInQtFGyG9kN9aEnozpd6uGSLXow=;
        b=Ok1lSr/39XYxjOAN6x7xeaeiIXr60oRXs1DgiVmKNkT7hU6IOMgYT+ySRoldEXAHg1
         gbj1QmAkvnSq+zft8+n2DwAGCBQAagT09npjrPRxD/fzJUQnv4be60Ojxsf8OW4iLCIY
         zrYS8d/gMNRYwQBHTQAjlRAigU9JLVAOGmD9z8uxQNW+UlRAX9PxQjpSR14WF7bXBmZR
         PY3jvmHlgDj0IHmfs97Kl61BrcRBGCIB+gsbhwW434mdegiBgN3s7nXh099tDIdWIMh2
         hfwKfFvrx+IYoVhkMyBQl8++4xYUwt534Bj30ulOP5sPqiTkN/yivcImJ5uSTHbBU4rM
         ETwA==
X-Forwarded-Encrypted: i=1; AHgh+RpzeC8gZB9Mvho4aI3oj+JtgI0sTa6OHTaY9ECJUOt/3JPLkg4kE7a+c6u7OVxqOHM4eXZd6erT/jECUQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyPtmJr4wNgsIKUph+8qDt3r7iki2iNrNWFFMi8T1vueAicdMcK
	jQA6IfZDfR0kdp6oNFcw8HAWo54VfopARTUYQCdLFROQWStzVbBk/Ere
X-Gm-Gg: AfdE7cnWoZHK51/l3FtSoShQ12qkSxhUH/p5aC1TzT2qbtLX4mJtyLwIyOxUnqpcxbC
	c30ECJAySe1VGs65D8cQ63sDQ351r5V572+KWlPnJGP8n9ph+5YCyjulUB7zQ4FFor69Dz/eneQ
	IlSqqRm4tCGOm7JpcJbDexEVYzGLlkhak7VQ151gcq8YGpA3mYKD1Zt4ik7WpAR0/uORVTQtu5Z
	prZY+hPdoLUOnssSQMMhvkqqpfFt3WgHGiZxpf/EMg80knMyT1nbUnO++NAkqHHK1kI4jfxj/Gx
	HE+6GCeoPPkfKVSUAwogsV5wmyEqqecuUiIvb4f2E9Z6HrbjZki0lBa88tZq9J51angzrnNhDIA
	67pzFw2pfXRB1zEbeJ+hMonqEr2UJHz+eLXo3pUTVFQ1XAVK0w9Ibygei4HHaI9LK34VgEiQI6r
	HZ1Kpi/QAl2aTNjgk=
X-Received: by 2002:a05:6a00:22d0:b0:847:9aa8:d3bb with SMTP id d2e1a72fcca58-84c29239837mr10586851b3a.12.1784471875513;
        Sun, 19 Jul 2026 07:37:55 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2ad8b766sm4269335b3a.4.2026.07.19.07.37.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 07:37:54 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 19 Jul 2026 07:37:54 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Shih-Yuan Lee <fourdollars@debian.org>
Cc: Henrik Rydberg <rydberg@bitmath.org>, Armin Wolf <W_Armin@gmx.de>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 1/3] hwmon: (applesmc) Cache fan positions during
 register initialization
Message-ID: <14959cbc-36c1-4cad-bab4-ebd38ba0f677@roeck-us.net>
References: <20260710123236.10508-1-fourdollars@debian.org>
 <20260711093323.14529-1-fourdollars@debian.org>
 <20260711093323.14529-2-fourdollars@debian.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260711093323.14529-2-fourdollars@debian.org>

On Sat, Jul 11, 2026 at 05:33:21PM +0800, Shih-Yuan Lee wrote:
> To support the read_string callback for fan labels in the modern HWMON
> API, load and cache the fan position names in smcreg.fan_positions
> during register initialization.
> 
> Pre-pad fallback labels with four spaces to match the "+ 4" pointer
> arithmetic offset used by all fan labels in the read_string callback.
> 
> Signed-off-by: Shih-Yuan Lee <fourdollars@debian.org>

Applied.

Thanks,
Guenter
