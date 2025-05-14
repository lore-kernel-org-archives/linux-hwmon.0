Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B1A4190497
	for <linux-hwmon@vger.kernel.org>; Wed, 14 May 2025 14:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747232317; cv=none; b=tLtRmZqxqfFh1/T/SNxhoARyKjCCgnpRBLBAhFfhM6PqfdvWnEYaAFqcCzSzupxPOgm2SXWQzgImA6HFcA2PN7esfcw4UvSF0IyEIGaAAQN5Skan8wjYBj7z9nYCG79Vecuz7EPk4QkuIyZSxKKFjIAB8WqNNJ5nyEkZVaPN+KI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747232317; c=relaxed/simple;
	bh=jHsA7WLaZAQUssN/Gkcz6ehZZJvqAMZ8Q9SHY06sn3U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PNdHUej4xjQnVtN50vDaBqekzHK9U/0JXcwB43G/UdvFgOmHmNh9S7EBpm9r4oHP2qh6HTff2zqW6/ksEAW2Py8M8Gtt1cSeQphXzxrz8dtfF0kPZCc/XeiruiGpQ3tj/D/bmScBH9huoXuhaerXQWUFsQH+25smuHMexjqoIFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SRxzxuTT; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SRxzxuTT"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a0be321968so4276102f8f.2
        for <linux-hwmon@vger.kernel.org>; Wed, 14 May 2025 07:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747232313; x=1747837113; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rUz3GV+6dO1qGU9AwxqVGKIzfxuE+8NTURqqLEaoFC8=;
        b=SRxzxuTTbN8XuYsKfshneQIHrI5xt+1ppK/djF2971+1Vy2jJPp8qGCBQSi44Lb3On
         IoSuu9bwVirXecmJZr9wN/SZAibIDkPiBFbvrcXYxq0f98nanuoIxGhmRSAyzdjLHn5Z
         YZKICCCExK5lvbtaJQgGdWOGmTvhVZcFRCqwYWm3XJhDVXnqgyvMjz2UdAr1be+8IZft
         GSwAoc2v6qsQsTaW+4fQaie8L7gyAEzYNzB/oEPtcw96/OzG7FAL32/1E2iSwYUPTDyC
         MYWAjiNwuJ3Fxb4m/AL66Yj9MckfVVP019Uv49fTE5zB2LAg7Jk+e2Al5kuc6sbDDRq5
         GmPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747232313; x=1747837113;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rUz3GV+6dO1qGU9AwxqVGKIzfxuE+8NTURqqLEaoFC8=;
        b=j3vtGEJABNEahiFiJTLSAyEs4jeYwND669dw36Ns8gytFiXQcaHoGRQzwtuHAM/Aww
         1c1yJBjVi2WmsRZZVQfVCuBL9vSiu/v3oclYTEikZhZr1zghGvzr01DfP9HuxWKZKfAG
         d8azSMiJ0qJ7YeZQTGJl/InGCEFWHio8SCX+VI+ch3q+kcLCy4D9RGqXhhVmZx4ohR5O
         xXlatIlnwjICLcfQQkTLGXR2COr/SvCgpRSKWTPWoWT2O7LCTmzr80GDPML7a/Ckjs6i
         6rPGQnuUxUtQSjBxWR7G36eyalxCadXAOt2U+PJrM9UG/yDAvzNDwJj4P9HIZzHGF1Bb
         NwVA==
X-Forwarded-Encrypted: i=1; AJvYcCUBOCldfqQ2JG1G138izCHVLXcUjnTzuWnHnpEDCFecjWJjVgBunpL6wgC75Y/rx+QHkHtKOIub9wzwbA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yziu1sYzhrlLKwvJhQacP8aL/5i45YVlslMylUIPwrlW09SNcKt
	35ojQFfJM3KYbedOq6I5LlDM34waTs2wDA2YkHbRqCiWgcXqb+qH/kse0Mngy+c=
X-Gm-Gg: ASbGncsploB3hIN5tzmPi2n9x8Wa9imPsWVYWlvAyhQzs4ZzrT33IUmQlwLjUqIm7o/
	HAjup4Ap63gKabGnjL7dooPZRH19a+eKXzh3GWA2reltvtucQup53hUADv5IVI3dj2DQ7VjyqWi
	Ja/qVTtAUMfCx+ZHJhQE9XXAGHqrV/h2NDV/4iCv8N7TJDx49fFoKGjI4dAxDj9w6vMnWTcU6hW
	eBMS/1ycLXanEUqLy539n/AKQuXmYhd+qAWIO2T76ELWp5RlrPKNOdMQpJhRnsQAEsuyGi9ueYV
	aIMVulRh05XHlUg2bGPvHheEUFz3prWif33OaA3m/HL08mNm1RF3O6P9SNKYUhsCphMlJTmJuQK
	MR7Mkwo2c8b9Vcw==
X-Google-Smtp-Source: AGHT+IH4+d+Pry2CNpgKUNvxX7a5CyUBEerUkhvVVYoJxhPCGMW/etsCZMqBlMg4OuejtHCSPvBihg==
X-Received: by 2002:a05:6000:40c9:b0:391:39fb:59c8 with SMTP id ffacd0b85a97d-3a3496c1ebdmr3217848f8f.25.1747232312583;
        Wed, 14 May 2025 07:18:32 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a4c5f6sm19729450f8f.86.2025.05.14.07.18.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 07:18:31 -0700 (PDT)
Date: Wed, 14 May 2025 16:18:29 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	ghost <2990955050@qq.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Jisheng Zhang <jszhang@kernel.org>, Chao Wei <chao.wei@sophgo.com>,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-mmc@vger.kernel.org, Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 1/9] dt-bindings: timer: Add Sophgo SG2044 ACLINT timer
Message-ID: <aCSmNRTVXQ51xj0m@mai.linaro.org>
References: <20250407010616.749833-1-inochiama@gmail.com>
 <20250407010616.749833-2-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250407010616.749833-2-inochiama@gmail.com>

On Mon, Apr 07, 2025 at 09:06:06AM +0800, Inochi Amaoto wrote:
> Like SG2042, SG2044 implements an enhanced ACLINT, so add necessary
> compatible string for SG2044 SoC.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---

Applied, thanks

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
