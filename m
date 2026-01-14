Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C6363AEF40
	for <linux-hwmon@vger.kernel.org>; Wed, 14 Jan 2026 22:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768428749; cv=none; b=glBqqxIob4WB6Iglx7eM1kjorrVqUZvd/8oCGYMa2X7H/CV7nWdynpgqT6kbHbKK0Kw1VA0eITRTcj59+YmHmaWPh0dTsezxw2FSjE6WxmP/cnGmkvHfrJrJwNd1/kSQdxiKDkGcDOo5pOzw4ruOBt5Id4/Jw1pyrMtuKqSbsAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768428749; c=relaxed/simple;
	bh=B+EeUoOuPx9EoN07TmxXUxT66Ycgj/cFpUNYnSjF3Zk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jtoZtUq4DZmg70R/5qOeJwBR4mRlvRBsg9Lwjq5y3GBNWsV2Zf9o/R2U36mrhM5Arhxg7yS+vas6tdE5gg8CQw5YFqG41gzbU7NT+LmoJUfUnfDUeTCIi+XpwkEzvM01mYfD2ZcWr/Geo3f7+juXXrQregZb/vzZIsYU7T/W2ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=perenite.com; spf=pass smtp.mailfrom=perenite.com; dkim=pass (2048-bit key) header.d=perenite-com.20230601.gappssmtp.com header.i=@perenite-com.20230601.gappssmtp.com header.b=Z/jOFnMN; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=perenite.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perenite.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=perenite-com.20230601.gappssmtp.com header.i=@perenite-com.20230601.gappssmtp.com header.b="Z/jOFnMN"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-47f3b7ef761so1689545e9.0
        for <linux-hwmon@vger.kernel.org>; Wed, 14 Jan 2026 14:12:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=perenite-com.20230601.gappssmtp.com; s=20230601; t=1768428733; x=1769033533; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6PBd6GwtcCIgrv3iBWDU0XhqJMJ/1w2COK3jyTWsvxc=;
        b=Z/jOFnMNEHCiPcZG5QV5Nz7+eGx6A9psDeE1N8wC7TswFWPHDAIaTFahZWvoO0Nesh
         V/E7iHesVVxH9gwXuyKItbphlNayU2HNIo/cCxj5Hn1wKl3sFryUIzNTfOcC2S+VB1Z5
         KDHOvZ2ONJxPEn0yA1hdF3cwvYqUWCuaqDGPaI3yOPWkdbTKf+ox2ADxxMMgV59KZAXg
         HYOz68xLnrGespjVH8aDJmxEXPFeflS8GjNjRB2DyP+vAo9goeWPyrx49a8WNWfRbPOh
         mu99TkooV8vwYbDMgdXstqAdZvLM8u58cSDHqV2eB6OvwTFk+1XHBISa0moMBixkJudg
         eSlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768428733; x=1769033533;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6PBd6GwtcCIgrv3iBWDU0XhqJMJ/1w2COK3jyTWsvxc=;
        b=nDQEBaBYz6NVxZp78ioYbxvLa/HvS6hFI7YHdGXxs8sXiBnYEYrKf+cpq8TKoGaJeE
         j/FYK8jx4NOW7kzwh3VUw2h6RRIa8kzX51ofOr7eOwa0TCu9r4gWKg4mC5S2bIiW2G2X
         i0JcKaj7Srjh6qIW1swIRfjlfgd1FUBgPaVAxMdnoRbt3JghVUdoKvfb2Nt8YWOGEwSq
         l+NNixndr+lPNVkue0NLwnpXDiYVV6CLRsQIqZDp/AsCUgslmjCRsvIwCXkpXhT8Jjwk
         n4HKnCJRbvQziKBHTJMHjdLnYjr2gDRib9BFOmECalfw+X7XRj1MakOikqAdRHKz8I6C
         wy0w==
