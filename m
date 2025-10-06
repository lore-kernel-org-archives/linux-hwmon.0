Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABABC8F49
	for <linux-hwmon@vger.kernel.org>; Mon,  6 Oct 2025 21:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759787650; cv=none; b=ZcufaAdfAD4mfCkqi3J+rBrP+MbINog4H0l6ueSqMxBDRlDQIDqHPeSRGwa9UhNQFW225diL5g3Wl4n/1Op+4o83JMRotRcIcJsVaGX7Ip8cRyzyXBsN0XfG8LTaDTb9HMcxa9qdotNy5cEoo6kWXlmu+VsN8SFgAvvqvabJ1jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759787650; c=relaxed/simple;
	bh=eiISPe7E0tv7cAYf9Q7LNVtb80iqR4+ue9pgUekuy+4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=abC93SDy/EHIJluP71ta+6ELlM7ppwaPECq4OwEcz3j62DKaDK3qMrdSj2tBJWJp76TF2eJtjmH8MyUf8WvocVByxfyR9HAnFV6DFfZ5/PGAdT5XZDITK2APd+A9nslIZ5RMZx/Nl315PCAZoMubK6Gqtls6BSte8mvJ17yEWC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZpvuLjag; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZpvuLjag"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-85e76e886a0so461453585a.1
        for <linux-hwmon@vger.kernel.org>; Mon, 06 Oct 2025 14:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759787647; x=1760392447; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GzHR9nOubrbOV66JDSdOHQf9JHwFVJCFi2cD9sJyIbU=;
        b=ZpvuLjagy9UsmaEbNSIJYZ5e1y83BvWWsXOVZQzgiLMXuS4V/QjpymvSwTFSbLIOY2
         JWFy5AIxUcPBxE92gHNUE26bhgfFMZtyimXxqCdS/8QX29U61UBT8mYhvkPpFAfu80nW
         MaVSR3pkLVX8Ac2gD9W4Da2dGET7yWFu3aejDl/ZgtZ8wqtgbTKCZWHJZLwJRqCPDK6B
         AkwM2S0FKpc2d3I8kEbkzwkQnz4aOcr2+xdAC8/eZ45/xHYZy0EPPMXVCdbNV1iE58km
         yzLJND/oND6CQFGFHJuXCJKqzFU8ccvnoiKEGpZZZQNJnp8uzzqWWjIdQOYkm8rXyqVp
         qDLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759787647; x=1760392447;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GzHR9nOubrbOV66JDSdOHQf9JHwFVJCFi2cD9sJyIbU=;
        b=pnMdj7Kta5A9I++7yeOwLBoTmB3xXfadpsgDZWaYAuqrYHjiNMZreZcLY3/PsWICsL
         dAcBdCZbbCauZXOdl0egTyZLJjFq/a++NmeKe65ByKblqe0BhYltoNgKB+rQYnbW8RUi
         WKc9uhg8h0YSj/5bzQNNND1x+A+abKUK9YmiCB72HL33Qz7de4igiSE7oMAdRRXddUNm
         z42djHN14C7Cr+jXSjGfTzGwNRnvyY6UguIAKdXZ63ddstdZaLl+FWqc7hHqVqTAJi3B
         06+J10EVFeGcYgHr0IFGKQXQj18Mu+zSYVJoQGGWI/M39nsEw+fMqDJMxX2enmTItsdy
         Yh0g==
X-Gm-Message-State: AOJu0YxCgxKtO1MqMclkk47Kbk+j7sBAsewFrdZ+iADgEqhH95RwcNqk
	zW02yi8IMzwrbSgslsXiEJiebqwispir9e91Il1Q4w7ldkEuqsNLlxgP7dbzpghei+0=
X-Gm-Gg: ASbGncuAcHxdB/AyRQFoJJbzmBB5LIv6TaaWIOBo5ckQxfCYboMeWdZzDI2QRH/cDE9
	EV9TtvEQUFQ053R4Yyhkm6w5k8yssjgQAlScIxzlA9IvW6UVEBkfCWM2JTrKBejGC0wMSZ7+fqe
	gylSf0aISWm/16H/gKq+EfE1i10bpch3HKRPfUYQw68u6V4zxm0IbvKTYMIzOq2AZSkdVLN0d28
	bDs1R9VLB6v8323QfgiQvUMzj/uk0OAtLngVF0O0G3paI2lFmFz32oOiOypW51LdXoXqhRMIung
	2Mxkf+dFEvdOHZwjOQaXwRmux5qcg+jcHtqy0vYjhAotsZAEjCV9JpV3joocAnbBbbT9WEy1Fly
	Bstlu3yRBj0Q+VN1KZqK4Z8HJIpkGB9GY/j23PA==
X-Google-Smtp-Source: AGHT+IG0UNlyx78vsddyW3DjBY/aA6lui1aLxmretPKBkhllfywXoRVS9YugmVjoHVxZWQR0Lyw84w==
X-Received: by 2002:a05:620a:4514:b0:858:a4dd:d180 with SMTP id af79cd13be357-87a3808f557mr1974325785a.40.1759787647517;
        Mon, 06 Oct 2025 14:54:07 -0700 (PDT)
Received: from fr.lan ([81.200.23.195])
        by smtp.googlemail.com with ESMTPSA id af79cd13be357-87771129478sm1314168585a.1.2025.10.06.14.54.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 14:54:07 -0700 (PDT)
From: Ivan Mikhaylov <fr0st61te@gmail.com>
To: Iwona Winiarska <iwona.winiarska@intel.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	Ivan Mikhaylov <fr0st61te@gmail.com>
Subject: [PATCH 0/3] Add Emerald Rapids PECI support
Date: Tue,  7 Oct 2025 00:53:18 +0300
Message-ID: <20251006215321.5036-1-fr0st61te@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add PECI Emerald Rapids support for CPU and hwmon interfaces. dimmtemp use
Sapphire's callbacks about reading thresholds because it's same
platform/socket.

Ivan Mikhaylov (3):
  peci: cpu: add Intel Emerald Rapids support
  hwmon: (peci/dimmtemp) add Intel Emerald Rapids platform support
  hwmon: (peci/cputemp) add Intel Emerald Rapids support

 drivers/hwmon/peci/cputemp.c  | 18 ++++++++++++++++++
 drivers/hwmon/peci/dimmtemp.c | 19 +++++++++++++++++++
 drivers/peci/cpu.c            |  4 ++++
 3 files changed, 41 insertions(+)

-- 
2.49.0

