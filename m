Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86F9E19004A
	for <linux-hwmon@vger.kernel.org>; Sat, 23 May 2026 13:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779542664; cv=none; b=SJXrrFui5raGQTIDxNFPZyt9fSH/eo1xyepV7FF+UI6/YQD0cWfIGM0GxKXdT8ougzdqmOA1IU8n5e9VFf8Z3ZoDOgAfxVorNoWgyou8UIS8ZU6CXPOF7wo+BWSoGfQ9DeuaqnhWoEczMuehIpgwQgGQgNS4rM8uDEyUkBWxEtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779542664; c=relaxed/simple;
	bh=/7PqubAPlkM40F1tooMeWsZAk5qGRa0gpyRTFZHj2mI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y38clnk6bXe9SW1G4lsPUifOs/1BUgORjl9EekdLVKiK6uiPtIPszE8FQ+Zhp9HS94JzuSFQyz7lwSfmADq6ty2wJ4PWzKd7Pa4zrrJVQQ4NKQDF2N5JVgVLJBgwuI1W9KXQFUfS/NL4SlURVY05z43579w4Nsuh4LnbYiiEO+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O9vk6dko; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O9vk6dko"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8353ca0f1f1so3625381b3a.1
        for <linux-hwmon@vger.kernel.org>; Sat, 23 May 2026 06:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779542663; x=1780147463; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=7WhPIxv8g+zM9oIvXWtsCbPqtUASe1ElKC7aJGmLcQM=;
        b=O9vk6dkokmLuFDqJa2bkfCMS/+bIrHd7Z8sqJ3lUD22Q/iyAWyHP3j3uN8T56SaRXH
         iXQaIwHF2nuwpfXdJ8H96ujZl/al97krG00uy3invssCsi1glGfwucVjoYSw9avvVg4E
         nkOYcjOuNSM53rMgJAIVsvE4+qJ1i+h9GU/3xs3cNOm+nmA4Wu2Xx7WHGy52Uv2/+FTC
         igMYfhRvBq17CU3KhlbtRs9P6gqvBu/hMvWh7GjE9O0OQYsRNl4IKQ+qmQqrVfj9r2Ta
         pDmAmG08kk0pTyP6cJfIFAWr7VHR8JAe3uAHQHwlov5dmvm648oVtOmR1iopvl3HtZlT
         bTjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779542663; x=1780147463;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7WhPIxv8g+zM9oIvXWtsCbPqtUASe1ElKC7aJGmLcQM=;
        b=ZBOKDh9fEgUmKQNKRZNbmQKuxZz5WMNQbJ8+J054EQmElgVc7LpV3LnuZOURNQadcf
         xUlT/p/26bk4ENepDbxQHtanf9QLKji6ttbJVwBQzZLOU83AXx8nfnVz3iplXuAKDUVz
         3v3xeZD04h0JG5fnIdlsqC3wLyVyVywXgAhmu3hlWmj1aJ0Bseue9P7n2qX6HBwtYtcE
         pX8AqbSKamwgf/PmjWVpKg+D/txD/BAY2zpvI3/H9bTzjRAvNyPRcJizsWVF2Pbm4fhi
         pcjaimAIEG2Xa/V0+KP2yYo7vIg8ES/mDyp0CgWAu3EeH/7fO3D7p9NBjDKHP+60GDVe
         0Rig==
X-Gm-Message-State: AOJu0YzO9AMBdtuvX+QSzJWJTN2Wj+GNGrqEZEw1yAmrBr1gxIJ2GWiS
	ynRRLU3hRy9AEQEqiUhrqlspR2P8AH/95k87ac3hUAVnb7RBgUcQTtZMaIu/GMlp
X-Gm-Gg: Acq92OEvfF/wW1gOAD38e8rY766TdbGyLJ2oA4rDMD0TTrFYh9DeN1Wb8qSvm+P+2n+
	UrLOK4l/I9GzNwB/pMI98iYXDommSZ3fvr/NaE1UJ7vv7yHq1eYtO+QKtbAPYoFuwltWuOgpaVJ
	lksSkToeA9VJ4FbEfjE5tBKEGIPB+waKUSWx+QVeafQWM+x7cMAI6GJs35Z85gM7GGWegVXdRBF
	990ZMI6KWZrMpakgwcBgPnLmzLYQiNNe5qYIpIfV9VKWEU18dGMCWv0p93ZZ/UqTPg4dvAelOqh
	2zPv/m5ts5Pjd2UaViW8rvuXZzg6RqF4w7nI0YeM1Rf9652lEK6DGvRyVot66Un+Jhemq3sdkC2
	B6tilg2eyoPiUYizW+1Z+BjV2acaJDlwRYDcAGHch65RcTET8h7U6pVfX+c9dqfF3x+iLNz17Ra
	2jng7WswnT4rv5NqD/11RHKQobaDT6EWCB2g9JZJ8PBGVA/en+ROKFq2oM9MQ4BmG2PiBfcLvev
	rkoXvI4YNk=
X-Received: by 2002:a05:6a00:ab01:b0:834:e24c:3f9c with SMTP id d2e1a72fcca58-8414b4fcbc7mr8979738b3a.22.1779542662591;
        Sat, 23 May 2026 06:24:22 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164afe2dasm4758890b3a.19.2026.05.23.06.24.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 23 May 2026 06:24:21 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <6f94fa56-0f60-4d40-a109-aafc0cc46147@roeck-us.net>
Date: Sat, 23 May 2026 06:24:20 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: (fschmd) avoid client->dev dereference in
 watchdog_release
To: Chen-Shi-Hong <eric039eric@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260523051117.9400-1-eric039eric@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260523051117.9400-1-eric039eric@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/22/26 22:10, Chen-Shi-Hong wrote:
> fschmd_remove() can detach the i2c client while the watchdog device
> is still open.
> 
> If watchdog_release() later takes the unexpected-close path, it calls
> watchdog_trigger() and then logs the event with dev_crit() using
> data->client->dev. However, the client may already have been cleared
> by the remove path.
> 
> watchdog_trigger() already checks whether data->client is still valid
> and returns -ENODEV if the client is gone. Use its return value to
> decide whether to emit the message, and log with watchdog_name instead
> of dereferencing data->client->dev.
> 
> This avoids relying on a device pointer that may no longer be valid
> during release after device removal.
> 

That driver has lots of problems, which would best be fixed by converting its
watchdog driver to a real watchdog driver and actually fixing the other real
problems, such as missing i2c error checks or the real existing race conditions.
This patch is like bandaging a blemish on a finger while ignoring that the leg
is half torn off.

Please, please, please, stop sending such patches. You bury the real important
fixes in the noise.

Guenter

> Signed-off-by: Chen-Shi-Hong <eric039eric@gmail.com>
> ---
>   drivers/hwmon/fschmd.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/hwmon/fschmd.c b/drivers/hwmon/fschmd.c
> index 1211fa2259e5..d1e7fc72e81f 100644
> --- a/drivers/hwmon/fschmd.c
> +++ b/drivers/hwmon/fschmd.c
> @@ -834,9 +834,9 @@ static int watchdog_release(struct inode *inode, struct file *filp)
>   		watchdog_stop(data);
>   		data->watchdog_expect_close = 0;
>   	} else {
> -		watchdog_trigger(data);
> -		dev_crit(&data->client->dev,
> -			"unexpected close, not stopping watchdog!\n");
> +		if (!watchdog_trigger(data))
> +			pr_crit("%s: unexpected close, not stopping watchdog!\n",
> +				data->watchdog_name);
>   	}
>   
>   	clear_bit(0, &data->watchdog_is_open);

