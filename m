Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC71B335074
	for <linux-hwmon@vger.kernel.org>; Mon, 23 Feb 2026 17:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771868503; cv=none; b=az8mjzM5EYPMW6GmVNe1CBHrb4Xwj8h5u2dzJTOCKivWD9sJbKzzFZfbyu24o67HwRr0f17gU4AqbftJNNjTsCAI5qUJvHh5cBQ038F95L+y1SGIZD2yaUoryaiEbF248+94K4g6SJ4kzbJD7eIgOpVyFc9nAcwhPAl4f2b0DP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771868503; c=relaxed/simple;
	bh=y8FgvEUPFLx5N5MfQWc1DYRa3YliFsCd7Ior/FAKD2M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oCISxKDpf26exEergwonW1Z2mW8IMafYGZbI6nKKxTcZgWLi1jGt29Ug2KEdiFqOJ4K+u25HsiUFfcpBYjaUK3jeMgbp2h5pZvJhMfKdYwhIiIz8SkUBlopeJ4ultkr5ypwOEBewyPZaP6zf4Ox4oirX6APZZoVI4oH3HXd5dTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RbnFRxNf; arc=none smtp.client-ip=209.85.210.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RbnFRxNf"
Received: by mail-pf1-f193.google.com with SMTP id d2e1a72fcca58-8230d228372so2164318b3a.1
        for <linux-hwmon@vger.kernel.org>; Mon, 23 Feb 2026 09:41:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771868502; x=1772473302; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QOD4yYFluHKfZe3/008mC3oZMllQGZpUWYJJ9bXObRc=;
        b=RbnFRxNfttgUtgnC6RK271y0s/6DbKfLtGM/XYanigJ1/Hi3dQ1SR6pgNvZ4V46Pa7
         rztc6exVy/2B8Sbrh3PePsmf7jKF7XL++KcJBsdvpY4fnWoPgLXiAfi92cf++64MubZL
         kBmDt5/2zX7KP9Fo247mNDYTJs2LQF5tXuXtWTJbLXx02yPQuuNT3tr/zIAKJWoR8FRG
         d/OcRITD0/8UeLeVx1zsv6eg2HTKVs7ulhg6UI3a/7kGjL6nXdE0Ie2/5BDOF/1+ocfz
         6IwGE3t7+cCf5HTIIdUOgYnRqsWf/jU2ffEIR87WcsQnM5dbAg7kT4URHXcgM1vrGwXw
         QQNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771868502; x=1772473302;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QOD4yYFluHKfZe3/008mC3oZMllQGZpUWYJJ9bXObRc=;
        b=TopKbxNHk4TPdmm4YBRZODCnFGYnJ6B5EXotJ4IniYmNzOTduwW1zwvkGpwBQcwBJ0
         ZKXfk/hyfY6J6dMQwkguLeD92LnHf5sdhDePfouNzDLBb/FzHQPnjiOB3dscwFe6sBHp
         qhRYSUOaxj8M3D4JxhriEabByDfz6uoBL3QAe7EV1E3KF1/ecyyJn/PBfw/EML908xiM
         V3E+TiRYGDT248A7Un6qpAunYNUFeYsm0IoGgrTR/I9IKfMe4AylyodA/z9szCWE/H5t
         ob7RaAI5+/oBnhXMVB0ZD0syd/zLnE1KlPhH3S3JpZy332vS+Qh2Y9xn6Bc5/U0j47cv
         q76Q==
X-Forwarded-Encrypted: i=1; AJvYcCWzbQmXTuTCEClLqR0F78f2qZLXVCzJtuNshVNur1NMw4WHSnr1bWWYGLWT7LBoE0prJXvlIoFA2oHO1w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwKeLLHL3UGakPrGSh87MPbpfULvfharE7tMR/i/4Qll5n8Eb3G
	Dzi/IM1jde3u+XlVMi2tgBmgc0/FSVwEsFQ87Ht4JQUU0lbbc0Va1IpJ
X-Gm-Gg: AZuq6aLizuEsZ1Wwxj5dFib6a+nZyBPnS9Pd1zb4KbEeHPSVU2dh56Pm3ObCsGddS5p
	eOnFhOT54k23bVNXnVTy627J6gF3q5N0Kq/2OkzSpBxeprckobEHWlJa8BRqgDDWT2nxjP5qOc7
	kncDSHnqu5YSw6+guz2QnBN6TJbwK0XOho2wO0cIMM5STnlR1TYp/QKqzJLp0n/qlFxTmh/JYYu
	EFfaB26K9Dg7I8+x0KCRAiUyezsYWGWRLgAeCRfGi5tN9aCVVHrk73jE1UIrXHx320g6kN2fdcG
	9eJMSeD0fU3fj2hwwN5QWE7Ldu3aTKK2OGZxdzJ/WukA7VbMA+jEQMAbpgWN+sbs4iLiSehAQxZ
	F7aX4U75Utw5aipmrDBTud+fQxixbDHY86qwkqD5ATPXAO6X97UTLqA9AFUhns0lxx0KblnjeHE
	v8OwIizkHeM/j8BYQK
X-Received: by 2002:a05:6a00:3a04:b0:824:9451:c1e9 with SMTP id d2e1a72fcca58-826daab9eeemr8129818b3a.62.1771868502165;
        Mon, 23 Feb 2026 09:41:42 -0800 (PST)
Received: from yu.. ([120.242.225.43])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-826dd47c737sm7873090b3a.0.2026.02.23.09.41.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 09:41:41 -0800 (PST)
From: Hao Yu <haoyufine@gmail.com>
To: krzk@kernel.org
Cc: akhilesh@ee.iitb.ac.in,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	haoyufine@gmail.com,
	jcdra1@gmail.com,
	krzk+dt@kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@roeck-us.net,
	robh@kernel.org
Subject: [PATCH v3 1/2] dt-bindings: hwmon: add Aosong AHT10/AHT20/DHT20 to trivial devices
Date: Tue, 24 Feb 2026 01:38:52 +0800
Message-Id: <20260223173853.30617-2-haoyufine@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260222105831.7360-1-haoyufine@gmail.com>
References: <20260222105831.7360-1-haoyufine@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Aosong AHT10, AHT20 and DHT20 temperature and humidity sensors
to the trivial-devices documentation. These sensors use a standard
I2C interface and do not require complex binding definitions.

Signed-off-by: Hao Yu <haoyufine@gmail.com>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index a482aeadcd44..aa924a410fc3 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -59,6 +59,10 @@ properties:
           - adi,lt7182s
             # AMS iAQ-Core VOC Sensor
           - ams,iaq-core
+            # Aosong temperature & humidity sensors with I2C interface
+          - aosong,aht10
+          - aosong,aht20
+          - aosong,dht20
             # Arduino microcontroller interface over SPI on UnoQ board
           - arduino,unoq-mcu
             # Temperature monitoring of Astera Labs PT5161L PCIe retimer
-- 
2.34.1

