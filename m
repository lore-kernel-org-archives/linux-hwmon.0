Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70F66448B9C
	for <linux-hwmon@vger.kernel.org>; Thu, 13 Aug 2026 10:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786615663; cv=pass; b=K6Gl1rG+D90n+b9X7oB+hL3d8sCYaxDgE/W8BPOVaDwWtKJ+UWZU5I9hwbwOXHzNhKLdlTE0gXGwnRAywq3Jz66kEkk7fAPEf1mJaIEF0PGZQcCmEPvJy2NUUCZMy/V7XIkPa+w8vHuOWvl/vqELEdeIRFL1UKT2MvmPblOHfAk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786615663; c=relaxed/simple;
	bh=gaiz5TR4HdEahKrYQMGYlDOIajjr6oJqXrb2lIn88Gg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qtF5jsvvS1U+IZUNd1u9Kdaeu4PlnlqjLwc7lNJ8tU3Mn4o0sn+Y71qxSSRT/5BPWLcu6J7ufP+iLWa/ySxYur7tyul4WVDOCdh/+INT4TaXehitUe8rFxd86zRYapbr4JjktYzhxF633zkZ5SU/xbXhnG+KkmZTmvxonmnGGv8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arimil.com; spf=pass smtp.mailfrom=arimil.com; dkim=pass (2048-bit key) header.d=arimil.com header.i=@arimil.com header.b=dg7UjSgB; arc=pass smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arimil.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arimil.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arimil.com header.i=@arimil.com header.b="dg7UjSgB"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c15ba3a2b4bso227525166b.1
        for <linux-hwmon@vger.kernel.org>; Thu, 13 Aug 2026 03:07:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786615657; cv=none;
        d=google.com; s=arc-20260327;
        b=iZn+LwzAmqJ8jDS2uL+BhiNg26nevbQiQuQBLHQmgJyiJFf5ABTocUzTQXXGaP3Xo6
         a23CsFAiIMevARiK4lfLh2gm2gY3qFogJEB6DK/QSqz+BvFVIKb16pvYvNox3hqhY9Ib
         Il3cohH7OwJ3+lq0vci0iVvB8K8ppCCYikt70RzOW12phBxNyE6PLt+zHrjhcHsK/7BH
         Ltlal4JNCqixu4Is03crXIysPqoGIjjsS1TqwgGs8qq/zuesOCgUZ8rsk3pXtUp73SLe
         tVTLZwSTPIHWbj0uDbtqGL28WVsvcqjBRUEUS9NYNsrmhn+MrquAKLlcz1pap9GxEewJ
         wRSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gaiz5TR4HdEahKrYQMGYlDOIajjr6oJqXrb2lIn88Gg=;
        fh=zjY8ir0y442BbSUm1IP3O8a22Y5t4P8TIseznyuNQsg=;
        b=j0+YZUD/M4XXNBgDZ3b8PSd9pJ2DXTu2MTUnn4h5OQMCvgoemMtGbthCiUnkniu1Id
         TI4upWoQ7rI5AV2w9E4ybM6uzZoFg+SAJIJ1+bEoy7ay/VuhrJ2h5EfkI7v8kQZqXgDP
         Yqpm0EVluuWhAPn8mx54ep4dPOa2L/2Ubpo33K5f5UNj6bmbGi9X6bb6m/zKRzZfHNTY
         SmhFd396pqsTPVv9Pii70MEXmc95TT/Ltxt0romUj8PJLKvHYm8gEEodL1MWMDfDk05k
         eWBbRwtuUmHawicxZhB7zoC/gZrAFZ8BmzXoa3+JsTn0VpfqG3xkMAZPRoD8syesjnXZ
         gTYQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arimil.com; s=google; t=1786615657; x=1787220457; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gaiz5TR4HdEahKrYQMGYlDOIajjr6oJqXrb2lIn88Gg=;
        b=dg7UjSgBBtyP/sLkfevk8rImllduwyDXtg5rZdculjAl/ferBbzZbCeVE7MfpEu1j0
         zLDoBHtrVit2Zor5wIyYrJ1sYMv0CUnb8HowQj8khqGr62shpBRe9AZntwNE5wFDTdnj
         X6ZEHqvb2dzAejvGnvu+7oNHkj8Zp32AN7K6mzuvfiEu1x8N1WzbSUpB2Qsn7V77bQsY
         hRauv+FVmyWXgS/t49CGX7lx0Htlq9Itil3raNVYk14xAARS/4JJ/zcY7x+4S9ZpKeLw
         c5SjwEdgbXTBLGMAIOZnC5ImDsmiCQTn66MZAp6x2Ixy14XQgkShyz7dkjIuSy4Qg4SP
         CBFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786615657; x=1787220457;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gaiz5TR4HdEahKrYQMGYlDOIajjr6oJqXrb2lIn88Gg=;
        b=q0nSWD5OkyLCuf2appcLD3jI8c9/3WVeF3IVkkxLRcT1XKH0UrQ3T3DhdudFneNOzm
         SJUHpLJXiG7SGw1hIAQIPzYsz0pHHT0tmbUbdnJwg1lHABKCdbcFmjypU2OLfXQwSFna
         aP+DfaUsCd3a4Pe2qPl9Ttn2i1RK1dq/Dw2iTMZBOwS/HZh1ehe3rkj0MCfyz+AHIIdY
         QcKtEvsiUWplYEcEeLfpFZLJl0dGGJrXhoQrFisJNEn0Miyf4xYZA28yu5qujMKpyTOp
         uzzHJUCpZ/4cQQbPz7DD3hAH9x24ZmHOUJQpNlRN3zeYDM1HXnBE1yb5J1K528GKRABn
         nP8g==
