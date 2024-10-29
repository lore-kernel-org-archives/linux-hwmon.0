Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F4F8198831;
	Tue, 29 Oct 2024 16:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730219580; cv=none; b=YJXsocGETgaPCfx1VUs7sC6IF6zZIT7vRA1aen0tzwkc3IplGvvx6USQE2OlQWx++3fBLYx1D4vE08l6EbvFslyq4aI6lQRyCV0K7nhhX4fJk4YGqQvKkEq/CAkSb4YNmwp4ERpotJ24BDOaee3kM6iQ1ga5rBQfi1tBwsBAekc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730219580; c=relaxed/simple;
	bh=gZzvj1L1Uurkf/PTmqTauqG1geMqfWBB82+zNmPrqjk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qSpiGU4VgY9yTAuGZgNCcu5qXVLN7xF+R019KFrsmvOSEEmX8VsN3sOLjydnZ369rqSRtvfZdowvnGp7rV1lbg0yiMFU1Ex3bE3cggMw/hkHEJHhtSpwc9bf5VjZXE4OrsmNykg/AeFZ3cIYBpSncYp8P6dlp5FAK0yRhdO1xNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A2kyqAII; arc=none smtp.client-ip=209.85.161.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A2kyqAII"
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-5ebc1af8e91so2847529eaf.1;
        Tue, 29 Oct 2024 09:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730219577; x=1730824377; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=S/lGGqEKgUEddXZiGrZ4jfunD0Qbhe5FARK/pNKY1l4=;
        b=A2kyqAIInAg0La0SdCgbfJykVC5hqzDq+HfLIExp8u5YAyEglMVQEAFyRRB5oZSTlF
         wa7eh+nylJph/saC8YUmj1eJu871IcuqM7Bb0h4foKIjDCdVU9vre0dEtixdFCoofVc/
         xEfD/wGCPaAkcJcL+f/WXicQ3Jo51QrsKc6PlYhbKnuDnEeIdWcSdTqb2jbGS+iB80Ea
         xpn3h3MYoj23Fw0rDiOon+4ysfvo1VqNuesQMbBpuC4WqaNhkwOFmJrsivzJF0LHSHjf
         NvkeXX85+ty7PIjnmXU89RbxbyHeEec+cJmP8WQzNKn4ymiw/clrE3X9aVKvexoDrxsu
         5VAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730219577; x=1730824377;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S/lGGqEKgUEddXZiGrZ4jfunD0Qbhe5FARK/pNKY1l4=;
        b=maHSP5tdFp5M6LtosnIf48P0K62fERkgHvK2D+iXoBGoyjIb3HSWIyyWB4PBhXN5q4
         l+a0GhWNEvzroguGihi9mvKC8JJiWSHkZhHCbmq9x4rT/7ej/pRmdrqGBt/WfgbqT5S5
         RYAMJaIlFj0aKGNN4Jpg/IvW2GcNbnu+DXHLEJY+g8lDmRmSMo/UATQMnXuyeM7Rt3ay
         YCaaPFikhqsR6+BW9JgqbcU3aBF2NFrFfA0JXFqwjGImcEhXolg46kU6Fawzpsna92Bp
         jERpbBaX9LUnluS+5ZZqeIWr1vxFPlaAcdupNXZXllK/loGSRClSc2kaZnUVNYBjyqm9
         u9zA==
X-Forwarded-Encrypted: i=1; AJvYcCVZcRE/K8QRYq48sEyc4uqcZydP6ASZ7YqmfKCZb7X6k7Mm1s/yJDADNhCK3jHFpWt5XBSTxxXhxdak@vger.kernel.org, AJvYcCW3Amb75wlTFuQYWwdVNiZ1ySxICqb2AFvGStyzSN7teR0ataEEwVOAm7OqB7Ig11hIzU3HAqa8775c@vger.kernel.org, AJvYcCWV3PqQ+UFC+KJ0KWulbpvA75fEoJ4oLBkOitqnDAIIlXp6ytUsKns8rFHXgPbpk/WITrKURdPz7qEjqYo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxgu7pD3jqng4Bnq1GcLh6wWAmAc+zs0qtF2CwPeFRANUD0rUVE
	u7kf5Da9GQtttV2LOiZnDJwnWUdwXSaLUWGKrGPhCg8sqkeLXt9WIxyYAJuO
X-Google-Smtp-Source: AGHT+IEinLyHOA1cU8O4mla2g+CTLD0/kpM9fr/Cvhw5KUFrWs0dqZE3hQDgF3DFEKEzSCm3sqc6BA==
X-Received: by 2002:a05:6820:808:b0:5e1:ba38:86e7 with SMTP id 006d021491bc7-5ec23970a84mr7743542eaf.5.1730219577179;
        Tue, 29 Oct 2024 09:32:57 -0700 (PDT)
Received: from raspberrypi ([2600:1700:90:4c80::3b])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5ec185d2da8sm2397806eaf.23.2024.10.29.09.32.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 09:32:55 -0700 (PDT)
Date: Tue, 29 Oct 2024 11:32:53 -0500
From: Grant Peltier <grantpeltier93@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: robh@kernel.org, linux@roeck-us.net, magnus.damm@gmail.com,
	grant.peltier.jg@renesas.com, brandon.howell.jg@renesas.com,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 0/2] dt-bindings: hwmon: pmbus: add bindings for
 isl68137
Message-ID: <ZyEONRFoooymFcfJ@raspberrypi>
References: <cover.1729874904.git.grantpeltier93@gmail.com>
 <CAMuHMdWHZR9pN3h=Jdsqs5Qb0mi_4CobBtu82PRgzrm5TRgE4A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdWHZR9pN3h=Jdsqs5Qb0mi_4CobBtu82PRgzrm5TRgE4A@mail.gmail.com>

On Mon, Oct 28, 2024 at 11:18:39AM +0100, Geert Uytterhoeven wrote:
> > v4:
> > - Revert devicetree property name to "vout-voltage-divider" and refactor
> >   property description and driver implementation to match existing
> >   vout-voltage-divider implementation in max20730 as no suitable generic
> >   voltage divider schema exists.
> 
> Can you please elaborate (or point to the email that did so, in case
> I missed it)?
> 
> In reply to v2, Günter wrote:
> 
>    "I would prefer, in the order of preference,
> 
>     1) an applicable generic property definition
>     2) a definition that is already used elsewhere
>     3) a new chips specific definition"
> 
> https://lore.kernel.org/all/3f460b62-4cd1-49dd-a98b-1fbcfdbd3af0@roeck-us.net
> 
> Thanks!
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
>

Hi Geert,

After looking through existing bindings definitions, the only generic
voltage divider property that I found was one that is intended to scale
voltages for IIO io-channels. However, the use case here is to scale
particular hwmon PMBus telemetry, which most closely matches the existing
implementation of the vout-voltage-divider property in the max20730
driver so I opted to copy that implementation based on Guenter's
preferences. Is there something that I missed or more information that
you are looking for?

Thanks,
Grant
