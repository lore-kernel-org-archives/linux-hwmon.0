Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D2B225392A
	for <linux-hwmon@vger.kernel.org>; Sun, 28 Dec 2025 20:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766953304; cv=none; b=FXU2om2ygRE5m4fqFJ9brKsVEYkzMvaNCEQXiUngpyj5NREprCLhgVH4qLv+fy/vd8PxfqL3ExbwOhJz3iY6eGl6H+jDmpMPBdOX/T17Nj/Ju5xX0LZlzq9AFpVTwMNnxUbjI09pRQ7GB8MsrRIA23I2OAqrTYxB767wXn49Lbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766953304; c=relaxed/simple;
	bh=vo9bAHyQvn5bfZA7ExEk2z/d/oObPUuMngzCZpTJuR8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EYqx6jdnmbLsnmzFHYm2tJK/c1ae1T863TlUHyVhpzNX2eQtj4E7xIVGckmtRiAqEgnRKf5A5FAf/ho8AWD5hiG/a2rgG/oIZ5fBF3K9qLKdjWXSIhW4xmML0hCqKsOvc0y92ElvTmnaSoVxUHBVJ00SbEb6chCjXg2hebEeZEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=perenite.com; spf=pass smtp.mailfrom=perenite.com; dkim=pass (2048-bit key) header.d=perenite-com.20230601.gappssmtp.com header.i=@perenite-com.20230601.gappssmtp.com header.b=oT+Uv+Lt; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=perenite.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perenite.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=perenite-com.20230601.gappssmtp.com header.i=@perenite-com.20230601.gappssmtp.com header.b="oT+Uv+Lt"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-37a415a22ecso43586261fa.0
        for <linux-hwmon@vger.kernel.org>; Sun, 28 Dec 2025 12:21:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=perenite-com.20230601.gappssmtp.com; s=20230601; t=1766953300; x=1767558100; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vo9bAHyQvn5bfZA7ExEk2z/d/oObPUuMngzCZpTJuR8=;
        b=oT+Uv+LtCbPuRrWElxckwV+lo0fg+ssIrdub+Ovl5a1TlfMuoSmwT/IyWf+nAswnip
         s/DYyDLD0LW2FNh+fjkCtlqDWO6DwNcxoFIbgWIo0qfqArhYglERvvLLvifFyr8XSC1I
         YhMp2FxCXvQ+1++sZnIteqIBGmBTNfTL23YKu/lYAfYEkR4+olFZEJ83bNv9A0CTH06/
         /J3lD3rBgEj87R8yiOMqEgrlEnMX2uDRjWsak+suB68/q1d2aD1Y0pxEYWyOxqHh70xR
         Z8SSraqmKIRbLU9oIIjQ2h3r8yIvCHWY7WM1zrcwdfbTpHuVdnsXBO4X5iqvKb/q68vZ
         SFMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766953300; x=1767558100;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vo9bAHyQvn5bfZA7ExEk2z/d/oObPUuMngzCZpTJuR8=;
        b=J5ptKAuw7ezikfMVOQHeAs7fbpX0VRH48fE5PRocd3vX6rAnSXxCfXdEMOHDQkEpnt
         rTIRE8HardUolpSLSl1jfPqQxegoF1t7KvM/yOPITDHPbB9dVcae86Dqf8mPOSsbal5S
         nUkORDDH9iJt0vq8EYHfMB/+ZWcyN+6hzSDNM4LR7SN9Jh5KkhgdS+Ua3CAxxVxt7Yg2
         ZzObeD2cUQ6ri4j0h6N/jUleXYVOfE0GPnFOLIc3GfWtBixrSleqy+yb0CGo0ZZX4Xjn
         r2e32NsMrUZjhkFMTW7jr32tttrrOLXgpeWEL/nEEh5PEiaY8zIiBp+8co5jQ7VlBl4r
         MBEA==
X-Forwarded-Encrypted: i=1; AJvYcCWMtfocJZUKeUgqHg7RDBFc4Fv7V1APg8EsA1bqVaXw0TmsdNr65W+RJmPrDbOIPX/6hvpxT1Cvgyrg5A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwpcWI4kggAjy6NrB9ZHS4KrFRILC79clchigkZlbUicgTf/xEu
	8iwDyR3Qup0jJ8tHAka+SM5iIcm+itow8R/LtHWSnRqH9kshOv72TynMHsZxoYbTn1jitqeYrEy
	2ouLyDQcM/uj36ad2WzPq6oLb5nbwCsW5nRGWz89mRUn68WnvqCc=
X-Gm-Gg: AY/fxX474tgnMYss/Wqj9mRndt8V+XHHaoNlNLTMLJ7+zA++WUICkPnGyrW04c7Pdw+
	RhRKjSBqbKvOt2SDGiSeeQdbtliwWy3n939X2EHWZK0998jvG520F/8hh/SkspsD4nkteDY0peQ
	EpBJjq81yNb4z/0cOCrZ3SOT+QPeSGs6guUsJaKTEnRA4Km6q732NVV+hE3fApSAPeN41k66joW
	vwk7BaexPhgI0zJamsxPNyl4o+5+AkCZu5wVIkk18fYnz4cRFOWnqZbUVNWPVXZldhuLAb66z87
	zA5kELZYIJ9p2c/T28dtuuNMdqM3
X-Google-Smtp-Source: AGHT+IFmNo/k78k/eYdB5mv6DhoBQ/dlTrkaz/0F4aBa68iVSBIaDkZTFDZo61eFWnNCqQJX0d3I/PIHfjzojYqW4jk=
X-Received: by 2002:a05:651c:1603:b0:37f:d592:a7d1 with SMTP id
 38308e7fff4ca-3812084c6afmr87048831fa.16.1766953299592; Sun, 28 Dec 2025
 12:21:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251226203021.27244-1-yahoo@perenite.com> <CAGHj7OJaSvSsr0z43phjs1YvL17xfJWesJFj0iQpdvi8=VXZhA@mail.gmail.com>
 <cf3a84de-9223-48e2-b6e2-c97e348b4c0b@roeck-us.net>
In-Reply-To: <cf3a84de-9223-48e2-b6e2-c97e348b4c0b@roeck-us.net>
From: Benoit Masson <yahoo@perenite.com>
Date: Sun, 28 Dec 2025 21:21:28 +0100
X-Gm-Features: AQt7F2rVDFh7Nb-lmVbmoAksQNbWafogicQAsYG1EBX4iZ8AFhB1lMiAjidCZwE
Message-ID: <CAGHj7OJkDp5ooe1zPjaP2OZe9a1uv8+92iSLmnncCTPwyuhp_A@mail.gmail.com>
Subject: Re: [PATCH] hwmon: it87: describe per-chip temperature resources
To: Guenter Roeck <linux@roeck-us.net>
Cc: jdelvare@suse.com, linux-hwmon@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

They are intended to be added to add feature needed by new chipset one
by one not breaking the current ones. So you can review and discuss
feature by feature.

Benoit

On Sun, Dec 28, 2025 at 8:33=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> =
wrote:
>
> On Fri, Dec 26, 2025 at 09:54:44PM +0100, Benoit Masson wrote:
> > This patch is intended to be part of a series to help with support of
> > newer IT chipp which have new more dynamic options, and make the
> > review easier.
> >
>
> Then why don't you send it as series with this as patch 0 of the series ?
> You are saying this would be to make reviews easier, but in reality you
> are making it more difficult.
>
> Guenter
