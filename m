Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80D623CC7FD
	for <linux-hwmon@vger.kernel.org>; Tue, 12 May 2026 16:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778603367; cv=none; b=qkDUqf6uv03dK24N/fq/mvoX7fjC9G7/wAD2hb8Y31UBV/wk0+Z6y3Rc+0iAX33/K0X52HLStjoqzHOQBubPJWslrsfwfRTPlEcAcQnFSJ7vSpLpl8rv9ASjtY194JZ0LwR2JvT4Lj6lh7atyClFI454VA8UGJQI3bYvDOU51zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778603367; c=relaxed/simple;
	bh=mFO9TYHX1xITid0n9nDEsYlpc16BXCaIdCL6ZQkkhbA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=duRdwk/ap+QssT9NVHoD9UHx50sGnU3O2Xil4ar7Y7vl5VbxxvZpJ1cYID7VnZ20UhQU82qey9BycxJEFCD3i2Xg2xX4F8wVUEgbJvsUj9mLlVkafkl/04mQ2m+So2zyiDNO3f8aNsHtuTHiHWundoNdKQIhHhmJh0VNxf/5LRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=ty3UbMtX; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="ty3UbMtX"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-44e1860558fso3720178f8f.0
        for <linux-hwmon@vger.kernel.org>; Tue, 12 May 2026 09:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778603362; x=1779208162; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3RzMfN/3xFNCmPXgNJ1Xq4UquVQnLyOYsZWRgZvy3h0=;
        b=ty3UbMtXabcV5+gvYKkkgiHWFDXbKVvHFoaRnNqGhkwuX/yCWH5i3dMGyvvXvXuA8H
         rO8ji33qkGBQvAnyIdItEzbQjYLDA1S7zO4dQBWYvyaKODVklC2oha4qhOjXR3Q4wHMM
         qkLVSCnpMcTm4kHEqU/8U3x5p+OTklU6s04GVN7bc59UwxC1lE3nHCHUXbK2+x0cFjT2
         IMtMPkmqEraOvaxhF7nJ1vAPWXfNDnFShQE8c9zCvOWHymm9FaJWeqAe4ND0k1AdHDvT
         zurYeyXE9yUYCpunoQxxsn9k2fr9+c5d+mAvZtzQFl/4IuodLnUFcNwDty5bzaHvShdl
         75Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778603362; x=1779208162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3RzMfN/3xFNCmPXgNJ1Xq4UquVQnLyOYsZWRgZvy3h0=;
        b=COfxB/VHAQsflVhyrmM981Bz0iXx+yXQrHmpErI8gr5ioJz7qrBXMhfhA+5/ciywaB
         PywdJuHpIHEyHvswPG5iOZvp/cSqCjlskQi/VI9y2pw7gccp6+GFOBAwoQSId4JHqnr+
         SnWfeX3USE0HsH253wyXOPqpjugUw+5UWoDtH2ZCtUpOChEk3diXijux9zAjfS16t/ms
         JIO3Ylpc6hLYXvPiTZKT5lLq4Nvo3KTSV/uMmsIZPlDPaGcaXE3hbrm2/CgbsxZHJYyu
         BcWO19WhQhap2ieFTguF28DdslC1+qlPRzJCg8q+wBhqI9iRtzImyQUMuA2+Wa8jhgCn
         Oi1A==
X-Gm-Message-State: AOJu0YxOfNAG4ts+Z74fKL+irdaQY0Di9Y0tZUvv5D12cjqjrpeY46K5
	HhMUNbd24LR35nZN+cz1QtSBDyL053G+vIco/YEZP2oVjbRmIInvu8sdEZ0+WzexE8csbevZAX2
	RWa46
