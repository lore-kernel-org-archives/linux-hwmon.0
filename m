Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FB5F273D83
	for <linux-hwmon@vger.kernel.org>; Tue, 23 Sep 2025 19:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758655785; cv=none; b=kIIeXWONm2uvDyqEZCceIqK0QhyIGDaD6wS2jvwnMpTwxCjdcV4kQqspiRm07v7OYY8F8BdS2cUUqtp+mGwVN333nmFpyzkIbGY+nlS9AqetE6vBksUexjJs6LIRDcegtkZKmCVSohyk5fnK/CLmcn1V9n3uRqUKLT4LuC/6PQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758655785; c=relaxed/simple;
	bh=LcfSPyxliarsrjBW8KdLJnI/wfhzpiagpiOPZ9cPBYM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QX+wFtThudG0EsO2Fu7GN9UmTfQq7bhvWByz1FPiW328yge6hmTIlqRXEAs06d3PNjigFbfeczrC064HM9sKwLj5byc+/ruAY3BjW6KyCSFXSQFdLUNS/3yBJp3pFRRbTl7itcWSGcfgrZAEhNarQGIz2DvNr97quqkgA4Hye3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YyuQmoEm; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YyuQmoEm"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b07883a5feeso1181867866b.1
        for <linux-hwmon@vger.kernel.org>; Tue, 23 Sep 2025 12:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758655782; x=1759260582; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WKw5WBcdwThDcwNolMRNTEm2HBfxrHADbBhqF6TW9ZY=;
        b=YyuQmoEmdMl/gzsCYqMtNOcgrdj9MYbs8CeLr2XUPgZJhz8I8wBEbnKzmLm2h3dnus
         VLoHGVRdrGoVxSCt4gAT00uJpHdn4ouIVh28ZPROPIyKhHI3W8gVvvRSflPvaUeRsQyt
         8bJrm8NkO+p8XOyhiVA3vQwtAfiKBl49RiRSFu0DhdlHRBocq9WCBrr0z2Ey+oYQ/9+q
         Fb5V8F9tWD27sR0HjUk/6tBXxIcP0X0OPN7n2S1fwx1ZZfFpLdHyxbRrCkWPcZouHtAa
         iz1l19z9GzJuwmqNcy5wOCAyvykl++kf9TnOLdcpF64yZmpqbFZjQu3tsEXz9DX10QS6
         5GxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758655782; x=1759260582;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WKw5WBcdwThDcwNolMRNTEm2HBfxrHADbBhqF6TW9ZY=;
        b=nUr+o7OXCdTZZWIZdwJSnsdnyHfwAHxYF5kPg6PQtJYkx6ksiZxOCOsS07BH2/gLtX
         Q5AD9yUN9jwtwyCc10ELwyyKXmCwMa6SKiX2MBRALwVLxNjqOz7tSmqRwKHCsvGyDL8R
         MMm9VWgjGjqS6W1No5MZdVHU3y4HHsYQrd24aM0RdS5XQMUqWYYcqDfE1Uh+K1VADELp
         6gCWeYvVmauhWTlvt+cxs5y4r0pdAupS07tpkuLAwDJvQcgoJIeFHSibbdBqsKYx/P5l
         wPUWgcqiaYsxB847uzhdeHYGDdzAsrx+2F9/NjeY3Y7kvp55IG+2btfQ84q5QgjpQGpP
         o6HQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3e4ZdmDi/5e7Fe9ll258lAfGLZLYLpTaFxey32it7SSjg05cR8Rp7nkz2nVcbfvksV4hVkzOMEP1qCA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwuJPIeda4Fsyjh/chArXmkFtsmPMKEdv0VBvnyKvTQiWxD8lIJ
	DwNxv1Bs38slUArNZN41ljHIMZSnXg2N8X0EHSFnxFUwsOU72XIi5bte
X-Gm-Gg: ASbGncu4lKmzM4gWJoa+NLshjJUw8YvINkyDBwDFgACR76+pNyAyHUtFjIrioscwcMr
	/hgEqEOjvc/zeQEzXNmZ4Lx/j/9GW0T4or+v9M2Im2A176C00GNjQtrsaA0BpQhdCuhfhJUEbH7
	YhlJQup4UpZteRQ3un76eOOzD7jVbxXoDcAYtiOeRMlXxZVA7mxz14m5ZlSnLNK1xAGAKZoIVeb
	1aZhZZEgIkSXZQHjGBmMjylya28p9vih2+HM09O4d4RVnpiHiaMJ/Jeo97W4IU51jVIm3d83Gah
	0reFzDrRkw4lDN/l9mhrswNWQnUVqznn76dCFxtA7t9BYSG9juD2keELoeOWLZUIXO6fxIp10cJ
	Uh650ahF7L5+x0WJf7EZusjdT1jluviiawhOlwcD7MrY=
X-Google-Smtp-Source: AGHT+IGQZQoVuZFs1hNmyeu90pPHQt+clUVbl7wl8s1PrL/ZcHhNRHRWTlkuntkRS7bYFsGkeIHO8Q==
X-Received: by 2002:a17:907:980f:b0:b04:45cc:9d31 with SMTP id a640c23a62f3a-b302bd1dfe4mr340385066b.59.1758655781873;
        Tue, 23 Sep 2025 12:29:41 -0700 (PDT)
Received: from puma.museclub.art ([2a00:6020:b3ea:9c00:26e7:b56a:5a2d:1d72])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b1fd271f895sm1370710466b.97.2025.09.23.12.29.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 12:29:41 -0700 (PDT)
From: Eugene Shalygin <eugene.shalygin@gmail.com>
To: eugene.shalygin@gmail.com
Cc: Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] add ROG STRIX X870E-E GAMING WIFI
Date: Tue, 23 Sep 2025 21:26:54 +0200
Message-ID: <20250923192935.11339-1-eugene.shalygin@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds the new board and increases the ACPI mutex lock timeout so
that the driver works with the ROG STRIX X870E-E GAMING WIFI board
without triggering frequent lock failures.

Ben Copeland (2):
  hwmon: (asus-ec-sensors) add ROG STRIX X870E-E GAMING WIFI
  hwmon: (asus-ec-sensors) increase timeout for locking ACPI mutex

 Documentation/hwmon/asus_ec_sensors.rst |  1 +
 drivers/hwmon/asus-ec-sensors.c         | 12 +++++++++++-
 2 files changed, 12 insertions(+), 1 deletion(-)

-- 
2.51.0

