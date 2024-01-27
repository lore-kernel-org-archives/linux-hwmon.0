Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702782C848;
	Sat, 27 Jan 2024 17:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706377906; cv=none; b=p+MMNh6UYhT857KQCm3inIm/XngKgqOb6c8XOJRaKmo47rUDPBvnMTsKXAEM7wo4HPvGs37QwuSTQFjEOkFYetQMahmqVnFRbo8r01gX0LYDhGr6XL9CeWbZ5hWxrgpUGW5JtJi2TgixDDPL3+NKskyBQhXZWCY4Dwu1F1yJ7zI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706377906; c=relaxed/simple;
	bh=kcw+rMNgtDzl+9yZJCu1yAiC5onltdOjj3IgEK7Kbm0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eiBaG4unMm6WKg1Csq1WEIV57z4nRRjo/jhUvYEbV2LwGw6NWh4Tacoug0Jdz/dG2wpM83aifT/zrJCtvv6IRXt8j6V/TTOP/+evn4sAngZC2xZFUAxIRt3t5BafkTIk9xiZzuxzLEqMrMtgP+Uhxl/cAtKVyb/j791MlfP9SkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fmLzUfiW; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fmLzUfiW"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-783d84ecb13so136167685a.0;
        Sat, 27 Jan 2024 09:51:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706377903; x=1706982703; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jCfkSpiW8qr49KiIkFAYM7G03fhXdeBGwWW5rfQEq6o=;
        b=fmLzUfiWy+wQwKUmrviuZG3C1Pjom7Vd96k8KsdQYH5xqSZTypgbcWNLpod4L+yylL
         jBi0cG4vUi9+kLjdUccyInrBLSaDJtyH8/7fwga75LG9nDMs7TJqLC50DAP++10h3gg4
         mC+EzZM5tNo+t+nG5YEwEnFUmRP2wt0qlrCFnnxnxSU8Mb6d3gWZTLkYFSTi+SE8wqVo
         LTHqHGNcc9IBwUEmmU3T0oqXEfm/sUmaFf+7H7MdAyEXycWKwjivI/dXKRZ2tExD+hle
         yvghC/3R4BQRAoSKh0p+Puc3F0tnT4s/4r7dYyG+RZo6ZiCdtC4ypdX3pSJkUej8bWK9
         xPig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706377903; x=1706982703;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jCfkSpiW8qr49KiIkFAYM7G03fhXdeBGwWW5rfQEq6o=;
        b=FcxDys1boyCB6xIhjCWKwUm45U0+YwSm2cFXt2rP9gsS+X3YqmrBcCihvB8yLsXuBp
         sD9rsYO7YnMv7/bdr14pOjaC44NKRdzATZqN59SvaqV8LX25B7w4ix94gjV13iQKKyIj
         a0Jv0nrjug9Wz+QbxnJneKtgZbG/kwmJmIPQQT/QZsruphhJVw6t0OscI0nc8irUbpB4
         UrQIR7wsMaI0elbkMNi7f71VBy1gN8ZFEgrT4nk1WbbN97hR+Z90rAET0lroZtwaTDpc
         H2XKZzugLxnYC1VH7GJH0Hnd7XcRzm7ZtJ2LlcVEam7H4NKmnIQ8r1znSUhcHh+QWedz
         hDbg==
X-Gm-Message-State: AOJu0YxvDrJoBduG0NQkQzRsUDyDnPlmmL73rqf/8CnrB8nAeo+AI3k/
	YoXoJa1pSkqtBHjGKKp9jO5KQ4vjwhPytJeTobAa8m7frswUIYXcF/w55og7
X-Google-Smtp-Source: AGHT+IH355xF7nMHIKDJ0q0cJHO2tpTFTOpaoCVvlF72+Ich9OHXSBHXsEQfogrI0LbuonsDeb4A4g==
X-Received: by 2002:a05:620a:a4e:b0:783:aebd:8ad4 with SMTP id j14-20020a05620a0a4e00b00783aebd8ad4mr2009775qka.125.1706377903149;
        Sat, 27 Jan 2024 09:51:43 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id px12-20020a17090b270c00b0028c8a2a9c73sm3257649pjb.25.2024.01.27.09.51.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jan 2024 09:51:42 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 27 Jan 2024 09:51:41 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] hwmon: Drop non-functional I2C_CLASS_HWMON support for
 drivers w/o detect()
Message-ID: <0000624a-e780-4bb9-856b-3db6d3f8cc63@roeck-us.net>
References: <13ce7c11-a958-4892-ada9-faf5bfdcb89d@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <13ce7c11-a958-4892-ada9-faf5bfdcb89d@gmail.com>

On Sat, Jan 27, 2024 at 06:45:00PM +0100, Heiner Kallweit wrote:
> Class-based I2C probing requires detect() and address_list both
> to be set in the I2C client driver, see checks in i2c_detect().
> It's misleading to declare I2C_CLASS_HWMON support if the driver
> doesn't implement detect().
> Class-based probing is a legacy mechanism, in addition apparently
> nobody ever noticed that class-based probing has been non-functional
> in both drivers from the very beginning. So drop the fragments of
> class-based probing support.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Applied.

Thanks a lot for the cleanup, appreciated!

Guenter
