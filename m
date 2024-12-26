Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE0C2323D;
	Thu, 26 Dec 2024 20:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735246351; cv=none; b=BiM+G8WZjk8Eb5oZ7s/QPbzrwsj1sKbRW84WfhLyxDMPbO3zpaUm44RRjDmFySB9xiaC7gZF0Fzska0LNYjJ5rEb5trwGfQgixvm2aoTSjCLmX4Ys5/tcivZzx249aBrJWvG/W3VYiKcQXH9lYztP8S4Ysi5b3JdqxaiRMxzt/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735246351; c=relaxed/simple;
	bh=eu1mXrUPm7ueaV+DHqnz/5SUV66JVoX2ixIuvniVHC0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M8e4lMu4BDLF7yJM72vGv9nQwRziJWTIjl+G26V1VN1WD4SHGxAcfCDE0JSeTG9HySuZ1JHtVy3PZu2LKfUB8RARsvNGHyN5y3kHJ0BiRTCOJO5gvEavJqLsC4OF8ttirkKwaMoZjUONU9q06Twg+JLFjnicjVoggc9yOJwR6es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KMKl7hHk; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KMKl7hHk"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2163dc5155fso77415955ad.0;
        Thu, 26 Dec 2024 12:52:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735246346; x=1735851146; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hn/79+ZJ9i/yTNXS9oJTvsZOVBq4qpA7kiedKfeLX9Y=;
        b=KMKl7hHkZipm/oQwQIT0ROe3sV8zd3YXK9WPNrEXuR1hDIZVwysLVThP7Cm/4xAQlu
         p4/i8UwoJ54oG+psg1j9QNzTzp3v8GuRuaHB7cJ127A4DfFhnEDYV/9O3TLjWvvX5f6a
         NUaClP5QzFOLwR8krtvRgnAhZGiOOvYQinpSVOKClt+kvXMvZCjVqDdUONk6Jilm44y1
         U4ihl4Zu7jRWcb3jeDK+r4qr4waJ9CjRnRx4PiMAXsIpBl3wrA3VzfHf77ngUlwY2fgA
         ZRtS95OFqRumUAO4u+iy/GklRfe5wvRHaOUD6kPu5y9QG0u8ycbwu5uyz6d7BofaRlyK
         4qHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735246346; x=1735851146;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hn/79+ZJ9i/yTNXS9oJTvsZOVBq4qpA7kiedKfeLX9Y=;
        b=bFmseEadDiDeJBF95SlKJ0ceH/jggKyHLEL6IABYmo9znj4leymQ+Jplf3JAvUjw2+
         D8lkXR/d3+Iwp90bjx2Phi2KNEcCOKn7P0BqEl94/e4p6qOMI812e7i4kylmcRBcvrXB
         yHvuoOD6Flyd0M2VcmyvpqcTP5d4zmqKVRTLs4xGTThFMB6WCGC5QujgcZx4Xx6qOVAm
         Uwg95vQ01GWYEYApGfx1XI+4+69jOHfyilbRkQMk7/h3/04BdZSTBORAU1kgR2/ycrjG
         2fjBhwGnpb3I/AS0cCh0l8r8wtmS5JDV81gir4Y2jhbLa4HX4IYyypVbX96LGPTHNfRM
         Ew5Q==
X-Forwarded-Encrypted: i=1; AJvYcCV8zFUv51xztFOSXOJll9dYHto63zGRjpHvWglN6/VveS45LZPe7ZQUB4Pu7wvrzqL5zhAntX0OH0TNULkT@vger.kernel.org, AJvYcCVFkfJe6H1FGCrRb/FSnR76Q7G2WIKy1MkyIX3lT7esBXsf8P5vp4JFC6NG1zU9GcYVct+sfdIvPji6vA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3gDVlVSjjjt/heW9eDHbJZkTPmXHPodYqdJVeHo+W7W4+P7XU
	6Hk3XDPImwYXikuED3B5BfG0i+0fV2oAOFb9tOkBaUvfdLbjt/XP
