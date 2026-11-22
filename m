Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795373504;
	b=sLpI+cJEZu7saBl1Xxv3XD9nhrieQ0WsDv+MpOF+0m+a1iWNAh4H+Ose4I4FpzLE8VdO
	 VaKVLBCKXosfClq6VRYOADJFvC8uCcc+dRXBxSghjEsNqwfkwtyPZ003Hz85a3XAoRygj
	 qGnx2OCZhbXG/VmrohCSEyJGASq5GxSN1aE2PMCie7Usv3k4kWfxWgIwJUU5k4VqOnh5t
	 +dKbQALJvwR8UU3cNlBH50CYwoSJ/ZOCCSGeE/AnAxZoQdeSv3Lmo/dC2Lr2zjyUIqssx
	 35XtZ5s26h9tY3yo2eyRANteqY1FCwkU7HJ541b86vKnkBbxRmmRzfo5fzMo2BB3+TA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795373504;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=IFxEKJMtZIkQGZKfSYRvowzKuK7BCrlRO/z3l0BUM3Q=;
	b=yk+pWVTYr+1co8k4d/8Wy5vH9LXWRhXOAM6abVIWtx/d56yKPMam0SD8JvIDOJ7cKxXC
	 2QpEX9cZWHB6f+dTvI2kPqyIacbD4XaUKuPw9HBilxBDN+iYL+0aGB3DQgDPqOIUTiXaN
	 TKlIskusVoOaFbNXrTFWnpswEA15H+FJS/bpYQMTk4DDsiIDImqbOgVX0SSIz4HvXnWM2
	 J9qZL77OC2v8MDIAuwdhAf8LmkRDvctOK+KcLNjbQ+pc2XzHur9C4JyiFBaT+kgyK3s/D
	 GlmM009EkmAo1FWMzBZMkeXeFPJR6TFkc7eRemRiXwA7kZ6FGElDp27LauWfipxnhdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P4Bh+w3u;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76CC3606A320
	for <linux-hwmon@vger.kernel.org>; Sun, 22 Nov 2026 18:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P4Bh+w3u
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E2941F000F2
	for <linux-hwmon@vger.kernel.org>; Sun, 22 Nov 2026 18:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795373504;
	bh=IFxEKJMtZIkQGZKfSYRvowzKuK7BCrlRO/z3l0BUM3Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=P4Bh+w3u3ol1/38SJqbi7YQPNIQLnKht8tYqK1cfs1csG8iQYxpq+W8AYSILWV6Oh
	 ymhYWmDyxJ0t6cEKdMuYvQ01nncHAXKblQrtMpLlhuaWr2Z/aEK3GT+mB9IKo0g26q
	 vi4X/D+9E7Eon/wbX3bz/TlZKLWmnOuxNQu5YzorVCj3XEuYI7jQVo0b4Fq8gknUuj
	 +J4m+UTs0rFzS2m+KvN0mLgJr5t8Pd7pu0iWTRdsnUe1ox60LZAjFuzMh4JCQIesas
	 NHsKm6mUgzcq7su3jZVBGHrPncMDJFCYqBY6IP20xP7aSuNzDF8cvmYSlAPGTgnUNm
	 y859TQRKxitrw==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5c1479a959aso1785124e87.2
        for <linux-hwmon@vger.kernel.org>; Sun, 22 Nov 2026 10:51:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEgXh7hCRfD/R2LDFHabrOyVgKPnAJ7BGSxPrb9+Z7aFrOjyEPCClsEh19cu/rJYmxE7lrI4lTMqAZTnQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/QGLiNviVjQpZSSFuLHsoYFrasHLAQmzJ4BUIB5q+CjigHxuvy
	ccnP8uyxNHzJJRZC1GGC3svhDyl3VhCV1uxLwKWgaLf3G9piEkZ2kqUQ0hDbITk0eCHHE34RTHx
	qjSRnz6qg2xYfdfPJQdJbEiTFJUsuTXc=
X-Received: by 2002:a05:6512:b14:b0:5c1:c4b4:a3e5 with SMTP id
 2adb3069b0e04-5c1c4b4a448mr1963937e87.27.1795373502781; Sun, 22 Nov 2026
 10:51:42 -0800 (PST)
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117-xg6846b-bcmbca-xrdp-reset-v5-0-f584e8b8e696@kernel.org>
 <20261117-xg6846b-bcmbca-xrdp-reset-v5-2-f584e8b8e696@kernel.org> <179510274338.63755.13074299296013371295@kernel.org>
In-Reply-To: <179510274338.63755.13074299296013371295@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 22 Nov 2026 19:51:29 +0100
X-Gmail-Original-Message-ID: <CAD++jLkOUTrjAgnV=giaKx7JBnw2hKJt+-Fc1nyiucbZLLz5=A@mail.gmail.com>
X-Gm-Features: Aa3M54oi40sU1I-FOZgHO1ergrn0hI-8Xi2jBLE3eOccsrb0FB_MO_lAfbrL4AE
Message-ID: <CAD++jLkOUTrjAgnV=giaKx7JBnw2hKJt+-Fc1nyiucbZLLz5=A@mail.gmail.com>
Subject: Re: [PATCH v5 2/6] mfd: bcmbca-pmb: Add a shared BCMBCA PMC3 PMB transport
To: Lee Jones <lee@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, William Zhang <william.zhang@broadcom.com>, 
	Anand Gore <anand.gore@broadcom.com>, Kursad Oney <kursad.oney@broadcom.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Rafal Milecki <rafal@milecki.pl>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Guenter Roeck <linux@roeck-us.net>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, Ulf Hansson <ulfh@kernel.org>, 
	Benjamin Larsson <benjamin.larsson@genexis.eu>, mfd@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 7:49=E2=80=AFPM Lee Jones <lee@kernel.org> wrote:

> Some inline review comments, but the chewy stuff is at the bottom.
>
> --- checkpatch.pl (2 issues) ---
> Line 51: WARNING: please write a help paragraph that fully describes the =
config symbol with at least 4 lines
> Line 374: WARNING: DT compatible string "brcm,bcm6846-pmb" appears un-doc=
umented -- check ./Documentation/devicetree/bindings/
> ----------------------------------
>
> ?

I don't get it either. The compatible is right there in the DT binding
patch 1/6...

+    properties:
+      compatible:
+        const: brcm,bcm6846-pmb

So ... was it checked on a branch withour patch 1/6?

The rest of the comments are completely reasonable, especially I
should know very well to use MFD_CELL and guarded mutexes.

Iterating and fixing.

Maybe the next version will look more appetizing!

Yours,
Linus Walleij
