Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32784356A24
	for <linux-hwmon@vger.kernel.org>; Fri,  3 Apr 2026 04:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775191563; cv=pass; b=J1bJzjmb3cWpwn2tu40kzskoSXTdPKs++xB59vCnpxWogWhBey/ZlBpbXLzjHQ6xCJoBRb0lxdKOFcmi4037b48lGIcy3VclpBQOFk50ELVyq/j/G21QVHkAUD59d4C9vS21bt/PorZJhZWHNX1SdOwsr9ajiwMCKR5E7W3qcC0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775191563; c=relaxed/simple;
	bh=groc3VAnH15CVUVhNhE5OtlEsDNXM/uA7VeW8vaOMTY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ACKaTnYAYBS/uu9YyUTU+ecdfLe7YBKDq3PjSyb2EROa0xzcLAq3phmJ13Nq6Pxux0f45eHXaOf3kHY3vG/nauUOxQ5vrO9PmQzMHvDfTPFboLV+v9GxpMopFBdHxozB+H5EvvWu/whn4l+13uYk2nLQeF7pB7ejVcEXaej8I5s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DidQGWOK; arc=pass smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DidQGWOK"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-79f855b2575so16104147b3.2
        for <linux-hwmon@vger.kernel.org>; Thu, 02 Apr 2026 21:46:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775191561; cv=none;
        d=google.com; s=arc-20240605;
        b=BjOfDo7tlOysZxXAJBZlpx4sCV+R+jeDTdVmtegAwI1leVhVnM9/SxQpUEg4/o7Yx0
         O2i4/B1OMlRndI8WI//SY8Ra+QMUmD4p/51VFA91Mizd2JrLxp5bO9gn81b7iMzWk5Fb
         nqCyo+tArBSvm05nfLZ9A3RuyCQUMPEnN4ypafZE9e44d0QoY3RZbabDge6lWuAhS+gn
         etVxT60eXSq7Mbrtdw2eAsmvvImuKJTOqtjtRet77yijYFVdw6gfIUen0oPZHybTKuv0
         jRRSYVMGc94wkmOVFb/X75JrG1HHL+Xa1spvgMz24WE9qwtSARxFI/x78QpxXRENTXjd
         PzTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=udWmikDfTPoYOznLAWVnBq6+fVtMa2LFJrslNkdcn48=;
        fh=Vn2QJ1QLYDeJ1r+tnhIpz0i5IKH4ZBsPd8m3AgbaZlY=;
        b=gJCKKEPvEWwX5jw712alfLDH8yVxSw48EJDAAFmial9lFz7vV7H0C5eNbCtoFMZyge
         TK8PFZXk0OuKMDzcq0xiE3ADlpmwHbS1/gbC9VlUoNSOEbPfywdJFpwYutnETw66CyBR
         dn58tyfelkhHQMWCAcsQXEwDP9QgFLbBxa+Z3yoQfMAlKYp3qBuvNuHFYFBgq5sWkWQo
         2kxYZZ7QUZugMBOE34VT2Npb3LNbSRBL6ILrNeR4SuvWAwY8IH9zp0W/wJ5jJnv9F43F
         POhJOVXZi7GXRWIDvgvyHmrurF+WJt9DMcj9nIyLdbIrmn+/HpbLxjzSq9ncMtwMnwGe
         bjXA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775191561; x=1775796361; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=udWmikDfTPoYOznLAWVnBq6+fVtMa2LFJrslNkdcn48=;
        b=DidQGWOKrm72zYGNfTnKQ9IcnJWZNioKN73o236MElVFzyQKQ8qb/l+soctZqFpFYR
         KhdKkKO4KWfPBZssLoFqJJaoQDXfr0ubxMRtcYnbkp4Aw6n+hEGhzMD/e6M1vs9Vctn7
         F7uzUA9y1Hc8Am0AiyTcsudzX2bQmqDVaIRAHRwR1H1Mdwqeulzb+nkNolrXNE6n+lnA
         5zZ6mhLg+931xo6+ZY56HBf57G3FpKAkbPbK1guAlEH/oool84UFse8KKG4/MulU3zjW
         kOZ0D+JZfXdmrH7t4ojZVoyu6NPL6R7//xVc/4ow33xoSCayriKVfXDNF+A2xeU4fM2L
         OvxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775191561; x=1775796361;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=udWmikDfTPoYOznLAWVnBq6+fVtMa2LFJrslNkdcn48=;
        b=XxJhNpwlBly7Uq1JsA1GxOmAWM70AGjZy/zxjkimOJRTgRUn5Cix/FePzEY3VKaTEa
         ab2026eW+uco6t9qL+n6VO8Ht9ZwmN7b7e86r0AEnZUyZoiOj99lqOZsEZUmwXScEUzD
         rnw9Tligy5UhBdQD3Objbvlt/lihNg02Aj1V2Onq8gN95aYsUM451lA/RCQ9CmK028uq
         dcmK821G2TrOy+2vjMol6w5LQEUWe0sTWzDgdhGhjVI1EPFeByIYP/r3ypankjzrDOEK
         rObRC5p5U8g3HyEaaz2oV9k/RHOuUxjg5j3rsitsSgryikOYM71ts0f5R4CzyXPTC1v+
         m0iA==
