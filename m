Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B58B7388E4B
	for <linux-hwmon@vger.kernel.org>; Sun, 23 Aug 2026 17:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787507961; cv=none; b=RMgqXQM5zo1AA/uyoSlu+MKg6A7eYofhaYaam1nqwTKShNftrguXk9QRaC2WenyGlTOvzBYuFwXXPBsJioS3Y4yfAATyvyzusjaG/fF1KxkRDhIKwQ8/d5DjBrJCGWoEpWDpcUaRPhib5CV2InBMncGFERzARcmzodKMqJLkZUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787507961; c=relaxed/simple;
	bh=OLd9jwlnqoCKmW05aLl+FzhuGsqsi3L3dHXRNy9HTLo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m/sX4LixIK5QE30B1qjbwZBWV/DQZX0W/bCF/M23W81sNnafjAQGnBN1l2LTjAh4imHVoh/lJj/u+eJFUpBwaFsE+Osw6fYlXW2yusZ5WKVqeTCE9fBSsNJvW+19fjJ7XZzk0u15b5FfLPYcAtP4GU37tE3IT/iDdNQAvQqGZ8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mCM5N3IQ; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mCM5N3IQ"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6a386a34603so6498703a12.1
        for <linux-hwmon@vger.kernel.org>; Sun, 23 Aug 2026 10:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787507954; x=1788112754; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qm1o//RsN8ARpvy9uYBLbnotafV4ghP1JDsyKT1NBig=;
        b=mCM5N3IQj1JRU+PbU0ZRvis4itS6zEYzfPHvIy+RIt6++uGLJovzoSu8ce5wt4d1aE
         HvtyEwsLbSdHhqL+qFDOobanwzo9iiFht5fkx4CGBz4dpSoNdLxNA/a6nc39waq79J8L
         z7ytypvX4jmJKBbJiGPIBnkYOzQrKVeI8DkARd6NQN6R83R9qTYIwgbbJZY+u1dbooxJ
         Xxupd2hq5/RBPIMvpHVvz16tuNPBv0R7kLfTGQ8ils8qraUcaLCyUvMYlpauCwmWTI6k
         qAQAL2XdgHX/iuICEFTqGf1RFwHkpZCd2WsN/JZvxs9RVyRUaeg6QbxT6mMoQSx/NP2w
         96Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787507954; x=1788112754;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qm1o//RsN8ARpvy9uYBLbnotafV4ghP1JDsyKT1NBig=;
        b=dWusKx+p6EpkL33X+/wNbVaTZkNoFTXZ9k6/B78bLtfX4sDoM7EPClCVsJDYkC82zh
         s4sO/55xci/IgaMpmWmyRhwaZ6jIM786MfOnfeOdJsoGFCBNIjyWa6CwfaYUnQN+1rMB
         DZ7WMd2scJa783tCJ5HExgHemDUdmmsh4cHTCrOqFXT/sjDZlnB43K1adi69cB3ILa2h
         hdvxXHqR7m6F1wV3Zq0q88TNTRFw6JTJeKdCBUMuwGwl3nvnkjl7yFBhmarYLqsebfQI
         1jmmcmaeeLX2GDZU+gpYLfSDHcfdA+tQY+mJimeJWgnwzBranoFTZtPEIivpfel22LTk
         ouag==
X-Gm-Message-State: AFuF++nTw958BZfLzCGg/g/HuVgpGVJDHsKHvpOWkT/qQ3llW2T92nCp
	DEoZV8SX30Al7Ke3boHix/4nu707BDubhcQKsUH9ecE5t7UCc8SfOy0F
