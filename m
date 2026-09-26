Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D849237DAD7
	for <linux-hwmon@vger.kernel.org>; Sat, 26 Sep 2026 21:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790457890; cv=none; b=JH3TMV3/KaKGyk58kuzSCYUEMR2QnhMLBjTpQFGd2m6+sSBwYxIhNmXul+YumgGz4wlfI0WQ9N85NSIMvY18qqL/5heg32wM1EMOFaPpDPshW63yevM6iYfByCpryIH4dhdDQS0ZHJ8906ZR9VKvrge9P2vg7ZO6sANEfr56Lnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790457890; c=relaxed/simple;
	bh=mMpiwkJ7x769qDONF2ma0sDFU8snvxhkEGKK5o5Vlts=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dUL18he7hldeKMZEjuAHaotWJ147K43OzO+hnRk9cBNrlWPoGB4DXueiSleGjGo9GDrC/kUO2gNznPNcwkIZBpO9SlTOgRjYjHvuP8baqf/h4SsE5sI5/mWZvg4//d7rEEa0oA2aTyw2tVfXvt8tM6wSdV10op0/W6F4+8CWu6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dU8Hlxg9; arc=none smtp.client-ip=74.125.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dU8Hlxg9"
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-343697ad877so30656eec.1
        for <linux-hwmon@vger.kernel.org>; Sat, 26 Sep 2026 14:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790457883; x=1791062683; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mMpiwkJ7x769qDONF2ma0sDFU8snvxhkEGKK5o5Vlts=;
        b=dU8Hlxg949VcKbM23Ue6b9FQ47gOFgoI1/6n2aH1DSG9ZPMJKPPebOGetZUYUyWMXl
         eLQvLZEdEURqJuPWem4m4OG0qjngt9b3jw+y5xc1w4ik5gPOBYAXofzNZ56Th2eq+mVT
         8VITrtOtIn3GPnACYpos8Ra01JysKWj8OXI9TFN6/is52D5yReyJ97w/HkXBvp+0rPfB
         DLcaTL7aXMHi2HSGp3kHsiBr4r0s0h9UNiK1Vmneghn4RPpr4lxR1/b9zMfoPjiknyzO
         NbNSVwlwP0OxNE+4uyHYYsEStIHh5/BloV2CmBVJ6XPLYhlOyRpUhodmsNDyVmOllvoD
         ArQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790457883; x=1791062683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mMpiwkJ7x769qDONF2ma0sDFU8snvxhkEGKK5o5Vlts=;
        b=OGVU5Kao3mL90CVDgl9zDAKiodMcsJeTZY/d7McHHGNsb+C4HZgeHcfjXRwg77lNa0
         rbthe2il9DvsUFgm7fM7I4IeTh0t3ZdRJJ8UuLMxXJ41Zf1sJu+u+W7aFxAWXkz1qwMn
         s34q+ztwzGCGV72FPHAclz7PUlC65VdzskGRWWzsu239QO/41sUmmGCoUbpC8LxmBx/D
         54RPXmLteowN1YiJBL4tKHX5rskLhVvB77yQnaey3fP/QqEf8ekHJOZZCmxR/fTpC7ZO
         8Icw/AsIcHxtUyAHdhHViU8zgWVzkeWgHWNA0keuj9i13WhudiWl2TQzFTp28vzxdlw4
         2g6Q==
X-Forwarded-Encrypted: i=1; AKwUvBxljJfFwhE2WQNr+q658nc0QvA1NREmyy4rPbKCsORfIXOObQ0JhmS7GuOxnVlgavmj+4GXrF6ckcoTsg==@vger.kernel.org
X-Gm-Message-State: AFuF++kC6uEe3r0ifXGS8DdUUdMWgOVxnjOtkkeoaBBuTTaaghA7zVjg
	rDKG2h9kV4uzpGH9yfr3xBonX5CM77c6HA/34hvab3CQoMhiDkP+q88GVITA5Mt3
X-Gm-Gg: AYBFou2v7Hts90cnQwktVRtDwtBcztEFRW/tHugu2TDweup9Qs0C6cWzaWip2T9WiAM
	OzwXXYrGF6PDa25M+ZTz052m1HesE+6SdZb36StJLteJWt6/ZSTDi+RvVyLiLtJgG624VzR7NKt
	uhaADfHEajorzCXZJbCvlTxH013CJntd+/TYDpd17yBQnfc2PYWkcm2iQzDoSGb/hVzLz4HJcW0
	HEp1b66NpsHYE9l+Zjwtdjmt7wQQSerKczFiICmuC6p9aj5eQEBdqGCwLSbCb7uPWrk1/Mm0Pfb
	IG5hEHQ1TkHem3FdNpnfzFZhDsqjERpXfEELd9v1jBOCatQVcFZvwYOYfNMB3AN86amblBIJgj6
	8lKDTRUlu2zf3TzJ9xbB+YNRKqwA6jg50Fx/q/WLEX76CHy0zWx2eZ0JmlrW3mYZourXW96zmFU
	uVRfzsiEQckMQvkgJX1SCT1483k1Y6xdlU1jGcRiuZDp6g6kKmL5lN6PDRoE92NxNfsJVdsJ1wH
	8rBg/hv4Q6pGW2fIaAIzcCakM5KD8b7UmufNuMP4pUhkx0tqfxd/daOZlvOYQsDehZJHHvt84Ue
	DcKDA6WjBrWChGV+N5pe4wdQxud/
X-Received: by 2002:a05:701b:418f:20b0:144:fd17:3b21 with SMTP id a92af1059eb24-146cb50233emr7494022c88.0.1790457883035;
        Sat, 26 Sep 2026 14:24:43 -0700 (PDT)
Received: from cachyos-aura ([45.112.148.98])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145acc47ab8sm17334170c88.6.2026.09.26.14.24.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 14:24:42 -0700 (PDT)
From: Navon John Lukose <navonjohnlukose@gmail.com>
To: Sergio Melas <sergiomelas@gmail.com>
Cc: Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (yogafan) Fix fan paths for Yoga Pro 7 14IAH10
Date: Sun, 27 Sep 2026 02:54:37 +0530
Message-ID: <20260926212437.3479814-1-navonjohnlukose@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260913214713.205208-1-navonjohnlukose@gmail.com>
References: <20260913214713.205208-1-navonjohnlukose@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Sergio,

Patchwork has this one as needs-ack, so could you take a look? The
current 14IAH10 entry points at a FANS object this machine doesn't
have, so the driver returns -ENODEV without any message.
