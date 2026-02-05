Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02E3D2222D0
	for <linux-hwmon@vger.kernel.org>; Thu,  5 Feb 2026 13:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770298525; cv=none; b=THhl8XJ30nZQd02sJRjbc+d2/XrX2qFJ1pWzXe4bxVqMbIsJsfBQ4ChPE+w3mR0YnlDGQZntRYwqj46TPGTpTtB6qK0sk/O2pYLjageKCvDRBLeSgsgEA5B8Rr+QHAzL7o/6eeZLy42yeaV7h5Xd5s8HfevVovbQiDcemDgQ61I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770298525; c=relaxed/simple;
	bh=V3ZGNJ0LedluqimvtgZA6qyCxj5uWwOAnO+i36Sv8MM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TOBy7Qb/ZBimVfRL6QK9aeaXksBj2/94Vfq3SYznUIAAmezFOEfBHB07q6eTW41JTdZVrXFGOZZQPBQfXChvvWLpO9wB/DBVS1PB5X5InWXoA9PH6CKCWPtwmVVpWiR3vxqu+ZVcSy5kpSj/3QOxs/GIt/Q46we9YZ15mt+oGbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fuv5uRqU; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fuv5uRqU"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2a0d52768ccso6040985ad.1
        for <linux-hwmon@vger.kernel.org>; Thu, 05 Feb 2026 05:35:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770298524; x=1770903324; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A8vYVSxf/f2z49Q0aR+EfpZkckZVO18lUKU02stUhpQ=;
        b=fuv5uRqUAtsk0b7zYyrJ2eZY+w6eOQs6QEf5P7mLQdBTEfQTb0aA2OxC+ewq/E/0DZ
         aBaM6BZj0bcEuA8Nf7wxs0mrzyZ0sp+m2iVDTtAvCJWwhdxSQAJnZNjEJM/+/CjFXpHP
         VlFd6r8rqwGz/PWaZk8mqjBX8fpOHj8VvCkH/JvecOmEoZMMEopjuLhp1RO2cHah2eJt
         T5coWEpYZ4T5f6nXNVSgkClah5p1azk8tHQapweV8oeywLMHgKYYpGyQGi0A7smE7py3
         898DV2828LvtCLIVEDQ+acte3zrhyxGhV6+V1p+1Snyu6SzbPDoTJsMsmzf4XXDG513q
         rNLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770298524; x=1770903324;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=A8vYVSxf/f2z49Q0aR+EfpZkckZVO18lUKU02stUhpQ=;
        b=YOvxp85rEi0XHfbZj78r9TvEN/Zx+/LTtVNGQ+imNcdrSkwF94VFvuuWVriqy1hd0/
         dXx48v6k+eCD+46dYdYpxAHlyw/Gd6GF7wG0Tj9Ib6a9hU3B0JuWaSwl3Xb7oeHwWDOf
         9YPxeo1Hr8WkGJFfHiRztGqGNHIoRhmMdn1r2Y+l4UIpj/Ar6KYL79a1Y/PyR+JtSDfA
         Mj/E5iWBGcH8O5iTo5AitzqG1KaWSgROv1VHc0stvBI3rHaQZR6hmo6t/6qUYzJFxSi1
         K7KmP9qk98KhxDd6xXbyLj8ImqQBgTe5Vu3MRTWkcJCOV1XGf0/viefothlJUph+EZBl
         2AYw==
X-Gm-Message-State: AOJu0Yy0Ye/CieCAgdy/uA2lLfL+uKEoAoZVogAp/h34X/DHWvdTkKK5
	BtOBizxB9AxiBeOhomc6TZR7JGV1G4IYHPuNTRNfKleUbsBsBJzXEs9x
X-Gm-Gg: AZuq6aKVUZWhBHsqM2gsSAZ9rRjGT6Yef/MHMty4t+3vlQWjQT5dLPCBZf4qvwhJHu2
	3hpdfDM94jbJcQaiCRKZFrkFhP6kQsz2vL8HbwEEtT+aMXLfW1/pShhbqg6sgtLe1oz31Z7ZI3k
	XPrfpbgXUfhuqFhw0WXh49l8g2lY2lt4c+LETUhF3TxZU31EnHHG5YnzknDzMiaEpdsFk0UBWuG
	MERaNdzB8c1/3Go+19UXghm7z3ucfOXiITHH9ZbNZTmDsRhqI0rVCMfZjPa5kiaaB5pP75E3acP
	Lran+yB7F6BN8onAmPILEQM7Z10USGPJBDxPNuyVk2WTvY3wPE9sWk5Ocp2rv0Cz9gy7SIQxr5C
	Csx8QUJ96fB5HQyd2P4oBIhht5FTZIZuejiOalCSLvTHSBFI1IXNGL3ZzF0vMTzJMsy0xsZykKA
	eqErp610awgsCxcBZojw==
X-Received: by 2002:a17:902:f710:b0:2a9:4bd9:bb8a with SMTP id d9443c01a7336-2a94bd9bd92mr5539275ad.25.1770298524251;
        Thu, 05 Feb 2026 05:35:24 -0800 (PST)
Received: from [127.0.1.1] ([218.32.81.133])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a933850f41sm57760505ad.7.2026.02.05.05.35.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 05:35:23 -0800 (PST)
From: Colin Huang <u8813345@gmail.com>
Date: Thu, 05 Feb 2026 21:34:36 +0800
Subject: [PATCH 2/3] dt-bindings: trivial-devices: Add Delta Q54SN120A1 and
 Q54SW120A7
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260205-add-q54sn120a1-q54q54sw120a7-v1-2-09061ecacfc7@gmail.com>
References: <20260205-add-q54sn120a1-q54q54sw120a7-v1-0-09061ecacfc7@gmail.com>
In-Reply-To: <20260205-add-q54sn120a1-q54q54sw120a7-v1-0-09061ecacfc7@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org, Colin.Huang2@amd.com, 
 Carl.Lee@amd.com, Peter.Shen@amd.com, Colin Huang <u8813345@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770298516; l=1051;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=V3ZGNJ0LedluqimvtgZA6qyCxj5uWwOAnO+i36Sv8MM=;
 b=t+XN7WVJhMHTiJpg3h4ud773FQ+U6lnwk83FN5iNuK6ZbEUGL0j2a7xxYrbDKKPVQWILQW3mn
 0uh8qHG82LgAYxyGzmRcV2IpoS4IH5R6b28Xi93A0HNjT3wRyNq2QHH
X-Developer-Key: i=u8813345@gmail.com; a=ed25519;
 pk=Zlg0WqpCw4qbswOqamTBTXIchwR/3SnYZpy7rjaGMdQ=

Add two additional Delta 1/4-brick DC/DC power modules,
Q54SN120A1 and Q54SW120A7, to the trivial-devices list.

Signed-off-by: Colin Huang <u8813345@gmail.com>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index d0f7dbf15d6f..f430e49b9ec1 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -95,6 +95,10 @@ properties:
           - delta,dps920ab
             # 1/4 Brick DC/DC Regulated Power Module
           - delta,q54sj108a2
+            # 1300W 1/4 Brick DC/DC Regulated Power Module
+          - delta,q54sn120a1
+            # 2000W 1/4 Brick DC/DC Regulated Power Module
+          - delta,q54sw120a7
             # Devantech SRF02 ultrasonic ranger in I2C mode
           - devantech,srf02
             # Devantech SRF08 ultrasonic ranger

-- 
2.34.1

