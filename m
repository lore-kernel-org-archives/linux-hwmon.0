Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2636923ED66
	for <linux-hwmon@vger.kernel.org>; Mon, 13 Jan 2025 14:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736778459; cv=none; b=h9gvyICGEMl9FKi2znLu+7tu+QvJbysq8q7wVDtKRNEyk18v8p9W73tg+Ms3raqgOzIcgs7Jw/XR+EAcHpUTjH33ybt82xH8ZdhmNUg6Ud0qA17whc/Cz9FZIPhfGmC/gOLnB+dtZx5GwQmzoBf1n/EmzDfTpyp5XGmq1d+78kY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736778459; c=relaxed/simple;
	bh=9COjNnYSCnP8zzlKxYLZwJwxNyQ7tz6+0SRpVTiaoKA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I4mRSqodzpOZjo31GmRR8sCbQLUSSoXBbY5BkfWFWZlFBw4KyFI/yM+MjR/KRcXdGCthrpzkdLD/VOUmaLJ99ivi3DWYiXFdyIqq/UKH8jpk8tJL93RHQ8+cSTfno//BHA3N3lCR653/ORkJwKIp0xDwnQ0b9yMkCIbOeVEF9LU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RTFFo/Nc; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RTFFo/Nc"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-54021daa6cbso3767973e87.0
        for <linux-hwmon@vger.kernel.org>; Mon, 13 Jan 2025 06:27:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736778454; x=1737383254; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9COjNnYSCnP8zzlKxYLZwJwxNyQ7tz6+0SRpVTiaoKA=;
        b=RTFFo/Nc0I67EKGVoQ2fVY+cBYZ1TOo4yfCkuQsrfXiUN/mMDNf6gKE+5xAGtzcZr4
         S4LQ/2JOuspC6iCEE6RPYMePSsDMdxS96zqIoZ6zkeHgAX5KEv6Zqj0banLzNt1rcx/D
         wtF/RTZoReuro9wI7XOMvVU/Ne7O/mmmPbcbo98ltio+r0vjyTtOeE24eW51Cy73M2pT
         GuDi+9Cv5csdLtMI+/KXAHpuBCDNKIMW6MSrFFVP1CBPpYZW2WFpNl5h41yd6IMDr15r
         OuY4IANWYquM0Ap6hYB2mGitr/D9Z8IcxjFNNLymHhIi4pgkp3NYGW/YJ/UoVlo7FMxq
         xnmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736778454; x=1737383254;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9COjNnYSCnP8zzlKxYLZwJwxNyQ7tz6+0SRpVTiaoKA=;
        b=iOeu9ZqflXp+NKUGhbuwc9p5bA9YctLlb6G75tMu/NZ9RVv1ALtkZeb90Hn8lNWLkC
         Mw7wRqlpXeVp/bbvxPtjRYJnT8VHxLTdbbT054nRGAoUdPcdkMQFg8W4Bmughop9WuuR
         ++QU3qD/I09hBTS25OavMz4UsJuwAPlyKlbRoEqbpXMtd+q/WDQPSJveN/On63leYY6+
         5sZhgAUvlGVcWqhdP7bgMJZGi+pRSKmfiCmS+Bwkul1nyXIAduL9LBG74T5pPt4fU9Nc
         3KcL/QBcKjV3mxNlRSPuSTu3m59eXCc+BKCYhsBpXjO+GOCUXbLcEfcb4Bd+HpDmez1w
         uoXA==
X-Forwarded-Encrypted: i=1; AJvYcCVFVgQVMfizYJO1nW6G+48wdgmgKFfw8TBBuuOisRmQS0g8SRgwHNLqDqqhwhhvViRXfEizDbuzHyRqww==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+VeZVi8x7pvna3KZXbmFihXP8POLGiJLT1CEfgRH3iVVFNFRM
	VQiM5hP6xNqH31Kv3npH1YyOwVMK3K73BU+BfBxKWwN3JRXVjualTJFj2wY6Eb59LqWqbZHLri7
	ihKBP3wvqk2WOD0AISZ9GSe0bYB4D4orhLZDuqQ==
X-Gm-Gg: ASbGncv81C+IBi2gk5sR2AW/X3GXiKqeMsf9w6VqqPNGHffLoWR+5yVJZE8Vs3C52oj
	x6V89aXM22bteppHuKEnCyQ2KU5LchivnMzI3
X-Google-Smtp-Source: AGHT+IFMYdQtB6thju+Ujdvh+g52bV07bNIc66J4gueu0snzInT0RR6j0JQTqPJk7Ksj973O3ybZVrtFDEZoewU6/5c=
X-Received: by 2002:a05:6512:3a84:b0:540:357b:2137 with SMTP id
 2adb3069b0e04-542845d1b19mr6514038e87.26.1736778454280; Mon, 13 Jan 2025
 06:27:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241227095727.2401257-1-a0282524688@gmail.com> <20241227095727.2401257-3-a0282524688@gmail.com>
In-Reply-To: <20241227095727.2401257-3-a0282524688@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 13 Jan 2025 15:27:23 +0100
X-Gm-Features: AbW1kvZkOrvrzVjSbv0zK88kVQwaAoATB6fakJzdiYtYFp9GmQSO92IIKLuVefo
Message-ID: <CACRpkdYxtfrgs=Y=OVDjdRu-a1q9qPBdm=yeHojOaCyN5ou0Lg@mail.gmail.com>
Subject: Re: [PATCH v4 2/7] gpio: Add Nuvoton NCT6694 GPIO support
To: Ming Yu <a0282524688@gmail.com>
Cc: tmyu0@nuvoton.com, lee@kernel.org, brgl@bgdev.pl, andi.shyti@kernel.org, 
	mkl@pengutronix.de, mailhol.vincent@wanadoo.fr, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	wim@linux-watchdog.org, linux@roeck-us.net, jdelvare@suse.com, 
	alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 27, 2024 at 10:57=E2=80=AFAM Ming Yu <a0282524688@gmail.com> wr=
ote:

> This driver supports GPIO and IRQ functionality for NCT6694 MFD
> device based on USB interface.
>
> Signed-off-by: Ming Yu <a0282524688@gmail.com>

This driver looks completely reasonable to me.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
