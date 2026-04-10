Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C71B3DEADF
	for <linux-hwmon@vger.kernel.org>; Fri, 10 Apr 2026 15:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775835137; cv=none; b=UQMQwLroMSYmfXqSEet2sgjFUV/dbNdcubxGCG8dN8Jir6EgzUrAG0sRQGi5sJlkJ8DO5DySlI9NxF/cBltVzlqVWSFpFFeMWG/dRDOLr0awqROcZbGmZMwU4vgH1o/2zNyV+o3ukpBtWVkaSuL+savKiCt3tv3ugAVOqLtLGvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775835137; c=relaxed/simple;
	bh=JWL2FQ3oRbFaONkjSbrDXal+LKNFqAX1HKv5oapCmx8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aMc2boKX4S85Q2F3B8SLUvZG90u6EpzDMQF9+2eMniJ75/QRiRiZUw74kXj8/6hY/gqMWirvzJVJmZ6/+AkEEQBa4bSqE76f9j9nWpKjBpvrogt+WwHICPMML15oZeiQDk8abgkrUBMnj5DzdJBF9/Gzx5rOrpRToWgr5cqMtFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O5qSdiRv; arc=none smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O5qSdiRv"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-126ea4b77adso10483609c88.1
        for <linux-hwmon@vger.kernel.org>; Fri, 10 Apr 2026 08:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775835135; x=1776439935; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=URJQRIK4vwElyY+o0kjrCKyZ6daBmdsIlXjoaBfNo7w=;
        b=O5qSdiRvrksVHgWZGeqYQ2oZctIYQWnmKBe5Z+Q9Zb7teqFCDivOACyANaeE3ljMME
         sKM8QAg0wuudxcvt0+NnFm68gT6VQ+7gbh02VWNlzBxAoPWmKL76sJGxthKfIX5Ev6nJ
         n2es+mVx7lRYBkRNSt29gJVY5CXpOFhGqregfBnHoanZ/kAkvMto415yk1/GQIvl5aWd
         zg7Mn8bKZGz8fJc6ERDF06UusSEnMHmJ0ORJnmP8DNb3gS+qhNPuRTSy5k29bLCjorX2
         x02UGkJL/wQ9sl+i6I/4oM//meY6NLF60D5eel4k6yZtLcQcXzkQc7IIV30ByQ3S/gex
         S7Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775835135; x=1776439935;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=URJQRIK4vwElyY+o0kjrCKyZ6daBmdsIlXjoaBfNo7w=;
        b=d/sAXStncU8wv/8ebCrgvEo0x6aYojOeJ1BnCL0mvTKW0xg1JVLvBRpZoRIrWY0Ib7
         87HSIyfVCIgr1s4FoCyaDGZ7Pt17spn68ki76R/M/67R/IKr58T6z/M+8DJu0y3K8Wol
         xGXVMTzMSqnoY+vWzq2wAhmpAw6t56nEz49dAaSPgfktOGp8yJVxxW9pm49ZHzRYl9af
         VdPjldTZ86GizVf2UQSwqV6Qbdoo7+rgDtd0lXxe8grteqQ0oiVJjcP6Wves9zCwVeee
         wgSPtsGmPNDv9HUwOcew+T4Hgflz+DMPoYxgtpJMryAxP1nMfVuhdxAuNiTj9DOKvzGi
         BkXA==
X-Gm-Message-State: AOJu0YzQ4+cE7QwrbmKFW1ObNpAG+kLJYNZNuLhs+BBtmkGT4ZRXvXIb
	rof7C49z4u4mbOWbOnklKc18pX8UHe31x7agcklTbXDN7wFaZxB+M0i2
X-Gm-Gg: AeBDiesBWsBspDp8updMrMMTXh6D6GBS1HUbLaY6q+/W5/97SajpSFFOQ3bnHPwaFxc
	cQvX6cbqB3miISvbpaTqlHLgJLCdrcjswXH7XkSUrCzWjGxkCfO34GDGYnzSOeZNbmkjNxlqv5O
	4i/mGBYYCm0OAJKRcrVDBru2W1aAX0iw+0PebyIVjYqJZZEJpCmANOOycCkNiccwufj21Sm+mvY
	+OsNRpYXe3KdZvDZJRPYfq0XRmWTQepgtAPQTbLb53ZGPOJyVI+ZWwOHHSBLbzC8ZMVm1jIin65
	AQ0GfQww1nHYFRSp4ELi1NOSBe+dzdARV107BQARgAnIoTyT4L3ET/Hi/hx1xE+LMRFFt+4Cn84
	dvYhqEVyJJtlMt4t6xssLC5dZAaESHWQQk+ZTe0V4b+360dMxYHWklf+5AqXqiTM6/6yzevpp1k
	ZEivG8Zm02DDXNbOsuUNG5blCS1dC4S+lXNjRn
X-Received: by 2002:a05:7022:662a:b0:128:e0dc:6428 with SMTP id a92af1059eb24-12c34ede980mr2287217c88.17.1775835135295;
        Fri, 10 Apr 2026 08:32:15 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c34acb077sm3453956c88.6.2026.04.10.08.32.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 08:32:14 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 10 Apr 2026 08:32:14 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"mail@carsten-spiess.de" <mail@carsten-spiess.de>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Sanman Pradhan <psanman@juniper.net>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: [PATCH v4] hwmon: (isl28022) Fix integer overflow in power
 calculation on 32-bit
Message-ID: <8d621efb-55aa-471e-9332-9c3c74a765a3@roeck-us.net>
References: <20260410002613.424557-1-sanman.pradhan@hpe.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260410002613.424557-1-sanman.pradhan@hpe.com>

On Fri, Apr 10, 2026 at 12:26:19AM +0000, Pradhan, Sanman wrote:
> From: Sanman Pradhan <psanman@juniper.net>
> 
> isl28022_read_power() computes:
> 
>   *val = ((51200000L * ((long)data->gain)) /
>           (long)data->shunt) * (long)regval;
> 
> On 32-bit platforms, 'long' is 32 bits. With gain=8 and shunt=10000
> (the default configuration):
> 
>   (51200000 * 8) / 10000 = 40960
>   40960 * 65535 = 2,684,313,600
> 
> This exceeds LONG_MAX (2,147,483,647), resulting in signed integer
> overflow.
> 
> Additionally, dividing before multiplying by regval loses precision
> unnecessarily.
> 
> Use u64 arithmetic with div_u64() and multiply before dividing to
> retain precision. The intermediate product cannot overflow u64
> (worst case: 51200000 * 8 * 65535 = 26843136000000). Power is
> inherently non-negative, so unsigned types are the natural fit.
> Cap the result to LONG_MAX before returning it through the hwmon
> callback.
> 
> Fixes: 39671a14df4f2 ("hwmon: (isl28022) new driver for ISL28022 power monitor")
> Cc: stable@vger.kernel.org
> Signed-off-by: Sanman Pradhan <psanman@juniper.net>

Applied.

Thanks,
Guenter
