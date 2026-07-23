Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5521E3B52E6
	for <linux-hwmon@vger.kernel.org>; Thu, 23 Jul 2026 06:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784788200; cv=none; b=ReKUOwYKBdjSgDeKOF70mmnIYCrHYbehgtbKLmzsKd+7YaxiiqHQ/o5zUABfUfkgr0y5bQuDJFNiJ2X5qgMuYeqgNWpAKjT7GZMUEQ+vcuUXGmjUci48J5eARVxD5n3AvyU3dpHdmTouUawbn2n22CqlM4BYp/dbdvUAWQT1OIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784788200; c=relaxed/simple;
	bh=uozDH4XEIfou8SOxvvK+z4mvTO/pfJIURoO4Y8ZM6LA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O3aOguKD06iV0d/qFqOhQNI7oj31zeXBXe6vd8Cny/65RKyul2S/EYlbCfFtVb2vXFYZ/A7C1cdWOJEzxdahZAHXnnxHULBedVMYG46h4H0rdVmUQKIKhvLHJpLNsS400qNTCNwO2WBgTj7y2+yaMTog/z7Nna3s/7Z+aLE4vp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=NHG+g/P/; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="NHG+g/P/"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-47f64ca1c2dso30935f8f.2
        for <linux-hwmon@vger.kernel.org>; Wed, 22 Jul 2026 23:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784788197; x=1785392997; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uozDH4XEIfou8SOxvvK+z4mvTO/pfJIURoO4Y8ZM6LA=;
        b=NHG+g/P/bUGjqS1muu1hi2MTDTYqc3WJmQ4kmoSpKP8plbhkwHH6BXtZKrQsgH6SJ8
         7X6MUzEZUt/mi62jRRc5O3QK9d5GgRLbWvknmKUayVkLgkydV2xXpnIlVBcu739nJoHJ
         4mSNHR6eoHBrAf1tRwu01lq3sK5m/6rClQ2HlfLz4vGI0kyFjdasCO0k5Dni4Z14AN0Z
         proSqh3I4NvD40Q8RonpF/gp3LYayRcHIQ1Rk4VwzOMQD6OlzRdgjbN5QhCrmXz7CaNZ
         rKA9TILcKa4aMPZErqtgWF8RrCvxRasypLvnUvM2+pD8c5nrQMUpzpIu8BT9tbsLuMay
         uBuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784788197; x=1785392997;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uozDH4XEIfou8SOxvvK+z4mvTO/pfJIURoO4Y8ZM6LA=;
        b=ZdgY+mlW7PGm+l1BntPBHll1kNcqOWCtAy/GGYJGI8w42dUJjviaMolY8lBsn9lZTZ
         kTXQgGQ9KGSBc0RE/2t7Jt9x/s8uKv+xrXpHy/EsA8qF3H7D9Eu6lZ1NGLiVDfegVPhh
         hs3Vp6XQECWMggP4LsuVIyhj0adIhIIsPauaxclDKYaS/n0HVZXP+BVZz7zKoEx5uGHX
         pzNx9UFC5viZld3yEaBX4IQf8A45gfL8+p2xWvE+HDtzLYBzRyFzTg97uNkpO2PQQviX
         oBIv7WXpDX1j9R0/gckWGTVlfdKSmt4wwp9mqoVL1PE9etlwCGjJJHK3ZaX0wwKcjFdn
         Gf0A==
X-Forwarded-Encrypted: i=1; AHgh+RodwQZZ/0y5t9jYggZ+YE3ClJRz3EAvpDmaHu6Na18N2FWxVFtfSqvbkDH8aWVGZ5kyopz8jMftj5+vRQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxOHaf7A+rpiQN1pulZqg+RmpNCN2v5c8D0KbZCv+qZJaeCHZcX
	7XZAl5Pken3Nlg9S08/AJDLS+g4PrLsqJosHvAVUew0NnedZ83sok6I0XUJwx4FXlKg=
