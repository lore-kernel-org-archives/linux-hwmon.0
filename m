Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D70319871
	for <linux-hwmon@vger.kernel.org>; Fri,  9 Oct 2026 00:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791507374; cv=none; b=jdMfV+5OaZiGhMbXXn5W5efP6CI76gR+ZGlIKhAVTwP6oU+jRJc4nosK8SWPRtDYz6tea08iSWCExvnh9fWAwdSwSXvbZOg0/mh7FwsJKQB5RJmCRY/rg8jkBuq/qMX0Q0VtgKDB4/+ksdjSj00Q+awYAbc+f2GYNL0Zg9GLaa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791507374; c=relaxed/simple;
	bh=3dS5bZTVOT7DSHDRVN8MKXXtvwU8qyib2hA3utIdjME=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RLyEctqRr5WRwIfOfRds0H0jtXaxpZ9nKSUMwLrHA5Sogl52GLleR6noZ/vGiCOtXeWymhI+k5eVlwLz4JCKGvzU3KzwmA2/RCrbq74f+oabsG+4oEIHE81ky0GWQdPGI2fqmKlKbXmgfcVshtgWub9k1jT5BRR1A79zH1iTwDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=Mppaamx1; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="Mppaamx1"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-33fb4680717so2729170eec.1
        for <linux-hwmon@vger.kernel.org>; Thu, 08 Oct 2026 17:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1791507368; x=1792112168; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T8PlKZWA7ABkYR4Ifs3ujznF9xvsTKqdGNGAzO86F2w=;
        b=Mppaamx1MF1+rCGnnt0y03i85TmVgqZew6U1RC7kwN4yqalSPlVzHVk4BoTqZ6HLg8
         M4oaYapYQNAglozi37t65tZtUUiLmP39Jc2e3ho99KxVw9TabzOK8LClF8Oow9Cy14nr
         tWUEPSiOPa6UaDQnMz9+Jm2Qhk38+h/2hAIWFDv/9sYgxq0uwOMLk2QQ8RUjBD1rC/8p
         xbVsTp6fLwIHF2s7Rdg2FRyFfVSt1ieK78z0BPid0qcIaPWlQwwbvAC33JCyz+30O8RP
         wQsy8PWEbD+2x/HS20squP0EMEXzzlOsALUhrgMsOyZXUwC5QucSg/Rv7QecWL/gGIJL
         zhGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791507368; x=1792112168;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T8PlKZWA7ABkYR4Ifs3ujznF9xvsTKqdGNGAzO86F2w=;
        b=Ne79UbHU6FKV9sTcyI4mkQpSjc5hqB5d/CAL5E08jFPTXjpekCabuLl8ymGM7ZEc2Y
         FARy7kN4AmfNrSJQP+43WOTIqlOikFzTaFXZ4BLLtSxqQGmXLchYFnj80XT+S9atAN52
         riycIalE31MMAVC4F0VEo314Mn+3nPb2mKHSGDAPVGNmAJ6Ns2/SxhXn9DglHhknR4SE
         R1mLxQ2u3kV0Af6MaeUcm/BcWFWshhr+bfIwn/Br6JUz9tHQAlS2umENMkrY3vg803im
         qIcxzH5vhelEwlgGAvMOJqhlJlsVGbaoM9999rc7qBVO+I0tU6cyD3N2rNkFgcxVgRMR
         EUOA==
X-Forwarded-Encrypted: i=1; AKwUvBz9Cmu/3lU7/htQEA3u0nmFr2n54kgM8sA8PTExqGnsVgKCHHlqZjTRGg9rkfXAoHEtbPOrlRMay/USOA==@vger.kernel.org
X-Gm-Message-State: AFq9FYLsnZqRa627t8MuKfUqpesYoQGYMsYDLUr2fFNroXSAo/hpRpI2
	8GBwo8jnRU86CWC6mKRlTKFwBg8OW/gFdPKA0rKi6SmD/xzjME9DsJvPUibw28f9DGg=
X-Gm-Gg: AYBFou2dbjbmRljm1SXE/MjJtTZ1axNNS+Y9U6mUGLScrjkXJAqO/C5nrjhWCD5CQWe
	C1or96qM/wE7ljQoRH/ZbMaWcOUGHvTDCyNfsBScPWF46/pZXdk3hdoBZ1EdG3pwY+qq7Cq/bl1
	y9c9c1JDBXcwwN2XNgDO89oIJT30bDDV8a9PSWZEESvVQDk6wTOAt6JCdguta7O1/4hyKXKCH2k
	qcA4LyW5RpXPl9qE1v6REgEFL5T9Afe3ibeV171peoa835Sg6iYLNEOH2QHC8IvdgWPxiQQ0toT
	5UmC/tG+wLMnAh2Grl50WhwHT6AuluDuuGQ070jvQ9bwFRyeRj0HsS5tdl83M7SfNHPP1UfONKR
	fLCirOCp7Z/oXZwpFgzNoUk1RDupkrLVj3r0hzSCNFxl7mlm2XOVqx2WPQU654NaB7fZq4XbMZX
	+CTFj3XSj+x/FCujiigYGe4TCglY4+D6bEKLnkGPnWsBTY1R66AmQcp8pdoveKDm8H98utv6NIr
	w==
X-Received: by 2002:a05:7300:b905:b0:353:7e33:665a with SMTP id 5a478bee46e88-3537e3368b8mr878553eec.37.1791507368107;
        Thu, 08 Oct 2026 17:56:08 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cacb61asm1760205eec.21.2026.10.08.17.56.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 17:56:07 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Thu, 08 Oct 2026 17:56:03 -0700
Subject: [PATCH 2/3] dt-bindings: trivial-devices: Add TDK FS1412
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-hwmon-pmbus-fs1412-v1-2-0ae7e5ee4e41@nexthop.ai>
References: <20261008-hwmon-pmbus-fs1412-v1-0-0ae7e5ee4e41@nexthop.ai>
In-Reply-To: <20261008-hwmon-pmbus-fs1412-v1-0-0ae7e5ee4e41@nexthop.ai>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>, 
 Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791507365; l=987;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=3dS5bZTVOT7DSHDRVN8MKXXtvwU8qyib2hA3utIdjME=;
 b=vzUnvSUv3IoTSrnibtT+Ynn8TjePYTpUjU6Onw2MLiS5CNXbQqXQmR8VDQfcG+iwtB0heUIfO
 3b3ce8E/f3qD0eboKIKiUVS81szS0bkKWWglyR5jP7cfLrdVc5JSccw
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

The TDK FS1412 is a 12A uPOL regulator with a PMBus interface. It needs
only a reg property, so document it as a trivial device.

Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 2de8eb09cb7d..d2dfde1344e5 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -469,6 +469,8 @@ properties:
           - synaptics,synaptics_i2c
             # Ambient Light Sensor with SMBUS/Two Wire Serial Interface
           - taos,tsl2550
+            # TDK FS1412 12A uPOL regulator with PMBus
+          - tdk,fs1412
             # Digital PWM System Controller PMBus
           - ti,cd9200
             # Digital PWM System Controller PMBus

-- 
2.54.0

