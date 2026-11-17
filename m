Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794874266;
	b=Ppkd9+oYTgUyLnMH5Q6kBamqxhyhvL1G4PieNC2kwip6a4smS4SDjUNlXqEuV/26zwh2
	 h3UHFuHAbODA6T/Y4f04FkgzDRvkgX7JbOYpzhZpiGN9Lv0chizrLcGtRfhOEFiKgzeQD
	 x4XMtdTFa/Mrq/xEHSgFCPIHtaarhmOFMTlBd6Lk4/tYx8w7tlH7v3SYp0D+l4QziKkAJ
	 N7dq2nWdLfd0PRqrqfcQETgt0xulfjvSsCg1cvN2yk9RiBJkZIbWleBvpUaPVf8G+RiSV
	 QZgSCJdTCk1NdJ57HaXXaW8y/n5z2W2hOHrtZO2m800kGxfXzJnHhuEJBlc13OB5CTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794874266;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=YjKQ2PdbHkjHFZ+hN04dl+fGzrnZtXKbmZaR+wm1jOg=;
	b=RNBzZ1zFx5G+r2YA+PXorWuzGeBMbEeuQIU2M+XFF/GqU37vfFqSBknd90VnMr37vmUO
	 lEyQn5z3aYcL6al/OeVVEoVC6dB8DBYTOIsZYe4Mmue8k1KLOF9+GXJV7cv9PvLutuvWf
	 TBFhc5FkG7HblXwxwqmrAlJResGjRbyIB21UymmE74Vyx1cs1XfZ/inCtJbOkoMPdGmab
	 qhskSme/jp/5iJUyT3ZiQT06n8Y2TKpZeCNPJ2iN3Eu/nCE/4M6c+ilyezTzhSaiYoYgo
	 lCXfcrAM+7i4XZstPpnjS38/TjkVGacYs/dThiXjFuWkM/UxgelBUCZYmNJ5iS5xTwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QZGxqJln;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D05606A329
	for <linux-hwmon@vger.kernel.org>; Tue, 17 Nov 2026 00:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QZGxqJln
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D13B51F000C5
	for <linux-hwmon@vger.kernel.org>; Tue, 17 Nov 2026 00:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794874265;
	bh=YjKQ2PdbHkjHFZ+hN04dl+fGzrnZtXKbmZaR+wm1jOg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=QZGxqJlnFAM93hsizrM154QuW/4jTifan+hgL0/vdwLtJ7Sa3Kt9qXsYyx0Dn9IcO
	 KBYlZmf2GmhMlpygHXpgO3oYd433qlxTMOAA4/GDa2TkY6jS5OC+SJFz5xnjtoSoDD
	 8fKTcIZPrHMnXKlUozahNvcnL/CRVq0OyM6qaSk0EHl+0Rcv2O7gE276rln/sjy82H
	 8V7krPMh+GTWYREisb8jxAFtqyIWTyUXxn4nFKQs5GkClcVxR/rdfjKT+oON3aHd8M
	 Y8RSZKVka5gmPed6iQ/XR3zK+9m7fwofxSbCd/gcr12TcdNXWzuEMAi5iE29rSSHZC
	 O2CdyMDCf+Uvg==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5c14a204305so3630651e87.3
        for <linux-hwmon@vger.kernel.org>; Mon, 16 Nov 2026 16:11:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErH+XHozZTJP+BpvgZrRgV44k5YGamtWIKZ+Q0CCtWbXY/vjvKKd0+40N7a5M3cfUlwH3D/3uxIh9+Jm7Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z9jDxPzZxI+5hPvQo4mscrLT/oSPJKcAXWL3A61a69Try6CGNdY
	WFqRiXgChoFTGR7yUoLkXSLzNsedgNWJcnzazWpOalFMZVApUDWhlGCmEkoOxIDO0OlDILrMUbV
	B6lHTjPyU7FIkkAfvUc9uciM6vJmglUM=
X-Received: by 2002:a05:6512:230e:b0:5c1:4f2b:a2ba with SMTP id
 2adb3069b0e04-5c1709f75b9mr4513682e87.34.1794874264502; Mon, 16 Nov 2026
 16:11:04 -0800 (PST)
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
 <20261117-xg6846b-bcmbca-xrdp-reset-v5-1-f584e8b8e696@kernel.org> <sashiko-outbox-217953@kernel.org>
In-Reply-To: <sashiko-outbox-217953@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 17 Nov 2026 01:10:52 +0100
X-Gmail-Original-Message-ID: <CAD++jLnNALhUhekMvUxes-+Wmq+g01Tck9NNvViy+ofFSL+N4A@mail.gmail.com>
X-Gm-Features: Aa3M54rQwu5Yk_Bv4F8GS-3F1wpvPataOkYjkIAgSEJnOZCG3CWzAbrtg66X8GU
Message-ID: <CAD++jLnNALhUhekMvUxes-+Wmq+g01Tck9NNvViy+ofFSL+N4A@mail.gmail.com>
Subject: Re: [PATCH v5 1/6] dt-bindings: mfd: Describe the BCM6846 PMC complex
To: sashiko-reviews@lists.linux.dev
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, 
	lee@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 12:57=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> [Severity: Medium]
> As reported by Philipp Zabel on RFC [1], why are power-controller,
> clock-controller, reset-controller, and hwmon modeled as separate
> address-less child nodes rather than putting the provider cell properties
> directly on the brcm,bcm6846-pmb node?

Parroting Sashiko.

This question has already been answered in earlier iterations of
the patch.

Yours,
Linus Walleij
