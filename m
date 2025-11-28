Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 625D4306B20
	for <linux-hwmon@vger.kernel.org>; Fri, 28 Nov 2025 10:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764326228; cv=none; b=bFy8PmtiKhbDXMRPdwJQhpVE+XPqWsTxYhx3VlinEvC9Aj2eyEKqIleZNkJ/80wyu3s/kH5gAA9yn+VU6Ol1dCqRW96Vv8vZV7irsP//SawzOBcy+xBel69mTZmE/K5CL00+xG03YDc0Ce4FwQ3O9gdSjCsW0lMuyL8iW9TXXsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764326228; c=relaxed/simple;
	bh=LsjBUCj2srMne7edzgGW8cbMkZIkCTv5yV9uYfkGBBM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oVElaWggcy2TeGU1FUyND++xTmhdnn0Exr7dXUg+2vBES6baCXqeoPsvuHxT4BAWQxzTCHh11q2RNL00yXjX3dcTOyg1w1y4AvCBJUu2gffLAcuIbe6wVH1VP2z/RiYwSHxPHfxwKrNpScLBg6WqMbSNmAk+/snOuTBX1CEjNyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TyFJfB5E; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TyFJfB5E"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-29844c68068so20074465ad.2
        for <linux-hwmon@vger.kernel.org>; Fri, 28 Nov 2025 02:37:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764326226; x=1764931026; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L4VICBTALhOgKQ11NcNnDdPOSrcRxYndkOphogjBgx4=;
        b=TyFJfB5Ep4A7ODMRUKn8tZ7ZKi6TTBW1kh28faa/niAkS6GcO8WPf7G2Y/g2oubik4
         fzhckhp4qq0IWU5BuOJALxL+nzRPxaWHgo1g9roiJv36iT+0X0zcgfy4kLjj4LdS1Lfd
         /Zg4DJZisPmw9SZFyC5gUpkdHDVHYlVp+2+5V6+6U1k8P7EfvhrYND5Xr09YDd1O7r8l
         Mp/4S/Lb8cDe/tJyl7mgZfCnk3kI+lxQFxcsLRG/9PngjLN7x6NQZrojCz4YtrlFc1wy
         s9yUOjCqBxKzevDIKlwZp6JZL/rHCSdgSNlqpZnvl6jjaotXbp3Wnla1FLhVmXgX7wDu
         d9Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764326226; x=1764931026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=L4VICBTALhOgKQ11NcNnDdPOSrcRxYndkOphogjBgx4=;
        b=Mzx7jJbdvDEqRBK+d2+b7SwN8/Sd5hJ8KbHaEJE3dfNsOonDPUSq0CifQTF+lc+YFK
         ZZvWG8BTAjyr36xi86V0eHEjc8MgcjbkXfelxPU1p3Yu/bLJdNEAVodCV+yEaJ+wocz7
         pIBNTPX8xknh9VWvED7j7VlBu1f5CPL55jscdLV7OPoUnvB/1IS4BCd9ZVgt2kT1QSDb
         v6ixvmTPsSgtkONq9+Fj1RdLEdwm4a54OVHZZ5CQNzgJAxdLQ1Y8uuDEbOjzXFfUO2OS
         VJLYKs5QkqHtLC5oGe2MCE8tOlk+AieWb3JiIzLpzO2lgr6ApwjHA2yq+GDX1ZqL4/2X
         YttA==
X-Forwarded-Encrypted: i=1; AJvYcCV7RGJZoQdRbRU26mn4S5gouQep7i5ZUn8fGjK+ufUD5O/9fUXHmyZNjWbK3vgXDORBQY6cO5bVtsKKmQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzo3QqKNLQayaogAVbYp2yNDepEeCXMzWCy2l8LugYSDFkPWL4Q
	Aqmfq3iTcbJYL5kreFNs22QHy0Jiq5JWI6clomMuFL5ev3iqaSY1zvJg