X-Gm-Message-State: AOJu0Yz6k4pd+LCEiPPxE9MXF/gqwEVAKUSy/yjGf2nMiI6pZIRxmolG
	Y1AZjww+BoO0TKqG6h6ytkdCv5qKX7idiOK0zyiTqTeJCLI6Klgq4oBKmT1N6CpqRiWNQR/hKpJ
	pNs0=
X-Gm-Gg: AY/fxX5QOYpBEHi/m+FWycMVSfRbzIE2jUKWzI1zQHo9MahiIUUuKXtd+iUFBIfTcL+
	aMBcn1Y/HTqoEBhNcKlsaZmmSpXbgLVyHOSwkdP27gKitiTx+xzOmKwr2oO49A13s1zu0JcNs6v
	wkTz7KHVW3/dyqJRzRDUwXxVFibj/yr95u4mr7a7QPHwHbnmfjPcNZ+vO7zT47ltW9g/X+vUfN8
	XqATlIM5NHEjk49K0oD5QE1PJxn4sFx/YmB0bIcWspcOoxk896y0o6C0ZRjppEObAQlDyTqOfGs
	t8ym7T2lI1bkjvYYC1Ohcf0pGmUq/HfqRMOaeMWJUqG6f5Qk1LgkBl1gNLK+nJDXHHO0QNHTJCk
	r7wvhZOU2rDKXTmrVxCtz19fZs/GRil3+swQZY9v/iEaxNzOqy2z5w161z4hMWNuPkHRjV11flR
	uji2EHFZ7qG/di6nL29TCaCjA3g/QQwOmMT5YCIzC/zYYLW5PSWvoNXtkiYetOw/8hZMStj3K6U
	F0bnmREM8f+ZXNX0A==
X-Received: by 2002:a05:600c:45c8:b0:477:9a28:b0a4 with SMTP id 5b1f17b1804b1-47ee3071491mr51525475e9.0.1768428733153;
        Wed, 14 Jan 2026 14:12:13 -0800 (PST)
Received: from localhost.localdomain (217-128-226-200.ftth.fr.orangecustomers.net. [217.128.226.200])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47f941a670dsm3098195e9.5.2026.01.14.14.12.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 14 Jan 2026 14:12:12 -0800 (PST)
From: "benoit.masson" <yahoo@perenite.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	"benoit.masson" <yahoo@perenite.com>
Subject: [PATCH v4 0/5] hwmon: it87: add IT8613E support
Date: Wed, 14 Jan 2026 23:12:05 +0100
Message-ID: <20260114221210.98071-1-yahoo@perenite.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series ports IT8613E support from the out-of-tree it87 fork into
upstream in small steps. It first adds per-chip resource metadata and
new PWM temp map handling, then expands temp limits/offsets, adds
IT8613E detection, and finally the IT8613E configuration.

Tested on: IT8613E, MEDION B660H7-M20 BIOS motherboard.

Builds: each patch builds cleanly with W=1
(the only checkpatch warnings are the kept symbolic perms
S_IRUGO | S_IWUSR / S_IRUGO).

Changes in v4:
- Drop FEAT_TEMP_OFFSET and has_temp_offset(); rely on num_temp_offset.
- Initialize num_temp_limit/offset/map for all chips, no runtime defaults.
- Use per-chip reg_pwm pointer instead of type checks; fixes compile error.
- Keep IT8613E feature set aligned with the above (no FEAT_TEMP_OFFSET).

benoit.masson (5):
  hwmon: it87: describe per-chip temperature resources
  hwmon: it87: prepare for extended PWM temp maps
  hwmon: it87: expose additional temperature limits
  hwmon: it87: add IT8613E identification
  hwmon: it87: add IT8613E configuration

 Documentation/hwmon/it87.rst |   8 +
 drivers/hwmon/it87.c         | 447 ++++++++++++++++++++++++++++-------
 2 files changed, 376 insertions(+), 79 deletions(-)

-- 
2.50.1 (Apple Git-155)
