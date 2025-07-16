Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5766A19C566;
	Wed, 16 Jul 2025 20:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752696700; cv=none; b=hom1suDXNeM9DWciCQJyYJ6JS9YRT/Qcom58WF0THRLOSUzTj8JMrDgLolokfeIQmhVVG2il2bBwcl1ANayyhJ1WPcT2k/sVCEeuzacplOhUaOUelNL8p4o1bbnAz3k2XxYjt3nkM7EX05Z+yJEXcl/aRkztMiNlVqXenix1UJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752696700; c=relaxed/simple;
	bh=XvjZjxkEBrNx2Emofy/1o/PaL25NL5nxLuCCczdfQNk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U6qRR8JbU/wYbyl8eoSm7RZWQQRc1rU905uq6OyVGX4V3kp38zE/EiAyH2CTT+uJ5iBeEZnEAW/w98y9qhf7TijwL0A96toio2DE5iKrSOj9vBlMV6cLFy9s8Xr4nxYgN6XDuoYKLAgLg6wvaGjIt/jnfMjY8Jn5Nj/Cc67W9cM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RVVgR6tv; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RVVgR6tv"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-74b52bf417cso257400b3a.0;
        Wed, 16 Jul 2025 13:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752696698; x=1753301498; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0Quh5RcoBpnA+Lw3erfUEwh2N4X2byQ3/VH0wKserdU=;
        b=RVVgR6tvMgn+TIom4DlQTOtUw5+ML5dB+YOXJZzGsqm0ATvVyuxD9xbV4SsdqwDLvg
         lURrReHKE2Fgr9hMC17sCDP/vMA2jChH6sbhpeMxHx49sWO9BvqQqYBysow34uIi/zLb
         KC37NHH0YMUarhfN2XuO/mtd/fmKg32U5wmZhkXaXKIyAOnr1c4VI10z4Ib6QhI8gR2E
         mfyxKpKOa72z1rOv3AWl13CLgRR+HxmgQEKP7OcNj5HqZ25xSt/eWbYW3Avk754uuYn6
         7OjN1r393wCBPaWA29YbqSM8+oIZcSBsItkX6xls9rOjZpg5378H871nltqtcDscz2id
         u0Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752696698; x=1753301498;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0Quh5RcoBpnA+Lw3erfUEwh2N4X2byQ3/VH0wKserdU=;
        b=Ppth2T9xU4ecpARgRoBfguhrl47v5n+mpvLo//AJRcQLEwv/GFUmMmSSDbvkjn3hBE
         KiVH32Jb+mK86vz0jjpHtLUEobx5nFlAtHWHwRGbFqctz/zMTzAA6h+vJ90he9OaK4WI
         VXu3Eu8ptp6OuIGt2lk5Qp1/xECNei1VkyqpE9ZrziyFG7YXs+LBvOvOftDDKGyHYZMI
         aqd7ouGZNNp5yq4mXKYY4giq9LtAgiopkOkm3A3xygJwaCZEySuIaer5deQO2t+Meana
         5suDIaahNAHlLQ4r4ZTqmgk1D9+QwiAzH2hlcBGNYSRSas/bY+0NFJrjFPNMqu7EVrrj
         Ccng==
X-Forwarded-Encrypted: i=1; AJvYcCWQFr6kULFbiMKNrP1q0cIibZ2aL1k8euaM68aQKo30w4M5+xlpPzwYhARlRRROFEse8tor+CuXQGUB@vger.kernel.org, AJvYcCXgfx2zOmfELeh3QZshc/FDYDGEryzeFQ+VTdEzOXUu3ZDjgtME3HxzuRsPGkSAWPwSSu4vo9tfh9mRsE4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGFNgT7un7VDkkuFZfMKW4CU0Mm72WihYM/BCbnKmF8Jgfec6x
	FszXOjBg+jAG5oBn83sVB5Q/uotE4VfP8KX5VnjoLBh0Z+M/kQVvbu0i
X-Gm-Gg: ASbGncvKf6q3zEdTwZBTzxohcJqXgVyPCV1utI4ALvELDZP2Zv+Vrs63Mri4iq00u9u
	cWV1ju6lNRyC0hJzScXOBzAnzmoEA+FfdokmTXsAdIqkTjhfCcwdb0ppsp5EyxtSAloebz9d2DB
	6tVDKIUiFMcW7otRHKcPxo/eAJNmCDGcuUI+tXCkx4hu/06InmOyDlSbkI+SVcd5b5bstggnSor
	wGKnMQjl66+FWNCVzJcYIOMKNWaSOQpoDD96mzEREUZqMoHbMEJvUldFFwiYiDVKkkTdqRhU8pv
	MPZwMPkqF1VgVVabB5Lt4TLrle3DeCojwuy4pueKLsOEgsr6YfyMTBjP+s0Y+7QMgPAhtdnPgco
	O7Ac6TT8TMhb4diqXzdx5CpDgxhbWprzn7SI=
X-Google-Smtp-Source: AGHT+IEX1lQSAqmN1BxVenJL2aDi5lEtV8gSU0l4o3yxo0+jcwki7ZRF4VIFRmCEU1NW493nRL3RwA==
X-Received: by 2002:a05:6a20:2588:b0:21e:eb3a:dc04 with SMTP id adf61e73a8af0-23810666f23mr6501249637.3.1752696698509;
        Wed, 16 Jul 2025 13:11:38 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9dd6073sm14804015b3a.36.2025.07.16.13.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 13:11:38 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 16 Jul 2025 13:11:37 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Jean Delvare <jdelvare@suse.com>,
	Chris Packham <Chris.Packham@alliedtelesis.co.nz>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] hwmon: adt7475: Implement support for #pwm-cells =
 <3>
Message-ID: <b88d0b13-160d-4f8f-a1d5-02210cb8da2b@roeck-us.net>
References: <cover.1750361514.git.u.kleine-koenig@baylibre.com>
 <b5cc994cbe74095e39468fd694c721d7c879db78.1750361514.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b5cc994cbe74095e39468fd694c721d7c879db78.1750361514.git.u.kleine-koenig@baylibre.com>

On Thu, Jun 19, 2025 at 09:37:45PM +0200, Uwe Kleine-König wrote:
> The adt7475 driver and binding are outliers requiring 4 pwm-cells. The
> typical value is 3, there are a few devices that use a lesser value for
> historical reasons, no other uses a value bigger than 3.
> 
> Implement support for 3 cells to make the adt7475 binding match the
> usual PWM binding.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>

Applied.
Guenter
