Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16612217F24
	for <linux-hwmon@vger.kernel.org>; Thu,  5 Feb 2026 13:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770298520; cv=none; b=jdtV1G3zo1mzGkeEX4I3Sau/kBkXUlN6mu5fc6cftj8Qu1VnXxKmEF9IF4XVXGjUiG9hOjVL7WGPQgoC/jXPBNQrpRKPZbjh5Qu6FzX6dqy6P7Ajk6ZdCa33de3kgzPAsz+WF+eEoDStVflzajjSx8MfbRLmDNh9fe08ktktxQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770298520; c=relaxed/simple;
	bh=7nwci2u+IH2SMmQlelunRUWvLZuWXAaGB2sO487v3e8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=u81rUeL6v26cgxqbu6oTU2m+X0ua7O3Ee45TWKdqB+HzoShOyHc36F2aDBk12EnUn0ACXTofXxfWZPt0TdHRfRfHgNxmrS/36xdvZQBJPa25/AqKh+rzTT0bhLM7eHYkZUkVILP3aKum6RcQrX+oHq/XktWBsJ3HQ1SI0HVX6mI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fGt7iyE4; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fGt7iyE4"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-81dab89f286so480382b3a.2
        for <linux-hwmon@vger.kernel.org>; Thu, 05 Feb 2026 05:35:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770298519; x=1770903319; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZGuF+Gd9iYH6P0b+NtAvir3zebICrprEYigd8LlPHKM=;
        b=fGt7iyE4rOzNRaleyDkyaHw/Lml6tEyXiLvqlPLgSOgaGlba++oFSgN9tHXN+XpFiq
         TnMPwE/EIqvL3cOnYwo4pZ8BC7EuUf78Rwce9OTSVyYeFDUoDzyi2cdc35ZA+DvpgOCr
         3cOuNMeqJcgspSvBNj7VHEyvu3ywmdOyLSswCEkg2nybuJXI89Jw6Jc3bQDYKlZ4AamL
         qcYa3wBBGp26edHNqpZ4ApagM//fGv5KX7hN5738iREjQLLrnFvIIVHFcSexyog6k2V8
         IJHc7z6FNzf+GmF1YK5M130XoIj/z7m63HVzqOgxJ3plwsppg7dMaLRSeR5BSMWGwA4E
         KT0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770298519; x=1770903319;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZGuF+Gd9iYH6P0b+NtAvir3zebICrprEYigd8LlPHKM=;
        b=ZZS7djN21TI6/Ia2cPSKlyhDma0iI2tGHAypKVK8HCvsYEJsAmOirYOLkFcAhNOgLI
         rgdomNI8Chz58/zkEVUgnNT1tSgrVA9sAo06E+Z+DsmgIn/SZMCOQuzggUe9W3BIN1O5
         NvVrabgPnSoCZFXgG37B6e3oFZMJimDjtynR9136ywjtGrZ+/Zf0oJVulO3UZPTm0GFx
         RB9zXTBIbG9sngy1o3teDl1FQNAQUX419lIZKvqlegthY3BtQwEXR3w+vp+59mxLfZT1
         RqDLER4aHpnvqBK7GQmHyaXWNtgmvhS6+afHHajk7ycoB+ZWu+y3XdQaDRhjkQosZ5lt
         8j0A==
X-Gm-Message-State: AOJu0YxW3FpCo8RavU6ww11hN8YIv5VyYMR7+7fG4eDfwCaloZpL8SWM
	SfOUdZo1iJchy3fKMEPDGKm2weZYG9+jx+ShvTQbnKQm8QY0A/NAo4HY
