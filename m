Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CBFA316193
	for <linux-hwmon@vger.kernel.org>; Tue,  3 Feb 2026 19:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770146604; cv=none; b=IEd+UhEazOzC7GXUKaFENHuJH1whyuYNQ86U9VjHWOatOpbYqTL7afyPdmJah8q1Xt0jwfR2rozjaWEt0mBwLwtIJdwUVdR9w8WdpKnmQOcd8K8b5jRdnZt9kfungcp1BdzZQIpKlfvvNPgpnWcd+uB7Wsxx6s7c4wpS8hY3QTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770146604; c=relaxed/simple;
	bh=BDCB1SALk4Me/zwzwUZTjyplEh2ILYbpybKobLzycQY=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:Mime-Version:
	 References:In-Reply-To; b=glTT8of88aIpTzUdVraUMo5eZE+aWYL+NM+WTTwUtFnxKpCF4+j5MuwrsN3zDigTIk3tBR5ny4CvwCOE+6OWrUgdyJOEPnnoo6JxEmTKF6SQURrVHYNy+AnufprT82jUoqMuT212E5GI+fVfXbr3hTGcfrhjDTgEKCVjBZJLzYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ahmPH+vD; arc=none smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ahmPH+vD"
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-948bd416c7eso722464241.2
        for <linux-hwmon@vger.kernel.org>; Tue, 03 Feb 2026 11:23:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770146602; x=1770751402; darn=vger.kernel.org;
        h=in-reply-to:references:content-transfer-encoding:mime-version:cc:to
         :from:subject:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AId4z15pVKTCRZkeBkSS7rgRV16akEmG7WBBPSqgA/Y=;
        b=ahmPH+vD1jI/1wYRchihK2P9ZYSTOLqgXVOjXbVZKwuzzz5q47XcFa05K18D71ks5G
         uRKfsABLeomDSQ0DibC7w+Sxuw1PddqvrHn+agyMCx53TmYnt22+gWsJQcUAQDQ145uN
         f5UN9T6GzkrxS6C7h/fUseTrQJk/Lft2T+YCaS3QIuX1SQcDdMl5v79I5SAi1ii4C3qF
         TeSou13PUWm8MX5DLiwDPgFrxWPx9OupcIbNMElSPCVpq2ZNi0QA/vJgrtYrS09hCHHb
         Ge+uH40MMWFWUMhKE+Cw5CZE3cBmL7j5H3O5YKB5K1LX4nQm0pWfGfoSKEbpa1JAlp8o
         pmIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770146602; x=1770751402;
        h=in-reply-to:references:content-transfer-encoding:mime-version:cc:to
         :from:subject:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AId4z15pVKTCRZkeBkSS7rgRV16akEmG7WBBPSqgA/Y=;
        b=fuovqaTgPXcewmCjOdLJ1ieStaX5gBpgJQZqJcVvS5s2ITRJ1wWBq8WEKrYSAXc2kA
         pSu2jS2e0H4C8FSbT0FUWeHiPxDwSWArTCi0BfX2u6WjYS4w/ybjc09SQPHOSOb6akhN
         sQlKJkyOwKfxaL+G4PPOmGBkzAw30K4cSlpID5tpK45m+I7NG4y3WY2PXmZ03bQax7fP
         qlj2LW2XcixgXEif4K3duG0NrNN8yV0oPbgGvx1YpOYpDpaXTCKzLToltJKfp+bdQuti
         uoNctDtZfkey+Psl6+iQVVwlA2e81dLsiLrZKYhA6AX8Trb3ziAKlnw8ccPMh983lYSN
         z6+g==
X-Forwarded-Encrypted: i=1; AJvYcCX27ddsNqCk/+toAcxEenqNWx9SZcOlsKWdXwUVZCNNiEnNCUug31F3Mgt0nz0TF6aXgmYTn3NEO6ALdw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwcFqOg0712MsiXfFhhWXpfHSyrk3048bbODTUrZ80U9zGxL2YK
	jSASoTLgHpBMCPz+MxcAiMKQ05etYr0PKuSEYamI01GMCDwKIY1V/1Vg
X-Gm-Gg: AZuq6aLAG10j61pr4hKtEVoVWwPd6smzi4Z8uJHbFuT7a6k8anBt/rLABY6ePx5wr85
	+D5LWhdx6eAJqd79Y9OUH3x2+VenSFu/iCXSuI73Z8CIEoUh0es2V/7vdHk4k4jvZS/5elR4OIl
	yWi5MY5tX4fbO7DhplCINtTO3yLZ9h1D7jNEdjWhLWjcZPxO8yplKwsio/UEiKgrdxGcspa2aZw
	UMdX3IAYrZHR9/sR+1wtatHXpuxzET0wbALR7iVBsSUPNzM6PKn+8CisTbB00IAGG3YOG6laurd
	Pgrc4lPTXNj/wUk9OrihvmH7KRbWfzvOAUNl7zFBEBzMhyR/9SmALTmSiSUnJQAnWimXt6lG+8x
	RWcprxSY+P6SydLeGSskBu55uqeghR7QygB4uAIBeFSIUL4CNsRz9kElrV805bHd+l2wjHni0Kj
	M+kuoQSU0=
X-Received: by 2002:a05:6102:cc8:b0:5f7:f0db:363e with SMTP id ada2fe7eead31-5f9394eb166mr277392137.18.1770146602298;
        Tue, 03 Feb 2026 11:23:22 -0800 (PST)
Received: from localhost ([2800:bf0:4580:3149:c903:2904:3cc3:8b4c])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5f93aa69ce2sm104886137.14.2026.02.03.11.23.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Feb 2026 11:23:21 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Tue, 03 Feb 2026 14:23:20 -0500
Message-Id: <DG5KLLWBJEF7.2H0M48M16C4SS@gmail.com>
Subject: Re: [PATCH] hwmon: (spd5118) Explicitly enable temperature sensor
 in probe function
From: "Kurt Borja" <kuurtb@gmail.com>
To: "Guenter Roeck" <linux@roeck-us.net>, "Hardware Monitoring"
 <linux-hwmon@vger.kernel.org>
Cc: "Armin Wolf" <W_Armin@gmx.de>, "Kurt Borja" <kuurtb@gmail.com>, "Tinsae
 Tadesse" <tinsaetadesse2015@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260131152048.2299403-1-linux@roeck-us.net>
In-Reply-To: <20260131152048.2299403-1-linux@roeck-us.net>

On Sat Jan 31, 2026 at 10:20 AM -05, Guenter Roeck wrote:
> Instantiating the driver does not make sense if the temperature sensor
> is disabled, so enable it unconditionally in the probe function.
>
> If that fails, write operations to the chip are likely disabled
> by the I2C controller. Bail out with an error message if that happens.

Hi Guenter,

As I mentiond in the other thread, after applying this patch the probe
fails

	spd5118 17-0051: error -ENXIO: Failed to enable temperature sensor (write =
protected ?)
	spd5118 17-0053: error -ENXIO: Failed to enable temperature sensor (write =
protected ?)

This would be a regression in my platform because, even though the
register is write protected, I can still get temperature readings just
fine (even after the resume error).

--=20
Thanks,
 ~ Kurt