X-Gm-Gg: Acq92OHlD5Bc+bCA+a6ZfYeWldqCpNYcWFV7NVe/KUdZa5ppWP7U0v9zko0XNi7chX3
	JCUkgX1hNLtxxL4HdPhcqqWtrattWHoDKYeLYE8h08rU4BB5Rb91lwTcP3VB/ZBNwF3ssFm083G
	PUvS50J87uTtORoI1lSlCYxxM8RbeK+9yq2SvcZY3LCOw1uX3HWwytST6TrduBTHMChmYBSQohR
	FTGEnQWVXIWS8K+xIHsKTpM+lbBoweQ9MMg5VpdWCJWORmqu2QiQmztWhP86iZbMy9C0UCtx6ha
	XHnU3vK7nW0j7eQMtwh3iFA7rPB5HktGKHIAegGNJHlp2G1QRVCYV69Ut/y3sR2MJXyonWeYBNC
	vGOOCD4Fgy6dIrsheZzSpr2A+J5Ye2EH5xSI+Gqr1Kl6E/tjJWWxjZQNXkZunA4Ss7Xum2jQmg0
	x7ezj3YGz4MCYgR+BTZHwwhoY2pONf2Q56YVFWIoi2mTEUbvI4+A5p43AS0SM4ZVPD9v8z0X2bZ
	neQkSPg032QyXCNRJ8Aqko06Q==
X-Received: by 2002:a05:6000:22c3:b0:44f:9b70:2996 with SMTP id ffacd0b85a97d-45462c3554emr30298402f8f.21.1778603361735;
        Tue, 12 May 2026 09:29:21 -0700 (PDT)
Received: from localhost (p200300f65f114e08229f8c404acd2182.dip0.t-ipconnect.de. [2003:f6:5f11:4e08:229f:8c40:4acd:2182])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-454922715b9sm35834923f8f.36.2026.05.12.09.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 09:29:21 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Wensheng Wang <wenswang@yeah.net>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/2] hwmon: (pmbus/mp2869) Drop unjustified __maybe_unused
Date: Tue, 12 May 2026 18:28:57 +0200
Message-ID:  <3ec2ee181d4f5bfc48c3745f9ce4fdbd1e8fb01e.1778603083.git.ukleinek@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1778603083.git.ukleinek@kernel.org>
References: <cover.1778603083.git.ukleinek@kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=843; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=mFO9TYHX1xITid0n9nDEsYlpc16BXCaIdCL6ZQkkhbA=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqA1VNCidzRxy0KlQiCGM+OToCeMzEe4gEd6zcG P6tn8av0XmJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCagNVTQAKCRCPgPtYfRL+ Tr95B/45yJGatbpKmS+GCBF5Ycy88pcZjDZCUfMWdc+NzFU8lK6NN8QCkR34kI38J4ppbky4rKN ruNNCEOadeos+WdeJHHyq7qJq01GAF6Bk/Pw3t2Q8MarjV4cdm5eUU5o4gv9WqWy0c4cjgRHDsG E6vCwovVkqg918cHeJR/xEzKuqWRifqET5V9nKeqdf/rNvjME/GpniKptG7+2+fP1Wpv+kDXPRu NVg+E+tfOLdptMOPW6n1NvvF8XcOqjGWEal9XPNLzbWp6hSPfYDpWEIQDhprpEBiF3nbJZZ9aZS ms3XXlqXIfnGFgisn9r5ub80In5j8dxah376ynMtG1n/kSuB
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

mp2869_of_match is used unconditionally in mp2869_driver, so there is no
need for the __maybe_unused marker.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/hwmon/pmbus/mp2869.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/mp2869.c b/drivers/hwmon/pmbus/mp2869.c
index d345be920429..76c6017507b3 100644
--- a/drivers/hwmon/pmbus/mp2869.c
+++ b/drivers/hwmon/pmbus/mp2869.c
@@ -640,7 +640,7 @@ static const struct i2c_device_id mp2869_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, mp2869_id);
 
-static const struct of_device_id __maybe_unused mp2869_of_match[] = {
+static const struct of_device_id mp2869_of_match[] = {
 	{ .compatible = "mps,mp2869" },
 	{ .compatible = "mps,mp29608" },
 	{ .compatible = "mps,mp29612" },
-- 
2.47.3

