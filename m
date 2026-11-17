Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794939219;
	b=4EHH9pJ/OWHiK8dKJB3bu3WnXi1HoyA9c8/h0htYHHxURtJu4r7tiyiLrKHg5fayM0dZ
	 R4dZ50PclIPekbTLag9EKpPSJi9bBr5xonwOimYcMdNXXomV4pnwuYUogVlYvvXMz85ii
	 CNTntsOr/ui0xWHP7/mq4lDjATOXMN15e5lUp0g9SjzN1d/tI8+AmWiAIsdIvd34KdTy8
	 grGuuQlNt9393WbMm6GTrfX7JZOOT373kjYG4FGoRoJ/rg9L5orY0qqIoR9l6TRMszUG4
	 WL7eMepuQB9S+y0qhRWlpq/M6G18g7IHzVl2ZwM/7+z6c9gMUR9A3yQLB7cUivcL02Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794939219;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=erlUER00uutbOeUXRe0dMlrIK7k5YTIn1N9SBf2g4jc=;
	b=2kZivbVWYDkDR6rWoeq4iO6RTzgnVAAyV6XC6ud6FURPYLn96jcHNaXOMaSlQHFXRNOv
	 Z07CCaxXTlC3GJfCLWA0uqUq/HTXr50nw/y1rD4Xnj/c6eWl9xAMpVEi+ZAtkJuE0KzYU
	 CQmbdHawk8njckp36aNeBIuhA3+ByBNb+huXd4mbi6NNGd99rPWqBRP+NqkbyRCN/rirr
	 H28r1PNhj1405VO+jgjtQuy5XiAB+DtsGHfP4u2gFRbxzpj7KHohOb64JkR8e4uHZP0SI
	 KZd3iZNpWvaTXSU3jBHl1LlKtegZ8HbnsfVHt/c5dHQxuoTKj6wifpAloVFtXVyn+1g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yWq8fIRK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.182
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C88606A8BA
	for <linux-hwmon@vger.kernel.org>; Tue, 17 Nov 2026 18:13:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0C88606A8BA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yWq8fIRK
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3ab3b29a298so1982351fa.3
        for <linux-hwmon@vger.kernel.org>; Tue, 17 Nov 2026 10:13:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794939217; cv=none;
        d=google.com; s=arc-20260327;
        b=GNdfYXi11Z1YR9Wo4YSNZHLmmSxhKKCUPww0uLDKJ0SJdBc8qSAK6Lq+I1H7EN6vAs
         myo3DQzSlp0e/9nl3QnybPt2/2E7Blpk6glwkoWGHpipBf2Kg/HwW0ESuyj8dKaUqLaT
         +oe2Rc6C1CykZpuMJS5ouJiC+oC4c8sIMC+TVwu3QySqzj/WnjARKYg0gbELOhobqkrF
         CgxeqKXu/htksaHn8HN8prlkMMKjeFhG3ooS4ZT3YkqGDoLEDWo9PCesR+AEaaFdqrMu
         BmlxeKI49ld7FgjkqnJqC5fSjNpyhtkBdvkBJsxflpJYw5J/UiI/l7p4JM6jfIqPV1Si
         iVqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=erlUER00uutbOeUXRe0dMlrIK7k5YTIn1N9SBf2g4jc=;
        fh=abjICGDXdtOftD189ti6/nB6/IM7Qf0ihgbngRe1ZCE=;
        b=DKwyg5dr+6d+mQP6qnt8DsAgN/K/Ey+N8kJpJCVJEtYyHM9je+aLchTP6iSl+mU7rp
         Fk78+ctOVfLv343VjSSdIcT+MGevMEMKdMSOdD/s4087CqpkIpG9LVdISAYWQ/Hd78fU
         QcO60UvjFzc5qt15mzxA+KQPp3jrvXZqS8/hw1bzqN88z4Q8JJ7s/lnYMbUFxnT1V1bY
         vujEALMIaoW0C3CkLZ+KlNXY36pVRY9cOnbub7kwCErxdREF9zDCiAF5t0CeLp2O8J4c
         90lorCZQifuXMT//BMNhefXi8ahlLGrQtpfkfsOmJX6Y7EeUcySdh/N9HJCHflnajOBY
         6ZLg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794939217; x=1795544017; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=erlUER00uutbOeUXRe0dMlrIK7k5YTIn1N9SBf2g4jc=;
        b=yWq8fIRKsYvOVYJkN+zuhrDf5zzTzUqBNqndE5f6I0NuyPm5k1QYBU1TxuA6LUrayP
         u9g/rJO1y8oNXunkiwTxK/PEnIDGWko/TH/y6fdqeoZVr5MsQ38hY+z2KpG3sgq6BJWk
         Uk+PxgsWz4df/3Q3gszOS0a28AGCRXK7qrNrs1liYe8mvfvy0RnMZDm+HY4rEK2OLNdl
         D2O2ciFFGs/v3uIhVFRIcdDMCp1tY8Cx2whBmtqPrFLKaSr1dI29ZNSeJFdbxCrEUFQW
         HB6ed0+jh3NibJOScnRUnJw3EhuLteXt9rttaO5Wl9w1CYEPMjG8/8bAlAkv7VxP311K
         I4QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794939217; x=1795544017;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=erlUER00uutbOeUXRe0dMlrIK7k5YTIn1N9SBf2g4jc=;
        b=z9d4KQZXMcpZatDSnLka4rtJsrbJDFMLfRBk+Im0+c9GyEtUcg5TezvNOTc8rBR7rE
         vvOgncSseBc7ijQx8b0QzskjmiDEg4uShMMGrlGN+Iwi5A8hX+7OFHpIAqX+IKgRxY/6
         Snxr8NFxm4TaVlUZ8syeWPoe2kwR0cxPzakZK2sTmuD7LdzqYM0iRvnU/HUs0SLBuGZj
         p0Jzz7nsmbn6g2Wb7FMESMMwwVgJD32FHPsD5VUW9J4rDyKyIGZUhiux+rtyDvpjGPRZ
         fQjyaoLgBjdh6DYDocGCe/hRcBFaWXP4KeVX85dXAHHk+HLWjnD2x2DAsBO1IKJ71ohG
         V+5Q==
