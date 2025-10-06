Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B333D4A21
	for <linux-hwmon@vger.kernel.org>; Mon,  6 Oct 2025 00:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759710044; cv=none; b=ZJGgNyr+GeCdlnNnuYNKmEFRyYrMEfXyvfR72VnBV1QpsGmR3gHncckCpsD1lz4Efii3farhEb8e7YQ+YfukOO7pySIJk8Lr9T9NfgpLQis0p64EbPnknC4PDJV0koULeC5/jPXvVh+4cwjvdv3NF/CYS40AC8gBdHcoF2pO+fE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759710044; c=relaxed/simple;
	bh=55VcI99BefU1ClGWEt6w2p1Wq4Ig0V9YUg0p6uKAx48=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=t77yqBF/9e1cxl6UdtxnNkR9DzNax6uCztMzYooEISzd30QVecSh9UnUKRA8qaaCu2YIVdl0Y3WsxBrP9q4YoaXtpnMGt6KKNqCLacng++r/CFzzjjsrdmbIjJKgIgR/fbXLgoeU51agNAUgWx97+BPszcVj6nE0ElvOGHDYyf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XqJAvEUT; arc=none smtp.client-ip=209.85.166.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XqJAvEUT"
Received: by mail-io1-f52.google.com with SMTP id ca18e2360f4ac-9335a918867so361816539f.2
        for <linux-hwmon@vger.kernel.org>; Sun, 05 Oct 2025 17:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759710042; x=1760314842; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Fu5Ah+MFhPdDtEFol8Eh9/iXvYEpCqqSBweQNTT6OA8=;
        b=XqJAvEUT/g5Sr67gEw/FxjNODGytThoqANKDNfqaZGfaf08/97xocFsR4xogzPbnwy
         Fsa/xlGIdD43EBHp+mJB//+4yeD/kqUrMY16+2kKKsAFvDagSfiNLbEE6NaPdEHdJP2k
         isGloBru7Fx49DwuYZ/1pWAhV16HvmvaLU4v+F8UWZnRYomh1bk37lBi2xmAgl6x6bP0
         9u+iIq6ZhW/fusSqymF9PFAZkCv97mYzUuhPlbdpc28eakijncnhI7pc+USMHvot2E0V
         UCD6eGL+Bpf/ybiVfxP2RS+JGr2ZUdhtbbwGvWIrtr1hV7S1w8VDHURY7/k7jCd6QtZC
         e0fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759710042; x=1760314842;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fu5Ah+MFhPdDtEFol8Eh9/iXvYEpCqqSBweQNTT6OA8=;
        b=c91ZWhuyGTedGeoik8okQnAsAftzzZeRbWSdPEGJvVaemkH5tW3V0mGwR/EyxMLb7k
         yKMHh8XfWimw5R7skf3Yv+g234aBvoq+EE3hdOraiG+4aoQ3od/6d+UdTjAB6pEJQ0tY
         CeOXn9JfpAXUJrhbckChoW1pMKKSwjxM3/GWR/bQbuWSG9EjvRE1VhEbvT8PqtFSfVII
         OfJHEaBz5k0qeGXP+SRiCSNspAj0Oi8aGYuSQ/Zgug73M2myCnDDG8BBBil2oCD0F4Qf
         XVusDLlyDK1u02dZmRnsTiNXFX9mf27hGyTnCu9QXUzrQkP/RlXM/hcWeOlj9etdvj6a
         Noqg==
X-Forwarded-Encrypted: i=1; AJvYcCXyStkvfXhSmZav3h2Etxj74pU6uG6p/QCUZqlhJwTNXsC84ewx3uUndnozwpGPj1JGXOvsBOesUuUa9g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5dJPnOnCIZdXI3UPxRXuf5HzfOKzQ3WwXT6iXoQn+siZSFkvg
	bDd4mRjWln8NtBiRShXh9IA5P9Fqm3YfyfB6rVd9MA6yOPV/hjTZ3/XOe7IG9lQc
X-Gm-Gg: ASbGncudL01P9VfMEw7e69Xy1xKS2M9fSW7YUeFMGnGUFIg7eLTrEBq9YaYjWP1W9pm
	/57am5fFvWkmQBFzf0psVs5HrZNFg1fY1qr1ieXkO+6sbFvpS6WCCy1nvQHW2ZlGVIFo2XE1CqA
	RHdajmjldAy+NFEjl2WcHn6Xft1qgeg/qwBZ41sGaHLQ1FRBVdtWe/I2ftl20nuXTni4EP3piio
	8Uo+dr8DrRQoFN6dBOJPAtYh7fYLm40kZUlZkg+k4X5GCJISIXscbfG2Cmjy86cgEYCqebnxm4e
	Cd5td9urRx044SrX0TqxNrXcQX0+URuqVUN128alX1LXrPsLNlAO8L1AwgV7L9yX/QZ4fMNw4n+
	RyY1Tg8+dH3A8OUS3IX8n/iFSfkDccOjQeQtXyC3BDDwpH8JMw71oqv+LECKxbVamQOVFX7IAye
	dyP+ox2bue
X-Google-Smtp-Source: AGHT+IGff2l9ufL4NeNqwyVNjvL8Pud5v87IH+281X9l0kkYxr5cs/X7Utey6E9qDPWIEsvuhOgHvA==
X-Received: by 2002:a05:6e02:12e7:b0:426:3ab1:74b9 with SMTP id e9e14a558f8ab-42e7ad9b00amr173366855ab.25.1759710041692;
        Sun, 05 Oct 2025 17:20:41 -0700 (PDT)
Received: from gabes-framework.lan ([2607:fb91:3c85:4c0f:1139:4ccc:af91:f49b])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-57b5e9eba46sm4325943173.15.2025.10.05.17.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Oct 2025 17:20:41 -0700 (PDT)
From: Gabriel Whigham <gabewhigham@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Gabriel Whigham <gabewhigham@gmail.com>
Subject: [PATCH] =?UTF-8?q?docs:=20hwmon:=20fix=20typo=20in=20sg2042-mcu.r?= =?UTF-8?q?st=20Fix=20a=20spelling=20mistake:=20"supprts"=20=E2=86=92=20"s?= =?UTF-8?q?upports".?=
Date: Sun,  5 Oct 2025 19:18:08 -0500
Message-ID: <20251006001808.16962-1-gabewhigham@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Gabriel Whigham <gabewhigham@gmail.com>
---
 Documentation/hwmon/sg2042-mcu.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/hwmon/sg2042-mcu.rst b/Documentation/hwmon/sg2042-mcu.rst
index 077e79841..431ed832d 100644
--- a/Documentation/hwmon/sg2042-mcu.rst
+++ b/Documentation/hwmon/sg2042-mcu.rst
@@ -18,7 +18,7 @@ Authors:
 Description
 -----------
 
-This driver supprts hardware monitoring for onboard MCU with
+This driver supports hardware monitoring for onboard MCU with
 i2c interface.
 
 Usage Notes
-- 
2.43.0

