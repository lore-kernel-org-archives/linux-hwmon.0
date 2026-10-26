Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792976100;
	b=zQMe8GLZRfOKTKMxBpmBT5YdrTl514/tSnjFutWZ2adymHYnh2S66Ti2IGodveAWfakN
	 n8BmONwBwWPSgockOa/6cGbIPxEZ5mkBvJPWbdfL9VYt+Fc0jaYxrEyp04xsvbVet5+Un
	 VuOfSn/egKT2QpSz/vAZ1BV9QlHTQm3KINGvJHy1YjbbrcU5aOkbRL+4cxcLvtRgoUxWj
	 Hfav3ldMD28rT2eSosj00umpxVxaiUPdASPsgIDwUFDH7/+wm8k5CRQsBXyvPZZ3uRw6e
	 57EyR50uKWQGtEkR3HZeBVuQs38Kq2JZSksRlOL21yO9YFiLOCcl1lcEFFFqcmGJ9/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792976100;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=xtkJhtt7gdLqfyFrDYEU8VNnmv2Kks3hOhntWWSBmiU=;
	b=07NcdtbSmhGXTzblSnW1NEFHwQ9WiN5dJ1vx4arW/FVwj6CRBfTlSfaRH2/WxruprLJ/
	 N4hxBOpKhmy2vHcoUfaQGFt2VleAi8G+VGdRYvc3s8hyDEUoyD/OUNdDWGTOcVk/UxXPX
	 gofx1zCI0w5wY56ej93V6ZE6+HoKRj2jp2x2KjaXcAfJFXg1/Fvm8rGqEJy34p6CTpEOi
	 3UbcIW1XaHqrq+4MlwByYSV1p2mwaLBMPav2uUDbhhSMNpHjbIOhYAb0SFsXtEJWPJ1bc
	 lZ5smfVTXyHPrSdT6WKA2QedPu+mKz6rvsl980ReVnCQda3xPIybeZHcWM+pqGfr2cg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EFGdjEVR;
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17E20606A31D
	for <linux-hwmon@vger.kernel.org>; Mon, 26 Oct 2026 00:54:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17E20606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EFGdjEVR
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2e8da6ef7ddso12578905ad.3
        for <linux-hwmon@vger.kernel.org>; Sun, 25 Oct 2026 17:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792976099; x=1793580899; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xtkJhtt7gdLqfyFrDYEU8VNnmv2Kks3hOhntWWSBmiU=;
        b=EFGdjEVRT2z/k67XUVC38GP6b/AGdWOpLn7fRa6nt/iR7JGqEkm3PEToqMj0f2/Y6G
         EUkccUd52ztIX9awbfA1n7L4ZxPOvHPmHVwTZVWGhjQ97aydmZTDk8njTgRBC3YWanx3
         oaEube4nR7uIhFYE5mXCd4S0nzkFI5JIf7ZbsMqkSSHwfnPZcbRyQaKuyHRGAIyu/EBV
         xN58/WvdgygP7w9pjO+1mb654v+cy2CPWn+byXVoSQEj2hPL17HDipXyCIXLUXhinwRv
         m82OrIqRC/z/f9f5Lkoy4Gz5b/rlxwhUXKkiW+ecay/CVlmY5IHBbFEWvbDsSxCM2HWf
         UW7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792976099; x=1793580899;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xtkJhtt7gdLqfyFrDYEU8VNnmv2Kks3hOhntWWSBmiU=;
        b=uASPyWmG8JtDw6G/VTqgkSemL0CA9XllGWL55aEFlG5NJzHAv6V0onrccPUuRsjw4S
         Rh4vzV1LpY7PLXZCz7fdTgDL7VjAjEMK0OzkY4Rs38bsZZKhKm3Kz2vddA8AoozGWe9x
         irCO6v13+L9eHgcGOo2VfJgbSZzZJaEhsIFjTnPCcPOf75uhJddJgG2RkbndE8JImYZm
         CPooxJTLKcnLwDZBng6DOYMXeK0ryjBO9nNG0nqctnHG2VP8WMcY97uRsR85i4oZWWY0
         BMN3rbNf4SEfj8YSUTLLnDD6M7EmUBLIFBex7LXEHUtx8Bw3TAKdsfsI/VayZlipk83z
         Bikg==
X-Forwarded-Encrypted: i=1; AKwUvBxiR9CMgKxTIEemh4x4+BEy/KT7x6Te75faJ8QlocxZjsYCil1+nbFcDSbOYVmN3hsxAuPhYIQOsKtBCg==@vger.kernel.org
X-Gm-Message-State: AFq9FYJGryjNBEk+7ZnxhIVBth3SGRWi2MXFsfS+HzRKFHqiABoMncNj
	GIDIRVq3hXyk9EenOkMQvam6RMZlsSsDwjincSJEV+GZQ6k2baU69Nbm
X-Gm-Gg: AYBFou2W9U97TUPVb1s9eBLHfmUVG/CHfOMTGXUeNXL4x/BEhrMwYg5X9IATXKnvTF/
	fHKZkMj7YMOjLFb0rLIOkw3qQynr3M/AoeftFFfLhSwO5EYDP20oMm8HtHd5evm0HC1Gg6Ko4T1
	d/zO3brzdfnff7OYtLNbp/P5LTfVg4PHUzeujd5Vt28DWv7Ru29I6Fctx+5cZ3u842T8gwaPvGK
	ONT9/zSSUv2QZdfRQ+Yi9tWodIpHsGf4Pzbeq/qrAYtPaliLmTi8AbNPC/CVWUUp4FQJprmKXun
	ogaQogQCJJpjY7ZMhGKcF7GupwLsNb8Xzp3+4KqEinF3/AYHbUX4CXjpxaKfM1ngEMWMHt2g/Wy
	4OnbkLPat8lmx8dAf4EX2D904rY5RIU7n1bjEeiw4dwCC+pUdTy2mOEZpjafCXLmC89deesqlBT
	fkD8RfDH39XgbWVHdjZuV4uCuvhHkGwDaB/0Bu9/phLAbPvjlsLoP4REOT0xhWc579pa8fUtOrf
	lBpx2APACC2LxjfgztVYtzElW4zOS0rlrqKc2iZHaOmcha5fpj1HRwLO5GfnuZsGzrGBQ==
X-Received: by 2002:a17:90b:53cf:b0:3ac:9772:8da3 with SMTP id 98e67ed59e1d1-3adeabde79cmr4337887a91.31.1792976099324;
        Sun, 25 Oct 2026 17:54:59 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebaddd45sm4643910a91.2.2026.10.25.17.54.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 17:54:58 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 25 Oct 2026 17:54:58 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (pmbus/max34440): add support for adpm12886
Message-ID: <004b7fb6-e704-484c-8748-c31a9194da9a@roeck-us.net>
References: <20260928-hwmon-next-v1-1-55b6c5cd8e2e@analog.com>
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
In-Reply-To: <20260928-hwmon-next-v1-1-55b6c5cd8e2e@analog.com>

On Mon, Sep 28, 2026 at 12:27:55PM +0800, Alexis Czezar Torreno wrote:
> ADPM12886 is a 1/8 brick DC/DC converter that provides up to 98%
> efficiency at half load. Can sustain output power of 1200W. Uses PMBUS.
> 
> Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>

Applied.

Thanks,
Guenter
