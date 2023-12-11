Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nZQoxPog"
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F938199;
	Mon, 11 Dec 2023 08:07:47 -0800 (PST)
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-6ce7632b032so2435290b3a.1;
        Mon, 11 Dec 2023 08:07:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702310867; x=1702915667; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zHqn0lmuttOCPsOAucTyzRzcawyQT2nV3YMJKvxfNVs=;
        b=nZQoxPog2WLJRDhgQGG14Pe37n4/5cTFOrjQuiVN+YKBDC2PI+oNbxBXtjVTRcPhce
         agrCRU5EnO/y8Lo6A1he4HGi/8TyF/H/QfW5eROYMPErDRa+y2NHFXsvszSEiUKJVZdI
         VJXWXoMtg1JVUQigbuGhtl1J/EzKscbg3UuIRZgkIBryErY94WUTxNfW8hNN1qopMS1Q
         83y0Krw0/RW18IKJFIRWYSvXzOvZuopZ/8OZleW/pbusXywpHY9h3ihfwQNZzavNIaVL
         4QBCbZw5V9GfPb8p954trNcWSHgDn8Ltrfn75XCtdXOElXEYAEIxeT/V3U4UZWU90Y8n
         St8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702310867; x=1702915667;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zHqn0lmuttOCPsOAucTyzRzcawyQT2nV3YMJKvxfNVs=;
        b=eQRfZM2sj9WfKWzVlYKaVgfSHJop/Cd0874+FA46+esW/gfOrwlMElsSSSJBvwr0Tb
         35WR1iNx1GrJ1QnaiR+kPEqjG3CGw08Jc7u9TlJihj8iwu1yNYODFqLy0eOkBOrkqGmb
         j8amY2SrQpuDZc16aT0i/979yrJQcaTDyAPPUrR/3DkSpntL1eKFNa6jxuAOC+qA1+Ut
         uV5eBLhvBHesCTrv+BvuybsZxgoqhiowDbkKF9fQPbbDZt5j5DNYbDKCgMEthWKYQ6Zu
         mTA+7IqDX65csQ9lsUU18YbzHY4JZGbh1rxSFgfqvHcInBQxZ0rvNe0YlIOOTN58h4aG
         J4vg==
X-Gm-Message-State: AOJu0YyY0RHFwAGVfYvVry/DjCIm6PtiLV/OcWHz8o34TYqdWGcf3wJ7
	cGScWN+4pcfiTaNt3jIB2yQ=
X-Google-Smtp-Source: AGHT+IFAs9FTWryWS/Vu3nmnkRL0mS8zXNF2sSE57IaL6xlQdu2L0kq8UZl3UMEPBQUwDEPTJsDJsA==
X-Received: by 2002:a05:6a20:29a5:b0:190:3d8d:a0ba with SMTP id f37-20020a056a2029a500b001903d8da0bamr1591512pzh.18.1702310866599;
        Mon, 11 Dec 2023 08:07:46 -0800 (PST)
Received: from localhost.localdomain (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id ei39-20020a056a0080e700b006cbef269712sm6545611pfb.9.2023.12.11.08.07.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 08:07:46 -0800 (PST)
From: Potin Lai <potin.lai.pt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Mark Brown <broonie@kernel.org>,
	Joel Stanley <joel@jms.id.au>
Cc: Peter Yin <peteryin.openbmc@gmail.com>,
	Peter Yin <peter.yin@quantatw.com>,
	Potin Lai <potin.lai@quantatw.com>,
	Patrick Williams <patrick@stwcx.xyz>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 1/2] dt-bindings: Add MP2856/MP2857 voltage regulator device
Date: Tue, 12 Dec 2023 00:05:18 +0800
Message-Id: <20231211160519.21254-2-potin.lai.pt@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20231211160519.21254-1-potin.lai.pt@gmail.com>
References: <20231211160519.21254-1-potin.lai.pt@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Peter Yin <peteryin.openbmc@gmail.com>

Monolithic Power Systems, Inc. (MPS) MP2856/MP2857
dual-loop, digital, multi-phase controller.

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 386ebd1471d0e..c847a532283d4 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -119,6 +119,10 @@ properties:
           - fsl,mpl3115
             # MPR121: Proximity Capacitive Touch Sensor Controller
           - fsl,mpr121
+            # Monolithic Power Systems Inc. multi-phase controller mp2856
+          - mps,mp2856
+            # Monolithic Power Systems Inc. multi-phase controller mp2857
+          - mps,mp2857
             # Monolithic Power Systems Inc. multi-phase controller mp2888
           - mps,mp2888
             # Monolithic Power Systems Inc. multi-phase controller mp2971
-- 
2.31.1

