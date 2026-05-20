Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A339F23D7C2
	for <linux-hwmon@vger.kernel.org>; Wed, 20 May 2026 06:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779259220; cv=pass; b=GU9XMtRCZIDhqVta+7qNIEsMgWkdpxbdzw7fXpp4Y9Zygv5xdhuuNr7UOByjfgSO3tTReDTgCOCzNvuGsTgurRDdFET3wBmF+1zqYflcgAO3GjK/2fc99LLh85y4TfR4Hone+hzcFuj/ucwHdhUwbVRO+yllWDguAYT120wEgNY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779259220; c=relaxed/simple;
	bh=MTpNRk7w6vzPKVgSIynyWRvRyY9jOjm8Y+Z20YHKAnw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u7pa51mHrkr+2nWoeJmV5UbO0glLy9TvgIojL6if4JOepQ/z6ga45hSZWWC+QlukeqLUbJeKAfgfVrlerMxuEbyDYmZVNITpe7/arIyBpECrRa+XOOi4U/TCRGOQK5KaFg0MC/988iNgZgFmwG8vzCrALe9g0ez5Wk5Nd/5kVOE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DlpHxCpS; arc=pass smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DlpHxCpS"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2f33ae12f97so1730827eec.1
        for <linux-hwmon@vger.kernel.org>; Tue, 19 May 2026 23:40:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779259219; cv=none;
        d=google.com; s=arc-20240605;
        b=juZpaMdKJALS+Z0N/4Cn7G338IZ9dqc2603gzOtXb4eg/Lb0Vc5sxLRC4l0/5F50GM
         8x7OKaf/VWcwjInV33/e9AXcTjd324+hluBgXDLQvN81T1kw1sbdyeypR2PLCC6Paj7G
         jZmJl/Gu9/JOCKA8r9iBNkjcuom4wSfE+pwMl2woT332x5CSeIYmPHD58z1XyQtzsX6c
         iZoN1tQL7kMcE7zfFrum6TaGgm36otlAkooRhly5bXBgBlBh3MORooYBVTjDjTiUzPR0
         1MPUAh9Zzq4k6EPFE4nSBNycrzbynEQdtt/5j4RMuSlenIamKmJ5cb20/49S1eZhBry3
         eyQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=G060AVqJsIIyC6kEiga/qmD1PuI78M5kJXkgzfK6+o8=;
        fh=RoWtYKgU8RIodkE+4qltijPfFD5XZRGAvvCWFn8Swb0=;
        b=ScTecLFWRatZJOVBL7bJejn4nC6Va0V0HrutThBb9634gu04QKvBxSM93Q3DWz1grh
         VhwU5H9X63omhVKu4HuT2y33WH+hTEpIKK83mdA/jWrhMtUxpZ9uzS4xWgr4ymbiH1Hu
         z3w5XuPv7B/J2pGyyE/fne/INJob4PGokXGNreKCJPqMGw6Sw0KivZG8dHq2cAYBvK14
         tvd/Y26PFpeFpsy7JkLKb6yR5KIHC+S8hFe5KZeslUnWDAo+Mtq1C9ZBSUR2HTMTHl/5
         UVkFcQMrkBRmBD7B3fX+1vx+Gh4g3KQhqgctgxK+HyxWKZq9XkP1U8dl4fNDaRpCVi81
         ZJYg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779259219; x=1779864019; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G060AVqJsIIyC6kEiga/qmD1PuI78M5kJXkgzfK6+o8=;
        b=DlpHxCpSj98B82hV8yKngrwlyh4LbQctRIpE7tKA1R4guvs/iyxLm9kw9cVua6sidR
         t463bylg3uyICmhUCSYW4Xbm9175riRSZMuvFg5ofEmozYEA9D1ei0b/NYdPibk0Ykxs
         8m13D9kbRlX+TCAOm4b/hF3A64elVMapnhKon3a4VOoqrcSc/zEjIPl8HveJtEgOBH5A
         I1sRa2pjh0+OnHVdfhdEnLnOqpZQWfVX7OkJvVHsMtw2HqakWyYUs4zOxeXRehv4tfPU
         S+uWrW01ulLbWYS5xDfuw8MbZ2qBaen+kBAqLWIGFoP9xthN+x56SDQQDD9TnB/r5GBw
         lnug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779259219; x=1779864019;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=G060AVqJsIIyC6kEiga/qmD1PuI78M5kJXkgzfK6+o8=;
        b=YN09bPkIv2b8ZCLZRqvhIG30mI1Wwv0i8i3zAnXcOfP949quQfUT4YDB69Kjup3STX
         5jPp4bW7bL5dt4g9PXYdfs50XjFs1jpTGO3jp0FfVvbDxGvBdizAqEZnFmnWJDf7OWpq
         tFK1HMWpctmCLZ8fwttnl3DPFLJASNDnaHW13MaJeGePxs93RH+ECQxfoXiPoQniV0EY
         f5M1679JHuNIFm8rY9q8vcvAc6NdpoubjK3AmMAmaqZIkwHtIIAUXdk7a+M584J9NtdM
         /3C9SDjXFMC/ybfDBqhS6Y+y2eIQfalE/sDB7sRnScwXgWje+iMiMuYdClOF1K/jtOoO
         xYXA==
