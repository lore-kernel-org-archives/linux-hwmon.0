Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NAQoWCzn"
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C31ADD72;
	Wed, 13 Dec 2023 22:06:18 -0800 (PST)
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-28694702c18so7602752a91.3;
        Wed, 13 Dec 2023 22:06:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702533978; x=1703138778; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zHyTF491Al5YXy/Wivz/cBTg8320ltfLzHZvXX87T6s=;
        b=NAQoWCznzTcplG2NhBiaVfU5dcS0rns3QfVg8s8ZzNACl/iZSJokrrcB07YmO/ulDP
         pF8C6325/nsnaP6nA7N6atnBbC6z4Pd1o0g/sWlzAFw4P/lM142JYbx+dIbzHr9Ka0sZ
         WhKoAt7DOIe+3ol3YQvM+dHj/rmyiyyRfGjR67HWXhmyUHfi69ZvgHIS6F9m9tzipqru
         PlD7XGY5Iu0VT8FhRD4EaZIC3KzdKEyWg9aQxxQtHyCdvChbh3ZeC+FPnXw2yCpUofdk
         BwBcZBofU5psDy0tVXu+/h/TUi2Pj+LfQBU7Oz5Q4j/uzm+uIZSh0HplTiMMd5XWtDid
         HsRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702533978; x=1703138778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zHyTF491Al5YXy/Wivz/cBTg8320ltfLzHZvXX87T6s=;
        b=CQ/oKl3mnNRWBESsec+skuNzndUD+I1LwEsMUHyme8l4+/wRUt+FgSpxgIOnbDWZqO
         Pa4pL+AR7iMOuTjNTulnWbApsN4Y5sN/OZRADUTf8dxK9Iln0nRILz4uAZYXxJQoBmYy
         MHvIeRGrQYdac+sv3nbstZgcnlfIDjcZgZWmlXU1JdS1HnElEYP9lgFQCo2d0nnQPkYm
         wR5ZXnbYmZ0Dz9Yrh3CMX7JgTp13tc6dgP2oc0FW6bnlrnnWZwln3jA5hL8X8290l95E
         5G44JmK/2uQGvsIeCBvQgaV5ZjfkanA9k9UK3Ka1sTL2QUC1SUmjFDg5p3baAb3sb1cY
         HXEQ==
X-Gm-Message-State: AOJu0YyEoRtMxKCmd0Vp09Djyrkr9gLQzOCpBDzYOJTDMW7KFVlLRlg/
	Y+lsZKH42ouzkMZ/UkDDF0Y=
X-Google-Smtp-Source: AGHT+IGayfVYsNy4xE/sRN5mbSaRUjxfzUU43y/bstaT13PYNnUs9sgAkc91gOeEPBzsKoYi6kiElg==
X-Received: by 2002:a17:90b:1d07:b0:286:a546:d254 with SMTP id on7-20020a17090b1d0700b00286a546d254mr6644775pjb.64.1702533978166;
        Wed, 13 Dec 2023 22:06:18 -0800 (PST)
Received: from cosmo-ubuntu-2204.dhcpserver.bu9bmc.local (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id p11-20020a17090a2d8b00b0028ae812da81sm2373327pjd.8.2023.12.13.22.06.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 22:06:17 -0800 (PST)
From: Cosmo Chou <chou.cosmo@gmail.com>
To: linux@roeck-us.net,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	jdelvare@suse.com,
	corbet@lwn.net,
	broonie@kernel.org,
	naresh.solanki@9elements.com,
	vincent@vtremblay.dev,
	patrick.rudolph@9elements.com,
	luca.ceresoli@bootlin.com,
	bhelgaas@google.com,
	festevam@denx.de,
	alexander.stein@ew.tq-group.com,
	heiko@sntech.de,
	jernej.skrabec@gmail.com,
	macromorgan@hotmail.com,
	forbidden405@foxmail.com,
	sre@kernel.org,
	linus.walleij@linaro.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	chou.cosmo@gmail.com,
	cosmo.chou@quantatw.com
Subject: [PATCH v2 2/3] dt-bindings: trivial-devices: add Astera Labs PT5161L
Date: Thu, 14 Dec 2023 14:05:51 +0800
Message-Id: <20231214060552.2852761-3-chou.cosmo@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231214060552.2852761-1-chou.cosmo@gmail.com>
References: <20231214060552.2852761-1-chou.cosmo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add dt-bindings for pt5161l temperature monitoring.

Signed-off-by: Cosmo Chou <chou.cosmo@gmail.com>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index c3190f2a168a..bc3ab1aedb12 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -47,6 +47,8 @@ properties:
           - adi,lt7182s
             # AMS iAQ-Core VOC Sensor
           - ams,iaq-core
+            # Temperature monitoring of Astera Labs PT5161L PCIe retimer
+          - asteralabs,pt5161l
             # i2c serial eeprom (24cxx)
           - at,24c08
             # i2c trusted platform module (TPM)
-- 
2.34.1

