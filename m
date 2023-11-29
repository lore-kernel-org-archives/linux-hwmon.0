Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b5D5Ibdb"
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AA21D6C;
	Wed, 29 Nov 2023 08:10:02 -0800 (PST)
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2c9c149848fso7847311fa.2;
        Wed, 29 Nov 2023 08:10:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701274201; x=1701879001; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0gVwtVEOP0F6ww9pRY3J7jQpFumQUStnI1asdXzYxfo=;
        b=b5D5IbdbQM7aeRmukJ2UrW9kcuGE4vNWV2mN7wgD6Hlt1/X5fJwjy04c/rr1HyMXeq
         cMC0XgO5KH+xiwAsG1ayHDLDpFUz3hyiJSyhHbfI+kx1VRYIk7nhAJ8Nv91oRjFwfy96
         LwW/arE/wmZeZjJxnVjTNVdxxiJxC79M0hR9CMOFY6V5mfT6bnSSAWdPFOWzIShlLfaz
         nSep9oi1UvhMs3hL57kTPb9u/vwnw5uL7aNXckRkdgdHZWk3/be8keUE99ovhh5AIV5J
         EBW9WbQvwCk2FYzG76gs4oLaIIiRbGZPm/RrBAS+no9VWcxmqsPhxrvt8BLHK6tlkBEU
         o1ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701274201; x=1701879001;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0gVwtVEOP0F6ww9pRY3J7jQpFumQUStnI1asdXzYxfo=;
        b=IrNDOmjV7gRlURaEUDVzZi5UPMO/dnbqIln9AJpBO6ZxuwxMzpMVH2viQPOPXNerdq
         DhadMNR/AqRShq1d6h5HlEEiSUCM4iWjwDG6MYGSU8+/owXemt764YHUC35wzm2pkPbc
         0ZA4I10e5NNJBn4GS+KmuL7wT/LfOoCHS65/ZOQIfab9ddtiZp5Tp5Q6d1HMFeBiHyoe
         YVfMV2Xa2wSwQYS2U4iXyRMUwJovJqFvGCvivIGNKG+T/jbbsX6XH+oQnmvRbhQFu4Q7
         MWcADTJ9wIZhx/m9+PiDmChldmJKB2X9pOWWVZmk/70OvUqNo1EGqzrmIGgAK5eJosn0
         VdPw==
X-Gm-Message-State: AOJu0YzgnC2FH2KKFwbrTnfnF/JGnhd2Emv+a2sjG75Kv1+21X6u7FOi
	7V8APtRUHOPmFfiW1cJfN5Y=
X-Google-Smtp-Source: AGHT+IFNqCQICTcgkfZf93dr7jAtb3Xl5vrjI3kQ4p2Rj/gReXYF32JunlQQf7VmLrKGPTXBU/NW6A==
X-Received: by 2002:a05:651c:1a06:b0:2c9:9953:30ec with SMTP id by6-20020a05651c1a0600b002c9995330ecmr11490543ljb.20.1701274200474;
        Wed, 29 Nov 2023 08:10:00 -0800 (PST)
Received: from ?IPv6:2001:a61:3456:4e01:6ae:b55a:bd1d:57fc? ([2001:a61:3456:4e01:6ae:b55a:bd1d:57fc])
        by smtp.gmail.com with ESMTPSA id cr18-20020a05600004f200b0033304787251sm7876350wrb.17.2023.11.29.08.09.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 08:10:00 -0800 (PST)
Message-ID: <3e709b197c6131cc9bbc324dc19f007de5914ad5.camel@gmail.com>
Subject: Re: [PATCH v2 2/2] hwmon: ltc4282: add support for the LTC4282 chip
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, Krzysztof Kozlowski
 <krzk@kernel.org>,  Andy Shevchenko <andy@kernel.org>
Cc: kernel test robot <lkp@intel.com>, Nuno Sa via B4 Relay
 <devnull+nuno.sa.analog.com@kernel.org>, linux-hwmon@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org, 
 oe-kbuild-all@lists.linux.dev, Jean Delvare <jdelvare@suse.com>, Rob
 Herring <robh+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Jonathan
 Corbet <corbet@lwn.net>, Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij
 <linus.walleij@linaro.org>
Date: Wed, 29 Nov 2023 17:09:59 +0100
In-Reply-To: <53ce752e-4292-479e-8c40-2a96f4c692dc@roeck-us.net>
References: <20231124-ltc4282-support-v2-2-952bf926f83c@analog.com>
	 <202311250548.lUn3bm1A-lkp@intel.com>
	 <fb2aaa4c69c88738499dfbf46ef93e3b81ca93cb.camel@gmail.com>
	 <76957975-56e7-489e-9c79-086b6c1ffe89@kernel.org>
	 <ac950d01-d9aa-4fb7-810d-b21335e4cc94@kernel.org>
	 <ZWS90GQTJWA7DrML@smile.fi.intel.com>
	 <bcc5da24-7243-42fa-a82b-48851ce17c0c@kernel.org>
	 <cacce41f-f1c0-4f76-ab24-c6ea8bb0303f@roeck-us.net>
	 <c7e7b7bedd5b016a29cc86f767cbec533d727ff4.camel@gmail.com>
	 <53ce752e-4292-479e-8c40-2a96f4c692dc@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2023-11-29 at 06:47 -0800, Guenter Roeck wrote:
> On 11/29/23 00:35, Nuno S=C3=A1 wrote:
> [ ... ]
>=20
> >=20
> > For the record, I do care about the code I submit and missing 'static' =
is quite
> > embarrassing, yes. The only reason why I still dind't send the v3 fixin=
g that is
> > because I'm giving more time to see if you can review some of the other=
 changes.
> > I'm
> > pretty sure I'll be asked to change more things in v2 (as stated in the=
 cover,
> > there
> > are still some shady things in the driver).
> >=20
>=20
> NP, but you (and others) will have to accept that your patches end up at =
the end
> of my lowest-priority review queue if 0-day or checkpatch or builds with =
W=3D1
> end up reporting problems. My time is limited, and I am extremely wary of=
 having
> to keep telling people to run checkpatch or builds with W=3D1.
>=20
> Guenter
>=20

Hmm I see... So I might just send a v3 with the feedback I got so far plus =
getting 0-
day fixed. That way, I might get out of the lowest-priority queue :)

- Nuno S=C3=A1

