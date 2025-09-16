Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAEFA29BDAB
	for <linux-hwmon@vger.kernel.org>; Tue, 16 Sep 2025 09:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758016357; cv=none; b=EWN6WlaSAST2kLzsMYMFFYeqgUDS5U/xguUqz0fYLpyNJhslsJUi73e29eBxgnVlZuekg46ckLcw575ydTfE0NmJRDACrxZxfMuAF3Z7C95v/6qPFCHc2jhfSVkv5Ep69IYHwckjOveambb9l/ajnRZV+xocdmyi0VL17AaF2o0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758016357; c=relaxed/simple;
	bh=M9V51AxzPBO5PwhtBLVHE9xHOolKyukF4W20dH50Hk0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=t0GtYH79cXs5awQHlNDGRboMualDGxKkR4Vo+UyFwe4KyRQ7fjd8xt9RAkUBEw9SyyEZq31dde+mEqPTIHZK8/qRRwlmoQxBODfET1tu6RIL7iiIXapDBawnZ1dN5JGWMqYq0/1Zqhb1G+6tMlltBd3guhXStV1+46kFf49W4nA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H8b7oQg+; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H8b7oQg+"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-26685d63201so18155645ad.0
        for <linux-hwmon@vger.kernel.org>; Tue, 16 Sep 2025 02:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758016355; x=1758621155; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6V/2JKFCs/FeFWLTSODQDr7ffITBUaTSIVuTLike6oc=;
        b=H8b7oQg+0i+beSJ9kOLlOa+OQQES1ULqg896ntTDjZYEIbCJ2VqItDnVuErZr2pEsz
         xmPHVK3pc5CZuEURXZcxGLM2sZN0GdLsz+TvpK0YQdcrUKNLSSf793w8qbsA+/WJBqmf
         L782SVhe9emv8DZENORzOUsyqewCtWb4UHfysgUqEfloC14KHAKx+XTezwqoIrjnpOR7
         +H3zX8f8OPbpM9dO9wun0L3SQpOSgCI6Lw+WwdP3JQtTqioQKpGxCigq+Q8rs/bEYP0V
         gsV7IbZBQhJBVQX3cLsRGd6BuewJp/Tz2/TZKeDFa18nvy0BnC8hH0aPWoRCh0WofJL5
         QBdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758016355; x=1758621155;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6V/2JKFCs/FeFWLTSODQDr7ffITBUaTSIVuTLike6oc=;
        b=BySrK7GOjcVgt6SLogikLbnxBs1PvfZej3p3CbkW7H+gX4Vq7P04+Mdg6zAzaXU98u
         syuiGLP7ekp8EGLOLqiVxtv7PSbOtW4FvsdeJ3cj26XpJc2jhQTxK/PzkTIdZSJ5emNA
         oMyqzD3iArLBZiyAIa08joLtxb20m0uViirYDN3ZmzR0ydgItW8sU8AOuh2yFNXqWg9x
         qvCO8TiETKQ11oCF+bNAvtxmIIPNOm7A6BBu6uLJB3Ia6sNkWxWF+0WSTrgTwSadNAix
         6hbu8iVmIGXf+d6053oJoqAb0CZRkNDLpgQiIVF3rOQxhaRNToAEGaMSZLBczu1J/sCz
         s/2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUnGBmx09Lr1Gjaauk6OGUdgMVbcIlnLcwGb1WqS/lLP4OCPqr9OuJoxltgy9cEDkSaBunYhCz0nXvSUA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyfaxCNw1gqdm27H/sdg2Qgb36XfNQ8jA5ow4shWZ71S9xerJC7
	7BZchc9S/xTmYpQ2cT3jMo/hrUbkaTbWYaE6yZl/kgrXcf2CF/oTDgP3
X-Gm-Gg: ASbGnctfemZjY/VBc197ek2vfEnDUrQh/BjtoZsvgajqx609IVa2b9DzCasGZ0xCt5y
	Lc8wtwG31oZcmuOqcsNLoY0++hwOzSg61AVycR0Ul4Su/rb0kle6fbGNoXN6M6ME4hF2wvTZg4d
	iH1CEZ3pLAnPLEgVwF80f9rD9Xops5PGBZbXLPlfwnaHB5juodbsNEQr+m8pnOLXrnOqsGi+aZd
	z14XnAFbdoKpKeY5nzuULlUQsvF/iVeNYvfeVGFvYHzfTpg4yJZdFN5bJYcXzL9vWyIcaqAOzVW
	fiPCt8dC0NEnp0u+YX9dsk4GwQsLWHgBN/GMtBVojiZUgBNTNG1oUNg9us54W/rljBUXQV1E7Xg
	3uwGg0d+0vqTSHZQJ79hEGRVIhQq2MbtTeri4gzN1Mx2gEM4XUzzr9DBqawUkPofULYn6TknDZy
	sq6hkoY+Idz48ibcQGUfvOqdw=
X-Google-Smtp-Source: AGHT+IGzMLRxu46ZOAx5UTCfKaKDFqV7qJKe5pWFw2whXOGJeDPlIq5qn0wXezBFeDOYYir7k6rHew==
X-Received: by 2002:a17:902:d504:b0:267:c8d3:21ca with SMTP id d9443c01a7336-267c8d324eamr34843155ad.44.1758016355232;
        Tue, 16 Sep 2025 02:52:35 -0700 (PDT)
Received: from cosmo-ubuntu-2404.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2667b4d380csm53935775ad.71.2025.09.16.02.52.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 02:52:34 -0700 (PDT)
From: Cosmo Chou <chou.cosmo@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	jdelvare@suse.com,
	linux@roeck-us.net
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	corbet@lwn.net,
	cosmo.chou@quantatw.com,
	Cosmo Chou <chou.cosmo@gmail.com>
Subject: [PATCH 1/2] dt-bindings: trivial-devices: add mps,mp5998
Date: Tue, 16 Sep 2025 17:50:25 +0800
Message-ID: <20250916095026.800164-1-chou.cosmo@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add dt-bindings for MPS mp5998 hot-swap controller.

Signed-off-by: Cosmo Chou <chou.cosmo@gmail.com>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index f3dd18681aa6..d86b2b72d1af 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -305,6 +305,8 @@ properties:
           - mps,mp5920
             # Monolithic Power Systems Inc. multi-phase hot-swap controller mp5990
           - mps,mp5990
+            # Monolithic Power Systems Inc. multi-phase hot-swap controller mp5998
+          - mps,mp5998
             # Monolithic Power Systems Inc. digital step-down converter mp9941
           - mps,mp9941
             # Temperature sensor with integrated fan control
-- 
2.43.0

