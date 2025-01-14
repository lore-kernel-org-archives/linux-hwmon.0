Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B31E420459B;
	Tue, 14 Jan 2025 08:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736841754; cv=none; b=LBTDPYE/x3Y+McXxQDKU5Tv42pvbfB7ALLp2H54K/wIaHlqd3230x5zIkds7ItFH4zMVch5kWpq8tcW+bDmafwJzB702ehA5nhat3EUyEdUaRAbxVePSTtpmAkHWKa1UjXtpo9x+vgoBkH13i1nYzSlJURUD0b7skBLJZILAMLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736841754; c=relaxed/simple;
	bh=FJQ4jgHaE2S3KrKSKantHpso3vyWWyAqew7RsSKUpqM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EAcZS/d9GmOvEWYzjPiXN7+yuglm+Ta41ZwjxOeniQOVRb1EZ+Ln2M6jEw47cAxQVQfPeZh6mZKS9mMlUzawpB3Wqw6sbhFj2zJ6q0sUEAG4c7F+oj8sAEuGTdqhJ5PuUYYTtpzIimwps6oGYpLP5ZUttA9RTdc5JRamvRXNc+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TOacZSXl; arc=none smtp.client-ip=209.85.160.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TOacZSXl"
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-29f7b5fbc9aso1646919fac.3;
        Tue, 14 Jan 2025 00:02:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736841752; x=1737446552; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uxCNFGsCd9Pxknxd17KcfrgKUeSMQ91UCZMrUmYPLCg=;
        b=TOacZSXlVxZBIcLsf8aAvhqRE+0AUbF/uC2VUjBFb4Z8zEQnkYcDGhRM011a+Ikvw5
         i0QmHDpD2udYBS0XL0K19eNeSGe2tsYrPraannH9vMobREYGsBXMn5fpKxgyt6+ZIhc/
         zqsuo4bj2ftSAKked5D1Jp64DcBrFfvpB4eBlaPkI6IR1PErHgTUZ2+Pm5SWCDEV18Tp
         XR39o5yYQ5cWUmDU5xwAiqQUmDIUyIUNLFE6kJkDV3KeEzCTr3eL+LCfzXX8jTCXOvjB
         8xMkQ+SKPtRyeVCOUK6mqBN52VLWs4/gNKftCSK8VKnON6wqo48LzV+lQuvReSvSpW6B
         VctQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736841752; x=1737446552;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uxCNFGsCd9Pxknxd17KcfrgKUeSMQ91UCZMrUmYPLCg=;
        b=liic1zYqCJ2Oj1+HRjb9u8NxfNGmuyqCvVQ6ou2J5vz2MPCIZ65KrN0KkGZpAN90Dj
         +HctHoy0+Y7Nv0+rcMkDLCw4iQ9ijhjVIRttv51kkDXE97DfxM5JMtleu7B3Mq5pP/dr
         rFt5ovCQKrvz9LefeWlFo1cSw+/I5lDRqHm4V0dSKgsRjD58ZWBdWGFZznG2z5Jtk4nZ
         z4wS9iFGWaH2HuoUBIcmTfbiR48GVKlnNX8LGfvrazIC2Ttt5QjdH8uMzEuApN6xT9Wa
         pgTq403wi/yV2FzDlGLNN//8taCHaf4wT1IecisjBmSbGaBVaCkfPvVtAwXnA3wd6mEF
         6ANw==
X-Forwarded-Encrypted: i=1; AJvYcCWZiGU/sdeLBudoeyn3Eta0Fy4EKjLdWL6SelFy7VGuly+HEr3xcL4KNiPkkHBkGm6GaR9j5teCqxgR@vger.kernel.org, AJvYcCWnXNIfRcLA39fXYMkOePZk1LxHDN3w8hT8Z2m38CnCE2uiv9InA+s59OC3UQF/lyLCrURQUqNR1FwK@vger.kernel.org, AJvYcCXAzhR8md3KL6M+OlEY4zuiBQd1OSy9xwX4e3QYkKV4tS5B//sUSjkF6nBBJqncDD58oMYynmR7q2HPjXI=@vger.kernel.org, AJvYcCXvkf9KOXWvltW+INMA6Mfermx9EDWMymFzd39Bq8gyawyDcjwkBzICsgEWxwAPWWctDyuHYGu+uULTgoyz@vger.kernel.org
X-Gm-Message-State: AOJu0YxVmLqChFx855XPeZ2cPx+E1vUu0lim2RKlvTvZUj3bQHplXT6W
	fIC6kTbwGc/xV8ieRdNxlRcinytYEDw+JhKKnt2mHI1IuUjJhNkJN+zV+iUQebgHLkZLfAyMw5m
	w0M/ORfAJEHkwysESFCPlKUY9X3U=
