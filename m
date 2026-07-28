Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A86391E51
	for <linux-hwmon@vger.kernel.org>; Tue, 28 Jul 2026 16:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785257764; cv=pass; b=HlNuFXb02N5xW9Ckb6QlMXta3C1TtrZtYqJMaih0907kgk9zPAHme3iqIO6PYK2FhfdnqZCXpZKY6eXflcFgBNG6sL/hrVqRU36CvxRfLiC6li5nOwl80/avdxAWI22EnZ0Y+H3Hs0nXgNzV/zNMgjaox9NVNrSIuqnAPrlYxFs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785257764; c=relaxed/simple;
	bh=ORQ3uuUcwYgox8e5bvbPCBzj72M+unOHD6ZV+zlLAVk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R89uqf9zwp8s3PaXl3txFMBJ5YXCccaPMdhnI8ldohEE/mGNXV+IGpvWHF2GfQp7Ut8ubC95GJpB0Xm0eilAXf7M07KO8X+ZfglvpWtqPTCJyrKUVdNrQY+O9B3UiTmQl/wbMR8JfPRCxQUDhKWuyOAIUG0JCLvAFaMTXfYr3/E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=frame.work; spf=pass smtp.mailfrom=frame.work; dkim=pass (2048-bit key) header.d=frame.work header.i=@frame.work header.b=eodKMkWm; arc=pass smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=frame.work
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=frame.work
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=frame.work header.i=@frame.work header.b="eodKMkWm"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-81f36179d72so1376117b3.2
        for <linux-hwmon@vger.kernel.org>; Tue, 28 Jul 2026 09:56:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785257762; cv=none;
        d=google.com; s=arc-20260327;
        b=BFWXX0WkIA0JWCAci2acrXwKl9lMlIo2FbHNaOmoBQocVPwTJaFuxaIIXMGv6JZyQi
         cWU26qHGt2Ui1mmYgOtq1IqQIh58ByhtQEATvaKHwZrLUSUvo6MuHF82NCZgQJqinQdT
         CyBhRwwVDs9vbHWGELUEJNa+Uwe7w7bt9OCXgK/4Ohr1ccRHGXeGGZib7JX5vVQCoBU+
         hoca1Snw/bhhWpBxjIKUENDIJgHFSh5pBJPEr0jXJT7ZSLRJVOq00OZCPvwZmMpm5Jsm
         V/GFCAhERwElSwW38mPnXcvwmgs/YoObJJHQLSSRb9OOpXaoEDrd4VzaFrlw3DIaro68
         Hzzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ORQ3uuUcwYgox8e5bvbPCBzj72M+unOHD6ZV+zlLAVk=;
        fh=arLLucyCBRGJpQ0DUoYvzZKaMI6BZFIk2cLcNs1OX2U=;
        b=XY4wGLuSlNokpyX+T4vDO6JSX4zYTPneYNKE9t7v7wBJ6KKGAXR3MzJ7KpTenKHBWd
         UKfdyRvXMhhiJGCM9YY4V34RtMlaNYUQIxVo9JV0MGdHRm0X8UL/VTC6p/FImN5S4IEI
         7UQXHeYy7VWtA45W/v9FAPttcfeKb34UuprVoRK2g0WcN7ymDOML05y2PZt90S8K8E0E
         J1TIJajwwZXsp8tGexMUM4M3D/BR5A68Dk6YNsaLtWuI32MWvi4xLk+GclohyLY97u14
         hpzncifi+E0rX+GRBZV5Jazhs02jX9DSMp0xUXi6tvFQxIg8pi9w6RRp2pf81MChzBuK
         QTug==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=frame.work; s=google; t=1785257762; x=1785862562; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ORQ3uuUcwYgox8e5bvbPCBzj72M+unOHD6ZV+zlLAVk=;
        b=eodKMkWmM1yU2NN/mZcyKfpbkBJLVs2s4oS10REbI7DP8a8rOkbUCyxnIEFXK43wJN
         dggnRIh43OHINzxEn9crKGIpXWlWdE+8hbVRVQgYHzj1j1tkkRV2pM6M9ljgLNL66bL+
         75rHqnw+zVWDmQhlda1JAB03wBF/b47ycW3Lzqvqc/QcdSLUxEH5gZcnO1Nd9ff5qbAG
         2KJV2VvUopUqL0Cm7TYIdPHagUV1TLggft8MKmhkxCUYAlvspHK/kB699aGm1DiLYJyP
         Xwy3FbW0yWrc2udj3eniF/F+Hgtfm1O51HNEQPYzMdpG5t3HwQIJWEvsNrEMyiFra7fO
         tSBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785257762; x=1785862562;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ORQ3uuUcwYgox8e5bvbPCBzj72M+unOHD6ZV+zlLAVk=;
        b=HM+duHQ4QxqFyr6TWNIltuH6Vj9yXjYGvcfYEZdr71Rnqh40LeJMnSVDhfqMVrEPYV
         J9jgQLPwLWNspEZMLZNd2COSG8ZKBJozsU2TClVKyJtifD9Ylq3FAoF4uAfpJhzpsTjj
         W4JV0EQgCo0gHUOFV2ayXboNI6wXeCU1wSlQrdSU60aEgyf/fv0qoVSDuEVsK6U29XZ8
         GTCnRxtIgQ3e8hiLtKNCiSsb5VNyqd9kG3mYHRASCoV3VlJfsYU3P+cvYF+NuEV4U0Wu
         jDmC4JBHsXIdQERY1LlBvEkjxhewJXlNee5RGG3kO3poF0RunLRpr4/Xla4rzuRPcaQL
         9AiA==