X-Forwarded-Encrypted: i=1; AHgh+Rom6hinKtVtMuFCYWbdFugarDEFNQdmHyqGNOeKCHl3g1nbda7Vb1YOuT9zMq7WnlgtjksaD9QMUfjyEg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwJq4jnsFDdXN1ZtFSnQYGxmI1eBBt10DqhaU+8V4Z9s9R3NvJa
	PKVhQC+ZzfqdcxdWGPoZxcuZVNQGydIoTBqjChsTARaTkZbj1jvgTdrsBp4EtkhpXLsdZOmp3+k
	PxGx7LFZYH/5GZDzzFEO/WOag11ueg1iSYB3RwYbOTg==
X-Gm-Gg: AR+sD113FyGc/YJEelin4Qg1sMCaQ5xNovSaDoZQNcGnzvEhQFQkTlcKbXjf1im5Knu
	d5sBoM9ym81tXarmPOGg5dMBFxN37SJT+fg6NWXIkqIh15WDqDZ1oGTQZV2yHvFsHaXV2orfRzz
	q0Dx28QsR8fAFMrQS0zrWmN+dUgherBXKA7Nn2NmYSroifm6PZoZKPAjor/niOqC1fBy9fhSLrd
	kgEZnDIBqCuDXdiDsXoyFsz6mZ9bOrWwcsdUVjYJSLA8HJTUwiPDhIN5C5j507AcLoX076H5MY/
	+oRbVaiDBC5hk1YnYFnbV51awaps391Y+gzEPlMEkLI09Q==
X-Received: by 2002:a17:907:1c81:b0:c12:8b1c:454f with SMTP id
 a640c23a62f3a-c2108f0b8a8mr240524166b.2.1786615657312; Thu, 13 Aug 2026
 03:07:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260812103532.395049-1-renari@arimil.com> <20260812103532.395049-2-renari@arimil.com>
 <bdc11dcc-ec6a-4951-9348-1c60a3be94ad@roeck-us.net>
In-Reply-To: <bdc11dcc-ec6a-4951-9348-1c60a3be94ad@roeck-us.net>
From: Arimil <renari@arimil.com>
Date: Thu, 13 Aug 2026 06:07:25 -0400
X-Gm-Features: AUfX_mxMU_wVh1-h-zTN8bKl9ZVV_nru6asIQE7WEpjjetqODMgrCarL5WYOyGw
Message-ID: <CADBHdQ2up=rcwC=GgVBO382H41uxep-Z7XD6gtnTpZBi-KcpJA@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] hwmon: (asus_rog_ryujin) Add per-device configuration
To: Guenter Roeck <linux@roeck-us.net>
Cc: Aleksa Savic <savicaleksa83@gmail.com>, Will Smith <github@notthatwillsmith.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 13, 2026 at 12:57=E2=80=AFAM Guenter Roeck <linux@roeck-us.net>=
 wrote:
> This is introduced by this patch and thus irrelevant for the commit
> message.
>

Do you want me to make a v4 to fix this?

> We are too close for me to accept this series without independent
> Tested-by: and/or Reviewed-by: feedback. I plan to apply it after
> the next commit window closes.
>
> I won't mandate that the issues reported by Sashiko are getting fixed,
> but I wuold strongly suggest for the users of this driver to have a look
> and consider fixing them. The issues look very real to me.
>

I have already started looking into fixing them but since this is my first =
ever
kernel contribution I was avoiding expanding the scope of this series
unless you explicitly asked for them to be resolved.