X-Gm-Gg: AR+sD1224VYlnh+Hrn7HilAT20BzUtqe/U76V+sg0thi4W/0uNO6/DivX7ISNRqUyDd
	nHGyOLE8lqolV5EoJdkQlY9vF9WdDlndvkWTTsKdNmWiOals+SejkqdKKLfoEaUwtQ+PhOnCIHE
	s0iLHayFRhevjA6AIxrbP1J8Op4wXF8uCI66bq/5SBC4x4OUUW9rq9RFDwbaj51mVxvwNFgO5B+
	3rnpv48Morpus+t+nNbpSZot9UKtB1oTNqDhuccssa9DsApjwu443JBKFN7GixJuah0M/kcxCvE
	VHy30ZVhXxaeV52vCCwZOzHmVGcsG/BalXLsh0RzoZcGui3eHy2rGJrxflVOYysVz0LLIgU+5PD
	0So1LEIfGTS5mMXtZZQH1eJzp6zI6oLBMmW/fX3hoYEVF+sgTUToBfmQYHg2adtGe1otH1kzTXf
	gRXgDKHpa5Huk2twdwIiVi5+MZuiMWg6qMjesGvqVoWDuuvpo06oY/NkfWEhtU9CFC4frOu9qkD
	OpuPQ==
X-Received: by 2002:a05:6402:52c3:b0:697:8b0c:36e1 with SMTP id 4fb4d7f45d1cf-6a430bf0c5fmr20193459a12.4.1787507954379;
        Sun, 23 Aug 2026 10:59:14 -0700 (PDT)
Received: from [127.0.1.1] ([2001:4bb8:148:9afb:38d7:b606:f380:289e])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a59e199cb8sm4153933a12.16.2026.08.23.10.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 10:59:13 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Sun, 23 Aug 2026 19:59:04 +0200
Subject: [PATCH v2 4/4] hwmon: chipcap2: serialize access to low/high_alarm
 indicators
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260823-chipcap2_locks-v2-4-6a26c8e9e2fc@gmail.com>
References: <20260823-chipcap2_locks-v2-0-6a26c8e9e2fc@gmail.com>
In-Reply-To: <20260823-chipcap2_locks-v2-0-6a26c8e9e2fc@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787507945; l=1558;
 i=javier.carrasco.cruz@gmail.com; s=20260111; h=from:subject:message-id;
 bh=OLd9jwlnqoCKmW05aLl+FzhuGsqsi3L3dHXRNy9HTLo=;
 b=wBQvzQDC8odzNuxzagOcjihZm5c0lGbgrQQo+evF/jVZS/Mn2j1GIkc8cfunXhm5Us1debSId
 84Vva+ooobHCdbsSBNw0XyH+vY2mIXHH+J6M+u6fiyyv12b0Ywgnwae
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=Lge8w8xidNSf/INy7JAIbAW+Hezkp3nsBh2OjKL7lLU=

Access to low_alarm and high_alarm from the threaded interrupt handlers
and sysfs is not protected by any locking mechanism at the moment, which
can lead to missed events.

Use the hwmon subsystem lock to serialize access to the alarm indicators
and update their state before generating the corresponding event to keep
a consistent state.

Fixes: 3af350929e75 ("hwmon: Add support for Amphenol ChipCap 2")
Cc: stable@vger.kernel.org
Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/hwmon/chipcap2.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/chipcap2.c b/drivers/hwmon/chipcap2.c
index 57d22d65612c..0a56c55e9394 100644
--- a/drivers/hwmon/chipcap2.c
+++ b/drivers/hwmon/chipcap2.c
@@ -495,9 +495,11 @@ static irqreturn_t cc2_low_interrupt(int irq, void *data)
 	struct cc2_data *cc2 = data;
 
 	if (cc2->process_irqs) {
+		scoped_guard(hwmon_lock, cc2->hwmon);
+			cc2->rh_alarm.low_alarm = true;
+
 		hwmon_notify_event(cc2->hwmon, hwmon_humidity,
 				   hwmon_humidity_min_alarm, 0);
-		cc2->rh_alarm.low_alarm = true;
 	}
 
 	return IRQ_HANDLED;
@@ -508,9 +510,11 @@ static irqreturn_t cc2_high_interrupt(int irq, void *data)
 	struct cc2_data *cc2 = data;
 
 	if (cc2->process_irqs) {
+		scoped_guard(hwmon_lock, cc2->hwmon);
+			cc2->rh_alarm.high_alarm = true;
+
 		hwmon_notify_event(cc2->hwmon, hwmon_humidity,
 				   hwmon_humidity_max_alarm, 0);
-		cc2->rh_alarm.high_alarm = true;
 	}
 
 	return IRQ_HANDLED;

-- 
2.43.0

