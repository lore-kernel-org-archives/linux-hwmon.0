Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86D57383306
	for <linux-hwmon@vger.kernel.org>; Sun, 23 Aug 2026 17:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787507953; cv=none; b=DBhzVEzWMKxzZ0Al8yZ7RUVOTaS31duWpjps5ML1bgItypkZWK7muhtIXFtjmfkB5FC3hr1PQuY8uyHFRA70ZccWKcf906GFwmxSa/LbNEDXMx/24x+XFR6sj/BczyalXBXUYVA24pNUcsr+AcISd0NH8jGZ3agKKBOoR7IC82k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787507953; c=relaxed/simple;
	bh=fLQQ4JIzzuT4Vt7XQPvCoVjlsMWHJ7PoqIP957VnMqs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NmVLLNdNHSMmRbn9mmKtFVHWeI6rtKoTDOwn2iDKIOjvHoANHGsY3rYqrnElGkcFyHZhrJVPTH2WV/+EmHO3VYDr/OMKraujxI6cCCvPxs6dw+FrsKIptvvPr0fhjccSEYFz9t2sqfRVfMEcKJH7H2Tw+uVUHJ3DKNuInIBRJTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=inNZalsl; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="inNZalsl"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6a173ad7cf4so5052519a12.3
        for <linux-hwmon@vger.kernel.org>; Sun, 23 Aug 2026 10:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787507949; x=1788112749; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I19+PjIQNnODooxQ97qMirgzt/rnck5BIrQXPDznt18=;
        b=inNZalsl0ANHa0i+w0ICoAxv26GI6qIZPMzA6KRbd3R3jgUMQuYdi0CGDsSiJ0SLek
         nyZOfRfhBNZCFJradEUCw3c+UCBPiqhpy1yJeUSNac6VlwfLEZoRad4aPfOIrMSg84oV
         9Si0OT6kIpP2jee34x/Gfj984q6L70wnvKk2O5tuRNz6u2p7ektcOkgMwbszSEg6a8Yq
         46IbboLnDni+S3ciQic8n7Tp2alKQpzb8xQGcndO1yiqZlFQbhlDKqFcKfJXebVprt8O
         Me5evxPyY18InEREs+FrM6Fq7IWYixJTlL4ovBnSYDNJX/0nOqbJ5+MOBq17re0CLfsA
         azFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787507949; x=1788112749;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I19+PjIQNnODooxQ97qMirgzt/rnck5BIrQXPDznt18=;
        b=LHK9Dg5Zshof98UdCQSV4LKLLHL1T90Fm+CbvLNgzUVAA9x3Uy/eBUo9JacBFN/Ng+
         dz6g8tZAJZo1DpyuAMa52OXqSyHZJ11go5gKFJvJ63U7HBzH1CV8Ht+m6HLamq7gxQgf
         YZaN4+mUcGaWYwEoanu5HJwmb5fZarHVwqPejgoNf26VZJkDHcPgTtgui9mkUV+SJDNm
         gy9Gw0cw4yqyEKJQD888iQKntlx0KvOw9jW4t/s9M4EVDq8UFdQ0wJ9Eip1NfBr5nx1b
         WtXke8wenUvVjCt2bPp3AsjxOntX49bRuuh70FdQCbVX+JhKY661m7ScUZy+avb6cd7Y
         Ls0Q==
X-Gm-Message-State: AFuF++mciaYscrQk60Pf2uIk7F7h1z5wN24jEeRXYs1R26jeIywkRnED
	dnya/bfw6NtvkZZu0hQX2FCd5kMZBM9lqqTn/CIJG8RV0znw5N6McR8+
X-Gm-Gg: AR+sD10bZxRWfO6RM1g5D0Z9Y/Up/yjJ7UEdniHMyi9Y/z2gx/GM6nxdkLS+t+bvxPG
	1UuVawD7+/OUOqZR1u3+9be2HvxPpvXgv5y3otvbi84Z7Kz5irPl8w1ZZOxJ1QJyznILj+71xy7
	1/Le8cH2Xlfj9I9x4rsrtV+ocmxB/LTmrXvm7/40euJ6VSrmkL4NW4+bOdqwxVBooKZIMDbnkul
	L2bu1w59fmjZajSfMViqENZu5dbiB0whIScQou7JH6cvRJpjbrEBIPHEjO92nc+7N7KE3rcKzb0
	dk/w3E09toU7RbFbLCiLKPL84bZWgfSNobQhAnEASEu/rnNiJJv+O4BUTIHnQh8K9bzzmPz9g+J
	UZrNBt1EA9pd4jlLdgx3QQuwwaH/2dJ33kI5BQGD16x38Tfw9LTAXgShD45aqZ711GhMmKqxLOo
	AzDuJOuuC4LVQ/LHq1wrcmDVHt32H5Npzdy83xwBxBxYJP0l0zREB3+iN5aEDM9SzuAOfd+u1kf
	KCE2w==
