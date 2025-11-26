Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0C5B334368
	for <linux-hwmon@vger.kernel.org>; Wed, 26 Nov 2025 15:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764172062; cv=none; b=cnKg2t+LUs343fhWETS7Pra2pDGQO8mwS4BUD6ChcPnFwnK1E9S5XzQrl6q18mVVZjA06nU/x3Op1l7evE5AJWBaT71mY+qWgvjayjeGLF9Ip6N+0hRrxzM4k5vc1qD57xdtkBVTmmuSjF80rdvs2h8Wmbz9iYgDXV9Cj3Mj7vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764172062; c=relaxed/simple;
	bh=7iiTxNdc8046qU8odOqHiUP/nHnycJlb1fa0+2jHNdw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qbkseMDSDNV0zp5Qq+9oD7SITbzhg8MS/v2rlcGED0jAOoZkjtP8vV4k/mT/CX1P81ChJzTu/Ie6r6ItEZmF8I5DfTpey/jpkP40v92xHyUogZKI2HlcWL9hf+CjOb7YBX4NJmGEW/mSCQc2uXd2cAPVdC9SmNoxIKiVVRjVWlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UvoGeLaJ; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UvoGeLaJ"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3434700be69so9618814a91.1
        for <linux-hwmon@vger.kernel.org>; Wed, 26 Nov 2025 07:47:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764172060; x=1764776860; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xF5Xtni1/AYFqCokHeYYJP04NlV/hJc9AHFoC1o2Aug=;
        b=UvoGeLaJsLMoTI2lZhAh3Wf37obj7diZAie+ritTKO6yvTE92EI/INsx1UQNWJJS7F
         DlRV6/woYkCIrobQvIyzvXjoIpuFMTBwsldegDOoGyoA7SU8ncXTLyfMRcwWn4IdYcHg
         iLrVEAQg+wPizvbacUtjP15av/6v3XD+1XvKaEX4F7YuInOOp4M7XYxhUf+Gti1ss1Ze
         bAnrdjm4UgnfkUE6lH1hk44SkFTmGGcHhlvB9A3ZBf+zbhGhBoWCZNTUP0Dmw6Y3n6w+
         XKh2zZVgtOy5AYYOrxednZxvAd2BhWGfj3rvf8d6Vx0YsHYvZ8rqy/P3NQrngChS7N5M
         8L3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764172060; x=1764776860;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xF5Xtni1/AYFqCokHeYYJP04NlV/hJc9AHFoC1o2Aug=;
        b=Pw9n/g9obWeOZFO0PXICfCU7w1iUVXImJKHnLSenjuQh5uMJ/Ds0JBStmYVhh+KXp4
         e8//u5OizSBL9TeRbKRcU9TcNP500zyq+3a8HlEi/2vTiGIxi0Vsm44Vech0Mo6ImUQc
         OVsJQImFg9nPCCSuXeeDTwntfNZFHBxmoXzgxAAD/haqf/5rz2YEU5FY06C5k1mmaCxK
         yqaJ67zJ8siE5DJ1yjZB7DjVg7AgwJLpKNQ8LzLAnYyp8jhH8gIcGj1f+QZEbblF332E
         y1P8hgTMd+jck+NB28HxR+FiaEK3AX4bRrZLMcR81t/A1gQsbMLa0bu3fBhRDDswSJfe
         /ydw==
X-Gm-Message-State: AOJu0Yy37RMhZTz/yec2Wshp8ypOeoJNDt9oNhPT9BVGaDjfSvQN0yae
	QmD7lUdbJzZeMgJ1q5pbBWznNLDiA5EtbBldrumIX9Pio8RaYXEAvhBN
X-Gm-Gg: ASbGncsLJz3vthJeeVQaLC9yCjMhb9ZAe6CN1n8QCnw+o1B3wB8EG64WxMcoUAQmWOu
	3cq/9bVTfuw6BPr7WK9gm7TDHuiKjJner3GbGMxCU30LadGDxSux9B6Vg4H7pdMql+u2mqJtL9X
	8YDy99dvIUeF6I7jSNKkzM7dRDNEoXd77OXjNValr0hO1ha0zFCZ0rmdMl7ONepu0eAjAlMtA5/
	Bu7lg8LZ6dF9fFyhUoxIt5liLloo3vWvyfWU+DbhYgPSdSafuE8h8kh4LrlZTpgo9EP+N0sjz50
	kYySyGA5ykMqyASzo57m9VjpMJ89/ajlLFjCx8rV8KafetQA/8/k/ClcTjEGli9KbJSm9lYvhN8
	d6Q3X+kgb887UZvYj40mzqBgiSibODvIwGj0awSawJtxIgXVShPYDtWiuXXbwYEgAvNln/AbGow
	DBMK/eEUIV6+V++IxC5bkvFpQ=
X-Google-Smtp-Source: AGHT+IFw0xH5oGTzPJ8jc3QTmyTJlEB4ZkNkdi8h2SLw4qW7lsXPs1iPmfIJlo4B9zuyjXSwSJOgQg==
X-Received: by 2002:a05:7022:7e05:b0:119:e56b:c75b with SMTP id a92af1059eb24-11cbba4a4edmr4966865c88.32.1764172059996;
        Wed, 26 Nov 2025 07:47:39 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11c93db556csm95966195c88.1.2025.11.26.07.47.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 07:47:39 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 26 Nov 2025 07:47:37 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Gui-Dong Han <hanguidong02@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (lm87) Convert macros to functions to avoid TOCTOU
Message-ID: <7bbdaf5a-4d88-4fc1-bcc8-597fec2851dd@roeck-us.net>
References: <20251126113542.9968-1-hanguidong02@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126113542.9968-1-hanguidong02@gmail.com>

On Wed, Nov 26, 2025 at 07:35:42PM +0800, Gui-Dong Han wrote:
> The macro FAN_FROM_REG evaluates its arguments multiple times. When used
> in lockless contexts involving shared driver data, this causes
> Time-of-Check to Time-of-Use (TOCTOU) race conditions.
> 
> Convert the macro to a static function. This guarantees that arguments
> are evaluated only once (pass-by-value), preventing the race
> conditions.
> 
> Adhere to the principle of minimal changes by only converting macros
> that evaluate arguments multiple times and are used in lockless
> contexts.
> 
> Link: https://lore.kernel.org/all/CALbr=LYJ_ehtp53HXEVkSpYoub+XYSTU8Rg=o1xxMJ8=5z8B-g@mail.gmail.com/
> Signed-off-by: Gui-Dong Han <hanguidong02@gmail.com>

Applied.

Thanks,
Guenter
