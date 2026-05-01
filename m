Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC9E33EF
	for <linux-hwmon@vger.kernel.org>; Fri,  1 May 2026 14:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777645943; cv=none; b=FXeE2iyWFsSAo7mCBhvZqqCMe8bvAfhG/UFKgoQBF9y0/4rIRZBAkAK9i2u9pMy4o8Ga6Bel00UR+WgzB+LooFtkGyZSq96Jmb/Yr/b9zHmP0FVgmDYDcz3mui4NiH6iRLW0dtfXt039xa/rErrcESNV208jX8Xg180Sz5R/tWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777645943; c=relaxed/simple;
	bh=9GbttKY72i8g2S/pWCMXH9N1LbFrzixFfA6QzXZm90c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bye0M9GMsz5ZfdHqSAR68CYUkB6GRdCikVQ0sdy5QZ8Gz6yglM0zvEa0uGEssYwxX+Jmg9Qdd5EpHSwIfhRR3hJ+Su0Nhe1aC4yXBk1QhaCdmP0LULF6MaDKy5ar2UC8Psj8yOgP70ToH+5DRiPexfiK9o+1oPIrSFq4U4CxyZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wk9fBwlH; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wk9fBwlH"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-7b37d84a6b3so21593597b3.2
        for <linux-hwmon@vger.kernel.org>; Fri, 01 May 2026 07:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777645941; x=1778250741; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UXliSQjfzqrV4saOjCcd86w4BjWKpveMf4cspp0K8Xg=;
        b=Wk9fBwlHs11WAHY1p9OamzsmuB+oy0ifi76i1lx+4mhHgCVDWzpfW5uLnp3uCYQOwQ
         Eryd+Ch6c8oOS9zbw0sveST/G8uewZrRJXOjA0fVM2sTN+ZMulGHcipkYmscL1C3Bu8/
         jBsu89LGPm5M5lYtT4zGN5q26A/Qj5Y/h4O5RGjlt1pSJocO1xeKPh6v9EjHfViyxIh4
         rZi5J2gRbVTrjdZ0VoiBzOk4iRicwWxnFl5fuS/sijBtR9gqy4YvAZ2JYNJazb0krLZc
         wmtbOlohuuYKeSljnsp6YhneTJXvmzlnAdh80UPPSMnNP50sLfEwomAWZsJnkDOb2Y7u
         wz6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777645941; x=1778250741;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UXliSQjfzqrV4saOjCcd86w4BjWKpveMf4cspp0K8Xg=;
        b=UQfZHE2KeN+x2YFqN9r4YPjwbdxDcGC9kinc7iDI3wfAGTMdcnPPWfJMzkcxVQ5xeM
         nUn0WxIg8cG8R3bBmn44p8USHSxqeG6X0CP4D52VHUptUB3cjpwTK08Ukh4OYP6FxAno
         FGpgpPBMRsyGMNC828moDdEmKKKswC7r2teHHw3dAjQPDia42gVX2Nti5Jmd5dip9u+q
         56IPzFmyng09kxQgXgEX6urZbhQ17YnvySbDYRiYCqHIyKrca6QTC22iusC2NFMu7JTU
         Kh7hbx16aHUm7yj1758Ig2Kbm/hCp6bbccY1QJ24wKipL4HhSm+a4bW3FKMHhJzSvM4u
         MqYw==
X-Forwarded-Encrypted: i=1; AFNElJ9xPBZome6RhQfUcGO8KxPhVoyLqY6tsGN4UAPHknRL5UushbiFhKdHcubeKZFM50GVWI7LlK9j4iU2+g==@vger.kernel.org
X-Gm-Message-State: AOJu0YziieMNEx8wJq0EKN+Gl15cDsmwytWCzD2MyTW9qWHB0zL9dRBm
	rQ9yzyHAmV0SCdxMa4MjXVsmuEAFZzMb1+M6j64LRU9KZMkPJbCXrov9
X-Gm-Gg: AeBDieueI7hRaUYA60oHPvjol3wC3PCEeLsr8mYhlZv7SMrt8NG2nxtpInDEuKifmof
	MuiwemvvbKFkW/mWm/Je19s/7fCaX0c9IOPD9JXJzKcYOzJaYyA07Z4HV2xI9jfyotgV21Ea+af
	anh8ImxOH7bmlOQ2R7WvmVaJBzuv7/ANc2umOipm9vC+TxglOJ9Q2DPUC2sar1mRDfyx13AJVxX
	QQhj8ep1bnLwHLMPsWr+1cJPwxJwcxCYtRf2hCIIl7HxEL4I6koPLQBv9S22jSagwW1ka871Don
	TFywL0sPGpex5H1tlPrb5SUxurhspR9VLB1REkWBRcKMfYZ55T20QZ2107BmSlur/kPoCT62ePt
	MfZz5qGK9JPFRIIvfs9nyIxHV/PeL3xbPmYPeSU6W8mD5pN0brqYQBl94iriQMF6xl7N1ySwWQh
	OM8cshJzBwm2AjcMY79FZTMjq65SGpxZ2Ej6FGRw==
X-Received: by 2002:a05:690c:d8d:b0:7ba:f784:579a with SMTP id 00721157ae682-7bd694d73a0mr29028887b3.24.1777645941522;
        Fri, 01 May 2026 07:32:21 -0700 (PDT)
Received: from [192.168.1.4] ([116.72.73.183])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd6655d954sm11446387b3.18.2026.05.01.07.32.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 May 2026 07:32:21 -0700 (PDT)
Message-ID: <2b3b7c42-95ed-4195-83ac-63e6fe171e6c@gmail.com>
Date: Fri, 1 May 2026 20:02:15 +0530
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] hwmon: (ads7871) Fix endianness bug in 16-bit
 register reads
To: David Laight <david.laight.linux@gmail.com>
Cc: Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org, shuah@kernel.org, me@brighamcampbell.com,
 Sashiko <sashiko-bot@kernel.org>
References: <20260501023530.31160-1-tabreztalks@gmail.com>
 <20260501023530.31160-2-tabreztalks@gmail.com>
 <20260501094902.05ce6d37@pumpkin>
Content-Language: en-US
From: Tabrez Ahmed <tabreztalks@gmail.com>
In-Reply-To: <20260501094902.05ce6d37@pumpkin>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/1/26 14:19, David Laight wrote:

> Isn't it enough to just byteswap the result? so:
> 	return le16toh(ret);
> The whole thing can be:
> 	return le16toh(spi_w8r16(spi, reg | INST_READ_BM | INST_16BIT_BM));
> (although I suspect sparse bleats and needs an annoying (__force __le16) cast)

Hi David,

Good point, spi_w8r16() is definitely cleaner and cuts out the buffer 
allocations entirely.

I tried the one-liner approach, but le16toh caused a build error because 
it's not available in the kernel headers. I will swap it for le16_to_cpu 
in the final patch.

I'm going to split the implementation slightly in v6 to catch negative 
error codes before the conversion and to match the bitwise assignment 
style used in the rest of this driver:


static int ads7871_read_reg16(struct spi_device *spi, int reg)
{
	int ret;

	reg = reg | INST_READ_BM | INST_16BIT_BM;
	ret = spi_w8r16(spi, reg);
	if (ret < 0)
		return ret;

	return le16_to_cpu((__force __le16)ret);
}


Guenter this also pulls in your suggestion to combine the bitwise flags.

I'll get v6 out shortly.

Thanks,
Tabrez
