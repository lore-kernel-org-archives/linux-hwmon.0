Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C7E1876;
	Mon,  6 Jan 2025 07:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736147846; cv=none; b=k5lHPVUNEezAVxAHOFW5TNj1Z0vW1+z2FLkhzhIbDf4h0mJYGO6H/j0Ew3wY08/HRsogvOlWJFwtyAzRWYb4Co8CVEzwYwYZ0Hd5QIRGFtIdCGQaYyadTkP7ljrnf/mchZu5TKpsGTAn+YfuBtCzfQvfgOGOqxgAOT/xDLrX7YE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736147846; c=relaxed/simple;
	bh=5IZ+3vLhnBcLf7jXN2760fNrXrh1yrdDI489Ssh9dOE=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=BTr9HeOxB6HLIM3/nnKyP76mU+c9clRQul/Iz5WEYmWRPnUBfYuA6Nu4s3t8LoRs6gISOex+Ef6UYHKM4e0F3YaeqtZItjfFxfYeB1Gxuk7mwflu43NaJVFyzJs9E0aOioqJlfFPZZlPukfOlJryPmhwfU2zweL6KbLNRZ0yRJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FnnZncZ2; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FnnZncZ2"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2165cb60719so203136025ad.0;
        Sun, 05 Jan 2025 23:17:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736147845; x=1736752645; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=O1w9zSpxK0DLwBz3Sc1XeYMaG3xhsJeXmulEk0Svv/M=;
        b=FnnZncZ2gavE5HzqZKC58QcF56WyO0QAgITPYz+1ptLnTvSkkiK4ZCqKrzznCDnefk
         51EWuEB5Kuzn2Z7MRbrvTmp+XFhBg0aqU7OKCS+GURDGcfc6CsmCKE6UjBd8w8NwLZJi
         +DgGFL69lv7UvgGpdmfeIUjcKUBmfeYJ/z7CgdWTJyxL9EQfdWWXmcNGwFwFiiIQvYhe
         qisvTrb0Wu0GZeSdcZeFJGT3ZS4a8a5FZi6TRdHPHMY6+njn424fFCt0iVmEKTuO9+Hy
         XRa7a0KMtvIhz9vIPcceMc8QI4oo2Suml9bfAjLkW194r/r4e5DW7oynBdfL9+YFmleB
         ynWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736147845; x=1736752645;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O1w9zSpxK0DLwBz3Sc1XeYMaG3xhsJeXmulEk0Svv/M=;
        b=QXgubDZRkfhvG/XQKHDGm/VcfiyWThxpEqxFJvMv/W0DY6KrvlDf4n65n40/L7ctHF
         u7kFUa6ZktGtO7mrDyNHpgotcLe3S6j9lTjLh4NlSV4KhFjHWl0l16nMIr6owKo9SN4d
         HWO/mJUjbQ13M5C4jB4N3IpfZECwOz7KaOLnaulWfolT6SKCFPXF7yIf2Qe/n7OiSyCk
         IYooD+bWYwVQjQQ0D7710+UbDo+LdEzPHa2VpnnhotlWLeXFuyKncFztnOqliSgvdyGB
         h7iFqn53idZjtPuRox8RXF3UgY2eI3XMSlsmpCazz/ZmvGHL9xRJDOxYJwihCkgLzGtd
         djzQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFcTiazJ9X9kg12IBZMBW2c8XVtHG4fg7gv9EkmjFFDeS8xrEHlpNh8ljK91pLzYcwi7kSzQSao/3ZP4GS@vger.kernel.org, AJvYcCVHEB42x/U5wArAmDJL3X8vZXOoIdr2h1TDs5goz9P+3FVQucbsYCBcAUts1gSfPAe17l42TyIfqOj9@vger.kernel.org, AJvYcCW8W5UreILynsbuEtqTG+s5u6KFw3Nh7LO4GWPIF+8twKyYF9Jysdrtm6gnVgEjDKkMVuvCmEcorR21@vger.kernel.org, AJvYcCWPyqTdsegUv1vgIi8LKUK/0h/3hheNliUpJekPr2ib1HAx9iYEk7pzLCUKaQorqIsWis2i09PHOMxFD3U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzvch8Z8OFxFN+VtbPYL0BJ7MDDqM/Nk4zNVIeKCEa/HEenSIHe
	MqN/OrEB/QaRf+JyFpT3dYhMiXmIcdcnv8T+iA+oow9fiD2WLwEE
X-Gm-Gg: ASbGncuoj52FhqrpfMaOGK4QF9InRDGmDYd+YCm0TSOx7wHWCDGQqTZV26LsNo58yq2
	wog9BUD0chxnAomvKRDNI0V6rCf8OaZL9bMN0xIqeyoLbpQpI8mZEY+Cn4M+l/N3d65kAOWdUwo
	Nk7idl/dSj+w6Pt4TAiQma7Hq0TMcQsTPz8w3sGfn2nSyIEPlcdJ8ev4q9FrWN1kEzNXxHuA2yw
	dGj/enudfe7s3qUYnEtgLOcuZm5X1g1Lxjhj8ilAl9XUkIIoqW7LMgsfYOHdI+JCThAFqafvxfo
	rCUa9lVeaqlfh7UW3m0yJd1XW3E8owoaV3dH
X-Google-Smtp-Source: AGHT+IGTjqWfIv2DlhwgTL6jEnHVtYj8ucMwJjK3vPWagzHGiwqu4brm67ccXKhSUXmAcf46Q/jPHg==
X-Received: by 2002:a05:6a00:4ac5:b0:725:b12e:604c with SMTP id d2e1a72fcca58-72abdd3c467mr78872261b3a.4.1736147844924;
        Sun, 05 Jan 2025 23:17:24 -0800 (PST)
Received: from leo-pc.tail3f5402.ts.net (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad816222sm30630566b3a.37.2025.01.05.23.17.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 23:17:24 -0800 (PST)
From: Leo Yang <leo.yang.sy0@gmail.com>
X-Google-Original-From: Leo Yang <Leo-Yang@quantatw.com>
To: jdelvare@suse.com,
	linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Leo-Yang@quantatw.com,
	corbet@lwn.net,
	Delphine_CC_Chiu@Wiwynn.com,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH 0/2] hwmon: Add support for INA233
Date: Mon,  6 Jan 2025 15:13:35 +0800
Message-Id: <20250106071337.3017926-1-Leo-Yang@quantatw.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Support ina233 driver with binding documents.

Leo Yang (2):
  dt-bindings: Add INA233 device
  hwmon: Add driver for TI INA233 Current and Power Monitor

 .../bindings/hwmon/pmbus/ti,ina233.yaml       |  57 +++++
 Documentation/hwmon/ina233.rst                |  77 +++++++
 Documentation/hwmon/index.rst                 |   1 +
 MAINTAINERS                                   |   9 +
 drivers/hwmon/pmbus/Kconfig                   |   9 +
 drivers/hwmon/pmbus/Makefile                  |   1 +
 drivers/hwmon/pmbus/ina233.c                  | 200 ++++++++++++++++++
 7 files changed, 354 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/ti,ina233.yaml
 create mode 100644 Documentation/hwmon/ina233.rst
 create mode 100644 drivers/hwmon/pmbus/ina233.c

-- 
2.39.2

