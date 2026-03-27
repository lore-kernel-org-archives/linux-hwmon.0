Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED75615A864
	for <linux-hwmon@vger.kernel.org>; Fri, 27 Mar 2026 00:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774572376; cv=pass; b=sAu54LGy8+3LDG9D52vJZIygntCHw2PgeBr+rFoimbDr2fUgINDQLj0ON0zU0Zu/bVXCM9tp5yVW6lwbD5zY0LdIvBU21iPBz4axFTprzfwmgkJSHfZbuDX4PjmTz+cbgeGm7liHnE7FhUF7yTgwhTFz0twG7yd458+Xmq/x9iw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774572376; c=relaxed/simple;
	bh=cIQcEwG19qRQ+raJI3sjifiU5GAjhmp03hspqWS+r0A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I3mKSMC7PYkEwgl527F0GJGQsk40VouTuYPXvchtSEe1RHtRhrkYSYuV+wcuAnZpFfHh5j5/1QspG/HfVesXm4kRn/7BwlGdn4qwtHSD3ykkjQnDU65VOU9l2XHVvRjqfdj3Oof1T7McSZz0h0h5gbI899vKPo3Ys8xuv2Csgl4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FNst0QM3; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FNst0QM3"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-66b0dc690bcso3078a12.1
        for <linux-hwmon@vger.kernel.org>; Thu, 26 Mar 2026 17:46:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774572373; cv=none;
        d=google.com; s=arc-20240605;
        b=J6dQyRG6Ei+KRrRcoahgpemJpRPrTSsiONeNJ1XnCjWI22kPEQbUqnOYEzYln1haZU
         4Kg12KAYNGOAHFGAdGhMyhr7MGVXT6s/Y+W8LnGXvBoDbeT8Voo2qeCnQjWO2K/srvrj
         ToLiwfN+LJhbx9TiXtYqP4ah7Db9FH2gtTEE3k4OMddiDd6M4q+/mtjtVeE3oALltEBE
         6UC6X00C2Bn1XfyDYr5NrKOdYqbpKm4UmRXq2zWAjnjztGyI2xrDviolpf8g20YT3dvX
         TUnS5ld5tTvl1dMY9OAxxOyR2mgQw5tFxMcfxRs8Ydz+s06zwBU6xAy9MH9KEZK4GRCO
         ETWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cIQcEwG19qRQ+raJI3sjifiU5GAjhmp03hspqWS+r0A=;
        fh=ZJRm/+AeW2a8FxpGi1GFKIN/Dhc45YvQlOl7LDQ/yRA=;
        b=XD0W/0dj5LMBizFH+0hJ4iSs2+PtjmwZFXBCP0m++c6c13eTz8lAdJZHn+1rtcgWr3
         epA6BjKzoW4xjlVI3aBRdUtmISsW3Ss5InGPG/1qAVHm1CO3oS91jMqYbuNpyKmBNK4B
         jVRIxR2T4JYiMNK2wEk//zoAt75mStcf5E7KjbCk1LkSsswSTO8Gt+GLWLne4h8tjh1Y
         es/yTzL2DKDyr+A7moF/ZipfOsi64jvX3o1we75Yf9JVKGRA4vLkbh8FVQR8oJKD3l2H
         dmJynAL9P5tLno2Jt1M1d08tBsy+OtXletXRJ7W0VViGpi1r8TmVWub7BF7Dvu1dSthi
         bYkA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774572373; x=1775177173; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cIQcEwG19qRQ+raJI3sjifiU5GAjhmp03hspqWS+r0A=;
        b=FNst0QM3rW/lHkrijpTyvi+OtB8ghvipQLRDxjhIwjN4O33wOOg0pYIc6KeDaIYeVS
         ric6GJ1qHvS3+nwxmUwE+47yPMJ59ChObuCyv9c8h1lTHgoczZ8geY+uRHFipvCicDfk
         WRdFroXz2Qr3zm3/h8SUaRvAXQT4iACtU9X6G/+SmG8M5u5seUmEn3VF7nbL1uA+gT+a
         6/7JG/LIwysiiAc3j2KUCM2Mr36BXkjQQ9nDRkYEFCks9MKsGdedyYEyAhxuFcbrDhdi
         y9HuqqfBiUVLM4mu61yTSwBWFonH8fkBSIX5cRP1btqNfeiyxjkq5ASF8mViv2mIEnZw
         DKmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774572373; x=1775177173;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cIQcEwG19qRQ+raJI3sjifiU5GAjhmp03hspqWS+r0A=;
        b=GWgpXWDIB++ktg9zeSpPKAqAs41AgUYR5v3AbT00MVs5/Ayz9fKv0q4CRxKKABBHI5
         l9QazwzOe3/7V1r3Q5ZChPBGrUyKLwTxXzKXm76LQeQznOd0OgmLitM+O6chU45ghBvh
         5SVlNNumSKJrc0xrTsP8kSKQ/lC9nFxDReZEQqNRWKR6wrMhE7NdTeHK/ADM1pnqrliS
         MFwnRwjwt8QSRhVq2FBoGa7spsuzDzFo/+IaxX29Zqo3FQEgxUrqPY6APY3jG3G75aGy
         /z8+HU7P0ibqj3zysUBK4tBW06Uw/KT+y52AxvKI0HVfQv+WIh5iHlshTZGLBd1eguKE
         4UsA==
X-Forwarded-Encrypted: i=1; AJvYcCVBbNNa2of5Q8m+a1LQLvuyOOHDwLMoNW08+DWsvNcJms1Ot5efR6Z76bHYeyvh+/T6qVyxx0lEA09Kkw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yykn9XAEuuUbcakjM9bohHc73USUhsixHWaMOb4kXKN2sazzowq
	AA2A2MqBcNggz6KQPDYjNxpm1jXPGXseoQ5EJsyJZt9xrZsqfbgYfkjKFTb/2tVOQSKkxsnq0np
	rqf1600AfEwRFgwkL4TsaT1u51zJayq/Co/NRpuld