X-Received: by 2002:a05:6402:50c8:b0:6a3:87b7:b516 with SMTP id 4fb4d7f45d1cf-6a582b25777mr12416486a12.6.1787507948478;
        Sun, 23 Aug 2026 10:59:08 -0700 (PDT)
Received: from [127.0.1.1] ([2001:4bb8:148:9afb:38d7:b606:f380:289e])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a59e199cb8sm4153933a12.16.2026.08.23.10.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 10:59:07 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Sun, 23 Aug 2026 19:59:01 +0200
Subject: [PATCH v2 1/4] hwmon: chipcap2: fix channels in humidity alarm
 notifications
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260823-chipcap2_locks-v2-1-6a26c8e9e2fc@gmail.com>
References: <20260823-chipcap2_locks-v2-0-6a26c8e9e2fc@gmail.com>
In-Reply-To: <20260823-chipcap2_locks-v2-0-6a26c8e9e2fc@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787507945; l=1798;
 i=javier.carrasco.cruz@gmail.com; s=20260111; h=from:subject:message-id;
 bh=fLQQ4JIzzuT4Vt7XQPvCoVjlsMWHJ7PoqIP957VnMqs=;
 b=9DUBcEZ9MfS/ltCluXensv7cQ6cP7LfZorGh88txRsFUX+EwvMAMqF2RGAFz/vH3vAEqb42Zd
 RGRLru7TivxAIWPl1JUrYOhqOOpzQoBtyAkat3Mxk0WO0XMFGsXdH3/
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=Lge8w8xidNSf/INy7JAIbAW+Hezkp3nsBh2OjKL7lLU=

hwmon_notify_event() expects the channel number as its last argument,
taken into account with the type parameter that it is a humidity sensor
type. Given that this device only provides one humidity channel, 0 must
be passed. The custom construct to enumerate the channels makes wrong
assumptions by listing all types together (temperature and humidity).

Remove the custom channel enumeration and pass the right channel to
hwmon_notify_event() for hwmon_humidity_min_alarm and
hwmon_humidity_max_alarm.

Fixes: 3af350929e75 ("hwmon: Add support for Amphenol ChipCap 2")
Cc: stable@vger.kernel.org
Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/hwmon/chipcap2.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/hwmon/chipcap2.c b/drivers/hwmon/chipcap2.c
index 086571d556b7..9bef767b589e 100644
--- a/drivers/hwmon/chipcap2.c
+++ b/drivers/hwmon/chipcap2.c
@@ -92,11 +92,6 @@ struct cc2_data {
 	bool process_irqs;
 };
 
-enum cc2_chan_addr {
-	CC2_CHAN_TEMP = 0,
-	CC2_CHAN_HUMIDITY,
-};
-
 /* %RH as a per cent mille from a register value */
 static long cc2_rh_convert(u16 data)
 {
@@ -499,7 +494,7 @@ static irqreturn_t cc2_low_interrupt(int irq, void *data)
 
 	if (cc2->process_irqs) {
 		hwmon_notify_event(cc2->hwmon, hwmon_humidity,
-				   hwmon_humidity_min_alarm, CC2_CHAN_HUMIDITY);
+				   hwmon_humidity_min_alarm, 0);
 		cc2->rh_alarm.low_alarm = true;
 	}
 
@@ -512,7 +507,7 @@ static irqreturn_t cc2_high_interrupt(int irq, void *data)
 
 	if (cc2->process_irqs) {
 		hwmon_notify_event(cc2->hwmon, hwmon_humidity,
-				   hwmon_humidity_max_alarm, CC2_CHAN_HUMIDITY);
+				   hwmon_humidity_max_alarm, 0);
 		cc2->rh_alarm.high_alarm = true;
 	}
 

-- 
2.43.0

