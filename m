Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D97792EBBA2
	for <linux-hwmon@vger.kernel.org>; Thu, 25 Sep 2025 15:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758812879; cv=none; b=mYWiBGtXlhB20gDhLJ8tb1aOs4gUXaNVh8cl2NuaRcQDPcJOZx20gN4foyhe+CdFg5MN8NZJ8T/UTgPMDmJzDadI7WzkKF4RZ0dLmYzuCes3uepriTSX8hf9ks5onImtWvP+YL16EirJA/7JuCrlGQ00WjmB/aaxmmfdaW96Cps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758812879; c=relaxed/simple;
	bh=PwfgS4qfIfkc+imXtu/sSZXrBqwExZR+rgZwO0IBYGI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hfayII6m+az2yIKUCTB26196ia9qnlglr0OJqWIk+z6vben3LEpVQiNPe1vUEbOw8lrjptraemGzIYOjVRMGVAb7eXUO7ylsla7/gL+xqcOjHufizfc1ZpYCAUMBJrX8drPUtngzikzA6/Wl/hJggHzLHU5Em/aIfXvzOFnashk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NOS89OB8; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NOS89OB8"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-77f605f22easo1041746b3a.2
        for <linux-hwmon@vger.kernel.org>; Thu, 25 Sep 2025 08:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758812877; x=1759417677; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jE5cIH8mYsDicp+BwKdnhTTJHAMEhvsJen2js1pJiH8=;
        b=NOS89OB8QhgwX7LkwleAPOmUqR7YMHjWOMKiWPH4Xrg2/5PNpKvgPqvK8fbjkBK2+R
         3ty/DNv/6qItYt0g5KH2hC7swFJa2orXFscTjT+11NqJfp4tiORGHloMCrhQOpK2TX+g
         vpTlsfvylAWX8BNr3EbMxCDma37slkMJr6APSAA/N2ud5/g8rvJdauOEe7prdR0H9it2
         NseZ89Ia3w3M/ElW9RwCAZYToE+6p6pqIUjxDkPjZiJKdzQAU8+QA5Lm+xTlPhSvp7We
         GG3+tI2YAQ8ZpL8yEFE6cJIY5RriJpIQaUD+oZH3t7wC3MfqtLbLhi6KhXyUoVOmXHqV
         SR6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758812877; x=1759417677;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jE5cIH8mYsDicp+BwKdnhTTJHAMEhvsJen2js1pJiH8=;
        b=riP0tBRyEgLi/p2/KP5vsGZVX4vRSEURRSMr2aBwM1DnpFGPVj0RebAmffjaz0prbB
         4Y3J9/ghlEKomd70CYpFRzOZ23gbtxHsVkBnmoAjFeXaCiQgSODwIxk8EpTd9rGihjic
         +vEzKdyRdcFQPp+b6PKfKUBbX/gNSx+x2MAueBnaMX39qrlxZL764Qs5TLGCpnWk6Lii
         JxTLT3HdcEb425HY5AN2HWGGHiT2tdZMmMXU8977t8oHpwWfr49VWItgdbsghCw+jgYr
         uYWpNTnySS1pP/fgnRzhbArFHNOfnSP1+faTE0fmGuYLzUGlvuX6h+FgK6RS/Z/I6tjP
         XnJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVnLfIvM8rWkzZUCuWnKIc/L1Dp0/uMFftAp8SXdYIXT9TG9csAtex7hO7h80c5UrWaPYEfk4mJ1F8Vzw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3v6LGRfrCGPYQa8z1MlLZIdJmCFeq34GhSoLz1AQeNEox9iu7
	7K45edFtNv+s804EZwm6s+5PoOn0MgGE39MGqMgycn5+RH4K2F9/XEZ/
