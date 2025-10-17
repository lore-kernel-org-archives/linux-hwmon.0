Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFCDF2DAFB0
	for <linux-hwmon@vger.kernel.org>; Fri, 17 Oct 2025 12:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760705588; cv=none; b=BvqDqsslp96eWL+bwBxtho4BgqIAiIWCN0ke5bq4MoDna3m6hnjRyot1Fsnw1HLiFXwiNxdTk1M1wG45vblskM8MTkwl8HsmnI2Jjw+7HJp3/qkbGhNe015qCL/QrYUBDTGHRIZz6dxDFxJQQE7n0BKHm6ZLAFbykRyqG70eR6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760705588; c=relaxed/simple;
	bh=q0dKvcJXcIqsz8kbuZxRuCwTz45q3VYiBczF46lCmoc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DOfXLAVcRVnGt9UH4J5PDAT3FB0itAxTUYOom3F3tTXvb8R+jhiv8aBjXTQ6JfqjCZYrlO13N6e10EZu/ozaAxHiCg7VCbCdq97votCWDysObYsxFBlsiD+i+cwfsS+Sddx3E6HA0cpwUE8+GURWn4jGf+121z5Ae9D/6XiEzo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YtzqUJ84; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YtzqUJ84"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-292322d10feso1820035ad.0
        for <linux-hwmon@vger.kernel.org>; Fri, 17 Oct 2025 05:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760705585; x=1761310385; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4KPuy8xanc30aUC0NeAjXkSoXgg+j9Yhzu5edLPhaAs=;
        b=YtzqUJ84tsEAWC7vW200fU3xiSBeMscuRWsJivrTjT1Wbdp8veOATJptoFoxMakSTe
         2CEOPdYJRN0gFJby7f+6oMQW30Mm7f+O5ZsempqwDtXMekhOF9aIAyjf9TFgff6PpFd0
         RQRN9IguYcbbfXC95Usy2J5qX9SIBhCWoEODNcO4iyLyXH0jaPI5UHDtx1x91jbgqsan
         2JsRx76q1EeRKAYpfuUggyJgx8mxan+5Gmnrn4RT5xIHimwSEOAhNyvNMsRNl0vQvFFt
         XqewDnbnEvoMHeWttQF+FhWwmbDwfqik+V5p5unEP/naY2hjqb7BL3OXbvQZ1OdsAiVg
         eQCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760705585; x=1761310385;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4KPuy8xanc30aUC0NeAjXkSoXgg+j9Yhzu5edLPhaAs=;
        b=RJ0KmUoacHOQN4B1LXUaVmxllnEDdX232rljFSYPvilMwVz+mXOoA3a8yL7PI64+3z
         2/0MSOyJywrWc2xKDNazkPqkR2VG0TCEvlgfyNIZo/w9h5FdInjB7WMd1++QGJHIVusO
         2piZ/u3AWkcmNQMHcMCpe1StGnYAgCZKJQwHibfu21VL+5m4GWk3FeHd2F7MQ1T8b2g3
         XC/YVnF1bvcS9nIMtrlpPOaCxaDF0+DmcOxMX5HJripF7suqoTD489b+PfUMxESuOM3D
         YkLmHgcaCuKDmBQO5cyX6TzgGbqLqqj/hcp3k69B+LuzjWaady90OTDx4lLuQYyGuaZd
         Jcrw==
X-Forwarded-Encrypted: i=1; AJvYcCUm7TNag2jKgii/giBKmcx0qYfSMtmYXwkAfb5OiVww1F4Vw5HsB0O1oEzwbM05xvhSvX+WJHZgxQCAfQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxaoAJAD2HRGp3LIydiUuDZmmVToNpwPy1TK+w7vHRAtvalsRD7
	iA0tm//w8+QNBAtavhVUSpUAFvzsTL031KzEvPMqFy4FqOFCLd2aJdrY
