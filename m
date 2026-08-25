Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C5737DABE
	for <linux-hwmon@vger.kernel.org>; Tue, 25 Aug 2026 18:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787683286; cv=none; b=XD0c+SFS6SIdjUn0RaXYfUu509GGwItXQp1nnYpVuYUy7117aw0/4GR8KzwvCX8+vpUjOzz2OEADLRVlm+5gTKiFJscqJHxx53NhQUbsfVim6iXB9kVQGYYxE8D5KYzF4f4QYVq7vndHMahu6bmU+eBQD08C8P8F/sIG8IAfOng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787683286; c=relaxed/simple;
	bh=Tb16IgVakmc+CdnVzLzlZmsZXBKmafpDroRRtjeKCcE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=GVupXBEy1nIUOXVPOkI0hJmmERMr2s+w0qB8/hS+XgTfCg56ZuF5dNF2u1XPXtFLjNJ0oNqAdwH1YF/s16LobSY7HpPQxxJ7b25jT3yPF+P6ambTE85mC0TPsalW28jGrOJE/BhbwpWibMS1wHudvHBtaZCue180QLCR78rM3uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sSjBagxz; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sSjBagxz"
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-966e7380109so56728241.3
        for <linux-hwmon@vger.kernel.org>; Tue, 25 Aug 2026 11:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787683284; x=1788288084; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p3QyZWg1WsZH3UzmNsJ7DFfIwK6PjCgdZzJDtgoRKH0=;
        b=sSjBagxzymuaE686txZ0W7Wx2HEQ2IeJrmCy++blG5CcADv+jJhYC4WhXB2KBjd9xU
         ZvpTwdFKl4xd7gZi9jEc2/P+nppnd93HfZp/MQDKS+z2UblPAH25uRHT4+hnBeKERMun
         kgInfIlfVhmtL6nNde5E0PgGmMimibS0XofHAxaMkC6aMd04Md6yrJQvQatFFsSQfB/m
         o97QwdcfLQiX3OxI+83CrRPLRyhMj/8QD9OIMpFQABJOz5/WV8FqXWWxCvvK8ftphbaQ
         4GbWiK9Q3Fpc1vdk7ie//bUK8NhvZDKhLCqmCGW2IhgsqY00J0+upB6zYxfktPNIb/Lx
         Q7bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787683284; x=1788288084;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p3QyZWg1WsZH3UzmNsJ7DFfIwK6PjCgdZzJDtgoRKH0=;
        b=ghCiZLm+xsONsDQoVX9+0+oLj5QcuzUyQka5mlgVulAGYIS8x3HvQk3pgZ1307TPlp
         OFQCCOpgmyg/KpoPuLBk8ZepyrYKrzEieabXC1eOOUhM+u1fy7ukKAz9Aci0dKbNCIdr
         g1V5KsBlAxw5UtHgbTwEkjE+p8x1cFxGBUrtJqUjrUqRDKdp+t5mQgIFCC4eWKz2cOB8
         /Mk1gYuD0uw/jUnj1OdD0rdQdD43p9cXX4JR8uXqtVV57C4cklJt16F2CKbF2/a6/C2s
         yF30FBPj8/h/Sz0XJT7LsDpgQgnlOpZYC2YA1DQYXEPqijrilx8Ofeeb2AxO83cxIsoJ
         6WYw==
X-Gm-Message-State: AFuF++nYGb8Uz6xmpU8GODGgljocdtswE2z6HR30EoozwYm7gPWa7MLw
	woKx3xNDb09VjZ3a223p59l7TL7f1TALnhGSPqgo0+48jgHE3rZ15bbd
