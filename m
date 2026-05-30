Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B4D4359A81
	for <linux-hwmon@vger.kernel.org>; Sat, 30 May 2026 22:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780179292; cv=none; b=s+OvoBSWhLPCW3gLbTibeAJTWY4Y81d42EFZj0rKoZdvJpn8nvG/Oqw4GFNc+g6u6Bb9mQnvLrfTNLYnoU2E1rrFQTaYYP8SLMusD0XOEsCOZO2S6+HNOfEm7L6Dvzv1bVLd6H2t4pbzY54g/++J+mYxMVOsIKZA8wvPIUCM/rM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780179292; c=relaxed/simple;
	bh=rptNwOBy97IjpvMfTzcZMHWn1PDQZ21ALeCIBswmd2g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uSG5TWR81eB3LiWYXGUd6jn7Ho+wE18d5EF3ms82K7o1brUYGpbJpsH3AuDClbtB+CtEBFciI1uLPoOoIeNGt2TP6G5BQuzlWQNfw03OOg+zakFVQqVCcT2uifympQk0Rc2ZB3urxfUKN+2vQ3oNjIWrHFO7OqMKkh+93V9OtSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eHbU0P+3; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eHbU0P+3"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-36b9d265355so1560192a91.2
        for <linux-hwmon@vger.kernel.org>; Sat, 30 May 2026 15:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780179290; x=1780784090; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XI0ZXNNZDfD2j4wu7sWa01N94xQqMPYIfDcGj6GoLCo=;
        b=eHbU0P+3WhCHzCOLO2Uy9j/rLpsZpFwtlrX7E6MGqgirXKEwDKmSGeuOt+7nvo6BX0
         arKKQJREPGUfPpp1w6ZxJ8iQDxM5ooPfNTSoUqIOdchbPzV9jlW0iSkI503IHBR3d/ol
         Pjm0jLndaV22vPMcvqH6bwKT+CVn3yDEOmQ2Yx+P45A7UmXxEsbQSPhEFf+toT8t/90Q
         v70pTRrepbuDXqxM8TDDhhk+U+PhKb1WJ75D3XL6UF4dgKOpBl5+1VCgbwxdnFiMVouK
         MMy/uVcJin7sxCv2doLN7hmDkUGJnvSTWTeVRftDsCOW2Qb0P7ej5v1zQ6MAmCjeWMPT
         Y9jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780179290; x=1780784090;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XI0ZXNNZDfD2j4wu7sWa01N94xQqMPYIfDcGj6GoLCo=;
        b=LjaaZXvHhZgopOGyvohb01nXOafzPPoLR704BhOjxu53IH1AlFkV4EPuXucGn6f0im
         aEeWhdy/tEqjdC4kRvJyou8p++uxKgYCbA2dm7iuvQEjqG0bJR8Rjmqa8bVzA78Y1xKq
         F2qYzvvypF0gmdpH994I8iKsN8NNgxKIjqYodD724aFNAEcvJvsT39D8nJb9UJ79vY/D
         0o3RVdu8TcpiWullHod6ExYXW432iZpWMD/XQjFe93MrDeleRCugzCJpYwHuv1RyIw+t
         9qAAHAwX6ygxnilCSEiPB3cZ84/2WIA2tW/KEPYPMgQ9fGk6E931C3U0ojUUMIYzUb2H
         3vZw==
X-Forwarded-Encrypted: i=1; AFNElJ9Yb/sqvQxGcWhf61NG+qGMXbUS1awR9LlRCNAQBnG0JUXHMtUroKYUxg8Up93QzckuOc7SrpFGP4ZAyA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyUnDSgk69FgJMLv/gxAVRHlCt02zxtuF/TdUGDqAV+G7nEnZAS
	ZHqvpadTBpi6ykzWBbIt4dUhc0XtSFJJjz5rUSxmp2BrjUrdike9qTya
X-Gm-Gg: Acq92OEySnW4HyFc0LAhK+eBJWBPSYn4z5iUuph3xB+hhlDFKA0/FlaSpbArT8D3J61
	YKqWaDBsimMHwpLOKraw/mFb2ZnMWtqqiMqnGGHNeV6x6d4QEpC9Ui6cDAQQgdVkB+AbBq5YDUq
	0kbn3h8O3w0lhXMO8WZwu3TXCiiTCOGOvmSuAXYn+CZ7lGZx0RxMdetcY6Flt/BNnMTk78FneND
	D0t/KLIwRM2VTtEO9dC84F/AYYnXDjnoYC+D9E0A/ya1cTuciUHqE6HiqQkkMXcurKt9CCZG6eo
	hwV7KcfsC29eGk1zPm9rRKHXN4uZQh1H5Shh5Aq+QZsXqJzCJrTUs1MD1koS6pKBARiQPb6o7eM
	ew6AqZtv9cyZFfQXN8q3ywD/PM+6FMZQgR2EsjHi7LYtaw4q1dawM8CFZq73MAw7A7w5QlDPsk1
	Ypqrfx+qyC9HbBjmwgO6xodEQRw6EIZqg61dYUHv/TvqrqCzyPAI556n7V581mJFAWz14aX98YD
	xE+
X-Received: by 2002:a05:6a21:6e8e:b0:3b3:2703:123 with SMTP id adf61e73a8af0-3b427fe5105mr5462364637.45.1780179290361;
        Sat, 30 May 2026 15:14:50 -0700 (PDT)
Received: from Ubuntu.. ([49.37.171.82])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85771a9299sm5515226a12.7.2026.05.30.15.14.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 15:14:49 -0700 (PDT)
From: Manish Baing <manishbaing2789@gmail.com>
To: linux@roeck-us.net,
	jdelvare@suse.com,
	nuno.sa@analog.com
Cc: abdurrahman@nexthop.ai,
	bartosz.golaszewski@oss.qualcomm.com,
	linusw@kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	manishbaing2789@gmail.com
Subject: [PATCH 7/7] hwmon: it87: Use zero-initialization instead of memset()
Date: Sat, 30 May 2026 22:13:52 +0000
Message-ID: <20260530221353.159461-8-manishbaing2789@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260530221353.159461-1-manishbaing2789@gmail.com>
References: <20260530221353.159461-1-manishbaing2789@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reduce the scope of 'struct it87_sio_data sio_data' by moving it inside
the for-loop and using empty brace initialization (= {}). This ensures
the structure is safely zero-initialized on every iteration, allowing for
the safe removal of the explicit memset() call.

No functional change.

Signed-off-by: Manish Baing <manishbaing2789@gmail.com>
---
 drivers/hwmon/it87.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
index 5fd310662ee4..f3f8d835ff92 100644
--- a/drivers/hwmon/it87.c
+++ b/drivers/hwmon/it87.c
@@ -3777,7 +3777,6 @@ MODULE_DEVICE_TABLE(dmi, it87_dmi_table);
 static int __init sm_it87_init(void)
 {
 	int sioaddr[2] = { REG_2E, REG_4E };
-	struct it87_sio_data sio_data;
 	unsigned short isa_address[2];
 	bool found = false;
 	int i, err;
@@ -3789,7 +3788,7 @@ static int __init sm_it87_init(void)
 	dmi_check_system(it87_dmi_table);
 
 	for (i = 0; i < ARRAY_SIZE(sioaddr); i++) {
-		memset(&sio_data, 0, sizeof(struct it87_sio_data));
+		struct it87_sio_data sio_data = { };
 		isa_address[i] = 0;
 		err = it87_find(sioaddr[i], &isa_address[i], &sio_data, i);
 		if (err || isa_address[i] == 0)
-- 
2.43.0

