Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EAAD3C73D5
	for <linux-hwmon@vger.kernel.org>; Wed, 11 Mar 2026 10:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773226701; cv=none; b=dfsko4mjwDIZ4/gbbV71b6ySD4hfpKJ7G09u8NWprRvGhYRPZ3R3Ae9TxiYtL7v5vePMfm5LbozMFei8APO4/ujJIat4HD3QtzCZLNFaU0vD8+FQdQTvjA0P/1qg2+y3mfaN4jW0WNopnHVnfu3L7iQpiw4RScY6SE+7CE7XL60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773226701; c=relaxed/simple;
	bh=XaFRrpC75uoy87p8CJS4Vk3yU15qassWo8itQbCwycg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Hu48t6V6GYUTQOCNXlZEXEqXlXVysgzgIIyLqlVVegnEpbUjlg7pFL+r3/EfxouccJAxdxQmP3XAZ25XQxjPC4w+tlro4k7QpJIoS0CzrDE9fXZOyQLTNVOyt3I5LIvuEd/sf3MHEd378ieZNemIQCQpBmwRmXdwJ3KuOS5NY/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AB7IXRQ8; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AB7IXRQ8"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4327790c4e9so10958200f8f.2
        for <linux-hwmon@vger.kernel.org>; Wed, 11 Mar 2026 03:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773226698; x=1773831498; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pYouneEcVkE2tqHKMaEKrSmeP84OOUsZh09T+ow9nVM=;
        b=AB7IXRQ80OD0cHJ1VCY94GKzzBbwAamIj8IPeasa4uZlJlqelT5M9pSuqcfAAvrmcM
         T9NFAst99fRetrBx67c/WTA0SNkA3O0IZMDARNDCVX4hIXB1zuZBCZqtAwxOoXEKztlf
         d5xhEAKahnAmUoTl2SOaQRJIp+dHCli+yMJ8KwS3wLtfnnn2p/zNlzWgnt4o+C5HA9GT
         dNABE0NMRhnwb/3hHRqidlrAuRGFTyMBpZrxRfIQU5q/sX8SLoP7r361nPqwTDFFBnS7
         jFpr3fKE/caLFL2ueh04eteKorGIgjiSoci5syBy23UefEro5wCRrsqfj4iz/xTXj5cv
         sI3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773226698; x=1773831498;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pYouneEcVkE2tqHKMaEKrSmeP84OOUsZh09T+ow9nVM=;
        b=WRNCuZRgfkqiCtTbEajxT0I5Tidyafk2M9uqNfs/JmUDs4chx9rM+cguLryjgg5+W6
         OXiB5ZYuGGp+n0Kct3SWbubO8kvhxTRaaiUvXiyE2Rs/qRv0XM8cVfBSQv9zINhbc2J9
         1EnD42HDJPsv3GKZJBt+9ilvw4gWbp56vdR3iEkVPQLus34LX8fv6BXowUdk/K7o7QJF
         0KsIdwEmPp7qNVzD81tYMx4oAHjvVBfO3acJ+qO3lcPP4G7VIjpFLBNVJ7wW89Cy9WDi
         GtGzNYDeYhfJ8Dm9azwXt0fz2dMPPD9jMq67Zd67yTFcYOp83ose3xz6M3dkjbZ5JzRa
         4Lzw==
X-Gm-Message-State: AOJu0Yx05SpZlUt/4box4Sa87ctemXdHS4UBGd6dKvKbF6uNV3haQJPS
	z3Di5KCFvXMkalj75mXSZHYQrhxWrR2zEbVZY+S5JPixPPAsDZZ0GHH8
X-Gm-Gg: ATEYQzxS2RqNuK98ElDMy6F9tx4xUBW7j+M2E/O5GOtO4mkHfnBOE87DH9Sq9F8b8if
	AFResRYfGd66+z+Hxz8IVdIzgzdLIBtn8gxAUW+XQ2yeO3botMjxJjL732dfXR551xb0pY04MDm
	sR/E0uDABPIgqKDtVWUYGxp4TA8KQVtb+BRD2mhcsUsknhpwNp4GqeAu+Yf7pb0+xwPg+1XYqrN
	APiyjLpnBr1zrhG4fCymA1TtLEjRVGGBelUtS3COH+uXoy7YKw1+3GoIHgw9zAMtdGMsS8xEyeG
	lL8HvI4sRxPNBZLFOVyOe3Rlm2Rezvgr6sM+cTc/UO23zPq9odRc/5toAOZgkp5oKTKAEPXxxLk
	bmHFc430daeITkWIMTWlMMjGNsW97onvCiQnOuSBo7+DLrwW19vtkdascBghAmMqUVx4k+8lqjc
	f0wtcWZDrYC92fGo//j7wsZ4UJfwQ5FPdAQCOyVV53vjKylY2OfZIbthqHDBniUX/r56a3f8MU
X-Received: by 2002:a05:6000:40de:b0:439:ca7b:f4b with SMTP id ffacd0b85a97d-439f8414530mr3913841f8f.50.1773226698312;
        Wed, 11 Mar 2026 03:58:18 -0700 (PDT)
Received: from flaviu-Aspire-E5-572G.. ([5.15.232.50])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fc0ba972sm592347f8f.24.2026.03.11.03.58.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 03:58:17 -0700 (PDT)
From: Flaviu Nistor <flaviu.nistor@gmail.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Flaviu Nistor <flaviu.nistor@gmail.com>
Subject: [PATCH 1/2] dt-bindings: hwmon: lm75: Add label property
Date: Wed, 11 Mar 2026 12:58:07 +0200
Message-ID: <20260311105809.107357-1-flaviu.nistor@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for an optional label property similar to other hwmon devices.
This allows, in case of boards with multiple LM75 sensors, to assign
distinct names to each instance.

Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>
---
 Documentation/devicetree/bindings/hwmon/lm75.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/lm75.yaml b/Documentation/devicetree/bindings/hwmon/lm75.yaml
index 0b9fda81e3ec..cde6299c9b4f 100644
--- a/Documentation/devicetree/bindings/hwmon/lm75.yaml
+++ b/Documentation/devicetree/bindings/hwmon/lm75.yaml
@@ -87,6 +87,7 @@ examples:
         compatible = "st,stlm75";
         reg = <0x48>;
         vs-supply = <&vs>;
+        label = "somelabel";
       };
     };
   - |
@@ -101,5 +102,6 @@ examples:
         vs-supply = <&vs>;
         interrupt-parent = <&gpio1>;
         interrupts = <17 IRQ_TYPE_EDGE_BOTH>;
+        label = "somelabel";
       };
     };
-- 
2.43.0

