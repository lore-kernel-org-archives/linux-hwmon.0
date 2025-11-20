Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E093376AA
	for <linux-hwmon@vger.kernel.org>; Thu, 20 Nov 2025 12:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763642632; cv=none; b=UDi6Let76AOuFJIG9biMPjDGwdPOXYX94j5iht98vcEZ05gtVfylbnGgRpZ7rpymtzSPCQKV/BGNWo5txkRGy78sg/OsRP+FajgcGcZJrHz44+MsjeGf5dPM6eyRv2hFxd/Vmzf/Nmmmhgawj6xASPs9eROVD85KhGeEo2+VxUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763642632; c=relaxed/simple;
	bh=a7w1NVjMHAQ1Gp1pifsO8tBdY6+R3dTlOqFZ2IRluz4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hr/kn1YSApyTCJY1QsGJF4mb4Ww2AbbzXlaBlpt9xLE3kpqOGF4JMz1I3Gf+67ymXmEBBwewBaE/jbt7+6Hffhu4i9Y19WJ3+y2AIGUCz13cf+4VPXaGNhc3zoXGRTSKYgHZBtV45gyipN4Y0ynhK8iSkOHOASxVp8dOeWyiyPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rte0E/PL; arc=none smtp.client-ip=209.85.166.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rte0E/PL"
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-9490c862fcbso34733039f.2
        for <linux-hwmon@vger.kernel.org>; Thu, 20 Nov 2025 04:43:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763642628; x=1764247428; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a7w1NVjMHAQ1Gp1pifsO8tBdY6+R3dTlOqFZ2IRluz4=;
        b=Rte0E/PLJNIxtCkQVwPj87KWAscRwhae6az+haLGqkoB0RwOxLlqqG0qsaLMmvyh1n
         tsPlxViaaRNao3QjikZZxNj8odg9/+vrkPqrsDdpjj6qBizzR8JTQEMkycn5l6bsN/fE
         HDug4GwX+vwZKEg3VEwRTe8vZ4FGNYaw4aXDGmII2YNBn7tZnbqXV6KzbMazGwcykdFv
         8RUkQDUXGBrRUuDcnftMXOg/j2aWAshoY4BD+yeb7EWOiradTzTLPwyf0UlLRkfFg0+q
         7LsEt9ohUaMTTB/cU+rSBYF5y1RexdbRYhL2rBlqICEXmxzx4wt77M9IEgW/PbO8KCER
         eekQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763642628; x=1764247428;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=a7w1NVjMHAQ1Gp1pifsO8tBdY6+R3dTlOqFZ2IRluz4=;
        b=T9g+xYxw4VRmm6moK0gb3TpjEjY6efsU9Hx4bw3W5+b3YNgbTe+1N3HUbKWnnId/fK
         aRGxnZFyM4Q+d9Ghy2ELX5a0PUbbIpj5nVOz4z31rURlCqhst9Px+e03v5fE1hNZ0tpD
         B5fosHIEJVUtXbKjFd1WPBahJAlYKn+KycPmQAw4A5nb5Bd8PsxzVesqtD0VhUDUcONh
         USqmPM3U2YtELp9JI6f2dKseFi0wCo/LcVR2VOqICBxT3YPfjetdCDTSfOo5R0/pyijw
         K7HDmUlduXLSL1mJiVSyWIZO2SUDe/6KzcDSvbM2fTXlrXaVbuOxcNAkw4g1qrYFcOnL
         rT3w==
X-Gm-Message-State: AOJu0YxtHUqzOj8OnjyUcGqeMuqLH+84KvP2wWf0N0LtYFhL8XKNptjz
	0v4EkZK49CqH6PuPsX6H29VIssXxOeDNRWr+NqM/jDM9dWsb+9yB2YPDQjmFVEmi70BGdOfvHFt
	2OR1yspHNTprzuwOjNr4b49JCIAMF+BM=
X-Gm-Gg: ASbGncsnZxldGUVeSiEIDMf/3Oy1BeHJ1s49NB+1I7Cp2vDi8sTgIXw7ZA123Cn/rHV
	hOBGX+SNjb2shB3alJkXj3I9QOxh+sIp0naAToTzhWrV3kWhBLR1iP+fkxUrSW0uTEM1JCZIZoL
	RDg1HvqoV+VoDltRlUDvXB923pkh78JlW78EgoNWibx0/VUCJqKZG0UIOjccvdoiKGgwYzzxsLT
	2cPmDtnrBraSwTvCz9Fs8jO+ava5u2WHKIlhstA3VxjXxIU3iKDLBD/iCoqAkb4JO0=
X-Google-Smtp-Source: AGHT+IGlppn4jiEgzE0SqZ86EgShU7C7LTIC9YcN5VCVVgoPoYLfICS0n+oFlX1U5rIpkYxRsaQL4BjwwF4GnuC/g84=
X-Received: by 2002:a05:6638:2113:b0:5b7:2ec7:e8c1 with SMTP id
 8926c6da1cb9f-5b953fd4b6cmr3162776173.4.1763642628360; Thu, 20 Nov 2025
 04:43:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251120.133840.269300445409439919.rene@exactco.de>
In-Reply-To: <20251120.133840.269300445409439919.rene@exactco.de>
From: Eugene Shalygin <eugene.shalygin@gmail.com>
Date: Thu, 20 Nov 2025 13:43:37 +0100
X-Gm-Features: AWmQ_bmsUF1N6XSdgOLZx2njSJtJPn3o3A-PeQPIEtLxdEM27WJz6kQBQNPTOGw
Message-ID: <CAB95QASj5rnMUQapsA4BE+iNgnQsnUSab4GbZb8yVUizxLppOA@mail.gmail.com>
Subject: Re: [PATCH] hwmon: (asus-ec-sensors) add ROG STRIX X470-I GAMING
To: =?UTF-8?Q?Ren=C3=A9_Rebe?= <rene@exactco.de>
Cc: linux-hwmon@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, 20 Nov 2025 at 13:38, Ren=C3=A9 Rebe <rene@exactco.de> wrote:
>
> Add support for ROG STRIX X470-I GAMING

Please also add the board name to the list in
Documentation/hwmon/asus_ec_sensors.rst.

Thanks,
Eugene