X-Gm-Gg: ASbGncvSQvlyIWpWIyXsXvexJNnFkqzl6MPhOIjPpqy9WrbaKACQnqK7J15T6Jgisz2
	byHCTskRQs6s0JFZI5GHVeiFxeV4N7XMgsn7H60DVC7JZwKq400WElHcAMtfb9Qzi8AHuvrcBg3
	i4DqTcJMzyjLugqIXr7PgXVXkQE0BUHtPkcw9OW1sCRoNsBF7jp3M9NfB2l2AGunXn2eOLMFSA6
	7fmwNIXhM9TtwHVIM8E4qSx891B7VxtSfS/wwizHGwEDMuHvnATkmI0pXAjQWnoqDEDXg==
X-Google-Smtp-Source: AGHT+IFUwKuYbv/+BVaOZ9m0hFdFY8ib4+VVGknAPIgOaurknPvDvUzeGMqaqJKr82wZnZhByTgb1w==
X-Received: by 2002:a05:6a21:108f:b0:1e1:ce4d:a144 with SMTP id adf61e73a8af0-1e5dfb4e030mr34881463637.0.1735246346061;
        Thu, 26 Dec 2024 12:52:26 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8dbae4sm13288260b3a.96.2024.12.26.12.52.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Dec 2024 12:52:25 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 26 Dec 2024 12:52:23 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: tjakobi@math.uni-bielefeld.de
Cc: Derek John Clark <derekjohn.clark@gmail.com>,
	=?iso-8859-1?Q?Joaqu=EDn_Ignacio_Aramend=EDa?= <samsagax@gmail.com>,
	Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] hwmon: (oxp-sensors) Fix wording in code comment
Message-ID: <51006199-1de4-4bda-b579-181e19bd66e4@roeck-us.net>
References: <cover.1735232354.git.tjakobi@math.uni-bielefeld.de>
 <858c2a5b712eebdf2fc7c9c6e3a2d2f832a68dfc.1735232354.git.tjakobi@math.uni-bielefeld.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <858c2a5b712eebdf2fc7c9c6e3a2d2f832a68dfc.1735232354.git.tjakobi@math.uni-bielefeld.de>

On Thu, Dec 26, 2024 at 06:00:18PM +0100, tjakobi@math.uni-bielefeld.de wrote:
> From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
> 
> Despite what the current comment says, the register is used
> both for reading and writing the PWM value.
> 
> Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
> ---
>  drivers/hwmon/oxp-sensors.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwmon/oxp-sensors.c b/drivers/hwmon/oxp-sensors.c
> index fbd1463d1494..8089349fa508 100644
> --- a/drivers/hwmon/oxp-sensors.c
> +++ b/drivers/hwmon/oxp-sensors.c
> @@ -46,14 +46,14 @@ static bool unlock_global_acpi_lock(void)
>  #define OXP_SENSOR_FAN_REG             0x76 /* Fan reading is 2 registers long */
>  #define OXP_2_SENSOR_FAN_REG           0x58 /* Fan reading is 2 registers long */
>  #define OXP_SENSOR_PWM_ENABLE_REG      0x4A /* PWM enable is 1 register long */
> -#define OXP_SENSOR_PWM_REG             0x4B /* PWM reading is 1 register long */
> +#define OXP_SENSOR_PWM_REG             0x4B /* PWM control is 1 register long */

I think that, if anything, this is more confusing than before.
"control" is, for example, enabling or disabling pwm management,
setting automatic or manual mode, or setting the pwm polarity.
Together ith the next two defines, "control" would suggest that
PWM_MODE_AUTO and PWM_MODE_MANUAL are set through that register -
which is not the case. "value" maybe, but "control" is just wrong.

Guenter

>  #define PWM_MODE_AUTO                  0x00
>  #define PWM_MODE_MANUAL                0x01
>  
>  /* OrangePi fan reading and PWM */
>  #define ORANGEPI_SENSOR_FAN_REG        0x78 /* Fan reading is 2 registers long */
>  #define ORANGEPI_SENSOR_PWM_ENABLE_REG 0x40 /* PWM enable is 1 register long */
> -#define ORANGEPI_SENSOR_PWM_REG        0x38 /* PWM reading is 1 register long */
> +#define ORANGEPI_SENSOR_PWM_REG        0x38 /* PWM control is 1 register long */
>  
>  /* Turbo button takeover function
>   * Different boards have different values and EC registers
> -- 
> 2.45.2
> 
> 
