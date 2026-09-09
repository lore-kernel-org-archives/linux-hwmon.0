Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F215657D20F
	for <linux-hwmon@vger.kernel.org>; Wed,  9 Sep 2026 14:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788963767; cv=none; b=svgcSALD9d1igTNYvtnTHXSw1nf1DFhRmFVHF98ZJfCViBE5vv7G2X04uaY/1QbahTL6djBqQb1p2MvjD+CxhTdAC5U3/3bbRjJ18oGXzly2YNnbTftOIl4bVpaDs5RlSvjgARpkUrj9No1Rck3Irx1bVs4TicJwsUIqAbJZ1WI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788963767; c=relaxed/simple;
	bh=K/agZdMyKcKM4PBRai2GAcUit0gR2B7Tc9oCBirO3wU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jp5Kg2RHY48D86TF/Naq6sJBUhZCfqVRF/G54nP/dI/Gu8mgMzMoVhtzl4/57uE2L7u3gFKAxLG2Wbfi3V1LyT3sGhN845EBF6Ocm8gImVnWLGLLzQfHNeZrI7fUdeoGHju2psHeH8sjYqmclG1a7n24enaV0S0ElRp0EulSit8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=WU7D9nDr; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="WU7D9nDr"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4956869750eso52522935e9.2
        for <linux-hwmon@vger.kernel.org>; Wed, 09 Sep 2026 07:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788963764; x=1789568564; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=K/agZdMyKcKM4PBRai2GAcUit0gR2B7Tc9oCBirO3wU=;
        b=WU7D9nDrxKuTsbXYAUUknV73kY+b1IhFbveawnYzuEKD0ST+sLNDpnewOqXUOwIVov
         Snr+09H9KC7RqGtTKdThdyerzg4bnmSazazChVt38HmVNxUwV1iV4PQ0kMRCGwdNIYVW
         cCsGucOHD9CQ1zRyyTefkiCbbO25/3Av16aQr/MLO7qXgN/FydjHcxr/nVTiWjnl8I78
         UvbyfFtskq6s/aUCeoDPVDPq1reCi6EpVkvR0cCNjXn9tLSv+ZTixM8440lSw9OTd+JA
         MY5OK5YnaHrr4IaMFaiZWtgPGLJ70EvbHvGTXKmVtASt4YKElLejvAUJrXZGGjClYPU0
         Xk/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788963764; x=1789568564;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K/agZdMyKcKM4PBRai2GAcUit0gR2B7Tc9oCBirO3wU=;
        b=G1QBGGJr3ucpSKknn6jZBKeyOufUeq0jNT+zV3KRErFdqys4RMDsAEdzHJenmngNfX
         dAJK9lFDdB+/szx4ypGtp9CkoPkDtzvbCAamUNmw3pioA7IwIoyrc0FyXbBsGNsM0K4+
         QErdHxhXJ0n9M6+ov52g0wzv7cuFbxFn96xMWMUqqXQ9N8nIk+sYyurn3lHX9lENELPm
         eo4SQhMeoi2h2nU5Ft9fvbiLcwK+XxVXLmq1+7/WF3cdue/p4B265P6S0buRmOQZBC5T
         8mgCmiVrbBxhJ0jNN2OIjwHQV9hTIU2899wa6904WP5QeafKuNDh4TXhcsB/5SlayF5Q
         sLwg==
X-Forwarded-Encrypted: i=1; AKwUvBzrn4w6M6WO1VQ2pz0DqNBTE96tH+bw/qr6wyDopY5LtriEotTH5MPeK8txaYbkWVE0rBfvhPWOfpUEEg==@vger.kernel.org
X-Gm-Message-State: AFuF++lrRdQhdGb36Cya1N3Xu7g0EYQHpFYYyzFwxEN7vHOpXQ78BywY
	QstPzaSY64bOyuCOOwM3P9q2XgBOEhVLq21ltMLUp05EHm+JMO6iF2WnucCUmFG8Z+Q=
