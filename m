Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.208.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795073160;
	b=FMrwRAe2splN8jVCbiOhjh28ti9GL4WBRS9nWefstFTJiaSitwnjJXsCixN1FIH4oDbS
	 TNYY0UhhzFSpBqyVoBmvI0KzwbTtwJ6HoNn+1Ncs465uLa/aCMd+PtAKBMxA+5o0ocxD9
	 XfPVO9IWSK3UdpEPdePlx4pa2svy8z2N6ImGsfXI+KKK3RoHScgHqdoXi0NFdgcSwoTY9
	 1kFyfC3k4vM9ryyGFrVVa0Po2V1Gtl5J+qODJk5uyc30xHqYhjY4r69yABlnu3llLryk3
	 u+8eYbfBtB5yZtNqEUXHqYuBa09moaOLc/hUF3vvgnOl8rl7v9mMVXHm+YMr01hYfMQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795073160;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=qtvNyz6XUexBqsbLRSTVvrIS5GBWPv/KdEeKLuhwT7Y=;
	b=x6YM9IoyaQLGD9kq4L2ZxprJkp0ApUTYDA2an0VbDuU8MrQYvjVoFPE1rPbTO8TV3w1k
	 gEyUV57lgksAneWnp6UlB2ta92l/gK8BeSGcMWlA7KrSNCQqBJbYcEVoQzmmGiaq9xNGF
	 OIPK03mQhPf4qSBeyMgC7iLYHrKxDtnWu9Vf0Xd03f2GHNcG5w2T+4BjOYuvV9vO7lk9h
	 4OKqzPLCqiWSlbqBAv20yyij+ZJ32/IFa371rKoQRU38clqhB7+jI5xVk0EbwXp4/d0Wd
	 NgRq0VDnbQhl4fm9LkosFcf2bNVN10IgNAd8iA7N9c8vZSb3zSANztcWpRQBrWDVK0A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HC8Id32C;
	arc=fail smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 713EF606A324
	for <linux-hwmon@vger.kernel.org>; Thu, 19 Nov 2026 07:26:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 713EF606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HC8Id32C
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b4bd3d98bfso2472920a12.1
        for <linux-hwmon@vger.kernel.org>; Wed, 18 Nov 2026 23:26:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795073159; cv=none;
        d=google.com; s=arc-20260327;
        b=dBB2dUQAzD0nFiDCjr65P6rTOYxXmvYK5SCzNILa0zYiE6aIoyRmgDByKzvckNSfu9
         gJfesnSyJy+SMy0viRSKI+nIEtSeCmyHute4HMFF3zmcGN/I7svgBvmhUcWVt2fEAqug
         vh5RaOZ7AEIzXGPzJyLtT93MNdm4iRotynwRI59Mn8G5/XW45dHN8ln1L39PzNdSsfI0
         cRp1eXaUhhkTrfRLjQ9CYm+9YEArmauxojmKcu92O36tiiAsCTb4l4g79ObvFyCMMNa2
         0rzUhAJtWGcpxCRi5vFSesKyRbwCRPOmMhxM0crjwJ+CSIalLgavkmZWtN5y3N3fRHE/
         jJNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qtvNyz6XUexBqsbLRSTVvrIS5GBWPv/KdEeKLuhwT7Y=;
        fh=FfYkPgJZQ+xDgy1DbfclzrDoJSmhoo8YRq7JCrjV8ks=;
        b=pkzkAnzfkbcegH1QXXm/VOfw3TR/OGiiWsrnknXb6+Af4z+Q1x2ye5Aji6OEagZ/Sm
         kSPMm9VAEbVee6WiXa7PtGyssd+762mJs1zHTzZ0U5BRBvm0LmRm+gOTt8bwpDV+H1Tj
         2b4VzQZVNdtELhTlxc4YjbA8dZ4wMiF+grteu1W/ICO4eSaG6CGfcaAU30fXtrcL4Rfu
         cL0tl2Wh4av6pEjhlpqYlhZZ/pY91Laz3nTcKHWlpS0EZrt8bz1EnB0RD6JgixttNWxb
         QqRjbiasqZCw8taX+OWtipCdxZB6E5KxQFA08jDyAiNVgIVUEQ/0wiZYAqaQu7nV+TNU
         aaTg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795073159; x=1795677959; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qtvNyz6XUexBqsbLRSTVvrIS5GBWPv/KdEeKLuhwT7Y=;
        b=HC8Id32C7RWMZBoXz82YJl81D1EqvihefSHlq5h8EUvLSFNV9QpAdr3ptsjLkhST3j
         zfeLncnprzaUqqgGCoJpffiGs1ll7ni4xogqY0TsPwmm0Iup0b0FIc/aDmk8ow4x7R8X
         NkEozZ084pCEcLtx8z3iF/CHKNhBmGYUkZTvTGRge93vS+FXkrk3854Fl+zvjjuBe84q
         pP2RWLoRXjx82FqmnOZ51tgibYjy1PqAQU3Fpw1C0PQ+zmOZ6TLMRnoy1iZL25Jq0hxI
         6RgD/BUnuFcHkkck/TOxfpseKYnGcK6NEFHAQ45r6dKn8UZwicceVJgsfhzDZZyn1jHP
         YPkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795073159; x=1795677959;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qtvNyz6XUexBqsbLRSTVvrIS5GBWPv/KdEeKLuhwT7Y=;
        b=geijZZ+EYIcnoRHNiIW59pYEqGuhbi2B/Ez8rWEcG92+zyNxRxJ0t9IvXOzel4D7+F
         WbL9EaYWCcnh2ucr1ELkUrLaPWkuK3uFKuiHRIvs2RSQ+JpntNyweLVy9UeuLBY/eSyy
         9GUmzUf05TbWx25E2Aryy4hyb/L2cug5DHrG2dLvPdI5+atGF8AtKbavlHGSuFxqEnoo
         8WmoGCGu3uQs7nLQyFx5o6dXdPCldUYQnwZlJ+JmenilQ4lzlC5B0CpPwUrKY3SRuuGu
         QCIuTHdP4e8PXK8vv+OSRyhJ0nBP4ugQFwv0RdTxxDYDbK4hpvgCTt7bhL6rx8hM2aYR
         Wq7Q==