X-Gm-Gg: ASbGncumHMCLD4gOeJSb/yKaoqj3WSD+w0Nr8vPKx5bQNCDShdAP8R3jXTKgLzwBWoS
	XV9Omrt4HVr04XnnJy73munpRaUngoFZBLPNVqYw=
X-Google-Smtp-Source: AGHT+IHvZFzoFqt91w+lAv28oiZpMYG2hHJOTLlfQ7MC/LkUoLn0eJbHyblKoBGsyS2irsY8aJKtw1v7bKwijdirJDs=
X-Received: by 2002:a05:6871:438e:b0:277:d8ee:6dda with SMTP id
 586e51a60fabf-2aa067a93efmr13204402fac.23.1736841751699; Tue, 14 Jan 2025
 00:02:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250110081546.61667-1-Leo-Yang@quantatw.com> <20250110081546.61667-3-Leo-Yang@quantatw.com>
 <190bb6f2-7bbe-4145-b45f-4ad6672884b8@roeck-us.net>
In-Reply-To: <190bb6f2-7bbe-4145-b45f-4ad6672884b8@roeck-us.net>
From: Leo Yang <leo.yang.sy0@gmail.com>
Date: Tue, 14 Jan 2025 16:02:20 +0800
X-Gm-Features: AbW1kvadziFJsO0ilbK06rbaq7Bb4Z-unrsBPvYRa6hHoNrFowJxSxNfRi_PmKY
Message-ID: <CAAfUjZF7jOoZz5h6XkxqOyt=x8xnv+SUbMWJ1bVdxUzFRTO8cA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] hwmon: Add driver for TI INA232 Current and Power Monitor
To: Guenter Roeck <linux@roeck-us.net>
Cc: jdelvare@suse.com, robh@kernel.org, davem@davemloft.net, 
	krzk+dt@kernel.org, conor+dt@kernel.org, Leo-Yang@quantatw.com, 
	corbet@lwn.net, Delphine_CC_Chiu@wiwynn.com, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Guenter,

On Sat, Jan 11, 2025 at 12:22=E2=80=AFAM Guenter Roeck <linux@roeck-us.net>=
 wrote:
>
> > +
> > +     /* If INA233 skips current/power, shunt-resistor and current-lsb =
aren't needed. */
> > +     /* read rshunt value (uOhm) */
> > +     if (of_property_read_u32(client->dev.of_node, "shunt-resistor", &=
rshunt) < 0)
> > +             rshunt =3D INA233_RSHUNT_DEFAULT;
> > +
> > +     /* read current_lsb value (uA) */
> > +     if (of_property_read_u16(client->dev.of_node, "ti,current-lsb", &=
current_lsb) < 0)
> > +             current_lsb =3D INA233_CURRENT_LSB_DEFAULT;
> > +
> of_property_read_u16() returns -EOVERFLOW if the value provided was too l=
arge.
> This should be checked to avoid situations where the value provided in de=
vicetree
> is too large.
>
Sorry I have a question, I can't get it to return -EOVERFLOW when I test it
I am using the following properties:
test16 =3D /bits/ 16 <0xfffd>;
of_property_read_u16 reads 0xfffd

test16o =3D /bits/ 16 <0xfffdd>;
of_property_read_u16 reads 0xffdd

test16o =3D <0xfffdd>;
of_property_read_u16 reads 0xf

test16array =3D /bits/ 16 <0xfffd 0xfffe>;
of_property_read_u16 reads 0xfffd

The same result for device_property_read_u16, it seems that a data
truncation occurs and none of them return -EOVERFLOW.

So maybe there is no need to check EOVERFLOW?
Or maybe we could use the minimum and maximum of the binding to
indicate the range.


Best Regards,

Leo Yang
