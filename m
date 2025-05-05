Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87DB5267F59
	for <linux-hwmon@vger.kernel.org>; Mon,  5 May 2025 17:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746465713; cv=none; b=FVatpUQhmUui/EUh2ddTLKl2vbJ51QY6l73umeNt74fnYaSURJjCfWD16uKuDZCGMXEoMLMZr1YVIvS/8j4urSo+3qUOv8EWZkV3obZLuF0Tq0p9hZarN0dsPreYFQNxpt1xvvyqmt5/OvN+zhhnTXW2SEITxNATKRosWqtlmo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746465713; c=relaxed/simple;
	bh=jcGEKN2FQmLYABFrgCfyNuY3i79lchvxrUlZtZoKNYc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=doQitbi/XCUa/kksbp1rRmFv/hDGSKElwjfsjl7Ofe3GVxG2zBaG1r9BvNIFtfX7rGZBEucIrVDELZjeicBH3AgMDG4mOP9gsHAitde14XE+JcE0pxLwhnVv4niD5Oczf31d2dfZWKXqDqjhcg2YWtCqTJVPrqxjvJuGGAjk1rA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=K7kdvSAD; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="K7kdvSAD"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-72c47631b4cso2772808a34.1
        for <linux-hwmon@vger.kernel.org>; Mon, 05 May 2025 10:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746465709; x=1747070509; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZRVMb9oF5CEf/GpTXbkBHrDWFxgCwTjNlgPwnh4zqIU=;
        b=K7kdvSADgbh5WKqOoV0ictJAo4+XJkhJuOzEjOPJxHzFkfVPD4IDU3ihxXft8gSfEJ
         j8N4o0+QA6uinEdgMoVJLxPNbNVxnqxqwUTnpRfYb7YTRc1vUKoWJgozqF9sm/Bis2GU
         Pofw1VvzmATH3N3dQuMz+5Xa2yje8PkW/9UgVctXF65S2U8Yr4r1sBqxJRlZwkSzWKI4
         Q8Jsm7NE3ofShY5JnLtTZ/BYVrkP3vXVhjiP7sFpzQ6owq4ckXmVYGe9y5d3UeT1yk5D
         rXzDDVLaMiqmrQTyNmokFYKYBmsAgxuqiX9h3oBtI0DDi1EBmsa1ROeedR7RKvEV7goA
         N15A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746465709; x=1747070509;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZRVMb9oF5CEf/GpTXbkBHrDWFxgCwTjNlgPwnh4zqIU=;
        b=lv0oRMW36lNIASvuVQpgRSdzES4r6r+bjYc0rnj9dSrYODE11OR4M2GjvazMP+maQD
         xl106Q2nuPSZn5nvJl07CZJytaM+Z2OLhzcTHM0jauQgadQgvFlt3WCglPbnHJbStBDi
         hBfQKf7Bc02mtEbTLnwS7jvGLFYhq9DorZur1TngsdtHAunzNrvR/PWjDgCFJMKT4ZQz
         SWd4k3dWd47J2eQ7r/WubN1NCpJ6sSroDWEl4zoK1kZpOKmo6xUo4moj6qXb9nllCgLY
         ysdYxIs9lmWgfyrH/PT+4TTv238Sy+ALAt4pqk4yuONkIYlTDfdhxhzYQke2ZdkWgRkz
         hFlg==
X-Forwarded-Encrypted: i=1; AJvYcCX8vtgeBrIfZ7wzXaAhEh3a0dwd+19YpAloMYd2bBEAlzuyua+okBoZHEx15D+K/Ovqj7zAsUGBGOzQjw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyeoXZEkrE3xmXwOLNLuw+djBtW1RWHkBqddKzUGYtg4tyhTR7T
	Ui/vhXOtpBcQPW/ON0koTBY11+fHtfK0MolgEnUbHo+NNCg9BDQ/aI5xi+X0/zw=
