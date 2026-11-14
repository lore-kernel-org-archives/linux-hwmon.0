Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794677995;
	b=iGcJVwojnx6FsIvnM0Tm1JK5Dg/r/kZXV8XCFt+8JiAnWZ6LYB0CIlRXgxSGukKabeIq
	 OeexiMDPvurY9sQE9RmS6Ebq7PXtmco+dQvphA8TjQsh71Kazd6ULip9y8PyMK1MV2FYT
	 QqptkVWZNGhJoZp7mj8dEZ8Jb+cErzooaukxkzLSB9WzkrXHT2/q6pyFAGTsR9RAD2KD4
	 TSd6Nxyta+pzkL7jLD+7XymBsVWFnifPOQq0tcy+NpVigllEm2QYndmFOUQTWmO0He1mT
	 uDsJkwNbzgdjKkLvEuIhl8GoRPS4U1g1YB9smDyeh6jJu3WWIYKbhm5LT58SZwLDbug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794677995;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=qgqkNu/xXP9vqOsC9ZN4I/hRCMACL3QLg7r9ANeJW3k=;
	b=RqcvlDeAPNAt0Ukst6wVahU3oj7qhC0PPv3l6sVzkPwRCTR+6vEf+RalS5nJsZbUlwN0
	 xhFfGnODAjzy4RKtvlo1GBveqdhLIba60ewKvjh+a5TG2L9Kwgt7sQBeH2vgH5JsaWVPV
	 P/Zd95bD90hOMv3v8ZCHgLZFRdZbZVlTXRXQRkDg4blkenM3kjxbjO79l1+sJ6elvdM9Y
	 BF4kzzL3XzchWPDS613HcAhqCgkjs9jIuy/2ZHHOffxF4ou9C5ZeS8IU2rXlrSmQVF44C
	 kSRlZHBhMPChNQfcgAPZ741L2H6e1zIj2G1ukfMl7OydEU0gnIT4GxFRcsogk9lQUWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k6drsopL;
	arc=none smtp.remote-ip=209.85.128.173
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA6E606A88A
	for <linux-hwmon@vger.kernel.org>; Sat, 14 Nov 2026 17:39:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCA6E606A88A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k6drsopL
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-8b32daac9d7so15167497b3.0
        for <linux-hwmon@vger.kernel.org>; Sat, 14 Nov 2026 09:39:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794677994; x=1795282794; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qgqkNu/xXP9vqOsC9ZN4I/hRCMACL3QLg7r9ANeJW3k=;
        b=k6drsopLEdEuqFlLxE/NDeKDCYT530WfFE/TrzGfkN4YICfl1q/noav/2UgzS/a1TL
         XAvCon6wHJfct4UGuRE0fdGIEwC6LlOrLsEiTaVvg5m8VOfBK49AOT4SHwKRQB2MYhKw
         lU4Hxa1dwR7wsLscuK/eqGZN2QbHRyQkx0jzY8ENcykrWXHxpIqz9NinggpEmDVQXkO2
         mjb3NhC9TlCC2GgWjuxPtI17JlvBrIaZYb/LEyWjbhpsCa0Cyc8fCnjZo4aNe/Z3JL89
         AH8GVtQOnYieC/xYl97G0tv3ZbqCHmZvs4erUtv7UVW8GwzvTkCuL6ktH6LczGZTUmeH
         YpMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794677994; x=1795282794;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qgqkNu/xXP9vqOsC9ZN4I/hRCMACL3QLg7r9ANeJW3k=;
        b=KnnLI94GaqbHmR/d3wejJFYRHtMjHoDgBh5LO5RGmHK5+j6feMUrlzx/0bVPjOCSlD
         aFxUAZpja74KB2BrtHZCTHdP+PTSzibFd3JLVWAgGSRWV8+aILvWm3e4silEc6saPvqA
         RJa1KGUNDVftbyHJmxwgXM9DeNEH65EsEKYqD6F1GGFkKJouNHHmEE8ksWZk14gNNROW
         6qXn+4sEJ0P9msYellhxS8/N/5JM7ErtmaADLJ/yIkQJCIoEF/mJgGPmE+G7H0bFmBO7
         puxlCINVx8N8xM1S0UTrdTUin8AkWfRUZUmg9QziJU399FZIvxaGZulorWZWbJHyv6yA
         uZsA==
