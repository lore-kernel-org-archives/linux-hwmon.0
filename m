Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792976187;
	b=SSsxy8UkAs/u9j3tg+PiV8g1jETt9fGcIwxyADu8kKHWds7xaKk0+DlER6v3O+wKaa1T
	 LpUHUHXCQDLdrjw9idPKnZIajQuF3RyWrBjRPFmvtlcozQq8YCmGwBsA+KNt6SRG1HhSb
	 cwZAIkbY2Up9Js9Px4yPi4Yxj4iO65hUvtz3P/cb8Y3dUXw4omu0CS4LsjOUfgrJ6VE5G
	 GDV7yLGXgog8byltVWZgnlZaaaEIvGW1vihQWvWtQi/6IsuqM3V8rZ54NtMlqgwY7b1fp
	 v60oLBr1eptbiGt9as6azWTuVa4/xFr9BkCk1aPDq2fWntQPelEl0I95l3DRzhrbzIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792976187;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=sBbetg3460zCBBHo1b9aOflhXCRQmCfSVeApKwjETns=;
	b=jgjWquxnPN+Is4z9YqLGsrl5YfAedC4S7EDDxNdkRi4sman/nOYzZb7byhnXLjKSdy5t
	 9Uc44/dpd28HmG77+tRsqUjwtjcG0M2+WTiKF7n4oFHdwwvFc3kVUwFPnePea33+DjKgb
	 w3Gj6tNZ3AA6KkaXnT5wKDApVIfbFs2KMtxWavQou8BeLf2X4ig5MQbITvmunlkkKOs/+
	 xIwOTgn96ZYmjDgFhjdcqt9jkejtFxUZLOjEVvpQPy7B+R6QtTQF2pcsmBPgC4kMxMspm
	 6ZJweGBelZ54+3uoJ/vLqg/sy65laL/LdcVJlE+yEXZFfKMTRFsJ/V48MK7oL7k4DEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YgN1J2vq;
	arc=none smtp.remote-ip=209.85.210.182
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7036C606A31B
	for <linux-hwmon@vger.kernel.org>; Mon, 26 Oct 2026 00:56:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7036C606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YgN1J2vq
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8a052aff9e9so1696009b3a.0
        for <linux-hwmon@vger.kernel.org>; Sun, 25 Oct 2026 17:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792976187; x=1793580987; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sBbetg3460zCBBHo1b9aOflhXCRQmCfSVeApKwjETns=;
        b=YgN1J2vqtleVDoBC2TI9ADivCYcHE9GeOQMzOKneHIahk4S8gcvUilTtNgzQQwGzsG
         qyn5MRuEpJueQfsHwam8Gr3mFc8smzjqEcgSzobL1z/f8PdQnvr2fWH9qz/kaV276GmU
         DHkV7JXpmUc5j7Qrn6tQRSmf6KePLHozV+afcvdJek56rP2mGwuP+Tv27fWYf9j9igxT
         E0tRHG3x2WjAzfPp8a8o11mpEngvHOkP8ZnbnmLfrGZDMzSDP//gAWTkMRSg6dascvJC
         uv1L1LPF1tv/qCbcnEiQjVc+a7OwycVFT4K6tr+zHHmux5Xnug1IVaNljTeZi2kZnbqX
         wYXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792976187; x=1793580987;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sBbetg3460zCBBHo1b9aOflhXCRQmCfSVeApKwjETns=;
        b=ojsXkHsouP5FMtszYel2iuPkyWfbSN6TNHUUltsAU1I7Plb20H+FFTX2MAeowIIHxB
         sJ69HAep3QolAwjbq/Ll02uyMA9ntuftl9xuNZFoExplupHAxwaILVK5EW8mXE50f6Sm
         L06YAlR/HhqvIFKt9PyYYOcE1XjuHHEfTmaNbBvudTQKoDmjDZViLXhCFV9YjQ+Ye3iw
         68B78kL0jyo3m3ia3PHToVw2m5+pCTtofbJGDXgZRV3A6ix8v4I1nBeXoAJX4uSSYlUl
         4ftlPea/m/VmugannT+ja5zT69viosaSn9O+pcQSH/Z10E3dtr8eR/rvvCiHlGkWF+Bu
         +84A==
