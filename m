Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C002C2D7DFE
	for <linux-hwmon@vger.kernel.org>; Tue, 28 Jul 2026 03:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785208923; cv=pass; b=pt4TG4Jd8omCp+Em6KnSMR9OrHONa6a21bASCK2XTncZJB3jN9PrcVNksn/XJ9q0TmSHuw+MSnYux1hNKaPPSqa8fHXfO5rz8budq+3yBkQowsmi5B/JmWr5+YQzFWfv2ShwrCM7DYcVNgaGT3jPjGi/84Nqr7WY4Dsu4JDWwAw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785208923; c=relaxed/simple;
	bh=Ik8XWNx14HMmHxgerEJvinOrG7Nu0p+W7KV/S0G2+X8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E3cUnJHhsS3N51RKeDoKxPisiC9d26Zj10K+pXc8ZHTFZR5yFF2Y6zI+mKE+fWSokEQ+6N+QS+ptIZZiyBxdY6VRokxhafDYoEJf7tDFH30vrhZvo9itppfYuEzdUlozO0y5aYYVQiuhbMTq66IwG6DAFIv/w3QhuSDIgXESRqc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bPVDr+97; arc=pass smtp.client-ip=209.85.160.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bPVDr+97"
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-448b89f700fso3097899fac.2
        for <linux-hwmon@vger.kernel.org>; Mon, 27 Jul 2026 20:22:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785208920; cv=none;
        d=google.com; s=arc-20260327;
        b=DeFU4F8PPU87u1xIPNF5ZQbU+M1zSrloFYo6M8VMOzDFpKFNDYix6dGbx4e3XlWQAY
         iHxc0+C07Eww55sljnbrNrkllLAnEmovIwpA+5Kf01ck8DaTVvQHoOi8r/tlRxZkvodp
         cfjTdm/STUz9pWlTS6Pe2jXY5ZwqIXXX5+kXE8T+uUmllwBHXGj9s/P/QKgdxC+w3SjZ
         DZufqhLka3KyrvHjLEB8LV+dthaxVY8OP3DwPWim4pGLgnaY2lw5ex8eMOSM4FmDE117
         GUd7AAV7RbVEkgbnZburIXFDL/hO/p0TfScoR8mtF/aH6uYIA4MGjJRmHfZNxPNhelVT
         y2cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Ik8XWNx14HMmHxgerEJvinOrG7Nu0p+W7KV/S0G2+X8=;
        fh=5i3QuvtBmnuHVbR85QSou2a1bI0r/7wP7vgF+K2IZeQ=;
        b=GwRuOriAJ3mCiLknxMGdBcVRl+DpiBu93nE/hhvarW9fJ9/sNON7rWKGgLaRL5QBrR
         S+aQXTZZR7ujazTNDSXMMljeAQvy0nZCxzpqnCMGCSzOvnrEbWnMEjPkrhjIQvsXfX/+
         V2paNO0MBthoe9Xn/MfNuwnRa8x0nypQIEFS6pGzGqplTQXWKtJspeCMgLedAqY1d85O
         xhtribo80UclTylUkRzmv2HbfDPndkycrGgfnOtiGoS0PxHBLJ9Ewuc6bkCK124jEgPT
         P2u4sVVh+dgrhGg0UUZ7GcUypSQaDQ5OwrIDIIwBGSlRbunVnPG7Bv+95EYYVTWllUxq
         VsiQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785208920; x=1785813720; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ik8XWNx14HMmHxgerEJvinOrG7Nu0p+W7KV/S0G2+X8=;
        b=bPVDr+97Xt8w9k/bvOcIP4tno+Od0GqO0ILA0kXCxoQ7C0jctz+SFoHu3lndpTYTLc
         Nbkbp+VmYo0THdV8evH3AcyI2r3riOKyzD7O0vqpPKYIydkzdTGxrLi2LLtJaT6QRJUI
         pepT4Tt6lBMezscd7UQQPgKgazw/47i0M9CWYOL5h39QEoeap42ksmgHS+kcB4uxXJvS
         iV0O03Qv8vJy+RbV+8y6esRR0YDBDoqgjRCx/kEkQzBTtHlPPZ3cdlr8MTDw46phNvVU
         SfSej8NfrpmXT3lGhsnfA4v1MQ+Rrcr0jUzwLwcVUBQPFx8z0+MVbXETU2Z2F+YD5LHV
         PQjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785208920; x=1785813720;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ik8XWNx14HMmHxgerEJvinOrG7Nu0p+W7KV/S0G2+X8=;
        b=ZiGc1xnbfXlSBLpSWZsB5czpb7/1y0JENaXqubOVlDVNJOcDXKpGQk9yWQYF+4hbRn
         Nj1izbpC4y00ydMcGqvLVEYl86pIYzP6lbFpgsyqZ2wNgQAFcNW3CRY2OKYf6kikpddf
         xUr13rs8qpoa09JFhe8VS9jYANDnw50m89/Shj1yUccuHKP6oZaYE2gSJUL4Gnfu+HSp
         nPcbF9ZM6tDA6D5LXlwV6xBiYtqpDWkMosBxt/6VEFVRc26P3Ap0WRslnp73bqNhwstQ
         0ZRHbrtd/EpvS+zQjNg1y+t+WMA48APVQAyNB+vB55wixkq2OghNy7DHWC7zYusLAZOI
         NKnQ==
