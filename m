Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 360741FF1B5
	for <linux-hwmon@vger.kernel.org>; Thu, 15 Jan 2026 16:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768495659; cv=none; b=HYkbqOP+afsMopS5YxU0KXSd2j6ToBP3Kb2Z1TYvtQl7/tX3RnJIOe12tMrwz2pDSbpTG2TfLEMWnpPCtsMzosaoubsLKk7bTeOHaRBzUSbBSaes4qjOXnICKjY7jjh/24wd9HuVXcW2C6Cq64ERWRfWqGk33BAxoacopXnP3zA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768495659; c=relaxed/simple;
	bh=4VZDOvg3BjtBmyI+CMoNBak8dDfp+aIFtkI5u02xfj0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F9L7eHD+KuRj9XvQj666sDS6j0xIkWFOkvMVbR5X8CASVeJGgfRuduCXTBYUQkMPUrSclpSYlJkJ0Ru1XgBks+BBetSpHWjwQQmnwatgXLGcblvdzO58kkyjjesfWhnVpmlt9Ib3vq7+mm/GH4YQ76/bld2lva64PtJ64YmlR44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BIYAwkxU; arc=none smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BIYAwkxU"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-12448c4d404so300831c88.1
        for <linux-hwmon@vger.kernel.org>; Thu, 15 Jan 2026 08:47:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768495657; x=1769100457; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x5ZTao3yOZ+iCDc27mYPUDqcopzuDV1du69FbuX3VKY=;
        b=BIYAwkxURjW5KTmAJe/KtrlDN9Nm2xoLaWuCBJzEcCoeb99WG0zR72Mm+BM1zYLwjQ
         foPueMd+el41TK/uZ7J680va+x3H9ucrNvmHagsPggUHr3yOlucUBJZu/467N1EiOdWK
         XO0hFFJKMNhjRH9a2woK8nQi/ZJqdSXmUd6bzzYtYGa8ZumOZUYEceyxWclzO7qt4ClX
         PE1berdwoqeCpMrn4+UM9QdlcM3z36SA5qNRIYL1isfeMMcCrszETWFIhcd0pvT1vuxr
         hgknEYkk99d7tKfMYu6gCpaBDEafY3qSIowDTscKPU1nlaLHIDBc0WMq/KaDhGJAtOEJ
         oeOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768495657; x=1769100457;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=x5ZTao3yOZ+iCDc27mYPUDqcopzuDV1du69FbuX3VKY=;
        b=J1yaw0oarQHGSFHOcYpez+v7Yy6OMlyWXaIXfhieQ+4E9UZngu+MfY2IyqdMr0VeqQ
         oKpKWQXhAZshoZYwfwuePUxpVl/ye2TEJj2G0Dk50F+MU/ElxYck5g34k/f8v5s7hBlA
         zM6fekZifR3llsF8lhboJtsOlWzbDd0w7R27iLqxbp2rtCogRdxnjaV/eh1D8NxNmLna
         TWOPso+l4Rb9g8OAmq7D2SrP8ZZteETbIT+2NDIx3P8ng0GMOeinfnSbjDdazmvZBIqh
         0Gm8yI4tlSy0DeQ8KzUnrIlurUFRUJ71qCnmhBUJOZvPMXNUbpjtFgqOtBl/1reEvbO6
         wFQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXysegcZ03fIend46QOiLg+xTbnftD6Q63qcD4/iZotdwwdq3fioZZn7LndW0A36tL25JhYbbRwmusByA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6M4dps24QCy5IejQ1FpidWzFYlsUboQnzmlHEEcQjrcv76W4A
	3a3lMRXryu6H8zMja9DNw9DWKOy0hd6hegRSWfDsy7eEdBHQOosemN3v
X-Gm-Gg: AY/fxX4b1TxbEznBRZ4iZ2E+Mq+MEGo/YtqTCLUTYNSBsb/V7t/Qt2sPth9QCgENAJB
	6aQ6EqUEl77F2p+gxib9Ro8p2+Ho17lK3lVYkMfNxFRG7Wvz88yvHiYntR3ByvOIVlO9Xr3dvhA
	5aM6/lYar0ZFPFubncZNrXST6csbyBOBR8w/Bmdk0TOlbWr3v//cMrgjgu/aX+ODdb1TbhyClsB
	bEEnCLHqGOd4uye9gTATv34KC5v66PlXv7zwpAWRBqA4iYuMEkr5RV0OZnEFGxSnOShEXTcFvsx
	y3lTp+mNEaofaUFrp7DHItWipmhy6iyxjuW7pKRfJESAh3Ybuo3SbGC9ALf0KoR0TCnuG7gZRbw
	Jq6kZJeKDD1D7CsM2/x2oveay9/wfnYiAyti9bQbyefu84McC+PoiCy4znMuQfLynfjYqSyEcW2
	xleWzUvvkvUc7bHA12nmxN0e0XOKRryZ4YAtE=
X-Received: by 2002:a05:7022:250f:b0:11b:9386:a386 with SMTP id a92af1059eb24-1244a7845d1mr263057c88.41.1768495657317;
        Thu, 15 Jan 2026 08:47:37 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1244af10c3csm44140c88.15.2026.01.15.08.47.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 08:47:36 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 15 Jan 2026 08:47:35 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Felix Gu <gu_0233@qq.com>
Cc: Ban Feng <kcfeng0@nuvoton.com>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] hwmon: nct7363: Fix a resource leak in
 nct7363_present_pwm_fanin
Message-ID: <e3ccafa8-0340-40c4-b4d0-ab591a873923@roeck-us.net>
References: <tencent_98E69D461A9CE773D3611822369100FE5A06@qq.com>
 <tencent_9717645269E4C07D3D131F52201E12E5E10A@qq.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_9717645269E4C07D3D131F52201E12E5E10A@qq.com>

On Thu, Jan 15, 2026 at 09:54:15PM +0800, Felix Gu wrote:
> When calling of_parse_phandle_with_args(), the caller is responsible
> to call of_node_put() to release the reference of device node.
> In nct7363_present_pwm_fanin, it does not release the reference,
> causing a resource leak.
> 
> Signed-off-by: Felix Gu <gu_0233@qq.com>

Applied.

Thanks,
Guenter
