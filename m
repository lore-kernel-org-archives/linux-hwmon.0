Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794736046;
	b=cWi44ytIQH8Svu5Tl1dj9AOMiwH3HfqwgCtXBiGaRoV1wK45LGKaNyg0irYoow4Hcecl
	 6SaSrvJuKRPvfwIUVh/4QHEKRacWkm04JGAtT4iXExIW8Ny2Jw+V7PHnnPhie2sM2of72
	 1OngS6BGcGi2sDo+paH2fd+CZPLZWuMXo0gHyP59gKAzPsdS4DhfoJrRHnad01bqmJTLg
	 QMzb9MrbJNDdVhnG7GfOrq+UTRTtqZ46TADPhz69IBeDAC9t4SuLbKP0FpSJ/eb+7dosc
	 2ie9tWOmoT8IWyrivkOQpx4JZ2hFqwEHJ7aUc8wxyjetEl0f81AoyR/71RhBdJ/wj4w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794736046;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=VfHEYcb2rNE2iyrm94zQquEkhGNgVZsRO7MYguIDjP8=;
	b=GZKUsYmfPB+FbXwIgfD3jrqTLPFS2N5vcUqaQkhxokRMgxq0uUCxLrpZg7zWqEK2t3yN
	 kMP2YI3uJxGsCgHXI9NgS2WqZUEwKhFRQ/2ICJj6C360R9tkVPBTsGCLnKiKDQgjwE2B+
	 8aMZHqWI/5YRsW1UWwsIJA1XD0yAkb421TRyeCfbVYRygWqg0J7/R+vRPuax02J0irlgG
	 x/6enD3Cw3Q8RC5ts3jVrQ0mcUl5PXPMVr0EVOscfxULVisX5lRdA4Z5XL88DQjt6WvL6
	 5IdZu84UMFz5cHxDzarzeHnwp1vHwjJ9c051LmZ8IQ8aXDwX/U9x3pR//Z1id4TNY/A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ULcSl0tj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51CA1606A31A
	for <linux-hwmon@vger.kernel.org>; Sun, 15 Nov 2026 09:47:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51CA1606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ULcSl0tj
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b807aab44fso327628a12.2
        for <linux-hwmon@vger.kernel.org>; Sun, 15 Nov 2026 01:47:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794736045; cv=none;
        d=google.com; s=arc-20260327;
        b=RNJUTOiaFa02xQbjfdp2LpipzS2Eu0eQ66/d3cTmXAiFkH70A4wB+INR9105M++TpU
         7Rb9l9r7hNURfV7Btsnzhpw4PndXYKiPrGA/a5JyaTiFKYJGynyFr7qQiVm7VWAV4Rz4
         kKa84I9Ii59RTvyBjhjaym5e02xPk/GIXgDh/PKSUbR1HvumWpIazIrngMu/kupYuvyv
         lRc/umAoLGGVTdm1HSbH2g3/+E9choDN8KbVKWJfxM/hVYlmrQ/zUs2WcQ61G5aI4GMR
         L7fK7/Mzow28TOFN8GoQRs5hapw9mcliLFxtAj4sAAGbjDtg2+cXAu/hAD0Dh/0eYqcK
         RzFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VfHEYcb2rNE2iyrm94zQquEkhGNgVZsRO7MYguIDjP8=;
        fh=RW5Ze/TGrojnnBrndGDZnkKxCQDV5P+Vff/mIlxQrqQ=;
        b=JkTLkfOSKpaHOCGBh8SGbce/6K+bEugOKEHpxXg5WC5Z6wU+gp3IKfF2j8P/VSQjZY
         6fHMPGuycOaYUzAc1SmlokOLw24ICjYVpdHF02iVOhiHwlOpb2ShYTTzGTzpqRe7YOw/
         d5TCH1F/ptH+vGu50vTuxAt/Edvv58n3GGPeFPEOiHpT/EtoRS3O6F/DpOv8GSBOUowy
         v/cjtC9CIHptPVyhNsyIbtCPapg6S8vH7otsrgQA4aM/c1+kJBJ4bgjOZp9vI2bsZ5YY
         ujAtaGfPzIJFUGcSMN130ngukvBdkTO/Ou0OEJa7w074AERcT4R10bxlMC+wUNLL77mw
         Zu8g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794736045; x=1795340845; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VfHEYcb2rNE2iyrm94zQquEkhGNgVZsRO7MYguIDjP8=;
        b=ULcSl0tjXJEeZizN5NqOx7g1xOkL5/p3DgK9rLhn5627DhSN4mIwoV9SIny66Hap9q
         AQpN0gv4ZOs66D+BkwP264e+8bLRMf1Iq5chGtVz5+sOu68ZGxQjSCVPowfA0dy7ca5A
         JlJOfHn2aNQSa/jenvTLj3+qk3LhHZEnWvERYhDUcIzvGioqHC5TPLu32QoNpgxDZgon
         KNHSnjfV25+rIf7/4I2NEIr5MFM9xH23Zh6pV4bOZXDLbjINyX1dgB1+OyJIy8R09gRB
         ZEXxKFcY7SWTMGuHOgXLda+qhot3falzJyzaM8YnS2Av7PPg0p4tlzK0Sc718MjYdLsm
         dZvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794736045; x=1795340845;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VfHEYcb2rNE2iyrm94zQquEkhGNgVZsRO7MYguIDjP8=;
        b=vFwvWS/duVtbRMVngsJ6YU6caPxw81gRPEwsYJAXqVqoCMxBef6s4L4Q4VJsKgPjrK
         dXQb24geX74UAqu8JShsV10TC4j7xlvLOHjCxOQXT5KcU8DDoVkk5tRvG0eBZ15NYH2W
         eKOWiqPHlvtdesgfrdaz6g+MGBvyxb4l0TOMBB69yQKV/mjsJy9bJpbq4EobkFbln0up
         9ReJ4iZh2yaUr5+uOJozp+WwmgSDlgJZ8dK5bEhFR9GoApxr9mISi2RJ+HA9JlOl6IjD
         CtGb92elA8HyinsCqe+N7ZQeSUTLfUwoYZGi6Bc4LhYK71bk5Bn6SeMaC9LbdRUXHC5Y
         T1oQ==
