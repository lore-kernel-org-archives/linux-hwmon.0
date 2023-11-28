Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H9pKmYpw"
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com [IPv6:2607:f8b0:4864:20::f32])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE983D4B;
	Tue, 28 Nov 2023 09:01:47 -0800 (PST)
Received: by mail-qv1-xf32.google.com with SMTP id 6a1803df08f44-67a295e40baso18800576d6.1;
        Tue, 28 Nov 2023 09:01:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701190907; x=1701795707; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9PqjX8MOTxb1SOKCk/xBi+5E9akrq+S2fSUS82B/9Jw=;
        b=H9pKmYpwkbTQw9ARYG2xZMJP3khjDaaN71Bbvr0SfQ7hslNjQLUzDzpWNI6kkCJBox
         bvl3bg1QZOw5NRHj0ctLivTy7GQWqJpiTuRBWMyv082rAFgSSO2a6LVHYu7SDspQZ6It
         QcaawZkfaN6jpTVjewV0kxMWqaZdSGHjXHFKgB/+wfbRK72N9f44b1MDn9eegqlsn3I5
         u2wh/916Tm+W0FcnE8CLz2hYD9LSqO6GVDklplfFwUtLA4uP2HuMY2LX1IT9ZGKYoYGB
         BrZQW8qgWxn3yjP8MMU2eCHQ56AMIYQ5NfMX7CjD9etCh2G2xsTdA5nkjMrGEQKmVPqM
         L87w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701190907; x=1701795707;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9PqjX8MOTxb1SOKCk/xBi+5E9akrq+S2fSUS82B/9Jw=;
        b=uF3lZbO0gb0+PTM3f9Cxop0FCpjzAIBJpn41bExgtIh7EzjhGV3HxEyA4OzxqLtiCn
         IfNtvQgRsneKs8hqs5qHpyF5VR94/wUMeUAWLlHFMQSysdqhJn2lXa8H06tsqZsbFeIr
         JmuIWKChQIx+5B+7ge8WystTH/hdjr8xKRBLKZAnxW+J0Dfy2L+YT9AxKaNAz7Qr0jf3
         0VjwIk7mbiDRVAyJRu6rxHKZ1K/QxgpBvhyg0INIfzmsSgt/2SfJJcKdRuuTHRs8Pend
         aDK+hIuHPa29jiMWXjOJMd31ufDGzXGL/UV20QV4aUqENaAU2PjXc9/qM+a6QJZ4vioB
         4Rvw==
X-Gm-Message-State: AOJu0YwQAMtc76g98TeSXuKpOWACaPTFt8bpOLtHVb+9gmTWH7nVbxKb
	wCt8lIVj7yhnVdGLNfaI9YIY+bOlQzVe7WqTpKmCZSH9Jf0=
X-Google-Smtp-Source: AGHT+IEMZ3vVr6Jl4jSd075/USecySxeDQcTTDwr/o/Vk4iia4tS13RutWkwZH6QfLRK6EpZ7s8lHcNMTPCB4mP0c7o=
X-Received: by 2002:a05:6214:8ea:b0:675:3fed:ed with SMTP id
 dr10-20020a05621408ea00b006753fed00edmr16716189qvb.44.1701190906747; Tue, 28
 Nov 2023 09:01:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231124-ltc4282-support-v2-2-952bf926f83c@analog.com>
 <202311250548.lUn3bm1A-lkp@intel.com> <fb2aaa4c69c88738499dfbf46ef93e3b81ca93cb.camel@gmail.com>
 <76957975-56e7-489e-9c79-086b6c1ffe89@kernel.org> <ac950d01-d9aa-4fb7-810d-b21335e4cc94@kernel.org>
 <ZWS90GQTJWA7DrML@smile.fi.intel.com> <bcc5da24-7243-42fa-a82b-48851ce17c0c@kernel.org>
In-Reply-To: <bcc5da24-7243-42fa-a82b-48851ce17c0c@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 28 Nov 2023 19:01:10 +0200
Message-ID: <CAHp75VdwiFLBtxm6vpM1dmrw_UTJ6cZSHQ0yQwKD1ngag7JRDw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] hwmon: ltc4282: add support for the LTC4282 chip
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>, =?UTF-8?B?TnVubyBTw6E=?= <noname.nuno@gmail.com>, 
	kernel test robot <lkp@intel.com>, 
	Nuno Sa via B4 Relay <devnull+nuno.sa.analog.com@kernel.org>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org, 
	oe-kbuild-all@lists.linux.dev, Jean Delvare <jdelvare@suse.com>, 
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 28, 2023 at 6:51=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
> On 27/11/2023 17:03, Andy Shevchenko wrote:
> > On Mon, Nov 27, 2023 at 09:12:14AM +0100, Krzysztof Kozlowski wrote:
> >> On 27/11/2023 09:10, Krzysztof Kozlowski wrote:

...

> >> Wait, this was not even unusual test, just standard compile, which mea=
ns
> >> you did not do basic tests on your end. You must build your new driver
> >> with W=3D1, smatch, sparse and coccinelle before sending upstream.
> >
> > Well, sparse is lagging in development, for the last year it's at least=
 two
> > times it broke kernel builds because of being not ready for the new stu=
ff used
> > in the kernel. Do we have anybody to sync this? I don't think so, hence
> > requiring this from developer is doubtful. Otherwise I agree, that basi=
c
> > compilation with GCC/LLVM must be done.
>
> Sparse still detects several issues and handles lock annotations, so it
> is useful.

Absolutely.

> But if you disagree with that part, I still insist on Smatch
> (which is actively developed and works great) and Coccinelle (also
> actively developed).

No disagreement on the usefulness of the sparse, my point is that its
development is lagging and hence diminishes the value of the tool to
the developer.

--=20
With Best Regards,
Andy Shevchenko
