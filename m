Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6A8F3A1E7B
	for <linux-hwmon@vger.kernel.org>; Sun, 30 Aug 2026 15:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788103334; cv=none; b=OkVdUg0tPCvintAZXEkjq1yOwARaQiUACiP76yuwuM/uxr3WvpNdF7Uc1K4UdMW+eAIFOPWhlx+tEijfeY6gVTTrl1b2Q/o2F1Q08SbKti50s4EpHLH+rgmnmNbyId5zrysICEx8l+VHeyGsTHZ/kc2dA6SGh4HPw7LLH5cyzmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788103334; c=relaxed/simple;
	bh=B0zu/DDp0h8HdNP2kfSYHLE9QT16HtxltiewzlBQgbw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QB6iPA6W0PTXUd8C8It2ZC6vumH35hLnucH+klvzEpIGWTqSrLd9snlLWYsJm6YfUUEKbybPPn7FsX+dXJyNci2nJHEqVD5PLkH+d1ZMXFPZqXY9by4xbyeHKA0irP9Jy0O96HKl3z9fxRCmf+IH9D08HkKe/KVn32Hfoo5wES4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AFhj5nBP; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AFhj5nBP"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2d8fd3b729dso6475375ad.1
        for <linux-hwmon@vger.kernel.org>; Sun, 30 Aug 2026 08:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788103332; x=1788708132; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ioMgOLq7N+5LIk8vLZHLXDRGgolXWbwydGuFkQ+7aT0=;
        b=AFhj5nBPRluOGmdnjXcNTt9jw3MwkPe5yVANJzTfMHZxJ967Db6APOuxsI9zzd8W9b
         VKaGwT66YBw3RL+Mpzu/OKiSTxktRMO54tceOw7H6gT8xACmKBMhUVtl17wOjEdJXWk8
         kZiLmg56y82vFqZDRB2tBjowsgn/y1qZHebYAMvNPCdKQc+UVEcKjQzX3KKXMTb+KokJ
         J7bSFg8FMZ/z6CpqMqCQM1Fd1KAoivbxsyt+z0nHJoZoY8wHYOyCObtYIhxkttF2cJUv
         Nbaox6Y6fQlgVka0YHUUjmwgadOlcYUVJfDckdVsibrspHBK+1JicrJL+rmWONyJ+078
         APTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788103332; x=1788708132;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ioMgOLq7N+5LIk8vLZHLXDRGgolXWbwydGuFkQ+7aT0=;
        b=tSbIaq2XkxGyZvIkEHvHDC4JHNh5tIU2N8QWbk/PEOUVkfiXXbXOP+gpx/9FlIt0Fu
         Ku/Tf8oOKQ4jNWWSti4v2OpE/seOWY7BvGk1X03BIVC4B/5JOf8JiDHkzfsarOp+koQh
         +aVyCFRlNZXx5xo6+SGKeKYL+IDdttcKNQ9odochBFLKl+hbl0Kd9R+KV7H5xgM0BxxX
         jrxywAig39qFQK81HN4wgbptKD/gVnL87TMxJmEjG2uofqjGsGv0aT26tdOn90lqWbLO
         xfgZORhvZoTgILbKIhiPmqfaCFSpgBp60R2xEJPeb9G4bZ+3Bee4w+LtLIrIdIyqf47U
         ZI0g==
X-Gm-Message-State: AFuF++no9ejBk+VwswRxsquH2xDx2ci27VgFQR/wokIur9BkFl2nmBdN
	izKd34LutBBOInqq5c8lna+g4WqjuxIMbVb7l47zegxhsJnBYXE6YcDl
X-Gm-Gg: AYBFou0mGg11ZWF9eOWBHx0G6fPQDndkCjPJGZKrwLjbwSfaKTQIRgdYZYwAaQFvH4a
	7euJZZXzEuysgtAU8mr4CcgbsXwg6Y69hLgyqTFbOm6ONxXbwU4iBZyC2pLRLG/O9HoUh+0RlTl
	qcSh8w3G/tedvufoD4WENYJYjiPw24FLSlQNLkUOuhYYEpeBheOF4lj/4vVvw4T02FsDkqm207v
	xFDs0Jq4CzznTyS8o4zYchp2j5ko0T4OcCBrdNkPeJ3JgjKzhyxuLrKJqpST3spKyzJ5gQ0398Q
	mCp6CJ25tyu78Za+wQdGxYy3DOg3qA/P0TOhJE4boXsrkj/u7QDe/2/HkMQyovUPk8oONZg55dI
	mY65gZexZ4ZX2YS8xNwvHVadMM3bLZTojOYH5pGOL4AJIKT++Bafl5NBEHwRLmwzRGcZMAH+2rk
	Lb3IouYEqdu31yoAGukXeZBqz0tcyk9gqwoRFHVCnWmxjXZEXdLdFwJe8ozLyAvnJmLH28NhRUv
	TT0kseWUT7aB9n1icoNfc+AluZ5NiYQkYGE/A==
X-Received: by 2002:a17:902:d98b:b0:2ca:9d5a:8b6c with SMTP id d9443c01a7336-2d74dc6dc7emr337710335ad.5.1788103331921;
        Sun, 30 Aug 2026 08:22:11 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d8fdf635e1sm10369625ad.28.2026.08.30.08.22.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Aug 2026 08:22:11 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <4242501b-82b2-4ced-82e8-ef4022aa7175@roeck-us.net>
Date: Sun, 30 Aug 2026 08:22:10 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] hwmon: (gpio-fan) fix pm_runtime imbalance for
 alarm-only fans
To: Cong Nguyen <congnt264@gmail.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260828105018.2392383-1-congnt264@gmail.com>
 <20260830150508.1475105-1-congnt264@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260830150508.1475105-1-congnt264@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/30/26 08:05, Cong Nguyen wrote:
> pm_runtime_enable() runs unconditionally in probe, but the devm cleanup
> that calls pm_runtime_disable() is only registered when control GPIOs
> are present. Alarm-only fans never get it, so unbind warns about the
> missing disable.
> 
> Switch to devm_pm_runtime_enable(), registered before gpio_fan_stop()'s
> devm action so LIFO teardown runs gpio_fan_stop() first. gpio_fan_stop()
> calls set_fan_speed(0) -> pm_runtime_put_sync(), which needs PM still
> enabled to reach gpio_fan_runtime_suspend() and turn the regulator off;
> registering enable after gpio_fan_stop() (as v1 did) reverses that order
> and leaves the regulator on.
> 
> Fixes: 0d01110e6356 ("hwmon: (gpio-fan) Add regulator support")
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Link: https://lore.kernel.org/r/b9792be3-fcd6-468c-9149-7e33640ee167@roeck-us.net
> Cc: stable@vger.kernel.org
> Assisted-by: Claude:claude-opus-4
> Signed-off-by: Cong Nguyen <congnt264@gmail.com>
> ---

Another instance of a new patch version sent as reply to a previous
version.

It is against guidance in Documentation/process/submitting-patches.rst,
yet it proliferates, and more and more people send new patch revisions
this way. Where is this suggested ?

Thanks,
Guenter

