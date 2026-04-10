Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 800913D9053
	for <linux-hwmon@vger.kernel.org>; Fri, 10 Apr 2026 15:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775834919; cv=none; b=ITkZSVOEeO/bxtrr+Vc0/aylXiAIUoimyNrPcRrcB4dMo7xCLWSORUW6NluNa6WRWvwYLK60uklxHSLO+LMzn+SBpu47nZi8LyQGJIQFOYcoNDOn01uY4+amRzX27nWKSxr3WAGcJyRcK0CWXKYDVj8+/EH4RtNii6OTQHgXJxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775834919; c=relaxed/simple;
	bh=kbA7PR4neyNPM4QG9vJCntSEbumLjaB3stBsnOiOhns=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hTQcq2pFmTxGIXxHvLx7OyB1+d5ZwnEX1rkzlpDzHBsIEsbJSYyaWhNs4hfBbjerFwmjblup+sen0TPBTkrNTTyeGh6dDOPkN+RBhaIeB1ECknphwubXdGrTIG3VvWYFRacb6mw0ldY0QHYzRq1lBJRzMFvv6LF7O85Mijt53Xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kV1bw3Ch; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kV1bw3Ch"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2cf1646bd11so3795319eec.1
        for <linux-hwmon@vger.kernel.org>; Fri, 10 Apr 2026 08:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775834918; x=1776439718; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JghhKcmcjJXB0Gwm3GfsIN1qKN146rmMPnlKpn3tqi4=;
        b=kV1bw3ChPORis8x0QDRmnt/DRlSQac54ogHkkeHALFQpHq1NzqKSdKW4/ylBLjEjhw
         PuGZw3uLSfG8/IVHu2T0N3Ph7056tMoJumt4EHEqtX8OE6+YcrMS12MXGM8kjoQ+w+qa
         uPvo87inS3JolWjz8GUOvyrIEXLQy88bV5ayqjS5yJmv2hfze/skL/m2yfcEPW+gT3zI
         OM1wV3O96qsUpovSR7d5dZKxl+cPoV++qZKFunUrrUq+ovgcmc60TZI6cEXm5WlQIjaq
         T+V2M05i+c6FAjZYB8NKPWZQJ9/CkoZGFKjb8sZ7wDcoVlrRTn+Co1BhZcE1UmfUQN7g
         kvvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775834918; x=1776439718;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JghhKcmcjJXB0Gwm3GfsIN1qKN146rmMPnlKpn3tqi4=;
        b=mEJ+XZihov7rDAtE/SNF0yvKxRm0RIa4FXoIqcWsGmeWL7CA9X3aBo8lSwUuYZVRqU
         uJHgOhv7nNnqx9HeXfw8l77wfKbqvxTNW8KEp99deI0MV3wK+33k5AolNXKjXqSYiaoz
         oO1z8Jh6CGIeWjzJWG7p0ZBX0m2mQHmBv/mF0ORuLOeDU3ITbKyTCtp0ynan+HNWDHga
         4JY5JUxIDcgoIYYNCtVlrqeTMdR0wNh3jEqsv415iynt1bmcO33yBhPzyy77tMqXAG+P
         kxyOqBojC3GYjJ5XgLq/PKSUklZo2Lhrn4bb9dBvKlcg9KQgrbDLRr2LnC37Ro18cnj7
         6sxA==
X-Gm-Message-State: AOJu0YwhFp9yewiljnuYx0+mb+0YWUjVhwc+eO/O/hFO9FjxZGQQBpbW
	Li8okapFdyK9qP5cQd4aWmYNXkEOaWag/N9mL3r62aPxzaCTK0gB9vGx
X-Gm-Gg: AeBDietfz5x4/XINKuzgXz+ox8deHcYW6HrQnvjuKsicpibFm06VipOqxp5VzGes4eI
	2NIfyObOcihO4yioieK8iQSAc3iK7wq5Kz1aM5CH8iWO9ZwAYIpg3htguQBliZrhKGHXEUsBEkI
	3GWiC6MD7qJnId2j2b6ojT+bdYj8jvkSe/rG6IPgvH08gbtxAdYnQrapCM78exjkRhboiHVcjwp
	/cQInKgDwVSAEBmfOz/ftqhV4OTpp4WPvd8oGKvgnt5xJphZrJYUvx5Y8+xOeI1DCIAwSGRHWLR
	CHKyZZvNpTXMSszLo2T+bfF0KP9UN+t+oV2dIQL/QkVD0hlap7AY/9YT9Hzw57gRHypkfNzicko
	65rHKG7+uteXyiz3HIBFiqalBF7HluBc7bdM89zvjQYqHShjzWE576QzDZ0dvniB7707lmhloVk
	pBuzT8gjcfjGoEfun2Vsj+AtH0AEGzB33eoixm
X-Received: by 2002:a05:7300:3721:b0:2cc:2125:9332 with SMTP id 5a478bee46e88-2d58a494b40mr2196877eec.27.1775834917647;
        Fri, 10 Apr 2026 08:28:37 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d561bde717sm4713751eec.19.2026.04.10.08.28.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 08:28:37 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 10 Apr 2026 08:28:36 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"linux@weissschuh.net" <linux@weissschuh.net>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Sanman Pradhan <psanman@juniper.net>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: [PATCH v4 1/2] hwmon: (powerz) Fix use-after-free on USB
 disconnect
Message-ID: <d7988826-251f-4bd9-8d46-91f925b5a64f@roeck-us.net>
References: <20260410002521.422645-1-sanman.pradhan@hpe.com>
 <20260410002521.422645-2-sanman.pradhan@hpe.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260410002521.422645-2-sanman.pradhan@hpe.com>

On Fri, Apr 10, 2026 at 12:25:35AM +0000, Pradhan, Sanman wrote:
> From: Sanman Pradhan <psanman@juniper.net>
> 
> After powerz_disconnect() frees the URB and releases the mutex, a
> subsequent powerz_read() call can acquire the mutex and call
> powerz_read_data(), which dereferences the freed URB pointer.
> 
> Fix by:
>  - Setting priv->urb to NULL in powerz_disconnect() so that
>    powerz_read_data() can detect the disconnected state.
>  - Adding a !priv->urb check at the start of powerz_read_data()
>    to return -ENODEV on a disconnected device.
>  - Moving usb_set_intfdata() before hwmon registration so the
>    disconnect handler can always find the priv pointer.
> 
> Fixes: 4381a36abdf1c ("hwmon: add POWER-Z driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Sanman Pradhan <psanman@juniper.net>

Applied.

Thanks,
Guenter
