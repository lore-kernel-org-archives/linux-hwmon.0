Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794463354;
	b=1n3HEMr0CJJPbOB8RGIyJkZp2PybyEpF7X8QPrkUQRsm+viS0aihbSVvhG+hrR9pWLR5
	 mk3Fk3/R4SZYy8n5KyhcrdgE4MmvXamu/65Xt6M1tHO2DHtAoNB3Fw/4v1hSRFkkxb58Y
	 A/Qok15QJ/UfGXVwkv/xBe+6G3loiArOFp7qPsCG+XWBiXBJjoq86wHe+0/9WEMpqa/Au
	 Ta/krzk2tMhE16gpuaEo4n/vbYKCjXr1CakUaDZCW8dQ+RGYh/h/4WmhGwjoxjMoJ4C8S
	 ZFHIKqf5phSXvXaCu+DnTBf8lAeP2T6yJUNNRLGfxBxXrR4WTVDzn0ilJf4rL5ok4Bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794463354;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=Rw7Bx0dLkNzuOX+yqngAb7zMgStoCLsXZz0OyPBFN3k=;
	b=CvIEv19vDQ19A3DMaT+dPatnWjxvQDN/MXnlAZGVw2Dem6SSC/9msq6Skn0XM1pj00I0
	 yJmDDvfEkkb36OM/4ETfhPgThSfEJZ5SUBLN0HH0bzkANiwy5pmrkXhcyaFMvW9LFFp9w
	 1tpL25PWIfU0wmb/8ZTjlZWhlVBreaZ3ivxEUdfTLKbGFiZc2MZIrt2hhbgF5DdHyAhIH
	 Utg1+7FUERVyWnu5xFmpFak4GvuEwhVl4kWqu/+cmhURxYv71dxOhKMOGBpYHGRjLtqL9
	 DHNGguVDuH9qgB02bvNmcuLTLvd6BU9fHBl38wT3zv3GFZmH6wF/a5agKvVB5ww4e9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a46UpnvK;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38E99606A324
	for <linux-hwmon@vger.kernel.org>; Thu, 12 Nov 2026 06:02:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38E99606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a46UpnvK
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3b15e46698aso1964013a91.3
        for <linux-hwmon@vger.kernel.org>; Wed, 11 Nov 2026 22:02:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794463352; x=1795068152; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Rw7Bx0dLkNzuOX+yqngAb7zMgStoCLsXZz0OyPBFN3k=;
        b=a46UpnvKbWTNlsCa+FpDBLlf/4fLcpzR2NUPtorGMWEnbpDpK9/8303wJ6S0fITbpD
         EZTIqtKNtt/9pwIRkhnmNr8rMBGuI3CErXj3shpsSB79t84OGOXeWMEffSp9zfUFzdzw
         q2pqI7m5VlWh5skqpYgyt9o+2MeFn7SmvrcPj5fC7FEMHZZENXtOD5aCA1mVzG/wq332
         I5km1JgJNizRSyWkvcNAV2FecjH5V3L6uot7ls0+JzsVa4Hm1jI77cexThx9P5jC3QdO
         mqOlBqTC80NNZGeMFNCYHMfrnt6ivd6QCaQDvU59cpc8UEKX4zZJ5smwaKNhxyQs+2S6
         YDHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794463352; x=1795068152;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Rw7Bx0dLkNzuOX+yqngAb7zMgStoCLsXZz0OyPBFN3k=;
        b=x+MHyXemLdevMI5QS4UG7Ci+v+ba5bx0WLoBTKX9padRDorXfNjNHtRI803L3VpyVg
         9tVyMFj1ZaHrmFCrt/cYt/ts+1DdL0ML170sd8lT2CLMjKpVZZLK7JGjaV5yjEQ+G2Im
         My2hZgaSF9Iewf+OYkHwYLZLxy0mJ957K0nLki9Xp7xSFGO/hlc2yQjABMM5CuOPdzNo
         kMe61YuyRebreUAPT10D2qY2sGUU5XnD3izrNXS3zpwLqPeOpy9Qe6YzyCDw2My+gyeY
         rwJIFNUH+XURaQQWMS7dlul94lgPnyAtd+Y9laZvGLMyN4jqYzCQEvN0uGYHNHRzJbvD
         ZtrQ==
X-Forwarded-Encrypted: i=1; AL+hErESDK8Ce+Moa7fi6UFYfBuU6+G2SBlFdqoCA3PFBqLLzKz82xNfx3gi8FyjjxgkEhHdlIJy11galNRa9w==@vger.kernel.org
X-Gm-Message-State: APuU4Z+8jU/nlz1MsN2TiaZMg+v6Zag45peXKKvwX2NhbGBZ6BuXHR4u
	1QYFAcPyMw+tpeTkLTgZbGvO74b5I3YvOZLBRL9w9aENIFmIc+BqujU4
