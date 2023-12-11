Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EN708hKa"
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F260926B9;
	Mon, 11 Dec 2023 08:07:43 -0800 (PST)
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-6ce72730548so3962475b3a.1;
        Mon, 11 Dec 2023 08:07:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702310863; x=1702915663; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WGjiUns1h+iAl3w3ceq2flEBlTM6hUQvZg8488X+6N0=;
        b=EN708hKaCy9qzdzx3q0dMTuJnp6PecLBV0ZAlAWaBvO0rID0vEVTM6dvhOQDaw6Bji
         WcKj6KWkMCfqRMEfJArITfFeqEYcgNPyo9BYFFp7k8YRFiv1EHkmDhKi6DkJIYAmgixF
         xLruuvvYvfIEFzSk54EOAHnVamJuro02+cJj7mrzTavdLQEODW6QW3vI7rrZw1qMbAsJ
         MvBaAZVBg5tspbgnXGEY8CetMuuU9316RnArrnXZ+3KtG0AqF9LjzPhuUQP6VboEVKn3
         LzAF3hDW4vFh83rpmt8EgkrBQiMX9qMxKn59nZfOoJmTYgns43lMXHm/m2zAbbx8B5BD
         sV3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702310863; x=1702915663;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WGjiUns1h+iAl3w3ceq2flEBlTM6hUQvZg8488X+6N0=;
        b=RnEjnH3A7QLhx/D/39Hc15FZgubQB0xCRmLoqEoodCs73NfUZinkZvDaZwopIdANZZ
         sv9LOHzeOVna6s8NoLkTAVQhS+r+Uw2BaSpUUe9d/liEJwt81JA2dZF4Gbhl5g4HbdYA
         YMUutl3gSaoAmwnzE8+ubsUHHJ9iTa5WqBRVz5W6d3NbgKVXLQJThKsJ1Q1aQvEGCbDe
         UN1sLLZI3r2bfBOOV3dCDgqWDOeRCNTeDUsh87riux8M7+M/hxb1LhBVKTArmM7Pg35G
         RtiRV2Of1sTxhSp1q+bo08tMvGlEyH6xZAF5xNWWmxuNifXBBjloJnHY1L6ztTx5qrWy
         GZMg==
X-Gm-Message-State: AOJu0YzR75rebS4W77ziALDsqt11rE0YJMl3ss+1tnIz8jIRb066K+Wg
	tznpENkugtdnON2EGlQzk3o=
X-Google-Smtp-Source: AGHT+IGymO/AZvtr+iq7BXI8n9/mucysy0DHR3Jo0o/aSWw86azUrY0Z7ByOYsTJacMGu6oNjOiLKQ==
X-Received: by 2002:a05:6a00:870b:b0:6ce:2731:e877 with SMTP id hj11-20020a056a00870b00b006ce2731e877mr3977204pfb.62.1702310863210;
        Mon, 11 Dec 2023 08:07:43 -0800 (PST)
Received: from localhost.localdomain (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id ei39-20020a056a0080e700b006cbef269712sm6545611pfb.9.2023.12.11.08.07.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 08:07:42 -0800 (PST)
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
	Potin Lai <potin.lai.pt@gmail.com>
Subject: [PATCH v2 0/2] hwmon: (pmbus) Add support for MPS Multi-phase mp2856/mp2857 controller
Date: Tue, 12 Dec 2023 00:05:17 +0800
Message-Id: <20231211160519.21254-1-potin.lai.pt@gmail.com>
X-Mailer: git-send-email 2.31.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for mp2856/mp2857 device from Monolithic Power Systems, Inc.
(MPS) vendor. This is a dual-loop, digital, multi-phase,
modulation controller.

LINK: [v1] https://lore.kernel.org/all/20231108024222.2026546-1-peter.yin@quantatw.com/

changes v1 --> v2:
- mp2856.rst
  - fix wordings
- mp2856.c
  - fix register naming in defines
  - remove unused register defines
  - add max_phases and chip_id in struct mp2856_data
  - force vout in direct mode
  - remove unnecessary functions (ex: mp2856_identify_vid)
  - add identify multiphase for both rail1 and rail2

Peter Yin (2):
  dt-bindings: Add MP2856/MP2857 voltage regulator device
  hwmon: (pmbus) Add support for MPS Multi-phase mp2856/mp2857
    controller

 .../devicetree/bindings/trivial-devices.yaml  |   4 +
 Documentation/hwmon/index.rst                 |   1 +
 Documentation/hwmon/mp2856.rst                |  98 ++++
 drivers/hwmon/pmbus/Kconfig                   |   9 +
 drivers/hwmon/pmbus/Makefile                  |   1 +
 drivers/hwmon/pmbus/mp2856.c                  | 477 ++++++++++++++++++
 6 files changed, 590 insertions(+)
 create mode 100644 Documentation/hwmon/mp2856.rst
 create mode 100644 drivers/hwmon/pmbus/mp2856.c

-- 
2.31.1

