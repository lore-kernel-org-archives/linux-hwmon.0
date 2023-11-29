Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="klk7NFSX"
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B72FAF;
	Wed, 29 Nov 2023 00:35:08 -0800 (PST)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-a0064353af8so125680366b.0;
        Wed, 29 Nov 2023 00:35:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701246907; x=1701851707; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=cA14jHG61e0KGqj1Ve4QFXbJJfNMDY5MU0/yKOooMVo=;
        b=klk7NFSXVv+cMbzNo8pUfNWp/oFaCv2WBFqEaj3O31GsYUl2v15cmNZwk98qWwxkgj
         NpGKeeBeHLMaOH9lT77R6f6rhZYxYGaAJ7o6gOe46PiLpvnh3Rj3aoHdJFLg7ng5Og6J
         tnzJ8A+EzwqZGOI2A8Qn9AH/RXuZNiKE3MwaO2ECAUYWhT8EqDFfY8OlMqpJfUz9BmmQ
         m4Sd4wx8TKw0miBTNYGfXZP0uB1vm/QxzhxkWHcvN6KRBfmJ21tdKGOD34F+235bd3vl
         8rjUnX/HQC+G7ZmY5+wnqRrEtH2FeezBJGIXbvJJ/G0fnq9wjYWdMJmvj2Wr+0/1XUKZ
         rfvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701246907; x=1701851707;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cA14jHG61e0KGqj1Ve4QFXbJJfNMDY5MU0/yKOooMVo=;
        b=IxFnBfmuGuXJJ7pNbzM0Sh5wMNiutdv3K9aejAIKk95W9J/mZn/hEcqmL6JqRbhpMB
         3cqWTPiI+Bjs0OS5yftxu3bAWlqTawXnk7pSsfIBX3DlQo1ZuFZXY+4naGvCz7bV+WyP
         qAPwiCsLxrl6S/VWNBNCbueqKS82hXhMIPlMERIOUqbYO40Ke1OsKf3Ad9vXj1m2aZa7
         KQRwo4Mj4Yyo+BvxPW5Y7zRBF4XHTtxG5my9K2FCary3PonbVJblQEwjSUxgosPE8vVJ
         ApdljGsMQ+3PraUC1ABXMaRG+DPsqC2h6vk9kK2H7A4mvr3oRnNWFTBtCEZ8sBRyGltk
         WZTQ==
X-Gm-Message-State: AOJu0YzAuMcykUmqJqyIwPYm2YEa1PCPetWxnJ9ShkdOrjnrxNgZ4iqM
	+1fmol3rOg+b1dFheK+oHXA=
X-Google-Smtp-Source: AGHT+IEE6I9n61Xm1Iz80V1aFTp6aYbe+xjhdNzzLS9CFM4DqBZUgnD6kwJlhDE+5KvGvUof24ydHQ==
X-Received: by 2002:a17:906:2dc:b0:a0f:c538:4612 with SMTP id 28-20020a17090602dc00b00a0fc5384612mr6422237ejk.28.1701246906447;
        Wed, 29 Nov 2023 00:35:06 -0800 (PST)
Received: from ?IPv6:2001:a61:3456:4e01:6ae:b55a:bd1d:57fc? ([2001:a61:3456:4e01:6ae:b55a:bd1d:57fc])
        by smtp.gmail.com with ESMTPSA id t17-20020a170906a11100b00a015eac52dcsm7615127ejy.108.2023.11.29.00.35.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 00:35:05 -0800 (PST)
Message-ID: <c7e7b7bedd5b016a29cc86f767cbec533d727ff4.camel@gmail.com>
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
Date: Wed, 29 Nov 2023 09:35:05 +0100
In-Reply-To: <cacce41f-f1c0-4f76-ab24-c6ea8bb0303f@roeck-us.net>
References: <20231124-ltc4282-support-v2-2-952bf926f83c@analog.com>
	 <202311250548.lUn3bm1A-lkp@intel.com>
	 <fb2aaa4c69c88738499dfbf46ef93e3b81ca93cb.camel@gmail.com>
	 <76957975-56e7-489e-9c79-086b6c1ffe89@kernel.org>
	 <ac950d01-d9aa-4fb7-810d-b21335e4cc94@kernel.org>
	 <ZWS90GQTJWA7DrML@smile.fi.intel.com>
	 <bcc5da24-7243-42fa-a82b-48851ce17c0c@kernel.org>
	 <cacce41f-f1c0-4f76-ab24-c6ea8bb0303f@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2023-11-28 at 10:03 -0800, Guenter Roeck wrote:
> On 11/28/23 08:50, Krzysztof Kozlowski wrote:
> > On 27/11/2023 17:03, Andy Shevchenko wrote:
> > > On Mon, Nov 27, 2023 at 09:12:14AM +0100, Krzysztof Kozlowski wrote:
> > > > On 27/11/2023 09:10, Krzysztof Kozlowski wrote:
> > >=20
> > > ...
> > >=20
> > > > Wait, this was not even unusual test, just standard compile, which =
means
> > > > you did not do basic tests on your end. You must build your new dri=
ver
> > > > with W=3D1, smatch, sparse and coccinelle before sending upstream.
> > >=20
> > > Well, sparse is lagging in development, for the last year it's at lea=
st two
> > > times it broke kernel builds because of being not ready for the new s=
tuff used
> > > in the kernel. Do we have anybody to sync this? I don't think so, hen=
ce
> > > requiring this from developer is doubtful. Otherwise I agree, that ba=
sic
> > > compilation with GCC/LLVM must be done.
> >=20
> > Sparse still detects several issues and handles lock annotations, so it
> > is useful. But if you disagree with that part, I still insist on Smatch
> > (which is actively developed and works great) and Coccinelle (also
> > actively developed).
> >=20
>=20
> Quite frankly, for my part I would be more than happy if people would rea=
d
> and follow Documentation/hwmon/submitting-patches.rst. Most submitters do=
n't
> bother. That doesn't even mention building with W=3D1 (the much more opti=
mistic
> me who wrote that document several years ago thought that would be obviou=
s),
> much less running any source code analysis tools . Feel free to submit a =
patch
> to strengthen the wording there. If you do that, it would have to be more=
 explicit
> then "run smatch" or "run coccinelle" because hardly anyone would know ho=
w
> to do that.
>=20

IMO, submitting patches to linux is already not the most straightforward th=
ing in the
world. If we are now going to ask to run smatch, cocci, sparse and so on, w=
e will
scare even more developers from the community... I mean, the bots are also =
in place
to help with these kind of more advanced analysis, right?

> Until then, there isn't really anything to insist on. I even had submitte=
rs
> react angry when I asked them to follow the guidance in that document,
> so I won't insist on anything that isn't documented as requirement.
> Quite frankly, most of the time I'd probably fix up issues such as missin=
g
> "static" myself because I am tired having to argue about it with submitte=
rs
> who don't care.
>=20

For the record, I do care about the code I submit and missing 'static' is q=
uite
embarrassing, yes. The only reason why I still dind't send the v3 fixing th=
at is
because I'm giving more time to see if you can review some of the other cha=
nges. I'm
pretty sure I'll be asked to change more things in v2 (as stated in the cov=
er, there
are still some shady things in the driver).

- Nuno S=C3=A1

