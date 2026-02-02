Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE961367
	for <linux-hwmon@vger.kernel.org>; Mon,  2 Feb 2026 00:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769990710; cv=none; b=WQeef3rqu8Yq3+gli0BoZq8f6hxN32ZJw0Bs/LFYbpDJSr5/rJGRqOPRMdZuWzfSeY3fNZQtygY1ueHrYYgYcAcyFWH59uiP9I9AJrR3Pm+fZ6SvKgo7pKxQGQliipAZ9Wf+7xfX1706209XJ7hll2NOrtquYO9AZY0CZWdKx78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769990710; c=relaxed/simple;
	bh=Dnrsu7e8llQWO72v7zXc+Arhk+y/Tuhg6viBGyo1KeA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iaoq4dPH+ZXwEyLzrXG/ziDw1nSkRY6zL/0FwmC3Fq55Dp/cyNhPFXmafQaB5L9bEaTDGyjvWmK5I7KnccKSocR7vIOGyQoBKCNWNegPwQNm0EpiGSzO0SoX02jkzpIdCM+i5nGbHQyWJcU3nAv55IK5VQdv41Psqs7VmGyDrrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SOE+KyYK; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SOE+KyYK"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-34c24f4dfb7so1955904a91.0
        for <linux-hwmon@vger.kernel.org>; Sun, 01 Feb 2026 16:05:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769990709; x=1770595509; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jChbwAD+zWO8CByFHiqQt8kcpZGT0+zEA0U0OKmxeN4=;
        b=SOE+KyYKvl8lm0KP5lcBImJ6bVWBYjH8N7SdW6A/7HxFq9HUrizec4f70ZcFmTXzRr
         P2YwlNMbhNQaM+jqzTS0Xm2WB1AVsJJBqKsob7sNZiNkgZPx+jZjZlIythZLJG0uHYyU
         kYfFFPoulfTJ4reAsfaPFUcaqQ1Hd6uzMDdxTF8uT79tDvOWJQBe0VT0gFWiBc9BynfY
         8qZE3tAbuiforaPPS+k1JOt5gCAHfpFr82wvcj757EllcxaXOb428RkpeKoNs7fU+BPp
         MULUWz8QKspdd8XeiOcoocLTFxQmz8C1ghQrDnUYAOEsq5pY8zUSCX9l2Xduk5tnxuwR
         IEdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769990709; x=1770595509;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jChbwAD+zWO8CByFHiqQt8kcpZGT0+zEA0U0OKmxeN4=;
        b=huCkkfy01W1M+ZNIV76CnbkFgka2S9ekcjTGSh/dcL8nOLBigS74efyoW0Ln2gYOVw
         ID3ib8thIXuGOipIU9FZ1Rd3kTBtfyD5CGz3DTJ6vY0pPRcARIRgmLO6lIxHfD6eHVV6
         38DL7VmDnfXpwqcUU5dD45IXTKVImyEz7mVReZbljvBiiSsmAJY0AYOnoPOCbTg+ZWP/
         M3L/2GVH495TN79cxW3Yq8HnwWHICjV5n5GAbSSTWf+OD9ODSE33CwOAZWsQBaf9JwIR
         3U/d6p4XMgPhIbiTfuNmvWLuKNeMqeFIXyD+E4Y67n1jibh96CMyIgyCIJTk7PTGm9qQ
         TmQg==
X-Forwarded-Encrypted: i=1; AJvYcCWzT6dvlLdzGYYyMfzYP54eXs6UZ39OhaElUpWWf3hCKfKGRggeDWJvlq8vtDHdK3OXmGkWq+ZUZSCmag==@vger.kernel.org
X-Gm-Message-State: AOJu0YwIRG4Qm5BPSrGJOOsrXBqD92F7rDZyHpj95m/ATEJS2HcRjLVK
	+EAwqstr5r8v8X8tD+JeS7AF2m8/805S+r16UWeS47+0rDekndxOhTpz
X-Gm-Gg: AZuq6aJ38DFci3FnanoyTz8pUxEM/1xpMLwR7JfZVDgHsWvRbvrqD1BLgqVP/si04iq
	87I4qnpwB8/kx6hh3dJFxwUWlAlACc1OfXpp0Os2Qw2oeCEX9XlaZM93oAYabb2tfM8YuGdGxqF
	dMFhIyXMzDVG7TMnE3N63jWT0Q7V7GyI9ut735p/SbqT0KtK+wY5T7XTRlecUqYiOKLoBcE7DY1
	Rl3DkMzwJU4aVcavZTaBD0AW2zUSzS3Niw+SYibisvu/VOSZvXPYP2NwurLRXPBzY4k3sz8JDG/
	QJ7CseImhhS7v9qdpdNoPfuoJNWMNhYTL4KK/uNiSRSCY1QULPUqIaLPiZ1YqtByWrz0ryTLljH
	SRCCMrnSc50tN4mLMels+KAbvyf4RQTHj8r6vHhzedxd7wChGh9s+JPpWr6DHuAYUSqD0ItwpKq
	/dhPlM5cMhKq6s2mTwbwSe6K2T
X-Received: by 2002:a17:90b:5446:b0:340:9cf1:54d0 with SMTP id 98e67ed59e1d1-3543b2ebd00mr9605243a91.1.1769990708647;
        Sun, 01 Feb 2026 16:05:08 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3543bbfcddasm3241706a91.1.2026.02.01.16.05.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Feb 2026 16:05:08 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 1 Feb 2026 16:05:06 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] hwmon: gpio-fan: fix set_rpm() return value
Message-ID: <531f3bc1-a02b-4286-b692-b171a7f70222@roeck-us.net>
References: <20260201-gpio-fan-set_rpm-retval-fix-v1-1-dc39bc7693ca@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260201-gpio-fan-set_rpm-retval-fix-v1-1-dc39bc7693ca@gmail.com>

On Sun, Feb 01, 2026 at 09:35:06PM +0100, Gabor Juhos wrote:
> The set_rpm function is used as a 'store' callback of a device attribute,
> and as such it should return with the number of bytes consumed. However
> since commit 0d01110e6356 ("hwmon: (gpio-fan) Add regulator support"),
> the function returns with zero on success.
> 
> Due to this, the function gets called again and again whenever the user
> tries to change the FAN speed by writing the desired RPM value into the
> 'fan1_target' sysfs attribute.
> 
> The broken behaviour can be reproduced easily. For example, the following
> command never returns unless it gets terminated:
> 
>   $ echo 500 > /sys/class/hwmon/hwmon1/fan1_target
>   ^C
>   $
> 
> Change the code to return with the same value as the 'count' parameter
> on success to indicate that all bytes from the input buffer are consumed.
> The function behaved the same way prior to the offending change.
> 
> Cc: stable@vger.kernel.org
> Fixes: 0d01110e6356 ("hwmon: (gpio-fan) Add regulator support")
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>

Applied.

Thanks,
Guenter
