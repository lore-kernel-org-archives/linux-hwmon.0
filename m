Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3082288CBA
	for <linux-hwmon@vger.kernel.org>; Tue, 15 Apr 2025 08:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744705884; cv=none; b=eyTLAHbnL0DUV655N5epPzFNTUpStTX5JbEcj1x0yo5Qqkhv0RLNP4f9d8w3gO2siXc0+o0aah5Ka4Y6Gxt4K1a8NunmQExPEaD16ZRYGflJ4+FuSpYVWhk3hKH75gm16JZWzPZg8D2WN3exkskSxmr4jjSRaxMXZrTEKR4jkeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744705884; c=relaxed/simple;
	bh=AGTQ61IkoM056vi86kWymU/PNLuo6lfyrF+/X5Qi5ps=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=USWOzLqdVqnqqW+tEUSV0u/P33FtPIUV695fGOVDw3FUxDDYd6z7JYkms9HCe9xMHUS8c8v1c5ZcaAtKTSxpl8ctYi5RGndp/ZCpZyky/KRZEWO6nZ8zAffH7szZLX8qwMrXXT4phQvYN6TXKMHLpXjsCHkEUie/4E79bYo7OCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w4HB4EZL; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w4HB4EZL"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-54acc0cd458so6030228e87.0
        for <linux-hwmon@vger.kernel.org>; Tue, 15 Apr 2025 01:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744705881; x=1745310681; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AGTQ61IkoM056vi86kWymU/PNLuo6lfyrF+/X5Qi5ps=;
        b=w4HB4EZLK9bYTT/phsvkrqF14jJR1Ing0Abx1PGo4AIfXIzUn/i2/TSb6nXIi5tv56
         ZCRkJLLZVQAh4WVRePVPo03DKxBWMDenyzhGT1Ah6yuy3aukMSs8TT2wa1F4VMFZNgys
         UHLzPzbNPqxX8sRmtfI09uRjqBwOi6kNIQZWKPOQU7J2RjR59B0JdfAso2ERx+Sv4G3d
         B+hCk44TqIj26d65rhpHsAcRxqz+Ha97XdpokhgHE0Q34ShcN3O79CYGTVaKfWh2lNsp
         NipN2X6z++liSXiYZMtGB6PtMTsUGqUid1hdQKi0pHX9UYv7oP1Su/J4S7eAIV983MMs
         +c6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744705881; x=1745310681;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AGTQ61IkoM056vi86kWymU/PNLuo6lfyrF+/X5Qi5ps=;
        b=iW6wmC+XfhNieGS0CgDkG+1Ix1bKBmVOpPQsXpV57wgkWvscBX5Eq897EjDT3soGOV
         HL3KNtcRSnZrloXyNpXAzbvDwg3Itwt1ejiVyZysZ9qdOj3Gzf54RGOoP3/bj5rZlFnY
         P9DTCWBgaqZTtC75bzrJTE/vfL7VvC72u0xlWsm2lPqab3eUxuQAjxhgiQ/qJ4wUcWvm
         utChdNoKQvs0AHfrkEj/qBv3gZ+KvnGHjGOYHkxonT7HELd/MrT/l3hMhR5NG65ThsAH
         xWXEoV6SmueDHK7yxASg5ixIMEKLhg/gAPvfwhKNL2bH+x3tzG6iuLwm/SWkUFRujZqc
         1y/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWlgRRRGknvoRloW+IELGFJuIeHyb/VoFsl3AMjAWlQU35MO3cTBLPe36tAtRwUtu4GBStNtvgtf6ukuw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwvqQGRZKHken5deBhul61Dgh/7PtWeAEtAeiV5lg61gx2ghv75
	o9nz8t8tCINY7v0WZhOcb9nzWVlsheql5nQmSsFBnHC4hocdMLk2LX+xcyNerVVwNuWyk3i4DhE
	tXsob8+RomSRDLFFArHdckEiPjZpuWBbbnPnElA==
X-Gm-Gg: ASbGncsb5ZrR+SBy7yQLhQm/OtZHEhE819URXu9UDKePm8/UDRpAEGftCkBy+aFJTJY
	vy7gyhaiK57BqisyJ64vwXU0PdFq22Q0M6TQDNMW84KeytnxubfQ1xXwv9UVPxfKyTArj40E13u
	W/8kR9tYo9B7Zpsg7HClF9uQ==
X-Google-Smtp-Source: AGHT+IHD1bKQe2Mn+6xEULr//Xzasxy/d9khfqWn+UjN2VWJgAl9VuhBCbnmnHHLrAApVzeC5eCCITcOA2lzCH4tom8=
X-Received: by 2002:a05:6512:2305:b0:549:8f06:8239 with SMTP id
 2adb3069b0e04-54d452e160emr5021750e87.51.1744705880800; Tue, 15 Apr 2025
 01:31:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407-gpiochip-set-rv-hwmon-v1-0-1fa38f34dc07@linaro.org>
In-Reply-To: <20250407-gpiochip-set-rv-hwmon-v1-0-1fa38f34dc07@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Apr 2025 10:31:09 +0200
X-Gm-Features: ATxdqUFSm_t0Z-MhiOZk0J9emOXPp3yGfQ0b0Vs1DgJrJxq1RyyCd_nIwV8m5GE
Message-ID: <CACRpkdYdoZ7q6x89emeo3wtJpDOvA3N6Re3PF_XyCJT4jF=GmQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] hwmon: convert GPIO chips to using new value setters
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 7, 2025 at 9:16=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:

> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. We're in the process of
> converting all GPIO drivers to using the new API. This series converts
> all the hwmon drivers.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The series:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
