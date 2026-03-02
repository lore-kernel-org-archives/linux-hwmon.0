Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F1ED35DA61
	for <linux-hwmon@vger.kernel.org>; Mon,  2 Mar 2026 10:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772449179; cv=pass; b=OZwcxxm3AQZvw+TKn09P/Orc6uVtTF2fYpltYK74yfaKyKcKZzmGQs6FkvQWnb8UWcs2aaIOte9XE1zDSJUZv1rfqErRUF411Km6EV8O6+MA4itTGGqTdPx42voU3gPGFchHxO56uxlhR9IbU9jEGv5x5kggYs27W9cG59DHOYY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772449179; c=relaxed/simple;
	bh=DOlMsHbMVLndF4FYMYvBm7QWT7c+r+O4d0gh3fB6Nu4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SigQ5Ew+w4jxbZHcZdb2sMyFRfEit9RvMHik7rDxXuB8Jd+e8m8jECV33t/jA5FjWFkLA2J4BkBmLAbq0vTkhHKhfSYpJZ4YlscIglm4GTO5F15P3GM4KRBxgwfx2SvOU4vDzXYm4UUwsZm3GKLnr0PjJfMlya7MAn1hDJN7jhI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zxtoyy6J; arc=pass smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zxtoyy6J"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7d513bc15c7so5921295a34.1
        for <linux-hwmon@vger.kernel.org>; Mon, 02 Mar 2026 02:59:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772449177; cv=none;
        d=google.com; s=arc-20240605;
        b=VlKexRxSZUxmo6I9te2rKXVOZwEhBVU4PGroPNDeWafeXCxWMI4ghibuOkgoNYgsFQ
         UNsEXFDjQ5yJAgydt6NZLGGNFCc/1jfBHlBYfDGdVI5hTvywC2Ie3vmWZQCfx5LKR6dN
         CQ56mkRw6Yk04lyOsZwWh5YHC+OtkUidrVKSBmaBGUb5/tFSGMWeXBsE2LlwqvAFcEJv
         PNWdBqutwov3rZKF1vQ6gLIPup4fIPucVN1TTL+ZffnVFQh3DaYfb0QY9gPjNlXnS+ch
         CqGmxSpzBfMf1y+mv6S0L53eGPvZMap80u3P5idZUIA6N1KGW+y2KKzljverGqHqVQQZ
         PjXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Epvo5wYm+zeVxTVz8aEQhOjvw8UhIQfhH+DB/G3qjuc=;
        fh=zcQJd5vOVT1uxwELKJ4d0HuoRxtxff8KdIVIwW9jzZ4=;
        b=PAoLIYpvqRS2ny29t9pTy3DdC1hqe9KtYKchJFuYZx5n+IZvqlU+e2Vtq52F7ysjJS
         XKVoJp3GpjCpzmYf5r/a4lnKa26DvpRhFYXSkf3SuziYGhe6OBVvpQRurlaoCMm72ntd
         cJ+jDLCY6K4mnK1i1mGWXixPhyS93db8i4NvqYHiKBMFK5AQlbSyiUYb1j2yTsUz5z3E
         60MTctS3qtqtOHAxPnpI8CFWIZS6sUBIBepetzZxwpNATJS2OEkzfkdT6AhaurXe6dIk
         dQoe8JKdBMgyNGL3OP5L9CyDTdJUl7fMLxZ6/anFDfNhM2F4p2G4JIFRKjFp3BMS0TXS
         HvOg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772449177; x=1773053977; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Epvo5wYm+zeVxTVz8aEQhOjvw8UhIQfhH+DB/G3qjuc=;
        b=Zxtoyy6JwMN5kYDszE+N6pvLZvnY25i0Ly46fy/Hap5GsNmsIVLeSz8VjmrfLDPaLX
         QzeOzFZhrjGenyvgpbeXv8F2eyiilQBtdWIY7DRG0c7BI0D0b+Z57gh7tbGZC8hRAhu8
         H3PALdg37i4yUpjRh1OtE+kPNtFBXCYEuCWlFRqflIje2iVlGlvfBYomu6yGJlvzs3/N
         2jwPrhmRkQrdfnTtTVzBARR4Vx/F6ZQVuwFEYHYMlQ4bV0LVCL0/zNtjQ7RAji5EuX66
         ecqA24GWTUnzCOAQzLV3xVZJdg3MeATec5Y4b1XoXjQuKCOr13rYbAcQtADrCHj2Bb0Y
         ugTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772449177; x=1773053977;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Epvo5wYm+zeVxTVz8aEQhOjvw8UhIQfhH+DB/G3qjuc=;
        b=MngvzxQU9FA6RqfnB+L0UpB9YXWJTJobjxZ8ptTiQm6M2idJfdGNy9g19k768Hg8NK
         yPJeHqzwo0w/54XL4DFJysJ4C73UMKkho1Wc/TSQ5b4u1Tly7ABIPhPejn1uyxLXbBob
         C1DrzkjHYlY9WehGBDKT/JMdUIBWTr0qxemSrYFxfw7AesHw0toDWH4Uzu7xxiORNYx2
         OXRHVY7MX+zAMQmpWusrNFiiChdMbHeRLjro7aoaGOLH7/ZgeT058K9yodI0HkWrj+5E
         S05DcLngYi0E5MSRTSy/le7B1FoPzZAp5uwMNPw16RYYOIZ26IpkSFiPPIQnvWrW/aR4
         XDfg==
