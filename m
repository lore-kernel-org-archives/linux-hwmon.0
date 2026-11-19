Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795046994;
	b=t/hPTd0OFwWt3IjvCqB0GFpkynbB1tI0v4b5cmKL/3A1YRj3L/UFSx2pbSY6RhkbKD2W
	 Bk9Ez+AqzbAtAOYjYqZEEuKHgl5+XYTKyyTFctgALAzsY60HOJqgo84aG4kVKq4lgb53f
	 Zn2HTfXjDGeDcM8UHH2NYKLb0feG/isRlSXvJiki1wffkYzhv9lIsNbbaC4SzYsJRvZWy
	 Qr/ttN7C+BoNTyRWjvYFlcCY4Z0ERnpjXI8u34syrI9V7+WkHRDGmSyk+NWWl5Gmy9LOi
	 Rir4fNACQMVw1Y+2hmc0mV/OJYeiDiaE8hO8wM1cTgKAGC/48mb64GOJwluWYXwOV6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795046994;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=meL0+rTQnSRPz7Yn2GzsMx3xxjISuzA0apMMf/0RgbQ=;
	b=rgRpFecsTC+krX0bw4MCAZu6hjWKcJnEyAulmhmdytw+aBak0a/DhEfuuUWKjyvDXbG2
	 tvXA3GGRWh+/sfmRQPL7Ja2Uc+bAvoSVrXUDDOfsT878C2l+zFIqCo8zfwtxlQJJe9VCG
	 84cpE92OiS6WOJW3UldzOIrhrItkmEq2s7ICal4UTmMaVXUvRcGDHrn90Le17Bw9TBYPH
	 4xAPc8MA0D5CXmTkT2lXEMONE7mCnWXWxt1VzzDCjaTs7c9V+11ULlYx+hI2dqh8lOeBK
	 jeVLJrtXT6eS2rbAqM7L6tSUsPiH3MfooaYlJUlyP/BFzzbKg4zGjlYIyupXyl3BddQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EhtTpJ76;
	arc=none smtp.remote-ip=209.85.128.173
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22301606A33D
	for <linux-hwmon@vger.kernel.org>; Thu, 19 Nov 2026 00:09:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22301606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EhtTpJ76
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-8b4cd576f2aso14447447b3.0
        for <linux-hwmon@vger.kernel.org>; Wed, 18 Nov 2026 16:09:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795046993; x=1795651793; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=meL0+rTQnSRPz7Yn2GzsMx3xxjISuzA0apMMf/0RgbQ=;
        b=EhtTpJ76+FnPhG+PiTg1598hHMEeBs8dAYpnflx5oDdjN3405Qwl+4BF8HE7knr+Gw
         4fpmK3qFzpggPK/eifxkZaQ8Nkp4DYQBHOYz0/moedP/klluSBnwanY/otpG8U9L1TZ8
         xMpCvCylHLgiTv9cLZHw/CYT+0wytXHaxK50M3U5CUy3U8XoNmhkJM+tCXrBHcFyEhqp
         dumcD2MgkYrpiBT6ndb54Mr/qJJGj/vzeCLjGfKyudL2OJb6ErGELWyq5OTsWWdEBrtt
         jLaaF8hkXD4kq7wquuECY3gcerl7J+3KB1MMpEn2SbRpYJSc+AL+OoyQMqxvkJVi+jN3
         IHsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795046993; x=1795651793;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=meL0+rTQnSRPz7Yn2GzsMx3xxjISuzA0apMMf/0RgbQ=;
        b=RAbs8Pt1sXcf/juLGY5VBArWwvNBfYm4vtORo0aDsoPG726a9sXkR/6rZJ/Mlf2krs
         2WmGp2m5YD4L5dhQ7YQnX2MZewegjsGRNz2fpyNVGKF97UPwb00BLPmGFQbVLnR2GQDG
         WBEqsLVtmYU2AYli5vBtw+glFtKkQEOTs14oiwun01imVxmvQkcvbW8B8Vu/jSLQmqxP
         EiyDOD2sVxaoHIndNHDCgO+o+K74S+Wu/O6tH7cbkZ/41ksrMBbQvbVFK2fES/Nmm80X
         gfcL6/IRmwPypXt01S/BoXsVx4kZapdGXSAB2KHZHQ/2NtDp3TbLSiSEMYLLE4+Dn5R3
         C2Fg==
X-Forwarded-Encrypted: i=1; AL+hErG3ZDG+CdU1fQd4EvY+2hS2AE0ftokMoK4N1SjBoesA6ks9HurZu0W2TN8t/tarSCWe62yq039mrG9duA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9np64tq+zZl+DhSPYbRYcD9muakntK9oq6w0/Fx15akuu1RCS0
	yt3XVped6b2bJAZrOx6fnBteDHG3VNy3FV58NyU7hnzjCm0lUduj56DIRLpPIPUx