X-Gm-Gg: ASbGncuCa441lRUaeTxNajy8IVsAYUjKBkcViFRFazOWybgdlj5Nz7nasJBv/OTPO79
	tFazQOKCzDNWvBh31CsE/AeqBumTrumv0Bz0q2Qfd3jbG278cNeT7Fju4ir/D0eee6Ya/CMg1K9
	4Jrzs8QCZ0G2adXba0G7YNtC9RdSlv5JLZ1zKjDm9XGaPWm4iBqxxjDSw31wTgwyBm3WMOcHlan
	L4mV659/yv/pvrPsVTwxzvDCf89eK4270+CVk2+x0jcB0LN6CfpL6gIsmqW4LRO/ceSXWnPjAS/
	JqP5nDahA2tuhGR/eu1fpHr3EIKRlzsi/nceYhGOeNsONZq6m734WIwSmcNu9qXwnv2KeCocTFP
	1JlW7McTP0LbKf5s=
X-Google-Smtp-Source: AGHT+IFcxApnoYjUY0w6idtC1pck4OIRHQ/tTPu3UVsNzFkW+p8gRi5HDRVw03HtHe1u6yZcOoXfUw==
X-Received: by 2002:a05:6870:4790:b0:2d5:2191:c8b3 with SMTP id 586e51a60fabf-2dae861a902mr5241443fac.29.1746465709654;
        Mon, 05 May 2025 10:21:49 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:2151:6806:9b7:545d? ([2600:8803:e7e4:1d00:2151:6806:9b7:545d])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2daa1207873sm2127468fac.38.2025.05.05.10.21.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 10:21:49 -0700 (PDT)
Message-ID: <b5a5a8a6-bb8a-44f0-ba94-7657aba83311@baylibre.com>
Date: Mon, 5 May 2025 12:21:48 -0500
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 7/7] clk: clk-axi-clkgen: fix coding style issues
To: nuno.sa@analog.com, linux-clk@vger.kernel.org,
 linux-fpga@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-spi@vger.kernel.org
Cc: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Moritz Fischer
 <mdf@kernel.org>, Wu Hao <hao.wu@intel.com>, Xu Yilun <yilun.xu@intel.com>,
 Tom Rix <trix@redhat.com>, Vinod Koul <vkoul@kernel.org>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, Trevor Gamblin <tgamblin@baylibre.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Mark Brown <broonie@kernel.org>, Mike Turquette <mturquette@linaro.org>
References: <20250505-dev-axi-clkgen-limits-v4-0-3ad5124e19e1@analog.com>
 <20250505-dev-axi-clkgen-limits-v4-7-3ad5124e19e1@analog.com>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <20250505-dev-axi-clkgen-limits-v4-7-3ad5124e19e1@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 5/5/25 11:41 AM, Nuno Sá via B4 Relay wrote:
> From: Nuno Sá <nuno.sa@analog.com>
> 
> This is just cosmetics and so no functional changes intended.
> 
> Signed-off-by: Nuno Sá <nuno.sa@analog.com>
> ---
>  drivers/clk/clk-axi-clkgen.c | 74 +++++++++++++++++++++++---------------------
>  1 file changed, 38 insertions(+), 36 deletions(-)
> 
> diff --git a/drivers/clk/clk-axi-clkgen.c b/drivers/clk/clk-axi-clkgen.c
> index d8634d1cb401fff2186702354ecda7b4fcda006f..63b7b7e48f8fa00842ce4cf2112ce7a89fa25dae 100644
> --- a/drivers/clk/clk-axi-clkgen.c
> +++ b/drivers/clk/clk-axi-clkgen.c
> @@ -15,6 +15,7 @@
>  #include <linux/module.h>
>  #include <linux/mod_devicetable.h>
>  #include <linux/err.h>
> +#include <linux/types.h>
>  
Might as well sort the rest alphabetically while we are cleaning things up.

