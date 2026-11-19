Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795074028;
	b=EowqaIQgYIBl6ikeiyKV4I/l3WEBFKtpFnajZtvr3h/m7Luxexl9Nwrv8Nkz8vHJMTZQ
	 AeeouC+lqrIpVCKX1l05gSqPDZoMmPjqBP/WZhAXSu7qqSD/GZN8WC4VZvNdpI6uTowsG
	 MaiF++Yt+DytwGnqfqdrQC6hDxt6qZ+fJ287lq17uK1sO8Sims97s3bkSCP5o2fNrYD29
	 gr1uoMHtmyjjqoOfnM36GpP7ChaxqtSmUGYUGWDRNkzZCrTLWXifhTb+ueBhPmlQrwXyu
	 z7ArR5Rmd7Pv2SQg9CQqkYGi6L38zWYvTEWahPGLuaul7zJmLmC9osvLVP1Osf+dwzA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795074028;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=Gi93IXFGuN2zmaOXOQorfmKdnukVzvkHHvPulF9dWJ8=;
	b=ZGeqpw6zPlS97zBe9iwlEIBJ61mPFqp3KjUwLq8DO33FgB6EZBA2gpcasAPwfD95o3SU
	 nE60paKDFliiIsgSHUujjon20/DtbxSw85gPp2ILOAPYCx2BsihPoNo7Cf2umsPmLehdT
	 X6kVzGJJNLKodzVVfUij0vj4ODCA8Pw1ChyV0cjOEcgVV1dGIKIVEXR6gzbyGmggR+MNH
	 QQQGB8Yn5LT7x1MKspmRmSp+X1siRwq3h9thJnggBlSMYHUPqRqsQdCi4zJwMDCoFE4Gm
	 vbxKI/RYr9v/ZYlzDFN6kJa7q9ztnKooq1zTFX5iGjMN9fa6pWLwcsSUmPqy3Ovxs+w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K75r+Wgr;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE55606A334
	for <linux-hwmon@vger.kernel.org>; Thu, 19 Nov 2026 07:40:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DE55606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K75r+Wgr
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c5126505cb3so96514766b.0
        for <linux-hwmon@vger.kernel.org>; Wed, 18 Nov 2026 23:40:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795074026; cv=none;
        d=google.com; s=arc-20260327;
        b=oau1Ra+WrxiX7rujCet3UjUyEgAdOoX+x4Zl5MKPKhRh9ICbKcPvLQp8BjLFq7i4H3
         CMNB0NcQN9Ks8LZ/+x3T05rXHJTYDGbeLiHTWOZHxoRhX0h1DzDrFeUisGhpgnA4Erhi
         uFTYpX0/SKeg9AXs5ZiQ6NXz/kYOhngMkSMaXI1+fEZjx8vlDfa1ZMSk6jn5UxGqvDWL
         aVwLO4wNU3XMlXN8oYk7O9Dj9CPd0pCPoqz2BXXOohYcdJn3YN8UBuXJB50smzEsmUvq
         r+PtfwLqIdecF2fYx/rAu+rQn5jmmT02uBoqgUfN+4idgKkiArifqIWUKh2IzZbF1lqn
         xpqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Gi93IXFGuN2zmaOXOQorfmKdnukVzvkHHvPulF9dWJ8=;
        fh=TNghhbUxxClDxaKLFHz/mTCxN58amw5DK/8aptgYPqc=;
        b=F6QbNZa98c1fcrlJpadcmaORnA3nGKKujcNluNytFEyPTLCpgPsKH0yWnhT6iZEht6
         27/sziZh55gCQjHxfjjPlonXcwJDzbT/5paqwnSg4T1+Zg8JbceXZrPxnhrImfKR0Ko9
         kjVOULz42erZ/Of744pC2F4GpO7pq8jRFFhzL/v1SgIGECiXZvkO5kvMWeXNI38XJREN
         NZUvIP1KCAzIp4ItS6fem2xUN37yLDlJiyBGpLI+bwID/eFjcsSGocPC7HnFPWf+BzMj
         A41eOP+yJSPsWTrcOzaEdFgKbzCSWXRgLmxJpnJW+2bsHWko94eCi+cCwCErFxoRBjjm
         iIKA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795074026; x=1795678826; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gi93IXFGuN2zmaOXOQorfmKdnukVzvkHHvPulF9dWJ8=;
        b=K75r+WgrFRi9FKJa5DFoKKOB+ps5b/uOFQNkdPhgkbGRCFeYaA9JGGFwjHL62WyZJe
         D74D8zfGH0AMCg/IhfzqNEoliOhQZXrIcAP1Uj6W4drdMxM9t48qGwseMsQDuVvPynAp
         CCH9THwXSMUS7bEdOZeKa2E3XoU465vcr3R6IxaI9hGlTW6TjUiO+hfOT7w1RyLw28Hi
         Z0GbYQptwa9mENNXDWHttEbmvTaKdI89u0GDF0+ms4Ou/gerqX+4GYeIxy+RVS3IScfa
         91F4cLNX8+3visvDAXCw8yefKEqXcCCjWfih0BMfvhTFwQrDPXM0CW1jW1kZb9IeXvPE
         BQ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795074026; x=1795678826;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Gi93IXFGuN2zmaOXOQorfmKdnukVzvkHHvPulF9dWJ8=;
        b=AXfUs0djcfSjd7ZOqHcCLgGuqAtlraixJgYXaimBaCSjtGOaZlJvebCAJgQ4D6YuTa
         DFj587YYrUueWfnonmzsPiEhIYaTVQ/fe003nHLnnweFqB0XhjBr5o3niMVhzDiNVST+
         u7NxZYi+8sr0jHVmn/GiDhCia0wBFByNgcVxjHO2m0aRE5hwv2q8ynQ8NU14AWNEKwdS
         ZOp5nCmM19eTEYprwt+e4gkUPXurhCRmp5P5DfobS3/pYdSVdAQrS/dncK1cb9zk5BLp
         hXDasV/Gr/ac+vp42n1BdM1dlfLXxZuppPR0D7td/QZyentiw96EGd2in4Oc4FzZTq2x
         fd8Q==
