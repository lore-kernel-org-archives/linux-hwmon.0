Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795194208;
	b=xuDU+mcQMFvh0SO+NUTQ+KUKQ0LnOXQSJKtqCjgL/Vl7RYFnYw0i91dqix76P+4MTCAB
	 FgEoPqS47izveTYX7bC+Z4l36Irwl5b6F5Kl0UhHvcIICaTaIryN9FN5KZewSUk4wUDEk
	 fFghXR2sWc63sQxc4n2iUeZL85hAY5fmlJKqCm6SrdS2osyTboQ75I9FkoFrFfIl4FxZo
	 m/HlS+fSISxeZkGaRspfGy4+MdobJjKMKla9Ms75ZfUQwqqDIiilsjOiLaUr15VbU7ul0
	 pBlJ7GY94f8iJYEFsh3oyymXzo3KxKwJ5z+rU34SPH2JvltU3jZx16QZEwUQJX42zJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795194208;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=xE5e3lf/0eBW9QOeJCPKjitoelTsiff22jlhwj4Nvtc=;
	b=CZEJF9aHlVtFCAWyAlFCH1F1UveQeVWRQOgWTpM4CKxp0V+DnhG4TJbPGh0ffI3nsqEI
	 bwXgTU4hF0OL8kNBf+EyyAdWTWoyFTLP4MOtBcQ5D0UjsqIcYbK3p6xjHrCFLKsx6vy4t
	 V8Mm5rnALoaaPSaZ8hDabsMrV9i0rg/SRgeuA9OFdw1yl0aP7ph3VwAms07vVKO04WlDF
	 iWkyIVa2BEPHRohMueWqScndBGvnFwnVN9mtWJRbHwyvychtb8Z8EV540+JSIJQh80P4M
	 c5Fmtv01T/UCTq8otCol6Qi4efJLHz4TDIPBD+dd0HskoZQq2UIegkrv2wwlsZPW2nA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GRPZAR6a;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43817606A339
	for <linux-hwmon@vger.kernel.org>; Fri, 20 Nov 2026 17:03:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43817606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GRPZAR6a
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c4d28f75d62so207823866b.0
        for <linux-hwmon@vger.kernel.org>; Fri, 20 Nov 2026 09:03:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795194207; x=1795799007; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xE5e3lf/0eBW9QOeJCPKjitoelTsiff22jlhwj4Nvtc=;
        b=GRPZAR6asKEgz2/4xYov7/GHO48tGLVANcFkzK6jgtJJ83GVVcBFCnwDzvg80TCtGb
         /635jhA4wA5qCOzLGiua8TyUcwNvYESv4/f7KlS4RxhlXWJ9sTwxSjoSrgpl+0VthR/9
         n0fiEeLfcrCiY1TXa5muJC9O88k059eiua8HyyA3ZZquw7J+d+urqhleRKzmui4QxVjd
         0z4kD7+3ryKKuKTcs7iIj10nW0lL4RZDSSo4nB42d5TQx3Dw7ydeo29ucOa/MAlfZiW6
         Fv/TTiG4TjRrR5Armvw591Krtlys45Ta0ubSXa0RambmR0E11L1rnUVHwSbzAuRTeXJw
         IFEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795194207; x=1795799007;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xE5e3lf/0eBW9QOeJCPKjitoelTsiff22jlhwj4Nvtc=;
        b=EnQdk8GYyYA2T1wEPyVGb5Jklk6m2i2cHZCH0N/Tqx+EeqELEYasDTIanAJiLtxnfg
         0TncZEETahzdbnom6ykJ09Hy5dyLP9tW2IiTID/dq6XAYXhrtnwg7CMg0vTevwkHCWn0
         OLn4WFaofEXUO4fv3tir8XSCMjfnjDwqcdvxUl+G33JPP7N+KnnDXGUa5OChz6IP5VOd
         xx63jK1YoDgBdOtUTlRruUaJnP9ukCook/H8Rwigt2DxrMcEbw3wsfYFql2sSBJnEVbR
         H3Q5UjRhqEikXGfixaxJ1iWzuTFtygA79QB/vbtgXQKvP1ysUHonLdvZwnNrpH2HUHwD
         kVYA==
