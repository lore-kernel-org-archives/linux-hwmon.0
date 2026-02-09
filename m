Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08AB8219FF
	for <linux-hwmon@vger.kernel.org>; Mon,  9 Feb 2026 05:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770613469; cv=pass; b=twrALSdhyI7CBCKWcO069yHp5Dqcgc1wtIlGG3izthpIhtH0nMHPqKo1PjYqbQLVhEmOi/HCWiVDoQqPqjp71tI5KeqrV0Cz5yOLB1dqLizX6dQTH8mUvHWokU++d9DOQh1Eg+NAKa5qkJTeHWx7wXzAfppHcN173iXdNsrZ7M0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770613469; c=relaxed/simple;
	bh=fBbG1mnFlbose/sSakTAYymCEKLG6HMiS5tjfl9wTSk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L6vHQyvmjgGXXEHZPApAlrXplCIa0fjTGSCvLqJNqYDDMmWs+rLGYhPHgOzhAYJCK/EcvF2DFe3r0CWRyG55z8r+OeLfjKD5zcyAxoQXcsmCuZLSFrqgAqco6kCgyK93h/ekEjOvQXnSlJHvqbp61TFPTEMVImdC5e4CHVCl3E8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jMgHC/d0; arc=pass smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jMgHC/d0"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-126ea4b77adso4268442c88.1
        for <linux-hwmon@vger.kernel.org>; Sun, 08 Feb 2026 21:04:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770613468; cv=none;
        d=google.com; s=arc-20240605;
        b=VI22MysvT2N/3hnTHI5+h9byxZG3+YUpyNGfOhujeGeUwbCiWJt1Tnf6o4fqpYViRT
         L78N6pX6psl7O5sBDeVHE5rr4MrjthDIKeNN07hUDW6jH+Vssn09NHkYnmfC/47MFZIb
         P+/HIE1veuBYW4M4kxW7YywOduyVeN5dheJjDxQP3PBetnWQppIeQG2Xrr0XhHGtcO0C
         D9qjnlBPVvKwPrHoLdP55JUf6u+JSj2TNminZo/BT/kxpdqfC37K4mB1z2mpqp54cR+X
         iigZwpkdTX6yXbByGb5QT07D4lTMBzZM6/83UsrrkQr/PbNptiebo7E7bzzoXAf4WuNJ
         Vyjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kLdAMjKN4MfQwM617A7tGdAkD2nzrI/3wQiBJg1Ko4g=;
        fh=tLe43lmYw4XMjJ1VgEbNFjDcq/mqDiJGDqHcEA/r00c=;
        b=g6IdpKPbTYVwhPoIyIuIlj4viezu9/u4k7qZLPgdcuOqceYJ4souSB3uRr20ulaN2o
         Bdxt9KBhln/PbGwwPnqH48IWRbyRWh3cXHMdietz1Jee9I3aO8uhH0nSWqXBS9z0TKch
         T/0V7rgXkn2SLr5a1CNtIvT8hpaxZmnE4CTonWfi6o5F9h/5vM1xXGX/NWhMT0rxCJgr
         cZBSyfkV2W1eRulOliRkRAIQE7ONiXnh/JuA5JCqzdEA9YZuF4lMhKJxasVjlftAGFhv
         iEt3WJam6iBoKWsILrklYdPiyWwj1hOlLXDN6uAhwVVe791jYlECAAviZS/+x2CczA6a
         zYQQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770613468; x=1771218268; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kLdAMjKN4MfQwM617A7tGdAkD2nzrI/3wQiBJg1Ko4g=;
        b=jMgHC/d08P1AXJbQaCu2qEQDDCefuGWcdyKjBJLxBhmVxhchmfPbBoET9JJhgifc8B
         r7pmSeY4ifrgyhkUDkNRvhxo8pd0LTLZc6cUShqq4be5hY8LMlS+Rtj+WD71pRrMq8oW
         erSuQIa59WpFLxjK3Ka14ZyR29nhgcZewEgTIOzr6SQBequWa0U+iaMSbf4nwgE9vJ8n
         v4i2prAbEUHchpMDuaW5/DCPxHVsCG80woYbeMmjtz58NaRHeNkp1VQFVVBAQwSPubRC
         S/c/Rm2mMRhyaGwKepa0nf92fSAyA4Y9ixKkJYjm6O6kcxaN9wzhUzlVzfRPu65yAItw
         pDpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770613468; x=1771218268;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kLdAMjKN4MfQwM617A7tGdAkD2nzrI/3wQiBJg1Ko4g=;
        b=rarqW/Mr5DOmoeiTf/wAn+WO5ENHIaOpVIjQuCmgD/mYKQgAwK/0z4U32tZqxtzQM2
         jDngsDDxTSsU8w7L+OAw7gAI5cWvTSFxBd1dU8THUKhXvtYEyvm8KGKCHPpFBXTwhjsi
         GrRUn/zNB9Af8i8DA+IQVjKu27QXSflG4mzN/Z5qx81/Q/rFMmhuit5XUzsW2XoVbGsw
         XoEd5rvdm2YQy+FfkKsELR6IFg1U8aj2Dsw9cW1jZ2P67DcwD/WAsyqq2eWhPyVJagZS
         KvSi1jq2BgXOujOtshxAcZEsVjzBPN02AsiR0tp7o57J2wmUmlQSkrQ2c18VoYnMxR45
         NeGQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2dV9gyi7m2yZWGmbcg12BtIhtHTiM5Bl/CL+4XiIx11p+k4Jor2i0PuPjNkzyttTp6BdA9+EBVMn2MQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxHXJ9uup5rgcpQ7LSv1BmRUvYqSjb/PvPx8C2yO7IK4sIIBEi5
	FJE1mdCFQDdaHGohkppeUcJs1QlJjkBGfLmm+Us1XlvwK64TvDtOptNzGuP1gfGNJs/XIgAt0nM
	JeR4Z5V+iU3/BmaY7zD0WDiSgJSAcH/w=
