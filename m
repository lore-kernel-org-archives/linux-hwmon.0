Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D360345EC5
	for <linux-hwmon@vger.kernel.org>; Thu, 23 Jul 2026 21:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784842589; cv=none; b=ONQygJm4Kp/VM4TYQGvwNGOtGse0AniXnAeJaGocUpAtU9ttMG9zatlxMv8wo9Si2ote/EA0/r+qLynhV6X3etXe+VQe0L/vnEdvKmVV3QRoh7W1f6DKJuJ/Em2UoWfwFbHVM35yv42xJpUqhH67SujY3E4rMP3uVyMmss4oUng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784842589; c=relaxed/simple;
	bh=nZywLPbLzF4rq+/qFXJiQOWrYkbZMu0rWux6FAaMmds=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M3YKxX+A8mi/OFDLAs0vPVeeJUgl62KB024Lb0kl+zlLztD8fbV+zNI9L0BEbYqyyqF38RQZoLvorPsa78RHAWjJs85Pc75AARFyelzGnxjV1QPh0lVb2NpAmC4LWIxZUgFHjIQblHfMgCCauErgTuCS/YLE47QDhGEFF/8up08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jEb4laox; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jEb4laox"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8486672f03cso1184531b3a.0
        for <linux-hwmon@vger.kernel.org>; Thu, 23 Jul 2026 14:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784842587; x=1785447387; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7oY6XrKwOvx5mixYV39vBKj7VlF4d0i2PtDOKuSJh8Y=;
        b=jEb4laox2Pc/10uCnm7wOygwKDal66OFo37bCyHwZmgd4bThnrvSYbftjIisMepY6c
         P5x2KQ2FzdrsFQrmZdovyA++fgr045xp7hpL0FA2sWwIByW09QIVuhhAk1gEJdAFiLBf
         Ot1OvaipUUvoPiKb4RaYoc6/1d/qjIpgJLSdKIgv5yoYpLTgFj3P0vNADGwT7I/MIu2x
         DIfgzyN1ZYhlLRsInLnt23uwMTPxR4d3ocSUR5+GKBd8jzhvIO7i/MOuP34q1xLDt/Zp
         ym/x78YdVb4JGi2aZFooUznvX67lmKWlXhnqWqTsVGv8yiZNOTbGjtpxbKAF8fzo4Ibu
         bJ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784842587; x=1785447387;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7oY6XrKwOvx5mixYV39vBKj7VlF4d0i2PtDOKuSJh8Y=;
        b=VCtoK9ZgBy6CgRxY6WKS9Xr7v7cwq9/9aA6oFlHOudWFg/x38mfpEkJ0zv8iBH+vpj
         bk25q4CVFpHQobMQFlHxmlBUzYxBJLGJjCZ/nkOsWEghPuFoDwBPRYBEs5jSe0u+xj4M
         N6zOMTuXffC5yTe/MAJBK5KIs3f4CCay2osznvRFfb4mt7VUGmSaYn/m/FPUk2HLR6TM
         AiQ+2r8b0KNYUdEyiL66L+z5e+fBD2LwdHXFjEhh4jaC4FPSq0YGLk44WNGLlaNSFSgB
         eVxL4g0MNZWADHLVMZDE6LvOeY2yPSg1Pm2jPdeglQZ/JjX4P8GQjVK18ivLpwegoAVK
         hT7w==
X-Forwarded-Encrypted: i=1; AHgh+Rpn3Jr+kap2y2qMWgF3i4XCAqxRoPJ8TPzeZUMbshcSoi3R5BOmpmlEl25zzPB3fKaNvGhFnc///ub9/A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwguN8fnYBUQNdFVM5XRBmqyjJYaEwF+g7gjtsU6PsKPyehE1FE
	4ESLNQO2dg4rQroyC61gVYnMxAg5FRqiQIGCDubsT29CpXugOVOm/nCP
X-Gm-Gg: AR+sD120O1Vcjrk47bTjbrxhpfth0FLWAB3jk5RTswIBGEQo9sr+0bdlEHRk3kiBf5Y
	1v107Bkgo3uK0lQ525JyYHCGLY7+ujESu11OPp9DjPCCVMVkvvJLXmDR6ft0/dDODWCha/mAYdX
	T5jKcsDsBqMH5zJMzcRluiZTbyETt46ufltutiPIPLBuMcrJFuywDXWgCYaYjqB+AhioWDdYyZ9
	ZcRZO1OtbnOB3x5CFu8tjmJz4gAN2DtpNj2MYHk+kB87CqCxpDgRyizyAVNHbN0HgPJAdIPWYw/
	lmWnOztJixFRApoyW+UKK7KOZymHlrbjlwduBYGXHWeEzTNvHtmdpNOCNU+MunYAkNMYTB5XUZg
	UenHfluj9aaAlxYfyExMsLdM+l0wXCE//D0OA7RMKX3xXhMqxgMbKqyxqyNYVeOAKgQ088m4GuU
	c/ylc1MLMLDDR6pKc=
X-Received: by 2002:a05:6a00:4f83:b0:848:2f7a:2e52 with SMTP id d2e1a72fcca58-84e2bb71d71mr5691690b3a.65.1784842587587;
        Thu, 23 Jul 2026 14:36:27 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbb8f1a9967sm3282917a12.25.2026.07.23.14.36.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 14:36:27 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 23 Jul 2026 14:36:26 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Cc: Kun Yi <kunyi@google.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	Carlos Jones Jr <carlosjr.jones@analog.com>
Subject: Re: [PATCH v2 3/3] hwmon: (pmbus/max34440): Add support for MAX34452
Message-ID: <1dcfdbad-93dc-4a71-8308-a0936450661f@roeck-us.net>
References: <20260722-max34451_fixes-v2-0-bbddb18ec1d6@analog.com>
 <20260722-max34451_fixes-v2-3-bbddb18ec1d6@analog.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260722-max34451_fixes-v2-3-bbddb18ec1d6@analog.com>

On Wed, Jul 22, 2026 at 09:29:31AM +0800, Alexis Czezar Torreno wrote:
> From: Carlos Jones Jr <carlosjr.jones@analog.com>
> 
> Add support for Maxim MAX34452 PMBus 16-Channel V/I Monitor and
> 12-Channel Sequencer/Marginer. The device is similar to MAX34451
> and shares the same configuration function.
> 
> The MAX34452 supports:
> - 16 configurable voltage/current monitoring channels
> - 5 temperature sensors (pages 16-20)
> - Dynamic channel configuration via MFR_CHANNEL_CONFIG
> - IOUT average monitoring
> 
> Signed-off-by: Carlos Jones Jr <carlosjr.jones@analog.com>
> Co-Developed by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
> Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>

Applied.

Thanks,
Guenter
