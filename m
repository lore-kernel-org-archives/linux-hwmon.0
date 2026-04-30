Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E80113630B9
	for <linux-hwmon@vger.kernel.org>; Thu, 30 Apr 2026 17:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777569787; cv=none; b=Bd6HrrDQ+n2mN2flVL/bD6QM7yDzT74gDpoi1McVYGl7taT1aOuNIBp9tZ41qpaodfB2iSqZNGJ4AHaM6mb/4vUrCJQnMKkKfDb5n4hfm/6JlE5RyU6xfI9n5KixcNmv2xvzHo9ymt3Jvfhn5HyYeDwWlm1Dns6Vbd670fvDSS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777569787; c=relaxed/simple;
	bh=zFB/iOZ19wQjJXG0nzOV7p8jbdcKKyA1ghYwzJk8F+4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mcnmHdKPd6HI5aoQ9L3c64HdRUzezNrPyc8p8rGeoOhu0064NoxfldOn8M/qETEzlrRte8TGdHN2q4sSHVDKx+0pTCExtHKbyxAiSkmDTxxsd/+5D9eLPF8lzpq9gXBDoeKVoIGtH0SaiX88fn/ezTGr468iqpiKzAJjd1Tu3rI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yol647O1; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yol647O1"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2a8fba3f769so5093515ad.2
        for <linux-hwmon@vger.kernel.org>; Thu, 30 Apr 2026 10:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777569785; x=1778174585; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8Fsgwp7UDQpeyb+JW2HoyU5IVU1CSyJAoqsfmKXtsW4=;
        b=Yol647O1gjCVwM1TL8PUeaplA4PMzJPBh/m3pjGDVmR6O6kS9bJMnmZgCmBOilEv5q
         9dXmTTdCFN/T8D4/HjAZkYlrK5BxgTxc/Eda9ZRFlhcI9mJYH69o8vaOfHYz+2iaV1TW
         lg9Fpw1JoQFv2Jpk9Ln1x8cboeAUIUODre1GVwGRhPYX3Yn6o0PpDcpBie7n/J/4cy7+
         PzgfOvlS05EesG22ra80vXy2765o8v1KUS0eghlHuhTmjz+F1f1oOuGKdHDj4Ui3p+bB
         kDHSCHr8lcdEEv8snxp0PPrMQ05hFt8979N+Qs6eiLtay2nVXINxMSDidtfS9XPwMUL0
         xdew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777569785; x=1778174585;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8Fsgwp7UDQpeyb+JW2HoyU5IVU1CSyJAoqsfmKXtsW4=;
        b=QDGUR1WLaHq/SQCDRx+5do/fHi+vlK7AjZSu+BZwRd2/Q/10XNccKvbVq2QuzhW087
         nQFV9X7pqQMAsofSSK3YBkxIVF2Z3VPIgLO1bgvpjgffn+VO55LVYxCgnbWLigF/8siW
         L1VlJ7aESYNhkTfgoVFhdFwyZndYtFqu8jL242KyT5biU2w4t/oAn5bd3gXCZS9VP0lc
         f8aDZ/CqxszSp0LSDaqDOICviD8Tz0pUPCtICFcnctKj43y9RXPhWdWLPQij1SFO66wu
         OfN0hmMJn4+/MuhEMW3KmXxPWgvNeDbKg4A1cxvA0TzL2blnwli0qKs6Sc7UvgJS8/yb
         gbZw==
X-Gm-Message-State: AOJu0YxzLHb6+0GLEQ7W80mRIiWC7b4AWhBUuGY3Ia/G52jZ7urfbxSU
	F7gT7epUrtsXU+fQ00kDlrcCk5GCxDDPveBa04wSmmfU9yqF54qfqD+i