X-Gm-Gg: ASbGncsmcn8ns6KaIIal2zu01XHOkb0wuhLesl0V9XWl3HlOw+3DB/iU+KzheELnBto
	4Hc8v5yiCMGDC3l1sCka4hTEijo+Jsktf5zp2mMSMDKCDZ9IS3crkA7TTPhXlOeW8GexUN1hbOU
	PR0mDxo6uDkrVqyThC3JTdjiRcsJZw63KHGqbemJr/3C7sDTieP+Tufx1w+LrLFkUdrE/XAr8m6
	Quw+ZntLAY+Xt88/AP+88bccgfwFzr/KjmCJd3nmkO1oj1ivRr7wEnv10Ckz/qus+/tD6CR+u7q
	lTkvgkReZl+8Vxk9Qw5pPKaNRt9rpircv6ij5VrXdbOTBMmMeZ6sPa5bE8BLY0OlBTbb+yqJKSu
	WPhk9VT9svog3R9jrraxbq4ufhCl8Al/1uNE=
X-Google-Smtp-Source: AGHT+IHxwbqMwtSUpRB97Nr0rknalbSvu7cUrpdQGoGrEFmAeq73TNUTzNKC1zhtc24Ag7rMTXMpnw==
X-Received: by 2002:a05:6a20:9188:b0:2e0:9b1a:6417 with SMTP id adf61e73a8af0-2e7d37fba87mr4692452637.53.1758812876869;
        Thu, 25 Sep 2025 08:07:56 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b57c53cb975sm2506233a12.18.2025.09.25.08.07.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 08:07:56 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 25 Sep 2025 08:07:55 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: wenswang@yeah.net
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	jdelvare@suse.com, corbet@lwn.net, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 2/2] hwmon: add MP2925 and MP2929 driver
Message-ID: <ae5ad599-e857-4124-b6a0-61196a763109@roeck-us.net>
References: <20250918080349.1154140-1-wenswang@yeah.net>
 <20250918080603.1154497-1-wenswang@yeah.net>
 <20250918080603.1154497-2-wenswang@yeah.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250918080603.1154497-2-wenswang@yeah.net>

On Thu, Sep 18, 2025 at 04:06:03PM +0800, wenswang@yeah.net wrote:
> From: Wensheng Wang <wenswang@yeah.net>
> 
> Add support for MPS VR mp2925 and mp2929 controller. This driver exposes
> telemetry and limit value readings and writtings.
> 
> Signed-off-by: Wensheng Wang <wenswang@yeah.net>

I'll have to drop this series. Reason:

> --- /dev/null
> +++ b/drivers/hwmon/pmbus/mp2925.c
...
> +
> +static int mp2925_write_word_data(struct i2c_client *client, int page, int reg,
> +				  u16 word)
> +{
> +	int ret;
> +
> +	switch (reg) {
> +	case PMBUS_VIN_OV_FAULT_LIMIT:
> +	case PMBUS_VIN_OV_WARN_LIMIT:
> +	case PMBUS_VIN_UV_WARN_LIMIT:
> +	case PMBUS_VIN_UV_FAULT_LIMIT:
> +		/*
> +		 * The PMBUS_VIN_OV_FAULT_LIMIT, PMBUS_VIN_OV_WARN_LIMIT,
> +		 * PMBUS_VIN_UV_WARN_LIMIT and PMBUS_VIN_UV_FAULT_LIMIT
> +		 * of MP2925 is linear11 format, and the exponent is a
> +		 * constant value(5'b11100)， so the exponent of word
> +		 * parameter should be converted to 5'b11100(0x1C).
> +		 */
> +		ret = pmbus_write_word_data(client, page, reg,
> +					    mp2925_linear_exp_transfer(word, 0x1C));
> +		if (ret < 0)
> +			return ret;
> +		break;
> +	case PMBUS_VOUT_OV_FAULT_LIMIT:
> +	case PMBUS_VOUT_UV_FAULT_LIMIT:
> +		ret = pmbus_write_word_data(client, page, reg,
> +					    (ret & ~GENMASK(11, 0)) |
                                             ^^^

As 0-day rightfully reports, ret is not initialized here. Datasheets for both chips
are not published (actually the chips don't officially exist), so I can not figure out
the expected behavior myself. FWIW, available datasheets suggest that the bits are unused,
so if that is not correct please provide evidence that writing anything but 0 into those
bits is needed.

While at it, please also provide evidence that the chips exist in the first place
and that this is not a "let's see what he accepts" submission.

Guenter
