Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A2A38CFE1
	for <linux-hwmon@vger.kernel.org>; Mon, 21 Sep 2026 06:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789973858; cv=none; b=a6TUDw7xUZFlXM8oweX0r6hsIKW3LkEBPWFLXmd94rQEdFy7wRUfE4/nsvsk3BQ2tIzYjKyMkwc4rRUeRy4PNWS6NV5iFGs+vvFSi7KWpiLH84EDpqBUDhyFN1fdxYMoSfnaV3jiFUrN0P7gmRKKQhTnoO/ZY4ya00lHTa/QrTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789973858; c=relaxed/simple;
	bh=lx5t21IxVjxKqvcQUzQZws4GYGjiA99jB9zQc+Wt2dY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DlcrdUyiHxaB3FhgkaroRUUe9ZAZqkm07YD1WsrKPhgZENZqhxIhCTcAYEc3q4N48FZUe7od0WRpgOZQvOzwepjUU4xsDW+/+TzQ5amtn5cYrRAlBjRZMsTiTITRcAPt9dp62h0nuhWFXzHBGC21u2LSSFoLnJqm8GTPAjvSetU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RR4s9Tau; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RR4s9Tau"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc1cebad4adso1833254a12.1
        for <linux-hwmon@vger.kernel.org>; Sun, 20 Sep 2026 23:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789973857; x=1790578657; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vPwV01s3NLUehlhBAA/2Qe72EvcVtk0vUYPcq7aQSs8=;
        b=RR4s9Tauz7OcckedrUi6FI6dua7owdAFQW/GN7EUPItGRckk+dlvjM0ihjGSUtluS6
         OIdz6xUUEBbFSyn7+WZ23jV+A9BmeisHPx2CH627LobgtRuFuZJNFbyR4sTgFvHz0EN7
         5Xk27BCF4EWeE0fKn1Y8hazjM7MzGq3ekzdYVkd5y5YVQMHRIl+P2M1RQB7Xthah2vwY
         byqknhIUFqVqbHlvgXFL+ZspQk5JNWd1BJeg61UEQGmyNRpI+8CaktT4inOEoyjluVH8
         ko+nEUwaGI1vd0uq5HUzJryy6WwtzNSD911n9hcG6rbz2AFmg7XSkynD3MkxEMJfKf4f
         2Fbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789973857; x=1790578657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vPwV01s3NLUehlhBAA/2Qe72EvcVtk0vUYPcq7aQSs8=;
        b=TvI38sQVag2VZor8ep7cQYFMDD0oSxTOUppFXPQoakZlywdDpL7jJQGnqmQ9UfHgra
         ALtc/UKX6GeD63yLPXNJMQTROOa5ZceDXhMsefaWTEmrD068QbTTUUrdwQGHXgwqF3mk
         VZ1QwQWXE73+2+FEUuetwqUN4l//itPD/6i1qCSpAU8BsJG9o+FgczWt0xIuEqWBFEcc
         bQuO0AIpB0F1KH9vOjcYIR1cdMht1kOGgteIUln2AJvLKe2l+3KdkajtJNI+SDtokv6e
         MFef16wFVfpHYH1EBsKO5efZg1ASU/mKUtg3Zw3NisfcaVUwXxsdgfF1pAr/LELc0lXX
         Al8A==
X-Gm-Message-State: AFuF++lQecZn5lm5zPW7y5f9esAFUMSt7eTYL+1PVBBTyLRZdpvjrHxz
	hVulaJ36fgHLC4HnqNNJrlZv8IOEHipIkFcBNwW7owE5xmcfQ66YJ3vr
X-Gm-Gg: AYBFou3+n93FkYJ2hHllJUEmHCCsKsupoGbUyXT7eioh7V0jUG5QKffcvt/BHhitRda
	xAITmEQ+B7kzgxTdpDMSjei2cQIouJ9O6Z81ts6jhL8vgk3kj2EGQfC41cWE0w07H572dzUs2xW
	ATEELiin+eUkHLit34+y3bbqvhbFGzECeIovfRfL+yHXCCKHJHgBDjX30tvz5EN0P+9VGQCBAvu
	YPaR6e7/ktYt1ghP/lm36N1meK6bwYnnIbQfLx3rxLyY5hEpB0Nw5yFm3IAKziABdR9W347SA33
	lgu0ibpgGAG26gfVm0h3tXIoK8GOs9mvnD9rAWwy0Xkux85euK/AqPKGGmpSfXaxmpdqbR22rBB
	Zo4ms6N0azBrV/HYRyGOedriBUY6CzEKTAkEayYMQuQec5dnYzzfa4u/ST/0wYI9TAaNxdLEuJj
	wb6V+khIOhKvDvvAiFgcvUhuzoPLOu31GtqWudaD5MAs68ixbzvw2NG/4Mm9ye183z3ySTQgXFX
	Jjua0TrnOGY4DZHn7RSqA==
X-Received: by 2002:a05:6a20:7f83:b0:3dd:a006:7b31 with SMTP id adf61e73a8af0-3dda006e165mr10128205637.48.1789973856785;
        Sun, 20 Sep 2026 23:57:36 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:9391:ec5e:64c1:1347:62e6:6b8f])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144d55f299fsm31398048c88.15.2026.09.20.23.57.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 23:57:36 -0700 (PDT)
From: ASHISH YADAV <ashishyadav78@gmail.com>
X-Google-Original-From: ASHISH YADAV <Ashish.Yadav@infineon.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ashish Yadav <ashish.yadav@infineon.com>
Subject: [PATCH 1/2] dt-bindings: trivial-devices: Add support for XDPE1A2G7C
Date: Mon, 21 Sep 2026 12:27:01 +0530
Message-Id: <20260921065702.93196-2-Ashish.Yadav@infineon.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260921065702.93196-1-Ashish.Yadav@infineon.com>
References: <20260921065702.93196-1-Ashish.Yadav@infineon.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ashish Yadav <ashish.yadav@infineon.com>

Add Infineon Digital Multi-phase XDPE1A2G7C Controller to trivial devices.

Signed-off-by: Ashish Yadav <ashish.yadav@infineon.com>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 2de8eb09cb7d..ce9619b382e9 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -174,6 +174,7 @@ properties:
             # Infineon Multi-phase Digital VR Controller xdpe1a2g7b
           - infineon,xdpe1a2g5b
           - infineon,xdpe1a2g7b
+          - infineon,xdpe1a2g7c
             # Injoinic IP5108 2.0A Power Bank IC with I2C
           - injoinic,ip5108
             # Injoinic IP5109 2.1A Power Bank IC with I2C
-- 
2.39.5

