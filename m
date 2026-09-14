Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F8564582F3
	for <linux-hwmon@vger.kernel.org>; Mon, 14 Sep 2026 12:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789387601; cv=pass; b=ofsojuvb3QAE2UKkTtRbIQDiKT5Q9suPm5qNjkghvLvPSv2/9vLCBtNG46BMYiBXQhNNYi/WuCw+IX9lEWl//7XNRYd+nnibeTuUCX2NXVt+wSZSibfON7c7XHcYRHcy3BbXuo7gO+YsynU/zWaaemhPAZTOEXTqyHI0iHpJGu0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789387601; c=relaxed/simple;
	bh=dAQLslpPj1WS5Id3+o7zx/jx5tvNIaiKqLwvi1h/rME=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HG4jhnb8hZ7M1Lpv3xAvv2Gg96WZtym3HUdcnV710wpCAZhEcxNbQJqPxQuaG/NHaHKoonNcCDd3pSNMkejyWNsXLgvwYyhMlnFK9DQ+o4Mwz4KFiETcSyV5eetm5esDmv7lH2cOvB42ZOmHZJuusDG9sOGJaj8eyvoy4CcC8mc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T+t5UHxD; arc=pass smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T+t5UHxD"
Received: by mail-vs2-f12.google.com with SMTP id ada2fe7eead31-7935ecb5d8fso466542137.2
        for <linux-hwmon@vger.kernel.org>; Mon, 14 Sep 2026 05:06:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789387597; cv=none;
        d=google.com; s=arc-20260327;
        b=QTTSiVkav2GpDpp5J+agHvFnbo1+Nz/XbBR7pIHK1aqP58pXjXhnXztD0PqJvuxyB6
         wtHbKM5l3nI9y/wd9ShAnWYxshazJ7jY0M+hzfhT0O1VB5mPQ0iKRff8bDRV936BRQMy
         QOv3HLG6gSAy3noUyaMITkSgrflfuFwQxEL5nCWwZI/CiVEaI7vABk6KVFpntq9BUiC8
         wIm+7x2ittWCyQeKuYXH+iSQhV4KWeXXUzfuLzTpSjZVlExxOT7pu4D9viw5WGYsRBGa
         n46CpsNJ+iC4XOglUvVhR/wWYIEGc7GXjEFgsId0q1vyWB54RUsdU6udVM6rP8RpW1gs
         nPRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=W3f2wMp0p9GaB9K8wv/S8QvGH6qPT0Hv0ZLvGcfuJsk=;
        fh=TC0JMAHgrZm8g6ZCSQbGTTaMZ/u5IUMO2ZHBgtJezis=;
        b=AcVBxXDNq5Pq3iILnu5fQ3ElOYqHUiZ1bMzEH3xVS23def0FfJLNCKTvn+WZ/yacGU
         bTdreDxFY/F7FFD9Nb29BVtGv7fNNKp3RvhnKrw3OU6QTZdjDPY6EJdnxL461MKXyIPq
         vYJBrpQ08WDV7MbztLacxg/8177g70LXW3r5/wowLZRVEWq2+PVFAZ0Xc7OMSfaQzRul
         Ewe7kDuM7ZjB6Iq+XvkywmWmzDkxyOqWrkut0+52uVewvZQnpHzZRyVLSvSnoH3qDRhv
         aLOMkXsvieU91ZDfkVqQubw73wgYfnKwK9SyblQcfO6mLsf4cV8vlh2R2HVIssCIgQwG
         uw+g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789387597; x=1789992397; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W3f2wMp0p9GaB9K8wv/S8QvGH6qPT0Hv0ZLvGcfuJsk=;
        b=T+t5UHxDGs+bcV9iWAS7LO+KmsIPI42yGhLz5oEfqs6SPEpvPhxF98Shja7irTkSLq
         A/C90OkRujFq8qSq/yEHy++HH4iUyE0wSYdZaaKK6F2/2rKFj4tGB9ITtt1mQyr/34bt
         ebt2S2et3mM2nyl/d+YKLvlyACRY+YDpQqKT3DF55ElI0wHLFCiVzMMA6Rzvy5jFWkdB
         G1+TFvJXZCt3+6S4Rd1kdERxfJ046GRc5bBg+qmNozXpi5i/ELXOVFqEwSZ6/yd88PmC
         Jk6mJbDS+HnoxWDvc5TeK0rws5vIEArdViBJSA3w790OiU+AKtN7CKmB09dkV0fJDfIH
         X95g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789387597; x=1789992397;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W3f2wMp0p9GaB9K8wv/S8QvGH6qPT0Hv0ZLvGcfuJsk=;
        b=ou2MAb/FaNWIwSMEuYTKxKbPB7pX0CGL+APEOaonmidgXup60sgZRw+oDh8L0wGdhd
         t6APTfdkxH7HGQ+QrK0GMJMhPv0xu3CmNvUx2o6/iJ3wo+vu9UJm7ZlOm8Qn0vWPxBYr
         1QDIe8U5j1eL++Th7Z16yMbRM6XdXgGqXO4EQy0Ej6r1RZ7HgpDh0yNC0jfxOizKE4do
         TFaBmA4mFKDnq2xKOlwXfRY3w2tBVGi0usSv5YEtLZwA8YOaWtmRQ4F2XYO1tty7zyCN
         Vq8yorOY36mVLgFN9YS18HhLTCyeL+5VR+6N/Kc8RLN/jr8Fq9yBUVzSS2xpJNhoPAxq
         NNDg==
