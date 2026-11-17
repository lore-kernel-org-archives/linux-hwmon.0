Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794884358;
	b=IYVnKSWLXOA0VKwwELOSA2jGbDsOhHkIHFdpCtPj43g/HIflTRNR5XQCQl6xntKRAi05
	 nDDH146cHacAGDxudzns3LjY+H5Z6B+wWx1f6xBtJxWG5fjJidJfRMGKkB/8XPSw9ZujV
	 yVpRivEO+yW4rJ0KjFcpu/4OdJ39v5KVC2RMCQa0oys2iXUNQEzt2egqXZexEMsVlnc6+
	 vvb4ZV/J1MA8QKbpU/SDJgRbqIZ+AnSogQbl3CPkxeW6gDKQegpgVn6G6qZdgXbwTq7BN
	 s+nVTcBo+w5qzlLYqk1RPMT4QPBGa9b8oIryNdC3QeTOjgYuqEVm8iWzEfWNV5lw6tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794884358;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=X8SjMxulocICOiKfYu+2cGat7NHYeq/w7Mvor/wOg5g=;
	b=0N1lgM64s75uazlVoSw+6BquF5lBcxzpfu90PmRmOeZW6NtNhdnRpaQYarE0mOLv7HBJ
	 /YIyiEQxfaVNM71LYAKx/x0YLCsgBe6sELl3QQ+dnrWK7pAQwfTSZUZSmwn3mnRyh1ScN
	 NS5RqfhSA1al0JfeNUyX7Tf/lFYxI4+lprL/InxNzshLL9pwnjCsL7fiDjWv6E/O97MrK
	 g+ncLTmtOSaCKyj8E9HpxFlaBx159sOhSs/iJTWc6zBDPUfujS466vTSV98OJKxqE/D9q
	 7W8kVoeXwuSDtRJKkKWDysdMM1QhK2uud9kWUjZiQUyxcVK8rncjis21XwMkdNjd4oA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GufmHECw;
	arc=none smtp.remote-ip=209.85.128.173
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18596606A331
	for <linux-hwmon@vger.kernel.org>; Tue, 17 Nov 2026 02:59:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18596606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GufmHECw
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-8b4e2ec4b42so9802297b3.0
        for <linux-hwmon@vger.kernel.org>; Mon, 16 Nov 2026 18:59:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794884356; x=1795489156; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X8SjMxulocICOiKfYu+2cGat7NHYeq/w7Mvor/wOg5g=;
        b=GufmHECwABO7UKejS9V0/k/4iN0Nfpe04t416Pjq799GhiP7h4Cak+ke9GOYKXHxuU
         +Q2d1kFnb7uw7piGNFmMPNdtdd7XU8QfTYP1Yhr0EjegxbPWMwMmayAc3TNkD1Rk13uV
         Xs6sQz1YggwRBE+NVOAppkTBRCnYckQ3sM84/44MLVceB+WcvyshHqNAPaDVCv2QI9Ou
         rLMHK87Ez/irHc97+5TL9v4CypZohb9Mr2zzDiuueZniQ9qmI9M5gfoMT3W1yzcZe+JA
         Qa2MzVe6LqdpGfyxUNpiCUzWAO6/Hf7rsWwNNECCJUsVTK7AuCOFVysomLWrGVpEut3G
         jSsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794884356; x=1795489156;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X8SjMxulocICOiKfYu+2cGat7NHYeq/w7Mvor/wOg5g=;
        b=vNe4kGmB+MXhEM6IGU0XpKG7BzbCIWWi6u9G4YNq0GTYbinRSvAmPbchIy9A/fxgmN
         8ZRjNrTKwogDXgL+OvQoXWo64wb01Vb0N5qQNSqk0hshgrOlh7BC/AHgsOgZ1XoibgvD
         lG5r5LU+GoaZB22zV1O7Ph/njKO+nN7+4mOewPkPRsgsOQHFvLrGRNwbCWzZAnBoQMdl
         S+8K8K4TpBFePfMhbt3mpI8BAyQqhr8EwznKXxKIMS7CP12N29XOt68QVx99MyMyQVnZ
         dd8LqYv6scdB7LmqZdXU2x3nldkPmBIPUNb5hQZstP8S0VYrsUqhnzzuFAJDIhGEjv+a
         GoVQ==
X-Forwarded-Encrypted: i=1; AL+hErH39hlndREKoBUgEF5MEoMih4+5eG8LxuWKCvEshQKpvX4liIXxN4sHsNhMg+bufe+Re8KTmt3DfnFZdg==@vger.kernel.org
X-Gm-Message-State: APuU4Z9v0303goYpQxtL2an/CxLckpkOTo7qb5rNSa651jcCWooEHvOd
	fFTeJaEG6KGaC8THHtShnsizgg+wQcvMQHBPTkEE1kcChgOZcJTz/vcUUBT9hpD4oMo=
