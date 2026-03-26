Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10D3A3E6DFC
	for <linux-hwmon@vger.kernel.org>; Thu, 26 Mar 2026 11:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774524839; cv=none; b=JWqCk7waBV6gzMVHHW76eZB/IfyPo51YeKAlCvlyLaXj0R4318Bv9Q9ZTTq8nJh41tAACR/Lv3dW5i7ddVSp6NN89UPSHFBaWLqe+WJnt16XzQjzXHG+m7pVSsstkr2P7PsMimfHhj8lHT4cwa5rf1+TiS7YxPlXgW5GMMD6IKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774524839; c=relaxed/simple;
	bh=9LkO50vinHgqslKj/UQC9423D7Xqh+en7g6xz0yqQ2c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TyktXVhrb1euDDbJCzl1tRLAtB61CwrUfo77YkUVtMExQqJ19NKZyNvjeDPqjL3+A8rHEfK/hI6B9Hhkg4Q8f4ROmQXKAIxNlCcwkH4ThOPjjvQG0DMzRMxl5Djd8+B76dB/PzfuoOsyFAuJsi6FUIfRFahjvutjG414IqWj1rQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F9n8wjDw; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F9n8wjDw"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-35c1d101355so335972a91.1
        for <linux-hwmon@vger.kernel.org>; Thu, 26 Mar 2026 04:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774524830; x=1775129630; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KYb15l6SkwoaSumNC8Ir357QOvFQPlKPvUcLWk1X+To=;
        b=F9n8wjDwASEqtxkc4VDlJWILkq9QrfW0fKee8x2oLe3hfliNnFSjhDFI38SF96jdEJ
         0m08YAZ7ZHszPisE423KIA+uSU2yDFglDlCbgpUi8cSSoxx2e6mCP5lFVDpSFvWEOHE9
         b9FVhMciN+IOollSRs4JmA05Ygy7nuZyfm79mtPauPyS/tsPJLqVrIkmwg6+d3B99mHd
         /4Cu+KiiENydpyOSB+AhKROfgmmpoetVY23JG9LfVatvWYXsgpyRCEKuPkB4JiGXw/Um
         FnDLqbgjpZbmYCK4NRKHUczuSNxdFw2XykB+ASKzhk6BzIzxo0ehvvTvesJsv1jcHM1D
         IF9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774524830; x=1775129630;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KYb15l6SkwoaSumNC8Ir357QOvFQPlKPvUcLWk1X+To=;
        b=QH83H8lsZJX5HAJu1s2SLj/Vumr837MZYxf3/aJQFwTUSTdb0FUrnG2z2tbKbBh/cy
         FDLmfME5hl8xoDkn3DX6B88vyWJ9D742UlKTC8W5rKIZ58vmDN3Rr/BZrQ6YMRogZNdk
         iE84/idcc4/JSWXaIRBimw0Ex+xvhDNKCOlS61wyFhbCBZBcK67Y4wDB83T2gxf4najz
         ZhGYTICJv/FSS9yK0ZeRXdh/T8fLMoDyUshD+RuAtCumMWERm/JZkzR9gOAA+ocMYNEO
         mAEhy+37bfpZ7h2ecXyXLaTKCHAuWbKB2gLvU7HR8N98Hxu5qSLzKVIWZrppqsZrcaUN
         4cmw==
X-Forwarded-Encrypted: i=1; AJvYcCU2n01xqW7wIReN9k8wUtonhi6QMlzqCVK0im76JkIQeGh+e4WuB4eBTe46tkwIRcEBPjkJlqS+lnbJzg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzVE3BqIoA9EBjx99Der1KkeXeCCJxd7L+VizO/Jmw9UPJgrGHH
	p89N6rLumarVNkP+TsYNu5VcBrPazC8y9MAKu9ko1GFMRAYLJfvFm7zS
X-Gm-Gg: ATEYQzzmherIqT3c1UrUigMXBjsxmFH1YQkbdCJ5yOU+0kZyW2NvD4AwC8RXV1edoBM
	/6H1b7OKjU63+zjfzRGNvTYTc/9L6dLwxwxtsAhEAx1Slff2cF0MNR5EUeFFikN2NezV0Xqw55X
	2zFGnR5pPcpeISJ6wNgl5ISmIqY8ZVObnCKVJXsm2w10SpZqjKdi+kK2p/lH+pBRYKdiXx0Ihhi
	M2Mg0ZT4/EWQ4KlD+6RSXBrbKMM714XxKqVawB7usLEP4AqKWWhermbDbxUR1vyD8wC08FQgMsa
	zUVHXcAG6Gpu66yp5Q8wZy4WGJ32DXeDuVY4kzokl9l0qtuBAz+/JT4BqKCJjNva/acuP3IEhrU
	dvTK+tl+NYPhDwdDhoz5ydCqNej3HqXUlV00ArEHoHeAOfhW1dQ+bQryh7mhB8b8KfZUYJdGV4O
	OxwY2MKVlDPrCkzVjaM5EoGfvv4ZVOtOxxVtZU
X-Received: by 2002:a17:90a:dfc8:b0:35b:90e7:c458 with SMTP id 98e67ed59e1d1-35c0dcb107dmr6491699a91.3.1774524829752;
        Thu, 26 Mar 2026 04:33:49 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c22db1321sm1415724a91.14.2026.03.26.04.33.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 04:33:49 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 26 Mar 2026 04:33:48 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, brgl@kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-iio@vger.kernel.org
Subject: Re: [PATCH] hwmon: (ina2xx) drop unused platform data
Message-ID: <fd613c1d-c9c0-464a-ab1f-16bfe20e122d@roeck-us.net>
References: <20260326-drop-ina2xx-pdata-v1-1-c159437bb2df@oss.qualcomm.com>
 <a4661a50-1419-458f-a0f9-a9d9f6f59177@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a4661a50-1419-458f-a0f9-a9d9f6f59177@roeck-us.net>

On Thu, Mar 26, 2026 at 04:28:16AM -0700, Guenter Roeck wrote:
> Hi,
> 
> On Thu, Mar 26, 2026 at 10:30:00AM +0100, Bartosz Golaszewski wrote:
> > Nobody defines struct ina2xx_platform_data. Remove platform data support
> > from the drivers which still have it (it's effectively dead code) and
> > remove the header.
> > 
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> > Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> 
> Thanks a lot for your patch. Checkpatch complains:
> 
> CHECK: Alignment should match open parenthesis
> 
> No need to resend, I'll fix that up.
> 
> Applied.
> 

Ah, no, I can not do that. You also touched drivers/iio/adc/ina2xx-adc.c,
meaning I'll either need an Ack from Jonathan or the patch will need to be
split.

Guenter
