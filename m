Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE56331586
	for <linux-hwmon@vger.kernel.org>; Fri, 17 Nov 2023 13:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nNj7SAxh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B22FAC433C9
	for <linux-hwmon@vger.kernel.org>; Fri, 17 Nov 2023 13:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700228305;
	bh=rR6dKVnyRomVftoKR5mYehXinFqzyuBAYiTxNZoz+tY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=nNj7SAxh7rluIfbOTZ7z9tU9smPkqFz5ivDeyRSfNUuq5IURVHfpvBTSlkp6ktFRP
	 +RzQVgy054ov0BoaO6e2Nk3tLH4Qvj3MTCWE6lVnoVDWN04XeHGiJkn6ozBnNDT+PT
	 uV+MS7pq4vNF2f3WG4m4oDbTrnWku4oUMI6zUC6PXfIfFrnd7sqOiEwY3o4U2bTRKu
	 89CskSFNuDoF++pCnyA/HMUtvQ1ouQ3rI+Vg25hRtxXitKAGWAGfkHIVYDqxmly1Su
	 qozoyC8qBKANEYgeyAIvU1O+gudnoJsDnY16/JrAEVibxixGOUvkx/HjO4dBMei3t/
	 mJwr2B08G5gUw==
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-da0cfcb9f40so1985947276.2
        for <linux-hwmon@vger.kernel.org>; Fri, 17 Nov 2023 05:38:25 -0800 (PST)
X-Gm-Message-State: AOJu0Yz5rYtuGRlH7pVsoFMif079XNhzg0kelC5A7n6oVHvUrknrr9vG
	Hzj5Zl0o4znMOlPIrwliQo9KoSxxhIy7EBSFXg==
X-Google-Smtp-Source: AGHT+IFZ4e8kF3SKEOoL/8ALTvEQXPjg0GrrUiaK8aL/fJHgL+QRm85QTCK/6DyKW7/dd/iIoI0Cr123xVSmkkmpNYA=
X-Received: by 2002:a25:69cb:0:b0:d7b:9211:51a5 with SMTP id
 e194-20020a2569cb000000b00d7b921151a5mr21063233ybc.44.1700228304868; Fri, 17
 Nov 2023 05:38:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231117000251.1197405-1-linux@roeck-us.net>
In-Reply-To: <20231117000251.1197405-1-linux@roeck-us.net>
From: Rob Herring <robh@kernel.org>
Date: Fri, 17 Nov 2023 07:38:10 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKZFybCghGdg_bw=pcUai39XT92pHbuYK+B9RoXwjFubw@mail.gmail.com>
Message-ID: <CAL_JsqKZFybCghGdg_bw=pcUai39XT92pHbuYK+B9RoXwjFubw@mail.gmail.com>
Subject: Re: [PATCH] hwmon: (nct6775-core) Explicitly initialize
 nct6775_device_names indexes
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>, Jean Delvare <jdelvare@suse.com>, 
	Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 16, 2023 at 6:03=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> =
wrote:
>
> Changing the "kinds" enum start value to be 1-indexed instead of
> 0-indexed caused look-ups in nct6775_device_names[] to be misaligned or
> off the end.
>
> Initialize the string list with explicit indexes.
>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Kees Cook <keescook@chromium.org>
> Fixes: 0a7093e69c1e ("hwmon: nct6775-i2c: Use i2c_get_match_data()")
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  drivers/hwmon/nct6775-core.c | 26 +++++++++++++-------------
>  1 file changed, 13 insertions(+), 13 deletions(-)

Sorry I missed that. Thanks for fixing it.

Reviewed-by: Rob Herring <robh@kernel.org>

Rob