X-Gm-Gg: AYBFou3q5KTgfpnfxhZxF1Jz3/t6V3Pn4Dw6XXYXY8vsdtPPOH4mke7Ks31QBIyhmJk
	bNEOwvxnc0T2clHJRscVl0zs2LkL23jhG9LAU8C7fKR/M7VXgadd/HvSEM07qwsVnLoavZPym7R
	F3s0bN0O3yy5u3NAovuC3pmaYMmBPYH08bfkBX5vbYc34Y4DYxBuIWbeEUJ/8eCaSShkY7/aPwb
	mEVEQTPwHyeM1kRWHp5/pDjj8lXHE7TM01sGgnkOFVf8fAhrTznUVRqqKoUUy9CUApup9BK1oPN
	CPD9KoqVwURbtqVUlnI1Qp8LFz8+7vfNFDUpsUKpPcapZLL4BG8vo9GFoQkKnJjwCF4L4KKN/Jl
	6UmOqtNp6Qc63iVdouRhLF14qzaoawE9R70QbeL3YYN0AnbgnB+95tYvKiCOa9KWEWH76Qz0hAo
	9HG4lpEYt+uDLNBSBQlb5fPowQI6uwLKYWyo96T3PV60j9q8e+fGXUqOWgk1d1cMvMxqVFtdlRs
	fLzzIa6h6xTgocxJ0oUAfyOhjbZpqZF2VMpF0o7F62dCCYiaDgrhG3+H3LvJg==
X-Received: by 2002:a05:600c:3115:b0:49c:e1b5:b2bf with SMTP id 5b1f17b1804b1-49cf7f48645mr357100075e9.0.1788963764200;
        Wed, 09 Sep 2026 07:22:44 -0700 (PDT)
Received: from localhost (p200300f65f19a9042846e5e8b4b91e99.dip0.t-ipconnect.de. [2003:f6:5f19:a904:2846:e5e8:b4b9:1e99])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49cfd3f8192sm433887725e9.3.2026.09.09.07.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 07:22:41 -0700 (PDT)
Date: Wed, 9 Sep 2026 16:22:39 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Ariana Lazar <ariana.lazar@microchip.com>
Cc: Jonathan Cameron <jic23@kernel.org>, 
	Guenter Roeck <linux@roeck-us.net>, David Lechner <dlechner@baylibre.com>, 
	Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v3 2/2] iio: adc: add support for PAC1711
Message-ID: <aqFrNywuzlbCPXAv@monoceros>
References: <20260909-pac1711-v3-0-dff81003b82f@microchip.com>
 <20260909-pac1711-v3-2-dff81003b82f@microchip.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nda6bilsfrnoksc7"
Content-Disposition: inline
In-Reply-To: <20260909-pac1711-v3-2-dff81003b82f@microchip.com>


--nda6bilsfrnoksc7
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v3 2/2] iio: adc: add support for PAC1711
MIME-Version: 1.0

Hello,

On Wed, Sep 09, 2026 at 03:23:35PM +0300, Ariana Lazar wrote:
> +#include <linux/i2c.h>
> [...]
> +#include <linux/mod_devicetable.h>

Please don't add new usages of <linux/mod_devicetable.h> as I'm working
on getting rid of that header. Either rely on <linux/i2c.h> to provide
i2c_device_id and of_device_id, or use the headers
<linux/device-id/of.h> and <linux/device-id/i2c.h> explicitly if you
want full iwyu.

Best regards
Uwe

--nda6bilsfrnoksc7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmqha6wACgkQj4D7WH0S
/k4pBwf9HMHE6+LiElw59mvh7B50esffyJs+75+O47two8cqCFL5pIZ75C1Bhf2L
5Avi0u8+4M9eEOSxBdZhYORLo1a0yP9gfK2nRcrcj47KYngZg7Ss7jGKIn1MNt82
s6UFapgx5vTvRirJ1S2bFYFvIVrXlXnl1Zz8xMSrOeYTy6XwB2re8g9L02PWILWV
67hTqAqiN8951ovK1Do14dG3FzisY5x4qVyJyo+HdI1UiVaBs3eLAlcHILGS71tE
OrXNyW1CLi2aNUC7ozo83ZvMY29ifc1WKfiUA4rl+/HgmHV34/xw6jORCsP+17f2
1lKL9L9TnI3HGjMzkyRepYIWqMlV1g==
=K5yF
-----END PGP SIGNATURE-----

--nda6bilsfrnoksc7--
