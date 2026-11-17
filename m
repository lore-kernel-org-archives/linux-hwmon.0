Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794939215;
	b=NWPVaXYyb/lekeJTGmxYH4hbA9T8Al+IQLjC5lQVpnvM/8Ex9TqFAWoWVzuRCi1sw41K
	 lwZLk5Ex91hcx2R0HJ2yWnF5xmQPSORRYUalAwiVbJxqJ5dlbb06Zqi1Jdjg1EsqNUqYo
	 vzVz6aUVprQ/vviM7q7lQ8MnsGPY0nsyQGXIUmjvd0sNJw61kvStyeyflv9dV4gl+DluB
	 oYrxc/2KXFPl9ASk301t5qMch9KglYQFO17G/8dwBfiprDeDMv8Qoqw3/MQjmrQ5MrQsT
	 C+0BnSplzglampH3ijEJtnM3tRPK2ZakrOTrcUE/WmiirJNOzTsDGy/H5TSOfh05OFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794939215;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=meL0+rTQnSRPz7Yn2GzsMx3xxjISuzA0apMMf/0RgbQ=;
	b=GbjWHMTKrmA4WnA/FFvR7xdA2a7yBMG+4J69ISrWPSD//sWrpKT1NKZBc2plHNnIKgY3
	 wBfqb4JWhlDlrJadPU0aNmJQUdeM/p4/h2NDkwsw3GJW2qc/voNYPxxRR461UfU3q+v+f
	 AOjEAz1A+/nSzWput9zSLz5h1x8xJQpVgkX34syV6rD+ywrgQEmN1+oe8z84M+ZRRpsCB
	 /Pj2kLIH+v0Ut2BnRVyZRNRXQGmDTfnuh5WuGenN9Gk/kiFcpOFW3HnrmR49PHcsY5KIS
	 HpsOgNsgFVsZZxZSsNC9X4i2vcDbqsUTCL2EUZgQzBV6PEbeLraEXDOrVMuHR5vzvlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Rqr/hizJ";
	arc=none smtp.remote-ip=74.125.224.41
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DDFD606A89D
	for <linux-hwmon@vger.kernel.org>; Tue, 17 Nov 2026 18:13:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DDFD606A89D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Rqr/hizJ
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-67be4f2f4d4so6196734d50.2
        for <linux-hwmon@vger.kernel.org>; Tue, 17 Nov 2026 10:13:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794939214; x=1795544014; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=meL0+rTQnSRPz7Yn2GzsMx3xxjISuzA0apMMf/0RgbQ=;
        b=Rqr/hizJwM04N5r7rdBlI1SrpCZm1YU2VwykcRD4dToC01j8O0eiPOi8Zfdo+cSsEe
         KepkZt+HzaSliry7cfleqlm+vsu4kjci8eNfqf8ZW3D7n2FU6NT5ga6OyRwovGfvl7u3
         moafL7fNIaKLFfV5rLTysxDKefHgo2Ste3Vh64H4ghp2hsu/BLV6Pa4fKa+pUfA0nXT5
         POTyodqTZK1gOQDkzhdPVkul/bv3zKZlZuhLJIo88VWu96PktIZfaiYanN37OPuObyx9
         vgeQG5E4qagJYZGOTrtTjO4v+BZSFK2wUK8eHyxLKXvbbb1hzVoVMMYRSQdGAcRYgpct
         78wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794939214; x=1795544014;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=meL0+rTQnSRPz7Yn2GzsMx3xxjISuzA0apMMf/0RgbQ=;
        b=eXkL2gGRagvYZVpb9orN4kM/EsIEg1gOigKmwVgpUFDFouAuk3xFBfvQ5dgK0R9Mzs
         ipSuef3lqZeiXuvo4RoRXwbvTMUkunQ+C+CINS3hkcsqiyszitRuJfjVyCjq6+AWLRd3
         lqZVon+Vdlv9/xLLZgmVYV9x2HFSJiOe7Qi++7qALUzXM7IE2rHQiKGzNOuVdzDy7Zdu
         0gExSQJK8FEb1yAEuSzp5NMcYRn1sH79LpLJnTbAl4y+tUuic7CY0NFvXLAOii/TqxUi
         gHDl2YVACh6DD4Khi1oDHG8qVgJrHB81ba5nveRp+aNf4UWBsY0YTN571nTgb9WyIrHa
         XlMQ==
