Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6BA1853;
	Thu,  9 Jan 2025 00:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736383872; cv=none; b=r4FMchSH79GgTFNboR9Azr0FcMiWp+DO3veTGTrDd6KNyQZxqh/SUlN2LOTtXZNlIb6ZZ0JgrzCCR2nbECDg0OWZ+LwyC49tVQK0t7DL8UoRKiPi++XIdWgahOrk++a8CwdZePV2EaS6KVm2lH5LqE/1k3p4jWaq20nbm9N/31A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736383872; c=relaxed/simple;
	bh=WF6PXhCuFVDkJxCjbmfIHrcpq+9we7XTVrtKCaAt5DE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NldImsvqwpv1L57WfzRMWHatdGoZebqbKSWr5zg5xRZHQ5opFVT79RkcKh81CcjP1U8wJNkMwPmVErkx0Snc3wBaYVl+W7uvvqsOwR3MdgdBTNzyKiRO7WMcuQIcenhon/uiMQ3jFJDWf3eakzUtWyn7/rYIAO9jdVuklYIqmic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VnBJOaUZ; arc=none smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VnBJOaUZ"
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-29e2a50586dso222188fac.0;
        Wed, 08 Jan 2025 16:51:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736383870; x=1736988670; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4fWK8fRu3RMh7WwL5FXvWKO33j9VYYVjRQD32mqDumo=;
        b=VnBJOaUZPRbFm/6p7B7VK+6t8MaV0ilH7H9UW8n4i1yOgTK08wqe4nJ7z0e91eapq4
         WobTzh7ma8ZfQmNN4CsptZQPLb9hmwzy/2Xl+hJwyr1j4bQol8y7TUK94IPJQMORkQ5e
         myvTXQNkRXPUZlGbBxZvO0ysQCiGDwWnDbYYkuWJQ/5O9tL3B9vzGt9dhwboQEODdlZ5
         CTq3lZOU3VQJNwlGMBUORePIupnf4QrOBBeCSws2ECOxWeV6jghZ/fWyXDyfsyyDudxY
         6EBKEAeTUTXTurytp0nEnQ0g7qNYtddl1+0IDnba/2IyLvmgIfb0hzzBfVF7ElUI6Xja
         j3Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736383870; x=1736988670;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4fWK8fRu3RMh7WwL5FXvWKO33j9VYYVjRQD32mqDumo=;
        b=F0dWIZps4fhF7qpblXwiEIEmfheFafm3PXfwyIO5Se9gcsgKkf2OuSIWpILQ++c8qt
         GW69Ws0L8HtoisyJV3Exi/em3oT4hmxiQLUNJpS6RrzpMVGu6gL3hCzpVSFjhhmaL1U8
         D/CY7A+NhgxMoUXdJ/fyj2g+Uwt26iA+XuIguMpSGJkeTafBVb+V8ImtU0GGkl69lvmS
         ZPfZHZo7r1NfYo5JbK8oHQt/w0rbPL5rH1w3rAGLMxm0zD9Ovy4HnLm9JDzPtgEC1fo4
         u8YTrJME9rv3V06gy8EqkMDpwNBUXY7sg6XmfOxfJ7x/KS65Ul+L5LcNl861hGsXhRIl
         0Yew==
X-Forwarded-Encrypted: i=1; AJvYcCVomc8Hxdz09CaZSd+shfXJDmD+dHtdS5PKnqrI/XIISWQEhwGSPtl3VoXgfwp3gAH5+zJbRyYL0lP1@vger.kernel.org, AJvYcCVtHu8uWMICgXYQrVYDwUV1VY8011YomHPmi0DyQl2lGZzjvJ/Cjuf1+oodJtuA8JTcNhAXw8IEu4f8@vger.kernel.org, AJvYcCWCXfIFSd7WOo6sQXoXwDeKX654eE6Hx5msxnUjJMavAApkpGCsXsms+a3bh7VC8IGhpTLY8TRolbjyF30=@vger.kernel.org, AJvYcCWRR59hvQ5FJKULYHWubodiUNk1yzhMyT8m7DEozmUxy6V5xZNW1kDkY9fATBUkNndWidISdvlcb4f+RK6I@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1h3J4+T/utwT/DblM9wfkPThitHvH082iYbjWldSBO51BqhXS
	dHrbclTEOpaodTpmSiBJAymMIi5vduBJH6QKqHqVzCGpxBrLNg3JuOianxwtY1idO28v4SRgh7v
	bOpvfvaxmw0UdQklRexpzOvtez4qPLA==
X-Gm-Gg: ASbGncuR6UgOB8rmqoDmFVfFln3xadH0QilQCP0f5xusxxgi2wDTLjKIG2JpH+TA29J
	SxSOKcpk7ubwUdqf3BSY2xchOrQZqZCafyLIc7No=