X-Gm-Gg: ASbGncuKDWCsDf4UbyjPuSu3wd6A7/OliZ2l8OWD2PDIcmVWMYDWYSB/WnBYbtbv6kA
	dQVyJxwgOePXcJaobF6V1rQvHCEu0WL8MQNhIEupz+Mg30iwI8yfVJdCvLGqXPNaHPYBYyDlAIn
	9ryh6uZfSZY0PQqVD5F5zFwSvcGHEtNmKkrLQLqn8ozlIn71WV8aNmIuXYDmAS+KKrj6T2AaZ8O
	UW61Tb1hKjyn5d9BA6tPCNUjDG0JxdWO3ICjDi4GJUib2+03gg1m6f2Rqqamvwyx8qddjayCBhd
	V78kuj4wb2RphDRiqNxkZhm3SJtnl/Z1kb3mwWy0UdsjT6pn2qN0YTuuBHewGHwNrJ4YALqduuM
	iL/OSifuN20o2ds1XDeDGMfdXqvBSBJTfABnmcwq1sxjIbJ2A6gxRlGdma4as0bxjDtd4d1e+mU
	CVMgZnBfzpQBVZQLOL7VQyEuk=
X-Google-Smtp-Source: AGHT+IG5O3uFCStwtBtYTlo/Za7+Ei3oHkieQstV+E+Ni78R3C1MS3A0qnauKtcp81RiP5MMdGWSXg==
X-Received: by 2002:a17:902:d58d:b0:265:b60f:d18 with SMTP id d9443c01a7336-290c66d9f6amr39830685ad.1.1760705585006;
        Fri, 17 Oct 2025 05:53:05 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2909930a999sm63835595ad.9.2025.10.17.05.53.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 05:53:04 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 17 Oct 2025 05:53:03 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Ankan Biswas <spyjetfayed@gmail.com>
Cc: corbet@lwn.net, skhan@linuxfoundation.org, khalid@kernel.org,
	david.hunter.linux@gmail.com, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH 3/3] docs/hwmon: Update maxim-ic.com links to analog.com
Message-ID: <07862286-4e65-41ab-bcbb-ad9b8432ef71@roeck-us.net>
References: <20251017105740.17646-1-spyjetfayed@gmail.com>
 <20251017105740.17646-4-spyjetfayed@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251017105740.17646-4-spyjetfayed@gmail.com>

On Fri, Oct 17, 2025 at 04:27:18PM +0530, Ankan Biswas wrote:
> In 2021, Maxim Integrated was acquired by Analog Devices.
> maxim-ic.com & maximintegrated.com links redirect to analog.com.
> 
> Update maxim-ic.com & maximintegrated.com links to analog.com links.
> 
> Signed-off-by: Ankan Biswas <spyjetfayed@gmail.com>
> ---
>  Documentation/hwmon/max127.rst   |  4 +++-
>  Documentation/hwmon/max16601.rst |  4 +++-
>  Documentation/hwmon/max1668.rst  |  4 +++-
>  Documentation/hwmon/max197.rst   |  8 +++++--
>  Documentation/hwmon/max20730.rst | 16 +++++++++----
>  Documentation/hwmon/max31722.rst |  8 +++++--
>  Documentation/hwmon/max31730.rst |  4 +++-
>  Documentation/hwmon/max31785.rst |  4 +++-
>  Documentation/hwmon/max34440.rst | 24 ++++++++++++++-----
>  Documentation/hwmon/max6620.rst  |  4 +++-
>  Documentation/hwmon/max6639.rst  |  4 +++-
>  Documentation/hwmon/max6697.rst  | 40 ++++++++++++++++++++++++--------
>  12 files changed, 93 insertions(+), 31 deletions(-)
> 
> diff --git a/Documentation/hwmon/max127.rst b/Documentation/hwmon/max127.rst
> index dc192dd9c37c..5ff2f64f9daa 100644
> --- a/Documentation/hwmon/max127.rst
> +++ b/Documentation/hwmon/max127.rst
> @@ -13,7 +13,9 @@ Supported chips:
>  
>      Prefix: 'max127'
>  
> -    Datasheet: https://datasheets.maximintegrated.com/en/ds/MAX127-MAX128.pdf
> +    Datasheet: Publicly available at the Maxim website
> +
> +	       https://www.analog.com/media/en/technical-documentation/data-sheets/max127-max128.pdf

Text or link, but not both.

Guenter
