Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF237242D78
	for <linux-hwmon@vger.kernel.org>; Mon, 15 Sep 2025 17:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757956110; cv=none; b=grOurktWoVAaRZ1s9qCKYIUENffXFjUkQLT7phOo2jjjDOEPEBDWpUqzD2s1AcE4zoMi+0m2nI5sqGn6X+SsXp4BZX6yFrTT8nEiAqaIDPFx7rIP9ajxzz5pBSE686tu8YoyhDGn1OfJw9d5GTi1OrPGdpzBMN2X8y2AZvVuDAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757956110; c=relaxed/simple;
	bh=6/3PflTmrV9uSqqc+QMoNPcCJMQr4fm8X+Go430Uko4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FywKmEUe0wwgBnvuFKuGuveeQcoGzB0uTDFJ1teII//G5Ewc10XKvospr6Bh8FFcO6oa3ZAUjTsKDggCp1qmv8h2SUSC3yTBgm+ntoD7sLNgKhxIyJnLncBthlAJz7jxyeP740hg/Ur3giZvNj8v3nqLA4aZP2Vm6iBGj/+5TyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gtxXbx+7; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gtxXbx+7"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3e9a9298764so1333582f8f.2
        for <linux-hwmon@vger.kernel.org>; Mon, 15 Sep 2025 10:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757956106; x=1758560906; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QKNfUY78UaSDAPVosHrpMbpy+iAC7g79ni69WixhiFc=;
        b=gtxXbx+74NAL1mRQyYbHL8sy1BmDXBgvn1GT24jfIVcF9NjgaHVRYjDjG2QOXGYSB4
         RSxA1VSmhycFBaNiMxxu4o+J54LiiKO9OIAABQ81IzfoR/8afyOB4HaqHEYDM2pNkNP/
         E+Z9Ee4KRtCOh8vyj2e1kYKZMnqIAcSrVCd7m2jHgzkS6v3W46SpEN7HquyQPs3vIZhk
         AHlTvQDCKXZHocPgaaEpc53UFffadM95FZGAeEBwXpbdZyX/jnLRlsU6OqBKgLRt11K1
         UA10w9ZU2ob5azk9aaHZxpp/aoaK6cMwUmI/usP+47wFSubgXFb6wEON1MhlTwsUhpQw
         lrRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757956106; x=1758560906;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QKNfUY78UaSDAPVosHrpMbpy+iAC7g79ni69WixhiFc=;
        b=Q+21RWWM81nF6sHEGxjLgHzb2A1jjziuy9o8Gp90YHkha8ERDIwEigikaDt9DNQ50F
         x0GAxa3O1XtzpLY9jzMYgdH6Q1Wv816u1TYCG3ABS8p09RkLS8Mx2ZgLNU0tFLQE89dU
         IT262opMTt7rauYV4jKDEWP9dqp/lTPwb64GhtFsxWfGi6mrghVn1OQP9PTVpbW2ZgRN
         MZcJaJc8oKAd0xlQbyBuXUPIhRCzgqzLEgXrTFaHGD/7bfUl/k1wYo14thNitbOgU8jZ
         27H4sd4SFsQ+7tPUFIu2I70HmSf2mHC71saM3Uu2Zmp+YKA/roRpvTDsy8BzZFk+LK1+
         9XMQ==
X-Gm-Message-State: AOJu0YxRcUG4IrtuUOtxxpEe2WlYMmTa0irBzt6JKq6niLzgSD7bjJfJ
	VZkaystA9+O2t2kOVcXSnihhdIDxy8NcdRSDDmWHABW5yI01qkI0b68C
X-Gm-Gg: ASbGncsn/HhjiXgqsbXZ0z4R/UWiPjqCpE6mjd8jfV6LiQo0QM+LMEfF13S/5neoyIV
	wtrSxLWej9MC/fxq2m1oqehRAJuqnrC6WNY7V6m3Pohiz3TjyePR/JJJrazYaKIWfT8W0u2R77U
	Y4CTa7HYIG5XQQ8t0j/SpSprfzwQedBDfCj+nUYeKJsnTFltAsQnUa5pISqhEbVNT3iZCscAhmf
	wXse3paIx0tCbpzgVDI34Zv7gvjqmoXWu6HZO04CVaY2RnGgJFZrf6G2cloBE7rGzIxtxeun2M0
	v4DebNurKy4Yf170IsBxCt5XGLRzeJwQy0BeDEWRvPSs0rzXcDpIGvPbyqiWSZVL0GdORw0gpUb
	pqi2RWleO6tJe8iFLqNgWQYHyWgQgiQjJvPWlzTjRIJp0vWMJi6G0aLx1RD33KMLIBKTsog==
X-Google-Smtp-Source: AGHT+IE+G13sfmVz9goh550EgB9md8VuCM2m11aMEfOcLfVAOWhOadBKdJLLzNbmapPvAfQb9eUrpw==
X-Received: by 2002:a05:6000:2212:b0:3e7:471c:b11a with SMTP id ffacd0b85a97d-3e7659c44d9mr9235744f8f.19.1757956105745;
        Mon, 15 Sep 2025 10:08:25 -0700 (PDT)
Received: from flaviu-Aspire-E5-572G.. ([5.15.80.80])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7d369ea3bsm13146383f8f.0.2025.09.15.10.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 10:08:25 -0700 (PDT)
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
Subject: [PATCH 1/2] dt-bindings: hwmon: tmp102: Add TMP110 and TMP113 devices
Date: Mon, 15 Sep 2025 20:08:18 +0300
Message-ID: <20250915170819.126668-1-flaviu.nistor@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a compatible string for TMP110 and TMP113 devices.

Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>
---
 Documentation/devicetree/bindings/hwmon/ti,tmp102.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/ti,tmp102.yaml b/Documentation/devicetree/bindings/hwmon/ti,tmp102.yaml
index 96b2e4969f78..840b5306a8cf 100644
--- a/Documentation/devicetree/bindings/hwmon/ti,tmp102.yaml
+++ b/Documentation/devicetree/bindings/hwmon/ti,tmp102.yaml
@@ -13,6 +13,8 @@ properties:
   compatible:
     enum:
       - ti,tmp102
+      - ti,tmp110
+      - ti,tmp113
 
   interrupts:
     maxItems: 1
-- 
2.43.0