X-Google-Smtp-Source: AGHT+IEeSNtcgAJlHfEykhhMAk5h1lzhfCmyoyAjtiALw616MK9IddiTwG1sOTTjAfW2W2QxEFcSLKMYKytLFPwMpOI=
X-Received: by 2002:a05:6871:8083:b0:29e:5a89:8ed8 with SMTP id
 586e51a60fabf-2aa06687b11mr2647289fac.11.1736383870354; Wed, 08 Jan 2025
 16:51:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250106071337.3017926-1-Leo-Yang@quantatw.com>
 <20250106071337.3017926-3-Leo-Yang@quantatw.com> <b2a336dc-c029-4a95-9807-8e8b82f75ec9@roeck-us.net>
In-Reply-To: <b2a336dc-c029-4a95-9807-8e8b82f75ec9@roeck-us.net>
From: Leo Yang <leo.yang.sy0@gmail.com>
Date: Thu, 9 Jan 2025 08:50:59 +0800
X-Gm-Features: AbW1kvZ6rvrMeK2ArX4UrvAMISLLpyhQLIATUxtoPWwOefncaT3aGzhpR6TwQjA
Message-ID: <CAAfUjZE2x_Fafogna2yhnnohZrGmtW5G3Q64AVhYwVEXuGoaBw@mail.gmail.com>
Subject: Re: [PATCH 2/2] hwmon: Add driver for TI INA233 Current and Power Monitor
To: Guenter Roeck <linux@roeck-us.net>
Cc: jdelvare@suse.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, Leo-Yang@quantatw.com, corbet@lwn.net, 
	Delphine_CC_Chiu@wiwynn.com, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Guenter,

On Mon, Jan 6, 2025 at 11:31=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> =
wrote:
>
> Besides, while I did point out a number of problems, but I did not sugges=
t
> to "rewrite the driver".
>
> Since this is v2 of this driver, the submission should have been versione=
d,
> and a change log should have been provided.
>

Sorry this is my first v2 patch,
I should have been more aware of this problem, thank you.

>
> Why not just pass the power coefficient directly as parameter ?
>
> > +     if (1000000 % *m) {
>
> I fail to understand the logic here. Why scale if and only if m is a clea=
n
> multiple of 1000000 ? Scale if m =3D=3D 1000001 but not if m =3D=3D 10000=
00 ?
> Please explain.
>
> > +             /* Default value, Scaling to keep integer precision,
> > +              * Change it if you need
>
> This comment does not provide any actual information and thus does not
> add any value. Change to what ? Why ? And, again, why not scale if
> m is a multiple of 1000000, no matter how large or small it is ?
>

When we calculate the Telemetry and Warning Conversion Coefficients,
the m-value of the current needs to be calculated via Equation:
1(A)/Current_LSB(A).

The number 1000000 comes from A->uA to match the unit uA of Current_LSB.
Try to prevent the loss of fractional precision in integer.

But this is not enough,
according to spec 7.5.4 Reading Telemetry Data and Warning Thresholds
If there is decimal information in m, we should try to move the decimal poi=
nt
so that the value of m is between -32768 and 32767 and maximize it as much
as possible to minimize rounding errors.

Therefore, if m does not have decimal information, even if the value of m i=
s
scaled up, it is not possible to minimize rounding errors.

But my comments are not clear enough, I'll fix it.

> > +
> > +     /* Maximize while keeping it bounded.*/
> > +     while (scaled_m > MAX_M_VAL || scaled_m < MIN_M_VAL) {
> > +             scaled_m /=3D 10;
>
> This looks wrong. If scaled_m < MIN_M_VAL it doesn't make sense
> to decrease it even more.
>

In this part, I try to move the decimal point so that the value of m is bet=
ween
-32768 and 32767.
Assuming scaled_m =3D -40001, I can scale it to m =3D -4000 and adjust it b=
y R++

> > +             scale_factor++;
> > +     }
> > +     /* Scale up only if fractional part exists. */
> > +     while (scaled_m * 10 < MAX_M_VAL && scaled_m * 10 > MIN_M_VAL && =
!is_integer) {
>
> This looks just as wrong. If scaled_m > 10 * MIN_M_VAL, why increase it e=
ven more ?
>

I think the purpose of spec is to keep as many integers as possible in m, a=
nd
then save the information in decimals via R to minimize rounding errors.
So here I keep the positive numbers as close to 32767 as possible, and the
negative numbers as close to -32768 as possible.

And thank you for the suggestions, they are very helpful and I will
try to fix them.


Best Regards,

Leo Yang
