Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8341A223A40;
	Fri, 25 Oct 2024 17:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729876573; cv=none; b=dPYjfOETJe5m/qEk+f+o6YA8optNYzz+Ytmfl9oMSF9Q7mkb837avPmyk/EHIPyznQK25yEvDwarfGQMzJY5Oip9oUfWDnmX1yoKzLB/b/ed/fjSzMNGGROz5Ao5k6lDykkKeFomRhAeFVhOGwkEYEc76mI8P6YcR5Ld17ouYUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729876573; c=relaxed/simple;
	bh=jcEcoTsszIoIMZ2xRSK5qy6JtntcD2Ph1CgISGNF35I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RBLTY+Qa5tA8Hr0oDKO7/vsTCwmnTYJ+TMUvkvw6DYVn9obTF4inv7s/uDpjeMdX7Gw3eG9kBJ7vcGY4dm9IeKSHp/JtCJ3R+xGpUWi2kE0NbM0clPKWIEDI9djKY3eUKTzIET6JBrgPT/GFKFjAFP4AXz5Sl04WE2lC4MV+6AQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZBw0YAPk; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZBw0YAPk"
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3e5fcf464ecso1544959b6e.0;
        Fri, 25 Oct 2024 10:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729876570; x=1730481370; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9Z3zQpm6GYXhvqzRdwO9Jpq7KkMTm57EN0eMNt6MlUo=;
        b=ZBw0YAPk05d9ReKLKAC4LjUk8f+w+yASCVAbt3YH1ZU5fw7hi2Q8BXs9a+xGM/wtTu
         XnDc/m5F3Dywy5aNWvFwS0C+3jKkXMWPoI2iml7BUCP+HxcxVTn7cdcJRYBwi3hEyUu6
         U0Tc5uRoybaapUtdsqqDLpNzTkKpOERTo8c7pAKpw85lafL0R7IoJqdcYnfbSKPLeQRb
         KlU5ie+9VLi+2JzxCdPOT3vPmQ68yXGHO2We7s9QXiSmHKSFlQCAmwqxuYtRaCVIkenC
         R7+dvGmXejFzJHP/JBLZj3LFwL4zwHnm5S8BcsJFuqsBvDgTkDWbqExKUyfGMXoJhVKY
         njOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729876570; x=1730481370;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9Z3zQpm6GYXhvqzRdwO9Jpq7KkMTm57EN0eMNt6MlUo=;
        b=tKoV0BgmLyXUG5TqWHUy0T79ZddtrX0nTfWA515If6S1k+EPoQmF8l7gAO3/2vAi/O
         qgJQAU3iT/PYcqBbBWd38sw+t+EXH7Uf1cWtLqguUvtQnLbpvuzN5VZZq/oDHkAjtWoP
         +pc/q46x0P975xda6uEz8hOTwSwPFpe3zP1WgKARFAF5BTfDp791hKmBFdj1kxudwiAk
         jBAFaeRN0CN2ooQ+5hZ23krfHgJ+mP9Yh/SmFkyIbKgaiTHhSZRdTvozAQDDZv0ejgF+
         GKPHc/M06WN3p0x2Lgdzz4GUiAA2zGvlX+9WKRljCfAoSDuu00tzPilRcSvLjfG/cCw/
         Odfg==
X-Forwarded-Encrypted: i=1; AJvYcCW5x57BewwB54mmlcv68qmB8bacTo29g1RKqd7mDFRz7yDAQgmdYaajk/JtAU/9Y38UzlKBxE+x2w55@vger.kernel.org, AJvYcCX7aprkjUFqSfSDXLdDr3S+fe5lkGbyUXqtGacVnznllyHuHkM3AT3prxKT/dIlWqIH6y0E97zvZ/l8+Ck=@vger.kernel.org, AJvYcCXpHE5UUAK4GZypOSZAb3PDCwlcM6RXaBEYlL4HfLhlzndIJOWMtkVuxqX0BVk4qIfZ+fqnVf+z4A4a@vger.kernel.org
X-Gm-Message-State: AOJu0YwZS4wgPsoGq+r/hfk7zI3JS7TqSzYy+yxaO6vMCRpRdskKpTs/
	mO94zhjvmPI3IEVr8U88rMmpYo1RmMkG6MP0V64BdNh5b69yu3t89rk1c3sQ
X-Google-Smtp-Source: AGHT+IF7zom+QO+FYuC6aOXq7hELfLS/xbWMicidVfzCN+atHEZGzRdamrKs/Wnk4uTvcP5eDz38vw==
X-Received: by 2002:a05:6808:2384:b0:3e6:30e2:5411 with SMTP id 5614622812f47-3e6384403b0mr325556b6e.24.1729876570488;
        Fri, 25 Oct 2024 10:16:10 -0700 (PDT)
Received: from raspberrypi ([2600:1700:90:4c80::f])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3e6325b0ac3sm289600b6e.36.2024.10.25.10.16.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 10:16:09 -0700 (PDT)
Date: Fri, 25 Oct 2024 12:16:06 -0500
From: Grant Peltier <grantpeltier93@gmail.com>
To: robh@kernel.org, linux@roeck-us.net, geert+renesas@glider.be,
	magnus.damm@gmail.com
Cc: grant.peltier.jg@renesas.com, brandon.howell.jg@renesas.com,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v5 0/2] dt-bindings: hwmon: pmbus: add bindings for isl68137
Message-ID: <cover.1729874904.git.grantpeltier93@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Renesas digital multiphase voltage regulators are capable of regulating
output voltages that exceed the range that their Vsense pins can detect.
In such applications, users may place a voltage divider between Vout and
the Vsense pin for a given rail. However, the driver currently has no
way of knowing if a voltage divider is being used which results in
erroneous telemetry being reported over hwmon.

This patch set defines a devicetree bindings schema for Renesas digital
multiphase voltage regulators that are supported by the isl68137 driver
to allow users to add voltage divider definitions for any rail powered
by the device. This patch set also includes the required changes to the
isl68137 driver to enable scaling Vout/Pout telemetry for rails with a
defined voltage divider.

v5:
- Fix clang compilation errors related to C23 syntax

v4:
- Revert devicetree property name to "vout-voltage-divider" and refactor
  property description and driver implementation to match existing
  vout-voltage-divider implementation in max20730 as no suitable generic
  voltage divider schema exists.
- Minor fixes based on Guenter's review of v2.
- Initialize voltage dividers for all channels to defaults that simplify
  logic in PMBus word read/write functions.

v3:
- Report and return errors reading the vout-voltage-divider property from
  the devicetree when the property is defined
- Change u64 division/rounding operations to use explicit math64 macros

v2:
- Fix devicetree bindings schema errors
- Add "renesas," vendor prefix to "vout-voltage-divider" property
- Rebase patch series on v6.12-rc1

Grant Peltier (2):
  hwmon: (pmbus/isl68137) add support for voltage divider on Vout
  dt-bindings: hwmon: isl68137: add bindings to support voltage dividers

 .../hwmon/pmbus/renesas,isl68137.yaml         | 147 ++++++++++++
 drivers/hwmon/pmbus/isl68137.c                | 209 +++++++++++++++++-
 2 files changed, 351 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/renesas,isl68137.yaml

-- 
2.39.5