X-Gm-Message-State: APuU4Z8R1eLUYYvNz8opfu9RFbqcgV5ICqZEsmHsJSwA7XO/CZmnpHKD
	lKeXcbpn/YO+kGHqQqOMEh9PiVNqT5DScARE0K4mgvbD7e7pYotZqJaS
X-Gm-Gg: AZFdTZfwI4q+Lfk9ZHO2/PwikNzU6nxlEew+LXwcS6Vq8L9keJ2PccgUf1HAXXbe7SE
	syR3ABhk9PAF+BumQgz3S2yWfV6UPbWNxN40nBmhtVsTpU5kC0lCCjXpgqibBD9RitpO2nZbTXU
	iaRsd8SK6+bDc5hIq6H056t1p2Bvnk2MrjkaTvlC4OA2G562kVK6jl0ZCvgKsejqskr0jlOmhGv
	P01Q5tzYv4z0r0Iwt5ID3KpqUhlI9sHyIuUSebq9mcGMDqzIh6Vv/m+ZKI6XmEVp618QAcDNYLS
	Ik6Srbxju4qZ9svrpNAtttoyYcH8KUO2NyJ+QlUeri1ULJ2diS5EHWSRX8iPtWhz/HAcLuCO6KP
	3OafiNQTyzydPNguyyo3Mp4F9+Jg0FZYajJPEKNEoMPpQCSgK5BOl95e2Q/ICdEIqc3G/uBUSKQ
	9J4tNpQ5P3Rjy4uE4LLmv9CGPK6QwZlzIp4BYIzQQyHFNiQpKdlrveM0IQ8XhvpgOJHClGPiroL
	z0W7pHXgHdbe6Q6JDFXNyI11g4I4b+CN8SKlu5sxkUY3A47EjG7ejdRBavV2d4/3NqMJxVGmbXL
	fZwoXNgIYppbtKa6g5HFKLsChfQuXp++MdQ=
X-Received: by 2002:a17:907:b02d:b0:c34:1ed:54d9 with SMTP id a640c23a62f3a-c513a52b544mr304697366b.4.1795194206635;
        Fri, 20 Nov 2026 09:03:26 -0800 (PST)
Received: from CachyOS ([176.88.126.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc73d3sm114753366b.64.2026.11.20.09.03.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 09:03:26 -0800 (PST)
From: =?UTF-8?q?Asaf=20Nuri=20Bertizlio=C4=9Flu?= <asafbertizlioglu@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Asaf=20Nuri=20Bertizlio=C4=9Flu?= <asafbertizlioglu@gmail.com>
Subject: [PATCH] =?UTF-8?q?mailmap:=20Add=20entry=20for=20Asaf=20Nuri=20Be?= =?UTF-8?q?rtizlio=C4=9Flu?=
Date: Fri, 20 Nov 2026 20:02:55 +0300
Message-ID: <20261120170257.589197-1-asafbertizlioglu@gmail.com>
X-Mailer: git-send-email 2.56.0
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
Content-Transfer-Encoding: 8bit

Map my old address to my new one. The old address appears in
existing Tested-by and Signed-off-by tags; I will use the new
address for all future contributions.

Signed-off-by: Asaf Nuri Bertizlioğlu <asafbertizlioglu@gmail.com>
---
Guenter, all my contributions go through hwmon, so feel free to take this one too.

 .mailmap | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.mailmap b/.mailmap
index 7fb33babc931..e1479571ece8 100644
--- a/.mailmap
+++ b/.mailmap
@@ -126,6 +126,7 @@ Ard Biesheuvel <ardb@kernel.org> <ard.biesheuvel@linaro.org>
 Arnaud Patard <arnaud.patard@rtp-net.org>
 Arnd Bergmann <arnd@arndb.de>
 Arun Kumar Neelakantam <quic_aneela@quicinc.com> <aneela@codeaurora.org>
+Asaf Nuri Bertizlioğlu <asafbertizlioglu@gmail.com> <ycistak@gmail.com>
 Asahi Lina <lina+kernel@asahilina.net> <lina@asahilina.net>
 Ashok Raj Nagarajan <quic_arnagara@quicinc.com> <arnagara@codeaurora.org>
 Ashwin Chaugule <quic_ashwinc@quicinc.com> <ashwinc@codeaurora.org>
-- 
2.56.0