X-Gm-Gg: AZuq6aKE6LMYPZm1r6DtiKfm0D1whG2A05ayrqGJ55fBTayl4fqukjxrrXvS+oxsKel
	IwbB/sLgA6o1JT4oj1sbbeyX5NX3hZQKD2GLLgx3r3N380uUzLaLaFNWPscKt49+arq3/FTFiTf
	q6bHRGR1bMueLnQ+COUNy5mTHpKV3a1h2D0PQZ81tMmgQECCJ+CEiQAv1hzFnB57GaCgAkjQN4U
	+MWuBiAvxRFhIVNJEqdXMwvFdlOZCuvXUxT7G+SFH0D4rIB20wL4LgizKDXS8ot329vevGi
X-Received: by 2002:a05:7022:45a7:b0:11b:d561:bc10 with SMTP id
 a92af1059eb24-12704020b8cmr5530699c88.41.1770613468012; Sun, 08 Feb 2026
 21:04:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260107144507.46491-1-Ashish.Yadav@infineon.com>
 <03da3b10-dfe9-466a-9dc9-b51e29938e3e@roeck-us.net> <CAJKbuCYcRMrX5H5rWXWXOz4FCZi5iu8CCE2Oi3WEsWqEikqsYg@mail.gmail.com>
 <f0d230be-676b-47b9-9565-22319b8e62cc@roeck-us.net> <CAJKbuCYUCr-R-91Ou1y6XDEPdqabSDvCxUypc-YmW=-EPxgNyQ@mail.gmail.com>
 <787ffcff-28cb-43e0-97db-19dd7a996d13@roeck-us.net>