X-Forwarded-Encrypted: i=1; AKwUvBwkfberoXDUQWT3kB8muLDQrXHHiv1xOHf74WPuusR1PeZqXLGP2aMhm0NRzbTZw/hVfkla+ssEJ6DnyA==@vger.kernel.org
X-Gm-Message-State: AFuF++lio/7xZIZEntm2VE0pcXBxvBjMVufhic3Vge5h8XQWVWpbhBTu
	TwF9e9FkwAFXIpxoXdOmgYdLarjyRQJPdJ3kXibO6GFnTEz3SrfpJh77+yGRW4Oxui5RVZfYXD8
	3xqKl13X1iGE9K1ofs/D6ysX3k2iW0k0=
X-Gm-Gg: AYBFou0k9xKnYsd/i64YSVxUplEhe2UddDCY5gtQJHr7p8V1o/lOc7a17F6wgW8yqna
	TNsb/RwhKyvTMjFAsk+PSBnmSCvmlg+XqOx8r7Gr53s3YTbbAI9WQPIG+/+AVz8yCkJUBqz3oZ3
	d3uqzbw5SvL0y2BO7+Jka/+hXd9Ftw+Jp6Sd/5wjz5Z1NKl2JohBHfXP25j+tKaE/kY4o3DpEAP
	Gy0XuoN/Q7ILHpYnCWGV6E5OBKltjy846dHrjtbyMyEmfve+bev7uKtMH6u5PSRhBslAV2IcDEf
	g/sgJYt7azykMk6rM6UMahefg62W3HPRGWa4dNWZHuvffqJq7EoFtTZfmw/3qw7MHrjP
X-Received: by 2002:a05:6102:a50:b0:79c:23df:6fc1 with SMTP id
 ada2fe7eead31-79c23df7745mr548775137.2.1789387596957; Mon, 14 Sep 2026
 05:06:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907-add-raa229639-and-raa229640-v1-0-8f7218cba85d@gmail.com>
 <20260907-add-raa229639-and-raa229640-v1-1-8f7218cba85d@gmail.com>
 <20260907-chimp-pectin-20f4ea3b772c@spud> <CAPBH0A9GZSD5R657xo1woijKfgS6gecUND4uabguaqUON2exXw@mail.gmail.com>
 <20260908-dinner-atrophy-757595146656@spud>
In-Reply-To: <20260908-dinner-atrophy-757595146656@spud>
From: Colin Huang <u8813345@gmail.com>
Date: Mon, 14 Sep 2026 20:06:25 +0800
X-Gm-Features: AcwNN1WwTccuI-E0Tg8O_HU6Y7-t9R9kzYG63DP3-KVuGmrC7El7wKFW8D4dhcc
Message-ID: <CAPBH0A9yKhvDA_pda45Me1c0tXcSj3zLqLoFgUOQj3MES0Mk1A@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: pmbus: isl68137: Add Renesas
 RAA229639 and RAA229640
