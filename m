Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68929346FB3
	for <linux-hwmon@vger.kernel.org>; Mon,  3 Aug 2026 22:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785795386; cv=none; b=OmvmJ9G/QcGbIV9D2xSNRoy+rXuROCYh9lBOgJ8eTTFTYyCGiwQvSYk+aNl9NEswNZu8bnKWllBi3LORMkrbPaz7Q83kCX9ejaYewSjd7Aqhjr1+4q2vqFdtLVF87ivp8oCCcumc6PjPyOLrm6ppEOjMk1lK+NPt11Jga8GnYRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785795386; c=relaxed/simple;
	bh=EIMWWlWDcq0uEYhrtukreWiGwiCZqVgmmuCgjtQWFjc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X5JKDCViQM/aGQM+g/aU6DZ3AznLjXqbTpFOGFVJkIQLmSIENLmxrLHlLxe/gKbI6JI3trfNnzI8JjOU10z0RJkq7SJHSalyRsoAXWnvkIDFUUa6AAehnMskXrey/PFxsM0j9mhtU1xM8ShK9Q8vz65t0Gmqfs0W0HtEhfGTpSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fmXc8oU8; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fmXc8oU8"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38e08baf860so3425856a91.2
        for <linux-hwmon@vger.kernel.org>; Mon, 03 Aug 2026 15:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785795383; x=1786400183; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cyQb3HEnxnGJdzSi8B8jk9beGpq3QOPyQ1mK+KBtq5A=;
        b=fmXc8oU8QMWRSg83kAatQ3GNpWjjSeFXdDFz/EfLaJR8lKtFDy8k0BgzDeSjG2vWVz
         ki12rrVoKtLy/xhEYzjUwiPnpnQx8EJvEVlnO38s8VFitlvTkKJgwNGwbzLtMkrnWoOo
         fIqW34odSPmPAuE/k8SK5pPMnz4tKg8p1y788wYxfXejjxlxWjSdRzmNsDiU5Y/u1MSP
         jAWjAy/LXbw4LMyus0OIqSPZ0VjjNN5H8HUBdbMKs6sgWpB5993X9HaBdcjRudC4qCPN
         x1NAQAg5lJtFxI7qRIhyGFE0IWdPCENlqmcGjGMbKmUe/3alR/KpxVA/q1nWrNoaVCKJ
         TNNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785795383; x=1786400183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cyQb3HEnxnGJdzSi8B8jk9beGpq3QOPyQ1mK+KBtq5A=;
        b=Sti9d6Q05uT/GTFfnrYqy8XyIQEhAS2jbv5dJOgkX2ytHfYJ8nE8GvNOOwMOp5B+J/
         XBL8D367uLzgS7KPB7HUwGndrrBPs02+hK9IN7o+YP1JtH3bARfyo9v3GFY9iQHJqmlY
         BTsL6n9wh1nd1oW2UWYlQUJ6XTyoLKIsstNpQUEqlBDuKYv95kY8rz7nChR0z34rE63D
         G5QZecdZZFVABS19NpImKHLP5mkwuLpTUZBbcnQ4C/o12S9RUSyBbDpFQbdHNS1u3+6x
         YMAl4XQ4X52TMZArUyaii9Z9KtpS4K46zjhJzxrm4LFCTnWnnrjaaunHOsDs1O6PJmit
         1UdQ==
X-Forwarded-Encrypted: i=1; AHgh+RoD4StDtAA0lNYeXHUgrIrbWK6AfRfwTOOQ+fhMDSQJMmXyG6E1Ij9vY7y5fipg51KzMq2eCOIy27/N9g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyr3zo2Bv6QFba21tASF/WsIX+7FK/P4zX+94+kDD5mH9Y3SM/N
	C8ygtbtihMP7Ryn8u3+Noy0h2hofcYE39gfSCLqtxAHC/1EAZIE8ol84
X-Gm-Gg: AR+sD10ko7x32m2fa2bwHbhIjU6MtXISaFzuTreoSOY2BGHgAGGDnbJFMrqC6fxhtxF
	uJ8jclNzag31egVgfoti7kW2FJeUUV6Wbhid/IJslDpUzQ74a8lqLgejxx4O73QNWs0ncqOk6ao
	8s7XBvfYUDnbNqCKZxhmOLCDXQnj9Zf+WpdkpBcx3iALRpon2E+D12CtIOewZVPsIT+gnElhceJ
	KZq4KW9y9ei7OWr0DF1jZN0FImK3IcoLMc2PnKopT9w5EvFC/1w4YGmtfTMMzzRHSGcF2L3A12S
	3H9rpBUk/thHFQYp5r2PVPo5fDRDALkCkY+B732DRwn5IZsWw15/NvSj5prcPkzqRJFcBQkobrH
	vWkjz4lyYlOniC0N0wByrxOoChXnu7Iweh+L4v+wH+JF6+CO9JiaYR0nrAfyOpwZiFQPFJ4VHvI
	IyazygrAuhSQqKdrTxumWxB9V7ZjLBm+UqooMb6DwbLv9p4tZ30MfLBKCHROVg7pVdLIQe/D7WE
	C6dMLRkqWI5uoMXJ5oAEIiHFSZvslpVk82R/gJkcQ==
X-Received: by 2002:a17:90b:5824:b0:381:9028:5945 with SMTP id 98e67ed59e1d1-38fbc43a847mr11586487a91.14.1785795382878;
        Mon, 03 Aug 2026 15:16:22 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab1334cfsm38685666c88.1.2026.08.03.15.16.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 15:16:22 -0700 (PDT)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: lkml@antheas.dev
Cc: W_Armin@gmx.de,
	corbet@lwn.net,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	jdelvare@suse.com,
	kuurtb@gmail.com,
	linux-doc@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	Matthew Schwartz <matthew.schwartz@linux.dev>
Subject: [PATCH 3/6] platform/x86: msi-wmi-platform: terminate msi_quirks DMI table
Date: Mon,  3 Aug 2026 15:16:11 -0700
Message-ID: <20260803221614.59324-4-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260803221614.59324-1-derekjohn.clark@gmail.com>
References: <20250511204427.327558-1-lkml@antheas.dev>
 <20260803221614.59324-1-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Matthew Schwartz <matthew.schwartz@linux.dev>

The msi_quirks table lacks a terminating empty entry so it crashes the
kernel on non-quirked MSI Claw devices.

Signed-off-by: Matthew Schwartz <matthew.schwartz@linux.dev>
---
 drivers/platform/x86/msi-wmi-platform.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/msi-wmi-platform.c b/drivers/platform/x86/msi-wmi-platform.c
index 2439b4f0001b..fdc2f6f4ca7e 100644
--- a/drivers/platform/x86/msi-wmi-platform.c
+++ b/drivers/platform/x86/msi-wmi-platform.c
@@ -268,6 +268,7 @@ static const struct dmi_system_id msi_quirks[] = {
 		},
 		.driver_data = &quirk_gen2,
 	},
+	{ }
 };
 
 static int msi_wmi_platform_parse_buffer(union acpi_object *obj, u8 *output, size_t length)
-- 
2.55.0

