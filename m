Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB331E2309;
	Thu, 23 Jan 2025 20:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737664196; cv=none; b=ljsJW4+qRhOb/1BUn256n6iFyuE6CiboRcL2M7wZcE+VzOlIDN9YRGMgD9GmDSJ966EonJaLNjL1RswFwgESOr3RSfbiFJbPqsPG7KHPJ/szDUZugfIOtpx4HkVSc3uRkOVJ5zQO264NBeFvLIwbxz1A2USYYOdzUgfCXbaTgnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737664196; c=relaxed/simple;
	bh=0Ei7QSx37uDYWktUtlK7hBjkCkgZU1A/arHbK7BmL2I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VJC1zK0qfB3ULq7aPJRcLYTpGriOA6faR9T4TJBqLE6saHJ1iOa8SAMb51XGe/JUA5O6PonBZxE7k9wycYyHpq+I13ASo/xPoZXDLBCCQJchuBBBvPSMW8kTUxhSz9iUBlOKUWoqZ5m2Kob2W2KeC08rXDRc3Ig7nEhlHayBny4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hyVEa0ZG; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hyVEa0ZG"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-385d7f19f20so690828f8f.1;
        Thu, 23 Jan 2025 12:29:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737664193; x=1738268993; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1+3M7JmXyhr3q6oB070M/RG/xISuWjgA9C9MeXrbEeo=;
        b=hyVEa0ZG+TzFrSEFFHCRxtUIOTevu3MTjTitc/9EdxIx/wSM5qLW2m322S4WTtQ0Ik
         BmiczHDI7vvuI0pc2m7TBoNoA9HncbihxXRHmXXSJSiAPBPI89fiCltpN8hMbnY3dp0h
         g61zHmYWScDp3W2znsTJUANIKYuR3Uh3RvFrovV1BUiBqp88aff1Ybc8LOtnK9Wp0QVJ
         df4QtNTk6UfPemnY6HMmXbWeEfPlxCPcJYkn/FC6sf32Ex5QdHAO7ADrr1fHgIAie8AT
         +UwkT57IUEBiA2Pib4rtjZ2s0CN0j84u9NOKPiYklJb2d4QM/Dbf5MqG1J2HI2EfoHlu
         7QiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737664193; x=1738268993;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1+3M7JmXyhr3q6oB070M/RG/xISuWjgA9C9MeXrbEeo=;
        b=qnowT2RDHI9hBwHCWyxry26tyFLV3J6fhoU1WUinIx1ij0CbZW+B7OFPRMu0St5IeC
         K9aGNw63PCpjC5wfpA0Z9PogCGKtOaClE5MwiuhxZ8wQiEVr/lpsKkuL1hczHI3tYJ40
         NQJx2bpKhjhneMxZdh/4iQJzirb7PrnNF7ITwa7Kjw3T9WJywau4tfqtKr9oXtLbVGVb
         XVkRQZLriaPdM8ND/efT7eTHz+BpMBxVOLVT4yXXvZuguW68asvArhG8u6pxNUQAfqvC
         Wuzic29/WrqqnD2h35kOzx3Xz8QjGcCiC11eBUsE1jqlFR+1C2mKzK835XojjRZ1hM+e
         DqgA==
X-Forwarded-Encrypted: i=1; AJvYcCUKr3DqumIdSr6tH/eFNSZYDJzn1Xtp1SKdsYnM7aif72JB49kAcTrCuvwDedaAQl+SJSn/SUFjJyCXau6X@vger.kernel.org, AJvYcCVjjt2GYFqZeOsSuz/WZitNTasN7aEyDc7M5/NyhA1r7au7xr5jBEdMvXf9OIq6PQ8GbzfJirFMp2l2@vger.kernel.org, AJvYcCVrozjx2terAoRoPHDquBORxTxnyvoxmdRcb4BgffNPfRkMKXcCXJ5WGpLmKTLRDr3IaRyk4uJsqRQCYtE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHsmuTTONxi5vND8j/Ufw4TvuBjHxCQvFULjvEBNNcZvDoFiZB
	jMA3q3mI9UPYh3TsnIU+BLKxemBxiFhJQgUnWwAy3ME1OJ1HOnB8
X-Gm-Gg: ASbGncu7BvEMT3m/daEW6F/Zya62s0/t8S6xix8O9d8lzx5/yjEpy5zD8+1nbun4OFa
	aMt0rrkNJqVil9+moOOLj8F52o5kmzqnKwK4F2cWtmT6+pOaiD5P/Z6wssB4gorYFdvdD683Gps
	5r44EQrBkn6z0zkoO6D83B3+/LuqCdXjFgNoWZWWkvBBlLZ3xkVC/EMgE/94R7UnHE0+TJUXqxv
	xk9TtV0PQYWo0QZLkravhHvf7Xyxub3kg9Zgz8cTLa7TDgwXoDgyMPr3ic7QAYk9zmF20e0az7t
	Zl0pINASPoO/b8HsAJqKT7PJ6bQtpBa/d/KXpq6oOQgiBt//cdVpCvAGxVeyfjcZzCoF8DUB+1h
	i2Umk/jYU7QssF1wZGKp74X/tDqCL9sLny/hRqCzfRBux
X-Google-Smtp-Source: AGHT+IE2jJZ2KxKz2pfvjiWvTLwLCyL21bkRxNcy6DiaG2/DgzKaAnmD6EnXovG5PQyadzmVTt5nlw==
X-Received: by 2002:a5d:6650:0:b0:38b:ed0d:c1b0 with SMTP id ffacd0b85a97d-38bf57b41cemr22676858f8f.40.1737664192857;
        Thu, 23 Jan 2025 12:29:52 -0800 (PST)
Received: from thinkpad-p52.telekom.ip (2a02-8388-e103-2700-a24c-4303-c631-1166.cable.dynamic.v6.surfer.at. [2a02:8388:e103:2700:a24c:4303:c631:1166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a176490sm628760f8f.1.2025.01.23.12.29.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 12:29:52 -0800 (PST)
From: Andrei Lalaev <andrey.lalaev@gmail.com>
To: jdelvare@suse.com,
	linux@roeck-us.net,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org
Cc: andrey.lalaev@gmail.com,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] dt-bindings: hwmon: Add description for sensor HTU31
Date: Thu, 23 Jan 2025 21:25:07 +0100
Message-ID: <20250123202528.223966-3-andrey.lalaev@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250123202528.223966-1-andrey.lalaev@gmail.com>
References: <20250123202528.223966-1-andrey.lalaev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add trivial binding for HTU31 Temperature and Humidity sensor.

Signed-off-by: Andrei Lalaev <andrey.lalaev@gmail.com>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 6bdcd055e763..294e8f9bfb4a 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -189,6 +189,8 @@ properties:
           - mcube,mc3230
             # Measurement Specialities I2C temperature and humidity sensor
           - meas,htu21
+            # Measurement Specialities I2C temperature and humidity sensor
+          - meas,htu31
             # Measurement Specialities I2C pressure and temperature sensor
           - meas,ms5637
             # Measurement Specialities I2C pressure and temperature sensor
-- 
2.48.1

