Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793014102;
	b=xsnMxUqJ//raHZxs7gPVvjGUzQ6EsleP5bk8DLQ8q6qUwQi8Uc+/H5rvpvSIoIiere0I
	 z+IN3PiTthKQlCgel/sPv/AslUjd0gnwwYFYFzOLVAZWK0DcdMNgUM/K8aH2Gb6H43BD5
	 HlikbCz/3oTCZqVgjgdocmp+uSMRKQ7D1tHWonDTyUXcd8n5GbyiN6GJ/k58GjVrBxhI3
	 sCS7jyGyOrFXvWkwU20Gnh/AhoDGDDalMrMLpCLpTGS9X1xJs7d7XTVt/VKB6EBPnBbY3
	 nNRJ9qYnKF/nCUgVOZ8KC8jrjXS7z4y8hk2GP3jiQp5ewl2hekCaQiuSXaTYHML7Vlg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793014102;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=UKeZl1Gw10WMRIflMK84zHY+twgH7FBBQrDMYUxvQug=;
	b=cH/CwZ3FmNrWhz85DcapjRroDGiluMcjWLyilk6yEiFF+uk1lJrTGfp4Cr1MhWcRCch3
	 akAhm8c1U8H86Uwi4MCapmYWhx25bxmCmtc1r5lLAn7n6xac3xT4Snu4tg1A8NdXiOssP
	 VW2qoIPUI2HTS6dRgZfkhwpoT0GWfweEcdl1hsuS9kfjz6xOZ5NP64sBcXE62KMJ+SSWM
	 H4zjQPBAzz2dtY9DJJw/BR0GYEIwC2VWoYgniw1Rzgkb4JRA3hP1/EMKYHHI6WcBLElwm
	 yu7So0uOVvzwNfKCX70RTmRjbxnJXo3g/rYuBtNi9jnaMFYKE2MH1xX4jmdGuLS3E0A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mOTUJ3xu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.177
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2408F606A31A
	for <linux-hwmon@vger.kernel.org>; Mon, 26 Oct 2026 11:28:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2408F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mOTUJ3xu
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8a070781f63so1018929b3a.1
        for <linux-hwmon@vger.kernel.org>; Mon, 26 Oct 2026 04:28:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793014101; cv=none;
        d=google.com; s=arc-20260327;
        b=HyR3Z5rWlzso862gwZ6WUPqrcSEP/am/xwms9TzCCjCj7fLbvUS6BziYa1QrYq45w8
         Jh69tC2zqZurgXWxbKWmiZltt6f+U3KpjKNxxWb3M7RNK59H4382WJZj5LrXffkOJSDn
         s3eIKiVoee+C3Gi4M3cpHFEzOZdHsCEqVu2ECD+lrkzBA4OKYqz9uf8PPjKVqCpRjZwX
         0v5Pvn+NsEkrq1dXMwoLQLScLhFwlK1a7sj5Z42fg0Xlvccuy9mICabh8VgtNKDk3iTT
         ZCPQMiCF8YQ5l+lSnMJFc3VipfcmLCF53tG4Zp7vS/qnY+rm8WYbK1E2f35EdAgEIqYR
         nUOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UKeZl1Gw10WMRIflMK84zHY+twgH7FBBQrDMYUxvQug=;
        fh=gHhgvUo+/S6tFtCV7/kLLsD1wqZ92rXybCTqsvYmdLc=;
        b=l33N7NUWgWoMRInmZQENsWt6yAQwPrRzFIU7v4fOhlEGTXk6dOW/bTy6ytFVy1qX2o
         mdDAWCRytnmVU//QqcvWNhHq7ySX7tnN2JwAhh007UdvhDwNhpo9rCMnh3IuEUnEH2Rc
         o4E+b7l0Ke8M3cu1pzPUkQu4lqR778Ws4M3xj0ir2dZrVROFckYg/uLRo/boWI/N90kM
         XM1Ke2KmGWJPOtqK9Eq/ziNw/9OBd6atR6WfpqF/wAq8zf+GSUDoFbsLcMfy/lj3jJUi
         5CTrRXtSV/Jbe4MmgkOuTtx1Xx6JkJokRH40IQlc/LyjuhNEZ1i4pgAAfzHAYwqP3zB9
         eMYQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793014101; x=1793618901; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UKeZl1Gw10WMRIflMK84zHY+twgH7FBBQrDMYUxvQug=;
        b=mOTUJ3xu703cPmtcG3UrlXZWO65PcRz+Ljj4tHK+BkhN+Fuviyrzhsg03ja8kNLaOl
         +GkqBnRH33Xer93HUnKA2yFN3HNX/BNub3O7CG/xn47P/q5BqGu+igHhWNR68Jc5EH62
         i0oELWv55SBX8nbMFgxerKr7Pp4Sms8e3QKZrrzZRXHa1dep5xm8nLwGWML4jjio+ahd
         fkrT588vKdYvqrysAp74/NXD9ErP16ae6AjkdvdqIaxfiqJvW71ZDMhy5QcipvAD0aba
         k+gzAH/m06k0vq6eTOB+4poUEV3LEIUGYze7g3RquAhJE5tAH7HmehJbaNnnH3327v9y
         mUmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793014101; x=1793618901;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UKeZl1Gw10WMRIflMK84zHY+twgH7FBBQrDMYUxvQug=;
        b=mFOaP0gtddO5/C8IoVZgLozu+Bz/Refx4YI8uTV8Kt1YC6AxXIOecvfjFagV+7M5X8
         vU6b40n0qoFmO0yyBHy428VRjHnuLKJKyKFyFhNae7STBVfO+t9WGsSJnm3eKxFSqovU
         aVDQxxB41RyiqSkdA97Gq7K7xtJuTj1qOEUak17rHsKsEBy/WEKI7psOZc1h32RdZYQd
         gZrv3foSJ0tlBucxTG8/tjBiSWkh+nGZmhnqwrfFNQQ+lajbrMxU6sPyqKK5BbS+uGgb
         qyvKFd+odwQSJZJEBzsX9nkaSv9/rDQ5TVsrm2FhJuXAPLTQamMeOti8E1BhlANME4Q0
         Wf7Q==
