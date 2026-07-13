Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D170039479C
	for <linux-hwmon@vger.kernel.org>; Mon, 13 Jul 2026 08:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783931271; cv=none; b=qlCj8y88QYgMIjmZJ5hWYWTu1+I3BSYLx+Xi07xCfwrXn0pbfNdEAB/wmQPmnG1Dw2by2o9xErTzgiB31Ied+G/FV9ot40HDaHGumkvwnNVUMMZCENa2l7p+UDG95iJgBgwEjh9RUz7hHbM4kQmzPfdVYrsdkP2L+kQw1BW+FFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783931271; c=relaxed/simple;
	bh=psE1qQi7+JPeylnHpAM99xWnw7wL5EqXGGzHGX0w128=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BvQ7W6p6WrFDuN3gXJ78y1MFi90drFR/NovOvArXVdMkGhS/5GBii0pmTlmkySTDBZ7jlUgBPPiz1ndPBBVGf+FByybXbFJ3imlOFVmwREO5jcNbiMers1FtCxidceKcVmFNZyK2j9Py67v9BS3rX8Y/JAsVgYOp5DT5eVvps84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lEPZZk1o; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lEPZZk1o"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-ca97d139d5fso2025962a12.0
        for <linux-hwmon@vger.kernel.org>; Mon, 13 Jul 2026 01:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783931269; x=1784536069; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=psE1qQi7+JPeylnHpAM99xWnw7wL5EqXGGzHGX0w128=;
        b=lEPZZk1oKt+Sjqiv5C4q+fBu64oTkMXFYF3muUa3EUOD3SzchqdwwNV0nHsACErzPX
         wMQ/K1adKCEbjy65Y1StI+J3exYjM6tGyBEqQw/7v4Rlzn4W7++nT1fdVj4hpW/sVtlU
         4+oGuqt1TntzZaf+B1EoLEgyEi13oS5+XbzvyhZRNq0DqLrQlUHvbVMNHb33IbSlUVrh
         d79fHWU7dVIoT+LxA9zdLEnRcb7+yy0zy3Xu3f245R53/xD2GMncrzOfK0mKX+xkPfJc
         8TuANIjZ2dItmNqt6nnCo28tmi8XROqABVaMy5BvfSb67GBD271tbDQ1Elj6MVGBbPnr
         3UDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783931269; x=1784536069;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=psE1qQi7+JPeylnHpAM99xWnw7wL5EqXGGzHGX0w128=;
        b=RpPeVzvlTYfSwixsS9gyt2aWeVT/NXHFzNoAIgAWhskaAEWtd8BEatd3pnynKM9Ftn
         mfGWgWAU4i4TjIWdBen0+fCA3cNvSorTowtkhfgOVq5D9yD7P5Kho+EqSQhWoF6heeDn
         +OnSCAnNWfmvjOWASXdkaEx06Mv0FMtcpTgFC2kdMp1O/a/wreTlARsXu4xeG9j1Fc6q
         DJEybXWkEMbr/yUgmicFpP0ncCEnM8WP9R9HWTFTXllg6sDbW8Ey477CixQ3htk83pB0
         T7ocqpQJ/lvZHaFIle8+/HymYLheOpOti93UF7NffL6D0Ulm4YwgPHc3AdgWDVnRjn6/
         5Rbg==
X-Gm-Message-State: AOJu0YySZ4V+qqpmBCrwVRmUbrkFpqzoleHydtK32bk5NELnr8V7YRcV
	SSJ2u/p9S9Srv/t5S6N9Ed8GHley0/Ik0NkccYMuFAxnZzegQRik0f/BW99B6ohh
X-Gm-Gg: AfdE7cmJp7NEv+CKLPCOUTxuss4HdfRZRHCGXWZ+oY8Q3KTANguRAy94CJiKX0WwWqO
	WMtbuu88JWGcvvghJRdvNA0Rnr6MuzRGb8P7EEENpBXjafkAByid53WwQxmrtjaf6ci7dL42U3E
	AfD3fmQYadQaeQilLhE3dw0KUyVKZjsnUe1uqSmFZQmlEjaakaZrJutXVGwINXufHcY0wEniGGZ
	f2qZ9DCxyS02iTOOgYA6bC3ErYEkfx2konOWGR06gTmgqHHlvsbl6f74qyuXvhfg3/3AECquwgu
	f4qV7ElLcbos/P4PP87z9zCGbikPQ2c10t1EKD9PfMDoJugsY5wTDWCWR8rtDPgSzX2MUuH5hje
	2MCtEmGt9dM3p2ZAepEaMD3m5uw9Rac8WGJLWs7c+5LAgo0VmVvnELEUhkT0ItmvLrHbs5XpcMg
	9THdMpKg3TYyYcE5f8X2dydA==
X-Received: by 2002:a05:6a21:e097:b0:3b4:b276:a789 with SMTP id adf61e73a8af0-3c110b43701mr8134878637.36.1783931269266;
        Mon, 13 Jul 2026 01:27:49 -0700 (PDT)
Received: from HP.localdomain ([27.217.83.168])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5af7d58f3sm8021941a12.1.2026.07.13.01.27.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 01:27:48 -0700 (PDT)
From: Zaixiang Xu <zaixiang.xu.dev@gmail.com>
To: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	sashiko-reviews@lists.linux.dev,
	Zaixiang Xu <zaixiang.xu.dev@gmail.com>
Subject: Re: [PATCH v7 2/4] dt-bindings: hwmon: Add Sensirion SHT30 series
Date: Mon, 13 Jul 2026 16:27:43 +0800
Message-Id: <20260713082743.24129-1-zaixiang.xu.dev@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260713075512.A3BC21F000E9@smtp.kernel.org>
References: <20260713075512.A3BC21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 13 Jul 2026 07:55:12 +0000, sashiko-bot@kernel.org wrote:
> [Severity: Medium]
> Will devices using these newly defined compatible strings silently
> fail to probe?
>
> Looking at the existing driver in drivers/hwmon/sht3x.c, it lacks an
> of_match_table and relies on this legacy ID table:
[...]
> Does the driver need to be updated with an of_match_table to prevent
> this regression?

The of_device_id table is added by patch 3/4 of this series
("hwmon: (sht3x) Add devicetree support"), so there is no gap once
the series is applied. Within the series the binding intentionally
comes first, following the usual convention that dt-bindings changes
precede the driver changes that implement them.

The compatibles introduced here did not probe before this series
either, so no bisection point regresses.

Thanks,
Zaixiang
