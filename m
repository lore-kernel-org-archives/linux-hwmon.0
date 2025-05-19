Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26D1B28642A
	for <linux-hwmon@vger.kernel.org>; Mon, 19 May 2025 15:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747670277; cv=none; b=CjUWWz4vvdD5OA3ra1iZaSYKaGBtMCIPjrQW00xzMsIBSnJCTxaFyycDFsKxXzYFbHOrepQFs8d/vmYzauIG+1EslCo9IRcC15TnLaOnRJO1lbc3EFcnlpQA6Zh4CRUndjv2VGkXAcRldvipUL3YlD2Xx69vWHboWQWts3Oz3QI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747670277; c=relaxed/simple;
	bh=kDzZH/2//KqHjtRhP0MAmXrUXCabtr3kxzCKj86U3ws=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TW+LqrLBR5mjSbb8jD9H5+X43QAsLmXMvIsQHgC12vd4uVOSkihxXug8zvlRD+7PUHbi3Wm9zi4VsJcJFTr8sOb1Vzp1i4FXcQYO96WDv/+oYtpRsWoc1fFk45kiMS4dsMTOJE85fZdP1BhvlD2vTbT09GdOo+QBla/399bz0Nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=OOA6fHnq; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="OOA6fHnq"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-72c14138668so1507006a34.2
        for <linux-hwmon@vger.kernel.org>; Mon, 19 May 2025 08:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1747670274; x=1748275074; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PNI7NcwENluO3zokSTsjvdClRmMPUb+KHUbQq6ykMN4=;
        b=OOA6fHnqrd8XpwQtTyQdHYmaSZpFJumVIbFkClc705xSbXWIGCW+QbGlkICp9cyLml
         HVoxuLjaMzrqxhGyKk0Hjs2Dp3Nz2hH2mtD2ilAx+4oLfzCewT7oBaHGW0yhr+eESPqF
         YT1OUyeXC18C2xq6s3wIE4dNZWqWaM9132fBM8KaqGSl1HAPabZ7gQsamyG9G8a06NF5
         YBq3KW1tquKYGwoaNY/QfBBawFLbQUg+5ckpO5HL7m2gpJ/OKZy5tiBPyLWa+iwU4/Uz
         t2T9JecbqPwLdAekw468cBJBEZMMtnDRM+d14VmSZPyUlxVj91uc80sicwP3xAW+WWRp
         VvDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747670274; x=1748275074;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PNI7NcwENluO3zokSTsjvdClRmMPUb+KHUbQq6ykMN4=;
        b=YNBABOk62EGoaaBOgCJp0aN/5dqZPI5JUpW1FFojHWmHfkqyAuXxr/t8TIFts921GZ
         TF4Mt3EvowN2Xd7LleT+NkrfHF6mvlVf7NA2wd/IoNk+I2dL8vaExGs50SU1tdlMCsWn
         ikq+rt+tc4z4nM8LXHFqGb9di0l2xAKJ0oTeQrqQg+qnBnhdFmnNRf/E6X81TFh/n3r+
         UOMoVqIJvWyketkzj2QI7U76lUWsWzBxhZxfo33CdpctaJDCpdtB/WnrpPhvAICbKenW
         z37UYzrITc9c+RaA++5SxtTlRz8BN68hDjItRD1eUkuRqkbTpZGIrY7q7pOGApEApQAD
         PD5w==
X-Forwarded-Encrypted: i=1; AJvYcCX46lD7t+RlOuPmW1r8zYPEtYTKw8OTD9VH/Fzqzp409EXKgck4EHNarjNRoi+LBARJAbQ3GPMXMmty0w==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywxea7D1FVQaq583zuNZWS7KJ45z/+egAMBFSmMr1nD4EiyYFsm
	a5fw95QrdxpR5GwssTMJGSG4ZDmPn2iQPyKTUfbrbctGNk3xOg1DAYLZ7xKp5mHszq4=
X-Gm-Gg: ASbGncvNzuFDZk81a/oV+kt14suQd9w8sUbug6PWnqerfEoC9eW3DLQCfYyjxIisbZ8
	BQR1MB+FEdN65kHW4Rnwmarf+XhGw/jv0uMaCW+q0xiU/+0NG0OMmetmPsCPFDWPwdy+LV0c/fC
	YPwBVkd9YyBmw0VdUDU8ALtXeuePWCCKe6nSHzpoH2ljQXoB7wQrFVCDDoRde4c1GPX0gP0KlR5
	SShJ0sLpseyvwFiQimLG2P1QE95AxBQn2Oz9S9SBBPpThV/z1M4e+MPbLS3c/R723BwxXx4gNu4
	+ai/rV0IuYJg97VWbDPBcKZAEULPEjZmjfuEJKFVIoX8h1HYLfo3bWppiVM3CyaJfsY00sPhiNl
	Dk5y6X0Dw7dFfuBvtPU0J+K4JGA==
X-Google-Smtp-Source: AGHT+IH8T8zg0xomQN28G1hezc6Z1gZDVp2eCOEmtHqiL0f9gIeNGI+bpJuOCxDdS9NlFECubITNsg==
X-Received: by 2002:a05:6830:61c4:b0:72b:a020:a2c0 with SMTP id 46e09a7af769-734f99582ddmr8068793a34.17.1747670274203;
        Mon, 19 May 2025 08:57:54 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:a628:91ca:eb5:d6f5? ([2600:8803:e7e4:1d00:a628:91ca:eb5:d6f5])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-734f6b5f5e7sm1463565a34.65.2025.05.19.08.57.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 08:57:53 -0700 (PDT)
Message-ID: <adc2d646-06fd-4a9a-bebe-99d2a6cfd2d5@baylibre.com>
Date: Mon, 19 May 2025 10:57:52 -0500
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/7] clk: clk-axi-clkgen: improvements and some fixes
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
References: <20250519-dev-axi-clkgen-limits-v6-0-bc4b3b61d1d4@analog.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20250519-dev-axi-clkgen-limits-v6-0-bc4b3b61d1d4@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 5/19/25 10:41 AM, Nuno Sá via B4 Relay wrote:
> This series starts with a small fix and then a bunch of small
> improvements. The main change though is to allow detecting of
> struct axi_clkgen_limits during probe().
> 
> ---
Reviewed-by: David Lechner <dlechner@baylibre.com>

