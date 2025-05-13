Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A437A1A2381
	for <linux-hwmon@vger.kernel.org>; Tue, 13 May 2025 14:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747146803; cv=none; b=oAwe3mMKeA4xIAFe2Z7aNSatMmXqMLwEdzgVHQkgXqcEmX5lzZK+Gf12nGRpCk/QbomEc/Dkx89bDsI/bL3dwBmxac2KFcN3SVFRCoJh8vybqAPxGr1tmj1NneKnXPngOq1vN+DoreagkKj+uAE7nIBenh8pH7Ra91hTxwvUzMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747146803; c=relaxed/simple;
	bh=iQEF7nznmEycoRdRwifBr5zcStMelsRnNg7k+aa6KwY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PX6DgVg71ZNm/HqqHm18o7tKowwdj2RBFHwJFESxhvQG1HqQAQFf4cQy0K84Vcdmox4RWsxKdyQhMkYSL9Cl1arXSmkheh5ZP+cZVPgIdK87UjhmIUAp4WTHGOX4QyBh1X0b6ihysQQ8CjgM2IFwS2fryUqDUd69J5f0IdjRYVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z8gzNNuu; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z8gzNNuu"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-30db3f3c907so55123941fa.1
        for <linux-hwmon@vger.kernel.org>; Tue, 13 May 2025 07:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747146800; x=1747751600; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6C+eOPgBkYyfSbaSp3zhH361dNsffIyxJdkkZYVPmTA=;
        b=Z8gzNNuuEhC9ToJQBXiF5ZFqeeBi1WceWyKf71VHr6WiImWo31odsQdUVlm1PvTvsA
         lknjbDZB7X/B9T0zGlVhdfvQrpg9Ghr/22cTvMzDP2oiGvO2RG7Vh5AQcSgR4gj7EXti
         rvbqSSNBzQ8gtjBFzFk7JqoXHTmf2d+kglEP1IYmNsd635FGJ3uHY2U6lvYe9fPCvx3J
         q7iIngoTIvA4+HP8iab5vMXw4PnXlRq100/q/UbF40pJf23ssspCeS4gWloPRh1Zgukj
         3vVaLmrZqJn31ScAa403D2/XzpwahA9FDoMgNNQLzGFwFpIW5URs7hDIRj8GOP3ME3AK
         OWhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747146800; x=1747751600;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6C+eOPgBkYyfSbaSp3zhH361dNsffIyxJdkkZYVPmTA=;
        b=Qo3qBG0fW3d1AXO+tT8Z5gBrAitS3PpaIZJ8rK5r1v7Frb8YWNXQlwUQId3e/i6OKU
         ErHjrnuD3xMorjyf0HBdHixp+E/rh9np40g150fvHvsXlFUKuRQRO3Aw1Rrv82hoT+lU
         lfWwuVOaLfHfxE2lDNUIDv9L+HM0JegKGg2bz3fDHfbQOSGPFrEHBXrjLhEo5voQ7aJQ
         8T22JwpPR37M75EHeTnzuzx6kiDWdWyVG93dkCtd4AAe/gf5eRGmybyZ9dZnuaa6hXCi
         trJHdb8W2T1mS8wEzocYqXIGp/9p9gP/UfdR2pQVVZEJpKKAWKrNDhFJpw8akHC0ijX7
         iXHg==
X-Forwarded-Encrypted: i=1; AJvYcCU1FOfPnQq1PncP1H5/Wars51w/0yim71t9BSt/XtILkackuBcigWVRNs5a9iWvWX+z8cLAOGpEKdRVag==@vger.kernel.org
X-Gm-Message-State: AOJu0YzUzln6DfMNrBFPiochgzxDG40g4ftNH7vXMcc3z/WIlen0HlkQ
	6qQwIHabW8FZU71pq4+bRD721KH0O8IY88dj2N2ZsZ5DGvvj1fripDQmWKZtRJNReO+LyX2brej
	oH+jPPw==
X-Gm-Gg: ASbGncthdPRkCnD4/gMUJKd82H8Tl0xDEcLppPSewIMXbBOT7wIZgM+qxirLqoL7G4e
	WarSC5EV7FXWwUVwGVUxZA3j7pB/2I2rqOSiKlqs24c7r0ZrtBQ7gxytd/Ci3kJnxCNoaipoy7x
	ID6fX1IQEQn23xvv6BpZbnUogc92NOq0yMgY9QJUUPFmINV6gCjHITlwPovzG2owv+q2Oq7OYK5
	LtUlISKXJVGCO2uyomToWlyTVcAuILMgSBvtnzVpCr0VxnTSqVC2wZ9uk2l8DvKEBnYSYkQ/BIE
	zvUN54d1uObZJi+kRAfpWz7PzZaQaNXVzqi+3aWbaYU0cJ1FNYy2Vvlb4EUW9MSGwYOo+Qs756I
	kE1dBVOpT0kmdYw==
X-Google-Smtp-Source: AGHT+IEBNTH4zw64AEMKKTiN2s5UEu33251ThUx0I1Ms2D2DvDbTNPIeVXC3gTvYmyig2JEqJ5+Vcw==
X-Received: by 2002:a5d:650b:0:b0:3a1:f655:c5b2 with SMTP id ffacd0b85a97d-3a1f655c5femr12440694f8f.39.1747146789207;
        Tue, 13 May 2025 07:33:09 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58ecadfsm16357348f8f.22.2025.05.13.07.33.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 07:33:08 -0700 (PDT)
Date: Tue, 13 May 2025 16:33:06 +0200
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
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Jisheng Zhang <jszhang@kernel.org>, Chao Wei <chao.wei@sophgo.com>,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-mmc@vger.kernel.org, Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v2 02/10] dt-bindings: timer: Add Sophgo SG2044 ACLINT
 timer
Message-ID: <aCNYItP6SWImMvFv@mai.linaro.org>
References: <20250413223507.46480-1-inochiama@gmail.com>
 <20250413223507.46480-3-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250413223507.46480-3-inochiama@gmail.com>

On Mon, Apr 14, 2025 at 06:34:56AM +0800, Inochi Amaoto wrote:
> Like SG2042, SG2044 implements an enhanced ACLINT, so add necessary
> compatible string for SG2044 SoC.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> ---

Applied patch 2, thanks!

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
