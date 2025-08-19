Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02B6F305070
	for <linux-hwmon@vger.kernel.org>; Tue, 19 Aug 2025 12:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755607026; cv=none; b=d3EDgO99D2I6ouR1gQLiywqKs3Gntbjs+vcX5/V5XEHaicgLHBS59+8SvLf9C8V+WpiaZ6EvxrICHtBjQSEuvGD93lSEuc1vnOLIaLpP1CTWh4WgEqFns+ZFUlVtjzbeVMR2tjN+ftHmHrcGOUYpBbKWR8dWg4S/tw4yRB4RXrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755607026; c=relaxed/simple;
	bh=kN8PO+yKJPtjoWwliqsS5UIbKU7Fz3RgcBRi7ndKNpc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Janft8dZTxReoejqoTHaLzNZKsf+4o6N215lCPpXyYZaNyXqqb7PgSbnXnxzOn4hF5LFUjkHejaI7DMG68pqKtnX14GShsKU8Dqcw245M04qaTGGpdJbyAzFW1g/kJgsl0SSwci2DzqIYBtfirMKyR4iJTAKqKQ6g6v/TKDGzzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BGCcAq80; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BGCcAq80"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-333f82a3a9eso44831701fa.1
        for <linux-hwmon@vger.kernel.org>; Tue, 19 Aug 2025 05:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755607023; x=1756211823; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kN8PO+yKJPtjoWwliqsS5UIbKU7Fz3RgcBRi7ndKNpc=;
        b=BGCcAq807utLEGokMXk9xTPzJ2PItinwPONnVrP7/PpnAc9Y7qVssUNIxhJvzDuTiE
         srgbAai4+DoRNGsxFpzoC/tVQYScCyT31uIKdMTCvgr3Mg8QEpQZe1GrBmmg2tCaeJD7
         Tol+Mhj9Pbh0FOs4NxaSE9I0FLiruWqPBAYM6FjSpgU8FGVBNAl2VKHfPtmwuqk/rTCs
         bFgwxI+Or7+bkUYpg7c0cGODH17Jh0Ejz5HK0uW1Wc+PhxLRe6RJIu9yPwSwzY0cwuXl
         R2umaS1ZoHl1FIvkS1GtJVZ1CJxyifpGvVFETgZE5ZhYh6TGUiuOeyeTl7GdSVLjJU7J
         5EtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755607023; x=1756211823;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kN8PO+yKJPtjoWwliqsS5UIbKU7Fz3RgcBRi7ndKNpc=;
        b=uGknvskYVDW69voB0UOqxj/CliwV/4YF7lPv9XSBdW0HLG0Y0LAJhuxkbSGAYLP1Uv
         8q5HhaAJTqI3PrZC2iYpuW1KcKnAQfrxeybgaqHbjYfuiSaAHYNN/Xxsh0qjO4QPChMH
         E999z47uXWLy1l/+W0ydGbpavd1q/kKwvT0qwRLnrV04z0uFk9AgLN0mPKiVr4Xr6tNz
         aug18ote4rtt8eVUCLueROZq9nqz0EPwZDsjoqOafaxcY5Tf+wMOQZyGj4/mA0v/BNp5
         JGAD0Du/78ASsAkAxFLH5Nig7C+TcFqZKuWu8Z7fGXiWNZXdu9BWJrhoZxQ9PwF0Da5g
         HSQw==
X-Gm-Message-State: AOJu0YzksPHboqKBBkNGvaOT4LZ4cAsQVtyVPsw98mqwrgkh/0PwsYCX
	CiqQci7m9WlpMAHGFqhNgRHPAcmEmi8n/BrkRe7wDRRkweTwwqb7J4dBATz7mJpUK1ml4ndMwLN
	Pu8tQY4E9TyQ/WL1TiNVIl+7NmcHeCkWixOWjzDzi05mH5uN9NKIjdqWM+A==
X-Gm-Gg: ASbGncu66VJ+frTq+EVMuW9hWv4nSPp6GwLfgtM2YPbvRj32yuSBtdrEftHhREpjYFg
	TqrJnr5TGlhSWRBzX+rQvh2WUTGfg9c/igrh68oix/6X3pK+f21i+NbKmTuFpkZT62ljiPcaeJE
	c7vJdPbACLR10n7Ic6cqqrVMpztIoN8My6iYffBnIUyP0FomF4VGA/EyA1lLnYGnhvasQ1Kkz6D
	/o/s0bp9eSS
X-Google-Smtp-Source: AGHT+IF60h4WVMQ3B1KL8q6jLUasLc8BlggUoJR4OlVpazMLoejvJn79GNV6qXgLhSQX6llyrVFMUqcEDHaass7Rvi4=
X-Received: by 2002:a05:651c:419c:b0:329:136e:300f with SMTP id
 38308e7fff4ca-33531447abemr5458501fa.13.1755607023091; Tue, 19 Aug 2025
 05:37:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250814-ltc4283-support-v1-0-88b2cef773f2@analog.com>
In-Reply-To: <20250814-ltc4283-support-v1-0-88b2cef773f2@analog.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 19 Aug 2025 14:36:52 +0200
X-Gm-Features: Ac12FXxreBRNMQ-2ir2X10nBf7B7qy9Abw0x-1rD12XgK0TSMm41kUIDeST3KoY
Message-ID: <CACRpkdYWNgU8PxVaxDe3F6Cbb15J5cgEV1-kgDooOHdBoXXs3g@mail.gmail.com>
Subject: Re: [PATCH 0/6] mfd: Add support for the LTC4283 Hot Swap Controller
To: nuno.sa@analog.com, Jonathan Cameron <jic23@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
	Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 14, 2025 at 12:52=E2=80=AFPM Nuno S=C3=A1 via B4 Relay
<devnull+nuno.sa.analog.com@kernel.org> wrote:

> The LTC4283 device features programmable current limit with foldback and
> independently adjustable inrush current to optimize the MOSFET safe
> operating area (SOA). The SOA timer limits MOSFET temperature rise for
> reliable protection against overstresses.
>
> An I2C interface and onboard ADC allow monitoring of board current, volta=
ge,
> power, energy, and fault status.
>
> It also features 8 pins that can be configured as GPIO devices. But since
> the main usage for this device is monitoring, the GPIO part is optional
> while the HWMON is being made as required.

This main device just screams Industrial I/O, IIO.

(I think it's fine to use an MFD core and split off GPIO to a
separate driver, and I suggest maybe you merge MFD and
GPIO ahead of the main driver.)

Jonathan (Cameron) will have the last word on it but IMO this firmly
belongs below drivers/iio.

Perhaps not in one of the existing subdirs there but then it is time to
be brave and create a new one.

It will take some time and consideration, but I think it would be better
for everyone.

Yours,
Linus Walleij
