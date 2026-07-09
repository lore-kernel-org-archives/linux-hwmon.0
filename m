Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF9737D128
	for <linux-hwmon@vger.kernel.org>; Thu,  9 Jul 2026 07:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783581775; cv=pass; b=GOMchdvf+POcuwQtsf80a31V+71ob/3ORXk72JK4h5cR+fuEy8a35nfRXR8G1vmUAtCYtbIRk6sLIGXHTB1ew3lLrNeKQU9SsG/hQmlgZ+Cv7EtoFsIyKBahJUnpC4fZjRt1ZX9zw9LAdh//Js8RBdZA5Ygfyw/S8dNGHQI256I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783581775; c=relaxed/simple;
	bh=/gyp4ujD3GD0ZScmU7hZBb2XngMiQOw42I4RTgf+0JY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g16sr1bICcsv2W0z8snsE6LznzN9hMb8h3HynpO+Lw2INmyybG7tWkkmx8v1P3auRlQOovvmI1IE6EErBnKdTUotdxDh4XWsmfu2Gsl3MfxsGl8h05YA0ctxWYZpFIA4YAcaDrwubMJMs+J5WiWLY0mesr/LEysFKFibZU7EYrI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vd3AGBI/; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vd3AGBI/"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6983d3dae7aso1005224a12.0
        for <linux-hwmon@vger.kernel.org>; Thu, 09 Jul 2026 00:22:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783581772; cv=none;
        d=google.com; s=arc-20260327;
        b=n1m4qz/rh0DBeaPPTapmA+K8V7BNfdpUvNhHN6mEBVbLiYLhepgWPwcQXSxWQgsXnQ
         Z5v5OynEnGNTgYEKBZvXjxQTBeSTXrSLjnAws+q4MZs1kmgtMLvxYlbEIPGo4Gep6hRB
         9+DL4a2gKbJAblfVkOj2qRPXeQinFLSBKEQPClkDxfW04NPwkAEa2WTe9T08CAzA2RNp
         nztDRzSC9RL6YH/X58ciw8gCKL5i8OzX6xlI7Hki1HetW+L+UW+1WbZZsNVl75p007UA
         pEI70n1zOSmUYaDBAwzhudDY/j0aorPRK7hp5SI3H4wsQ5EJYcLO6Pg3j6AjVKxhnqqY
         iyOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sxyGm26N1qjAhfVKYZO1lt228h3VMsDm3JuJekK9pf8=;
        fh=mvhKSjnzCAaXPBhlzKVGtfnaqiWSPhev0BXH8Xl+CqM=;
        b=cR7nVAMHYEYwnlKWDOVCPQXyHztnRRcw3QD2RYtTSPTYS+atPtCa6rNg6WPY99EPQR
         fgoJYfcxdCRtCEA8O3/wPbyFynogmTaWNa3kONLU5XMA6VhMP5x8zIzdaRJkJGkac/c6
         WAOwUs1eNu/e1mAspWXm6wnTUPqPkeQREIWcaifk4widVYhz3wlwuu3J7VYybY59FefN
         fu3PhD45LrKiqgSgzrcrTT4/s/ILozuJaGofVH8YSwnS8jQjqsXuWKhdxC6D/jWv1v8v
         cX/vXhda+7sQPiWwGu51L6j0Dp3PDvfTwUmOXJiSSdgLnJd4cDiuQlChuHqT3aJhUzEW
         nJzg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783581772; x=1784186572; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sxyGm26N1qjAhfVKYZO1lt228h3VMsDm3JuJekK9pf8=;
        b=Vd3AGBI/uCfqbjC47ExRHHFSSrMsQLGEbAYtYPbt7dN61PND380rqIAKyKoMap9tIr
         qFimIViZxz78rWmghWIpHNIY9dPaTVHmW4woAYJ02R70sxnAQ3YHl8GanIRwCYkS7w62
         oJ9MD0grulnBHnzwZaXZd/UOAR1J629lyNF6j8tM7ok8zbaSvLX+FIUomYQz1MgvYTVD
         vsULFjo5D61Wpe1HPzL6kuEK1VJ7W1S+G7zgqfjFbZFiHoubLHjV9BUtdrZZx05ad6DP
         hzBZrZLqG/kfYAdf2T+TG7isxtHhB1SROcZ6IdckuxzHiVYce442VgODHRE70A6/+chh
         ZqoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783581772; x=1784186572;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sxyGm26N1qjAhfVKYZO1lt228h3VMsDm3JuJekK9pf8=;
        b=GCBAAQBJNUolCWbnwhunqOvx0q05T6duccRMH76qZypYAZgpw9y5Jnd6WFs93xkoAU
         GZCFoFNrlKOzT1Wat96a10DzPafFbmqCUnIV6OqEBccZwO02ZFXS62Au0HPf/aKyBijB
         QC0HOBRFMd6i4bSIcnCJXPR8CQFW0wmq6cQ8WXXcS4rdGd0pP3+1tY0w1vtzfaO3K94k
         DPUwowS5oK6PNETO1WqY75e4XcFYq8CBoCUuvJmTblCNjndvhvPMw8W495nHafVGJuEz
         K/l8vx6GfYNMqP7bQwpghI+D+Nxj3dx6Rq+SMglJDlu8tcGxxXSdeHEpd9MCfN+lpLHJ
         spdw==
