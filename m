Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZCCbWoFw"
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0605483;
	Fri,  1 Dec 2023 08:19:37 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-40b27726369so22129845e9.0;
        Fri, 01 Dec 2023 08:19:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701447575; x=1702052375; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zXSpg2Hebt1XMvl/lb7qRf9lb6fY6wPU9kJB/qJRi3g=;
        b=ZCCbWoFw7e92HstJaZAars6On2qa6pcm1bDpaZ5mXxBBKLuSyI2phbVlklsuDNNeLW
         0BIPqHJfycGxddutVItvs5w1gvufNSMVxggZYBNCsxdGAofWlUzJM5rDZRkAX0xYVSIb
         NJ3Rh80narMaabAik6U+tSln9adKsfgAN4RCtbLkGRx0Xc4CTOUu4Q5eSXIKGEkmK9yt
         u0II7cch/3hxFSq1ZIbRshZ7WOL0p5wkwNoJcqLPNv6znl0wb2NRpCq5j3XRyVi1I1U8
         wqbxNTJYFh7Mf+CaXMjDoi6GMbxCOY2xrf88mUKX+KIDHJ810rz2/aAJG345dFyeluhg
         OsVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701447575; x=1702052375;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zXSpg2Hebt1XMvl/lb7qRf9lb6fY6wPU9kJB/qJRi3g=;
        b=hiXltp9uHBK2JFXQ6JCKLMaobS60lCOX++RFmWK8hkupfdz5UcqtREog5cbcwiO4wj
         InJuSlcEIkKLmR+ANfeK9vN1S76qEguUwFn0QPfM67ZTZKs54ML1peVgJQdfwVPEHd5J
         GQ4lXI5M79085kCFkjOxgFW88z5zAVxmYM39PIpRsXpxak2kImOEUFQTMPiYOIsVWaQp
         Lce4Hdq6spQpKiWtEuw1PZnYnWZKd8XzGeqAKpcx9TWBOoZNGJICxW/3Kfi5SlXNffGc
         EL5U9gnOcLQHu9qCgOoZ5+a2wqSxEa0s4rYhlmBKE0QTMAqQY8Om2P8y8Wf3VTge5KjT
         xs8w==
X-Gm-Message-State: AOJu0YyQeFZ11Ji4/GS3ScIZo3LSZDPXlsJZ8aLzlnbtagddKilC4Oeq
	s+v/Sg3Mjb0EJwOmUpoEeKA=
X-Google-Smtp-Source: AGHT+IGlB+Oek43JXqETYBZcoT9o2StytlqCFerJRxzm0sdB9GY+C+hZxfBHyL22HIQoqS+NOvGUgA==
X-Received: by 2002:a5d:69cd:0:b0:333:2fd2:68e4 with SMTP id s13-20020a5d69cd000000b003332fd268e4mr1050543wrw.119.1701447575325;
        Fri, 01 Dec 2023 08:19:35 -0800 (PST)
Received: from ?IPv6:2001:a61:3456:4e01:6ae:b55a:bd1d:57fc? ([2001:a61:3456:4e01:6ae:b55a:bd1d:57fc])
        by smtp.gmail.com with ESMTPSA id dj16-20020a0560000b1000b0033331f83907sm1809327wrb.65.2023.12.01.08.19.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 08:19:35 -0800 (PST)
Message-ID: <4afe8108fb12690779351f16b0b31977caca640b.camel@gmail.com>
Subject: Re: [PATCH v2 2/2] hwmon: ltc4282: add support for the LTC4282 chip
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Andy Shevchenko <andy@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, nuno.sa@analog.com, 
 linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-doc@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, Guenter Roeck
 <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 01 Dec 2023 17:19:33 +0100
In-Reply-To: <ZWoABzufPkdXnrMT@smile.fi.intel.com>
References: 
	<CACRpkdaksfS4WLNQ6ohauAPq3z2LPG2uF37_jWtm0brQHaDtNw@mail.gmail.com>
	 <6384831c05b8ceeaf4a16cf9229770252989b762.camel@gmail.com>
	 <CACRpkdZr6TdQCLy73Yx2RdMgQifd67remdxENBKYx3UvEMm87A@mail.gmail.com>
	 <971eb35068639ec404669ea5320c8183ea71a7d0.camel@gmail.com>
	 <ZWiP3i80KnVk9qyx@smile.fi.intel.com>
	 <a4bd59df0c5bc1be5d0d6f11b968fd61a59ee2e0.camel@gmail.com>
	 <CACRpkdYz+qi42Pz8CgeWybksC0edaVux6rcEhwzjDWnWe9Jr1g@mail.gmail.com>
	 <61a8f54835c10db7a9c650ee2e3706b47382c634.camel@gmail.com>
	 <CACRpkda55HzPqus5KR-t=xEBkkdND5kYZj1sHdxK+j6QwDUPRg@mail.gmail.com>
	 <b761d2497462664d541779857398b2aa893cbee5.camel@gmail.com>
	 <ZWoABzufPkdXnrMT@smile.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2023-12-01 at 17:47 +0200, Andy Shevchenko wrote:
> On Fri, Dec 01, 2023 at 04:24:35PM +0100, Nuno S=C3=A1 wrote:
> > On Fri, 2023-12-01 at 14:40 +0100, Linus Walleij wrote:
>=20
> ...
>=20
> > Yes, that is the only thing we have. Meaning that there is no hw settin=
g to set
> > the
> > pins to open drain. Open drain is what they are. That is why I'm not se=
eing the
> > point
> > in having PIN_CONFIG_DRIVE_OPEN_DRAIN implemented.
>=20
> At least you have to implement error for PUSH_PULL mode and other modes,
> so from the (core) software point of view the user should be able to ask =
for
> anything and get an answer from the certain driver that "hey, i do suppor=
t OD",
> or "hey, push-pull can't be supported with this hw".
>=20

Yeah, that makes total sense. But I guess that the 'default' should already=
=C2=A0
-EOPNOTSUPP right?

- Nuno S=C3=A1=20
