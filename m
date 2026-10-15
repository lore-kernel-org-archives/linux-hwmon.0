Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A2564ADD9B
	for <linux-hwmon@vger.kernel.org>; Thu, 15 Oct 2026 08:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792052729; cv=none; b=AVG7+W9FQr3eUvdRnn0X8tRjhkH/gLOKf+6Qg9y1e/fixqaqBVBX1ikoEvS9kDSYQST4oZCnYoobW7qMttaVm+7OKE38pAeGYXIi2lV4dJxp7JBVVnS+4qOsZ7ZKgU/36cjpqDWqVCqZ8avKSijDX/j2mY/lDeYHKltmKrsft60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792052729; c=relaxed/simple;
	bh=MjGHXq0yR9Gpo3xrFudvRWYYUefJtXK6z7zXZk3zLic=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Rv+aPQdTjuYAkBMWXuqD46Iu0XyQMbrkawWdMwtTMhzVTRUyemUqr7jL8lK9wjGVYzX6yX8uwDwXhB6ILKYJozJ8Gj7PTaTd4tOKo2BWT10ver5gbMLkbq6ZeV8O99jjXdCaotuTxznsqib+Ge0dTHtGzTEen9FUg7ZK/7jr3TE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iJlVG0Ro; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iJlVG0Ro"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a16aaf2067so22351285e9.0
        for <linux-hwmon@vger.kernel.org>; Thu, 15 Oct 2026 01:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792052726; x=1792657526; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MjGHXq0yR9Gpo3xrFudvRWYYUefJtXK6z7zXZk3zLic=;
        b=iJlVG0RoylsmHtfdnUUWKj3ZTp0HL7VhAFwbyCK/A8NqXZSaAYs3+rd5DUUEYAKzfk
         s1rCdOa1OoRa/OkSQbCBaA0AdDdIRTwQ5k0SzdOdYzLWfflpSLbhihu56idctutqAdZY
         PB+3vwZ/b1rsGRwAbEP3PRsLQ/7Ic2LlJ+8pmd4LyX5uDXInz7vEYKJMctDkvAndkdVD
         b9CcfMZXyGLymW9mfrhFQIi8sX5Pfvm0IdXBFA5WwOGC11hCpXQfpM8+xP6rBvwUrdMc
         G+qCanUGqUFpFIukNdgIchl7MDp/ROmPd626gsEIhoWGxamsilSfzPzq83y5LjfbK7Qc
         KOjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792052726; x=1792657526;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MjGHXq0yR9Gpo3xrFudvRWYYUefJtXK6z7zXZk3zLic=;
        b=EV+no1a3TD2IM15NZ4GDTF9n6TaDalzj4AkXu5e56GK0b2Z5ka6vjM6hkcqNeBwb++
         IyoYaypjb7b3Fp7bUHs4GLA//KoTOSxyMdGHMxWaJ0VgFuF9ICIG1b+N+sNKEwXRsANY
         pj2oKHmZXQXgwu56OZAQ/8Z1PQ1PKkZ5GMQ/55VxVmfLpzURIsHxqwIeb/l/8ZQArKjW
         p1WnrRMjs4XFMPMN/aY4yY7rWtqDEQreVDTA1x+KtwV5OqAd+sNFxd9z+qYQwUgLqqZI
         vo4Eo8Oy/QIZlVQkBZ5rcyaatLmRepqGZFpPrB/BKrjXZaltc1Kq1ySJE9kC1q3VIQri
         3qag==
X-Forwarded-Encrypted: i=1; AKwUvBxbPW3Zj/0Lbe7a7Q3YwQQE6OZPnarS1TPJyxAFfMUuN6hSAX3gvSt9UVJrkAg3b5AN/6a2siNQMVxawQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYKDkggzlKkbDqbx6/GiCa+0TU0jLDSjUwcUrz5Mje3e8enydiOU
	vgRWxRUwP4FpiBheO/FQorOIs19Aw2Jb660FI/NQ167Y5OYXdFHOcROH
X-Gm-Gg: AYBFou0sbC0YPyhOyI+24pWcVmeyi93tUYMLDD2Mp6znswjpEc104BCrE/LThY/BtLF
	tXXG4kpzMoJrkjdsjaMlEcsRh2FQ1W2QOP6xpeYcXAYBpHeayBudr8II9pgQt/Rgcjhyc22o6nd
	1owaPpYJJIfw/HZmGIJI+KNrPQYtJ5dbbifILCVyQTDraonOq789cVc3jZ2pb4MdUxyEr3ndcvf
	8cCP1BrLgQi9wCKyKpJryDfQ1gGXkS+obRDD0y5x1euCJN/ql/RdfyenNITtmhap5tMx3u2KG67
	IhiY33xJ/z6w10A+WT9Hg4sDeHXkwdoZgEuYPzbTKLK5XEVDuh+0up0t4DBalAIoliQpU/ACVgS
	kouJA40+6hVmhIBv9Y7OEeGu28nWibQQxGj3EmMxvtbPbLPRi/D7qzdeBC7ZHmXBGhPdBXZuseA
	essbTLtYlaZ9BgxCqjS+ZIKydcN4iWd+Y463v7OG3NbmPltRXKEeUeiwW/9EyHCickYGstDRYJf
	uQPEpWv
X-Received: by 2002:a05:600c:4ec9:b0:4a1:7739:f9ab with SMTP id 5b1f17b1804b1-4a18e4ca953mr370896815e9.20.1792052725437;
        Thu, 15 Oct 2026 01:25:25 -0700 (PDT)
Received: from localhost.localdomain ([94.252.74.55])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a1bd67a080sm51822765e9.3.2026.10.15.01.25.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 01:25:24 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	platform-driver-x86@vger.kernel.org,
	linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v6 2/3] platform/arm64: add Lenovo Yoga Slim 7x Gen 11 EC driver
Date: Thu, 15 Oct 2026 10:25:16 +0200
Message-ID: <179205271598.452373.17818636318443679532@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <3df5fce1-509b-1362-3b78-8f79337ebc05@linux.intel.com>
References: <3df5fce1-509b-1362-3b78-8f79337ebc05@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Wed, 14 Oct 2026, Ilpo Järvinen wrote:

> Thanks for the update. I've applied patch 2 to the review-ilpo-next branch
> in the platform drivers (pdx86) tree.

Thanks!

Oleg
