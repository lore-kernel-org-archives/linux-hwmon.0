Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F2F2D7386
	for <linux-hwmon@vger.kernel.org>; Mon, 24 Nov 2025 19:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764013757; cv=none; b=LqQlV+VqRhhR1olOLvXm0AOYrIg1P7cjG0QDSu09+LyRXtO5hnY29wuUTJaovjKr8crt7IeQFYDv6SYlDKFCNOJzALDxN/m+XqVj4sFWISBs9mhnjnGaeBH53FpZz08SpAC6f9g0+Z1TjJOvHHyEJ0IurK+oHtKdzDKP7FSpetY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764013757; c=relaxed/simple;
	bh=08A5bfJ5auAvnc5EMIef6ikfkXefTzj98TFHuIlVfUA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hSsh8NE3hP+EoHzVfLL//1fJzSkZPN84codYEjaMQYwDwqMmxa+Yi4+676erIhcDgeN8hgy6EwvwrXPTGil46H398Z7D+zH2SpTjBs72VgJ23wmjQ/6O89Qc/VBGBY+pULipdNwRmjkLapIBCpzwyk+BCoJvRP4+MTHDK0tBLZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KQY3Kbku; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KQY3Kbku"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-b9a5b5b47bfso3897272a12.1
        for <linux-hwmon@vger.kernel.org>; Mon, 24 Nov 2025 11:49:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764013755; x=1764618555; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HfBs4tvzeUVmt/yGqAb9gpp0nAfzbxJHxmsIGDE5Pa8=;
        b=KQY3KbkuoE1BYYyLYPOrkBtMLCuoOy7gP3FpgWN16X9XW8zK7alO0PrVtkT0hPd6ru
         TRd2JL0Amfk2pWwN1C2LbsiSLD4brFgucDc3yt4/o//8D5XR9qXyqdSdFMg9tuYOqI8G
         envHnjL6l1uBTC11a69J64qRDcx9PuehjIoWwHBdbGXW1NPIbcO1/BfpqRZnZNE1Ow3w
         WTursS8yQRwXOqSSFr2fiLBEr4pPr1np+qDRVnTNtrrXCDdu1h1fZiOJKVeYqO5f7ckf
         87Z5c0Jdm+I1YnrhlzMtujZBj/hiC86bB8nB8zzXU7WCxiYEZwYVocj7BlKQ4iS1cWwF
         QPHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764013755; x=1764618555;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HfBs4tvzeUVmt/yGqAb9gpp0nAfzbxJHxmsIGDE5Pa8=;
        b=SCNa1FcAQlJzuiosXPlAQ260ehwqGxwcBvAgcFfUfqxa4IY6aMNLRIO/4cdDvXHzTS
         WJ4vECx9MKCTdnjxoJ8f53kNs/p5vnEk2MlT/DOkMwhekaWqJ7mqIsDUaOHU1l0P1Knb
         mRIBuW5ltJCJnlcLTZXDe9ymDVXd5g+21HeOmcg+mPgd6S4dhreoljJXZvQiT6+9rC7N
         oXaskeM+c3E3alengobjZYO+Vh1fZ8c6P09b/c35tDovb6zBZy0NTw8P/QI5RKAn4/Pe
         4P7krdpARq4d+oC+SZQ22hzKoY7+CxwJrBQcr+Q8qyirk5cvp9E0OGL5VfbxS4rCMa6c
         Dr5A==
X-Forwarded-Encrypted: i=1; AJvYcCWuaFH+q4cG0YCwy0VDZiU2z+G+DWRXxxwUjeL0mm0LQ21KQcSs6E+x8NK62viJYChonw6tDShGnBtJCw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzts+fSqJ9i4hmXyh0N6/R6t3GYQVepJuw3JtMt6WmOunPgbIJG
	ZrI2u9oOSHbtqBySi3e+RJmmPNzyHRpFHv69xk1V9m88vljUnsnNl3uP
X-Gm-Gg: ASbGnctdT4CF//zz447epWGwcWCBx8gwluX1hfqrCNIhUe6st4+CeQq0Ar89if2vkLU
	5e3BTS38OR1VW7vrRPZWds206VpiunS9id4hwF8BXvMPEgy5ZcJDD7kxjB3Cp8ApRpR66EY9Wb0
	BdefT6gvZC89RcGLLCaWP8nCXxsILWId5Z8ezM54jikQJGWxrvtAAyR4P6cwh71Qk00DzZtILIz
	Uc4uCu1rRcKTT6bkjvHtiPjv+a+cfyv848e+H0f64egMA2L1IN//jI63vkov7uVmLGyoKGcZZmG
	UjAID36Jp87Ab3pxC5DN2ErqgIbKxkgdVsuV6jjoJmT477bj3KveJQBV5b45k8kZHkOV6NDKuZV
	CNZog6NRaZAdjTccpDAWuN4GkPcCPxqqga6HrWZI8M0c6EwLBEjrBK1eux7j8G4tU/ae7FWI+65
	QuAswmnLQ2zPk17GKrLqNGx1GrC/P48LZdtg==
X-Google-Smtp-Source: AGHT+IHlKP87Dlk+hOblmU8DZtc5Xdyl4vlxhIFsEXuNGeuvArP8P1yVHT3Uh9N92xC1SkNn/seLsA==
X-Received: by 2002:a05:7301:4d10:b0:2a4:765b:b4bd with SMTP id 5a478bee46e88-2a719fe60fcmr6002356eec.37.1764013755283;
        Mon, 24 Nov 2025 11:49:15 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2a6fc38a66bsm54276837eec.1.2025.11.24.11.49.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 11:49:13 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 24 Nov 2025 11:49:12 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Gui-Dong Han <hanguidong02@gmail.com>
Cc: vt8231@hiddenengine.co.uk, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (vt8231) Convert macros to functions to avoid
 TOCTOU
Message-ID: <49df3a4a-1a32-467e-b8da-25e1e7093979@roeck-us.net>
References: <20251124165900.4713-1-hanguidong02@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251124165900.4713-1-hanguidong02@gmail.com>

On Tue, Nov 25, 2025 at 12:59:00AM +0800, Gui-Dong Han wrote:
> The macro FAN_FROM_REG evaluates its arguments multiple times. When used
> with shared driver data, this leads to Time-of-Check to Time-of-Use
> (TOCTOU) race conditions, potentially causing divide-by-zero errors.
> 
> Convert the macro to a static function to ensure arguments are evaluated
> only once.
> 
> Additionally, in fan_div_store, move the reading of the old register
> value and the calculation of the minimum limit inside the update lock.
> This ensures that the read-modify-write sequence operates on consistent
> data, preventing race conditions during fan divider updates.
> 
> Link: https://lore.kernel.org/all/CALbr=LYJ_ehtp53HXEVkSpYoub+XYSTU8Rg=o1xxMJ8=5z8B-g@mail.gmail.com/
> Signed-off-by: Gui-Dong Han <hanguidong02@gmail.com>
> ---

Applied.

Thanks,
Guenter

...
> +	old = vt8231_read_value(data, VT8231_REG_FANDIV);
> +	min = fan_from_reg(data->fan_min[nr],
> +			DIV_FROM_REG(data->fan_div[nr]));

That line split was now unnecessary. Dropped while applying.