X-Gm-Gg: AZFdTZcD9qPJO0QrrnA3kHOyYqDWPfIR1c5hfZweJzNBNjp3lQqfQEQpCVlKTFzdinG
	Soy5kb7DT+E+yVf5Je+LpCxkugvwJgUUV66kXJkKdXMG23WLxhoR6v2FAFiAjzDM3EfQKCBDaS7
	REZW731UDBGxfHKoj1n/BesHFQttnrBaJnYuhgfkd3OJV9ryaJBK7S8FrkLis6/3ItKq5u64wzi
	ptyc1XM61Csv/0AoCttd2Bp/kgfQTXI2Fof9nvuBcRlo276jJJtQM4jonQ0noDxd+tfB8xC0jsO
	nc/3WZQVGhZvR50Y4HG9AtIQc1PreJtMpFhLmaEEhZJPVQdVJi3gvUy6lQc9aH9W6IREHUVrgJI
	ehidlOHN1ldjY8sUhuGE0WFs9WTv/AxsmiIAPL9GouWsPTqvIFFCU806P9bwB7mZGxX6vtLtz1D
	+NhDCOtjYuISyhgWofsHkB4gmHhOmdpCmhFNyCFcAuhXwKpOmVIktBw4D9c94EBsMdNNF/Bmwt5
	zbJWzisbU9Xi3fTSllFb0WihmuG6t61+15liDeGZ6g8cmC6IZh64NPLwf+/gjY45+VM1Xf2lreA
	LevHZfYVMtptuTxdpjGN9QFfrgW71WByGG5MWBpboUsR8MWPyuYEu7LTUrYkwA075cQUese0jIH
	GBbX6usj02sCtRru+gcccN6iga5zK8GUHdnJxcWi+chWE6WQSSad8m2j3wHlvuFVUgRGygnA942
	5IxyOh5bFTXIeVeoUICA==
X-Received: by 2002:a05:690c:446:b0:8b0:e238:271b with SMTP id 00721157ae682-8b4febd9edemr19519507b3.2.1795046992979;
        Wed, 18 Nov 2026 16:09:52 -0800 (PST)
Received: from localhost (107-220-129-194.lightspeed.chrlnc.sbcglobal.net. [107.220.129.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4fe03091esm26035277b3.12.2026.11.18.16.09.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 16:09:51 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Wed, 18 Nov 2026 19:09:47 -0500
Subject: [PATCH v4 2/7] alpha: marvel: report environmental events without
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
Message-Id: <20261118-marvel-env-v4-2-200317e496c2@gmail.com>
References: <20261118-marvel-env-v4-0-200317e496c2@gmail.com>
In-Reply-To: <20261118-marvel-env-v4-0-200317e496c2@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1534; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=oaDjaxtiZhTza/9Q+dIadPybMp9H7XVMHIR6nixhj7k=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLL+2XklqMwT/PPvSl/C974Mp0mfRe3/KXuU163X3rMxs
 qvpdvGcjo8sDGJcDDPFFFni1iuyzGrbsdTntPQvmDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 EMjQMYqHyOkxaGQWF5emFummFRQ55OWXJJZk5ucV6+UXpOYVpBfopWWmlWRk5BcVpwKN0MtLLTF
 1dXQzMjQwsXS0MHOycDQ1cXZ2MnRyc3R0dnUysjQ3MXC2dDRxtTRn4OIUgLlmNTsjw+kNJuUfey
 XaX0k+rDLh5fnh6md/bdsfpxUl79uqVrHN72VkeJj9oNnukvqD5x371YVYpbdfNUub08OVFPalM
 /TOk20bWQE=
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

The service processors report temperature, fan, voltage and power supply
alarms as system event (0x680) logout frames. The frame is already
classified as reportable, but without CONFIG_VERBOSE_MCHECK only the
header line reaches the log, which does not say which sensor or what
happened. Print the subpackets unconditionally.

Signed-off-by: Matt Turner <mattst88@gmail.com>
Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/alpha/kernel/err_marvel.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/alpha/kernel/err_marvel.c b/arch/alpha/kernel/err_marvel.c
index 9304ae74877d..46c521cea9a0 100644
--- a/arch/alpha/kernel/err_marvel.c
+++ b/arch/alpha/kernel/err_marvel.c
@@ -21,7 +21,6 @@
 #include "err_impl.h"
 #include "proto.h"
 
-#ifdef CONFIG_VERBOSE_MCHECK
 static const char *
 marvel_env_state(u16 state)
 {
@@ -34,12 +33,10 @@ marvel_env_state(u16 state)
 	default:			return "unrecognized";
 	}
 }
-#endif /* CONFIG_VERBOSE_MCHECK */
 
 static void
 marvel_print_680_frame(struct ev7_lf_subpackets *lf_subpackets)
 {
-#ifdef CONFIG_VERBOSE_MCHECK
 	struct ev7_pal_environmental_subpacket *env;
 	struct { int type; char *name; } ev_packets[] = {
 		{ EL_TYPE__PAL__ENV__AMBIENT_TEMPERATURE,
@@ -70,7 +67,6 @@ marvel_print_680_frame(struct ev7_lf_subpackets *lf_subpackets)
 		       marvel_env_state(env->state), env->cabinet,
 		       env->drawer, env->pe, env->sensor, env->state);
 	}
-#endif /* CONFIG_VERBOSE_MCHECK */
 }
 
 static int

-- 
2.56.1

