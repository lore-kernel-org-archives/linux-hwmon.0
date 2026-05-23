Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C6F7397334
	for <linux-hwmon@vger.kernel.org>; Sat, 23 May 2026 13:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779543911; cv=none; b=V7gMYI3v57RbDYBaswRtceUdW6rxhd1e+mVC02YHOSu/SafMgUpMSYLbdUI4eIcJsqwEMR8ZKxQY+VtQX2MYarT2eT3Tuqzq/g8oQH/GK0LdcGePf9WWS7J3zlERa3ehNVtY2uh0DbWhqTh+kcOioxQ+8DFeEhRnJm9qr1s1Jcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779543911; c=relaxed/simple;
	bh=XsbSKl832eIUT2k5f//zaZdR60OWnUGSf33RXjPZLLc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l0ny656ATh6JJTLgjwWMALlk4FKcLaCOtWPiFYB21Up+OG2orTmPv2IZnPS3g2oheY62Vnu5j2s7QPVT++DMZnduFt8KnPxGI5x2s7CtHreXq7vHKxZ35l3zxy6OfagTpXceAIxnt5y645tnlQN3KW/6Rld8VKmnaiXUhxGIeTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D6xpnCEB; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D6xpnCEB"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c8532ba6c95so15901a12.0
        for <linux-hwmon@vger.kernel.org>; Sat, 23 May 2026 06:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779543908; x=1780148708; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XsbSKl832eIUT2k5f//zaZdR60OWnUGSf33RXjPZLLc=;
        b=D6xpnCEBAbHHJ6tTSXix3AvV94xEF62/Gs9seazEEdC0R5sux4ypYBgiQvsBzUhD/F
         /YctelqrCCxn3k1f12ctn2huNoYSYsdhYpxzmOX2EaRyLgiGWdte14Z6+Xj8igUrkc65
         fjEcnSNXC4k3Qc4/hKGHV+UO9GLAbAiDhDT5e5OkPYTcnw1MaaPnv9T5ytFd0bqe4lNE
         356EhkZhIbK439zK0s60cLyBY1pWkTfv6d/sJCeIZSpr/nzdwHqlDW50uv8vptaseiYY
         fF++H7O9tRMhFXCDYVDOueylo3QNcX1By8IRw0aThrRi+71sDrVlyaDMgKwxm0Rjz2dh
         rh4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779543908; x=1780148708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XsbSKl832eIUT2k5f//zaZdR60OWnUGSf33RXjPZLLc=;
        b=sLkZzIHvxbzecaTO1Oq/BmhTsCktb8jt3a6kUKhtS9QaZ4zTpajIyNpc1boRsYw4K1
         VtHZgY/WdA5kKrX3QEoq5u1eofAKXHq5LSOMNqJgjGp1y4K3TYY5AWUsQDKsBqOMPACd
         78dduQEAyrgXIsFTy9yi6htYJHhkhW/10FN/OoQ00nMfBo/O3PQ90SusBU0uE3VU8Ppb
         P00KmZ4ADB4ESCaT30oIYpwVaYuzRUvpKoNSMfjVKw6fH8JM8cMouRCJnY273SjvnWsx
         9nexYbFg3N2FB9RDV2X0v1HwzsQSQEbM7X+/BuuPGkTdktMQ6BJoTZ5Ne/vzGI2Nscem
         1HCw==
X-Gm-Message-State: AOJu0YxfMnDvTzo2kCB9wIZMNCoJkzg8JkmRIf9wUB/Qx9q2deFhV351
	V3ntOHBHKT0hDdbAwkflBe7DveyX7teN746yGxNiseYWXjjFIZAmw5Ac
X-Gm-Gg: Acq92OGz3MJ9G5MUtCz9fOAxY/NCKkSGoDSWMLgrfyvU5deDM9xAEN7oVtLhs//5pjr
	lPQ6SMuLiFPMH0Pva/cO+JwdZn5HhezOpzN95EnujV5OF8DVApVnxEDU0QDxMsIv8Qn958xOGJY
	WZveI8zq2i4VCK9sG81d4r+WsP09l66yDbx19cRmQizttRZEvjrUehxwZLrCqLyRy6mWuM8WYwR
	CiBysA3W9gVJfbs6TbEy/Bd4FKwMfsViLtKUq9mUWRsm3Gf4sR4/uXkZ5iv9Ec/24IUqSdeEIPc
	pq5wbnh7LUjE6cIugfi7OAyNNpbeb5Wx539MB+WCg2LrB+z5vW0KL59fEmSS75ES7Wbll1uGQJ1
	PYrEHXpyTHQh5TBDD9hMZbdAlQKyRPZsi74kbCB9tqlRa3aVd5QFCMBI65Vapniy+1m392XQYAI
	S6rk5cgqoXQqIfnAeCdjOZZ923E5BoXiAeQygc58FDq0/up/WJIFfIsgiO0OvWUmA0fOq8/3iem
	Ck1oSUKJNqF+kflb+AuqS35DTMlrkR1OS7dWPnSthNJkt8BjRsV87d6hQ==
X-Received: by 2002:a05:6a21:3949:b0:3a1:90fd:dcd6 with SMTP id adf61e73a8af0-3b328ed91b4mr7632014637.31.1779543908356;
        Sat, 23 May 2026 06:45:08 -0700 (PDT)
Received: from ERIC039ERIC (123-192-112-211.dynamic.kbronet.com.tw. [123.192.112.211])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85200c3feesm3988518a12.0.2026.05.23.06.45.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2026 06:45:07 -0700 (PDT)
From: Chen-Shi-Hong <eric039eric@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (fschmd) avoid client->dev dereference in watchdog_release
Date: Sat, 23 May 2026 21:44:49 +0800
Message-ID: <20260523134453.685-1-eric039eric@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <6f94fa56-0f60-4d40-a109-aafc0cc46147@roeck-us.net>
References: <6f94fa56-0f60-4d40-a109-aafc0cc46147@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Guenter,

Understood, and thank you for the direct feedback.

I see your point that this patch does not address the real problems in
the driver and only adds noise. I won't pursue this kind of change for
fschmd further.

Thanks,
Chen-Shi-Hong
