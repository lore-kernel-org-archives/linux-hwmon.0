Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD0ECA59;
	Mon, 28 Oct 2024 10:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730110735; cv=none; b=sPm+rvPkJEhkm1TiP4KCrDPNb11w49qnpZRg1SxHqxf3VMjY9UzfPMv/MQAMQN3b0gphdSnBlI7twaHZsYquDHTaeOK3vEkmdkA9iDdJr+iJPMQOTmuNHWo2H1H4Qqp+UilaK7ICWRqqslptfShoXEfkdjvWOeQNrnIHI3dgA80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730110735; c=relaxed/simple;
	bh=CvcmwJx68ibSr1FgYSs0BYn4vbK2dH2bI1Id4paFMiQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y8W2zKJGcPeHtmRGjrbeW7+VrEx2XhfgeAu4lF+p9KB4BnKXHQ3BDaFtGPzgQTznmctz8Nr2t9TkebjGalPm0rkKC6IaV7QjJJKHbYFWLRlhIRL4bbj7S1uLeUXOM1cuV7lREF0eZ9gpjZ9fhfNVQuiMvDKbeVhmwyLPwNYZxT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6e3cdbc25a0so43690717b3.2;
        Mon, 28 Oct 2024 03:18:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730110732; x=1730715532;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3p3W4EQbrJIJC/nea0IOGVy7gYy/irssqjHdBTm9iqU=;
        b=os25eig5cyD3qUrFsqZdIfrjq+tkcftU2Q15ieWOJlj2xX0Lxvg2MCxfb5UdTUYudh
         4gKz2v0pG4NTF6V5CTzW7zfFVHNb+ugDs7PQFogvtzW/4rJsENCFh6E98/VkKZSq67db
         TDNa8kM3YxQBRjicmVLgkTpVU6ro8d+l7x3EIAPBFQJHJg2xgQUDTF2X+W68OX3Gzhxc
         cgKb1pBhCQpR4iRswJAfp2mzToRh4DErdiU5W1PzamrnKbbvnNc/sDLvSACm530MweAf
         dFqpRldFJRX4QwE/htSQh58UrAJJXoY5ZAlMyZ4fWgjIjK7LZAOn08O08GXgsPDA0F1P
         Agdw==
X-Forwarded-Encrypted: i=1; AJvYcCVHkosU+dzMcnvsWPDy4/r3taQjaBUIrbW4BFkTgl8akTI+fgMo/mtJv3ikqNXDcckyqfuGTsCzMipJ@vger.kernel.org, AJvYcCVKUwU7ckhtoS/V3+OhjT3qUlfhQXlZJNOP9sZwQKvWGTIGMuKQPj2fmt/JatGGoeBHKhxd6qqoTNj/1U4=@vger.kernel.org, AJvYcCVSd3T+HgxXo4kfoNAFG0FQXuVOPTS3L5TMzEqWxquA6pf+wikQ0EEnlWvgRP5Jm9QiqPiH8tUGzop3@vger.kernel.org
X-Gm-Message-State: AOJu0YxKTvY/Cz7j1dl3t5d+zFRXfTaEOZrtgIR1dEmEkR8qeikZ3A8Y
	ddAXWDbqWjAzr3ziZaL3Y3T+m9pf+o60RWU1OMfsVrOb0BE2IyzDS8CWoz/B
X-Google-Smtp-Source: AGHT+IHRQoFMZd7V8eMC6qtdDgsQ8w4+UFvpb2pTlzvSiEyPWT27T6iQbZxxk4VRPGNJ0+IbuFOszg==
X-Received: by 2002:a05:690c:87:b0:6c3:7d68:b400 with SMTP id 00721157ae682-6e9d892546dmr60202167b3.10.1730110732434;
        Mon, 28 Oct 2024 03:18:52 -0700 (PDT)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e9c6bafebbsm13456837b3.15.2024.10.28.03.18.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Oct 2024 03:18:52 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6e3b7b3e9acso37026847b3.1;
        Mon, 28 Oct 2024 03:18:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUCWYUN0AGOXcPfe8BPOahj1WLkIFaH6EirnxJdP18HnETCfM9xq80jn97u8Dsb/Noj5Ih2Zwh8ffNV@vger.kernel.org, AJvYcCVRLfUN/Bh+4CONzJWe02yuIn6px8Mse20wbxdCZEJ3BN0ryoVuTE4ThqD3pKkpaGCd1dg0cFEZwtMr@vger.kernel.org, AJvYcCXA1dZYkZfTzExgzG8eUzlTVHkHqvDQ0GCWw1awjBlIH+8rWu9GG+BTkoRJLlXbPIA4z81UWcB9Wnhn2MQ=@vger.kernel.org
X-Received: by 2002:a05:690c:2508:b0:6e3:153a:ff62 with SMTP id
 00721157ae682-6e9d897c8damr57542137b3.23.1730110731964; Mon, 28 Oct 2024
 03:18:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1729874904.git.grantpeltier93@gmail.com>
In-Reply-To: <cover.1729874904.git.grantpeltier93@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 28 Oct 2024 11:18:39 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWHZR9pN3h=Jdsqs5Qb0mi_4CobBtu82PRgzrm5TRgE4A@mail.gmail.com>
Message-ID: <CAMuHMdWHZR9pN3h=Jdsqs5Qb0mi_4CobBtu82PRgzrm5TRgE4A@mail.gmail.com>
Subject: Re: [PATCH v5 0/2] dt-bindings: hwmon: pmbus: add bindings for isl68137
To: Grant Peltier <grantpeltier93@gmail.com>
Cc: robh@kernel.org, linux@roeck-us.net, magnus.damm@gmail.com, 
	grant.peltier.jg@renesas.com, brandon.howell.jg@renesas.com, 
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Grant,

On Fri, Oct 25, 2024 at 7:16=E2=80=AFPM Grant Peltier <grantpeltier93@gmail=
.com> wrote:
> Renesas digital multiphase voltage regulators are capable of regulating
> output voltages that exceed the range that their Vsense pins can detect.
> In such applications, users may place a voltage divider between Vout and
> the Vsense pin for a given rail. However, the driver currently has no
> way of knowing if a voltage divider is being used which results in
> erroneous telemetry being reported over hwmon.
>
> This patch set defines a devicetree bindings schema for Renesas digital
> multiphase voltage regulators that are supported by the isl68137 driver
> to allow users to add voltage divider definitions for any rail powered
> by the device. This patch set also includes the required changes to the
> isl68137 driver to enable scaling Vout/Pout telemetry for rails with a
> defined voltage divider.
>
> v5:
> - Fix clang compilation errors related to C23 syntax

Thanks for the update!

> v4:
> - Revert devicetree property name to "vout-voltage-divider" and refactor
>   property description and driver implementation to match existing
>   vout-voltage-divider implementation in max20730 as no suitable generic
>   voltage divider schema exists.

Can you please elaborate (or point to the email that did so, in case
I missed it)?

In reply to v2, G=C3=BCnter wrote:

   "I would prefer, in the order of preference,

    1) an applicable generic property definition
    2) a definition that is already used elsewhere
    3) a new chips specific definition"

https://lore.kernel.org/all/3f460b62-4cd1-49dd-a98b-1fbcfdbd3af0@roeck-us.n=
et

Thanks!

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
