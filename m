Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC8F37AA97
	for <linux-hwmon@vger.kernel.org>; Fri, 25 Sep 2026 02:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790303842; cv=none; b=ka7XbIpDa18tp7+pDkclriEAOtA8GkehsWApGg/vrneqMtRli1yCGHNDKlN0c+dXpgPo1CmcYiS5yfLVjKqPo0akqdSvKGhuxCHBGd4KBQDDvxKLGu/6S619cH5+RSY+ifqMdd9H/WZD83kICCM26sK9/AbJXK0yXIDE4VN1TZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790303842; c=relaxed/simple;
	bh=l04TOEpZhNykE621pEvmbpIKDfEahGsajnZ9Kaku39g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m4OWhiAM3vgLTCp7lCO3C1JerAo3RLgzsy9pGn+wSPOGnK7wbF/Mu13JGM91GSiCLmXx7yeei/grYNxYsdfu8Jw93Z2dYGhMsZ9+WhHamesTl2TozCtvP+JTv70KXgG9jCkH43SPnvpNT3BgOlI9xjTIn6fR7df1oG8RPFAdr1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KL+zBgxt; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KL+zBgxt"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccd4f99dso304221a91.2
        for <linux-hwmon@vger.kernel.org>; Thu, 24 Sep 2026 19:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790303840; x=1790908640; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1hvE16omYzK/0hBy/Co0mAjilr6lqIeUfcQO23ZacDw=;
        b=KL+zBgxtIBssg8/Unkb7HE/+n4xWKkedfY3JR03MT2YtJ8CL8ZXVBsBrfRIQUUjmzc
         X/KcWJe6UlQ7myW02AUMmrd6Y8PPl31K+G09Fq8lJktNlE2Y01mc5zQL4NAJW9Knd52O
         2LhhJo7KXDUBIfdXE3dxbn9Fq66D7uNJ2RWoEGCFFvaJ00zUqhjMMlOyxpzK9UsgXXKk
         NsFEM/yNrvM6CwvF7FdnXG0rNDRF/iEkT2Iv2NRnD7ez2HPCwMYDIrdHXkOw2Li7id3e
         I7LF+3OLM2VYd/1nN/qk5oIKETzwSZRj8My+xo3j0hQAE5LQONQ3Fq6nm+RtcR08taV3
         1fdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790303840; x=1790908640;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1hvE16omYzK/0hBy/Co0mAjilr6lqIeUfcQO23ZacDw=;
        b=0W/fowsWj3o80EelzHAgxjoPlicwHcdTujz2nzrgzJwH5qj37cZz5SGpVp9ONjM1S4
         Y5oKUpRWEzv755mJXMQx/QftxQ1w+CuEpnUREu8UVplkAyc9rrH4xQLvZu9Z/sySjhwz
         NIB3/WOd77I53/y6S8Z3+I9/G8VAJZNg1eUak3U90c8Ea4OMc3hVa3/8Iwv1o6VDO0vC
         hvf+clJsd0km/lFwme14VsYHKP92PM7ty1658YDQETrTjbd+Xg+R/meubePZv1SGe+Cv
         SpGId5PT8zB4N5O47EPFkH0rfTYCX0nSJpYBZUSctTwg1LMA/6LjXvjbi5OsC4qC4k4u
         XPmw==
X-Forwarded-Encrypted: i=1; AKwUvBxyMkNViPqpbby3yBcLlTQiJ9GyqaggK2sJbpJzoIR5QZURs9prIpkIRZTlsSNc8pOhTgQXH3R20bnWmw==@vger.kernel.org
X-Gm-Message-State: AFuF++lDFtrBvpH6tZ31nWUCbYHG4TjXsSFqhO/pdfcbNgl1MaWodmf0
	5jni5NcjzAQCAKHd/y2s4eEEYv4V1toSb+f2DVQwAuAGUU9/smGkcO4C
X-Gm-Gg: AYBFou0wpuDdacY+ORTGzPZ5bvC+cSQgQc5H3h510UnnAhFrFio9X0DpG/3cNF7sPYU
	oVGXQOYt5Jm36oOGup/lmgash1NrR6bEvj6jl/RriOigcb1bfl066hl8WpMYGH/bpstPDI/Xu2o
	tFA295MvrgPykn8Xdanvwfddd8WS/oaAR1cmXXLtswrifZpoBXjCl94ABGKjy3p/PvZ9TpR9n5e
	jSUPyLNmXyq+BhpZAwMNt+/lUHDMonMS5kMnQXKN3QSj0sMeOXe9JlRCdILgyhgMceLTIUFHuJ1
	luimxLWXEFYUTafezKPK1NhUglikFQuFyNMUEzP6TI9tmMB1NgV01aRBC4gKxtYpXI9gEdsJ+if
	Es7lPf+bYUMugjIOm3D/uWFrE/Id4hJA8Li42pqIu7l7Tp59fzmRQMuucbbHqojwN2tPenl1Avl
	i4UyhiCD0FSp+frbWopd6Behm+fZj78Ja8CC04zDIIu6APD57pf251X/A+p728muFGRDD58MvGe
	Mwstw+1hUnR
X-Received: by 2002:a17:90a:d446:b0:39e:6c69:9b8d with SMTP id 98e67ed59e1d1-3a099230f6amr3868920a91.50.1790303840107;
        Thu, 24 Sep 2026 19:37:20 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b9356f48sm1507678a91.6.2026.09.24.19.37.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 19:37:19 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 24 Sep 2026 19:37:18 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
Cc: david.nystrom@est.tech, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	ricardo.neri@intel.com
Subject: Re: [PATCH 0/3] hwmon: (coretemp) Report unreliable temperature
 readings
Message-ID: <46f9f319-de71-412f-a424-6cb801478456@roeck-us.net>
References: <20260924-coretemp-temp-fault-v1-0-1884f0ff97d5@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924-coretemp-temp-fault-v1-0-1884f0ff97d5@linux.intel.com>

On Thu, Sep 24, 2026 at 07:33:19PM -0700, Ricardo Neri wrote:
> Hi,
> 
> Intel CPUs indicate in IA32_[PACKAGE]_THERM_STATUS whether the digital
> thermal readout they expose is valid. coretemp deliberately ignores that
> indication, for the reason given in commit bf6ea084ebb5 ("hwmon:
> (coretemp) Do not return -EAGAIN for low temperatures"): some CPUs clear
> it while the temperature is too low to be measured, and the value reported
> in that state is more useful to userspace than an error would be.
> 
> The consequence is that userspace cannot distinguish a genuinely low
> temperature from one the CPU could not measure. This series exposes the
> indication through the standard hwmon temp%d_fault attribute, leaving
> temp%d_input exactly as it is.
> 
> One user-visible effect is worth mentioning: sensors(1) prints FAULT in
> place of the temperature when temp%d_fault reads 1. On a CPU that clears
> the valid bit at low temperature, that core stops showing a number in the
> default output, although sensors -u and -j still report it, as does
> anything that reads temp%d_input from sysfs directly. A driver-custom
> attribute name would avoid this, but would be invisible to generic tools.
> Reporting the condition through the documented attribute looks like a
> better option, but please say if you prefer otherwise.

I think it would be _much_ better to return -ENODATA for invalid readings.
This isn't really a fault, after all. The sensor is not defective,
it just can not provide valid data.

With -ENODATA the sensors command reports N/A for the temperature
measurement, which I also think would be better than reporting FAULT.

Thanks,
Guenter
