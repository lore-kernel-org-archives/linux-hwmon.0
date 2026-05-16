Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE4F237BE8E
	for <linux-hwmon@vger.kernel.org>; Sat, 16 May 2026 12:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778934434; cv=none; b=r8BN9nrWbkYvrrBQCK2tjkLTAqTAZKzkNjKlwsosMQhTL9cDDJuZs4yWvgb7mkx31EV6BTfZI41zwTb+00noYb/JhMU1ptDoyEPov31Tw5gq9p3y66tRVMm9t8SxFA//HgNY6RPS3/7TOYtEJODwVcpBtKoRueXt8hl+IYHG7MY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778934434; c=relaxed/simple;
	bh=lKwBaJ24JqzgREHEkfvZhcwADcKQDPsrZz1yrVLlFTs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xh8LmLVoIm/78XhFIXrprDh45/HtB8fWqaPc9TUdKk3G3mk2jDqzsrWNPKV6ZwhBgEzDkjfyzjPfmsZHgaMMH9d97WXwES8wAmJNzfFtgLxFOGu5/msDD55ESMBNNDXvPuDX0LbOJwROJFhsxzYCMnMdtY8OAouHWzvVEWWXQBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zb5MP8nL; arc=none smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zb5MP8nL"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-134ac81c445so3459604c88.1
        for <linux-hwmon@vger.kernel.org>; Sat, 16 May 2026 05:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778934432; x=1779539232; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wtsW1UMn77MIYK/LruizydGU3ibgXTA6d40uo+sS34A=;
        b=Zb5MP8nLwGpyydoJ6FlnW/gkycm8XqFJfZuSuw54Y8/FF+oFRSGfMpFGspElVS9hdO
         f1IvtoZTcYun1WyrbkJS4ia/dloyEXCVmjUo9fkf1dZCNHdLo9Ij48I85/Yqxoh8cB++
         XNlfi6CxFnrt3bjBeTxOlHBAsUsx0o51OaIWThX5WSyaGkLV8WexGyR14tFJIRFnLvRf
         DsLlI7w3R5/zmVpzF7S/5uch45MhuCO4H9mvxFMEYmFJNTlU3sXFCjuUGXD7u+Why3R0
         +nM0hIxLZIjMiaxdQD1PaIo+yd3fpaoCdicDLUlYlYyvPoC8VdFjOsasJQbb5+bzE2Ui
         4N+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778934432; x=1779539232;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wtsW1UMn77MIYK/LruizydGU3ibgXTA6d40uo+sS34A=;
        b=L+eUrul1snub0V5GXivwgzxLUFrPLJhe59bIVx8R3ELBQVtksR3w1DxQY9lJbQ1qaH
         7Oi9DFyscvd1Vn3/qycx0yALAc7/WzCRj5Cuw6Tna4xTXMcONVq1F+vDlyXuVyjaSvEO
         C/J0VsAO9BMDNs4H8ORv8qSJRskd3F6LbseWknP3yO6+cg/BZwML/06iQ2AQ+uX4OUGy
         WJEhNAHCBDD8r1VrckVni8bOqRpIsmEdN9thdimnaQ2JMELcZwoZiE2r9xZZbD3xG16+
         m39HucgoDxycp+WmRBt051K0WaLK92I9AGXBjwslo3YaBscwo11506ytl2puR47ugFPv
         pedg==
X-Gm-Message-State: AOJu0YxrVcAm9lLQUbDIxU1E2pOIQQQjjftt1rLh8ccbE8v/lRNBG/5y
	iqH0DFlkX43XSusy2iM+8XmIEZsrGhl8yolsyzzrG1/l5Q40svI4xpqO
X-Gm-Gg: Acq92OFTBVTBBXNCsV8tUNNRn4kUfmPb0QnVJuVowNBdIe0ioOfh8LkIBGmSyM+K6rq
	LjXqcJHB7nALjDOjriXaY57ppy+nCgmJb71TfPk06jSINmgsH+ERaggQf7MGUpDF+UgcjAo+xZ8
	3RzKP+5qe3sQgp7hZsg0QsgMuNM2PMwg6DCu14Kly6EmaFlceQgoN5hy6AUkQOFIhGh9anbKX1k
	PDmdeeH4YCgjqngs079b2+P8x9gT5oIwQ35Rofe7mnp9uP9KhEPPm0H2VutFD4c83mjwYmqK0xv
	MbxPfKO0/zWqu0G/VsEGp1WKBconnznJ/Yl7ik7rdtzwLT6LBW3gx2S9/onsafO1F6NRNdmahWx
	CinMuq7MdYEJ39ZbW/4mH1wRpglDNhsMaw9Pw6e96PlWAACAjMkKQP4EGP1tgVBXwGfdlBHywCN
	jhjlCuoYuF9nm5oMX7Zod4JK6IiHFwI4i8byBA
X-Received: by 2002:a05:7023:b87:b0:12d:ea4f:99de with SMTP id a92af1059eb24-13503decf1dmr3660980c88.0.1778934431878;
        Sat, 16 May 2026 05:27:11 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cbcb93f3sm14198076c88.3.2026.05.16.05.27.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 05:27:11 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 16 May 2026 05:27:10 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Flaviu Nistor <flaviu.nistor@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (lm75) Add explicit header include
Message-ID: <690b856a-e02e-4780-803f-7bfd2c9cf596@roeck-us.net>
References: <20260516075708.6682-1-flaviu.nistor@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260516075708.6682-1-flaviu.nistor@gmail.com>

On Sat, May 16, 2026 at 10:57:08AM +0300, Flaviu Nistor wrote:
> Since device_property_read_string() is used in the
> probe function add explicit include for
> linux/mod_devicetable.h and linux/property.h rather
> than having implicit inclusions.
> Header linux/of.h can be removed and also of_match_ptr()
> improving non-Device Tree compatibility of the driver.
> 

Line breaks should be at column 75. There are way too many line breaks
above.

> ---
>  drivers/hwmon/lm75.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwmon/lm75.c b/drivers/hwmon/lm75.c
> index 845a0e09ea9f..32279049d44c 100644
> --- a/drivers/hwmon/lm75.c
> +++ b/drivers/hwmon/lm75.c
> @@ -14,7 +14,8 @@
>  #include <linux/i3c/device.h>
>  #include <linux/hwmon.h>
>  #include <linux/err.h>
> -#include <linux/of.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/property.h>
>  #include <linux/regmap.h>
>  #include <linux/util_macros.h>
>  #include <linux/regulator/consumer.h>
> @@ -1152,7 +1153,7 @@ static struct i2c_driver lm75_i2c_driver = {
>  	.class		= I2C_CLASS_HWMON,
>  	.driver = {
>  		.name	= "lm75",
> -		.of_match_table = of_match_ptr(lm75_of_match),
> +		.of_match_table = lm75_of_match,

With this, the __maybe_unused in the declaration of lm75_of_match
is no longer necessary. Please drop.

Thanks,
Guenter
