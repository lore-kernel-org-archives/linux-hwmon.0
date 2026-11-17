Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794884354;
	b=nRGOPg1uwE3DoS+dPOkyTXqThQbKfixMfACw0CaaW5mP+sdNqJRR1cHLVnWWUNj0pWjc
	 Oh9+v1fA2Yl68csU/gHtHd0HfUrshPdTZ/5ipqs6/CmVhyRp+0nL+yJ25b2ClsB8ZumaA
	 lc3wxHzI1Sj/HT7ND4AuTL5XFJh3plluNJXHOAlwXfzCkP5u+mvWZj/jgBWAOmzb/hAyT
	 rMsCM28rHQi+7j8hLKlnqo0n68uh9nDomaFpTyRPNCBPSRtnAwgMIu1n5GJOkEq6tHAeR
	 ejykMeSNOzFNE75j/Q/dxq53inHBbuGPhx9lPnDh5PPvjAfnPPN7LdsiW3iR0tnhLVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794884354;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=8P1/Pm6zdpbmVBckxFfIxYUQ+6NaRKkAOkiaJp3aUKg=;
	b=NCJuIBmwYCrupVl9pL5nw0B/2bNujGkUC7fotU15i+npPgeofMQ/4dpuzXTgfTvrt/Gs
	 xSsSFRZUDb7butxz+hTUBKJGhwRXbyZovcjckyMTfMMyb+QWmzT4J6BEw2w5xfGabKQsN
	 j+/yX3jzOg6fmLeg9AkHE+nrsX0RIyH8wkT3xfV76aGddluDzzwv1ezxJ6+aPkNwFg7Gw
	 yRFWA+UJBLQIjCl57cgZm2OG1rq2a/zfMwWd2kZJ2MrNXnIZMaPrViIdpl+Yilyr3cXmo
	 SjNV3UT5c/mVFwa5b8fIdRD178IHFXIcBLFH3332DKoeUExeQuhrNJAiUCD6XDlmi6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wL80WENN;
	arc=none smtp.remote-ip=74.125.224.43
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 566FB606A33B
	for <linux-hwmon@vger.kernel.org>; Tue, 17 Nov 2026 02:59:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 566FB606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wL80WENN
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-679a2b5fe87so4331114d50.3
        for <linux-hwmon@vger.kernel.org>; Mon, 16 Nov 2026 18:59:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794884353; x=1795489153; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8P1/Pm6zdpbmVBckxFfIxYUQ+6NaRKkAOkiaJp3aUKg=;
        b=wL80WENNSTootYxtR+B3YqVHCVtpSWi0ER6jk/PCnQBPezPc0/U7vRAzRMzzc3UCQ8
         Yx6eZ8XDwdxhz+AQ18JZYy+Rdwtm3/R4/ERR38NvW8P8P05NBvpDOndLb8m94oxTizGk
         uBipB3yR05uvDI5wj2SRRVzj2SbfVT50/JegaA0WhKUu3bxNjobo4t/MrXxcFQdQQeJX
         5TsQzLd1vmDeUmJ13FcBT3aD9k3GjFSVKrnyDxIOT1xB1hmewVNDYMz67TctVMkM8wEe
         ptCeZEiAXOnhNd+FQdyCNqWpHGBUDCZXmHUmHYFfJ91f2CaGgDImCPivQ1NNbE5vjXT6
         m/uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794884353; x=1795489153;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8P1/Pm6zdpbmVBckxFfIxYUQ+6NaRKkAOkiaJp3aUKg=;
        b=LCPH1GBUXGtYWNPy79tzukFF/QroAc2bBHlMKeCZpRsQOc9293YfUnEU51+R9hXGs4
         0D4EjmUltcRuCSi5yUhIsdVnq+v+Vz2DL2fHFVKlmnZGKp8KX92Gl1GzqKqnvAt+S6Ny
         CR5hTeNJNwTFrucaBIvP6kMj+BIKLUu2+CYMy56Z5RT1NEAS/TZKYvVPjpZ8wbgavmo8
         bfzo07gT/Vcqj8oIj6grxMcOES6NciTtLEl/cdqjXde4KxDzVxbLEh8b4rOWEha+XgJl
         ZS9Ptan0gp/KLMLpJLzoAW/calMy6hLqqxwSjOWMq1d3TFLnCrIfrncGMLGQj/FhDc2P
         PP4g==
