Received: from mail-vs1-f67.google.com (mail-vs1-f67.google.com [209.85.217.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52DC0A935
	for <linux-hwmon@vger.kernel.org>; Wed, 25 Dec 2024 09:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735119203; cv=none; b=qKYydinr5C9A8dIk9MtfegROQg/1remeivnY9o2Z0ix8N22fdjIPdwaXozcmMf/u3bmT0gEh+dXLWdZLe6rNgKU7k8C/VBbtVA5NepjyKmj9iCEcrH4uEFrPG9SoxFe+DPbNX2U6LSLfNnKzSxYiuws0WhfAidP/soQdCCr95UI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735119203; c=relaxed/simple;
	bh=btXwt2CLFrLTUfNrdjIrhzANjrwFpD/aQLQJkchjYGI=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=H79rCd1MKFr2zrWpV1gpZc/SPaJoXdWobUPa9IcMmuCVwh4z7t4y6yQehwJJSgtJmdEzoa7cKtDoqJBCOUa7W5ON/vjgaedPR4/NX4aWnT4OMjrQkbPuI9yb8PB4W/a9AHXP+T0fsNrpqhnm21mQY+TobGIhWFgPb1Bt8tq8Fww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com; spf=pass smtp.mailfrom=inventec.com; dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b=EYkEiWZN; arc=none smtp.client-ip=209.85.217.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inventec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b="EYkEiWZN"
Received: by mail-vs1-f67.google.com with SMTP id ada2fe7eead31-4afeb79b52fso1487436137.0
        for <linux-hwmon@vger.kernel.org>; Wed, 25 Dec 2024 01:33:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=inventec.com; s=google; t=1735119199; x=1735723999; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=EEBojO0CGxsTABS3Yht5J7ecr+X2bNwjUL7DN3qWefs=;
        b=EYkEiWZNR/rENqsc0bcm/FOvsXRhmJX4ra/llJvZnNlmSNewpmL/4t1YjJjHS27HRK
         jdqMzj05gfwoWXAsq5nSIVL+XEDfhyaecSE7dKr5uOMJoT0Z3WEpNlxbyWsP8p4K1Fxj
         vsQddr/5hsJvxHpCGzPHMHokAEYpRTuy5H9Lo5HzYRzgA4hNEhzryX8P6yrX3GY3n/3B
         PNtf9wJZySmPWgMQBNzccbtHHb7qqZJAjPPZDDe56qHT4EOZvHQbXT9bX7pJ+qG/gS4n
         ryNsh8lJzWKSnCCiVouJCzkNQ5Iw/M0SM0JknT18Qfmw3jFtRUxy4NPd1fz2f4Rp9UxM
         k3gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735119199; x=1735723999;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EEBojO0CGxsTABS3Yht5J7ecr+X2bNwjUL7DN3qWefs=;
        b=xCDbiPab3c0qLk5wRnJuQ6blhbSi0vZh3QoXWXvN5iQDkdtmt5LVqoO4gtkFiBxvGP
         Mz50/VrdhcBuZ9pq1tqr+bry1pw7XNFE7o3jphXbSrPWynoNarviiOffm1NTMbP6hpFD
         C5ZyINPKeJOW5/oWOhsjN1eP0gyhjHiiqCPuqpQTRRF6j8AuC7Rw6xD1l30uMOn+6rFg
         JO/xJ2mPU2vDblLflHP4hyLmqKTMXl1hfV1OOplfsSdRo+OMGMbuJqWQGXiwuwvzEI9s
         dZ4uOaEpVhxFKzlZxzCKvr/gseIa9mkn69EV2KrI5V/aTVR2YTLoY7SENBG3Rf8cizit
         Rjgg==
X-Gm-Message-State: AOJu0Yxtz/GgrPboXlp5+tdhuhcQNoKnXYwQVV2MhQQS+Orbv9KfI0HU
	PiwEWlPGkZgDsnM8q3y9qxHUWO0CzX717hvS0qVW2QnGLjrPn+T/DziTcuTGSBBirk3eJtx7SfW
	UVqks7zx2B6P3/CCg7EEUTl9ukhxxxWF+nsNh6frB29X8l54mjBgwOw==
X-Gm-Gg: ASbGncsJxok1D4ORnagnpg3BXvx/4j/ZElLGgTpnJRJU1ZrnsGdrqXrV4jNiMegKECI
	zwmG6hgyr/SLvxESB9T+ntBfjjjCZfZbLETYHawE=
X-Google-Smtp-Source: AGHT+IGZJsaE+ut6J2xmoQMgOxcD3AAGbu5PXq9eItsNqk7vjs02mHEFYLR6kMjOiizVU1f0n1aWdsZq8ngCYOVD5iA=
X-Received: by 2002:a05:6102:5689:b0:4b1:1232:def with SMTP id
 ada2fe7eead31-4b2cc31a411mr16277865137.4.1735119199131; Wed, 25 Dec 2024
 01:33:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: =?UTF-8?B?Q2hpYW5nQnJpYW4g5rGf5rOz57e7IFRBTw==?= <chiang.brian@inventec.com>
Date: Wed, 25 Dec 2024 17:33:08 +0800
Message-ID: <CAJCfHmXcrr_si4HLLCrXskuZ4aYmqAh0SFXNSkeL78d2qX2Qcg@mail.gmail.com>
Subject: [PATCH v1] hwmon: Add RAA229621 for renesas spec
To: linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From: Brian Chiang<chiang.brian@inventec.com>

According to the RAA229621 datasheet, add support for reading.

Signed-off-by: Brian Chiang<chiang.brian@inventec.com>
--- This modification is added RAA229621 chip to isl68137 list ---
drivers/hwmon/pmbus/isl68137.c        | 9 +
1 file changed, 9 insertions(+)

diff --git a/drivers/hwmon/pmbus/isl68137.c b/drivers/hwmon/pmbus/isl68137.c
index 2af921039309..43e860d95280 100644
--- a/drivers/hwmon/pmbus/isl68137.c
+++ b/drivers/hwmon/pmbus/isl68137.c
@@ -63,6 +63,7 @@ enum chips {
        raa228228,
        raa229001,
        raa229004,
+       raa229621,
 };

 enum variants {
@@ -72,6 +73,7 @@ enum variants {
        raa_dmpvr2_2rail_nontc,
        raa_dmpvr2_3rail,
        raa_dmpvr2_hv,
+       raa_dmpvr2_hvt,
 };

 struct isl68137_channel {
@@ -412,6 +414,12 @@ static int isl68137_probe(struct i2c_client *client)
                info->read_word_data = raa_dmpvr2_read_word_data;
                info->write_word_data = raa_dmpvr2_write_word_data;
                break;
+       case raa_dmpvr2_hvt:
+               info->pages = 2;
+               info->func[0] &= ~PMBUS_HAVE_TEMP3;
+               info->func[1] &= ~PMBUS_HAVE_TEMP3;
+               info->read_word_data = raa_dmpvr2_read_word_data;
+               break;
        default:
                return -ENODEV;
        }
@@ -465,6 +473,7 @@ static const struct i2c_device_id raa_dmpvr_id[] = {
        {"raa228228", raa_dmpvr2_2rail_nontc},
        {"raa229001", raa_dmpvr2_2rail},
        {"raa229004", raa_dmpvr2_2rail},
+       {"raa229621", raa_dmpvr2_hvt},
        {}
 };
