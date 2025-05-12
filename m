Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCD06229B1E
	for <linux-hwmon@vger.kernel.org>; Mon, 12 May 2025 15:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747062946; cv=none; b=JA+QLnub0pFP44/M+SIMwUC/pGfcUCElYSOqMjyXWb7L9EtckNfX2G1Xl/MMCeF67vSRCkez9QsL1o8bLpfQoQFzd55ChMHQv1eo/t3wCjQWUKx1u7cIxogbXbzd+Ub9HigkG+rt0MlWu+z/15GbXZqnrgC+ajZCMZKhMcFIEe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747062946; c=relaxed/simple;
	bh=zF4PQS8RQFM30N3ao4kEuN2RsoQHNBfVK/8QGFaitO8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TjaHdJKkQvAYUnAW4l61ga9sL4lRDy8l8lnjyScPcqu/JLv6R5Xn2yZGW9znc4XvpaC5oycc6p+OgFXzEmnfkE8xADOxCI3NKL28wpmhsXyk1HKnkPh05tSma1H4fFPKFtKp8FHK0DR6OZdy/FQeDmXZ+bRRPU5vr5/RoFoYZW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=X6Q0cNIx; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="X6Q0cNIx"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b268e4bfd0dso2185132a12.2
        for <linux-hwmon@vger.kernel.org>; Mon, 12 May 2025 08:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1747062944; x=1747667744; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d0n+Mfncf1dF7UbdvMh/Y3Vkt6ppEmOAhKQI7/Xctfs=;
        b=X6Q0cNIxd650TbJ3+C16tdoIHcelXc4Go4sMm4iVA+lSi4T4cuhUL7v89ECkbXOAi0
         pmyC0zogwwrbTFsEeeFSM8C77vJGWGvX1I2u13zitf0QIhJh37LGqxzWd6/o0z+xRZnA
         gAohUaHdfO5RZdgiqqDUK9LT7dJef4wsjcVZnhbhexX2yBbamnXgF+JMuJMrag5rOHyx
         Jgf/Am/YY3pkXKddWVFq1i6xqHrKSq3weHCXY/cxodjuiSch/4Blf38kXWbIlTfaeHIR
         myr33ZNo+uXsF4V1xQcgamLL8FNV2N+y+SON9opLGmKGQ/7YPQJC80wKUJ/VIGQ6nLPq
         DsQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747062944; x=1747667744;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d0n+Mfncf1dF7UbdvMh/Y3Vkt6ppEmOAhKQI7/Xctfs=;
        b=BE3zog3qawBb/uC2PveaJSfoRcIJy0O/Uf70l+Zc6aJzXckyGdS9FNKMZ+G4HIw2Br
         CrzPCJZcrAzUCyI9qPbMJgz5XH9dxnmFhWG/621DmZW9gXCwtu3af2gJl4W+l6/+rTHr
         SsRKu57b2K3gfTlYE+8MmmJqH9pCWFJh2cD1BoMlzC1dwOi66k9ccaYB96ujBvgbCmS/
         EJd+fwLoBLXLhTogEa8XC4mXacjw0MS9uD0RlhIUdOMkkwr42dx4IhU9A57kzF1HY0GZ
         59l4y+iEVphR0q2YmHaZJlPduUsdol4wqzBmuyTZ3csTu+c+Cd7n8Cndq4QsjFBielOE
         Z+zA==
X-Forwarded-Encrypted: i=1; AJvYcCUUZ+HweuT7REvQ/TLwcs0BJR2DfgkuBoP2rXedE08G4UOR63OmL/hHxcZ7+cjr4G6/8QD/+qWBJ3s/ww==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3W6Y0DB9Owjkjzm6Wa4s9X4xEpOo5xoYmojCXS81Uau7iR3sI
	AGUqjLMwuBQMN2qoHHaMvVjFTv/NSD1KjhukpJamgMpWmk9vZepWdZTVtk4cbORFg5WhNU4q50N
	Z