X-Gm-Message-State: AOJu0Yxw6vpVyIcNZA4GNIiRQakScOAWluzQtlxBJvMvBWmCQFG4XcAb
	sXj8xxh1HBUkazoTqHvHJXRSX8iXkZNbczo6cnRW1h/lR0pwhsNBd5pDbrvsT6DJt5PI8KMYvwu
	mC/uk7+q8egOahCsi34WrUKuDqovJRc8=
X-Gm-Gg: AR+sD13bozWcnQ9tXx4li+8VGMoXONL/1mp/TIF4JByiRNsZj/0fMM872wMIQuy1Zze
	dhpc+YVglOQhaO95iLmOz5swdiWQ/nqrX4MnmygXvIf5fYm2ZoCpTlwIxEy35J7kb4kOrxqyHw3
	uj8ArViJBNvTpoHKEhro9l3XErmwRODiP4oUVj5MBkpwC4XZ0bMpGQ8el5vQ5c+ScSur67cInNP
	GK0P+53RqOCt3Ab1Dtd+wbSNTilNLySkO3upZYmSajQgK96KmfkDV4yfVrmDtwcBe6UxNk+k6+z
	6oiMqhgyosXPpbtdhe4=
X-Received: by 2002:a05:6871:2316:b0:448:558c:d837 with SMTP id
 586e51a60fabf-4586cbb8717mr479845fac.38.1785208920617; Mon, 27 Jul 2026
 20:22:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260728-adt7470_thermalzone-v3-0-d4586478cdba@gmail.com>
In-Reply-To: <20260728-adt7470_thermalzone-v3-0-d4586478cdba@gmail.com>
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Tue, 28 Jul 2026 00:21:38 -0300
X-Gm-Features: AUfX_mzWrjQTB8lo_f1yOAHZ-Zd-6CRFAeENsJ4M1pAoIOVy5YxIU51oRTujI7U
Message-ID: <CAJq09z7QtzTxucEvcKa6zXjhGyuqDjpLHiD8A=EJXshpoV_vvA@mail.gmail.com>
Subject: Re: [hwmon-next PATCH v3 0/4] hwmon: (adt7470) Add PWM provider and
 thermal sensor support
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chris Packham <chris.packham@alliedtelesis.co.nz>, 
	Andrew Morton <akpm@linux-foundation.org>, "Darrick J. Wong" <djwong@us.ibm.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

It looks like Sashiko had trouble applying the patchset on top of
hwmon-next. I likely should have used a base commit that's available
across other trees, such as linux-next. I'll double-check whether I
misconfigured the prerequisites (it was my first time using them),
though b4 validated everything fine locally.

In any case, I can resend the series without prerequisites once the
necessary hwmon patches sync to hwmon-next.

Regards,

Luiz
