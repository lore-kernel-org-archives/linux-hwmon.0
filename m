Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793608563;
	b=2Luhmd4OlMk/4bjXkPqronakMBM8VbB3Ngcd2hDuqzPpBtNVg+o+HT47r9APLLjUPbpa
	 g2xswI70QYZguUeuKU3sq6v72Au76P/kEqM8qr2K3CC7CAn/K3E779p7T8eOzLCSNqKh5
	 BsVD0OAtwnAd/LD7zBmUXKUxZOiSdHXfcD6iw4oUi5h1Z0a/pz+olRAKz2GNNacFU2vOM
	 8/xqoMJ4Ibf/InuHZ43wj2hlteq8/eCa91tsCexUOTf5u2OcpjS1bGuc9HMqr9DG7brm+
	 R4PYyZuXOYLod5AUsmwX/39iAwt+R9eWC3lBVz5swZlWHu/Qt+rJX1J/T2DZV9EL6Nw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793608563;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=3I1uuTK8iNGnY6KeDyQT2SJpiIheh8weAr6k39okB38=;
	b=Mb+rilkT6t+j/zQ3S57mBTcRclrCa0cUmJ7XWrEw5OoZ/VGjQieWaGbBfVq83RTKSWTD
	 JcK2wmudUjqIex/nxqVCr1J+VErzm79ASaBqFaTVjrhBm5OEKZ/zDpSTFD8VenHiPKs8n
	 xgX+kF4PRxYVTaCjfatbCXnlMrDG97kM1qT7FOPfeMG6wkvrSZLJeSek79vO5O2Rkqvec
	 b2MevMzT0Tq73hmTNAAfMP50g0aPcmSfU8HPaN4q6YivjqesomNpYCEH7hAwv7tsG9hC2
	 N4KqftlGdNfZWkKu1fC25WeKkMw7rYtifLV1OPpzFjxvO3A4x14tXkHl0n/YUxniKKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hdABaKXz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11C71606A329
	for <linux-hwmon@vger.kernel.org>; Mon,  2 Nov 2026 08:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hdABaKXz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4F2B1F00A02
	for <linux-hwmon@vger.kernel.org>; Mon,  2 Nov 2026 08:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793608562;
	bh=3I1uuTK8iNGnY6KeDyQT2SJpiIheh8weAr6k39okB38=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=hdABaKXzq0B4SwXeyHCCqSwSU3vJyC+ldceFfAJyMRZWrIBdsakGPUYRfdxQx/ypE
	 Lpg/33AhBWlgmr8oRRige0T+yKHd9hK5JoTEkn8Nx9Asi3ZpDFHYK0BIrUEdlyvbDa
	 L2+50CwShXR8ZwouotMTjvXXhPAy9RUeoCDKiBtVGL+gHclt7+pjxliMQHFJy3n52H
	 NCmyMKf7GHzRDKoyAKBewfsj520ZY9JXITED0b6Sb+RDozE0fdFnMjRSCij9e88nPV
	 qVGT0UON20kxht6fzLa/EcWlJOCQ16jZ7lXpXxUmAkx54mZv9+JbOjUG6xQDZBDYVS
	 6t6li/Ov/DBIw==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5bfa686881fso2126524e87.2
        for <linux-hwmon@vger.kernel.org>; Mon, 02 Nov 2026 00:36:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwBNc9ET87YH5e4cpAc4E4gpxQWwrFDVPzm5GpTub9RomZ9/5lUO23oTO1XBHh90aeGU/BxD/UMZeSgdQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+e7xRFB5jExNr6Gi0uCPXzYOWdUgAMItbr3B08qLxOdWJ+tdMN
	GweaOatdJWdyhkzyQy3n9ZcFL7uxZ613C9GaFHFaxBVJQrQu1aIRELYhq/JHbSGYcJMXbKZVWzh
	5XQOY5kCCUtfdC9Dg+gQBuecPCa5YN3w=
X-Received: by 2002:a05:6512:131c:b0:5bf:d10a:f36 with SMTP id
 2adb3069b0e04-5bfd9587203mr3108280e87.33.1793608561349; Mon, 02 Nov 2026
 00:36:01 -0800 (PST)
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101-xg6846b-bcmbca-xrdp-reset-v2-0-455fe9eed5ee@kernel.org>
 <CAHi4H7GOMM9K6XG15vPyFMLOza3QQ7QPxUkCi85jA_e9D6YbKg@mail.gmail.com> <CAD++jLkqAXYTT5Y1iXjxc-W4s62OZJidsxJc-i9YsOOHW3MzUQ@mail.gmail.com>
In-Reply-To: <CAD++jLkqAXYTT5Y1iXjxc-W4s62OZJidsxJc-i9YsOOHW3MzUQ@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 2 Nov 2026 09:35:47 +0100
X-Gmail-Original-Message-ID: <CAD++jLmSaQvhb88T-Htbxo5Zraw-rWExtwd+xyKeh_e_nx6vcw@mail.gmail.com>
X-Gm-Features: AclHuK9G3q47tXvjcobM5d9UVt8ByEn8Or5PP0D0xsQOLYPH6bGFA6p8ZVR0NF4
Message-ID: <CAD++jLmSaQvhb88T-Htbxo5Zraw-rWExtwd+xyKeh_e_nx6vcw@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] BCMBCA PMB clock, reset and hardware monitoring support
To: William Zhang <william.zhang@broadcom.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Anand Gore <anand.gore@broadcom.com>, Kursad Oney <kursad.oney@broadcom.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Guenter Roeck <linux@roeck-us.net>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, 
	Benjamin Larsson <benjamin.larsson@genexis.eu>, mfd@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 8:50=E2=80=AFAM Linus Walleij <linusw@kernel.org> wr=
ote:
> On Mon, Nov 2, 2026 at 5:33=E2=80=AFAM William Zhang <william.zhang@broad=
com.com> wrote:
>
> > > Inside the PMC is the PMB, the processor monitor bus. This bridges
>
> > Should have pointed this out last time.  PMB: Power Management Bus
>
> I think you did point it out, I just didn't manage to change it everywher=
e,
> hopefully I only missed this one...

Ah no, it was the PMC3 I corrected. OK fixed this everywhere now
for v3, thanks William!

Yours,
Linus Walleij