X-Forwarded-Encrypted: i=1; AL+hErGdJPurp8Oo+tFwjyhLFZLXfmLynZ/9PXf6D+lweKjbw7pHggxXYSgiyOpII+HkPyJR9+oHBEkErXhr/w==@vger.kernel.org
X-Gm-Message-State: APuU4Z+UVtysDdvA5z9ZuVYct2E1Bri/mUyETxVqWKPxjaiQUvWZBw48
	kOV9Z1OXL5+zEqv7kPx+pHCQYgpEfO13dSSCCeShjTF9B94Zf01qOtQkcNt39E2stFhEVPImKsX
	WEiIj5MojjPx6VXMj0hOr1xU875EwmPk=
X-Gm-Gg: AYBFou3RDlRzTIGrPQRHcEhtg9A8S09dupM0sPfblSpUi1wcWCUBw3B9ex8TPEvolkS
	biLpETcDfKV5W0VyKNtJbxFtYVYsBhCO7HoK429O41nL9gQ46Ev1N08vKOLv1WmYxaN2gazi+nF
	t2RtwofIqLUf+kf53lxz8ID7BNJI3JHdpFgaMbQ38U2NbhfpovGDaQ6sHIM5JPzZcQvh2ej1oTE
	Z4J+laFcY74KFqHT+r/Ogx/aj8AfB5Btx7Olni5+b0ogeL6FwVsdw6CeZ0SlsKDANm5ipbTEiAw
	SUk3h1NfK6msNxDSD3+btaqn7M+1gh+IXNd4RFyJrFOrz9f57IowetfYOrfP15BvT8j3a9afOZA
	vz8p/ZRpGGl6pYoYkocWv48KNNp2UrqVvlc6bmItgfxH9/EVKEVFbbCw4i7eeuTAd62/VI1RheW
	6VVpCzVYZdWPYohb/KWKDqB0U=
X-Received: by 2002:a05:6402:4010:b0:6b7:f9e0:a5bd with SMTP id
 4fb4d7f45d1cf-6b7f9e0a75bmr1572741a12.23.1794736044483; Sun, 15 Nov 2026
 01:47:24 -0800 (PST)
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114-marvel-env-v1-0-890328e4b7e5@gmail.com>
 <20261114-marvel-env-v1-5-890328e4b7e5@gmail.com> <e8ffe364-5c98-4987-b6bd-c263122aeae8@roeck-us.net>
 <CAEdQ38GEckm8oU9pmg_t-_EC85brP4ghWAE4tYBNEvF+gcqMKA@mail.gmail.com> <3f6d66cf-8a1a-4074-a234-dfe571622aee@roeck-us.net>
In-Reply-To: <3f6d66cf-8a1a-4074-a234-dfe571622aee@roeck-us.net>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sun, 15 Nov 2026 10:47:12 +0100
X-Gm-Features: AclHuK-agHSxMvaTLWSNegaTGKIV9gehw4JdNQIbbkxCi9Nu8UmTXM9oBoYmDgc
Message-ID: <CA+=Fv5SAtweSW61Y_N5_k0ukEektque1gY41LKSjbO0R_4JRnw@mail.gmail.com>
Subject: Re: [PATCH 5/7] hwmon: Add driver for Marvel AlphaServer
 environmental sensors
To: Guenter Roeck <linux@roeck-us.net>
Cc: Matt Turner <mattst88@gmail.com>, Richard Henderson <richard.henderson@linaro.org>, 
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Nov 15, 2026 at 4:46=E2=80=AFAM Guenter Roeck <linux@roeck-us.net> =
wrote:
>
> On 11/14/26 18:50, Matt Turner wrote:
> ...
> >>> +``in[0-*]_alarm``           Sensor is in the warning or fault state
> >>
> >> Which one is it ? Is it distinct ? A "fault" means
> >> that the hardware is broken/defective. An alarm means that
> >> the voltage is too high or too low. A faulty channel
> >> should not be reported as alarm but as fault.
> >
> > It is always the voltage being out of range: Warning is the reading
> > outside the warning limits (5% from nominal), Failure outside the
> > failure limits (10%). Both are reported as in_alarm in v2. The limits
> > are not in the console's packet, so they are not exported.
> >
>
> This could be reported as inX_max_alarm and inX_crit_alarm.
>

Only if the direction is known. "Outside" covers both, and in_crit is
the critical max (Documentation/hwmon/sysfs-interface.rst, in_crit vs
in_lcrit), so an undervoltage would read as too high. Matt, if the first
threshold in the packet is the nominal, as the comment in 5/7 says,
comparing in_input against it would pick min/lcrit or max/crit;
otherwise in_alarm alone is the safe choice.

Magnus