X-Forwarded-Encrypted: i=1; AFNElJ/UglaA5Y2FxEtfJZO1QyyjC/nT224d98Z7E6me8bYZPA1jW+hzO5022AL49FS6aEKB/j22wq/lTwJfxQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YynAXzWDjjd1jc0eoQFxJ9q+2rtd+XFacVAgikuk78yOwRPYxek
	zFNXHxy5X9IeMJ6RN1GEzhLCYDNQ8FLZmSM5QTnX7QrpOegrgb4F+8suxYg7V1v+8AuH5jMrJCX
	46G2X9/B0Ym0qWaXwgg1VrA8xXXWP7jw=
X-Gm-Gg: Acq92OEjB1U4u1tsuDTrZDb6gucT67GdDQ0PWbCBjlE8uuZy7Wd7pQ0Ny3e1QngHP+A
	cBINpVBcF2dzGV7FoT75KUkmPsh71pKXyF9Y8bNb+TgfTy/W1cBC75O63+0LVElrsafDBTuhHW6
	sr47D00cS0vwDWRMm8c3pQTxOk3GBuNiSs1heJpWpway2XjNh4L5N07ww7BVauhQ8H5M1uQhLcl
	XkdD+zUMQUR+luNfXAoFf9qYHnsdJxJgIBU+tlh7wEcQexIK2oeAbIiSa3/FKpO5sbnfR05xGDB
	h0gjSQ+QSdwTrsJPLQ==
X-Received: by 2002:a05:7301:4185:b0:2d8:97d6:6ac8 with SMTP id
 5a478bee46e88-30398625a6amr11919674eec.21.1779259218719; Tue, 19 May 2026
 23:40:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260519075558.91466-1-Ashish.Yadav@infineon.com> <51133193-57fb-4a22-bf9e-9817f1f52ad5@roeck-us.net>
In-Reply-To: <51133193-57fb-4a22-bf9e-9817f1f52ad5@roeck-us.net>
From: ashish yadav <ashishyadav78@gmail.com>
Date: Wed, 20 May 2026 12:10:07 +0530
X-Gm-Features: AVHnY4Iepxm-mJMOkOxQoHVH0KszUzysdkJGmhPPBqTTDoKHtWYjCTLk1Ni7Zpg
Message-ID: <CAJKbuCbW9frUay5Z1NzF+RbiCEU6t+-p20YTwNhdWjnxJu_FOg@mail.gmail.com>
Subject: Re: [PATCH 0/2] Add support for Infineon Digital eFuse XDP730
To: Guenter Roeck <linux@roeck-us.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ashish Yadav <ashish.yadav@infineon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Guenter,

Thanks for your time and response.
You are entirely correct that the XDP720 and XDP730 drivers are 99% identic=
al.
The only functional difference between the two variants lies within
their GIMON values.

To programmatically identify whether the current target device is an
XDP720 or an XDP730, the system must query the MFR_MODEL register.
Because this register is 8 bytes long, it requires an I2C Block Read
operation to retrieve the model identifier string.
However, some embedded I2C controllers do not natively support I2C Block Re=
ads.
It is precisely due to this hardware controller limitation that we
proposed developing two separate drivers, ensuring reliable
compatibility across different system architectures.

As a better alternative, an elegant solution to consolidate this into
a single driver is to utilize the i2c_transfer() API to read the
MFR_MODEL register.
Please let me know if you have any questions regarding this approach.

With Best Regards,
   Ashish Yadav


On Tue, May 19, 2026 at 8:59=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> =
wrote:
>
> On 5/19/26 00:55, ASHISH YADAV wrote:
> > From: Ashish Yadav <ashish.yadav@infineon.com>
> >
> > Hi,
> >
> > These patches add support for Infineon Digital eFuse XDP730.
> > XDP730 provides accurate system telemetry (V, I, P, T) and
> > reports analog current at the IMON pin for post-processing.
> >
> > The Current and Power measurement depends on the RIMON and GIMON values=
.
> > Please look into data sheet sections 4.4.2 and 4.4.4 for more details:
> > https://www.infineon.com/assets/row/public/documents/24/49/infineon-xdp=
730-001-datasheet-en.pdf
> >
>
> This driver is 99% identical to the xdp720 driver, except for the gimon
> constants. Please add support for this chip to that driver.
>
> Thanks,
> Guenter
>