X-Forwarded-Encrypted: i=1; AKwUvBwQRrp/24lI9cDhtruheZzHYUgwK4Wm9mgxS0VVUvwOrA2dn3q3htbqOAoQJmYNJQh25FtQGwBu2SrZmA==@vger.kernel.org
X-Gm-Message-State: AFq9FYJvqg49bC7C23pLVKrrfsakIn+w+lH93t05aqSlncyzogDMSD0B
	6WGyNAxf0i+tERk77l44J7yLLuaddKyGeaGgCDTvbHw5reziSdzzp0Qu
X-Gm-Gg: AYBFou3uOoQqL3eYObao5heDpR/U9rtAuLCfb7PWmd0gD9HfvEpv7+S/6GSl53ZmiFi
	awG8eA+mKV27IHs5etbySI2lOn+hKkzHXF9Ss/SABwE0m4dZgwWr3aOipYHqqBtQc0A+Eryenk9
	AN3qJ/0EGdRj/UhbYDR3YeRUoBvcMCwGbdXbpFaokmGG3ctoqMau1UV7sRSbmY/d2MiioGdRaoh
	qQBLX/W64k5ClXLXiZ9teXoxadI1qVhTOPKSr8bvd2MrFYEizwELT62HNuv0jLO0qKIvIr5tPrp
	u80CLf8bGcpaVpAKVuj2+2hi5blcc13DuRK56itKsTve/V5W2Gzyxi8epl4GPUGZsUsj26+O5Pr
	z9u5xJ5H+epBFdTb3jqir5BGdyXHGAJaumObct13SxcjvngsCkfe5rZM46k7a/UErPJhKV0dDS4
	XBhp87/Ib4qyHFP9ZbxDeZX4aFgnMK2aAUtcnbf2DOXPFT7LAqnyKtNfvp0pzZeoMEpJ6UrnPIl
	JYNd0lMlAU5+COK5iunHBVVRTTyorcGOcxWoMzQ8P8pS0Lafi3e7vaWPsjpNxUMJFXF2w==
X-Received: by 2002:a05:6a00:2395:b0:892:fc00:6e68 with SMTP id d2e1a72fcca58-8a364e335e8mr4011572b3a.3.1792976186708;
        Sun, 25 Oct 2026 17:56:26 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a36b3712bdsm748838b3a.21.2026.10.25.17.56.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 17:56:26 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 25 Oct 2026 17:56:24 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Matt Layher <mdlayher@gmail.com>
Cc: Eugene Shalygin <eugene.shalygin@gmail.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] hwmon: (asus-ec-sensors) add CPU_Opt fan for ROG
 STRIX X570-E GAMING
Message-ID: <0800413a-a3c6-4de8-9c5b-1308c1d067c5@roeck-us.net>
References: <20261006-asus-ec-x570e-cpu-opt-v3-0-62672edc18b3@gmail.com>
 <20261006-asus-ec-x570e-cpu-opt-v3-1-62672edc18b3@gmail.com>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261006-asus-ec-x570e-cpu-opt-v3-1-62672edc18b3@gmail.com>

On Tue, Oct 06, 2026 at 10:35:37AM -0400, Matt Layher wrote:
> From: Matt Layher <mdlayher@gmail.com>
> 
> The board has a CPU_OPT fan header, which the EC reports at the same
> register (bank 0, 0xb0) as the other AMD 500 series boards. Enable it.
> 
> Assisted-by: LLM sparse
> Signed-off-by: Matt Layher <mdlayher@gmail.com>
> Reviewed-by: Eugene Shalygin <eugene.shalygin@gmail.com>

Applied.

Thanks,
Guenter