X-Gm-Gg: AZuq6aKBjNzH1H+nxBkWCIEnLQhOZ/OFWehO7vqPEvq561Isd97JRR7QdxT2rp21hR2
	T0CflaOFgO6hdkp5h9Fh4UKjrY0Y+2MbaDrfn2lGZdDxreUj7PDDHO8E7V2qAle4uM0Dk0l6j3P
	yjNrzqPlULQcwU24EluWF5QDEEy8Xe3Rg0R6Ia+UuNzr7R1svr2K9I5wZ1idRlOXZF1zfd6t3Nm
	vca+w1tcv1rd1yucm5M15iKI8RMNCFWJq5Sb5bbBLDcB0qkwaeLdq5a+LxIAyEK9EjRUvjluFB2
	VkE+axpiL1Mdd8I+DkGdVyqqnpsYkx8Eob5o+9APkkoSctcJhKh39IuhOaCMJXmvNkq0wheUjiK
	S63v8SShhRvW+3GXNtqff2CWeOZYKpU4g+W8zUdGgvFhEqLFUUaMjXj1hK+LQFZ5uQcOn+KuJQm
	HFqDQ/RrQ=
X-Received: by 2002:a05:6a21:6194:b0:38d:e6f8:fd97 with SMTP id adf61e73a8af0-393725ddc5amr5941011637.76.1770298519160;
        Thu, 05 Feb 2026 05:35:19 -0800 (PST)
Received: from [127.0.1.1] ([218.32.81.133])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a933850f41sm57760505ad.7.2026.02.05.05.35.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 05:35:18 -0800 (PST)
From: Colin Huang <u8813345@gmail.com>
Subject: [PATCH 0/3] Add support for Delta Q54SN120A1 and Q54SW120A7
Date: Thu, 05 Feb 2026 21:34:34 +0800
Message-Id: <20260205-add-q54sn120a1-q54q54sw120a7-v1-0-09061ecacfc7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGqchGkC/x3MTQqEMAxA4atI1hbS4A96FXERp+mYTdUWVBDvP
 u3s3rd5DySJKgnG6oEopybdQoatK/isHL5i1GUDIXVI2Bp2zhxtk4IlZFuy6CrqjedmoKUTxt5
 DXuxRvN7//TS/7w/mFfpBbgAAAA==
X-Change-ID: 20260205-add-q54sn120a1-q54q54sw120a7-fa492b6ea07f
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org, Colin.Huang2@amd.com, 
 Carl.Lee@amd.com, Peter.Shen@amd.com, Colin Huang <u8813345@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770298516; l=1082;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=7nwci2u+IH2SMmQlelunRUWvLZuWXAaGB2sO487v3e8=;
 b=cGbfvPvhCiFhXRfQYxNUQyPQsB6zNtB6NPDRy8x2bQ+kjeZ3X2rCzr7McXlxhOltee2F4No6X
 oVwLiD//TrUB8COwWAwyVskAcgmHy5lyWrZPuaynyFxvNaDy8w9vbOR
X-Developer-Key: i=u8813345@gmail.com; a=ed25519;
 pk=Zlg0WqpCw4qbswOqamTBTXIchwR/3SnYZpy7rjaGMdQ=

This patch series adds support for the Delta Q54SN120A1 and Q54SW120A7
1/4-brick DC/DC power modules with PMBus capability.

Patch 1 adds driver support under hwmon pmbus.
Patch 2 updates the devicetree trivial-devices list.
Patch 3 updates the hwmon documentation index.

These changes have been tested with both modules on hardware platforms
supporting PMBus over I2C.

Signed-off-by: Colin Huang <u8813345@gmail.com>
---
Colin Huang (3):
      hwmon: (pmbus) Add Delta Q54SN120A1 Q54SW120A7 driver
      dt-bindings: trivial-devices: Add Delta Q54SN120A1 and Q54SW120A7
      docs: hwmon: Add Q54SN120A1 and Q54SW120A7 to index

 .../devicetree/bindings/trivial-devices.yaml       |  4 ++
 Documentation/hwmon/index.rst                      |  2 +
 drivers/hwmon/pmbus/q54sj108a2.c                   | 47 ++++++++++++++++++++--
 3 files changed, 49 insertions(+), 4 deletions(-)
---
base-commit: 18f7fcd5e69a04df57b563360b88be72471d6b62
change-id: 20260205-add-q54sn120a1-q54q54sw120a7-fa492b6ea07f

Best regards,
-- 
Colin Huang <u8813345@gmail.com>