X-Forwarded-Encrypted: i=1; AHgh+RrwUzdQeoXn88HEOmM1e61o0McYBqMa2wI1PFSI25AVukdiShefOfjDtM3GEagD6oIKIMAv+qjfHJtIJQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0W7rz1qEZvfm06rEGHexiu5CaV5JWx4/HoOKbkGMtEYxy/0fF
	VOqO1DvnA1QnSxRVVeFgezJdalencZ0QSIay6U2bf+9YjsquRxISLAHbxA7id0K9C0KKDwc7xmP
	4ANoIULSHGdUjxl5GQMIX3fsJktkgObW6fa98p9Cg0Q==
X-Gm-Gg: AR+sD11HZPVJOVp2ntfMbPdsb5kHvSxU2n9ndCE95pEDAUDOzNv61EnbmWSGTh4Sssz
	w+DYB6xxgfS1PwArgnSG+q2ySV1XrEwEmVHXYowaiB75cAyvPbiaDUzcpZko0WY3FPuh07O1Cq2
	U/iKEfdTlnieJlm+AbJdZYUhtKzOJ2M/wZhOfEiy3pU0jK/FniLi2rS2pJgNXN6Ekb8U/mzvn86
	ypvtxmY74cyj4BWgarsLYj+GZhn4wN/E7EOg0FTkrhbQexw/0sSFjDngr1G8EHG6pIDsk7On7u5
	ba/aVwNaG1xQ88CJaCZ6px+5HETU/wS6jn3ybH4Ubv7pOIS7TwzD2N+BhdXHZ5UoCJI0pnocLzj
	pNQ==
X-Received: by 2002:a05:690e:4889:10b0:668:8b5b:75a7 with SMTP id
 956f58d0204a3-6690549bf89mr827910d50.11.1785257761849; Tue, 28 Jul 2026
 09:56:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260729-crosec-hwmon-warn-default-v1-1-d1eb39656a60@frame.work> <67a9f9ef-3007-4f62-9af7-7604a8771f4f@roeck-us.net>
In-Reply-To: <67a9f9ef-3007-4f62-9af7-7604a8771f4f@roeck-us.net>
From: Daniel Schaefer <dhs@frame.work>
Date: Wed, 29 Jul 2026 00:55:25 +0800
X-Gm-Features: AUfX_mxrBw-u-dfHxP7yXeMeYxkfFaS7xYAfoz_HESKDoKHXDSHmOYKJmPVvyAM
Message-ID: <CAAjcXz641LW9JCrz_kNDBCw7kZPt0H5wyvk_qRoFgT-9xe0b+A@mail.gmail.com>
Subject: Re: [PATCH] hwmon: (cros_ec): Hide unconfigured temperature thresholds
To: Guenter Roeck <linux@roeck-us.net>
Cc: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	chrome-platform@lists.linux.dev, linux-hwmon@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Tzung-Bi Shih <tzungbi@kernel.org>, linux@frame.work
Content-Type: text/plain; charset="UTF-8"

> Is the limit just not configured or indeed unsupported ?
>
> If it is indeed unsupported, this is ok. If it is supported but not set
> (and it is configurable), this is not ok and will require a better solution.

This driver only supports reading thresholds, not setting them.
So I would say not configured and not supported are equivalent.

In our case if there is nothing useful for the EC to do with a
specific threshold (e.g. warn), then we don't set it.
I think chromebooks send a notification to a userspace daemon on warn threshold,
but we don't have that, so we don't do anything and don't set a threshold.