In-Reply-To: <787ffcff-28cb-43e0-97db-19dd7a996d13@roeck-us.net>
From: ashish yadav <ashishyadav78@gmail.com>
Date: Mon, 9 Feb 2026 10:34:16 +0530
X-Gm-Features: AZwV_Qi8ECim-_A_uIZdQNa43I4c3A_fbTT40fu5-EfM7i8A9Souso3kOJ87A2Q
Message-ID: <CAJKbuCav7iCdpph7HYW4=QxEmJ5+vuwadRmaQVUxT-TBSBBGVg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] hwmon:(pmbus/tda38740a) TDA38740A Voltage
 Regulator Driver
To: Guenter Roeck <linux@roeck-us.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ASHISH YADAV <Ashish.Yadav@infineon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Guenter,

I hope you are doing well.

Please find my response inline.

With Best Regards
  Ashish Yadav


On Mon, Feb 2, 2026 at 5:59=E2=80=AFAM Guenter Roeck <linux@roeck-us.net> w=
rote:
>
> On 1/22/26 03:42, ashish yadav wrote:
> > Hi Guenter,
> >
> > Please find my response inline.
> >
> > Thanks & Regards
> >     Ashish Yadav
> >
> > On Tue, Jan 13, 2026 at 8:40=E2=80=AFPM Guenter Roeck <linux@roeck-us.n=
et> wrote:
> >>
> >> On 1/12/26 23:24, ashish yadav wrote:
> >>
> >>>> The need for this, especially why it would only be needed for PMBUS_=
READ_VOUT
> >>>> but not for any other VOUT related commands, is still insufficiently=
 explained
> >>>> (and I failed to understand the rationale provided earlier).
> >>>>
> >>>
> >>> It is specifically needed for READ_VOUT as it is being used by
> >>> external controller to monitor the rail health.
> >>> Other Vout related parameters are used internally in the IC to for
> >>> output voltage related protections and does not impact any external
> >>> decision making.
> >>>
> >>
> >> Sorry, that doesn't really make sense. How would the chip know to matc=
h
> >> VOUT with its VOUT limits if both don't use the same scale ?
> >>
> > The chip telemetry would still show Vout as 0.7V as it does not know
> > about the external feedback resistors.
> > Hence, no need to scale internal Vout related parameters.
> > This scale is only for external vendor use to tweak their telemetry
> > output voltage reading.
> >
>
> You fail to explain why VOUT_SCALE_LOOP - which is supposed to handle suc=
h
> situations - can not be used, and why it would be acceptable for other VO=
UT
> related attributes such as VOUT_MIN, VOUT_MAX, VOUT_MARGIN_LOW, VOUT_MARG=
IN_HIGH,
> and the various VOUT fault limits to show the wrong values.
>
> For reference:
>
> VOUT_SCALE_LOOP:
> "Used to account for any external attenuation network on VOUT sense
>   feedback and provide correct VOUT reporting."
>

TDA38725A/TDA38740A has only two options of vout_scale_loop. These are
1 and 0.5.
If the output voltage is directly connected to the output rail, then
vout_scale_loop =3D 1 as there is no resistor divider in the feedback
and feedback voltage is equal to the actual output voltage.

If vout_scale_loop =3D 0.5, it is recommended to use a resistor divider
(top & bottom =E2=80=93 499ohms each) with a ratio of  0.5 in the feedback
path.
In this case, feedback voltage will be 0.5 x actual output voltage.
As the vout_scale_loop is set to 0.5, IC would use this
vout_scale_loop internally to provide the correct telemetry data.

If a customer uses a resistor divider of 2.21k (top) & 22.1k (bottom),
the divider ratio would be (2.21/22.1 + 2.21 =3D 0.09).
This is not an option available in the IC as it can only identify 1 and 0.5=
.
In this case, they configure the IC in vout_scale_loop of 1 and use a
multiplier in Linux code to correct the READ_VOUT telemetry voltage.

Why can vout_scale_loop not be used?
Using vout_scale_loop for correction will also impact all the Vout
related parameters and makes it cumbersome.
To simplify the linux code, customers prefer changing only Read_Vout
value and accept that IC would still operate based on vout_scale_loop
value configured to 1.



> Guenter
>
