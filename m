Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0922E38239B
	for <linux-hwmon@vger.kernel.org>; Mon, 16 Mar 2026 08:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773650407; cv=none; b=mbYopdqYATd0LsFSOwYAtS+BaJ72CkQ1vLEYfz2L9BOKwhgINaNFKmgQHCujNxJLeX+HnlR5Bcd3Uv2Ff3jJdPRhRbZXUAqqbxRehDB8WNc2KAWNVVaWQdk6+5YsdAoPXcQ5WNuhgkYRlIAI+84oazpZwGxMIrQ00LYjr9VT84Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773650407; c=relaxed/simple;
	bh=eAYEHKIMJ1HcMJfz2kIgNpsDS5JBZWGRLVub9M3wt2c=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=BSDi5nfQAECMRPCoI1jXRE5i/TR/dMknk6cHxHEPqZS8aRKfj2IhIol9vtPQ00i6Q0EGn80A2uDglgQl6sWCq+Y04Kn7LGTVib38G0yQ4s3pOEVbW/bpPSxjHR73ZPIqcIVBGzzfXbYNRLXr46h+MUZZXFYxmb5CrxmdeVD/Ssk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AbpDotg5; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AbpDotg5"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2b04d051664so11476225ad.0
        for <linux-hwmon@vger.kernel.org>; Mon, 16 Mar 2026 01:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773650405; x=1774255205; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9HzxpmNsoszjfyCRF5qB2Qo4IkmZffw/F/yON08071s=;
        b=AbpDotg59FUfaWZeTxWgshDFsfxQfapp01Kn3Gjlx8b0+cAUDpSMoffX3PE89gdhAL
         ogNEaKuPc1gx2TIHAEFqZCBVMShShkkiqEcDGr0UWu5s/CYFyrhHkyxFBheC1brQeAbq
         tfUNo0eaNGDTsyubOR5Y7fljvHW/3IPbIMe10GV9Bd1eRFDsLstXIaX/wIFgB4N8CSZ4
         MAY03cPtkWRAPqKa/W3AU+T6eI1saTPPFmfmrdk06y8ITvelE0vbLTHC1WLLyS3yC53w
         /MQlY7G5vCSK3D6pnTsmarB9ZqjECHLEnYvODXd/eUiBivcROLtm1Z0yd1+v7yU+1SwJ
         2I8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773650405; x=1774255205;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9HzxpmNsoszjfyCRF5qB2Qo4IkmZffw/F/yON08071s=;
        b=DyjYfl+ed6k12p28gPHyPOeFNLxfIjYksLBcQNJERRdiH4tobGobHAhLu78WZnf2E9
         L+GtINWwXHEUAVQno1m/GZjhnCCkmmqCd02iDoj08Wt3PZyFfU+cAJ+kwHb+kvVP62aH
         UIJXaVSlrV5WDxtJPMVUZ+rqomFeTk6uBFGG/8nBcmUTp/4CIwjG834wd5llQdi2EhrH
         J3g7Jnb+BvYwI+RH/9r8J6fF99LlYpPcH7BuhKk7jMq99YxzpiyFqRNuBw3yWrpnvPVP
         2PwgTQEyEQ0x5fVpWjMEI9U4uuiHf2y3/4tZqLYkjSmrLFGRZt6cOh96OuX6WDu56+2S
         t4CQ==
X-Gm-Message-State: AOJu0YyJQJrYWub00Gi0Ahg3XcZWmQdL6YxO2xjThelw9kvEyxydTDaf
	TR19UMoDTZBgjHFi+s5YNFUzZ7Tf1reVtFthRArrjxINod0BbdkZXnEv
X-Gm-Gg: ATEYQzzFY+Bc9IVuOO/mb5fZ6Y0zA8/LCciBwtNoVSJADg43PB+z2Ml/ZSuEqzNMcjr
	meBJdNnGIO+lU70TxMm3sPufk72SrDP6pnGeAOW+AqJLeak3ijLqpnrVKWwIOjvhZiX3iiZ+Q7Q
	/fe3ZhjsBOuFa55a4M0t8jXP4mRWGR/qPITTuMGheitRObQScPyhYWekJVEXa4qIdu+1CH+Q6oF
	BgjO6AJxc5YPgvM2iQ70ww+ocZZcTLAso0/+TUGSWu5tCBHAvRCUdV1+MiIrvaniC5IUZP/VQSx
	5XRskw5m7Rv55xWicsUNEVNv7VhwFV+gjtHvVVqywCL5rkppjaSrCGoI7qrpxNiD8nMng3zBbIM
	kQZOG4NDqPy6el0T6OGf6L93RDOIUCtfFZOOcpVrs2Z08ZOU+2IoUxiIwfov848n7DLEPz1N+So
	rcQrX/LDY/CfyAUuf2elM=
