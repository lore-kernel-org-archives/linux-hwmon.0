Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795386470;
	b=DrBKRSVcGrqXZ48tPdi7Aq824C7Tg6vTCRmPGaUhpNgxwRljgR59La1RX+q/UJXLFUM4
	 3DOAiIVhwi7XS8qrxx5tNgQXNNwlWBfQWoWUVEnqr+Ov/Y2sltcWZ3nbtTh6elF5moppT
	 2GGxWG04h0Z1OlBjTKxlzaPXF5wIL1btPw/ObmZSONGRTIsM5sBLYFl5rb3bzRD1NTNcG
	 PWJDOr7WBqxSF5xEVkLXRNjrNWw+46EoFq+gXNe8+DlSD0hPum2Tsc13rcljVZfxWnfJ5
	 nv+DN/4vOBVWO4Dm7kJlZ6LxImZC2QH6EYOHhWiH4XtRKEB59yA6sOgeHyLpM6ktQng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795386470;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=w5lzEcxKiqL3BlJi55P+ZDsd5CgUkyW/04MW4YNJirg=;
	b=sXvPSJs4detuzXlrzgbzydMWIcj7L2IfcT/wkSHA/V8WgPVB3ShwHhUqapYE7pVQpOjR
	 2XrH8+6Ih1EkpHPzw9ibrx/H/XUn+qRvA60DEM/09Stvf6U7V8EEPM0e9PiqeXllYlHvc
	 xApY9/JhWb2qoOozjKhQa9JEjRaszZlUjZJuus6WYFoxmtXNI3uwvanfidHnsbNbYnMSm
	 9rNOviWqmN7gFgFQmH3LwjdYPa45+VE3vw6UT0vTb8+m0zHONmCSt45W7rzxwLIgVpw5T
	 Vi6f/XvHamAjIgx0hQctHMIjTfnX3m9Y/OhsK+Rr9SvFR4a622jWH1Redcl4hevOGSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OPvl8hLv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA60606A32E
	for <linux-hwmon@vger.kernel.org>; Sun, 22 Nov 2026 22:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OPvl8hLv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D84E1F000D0
	for <linux-hwmon@vger.kernel.org>; Sun, 22 Nov 2026 22:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795386469;
	bh=w5lzEcxKiqL3BlJi55P+ZDsd5CgUkyW/04MW4YNJirg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=OPvl8hLvtrJ9LTOBEzIfEHa7NVs6FlgdJ+UxySXJn2+owzPa+Vt+9mCch0yAryTlK
	 LiKkgt60uDzMuqGl1g+KQ2E7Kef2Z95xFZhXCWSyepJwA5mw5jkHgWBgaL+/ouNCPi
	 5Me0XAMpJtZOkyXWRKDg50hVESo6gA3s14fPpvaML3vODe8cqYANeTW9By5ZqlvQbZ
	 DW+O4gYiXt5DMKWYBwjgNlyOQxL5nEdqGbETlusikGuwdWedfspjl0dhUgXu2GpTS3
	 xA9Te218tcwx8GuRMHtb97FMKihXyRGlEDeWaIPIFF6LvLCr1FLoOJjV/zkYoce/4u
	 RKUCUZuB26tZg==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5c0a520df2eso2548433e87.0
        for <linux-hwmon@vger.kernel.org>; Sun, 22 Nov 2026 14:27:49 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEcFcsX262liKtI4n9OHb3vesMt7dTs8FzSXl5mNJC5c1rgP4EoKxdSGIGuZTLrMloALdAdgk1BENf+zg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/LYvLSjPJzdqLuy0RXweie6mcArxK3Uyy47abwl6PesEXf+eOq
	yHDeSgaH/n54EZesTIVeNpx0sVB4o1tFVRXTgj/nGx0J8CtI2ueAQpi+O+D+nCb+X4h+U99dJJJ
	0h1PY9eqrd2gkheXBmmHw8xQsrfqObgk=
X-Received: by 2002:a05:6512:3da4:b0:5c1:a828:499d with SMTP id
 2adb3069b0e04-5c1bc8a0f66mr2723779e87.45.1795386467998; Sun, 22 Nov 2026
 14:27:47 -0800 (PST)
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122-xg6846b-bcmbca-xrdp-reset-v6-0-bf2104a25095@kernel.org>
 <20261122-xg6846b-bcmbca-xrdp-reset-v6-1-bf2104a25095@kernel.org> <sashiko-outbox-228331@kernel.org>
In-Reply-To: <sashiko-outbox-228331@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 22 Nov 2026 23:27:35 +0100
X-Gmail-Original-Message-ID: <CAD++jLkLv3BvUY36m+2F+48m8ZQ-uedK1wbGh=AUHNNfB_Vw=Q@mail.gmail.com>
X-Gm-Features: Aa3M54ok4call33uc2w-wg1Lc8Py5tmJgq7aasSbEWB6j45V_SSTm-IdEboSNII
Message-ID: <CAD++jLkLv3BvUY36m+2F+48m8ZQ-uedK1wbGh=AUHNNfB_Vw=Q@mail.gmail.com>
Subject: Re: [PATCH v6 1/6] dt-bindings: mfd: Describe the BCM6846 PMC complex
To: sashiko-reviews@lists.linux.dev
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, 
	lee@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 22, 2026 at 9:39=E2=80=AFPM <sashiko-bot@kernel.org> wrote:

> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] dt-bindings: mfd: bcm6846-pmc: child nodes split PMB by Linux
>   subsystem

Parroting, Sashiko. This has been addressed in earlier iterations.

Yours,
Linus Walleij
