Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F1FE4756BB
	for <linux-hwmon@vger.kernel.org>; Tue, 22 Sep 2026 17:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790099509; cv=none; b=bGmV5oF03iqc9GAvorCJecdmGcoe2WSA+2QyiW273RDUrda6YMES692SHhQWm1qmD435thn7THtd6hX94TCx1RYQ/sD8mkllJN9d8zGIDviJU3NJq25Rwwe/4yA99IwhqiRuiPQb2Takr2J+YWwPPrgju02kX2UkcBoEgei8jO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790099509; c=relaxed/simple;
	bh=EbP1v3Oa6Pp3U3S6vdLzzYTTcSx5iO6uWXxoR5VqFYM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kJDFuqMUzKtl7kE0LTnGg049RWd9s0tDX61Z+sPrCoFr5OdcVg4yNnGsMLmtePjYBHmFWi1omYqld/T6MwyOi25BHgsHCP3x++nWy+VlnIx2hsvxVx/zYqrmMd1+1ueSfZFUWIldbVqmDWTq6s61nznkyW+AZCe3QQ9twW0jRY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T4ur/msL; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T4ur/msL"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e69b9e16aso580075e9.1
        for <linux-hwmon@vger.kernel.org>; Tue, 22 Sep 2026 10:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790099505; x=1790704305; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EbP1v3Oa6Pp3U3S6vdLzzYTTcSx5iO6uWXxoR5VqFYM=;
        b=T4ur/msLvaIvLk1TDYJtusmbXGtVSgX+6zHarAzlEKJzmwcgkHjf5tt0izYJqx/G87
         iR5LLMMPup68k08zxxYu+R2EQTMiseF9Gt3P0F6HvWja0A69sXpwzKMIouOLG1YFrbM1
         RXBkFq+u349ag8qGr2ADCUjXK50cKnpCgXi35AEdNMGxrGsWmaGk2R4Ib3dUEE5yOu1n
         X/Mq6XVCrV75EVPZUBZPUJgn8NLgow1aiMluLhbxOTCh+yws4GflGI+GLUZwzV1EtCMO
         4Rc+ny2RHizoi8ORV6zweprezCyFGxsA6KGdSuT49HitXDzVKNF9ZRzy2Uswjr/U8/Au
         k+hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790099505; x=1790704305;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EbP1v3Oa6Pp3U3S6vdLzzYTTcSx5iO6uWXxoR5VqFYM=;
        b=Ppr2nchRfBWvOwJ/EeVh47u0T1Z7GGg4cjvD5OPyRED1+Up2UXXR/khw8rZmo8M7B+
         cihAA5QhKQ+Zdjf58rbZuaTiO8jznaIQmscOq/wN0WSN/n1T+b8VlSjU9bnhuuHnMJxO
         nmXd1QSUSkqp/tq9+jx3pAmi9MRGBTwDk3uwEREENPwdCB3/x8RcqvEL8KPl+wSAIp83
         R2ZBxyvpCBmbY9TWgPqu5uuQdgbGZXwpJzAILPJ5gysiIz9PCy8I0ObzO65H8QE7xE6p
         Iivlza3i+FyKW8O1AfuM9UVkvmEb89xvAf6ZKB8zDGAHUvz034MocLeU39a/j3IbWUPl
         nPSg==
X-Forwarded-Encrypted: i=1; AKwUvBz3Dtti38oIHXnKbDrUOd4C2K6jhCbvPj0eLOBoX1E0n4I/mxhTQTMLuA9SgLMPhcw27PJ1ViNjxhpeeA==@vger.kernel.org
X-Gm-Message-State: AFuF++mIyCJXsEVC8jsZFwsg8Yq229Qb0dwOqaqQn8KDJqu0uWVexJqu
	KdooTDLFyXbIoj2b70ZGAENVyed/w9w+1jLJbrqq7xc51cA1iMoefbln
X-Gm-Gg: AYBFou1B6cly8PEwEXGLRK1tiiBuQwB4TYOR1MkOMqjHdVsMsx7qC4nTt1Mzl30GBM4
	ty0a2oo3vKwQcrMm/XPkzLzzdhq/jbgLRb4DPH7qP+p2Q+AjM5eJuogyS1or5DPUEZO5pWHZtAz
	SGkcNIvGj3fxHlgdJq9mFomvm8C0wzG8+gEAD/wbY5Zyt2/DTUqAikPNS3Vxk4xx3gYtlNMPiLq
	k8+4JYtoTQjgD+WjvlpP79TmUGpJdqjqslv6UNm0uyIsaB5u3Qr8qzg6gi3bpzbkLO2mzHAsBqn
	vxf1y+suH0xkGJgZddhNrXLdvX3Z2/szZLz3ZcG3jQe2pefecZ48s2n7ToA+InA9ezYIM+f8PBx
	LJugPxwXdDsDZm4/gyzRz8GNTcVJQKO4W9rSruhrfShGE/D3dNE6rsiWGO0fIcCYqIh4FfFgXt4
	LR4zQEsRln3NFvj1a6Tmss3NJjNBwnMoTk0yvcTHU3ap5cq225iXnKomusxfncyWFQApcz7WBkU
	neoPpU=
X-Received: by 2002:a05:600c:83cd:b0:49c:fa21:1c86 with SMTP id 5b1f17b1804b1-49fc573fa97mr180249605e9.27.1790099504457;
        Tue, 22 Sep 2026 10:51:44 -0700 (PDT)
Received: from localhost.localdomain ([94.252.75.113])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49fde18555bsm8294835e9.2.2026.09.22.10.51.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 10:51:44 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	=?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: glymur-lenovo-yoga-slim7x: add the embedded controller
Date: Tue, 22 Sep 2026 19:51:34 +0200
Message-ID: <179009949426.334909.8218450300346111724@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260922165737.260443-4-okerixx@gmail.com>
References: <20260922165737.260443-4-okerixx@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Konrad reviewed this patch on v3 [1], a few hours before v4 went out;
the patch is unchanged since, so the tag applies here:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

[1] https://lore.kernel.org/all/69636cb8-5867-42db-a8fb-aa8b2d9301e2@oss.qualcomm.com/