X-Received: by 2002:a17:902:e88f:b0:2b0:571f:6f07 with SMTP id d9443c01a7336-2b0571f7b2fmr29222165ad.39.1773650405157;
        Mon, 16 Mar 2026 01:40:05 -0700 (PDT)
Received: from [127.0.1.1] ([218.32.81.133])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0537b663csm45946865ad.51.2026.03.16.01.40.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 01:40:04 -0700 (PDT)
From: Colin Huang <u8813345@gmail.com>
Subject: [PATCH v2 0/2] Add support for Delta Q54SN120A1 and Q54SW120A7
Date: Mon, 16 Mar 2026 16:39:32 +0800
Message-Id: <20260316-add-q54sn120a1-q54q54sw120a7-v2-0-60e6182cc4a7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMTBt2kC/43NTQ6CMBCG4auQWVszbfgJrryHYTGWKUwiIK1BD
 endbTmBu3lm8X47BPbCAS7FDp43CbLMCeZUgB1pHlhJnwwGTY0GK0V9r9aqDLM2SDqfWe+sRjk
 qW3OvmbBxkBJPz04+R/7WJY8SXov/Hmubzt8/w5tWqLDFWrMl62xzHSaSx9kuE3Qxxh/YI7rZy
 AAAAA==
X-Change-ID: 20260205-add-q54sn120a1-q54q54sw120a7-fa492b6ea07f
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org, Colin.Huang2@amd.com, 
 Carl.Lee@amd.com, Peter.Shen@amd.com, Colin Huang <u8813345@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773650402; l=1235;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=eAYEHKIMJ1HcMJfz2kIgNpsDS5JBZWGRLVub9M3wt2c=;
 b=zNr6Nc3i639FGZXPpBVwqmmBqW2c+oIkNCAhQ+wcFEikAWujbstRmbPo7nuTs5TK0T8UqW5Uk
 wDvbiLA7VBUCdpoCNjoMFoUgFSdOZOrieNGyqmMSnmYoB5Q93D8nCRg
X-Developer-Key: i=u8813345@gmail.com; a=ed25519;
 pk=Zlg0WqpCw4qbswOqamTBTXIchwR/3SnYZpy7rjaGMdQ=

This patch series adds support for the Delta Q54SN120A1 and Q54SW120A7
1/4-brick DC/DC power modules with PMBus capability.

The datasheets are not publicly available but are available under NDA.

Patch 1 updates the devicetree trivial-devices list.
Patch 2 adds chips support under q54sj108a2.

These changes have been tested with both modules on hardware platforms
supporting PMBus over I2C.

Signed-off-by: Colin Huang <u8813345@gmail.com>
---
Changes in v2:
- remove usless patch.
- noted datasheets are available under NDA.
- modify driver base on reviewer commment. 
- Link to v1: https://lore.kernel.org/r/20260205-add-q54sn120a1-q54q54sw120a7-v1-0-09061ecacfc7@gmail.com

---
Colin Huang (2):
      dt-bindings: trivial-devices: Add Delta Q54SN120A1 and Q54SW120A7
      hwmon: (pmbus) Add Delta Q54SN120A1 Q54SW120A7 chip

 Documentation/devicetree/bindings/trivial-devices.yaml |  4 ++++
 drivers/hwmon/pmbus/q54sj108a2.c                       | 18 +++++++++++++++---
 2 files changed, 19 insertions(+), 3 deletions(-)
---
base-commit: 18f7fcd5e69a04df57b563360b88be72471d6b62
change-id: 20260205-add-q54sn120a1-q54q54sw120a7-fa492b6ea07f

Best regards,
-- 
Colin Huang <u8813345@gmail.com>

