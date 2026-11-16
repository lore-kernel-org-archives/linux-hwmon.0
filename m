Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794852603;
	b=dw+dgLm9Co7xzAMRD9ZVZFCdn5bUlTSTS5ADVvZMwrJKTIP+6Z7V5KLQgi/nh778ziqx
	 QVnRj3t45Xz+0qRjT5uDF+b+4jgW7jB0GLelyg2aB9SYXygQtBJ2fOGxsvVEI6o2nvSCQ
	 U6jsyFZ9S9hKFk7nTn+w0pWC4A81iMAHem/IS00SwF65TbJZMkfH3iVyQ77hpPxdZVyai
	 46FPeL94RMTkakyhNRxgEYJDhwB5bDhxAUsvqr4SDJbZiXqLPVldkDExqHj1eo82g0JhK
	 CGGTCiKNlZE52Dq3drhqZDz1+dQLmYpLo6XuGSxsJAlQiHi4b1pfqjJeqesPzW/JPHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794852603;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 X-Developer-Signature:X-Developer-Key:Content-Transfer-Encoding;
	bh=cBVf5mMNM+rUUCpU78C1Na+O2C5lEgI6gSvRU8cE5Mg=;
	b=QfsP6ROqw+jeHCnBLIz+8keASFGbFpUw66r4rXZlYkeBUdf//fgKiGNHS14eIuWSy1Dm
	 2QAfdNQJbWY/oP4hL+hHQkXV9/ViDqKvLFF+TUgieubTjAnAGT8w9WlhejHw68B5qUsDY
	 bDSohEjTmm5Zm83xvlWULh43pvSteQAxs8ZwAqjx2dy5Hnui74ZuAcF4Yf/qxeNeV3Ron
	 4DkgVH5Utc7U0DzGmrTO3CbA3GLAfJDZqLA/7AewwJlDPDfS6JjNsXY2YTb0/JAqQ7q/K
	 A1qeQXkPvntD/mIyGmp5bOgLQpQN6S1ZLnvUziocF4VO6EV/f708fXsfqMo+UPU5+yA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=n9F9PBR3;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90517606A323
	for <linux-hwmon@vger.kernel.org>; Mon, 16 Nov 2026 18:10:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90517606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=n9F9PBR3
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so37847665e9.3
        for <linux-hwmon@vger.kernel.org>; Mon, 16 Nov 2026 10:10:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794852601; x=1795457401; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cBVf5mMNM+rUUCpU78C1Na+O2C5lEgI6gSvRU8cE5Mg=;
        b=n9F9PBR3PlXR2GhSMuifM2drQ6Yok4I50iIDZ8542xFZ/MY2OYK2HQdoe/0hJBFHIv
         XWbNqVphQtX+2WYMsU/gkeiK5fJd6GTEjAA39ZzDueQbyt1INMYZl5p0eykt2+dF7GN6
         NGBMRHVOUWa+cZaKahXSM1WxuRUYM8GPY/rXzwA24Fa3KtGzM3ORN3aKoPLd5Bqe/yL5
         OVDywTx7M7oyyYH2gQ7TLycC0yiWkHkgiBiRJCuPIvlhKPyQCz0/iGt/KP19PwIQz8oC
         Twee+FF5pXa0tJpQxAL5HSanM2nYND6qIgHRzyKjGYC33MwX+xt565hyA/9nBkUiMvxt
         oGBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794852601; x=1795457401;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cBVf5mMNM+rUUCpU78C1Na+O2C5lEgI6gSvRU8cE5Mg=;
        b=O5kCpsR230+z57/H/G9me/1zWrURwElRGRYmuVN4+xdNMfpual98xuc/V7SGi8S7il
         rbR93FIv3d3MeoOHt5TUnz0gKJPBQ5D4PjGlk+DgTHLsU7zWQ/caxhIK+s19CHsgP+r+
         vMuVQPCahWQcFUcdFaRNj0P0Vs46PqUdXLmt8MRh8VYnyLiwbR6CtnFd+LEnoIF8fUJd
         y+K262yeH6gcfI/BPdoNU4OYALi90+RA43YC5CHEqH4hPqSfmcvtk7KhrCrGKz2kx7du
         W+shDA+5pXzVFjBHFMyYNkg4u99IM0vz8iH8fVoY9p2ux2Qmdyzxx0lsrSQaf+AyztpJ
         o8mw==
X-Gm-Message-State: APuU4Z+mzO8rej7dA/FFbZtLpFzO+IKIMTe1wjRiIS96EC0j6FmHrQMP
	kGPyc1ptGX7f552AFuX0+chiUYIdDsypGCzXAYAKPqBFYXxmLPeKHcF7ww/hqMihrM8FkW1eaEl
	xxusg