X-Gm-Gg: AR+sD12njnlvYze5mzl1Q7+kQ6cXUqTAD0nvtEg8qz6dVMcIEUqFOlXvx79pj+a25d6
	ScH5z7m94R1ecy5R61p6qdwO5btaBE7ETKLmRZgYClezTAC4wrneijD06uj0Z5xxe2g0RuexAXf
	lTA7Kq+04dR/VNj2yF+fE42P1Mcn58Kb2vnE5wIX9Z6sztILVZoGsM2XXsk2bUD5ymkVjMe+eWR
	PXsudEMrlEg6Dw4y4lfRmh1pQyV0tR+3fKFsTG8KRFCxXOPO9xK+QriW0LvSjJYuiCYS3gIX1LL
	pM3Q5VAowaz+jBrW/+rjKzZd55726aBfbMkdhldt+QONxEH8l/t49e/pa81dO3Mj+HlRy8mCwHc
	kAlEyA6HwBisNf3xvSuL6qIbsmHH8glUHyO7ZjhdAYlgAUIjk5t3SvkIpEL3wpO2wWTsiOSjpDA
	dkWEtyKu4=
X-Received: by 2002:a05:6000:4610:b0:47f:45d1:7b74 with SMTP id ffacd0b85a97d-47f8dca6c5fmr1936289f8f.58.1784788197625;
        Wed, 22 Jul 2026 23:29:57 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47f85c631fdsm12158433f8f.28.2026.07.22.23.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 23:29:56 -0700 (PDT)
Date: Thu, 23 Jul 2026 08:29:56 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>, 
	linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
	Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Subject: Re: [PATCH v2 02/10] hwmon: Add Qualcomm PMIC BCL driver
Message-ID: <amG0f57O5-e_Qg5z@monoceros>
References: <20260722-qcom-bcl-hwmon-v2-0-febe2805e17b@oss.qualcomm.com>
 <20260722-qcom-bcl-hwmon-v2-2-febe2805e17b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bd4y6yvvhvmkobl7"
Content-Disposition: inline
In-Reply-To: <20260722-qcom-bcl-hwmon-v2-2-febe2805e17b@oss.qualcomm.com>


--bd4y6yvvhvmkobl7
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v2 02/10] hwmon: Add Qualcomm PMIC BCL driver
MIME-Version: 1.0

Hello,

On Wed, Jul 22, 2026 at 12:00:07AM +0530, Manaf Meethalavalappu Pallikunhi wrote:
> +#include <linux/mod_devicetable.h>
> [...]
> +#include <linux/platform_device.h>

<linux/platform_device.h> already provides struct of_device_id and
<linux/mod_devicetable.h> will go away soon. So please drop the #include
for <linux/mod_devicetable.h>.

Best regards
Uwe

--bd4y6yvvhvmkobl7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmphtOEACgkQj4D7WH0S
/k49VQgAmlAG8muz6EMH5FjdlhV/oZNvJu7GJoTRj34gMkDOuJxv5eCjOKSjMT9q
kpJaIlEzPWBL87vMjKLjzIjbrmzbQCecyRprvXwQD5kRTcHIp6VehlZoXVoEkmVE
IHwyi4SD0DiEa8zfppjbcvaSy86X42bsR+zf9bWW2I4myMzanvPMEROEE7LvPJFG
/ZN2+kVdAdHJCs7RVEPmaOmb75+Dr+jnkVFQC0VV1f+KSVkZEpvd+fcQXcv3GaHu
n2iHyLpWtJeYA1uhY688Q+tPOwMAEwcHbgmIDoyYtC+DYHrlH9/4gqEsHVWD7vQO
fmjQGvUa3+No+e0dojq+d8Go1+fZWg==
=P/xV
-----END PGP SIGNATURE-----

--bd4y6yvvhvmkobl7--
