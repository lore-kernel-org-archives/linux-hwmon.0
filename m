Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 912342DC32E
	for <linux-hwmon@vger.kernel.org>; Sun, 12 Jul 2026 11:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783854423; cv=none; b=FfxIPkrEKMt17yBP/RE9NH0tnENE9cGwLj6tCQSLyLXmzpKyX2oUWsranvtBU3Cxk1Go+MJyI1gq6w/eYnH0WnMWxR1VIi9U+eJYq9madhd4J+QZUZzAy+5pwk6WbCCbz19Jz8ovM8Z+8GCLnrSNcXKZJn4I8HBzO0pI5P/kE1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783854423; c=relaxed/simple;
	bh=AlZ05uTZUXH/fqs9BL19q4mGMtoJAy/riaR42ZHkgUE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Y/6rBxfSpfrqa/p2icQyxoWLxkvNNWjxjvCNUWc0MDF8tP/Y0FWYr2ZcW8Ab+zCfQoiOg0Xqr+a+p756N3mB5TpeCgmzLmRIWWeTomFzVoQCL/bNAX1yMqgq4U5ISTiyF8QZM3Y/sS+Gw1WjyDkAS9a6fWQFT+ayqgxm/LboQ3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DbFuLfxX; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DbFuLfxX"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-493ec555a26so15304625e9.0
        for <linux-hwmon@vger.kernel.org>; Sun, 12 Jul 2026 04:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783854420; x=1784459220; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mnvdRuf2JEpD7AoVpCEEtj69+MUWKzljtq5D+5MeI1M=;
        b=DbFuLfxXM1dZf+ia6BqjL5ozzRgfpW+TguAUtFeYdtiZwmkWgTW5Eb1LDQ1tT501It
         uuoGpCZ1r530njCm28UTCo6alKMPXn0c+4ottbi7A2cbpNLHv4ebQFrwazsiOkws/Hrw
         x5TXXIOuV0eMmfLfXulG0HrEsIlG5t/qni4F9LEgPSJ/IkYKevlFF6QHaVE60oX6ggJo
         cFxJrDzO6B0jPLS15D5l6IHPhZnhv0aa9Azjo/pqUgUzunY6QBLfQcubmlTZYvL5lAIg
         c4BUmHbahyOsyegz+HsgC1mbeQUeGmQnhIqtgqrAa1ybL40Gyu1C/ZA+yDiER44U8Snp
         Y5XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783854420; x=1784459220;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mnvdRuf2JEpD7AoVpCEEtj69+MUWKzljtq5D+5MeI1M=;
        b=EmQG4qMJnQRZ0rg3DhK3WaIoJKM2FPQERSulKcew4VApeW3ogDyKdlM7YW7QZ73jPG
         ejxx4sIrjjDaVPckZhPqg9vfYJGVzjacMb5oDtNKO0KCfwIygSgmmtDq5G89kf+IkZii
         G5XxkqT93pZrwu/pi0brk1x90T9EAC8eY0rc4+IKuMuFzr89sEw6Gu3Hsxag7r4KC2lw
         DIZ1V9vWUJf9iUJ9dNgjQnJInpUyjPA3HszznMOmJacNZJ7zbmyYEGGehd98yLPgTi3s
         VGDRqxz93TwKBiEbQgQERlfg/2iHt4XU5RP8MWf1VF9B1xcGmCWELRtRANyRz+0L0GOs
         WxCQ==
X-Forwarded-Encrypted: i=1; AHgh+RoE6eMX+9nPIUFyiRoBmBkXa7uE4IkpjmGEdKsAvBJ3YSsJA0Gn9nAuPB/odrqrqqH/yuN2clZ5Ob8TCQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6Wfn9hAGCps3I856Kv5v2THDJrxKlyypvNmIdFQZxIxke04Ek
	f1y2g2ioKbhv+GbQJbRhAlMWArwp+5GGNWhEToE1zokKQB9PzeiQ9X2c
X-Gm-Gg: AfdE7cnhnPy7emKglzPLoGQ1t4py39/YfinUJb3TF4RR1W2+0XmzV63sKTIu6CVEQpJ
	HRXEUIBRqNGV3tO7BGG5ztrhrIEKWiOKwjIUmitCRKtVvhtUg2vy/df76NkDNEdxTi6hVy6v8bi
	Dg+qxGNBc6BR/piY3K7gYA/JnQt90TYL1PKwpiwHSsJb+Iq3i4syvcc8m1TBjPLmn5T29XYXAhP
	YLwxOO/P+wC6o7Jjflf9zzTwxTg0H9OWhy9kADrE0gmp78zEKRBIcAdO/omVg28V6HEK10vDq7X
	tqxcogQVeuVSA5LoA+LS4bkUrbAsoiukXgfTjgLOmr+OqHMU32V5Eb3PJRFR+qy4pElsAL9v9PH
	m/Mc0mLd5TyuK3+yhoEuDRTjqQunrEizmqYQvcFJfQpD4731p/+VXDaG9XwKr5cW4KQHs2G2U+K
	43VuOV8ZsPCOwAwt4vQd9UsxEYV5u44oAtEclbYNLWHA==
X-Received: by 2002:a05:600c:c16a:b0:493:f278:ba2f with SMTP id 5b1f17b1804b1-49400c34e9cmr10303315e9.9.1783854419909;
        Sun, 12 Jul 2026 04:06:59 -0700 (PDT)
Received: from puma.museclub.art ([2a00:6020:b326:d300:d19:a765:d8d7:bedc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6f3dcdsm273637625e9.3.2026.07.12.04.06.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 04:06:59 -0700 (PDT)
From: Eugene Shalygin <eugene.shalygin@gmail.com>
To: eugene.shalygin@gmail.com
Cc: Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org (open list:ASUS EC HARDWARE MONITOR DRIVER),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 0/1] hwmon: (asus-ec-sensors) fix EC read intervals
Date: Sun, 12 Jul 2026 13:05:02 +0200
Message-ID: <20260712110650.1240071-1-eugene.shalygin@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v2: revret updating `state->next_update` before the update_ec_sensors()
call.

Eugene Shalygin (1):
  hwmon: (asus-ec-sensors) fix EC read intervals

 drivers/hwmon/asus-ec-sensors.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

-- 
2.55.0

