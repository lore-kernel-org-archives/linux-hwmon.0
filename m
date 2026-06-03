Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E91D46AF0E
	for <linux-hwmon@vger.kernel.org>; Wed,  3 Jun 2026 11:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780484493; cv=none; b=B31i3a5FDsjhfEn8jMnUizGwYbzqA+PXwxHv/HsX9/ucS9x6J8n7or0/nV4G7OZM8+cqbhHOlY7xSX0Oiw8XGkSMUakv0ltfa//cQNCRmGUUQlR6tm6py3u85c1bhQOtRNIwK5TZj4D6FbtVtM24z9exCKTEKBB7pwNOot42K2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780484493; c=relaxed/simple;
	bh=gUffnRCkZd8GCDVad4nVwDK9l/4YI41QMrTFTZag9po=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NadtSBw5cCr/ub9ltUrnBGK0clq/mr4SzGFXc2oy6jwmHZ9keDqQ5GVh9lKpxe360HZ2FLnW2ypyTPLearcIc7D0ZkQws+jFxn2GXwtnZvQNlInI+xNRWpphtV4/ORPJw9rNYsWH1MQn4MX2CGgKW2YsJ5fc3g3wFjMbQTDs+Ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=TySAk75b; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="TySAk75b"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-490ae94a89eso26067725e9.1
        for <linux-hwmon@vger.kernel.org>; Wed, 03 Jun 2026 04:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1780484490; x=1781089290; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=im10zWUipLMKBqnVFXqr0KEaN2pPpAtbqMH2WbacGe4=;
        b=TySAk75bvOfPx1XvqKp8CqfVI2ej2/DNr6ytwUdC87W85ssfcFPp05diYJAdWif3+q
         M7j6ovNAbgeQ0Z5Atzz8HHHY7h0HVXqMfHsuV/4WU4j5dXckO0B4WtPxFuM7pUyj0pBD
         VZ2o7t7Xr/fVFL9QlS0zB3af4Gpc0bDkpXLKSehc8RJNjqS3ylj8GUlNDrA1aSDbBSAX
         VRDOINiAX/aniK3G6LJNfEsJhuYthEw65axsK8ov4MQVHvBDhn5NF7tP5h6ycozmJzsP
         Zqud9tHBwtr6Ea0/vACuogTdWP6sikZhdLUkUM8GaJGnQqSYPOj72lPfzU3weloV29zF
         BCAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780484490; x=1781089290;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=im10zWUipLMKBqnVFXqr0KEaN2pPpAtbqMH2WbacGe4=;
        b=UkWQax5YK4qeekZ1JzrOs6BR2Vof3G8KRjCEa4/DXpmHAAQSB0EAozR/WHXibxUA3I
         LQXmiGh/xVGF7MLMJtbfusyurhi3zmMyHB6sz977viNueSF8lYOy+OgHog108kNVS642
         e2qlUWIzIgblkQWoMbNFLDr43UP3VSOsvIKvh4pMvpF8SErDuGykVL7dzosNTFKjOg8P
         idmTUh7hM6jpiKAsgdI/uXNadAl+kQByD2L91+F7TkrTdjy87dqNm1mVyf5GQGs3jeWB
         D7QzlQyGaqL0DAXPWY90dju5XEgtn2qWPUTm+VeEy9/pcdV5sj1INwUnae9E/KTMce/N
         IWrA==
X-Forwarded-Encrypted: i=1; AFNElJ8veI/wXl58qN5zYGBtsVAM6+iqkKjr/ggzP4Ak4obqG1zL32ylnAF/kcZz8IA3FzNUaG4SfpEfWv1XEA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyE7KhGn4VWZfrHsVOUbh53JO61UpM0myj+Hzs78CIsjJtKM4nk
	ErCAjlMjgI/knQMGn76d7i43++CkIuo6tB3AsNQveGAFkwfoRHK+li8cQxBMfls2PCk=
X-Gm-Gg: Acq92OHsflC6bsaqxm6NBATCeK+XTIUqVoKP5hz0mR+8I4iYWodkbahGny6IPZDQGHu
	xBjAyCvusGEC4WZDw1Vr5njNEF6LwbWFRH16HY/FM3jb1kGSV86YG2q0yxyVKE82vVU9e5kJ4By
	P5xVV1bjfMjce9g6PHGbeCfzh9x6miMTvDOHeBGXXM5PXqtdycKWTZ/HypCWvUQta2gXCLNImrF
	65Z9B27+nO7ibXgXog3ZqWTnI43M1h32MTd4H+5QWGMuZq7E/gT3RydAR6AcUK77iqJGF7e+spU
	15YSO96ynn0yHjCBzMzRBEuk1PdwENo2r98kNSJZNJuFw46eZfYfyRhEUyl6BFiTw/XUnXz/xso
	8tGyMbsLItjEKURnAeNyYuVZ9pLRu2OpmsIqYiUma67Kb6iXmqjXN1hCxwGUS0TTGt5ED2hn3Sp
	ANDlOYtHPK4mSZW+QhZO+/cVkpJZ/6GaFMHsV0P/2e314KfbIkV15O6+Mtwx6px4mJxa4XpeXaf
	nD7Anpiiu5CQk0458hkmiEpeluprKhWcfakM5epi8qfoePeD/jumw==
X-Received: by 2002:a05:600c:8b30:b0:48f:e26a:1744 with SMTP id 5b1f17b1804b1-490b5eb4aeemr46258005e9.9.1780484490576;
        Wed, 03 Jun 2026 04:01:30 -0700 (PDT)
Received: from nareshubuntu2404-gh-runner.lab.9e.network ([188.111.3.154])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b0e76153sm138908575e9.11.2026.06.03.04.01.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 04:01:29 -0700 (PDT)
From: Naresh Solanki <naresh.solanki@9elements.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Grant Peltier <grantpeltier93@gmail.com>,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Patrick Rudolph <patrick.rudolph@9elements.com>,
	Naresh Solanki <naresh.solanki@9elements.com>
Subject: [PATCH 1/2] dt-bindings: hwmon: isl68137: Add RAA228234 compatible
Date: Wed,  3 Jun 2026 11:01:26 +0000
Message-ID: <20260603110127.23930-1-naresh.solanki@9elements.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Patrick Rudolph <patrick.rudolph@9elements.com>

Add the compatible string for the Renesas RAA228234 8-phase PWM
controller, which shares the same PMBus interface as the RAA228228.

Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
Signed-off-by: Naresh Solanki <naresh.solanki@9elements.com>
---
 Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml
index 8216cdf758d8..2988bc6300ae 100644
--- a/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml
+++ b/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml
@@ -55,6 +55,7 @@ properties:
           - renesas,raa228004
           - renesas,raa228006
           - renesas,raa228228
+          - renesas,raa228234
           - renesas,raa228244
           - renesas,raa228246
           - renesas,raa229001
-- 
2.43.0

