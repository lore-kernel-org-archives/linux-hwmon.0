Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13EF73B3BE5
	for <linux-hwmon@vger.kernel.org>; Mon, 23 Mar 2026 16:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774283013; cv=none; b=BCEs21t3sT9BXEoobfkL2gz86JRIBnMOasb1SL4+bSRO83Q3A0FheMTU71LA/HeVz2e8K02rQPhgBTi8ZKRcU8jsftIUTzmw4inOZrHo+Xw/6HDTYd3Uon4UvRu4gRTblGgVQQZEYaHbUA91JuH1scP2WR5liGoBG/CPrGeEUdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774283013; c=relaxed/simple;
	bh=wlROWR2JvmCSzmq6xZdptsC8bpqUks8BZe2WwV78JhE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JG3NK3k2FzDD5N+Kdoy16iBGhaXt8LIzCVKiO71uTCzdT5zZAJkJwETU7W4lyQqzzry2P92WrUpVDE7zU0BBpF9gkclJ710NyAPJ8TQMjDIMJ1x31lnmZDi9U0ZexPs5yTlK6hd9hm8OpyvhurnijDMJJ52hrCazLTas/8O6U2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l0Arakyf; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l0Arakyf"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2aaf59c4f7cso1792355ad.1
        for <linux-hwmon@vger.kernel.org>; Mon, 23 Mar 2026 09:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774283011; x=1774887811; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NJ5qrcsx/y7g2uR+DSKlCpc4EBVmOqsFnYDAG9z5aG4=;
        b=l0ArakyfQvbtl51gfHJoHRj2bCiBn/OEkpU6JEo43VUL2ozlbFyZ6P9gCmJ0suChJ4
         zjS1hUSYqev6JxF0NA3I03gxp480DkPEo2M1Q01znWJf8OVoQJKJL3fhLWuwfIfSO314
         YuFWuiMKvaZyNsc+j+YRPRdgARHlB+/tSuXO82CmQ53gcuYz5lD1nbj7JHmXVVRDd8x1
         n3Oj5IfG4ZJ2IZHl7ctdXqGcAeA6vUXe/FQjc3hIfO2iSJX9i3XDwA+IgFpiQ82Kqruj
         thJx+ktmKj2AYdwhh6KVLgZven097lMZgAQF92nV8CP70xjCvIcU6eFYf4q4Qf8FeD3t
         Sh6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774283011; x=1774887811;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NJ5qrcsx/y7g2uR+DSKlCpc4EBVmOqsFnYDAG9z5aG4=;
        b=aAfItbk+wjHN0TM1ZD9ZNe5TOEa6laNPHtxydrVRGEDfhqVQNqMh0zs3R2oWupRa2h
         NWSTeuRDgMOP35lXJlGz2uvg+hckKSU0uC+57uc/QEk3/ecX6gQAYHr6YjLhoAz5F/ZX
         J+/0Yzk/jOtS7ivcEsU+zOxGMJsW8IrhBWUAOUfCEHxlBbwlIbwZGnWSBNBqmBTr7HQY
         QAt9jyd/FHR32M0gGUT2eM0/M1ng1zqPyxrprYQJC5CJpyvxYWMhJsWKtaIxcPq8Cypr
         pQt8JgT07Aiuuub7ucgm7GsW/oVbYqlMbd7xAGOCCDIzp9zzZB4SNshOyNL+NzIxZfy5
         AfEA==
X-Forwarded-Encrypted: i=1; AJvYcCU9wS+xIOANU1pxYn4sQS1omIfsdMW3lfTJesbfHUDN9j+5+awwsIdKX5JIDS4KzAjLGMR+y/91WL6YbA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6RI+o0d8AugxaapzOxefeRQJ/tFDWdnlamhjPG52k8XVW7mvy
	rpokPxFcV3l3OleWl7MnPHff8+Z1KGkvKuQgpFbB9nQS1uDNB2vEjhUk
X-Gm-Gg: ATEYQzxXIoTyTFCOsXLiVZBxVO7BPGbn0aRg/0fda7NSx/OBK38Z6r4pBx/H329ERGT
	y7+jPcc06wUSiDvxlAjHgD5MGGfNSecy/Gf/ZNvynwo8ZQOX9Nvy0TgSAAbvOKpHVR1Jxthxi5j
	tDShlMsRdhtfJPJpqRcGwW15urcN/1zaptentsaEh5WuZsiM6yPLCxmTzH9hR1/bB21EcPt4LZp
	A23TkjkO1efrbLyV2r7SWvWV7KiTzDVWMXSGR3j2oDQdooD/I00/bd4Zo/JcElozimITRhAEA7s
	czFRIKYSIBnxl02PhXBBwEkgJJM0gN40hvQMUDxAm3mojxvMAcpn/mcyW6k/wt7WbtKav4nX9yp
	grAJoLLpj+QHFnB2s+ki0CtI0wxAhSA/VvacowbJUzB28dlsfFOObhiJIndZjnXZAWLnnVbSOde
	9nzZU43iAk8wOjYw5sivFhLSWyvPOMiQhXzXf3Vle/2R/JM8yHvzke5/2/HdW/tQXBI8fUF3zhK
	iKJ2Vprjr/y1OYMRwfAX9PZIRS+7wNFcy4G3Hvz+g==
X-Received: by 2002:a17:902:e542:b0:2b0:9101:1b83 with SMTP id d9443c01a7336-2b091011f9amr66516145ad.53.1774283011199;
        Mon, 23 Mar 2026 09:23:31 -0700 (PDT)
Received: from lakshay-piplani-HP-Pavilion-Laptop-14-dv0xxx.. ([2401:4900:81e1:cdf2:5b00:592f:5488:918f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b083516cb9sm118477755ad.2.2026.03.23.09.23.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 09:23:30 -0700 (PDT)
From: Anshika Gupta <guptaanshika.ag@gmail.com>
To: linux@roeck-us.net,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org
Cc: lakshaypiplani77@gmail.com,
	Anshika Gupta <guptaanshika.ag@gmail.com>
Subject: [PATCH 2/3] docs: hwmon: Update TMP108 documentation for NXP P3T1084UK support
Date: Mon, 23 Mar 2026 21:52:51 +0530
Message-ID: <20260323162252.15508-2-guptaanshika.ag@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260323162252.15508-1-guptaanshika.ag@gmail.com>
References: <20260323162252.15508-1-guptaanshika.ag@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add references to the NXP P3T1084UK temperature sensor in the TMP108
hardware monitoring documentation. The P3T1084UK is compatible with
the TMP108 register interface and protocol, and the hwmon driver now
supports it. Update the .rst document accordingly to reflect the new
compatible device and its expected behavior.

Signed-off-by: Lakshay Piplani <lakshaypiplani77@gmail.com>
Signed-off-by: Anshika Gupta <guptaanshika.ag@gmail.com>
---
 Documentation/hwmon/tmp108.rst | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/hwmon/tmp108.rst b/Documentation/hwmon/tmp108.rst
index c218ea333dd6..cda280032710 100644
--- a/Documentation/hwmon/tmp108.rst
+++ b/Documentation/hwmon/tmp108.rst
@@ -11,6 +11,13 @@ Supported chips:
 
     Datasheet: https://www.nxp.com/docs/en/data-sheet/P3T1035XUK_P3T2030XUK.pdf
 
+ * NXP P3T1084
+
+    Prefix: 'p3t1045'
+
+    Addresses scanned: none
+
+    Datasheet: https://www.nxp.com/docs/en/data-sheet/P3T1084UK.pdf
 
   * NXP P3T1085
 
-- 
2.34.1

