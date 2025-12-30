Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DF301F95C
	for <linux-hwmon@vger.kernel.org>; Tue, 30 Dec 2025 00:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767055607; cv=none; b=uChK3cTZ4Bj1sxt4qLtXKOVZIMW+l2VeC+a2bF5YfwX1MkpbHAglmUqBCPvTY+4VoBiyA9ncaoheGjAZfg61O12KoBg300DjQdyrDrWqsV8EeAGVZO17rNlfXz4GMYRKPUujNTFDNfZJn/g9QudHYwDMXxiQ4nTo4qTiZUNRTUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767055607; c=relaxed/simple;
	bh=FD8BOdm0C6NvNTSiTMHv2tWzOHtbHLYKbUmjxds6sCA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cyCHe6edxJmZ0bcLcQhGbRggeEnHgM58S9GAOsRTK1vvin38gW/FTuCgXZ8wwpify5vpoEsWvXAfamtOvRqtH5ADl2cGk0O6hQC1BcOoNFcn6bP9kK39XJqw3o0rjjJOQpbO54aJe4OWgPihVMoBxIaVFhjCYWE9akYbrrSYRVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X7vPe+6Z; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X7vPe+6Z"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b72b495aa81so1599122066b.2
        for <linux-hwmon@vger.kernel.org>; Mon, 29 Dec 2025 16:46:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767055604; x=1767660404; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mrajWW+k38T62aCSKtqL5GHN39b+zeq3Bmum7GUMmgU=;
        b=X7vPe+6Z8TWlYwXHvrXvamaScLmo9d2Hr328xaSUzD1oOQw9hS4zkJRw8rYp6D0ADW
         YuC111tLNzeQu5+T8n1kiyC9k4x/C/eq/qVkQZf2hcfRyI8my1x/BQDnthb59NOLbJbE
         RZmHk5uuWylZF0znRCxXkHjyOWIRg+LhwJWnmzdROEHc7Cx02nVmwMCgOpFXRRL0oAgW
         o22YZZlCBQEYrTQOyfpd0vTMu7vgJhKVTLjGThhXR+NclhHaAGYfAtLKewMRs0aNc0Ws
         IjSkTrvw5bcLhqZvrQUHMjjf3u0KlPQMrQfmaJymaWVQ2lemgOA0H23aaN8M6uj0FzaN
         srSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767055604; x=1767660404;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mrajWW+k38T62aCSKtqL5GHN39b+zeq3Bmum7GUMmgU=;
        b=OQ1U+7ATg565M/5Etq/uSVoMZyZusCRyrhUWhQcPnAXK9q/UtgnyEaiR2fnJWFOtyg
         s0h2B8m81usJ+CYSXevmw5paURzFVJU4vqGKRgUrXTKPIJIXAP23jFFzyG+/Hs+5kwr5
         SmpMHDKy4gn8PTISDYrVV1fZkW8eYUPoq0DsfbRTT1DaX65kp21ki62z+hMM3YJvwQDo
         2vb52ebcLKif2I41ZMCm2OLnmHQHvNkCKbhPdmof5voEJt4SHRoLt2jvmqBruJllB6s4
         7meSPWz8NE4OaM2OEW6R+0jmsdPqTI/IMRjL1yFRYJAwtMhrfwap3qqMQN5tlQ3MlzJV
         UQOA==
X-Gm-Message-State: AOJu0Yzwf1b3C837AToJIOPa/Zz7tl/Qzn8QZEYO5JqmhfLpK+OomFnb
	/eQrca1joaEzIikecBiBd48LEQ9Hvc8ehyxV/8cWTDZ31WIfDR50LVr7W+n0LVpp0nDECV5xQLV
	Wqv6jsCj96zDJ18enY5F8YiWtUMk/vyroVc8Qu1I=
X-Gm-Gg: AY/fxX5D94OpNE4eKRGivdKIc8JgJDgu7k6tpkcdb6hUr+KP65B2v+hfi8BTR1X59As
	tMLc+7ZODqjXrzygvoLO0jueVsE8nSrbNQU1Vq4KTtwlZQMlSQTFTtBdSa9nBQX0y8HfoYwAxia
	KjQ4fly1b+uSq0XrD6xwVqiIXIUriwgRQLleKqZpeCDp8BOtQ2zL2A0z/pth7yPZmspm8AjcqPw
	BZBJkLcOuk/T3cqqzoG3lDtVp2jXGmi4ibLvYbbCW9VyBQdfXKM93y5HZHcYXcUhnBmaHJqpjv4
	f5PfVQU=
X-Google-Smtp-Source: AGHT+IEOyGQkzZzbQkEggQ/1Ve2hgGBI2wjKyv6nKIRJeoHyKsYX7C4aBvjrvWCQCKl3vF99LAW+3maWzes8lpP2kpk=
X-Received: by 2002:a17:907:d07:b0:b83:73ee:993b with SMTP id
 a640c23a62f3a-b8373eea4f2mr629416366b.57.1767055603517; Mon, 29 Dec 2025
 16:46:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251229103956.120184-1-hsu.yungteng@gmail.com> <e714157a-ce8a-4b1a-9882-ca437d772fec@roeck-us.net>
In-Reply-To: <e714157a-ce8a-4b1a-9882-ca437d772fec@roeck-us.net>
From: Yungteng Hsu <hsu.yungteng@gmail.com>
Date: Tue, 30 Dec 2025 08:46:32 +0800
X-Gm-Features: AQt7F2oshiBPS1_H4rxGWznS3goxYz-ZNuKnTBp18YuhU2Y7uUwGpu_7TAc9YMA
Message-ID: <CAFT9tymWkg+1Rp0rbWjjtenJmUKbcu_cpeY1MVRxMUTYGbRWDA@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] dt-bindings: hwmon: add STEF48H28
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Guenter Roeck <linux@roeck-us.net> =E6=96=BC 2025=E5=B9=B412=E6=9C=8830=E6=
=97=A5=E9=80=B1=E4=BA=8C =E4=B8=8A=E5=8D=885:05=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Mon, Dec 29, 2025 at 06:39:55PM +0800, Charles Hsu wrote:
> > Add device tree bindings for the hot-swap controller STEF48H28.
> >
> > Changes in v5:
> > - Move the change list into the commit message.
> >
> > Changes in v4:
> > - Fix an incorrect datasheet URL and update it to the correct reference=
.
> >
> > Changes in v3:
> > - Move the STEF48H28 Device Tree binding from
> >   trivial-devices.yaml to pmbus/stef48h28.yaml.
> >
> > Changes in v2:
> > - Fix the entry in trivial-devices.yaml by correcting the comment
> >   and compatible string ordering.
> >
> > Signed-off-by: Charles Hsu <hsu.yungteng@gmail.com>
> > ---
>
> First there are no change logs, than this ... change log goes here,
> after "---".
>
> Nowadays it seems that 80+ % of my time is taken up with such
> trivialities, distracting from the actual code reviews.
>
> I really need to set up AI code reviews to handle that :-(.
>
> Guenter
>
Sorry about this. I=E2=80=99m still getting familiar with the expected
changelog conventions.
For the next step, should I put the changelog below the --- and resend
the patch?

Charles
