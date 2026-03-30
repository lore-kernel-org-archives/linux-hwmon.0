Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3973D213E89
	for <linux-hwmon@vger.kernel.org>; Mon, 30 Mar 2026 17:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774892829; cv=none; b=s7WhTF1qS4z9+BOQuSna8gqBp/ezZV64A1/b1g42EFyp57Tm8z4Bm/93UeMAwF0XnzlDm4xx84EF4WZuuNYKwsCB+QWWeYaJmDqNuOA+lSgpSc2ZkylbAKQKJbrGSGht3K6fg/sqEh4O/clzDBhQtrxSyOnFxEteDwaeFHFDq5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774892829; c=relaxed/simple;
	bh=WjZJStGbNBMHWn86UIsKLhOXroiXKc6IYPyOhIYJ3Ak=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KxClyUDTdqypdOYB/CTX/lfo7TXJV21IBWArLrwoMkRRhESM4w+sbMH611mrE+75Dy60/acH11L7d/n01Cd8LY4TsDwYkUnPglsIAbKWmBt+MeQcVqk8YWUw8+YUC0/VsKNdvoI6NQ/uaDY68Hbo/JlaYFx5i9C0QJMeVlRRTOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qztUYsmO; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qztUYsmO"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c742d4df00cso2285810a12.1
        for <linux-hwmon@vger.kernel.org>; Mon, 30 Mar 2026 10:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774892827; x=1775497627; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lrt52vG0JzphZQOmOANXEJJphV8S9ag6SE29MQKE2GM=;
        b=qztUYsmOKzHuWa9a4RNiY/a62xmLr6rlrWPlEseREpj4gWDTT9QAlZtn6yikjX8ohW
         +bjVzLHXviabmPZr68JcaG3hnxw3Kf66Y2aCpJPFXp8pKO3tH6DYRCBs+/g9G+c5Nt8X
         5z7vXtyMRI6K7rAyGw5tFt6HnESAapJMWeOMvJFdEKh26EpB8klr8y77ZzpJegeQSxw+
         fs1KBjjawqCIinIilv4+cVHxq0ITYr0+12RvEW6jbhl4VlCHtf3IwXY4Tv0fmtr91sa7
         ZxbZGONrbhdHLISoy22mf3Dd1qqm4JBhsQZNOmdCf4FiUYKq6YUloSzKJqXIxun40Foo
         UOKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774892827; x=1775497627;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lrt52vG0JzphZQOmOANXEJJphV8S9ag6SE29MQKE2GM=;
        b=Z6u/wCfYxaHTubyHd/VbZxEJps0NepapnJzYv+952O5DNyJBKtgs6aPdNnbUF6ux/X
         FVvT6Ycrqjwsl1H+LsTET1VQJLhuSnYdPSUjskREu4bhlL1NreHCid1nEV5kiiD8adc8
         gn7kjitqvTbg2YofDU16LcbyAVkdvoDk+ftI2YcvIchwtdHoW/ZPsM5ghZATjNIpHytH
         lCKw8+A3bVj8ipLcCKB0qkOgYGLI8Ks4mZlhN2gaWhYSzlwrSgGsQjsfHVrhTnnnBmSg
         TVu1qO8TFz5TM7hMHbwcdJ+93y9xG19P7bMK2Wpa6+Q0uOe3g4vWNWS/S/RGUx1BTiLU
         KNhg==
X-Gm-Message-State: AOJu0Yz0mb/MG5mAmPqyuQOo+m9oH/xkI446tIKR9FoejYve5iKYnrq9
	JniazDTpAPr7pYImfRW0FAirGbsYCEEoTVwE5pa8D5jqwrexrMxFGbORD7MxAw==
X-Gm-Gg: ATEYQzzBU2TU7KJwslKEHrLyzx6OtfRkI04gYfllG9c455IfJoqFtrn5S5C3szmgbfn
	OeTf1Kxbqmof5gE/QYhjww7ulS/5Kq9+dTySbdyMqFvYqMsoQjinGRiCmDsPAe9KD6dYb7n/wev
	NGxbnu8PxBnj1Cnf7cvk6B8i//DYWIbUtHDsgAms3rTHTjswyA0V55thl2yE9BBzCETDoObERon
	Nkke486Gwx85B5TcW8xrXKQTGsf7UXvr4hB+kS9HjZ6z1FfZunT961RgWP3oxBiTKlEt/e1t7oc
	qZWpXllBAwGkLa0BzeLL2ld5OmSThaRSEmU6H67P+ckDiwo6KbSUMp8aAXs391pHkRFqG3WEAyl
	45e2VFUA2cVPaT3AhHUfi/XmPV4/59o0XM/kKYTBrEdgj6if+uEA7fknO+Jluaf9WsQ7sNlWVGT
	1q2Nq/OuOlTWfgZwdTrQcISiMDNJ4iBTSG8mYI
X-Received: by 2002:a05:6a20:a10d:b0:39b:bc11:9ec5 with SMTP id adf61e73a8af0-39edbd3b391mr411139637.13.1774892827440;
        Mon, 30 Mar 2026 10:47:07 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76917bb809sm6956247a12.28.2026.03.30.10.47.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 10:47:07 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 30 Mar 2026 10:47:06 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Sanman Pradhan <psanman@juniper.net>
Subject: Re: [PATCH v2] hwmon: (tps53679) Fix device ID comparison and
 printing in tps53676_identify()
Message-ID: <5f349f4b-aa00-4362-a836-64580211bb48@roeck-us.net>
References: <20260330155618.77403-1-sanman.pradhan@hpe.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260330155618.77403-1-sanman.pradhan@hpe.com>

On Mon, Mar 30, 2026 at 03:56:40PM +0000, Pradhan, Sanman wrote:
> From: Sanman Pradhan <psanman@juniper.net>
> 
> tps53676_identify() uses strncmp() to compare the device ID buffer
> against a byte sequence containing embedded non-printable bytes
> (\x53\x67\x60). strncmp() is semantically wrong for binary data
> comparison; use memcmp() instead.
> 
> Additionally, the buffer from i2c_smbus_read_block_data() is not
> NUL-terminated, so printing it with "%s" in the error path is
> undefined behavior and may read past the buffer. Use "%*ph" to
> hex-dump the actual bytes returned.
> 
> Per the datasheet, the expected device ID is the 6-byte sequence
> 54 49 53 67 60 00 ("TI\x53\x67\x60\x00"), so compare all 6 bytes
> including the trailing NUL.
> 
> Fixes: cb3d37b59012 ("hwmon: (pmbus/tps53679) Add support for TI TPS53676")
> Signed-off-by: Sanman Pradhan <psanman@juniper.net>

Applied.

Thanks,
Guenter
