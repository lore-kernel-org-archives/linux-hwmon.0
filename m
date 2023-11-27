Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zv1PaLTg"
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 033F4CE;
	Sun, 26 Nov 2023 23:56:39 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-548f0b7ab11so5355672a12.1;
        Sun, 26 Nov 2023 23:56:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701071797; x=1701676597; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vw5DONpaOmZKpORN5VTyl1JcCJRU9K3rUZjLQIVxxWA=;
        b=Zv1PaLTgJIsNfQnZFmQ0G1wr/20TCkVqmJwJFugqfUyrY2aCnDyXgK0WOAMbryfPyM
         WPE7ysc3UlduFux4tGARV7RuFGNIEk4wTdq9h90GJqv9Stl8t1EizELnbLbVHuYHb8wf
         03LuHNvHAyHHlVRBMiy34TJ91YgcNbJhfa0PxG5/gn4uTkfJtpr674hXwqmlZBF22GAt
         nlTMDhPL8yx6wXb3lql78jjrEfWyggH3K0DCjwknLse00tR5OP3tnsHQCLpktk1CxSHe
         HFnVXAlv6RDJsqE07L1FmVCiIBHvUIoeHr1cMoApg6JpVtemn4XbdWDVwZAhPc8TG3R4
         uNaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701071797; x=1701676597;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vw5DONpaOmZKpORN5VTyl1JcCJRU9K3rUZjLQIVxxWA=;
        b=vfi525MZVhg8czzAVz1LXehnSoXn9Ak56WQfzjaB2MOCPmZ7rt0zt1DBQPMY92tD5L
         9DRkrNcqch/TjaZs7Z99yyZFmKosh96Qhc8uZ+S84E7zrvF+wtiKABKMJFC58HlutG06
         YGsMIUa0sLXci32ZOe5fSqVLT+tb7aiuxQXsYGkGGkm871417cKkLKzwIHqTfab1OCoG
         LEjfZnz0pSDtzJ3kOC8jHvlFz9H5rJ8tlsAmYTPhn1LUP1P/vFnPMxUpgJxlWKXKj2OL
         ouRSqnaRkM5DhoItkj6jAiH6LUmawNgYnLNEPV47bSkOJ05VIentERRuSuIkaO1hZCy2
         Losg==
X-Gm-Message-State: AOJu0YwqbtuCiD9S2Osk8Vokmw1DgVeviOOtWKdwV1rOYxQI1oT3L/nF
	/ZFQp10dyCBcouPkFot6OxVGetrIj9s/6O6k
X-Google-Smtp-Source: AGHT+IHMHnap7DX4Do25VYBW23UwnJUKkF4oHfW3EKr4Ea8hg9YWoPmvnU0WH0Qb7+6pWN2+Hqxh9g==
X-Received: by 2002:a17:906:c285:b0:9be:d55a:81c5 with SMTP id r5-20020a170906c28500b009bed55a81c5mr8155682ejz.60.1701071797131;
        Sun, 26 Nov 2023 23:56:37 -0800 (PST)
Received: from ?IPv6:2001:a61:3456:4e01:6ae:b55a:bd1d:57fc? ([2001:a61:3456:4e01:6ae:b55a:bd1d:57fc])
        by smtp.gmail.com with ESMTPSA id m16-20020a17090679d000b009fcf9f8e526sm5376788ejo.25.2023.11.26.23.56.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Nov 2023 23:56:36 -0800 (PST)
Message-ID: <ac3d17579847686f9800567aecfeb749c04ba759.camel@gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: Add LTC4282 bindings
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Conor Dooley <conor@kernel.org>, nuno.sa@analog.com
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-doc@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, Guenter Roeck
 <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andy@kernel.org>
Date: Mon, 27 Nov 2023 08:56:36 +0100
In-Reply-To: <20231125-chivalry-bargraph-cb6bb2b1ed66@spud>
References: <20231124-ltc4282-support-v2-0-952bf926f83c@analog.com>
	 <20231124-ltc4282-support-v2-1-952bf926f83c@analog.com>
	 <20231125-chivalry-bargraph-cb6bb2b1ed66@spud>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sat, 2023-11-25 at 11:56 +0000, Conor Dooley wrote:
> On Fri, Nov 24, 2023 at 03:18:16PM +0100, Nuno Sa via B4 Relay wrote:
>=20
> > +=C2=A0 adi,gpio1-mode:
> > +=C2=A0=C2=A0=C2=A0 description: Defines the function of the Pin.
> > +=C2=A0=C2=A0=C2=A0 $ref: /schemas/types.yaml#/definitions/string
> > +=C2=A0=C2=A0=C2=A0 enum: [gpio, power_bad, power_good]
> > +
> > +=C2=A0 adi,gpio2-mode:
> > +=C2=A0=C2=A0=C2=A0 description: Defines the function of the Pin.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0 - GPIO Mode.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1 - Acts as an =
input pin and it is feeded into the ADC.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2 - Pulls Low w=
hen the MOSFET is dissipating power (stress).
>=20
> These three descriptions here probably need to be updated, one for being
> too short and these two for still having the integer stuff in the
> descriptions. Otherwise I think this is looking okay.
>=20

Yeah, the integer stuff are leftovers. I can also try to add more into the
description.

- Nuno S=C3=A1
>=20
