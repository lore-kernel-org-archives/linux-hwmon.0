Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 329CF3AD524
	for <linux-hwmon@vger.kernel.org>; Mon, 13 Jul 2026 08:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783931297; cv=none; b=kZYuZdHeoKUC1IOCCs5lOYMBeDoKMnGxkz9xXixOxyqfFD1lotIf6rAF0X5hA6fcxFBB8yl6VaeOUxC+k0Z/YVXr2BkGIv3eyQyUG2v/W7DdF8fg1m1J1dm8QduPK2BoHBM85ynpn9m5Tceuxcqi6OHFw0bXQjMS11PbgRGWjvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783931297; c=relaxed/simple;
	bh=1bdQxZ+KT2IXwA3Ltsi7cQksVnEt6y9F8PnZupL8F5A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IG+vUtaDx6el03BW4TLvJ0zgqLkLCTefvI5hlI5SPvtLyDlMG3uNiReZqUhA4q5BstRn2vu1hkm2BWZLRUroTr9neSlGKgDpVIwKxqjG5jc6WJcEmMNodnRxAMQH21QvbBfbC7lApgYb38qi4d50e5eOCDoyUABn9QumOrNW3QI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SqLWaAts; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SqLWaAts"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-84874b52eabso3723947b3a.0
        for <linux-hwmon@vger.kernel.org>; Mon, 13 Jul 2026 01:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783931295; x=1784536095; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1bdQxZ+KT2IXwA3Ltsi7cQksVnEt6y9F8PnZupL8F5A=;
        b=SqLWaAtsjqjybIBxzEryU00C3b9VOTarSGplovshQTcRxU7LquegJaK0+44qfD+90X
         yncXbWQAbDmzqsHp/TR5c2I1s9wi4WaCPOEIRuLHxoHzrkUv7W/8dRiFopBQBwSYT5tI
         WBog20AvVGYHfg9eZibsLi7BJ7U/xLQQceYiF04VVH1azFuy86TLSDqauzDZ7BwOH50C
         HPj4wmdhIZ2hmOCalmzInfHeJO8cNwUlFIl6tn9nqP40fQA/sDXIXQT+7SSTWvxU9otm
         wbBTvKS821eLgFG7IgDdbvpwaHsNGHlEIPPrhD+2dcjVj0NpJpAoOjOrlCbMSMU9+U7O
         GlLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783931295; x=1784536095;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1bdQxZ+KT2IXwA3Ltsi7cQksVnEt6y9F8PnZupL8F5A=;
        b=c0MJRhrMHWrHVpVgBYf21YoscUc/8StfLSfEM7mjOS4nc/VL4AlrWr95boSP57O/bc
         GVy+WqfJApeS2bj9m3PWqebXHRIxxivzQv5O0bH0R79KGwn9gRPWiZoUBZDHQhnOTBQv
         IUA675IkhjL+hFkYMp2249ECWKheSO3ki7hWOdUb8V06e69Dzp0+1sARlje98a3yoaiM
         qGa70qlzvXUu4y22xq3LojYBZ8aEGk95gVGTpmXAC/MkpYaXb2jKTh0illjWyQLwzsFf
         TbIqIWQGg6zv+SgO2lpOOnRCegSuigOUac5qIeono4s5J47DulpPOW/XT5rlVsKDvEqP
         DUCA==
X-Gm-Message-State: AOJu0Yx5NhQWGW82XY/F2oHyps6qke1m8g2TLIJO0zfohAHRzhB/PTrt
	3VPzsSogC7A8VynH0RetmaN7xoLALdxNujjna67rbFo2EBCywGDdbui8fhhLhl0z
X-Gm-Gg: AfdE7cl9TZCg0HnC7VOvbbA9Wx8KuhoXc/31ywCbQtlo98asunWTbkpDm5rFwlVhYgU
	R5YzrDvtxTSaa6ONha+/jaibjxAhFOtV6nyLS++p0a3J2Lrl+g/BYTOLErVerRNrsBLCaQU4eG2
	YumukloDokCDkQsaxOn/4nQZx2O1MY7JyDSXPZoG+zEUHUsuiGLR3kjDJoN1nX5z0TikP3hukfS
	awBmoQfNUCpeTOFKO0d42wZDM5Wrbseasfb2xP/97mqSBjs1JIV4tumG5Am+KrtgPZ/LTjZcCfw
	9QYYrzEhbuMgnMYvsXf7DXcIIOonPHCDLFdt64oF6t2zqWj9UmuMt3zwC4LrzOW5t13QrbHi3Fn
	CV0Ar3ITBdFlMreDyAtK/18O41uzczQgOIna/gveQy/Oe5OY2DsPE/3FtDQv6LlYSb4wR+E7sn3
	4Z0eDC+XE0s0epBd2+tYHc+Q==
X-Received: by 2002:a05:6a00:3306:b0:847:8dec:141e with SMTP id d2e1a72fcca58-848897569e9mr7818491b3a.54.1783931295613;
        Mon, 13 Jul 2026 01:28:15 -0700 (PDT)
Received: from HP.localdomain ([27.217.83.168])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8494b279e8bsm2691284b3a.33.2026.07.13.01.28.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 01:28:15 -0700 (PDT)
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
Subject: Re: [PATCH v7 3/4] hwmon: (sht3x) Add devicetree support
Date: Mon, 13 Jul 2026 16:28:09 +0800
Message-Id: <20260713082809.24184-1-zaixiang.xu.dev@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260713080129.D8A8E1F00A3D@smtp.kernel.org>
References: <20260713080129.D8A8E1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 13 Jul 2026 08:01:29 +0000, sashiko-bot@kernel.org wrote:
> While reviewing this patch, I noticed a few pre-existing regressions
> in this file that might be worth addressing.
>
> [Severity: Critical]
> This is a pre-existing issue, but does this unaligned memory access
> crash strict-alignment architectures?
[...]
> [Severity: High]
> This isn't a bug introduced by this patch, but does this integer
> arithmetic overflow?

Thanks for the report. All five findings are in pre-existing code and
are not touched by this series, so I would prefer to keep them
separate from the devicetree support here.

I checked the first two: the unaligned access in sht3x_update_client()
(buf + 3 is an odd offset into a byte buffer, so it needs
get_unaligned_be16()), and the limit_write() overflow (temperature is
clamped to 130000, and (130000 + 45000) * 24543 = 4295025000 just
exceeds U32_MAX, so writing the maximum limit wraps the raw
temperature field to 0). Both look real.

I plan to go through all five and send fixes as a separate series
after this one.

Thanks,
Zaixiang