X-Forwarded-Encrypted: i=1; AJvYcCVJnguxQme5a+slFUW8QVsq2xQGetEdNd15nrtetDJzR7al+l2HQXWKmu4D0ZVxklcqzMCMrdOMWGnURw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxsFFlkIrMr3iwhKs3qxxDTggTnQ3CvpaubynyxfF32WQQm4BTZ
	i0+oOxT1alt3UNR/GQRbrYMewT9gIdjpnb5U+Vo3Fvx1JMzOzw+DaPT1X3gSvXNQmsVUgLS0HoH
	mSk1i6YJW5vPKZVzCx1bigKCvjMQiN4I=
X-Gm-Gg: ATEYQzxrOsoWnNIp25JENQaQTI1D5hQzroI94Q7TsFHFDl6vdWvjw3z+mvMRbBqQPm5
	24GAGB5balqzaBSTBxkMIEGvLutO5Sezli8lLzpFcOSeqpJ6OtY1NiVOvm++8yOlDMdFwpnL5f2
	kRc8F18hyWYgkQNI58PW4L0nOm1TzfD/cACHwVluhH02ivYIH27hPAKUJjW2OD5luhmgHWrHrqr
	FAxfpOV2ABUoungT9Wpe99/nbeQfm+lz7zBw7YjlBwxRPHzUvQR73PEQ8sC+7lTLUbQw/kp7Kgs
	D6b+1YZuwWA0T5SBXQe96NCiymtaZBfjN70Dsr3bEjpfv6xmDik225YM6+OxHAFilQgEC7L6qDc
	=
X-Received: by 2002:a05:6870:3234:b0:36e:8381:db00 with SMTP id
 586e51a60fabf-41626d6496dmr5836181fac.9.1772449176906; Mon, 02 Mar 2026
 02:59:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260302002729.19438-1-dakr@kernel.org> <CALbr=LYYUH_yQL1PO7mXzK6Oubt0LvKb0714iZCx_eEXScVdyQ@mail.gmail.com>
 <DGS7SQHM3V5U.2DNQV68AMSITF@kernel.org>
In-Reply-To: <DGS7SQHM3V5U.2DNQV68AMSITF@kernel.org>
From: Gui-Dong Han <hanguidong02@gmail.com>
Date: Mon, 2 Mar 2026 18:59:26 +0800
X-Gm-Features: AaiRm50vW8aIhDL5VGmJOu5lxfmc5lcpsegRPt5hsmjpSbqi9ltnncK92dntUuc
Message-ID: <CALbr=LYMgWXcj0QkQYv-68gX2mkzyKrE2BJFeXbnoVXKW=F85g@mail.gmail.com>
Subject: Re: [PATCH 0/3] driver core: generalize driver_override infrastructure
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, ysato@users.sourceforge.jp, 
	dalias@libc.org, glaubitz@physik.fu-berlin.de, abelvesa@kernel.org, 
	srini@kernel.org, s.nawrocki@samsung.com, nuno.sa@analog.com, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-hwmon@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-sh@vger.kernel.org, Wang Jiayue <akaieurus@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 2, 2026 at 6:12=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> w=
rote:
>
> On Mon Mar 2, 2026 at 10:41 AM CET, Gui-Dong Han wrote:
> >> Danilo Krummrich (3):
> >>   driver core: generalize driver_override in struct device
> >>   hwmon: axi-fan: don't use driver_override as IRQ name
> >>   driver core: platform: use generic driver_override infrastructure
> >
> > Hi Danilo,
> >
> > It looks like some usages of platform_device->driver_override were
> > missed. I found them here:
> > - drivers/bus/simple-pm-bus.c
> > - drivers/clk/imx/clk-scu.c
> > - drivers/slimbus/qcom-ngd-ctrl.c
> > - sound/soc/samsung/i2s.c
>
> They should all be covered by patch 3, no?

My apologies, I got a bit confused here.

>
> > The good news is these can be easily updated to use the new APIs. This
> > is required to avoid breaking the build, since the field is removed
> > from struct platform_device. The previous build likely passed because
> > these weren't enabled. I will use allyesconfig for testing going
> > forward.
> >
> > I scanned for similar cases and most fit the new APIs perfectly. One
> > exception is drivers/xen/xen-pciback/pci_stub.c. It does
> > strcmp(dev->driver_override, PCISTUB_DRIVER_NAME) instead of using
> > drv->name. We might want to change device_match_driver_override() to
> > take a const char * instead to handle this.
>
> xen_pcibk_pci_driver should use the exact same define, so we can just con=
vert
> this to:
>
> diff --git a/drivers/xen/xen-pciback/pci_stub.c b/drivers/xen/xen-pciback=
/pci_stub.c
> index e4b27aecbf0591..301207b4a30dac 100644
> --- a/drivers/xen/xen-pciback/pci_stub.c
> +++ b/drivers/xen/xen-pciback/pci_stub.c
> @@ -609,9 +609,9 @@ static int pcistub_probe(struct pci_dev *dev, const s=
truct pci_device_id *id)
>
>         match =3D pcistub_match(dev);
>
> -       if ((dev->driver_override &&
> -            !strcmp(dev->driver_override, PCISTUB_DRIVER_NAME)) ||
> -           match) {
> +       if (device_match_driver_override(&dev->dev,
> +                                        &xen_pcibk_pci_driver.driver) > =
0 ||
> +                                        match) {
>
>                 if (dev->hdr_type !=3D PCI_HEADER_TYPE_NORMAL
>                     && dev->hdr_type !=3D PCI_HEADER_TYPE_BRIDGE) {
>
> I.e. no separate API needed.

Thanks for the explanation, you are absolutely right.

>
> > Besides axi-fan, I didn't find any other drivers that need to read
> > driver_override. This is great, as it means we hopefully won't need to
> > expose a read API at all.
>
> Great, thanks for checking.
