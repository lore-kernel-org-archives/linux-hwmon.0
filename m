Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WpKMgZcl"
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 026D310EF;
	Wed, 29 Nov 2023 08:21:36 -0800 (PST)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-a03a900956dso211856666b.1;
        Wed, 29 Nov 2023 08:21:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701274894; x=1701879694; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WJHcxsyCuO5jfq20DdxN0Xy0rqvWVqdfgS77h1CsJ8Y=;
        b=WpKMgZcln11eSTVtmyDVVuxAOjxO7GSvxfSAnbGhQShugJuMDwM1VzoBL6bxnFt+m4
         vrNfYKYtW8koLUomwGmRUTAZ2HBN0ETj44SCojKdTeNc0IzUMrFxE84sz2M3zGRwDmkU
         DjA/TGJCprvLsJqJvVg6kcSF2LzwuBjxFt059UJE+lNy9eaNAVd9Nugw7BxGcFP5JmKS
         wteyzwYtdx2uSzGqEP6JPneO0eWYs/9kq1oSecc1wDzSC3qyoryE2O+I8EH5B1uC8O4e
         Otr8Ea4VWcXYQ4vJXeNw4P+9a0wvtcT9/3a2I5LMiZ2/Qh4pfemvW/lATCydE91DeQc1
         mZ2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701274894; x=1701879694;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WJHcxsyCuO5jfq20DdxN0Xy0rqvWVqdfgS77h1CsJ8Y=;
        b=NYMAl/JakIKucofJAry50V2VjvfEwO1f0+bto3ruTL5YKlYBRUbByFWw4vGtUkvEUe
         ++wzJQJeqd2EsotS/qvooklBH4dmUmQPpO32jWWV9jbwNFg6eCZlpH3F+fAD+glKSFOC
         lW+8MiP47mrKbO1EP3npcVqLvU1eaqiQk7PhyCnKx2hu4uV/KModyjhqcfZyGI4Di5Lt
         YWQkZ3VM2lqxCalMMgUdrCjcWsRT+7mvCfadh3MbnOhLWb5vs0dP8sq9P6P08BaCg6v5
         dO2L9j546MUx2jStYeuMLk4feaZIfLdmQFeA67JUpNFT6+W5cF5VDG3yMmsQuDYVhUfw
         11bg==
X-Gm-Message-State: AOJu0YyIYsN+GPHkKBt/EVRW71r12313NkkHUiYHXEUZR+RJJorIdovk
	sdbvjJk5+mmFUn2XWjd6x1Y=
X-Google-Smtp-Source: AGHT+IH4EFqSuuZGCurYaKfETbcvilxco2xCrvJUYclXfnUU2/v9u7aihyeBcZgiC9Q7ypu+3XqEYg==
X-Received: by 2002:a17:906:11e:b0:a01:ae9a:c1d3 with SMTP id 30-20020a170906011e00b00a01ae9ac1d3mr18436616eje.11.1701274894133;
        Wed, 29 Nov 2023 08:21:34 -0800 (PST)
Received: from ?IPv6:2001:a61:3456:4e01:6ae:b55a:bd1d:57fc? ([2001:a61:3456:4e01:6ae:b55a:bd1d:57fc])
        by smtp.gmail.com with ESMTPSA id f3-20020a170906c08300b00a0a25541153sm6278275ejz.93.2023.11.29.08.21.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 08:21:33 -0800 (PST)
Message-ID: <41bba20f6417333919294eedd9860dee7f0fc01f.camel@gmail.com>
Subject: Re: [PATCH v2 2/2] hwmon: ltc4282: add support for the LTC4282 chip
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Andy Shevchenko <andy@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, nuno.sa@analog.com, 
 linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-doc@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, Guenter Roeck
 <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 29 Nov 2023 17:21:28 +0100
In-Reply-To: <ZWdkXakM4lRe1bij@smile.fi.intel.com>
References: <20231124-ltc4282-support-v2-0-952bf926f83c@analog.com>
	 <20231124-ltc4282-support-v2-2-952bf926f83c@analog.com>
	 <CACRpkdaksfS4WLNQ6ohauAPq3z2LPG2uF37_jWtm0brQHaDtNw@mail.gmail.com>
	 <6384831c05b8ceeaf4a16cf9229770252989b762.camel@gmail.com>
	 <ZWdkXakM4lRe1bij@smile.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2023-11-29 at 18:18 +0200, Andy Shevchenko wrote:
> On Wed, Nov 29, 2023 at 05:08:41PM +0100, Nuno S=C3=A1 wrote:
> > On Wed, 2023-11-29 at 15:49 +0100, Linus Walleij wrote:
> > > On Fri, Nov 24, 2023 at 3:18=E2=80=AFPM Nuno Sa via B4 Relay
> > > <devnull+nuno.sa.analog.com@kernel.org> wrote:
>=20
> ...
>=20
> > > Other than that it looks fine.
> >=20
> > Cool, I actually thought that having the direction + get/set stuff woul=
d be
> > weird given the fact that we can only PULL_LOW or HIGH_Z the pins.
>=20
> Oh, then it's probably should be a pin config involved.
>=20

Well, that was what I stated in the cover [1]. Please give a look and see i=
f what I'm
saying in there makes any sense.

[1]: https://lore.kernel.org/linux-hwmon/20231110151905.1659873-1-nuno.sa@a=
nalog.com/
