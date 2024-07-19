Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 661AF2C1AC
	for <linux-hwmon@vger.kernel.org>; Fri, 19 Jul 2024 22:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721428404; cv=none; b=liJMyQSZaZWhmqsm1MoAwz0Lkpi+xzgffKa2D0NxOJtTypYh9uUiOs+O/5nxF1ijJe5doez9dhN4HBuHxz+9FyiCK4t2UKcRhrtx5PHMQVwwrV4lkv1qPAdmVOmP+JMex+cWCr6eYJtAjxXhto93jb5NZAqEyHyWOzs80WbAp48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721428404; c=relaxed/simple;
	bh=6TKyVUfVj+CJ3k1Sx8U1+J2PTqnTWYT2gbAfqv68asA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uINvvvcyu47ELBZcGJBN6QiiZW8pGmfP+VxUZGTsWnpcPLKIWs3dCkGpnlr+OrVWS322utP7eFviKhaKoUrV8By9c9ihR9jijUXHVP/V0u9ZNeSE3xODJcfj6R+2f1fUqYU3eoQFoSsjg20Iw2bLR3RMWrKEhfkobhElAJq8f88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=emFYENNv; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="emFYENNv"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-703d5b29e06so1155822a34.2
        for <linux-hwmon@vger.kernel.org>; Fri, 19 Jul 2024 15:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721428401; x=1722033201; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GAat9gPjggjnmEuKBl3Xq+6G65KAOiFMLvJZgqVVjRQ=;
        b=emFYENNvq9RiR2rJYgB7i8IWuiMtJVvkoKQuwv4n4Wl5FTeV/rqqqV6NA5/8Phmwuk
         z88YGqXpJtKC4tIwlvGLkXrB3rb1x9bZ4lXqlwQewtNBQpCj+Nm6fdQ6SUr9nDUnI8PE
         eAif69FZ2xjh54roJ1zw2E46oFxBVzp/rCz3HdzD425gVUixevD+PgPhkDXRBQb6k7kc
         RL8+gVWJocT14Fl3yUYNWiiSwJJ+8/YPKfTDe8SfJkyHIVbfjNPfkCF3EGg/b9o7nMj+
         vlh+5ouY3Z8/fI0Eupzv/4+Ih/+31gcSBrbmEeEZj9y1v4pG1Ts013cm0ON61fsRuiui
         qYGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721428401; x=1722033201;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GAat9gPjggjnmEuKBl3Xq+6G65KAOiFMLvJZgqVVjRQ=;
        b=qpoyBnPkoGr8EOUNfzqgih94FjjUqWYnsXrrUgiiJRinzi2H/Q8YKKTpVnISBfvdYZ
         0XyF7KBPy6U40LF1ChK8FBLskI7mCa3UEahWzRm0WmuOiPF746hD1koImaG7BbIjgTtl
         h5lrlNMPBExkCLTZ3lzU4rrolQYEftEPOEfu1nHVnIt0jvN/wlFCVzlK8X+q+Q0k7HET
         wE8ingntSpZ9hcFJhmj/qWoEr0adLvzTRX4vRWAd4/RMprMhfGLB0DqIjRPMNmZDW2R7
         AGYZ1yDHTGgeJoCp98RtfcFbyiu4URQfNEKjQKodt/HsWP0PVKvWQmjmpmihUojJaWZT
         6Llw==
X-Forwarded-Encrypted: i=1; AJvYcCUQZI02wGxlk6Y+KVNPb512SYBYxnTiQ01X8DbefM1NToiNLOwWO65i4NB/yU0n1bAYQkzUGRQ4CmeflEo+HgtcyJSEJBXFyBJKxwk=
X-Gm-Message-State: AOJu0YzyGAyPnYQCO5oN8IdJOcW6h3b6SaEm1QPSzJLYh51GRM7rfjmw
	DakjcNxW5Zyx4uvzmJ7yQVvRSZc5S8e4UC8SSGvmBIhG9Wyi2W+ENETIfCUwrlnVIrnZUWukwtZ
	7
X-Google-Smtp-Source: AGHT+IGgSsW81rDhy7H1WaJVznxb4wLFtRoDqLh/AYCu7rlDLBXMUa33V7PlDQOTf3fh9TsSHAemGQ==
X-Received: by 2002:a05:6830:270b:b0:703:6ec7:64e1 with SMTP id 46e09a7af769-708e36cc533mr9781441a34.0.1721428401392;
        Fri, 19 Jul 2024 15:33:21 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:4528:a9e:1eaf:80c5])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-708f60d6c1csm488766a34.37.2024.07.19.15.33.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jul 2024 15:33:20 -0700 (PDT)
Date: Fri, 19 Jul 2024 17:33:19 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Eduardo Valentin <eduval@amazon.com>, linux-hwmon@vger.kernel.org
Subject: Re: [bug report] hwmon: (pmbus) Register with thermal for
 PSC_TEMPERATURE
Message-ID: <d88d5476-eec4-4e0c-8375-18dcc168e31e@suswa.mountain>
References: <abd89e07-3a61-408e-ac2c-67ec0605f12b@stanley.mountain>
 <cddb4e8e-4b4d-48de-a02d-4931c373b47b@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cddb4e8e-4b4d-48de-a02d-4931c373b47b@roeck-us.net>

On Fri, Jul 19, 2024 at 02:10:16PM -0700, Guenter Roeck wrote:
> >      1373
> >      1374         /* temperature sensors with _input values are registered with thermal */
> > --> 1375         if (class == PSC_TEMPERATURE && strcmp(type, "input") == 0)
> >                                                          ^^^^
> > Unchecked dereference
> > 
> 
> It is only NULL for PSC_PWM, never for PSC_TEMPERATURE. We could add a check to
> make the static checker happy but it won't make a practical difference.

No, don't do that.  Just ignore the warning in that case.

I'm running with the cross function database, and in theory that should
have silenced the warning.  I'll investigate.


regards,
dan carpenter

