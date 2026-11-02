Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793605848;
	b=CjhREb9hnPZ8HsDkQ9Lu22/aSRk+Ju+g3qnXOhyGD+lh96yjv3dhIE9nNXUIQPh/R/xN
	 XxsqMOGmH+DIglxgQ/Xn6e+hkCEgZpekmHpFpd7pfMFr/dhEwXhPrbA9zOEVjlhG7O7gY
	 cRY6artFIzLwTrr5unR+z9ceG8fMLg+ZuqGW65bMJ2fbP60Pm9PD5r/6NdRcl1rPsQU3N
	 Z7NubFTPt4tIOV7adjP+/+wV6YFf4DoVOMMmBhYXShXydfiVfxq7MPxcfk91DUP/S3JR+
	 sJs2+g9wdkBGJoOerQ5WEglPVeYRItM+ErmavZUSQq3dN4PYE3FaGEvvHvs37NuiDSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793605848;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=kfdLzuznSP86OXMBv2cc50+pGlhDjviKqnXgIgBSXeU=;
	b=K3Dsm1Mp8vZJSacVfJERPdA6S0GK7ak6kC1a+Q0FmlXlYszSk667guDHjF8JelXUC3yJ
	 kbn72fmVjaxoEVxgyP7O0bIBUReFoSXu3i3q9no6gP5vARiDWNGtP1zPw7QLRX7hIEck+
	 TuzRTo3s2n3PH/SbczeI1oCRUR75ObdKl730rEIEA01PeJ61h9etbp9z/7I72lkujAwXi
	 X9c2BBhjxQ1ZRQmCGaI1DNhHLCVhiUFpUK42Lto9ZBGjwsvFhSpXv9acc/IYfrxj+znwl
	 u/M4ay++9TWXBacnwhNJx4qoM1qoSEchK4RGjLQ7Ibf/a8zdtdQqj8Gu85LSKQo9pjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78CB5606A329
	for <linux-hwmon@vger.kernel.org>; Mon,  2 Nov 2026 07:50:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 029B91F00A15
	for <linux-hwmon@vger.kernel.org>; Mon,  2 Nov 2026 07:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793605838;
	bh=kfdLzuznSP86OXMBv2cc50+pGlhDjviKqnXgIgBSXeU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=kouic5CkKUn0X0KnSs1wuePb74UNjNwda3bpX00QX1ekyyxJ8FwaWU3wP6Wy1IN/B
	 rAMHTltmOUpaLKipGg6UXleSHzozKeNbk1NWDAjRo0sgHfjHsyMhSGhH6iO1dBVQ+x
	 O3wh6WEDtQyTPj0Tk8qUxscxwXYPtvvQe6M8/etT2g8vmZnAJFnozckVUM+UA4Nt6Z
	 1/3x74j4R85qqXqkQiW4oTvR8nkZat3STfaBOBrP0wQvpRxp0PcWGp/04hHE2RjGls
	 nxRAMLaE6uXGmcoOdBRq6nilE9wX4yZbwz12Gq+UJ0a+bbyBvZDW9XdMYF1JV0TsEM
	 mbsk19b5t2r5A==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5bcb4f23ddeso2544090e87.3
        for <linux-hwmon@vger.kernel.org>; Sun, 01 Nov 2026 23:50:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxGLpXcSui9mi2lNJOsYbJKdof2ejCn3wO5bmHu0k2XeFbsAZWZqsKDUnpQKMqZsUNm7Gpk1N2G/HQwzg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+6Y7r1RraxiwqKI1BZqmuAH9UW7Yk5rNtrzK7+3OK4fi773TXm
	3yLrDOthuto96zUbRxKa9jG9H7diunfOySuo70KbIYBFACQGV/IDdEVDkwU6cvJVID4ETQD2HAS
	w+NgmM4AhqJm/BFArfXh3yl/ZEGH/Gk0=
X-Received: by 2002:a05:6512:15a7:b0:5bf:a7d2:e8a0 with SMTP id
 2adb3069b0e04-5bfd956a316mr2897713e87.24.1793605836758; Sun, 01 Nov 2026
 23:50:36 -0800 (PST)
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101-xg6846b-bcmbca-xrdp-reset-v2-0-455fe9eed5ee@kernel.org> <CAHi4H7GOMM9K6XG15vPyFMLOza3QQ7QPxUkCi85jA_e9D6YbKg@mail.gmail.com>
In-Reply-To: <CAHi4H7GOMM9K6XG15vPyFMLOza3QQ7QPxUkCi85jA_e9D6YbKg@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 2 Nov 2026 08:50:24 +0100
X-Gmail-Original-Message-ID: <CAD++jLkqAXYTT5Y1iXjxc-W4s62OZJidsxJc-i9YsOOHW3MzUQ@mail.gmail.com>
X-Gm-Features: AclHuK9dC-mcHphjDYNUk7hAmH2idhA5q-arw9O8qj4lPel0YZKSwwgRuar-Ksc
Message-ID: <CAD++jLkqAXYTT5Y1iXjxc-W4s62OZJidsxJc-i9YsOOHW3MzUQ@mail.gmail.com>
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

On Mon, Nov 2, 2026 at 5:33=E2=80=AFAM William Zhang <william.zhang@broadco=
m.com> wrote:

> > Inside the PMC is the PMB, the processor monitor bus. This bridges

> Should have pointed this out last time.  PMB: Power Management Bus

I think you did point it out, I just didn't manage to change it everywhere,
hopefully I only missed this one...

Yours,
Linus Walleij