To: Conor Dooley <conor@kernel.org>
Cc: Colin Huang <colin.huang2@amd.com>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Grant Peltier <grant.peltier.jg@renesas.com>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Conor Dooley <conor@kernel.org> =E6=96=BC 2026=E5=B9=B49=E6=9C=889=E6=97=A5=
=E9=80=B1=E4=B8=89 =E4=B8=8A=E5=8D=8812:57=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Tue, Sep 08, 2026 at 02:31:40PM +0800, Colin Huang wrote:
> > Conor Dooley <conor@kernel.org> =E6=96=BC 2026=E5=B9=B49=E6=9C=888=E6=
=97=A5=E9=80=B1=E4=BA=8C =E4=B8=8A=E5=8D=881:01=E5=AF=AB=E9=81=93=EF=BC=9A
> > >
> > > On Mon, Sep 07, 2026 at 03:03:29PM +0800, Colin Huang wrote:
> > > > From: Colin Huang <u8813345@gmail.com>
> > > >
> > > > Add Device Tree compatible strings for Renesas RAA229639 and
> > > > RAA229640 PMBus devices.
> > >
> > > Driver change suggests fallback compatibles could be used.
> > > Why aren't they? If they can be, add them. Otherwise, explain why not=
 in
> > > your commit message.
> > >
> > > pw-bot: changes-requested
> > >
> > > Thanks,
> > > Conor.
> > >
> > Hi Conor
> >   Thanks for the review.
> >
> >   I didn't add a fallback compatible because I only have document for
> > RAA229639 and RAA229640
> >   and could not verify full DT level compatibility with any existing
> > supported devices. While both devices
> >   are handled by the existing raa_dmpvr2_2rail driver variant, I don't
> > have sufficient information to establish
> >   a compatible fallback relationship.
>
> Given that the match data table looks like this:
> static const struct of_device_id isl68137_of_match[] =3D {
>         { .compatible =3D "isil,isl68137", .data =3D (void *)raa_dmpvr1_2=
rail },
>         { .compatible =3D "renesas,isl68220", .data =3D (void *)raa_dmpvr=
2_2rail },
>         { .compatible =3D "renesas,isl68221", .data =3D (void *)raa_dmpvr=
2_3rail },
>         { .compatible =3D "renesas,isl68222", .data =3D (void *)raa_dmpvr=
2_2rail },
>         { .compatible =3D "renesas,isl68223", .data =3D (void *)raa_dmpvr=
2_2rail },
>         { .compatible =3D "renesas,isl68224", .data =3D (void *)raa_dmpvr=
2_3rail },
>         { .compatible =3D "renesas,isl68225", .data =3D (void *)raa_dmpvr=
2_2rail },
>         { .compatible =3D "renesas,isl68226", .data =3D (void *)raa_dmpvr=
2_3rail },
>         { .compatible =3D "renesas,isl68227", .data =3D (void *)raa_dmpvr=
2_1rail },
>         { .compatible =3D "renesas,isl68229", .data =3D (void *)raa_dmpvr=
2_3rail },
>         { .compatible =3D "renesas,isl68233", .data =3D (void *)raa_dmpvr=
2_2rail },
>         { .compatible =3D "renesas,isl68239", .data =3D (void *)raa_dmpvr=
2_3rail },
>
>         { .compatible =3D "renesas,isl69222", .data =3D (void *)raa_dmpvr=
2_2rail },
>         { .compatible =3D "renesas,isl69223", .data =3D (void *)raa_dmpvr=
2_3rail },
>         { .compatible =3D "renesas,isl69224", .data =3D (void *)raa_dmpvr=
2_2rail },
>         { .compatible =3D "renesas,isl69225", .data =3D (void *)raa_dmpvr=
2_2rail },
>         { .compatible =3D "renesas,isl69227", .data =3D (void *)raa_dmpvr=
2_3rail },
>         { .compatible =3D "renesas,isl69228", .data =3D (void *)raa_dmpvr=
2_3rail },
>         { .compatible =3D "renesas,isl69234", .data =3D (void *)raa_dmpvr=
2_2rail },
>         { .compatible =3D "renesas,isl69236", .data =3D (void *)raa_dmpvr=
2_2rail },
>         { .compatible =3D "renesas,isl69239", .data =3D (void *)raa_dmpvr=
2_3rail },
>         { .compatible =3D "renesas,isl69242", .data =3D (void *)raa_dmpvr=
2_2rail },
>         { .compatible =3D "renesas,isl69243", .data =3D (void *)raa_dmpvr=
2_1rail },
>         { .compatible =3D "renesas,isl69247", .data =3D (void *)raa_dmpvr=
2_2rail },
>         { .compatible =3D "renesas,isl69248", .data =3D (void *)raa_dmpvr=
2_2rail },
>         { .compatible =3D "renesas,isl69254", .data =3D (void *)raa_dmpvr=
2_2rail },
>         { .compatible =3D "renesas,isl69255", .data =3D (void *)raa_dmpvr=
2_2rail },
>         { .compatible =3D "renesas,isl69256", .data =3D (void *)raa_dmpvr=
2_2rail },
>         { .compatible =3D "renesas,isl69259", .data =3D (void *)raa_dmpvr=
2_2rail },
>         { .compatible =3D "isil,isl69260", .data =3D (void *)raa_dmpvr2_2=
rail },
>         { .compatible =3D "renesas,isl69268", .data =3D (void *)raa_dmpvr=
2_2rail },
>         { .compatible =3D "isil,isl69269", .data =3D (void *)raa_dmpvr2_3=
rail },
>         { .compatible =3D "renesas,isl69298", .data =3D (void *)raa_dmpvr=
2_2rail },
>
>         { .compatible =3D "renesas,raa228000", .data =3D (void *)raa_dmpv=
r2_hv },
>         { .compatible =3D "renesas,raa228004", .data =3D (void *)raa_dmpv=
r2_hv },
>         { .compatible =3D "renesas,raa228006", .data =3D (void *)raa_dmpv=
r2_hv },
>         { .compatible =3D "renesas,raa228228", .data =3D (void *)raa_dmpv=
r2_2rail_nontc },
>         { .compatible =3D "renesas,raa228244", .data =3D (void *)raa_dmpv=
r2_2rail_nontc },
>         { .compatible =3D "renesas,raa228246", .data =3D (void *)raa_dmpv=
r2_2rail_nontc },
>         { .compatible =3D "renesas,raa229001", .data =3D (void *)raa_dmpv=
r2_2rail },
>         { .compatible =3D "renesas,raa229004", .data =3D (void *)raa_dmpv=
r2_2rail },
>         { .compatible =3D "renesas,raa229621", .data =3D (void *)raa_dmpv=
r2_2rail },
>         { },
> };
>
> It's probably pretty safe to assume that a fallback would work here,
> given how many devices are served by the same data structures but
> maybe one of the Renesas folks on CC can confirm that for us.
> At the very least, you have documents for two devices and should be able
> to confirm if they're compatible with one another.
>
> Thanks,
> Conor.
>
Hi Conor,
  Thanks for the review.
  I found a very similar precedent here:
      Link: https://lore.kernel.org/r/20260325090208.857-2-dawei.liu.jy@ren=
