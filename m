Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83A081FA252
	for <linux-hwmon@vger.kernel.org>; Tue,  3 Dec 2024 17:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733247122; cv=none; b=tQWJ77IWU8kvt9AKS9p4zETPkBrrTyX8mVXfpYtYm21i0mPxZoLAoFUzppuQxmb/Ix0vJtVQemPmDr6kip3dtQ5wOuZAZfkfXjFTznpfIiBfmaCyC7vhmNvPZYt+L0EfdWJb8TIf/MDdFc1qubMzGKBKFCu8MC1RYDzdFryX+ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733247122; c=relaxed/simple;
	bh=CKc98dFL2sNKZmQo67nJipung5iPeSBcazwH2DJB/Yw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=CbBMpST84vVIYGSjlE9iyAHfjd3s8NQTmTSNKA+miU1oIHfVroccuErUwGPPEiaKvMOmCETHq7hG4F+/G0CjvmI2RtS1ntQ5qR2+dQCbkf8IShPErdMTeUcbjKJA4uTXPt35y4aTHWBgkqqhdOAlEtvUm6aozh8bvGApSkWLSck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=wOxr0H1s; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="wOxr0H1s"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43497839b80so38003395e9.2
        for <linux-hwmon@vger.kernel.org>; Tue, 03 Dec 2024 09:31:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1733247118; x=1733851918; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l2NJfZ8U2jTzxgzcbIWjZl+iGX/AvC+nRNG/weny0lg=;
        b=wOxr0H1szUF3/6PKQrdN4r4lvu0b3WpOS+HhWW71/cKpEkMFrSEScgjIm5SXFUxww9
         pg+9QkohPu4gZcpl4JrL231l+VMZqNbxGUErVha9DeX5sGC1stQwumRpoecG3WC2oATU
         gNXovTJwg6gML2ysM2VoVLK1kYJIUyZfTu3kbnd27eeNA1NGExB/Wqrsdd3RZLaA01f1
         PKmAkBsSZR1TBbpWYHCdLbc5dGG63G8vhsuTgQN6CXXhxsVET3RJ3FzCDEmfuKNGFL7p
         EG3j4U+SAqM765PWvhcuZHBb8wkj7Y1/H4OFE8TC5+WH0y2w9sWsCGc3HC/+iEVCP3zl
         YWFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733247118; x=1733851918;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l2NJfZ8U2jTzxgzcbIWjZl+iGX/AvC+nRNG/weny0lg=;
        b=G5SrFUHtCoKgmhBLCw3HAEdm/+v/vT7R9/KNcdt2oPNV1a6/9ikp+a8LqhiHeMdQOG
         hb3KMjAskx+0e5pJlGvDNFHSh/iHN1Ohllaeu7okFph5Mpm6my97SzM9g/eqPpcBMcAA
         bm0VRUkGSS9g/1cXW/VVM3agweoSMlPnJ/DeU3SGTSmTo0DMfUamoayIeBDHJKAkKyw1
         sF0Lot/sLKcBh1Pi97HVTX+lMxPc/GTVornAYebFAtVJxaGJONdAwqWeIGSNTwGRTlLg
         Hc3dsXcj/kgxDcvvmTeO+PpHAHTeQycnQg2zj6rfrT5YFu3cUpg6HyCWKzS6bvDLdEpK
         VyCQ==
X-Gm-Message-State: AOJu0Yy73p8XJUh/9qbE4nytCvYja0jg+QsdPOQ1w432czhpGn0WLywc
	phNzENx8oxkcy2Pzxa9zImkv45i171tjoeSjdAz01302LIBpNaZ6fH3ttxsieHc=
