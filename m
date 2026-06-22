Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D06F53A6EE3
	for <linux-hwmon@vger.kernel.org>; Mon, 22 Jun 2026 12:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782130930; cv=none; b=t/MhSNpSO6JL58NI40/5COIRbtkVHqZxOJbxwJ5oPsWwvt7+rgtE/7a6UzbLxbwfty2YD/BZsw8mtMYr8EAwWf9Es2V3npWSisXLe8um+RXPP30hQwxcO8ksoKj90w6QzaxpqPAVMsjgUI9/LVasof5ey8+FsPjfNqhp8zVQde8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782130930; c=relaxed/simple;
	bh=C3/0ayG168IRypinG5UyqC3w5LXcwrC1fyKeOxYr+Yc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tAHEl7eBh4KUR+7vt+HXtjpg/Z05F0RXBpKJCGFnqit40cwCzQ2QvfkLCrH7AO+Zjfw/we+e/lOqcexforWDR9kqQTVhyVcNVEcK1js9gRFw0/gAPP8IYsrHaDNCcPcMQJ5WUCG0bNoD8UKnaF7JvoRi4RRFWT8SEXzyYGWzlIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pphv0esU; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pphv0esU"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-462bb734793so2630520f8f.1
        for <linux-hwmon@vger.kernel.org>; Mon, 22 Jun 2026 05:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782130927; x=1782735727; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZQ48Hv3FF9+jj8OZ1QDoyGunsUD13qJgwfYG7liSrdg=;
        b=Pphv0esUO0jd1ldJhPdfy29zyO0OlckdzBWDAWWmUDbSvpFs+tHP1+u6QpAC1b7Dw7
         JoZn8XwwpnB3g+L6DDJIuWX53C3bmXE+IuhUpEfCQoluCJ07+0wmmDALtJk/45bXWXYG
         qgCnBxRPZNaxIe/wsXSDGCeZYtsaRTQTObxC3rtBhDEbjh7Mrf4cBVJqIEcdfJPg+FBc
         S4BEhLIVXxcCE/W3l0YCrEqP17i+AW0u32vG9Zrld8Y0rtDTgfQZj8lzrJCuTSwkohFx
         rfjUG6q8dryVG9Lgt/QVrXA9deBLs3ZVEvXCeoFpWM+yVYvgee0aQwMB3QQDWx7At/1d
         yxyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782130927; x=1782735727;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZQ48Hv3FF9+jj8OZ1QDoyGunsUD13qJgwfYG7liSrdg=;
        b=p5Ri7za4uElM9mA4DtKuKhCPBXZ2XbUpkSQOx1EyE8zi8FTpytZDh74P9PDgY1dV9d
         cPyncw+31DsxoSWZ9gcUrjf4e81lOHZDwxGOE47ux9CSA5AGy4vLMMjF8Yx6PmhvSoyF
         1deqRYKLLqwL1Ojag+GZ1AQ35NxRkUitjMMLjru4Ehuyb/LsE0La4wOFBiL9bEwOWMG6
         p8kc+6OFArwahVLkz9fey+zqss5/ABhy1KNbwK4WQiaKQf1sJWVqkxD4g8dY/GRPBuDF
         UaGvRUZvTfwGGrKfrlcV6ms8QrodaD7GA3bTSXLFpi9qp/RVEIDf23LOuQtJhO5CZZ0V
         /BfQ==
X-Forwarded-Encrypted: i=1; AHgh+RonRc5h2GueqLrrl8s+mX7ZJNVCOrn6+enG9uNjRZMHDwhUFUr8YAqpFcaXOxHEKvg7q8KC/w2dycY58Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzX/OcxE8rEEJurb5u+sdc5M0Sn1Gm11k/wGlPpRhoCKZ/M9kAv
	zdDVHvW50fWGDKodeZ4fhSSsndgvCdadcpB2wdCxZTfaqvl3ILSRKlgd
X-Gm-Gg: AfdE7ckGwRS/cBYFwPmtJRXWVvFrD8UyPwq53c8jMHoOQn0DYChsCXs8HgOviIKPDXe
	yCnrfjMPtLkxmM/QU54CRghyGRy4R+o8F+UEq6BZiyxKB7jZjojT45ZTRgH85P5zttJUbO2GNeg
	6oyVmoH1twhDjsuWoKBawlL2CvlU4+tSFAKwH0o3HO43tHgJ00bth04JwPNo9JcsNm4P1hr8i/f
	UibmgUhOsWK3NbphqtU57OXpEYZhq4Fa9muDi6Ma3kcvefepYn7+VGquH4USEmbHuTNlDENZD1j
	DH4Cs+xTzj9/BT5oVXqPj++iSRIrVJMvHcuRRNJDeKyHfkxsKGB9Lq9hL7OCLyQrJl+G4huRbr/
	aiuVPqf6Ef4tgSG/PiMHwlE2UAZiKkxgD3E+0oZX3WXdYKv13ZXOSUuDthX7nyDzX+RsxWBjpJc
	Ytj4OXPEO/7ljhKqNj5XrCC+GiwbvkvynCsHH8tUlVfJi16MpDt19hlykW7cr18V3O/p49W44Z
X-Received: by 2002:a05:6000:4202:b0:468:b71a:6ed8 with SMTP id ffacd0b85a97d-468b71a7100mr6223872f8f.20.1782130926934;
        Mon, 22 Jun 2026 05:22:06 -0700 (PDT)
Received: from flaviu-Aspire-E5-572G.. ([5.15.86.252])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-466648c5ddbsm27255637f8f.12.2026.06.22.05.22.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 05:22:06 -0700 (PDT)
From: Flaviu Nistor <flaviu.nistor@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: Flaviu Nistor <flaviu.nistor@gmail.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: hwmon: chipcap2: Add label property
Date: Mon, 22 Jun 2026 15:21:59 +0300
Message-ID: <20260622122200.14245-1-flaviu.nistor@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for an optional label property similar to other hwmon devices.
This allows, in case of boards with multiple CHIPCAP2 sensors, to assign
distinct names to each instance.

Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>
---
 .../devicetree/bindings/hwmon/amphenol,chipcap2.yaml         | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/amphenol,chipcap2.yaml b/Documentation/devicetree/bindings/hwmon/amphenol,chipcap2.yaml
index 17351fdbefce..f00b5a4b14dd 100644
--- a/Documentation/devicetree/bindings/hwmon/amphenol,chipcap2.yaml
+++ b/Documentation/devicetree/bindings/hwmon/amphenol,chipcap2.yaml
@@ -33,6 +33,10 @@ properties:
   reg:
     maxItems: 1
 
+  label:
+    description:
+      A descriptive name for this channel, like "ambient" or "psu".
+
   interrupts:
     items:
       - description: measurement ready indicator
@@ -72,6 +76,7 @@ examples:
                          <5 IRQ_TYPE_EDGE_RISING>,
                          <6 IRQ_TYPE_EDGE_RISING>;
             interrupt-names = "ready", "low", "high";
+            label = "somelabel";
             vdd-supply = <&reg_vdd>;
         };
     };
-- 
2.34.1

