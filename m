Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC9093A1E9A
	for <linux-hwmon@vger.kernel.org>; Mon, 29 Dec 2025 01:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766970169; cv=none; b=LFrWYg9Byqf4m83ZmnZQyEF7Z3gwk05lfmxxpt9qIcrn5zFIitMu4OEglZB6P3/inVbN1LCi+fKrdnp5FFl3gHmv82mKB6tgCgCWzThenvbqMYNA7N4O4YOnTD4iTY5fC2hggGaaHmJKsbMymzWO3xJlpSO90+wOKw8oL5R6iQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766970169; c=relaxed/simple;
	bh=8PsFqhWPWBs5ISCcmLVbxGD3gHbmqyMeDa365kBTSqI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UdG7Ax4A9TH9Ix9BiIewWtDqIS2JXyBX7h341y6rhK0VwxD2+auFUlW2ZrV4r1oc4W7+tiRsRYj0F7UojgJsHZpboKJGMg/KMC8K2pM0ROT25SA3KLLzhff61QV3g9SngNiEK+UFqC2CxdNDz+DUQctAAk+eC+4hyyJbHyIQyg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gFyb9DJ0; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gFyb9DJ0"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b7633027cb2so1549489166b.1
        for <linux-hwmon@vger.kernel.org>; Sun, 28 Dec 2025 17:02:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766970166; x=1767574966; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8PsFqhWPWBs5ISCcmLVbxGD3gHbmqyMeDa365kBTSqI=;
        b=gFyb9DJ0mD7A5/shyLu/l7OAbuW0sjnpjq8EqIAXjZEKmr6FSZDqe0Q243EzFH+ESQ
         /lg2YmdTU7utkdE87a0gCPr7RCqDCbSHtluUGfpJRXs0fR6X4KsOBUyCf8LANo1fA/8A
         shQlBnUVgEx9hj0EXCvUAx0V6U1Z5nQalIDcb84mBo64gpfuVxnHhVwJCvkzUQwY+Lic
         yQBycplhkQwdlSGmXcHL0Lv8KIuH2eo2PonWB+AKpHYtv+ztcZmicL2wWCQkPZ7E9+ld
         lTRKsuswPdlmMa0/clXeiczCIt3Bfacl2eR/V5lJ1CabGzaliuZMTi8+g+9Ehw3Gexde
         gq5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766970166; x=1767574966;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8PsFqhWPWBs5ISCcmLVbxGD3gHbmqyMeDa365kBTSqI=;
        b=VlSdUdlXvwjjc9abf/yzg5DzP1K6xkSJzVjIG5/lZRvuU0oGdRaAPTIsrbdHX4I+gq
         QSHffAWJ1ZVuBR5Rv6oB+Wk7BQcCTAtPTMwRE8O4n2VCI/zD+g29GQtHiwXq517X3TPg
         o9+1uhk3WMV7DznRF43NZUc7+3PpUr4z7tNlXbxxqA6fJVQLlWGq5p4Cb7wXTtgwWJ5w
         7swqKtxt40hEqBUv7fMOj/7CnFz1XxCe3Wh8+Mft0GC+NXROlFjR7j3wgGoF8eqOSCaB
         XPb1i3tHqnM4PegEcyeuWNzGM4OE7mjW47LvG96yjcFSj4XLrJiDkvaga7Ydswic4V9h
         G6cQ==
X-Forwarded-Encrypted: i=1; AJvYcCXVdBiTrgykwcw2cwz2bABWUMIlLKEYBK+lxSZsLAYBMfQPWGCfjwLFnnuKFWhVJxhBvkXiVocc/spWDw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzq6XiwJqDYxt98FLgGCZTZGan+YD9FosY9vtMfAQiocnJwllkq
	oVeMrcR748Ck50KOcRgu+zLi6Pm24xELkEvN/KKXEr82LrAp8QNHbHEzzc5Job2wMoFySv+A4b9
	Bp69WetO5pRD9BT7TedGdZLuWK5sfv2Y=
X-Gm-Gg: AY/fxX5Q5qkIk3qLQWs4c+XLgn4iOUkVixm6Ay5w0Vz+yzS/zNZSEYuE+ySZNT5jr8G
	d02Ks3saKFVduuiB5dtDpgEi78B/qve7cNkdwE0gSa27bzbjPCaDnFxU35rlKxRoETgHjt8WRU0
	2C3Pbvat0/d6fLNWXUw4YO9f0TN918vM8U8FsCefREqyZQleDd9Ls+eZbIZ3JSKkcMQRKpgAam5
	fG0htGLI/fS46m/48CM66R6uVYsIp/Jo3WeaRsw8a6a3Sj8GgOF+WGGcCwPWCQdM2CjOxAp
X-Google-Smtp-Source: AGHT+IF0IXPQk0C4HhJZXawFNHsaGTIn0geCX5EoGqjfqhQpg8FvQc7ds/jfiREC9pa+fJFmx/dK8aQJP4lzul2NfZQ=
X-Received: by 2002:a17:907:dab:b0:b73:880a:fdb7 with SMTP id
 a640c23a62f3a-b80371790d6mr2997016866b.35.1766970166082; Sun, 28 Dec 2025
 17:02:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251224084821.2092169-1-hsu.yungteng@gmail.com>
 <490569f8-a434-4297-b11e-ad34ddc4ae1e@kernel.org> <CAFT9tykPEt+zTREF9C4AXtGp0qDh_65LjHZCK9F=NFhE-K4dGQ@mail.gmail.com>
 <06f97147-5752-4a82-9958-89b138a7d4fe@kernel.org>
In-Reply-To: <06f97147-5752-4a82-9958-89b138a7d4fe@kernel.org>
From: Yungteng Hsu <hsu.yungteng@gmail.com>
Date: Mon, 29 Dec 2025 09:02:35 +0800
X-Gm-Features: AQt7F2oMdsED5iRMhFHoG-r724fBp1Ay7eOq1wTC5-EPCy0ZZVDBKNYSzRNPoqo
Message-ID: <CAFT9tynYM0u_cAqA9YPpoUp7EcVpvcwr_sxrk5K=VNMXDwBE=w@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: hwmon: add STEF48H28
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Krzysztof Kozlowski <krzk@kernel.org> =E6=96=BC 2025=E5=B9=B412=E6=9C=8826=
=E6=97=A5=E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=887:10=E5=AF=AB=E9=81=93=EF=BC=
=9A


>
> On 26/12/2025 03:46, Yungteng Hsu wrote:
> > Krzysztof Kozlowski <krzk@kernel.org> =E6=96=BC 2025=E5=B9=B412=E6=9C=
=8824=E6=97=A5=E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=886:03=E5=AF=AB=E9=81=93=
=EF=BC=9A
> >>
> >> On 24/12/2025 09:48, Charles Hsu wrote:
> >>> Add device tree bindings for the hot-swap controller STEF48H28.
> >>>
> >>> Signed-off-by: Charles Hsu <hsu.yungteng@gmail.com>
> >>> ---
> >>
> >>
> >> Where is any changelog? You keep sending versions but you never
> >> responded, never said what happened with this.
> >>
> > Thank you for your feedback.
> > I realize now that I misunderstood the process.
> > I previously thought that the changes needed to be included in the cove=
r letter.
> > I will follow the proper procedure for discussing updates in the thread=
.
>
> There is no cover letter here at all. You sent only 1/2.
>
Thank you for the clarification.
I would like to confirm the correct approach.
Should the changes be documented in the cover letter, or should they
be written directly in the commit message?
I will resend the complete submission accordingly.
> Best regards,
> Krzysztof
