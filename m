Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C57278E77
	for <linux-hwmon@vger.kernel.org>; Thu, 21 Dec 2023 22:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iwanders.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iwanders.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iwanders.net header.i=@iwanders.net header.b="H70j47SG"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-67f5132e8fcso7733316d6.2
        for <linux-hwmon@vger.kernel.org>; Thu, 21 Dec 2023 14:51:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iwanders.net; s=google; t=1703199115; x=1703803915; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nRr/sJytJ/lyMmoQqltmQuZwEfSFP9l8D/4B29sx8i8=;
        b=H70j47SGN5x8H28BTc2BBCQjEdQHsGJhZa6WHRU18+3ciIpQ+Zom8BY+B64dwL1ieT
         zfSa0bOXKrwK0HQnqwf/cEwwGFtQMuVOiCf5FZ/i1+XF1sUUEAHrDaTag0FNhKHiaRE9
         m1LW0UeB5DzE7fOiANP8B4KSZmsCd4tm4dIIM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703199115; x=1703803915;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nRr/sJytJ/lyMmoQqltmQuZwEfSFP9l8D/4B29sx8i8=;
        b=oFUCxTf3qREqVWEqBA/ZMI9TE2hEOehjTXE7BhPSCcEbeZOUWNhknKsfLASMAG2A+M
         7ghv3UFSxt3EVpWKZdph6cHIXAI7RjqooQUhyJyUSe8hHDJmQ5EFktAr2016zEoKEYby
         W063Ju5mDdbySTkskOmzlp9dap/e7DCh0BJChBGjWHioV6Vr47CdPg5/N+GbXhQZzp5N
         yKTWQHCnWXWX9S4mzrB4/S8x2TMCg6jZZrZTK2JF3TpjQNp49Eog1s6cF4o1AgNtZLu5
         6EACioFx3+MUv2xQeSu8lPYhbIDBi4bfZSvd3AciC0hWrpoRTEhyPS9TLOPuJInk/h6G
         03Fw==
X-Gm-Message-State: AOJu0YzJfo6QPsbppsQTQU/8c9UIcJWQoNkOziQppgCJxdO51qBIxXmC
	CXB49hoHZsHTEB8PLz1ClMgPCBK2XM+Nng==
X-Google-Smtp-Source: AGHT+IE3eAdqozXayjo0dl6yz5rMb8wGX66JaWar5KgZT8yTQxgUmYjsOhKAdDGDYnhFzf7YQ4pxsw==
X-Received: by 2002:a05:6214:19cc:b0:67f:5ab:364c with SMTP id j12-20020a05621419cc00b0067f05ab364cmr475903qvc.70.1703199115427;
        Thu, 21 Dec 2023 14:51:55 -0800 (PST)
Received: from eagle.lan (24-246-30-234.cable.teksavvy.com. [24.246.30.234])
        by smtp.gmail.com with ESMTPSA id a15-20020a0cefcf000000b0067f812c4a58sm782733qvt.60.2023.12.21.14.51.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 14:51:54 -0800 (PST)
From: Ivor Wanders <ivor@iwanders.net>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Ivor Wanders <ivor@iwanders.net>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Maximilian Luz <luzmaximilian@gmail.com>
Subject: [PATCH 1/1] hwmon: clarify intent of fan min/max
Date: Thu, 21 Dec 2023 17:51:49 -0500
Message-Id: <20231221225149.11295-2-ivor@iwanders.net>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231221225149.11295-1-ivor@iwanders.net>
References: <20231221225149.11295-1-ivor@iwanders.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

This adds a link to the hwmon sysfs attributes in the hwmon patch
submission bullet points. It also adds an explanation denoting the
intent of the fan min and max attributes.

Signed-off-by: Ivor Wanders <ivor@iwanders.net>
---
 Documentation/hwmon/submitting-patches.rst |  4 +++-
 Documentation/hwmon/sysfs-interface.rst    | 12 +++++++++---
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/Documentation/hwmon/submitting-patches.rst b/Documentation/hwmon/submitting-patches.rst
index 6482c4f13..d634c41d7 100644
--- a/Documentation/hwmon/submitting-patches.rst
+++ b/Documentation/hwmon/submitting-patches.rst
@@ -141,7 +141,9 @@ increase the chances of your change being accepted.
 
 * When deciding which sysfs attributes to support, look at the chip's
   capabilities. While we do not expect your driver to support everything the
-  chip may offer, it should at least support all limits and alarms.
+  chip may offer, it should at least support all limits and alarms. Only
+  add attributes that follow the intent of the attributes, as described in
+  Documentation/hwmon/sysfs-interface.rst.
 
 * Last but not least, please check if a driver for your chip already exists
   before starting to write a new driver. Especially for temperature sensors,
diff --git a/Documentation/hwmon/sysfs-interface.rst b/Documentation/hwmon/sysfs-interface.rst
index f76e9f8cc..72dd5e02d 100644
--- a/Documentation/hwmon/sysfs-interface.rst
+++ b/Documentation/hwmon/sysfs-interface.rst
@@ -167,13 +167,19 @@ Fans
 ****
 
 `fan[1-*]_min`
-		Fan minimum value
+		Fan minimum value, this is intended as a way to specify
+		the desired minimum speed to the device if the device
+		supports that. It is not intended for communicating
+		a constant that denotes the lowest possible fan speed.
 
 `fan[1-*]_max`
-		Fan maximum value
+		Fan maximum value, this is intended as a way to specify
+		the desired maximum speed to the device if the device
+		supports that. It is not intended for communicating
+		a constant that denotes the highest possible fan speed.
 
 `fan[1-*]_input`
-		Fan input value.
+		Fan input value, this is the fan's current speed.
 
 `fan[1-*]_div`
 		Fan divisor.
-- 
2.17.1

