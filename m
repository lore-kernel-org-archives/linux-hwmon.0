Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EC66146D46
	for <linux-hwmon@vger.kernel.org>; Mon, 22 Apr 2024 10:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713782367; cv=none; b=oiddKANuPyYqzOGz3zMN7Ub5VmNynpzjc7d0Q7rjM3TFctV/wmfzdqTVMWRlamLXvluasl+bxsW64MLp3UgbXKrV+/RoGwUnxQ40v5CktHhEJWBuA74vLNAhH3CdUkfHeHby0u4/4+QFIYRqO3MeGaRQCpUXkRVCaKlAIip5H58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713782367; c=relaxed/simple;
	bh=tw/ruLJw2IldqcRfR0Fp7vfH4KWxGbJZHGJPXcevGa8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KbUHaATjMD7sSwgYlkXhzlrojGjzYqB6/ygY2qLiaBLsWUyf6z2fZMzLPJJJhsQLggXde3Bz1rF/MmcvUr3BKFpAFfG2qHMVMXEaGtnsYTjdyRdaBRpAJMyZ2uiKXgXAJgeQJr2SesbGSf5VaJBwMGHGqzDAaBIRQqXJEnrC6EE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=akLMyIq0; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="akLMyIq0"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2a4b457769eso2649528a91.2
        for <linux-hwmon@vger.kernel.org>; Mon, 22 Apr 2024 03:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1713782365; x=1714387165; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tw/ruLJw2IldqcRfR0Fp7vfH4KWxGbJZHGJPXcevGa8=;
        b=akLMyIq0VrmEX1uWnZRFeRCkeK6CxK4TRVjz7Od1V/J+5R/A+t/skq82/ftTR8wZvJ
         3zN70hoZS4wehVpcCYc0HMG5e3aM8qzsIi8SW8MgmpJTB9jDBqwk0DgcyKCu8ccbiUw/
         Povf/u3YFUQ9qsQLU3+F5unFahS3i1DjCuudQTYcmYgVJrwCkkiwr0gAh583OnfYT/rC
         /1SXO91pbY2K1uRdXtyWMGru2PPc+bYY8bANYm2RO8vfvLb2Wk024raVKVKuBWJYg1Q6
         Y/oLLlyM8i/tdXEFDQmJyabeFWZHagYuK7sTiVs0egOzY3iDvCA5rKi1rOTtN+o2f6mE
         27IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713782365; x=1714387165;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tw/ruLJw2IldqcRfR0Fp7vfH4KWxGbJZHGJPXcevGa8=;
        b=brdX2JbFj/qBgb1BtCyIp7r9E2WsDvBamHJ2OU2D5iWBSdJHdz3SWfPAr1qgUlZv99
         jwgceMbF+nJOgsE4lEQ7IscVQ/bgQWmy3ng2ulPzxjm3ot9KZTP1x/excCRJo3KtKaFn
         rtUufAQg/wENDT/i4MvH+MfcuzK7BNx+Khk7phkal1/jOKANkPB2bJlFWreMpLH16FbY
         KTknOaR0nZ3QbNH5iwsFk4JEhxhbOi2WhSdhmGSa2ScPXpSU/apJkqnGmjM9KErWevdg
         rgNoI7eNy/PYWuh5i1DP0rxMI914CcXT0b0RPNXjvLA7NqNM5wQHoAkboeH9f5Po8871
         /3GA==
X-Forwarded-Encrypted: i=1; AJvYcCWdm8ugsxSJboR8OFC63STR/TewIVhEpTADyhkT1weq33eRsGz+LyBmWxPpIdrWK0ZzeSaE7hSWNiIUY22QUmOnVNH30zwLvvp0NeA=
X-Gm-Message-State: AOJu0Yy1tsybph2iHIfWbdjH4VzAs+LmUdcNLOfUhtQeYe+gKPexPBVZ
	4IZTe5d8aksV59VGA8UcarAvRyAf0KjtiJFLSMuOVa45X0tgSEdhv7w7WiZcZvg9Tc/EEnk36qs
	UeW76xtcdx+dFV4lxG0fnY68eSsdJa/UyaCgnew==
X-Google-Smtp-Source: AGHT+IEY8we/dWrYRB/yxAUGuYNMNlMwrdJ2+M3MXEXX0Tp8j2MD0fZjxDax1iTRPLWYc2bGHOUcREPQl1a/jn+isOA=
X-Received: by 2002:a17:90a:4294:b0:2a0:3dc3:8a8b with SMTP id
 p20-20020a17090a429400b002a03dc38a8bmr6662584pjg.47.1713782365451; Mon, 22
 Apr 2024 03:39:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240416171720.2875916-1-naresh.solanki@9elements.com>
 <20240416171720.2875916-2-naresh.solanki@9elements.com> <ecddd7f3-fc25-4021-9758-b00893ac9622@roeck-us.net>
In-Reply-To: <ecddd7f3-fc25-4021-9758-b00893ac9622@roeck-us.net>
From: Naresh Solanki <naresh.solanki@9elements.com>
Date: Mon, 22 Apr 2024 16:09:14 +0530
Message-ID: <CABqG17hebvkpvxwGVfp0nT_YMrvgdkEqU2_XjijCpdtgU6C+1A@mail.gmail.com>
Subject: Re: [PATCH 2/4] hwmon: (max6639) : Utilise pwm subsystem
To: Guenter Roeck <linux@roeck-us.net>
Cc: krzysztof.kozlowski+dt@linaro.org, u.kleine-koenig@pengutronix.de, 
	Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Guenter,

On Wed, 17 Apr 2024 at 02:52, Guenter Roeck <linux@roeck-us.net> wrote:
>
> On Tue, Apr 16, 2024 at 10:47:15PM +0530, Naresh Solanki wrote:
> > Utilise pwm subsystem for fan pwm handling
> >
> > Signed-off-by: Naresh Solanki <naresh.solanki@9elements.com>
>
> That adds a lot of complexity to the driver. I am missing the benefits.
> You are supposed to explain why you are making changes, not just that
> you are making them.
>
> Why are you making those changes ?
Sure.
This is to align with fan-common.yml wherein chip pwm is exposed.
I'll update commit message

Regards,
Naresh
>
> Guenter