esas.com
      RAA228942 and RAA228943 use renesas,raa228244 as fallback compatible

  Therefore, I plan to followthe same approach:
  RAA229639 and RAA229640 also use renesas,raa228244 as fallback compatible=
.

```
@@ -60,13 +60,13 @@ properties:
           - renesas,raa229001
           - renesas,raa229004
           - renesas,raa229621

       - items:
           - enum:
               - renesas,raa228942
               - renesas,raa228943
+              - renesas,raa229639
+              - renesas,raa229640
           - const: renesas,raa228244

   reg:
```
Does this look reasonable?

Best regards,
Colin Huang

> >
> >   I will clarify this in commit message in v2.
> >
> > Thanks.
> > Colin
> > > >
> > > > Signed-off-by: Colin Huang <u8813345@gmail.com>
> > > > ---
> > > >  Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml |=
 2 ++
> > > >  1 file changed, 2 insertions(+)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl=
68137.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.ya=
ml
> > > > index 8216cdf758d8..3537c7ddfb09 100644
> > > > --- a/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.y=
aml
> > > > +++ b/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.y=
aml
> > > > @@ -60,6 +60,8 @@ properties:
> > > >            - renesas,raa229001
> > > >            - renesas,raa229004
> > > >            - renesas,raa229621
> > > > +          - renesas,raa229639
> > > > +          - renesas,raa229640
> > > >
> > > >        - items:
> > > >            - enum:
> > > >
> > > > --
> > > > 2.34.1
> > > >
