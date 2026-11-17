Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794939222;
	b=oYRU3EhTyJJdOGI2FKS43T/amfIgTqDA58dIcAcRdF4s+FPrxDPh72a6yRmRvONHtbQ8
	 CiafzHiw0O41nZZD/Ih4C9QNEl6u3FXEojbu6IAluVQFUlvePhoyoxIYDDUB9QLyLpRXy
	 swWmb15hrL2Pprz4Fnvi9dkzzNx0HSIU0eljfY+5E3o7+mjUBBx/FZVDB8pGMRZft6EgV
	 vN21ag5IlvkOthg6UOdZ3lT0mUDcm0vAQJZifVyBbrTo3j8UqsgiN4ZDqqJuNmBsXLC73
	 TQ2/ew3H0JUyAWFwpKJnykHVu/MHHXZ4/b9tHyj8nSLYb/eGlBPGlA5zYE4F6yCQowQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794939222;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=VmJwPAKmkjpaPlFxmcST3cwAQG1JNPaGXGhzymmNX0E=;
	b=slhmubjYdbBBWwHxsCXyXh50cYe0aSoX0my1zOadC1H3EMJB0K9PlH6Nmg8ymT5hAhsy
	 v53zNx00wTuQr7HeVW0HC8widyms9zq43bhg7blqz6qUh3yfiqE7YbPcHrwcWmdVL/SSl
	 M4O0Hb7BvFb2ZcvSFX4v6SW/BfPBpel90yLP3lpGWm/4FY+25h/uwgIYql1xZkgSKXt9K
	 Ul0L17tCq8XgqzybMOKiQyI6lHVL6HLk+V12f1WxvnQ+bAOzWeQUaNkhVLfxfZ/Bh2oci
	 7S1CUZZZ4Z/mhrstaCTaPgeVhpVctyRdgydhzfd0HpgD7+GWMnEucF7PWthF4Dq0fBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O+eNLKGi;
	arc=none smtp.remote-ip=74.125.224.47
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A424B606A897
	for <linux-hwmon@vger.kernel.org>; Tue, 17 Nov 2026 18:13:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A424B606A897
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O+eNLKGi
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-67c0ffaae1dso1207881d50.1
        for <linux-hwmon@vger.kernel.org>; Tue, 17 Nov 2026 10:13:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794939221; x=1795544021; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VmJwPAKmkjpaPlFxmcST3cwAQG1JNPaGXGhzymmNX0E=;
        b=O+eNLKGizaKvCjcBFEPklrUdI6prwcylupkEF35VptnltgWqNEux7MOuHb+SDkx5jB
         O2YBkx70K56s4/CYCkiUSvGtyup8Lsx6SgYv0nnjy/nYnX15phR4QjgUy+4HIpn192gF
         kJ/5qnLgAvCPteGUvEgMXDzynLfgCneUUtyhyqT9ItC5tbMECcJW5nViiMWWqg5htRsK
         RdPzqrR+FATHhPikVmvkp08iBo2mqzvqGqqnkDbzguZ9r3QlGPxRnttdluSffAKHHH0u
         uvOVPqUyQmHk1gGbq9ONEY4DjkvDKZytgBIF7ddU81D5WDv3kwYq3MVRRANuE4pFuWOG
         FVAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794939221; x=1795544021;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VmJwPAKmkjpaPlFxmcST3cwAQG1JNPaGXGhzymmNX0E=;
        b=e6ZWP9mSq+5mFj7zvhEChuWvmbSIlTE1uMcg0RRo1s+Yh4mY+pLNOcFDnfQ8wiB+wG
         98BZhKtP9KhUXxNuKpd7cH22t3w627UGSve7Zw3JN3mIX7WR6J9uaYTOCiAVlOO8kx0Q
         D66K6ux6tGCjcbQLWz3oGk2eHp9vfb1K5dBWY1IK8cdTyQGT1Tzg45rqlXk8JLUZnGF0
         xW4lg+SfUeq4pVHjrSGy8tq+b15f+eCR7870r0GgpkVY5HKgUE1MEQg1lZa7NhYZTjcb
         5rap6ZigYrGTPvuBFVSTUGgeC6QP9ZqqN9GBnyo6+gbeomKAgTh7gwVvQItRb7uBCr8I
         k8eA==
X-Forwarded-Encrypted: i=1; AL+hErFIbrWkmCi2x3chkWRUm1vFle31oKfbnXa7dM6z3SrKNKK807uJzcfPeveoxOTf5viDhiakopdRS6cPhA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8VEN30NHLzYgCKzpUD4KEP+c0E5ewUjP4MHo188F+XeLiXbOAL
	o9hwFKCURNjMDBD+Rz61itAG1KFy+aQoTVEfa1VMvYJToT9s1mEnIBxAxH1zyecWUKI=
