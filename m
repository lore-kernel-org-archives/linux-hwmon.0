Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7123C1DED53;
	Thu, 16 Jan 2025 13:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737035542; cv=none; b=OjBKiCfFQoRNySVPLqv8Ys3qyz1RylKC3JTV4JwdeeX2qpsx4O9F1BIGdfSqNsortD28TNRo70vDhkDIfxxoTuGKzO7xKiEExVE9JqL2r9mo3Xsl+y6gRG6+EAdw4Jh2f9LQkGKhkdikrD4cg9WEiPZNKUBpEOzkorPTtioN7ZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737035542; c=relaxed/simple;
	bh=oFsxddu5kZO0xWK2yWmbMbJVxyC9VH5e8OAEgQt8uxo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T2zWYocUhMJu6/yOK9bnPe0CK2/cxdnbAaqUR92GaZ5ea0/sNxJ/P6z1EJjnB6YOKvELwgTGuKaut1dWVUW7Y3T/uZNIj5tw78s+OiNNgYDD23Y7GaaJRFsMPF73tyfXsCoJo5pNkp8DTaS1/c3+LJ5c/ixCr116HNgTyMaSUlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nj0mcexA; arc=none smtp.client-ip=209.85.160.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nj0mcexA"
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-29e5c0c46c3so593699fac.3;
        Thu, 16 Jan 2025 05:52:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737035538; x=1737640338; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JuO96IWempVkNU1KLyvro2vFbhpa/9E+R+coBfMKMxU=;
        b=Nj0mcexAXKPE5nlIpfy1Ke4a1IBaqmH1QH9ikfRsIMfe0XLtacIk4ASR1cnbfnii3O
         Ae73qsToFq6wKlDphX5eVdFk5QE5Tpx4tREhV4GLCNHQmijPDHgAWe6CnXP+NQksf6cR
         Iat/+ruSPQejP3P+BoXNfiYvkHM7BHUvII+eLzv0pdqVMOwr1cMTJSfFLDBg6gsOVE6A
         i2ckhxsv3ZeClcUvdfasz+Up1Bdve/SqwXRo8ca8dR5fJQ/33PiUxJKQMs6Jfo8YcPtJ
         G/htRrYerto/YR65PNazgzlGGFXWAJMxEmWY8I3ch9cKGf4GFKZUgn6uzBtwyshYCkfw
         cjkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737035538; x=1737640338;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JuO96IWempVkNU1KLyvro2vFbhpa/9E+R+coBfMKMxU=;
        b=kGPyqDeWLBBMgPou//Dc5MAzmsVALtnb2RC9oxB5TVAkWjWHGgprLfXIl0juRbB5iY
         USv+EvjuggqC2VWdzdiL54NG80uVBIcM73MWm9vzqTpYo7Qco8B0LVZ1DbRtA7gg9Lk+
         5kaEEfzlznqMhatPIuG3ex7XcBNi11xjmC+k8e8oXTKFdD78bov5Qt8D0PEuc8diMK7J
         zCtdfxnQCoVY/TanHvIYXPQHMpriNDEgcpY220cjup8XVgsH60dehBewhEM+Cfm8Jwds
         KJyK9+7SNH882y2cK1XllyKP270cOgMkE/z5DZWMe+6ubIsqyElufZkBn3GeIG1itNBn
         9d9w==