X-Forwarded-Encrypted: i=1; AL+hErFrxCMNhQXbOwVBcO5wKKEE7sEeNSpMdVtZs8VYilxJYkNrbXo8X+SBCYraYcAffhLkjdMFiwRss3igkg==@vger.kernel.org
X-Gm-Message-State: APuU4Z9Sty8jmrkHJtPdqaopFzcvpH0v5A44q5Of+DPX4WggLbfA6b+3
	88f/b8946bWzpBw4L/aEKuFlABqT/gFPaK9jr5FCTyLUv6IEF+VFi0DU
X-Gm-Gg: AZFdTZeZZbelBb5bBY1aqtqvpL4WdVWZtgd2EcyrQL2DHacn8UGaAYodsF5crWc5ld7
	iZQsCkTFjKCPldR7++cWPcuWr6FeOwmHLs45fEF/q2JjHL30CTHDOiJ8X7/cy6pnXyan7LC2Yo8
	Ev1kL6I/YdV/zUTLSnjnszwf9Rvm+g3laiF02NppsJGm+aEcct2nKoKjhht8AXre8Z3/N+4AF+p
	v+1bjKIBoYWVcqeVJtpKGCFpCCkwhbqlMXDGnV0PjYaSJw+iXDhIAzXPdtaL+3aCsjUPHTJ7RbW
	iFfixXwheoYaQVfBJYPD3fZwmSpwQQi5oyZ2sz/s6FDyvcs3Txn29tV+Ur/EcdK6JotlWqBn1C9
	pjNJQ4szylTGLXuJ0Y7J44V/DaKpi8LswTHe1Gp06+Fgm5teU6+rDNropGl++rXA742u6G8o/s+
	h/aN6EmRPbyoFtrSANtIk16CNoX3kSyHUOl8FaPqe0an4mDuQ3fDOnuD75xB1Ky3MwujmtLE9A6
	GJnuCb03DA37fAh+v+xxPVLKOAK9CSNdrlUWjik09DT+cnfHRJOvbFs8ixv7ueKCldvcQCZoQLA
	ClU1xSdUIl50ZkBemuVdjmbcCGf1wsLreFjiqa9CCels4yjEUz4stYEXJaCMJf9h3GHdv+U/KLu
	VzM54eI+Bq2+kOIPbS3vb+bqJihc0Zi/XYxfuxv9LA2Ue61LjaNZ0WIubqTDFOBjF6vRdzdL1Mk
	spwkIVht2cnblUjYLFrg==
X-Received: by 2002:a05:690e:b89:b0:67d:b299:df5e with SMTP id 956f58d0204a3-67db299f0camr2146318d50.108.1794884353312;
        Mon, 16 Nov 2026 18:59:13 -0800 (PST)