X-Gm-Gg: AZFdTZcsL0rGUzHvgmm2zioFjlcvpHrOBGwjdRpCCzMfXfky3As4WmPTDpPyMtkeKX7
	AMDaitSkLyWvB/sBIcu7Uzs9B4oHOVE9+pPbHJJ2xFYglpaMUX2pw+kdQBm/xfMYOShM/ywrNLN
	3cW4SG7zwvvOLfDB3WPnXLY4dzamexsggkIy5oI6INYu3583XlrcOt5wtc7E/k89OgdS8azXaax
	evg9qW2zFX7klJKt7GNf64F64n8/xTqgXY0FzEN7yBvEu8m1yH+hSKm99DeS/iUVbmpvfF9VsoH
	DLHS6AJmzawR1XrKjWhyCJCGQIZbMcglJnX7WfNLQ7GK7kDJvG7q5cQdcI5TeXDOBfkp5vm9mHs
	vEyJbs8TfOM4TSFS9wi7KSPOCkSXnR5sJCvTruNK2OzPCaUFkzExNz2VcGSF5sqR0sP5HrmtZ0D
	qoOMp7AIj8TtFndpNYp/6R5HbAHtYSZaN4J03fXsazgqsEbZOvLa3AQVEtYaYcRieFcBegdCD2H
	Ted/Fsq6v8SQV0PHmwNljXmRZljHvAjVqjrsWRobtpSPsbfm5O1Vpu/VN1uHhpT6o/y7i8p12AE
	xbwBKTuCfTUk2wpfAU12ihE5jugzHOY32fBPOIhGUfBW06WfPDL9mYxxWuV8kVdsuRcitu3vrne
	05keo6R9C/278PD8//ffH/8QBHDBYi8r3PTHcgcxN3tkiu6nT4zZknMR69TMI6DYlnm19jVb4EI
	60PIVBPmV3niBcThJT7np5UIPLNgSv2gtw+4uCLzs=
X-Received: by 2002:a05:690e:4894:10b0:677:c90f:46bf with SMTP id 956f58d0204a3-67dc7869e78mr1202178d50.17.1794939220704;
        Tue, 17 Nov 2026 10:13:40 -0800 (PST)
Received: from localhost (107-220-129-194.lightspeed.chrlnc.sbcglobal.net. [107.220.129.194])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67dd3f284bdsm291489d50.3.2026.11.17.10.13.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 10:13:39 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Tue, 17 Nov 2026 13:13:32 -0500
Subject: [PATCH v3 5/7] alpha: marvel: register a platform device for the
 environmental sensors
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
Message-Id: <20261117-marvel-env-v3-5-0edc370fdca9@gmail.com>
References: <20261117-marvel-env-v3-0-0edc370fdca9@gmail.com>
In-Reply-To: <20261117-marvel-env-v3-0-0edc370fdca9@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1146; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=eCxTz6/wFgOEYqUhWdz1P8hGqwqPQw6s+J+8BeCiWlI=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLL+zPTY//i0pq3747akHGmzgvRFG/gWHTaQnx15YdojP
 tlTJjL/Oz6yMIhxMcwUU2SJW6/IMqttx1Kf09K/YOawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyBDxygeIqfHoJFZXFyaWqSbVlDkkJdfkliSmZ9XrJdfkJpXkF6gl5aZVpKRkV9UnAo0Qi8vtcT
 U1dHNyNDAxNLRwszJwtHUxNnZydDJzdHR2dXJyNLcxMDZ0tHE1dKcgYtTAOaaQGGGv9Iqi2oDCr
 /0brrgzSkd4LnS+st1+S2qf2cssukOjV95lI3hn9bcpUq5DX4xr3g3SE4tuD9z+bQP/CHXdu4uT
 itTuZdVywAA
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

Register a "marvel_env" platform device on Marvel systems booted from
SRM, for the hwmon driver to bind to.

Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/kernel/core_marvel.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/alpha/kernel/core_marvel.c b/arch/alpha/kernel/core_marvel.c
index bd918028b410..d2e1e45cdf1e 100644
--- a/arch/alpha/kernel/core_marvel.c
+++ b/arch/alpha/kernel/core_marvel.c
@@ -21,6 +21,7 @@
 #include <linux/module.h>
 #include <linux/memblock.h>
 #include <linux/workqueue.h>
+#include <linux/platform_device.h>
 
 #include <asm/ptrace.h>
 #include <asm/smp.h>
@@ -1142,3 +1143,13 @@ long marvel_cfgtree_partial_update(unsigned long offset)
 	return status;
 }
 EXPORT_SYMBOL_GPL(marvel_cfgtree_partial_update);
+
+static int __init marvel_env_init(void)
+{
+	if (alpha_mv.init_arch != marvel_init_arch || !alpha_using_srm)
+		return 0;
+
+	return PTR_ERR_OR_ZERO(platform_device_register_simple("marvel_env",
+							       -1, NULL, 0));
+}
+device_initcall(marvel_env_init);

-- 
2.56.1

