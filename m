Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5AAA24BBE4
	for <linux-hwmon@vger.kernel.org>; Mon, 29 Dec 2025 15:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767022601; cv=none; b=mkYeuHI3ui2HELtwWFF0Nj1V+xUsqyj6EcD8vH0weUjCDnbyMdCQXYZWF6w9O2Zpjj91rBVM4q+CozOMr8jnuT2hQ4DvKBiT5oKeYB4gTkh0XCn7eS9LH8a9HK6ijan5fgsbbRO35Am5OFQ/Xd/FaSCr5rfIGLW43fbFAdT2Uxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767022601; c=relaxed/simple;
	bh=gn0h58h2r64MMoV+4+rwtRF5yJ5NXWwc0mcFQx6x3Pc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qZcl63i7RB0tughQaKbo2drBERf4MwWc2HhRuADqeg+nd2b9/FIyLSCXM5kshsBNsJo6WgKhig/9jIX0Mxjv0s0Hs0G4Ca4RIdeogu/f2RzQLsmAZo08S9KEgchjpFexEs1AwLd4bJ1+jLQUBMlD0PA4p0Os+lPfrAqcpET3S6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=perenite.com; spf=pass smtp.mailfrom=perenite.com; dkim=pass (2048-bit key) header.d=perenite-com.20230601.gappssmtp.com header.i=@perenite-com.20230601.gappssmtp.com header.b=b96dS2lg; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=perenite.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perenite.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=perenite-com.20230601.gappssmtp.com header.i=@perenite-com.20230601.gappssmtp.com header.b="b96dS2lg"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-37fdb95971eso68130881fa.1
        for <linux-hwmon@vger.kernel.org>; Mon, 29 Dec 2025 07:36:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=perenite-com.20230601.gappssmtp.com; s=20230601; t=1767022597; x=1767627397; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gn0h58h2r64MMoV+4+rwtRF5yJ5NXWwc0mcFQx6x3Pc=;
        b=b96dS2lgE9Ht5UOqCUgcJrryuN3PBCrnlhaVOU2xN9KuhqW8cK4GzuaG/1YGDsLLpp
         1OOJYkG79dHbTsW02WRimvd3xXIkpUK/QIY7xOJfY0IeYNMIPtCVoCRrCrWekWIzyVHN
         dOve2iGCPMs5tiRN3vBA0yyNd+we/xfBMtfUgHGSQ9kYTE+D/g+93oZJHEToG+ctETbO
         2Z9kxL8D9Nfuguxl5AT0T8/J71mmHIhEzrjuFcaRH/DW+KbOjKkLY7wQ51MjWpGKqEmv
         cz58tVglgTa22+8vj1C15vYqIXInyhlVVocwHn7mYJK1acLNmYe/MDqsbNfausqfkMQs
         +diA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767022597; x=1767627397;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gn0h58h2r64MMoV+4+rwtRF5yJ5NXWwc0mcFQx6x3Pc=;
        b=CMdqOFVZZuRpci/6efBJtnQSvsfREYK6sh4PugBOThmsQA2DEDfVoDlSkdWojdrO06
         mg0Ww5Wn6SbFUsV79XBRGpHzfLWDYkKQi1i0Jauw6+Dgw2jYiG9vJQOOb7OgO8Zydw8V
         agNos57IQw2lL+qKlyGrP3cy6rr42EAZbn7qxwWboXP/w33oywC6GlXseQh2o6xtf9b0
         NYWd8xPvTqWK7TBFsrzwx0YC4CqZJ4vY5msEfgJtI1ckBnIFlRYQxouLE3tN5tjujZDE
         ibgvIi90OHgkXPh2RiROgF0NBuyYLSo5c+cd9R/lzSB7wbOvdTF7GYp1envcmEFfufnh
         oVng==
X-Forwarded-Encrypted: i=1; AJvYcCU/ze9FIJHJAVcsBOBJ58p/JL9nS6TxuYJPankOkQlJDbGa7JeNSkGWXVdPB8RH+Ebyu6bdX85xu6heEA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzCo9yffL7KqNEpCTiAGVlv8fOLWDWi+uC6alNsJW2dxRl58Qk8
	XzrPkr1UwYfKJD2loMbgXg5jw+VPwn2QmMZYtB67Ue57EXeQSypQUCaFvsNnc5h/zC5h7UYlsAd
	QBPePk6BIs/fGPFphz7Eql0NCmJ1+j6p+P/O0gD3M
X-Gm-Gg: AY/fxX63LJKx7NvbyguB4dnL8kxt5ivncnp4XY0aWbF/DGC418DjbbRstUKwfhezBXb
	wWMuUGgDVybctUzUX2LC6/r04VIPsixAvx+uEiID1CVODT+DlYB8nyG3nN4c6wYpVrI8fxazEnz
	/D4W/30IU/WXh1cySSpGSE29losg/2bXw1ZnGIIBcIsDAlZR2hcuevUqfUb9viO3GzmG4+N2v3c
	pkwwZCt41kFmjet2vxWcumHSIlcSbZWWFNDIzDig1D4rxC7Q6R+h3QAdyA7UgIkOviwvRP4OOVG
	gQtDoveT
X-Google-Smtp-Source: AGHT+IFcYDsotAC7ttgZsrTgfqzI/6JkHxjtFpysGszl6lTgKVMQeZ6NcehTu7JgtbsM+YiMnk7AbDJsg5EST92fpBA=
X-Received: by 2002:a2e:ae08:0:b0:37e:884f:b6ad with SMTP id
 38308e7fff4ca-381216725damr80147761fa.23.1767022596740; Mon, 29 Dec 2025
 07:36:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251226203021.27244-1-yahoo@perenite.com> <CAGHj7OJaSvSsr0z43phjs1YvL17xfJWesJFj0iQpdvi8=VXZhA@mail.gmail.com>
 <cf3a84de-9223-48e2-b6e2-c97e348b4c0b@roeck-us.net>
In-Reply-To: <cf3a84de-9223-48e2-b6e2-c97e348b4c0b@roeck-us.net>
From: Benoit Masson <yahoo@perenite.com>
Date: Mon, 29 Dec 2025 16:36:25 +0100
X-Gm-Features: AQt7F2r_xcPCZrVlTGTZdymUiFmrf_kFSklsBjlAdqaMEGXm0m30v7iCNk2Il6s
Message-ID: <CAGHj7OKqUB6GDoFDvqyyzNb07AU4xb+GLfHi3fHnhmY=7BjGHA@mail.gmail.com>
Subject: Re: [PATCH] hwmon: it87: describe per-chip temperature resources
To: Guenter Roeck <linux@roeck-us.net>
Cc: jdelvare@suse.com, linux-hwmon@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 28, 2025 at 8:33=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> =
wrote:
> Then why don't you send it as series with this as patch 0 of the series ?
> You are saying this would be to make reviews easier, but in reality you
> are making it more difficult.
>

Hi Guenter,
Thank you for the feedback - you're absolutely right, and I apologize
for the confusing submission approach. My previous reply was probably
too quick and didn't properly address your concerns.
I want to make sure I handle this correctly going forward. Would you
prefer that I:

- Resubmit everything as a proper patch series (0/N with cover letter
explaining the overall goals and how each patch adds support
incrementally), or
- Is there another approach you'd recommend given the current state?

I'm happy to discard the previous 4 patches and start fresh in
whatever format works best for your review process. The goal is to add
support for newer IT87xx variants that many Linux users have in their
systems, and I want to ensure the submission respects both your time
as maintainer and kernel development practices.
I appreciate your guidance on the best path forward.
Best regards,
Benoit
