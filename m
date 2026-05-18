Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CE6D403159
	for <linux-hwmon@vger.kernel.org>; Mon, 18 May 2026 12:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779106941; cv=none; b=Ja0jNqWCjYWewKnDllEyWnTmu1JL/oQNJqXOc5GYJpr5qkqSVDbD2AfpxcVHsJnTYO6qFLcsjlYh+k3rTAaFn3HSqHztdZEvRWNerbMtP4bOZ7nRUt8ut/uUxRW5xu8rfyqwKcU49sGj0uH6FcHistQ1LJHPglB3B2QmJZPT+Ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779106941; c=relaxed/simple;
	bh=Kf6TvpA6nPP5hKSYBBQLiXNExX+0T2ySTWa6Sd1vvgI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EAOnB+hI02TPLONTY5l6r0kMkUVqmjkYnzLNYYpAJS8QBOCSxlmIqma43O9WctP9YWLG6GfxtQ21P2Vndev9jm7clqgxXbBYTQ/7ohRDRpfLWpfm7vvqrJnpvne2wVhoTl4jDqEmNLhDTmT+Tpjt1YrmZsnxmDn9u30inhpPVNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LKU3OcTJ; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LKU3OcTJ"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4585a116a4aso1771981f8f.3
        for <linux-hwmon@vger.kernel.org>; Mon, 18 May 2026 05:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779106934; x=1779711734; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=u+rVKnguaP3FlTIvom/NT5GF4l5qCS1YRqi9HCBkSNU=;
        b=LKU3OcTJ1jVJs6praTbxqd95k/x0dgOEVuSbCTrBq67jZEYuPKpMDDR102KEASy2/O
         hYIbEXnWcC6KrwofOGalNGKIuKN5jKK5e51VRE34eSfPjJ7VWFw7GNpO0OuFo6juMPpf
         EBT2kbCI8EQOD8GXF3qwA64SzRjFd/xB5F6UAbLQ3snpVpTUzcNmqnteIvmSuuM+QIaE
         +ga5SJ3OlX7c74UGdaYg/wY4GMUYfj9M8nbFhLDcKGfaTjdFUvep/pgATu4dSq8nJ4Ju
         +w2aa38D3XRfdkpkWAfLeJfyZ7QgsXSilS0T0xhNI5dryc8S5CMLnykn/GkHzBUiDt7g
         SZbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779106934; x=1779711734;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u+rVKnguaP3FlTIvom/NT5GF4l5qCS1YRqi9HCBkSNU=;
        b=ItStLNoROJG3KgsoGZ+Ktc3Fi0xfhDF64aCESgaNnWZXfwvDKx8lk63PCP8Okn47Hk
         g9MKjhovTscS/f0Qe6k7wKUWlFE7AxAPD0oNrQXZkQnI5wOdmzcPz4p4i/P8WL9GAjQm
         9w0CctrYs30F/LRmn6iBbhXyd+Egh6WTFne5BnZ9UvjJFg0wi0N496LoT+ZanfrRn3Vb
         LywhlJdLMkBBdiHbjTUmzZo8ss5qzV2pui85GHz5sTUqBLUQj81J4EfHlb3MQpBqyYbL
         jwRwwoT3dhnAnaZFXINyxPiSW1jso/+lspRnJQ1Dt+gbVIaH34FUGeuNuZr+fBgsLXMK
         yW1w==
X-Forwarded-Encrypted: i=1; AFNElJ9GoRslo/GejCJRvmQfQkIFiBBwIB2Lk5Ocwhf34O35CF21rCXcD0xCAlkL5g9SSfgCMhQm5ZmWQT9HhA==@vger.kernel.org
X-Gm-Message-State: AOJu0YygPhaltm1pdSyKijgGslrfAR/EhOR7cUFP5fnJCG1rN8ZIMdbu
	5+IDmJ6BPn86tcl/pxZsWQxnZ076xt3Yu6s6AQKWw+ACPnO9na3H9nHn
X-Gm-Gg: Acq92OFGdGuxOhcwojzvYfZl77zhTO8bbvg9SKt4yQ2MalnyWYw41petcXqz2yQ25JP
	gXEukeF9AMZa0z9D2anL5tAnZsFjuiz2KeaG+sndENKZa9CI+L4iFMb5CNy1LqeHNA7VZehruV6
	GBBZ1t75HTVKLWV394L1reRHVJT1/aWZoQH/xzXJ9DT0InUECtjHaqJD7JYxyeF06NTwNDQHZ6I
	jAs63bFSf1umi6Wp1U0MBB5iRuv+U3511dtmYOvOd/QmDvRWxj1jit++D/EdGkIlQP0DQ2Sl/+/
	6YtxG5kRGiGK0D9px/9nvQGHWgFzxAF93mrYBugki3zEVADatlllHlRlCI+3IChDy5/0YaKUIbM
	DEBV4vD7IP8ifOy5X+PiZ8nRh1rrOnyCV7S83lonrtUnr+GhGG1tj8V6ie6aszZgduUzW9bbO2E
	dZ8Oursb0lAr7jc+4xDBvdBZ6KjUjoma8ecrNXDbgEUhhapFuwxfGzbMzfJXxyY9/Lhjg+5MkTO
	NyskBdg2Gs=
X-Received: by 2002:a05:6000:25c4:b0:44e:d7f8:3945 with SMTP id ffacd0b85a97d-45e5c589300mr25834852f8f.13.1779106934186;
        Mon, 18 May 2026 05:22:14 -0700 (PDT)
Received: from flaviu-Aspire-E5-572G.. ([5.15.232.50])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da15a6454sm37311881f8f.34.2026.05.18.05.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 05:22:13 -0700 (PDT)
From: Flaviu Nistor <flaviu.nistor@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Flaviu Nistor <flaviu.nistor@gmail.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: (tmp102) Drop unnecessary __maybe_unused
Date: Mon, 18 May 2026 15:22:10 +0300
Message-ID: <20260518122210.10288-1-flaviu.nistor@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tmp102_of_match is used unconditionally in tmp102_driver, so there is no
need for __maybe_unused.

Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>
---
 drivers/hwmon/tmp102.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/tmp102.c b/drivers/hwmon/tmp102.c
index 29e44c8db540..6bd1bed3cdb8 100644
--- a/drivers/hwmon/tmp102.c
+++ b/drivers/hwmon/tmp102.c
@@ -401,7 +401,7 @@ static const struct i2c_device_id tmp102_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, tmp102_id);
 
-static const struct of_device_id __maybe_unused tmp102_of_match[] = {
+static const struct of_device_id tmp102_of_match[] = {
 	{ .compatible = "ti,tmp102" },
 	{ },
 };
-- 
2.34.1