X-Forwarded-Encrypted: i=1; AHgh+RqP0vSqncxjgBlTosgRmOGGX32kv1GxH3cq5LPAintUwYiLu64Q2CMHoOOUWJE57n8g8VYKQIcOl6putg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyLFxPm4wUem+v9EFbtyKmzYtUQfG64BkAYnxnAEMX/Ka9igQHZ
	aacSSA1bgVWienEEF5Zeev+XA1yausU4gg/o7/n2dFyGZQdku9WfVJkpZeoU4BlPXmw80D0h/ds
	LvhBEUBxXXwZgoMtj27lgkY4s1PZdtow=
X-Gm-Gg: AfdE7cm+NQexiqmQYwXIFAMQ7zezs8x9DZCK1c3PmB7sggKEPYCX6ulKJNnKmOfJYYS
	vrZYKsMhpmLEIgIDNs6NKiSSVKKL7oDs54+8OPne2hectzPNltbK15uqzW+PXX9V3Tu0dhh/ZV7
	f60P+uYn+A+B4YaSizl5sz0vYaTSEqkLEjmt2irxg3ACkX4090pp0YYhwdYHtFnwP3otYmMb8Sd
	9OcZhy305A0pqPhclmgmvxTs+vSuT27jO+IYUuQixkR7SRMMnHLRtuAXVNCipbZesUUo4aT6g==
X-Received: by 2002:a17:906:6a15:b0:beb:d461:7b09 with SMTP id
 a640c23a62f3a-c15e74474fdmr69932566b.11.1783581772023; Thu, 09 Jul 2026
 00:22:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260707122701.751878-1-fredchen.openbmc@gmail.com>
 <20260707122701.751878-3-fredchen.openbmc@gmail.com> <f9e32dd1-7c2c-4055-83fa-94683777e30b@roeck-us.net>
 <ak4QO9uhKOt68dl1@nsa> <20260708-true-carp-of-champagne-a0dcca@quoll>
 <ak41BRQBNdsQrYww@nsa> <b2a5e99c-6d4d-454e-8ecd-8638e4dc0ddb@roeck-us.net> <PH0PR03MB63512A19C32B7722D17D0FD4F1FE2@PH0PR03MB6351.namprd03.prod.outlook.com>
In-Reply-To: <PH0PR03MB63512A19C32B7722D17D0FD4F1FE2@PH0PR03MB6351.namprd03.prod.outlook.com>
From: Fred Chen <fredchen.openbmc@gmail.com>
Date: Thu, 9 Jul 2026 15:23:55 +0800
X-Gm-Features: AUfX_mwHN0qjb5l6G7Ei5hODszmeESynskEUV0pbmWdBSl0w574p6cMqhnzJh7Y
Message-ID: <CABOy65_GqKiZLM+soZUK_34T8MYZS3dRX38-CMf_Bd1EmG0jhA@mail.gmail.com>
Subject: Re: [PATCH 2/2] hwmon: (pmbus) Add driver for Analog Devices MAX20912
 and MAX20916
To: "Torreno, Alexis Czezar" <AlexisCzezar.Torreno@analog.com>
Cc: Guenter Roeck <linux@roeck-us.net>, =?UTF-8?B?TnVubyBTw6E=?= <noname.nuno@gmail.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Jonathan Cameron <Jonathan.Cameron@huawei.com>, Wensheng Wang <wenswang@yeah.net>, 
	Frank Li <Frank.Li@nxp.com>, Brian Chiang <chiang.brian@inventec.com>, 
	Cosmo Chou <chou.cosmo@gmail.com>, Dixit Parmar <dixitparmar19@gmail.com>, 
	Eddie James <eajames@linux.ibm.com>, Antoni Pokusinski <apokusinski01@gmail.com>, 
	Thorsten Blum <thorsten.blum@linux.dev>, Ashish Yadav <ashish.yadav@infineon.com>, 
	Syed Arif <arif.syed@hpe.com>, ChiShih Tsai <tomtsai764@gmail.com>, 
	Abdurrahman Hussain <abdurrahman@nexthop.ai>, "Paller, Kim Seer" <KimSeer.Paller@analog.com>, 
	Colin Huang <u8813345@gmail.com>, Yuxi Wang <Yuxi.Wang@monolithicpower.com>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Torreno, Alexis Czezar <AlexisCzezar.Torreno@analog.com> =E6=96=BC 2026=E5=
