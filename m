Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 233E540312F
	for <linux-hwmon@vger.kernel.org>; Wed, 27 May 2026 14:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779892950; cv=pass; b=d+//wKzZntA4KNQvc9KMqgHJXeqTp6tO1nUyvlvpnSqdlsicXCzWknmVYCD23Ct2gSFqVWIQcBkV70TY2rakyQsA3faE5l+BKbTqRUu5WkS+eptgHGCwgf47Ih9xAaPYGQQlyD4XGy0d15BchwO0sKMDrgL4yrIGpB1Go8CC7r4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779892950; c=relaxed/simple;
	bh=Wkjf0xfD0fgdDS+kPV5B88MN47vTkuZEVXzAIEFeTRY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q4sI2bujjyMz6KVYKTGgDCmFd/n3PIC8gy1U9Uk2KsCAJr/FTkR+oY7l2GIpF7jqSrS1E4C1kgDk/pxuN/s7fw/QBKIat5WQ9mIHhQrAuT4BjuexNVFF1ktpV1pf4NDheOlNd5Dwnh69qoDyWDjTQWW/mYP4OKEyu5c0TK+ivXI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MLswE/Vs; arc=pass smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MLswE/Vs"
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-65c0bda7f15so11717928d50.0
        for <linux-hwmon@vger.kernel.org>; Wed, 27 May 2026 07:42:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779892948; cv=none;
        d=google.com; s=arc-20240605;
        b=fVn9+aSPV0J8ug/mY1n3HSi5uT0aUBNu2NZ6/QDClT4Tr3jtikZG8LQ0lezA2eV1dR
         GrCfurpRRxna8ZLipgljNgDlcLXXUI+RU00ge1SKkuv/E/neAD9v5kXLamlRDe1vXW8i
         3HyxPVHIVDPWVY5M/cBFHWWMjtWtu6/9UanUlUa+9BhATGUqkssZTWehASOxoFHRYQ7J
         WCdJTnRlZ79z8NEveRW650slo+2oROeuo2oNkC83pqNQ/82VLY5XR5j+QSNDTHSklNor
         DBGjThLQh5eitasIQA1waVwgqJVOK6jizeYnBFQTAUsB+KqzDI3kT1Zld9Y3Ldro2+4n
         lsSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hlWIP+UVVvtbpjNyLXvxi0le4H6Qgzv6+ziP6V6KTS8=;
        fh=uPvrR+GhnTmGuuGUOGuw9ydhq8pNcGECGDIhDr4fpd0=;
        b=Z5O2fzL+n6EEaN5b2583BoZbQfrZ193LToxNSwykBGgYGO2cycg7b+L8+rFqromynj
         RPN+lM2u6BvG7bc+QLAbPq4u6WfljsceZqotFmM856P1vHzFUZ0J7l557OthshATM+5/
         KfzizdugY9u8haMd8gQspnooYexf1/zDvUdJj1QQP9+vYHg4dyk35RPDnlE60YHDLwn3
         uGkoZ40VkUVZV3rp9gpct9a5TMUsrx/hTM2q6Ibd+Rt9PTHyv+FkeXXzSzjzxthyzeh1
         JDJUO6xepBsP4q3wWe5Ou1R/uq6OKi8ugTGOQKRffx+SQP5w9I07JqQ1tcSCEQkAl0Zt
         xgxg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779892948; x=1780497748; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hlWIP+UVVvtbpjNyLXvxi0le4H6Qgzv6+ziP6V6KTS8=;
        b=MLswE/Vs49DsA34EQyTLb3fN8q4HfRoJHVe7hJ3EZJHriNmCWMHWLfWdaDKqOR+Z92
         oBxelXDr1GsvkiGRHHak5Jzg2pOPB9D+JJNo2W02ug4noNAqfIprpSzu831vJIqsoNFb
         MNowTIjCz5SfR0XGP/hE4F3HL3wV63lBsylEOJIM3XpTX54z/Nn54MUwZcLjVvVJnU4/
         KCYgRhL1ZsvNZpzxV9ZMfoU1sl0F2JvR24i2fTMlBTVZpA7CwU/Tog+WpbtJannhRMw7
         n5tWgWFV9hjS4fC5AIrlLoyq5PaFrwLmZE49w0PM4Bdu5l3MZX9l7RfuAts+9gNheHrg
         8Mjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779892948; x=1780497748;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hlWIP+UVVvtbpjNyLXvxi0le4H6Qgzv6+ziP6V6KTS8=;
        b=eKHAkf8QGghPtCtNO+2uOJWfKc576Lp0Jr/XAMB7PnhTIHjWhG0H8fkB3NRwUgCRf+
         bq2NCEtYFU5uweFvczMWEqOU5kRSqaJoyFbBSBr7gMzM/bEhGtE6BitbkLTgWqhb737I
         fTMdRBmX4R9Deh2hTe74+w5qAzWWyob1umazfj5MRGHbMiW8lsZU+1B+1V+hck6OoFdH
         PQubHFMRpSkYf99Ccspp7dbetdqm+892YFDe4xbx7VhXyXNwH1XosAlgstIHhLArOaJx
         Vp5tMakIMRahOe5Q8GdBToY5imxSy6L6AQL6dA9YXteJCXkBCpHlFqrwJH2XOEHAMlMb
         WVaQ==