X-Forwarded-Encrypted: i=1; AL+hErEzYfIhWqRaSxc1A7xWck06qsd7DauL7D/hokkNq9eq6FF2RTYbQTDxiPps8xYaiWa9WdCS6CPDcK4GaA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/cwrAeatk02X/0uy6d2ajXxeptxi29fTM0M05hqpJ+IIM6i8SC
	ozEkDnuv1VopL0Y9LNFxYC/AZWHr6k2PNIKUkrQeXJqpwlICQLvlyo9N
X-Gm-Gg: AYBFou3G+OG70WIpPPMjezysQchMkVmFwUACo5RMTb5Ok8VaqYSmqapJBiaIDkhwBTN
	7DxxCXo+AvnMA1HCoS0q5/zLzMbxwju2sXsQhphd2eTDppz2C39Dee+vWNXovCOV05U4LmbiSld
	d0i0Z4y0u3swZD2ZZbNZdjdqm6p/3UcwxEjzvoR24jCO4VPO3V/ahFJKKRwnWcyeXsDndWrOqd4
	f6PWPTyLnZ+P0F+Y8q1f7ajchYch3eWUnbWoTRD/1L2bgyQHznGzmqWAurx5BZnjtbeSwd63D2M
	gt/Qg/ak+lkpTgwqgKh+lFTan32Uz7UN0wiBID8dXxO/tBFV8Hth9CRxvgGFDKKWROOxtV57kdB
	j/kuzl7OlRQBy+sM3mxteWBmV7U+M+DcK+TCJlycukyJ6n8CcgpRVwA6azANU1/NgNXy3HT0W8N
	wkEXuS+i5Xg6wDT2bOP2F7XJ+NfdTtNOcVPvbUGjT1rVAzVZvhTZLQyxDaNxHeOvPUsLxWV8BF+
	TDLAM+ngz82B0VbW7Id4xRY3/ZytTLWWuqyfpCJaSA7iDDzhewMq3wbRSm0JjaEsCMYe3CUl7tl
	NeIpNl4NyzHpqKYazhkkRHxS4lRt00GMajsZteKiOeexmwMUS7IbRkVIPYv9iZfctFlvNmzvMD2
	o40p5zEVOtMhq5XUt3USD38MXxSZFhpu+DmPgpQ0LKuYMCw/RtPu5LLCbGYDcLQ==
X-Received: by 2002:a05:690c:a849:20b0:8b1:533a:e19 with SMTP id 00721157ae682-8b3bb296857mr39010357b3.35.1794677993918;
        Sat, 14 Nov 2026 09:39:53 -0800 (PST)
Received: from localhost (107-220-129-194.lightspeed.chrlnc.sbcglobal.net. [107.220.129.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4aa9da90bsm48215087b3.37.2026.11.14.09.39.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 09:39:53 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Sat, 14 Nov 2026 12:39:48 -0500
Subject: [PATCH 2/7] alpha: marvel: fix the environmental subpacket layout
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
Message-Id: <20261114-marvel-env-v1-2-890328e4b7e5@gmail.com>
References: <20261114-marvel-env-v1-0-890328e4b7e5@gmail.com>
In-Reply-To: <20261114-marvel-env-v1-0-890328e4b7e5@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3291; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=N8IGXtCKffK0ze/UfS7rq8ZxTgXFnR2UM7OuuHAxgNc=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLJ+zHnMO0fTV7Tg3uYDE1etXm9/0dCQsU3I3oJTredV1
 K3HN276dnxkYRDjYpgppsgSt16RZVbbjqU+p6V/wcxhZQIZIi3SwAAELAx8uYl5pUY6Rnqm2oZ6
 hkCGjlE8RE6PQSOzuLg0tUg3raDIIS+/JLEkMz+vWC+/IDWvIL1ALy0zrSQjI7+oOBVohF5eaom
 pq6ObkaGBiaWjhZmThaOpibOzk6GTm6Ojs6uTkaW5iYGzpaOJq6U5AxenAMw1Pd8ZGQ6f+qzE0q
 /NOMEo6/kbc8u7YW+WnlAyb/ctWiYt77PiRggjQ6eXzfr39xS4NyvbyV6fVXd+uauzB/eK2zXB4
 SuNbmxPZAMA
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

Assisted-by: Claude:claude-opus-5-5
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
index 832567a3ccbb..46c521cea9a0 100644
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
@@ -49,17 +62,10 @@ marvel_print_680_frame(struct ev7_lf_subpackets *lf_subpackets)
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
 }
 

-- 
2.56.1