X-Gm-Gg: ASbGncusf0FKN9v1vqrcXQXsREqb2rcQRpJPGDESenZV4RtwYL9TxQLs8T1REjstmNy
	old536MCK31CEyW9s1gMrfZN8ZBxcHCtPbRxr7k4D4GY/I4kT37ImgoAw6+cBJl+8zsvJdz6DbG
	hx/W0GqdPN+Tyug3O5wcNubPWmcaxkTWAfh3u2ZBSS2VlWcOT06NKVngPQT5IupMRB/twoyAlqt
	1098ehNF7y8U9eh1aj9OVRgSbEsdDEApXoW57xpZ1dosESi7pZcmd5u01rOUehbrgY3HWk7NYYz
	MhjZyH3WG20SL/ORVfBnRQ1Dvjfb0ZXiNnhuDodqBHcGIEWvQgi3SfYsi6OphoLzjDOVth+5pTi
	Y81nGod9/g7k9ZuRP1cxwH1VCOExk8HenX25DZlmYmgbfd4nvj/7LaGH7eIwBbZL2120Cgx+JQK
	yDlek8J0ax1dnIKmnBj4nj+hw61gePMBVrYnl1zId1XPNP3L6PjXixAC3PZ+m2P0kM27RvyJKht
	0ckBZ7vpTauHsG3j01Rv2T/OKQg3snstY6KJgIV3yKXvZbPsoSIbjlPQaehTpoM4sNpDBeAN6pu
	gngQbPax83sVCpXg/rr6SQMcQkfATO2VLr8sbFbQ2MLF05TxKzb0k0c=
X-Google-Smtp-Source: AGHT+IGMXq1Dh7hKw7TbowlI22iUZ08cEdFKrn/i/FIQAiWpJQ+dGpYRwCov3xkXMTBkJf1Am/GMAQ==
X-Received: by 2002:a17:903:b84:b0:295:b7a3:30e6 with SMTP id d9443c01a7336-29b6bec45damr309873285ad.18.1764326225590;
        Fri, 28 Nov 2025 02:37:05 -0800 (PST)
Received: from setsuna.localnet (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bce470347sm41643525ad.41.2025.11.28.02.36.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 02:37:05 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-input@vger.kernel.org,
 linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 05/11] mfd: macsmc: Add new __SMC_KEY macro
Date: Fri, 28 Nov 2025 20:36:56 +1000
Message-ID: <1938104.tdWV9SEqCh@setsuna>
In-Reply-To: <20251120134445.GC661940@google.com>
References:
 <20251112-macsmc-subdevs-v5-0-728e4b91fe81@gmail.com>
 <20251112-macsmc-subdevs-v5-5-728e4b91fe81@gmail.com>
 <20251120134445.GC661940@google.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Thursday, 20 November 2025 11:44:45=E2=80=AFpm Australian Eastern Standa=
rd Time Lee=20
Jones wrote:
> On Wed, 12 Nov 2025, James Calligeros wrote:
> > When using the _SMC_KEY macro in switch/case statements, GCC 15.2.1 err=
ors
> > out with 'case label does not reduce to an integer constant'. Introduce
> > a new __SMC_KEY macro that can be used instead.
> >=20
> > Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
> > ---
> >=20
> >  include/linux/mfd/macsmc.h | 1 +
> >  1 file changed, 1 insertion(+)
> >=20
> > diff --git a/include/linux/mfd/macsmc.h b/include/linux/mfd/macsmc.h
> > index 6b13f01a8592..f6f80c33b5cf 100644
> > --- a/include/linux/mfd/macsmc.h
> > +++ b/include/linux/mfd/macsmc.h
> > @@ -41,6 +41,7 @@ typedef u32 smc_key;
> >=20
> >   */
> > =20
> >  #define SMC_KEY(s) (smc_key)(_SMC_KEY(#s))
> >  #define _SMC_KEY(s) (((s)[0] << 24) | ((s)[1] << 16) | ((s)[2] << 8) |
> >  (s)[3])>=20
> > +#define __SMC_KEY(a, b, c, d) (((u32)(a) << 24) | ((u32)(b) << 16) |
> > ((u32)(c) << 8) | ((u32)(d)))
> Are we expecting users/consumers to be able to tell the difference
> between SMC_KEY and __SMC_KEY (assuming that _SMC_KEY is just an
> internal)?

_SMC_KEY is used in the gpio driver, and I would have used it here too if n=
ot=20
for GCC complaining about it. I wouldn't expect anyone to want to use=20
__SMC_KEY outside of the specific use case this commit addresses given the=
=20
suboptimal ergonomics.

> I have not tested this and it is just off the top of my head, but does
> this work:
>=20
> #define _SMC_KEY(s) __SMC_KEY((s)[0], (s)[1], (s)[2], (s)[3])

This works fine on a smattering of M1 and M2 series machines. I can submit =
a=20
v6 with this and the hwmon driver dropped if need be.

Regards,
James