X-Forwarded-Encrypted: i=1; AFNElJ8HkbqMftqiSTSQQBj7n1zpL+bhxqLE0maT7eT5jPmSNAFiBdz+mI+IvEfyRnWdPjsgicD1O6WKaTQBLQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywf5xXN7RYABTSmjyGlPx9iz1rt2SXfiFVaBW6Kt9qFhJzAYo9e
	/GyrxEG1Ow129TQkUHASJzd7DpQNo9T8hwyZiGMPrJTWTrruNYfEgNaLB0Navu9VzJIR9kFwtEl
	qDmhswIjvT0nyBOD3bX9iYyMdFi4rCD0=
X-Gm-Gg: Acq92OGhDuAWkFrJYPaldz8zvWtaEjy6LwFPBmnOlppCqvlYpyHKVR2/XY31e6gxL71
	kzDdYxoWVtZNduqaiNj6q5Q0CL6Qx7OpZO0WZNF0Q98wTe5Md6k3ftT3tgInfunn+1Yh8/1UrZZ
	88OukUD+p2YCFHiDF4T3OJowxMRJYSZjhsge7gbpd2vGHN/M/SFkzSoZznKyxBS5fbFrMxSI6mj
	HlRRP4zu6bDyDrW4vWCXA4CQmIEjKUNKH6EXdfB0+t0ngbQ5hrLIaCPfbiywMfEZh4YlMrqGe9l
	21yLa5OxjQ==
X-Received: by 2002:a53:d053:0:20b0:65c:5b88:84a8 with SMTP id
 956f58d0204a3-65ec966be89mr18424914d50.14.1779892948116; Wed, 27 May 2026
 07:42:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260524205112.26638-1-wafgo01@gmail.com> <20260524205112.26638-5-wafgo01@gmail.com>
 <20260526173616.256fd535@jic23-huawei> <20260527143515.102794-3-wafgo01@gmail.com>
In-Reply-To: <20260527143515.102794-3-wafgo01@gmail.com>
From: Maxwell Doose <m32285159@gmail.com>
Date: Wed, 27 May 2026 09:42:17 -0500
X-Gm-Features: AVHnY4KqJRjrOALhnhkMuN-1YF-kxouvAtTfdFTs73jWaX1UNoZiFjbArngVtBQ
Message-ID: <CAKqfh0GbHLALg8eEBf2EtmKXAsB=H7EXL=6D49yaNWiMutycvQ@mail.gmail.com>
Subject: Re: [RFC PATCH v1 4/4] MAINTAINERS: add entry for Sensirion SLF3x
 flow sensor driver
To: Wadim Mueller <wafgo01@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, lars@metafoo.de, dlechner@baylibre.com, 
	nuno.sa@analog.com, andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux@roeck-us.net, jdelvare@suse.com, ak@it-klinger.de, 
	linux-iio@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wadim,

On Wed, May 27, 2026 at 9:37=E2=80=AFAM Wadim Mueller <wafgo01@gmail.com> w=
rote:
>
> On Tue, 26 May 2026 17:36:16 +0100
> Jonathan Cameron <jic23@kernel.org> wrote:
>
> > > +SENSIRION SLF3X LIQUID FLOW SENSOR DRIVER
> > > +M: Wadim Mueller <wafgo01@gmail.com>
> > > +L: linux-iio@vger.kernel.org
> > > +S: Maintained
> > > +F: Documentation/devicetree/bindings/iio/flow/sensirion,slf3s.yaml
> > > +F: drivers/iio/flow/slf3x.c
> > No need for separate patch.  Bring it in with the dt entry in the bindi=
ng
> > patch then add the .c file in the following one.
>
> Done in v2.  MAINTAINERS hunk is in the driver patch (3/3); F:
> line points at drivers/iio/flow/slf3s.c.  Series is 3 patches
> now (types, dt-binding, driver+MAINTAINERS).
>

I was taking a look at the data sheet for this device and thought it
was rather interesting. I'd be willing to help review patches for this
driver if you'd like :)

best regards,
max
