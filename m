Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C1672DAFA9
	for <linux-hwmon@vger.kernel.org>; Fri,  9 Oct 2026 00:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791507372; cv=none; b=R9zIgLEuDZTqzCqcQ/EYgI03TEpATeCOGpFQjS0qxGhjMOENlHy8zjcZhSmFc8UIKFXVwYyVv1yXldnOnZL7oi0Apu51vChpzuSel6lD/PSFRYNdwL2EAmeOjkUMSz5nrWSvdk1HecvMMt+mm0Fa0OEk58p1FREjSEQe8AiB8Ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791507372; c=relaxed/simple;
	bh=yy63d1ySOFQGedeCRXdnVMp+NykFLNzr65iketikEgg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gUGAB/wwguToEFl749A14aTnDTWX0DMsUmgbgsMXW4QjMbKjkPowIMGYzK8p0/Yxs9Le8ApyFnL8mCx5FMdpsd/vt3FIVelUpMFmq+KwYMDJyynB7Q3ibkZ7ERdW6osJ+4JQwLUKZ41gFsktJJT3b/eNbby0knm7cYVniTHBduQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=AgpMKZLH; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="AgpMKZLH"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3115c4451c8so5010063eec.1
        for <linux-hwmon@vger.kernel.org>; Thu, 08 Oct 2026 17:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1791507367; x=1792112167; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ski0uA9iXMK3c01MK9RAwSltkfrOdMZ7bYUX7Oaxv3Q=;
        b=AgpMKZLHm46SBcoVPlb13Et14TDyyKEgdg8vxDk+wuIx4g8HguzhTOyLmyZc7MDl5I
         SR2H4BpW6E15ARyb6adCQIWppNLOpgB4J8WqLtfhaDPGL/ddJwkmwCYOYi9ov+K28W85
         VgJO774iW1x3dj9NpFYIriRW370U3NzFKMN1PTR7JXbNan6sGtRFFkq17WqH/j+mduBD
         NFRppLByNscAcXiiF9ES8cFmUuxMzfzHK5u8Uo6p/GPnhYf42KoNWYDI0E9rgw0zikxF
         gXX5nvQ36ZL3Km19S1KEzFfdtNUnAuegWHfrPF8sd05Et0TOt55JKevFflUeFLOUsVcG
         6jMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791507367; x=1792112167;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ski0uA9iXMK3c01MK9RAwSltkfrOdMZ7bYUX7Oaxv3Q=;
        b=uTC9tdaF4lKepPM70h899xqy95Uz8QDEXkm+paDkZ7o1+HFMMRFCv/EiRizokUFF8P
         YoL9o10LdfQB4QthCCFcbKfrVd+JZU80LMRn8w/nAzmW+FyjrnTuJ7fJRUkVTb654p5O
         oHqa7WoX/JSAV+FLbyBfJcH6Y2K4aFP6i8xP4ZICgbZK8HS+3tTuCOBVzLtAFklqUaxu
         y53nv9FvcdUHGUbAJT9GCCDc1w86rINHPL12EZIv5kwfZxupyX7Z4urwXwn9rUBJF39n
         XP7V2iBwndmF98fAk6vng2dSYvAKS/ow9+rjmZBhhVzpmtuvyfFUoiX5UH1DAxFIheu1
         dXLA==
X-Forwarded-Encrypted: i=1; AKwUvBxAUuZoN7mWTPvJ1bCqVQ6MpPhAFcfAnbvzifxIYAyGGJOlNSI+AsQQ/rBYy014K48sEphKmxVU2/R8+g==@vger.kernel.org
X-Gm-Message-State: AFq9FYK8MUfOyIDFzLDCfXmeRSC3kc7h2fyzRAlZCclO+ajwiERHvElQ
	Us27G7J8UlGRjJVu+n6exJ9HzitZfhqqRr/PUNPoV8BrxwVobqHQRMssL1mcCPFMU/M=
X-Gm-Gg: AYBFou0b5HO5Xo/RLipr2bu68yWIvXTe+OY35DzA9r4TVQ+16wCnci9wsCLhLG+U9vO
	TG8baBb2JB+bXKt5yQxi4MFHT2QBkMFAJwcrnwTe1qSY91EzNRSC0Db6rrDC0JgBqyQypu/rOQk
	sQtQcvt6RQPKS1EPMtQ5CB/ckgIhwqpJC6Qkmu95xEKiWRnyLU2wEjU7QbkvPQXH8uuGAdBlDWb
	RiRbMnTkzln5gaTZyxl1rS/ug80BIVf4UnmyXIH80D621RMk1LMGQVgZvHjeWXFZbzAT+TbCJfF
	6/nwiiQWEOEwMAhJeHVczN80+7oSkxml5tkdW7GjXpN5mZedWjM47ma6VTdSph7xrMvwGYVuuvS
	8CbIa/BiWtt2/WPvBB4Ne1DtXoK+6bXW8do377rbBXXoelpaDrIWNhvW3LfFIT/AzhtT8HKppu2
	cWJ9prtdRQHSEZB9nwTfcKAP1PoDBeHpJ1WRvDWQRbbUSSKWjsOmJrulF9HIvuM//WDXSDzIcn6
	Q==
X-Received: by 2002:a05:7300:601e:b0:339:851c:4c1 with SMTP id 5a478bee46e88-3536c593e70mr1308972eec.18.1791507367192;
        Thu, 08 Oct 2026 17:56:07 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cacb61asm1760205eec.21.2026.10.08.17.56.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 17:56:06 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Thu, 08 Oct 2026 17:56:02 -0700
Subject: [PATCH 1/3] dt-bindings: vendor-prefixes: Add TDK Corporation
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-hwmon-pmbus-fs1412-v1-1-0ae7e5ee4e41@nexthop.ai>
References: <20261008-hwmon-pmbus-fs1412-v1-0-0ae7e5ee4e41@nexthop.ai>
In-Reply-To: <20261008-hwmon-pmbus-fs1412-v1-0-0ae7e5ee4e41@nexthop.ai>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>, 
 Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791507365; l=899;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=yy63d1ySOFQGedeCRXdnVMp+NykFLNzr65iketikEgg=;
 b=CWMjSE8OHUG5p6XT1QboxHkd/VxQbJxvEmdWkIGcaaJNDehDcs3fHs2t8zbEQi/i4aFsI7j1Y
 UDZ7edbIvDqBH/d0wIB32JHBhUCNiOPPI2zgI8zVgcWuC594gZIMm20
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

Add the vendor prefix for TDK Corporation, the maker of the FS1412
point-of-load regulator.

Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ba2002969373..a7c484d1113b 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1680,6 +1680,8 @@ patternProperties:
     description: Shenzhen City Tang Cheng Technology Co., Ltd.
   "^tcu,.*":
     description: TC Unterhaltungselektronik AG
+  "^tdk,.*":
+    description: TDK Corporation
   "^tdo,.*":
     description: Shangai Top Display Optoelectronics Co., Ltd
   "^team-source-display,.*":

-- 
2.54.0

