Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794397977;
	b=a0jC/18hO8UEuxbHxqu4WezD+644tgZ+9Nw43QhIdNghUoJReMvF434DTCnxrB8M1wyt
	 Zdf1MUVIsUqeiqaScfZPE64D77oHcTDk2yotMxsY7JX5cHGVuCy5ZID34KjNsyjDrEhzI
	 kGSWikW6fpwapfA3MX3F3c3qYs/w5d7zJvbC0ne/5wmntBTZ4KXb9Zgdo71czBbKUHS19
	 De9c2ai8cS7c9zI/vbf9WeIiCzOD8qcy6YocPmsm4p6V6okVpE3/fnsP3gUhX+5Y3NyYz
	 BLfpHjoBEEGyhYs58uA46mLeyA/iDUulWEGFjUYkJ0Ej8+t2AmvRDuowgy5BQBjkBkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794397977;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=MpHh2GYNJRtOhiRbv+gl4MVWrtLcyIbDIAcJ3i7bHZo=;
	b=k9GkGULtjJEM+hEo0IL2+j91JCS0m9BD/IERx5ikVEdfUQXCuKRKG2kSOvX9O47m+LYH
	 VavW/WKiSzmUNAnWhFegtKKSATwOYKwYepOvvhb6TdE111Z5FKtTI7/sPBvZx4XWp7dvX
	 ikQB/ttomUbZpoTAGf/qf52bliYwqKpFNoq8FF+pwIGlNxJS15raXvlATnkcsxTHv/djT
	 izqVd7OSbX8D0L7kovxRH7CZB3+G+WQHrSQPyFpj9DS8PpPMhf3M3aBIXrNk6AVJVTwqG
	 A0zFOP9NjmED2lYXZVTErOzZGs2QRbwJ4dczTjqJfrDM5rEdq17yTo2MWQ1l0u2UIcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="nEO/Sns4";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C866F606A327
	for <linux-hwmon@vger.kernel.org>; Wed, 11 Nov 2026 11:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nEO/Sns4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7853E1F00A0C
	for <linux-hwmon@vger.kernel.org>; Wed, 11 Nov 2026 11:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794397977;
	bh=MpHh2GYNJRtOhiRbv+gl4MVWrtLcyIbDIAcJ3i7bHZo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=nEO/Sns4SgkX25DJRlGI4E7B61nZ+38OvpTIjlYgqCAzSEtzxMfTToh4zV/TvfOuP
	 7dsDlsKRAdcPNKg4jd0cF3HXsnai+5EiujODNzc2dBWQ0f7vzT2n5F9ejZsg0NxUnn
	 Ef1S4W/FVDaciFpTmvqKOsRgPFf45/jQru8+wr+YcEkI1GranxNVbBNpx0qKaoeuIK
	 JuLgV2iPhhYfRhlwTJlC6awPCByHfJlofyKile4lFdlM7OERj9QGoXtKDq+Fy94/Tq
	 OlZ3gqACcY4TKf/WgF9k1AKKK2jToOWgQyrl+JCHvMxIntRRdzftVuD0ltTZ/Jw3kQ
	 F00jsHD2BHVjg==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3ab3b29a1d4so25764851fa.1
        for <linux-hwmon@vger.kernel.org>; Wed, 11 Nov 2026 03:52:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHjhmKg2wvn4/MvXhwY7Ons7czyA3l6xGfvVK8gJWdLYWt/ltpJ2YrBucrVH9KSZtUZs6+7pZsH2I4qDQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/Djo3lc9RHzQUEQ5uXmcmJ9z6iRL8YELJYDkExn7F3pDHIxOb/
	F0JTm603AHLietK4i4FgoJhL8Rr+1oXHJHuCbUQwpB1oeNNZnasu6k6u3P33xLO8FGEYo84jqU7
	XDFjZgDFVo7ETqTiIExOEoFzcNcmmkrE=
X-Received: by 2002:a05:651c:41c6:b0:3ab:43ca:1daa with SMTP id
 38308e7fff4ca-3ae125cd671mr4824141fa.3.1794397976185; Wed, 11 Nov 2026
 03:52:56 -0800 (PST)
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111-xg6846b-bcmbca-xrdp-reset-v4-0-17035a5e8ad2@kernel.org>
 <20261111-xg6846b-bcmbca-xrdp-reset-v4-1-17035a5e8ad2@kernel.org> <sashiko-outbox-208856@kernel.org>
In-Reply-To: <sashiko-outbox-208856@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 11 Nov 2026 12:52:44 +0100
X-Gmail-Original-Message-ID: <CAD++jLkZXwXhHhvjQvbc4AT6Zt8mBVL0yujKoZOU+MsLvFFOng@mail.gmail.com>
X-Gm-Features: AclHuK8sYNT8b4r7s3hjp4u_srEnhvmeaQbZaxImLpGAFvZ6UoeInuaEUc5FNMg
Message-ID: <CAD++jLkZXwXhHhvjQvbc4AT6Zt8mBVL0yujKoZOU+MsLvFFOng@mail.gmail.com>
Subject: Re: [PATCH v4 1/7] dt-bindings: soc: Describe the BCM6846 Power
 Management Bus
To: sashiko-reviews@lists.linux.dev
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, 
	lee@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2026 at 12:11=E2=80=AFPM <sashiko-bot@kernel.org> wrote:

> [Severity: Medium]
> As reported by Philipp Zabel on RFC [1], should #clock-cells,
> #power-domain-cells, #reset-cells, #thermal-sensor-cells, and the
> reference clock be placed directly on the brcm,bcm6846-pmb node instead
> of requiring four address-less child nodes?

As was pointed out at device tree review these are different discrete devic=
es
and it does not properly model the hardware to bring them all into one node=
,
they also use resoures from each other so this will look super-messy if the
same node is requesting a host of resources from itsef.

IOW look at the later submissions and it's clear that this doesn't work.

Yours,
Linus Walleij
