Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A851A8F8A
	for <linux-hwmon@vger.kernel.org>; Fri, 28 Feb 2025 08:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740731311; cv=none; b=kTrxWa5rlOGtmI1RBHl8hzri9DtyMFEsi0kJPYIq6vN6N4z6NXNqfAPqGZTNo7xFbhjq4w3+wqvt9THd5wbBDWAd9uFZtc6EeetSHHfi5Vd7NbKXlf09n9SQL+wnF2nj9y9grYkCZwoCtpUTw8Pi9uClGm+fdFZSh7nXYeeoevg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740731311; c=relaxed/simple;
	bh=T9ulBbAshyDl3x4dZ9pDpzauMV0I7mHrJpwgJeJ/F6w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rR1yrQSRdJ2C6i4eSKY3L+zP1LX4DNP6HtjVmxf8EfiyS6V3TQV3Jv5MVL2PFS0GJkSVMv+jRo1Lu3+XPX8ey4BL/HhZmpZHttWlzNbVehKdHm3ALRKDjLbgjR52VajZ5VUevSN41gmXVCSXmBZbzkobcX5iJuasajTHoufuETo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TOzKChAT; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TOzKChAT"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-30b8cbbac91so9027431fa.1
        for <linux-hwmon@vger.kernel.org>; Fri, 28 Feb 2025 00:28:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740731308; x=1741336108; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T9ulBbAshyDl3x4dZ9pDpzauMV0I7mHrJpwgJeJ/F6w=;
        b=TOzKChATMFtDUv47T9CF6pLxrWOMTfVH/u2Cbl465n2Hy+TVRws48e43zYHO8+QffK
         2Dl1lyTocMZa0gBcXUbKyBAbtTxYQNfU1bvdKZT7FPffWRLBvRiBMxG4/9x5UucjOygv
         NjusRzJ8+u62lrYlA2T52MhBIHIvVGHithhfwsIMDXMA7AlkYDMJI2vuADgmOvLMz7Pt
         4Rp6SC6/RehLY32x4ULclT4MVhrhnGRc6XR/NIDo9fUxQaft4M9766ZWHMvXZh7OlniK
         HIxNVsGbi2kLU74N8/3svvuwyznLdBFTOxSRAHOWXBKneN9oS7fkMQIp+ppR57myLSbh
         NNew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740731308; x=1741336108;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T9ulBbAshyDl3x4dZ9pDpzauMV0I7mHrJpwgJeJ/F6w=;
        b=hNKW7EMhOMDRcruJUdPLP1HkI4vpd8onpmaPsXEVXHHG1YV6XbyxVhQ+ZmdS5VJlWE
         TVm7dTke+2ym0Ie9f924Qzmr4CbuPBax72Ns11FUPxw8EPjTk2kSyKzVGN0v3SJget/l
         BjY87ZhQV0OOejn3Ct7iEGo0giAgiIZMLj7i5beywRxDwOB5mwS8oY9XmJC3d7jnMOnn
         caObD+OPz4lD0/UYHZBZMgztwEWqOfO6fyV07sI/MiCyEW0OtzSS8wHHMZFsHNw6ZT4w
         rpCwxZglPuqAFoAm9DvRoMGfIHqlb5GvsMlGYNxG4CdXaBU9NHs0c52MY/eE3DS8Wly4
         0DWg==
X-Forwarded-Encrypted: i=1; AJvYcCVj3dY25gTpTQ1gG0QAWuzj+PdvIuC5CHzLQfSMr0GobKnlXcLZjJo9CD8keVbO+EajFIzxt2Ejdr3IOg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwLltKBsiMNds5fSqZ49V1eVNWnRPUguH8AAiyGcnq4LfqC/AIk
	mlVziKyrEFmo6YWBCc4cDCVCgEK3tGIAQ5YH7Gk2DeI81E6AL9O89XKDxHZDdavM05QoWfL4YdP
	i3v6rqg4m/SbI+PnEQEQGZrvJCV4BDangomxTBg==
X-Gm-Gg: ASbGncsi7xvOjv0Gy4NVkv7bpTnB/kLkw8niT1/gclGmxv3+0y3BRdkEZBnkjHIDJaB
	jSuC0F0P/hLX9aDESKEuPp8F4SlnqxEBbUyd7ZoLo+dOz66gKN3TmgD6tvn7vUEDFb3V2F9LqCx
	KKDcSsLkI=
X-Google-Smtp-Source: AGHT+IHW6S+ROk5t0PkuDeNohOexyGS0WQTsyLpxEm0u/Cb0yy+Ajbahy9tjZIMQn//VEPUie10+SvlVpoJnbWC1gJU=
X-Received: by 2002:a2e:9210:0:b0:302:3356:35d7 with SMTP id
 38308e7fff4ca-30b90a82535mr7451031fa.18.1740731307633; Fri, 28 Feb 2025
 00:28:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250227-ntc_thermistor_fixes-v1-0-70fa73200b52@gocontroll.com>
In-Reply-To: <20250227-ntc_thermistor_fixes-v1-0-70fa73200b52@gocontroll.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 28 Feb 2025 09:28:16 +0100
X-Gm-Features: AQ5f1Jr0WmX94vB3R141IPBrIS72Kx7MxXzXC6HKJVTA8RfcAOIAB4TGRHOkIms
Message-ID: <CACRpkdbtgd-BcKhSO+XB8yzbfAjYYJYA+NQs+WtmY=4N-bKdaQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] hwmon: (ntc_thermistor) typo fixes and incorrect
 table fix
To: maudspierings@gocontroll.com
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Joseph McNally <jmcna06@gmail.com>, linux-hwmon@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 27, 2025 at 1:57=E2=80=AFPM Maud Spierings via B4 Relay
<devnull+maudspierings.gocontroll.com@kernel.org> wrote:

> Fix some small mistakes in the Kconfig and bindings yaml, also fix the
> incorrect sensor table for the ncpXXxh103 sensor.
>
> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>

The series:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
