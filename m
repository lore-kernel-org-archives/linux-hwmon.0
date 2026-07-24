Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB2344C4FB
	for <linux-hwmon@vger.kernel.org>; Fri, 24 Jul 2026 17:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784914030; cv=none; b=hXiEyoqPZAYcMTg+8VFRASFpKaYcVH45X4HO55+rdhOoxwhsHkJFipXhEKj06zO+BNB8hEMO4yCZqYaBAbLnYizfwSiUk8HIDKqSQeWjUEutCvD1DiGrrDUCka9u9/jFMG6HSIPbcnr+p76Kn01FBHwahAiPjvsqv4slWoLg9IE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784914030; c=relaxed/simple;
	bh=7/2f7PPDnywk//9ri199+3+jB563CTBa1UTHshm9lEw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I6OEXAkZT4RtW+7SesWnbCJvgv3vb+0xde5qcU8z7eA+7I2zZNUu3RGnEAddbx2SiPCDSYEtLe+DyyMOYk6yG7DO1P3XKY/KtYlTIfrGIxSk4z3ceJtkoP5LMtUfPJfFAif9KMdwh4p0aVC6hU8fu2Xy+rwMnB87Efcs+n3c9o4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kXTEdlON; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kXTEdlON"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8485bd28dd0so771076b3a.2
        for <linux-hwmon@vger.kernel.org>; Fri, 24 Jul 2026 10:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784914025; x=1785518825; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=U26xbPdFXYP/dp7KbvYNjIdHJ0Q5KZ3g0wD5029039Y=;
        b=kXTEdlONs7ay7JjThyas2ZWACxH6wqfR4gRleUJ/nom6Nx51Fm/FAbFGrDd06/KKqA
         r2izXs8Zuo4G52TDij254xKO/PWBdZcS7azvVkzPO+PkyD6E4phyNLrPYW42RcaI5bYp
         HLzVXsKH+VrXDAdF4dfGmPYIjrVqIwfGjWsYGhJFx61p2b+Ke51o3t8fh6j7Cs1cbZ9U
         QLuaL0JWl4chTY7Jr7gkQtsaieegNsoGNvpiEk/BL+RZXo6QcxqXKxtmF93xEkmoo2xq
         G9X5ers1gRDXeKvhAhMmIQB/R/SOHdevXENglJT7Drlmaw6eJ5TgRpWtFmEk+Q41g8Lq
         QBsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784914025; x=1785518825;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U26xbPdFXYP/dp7KbvYNjIdHJ0Q5KZ3g0wD5029039Y=;
        b=pNt9CCsSgLzim422vXkw1Wa0g9XLxcGMFavxqKSARLa6O97RdR+Pzfa1jGKw8zxsgL
         ZponOlhIwIoXaoUb4ZaiUNH5rk06kL+RW/XZMXZ7IQdYucHcaBJaHZ8D674UggMiZDEi
         shqL69yKlwE9NCeEGfLcehbgy8zrw7N15owaie+l55UPrktUpVa0FIEhqbHIgBAlwaMp
         9z1gryeIgpFPlCSV9MfPuRcuGD8cu7WlZZ0ZDpdSIf9uWAoC6wdG3wn8TjdqWHvmgObd
         nynGH8TN0cpzLp194c7006gxjkKjAlIcOrx5fZBC1C+K8RZhTEgCCrFSnVo1R7Rjfp0J
         SnXw==
X-Gm-Message-State: AOJu0Yxqa8ESp+kBtJK83XJFj8rEu+9h2oXX/Ky74jFLanlu0WP2IKo9
	8jdOjsaHpU4ozBjeeGqlp2gJLOQoWp3jvBAmXY+C3ZxKuKF0aooc+kZG
