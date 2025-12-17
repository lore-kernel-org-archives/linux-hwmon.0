Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 517151EDA2C
	for <linux-hwmon@vger.kernel.org>; Wed, 17 Dec 2025 01:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765935471; cv=none; b=ot5+NA29Egh2L86fKnOrvIk3pMsfshc0Z30BpT1lVRv0AGYrIDXlVIqoxy397LgBhQOQCD9fUyuaTvrA0U3BS2vk3WU7Lu9MX4f8WuPhq4BjbFT5jVjE/VPaDwBsFWEKpggPa3WgKDjpn7rdJO7CZ+tE+R6vFMOZEE5hMu9JnKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765935471; c=relaxed/simple;
	bh=gKtXGQRkB7K8RhQYceQFAqkJJOMwCgx7cAIzZ1mn7xw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VV5DuHW64sq4zpr3w+4mbQILE9f9/VqOCmdjZiW0iPr5dH7ZcotNXc6VSr/JWLOjbkduD+BGeP0GysCGCeeb4GQmVPIFdZYJmyq0sWJhVnvXwNUgYBuZEr64IuA6AHUfGhdkqp03uThuElyqVZX7fCPa2E+K71feDVKAx1TQwOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N4CD9P7u; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N4CD9P7u"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7f1243792f2so3537513b3a.1
        for <linux-hwmon@vger.kernel.org>; Tue, 16 Dec 2025 17:37:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765935469; x=1766540269; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5j4yKgmJTnmINmW5QNwPvpbKuvShDpP7IKQXVbD8ZYM=;
        b=N4CD9P7ue5TjLfSI+H1l5Lm2pkWqX83wenYECwHc/akS0YnMfbeIjMi7x4OcTrWzCH
         LZRLSeNwUpSGTY9JAEiYVxWHwhHjFOMfKzEop+Z0xzlbZP66eFDfUIhOJgrJprxI9H9O
         SlUwiHbK+hVvqim8TisCQqYu0e43PoXti7OVyO0F9Bz3rBSXphjqRimQvxVL2ume/0wI
         MVSGyuWEdVy51yffIARMdbbutnqyHZOn4FsJsq+xT6c2nUyyoE47a4LTHX96dW7f/TYv
         KW90Cvltlbsai1e7Q7rpVvuJqCiMrr2N1aFY0JOBe7HpOlaTJf1IlVRRfEOcyBpu3Kb/
         bdtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765935469; x=1766540269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5j4yKgmJTnmINmW5QNwPvpbKuvShDpP7IKQXVbD8ZYM=;
        b=O4DokeG4ZBY0eiLdj0KWFxZVvDl2ie0AhqNc740YOn38BTn21xLoVuC8dPh7oUXadE
         OJd2eqQ2GJBP+z6C9aBrRA5GEkMgLkqKQTBU2yIdLLXn3oh1PU7bfNEcrCcdJvd9gxtJ
         eiQoJA13uHMyzzo8SRAAnN1S0NkzrkVNyLoT2hfmvkXRiAT4xDDTyrVdBotfnlKl9N91
         jTc/KiwHySHWUn+yJMC9cNIULbsSTxZ/udAG6TYmMn0OyT8j+Q1KRjXWGMM2pQVjE/Dq
         LoxhlIlgft36g5FKOlfW5QmfKRkzvKfeLR0sgY5mIUtfDsDHyJouJ1sVGWzhjeUvzqK7
         lgaA==
X-Forwarded-Encrypted: i=1; AJvYcCUZaRhBViloIFXvCweJJOfYxAzFrf7hIbsZMwRbafUO9ncEDwJ2E3vxBYMzyg/oqy7XBiURhI5JAAWijw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3pqySxF7aWXpfWp/NaFbHXNv6EIqEp7wV/IiXb/TAL4hpzABh
	pMXwXcQylZA0PjVD1CXhpP1LL66sqS9MWulIsvicfsceqWvDNeQk7nme
X-Gm-Gg: AY/fxX6b+vyJlYHtwzdQwztQQeKnlu9tYF9m5UH9IbxEgpjNXEBVsg4j9UGUcN3xozB
	B65+IQsrDETCu3QqSHah14r9XJazmkn9XU412MWKBxIjS3oY23tNl/67gHq31jAQ5YHskvgpP7Y
	qR3cKOecaWQ2PbVXIbDD73or0iGXFRI4Uu5RtTAtp5UsjOioNFBpyRM1sS1ig79zJNohkYonuxK
	3R9KKQwlutZG1VEwRiHv0Y45DjyjfjjhIxF1Nc2m200C02tOUruszNj3vvAYgDtXNpTvZtG1pUr
	osOzPAnj8eJgs3ralVTuvZo7cCeb1JYlvWOh/My0Y4sMyVQix/BtXj7XPDwUuWokEX2RO9Oe+GD
	GoiXTKNx09d4qEQhi3hKtjk4rqSVOTUA/hZH6ibJHM+YLoWoJ8vicfJ3u71ZUYcveC7hkcPai6d
	jJ96xIfdmiZZHo7nbfi3FZGjfPj17CfX9VSWRTOzAtjqLGSs0yDp/bvDPpJeA/7/1MG+OmjkIRH
	mumPCbmPTi1YtI8BPb4dtaKVHrzkcA=
X-Google-Smtp-Source: AGHT+IG1O61yPGRFU8qH0+tJNlkjqwcosg6PVoulV6axa9z1bSjUTORI/z3d5FkbYwklkNXdhhYA8Q==
X-Received: by 2002:a05:6a00:b488:b0:7ab:2fd6:5d42 with SMTP id d2e1a72fcca58-7f6679361eamr13832333b3a.16.1765935469525;
        Tue, 16 Dec 2025 17:37:49 -0800 (PST)
Received: from charles-System-Product-Name.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7fcb8745633sm848616b3a.5.2025.12.16.17.37.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 17:37:49 -0800 (PST)
From: Charles Hsu <hsu.yungteng@gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>,
	devicetree@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	Charles Hsu <hsu.yungteng@gmail.com>
Subject: [PATCH v2 0/2] dt-bindings: trivial-devices: fix STEF48H28 entry
Date: Wed, 17 Dec 2025 09:35:42 +0800
Message-Id: <20251217013544.363715-1-hsu.yungteng@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251216083712.260140-1-hsu.yungteng@gmail.com>
References: <20251216083712.260140-1-hsu.yungteng@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds support for the STMicroelectronics STEF48H28
hot-swap controller to the hwmon/pmbus subsystem, including device
tree bindings and documentation.

Changes in v2:
- Fix the entry added to trivial-devices.yaml by correcting the
  comment and compatible string ordering.

Charles Hsu (2):
  dt-bindings: hwmon: add STEF48H28
  hwmon: pmbus: add support for STEF48H28

 .../devicetree/bindings/trivial-devices.yaml  |  2 +
 Documentation/hwmon/index.rst                 |  1 +
 Documentation/hwmon/stef48h28.rst             | 73 ++++++++++++++++++
 MAINTAINERS                                   |  7 ++
 drivers/hwmon/pmbus/Kconfig                   |  9 +++
 drivers/hwmon/pmbus/Makefile                  |  1 +
 drivers/hwmon/pmbus/stef48h28.c               | 76 +++++++++++++++++++
 7 files changed, 169 insertions(+)
 create mode 100644 Documentation/hwmon/stef48h28.rst
 create mode 100644 drivers/hwmon/pmbus/stef48h28.c

-- 
2.34.1