X-Gm-Gg: AeBDies5oY3UCNpSggJZTf+wXQG//xxLmfL1q70MZ0q9zW5AMKgOqqC4GLP+fD33x1U
	XkMEvgxpHQU9IARxhym3axI9tB8UBzXxRaovUROqOJTOJq2hPl+X/GZhpaIQzRe9KiF+ZVb9WLU
	G9qtbBb+KQ96guPfzyBUlStEPd1jqSf9NIdr8itxyoIhQ80yL3L8K1kskBIIhTX5lq/JsdNM/IG
	p7EWRAnpb69ll/dPr2r/IhzcHoWpUTfdZ1UND46vdR3T/PfF7aPny/D8RboqzZBWP/lKrcZdYhi
	vo7da2hzMtyO0UgkTUWxviOaIUaKNHI1HCV/Nr9MvgQ8fp/qTr47ffIq3GhYIHpD8X0yL5e7mtC
	ZtNd9XE146Py1yiMertGWnBn6WAd63yZOnz0dfKjAY2JNa7EWzwNB6v0WliwZIJMFqke/Lwe0Ax
	t1rw3AN2jLaBjWeELVKsKOFZF441BH1ao1gmBJkXaXTJnlxE8=
X-Received: by 2002:a17:903:5cf:b0:2b0:7225:d2c0 with SMTP id d9443c01a7336-2b9a2504c12mr24809985ad.30.1777569785201;
        Thu, 30 Apr 2026 10:23:05 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9caa7e47asm1984265ad.15.2026.04.30.10.23.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 10:23:04 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 30 Apr 2026 10:23:03 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"alexandru.tachici@analog.com" <alexandru.tachici@analog.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Sanman Pradhan <psanman@juniper.net>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: [PATCH 1/2] hwmon: (ltc2992) Clamp threshold writes to hardware
 range
Message-ID: <693bf2bf-55ee-4985-b8d6-344d358e933b@roeck-us.net>
References: <20260416215904.101969-1-sanman.pradhan@hpe.com>
 <20260416215904.101969-2-sanman.pradhan@hpe.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260416215904.101969-2-sanman.pradhan@hpe.com>

On Thu, Apr 16, 2026 at 09:59:30PM +0000, Pradhan, Sanman wrote:
> From: Sanman Pradhan <psanman@juniper.net>
> 
> ltc2992_set_voltage(), ltc2992_set_current(), and ltc2992_set_power()
> do not validate the user-supplied value before converting it to a
> register value. This can result in:
> 
> 1. Negative input values wrapping to large positive register values.
>    For power, the negative long is implicitly cast to u64 in
>    mul_u64_u32_div(), producing an incorrect value. For voltage and
>    current, the negative converted value wraps when passed to
>    ltc2992_write_reg() as a u32.
> 
> 2. Intermediate arithmetic exceeding the range representable in u64 on
>    64-bit platforms. In ltc2992_set_voltage(), (u64)val * 1000 can
>    exceed U64_MAX when val is a large positive long. In
>    ltc2992_set_current(), (u64)val * r_sense_uohm can overflow
>    similarly. In ltc2992_set_power(), the computed value may not fit
>    in u64.
> 
> 3. Register values exceeding the hardware field width. Voltage and
>    current threshold registers are 12-bit (stored left-justified in
>    16 bits), and power threshold registers are 24-bit. Without
>    clamping, bits above the field width are truncated in
>    ltc2992_write_reg().
> 
> Fix by clamping negative values to zero, clamping positive values to
> the rounded hardware-representable maximum (the value returned by the
> read path for a full-scale register) to prevent intermediate overflow,
> and clamping the converted register value to the hardware field width
> before writing. The existing conversion formula and rounding behavior
> are preserved.
> 
> In the power write path, cancel the factor of 1000 from both the
> numerator (r_sense_uohm * 1000) and the denominator
> (VADC_UV_LSB * IADC_NANOV_LSB) to also eliminate a u32 overflow of
> r_sense_uohm * 1000 when r_sense_uohm exceeds about 4.29 ohms.
> 
> Fixes: b0bd407e94b03 ("hwmon: (ltc2992) Add support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Sanman Pradhan <psanman@juniper.net>

Applied.

Thanks,
Guenter
