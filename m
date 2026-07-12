Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E993A7186
	for <linux-hwmon@vger.kernel.org>; Sun, 12 Jul 2026 13:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783861431; cv=none; b=Ovp1PO6iwLoc4wi69WmbeBEb/dTHjheenLN0WxpKsUXt62jh81SRmq9zs6e7A1OXUe4NBmr4BVm2q81gl/XoUozDo6uJTjygv6zk0A2SHGMvnre9ekpF2GhSGc9kH1KpMv0ojAUTzUPL4n2EQ0nYhxL2J+00KtOv/cC9k3nF7Xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783861431; c=relaxed/simple;
	bh=MKn1kORmkBAS/YJ6hxXyMIwkCy1UJye8bWea0cnf7ms=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GMg0DjsfOez2y4qoAweOAFc0vqgmEABpdAfelkP72rcjJX5zUulteTMe6wX+BkyDXZcmaWoojtvhTivzCTEfYFjHQoNbFq8djMBOO7kAygc2d+b85U+qWD9vKqQM549jynq3Bb54vJaCeLy8hP3FYFZeRyLJUHsTILsrfjua5+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EwmNIPtt; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EwmNIPtt"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-47dec32798aso2355579f8f.1
        for <linux-hwmon@vger.kernel.org>; Sun, 12 Jul 2026 06:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783861429; x=1784466229; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t95Ul9mARnKUVDinSVuxqFFtElzn0QMk7hj2VBaMK/k=;
        b=EwmNIPttmOFUDLGE8kLI4K78uhE5uzGvEV/x7O6LCcS/RluZy3YWym+ktzEfWLRbjU
         TJMcLcZuJjvDiZ8ZHwYk29Na1aU/nLrb46mOYK7P66cBbrRwqFINwzxPNFsNlNvp7W7H
         ieKkEmJkTFusF1rRcaKum4ebbQ9OrBQREfte29uy/bX4uLkKrQFjuSmQtljAbMXUx2Ux
         bXlWe0m4jnw3zsfHB+XeBivYZUcwcuuLn2WIqM/WNbuO6wVXzewdAM02+0WsrYjXaMyf
         Gr4lVFhGdoFqM9pEE6LPEZyv3vEmbRjNdIO9a2+OJgvKZWVWPnwPCmUqwpw8/1inT1Xw
         6t5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783861429; x=1784466229;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=t95Ul9mARnKUVDinSVuxqFFtElzn0QMk7hj2VBaMK/k=;
        b=XjFAPMR3a7OevHiXnyGFuI16H4u52G9ngQTwp/D5xFO3udA5QRCGf5+JcATrvhGO7a
         P4ibSXNTlDz9ou+vw5wXeWauyK37/ysJsUvSLyNWIJM/mC3nrcYt3Mz1piISqTxCxL/C
         2NAYFGvkovh7gogUVBYaxT3XI/RN+8ea2rOQUwpEpHVzCXF3pIp3XEzEp1Ess+NUa13w
         s7hrSerbBFnwKR0RamFdYSOc7sR59Az4TnXq6ChUTG+Gc5Zzg3ehIZAiubU2focpJOxq
         XeVTEjvPYf5nVmv/D+jndyN1EpbQ9Dylz7ibio46HDokUSQA3YPtiHmSwYW4fKW3uwgl
         pnSg==
X-Forwarded-Encrypted: i=1; AHgh+RpJj3lfJX5tlI0ypq8iKNaSqHpEkNDGyG7QOU2D2xSIQZvzO97XkAQXLEEoKIdQajL438cZk8zUZRiCQA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyuIabzG59rMWw8B9lFWErSy0Bzi5erqNMB6Tn9vLT4EaKFSImM
	r5il1SEwUusbcTc0k94RZUMBvRn44amBsd/kQkHGmuFI4oQQ8QmCvrsg
X-Gm-Gg: AfdE7cmwKDtnTN7yaUyV3gufSopTtcVzr301KOwEugqsQVjI32svx+NpxXVjAldu6+U
	NiZLcCo5Sye+GANP++WpN0DoLiNZgMYQMX2x0qMzq/9X6tFgyFB48Ghzgu4q9jKmmdvQRLqY8Tv
	rOpcIlpp8n9ZzaLyrlXwI2xXBklubmp1KKjARl3jfZ51J2SxJcKpa0k8PzOLdYfJ2g/DZ/KSxMa
	ZkwlhGmipWfx8nZ0GsYlniQhHGU9bUd5wwEqr/AJjeonBnVOSg30Z1KvVsm4h6ySOcLSt65FIbF
	2ZznybiKN4AlkpfYxUhYrUD994WY35fhr8Bj4YmBQ45l3Rms1Hvx0ANocXHq6oyVHod4kTSg243
	na+Fsnm18monvznZJPPA4MRCq7ZFixGTFnG6uFEC8K1dn+pokMfqi1Lsfg9Klg4fw6K8O+rKRvE
	QF/aNeVuKQmSfVTevWMmYtD1Gmdo7Q0BQ=
X-Received: by 2002:a05:6000:607:b0:46f:7d90:811c with SMTP id ffacd0b85a97d-47f2dc9b83fmr6936602f8f.13.1783861428888;
        Sun, 12 Jul 2026 06:03:48 -0700 (PDT)
Received: from puma.museclub.art ([2a00:6020:b326:d300:d19:a765:d8d7:bedc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9de1d8cdsm79784006f8f.1.2026.07.12.06.03.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 06:03:48 -0700 (PDT)
From: Eugene Shalygin <eugene.shalygin@gmail.com>
To: eugene.shalygin@gmail.com
Cc: Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org (open list:ASUS EC HARDWARE MONITOR DRIVER),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 1/1] hwmon: (asus-ec-sensors) add missed handle for ENOMEM
Date: Sun, 12 Jul 2026 15:00:38 +0200
Message-ID: <20260712130345.1256030-2-eugene.shalygin@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260712130345.1256030-1-eugene.shalygin@gmail.com>
References: <20260712130345.1256030-1-eugene.shalygin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing return value check in the setup function.

Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>

Fixes: d0ddfd241e57 ("hwmon: (asus-ec-sensors) add driver for ASUS EC")
---
 drivers/hwmon/asus-ec-sensors.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/asus-ec-sensors.c b/drivers/hwmon/asus-ec-sensors.c
index eb71e41fd4f4..6a9f369928f6 100644
--- a/drivers/hwmon/asus-ec-sensors.c
+++ b/drivers/hwmon/asus-ec-sensors.c
@@ -1495,9 +1495,11 @@ static int asus_ec_probe(struct platform_device *pdev)
 		if (!nr_count[type])
 			continue;
 
-		asus_ec_hwmon_add_chan_info(asus_ec_hwmon_chan, dev,
-					     nr_count[type], type,
-					     hwmon_attributes[type]);
+		status = asus_ec_hwmon_add_chan_info(asus_ec_hwmon_chan, dev,
+						nr_count[type], type,
+						hwmon_attributes[type]);
+		if (status)
+			return status;
 		*ptr_asus_ec_ci++ = asus_ec_hwmon_chan++;
 	}
 
-- 
2.55.0

