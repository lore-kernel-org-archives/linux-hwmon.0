Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8311835948
	for <linux-hwmon@vger.kernel.org>; Fri,  8 Aug 2025 17:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754673742; cv=none; b=rwVo3u+UWS4clXZ7GrR64esAUEunXWYSAbV/3wRVQ2V7Mu8yM8Ix7JIU/5EPo4Uf41eiiiO3zEDyJvNnLOTJF6v5uLeFHTXtp22/pS6h2yFFribTD+2DTY+O6vLukrPnRO3w5PApYRbvrypkBellW3nhfMk+II9MKqXP+HFeduI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754673742; c=relaxed/simple;
	bh=8envcHHs9JLRDgEmFGs1z3yt+5sACnpaa6PFKxHsCs8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N7gwQ3l+vSmPSkZBie0WOfOIrCIIedi/0G2Nx6an1e88uI0CNNH4Yqr1zhVYi7Srm8Vxkdt3fo0+Lfm3Smc91pZuHvSRF5WBCUwoT4KurOM/qSIIQf42C7GxXlE8UBODCDTAUephu5za/GzLoItfnCoNxIu/kMz/Wl+R71cSIGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hZ4BfGqG; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hZ4BfGqG"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-615398dc162so3806962a12.3
        for <linux-hwmon@vger.kernel.org>; Fri, 08 Aug 2025 10:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754673739; x=1755278539; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8envcHHs9JLRDgEmFGs1z3yt+5sACnpaa6PFKxHsCs8=;
        b=hZ4BfGqGpB23KPo9/zzeCYlCp2SCtKmldI+HgT8u31dF/NmClgC/f0hI+btTbZU0JD
         Rr6CYItcGsJi5AMnVRoH5DzladTvizFCQjG0X/gwAurTGUJ20qyo0zN+zRZytmLLEos3
         Bea/i2A2xSt9yWXtYTgyjWljqRgT3EPWp+yQ/POX+eIKINri6M+ufy1qYTrZfGkx8eSg
         UGHJGW9cBYkrDqKZJ6w9gFA/N2Q8dASqXgfONd83/Ejpu+ieQZlI14tXO7AbuCo55Quy
         B77eT0jXuIzvOZ3uw0Q+E03ch96okQxLTwYd8sfGVCLXPXjPPPc1gcHyofIpfjb81HiT
         ikJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754673739; x=1755278539;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8envcHHs9JLRDgEmFGs1z3yt+5sACnpaa6PFKxHsCs8=;
        b=YPOt8kUQRghKtWOZIXh+nB6LHGRBOlcKQ0jaSdNc8m0HvC0axLxxRncUFZ12ZZ/xod
         xdAKyt3KjGYquBdaMdpWf6CyQ8dN8PLXOSv4zHHwluTYY2mQQSvrdDs4Wi/5RDrMLujh
         tgb1YaWIIUkoKWCyG1jW7YxrFJww9HcUoW75ZW0AWXJILII+cdGKlkHAGI7EQjLPyRVf
         Hh1O0q5vi/n5ChYlXcAuNJkd64TpdRtyNcQ49rC2U+/G29pClhVWvhhM94IjTkGi9hxK
         onSkOVQYKvjcloWMlmYP9bcKTDVYZitsxiB0OJdCxKzNfxMfWLUrJVz1tijrkKDKZHp3
         TPLg==
X-Gm-Message-State: AOJu0YxlqpR5W/E9WEjtTTV6dibD8pjGePXKgpRH0oKMwhgWTBcyYl+e
	7bjbmZRRHljoNOahbQkbLmJrYj6riWwFBb46zgcLNdCgb+QR2cAGzHr/KSONqA/O4q3t1HdAJfX
	jMON1X9XJrR9e+RWAhWAerswYSBymUQ==
X-Gm-Gg: ASbGncvO2808f5mHIk8qBb7GagwFj5t7AV4Vzk82x8hf6j78vPNFUXPqwPVjT4mvZxT
	SkQd2dOzyyELfEnOObGCWtSnopHKgvC7kGqH2NIw0HdpVn8q5Cqk3WM/7H+oafKHSoOUCTEKan7
	rrVZJLqn58fj5P3XGeT3GrBfFxT7NJdVTfcsWLBJOTby9B1UpuEblZtELlemT6BhxF9g0W9rtpH
	fzdKKo=
X-Google-Smtp-Source: AGHT+IEjOL5YW/gnmELqwf+cioD5jZap6fO5XAff7trRA/BkumMKc7wdeO6CIAqsmszfeSOe3HqhwNpugSjKPfepTUo=
X-Received: by 2002:a05:6402:268d:b0:617:4a59:c5da with SMTP id
 4fb4d7f45d1cf-617e2e53bbamr2681712a12.23.1754673738630; Fri, 08 Aug 2025
 10:22:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250807215037.1891666-1-gfuchedgi@gmail.com> <4b4dba48-d8c2-41ba-a80f-6606d4231a18@kernel.org>
In-Reply-To: <4b4dba48-d8c2-41ba-a80f-6606d4231a18@kernel.org>
From: Gregory Fuchedgi <gfuchedgi@gmail.com>
Date: Fri, 8 Aug 2025 10:21:42 -0700
X-Gm-Features: Ac12FXzdeCV2ZEQPAUA_v1PO8wN2se-w8AgMA2dNb6LwXT-sFGdpeNEMyuwyvkQ
Message-ID: <CAAcybuvujtYQ1MjHmrDWrQVBhWQSrZMNa2sr=mrAN1mSa0JP8A@mail.gmail.com>
Subject: Re: [PATCH] hwmon: (tps23861) add class restrictions and semi-auto
 mode support
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-hwmon@vger.kernel.org, robert.marko@sartura.hr, 
	luka.perkov@sartura.hr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you for the recommendations!
Couple of questions below.

On Thu, Aug 7, 2025 at 11:03=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
> On 07/08/2025 23:50, Gregory Fuchedgi wrote:
> You missed at least devicetree list (maybe more), so this won't be
> tested by automated tooling. Performing review on untested code might be
> a waste of time.
This change was tested internally using hw poe testers. Auto and Semi-Auto =
modes
were tested with different poe class restrictions. Current cut-offs were te=
sted
too. It was tested on an older kernel because of the SoC vendor. The driver=
 code
cleanly applied to linux-next though.

I would appreciate a few pointers regarding upstream testing infra. Could y=
ou
expand a bit more on the missing devicetree list and what needs to be chang=
ed?

> Yuo should rather use patternProperties.
The patch uses port DT node names as hwmon labels for curr and in files. Wo=
uld
switching to something like patternProperties: ^port@[0-3]$ and adding opti=
onal
label instead be a good idea?
