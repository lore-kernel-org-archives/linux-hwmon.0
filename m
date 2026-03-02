Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB935332917
	for <linux-hwmon@vger.kernel.org>; Mon,  2 Mar 2026 10:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772447931; cv=none; b=u9O9ZaOAETf2fICi1dXOA+W0Am17NL2I1Pq+d3ga1uSFYBP0RDFLu9Lzujf0EmRYndjX24A+l4w/ohHN5oMt1K9hFc86QLldBrzC3ad+EiHUb3zogW+2uURfjqZLanKl7jJINqhE1eysgh2jU3g83t5QWSgrvIul6zr4QYPdmFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772447931; c=relaxed/simple;
	bh=PO0TbLRbiVrKvdhPwH7RKWikT/wKrrUI+0ibUOovsCk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uWG0HArWsWO4NKbTQY7EfeLVW/ENH2P7rLouYpapYY6bWCK8UYHDpcbZa6fQOFtqhpC0rshuKenplmnSqUZDXIxDvujFcOCfb6tkzGEeCTF/xwkmUu2B7BJTlXm1/nxrX4z23Fk+8Y1D6yhTZinF1tYFiO1qMqYEsCFhYaYGgMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5688b9e4e80so4742585e0c.1
        for <linux-hwmon@vger.kernel.org>; Mon, 02 Mar 2026 02:38:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772447929; x=1773052729;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bl7RAWu6mKzowPFnldQghONe5pbsD04RWaX4BUYhOlo=;
        b=F4IjhPsY+m/TJQ5abbr9RwHungJI/SCYJe9DspBMtw41H4Y3ya6ehZzzi62tVbKqrQ
         JnxRBks/JVqWdywGAEgqLcWYxKqIKCoEeDv77sVw/Q5HtNfxqnLBdrSwuangWj12aLjO
         MqLPAVkLTVBm5IPAm4wWw+CSoNeTYw5Ov9ARyVtTTGGWGjmnBoeTlrwvoTWCDtBOua1h
         IPIZeuMr2U5Nro08TuLtS8CO0a0uWtm+uBQHyKZeRetKG+U4Yh0q0NtNcbNm9ijn6IMR
         x3cA300LQSG037rp5W1RTpdqEW80s+j+VDU0BNAtLDQb7d4DfdbO4ZNHRpkIZ4yooZwX
         HE2Q==
X-Forwarded-Encrypted: i=1; AJvYcCW3GkREQQXY4U2cC9wh2Bd6TqEmYPsHH7bc+iWOGyxZ5VV24F4XI8sRkbYw4OxUudiKYWgJLwec8z+1hA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwzK3MB06oQk7DcuQCjm63kC2tXmvboa081A6fBevrKFtuY5sgH
	FXoPIIk6UrqdmOXPEfhWfoG4qVJxGp96Ip7RhzQQ6WMP1tOLdUcv1uXYTHwPZQKX
X-Gm-Gg: ATEYQzyPWQXtfRISThB5IPn3UYj0x+H9GKYlkq99cX+odYSt83zlvnKnvqLlmd7EAE4
	thhnZz6LWJbZVScAZM/+MOhFqzkx2Ydb9sw0VHxnAx2wXr8DrahOAcJ1AOsAQjEKTKayi2PPgvg
	kZXTUAXK/l3yZylpVBPduBp+3d1WiFcp5cmf4sH1M7aVizgJ20SqyRPuP75KDaghx+4miMCSFX8
	yqtBZqZ303g/TbEBnz1GiqLNugbIPE7exOAobo5KWiPOG9LDSbHJnbf7U+GtcDU67BVMU5o9riB
	m+WL5SOdDhgX4Mc9iQ5SbqFK7gayBAcPrzxDpSf9u/DMhLVX6GF+FnaCdI/eY1klTamXYFdcQ9p
	NLWJ2TNsX4KGBdjgmcAWmH1S7ghCBaROq6vtabI3gLbtokTw10jywJrQhSDYseKHWd9/Dju4oz3
	/PdJHK5CEcvE+cEB+qwQtbO5F19eCrHYN0MbVLIEUChlZs29HPNFzODSoL3g9G
X-Received: by 2002:a05:6122:4d13:b0:55c:be5e:e9e9 with SMTP id 71dfb90a1353d-56aa0e7b0demr5297916e0c.1.1772447928944;
        Mon, 02 Mar 2026 02:38:48 -0800 (PST)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56a91bb97absm14826254e0c.6.2026.03.02.02.38.47
        for <linux-hwmon@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 02:38:47 -0800 (PST)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-94dd05a4b44so2636336241.1
        for <linux-hwmon@vger.kernel.org>; Mon, 02 Mar 2026 02:38:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXkCZuD90lAuzxIo3DTPFdy9VXt0cALAdhS2srTUpcqivifeUpO50rkx5JBxKf2GmpOX6u8u/TlKt3vRg==@vger.kernel.org