X-Gm-Gg: AYBFou0LKyWal0+labdA6kIBkYTMjPI8NtjR4juyZqZl9Yj2baA9fqq8MO4SImO2GzS
	DdGopXBIoSyYJ27PmsBCpmz9jVUWMs+5PAIcgMEQuMkrdur+t4D4YaiqNRQG++8hZTHZmT+ekG+
	0XNctBoM3pKw0i2nb1nFRnXDqJMTbrZJV6iTbT8/MKD42khYAzmo22WTVgSEM8KY+DJEU72y6gm
	RLz/39RkOeRau3P8lcwja/CLMSxgSGQQoDUVxtKe3AS6B6Aid6w7+lrGDXcgDKGzPKVxolAMMzq
	W8LiZkdkij9mVqTEuRs6En0v5b8X+bdOg9M8+p5Lqtu2v1zvThub3QaA8SnPM0SO7c5AP61tQR2
	GjTqTDTJbEbAppA1MzZHGQ1ocUc70D+zM9LG1xDwMyJJt/Y+aHvse+nBFVd0V+ZOaizwB5Un2Ax
	9NrLnAWL50OL5Vkknh/k3uqVnpTy4e3WlzJoo7hMVFzFxXXqIuCy59FVJMZAiJrWaG/iJPRH9dA
	PeT7xU+xC3Ce8o9JlsNzK8YX2WNrgpNRoJkUb+JYr/r8Jaf788WsOOw/jjgOcE/fR7BsVnK9h0/
	f7kEVHIrxNEWBQFMhu7YAm4mimkg+PvGnAzgl7j139UPbeeQbaLNszkCcoIdC9NDPtbBH4xMeIk
	SGLynMywQk1WhxUGu
X-Received: by 2002:a05:600c:3e17:b0:4bb:69b3:2b42 with SMTP id 5b1f17b1804b1-4bb69b32d31mr116485485e9.16.1794852600961;
        Mon, 16 Nov 2026 10:10:00 -0800 (PST)
Received: from localhost (p200300f65f19a90439293c698a65b414.dip0.t-ipconnect.de. [2003:f6:5f19:a904:3929:3c69:8a65:b414])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb69ac4e16sm131653625e9.0.2026.11.16.10.09.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 10:09:59 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: (ltc2947) Make ltc2947.h self-contained
Date: Mon, 16 Nov 2026 19:09:50 +0100
Message-ID: <20261116180950.3894659-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1002; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=FNVtl9KAT6PQLlCBkhq7t0uj2wqVo92ScDOnUKyzYGI=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq+0bvd+IhWDQJX9srO7f1evrOCFaMglAxavbJF jm/VtS/+16JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCavtG7wAKCRCPgPtYfRL+ TgwYB/wPg8brdCByIxPgguTSE9fuNlyZXLPQfDLxdo7R1E5KbYC9X/SKImZ3+cxe4MlPknE1Ma1 Z1GgVQaOvuXMbjP6pDRWeLnQdGXTX1aXkrjiYGX5Rd/aaiU2gUR3mf9EPKo0x+xb/yVP0/lISQR nisKRq6gqQ/Og0RsW3Curtjud3nxR2fBImeG0EEgaFt09K241qkcXMhzewx/uHNCY1vgtmM7uHm 6aiUpZTjnteMW2sLqxtrxHXEZV5oxd6xQKCRAUupI+4anVlDwxPhVKs48Q64POHigbiJ4Tu4za7 sRNDd/cKIzF3mAnr+7mXVb/u5DMdsfw3b6M1qFJOAXMNC6TQ
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

When ltc2947.h is included without a previous definition of
of_device_id, the compiler wails:

	drivers/hwmon/ltc2947.h:11:34: error: array type has incomplete element type ‘struct of_device_id’
	   11 | extern const struct of_device_id ltc2947_of_match[];
	      |                                  ^~~~~~~~~~~~~~~~

A forward declaration is not enough to fix that, so include the header
providing `struct of_device_id`.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/hwmon/ltc2947.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hwmon/ltc2947.h b/drivers/hwmon/ltc2947.h
index 5b8ff81a3dba..eb3613f4d4cd 100644
--- a/drivers/hwmon/ltc2947.h
+++ b/drivers/hwmon/ltc2947.h
@@ -2,6 +2,8 @@
 #ifndef _LINUX_LTC2947_H
 #define _LINUX_LTC2947_H
 
+#include <linux/device-id/of.h>
+
 struct regmap;
 
 extern const struct of_device_id ltc2947_of_match[];

base-commit: 84abb955b1015477aa11a96e2f3ac1b938b77f48
-- 
2.56.0.rc1