X-Gm-Gg: AR+sD11rpsc6IqelkPw5vAsTP4yTN22oLJpNOBZQp9YnPPeuyux4xWd/6Vm3UEc0Ukx
	wzt5EapNBlCIqr/dpKZUdwJ/Q/e7dSljC7amcP5Fl3GljGpSobrrF2ywtAzA8Yi4qvrghSP2Eb8
	fmrk9rJ7RtUcKqWhuz+VfRfssMMuAyIo2EmVK1pMKIvurVl+aNkM0gMFcMLy/xXXL2QxM9IxbO/
	Ah2NuQnr3nUlc6qY6B7oFxmNQhCxskbIFjnUJuvHLmTELJ7KCkIz1/s0tldQZN/wzWVtN/xNQ9e
	pMZ1y9ePj25y8PXwh+Fc6PWJxVQaAT7XlR4c3CBnMG6RMvywCjH7YXQBRRX6/uhsvvLfmYdbzbv
	Qr1cZj0Rjrp8LTWOwEOuZ9SOIJDHEn4Q+GGrje9pvVKtZJr4brrsBaSxfLWHdrJoZ03LGzE10v1
	EnWkQ+oIWBcNSsy3Y=
X-Received: by 2002:a05:6a00:4b51:b0:847:8f8a:a05d with SMTP id d2e1a72fcca58-84e2bc6b53dmr8461030b3a.29.1784914025173;
        Fri, 24 Jul 2026 10:27:05 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e53258428sm229838b3a.12.2026.07.24.10.27.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 10:27:04 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 24 Jul 2026 10:27:03 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"krzk@kernel.org" <krzk@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"corbet@lwn.net" <corbet@lwn.net>,
	"skhan@linuxfoundation.org" <skhan@linuxfoundation.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Sanman Pradhan <psanman@juniper.net>,
	Georgi Vlaev <gvlaev@juniper.net>,
	Dhruva Devineni <ddevineni@juniper.net>,
	Debjit Ghosh <dghosh@juniper.net>,
	Jawahar Balaji Thirumalaisamy <jawaharb@juniper.net>,
	Avadhut Naik <avadhutn@juniper.net>,
	Santhanakrishnan Balraj <sbalraj@juniper.net>,
	Brian Mak <makb@juniper.net>
Subject: Re: [PATCH v3 2/2] hwmon: (pmbus/vt7505) Add driver for Analog
 Devices MAX16545/MAX16550 and Volterra VT7505
Message-ID: <ff49ae92-cff8-489b-b702-9d8fb8dd4c69@roeck-us.net>
References: <20260724164919.247162-1-sanman.pradhan@hpe.com>
 <20260724164919.247162-3-sanman.pradhan@hpe.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260724164919.247162-3-sanman.pradhan@hpe.com>

On Fri, Jul 24, 2026 at 04:50:00PM +0000, Pradhan, Sanman wrote:
> From: Georgi Vlaev <gvlaev@juniper.net>
> 
> Add a PMBus driver for the Analog Devices MAX16545 and MAX16550, and the
> Volterra VT7505 controllers. The driver reports input/output voltage,
> input/output current, input power and temperature over PMBus. All values
> use the direct data format. Peak input voltage, output voltage, output
> current, input power and temperature readings are exposed and can be
> reset.
> 
> The reported current and power depend on the external current-report
> resistor connected to the ILOAD pin, which can be provided through the
> "adi,rload-ohms" device tree property.
> 
> On the MAX16550 and VT7505, the severe-OCP deglitch time can optionally
> be configured with the "adi,ocp-severe-filter-us" device tree property.
> When omitted, the existing hardware setting is left unchanged.
> 
...
> +static void vt7505_set_m(int *m, u32 rload)
> +{
> +	u64 val = (u64)*m * rload;
> +
> +	/* Make sure m fits the s32 type */
> +	*m = DIV_ROUND_CLOSEST_ULL(val, 1000);

The largest possible value of m is 7578. That means that this _will_
overflow if rload >= 283383960 because 283383960 * 7578 / 1000 =
2147483648.88, rounded up to to 2147483649 == 0x80000001.

Please add a range check in the probe function.

Thanks,
Guenter