X-Gm-Gg: ASbGnctzW+rYDr538lYanQJAq+/oj8k0xv0W3kkh+qeclH8YzbJaz410D169+9XbwXB
	jYS1b0Jzm+HWVkxu/BaPetk0mg4F+9oH60el5jURruNlMkZGG0YAy1os2ZvqZiZgTweGa5TmqWu
	zlqxLjCWqV/MtQWjpToAhp5q4hKeue7KOPUMEWHgT2pb3a0aiwGl5iXCdwBK3o+8KtJJ5n+pf3R
	WdNyz7F4hIgtEcvQltng1ZGULSR6RbD4VMN4xv2VYTZyz5oJoneEoLq+uKcaTdJN7nSK5n7xi5D
	acNfn4px8NRteQWVgU31QvQdamEwtgl/1W31sq/aNjkQiBX29k2b6SefDF03YJTN/ICOS1+A9dV
	ShNIi6i7FJSAXP9ke3Bku/0wP0YEo
X-Google-Smtp-Source: AGHT+IHZGDRNs+8vOMkC0p04fQzG/ssmfSh7XZKqv3ixjm0TN3TuT3LuzzKvBaCQb7HZ2b2RSV9r0w==
X-Received: by 2002:a05:6808:1582:b0:400:fa6b:dc93 with SMTP id 5614622812f47-4037fec216emr8370575b6e.39.1747062932740;
        Mon, 12 May 2025 08:15:32 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:fd2e:ffda:4c42:b314? ([2600:8803:e7e4:1d00:fd2e:ffda:4c42:b314])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-403802d369fsm1565218b6e.17.2025.05.12.08.15.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 08:15:31 -0700 (PDT)
Message-ID: <44929bd2-4abf-4c7b-b3c0-382bd030800f@baylibre.com>
Date: Mon, 12 May 2025 10:15:29 -0500
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/7] include: linux: move adi-axi-common.h out of fpga
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
 Mark Brown <broonie@kernel.org>, Mike Turquette <mturquette@linaro.org>,
 Xu Yilun <yilun.xu@linux.intel.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
References: <20250512-dev-axi-clkgen-limits-v5-0-a86b9a368e05@analog.com>
 <20250512-dev-axi-clkgen-limits-v5-3-a86b9a368e05@analog.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20250512-dev-axi-clkgen-limits-v5-3-a86b9a368e05@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 5/12/25 9:46 AM, Nuno Sá via B4 Relay wrote:
> From: Nuno Sá <nuno.sa@analog.com>
> 
> The adi-axi-common.h header has some common defines used in various ADI
> IPs. However they are not specific for any fpga manager so it's
> questionable for the header to live under include/linux/fpga. Hence
> let's just move one directory up and update all users.
> 
> Suggested-by: Xu Yilun <yilun.xu@linux.intel.com>
> Acked-by: Xu Yilun <yilun.xu@intel.com>
> Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com> # for IIO
> Signed-off-by: Nuno Sá <nuno.sa@analog.com>
> ---
>  drivers/clk/clk-axi-clkgen.c              | 2 ++
>  drivers/dma/dma-axi-dmac.c                | 2 +-
>  drivers/hwmon/axi-fan-control.c           | 2 +-
>  drivers/iio/adc/adi-axi-adc.c             | 3 +--
>  drivers/iio/dac/adi-axi-dac.c             | 2 +-
>  drivers/pwm/pwm-axi-pwmgen.c              | 2 +-
>  drivers/spi/spi-axi-spi-engine.c          | 2 +-
>  include/linux/{fpga => }/adi-axi-common.h | 0
>  8 files changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/clk/clk-axi-clkgen.c b/drivers/clk/clk-axi-clkgen.c
> index 2a95f9b220234a1245024a821c50e1eb9c104ac9..31915f8f5565f2ef5d17c0b4a0c91a648005b3e6 100644
> --- a/drivers/clk/clk-axi-clkgen.c
> +++ b/drivers/clk/clk-axi-clkgen.c
> @@ -16,6 +16,8 @@
>  #include <linux/mod_devicetable.h>
>  #include <linux/err.h>
>  
> +#include <linux/adi-axi-common.h>
> +

This one is adding, not changing. Was it supposed to be in a later patch?

>  #define AXI_CLKGEN_V2_REG_RESET		0x40
>  #define AXI_CLKGEN_V2_REG_CLKSEL	0x44
>  #define AXI_CLKGEN_V2_REG_DRP_CNTRL	0x70