X-Received: by 2002:a05:6102:440e:b0:5ef:b32c:dff8 with SMTP id
 ada2fe7eead31-5ff1cda8e40mr7754538137.5.1772447927548; Mon, 02 Mar 2026
 02:38:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260302002729.19438-1-dakr@kernel.org> <20260302002729.19438-2-dakr@kernel.org>
 <CAMuHMdUi3uNoDJ67WkNSKn=BD1F7D1Ot=gz4TwFPvaaYmKaNcg@mail.gmail.com> <DGS82WWLXPJ0.2EH4VJSF30UR5@kernel.org>
In-Reply-To: <DGS82WWLXPJ0.2EH4VJSF30UR5@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 2 Mar 2026 11:38:36 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVe7Z3k1sz2dEYqfpp7uqdYjrqL-gRbUE7CPBpOA+-RfA@mail.gmail.com>
X-Gm-Features: AaiRm52rSumTG3nFZ9P6FzWdxvQ0hMzWVlbis5lyqzx4MgKVwMUrLmFH3gE-zLg
Message-ID: <CAMuHMdVe7Z3k1sz2dEYqfpp7uqdYjrqL-gRbUE7CPBpOA+-RfA@mail.gmail.com>
Subject: Re: [PATCH 1/3] driver core: generalize driver_override in struct device
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, hanguidong02@gmail.com, 
	ysato@users.sourceforge.jp, dalias@libc.org, glaubitz@physik.fu-berlin.de, 
	abelvesa@kernel.org, srini@kernel.org, s.nawrocki@samsung.com, 
	nuno.sa@analog.com, driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-hwmon@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-sh@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Danilo,

On Mon, 2 Mar 2026 at 11:26, Danilo Krummrich <dakr@kernel.org> wrote:
> On Mon Mar 2, 2026 at 11:00 AM CET, Geert Uytterhoeven wrote:
> >> --- a/drivers/base/dd.c
> >> +++ b/drivers/base/dd.c
> >> @@ -381,6 +381,66 @@ static void __exit deferred_probe_exit(void)
> >>  }
> >>  __exitcall(deferred_probe_exit);
> >>
> >> +int __device_set_driver_override(struct device *dev, const char *s, size_t len)
> >> +{
> >> +       const char *new, *old;
> >> +       char *cp;
> >> +
> >> +       if (!s)
> >> +               return -EINVAL;
> >> +
> >> +       /*
> >> +        * The stored value will be used in sysfs show callback (sysfs_emit()),
> >> +        * which has a length limit of PAGE_SIZE and adds a trailing newline.
> >> +        * Thus we can store one character less to avoid truncation during sysfs
> >> +        * show.
> >> +        */
> >> +       if (len >= (PAGE_SIZE - 1))
> >> +               return -EINVAL;
> >> +
> >> +       /*
> >> +        * Compute the real length of the string in case userspace sends us a
> >> +        * bunch of \0 characters like python likes to do.
> >> +        */
> >> +       len = strlen(s);
> >> +
> >
> > The newline case below is is basically the same case as the empty
> > string.  Hence if you would move the newline check here:
> >
> >     if (len) {
> >             cp = strnchr(s, len, '\n');
> >             if (cp)
> >                     len = cp - s;
> >     }
> >
> > then the "cp != s" check below is no longer needed.
> >
> >> +       if (!len) {
> >> +               /* Empty string passed - clear override */
> >> +               spin_lock(&dev->driver_override.lock);
> >> +               old = dev->driver_override.name;
> >> +               dev->driver_override.name = NULL;
> >> +               spin_unlock(&dev->driver_override.lock);
> >> +               kfree(old);
> >> +
> >> +               return 0;
> >> +       }
> >
> > Also, this block can be eliminated completely...
> >
> >> +
> >> +       cp = strnchr(s, len, '\n');
> >> +       if (cp)
> >> +               len = cp - s;
> >> +
> >> +       new = kstrndup(s, len, GFP_KERNEL);
> >> +       if (!new)
> >> +               return -ENOMEM;
> >
> > ... by pre-initializing new to NULL, and making the allocation of new
> > conditional on len being non-zero.
> >
> >> +
> >> +       spin_lock(&dev->driver_override.lock);
> >> +       old = dev->driver_override.name;
> >> +       if (cp != s) {
> >> +               dev->driver_override.name = new;
> >> +               spin_unlock(&dev->driver_override.lock);
> >> +       } else {
> >> +               /* "\n" passed - clear override */
> >> +               dev->driver_override.name = NULL;
> >> +               spin_unlock(&dev->driver_override.lock);
> >> +
> >> +               kfree(new);
> >> +       }
> >> +       kfree(old);
> >> +
> >> +       return 0;
> >> +}
> >> +EXPORT_SYMBOL_GPL(__device_set_driver_override);
>
> This is essentially a copy of driver_set_override(). Except for the required
> minor changes I intentionally kept it "as is" as it will go through -fixes and
> we know it works properly.

So I will have two to fix? ;-)

> Do you mind sending a follow-up patch with your suggested improvements?

Adding it to my TODO list, if this patch makes it as-is.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