=B9=B47=E6=9C=889=E6=97=A5=E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=888:59=E5=AF=
=AB=E9=81=93=EF=BC=9A
>
> > On 7/8/26 04:32, Nuno S=C3=A1 wrote:
> > > On Wed, Jul 08, 2026 at 12:50:25PM +0200, Krzysztof Kozlowski wrote:
> > >> On Wed, Jul 08, 2026 at 10:19:56AM +0100, Nuno S=C3=A1 wrote:
> > >>> On Tue, Jul 07, 2026 at 06:52:48AM -0700, Guenter Roeck wrote:
> > >>>> On 7/7/26 05:26, Fred Chen wrote:
> > >>>>> Add support for the Analog Devices MAX20912 and MAX20916
> > >>>>> dual-output multiphase voltage regulators with PMBus interfaces.
> > >>>>>
> > >>>>> Signed-off-by: Fred Chen <fredchen.openbmc@gmail.com>
> > >>>>
> > >>>> Please provide evidence that those chips actually exist.
> > >>>> Internet search comes up blank. I'll need confirmation from someon=
e
> > >>>> at Analog.
> > >>>
> > >>> Hi Guenter,
> > >>>
> > >>> Well, in fact I'm in the middle of preparing a series that adds
> > >>> support
> > >>> for:
> > >>>
> > >>> "max20826"
> > >>> "max20855b"
> > >>> "max20908"
> > >>> "max20912"
> > >>> "max20916"
> > >>>
> > >>> All the above parts have the datasheet under NDA. But before we had
> > >>> a one page "datasheet" in analog.com but I guess that is gone! For
> > >>> context I mainly did the base (core) driver for max20826 and then
> > >>> Alexis added the other ones.
> > >>>
> > >>> Not sure how to proceed... I can wait and then work on top of what
> > >>> Fred has but this patch is very minimal when compared with what we =
have.
> > >>> Like:
> > >>>
> > >>> * No regulator support;
> > >>> * No direct mode. The chip has two ways to access registers (paging
> > >>> and
> > >>> * direct mode).
> > >>> * No way to count how many phases we have or if RAIL_B (func[1]) is
> > >>> being used at all.
> > >>>
> > >>>
> > >>> Some other things more intriguing is that these chips, as far as I'=
m
> > >>> aware (at least for max20826), always have bit 2 set in
> > >>> ON_OFF_CONFIG so a gpio vout. Also we needed some special handling
> > >>> to read phase current which I'm not seeing in the driver. So I woul=
d
> > >>> like to understand how the chip was tested?
> > >>>
> > >>> Anyways, if Fred is ok with it I can just finish what I'm doing and
> > >>> send the patches. It would make sense to have something more
> > >>> complete on submission but I don't want to just "steal" the work al=
ready
> > done.
> > >>
> > >> Binding should be in such case posted complete, so probably not a
> > >> trivial device.
> > >
> > > Yes, in my series bindings are not in trivial as we support the enabl=
e
> > > gpios.
> > >
> >
> > Same question I asked before: What is your use case ?
> >
>
> Hi Guenter,
>
> Unlike my MAX20830 patches, for some reason these chips (not only Nuno's =
max20826)
> hardwired the bit 2 in ON_OFF_CONFIG to '1'. This makes the use of gpio t=
o enable the
> device a requirement.  (as of the latest info given to us)
>
> Regards,
> Alexis

Hi Nuno,

Based on the MAX20912/16 specs on my hand, these chips do not support
PMBUS_PHASE (0x04). Furthermore, the spec only indicates support for VID mo=
de
and does not provide m/b/r. Therefore, some of the features you mentioned m=
ight
be specific to the MAX20826 series.

Regarding enabling VOUT via GPIO, our platform handles this via the CPLD as
part of the hardware power sequencing. Managing this pin through the driver=
 is
not a requirement for our system.

As for the testing, I have verified that the telemetry readings for both Ra=
il A
and Rail B behave as expected. The driver reports valid data after system
power-on, and the readings drop to 0 properly after power-off.

It's possible my specs are outdated or that I'm missing some use cases. If
you plan to submit your more complete driver covering the MAX20912/16
soon, I'm more than willing to hold off on sending v2 patch.

Regards,
Fred