X-Forwarded-Encrypted: i=1; AL+hErH3ul36VcP8UsOw2TPrJ2wz+lXGZ+SiE5kEizqMl+Mv1Yg2Ar7iQxfwZtLbZlbOmmwngvLZDzyjb9WR4A==@vger.kernel.org
X-Gm-Message-State: APuU4Z8s9HpGa/TV1dh6zZ2ubhZqdBTqvfTLr7HxBr3j0rxGXtdSOs5r
	4UeqlehCUCt7B1JVFMfOS+Zu2wrWvr3ywLbFMoyCmHJcWZf0wKV2i/cIZwSjAKLq6dflmkTLZ8S
	sK9jVv7aVmsZLcF9s+vmYJtGeXpWRAWw=
X-Gm-Gg: AYBFou3Cdo4XSpvdmXJ9u9MgWL7EL9UT4qPMx0Ez+EKAqKB6u2ZT/Mri09nr0iqaTTS
	K4esinBqx5QhiSyvqHm6XSYQ6c+9K/CyJOUuetxG5v1Yi9dY8y7HEpgCxX5aBkZY5e+Rnmzm2+n
	b3uKHoNNIZ15ngmubAFdb5Vyhq7A4hruaTfUFkh9y4UZcPhtK81/kuOO3IzSDQ/4ssIkHzRv2X/
	JmG0kJO6WYTMrA6NWLzFUwqXgBeNtFSFt63Xz0cVbafFBM0mgMkT/blezGfol5fdSzIIav0PHaV
	ZRFJlrHBgvJi7RgeFscRpTD6sP9sfiP2aor0oMBwXZ6C0OrOCU0OaEXErU4iYK0n6vKJI9dTYX2
	ehHBINtxvLJKJg3tYby8CELNXqeNklQr7vQPMgA/vXwknJjWBAThQ2lX77Iq+fzgvesFRAa8FuP
	Ka6uFSjbk9A4qrbEQx2BIw4ooWLGuqFnDSlc/MDcPK91qf
