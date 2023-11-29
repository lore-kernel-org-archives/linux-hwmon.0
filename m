Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="co1OtFIF"
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9575A1715;
	Wed, 29 Nov 2023 06:29:58 -0800 (PST)
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5482df11e73so8920715a12.0;
        Wed, 29 Nov 2023 06:29:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701268197; x=1701872997; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qdoeeagOYLK4qbp2jjR1vPFPXFdVKef/9E1TVuVg+ZA=;
        b=co1OtFIF81JZ56KPPsJH3zk0FqIVPIdL42mE5APgvYJa66w4t858mWOuS3GOvXND4a
         RGq1ErwW+7s1rl1S1+tNe9gIQG/7q3RNvErOmuxOg3yIc77KFXMfMsE4RyCnKRDCfv8H
         r7VGKmJAk+xYOc63IET1zlK8W/SM1aKUKxlV2WxU3meaZW6th6/mISwFfICADwlnPDGA
         +DFhT1naWA2yWZ6LisHWIs3IuDYN7xQaqmssLiB/VSeJAESNDZL1uTaP0hOcEWf4Kbnr
         Ht571bgk/jzbnkfYgW/Iz3MG2a/yt9yzwvZmVpuvjLQ38qfTlML+oKgkLas1LoakpFTA
         zo0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701268197; x=1701872997;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qdoeeagOYLK4qbp2jjR1vPFPXFdVKef/9E1TVuVg+ZA=;
        b=MVVcOeGmElrodvSdncZk335v9ZnzYncNNm4Ba/YbQzWTZWt+nbHkVGh1M75tnE9OHS
         i9wReutXjw3LGWdWJe1MHrPIMcrvZvdOeLPrg3B5W4NkPovL7ayIFulg/TfKaindESqu
         jMnTdidfYCATs3lu2Uyjl+INo/+VMHj4G7OfQqX2Bs0jeQVsio1RDk8ZopbkQzig/eLV
         op54PBCRWiEP7L2ipDOtZuCMVyJlJuDOtSt6hVyPM7Pgr4zeJSfzaYTLDx5BrQTzbwPq
         ej8dDvk1D6KofOwfaJH67SR+4kX7StW/4cRcFA2lZIUg5AcPcY1KNtdP9Djhy216rju7
         CCPw==
X-Gm-Message-State: AOJu0YzPie83BFWThU9UuiRKqcxUUro0CJ4gQ/cy8KQq67Iw5Ks7K0Rx
	vh/xIGMI/945K7UTyessS0GjEAYQ/rnnkrfaPMI=
X-Google-Smtp-Source: AGHT+IF7cSLiOMTqE7T/VaCVfadmrV+/UtvqeemRHybJucvE20WQtPfgxrR7eCoAIrjjylrYew9etA==
X-Received: by 2002:a05:6402:278e:b0:54a:f041:17d2 with SMTP id b14-20020a056402278e00b0054af04117d2mr14173200ede.35.1701268196697;
        Wed, 29 Nov 2023 06:29:56 -0800 (PST)
Received: from ?IPv6:2001:a61:3456:4e01:6ae:b55a:bd1d:57fc? ([2001:a61:3456:4e01:6ae:b55a:bd1d:57fc])
        by smtp.gmail.com with ESMTPSA id da7-20020a056402176700b0054afe3625a9sm6119108edb.43.2023.11.29.06.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 06:29:56 -0800 (PST)
Message-ID: <5fbcaa21840c509c22024c8383dfe3e4ffbcc635.camel@gmail.com>
Subject: Re: [PATCH v2 2/2] hwmon: ltc4282: add support for the LTC4282 chip
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>, Krzysztof Kozlowski
	 <krzk@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Andy Shevchenko <andy@kernel.org>, 
 kernel test robot <lkp@intel.com>, Nuno Sa via B4 Relay
 <devnull+nuno.sa.analog.com@kernel.org>,  linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org,  linux-doc@vger.kernel.org,
 oe-kbuild-all@lists.linux.dev, Jean Delvare <jdelvare@suse.com>, Rob
 Herring <robh+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Jonathan
 Corbet <corbet@lwn.net>, Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 29 Nov 2023 15:29:55 +0100
In-Reply-To: <CACRpkdaQ0=KduRoSOn+NKNOXvL2HqL_xeCR-LQZWh6CdRMf1Pw@mail.gmail.com>
References: <20231124-ltc4282-support-v2-2-952bf926f83c@analog.com>
	 <202311250548.lUn3bm1A-lkp@intel.com>
	 <fb2aaa4c69c88738499dfbf46ef93e3b81ca93cb.camel@gmail.com>
	 <76957975-56e7-489e-9c79-086b6c1ffe89@kernel.org>
	 <ac950d01-d9aa-4fb7-810d-b21335e4cc94@kernel.org>
	 <ZWS90GQTJWA7DrML@smile.fi.intel.com>
	 <bcc5da24-7243-42fa-a82b-48851ce17c0c@kernel.org>
	 <cacce41f-f1c0-4f76-ab24-c6ea8bb0303f@roeck-us.net>
	 <c7e7b7bedd5b016a29cc86f767cbec533d727ff4.camel@gmail.com>
	 <d4a9bd79-1cb6-4da6-9380-bb8085866533@kernel.org>
	 <CACRpkdaQ0=KduRoSOn+NKNOXvL2HqL_xeCR-LQZWh6CdRMf1Pw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2023-11-29 at 15:10 +0100, Linus Walleij wrote:
> On Wed, Nov 29, 2023 at 9:45=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.=
org> wrote:
> > On 29/11/2023 09:35, Nuno S=C3=A1 wrote:
>=20
> > > world. If we are now going to ask to run smatch, cocci, sparse and so=
 on, we
> > > will
> > > scare even more developers from the community... I mean, the bots are=
 also in
> > > place
> >=20
> > This is not related to Linux at all.
>=20
> Smatch, main author Dan Carpenter
> Coccinelle, main author Julia Lawall
> Sparse, main author Linus Torvalds
>=20
> To be fair I think these tools has quite a lot to do with Linux, being de=
veloped
> for the kernel as the primary use case, by Linux kernel contributors.
>=20
> > When you develop any C or C++ code,
> > you run these tools. Upstream or downstream, does not matter. Why would
> > you not use automated, free and easy tools to detect errors in your
> > code? It's just a matter of professional approach to your code.
>=20
> This I agree with. We just happen to have some especially
> talented C developers who write some novel tooling.
>=20
> (I think developers should be able to rely on robots to run them though,
> we all seem to agree on that.)
>=20
> Yours,
> Linus Walleij

Hi Linus,

Since I have your attention, please give a look at the gpio stuff when you =
have the
time for it. On the v1 cover [1], I have there my concerns. I'm really not =
sure if
I'm providing the right interfaces for the device capabilities.

[1]: https://lore.kernel.org/linux-hwmon/20231110151905.1659873-1-nuno.sa@a=
nalog.com/

Thanks!
- Nuno S=C3=A1
