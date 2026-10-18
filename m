Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E33853F1AC0
	for <linux-hwmon@vger.kernel.org>; Sun, 18 Oct 2026 16:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792341492; cv=none; b=hVxPuJww382T5Syn+GksLvcoSLJxc7OuklSc53hb3RhVfTTaZJF9KK1UjudWtvXQlJGdiTVD+i8CwnJIEaejCBynICOYaUGMguoPuxRaBIAVbQjH3LqHWcaNk1uBIeWv7aXI+UmpCrY5e4qM/mDilCt2qMVpFhWGPKePuq+M44U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792341492; c=relaxed/simple;
	bh=cWbrnQSlLPZR13S2XvAfyai9aYQ6B1FO4xtNhX/Qx4M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TqajxeauLo3e2V40syP0FI0qVdpWd3lpTbRA5pRWvi6tEffIeyCsigzP87DCDNZ22gwyepINY2usSckft6RIW/EVj04V3sNOxBh+RmP5dVCK0S7rNUP2Xl5N/JNiH3NVUPKjb5vFeOadib1f/fxQv2uFvxk9ZoVWM+uQNY8NEgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iUr1RGgJ; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iUr1RGgJ"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a1e477fe16so2426435e9.1
        for <linux-hwmon@vger.kernel.org>; Sun, 18 Oct 2026 09:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792341487; x=1792946287; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TUsjSvWYWV+jMep3Ewn28rSL6gnhBkjB2DvYwQ5XLq4=;
        b=iUr1RGgJrvWVubQmNgV6Brv5RxQCXzHv27D49TgZTx5jctorfkH9t10V7X6CoI8GIe
         3Z4YKok8jtpRQ4CE546T+9b/2BuMOxpxFCs2a2Gjappoj5BqF9SRHJsi/yjbPFv+2fVD
         ycj652tN7XbZckRChijHBlVI6A0kZP9bRwrRhf97kkh6+Jldsdj+AW16Y8VWdKwz5d12
         eQncEQQpE7WQ1vzFTivEATMXgFmAayd+FrHfI1aCr3FcxFe0F9nJRJDMTktbvSmGdg7e
         Ub5FefKrlH63LV7HhvipTIeRARZg9CAEIM+A1BuuugaDHbxBYE8Z4sSxhjb0nBwB5sQn
         srxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792341487; x=1792946287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TUsjSvWYWV+jMep3Ewn28rSL6gnhBkjB2DvYwQ5XLq4=;
        b=lMl+AYLeo+353j607nmPPT9kAFhcjkAENlHdv8D4eaEhI/Pmr1YvZ5jwyE8lJGvBWS
         ZEm3lAyAdBDIY4vHdmh/d/yYB4h815E20uSsaF8KWqF7qtf/RwXhh7sy454kwfhPQ773
         6XMnwU6XC3WtairMrd91/jEnR87emR9UDUoArovmi2qCxCgJvdYTIXsS/8aXobphhDBL
         ITFf5M/tf3LddGrkVgpVvr8kZuknZAFIi10HEV7r+ayXG0py2LH1aJGLfUK1vb99eKVH
         5j4fkfcXD4GW4A17FFEqwNzor1DLjkXpZ4W/jZIY7kuWgnZA+h+e3Ks02m0ROsZ2ha9u
         wwoA==
X-Forwarded-Encrypted: i=1; AKwUvBxApqs2Q3xS5YZGAhuI7lbpWKc7T8g/yxkaxQj9fKqyzw5gWcQFknA1EeShxUwXE4a3THZmlNcwY/Ubuw==@vger.kernel.org
X-Gm-Message-State: AFq9FYKLFb3C79OEsl5qYhl2XKc3dNi7zXIjXGWEDcPBPz0HAhVsB0QO
	3WBoUYv8xcEGHwv2diMJHi8gtliVskKZU9Z26A8PNWB92bR2Om7LmFJ3
X-Gm-Gg: AYBFou0wl0AgTDTc4lnnZaYkr3effwNeyTOoCpOBd4OSU5Ynes5lKjWaNPcSBk5UMuP
	phPurkIZj2kPWmsU6XqMVRwl0iUTsgnPAHO6b1kFEg4JVJlyOISUAdxDPc9CCKg35Q/I9uO3HB+
	fZ6iBz7YBiUPl6yR2mFCVlgCjORBmdoWnLoQK9S7NYl37CY4xu4Cg1eU2HglqYCQ8NAbKN4M50I
	wQOD0HLJH2PRoZCi4Ipr21yeBdQ/Bwx8LcU/BjtHJncY8w2654cROrnwcu+B2p6MrAhld3cxQ5o
	kWqK2LQCfqAP40IwWLxTneiKqSaeLC8ui7FauSckzSjL5Qax1IMHQStxQ6+xkGmQYpjN9+/aPnb
	m5QX7vk+cS02y1jHJcCWxAxRoK7wNAXkueNnCwr5mIt3bg+FE4Owm0fkIz1KpFFI+TEL4jr/0Hk
	IVnE1dO9tKAAgTDt54/spXKK24a7FS79SsUCQXwVtZ3L9HR5uNqMxkZGcUGQBY6trZqTjrbRKzc
	sq3YvRsL4uVN6KBln5+eVNgqVxJK1F02iryMfUoorjeZ3A2w9PSQzlStlc8F3Q/Ew==
X-Received: by 2002:a05:600c:1d05:b0:4a1:bd69:526f with SMTP id 5b1f17b1804b1-4a1d75ab235mr106971665e9.4.1792341486776;
        Sun, 18 Oct 2026 09:38:06 -0700 (PDT)
Received: from localhost.localdomain (bba-217-164-203-125.alshamil.net.ae. [217.164.203.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd47104csm19824339f8f.8.2026.10.18.09.38.05
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 18 Oct 2026 09:38:06 -0700 (PDT)
From: Ximing Zhang <xzhangjr@gmail.com>
To: ycistak@gmail.com
Cc: linux@roeck-us.net,
	linux-hwmon@vger.kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (coretemp) Document sysfs numbering and label meaning
Date: Sun, 18 Oct 2026 20:36:54 +0400
Message-ID: <20261018163654.45358-1-xzhangjr@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261015171759.704526-1-ycistak@gmail.com>
References: <20261015171759.704526-1-ycistak@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I tested the documented sysfs numbering on an Intel Core i7-10510U
running 7.2.5-1-cachyos, with all eight logical CPUs online.

coretemp exposed the package sensor as temp1 with label "Package id 0".
The four per-core sensors were exposed as temp2 through temp5 with
labels "Core 0" through "Core 3", respectively.

The topology files reported the following SMT sibling pairs:

  cpu0/cpu4: core_id 0
  cpu1/cpu5: core_id 1
  cpu2/cpu6: core_id 2
  cpu3/cpu7: core_id 3

This confirms that the per-core attribute number is core_id + 2 and
that the label identifies the core_id rather than the logical CPU
number.

Tested-by: Ximing Zhang <xzhangjr@gmail.com>
Reviewed-by: Ximing Zhang <xzhangjr@gmail.com>