X-Received: by 2002:a05:6402:2350:b0:6ba:137c:70f9 with SMTP id
 4fb4d7f45d1cf-6ba137c7371mr579765a12.13.1795073158722; Wed, 18 Nov 2026
 23:25:58 -0800 (PST)
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118-marvel-env-v4-0-200317e496c2@gmail.com>
 <20261118-marvel-env-v4-6-200317e496c2@gmail.com> <c212df8a-6ff7-4a4f-a90e-7bb6c073f617@roeck-us.net>
In-Reply-To: <c212df8a-6ff7-4a4f-a90e-7bb6c073f617@roeck-us.net>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Thu, 19 Nov 2026 08:25:47 +0100
X-Gm-Features: AclHuK8PPneiYACCRObBpglxAjEW3linYDQRjYYK3WkE2RlBOYGn_Zv-GNu7UxI
Message-ID: <CA+=Fv5TteAQNLesw83Z+p8GFYiM+Bs_JYdVJyp9bGPEP8s+w7Q@mail.gmail.com>
Subject: Re: [PATCH v4 6/7] hwmon: Add driver for Marvel AlphaServer
 environmental sensors
To: Guenter Roeck <linux@roeck-us.net>
Cc: Matt Turner <mattst88@gmail.com>, Richard Henderson <richard.henderson@linaro.org>, 
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Guenter,

On Thu, Nov 19, 2026 at 5:17=E2=80=AFAM Guenter Roeck <linux@roeck-us.net> =
wrote:
>
> On 11/18/26 16:09, Matt Turner wrote:
> > The management firmware of the Marvel (EV7) AlphaServers, the GS1280,
> > ES80 and ES47, monitors temperatures, fans, voltages and power supplies=
.
> > The SRM console describes each sensor as a packet in a power and
> > environment node of its config tree (GCT), and fills in the readings
> > when asked to refresh the node. The packet layout was taken from Tru64
> > UNIX.
> >
> > The firmware gives each temperature, fan and voltage sensor a warning
> > limit and a failure limit, and reports the sensor in the warning or
> > failure state once its reading reaches one. Neither state means that th=
e
> > sensor is broken: a temperature past its failure limit is too high, not
> > faulty. Power supplies are either working or failed, with the cause
> > (AC, POK, overtemperature, fan) logged by the firmware.
> >
> > Export the sensors through hwmon. A temperature's warning and failure
> > limits become max and crit, with max_alarm set in either state and
> > crit_alarm in the failure state. A fan's warning limit becomes min, wit=
h
> > min_alarm set in either state and fault in the failure state, which is
> > when the firmware counts the fan as failed. A voltage exports its
> > reading, with min_alarm or max_alarm set in either state and lcrit_alar=
m
> > or crit_alarm in the failure state, depending on which side of its
> > nominal voltage it reads. The console gives the nominal voltage and onl=
y
> > one other limit, so the voltage limits are not exported. A power supply
> > is a voltage channel with only a fault attribute.
> >
> > A refresh keeps the boot CPU in the console with interrupts disabled fo=
r
> > up to 300 ms per node, so refresh a node at most once every 10 seconds.
> > The hwmon core serializes the callbacks, which also
> > serializes the refreshes.
> >
> > The console callback lives in core_marvel.o, which generic kernels
> > built with ALPHA_LEGACY_START_ADDRESS leave out.
> >
> > Signed-off-by: Matt Turner <mattst88@gmail.com>
>
> Acked-by: Guenter Roeck <linux@roeck-us.net>
>
> I assume thqat the series will be applied through an Alpha tree.
> Please let me know if I should apply this and the next patch
> through the hwmon-next tree.
>
> Thanks,
> Guenter
>

Yes, I plan to take the whole series through the Alpha tree.

Thanks a lot for your review and feedback, and for the ack.

Magnus