X-Forwarded-Encrypted: i=1; AL+hErGb7uYyeRpGdctDEMTt6ycw4giWxyweq1sONabeqAio7wS3U3KhaSL+b34xXEDqkmm5epHZ8IDLPLImjQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+vDZjadlTpq4IZMjXaT6XcDCLznFq1qK+LJ2J6/cLv+/aET8IR
	uKz8oCT4RswNxJYJJ1YGZJI9hQXqTMHOvMi2/nAAm/iuvbD/TV68CGmt0FFh4Macvx/QksaChI5
	XbuAfCGuu39W9FNleHcQ1FQfaynsZ2Ho=
X-Gm-Gg: AYBFou2K8exHRnwplxBRxqIZGiAbbFwLgVWdEkMT9lnVrvvhWqG1g23jfbQQwVM1h54
	yBR/oFuBa45IP7QgWBB+d74210vWdAiDh4p6CeJ6WyKp7iaeubGKB6JnRuf9DkxCz8bgR+SpbCA
	pg2HWKcPTdHC4NJvN6k6bDASlPwlAql0wq8vAvrNOIG5tmetMG3RBtmYz6oYueERD07Q9OW+GfB
	T4VOyrP9U+StN5cxUycqvLFpXanNQLu8ZFM0GdQxiZXU6V7MBCPnhyXJsaShWM4FQWZxtx+S256
	h8SA/hRF9PhiCzBPTrG/5IwcNSrYrMrSs44uR91VvEYhY0bvYWAGBeNyzpMwJZ70zlu/ntWJsGg
	hS84tK+kC9Kuhbqs28IihBBtbvb0s4NftkqMwXQ==
X-Received: by 2002:a17:906:9c95:b0:c49:c76f:dad4 with SMTP id
 a640c23a62f3a-c510e31c90bmr479980066b.31.1795074026314; Wed, 18 Nov 2026
 23:40:26 -0800 (PST)
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117-hwmon-da9091-v1-1-f55f0af9c6a3@gmail.com> <be16d42f-e6bf-45d5-83a8-28afbe54e3f8@roeck-us.net>
In-Reply-To: <be16d42f-e6bf-45d5-83a8-28afbe54e3f8@roeck-us.net>
From: Sander Speetjens <sander.speetjens@gmail.com>
Date: Thu, 19 Nov 2026 08:40:14 +0100
X-Gm-Features: AclHuK8v7dApGOktlI0-huzqV5dz05Lcptx7NLQKfF_k22DUFv5_-2WqsvDZTRU
Message-ID: <CAAOJLPFw1f2v14wtJYt9yqJsTiqJNmkm=dOaAHQ+qeH70NgsiA@mail.gmail.com>
Subject: Re: [PATCH] hwmon: add Raspberry Pi DA9091 PMIC driver
To: Guenter Roeck <linux@roeck-us.net>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, linux-kernel@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> >   drivers/hwmon/Kconfig                      |  11 +
> >   drivers/hwmon/Makefile                     |   1 +
> >   drivers/hwmon/raspberrypi-da9091.c         | 339 +++++++++++++++++++++++++++++
>
> This needs to be documented.

Please clarify?

> > +     data->hwmon_dev =
> > +             devm_hwmon_device_register_with_info(dev,
> > +                                                  "da9091", data, &rpi_pmic_chip_info, NULL);
> > +     if (IS_ERR(data->hwmon_dev))
> > +             return PTR_ERR(data->hwmon_dev);
> > +
> > +     platform_set_drvdata(pdev, data);
>
> I do not see where this is used.
It is retrieved in rpi_pmic_read and given to rpi_pmic_update to write
the values to and to put the last_updated variable in

Kind regards
Sander Speetjens
