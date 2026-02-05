Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A94122541B
	for <linux-hwmon@vger.kernel.org>; Thu,  5 Feb 2026 13:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770298527; cv=none; b=WGm3C52wBeJK1rG0PTZKrF5k3uCWXnOycWyIqDLjoeFMz465eum8EocHs2+f7ptSfvFQdTirVG4yciU/w5qtEK4BiKnM4XaFhOEniWjUMddDBPkhUlDDgm/i/ItUqORB1mPoDM/zSZOq3FGUpppbSQgeZ93TDZl5FXgE3qjBVEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770298527; c=relaxed/simple;
	bh=jzOvnTx/W3vkHXNAXJHl105M+tP5MxGbZjwB0Go0Ag8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KfZkyIGj9FcaF9GTVdXSLHIqxAwVToSGaspmRoYThDOJV7SpQEYRdmqTKRx5Zvl6n/Xuhl4KoOEhEhyB592cvmpNLJQ6LDsV86/ia8xNf507ioZCauRLf+kOHVOCpiPdBSBxO1oQtfzUd9eCW5o7yJqIi76ST7MfFj1VrfmtlxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z0zQcrsZ; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z0zQcrsZ"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2a76f90872cso5594585ad.3
        for <linux-hwmon@vger.kernel.org>; Thu, 05 Feb 2026 05:35:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770298527; x=1770903327; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A/zGx1Gcz5LYgaI/49wFrBfxIvVXqwuQwGCglo5zagk=;
        b=Z0zQcrsZOEGbb9nIybtiHp6U7eOnD6pKrZiadncsurWJ3rbR1KFSY+y7hC1e380qcV
         Ua+OnpzT9nBh2bLsOnESD2X77gz6DBY1ySB+pyA6Ou2TWsakxgCJofZB6mHbNQQFi7Jk
         7TIVNx2801X4gfsSJD8YFvXCdQMN/vEZqcbpIyefMRIjvuXXzbgGDl1JUzhzbE63JXhn
         oQqIzW5L0HD05BIcE0EoypRUt2Q0L2RcY434AknUOQPaq3TTGcnj4pbeAWDTzkeWkRGp
         cCwJnoDDR8IPb7E9deMgDRLj5g7o9+N1JvVTOUWaHX724H5B5H0bs3UBlIIdD1B19lL0
         G8vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770298527; x=1770903327;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=A/zGx1Gcz5LYgaI/49wFrBfxIvVXqwuQwGCglo5zagk=;
        b=kwDhusAKB3O2/UTYGRi2Eh/nquhUbrXkylvsywWF9MelUqehv7S8JfL9XVHnGlMfTZ
         RVl8DC90cjLrRqeN+o2rgMvFTM7TfBuo4Z08w0DBlzb0Xg+hyvL80nAvdXO27NQYe10O
         nIuGklFh77bSzX/yALo4VPttupP9/aaux0Fzc4IXRU6dp3JyGhBvnjN1q8OM5N/LaFrh
         /X/X701vIEJ4jpeShEZBV7gawMIcEzpqU+EDuBVIsJ7kcZ/4qch5YKg1E+n+piI+Os7Y
         CnYLH6CfROJ+zzbSifzaUvwpu8OUWtvLgcIYfUFzw+fjAB9g+XS0bScRznF3F9pO4lh6
         JQWA==
X-Gm-Message-State: AOJu0YxRy3BMDBfjvG52RCPENaE1iAbZFlzTR9QdhkYWPNnDKzpZX6R1
	JmjT3vMnF7xUFPw7N++NuqFug3GcqdHlm6eQGd0iQa+7lKNyZEUu/lgx
X-Gm-Gg: AZuq6aLO7xz6eZLwZ3gh/kbIXCKlwq+nkxRF9dUj94NXGFFCYALlkO7pIpbAAMlZDNa
	flwegWzi8STo20n5rCJxw8CwcXBTjKZLRFjBuVMbQqGW5LOOWKrrN7+4rhaftyO/dIYd/B0s5d5
	pKPLgc71xXSJy6SCVKiBSsbcpy7RtuNaVy9KfoHXrkzFLGmKIUMc2gUrtyRxS6/gTRmJRE/rP9/
	+aBjxXGTgCSg2812uBkQwADGzn2UCVsn0ChfU2GzZ/87vPagiXIutw403DLNQN20yAlt6sqJJtF
	bbL6ORTxZnvTpf9vn8NVJWoP/WvseIb5YP/VsGHrPGabDchxkjqa++0m2j++EYoE7EXJ3ZayrFZ
	PAPndhxpbqVzepflWx+e9ixwqCvzCPIMaglxZfiGxs1FkTqhLMUdmYdgCBfiky0d7+GOECeQ032
	vd93XVJqw=
X-Received: by 2002:a17:902:f684:b0:2a0:acca:f3f0 with SMTP id d9443c01a7336-2a93400c9damr78505625ad.49.1770298526798;
        Thu, 05 Feb 2026 05:35:26 -0800 (PST)
Received: from [127.0.1.1] ([218.32.81.133])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a933850f41sm57760505ad.7.2026.02.05.05.35.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 05:35:26 -0800 (PST)
From: Colin Huang <u8813345@gmail.com>
Date: Thu, 05 Feb 2026 21:34:37 +0800
Subject: [PATCH 3/3] docs: hwmon: Add Q54SN120A1 and Q54SW120A7 to index
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260205-add-q54sn120a1-q54q54sw120a7-v1-3-09061ecacfc7@gmail.com>
References: <20260205-add-q54sn120a1-q54q54sw120a7-v1-0-09061ecacfc7@gmail.com>
In-Reply-To: <20260205-add-q54sn120a1-q54q54sw120a7-v1-0-09061ecacfc7@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org, Colin.Huang2@amd.com, 
 Carl.Lee@amd.com, Peter.Shen@amd.com, Colin Huang <u8813345@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770298516; l=603;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=jzOvnTx/W3vkHXNAXJHl105M+tP5MxGbZjwB0Go0Ag8=;
 b=SQRmAR2FLHCMb2rc5Nq3fpB7zsG3L9iKsSUN6Bj2NcQ6ClR//eQEXcGw1gRqY5Phiz4QQTBev
 3rcl1hD0x0GAhH53lF2v1blOC5n0K0QbHSKxsI2YCrS8wM2TKFVoYqk
X-Developer-Key: i=u8813345@gmail.com; a=ed25519;
 pk=Zlg0WqpCw4qbswOqamTBTXIchwR/3SnYZpy7rjaGMdQ=

Add the Delta Q54SN120A1 and Q54SW120A7 PMBus modules to the hwmon
driver index.

Signed-off-by: Colin Huang <u8813345@gmail.com>
---
 Documentation/hwmon/index.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index 85d7a686883e..62d6fc0817eb 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -216,6 +216,8 @@ Hardware Monitoring Kernel Drivers
    pxe1610
    pwm-fan
    q54sj108a2
+   q54sn120a1
+   q54sw120a7
    qnap-mcu-hwmon
    raspberrypi-hwmon
    sa67

-- 
2.34.1