X-Forwarded-Encrypted: i=1; AL+hErGnlCIoTk75m2BNTA3o9AyWQ1T7Wi5v6Q1qeP8voDxlsxWXglt0LJemf5Zf3R3q/dXyX6IlQO0FrmNZmQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9b+MTnG+Vibe1hs3qa7/Krqq5NQJtOTqHwwjdmXwWez9bsmK5y
	SonhUynnGsbFJgUsSW7eKNgA/uzdzO2bq55Pp1To+xCvE4pmsBc2pPy/YnK+PzlDvDeaMqnI8W/
	hm+ww57j+nrvNSQXFmQEUJUoyWkRkx6g=
X-Gm-Gg: AYBFou3xz9q+FptKh3FcrujIWnfUeryO9BDQWkzLkW2z4arFMTv0ZeBTGksRBJ5CwMc
	CerABJG7XlCqeqBhsFpQ0jY9v4aYa3f6lW+kEjIW4KDCP1XwdqJkM4kyFfE9o7rGfUo35ZgISvn
	kO7eB3FV9kqBn+zQ7xkJoDfNKmSttRfr37oLCxsh9nBj/VF/6L2OCgOK7sGYw9zGiAZ4n2ijm10
	b13HkZB9njKNirm6SbSPbcuX5QmBxqyyx2fuHzuOCs2lWS5DHdnS+0sOo3MCOdlzxYMTM9cnGbh
	RZxtZc7h1uHgJBkkkEIwnsjKxtj7KtRuC7Nk0L4UfC3L2c6Tq3M9ZWMlJlamaVb8d/ANoDhL8Sb
	cxgo+I9NpRXNW23nvUwO1JKbNTUxKQcd4sBvNHyoso5Yz1ERO2zH1o8OPFtJhxnD7YUypm9uvo9
	rgHNtKtpBG6H/pcvsIIBPx75p+T8W44A/SF1nFOoOv5sjTRXs=
X-Received: by 2002:a2e:ab0c:0:b0:3ab:f9b:974 with SMTP id 38308e7fff4ca-3ae2b6b6de0mr41375121fa.29.1794939216626;
 Tue, 17 Nov 2026 10:13:36 -0800 (PST)
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116-marvel-env-v2-0-ef614eb2e7f1@gmail.com>
 <20261116-marvel-env-v2-6-ef614eb2e7f1@gmail.com> <71d115df-0380-4724-8cc1-ca7da0aa5fc4@roeck-us.net>
In-Reply-To: <71d115df-0380-4724-8cc1-ca7da0aa5fc4@roeck-us.net>
From: Matt Turner <mattst88@gmail.com>
Date: Tue, 17 Nov 2026 13:13:23 -0500
X-Gm-Features: AclHuK_oNiRl-U7dZo5t_PUbIvckg4PZjah-4kUWpzh4pr8I4MHJijK9LPm47r0
Message-ID: <CAEdQ38G0hC3QvZrM-YLUGUT=0DQqjJi=G=CWu=2fUwZLs1wLBQ@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] hwmon: Add driver for Marvel AlphaServer
 environmental sensors
To: Guenter Roeck <linux@roeck-us.net>
Cc: Richard Henderson <richard.henderson@linaro.org>, Magnus Lindholm <linmag7@gmail.com>, 
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 11:13=E2=80=AFAM Guenter Roeck <linux@roeck-us.net>=
 wrote:
> This is not how the update_interval is supposed to be used. update_interv=
al
> is expected to be programmed into the chip.
>
> Soft intervals should be hard-coded.

Understood. v3 drops the update_interval attribute and refreshes a unit
at most once every 10 seconds.

Thanks,
Matt
