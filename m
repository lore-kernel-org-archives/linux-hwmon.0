Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0480B17BB38
	for <linux-hwmon@vger.kernel.org>; Tue, 10 Dec 2024 12:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733834818; cv=none; b=NpywTiTCcQ7N0ecEfnqmPXpUo1qMtRIt4S3j17EKPv7ihgc9/A1j9gepLnVFwZHgizYV7JPao0MVWS/6x6sRro9wX/e69ls0ewypC3SSCn83DP7yInyLsUKJ2lBK/wcbTLVdoUtktkzsyRVtp/dnx+lIC7g1J4uG7KAiHTbqEa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733834818; c=relaxed/simple;
	bh=KX4EV3S5tpdSVPVaMW0IgVo/XNFVcw+zGMXFSjwdn4I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EiRvtcvHODWNSN3ONUWlJNdDPuHeXRLFcZSyAETRuHWdOyFJsalmQBqi/iqxGmMK+YXHUrMGhZK2+Zl0KpIKLZPG/UrlpJXZTKebKLUtZ+qW4P3+sAStLy5g1peh9aU37cfthPFF/yuRtsBlBmghZyD5eWTOtnXlvr+czuB7MHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=N5GTBVsG; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="N5GTBVsG"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2ffdbc0c103so49998901fa.3
        for <linux-hwmon@vger.kernel.org>; Tue, 10 Dec 2024 04:46:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1733834815; x=1734439615; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q2gv17yRT4z0rHDfJ0xNPXvIsRkRnNe0DZfYlBqVB+Y=;
        b=N5GTBVsG2KMmwjiFXXNZANCiDdkUOMEhZXubJTwofUPnyPJfittosAC9P85mzVRcUH
         m1f6AVL/CWSwuJ/9xgi2NmpmQVIR9Yb32Nfsd7P6xqViG6WPfpSp5oCB/UsFnQkk9Cnb
         z1KIfeQUX1c0ob0E8NQmktlYOJTBjZlb+7YKZnCL9qrw3D1LUJuUBLeXxGF9aDR8alkp
         xmIZDjVBiYMtP6SDIvy559XqDYGBGWVQEscQOUVYL/uuqVKyZqI5U2p0I4dtUbViHixk
         WraUB39L/Av+uWRqoJfwJ6383htCur/3f9CAi1UskwuBuzUDkZnRB1ZEIlrdZLIJzCQn
         uBnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733834815; x=1734439615;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q2gv17yRT4z0rHDfJ0xNPXvIsRkRnNe0DZfYlBqVB+Y=;
        b=d2VIU/PUB4vrTzoPVEYo0JOmNZuM7lNxXHpB/qx0t2cs7svVXintJDKasTnX+1J2Aw
         N/ZEBwerW5IylUeoRGOfDLEYcU/fwuFRQMh9zIQI0sQb3cNkchC13oZK/CWfm+X6odDi
         183fCilYhKguIwjTGyJZw+cTByhMy8DGZTFkc/RjIrMX8xPukMhZ1Ylogu0qhvbgRHjB
         nQy7zqtLLBqvY9aTpOFMWkpkqU5w/6AZys+bP+Fig2pCsN5a5BsdGhqp67h36k2fKZDC
         +6Wofbiy1pjRhX7Y97lKYxH6re9jABgUpHM+jUFXNe+4j7HQZ7mMtaVSdz6miSij7WCO
         gEpg==
X-Forwarded-Encrypted: i=1; AJvYcCVSb9uphyAlZ6Nfbz5ubv8glBictwXyl5lfJEGEYBiywN3MySnrbaE/HlSTSIVibFGNHBkbCL1qPQmAYw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz13Z5yR5VMZGzZCz4iwblEoBZNUatbWZY5I4QLJvV9Ea3PXYtF
	hlvgh5qpUM/IcMPFDJBfO5x7J9YFWfxIX2Jwqj/ndojeV1J2rs9kQ80andcMFunJAaaa+59taCf
	y588FaQrhDon+OLLHNEQ0YFfKR7y88ru0k+kqLQ==
X-Gm-Gg: ASbGncvSNTsGCpb87gh2KqWwwg75nhNOlQYJ+hhghKzlKL+X+ohVXNyqFTSDhavnzhU
	1uG79d2qiWVfrWtcIxf1QM4pcGClTDYkfJcCru1tRj0gYuVTdMAjSyBA4p8PaJDdLg5w=
X-Google-Smtp-Source: AGHT+IGlGjnX41lf5nD3xaDqv4/+1zouMo9m8MDdOTdpToJj+sYN673kMGyE3ysEnuS7DFynzHplBUGfucHdrqsCYuk=
X-Received: by 2002:a2e:a163:0:b0:302:336a:898f with SMTP id
 38308e7fff4ca-302336a8a1emr6922311fa.9.1733834815083; Tue, 10 Dec 2024
 04:46:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241210104524.2466586-1-tmyu0@nuvoton.com> <20241210104524.2466586-3-tmyu0@nuvoton.com>
In-Reply-To: <20241210104524.2466586-3-tmyu0@nuvoton.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 10 Dec 2024 13:46:40 +0100
Message-ID: <CAMRc=Men4QM3a2rydxDYwLjJLYPB7Uid=y_DJ8YNa-So2H3NQQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/7] gpio: Add Nuvoton NCT6694 GPIO support
To: Ming Yu <a0282524688@gmail.com>
Cc: tmyu0@nuvoton.com, lee@kernel.org, linus.walleij@linaro.org, 
	andi.shyti@kernel.org, mkl@pengutronix.de, mailhol.vincent@wanadoo.fr, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, wim@linux-watchdog.org, 
	linux@roeck-us.net, jdelvare@suse.com, alexandre.belloni@bootlin.com, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 10, 2024 at 11:46=E2=80=AFAM Ming Yu <a0282524688@gmail.com> wr=
ote:
>
> This driver supports GPIO and IRQ functionality for NCT6694 MFD
> device based on USB interface.
>
> Signed-off-by: Ming Yu <tmyu0@nuvoton.com>
> ---

Looks much better now. Please address one more issue I just noticed.

> +
> +       mutex_init(&data->irq_lock);

This is never destroyed. Please use devm_mutex_init() preferably to
not add remove(). Also, the other mutex doesn't seem to be initialized
at all.

Bart