X-Gm-Gg: AZFdTZcbhzVn7ALa2/bHhaz+x2lXbCcyQPfcZc3aKRAgJLJ+pCdx0iVyPCCgx0Qrpu7
	5uXN3QURF6r2L+O7xYKNQ98IG9kM1syFCStlzUqomzWxtTJHc8xsLoJ8+aEoKo+TDGnMyi/u8w7
	zD5dt+EtkvBT4eSHqfzRnXSQHVLO1ZIC9LEWRlp+r8kHGO5vpyDziMfteDFFGvetkxcepPwmRKx
	MUv3vPnK7ODFjXcj5uLNwryjrJTmfUF/6nNgRmPt7QGhjQO1qrKf9AYzzJJZmmEFKgwcZiET0R8
	yV8VLf/zZOA3cJNJVTJsAjkkof8p7/VUn1MvpUH07qwkBcsG0YLqcboClQHSWkT8obtNVx5GhVE
	RsBr4LfFs4Kx0l2BBruLFeqthV/OSP5lnR99nfqRifCDvJjObQqPSohXKxQxbTfeEAGJn4Obp7G
	33SsuUWX8wyc+TO7XPJLFaNDrnc7qRLZ7Ashi54itnOLACAeTyJA7jO72gO8Fs6uF1aNrUftC2d
	9SQqBe6/1myMSbu+Mn/KBpsyWJOFqRrxIMlzKMd72JDG2+Lfj4AufxdSQ+DPpu+riEJb867Ra11
	JZN6RgSmEl2jY+cYDcVvFwH7kjYaf4MmUAZlTm+9aekPN1M1aMqXkBBgkm+X+kcc1uE5//+qYks
	0IkkjWfoNrUXsXMRxQdEZeO/adx2ZmVZ0W/izfePjSon8tS4fELp+v0UtKnAkcAEAa579kYqLkc
	xNbQjWBX4epsxzN37gew==
X-Received: by 2002:a05:690c:d8b:b0:8b4:c71b:e4f6 with SMTP id 00721157ae682-8b4c71beb96mr41119167b3.3.1794884355050;
        Mon, 16 Nov 2026 18:59:15 -0800 (PST)
Received: from localhost (107-220-129-194.lightspeed.chrlnc.sbcglobal.net. [107.220.129.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4ec3079fbsm14326407b3.41.2026.11.16.18.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 18:59:14 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Mon, 16 Nov 2026 21:59:09 -0500
Subject: [PATCH v2 2/7] alpha: marvel: report environmental events without
 VERBOSE_MCHECK
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-marvel-env-v2-2-ef614eb2e7f1@gmail.com>
References: <20261116-marvel-env-v2-0-ef614eb2e7f1@gmail.com>
In-Reply-To: <20261116-marvel-env-v2-0-ef614eb2e7f1@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1240; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=hvA3Q0T5bLITKm5NNV73hsX++cwWKaI8fp/0V4p4/zI=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLJ+H/oj9XQ74+/CihkSieIccSG7w9892PD6MkvjTeNKi
 YOFRwQ6Oz6yMIhxMcwUU2SJW6/IMqttx1Kf09K/YOawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyBDxygeIqfHoJFZXFyaWqSbVlDkkJdfkliSmZ9XrJdfkJpXkF6gl5aZVpKRkV9UnAo0Qi8vtcT
 U1dHNyNDAxNLRwszJwtHUxNnZydDJzdHR2dXJyNLcxMDZ0tHE1dKcgYtTAOYagUeMDEuz09/9+X
 pB71uTU+2kCX/L1SZucD1dOfu4QsF/BWlOFS5Ghk5no+WK+95mGB753qu6xiVYyy2bN3Mp63RmK
 es7zFUyjAA=
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

The service processors report temperature, fan, voltage and power supply
alarms as system event (0x680) logout frames. The frame is already
classified as reportable, but without CONFIG_VERBOSE_MCHECK only the
header line reaches the log, which does not say which sensor or what
happened. Print the subpackets unconditionally.

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/kernel/err_marvel.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/alpha/kernel/err_marvel.c b/arch/alpha/kernel/err_marvel.c
index 85f7a56816ce..46c521cea9a0 100644
--- a/arch/alpha/kernel/err_marvel.c
+++ b/arch/alpha/kernel/err_marvel.c
@@ -37,7 +37,6 @@ marvel_env_state(u16 state)
 static void
 marvel_print_680_frame(struct ev7_lf_subpackets *lf_subpackets)
 {
-#ifdef CONFIG_VERBOSE_MCHECK
 	struct ev7_pal_environmental_subpacket *env;
 	struct { int type; char *name; } ev_packets[] = {
 		{ EL_TYPE__PAL__ENV__AMBIENT_TEMPERATURE,
@@ -68,7 +67,6 @@ marvel_print_680_frame(struct ev7_lf_subpackets *lf_subpackets)
 		       marvel_env_state(env->state), env->cabinet,
 		       env->drawer, env->pe, env->sensor, env->state);
 	}
-#endif /* CONFIG_VERBOSE_MCHECK */
 }
 
 static int

-- 
2.56.1