X-Gm-Gg: ASbGncvPgqN7w7hIRyG9fiEUY9rAEZTUAAiE5li4LCIGJKsF9i3XgeAcQPUm3DROW6/
	rZf3kdGKI/IeyWsPOU6z1NM1POEsYIgyqz5Ww36JKL0xQS97xYajCYkYRyja8ZyJVFnVaI6Pm9E
	SWkglbsUr01lXOlb9OGNfoUmL26xsqqO/FtF5IScMZ7AxsetZPj2pCeGIbTk1X1yZ8eDkg7m2h5
	9BqUjskr3dXeZGXhsxuvQAksxshXddm891nNO0XbVYnPz4YeUKqUBdVGOBqj50ywtLNdCX2B/se
	fVKy
X-Google-Smtp-Source: AGHT+IHeMcT9BIX9SfZZPNOpJDMS/xx4L+2sl/xgffltSyTC8IpMb8M1BtQepEEaBh2IArsg+vwHUg==
X-Received: by 2002:a05:600c:3c90:b0:434:a367:2bd9 with SMTP id 5b1f17b1804b1-434d3fa05b6mr11536265e9.14.1733247117787;
        Tue, 03 Dec 2024 09:31:57 -0800 (PST)
Received: from localhost (p5dc6838f.dip0.t-ipconnect.de. [93.198.131.143])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434b0dbf95fsm193864565e9.15.2024.12.03.09.31.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 09:31:57 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Zev Weiss <zev@bewilderbeest.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [PATCH] hwmon: (nct6775): Actually make use of the HWMON_NCT6775 symbol namespace
Date: Tue,  3 Dec 2024 18:31:49 +0100
Message-ID: <20241203173149.1648456-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1247; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=CKc98dFL2sNKZmQo67nJipung5iPeSBcazwH2DJB/Yw=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBnT0CF2Fked+DzfJsoBxIHbwuNOdFcvGJjN36Ht 2Yt3dgjLzOJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZ09AhQAKCRCPgPtYfRL+ Tsr5B/9t+yp12BjijKQDhlV3PU4MhtrvszK+ue1igUZPyV3NaDE4b4tXPcZD7JRUeDrF64jWUQI LS8BqSYnsTrwyLwiQ4VwHZbcdEvFbqxCq4aT3X1Ff/AG0PoVWY7r+ZklJB4zz1I5IQUVv402ubA TJlT08XILEp85YKROeal2JroAsELfVqi6JPWCmnFI29T37xzzzItrf3bvElcRagu5m451y0q/hJ 6byNZHxMBALf7Ib9yREQkaP0gngrhCK68jYw0xTPMm+bvL5Wofd7qe2v6iB6Ps3eOe9eysAkrUm H10ar517dYluZ+v+D1zXjgCO+QbrK9u9/Kas+RKNL2K3ObLy
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

DEFAULT_SYMBOL_NAMESPACE must already be defined when <linux/export.h>
is included. So move the define above the include block.

Fixes: c3963bc0a0cf ("hwmon: (nct6775) Split core and platform driver")
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
Hello,

this is based on current Linus Torvalds's master branch and depends on
the topmost commit there.

Best regards
Uwe

 drivers/hwmon/nct6775-core.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/nct6775-core.c b/drivers/hwmon/nct6775-core.c
index c243b51837d2..fa3351351825 100644
--- a/drivers/hwmon/nct6775-core.c
+++ b/drivers/hwmon/nct6775-core.c
@@ -42,6 +42,9 @@
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
+#undef DEFAULT_SYMBOL_NAMESPACE
+#define DEFAULT_SYMBOL_NAMESPACE "HWMON_NCT6775"
+
 #include <linux/module.h>
 #include <linux/init.h>
 #include <linux/slab.h>
@@ -56,9 +59,6 @@
 #include "lm75.h"
 #include "nct6775.h"
 
-#undef DEFAULT_SYMBOL_NAMESPACE
-#define DEFAULT_SYMBOL_NAMESPACE "HWMON_NCT6775"
-
 #define USE_ALTERNATE
 
 /* used to set data->name = nct6775_device_names[data->sio_kind] */

base-commit: ceb8bf2ceaa77fe222fe8fe32cb7789c9099ddf1
-- 
2.45.2