Received: from localhost (107-220-129-194.lightspeed.chrlnc.sbcglobal.net. [107.220.129.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4ec069d3csm14474487b3.28.2026.11.16.18.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 18:59:12 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Mon, 16 Nov 2026 21:59:08 -0500
Subject: [PATCH v2 1/7] alpha: marvel: fix the environmental subpacket
 layout
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
Message-Id: <20261116-marvel-env-v2-1-ef614eb2e7f1@gmail.com>
References: <20261116-marvel-env-v2-0-ef614eb2e7f1@gmail.com>
In-Reply-To: <20261116-marvel-env-v2-0-ef614eb2e7f1@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3288; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=N9eREZDTgtKh+3whukIkS3keJAYcEhk3gX0b/rM2its=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLJ+H/rDn+Uq9cLsRvnN/k/mcbrFSgELM+9JLDM9dTw5u
 SpfNGd+x0cWBjEuhpliiixx6xVZZrXtWOpzWvoXzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 CGToGMVD5PQYNDKLi0tTi3TTCooc8vJLEksy8/OK9fILUvMK0gv00jLTSjIy8ouKU4FG6OWllpi
 6OroZGRqYWDpamDlZOJqaODs7GTq5OTo6uzoZWZqbGDhbOpq4WpozcHEKwFzT/Jfhn1m9ueOWxm
 bve0Xut0Xjas401AktCg7dO+8z85rFdz9Vv2P4HyBZt+NUnmfmOrUNvKe/TO83//lgu/DkJF6Ly
 t4gkfvPGAE=
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

struct ev7_pal_environmental_subpacket does not match what the MBM and
CMM firmware (V2.7) put in system event frames, which is:

  +0   cabinet
  +2   drawer
  +8   PE (the power and environment node holding the sensor)
  +10  sensor index
  +14  state: 0 ok, 1 warning, 2 fault, 0xfffe unknown, 0xffff removed

So the byte printed as "Condition" was half of the sensor index, and the
state was never printed. Use the firmware's layout and print the state
along with the sensor's key. This matches the frames in the error log of
an ES47.

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/include/asm/err_ev7.h | 16 ++++++++++++----
 arch/alpha/kernel/err_marvel.c   | 28 +++++++++++++++++-----------
 2 files changed, 29 insertions(+), 15 deletions(-)

diff --git a/arch/alpha/include/asm/err_ev7.h b/arch/alpha/include/asm/err_ev7.h
index ab17e6333764..5d30af0221fb 100644
--- a/arch/alpha/include/asm/err_ev7.h
+++ b/arch/alpha/include/asm/err_ev7.h
@@ -147,17 +147,25 @@ struct ev7_pal_io_subpacket {
  *	   class PAL (14), type POWER_SUPPLY (14)
  *	   class PAL (14), type LAN (15)
  *	   class PAL (14), type HOT_PLUG (16)
+ *
+ * Cabinet, drawer, PE and sensor are the keys of the sensor's GCT packet.
  */
 struct ev7_pal_environmental_subpacket {
 	u16 cabinet;
 	u16 drawer;
 	u16 reserved1[2];
-	u8 module_type;
-	u8 unit_id;		/* unit reporting condition */
-	u8 reserved2;
-	u8 condition;		/* condition reported       */
+	u16 pe;
+	u16 sensor;
+	u16 reserved2;
+	u16 state;		/* EV7_ENV_STATE_* */
 };
 
+#define EV7_ENV_STATE_OK	0
+#define EV7_ENV_STATE_WARNING	1
+#define EV7_ENV_STATE_FAULT	2
+#define EV7_ENV_STATE_UNKNOWN	0xfffe
+#define EV7_ENV_STATE_REMOVED	0xffff
+
 /*
  * Convert environmental type to index
  */
diff --git a/arch/alpha/kernel/err_marvel.c b/arch/alpha/kernel/err_marvel.c
index c0c0ccefc467..85f7a56816ce 100644
--- a/arch/alpha/kernel/err_marvel.c
+++ b/arch/alpha/kernel/err_marvel.c
@@ -21,6 +21,19 @@
 #include "err_impl.h"
 #include "proto.h"
 
+static const char *
+marvel_env_state(u16 state)
+{
+	switch (state) {
+	case EV7_ENV_STATE_OK:		return "ok";
+	case EV7_ENV_STATE_WARNING:	return "warning";
+	case EV7_ENV_STATE_FAULT:	return "fault";
+	case EV7_ENV_STATE_UNKNOWN:	return "unknown";
+	case EV7_ENV_STATE_REMOVED:	return "removed";
+	default:			return "unrecognized";
+	}
+}
+
 static void
 marvel_print_680_frame(struct ev7_lf_subpackets *lf_subpackets)
 {
@@ -50,17 +63,10 @@ marvel_print_680_frame(struct ev7_lf_subpackets *lf_subpackets)
 		if (!env)
 			continue;
 
-		printk("%s**%s event (cabinet %d, drawer %d)\n",
-		       err_print_prefix,
-		       ev_packets[i].name,
-		       env->cabinet,
-		       env->drawer);
-		printk("%s   Module Type: 0x%x - Unit ID 0x%x - "
-		       "Condition 0x%x\n",
-		       err_print_prefix,
-		       env->module_type,
-		       env->unit_id,
-		       env->condition);
+		printk("%s**%s %s (cabinet %u, drawer %u, PE %u, sensor %u, state %#x)\n",
+		       err_print_prefix, ev_packets[i].name,
+		       marvel_env_state(env->state), env->cabinet,
+		       env->drawer, env->pe, env->sensor, env->state);
 	}
 #endif /* CONFIG_VERBOSE_MCHECK */
 }

-- 
2.56.1