X-Gm-Gg: AYBFou2RF15drrrBFr1q19b9MwakQ2insrhCiLreg7XzB+ryAOV6WFfnpbPYbLgaibt
	ALy5crQncvEANmNsx3jvf3Bngb4VyvG/e1LdY6IW9/jeVdAKOSGwZQr0oOZ0sKyovcakc4GSXci
	I2OL1LcvWr8DaIMADkvpeKkBNyXkGv/u2NVkAll7Ps8UsXLI4j/WDkLqFhE+O1LZEhdI/8YhTaM
	UBEIZO/LSK9xmSl1cZad4hqqgymbElax1TH/ixHwZsidmokuzjPUMWv0IacOTJXvoZ3coAQdgLs
	9SrZxYvc22HycQ14Jc0eTFtv9w/kailNoxKHf6FJ0kD7sWU5ePFHT3uhDdSG121frIYeLZGqfPR
	CI36bNiDvcT0VKuoCh7vfSU3M0aP/k8fW9O3zehCIMa7Dfyx3Mtg5pE5yu77XKDNaAzASN51o46
	OayIrt6thS8uobMDBjqWxZnJMgcxsTZHuKWrNt/z6OWPFm/R4bg/C7wlTkrU+84R4/zAjz2YDC4
	u5t0EQ0ERMhOBsSWz9qFTQj4j5y0XybMP3NyTCjoB2kaO0y0ebQ2xzGihWE2e7/hN01UJ6X3K/3
	FiSjPy1ZppzxUvfiOK3IkcGQsFw7GBuJh1BYV2SUGNZI5B+sQYGmS2JLgCna3YPyU6vsH4lTdnf
	0OdlPiGxfI30peLYEIHe0iVy8r3P6oZFOW1SXC+Uv8v427dr6TG9LqAXoyxfI8tXoIMpNvDorbW
	dGiN3CzyjHAlphfYaj+/XiGJ9ddOuTaXXl0HgIjcVo3r9MSDgP3AM17Q==
X-Received: by 2002:a17:90b:4a51:b0:3b0:accf:5c66 with SMTP id 98e67ed59e1d1-3b182f29822mr4190053a91.49.1794463352444;
        Wed, 11 Nov 2026 22:02:32 -0800 (PST)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa (2001-b400-e25c-c447-65e5-0e2f-5b6d-25ff.emome-ip6.hinet.net. [2001:b400:e25c:c447:65e5:e2f:5b6d:25ff])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b181beffcfsm3177149a91.0.2026.11.11.22.02.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 22:02:31 -0800 (PST)
From: Wayne Ho <wayneho219@gmail.com>
Date: Thu, 12 Nov 2026 14:01:57 +0800
Subject: [PATCH] hwmon: (sht3x) Fix alarm attribute names in documentation
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
Message-Id: <20261112-sht3x-doc-alarm-attr-v1-1-91676362d133@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQqDQAxA4atI1g2YKUjxKqWLOBM1xZ+STIsg3
 r1ju/wW7+3gYioObbWDyUdd16WALhXEkZdBUFMxhDo0RBTQx3zdMK0ReWKbkXM2JLql1EsXGxY
 o6cuk1+23vT/+9nf3lJjPFxzHF56ob094AAAA
X-Change-ID: 20261112-sht3x-doc-alarm-attr-118ddfebc6ae
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Pascal Sachs <pascal.sachs@sensirion.com>, linux-hwmon@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794463349; l=1932;
 i=wayneho219@gmail.com; s=20261001; h=from:subject:message-id;
 bh=zsSKgXhZU6KjZKkVqHl4QSQxcP74nzzHdwMx2Z6u6Pw=;
 b=8KLjbsfdy1taUMi+ZXefmWeolEFLVJeha699NRMSlNH6Es2k+WrvtaJGADLbhzB4Rw0bPZ2xQ
 ex4V/XP4UCXB9kOWMNojNXrLRihF4L6ErBXsXYtwLM7IHhIpQm626eS
X-Developer-Key: i=wayneho219@gmail.com; a=ed25519;
 pk=j25LRSikYRlv0PpovZSgSrCQwsy7WDzIYum/mydUa3A=

The description of the periodic measure mode says that "the alert
attribute" is set when a reading exceeds the configured limits. The
driver has no such attribute, and never had one. The alarm state has
been exposed through temp1_alarm and humidity1_alarm since the driver
was added, which is also what the sysfs interface table further down in
the same document lists.

Refer to the actual attribute names.

Fixes: 7c84f7f80d6f ("hwmon: add support for Sensirion SHT3x sensors")
Signed-off-by: Wayne Ho <wayneho219@gmail.com>
---
 Documentation/hwmon/sht3x.rst | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/hwmon/sht3x.rst b/Documentation/hwmon/sht3x.rst
index 4f67671eb0c..3c022c058be 100644
--- a/Documentation/hwmon/sht3x.rst
+++ b/Documentation/hwmon/sht3x.rst
@@ -78,11 +78,11 @@ The allowed update_interval in milliseconds are as follows:
 
 In the periodic measure mode, the sensor automatically triggers a measurement
 with the configured update interval on the chip. When a temperature or humidity
-reading exceeds the configured limits, the alert attribute is set to 1 and
-the alert pin on the sensor is set to high.
+reading exceeds the configured limits, the temp1_alarm or humidity1_alarm
+attribute is set to 1 and the alert pin on the sensor is set to high.
 When the temperature and humidity readings move back between the hysteresis
-values, the alert bit is set to 0 and the alert pin on the sensor is set to
-low.
+values, the alarm attribute is set to 0 and the alert pin on the sensor is set
+to low.
 
 The serial number exposed to debugfs allows for unique identification of the
 sensors. For sts32, sts33 and sht33, the manufacturer provides calibration

---
base-commit: 44c8ceae2dd3ae536c5f4f956cedb24c157aac23
change-id: 20261112-sht3x-doc-alarm-attr-118ddfebc6ae

Best regards,
--  
Wayne Ho <wayneho219@gmail.com>