X-Forwarded-Encrypted: i=1; AJvYcCU+/RTgrAEA8ws1y4MbcfPE1U702GfoHYzaaZnbvKbe1Ng3kgRe+H10anPgjnLmG1UA1VKnaDIt17Ef@vger.kernel.org, AJvYcCU/DYTYi1webJKKUYDLTHEqIDayO0Yk8ts756I2Xadtj5OPXWfMkeqvyFZpEWiqi+Oh7tnXWA/2y9xX1HSG@vger.kernel.org, AJvYcCWN+ym36Xawx1DCeCyKhLE9YagR0eEhIhG85hl4iOjknifudxpARxZ71hBufb+jEL6zB50wkPmVg5W1@vger.kernel.org, AJvYcCXjFipQpU8SmVJmq3OpXpLZpV03K0zf1L47/A2yLNmUWyMsGNVYIw7+KRQflynoUSd/e4m0TKu0UqA5iN0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzuVB0/tqXQhyE7sQh4V4paGbvRigNnU+ZV335JadS4ulOn+VCZ
	oqIf52ryc1iMtfSOnqMb1jybUqAGHwo3VheuyLsyDPSe6nBigURPVDVpwgUqVgei8xYxG8Fzzid
	T68Us+eDADiQ7M6k9Th/SD+72+vM=
X-Gm-Gg: ASbGncu+Uc3EEChmwi7VpbHpAca5pfXvMZ5UuflUyCp0Fk36dtKKb4FD4vBKxgp6lu0
	s/zRwUxdVMQhztJb18o7O32Z0KNgkpMF9Yfa2/gY=
X-Google-Smtp-Source: AGHT+IE5l0Ts1eqkJ/aNEag10ptSbJFKWLRlqm0WMeaZdvqjpd3aVLCDtoKkCuHKAniNC7LyGAPudsEo0Km9VO/GfpA=
X-Received: by 2002:a05:6870:fe92:b0:29e:6814:19d with SMTP id
 586e51a60fabf-2aa065226a5mr20148132fac.9.1737035538404; Thu, 16 Jan 2025
 05:52:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250116085939.1235598-1-leo.yang.sy0@gmail.com>
 <20250116085939.1235598-2-leo.yang.sy0@gmail.com> <20250116-athletic-prehistoric-worm-36ffcb@krzk-bin>
In-Reply-To: <20250116-athletic-prehistoric-worm-36ffcb@krzk-bin>
From: Leo Yang <leo.yang.sy0@gmail.com>
Date: Thu, 16 Jan 2025 21:52:08 +0800
X-Gm-Features: AbW1kvYLa7FVsJI-15KZaQE92R4PJe7iEmWZjwDAeLiN4TVHLU8-1qiulGKEdwE
Message-ID: <CAAfUjZGSgdQYwC24S__EO13-q1HQWVkUP7oDgJm-=AeeXgr1DQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: hwmon: ti,ina2xx: Add INA233 device
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: jdelvare@suse.com, linux@roeck-us.net, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, Leo-Yang@quantatw.com, corbet@lwn.net, 
	Delphine_CC_Chiu@wiwynn.com, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

On Thu, Jan 16, 2025 at 6:47=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> > +      This value will be used to calculate the Current_LSB and current=
/power
> > +      coefficient for the pmbus and to calibrate the IC.
> > +    minimum: 32768
> > +    maximum: 4294967295
>
> Uh, are these real values measurable by the device? The last one looks
> like UINT_MAX.

According to the spec I don't see a definition of the upper limit of the
current measurement, it all depends on how low the shunt resistance can
be, so I'll use the upper limit of the u32 as the maximum for now, even
though it's unlikely that this number will be present in the actual circuit=
.

>
> > +    default: 32768000
>
> Default is 32 A? For what applications is this sensor used?
>

According to spec 8.2.2.1 Programming the Calibration Register example,
a Current_LSB with a maximum expected current of 15A is approximately
457.7uA.
The example shows that a Current_LSB of 500 or 1000uA/bit can be used.
So I choose 1000uA as the default value here, this value corresponds to
the expected maximum current which is 32A (with some loss of accuracy to
 have a larger measurement range), and yes maybe the user doesn't
need such a large current, so the accuracy-sensitive use of the scene
can be adjusted according to the actual measurement range of the
expected maximum current, I'm trying to retain some flexibility for the
user.


Thank you for all your suggestions, they are very useful and
I have gained a lot from them.


Best Regards,

Leo Yang