X-Gm-Gg: AR+sD13KHQCUN/vrQaRRZI2ybiEyfK5MFQagZ3Ql4M7SUC9zsDb0i8LGrFkrh4hJnIj
	DaCvGh+pGoFhewQGUmLkSjPTdM8cjI/Zvaa+my4gAwAjh7OoSJbXK1rPeK9mHVlZvMVOdm7vL/d
	tvoGDOWSaLblSIVc8L3zebKGXkrfp+JFuqbslDCqG3Km5tWNFeQJ0RwvHOYs3mevZqwWJc/XUBV
	yYY1iP4JXz9sE4YutE7dS/mYXezmXjzIkslIQWm3P5+afgnke5gUUYegwQTAOUlCBdfnhgTBHXt
	WO3jAuzLR317mxj8/+7KzNyvPyQdtOv41nvfOms4+hdj0BFmM7wm1CpnAwwiBFbqSBQYicva0fp
	L+Q9HXSpRC0jmC8M4rXqY1f8eRUw7BZNbKq4p99SkXqfjkphqUTZqkoq0RL+sDHbBQuHnpRmMzj
	T6OM9LHcu3RBZw7YNtzjdWR4d8U5lAFQwA5UqZ7RVmKdsiJHnNK3+EdwTS5FzkyfF7
X-Received: by 2002:a05:6102:1628:b0:74c:7fd8:73f5 with SMTP id ada2fe7eead31-782c07ff7a7mr381538137.6.1787683284313;
        Tue, 25 Aug 2026 11:41:24 -0700 (PDT)
Received: from nixos-minipc ([2803:9810:b675:f600:452e:e094:2a4f:7300])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-97cbb258a00sm381605241.2.2026.08.25.11.41.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 11:41:23 -0700 (PDT)
From: =?UTF-8?q?Sebasti=C3=A1n=20Peyrott?= <speyrott@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/1] hwmon: Add Minisforum UM780 XTX EC monitoring and fan control
Date: Tue, 25 Aug 2026 15:41:06 -0300
Message-ID: <20260825184107.355980-1-speyrott@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add a DMI-gated hwmon driver for both fans on the Minisforum UM780 XTX. The
EC is an ITE IT5571E, but its register layout and OEM commands are defined
by machine-specific firmware, so the driver only binds to the exact board
revision and BIOS version on which it was tested.

The driver exposes both fan-control temperatures and tachometers, two OEM
automatic CPU fan profiles, and two writable system-fan transition
temperatures. It preserves settings selected through its interface across
s2idle.

Tested on the target system with concurrent RPM reads, OEM profile changes,
system-fan threshold changes, unload/reload stress, and s2idle resume. The
settings were correct from the first userspace sample after resume and
remained stable for 15 seconds.

OpenAI Codex assisted with reverse-engineering review, code editing, test
orchestration, and patch and email preparation across a long interactive
session. I reviewed every change, ran the live tests on the target
hardware, and take responsibility for the submission.

Link: https://lore.kernel.org/r/20260818181345.203295-1-speyrott@gmail.com

Sebastián Peyrott (1):
  hwmon: Add Minisforum UM780 XTX EC monitoring and fan control

---
Changes in v3:
- return -EIO after bounded RPM coherence retries and -ENODATA for an
  unknown CPU profile;
- seed saved settings at probe, update them only after successful hwmon
  writes, and restore them at resume without reading the EC at suspend;
- clarify saved-state naming, live threshold validation, and resume
  documentation.

 Documentation/hwmon/index.rst               |   1 +
 Documentation/hwmon/minisforum-um780xtx.rst |  68 +++
 MAINTAINERS                                 |   7 +
 drivers/hwmon/Kconfig                       |  16 +
 drivers/hwmon/Makefile                      |   1 +
 drivers/hwmon/minisforum-um780xtx.c         | 501 ++++++++++++++++++++
 6 files changed, 594 insertions(+)
 create mode 100644 Documentation/hwmon/minisforum-um780xtx.rst
 create mode 100644 drivers/hwmon/minisforum-um780xtx.c


base-commit: 75f2c0b3690702c90863c2e138cb5520670845ea
-- 
2.54.0