X-Gm-Gg: ATEYQzwaDb5A0RPkx4cvfmX3Vl9WiSITJKxXOqh4s8ex7yhnsMfX+99lnRJH1+nZJ7f
	WPxlNRAYTLFIfxASklkb7IluB/SadU96AWB0mB9FiTGlt9n/JMJOJU72crDkngIR7P24SOFycJq
	/zc/NRUNKEz9ttIuIjQwql+QarhCV16zTjyMZuzp51cdTsd7H+5A7j5HY0b3vGdt/He7cT2pbbj
	ToPl2lxmTKpKUz2lGnAUOebN7qUTtXDJUrYskTEZ2t72SCrXTe6YeEbq6ZKe+6sU2BBBqGrPAu1
	f00EAAn6A2GHuIai9uQv26sZf72VHua3YQYbraL7vGgtFGhZhQSMqJhaeW8LrnjmpxTl9CshNg=
	=
X-Received: by 2002:a05:6402:324a:10b0:65a:1240:b8c4 with SMTP id
 4fb4d7f45d1cf-66b229d9837mr9623a12.3.1774572373052; Thu, 26 Mar 2026 17:46:13
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1774429690-129139-1-git-send-email-zaixiang.xu.dev@gmail.com>
 <1774429690-129139-3-git-send-email-zaixiang.xu.dev@gmail.com>
 <20260325-napping-turmoil-de37168fb072@spud> <09105b02-3d85-4808-ba0a-f3799787425a@roeck-us.net>
 <20260326-lullaby-elevator-3a3d25e9a6c0@spud> <20260326-opposing-footsie-33a0deb2ba90@spud>
 <ba8848a3-03f0-4113-8db4-d6dd46a57959@roeck-us.net> <20260327-clubbing-crushed-e73c4c994737@spud>
In-Reply-To: <20260327-clubbing-crushed-e73c4c994737@spud>
From: Roman Gushchin <kfree@google.com>
Date: Thu, 26 Mar 2026 17:46:01 -0700
X-Gm-Features: AQROBzBpAhGmdbxNeu0VGAT0ctGj0S3PX66_lNJpRl7fA0aff4bOxUfLoF_HXX4
Message-ID: <CADKH=+1EJFjPF+o3xB4XyrSDgEee-Bu0uGEmuakZoaGxwOBKtg@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] dt-bindings: hwmon: Add Sensirion SHT30 series
To: Conor Dooley <conor@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Zaixiang Xu <zaixiang.xu.dev@gmail.com>, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

The pseudo-commit message is intentional, Chris Mason initially
prompted it, and I'm honestly just using his format. The intention
here is to ensure the LLM reviews the correct commit and at least
understands what it's doing. Idk if it's really useful with Sashiko,
but it's there and hopefully not too distracting.

Re previous versions: it's not implemented yet, but I plan to add this
eventually.

Thanks!


On Thu, Mar 26, 2026 at 5:03=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Thu, Mar 26, 2026 at 04:55:39PM -0700, Guenter Roeck wrote:
> > On 3/26/26 10:45, Conor Dooley wrote:
> > > On Thu, Mar 26, 2026 at 05:42:30PM +0000, Conor Dooley wrote:
> > > > On Wed, Mar 25, 2026 at 06:05:22PM -0700, Guenter Roeck wrote:
> > > > > On 3/25/26 11:20, Conor Dooley wrote:
> > > > > > On Wed, Mar 25, 2026 at 05:08:08PM +0800, Zaixiang Xu wrote:
> > > > > > > Add YAML devicetree binding schema for Sensirion SHT30 series=
.
> > > > > > > Use fallback compatibles for compatible chips and add optiona=
l
> > > > > > > interrupts and vdd-supply properties.
> > > > > > >
> > > > > > > Reported-by: kernel test robot <lkp@intel.com>
> > > > > > > Closes: https://lore.kernel.org/r/202603212044.BRPaiz86-lkp@i=
ntel.com/
> > > > > >
> > > > > > The robot did not report that this binding was missing.
> > > > > > It also told you not to add these tags.
> > > > > >
> > > > > > You also ignored my and Krzysztof's reviews.
> > > > > >
> > > > > > NAK.
> > > > > >
> > > > >
> > > > > Maybe we should just point to AI feedback:
> > > > >
> > > > > https://sashiko.dev/#/patchset/1774429690-129139-1-git-send-email=
-zaixiang.xu.dev%40gmail.com
> > > > >
> > > > > and only get involved after AI does not report any problems.
> > > > >
> > > >
> > > > The presentation of info in that is weird, it creates a pseudo-comm=
it
> > > > message, and then goes on to talk about things that the pseudo-comm=
it
> > > > message has had culled.
> > >
> > > How good is this LLM stuff at figuring out if previous review feedbac=
k
> > > has been resolved? Or is it not capable of looking at earlier revisio=
ns?
> >
> >
> > Both are interesting questions. For the first one, I had noticed that, =
but
> > to me it seemed that the pseudo-commit message is an attempt to create =
a concise
> > version of the commit message, and I have not seen evidence that the la=
ter
> > comments did not also apply to the real commit message.
>
> Yeah, the comments did apply to the real commit message. I was just
> confusing to me to see what looked to me like a commit message not
> contain the info that was being referred to later on. I thought that the
> LLM was hallucinating the comments until I went back to this mail and
> realised the text was here.
>
> >
> > Anyway, copying Roman for feedback on both.
> >
> > Thanks,
> > Guenter
> >
