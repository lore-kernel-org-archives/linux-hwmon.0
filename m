Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8B2C142629
	for <linux-hwmon@vger.kernel.org>; Mon,  6 May 2024 10:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714989954; cv=none; b=nYkChtZHtlEEesDHq905tJJKmrhDnpAODLL2cTF9CyO4xkikSs5Bl0yO1EB2SsfsO8y4w0mnfw0Px+90/QzKj8mbVz1vImpBFvrZ5RAFUKLPi6iLmm0mEE4PWZgpkgbCBei4K185AzPhKS8RJEjl4lxCRn49o9HN6tgYY0XvCpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714989954; c=relaxed/simple;
	bh=EHVAhxJUUskPmEprZXUYYP2CVf27DfLU1+UviOggadA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZJLX3UGD0rxVh8v+rVcgMykNMTaFNtNnVA5azn1Rd+/TOq1sRqjYxqoktjs3mJSdGByY4nzdI3U88xaJ2nW2W+piLJWcfcwKf8nVXtTFsMxaL8qylc+3JLRMIfcv5ug5+LT/jRDIYmm0HOH3c1KBu7w/YHSXmS9REKe43KpsAiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=Px6qogDZ; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="Px6qogDZ"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2b4aa87e01aso1159769a91.3
        for <linux-hwmon@vger.kernel.org>; Mon, 06 May 2024 03:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1714989952; x=1715594752; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EHVAhxJUUskPmEprZXUYYP2CVf27DfLU1+UviOggadA=;
        b=Px6qogDZ74sIj76MnfPZEftB4i9CXxmbjl5Kai4YZc0EMZ4ZUlAY5NJdzZp1qpscCF
         DcAPfjSdBXEhfXaoCNBktYMzY1NPjvitKd2f5K1EHu69a4qF/x24gueo/qRT6mZQm4Mx
         g/3Im7IWCRo6YRR2RbYaLf9XhiYDE1b2kKqM9xu7RI5bGMLIYcnWO0Tt2jr5oLJsDl80
         gtrBQjHBliIE6b2vh7dNvngGrTX4NfbiaBzmfx+o0aK2TLi5XhuSgf4zB9UkNiV1u8QY
         UlqKXtsgHcaCHsCGP9C0a9D858+mTnh6FMZ855pdZdfK9VuMAgykIfjYpa+YUFHN3Rt0
         rsGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714989952; x=1715594752;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EHVAhxJUUskPmEprZXUYYP2CVf27DfLU1+UviOggadA=;
        b=R1FGuRhSmSDzWAMS6V4ixs5VzW7Id94H28JIpEI/vN+S1BgJUiPYTe+g0QwaiAV0MZ
         hamfytwy20ahKH7095E4Zf0Z6V0c7C4uNCuM6CsAi9XQWAfmJbl5fHCbJ7pBT2E1P4QB
         2GIZ8bGeFRJrWTe1whywo2PQfQA6TojaE3nz7ELjWIGV+ep+twt1ZecrzsAQWhP6IMhk
         /aQ6Ue5cBD/lEclKIiXnwqd5S3Cwxip/beJ87v3i57oTECWGRGe8NYO6/9PHshv/r9Rd
         nJkZWHG4cUxaRfKIpd2cgG15GgqdvzwY7KnXygO/yui+I6wpdMIj9V4+ZikfdvxTi/ro
         DwIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQF5q/Mzne5AmksnSr1t3zqKftC/jFz/0DsQaRq1n+oVX6EENedRyp/ycjF6dMPjqeLsKuq2ZDSBOidodt4kra3O51zQqvXM7p/XU=
X-Gm-Message-State: AOJu0Yx6rS5e6x3KU1UAOjM9LLuKCm8GssGtuL08bq3k0eeM4HIuzDBm
	quYvR1d8CGcdYVj9ctr5dgpgLRmf9AamhYqvsjubdOA+26defEaeEOeTelq3ILY9EWfVeS8EK6V
	yczWCzXG8401BOHHrXdF/guiF084KP5koeRj7AQ==
X-Google-Smtp-Source: AGHT+IGzw4nooSD+qK1cXQQ4lfrb6udoqefgbhSIEUdE+dY70rCPEtAtCshhxq/u9d9ODfZCzLMX/bw/b0jv3tpzoxE=
X-Received: by 2002:a17:90a:c505:b0:2b4:36d7:b6b5 with SMTP id
 k5-20020a17090ac50500b002b436d7b6b5mr8376894pjt.34.1714989951948; Mon, 06 May
 2024 03:05:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240416171720.2875916-1-naresh.solanki@9elements.com>
 <20240416171720.2875916-2-naresh.solanki@9elements.com> <ecddd7f3-fc25-4021-9758-b00893ac9622@roeck-us.net>
 <CABqG17hebvkpvxwGVfp0nT_YMrvgdkEqU2_XjijCpdtgU6C+1A@mail.gmail.com> <1294114a-4509-4c8a-a0a2-39f6e5f83227@roeck-us.net>
In-Reply-To: <1294114a-4509-4c8a-a0a2-39f6e5f83227@roeck-us.net>
From: Naresh Solanki <naresh.solanki@9elements.com>
Date: Mon, 6 May 2024 15:35:40 +0530
Message-ID: <CABqG17hamhz9+bZ44FNkoSU5MxHLB13OZWGgzhr6xdDjdb=2xg@mail.gmail.com>
Subject: Re: [PATCH 2/4] hwmon: (max6639) : Utilise pwm subsystem
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>
Cc: krzysztof.kozlowski+dt@linaro.org, u.kleine-koenig@pengutronix.de, 
	Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

+Rob Herring

Hi Guenter,


On Mon, 22 Apr 2024 at 18:07, Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 4/22/24 03:39, Naresh Solanki wrote:
> > Hi Guenter,
> >
> > On Wed, 17 Apr 2024 at 02:52, Guenter Roeck <linux@roeck-us.net> wrote:
> >>
> >> On Tue, Apr 16, 2024 at 10:47:15PM +0530, Naresh Solanki wrote:
> >>> Utilise pwm subsystem for fan pwm handling
> >>>
> >>> Signed-off-by: Naresh Solanki <naresh.solanki@9elements.com>
> >>
> >> That adds a lot of complexity to the driver. I am missing the benefits.
> >> You are supposed to explain why you are making changes, not just that
> >> you are making them.
> >>
> >> Why are you making those changes ?
> > Sure.
> > This is to align with fan-common.yml wherein chip pwm is exposed.
> > I'll update commit message
> >
>
> Adding lots of complexity to a driver just to have it match a yaml file ?
> I'll want to see a use case. Explain why you need the pwm exposed.
> "because the yaml file demands it" is not a use case.
The idea behind this was that this approach provides flexibility with
hardware routing i.e., PWM0 might be connected to Fan1 & vise
versa instead of assuming 1:1 mapping.

Regards,
Naresh
>
> Guenter
>