X-Forwarded-Encrypted: i=1; AL+hErErpRuNhLe0irqkG7/9J6sGkCq8xRQPe7CWdUG8+QEos01/3oBdDInLaTXuW+b0XAa+DJSqfT0zAyrJ1g==@vger.kernel.org
X-Gm-Message-State: APuU4Z+ekzF0tJAGl/aDv2+VQU/n9Z8GdZLArSOz7VHdstNXmx8GACid
	oxm4C46Oy/UcPdAddtag+QhlHYZKHwYKFH+kqO+AlYAS5CMyLPYObc+f
X-Gm-Gg: AZFdTZf5Akd3FhYvHXXSI1ogeRcVJZmtV3CaAy3jz8QZkR97IjYD934FJy5iHJ5HFqV
	n8JEaa42bn89m0/XrjwF3+q8+sY31Zg2X3Z123Huvx3zS8yC8+8lExl2B/Dy0I//PfkxrctXBXX
	u77KxALje2NTosuRCt1lPRE42twAxhln2n18mpFGSPyjiW1nQEz4vh3Ep2n2n8g4KTf+NQlz5eD
	KU7MhsPzJQis0ZowaRYhNXqzpyaH9uvf2ztC9mHhfcAyx+ic6bzsgsyHenMej1WiBDE4oskaY3P
	AAitxhcykczBR3ZDrTGQKp6Npa24lcEbOvpDXWKnocvQNZpgXT5iuols1mk4KYC8NjXbgCi8gwI
	A0Nt3FHyJrAN5l9IOFXCRGg2DLLHAqKAehr+DttCicYaerb9tBvVsHpzeKkHveVSN7ILm8v9akL
	o0t/4KYN47B+Ohp5CuJn0aBxnzgAuE44X7wytNjrezsVlmSxwovprnPYILoh9Uf6Xdj3urTQ48I
	sXxwZebX4D/Nw+mKlq82rzfobmFXUqvPyfEySx/+INwHxJPiKY10n4xKIXVzBB2wSmr0MX/GEeu
	4UXnU1qscli5EY6ZqOBGZe3nGrbqwIuNUxT/7mmz551TH3EFZAXhpDU2ptGTbZBD/gm6/oNDj08
	DIntFxkUsFeTwRzQTkTuCStzopZpLL1hECxzHLSFvEUg8Bakxu5YuHifHhsKtwgzSV3YQXgeD/g
	QfW3sfTHKme5FjjDZLGA==
X-Received: by 2002:a05:690c:6884:b0:8b4:e4ec:ce6d with SMTP id 00721157ae682-8b4fed78f0amr379807b3.73.1794939214002;
        Tue, 17 Nov 2026 10:13:34 -0800 (PST)
Received: from localhost (107-220-129-194.lightspeed.chrlnc.sbcglobal.net. [107.220.129.194])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67dd3fed5e0sm269767d50.5.2026.11.17.10.13.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 10:13:33 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Tue, 17 Nov 2026 13:13:29 -0500
Subject: [PATCH v3 2/7] alpha: marvel: report environmental events without
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
Message-Id: <20261117-marvel-env-v3-2-0edc370fdca9@gmail.com>
References: <20261117-marvel-env-v3-0-0edc370fdca9@gmail.com>
In-Reply-To: <20261117-marvel-env-v3-0-0edc370fdca9@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1534; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=oaDjaxtiZhTza/9Q+dIadPybMp9H7XVMHIR6nixhj7k=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLL+zPS4do6tJej8Qo3K4pUai1r64iQ/OB6bvq06wFnh9
 enzUVa3Oj6yMIhxMcwUU2SJW6/IMqttx1Kf09K/YOawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyBDxygeIqfHoJFZXFyaWqSbVlDkkJdfkliSmZ9XrJdfkJpXkF6gl5aZVpKRkV9UnAo0Qi8vtcT
 U1dHNyNDAxNLRwszJwtHUxNnZydDJzdHR2dXJyNLcxMDZ0tHE1dKcgYtTAOaac5KMDEvyCxZoVf
 DXn7AILdtx97zkt38x8yqdFjlJ/23XMjfpfcrIsP7flWshMtsm+FV29HNHPRM5XzcvbOWcLY5i+
 nZVP89d4gMA
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