X-Forwarded-Encrypted: i=1; AKwUvBxgz1BhqjfXBH7B1lHeeOsNvNAKEBmuK1r9XOCyi3wc8tt4SDBGUKlI/o1o8o9c0HkqzvdZh5H0hIosAw==@vger.kernel.org
X-Gm-Message-State: AFq9FYIAX6aQ6MH/DABSvvTHjVgCYAhUBANNaEQhH4iQkZyMt7uEZ9uv
	QjIkq3EZKYcwBVI1FqjWQ/wqs11DR/X3wFd7HBDYpaXkByVY57seP7j2Z9Ov7dUwchWSf4I+afG
	h2fK8y+7Cqq0BLLrNXBKQUHbForMCMrQ=
X-Gm-Gg: AYBFou0rmxNTrR44qQNBrR8QP8KydI7eFV1YVSlh+LXJAAfZZMiLTXpJMO1OAbCqGPD
	iHbEwFczrF+Fw3qVfhG+rreVqdFXM4okHrYmz539kboC6+u97tYWXw6PfDGtqzBwV+wa1/+9aqs
	m59N6DXdyN8NckFCx+G6jljnl49zSg6rQaTlaKCnyhgPsGn/tei7CfGc50WBif+w1G8j1tt01Gn
	HSYFpWXh7t2sMtF6W2m/c/6FbjY5KtrneSQMxOR7dUzEg6DAWZRIJH3h0cC/yMOVLGHwIkQunh1
	1l0vAo9ySoH1fkZ7d26jifz9rKA6w+8wzP7qmmzo1KDEgx1T96AmeNur8JDqaqBlx6lpPTsfxYi
	WdIG4Lex8Gv0ccKq0FEjB76g7KLWO/HkYgu80sX5YL1DqTdxea7zF
X-Received: by 2002:a05:6a00:bd81:b0:89e:8915:24aa with SMTP id
 d2e1a72fcca58-8a367a36becmr5121820b3a.18.1793014101519; Mon, 26 Oct 2026
 04:28:21 -0700 (PDT)
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026003918.155321-1-pmazzini@gmail.com> <20261026103730.3a79c2e6@kemnade.info>
In-Reply-To: <20261026103730.3a79c2e6@kemnade.info>
From: Pablo Mazzini <pmazzini@gmail.com>
Date: Mon, 26 Oct 2026 11:28:11 +0000
X-Gm-Features: AclHuK_DqqwJbE8Mxuk5nig_6kiigbCl4FyLzQRmggV5Ihs0oknU8AOuwlyhfVM
Message-ID: <CAAxh=jtYnDNQTUOf-cBN=w1Km+cBFOgrW8moNbHfqcApwxXbgg@mail.gmail.com>
Subject: Re: [PATCH 0/7] sy7636a: power the panel only during updates
To: Andreas Kemnade <andreas@kemnade.info>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Guenter Roeck <linux@roeck-us.net>, Lee Jones <lee@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Alistair Francis <alistair@alistair23.me>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-hwmon@vger.kernel.org, mfd@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Mainline, on top of linux-next. I started looking at the hwmon IIO
bridge. Coordinating and cross-reviewing further work sounds good.

On Mon, Oct 26, 2026 at 9:37=E2=80=AFAM Andreas Kemnade <andreas@kemnade.in=
fo> wrote:
>
> On Mon, 26 Oct 2026 00:39:11 +0000
> Pablo Mazzini <pmazzini@gmail.com> wrote:
>
> > The SY7636A hwmon driver keeps VCOM on from probe, so a display driver
> > can not power the panel only during updates.
> >
> Yes, that is the common use case, power things on, tune update process
> to the temperature, update, power off. So it makes completely sense.
>
> > Read the temperature in the regulator driver instead, as the TPS65185
> > and FP9931 drivers do, and remove the hwmon driver. Boards that relied
> > on VCOM staying on mark it always-on. The regulator also switches VCOM
> > with VCOM_EN, gains VCOM voltage control and binds to the I2C device
> > directly.
> >
> > Tested on a PocketBook Verse (B288).
> >
> Which kernel do you use? Just curious, maybe some further upstreaming
> actions might be coordinated or cross-reviewed.
> There was discussion about in-kernel hwmon readout interface like it
> exists for iio.
>
> Regards,
> Andreas
