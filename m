Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F36522D8378
	for <linux-hwmon@vger.kernel.org>; Fri, 11 Sep 2026 01:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789088463; cv=none; b=HsOxGYh0YS3V9o2TBW5TicRxODw/orQ8BIVdQfSRgojcpZnF3pKNHa4k7tmku8FeQRXEtdoP/YMkPz5uxnJw8yyBjU3GxNHGkAs54DK5ojEZ5BYGiRfooZ9HzSuIMcLg+/weeXGqwWK1P2CcgDfePeVq5eOw/q2wbBIymom46zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789088463; c=relaxed/simple;
	bh=Hve8OTKMJK2Sw15IWoumCJ3fcui/3UMynRb/vn3eBYU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DVg1jqcgPMTPDgc1Q2WTpcBI4OL3HWZkskCncpKOXvkRoCVaEAtix4NX6cR78BaMpAK6hBTO7DSg8V0JqHfEPw3JozFRMzymzHWXjeiVZA9Sj8l7bGr0Gl5izPwSOLlt0iJbBm8Ic2J4YkjCbaFpkFB6nHX3/eOpUhaifycF224=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KFKlUubq; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KFKlUubq"
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-4c18e5e9745so333052b6e.2
        for <linux-hwmon@vger.kernel.org>; Thu, 10 Sep 2026 18:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789088461; x=1789693261; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FX4dycJodbNcgNlbRtvzoO7X64Th34ZYUbHEO8PTdJ8=;
        b=KFKlUubqgLuu8Z0rBHUwcR55NmuXcSQcT0xPhqIZIVWTtTi/yTycGiNEs/cboRY7xx
         AOufONlvfHZvHHhCRgQjOn9MgAvZPgN3xHSIXPnNAf6GiA6aLT5g0fkvvI6pvvYaJfKE
         9nEY7IMU0nhC6gt6waoI9A5YvdT/5ad95Kivq7o3Yrb9P66qTs4+mITqERiwq8P8lj0c
         Ui6K/31WUwcK08Ml+b+ORbYQPA0M4PFIhyaMpHMV0c+g+cfMSn6jUy/RrRlW0NPfHv5d
         UhkBdKf+EbpioBgEzU/HCSe55AwR1nZJc0fPFVVdBVg5E2kaVlM38JncVgiAvmSOdcg+
         1ICg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789088461; x=1789693261;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FX4dycJodbNcgNlbRtvzoO7X64Th34ZYUbHEO8PTdJ8=;
        b=pti78OPYrLen7QZKuhtblDZFEAG9mcOn2CqFmeCcnwNedgi64iU1pOrOFHAiRWqP/G
         LskN45InRHj0E3WB80Mt6145TSQu52PAJOWlwGL7Vzs8Fr/mcIlKzSIyqRx8jj8f5Clm
         9ctcCRBM57zfYapkKv0lSFXUKlhECWSxvkkLSWWq9OTFke4YIYSSJzoRu4clW4KLI8ez
         UM1krnjdDvkSXcA0fXXw/tNnKxTdgSawSroy0HFQQkacdcuhMP7bYHu41OhLCCpIMrdK
         Np6FkRjlCYgVLSvFISKxWGQGPW3Atp9RjrZOMpCTUgZ+8LLvftPwAu0tRRbkzCmO/fQk
         trpw==
X-Forwarded-Encrypted: i=1; AKwUvBwFrEIcDHLnMKPGP4P50EXn6afgMmAk8TqIgH0iPQw6mqvkVy08Oszj5oiIq82KZvFvl/EFoKOGwdQFwQ==@vger.kernel.org
X-Gm-Message-State: AFuF++lBMtthCKGHXA/vArf6ofFxlxx9ASfltCsibDBd0+l1VHDsa97o
	tYHy8MWYZ6QvCyh1blpwnP1JzpX5ZVSx0kFulVcoTAi9O/shWqxY9AOF
X-Gm-Gg: AYBFou0t+FlzfE+10a+UE28PLV2h9qHKSW7zl3M6h1nU7msSgV3802JdtkG4ObgGp5d
	SZVTU2ErW3Fm1h5UUSddBuopVPHPDeKm+6E7UwXl3DM/lhCyf/YrkokkpCci4i8pLiY2/gog861
	v7trJcrK4oh4TtddVeL64wNxyQJZiBORTaI0yKL3WGZIum9h9FwHRPv+hTCuhYpA9nttC4Arkw0
	R2CyHhr+Yt37qrQOSKy6alUnd+pAHc6hbsYL9UMNrtShR1518SeQW7URMdgdav62hraN56D8SQu
	YTqfT3UEoSI9zPLztkk7U0qSCf1RQ9ZW4+sfAOyJHxEECcuhIBcStcHQgeaIp9NOiEVqAfMt4L5
	sQa74ZcWbrG2NQlkma82yS3dfQPx/ZvhKCvn1hjyzDYEy5lY1afGvMODUGXJ8+9OV083H+6YJEf
	rUPi416Yw3vp6bIgwPq2RWdNSuPhb0hZY3k8mCgsXM2Gd+n/Q177ZDYIKiSt3y6H0sGRy4RIMdV
	CZY92092Yyc
X-Received: by 2002:a05:6820:1c88:b0:6be:7782:5a5e with SMTP id 006d021491bc7-6c0bc9b78aemr1075003eaf.53.1789088459704;
        Thu, 10 Sep 2026 18:00:59 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b8f1f7sm1928004c88.11.2026.09.10.18.00.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 18:00:59 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 10 Sep 2026 18:00:58 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Paul Louvel <paul.louvel@bootlin.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] hwmon: (nct6775) Add support for NCT6126D
Message-ID: <c12d334a-4c95-4a43-b7b0-390e15dd95aa@roeck-us.net>
References: <20260910-bootlin-hwmon-nct6126-v2-0-ee629ab35e49@bootlin.com>
 <20260910-bootlin-hwmon-nct6126-v2-2-ee629ab35e49@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910-bootlin-hwmon-nct6126-v2-2-ee629ab35e49@bootlin.com>

On Thu, Sep 10, 2026 at 09:02:39AM +0200, Paul Louvel wrote:
> Add support for the hardware monitoring functionality of the NCT6126D
> Super-I/O chip.
> 
> The NCT6126D hardware monitor is nearly identical to the NCT6116D: the
> fan, PWM, temperature, TSI, alarm.
> 
> The differences are:
> 
> - Device IDs 0xd283 (A version) and 0xd284 (B version), which both fall
>   into the NCT6116D ID range (0xd280) when masked with SIO_ID_MASK.
>   Instead, compare the full value to distinguish from NCT6116D.
> 
> - One additional VIN: VHIF scaled at 16 mV/LSB.
> 
> - The fan count limit registers are documented for all five fans.
>   Also expose fan4_min.
> 
> Assisted-by: opencode:z-ai/glm-5.3-flash
> Signed-off-by: Paul Louvel <paul.louvel@bootlin.com>

Applied.

Thanks,
Guenter