X-Forwarded-Encrypted: i=1; AJvYcCWmNZs4O5BHWtPqFW16dZzkCKzjNrJ/vvpCH5pzyzhagCWIVKb4YK/r3aBRAhQhX6ImmAR2eKpyKrHd4Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YysPZajnYyl1tTUbt1UYpuhGm3yRqNfUABcSr0duDfus/mkHaLv
	Qm1JMbwOBKh2DHoe7Gm3BBQC9MgbK9OKm2RTBdd8LgOEa/RUoxSLGrHOZjYB02Ul+LFhYueDq6v
	0o+3iP8y+oTFMDdecYybjXefTXv9mKfk=
X-Gm-Gg: AeBDievSNde+qOIzsknCLl2hXh6qahWUi+xNnFdnTqgKu4dX4XbBQ4pd/WVcrB2tjvF
	9/+amZx8VBVsFq4jC86AQkS0lzb37dzwihTMNZGmN0Q+3IkJKUHoMF4CFTIJG/Dc0dW6lxcecA9
	Sq74fevmkO3cCKMXqB0FVHc0SOtBa8dvx/HVFr7J4B5X2o2JfP74/htlYU/2tEVj8eI6wIkQE5/
	nGI3oJvKtZkLq5Pl3cvF4TTndTsvI9TjokkM0dXJ+Hbm1M/RRcPB1FhWvcGHnrQ0zXJGVSOmly9
	U5Hc6w==
X-Received: by 2002:a05:690c:6987:b0:799:198d:8c5a with SMTP id
 00721157ae682-7a4d585f69dmr19958067b3.34.1775191561252; Thu, 02 Apr 2026
 21:46:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260402051442.1426672-1-a0282524688@gmail.com>
 <20260402051442.1426672-3-a0282524688@gmail.com> <20260402-warping-chameleon-of-prowess-9df780-mkl@pengutronix.de>
In-Reply-To: <20260402-warping-chameleon-of-prowess-9df780-mkl@pengutronix.de>
From: Ming Yu <a0282524688@gmail.com>
Date: Fri, 3 Apr 2026 12:46:22 +0800
X-Gm-Features: AQROBzC_c6Pz91vTEwJZ5AXR_5dXzfojiP7V5Wmo6LnqG_6F9RBzJL09w08myjU
Message-ID: <CAOoeyxVp2dY=XrujkCbWHjX4bVu4-H2=k0JHxL6akC6KwY+rVA@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] mfd: Add Host Interface (HIF) support for Nuvoton NCT6694
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: tmyu0@nuvoton.com, linusw@kernel.org, brgl@kernel.org, linux@roeck-us.net, 
	andi.shyti@kernel.org, lee@kernel.org, mailhol@kernel.org, 
	alexandre.belloni@bootlin.com, wim@linux-watchdog.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Marc,

Thanks for the review.

Marc Kleine-Budde <mkl@pengutronix.de> =E6=96=BC 2026=E5=B9=B44=E6=9C=882=
=E6=97=A5=E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=887:05=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> > +struct nct6694_sio_data {
> > +     enum nct6694_chips chip;
> > +     int sioreg;     /* Super-I/O index port */
> > +
> > +     /* Super-I/O access functions */
> > +     int (*sio_enter)(struct nct6694_sio_data *sio_data);
> > +     void (*sio_exit)(struct nct6694_sio_data *sio_data);
> > +     void (*sio_select)(struct nct6694_sio_data *sio_data, int ld);
> > +     int (*sio_inb)(struct nct6694_sio_data *sio_data, int reg);
> > +     int (*sio_inw)(struct nct6694_sio_data *sio_data, int reg);
> > +     void (*sio_outb)(struct nct6694_sio_data *sio_data, int reg, int =
val);
>
> The signatures of the function look a bit strange. I expect functions
> reading/writing bytes use u8 not int, register offsets should probably
> be an unsigned int.
>
> Why do you have pointers to the access functions? Why not use them
> directly?
>

These helpers were originally meant to be used by sub-drivers for SIO
access, but the implementation later converged so that all SIO access
is done in the MFD driver itself. In the next version, I will remove
the function pointers and simplify the interface accordingly.

I will also adjust the types as suggested.


Regards,
Ming
